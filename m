Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624123B27C1
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 23:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790723590; cv=pass; b=LECAyt7lU3c189t2TODMjG2mQjsA4PxWat1XvFA27m76qPl9dGm6OiNirTXS5etCXEGUsn8J+bs9JZOaElR2qrz6wHK85ni9F3Tbkf5QFBmIxvfJC1/EpHN2IXly5nkWPi3tXX7mrfYlynUlEVBvNfDGwLOUupubJ9exiKZ2cP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790723590; c=relaxed/simple;
	bh=MaUS+F0fKOr5e04hFxW3NiUiLFf0VyXmdyNTytVr2BY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AG7saBvSK6IPSdPSlOj8+wbk13lwQiUgBq95D/xRqUhOISnryx4vrd7U+/d2wWG1nM60N7hKCYxhL5FsWRyiycd6TQERT/vbyA8xRP7N0i4TEWvS66rCGmB/9hPVhWZH7BogMolHTxDH0DTShkKB8XPB1dOuGzOK6lVtk0Y+oHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5JVZJra; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5JVZJra"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so4547323eec.0
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 16:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790723585; cv=none;
        d=google.com; s=arc-20260327;
        b=VNNkWR/a5FvX26c0XrZfa8oxi/IKQz0hzE4yVE47ujnxAmV4UCbUoyThTH7RmOqIoh
         xGWV636ETXZ9ZVmtKEGZQ56/QqOj3TESl4YqwzjA0pxdjHfVkNOH+3J9hkIEY+L69iGL
         9O4mIZK4M7a+WcyZfsjRQyxegaj9NaspnYKyKBBTgb250XjrSXchYYkWH3vRrMwRWPNB
         KR6P6HBLldwaQjeXMklKJ1oSfLEu+uKDisj3fArWVYA2Od0KOIZMUpazxK2nkWAQxppc
         meA4cBCduId8kjxIn8DANEmQAItce4tDOWug5T8xHKw6NQQnWygEQhRxd0WA7vh66syt
         FPmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MaUS+F0fKOr5e04hFxW3NiUiLFf0VyXmdyNTytVr2BY=;
        fh=fx3/tE2Ckj7wz585KaFmOKdlnWYl1Tq+42rVBZp9Riw=;
        b=LTyd3tTryemGdYwRbulH5+yb3Eh5nx1qRuNLbDUfDpr1UWFy1OMTyHoN2trda4O5lM
         JHKVeON3hWTE9OgXFiq2UFdkZMno9WkiFF2UAiGwDv/6XAOgfZt/7CmYYAXOI+n8Q0jz
         dpIpcOaSi1CJmBGptyAWgWcDxEi42pJT1pknII/HDBPsSqCRgfrrLBTitwa3cbE62Wnq
         ucue5QvRC7lqkuEAIth5h4j2s6bPJ6uevU/skJCjQEBPp7rDYc3LWeHraHrQWgl/9eTa
         wsr1cQBm1Rtb2Zp+XbcpDIQ6+WASfj9yfmpQFluNbuCNmZ58fVlUb1G/uL/uyfBfJ0le
         CugQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790723585; x=1791328385; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MaUS+F0fKOr5e04hFxW3NiUiLFf0VyXmdyNTytVr2BY=;
        b=h5JVZJra0NXjN/IR922ol6FflVUo56jzzpCbGrig3DCL3Yk72ns/C0G2vLz1QRi885
         9lRTcxNmn2ENuLHEDDefEyEo7iw8xORpxFEW7zBKC3u2fmiNnXiKZo49ZUnGHLsDOoLl
         Mjz0svzPQtf2EL0ouFrDyysjE4Jie0IJJedi/xdWLIWUgEiPNayIBk2CBZdLGNZP7/Ns
         WWKLEPQMEbI0H+Xb4BOBq4Mc8KgWYzljv87xMybVciuVEAn8LsO/FsVEXgxuCdBrG4lX
         Z4wGesNfzfI+F1P64FeDUnDzy1ZJzgO2icMP6d3gKv2n5Mo6qZGHUa57owqUPVb3ZNlq
         shGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790723585; x=1791328385;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MaUS+F0fKOr5e04hFxW3NiUiLFf0VyXmdyNTytVr2BY=;
        b=Ofm6+ObMFQTOWZE0HJZ26KXcIYnSZ1+bG0OMZV+TQHcoI2gC5Srl3zLMI6jkKTwDxF
         nJ9L1xTfsV/roe2V3iQDC6kspSAWLL4PcGckAeUfzSorn1TU26BTOHmDHG4cmUl6FPHB
         cA0Y6+gwjPpaTpVCBG680ux5Iuu9nhPw/FfgCu/SuHOx+TH5jyX1Pfjiox4pGuFkbWXq
         DbscLPAC2EYwVbs9UlyqDT2SlZxMSRUNKAgsdM0K78WRyWp/IwpOgx9Omee92KYOtlKf
         YsOb5qMtPez6c4m+y8yts/MwJWkQ2+WsbFJOQR1Xl18Se/J7hH911THGBoBK2JpjUz1/
         29jw==
X-Gm-Message-State: AFq9FYJURs9C+kJgGq6od/pduGLEG7D+M9AK7ve5BMKM4S9RiFvy9S7S
	9PsVDuQN4sKN+NMyywqLBCvvZNS/y58oNGG6dC4t1xMz6onfbkFupdnY8YaJdv+rVQ1wMd7D/4D
	bueqe/y53i9Oxu3udKDHGW3xGpKV9mOMr3SV9sHk=
