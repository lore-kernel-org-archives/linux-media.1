Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1492E7F3A
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 07:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787038264; cv=none; b=T2Tw4mWn0hGFoEmZd6aiEujdr6oOv9n9ZYEUwNzPZ6IlvsC3xmHyQFp4CBM0pmqOix3IomtwCIxbXaN/XmotWuv1MFyJ3c8XO8lvZqw3bhUkJsMmZmY5FDy+bM1M2KN/9PEFupXiY7R5Wq/t56OMIAJg9wLm7NCiFLTwkXZikQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787038264; c=relaxed/simple;
	bh=wKWJtiSuLd+25c896bROW9tIbRwGmlYQV76iZbKPmiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cT3kOztvlDhu+0Mx+0HEyY/JsRnUQ8xIRtoDU4U3Rz4TRzssxBo5zJSwSrhRgGK3yZzG8qVkMHCSD3n1djnIklA0RMuuc1djnLGqcB9HAdtbo7qLXJEbhQOphXaCa92YaxmA2S5ELNHTTMjSfKunILwbX8eB6eCtRkXVnd5G+hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=V9GWs4qo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V9GWs4qo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654A91F000E9;
	Tue, 18 Aug 2026 07:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787038262;
	bh=fVJ2vsVBJnQJLSEPw5nVdfgEds+a5jUEYe9bpFq/7Jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V9GWs4qoGBVWgtcj/yLXfMcodfvc7SYXfisUkz6W26ZVy1GSbb5u4ZjPlJtcqgWxj
	 pHcBrJLC5RgH5yBMCIGlhdmgmbNrGLfXr7+6LgByYNmzJsl3sfXBKXzUR1UR9Mxl/R
	 djAPpl1VQ1gAZhbZ7jfgK+uBKULXnrfM2CH3pYms=
Date: Tue, 18 Aug 2026 09:30:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?5r2Y54Wc5p2t?= <242270054@hdu.edu.cn>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, security@kernel.org
Subject: Re: Subject: [PATCH v2] media: saa7134-alsa: avoid IRQ handling
 before capture is prepared
Message-ID: <2026081858-decorated-persuader-a6e0@gregkh>
References: <ADsAFgDxK06XE3L22EEThKoZ.1.1787037591392.Hmail.242270054@hdu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ADsAFgDxK06XE3L22EEThKoZ.1.1787037591392.Hmail.242270054@hdu.edu.cn>

On Tue, Aug 18, 2026 at 03:19:51PM +0800, 潘煜杭 wrote:
> Hello Greg and maintainers,
> 
> I apologize for the mistake in my previous submission. I sent the updated
> patch directly to Greg as an attachment, but I did not post it to the
> linux-media mailing list. Therefore, there is no lore.kernel.org link for
> that submission.
> 
> The patch fixes a potential NULL pointer dereference in the saa7134 ALSA
> IRQ path. If the ALSA capture stream has not been successfully prepared,
> dev->dmasound.substream may be NULL when a DMA sound interrupt is handled.

And how can that happen?  Is it something that a user can trigger or is
this only due to fault-injection testing?

> The handler can then call snd_pcm_stop_xrun() with a NULL substream and
> crash the kernel in IRQ context.
> 
> The patch ignores DMA sound interrupts until the ALSA substream and the
> required buffer parameters have been initialized.
> 
> The v2 patch was previously tested on a clean tree at commit
> 6779b50faa56 with:
> 
>   git am --3way 0001-media-saa7134-alsa-avoid-IRQ-handling-before-capture.patch
>   ./scripts/checkpatch.pl --strict 0001-media-saa7134-alsa-avoid-IRQ-handling-before-capture.patch
>   make M=drivers/media/pci/saa7134 modules
> 
> The patch applied successfully, checkpatch reported zero errors and zero
> warnings, and the saa7134 module build succeeded.
> 
> Could you please review this patch and let me know whether an updated
> version is required? I would also appreciate guidance on whether this issue
> is confirmed as a security bug and whether a CVE should be requested.

Again, can a user trigger this?

And please read the documentation for how CVEs are assigned (hint, this
isn't where that happens...)

thanks,

greg k-h
