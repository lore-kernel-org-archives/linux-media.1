Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD84376A0E
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 10:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787309362; cv=none; b=t8PBPJs73/mjK5OpFkjZoOCY+QpdYDfOEU/EAjm6RSfVtpOz765fWlE0d93AGsVqdohJdW5eZrnkbX4jx5EtBuTISbOFPzQRMKpe5xfiBmGeP5LGw6+JI9+iWu0LvJc6m/dAazhTZuRTuI80m/z4hq+dTg2CAs8c5EJGGp9psBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787309362; c=relaxed/simple;
	bh=69e84a/KxxSixN0pH1NkibOILOaeskmTFDR8WG6NGZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7/vwaRDInC+03MZRKuvJbwxRVgyQDNlcxUUVQ/5oOZUfTZPN1mXaubRrOthzwEt8Ubz3l7/bWUD0dMSECEgjS2p1VxJ4+H5LT1o6msxrdtcATi2Y1cHuKs9+8NXTxAOsoKXhgapH0yvZ7DrxzPX6Twkjb8Kb64XZup1ASC5HHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2v2i2xN5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2v2i2xN5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B39E1F000E9;
	Fri, 21 Aug 2026 10:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787309357;
	bh=s6Qgq++jopZymzqSvm1A3QWSp2KYdFd7uwxyCEKPZyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=2v2i2xN5JGE6oZbUkWLYk4fzUYGp6ybvkMOSy60riP2NCAvBk0KTdIvKVXEq1u6eB
	 Bzi2qscyoOos5MtGngLy55vYIvkXklI/GRd9Hx6/7DorZC+U9M/HUpbc2aC14deB+g
	 8RZYBkQiPkbuWJT/YQOS/2h15uIwVK0d4aNuVBhg=
Date: Fri, 21 Aug 2026 12:49:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?5r2Y54Wc5p2t?= <panyuhang@hdu.edu.cn>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, security@kernel.org
Subject: Re: Subject: Re: [PATCH v2] media: saa7134-alsa: avoid IRQ handling
 before capture is prepared
Message-ID: <2026082105-undamaged-underfoot-a025@gregkh>
References: <AOoATABxKyooWcIuKar*D4rn.1.1787304053109.Hmail.242270054@hdu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AOoATABxKyooWcIuKar*D4rn.1.1787304053109.Hmail.242270054@hdu.edu.cn>

On Fri, Aug 21, 2026 at 05:20:53PM +0800, 潘煜杭 wrote:
> 
> Hello Greg,
> 
> Thank you for the clarification.
> 
> I apologize for previously asking the maintainers about CVE assignment
> through the wrong channel.
> 
> I reviewed the original test setup. The saa7134 driver source on the
> crashing path was not modified. The userspace program issued valid V4L2
> operations, including VIDIOC_REQBUFS, VIDIOC_QUERYBUF, VIDIOC_QBUF,
> VIDIOC_STREAMON, VIDIOC_DQBUF, and VIDIOC_STREAMOFF.
> 
> The reproducer does not require root privileges or a physical saa7134
> card. It runs in QEMU, where the saa7134 device is emulated by the SFP
> device model. The normal saa7134 and saa7134_alsa modules are loaded,
> and the crash is triggered through normal userspace V4L2 ioctl() calls.
> 
> The driver submits a DMA request, after which the emulated device model
> automatically generates the corresponding DMA-related interrupt. The
> relevant test output included:
> 
>   INFO:Trigger IRQ after setting DMA
>   kcov-remote-bridge: async entry
> 
> Thus, an unprivileged user can trigger the NULL pointer dereference through
> normal V4L2 operations in the QEMU saa7134 emulation environment. I have
> not separately verified whether the same interrupt ordering can occur on a
> physical saa7134 card.

Perhaps the emulated driver is not correct?  Try it on real hardware to
see?

> The crash itself is confirmed by the following path:
> 
>   saa7134_irq()
>     -> saa7134_alsa_irq()
>     -> saa7134_irq_alsa_done()
>     -> snd_pcm_stop_xrun(NULL)
> 
> The crash log shows RDI == 0 in snd_pcm_stop_xrun(), followed by a KASAN
> NULL-pointer report and a fatal exception in interrupt context.

So do you have a proposed fix for this issue?  That would be best as I
really don't have much context here, sorry.

thanks,

greg k-h
