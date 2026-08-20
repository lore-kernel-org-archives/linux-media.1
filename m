Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02D93A255A
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 09:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219601; cv=pass; b=jGNcln6Vf2BBSZKaLH/CgKWCtpCCC4XQ9OgcnJkkgXAB+YNAP7xv9Z+TaBlrBJNOXs1ExoGDK7LEP+wXaT3iMjftMxVilyUVeJ5zGekCGE23OJpBBcOavWfo2p0DVEcXD3fHS+vRYltcdGfVsE4js4TWVzXQR0Tro968079algo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219601; c=relaxed/simple;
	bh=409Vhww5UPqkYNIxKwmzigYS7+UMn7GLYn8QuAL8pYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GEabzduwbM2+SDxY1kMVjao4HMPFLE/dFUE4bcnpzHEtMUCH6v/LDBt9V3UEgtWUEnOvqIjBK91vXtOez908W+4aQw5pn7ezugfAyA5FBmEyRHkDgip9KHBTF3MQ5uLEMFp4CQiKOYAGhPrlG3CsyO1czpo3ZKKKP5+mAAV12i4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qgpeSz4p; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qgpeSz4p"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b45f1cd80eso2118789e87.2
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 02:53:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787219598; cv=none;
        d=google.com; s=arc-20260327;
        b=C939Hg3lT05B+uOpFefQM4RLlyunRu482fdxY2Pzia/NkExjVVnNOhA/Cluh8YUq99
         UPmr6Nx9CUEvkk51cvDVXnQWMe+l5iC7JjUwaxfskretMK2ecI7LMgQKE/QwdMpsk24E
         jZUyjEPoqjwXwX2C13SNy9AxSiBnMt04UOHjoV25VCMoZ1yL9bp03cat+DuLnFev27my
         MwOfN9IPkhqi3t4/7N/Jfce/s4NBJcxoTH2kaoi0DLQunOK/8gw0Qgftm04b9X47N0Iq
         jRzSFLoqiRb+F2L3QQONQH4tXGOTm1EoT1QTcTUjEE7O2kVH65OL/0x97DptVmDxTB85
         asDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vhhQTN1PCE/oshQJzab/R1sU0kfxXoIKv1e3XC+IFD8=;
        fh=6oTv8udVYCU3c3m5oc24kUlRst/Ia8PaCEHQOGFLAFU=;
        b=lbRONlb/vW8pt/9nRJq5Rzznm+1+IJODz4cH44oAkjvOyLnagzqaKHFnpWiuxu5kl1
         q5wx4v3X4EgJ+eD6vUmhwYvDp4biaOPXZOO5MPPCeV8k6R48Gvsk1/zy9U+16zrYTTnA
         e1WqfX+uJ1on1/jWPbRyvpfu5WSLAPt+T6if6zC3SbMn1D1JTlC4pyf8RXkPgjDC5UMC
         yRhuCElc6In3ktWq7TFeqkX97Vqrz1QV7D+NSX294cErx1bHCbZTATH7iQ3M4o5kEEKc
         302fhfTgueV4MEjS/4IKLnvr7mlfYqjkWir0Gwf/SG64zPhYpdnwJyA/Gn6LbEqkSE/g
         mKEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787219598; x=1787824398; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhhQTN1PCE/oshQJzab/R1sU0kfxXoIKv1e3XC+IFD8=;
        b=qgpeSz4pzwsDn9Ivx6GVCCqEow1eexSRB3eTLCQPQDph7sydAAVGlUs/q0Qe3yrTX3
         25t7w1Fx+PaCu0DShT+Yn5iHeU/GHLStE0bZHG0pF5bPx6uCpofGVhu4ozIjt9Ld51Qe
         pvv/j/Db7U3sdnI+sm4QAsK4N5CqJ86DRKWj2m2s7idfBISVhgTOoU+205I9U+TcpfXJ
         4r7ykYeflI1pWBll1jUT4u39Dwp9Gm7VIDoRFMVsgc0a8oeXNUWnpjKtEFBH1IwltL+d
         5Y+idZf4u4CtITPrzoZoW/P8oJA730i9zNqyLBFA6cBEKYuEYVw9AVlvLuQai9PIJcFG
         JQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787219598; x=1787824398;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vhhQTN1PCE/oshQJzab/R1sU0kfxXoIKv1e3XC+IFD8=;
        b=pdKkS71EcW0ckJzbjY23XjDPhnqetpEcgSJLQCjY1bCR9eWhWYa6PB+Sm0I/3ovAZ+
         4x/e54NCOK6kIaovYraqKnia6+A04CTexkyRnQeDy/Vhng1o/HrQ7SH7lrFES99Iz/pz
         Joa4NZuB1jbZA31916OMiNidMJnlbVeCBTj/WCJNaWYdGWv8hcXxwndNzvGdODzmEDet
         DmAbOB3ynUkP0SeOGdZkEirZf5GuZmA5kfWSH9t3q/Ws7YrZNe399xsclUXC4Cv7KRDD
         E4P/jzi0OZ+dRMQEj5E2zCzKrdsFjULP2TAiT5509M6NQDl5fDuDSKsAlRkTrC7CKHmM
         ESdQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEKKBhbrPYotAZcD5QI7EGkgUogenP105gUHdv8Yb3s5JwZikVauVelbeHgrfoIY+geHKBdOELwZjsiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2hT/d8ngNZfc1e/J71n3p2CA2GzkKoCLJKCkKwL8aF+Zt+edR
	RtsvQP0hFy+YZH0ddGfFGwKAeaUBhOCKwyWq76snWP85kOGJ5dX+YKedTbMXE8mxg22VRYQN8+P
	xxbBiPzSEEHIuwezV6dqXCK3y0Q7Cybo=