X-Gm-Gg: AYBFou2mxuC5rTkGeafT4UfSUW0H+Vup9m3ABn6LoY380RSvFHiDqLQ1rBHkpOk2Fj/
	clWm1DQP0rMrK9RzPuSf/NxtLs/3I9qhVPbsjmTojYp8EOrb4i8kUIoVKLsGT0ag9B+9l2g4oR0
	oY1NHX4OPQvxxi/EMXAQEcRIHXXWrktXWkwgUProHAe0uUxV6LOIV9DheG22nUQU7EoGzQjtQAB
	n1BldpZKkvXhUiQVuO47KeR/86VGU9iMN4IcvL8rvuz8sTIf82u3SCJmXM04r+uKEW/gSMU0eDI
	A7BkxAMcGwvp+00KMD4MB4cLsoKfBNtT1RvlDwwYtHO2B7vcoSgVoinYQkPAoqrNvlXrDpVwevd
	/tA==
X-Received: by 2002:a05:7301:fc12:b0:341:a4ed:d910 with SMTP id
 5a478bee46e88-34c65c622cdmr858433eec.7.1790723584981; Tue, 29 Sep 2026
 16:13:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+2YD=Nxe25n8rmM-DS+w+Pg0N_YtOf_znJXNMi77SCwk3OUyw@mail.gmail.com>
 <20260925205706.GA697101@killaraus.ideasonboard.com>
In-Reply-To: <20260925205706.GA697101@killaraus.ideasonboard.com>
From: Perry Joyce <perrygjoyce97@gmail.com>
Date: Wed, 30 Sep 2026 00:12:53 +0100
X-Gm-Features: AclHuK-Ap3SxujRSf8OOSV3hnZak0aESAQpvapu2LboIUe41glhlpR1xU3QT6b0
Message-ID: <CA+2YD=P3pNVi=GJ1qoqnsgA56Hg_N6iT_AXGPDBHn9XToxh1KA@mail.gmail.com>
Subject: Re: uvcvideo: Logitech Brio 500 (046d:0943) needs UVC_QUIRK_PROBE_DEF
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, hansg@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Resending in plain text as requested.

I'm seeing a reproducible UVC probe error with a Logitech Brio 500 (046d:0943):

uvcvideo 1-3:1.0: Found UVC 1.00 device Brio 500 (046d:0943)
uvcvideo 1-3:1.1: Failed to set UVC probe control : -32 (exp. 26).

Kernel:

Linux archlinux 7.2.6-1-cachyos-bore #1 SMP PREEMPT_DYNAMIC Thu, 17
Sep 2026 07:33:37 +0000 x86_64 GNU/Linux

The webcam otherwise works normally.

Testing with UVC_QUIRK_PROBE_DEF fixes the initialization error:

modprobe -r uvcvideo

modprobe uvcvideo quirks=0x100

After loading the module with 0x100, the device initializes without
the probe-control error:

uvcvideo 1-3:1.0: Found UVC 1.00 device Brio 500 (046d:0943)
uvcvideo 1-3:1.0: Forcing device quirks to 0x100 by module parameter
for testing purpose.
uvcvideo 1-3:1.0: Please report required quirks to the linux-media mailing list.

I also tested this across a reboot with:

options uvcvideo quirks=0x100

and the probe error remains absent. Normal 1920x1080 MJPEG capture at
30 fps continues to work.

Device information:

idVendor=046d
idProduct=0943
bcdDevice=0.21
Product: Brio 500

Would it be appropriate to add UVC_QUIRK_PROBE_DEF for this device?

I'm happy to provide additional logs or test a patch if needed.

Kind regards,
Perry


On Fri, 25 Sept 2026 at 21:57, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello Perry,
>
> Your original e-mail was sent as HTML, which gets silently rejected by
> the kernel mailing lists. Could you please resend it as plain text ?
>
> On Fri, Sep 25, 2026 at 09:31:42PM +0100, Perry Joyce wrote:
> > Hi,
> >
> > I'm seeing a reproducible UVC probe error with a Logitech Brio 500 (046d:0943):
> >
> > uvcvideo 1-3:1.0: Found UVC 1.00 device Brio 500 (046d:0943)
> > uvcvideo 1-3:1.1: Failed to set UVC probe control : -32 (exp. 26).
> >
> > Kernel:
> >
> > Linux archlinux 7.2.6-1-cachyos-bore #1 SMP PREEMPT_DYNAMIC Thu, 17 Sep 2026
> > 07:33:37 +0000 x86_64 GNU/Linux
> >
> > The webcam otherwise works normally.
> >
> > Testing with UVC_QUIRK_PROBE_DEF fixes the initialization error:
> >
> > # modprobe -r uvcvideo
> > # modprobe uvcvideo quirks=0x100
> >
> > After loading the module with 0x100, the device initializes without the
> > probe-control error:
> >
> > uvcvideo 1-3:1.0: Found UVC 1.00 device Brio 500 (046d:0943)
> > uvcvideo 1-3:1.0: Forcing device quirks to 0x100 by module parameter for
> > testing purpose.
> > uvcvideo 1-3:1.0: Please report required quirks to the linux-media mailing
> > list.
> >
> > I also tested this across a reboot with:
> >
> > options uvcvideo quirks=0x100
> >
> > and the probe error remains absent. Normal 1920x1080 MJPEG capture at 30 fps
> > continues to work.
> >
> > Device information:
> >
> > idVendor=046d
> > idProduct=0943
> > bcdDevice=0.21
> > Product: Brio 500
> >
> > Would it be appropriate to add UVC_QUIRK_PROBE_DEF for this device?
> >
> > I'm happy to provide additional logs or test a patch if needed.
> >
> >
> > Kind Regards,
> > Perry
>
> --
> Regards,
>
> Laurent Pinchart