X-Gm-Gg: AR+sD12AjZiNmzk70BtMptSQFtQU20hT/4sTPpOsgCzqYrg5Fybk7Yg53pFWqux9jwN
	V+hm+ryY0O70s/S4kRYCmteMdJNFmuTG6rU5yMMnkrzFzOifNURxz7Al3mtA4Gz0qyCfHzX6wPC
	c2T713cVEcTHnDGlMxJF+XRFyoTNM6/To7se9ehTbzbhpNXUrUlKkLfpk8t+QpcFURyQ2DSe95o
	pzNy+oMUunZVjt1coZ45XEhGRjPU3/+Z77wtVhjTWqoAayYGI71FlrOgSgx6B+4/yzzaEFYv7mk
	Z3Bkt7pJOSc6uoYnfC+48URjlS7qE3DYxvSPggBbm2NS
X-Received: by 2002:ac2:51c8:0:b0:5b0:1760:fabe with SMTP id
 2adb3069b0e04-5b478bbb211mr3434881e87.15.1787219597547; Thu, 20 Aug 2026
 02:53:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812103251.18309-1-noambs2999@gmail.com> <20260818064511.104024-1-natalie.klaus@runtimeverification.com>
In-Reply-To: <20260818064511.104024-1-natalie.klaus@runtimeverification.com>
From: Noam Ben <noambs2999@gmail.com>
Date: Thu, 20 Aug 2026 12:53:31 +0300
X-Gm-Features: AcwNN1WLtnPnvWZh82KjbqF0LLl5dpzU8iQZybCBZJFszmzwhN0a-5oMfPXs56E
Message-ID: <CA+toCPdDSLQpGKpDqxw-RTo1C7SyHpBorvkeOLSXrOcUFckLaA@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Fix integer overflow in frame buffer
 size calculation
To: Natasha Klaus <natalie.klaus@runtimeverification.com>
Cc: ribalda@chromium.org, laurent.pinchart@ideasonboard.com, hansg@kernel.org, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Natasha,

Thanks for the check! I hadn't considered the 2^35 case and that a
plain (u64) cast would still store 0 there :)

On Tue, 18 Aug 2026 at 09:45, Natasha Klaus
<natalie.klaus@runtimeverification.com> wrote:
>
> On Wed, Aug 12, 2026 at 01:32:51PM +0300, Noam Ben Shimon wrote:
> > +     if (!(format->flags & UVC_FMT_FLAG_COMPRESSED)) {
> > +             u64 bufsize;
> > +
> > +             bufsize = ((u64)format->bpp * frame->wWidth * frame->wHeight) >> 3;
> > +             if (bufsize > U32_MAX) {
> > +                     uvc_dbg(dev, DESCR,
> > +                             "device %d videostreaming interface %d FRAME %u: computed buffer size overflows\n",
> > +                             dev->udev->devnum,
> > +                             alts->desc.bInterfaceNumber,
> > +                             frame->bFrameIndex);
> > +                     return -EINVAL;
> > +             }
> > +
> > +             frame->dwMaxVideoFrameBufferSize = bufsize;
> > +     }
>
> Ricardo asked me to look at this. I had been looking at the same expression
> independently, so I checked your numbers and the surrounding behaviour
> rather than only the diff.
>
> Both examples in the commit message reproduce exactly. 32 bpp at
> 16384x4096 gives 4026531840 against a true 268435456, and 16 bpp at
> 16384x16384 gives 0 against 536870912.
>
> One case I would add to the commit message, because it is the strongest
> argument for rejecting rather than only widening. bpp=32 at 32768x32768
> is exactly 2^35, so the 64-bit quotient is exactly 2^32. A bare (u64)
> cast without your check would store 0 there, which is the same failure
> the patch removes. Your check catches it.
>
> I also checked when the check can fire at all. For bpp <= 8 the threshold
> is unreachable given the u16 field limits, and it does not need to be
> reachable: the largest possible result at bpp=8 is 4294836225, which
> still fits in u32. So the check fires exactly where it is needed and
> nowhere else. That seemed worth confirming rather than assuming.
>
> My one question is about the error path rather than the arithmetic.
>
> uvc_parse_frame() has a single caller, and -EINVAL propagates further
> than I first expected:
>
>   uvc_driver.c:495   return ret, so the whole format is abandoned
>   uvc_driver.c:745   goto error, so remaining formats are never parsed
>   uvc_driver.c:788   usb_driver_release_interface() and uvc_stream_delete(),
>                      so the streaming interface never reaches dev->streams
>   uvc_driver.c:1004  the uvc_parse_streaming() return value is discarded,
>                      so probe continues and succeeds
>   uvc_driver.c:2135  "No streaming interface found for terminal %u"
>
> So one malformed frame descriptor costs the entire streaming interface,
> not just that frame, and probe still succeeds. On a single-interface
> webcam that means the device binds with no /dev/videoN, and the only
> explanation is the uvc_dbg line above, which sits behind a debug bit
> that is off by default.
>
> I do not think this is a practical regression risk, since no plausible
> device reaches 2^35, and the surrounding function is otherwise built
> around repairing bad descriptors rather than rejecting them. What
> bothers me is the silence: a user who does trip it sees a device that
> binds and produces nothing, with no logged reason. Two ways to address
> that:
>
>   - dev_warn() instead of uvc_dbg(), so the reason is visible without a
>     debug build
>   - skip only that frame descriptor and continue, rather than failing
>     the format
>
> Either would satisfy me. If you and the maintainers would rather keep
> -EINVAL with uvc_dbg as it stands, I have no objection to that either,
> and you are welcome to add
>
> Reviewed-by: Natasha Klaus <natalie.klaus@runtimeverification.com>
>
> to v2 as it is.
>
> Separately, and explicitly not an objection to this patch: a zero
> dwMaxVideoFrameBufferSize stays reachable from the other end. Any zero
> operand, or any product below 8, gives 0 after the shift, and bpp=0 does
> reach the computation on uncompressed formats. Nothing between the
> descriptor bytes at uvc_driver.c:254, :255 and :382 and this line
> validates any of the three. A zero then goes through uvc_video.c:214
> into stream->ctrl, sizes vb2 at uvc_queue.c:90, and trips
> WARN_ON(!plane_sizes[i]) in vb2_core_reqbufs() at
> videobuf2-core.c:951. That is pre-existing and unchanged by your patch,
> so it is not yours to fix here. I am happy to send a follow-up if the
> maintainers want it as a separate change.
>
> One caveat on my side: all of the above comes from reading the tree at
> v7.2, not from running it. I did not test on hardware or a UVC gadget,
> and I did not build your patch.
>
> Natasha
