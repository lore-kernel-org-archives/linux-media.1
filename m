Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38503B9DB6
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 06:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749652; cv=none; b=mcGh5u2EHu3nNuN4UU/+f1cDJ7c5zvAobpDNa9p9o70xsqO+afcYDOp+ESbTZtn25dBgnxlq2pPc3pI/7fy7z5QvmVDmFHlAHb3WSQVTz0SQU07DXeQntquv8YtsxeX6CP8eCRreHdvqOENuFkK2+0K+58IKwcQEavvpW3L09ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749652; c=relaxed/simple;
	bh=GJNgEKqztoFxFEvYnJMG3Ai2a3tKs0b85VlnyR58z8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f2Vc3cNgWFK1wWsw3yZmxUYAUlE2ls2u18djSo+2xdUbLiWHJ+/9ZKBQGGww6N84Dpm03iLHLxLx5Row0C5fizIkJQ338yhJ0eJeIfdbnNxp3tuIipg8j5jI2ELvjDsi/65bczF5hifWue9axWCAvVL4o8piglFCY8G5MA9ASLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OSKU+N5X; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OSKU+N5X"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a4c8262465so343398a91.2
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 23:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790749650; x=1791354450; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lc1qIpsrNbX+GFd8HSn+Cvyk4IOwYzMrYFI4KpEuUyw=;
        b=OSKU+N5XH4KbTSOkit1XMJYVLOeqkhL8cD2J5Hjp4XZKYA0jdG5d1VAiRoysmTpzJZ
         Zd00K09GFe3ewSXrgeTKUBx6TUmmEuCckIdq3HI7UBRu8NyEU1EvpUAz49jHMtA0fFm6
         KBWkJnSEHkwMaoHnY1pjj2zBW3IpfT3KDSroY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790749650; x=1791354450;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lc1qIpsrNbX+GFd8HSn+Cvyk4IOwYzMrYFI4KpEuUyw=;
        b=MtRDfbE8V10nGOVq4JzB7A/6v+usZHpM98jgI3BKcMDPLhUA0TVQ7zKq9ksaA25j4L
         nX4JzK/abbnBmhaX2yWsCnACe7WN69AKOwNeqv5eL40i+4dDtNHvn8IoI6i+p7T17rU0
         rJtk8qJWjWdRsnti309j+CairvMRJrcCKy/lzZnrN3bxzoUlZpGr1wyGZTzhdZup7jZZ
         kKFXPWICexoh6qh/LR8HcFCD19ElpjF98WDQ0itV3l39b83sSc+tB081e3yMhyMK5RuY
         od/CU/kLgAJDB6DgJ7/w/foR7VsbHZ7IKHGkuxfD6ZiLS4JR16mE7Zxn6Pu33KYE9dLH
         Ff4A==
X-Gm-Message-State: AFq9FYK6JArOnfds+kkrBF5426IRMiZQukNP2uhjpNNa2DsgWM9cqBeR
	D77PGEUStmXF6YCqqi4SgqzYBpMZzp144pg3ZtHkKhJ+0vbRNrnNcSGJzL0xlQt1Q98vVSPCGBf
	IAoQ=
X-Gm-Gg: AYBFou0pnjlr4kA8Ovf1Q8CmSA3o2HsAywO4oKSYSaXSHQ3A3uLYIC5QU7R+MPeuzVT
	9IWc005Vn2sve2JNWemum/+xoczJG8Qltjdh5KtzQ5fejSeFUNh+XBq5UnZSiOhc+5hb3JPe3fJ
	xn5j7bBBXuRJSodQcTGnOphULlJbQ/QgTuUeMgIn0g3p8yGN6hyfzNPTRjMNPPUlicRXYDbqyYz
	T3LV0LCdoVCU1OpZMWbchFHvU1ABicpQ1ZfNuEXSBp5pRKT2E4cB9Yf90dhyJwbRXvBDYFWCUzk
	kR4t/sSFu8MiIFC9cbL8DL6HhqGZQJ0W/RKadjq5T2fQjRCqvB2x3vplMCNU6nWnSs7ruI5+fsu
	fVcYTkW75uAomtTR5P2gZFVnTZtOYoXnP7J0VXY+hgbM4ReUQPFUx6TTKeIxfpecwOLQGmCOD3H
	7LWbSU2rKZS4kJ2orxKaRQ2uRtfoaih+1jZA4AvfaaW2HpCNgJKF4dEVUV5fuVFKmzKf+4RhWR/
	oStH4ihBi1mWvvtpBims2mrYN1TdnHInJZLjw==
X-Received: by 2002:a17:90b:51:b0:3a2:a98e:7a2b with SMTP id 98e67ed59e1d1-3a4d1914382mr401074a91.57.1790749650283;
        Tue, 29 Sep 2026 23:27:30 -0700 (PDT)
Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com. [74.125.229.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ca185432sm1864904a91.1.2026.09.29.23.27.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 23:27:29 -0700 (PDT)
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144f47a9b57so4541039c88.2
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 23:27:28 -0700 (PDT)
X-Received: by 2002:a05:701b:2719:b0:143:57c1:6242 with SMTP id
 a92af1059eb24-14d32bde9b9mr300065c88.26.1790749647410; Tue, 29 Sep 2026
 23:27:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+2YD=Nxe25n8rmM-DS+w+Pg0N_YtOf_znJXNMi77SCwk3OUyw@mail.gmail.com>
 <20260925205706.GA697101@killaraus.ideasonboard.com> <CA+2YD=P3pNVi=GJ1qoqnsgA56Hg_N6iT_AXGPDBHn9XToxh1KA@mail.gmail.com>
In-Reply-To: <CA+2YD=P3pNVi=GJ1qoqnsgA56Hg_N6iT_AXGPDBHn9XToxh1KA@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 30 Sep 2026 08:27:14 +0200
X-Gmail-Original-Message-ID: <CANiDSCsuiPN=9PNb9gckRwgZXMEouYTac0_DgbO1Mti+p2zH=A@mail.gmail.com>
X-Gm-Features: AclHuK-fwd65UvzyRP5lPKeP_uJxaO37ohdi1sIivOyI8BaBY3Yurjj-DcNth6o
Message-ID: <CANiDSCsuiPN=9PNb9gckRwgZXMEouYTac0_DgbO1Mti+p2zH=A@mail.gmail.com>
Subject: Re: uvcvideo: Logitech Brio 500 (046d:0943) needs UVC_QUIRK_PROBE_DEF
To: Perry Joyce <perrygjoyce97@gmail.com>
Cc: linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, hansg@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Perry

Thanks for the report.

Could you provide the output of lsusb -v -d 046d:0943 ?

If you want to try, you could send a patch like this one (but with the
right quirk):
https://gitlab.freedesktop.org/linux-media/users/uvc/-/commit/056dfb7bf8c9d62367bd600a175e072692df67a6

Thanks :)

On Wed, 30 Sept 2026 at 01:13, Perry Joyce <perrygjoyce97@gmail.com> wrote:
>
> Hi,
>
> Resending in plain text as requested.
>
> I'm seeing a reproducible UVC probe error with a Logitech Brio 500 (046d:0943):
>
> uvcvideo 1-3:1.0: Found UVC 1.00 device Brio 500 (046d:0943)
> uvcvideo 1-3:1.1: Failed to set UVC probe control : -32 (exp. 26).
>
> Kernel:
>
> Linux archlinux 7.2.6-1-cachyos-bore #1 SMP PREEMPT_DYNAMIC Thu, 17
> Sep 2026 07:33:37 +0000 x86_64 GNU/Linux
>
> The webcam otherwise works normally.
>
> Testing with UVC_QUIRK_PROBE_DEF fixes the initialization error:
>
> modprobe -r uvcvideo
>
> modprobe uvcvideo quirks=0x100
>
> After loading the module with 0x100, the device initializes without
> the probe-control error:
>
> uvcvideo 1-3:1.0: Found UVC 1.00 device Brio 500 (046d:0943)
> uvcvideo 1-3:1.0: Forcing device quirks to 0x100 by module parameter
> for testing purpose.
> uvcvideo 1-3:1.0: Please report required quirks to the linux-media mailing list.
>
> I also tested this across a reboot with:
>
> options uvcvideo quirks=0x100
>
> and the probe error remains absent. Normal 1920x1080 MJPEG capture at
> 30 fps continues to work.
>
> Device information:
>
> idVendor=046d
> idProduct=0943
> bcdDevice=0.21
> Product: Brio 500
>
> Would it be appropriate to add UVC_QUIRK_PROBE_DEF for this device?
>
> I'm happy to provide additional logs or test a patch if needed.
>
> Kind regards,
> Perry
>
>
> On Fri, 25 Sept 2026 at 21:57, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hello Perry,
> >
> > Your original e-mail was sent as HTML, which gets silently rejected by
> > the kernel mailing lists. Could you please resend it as plain text ?
> >
> > On Fri, Sep 25, 2026 at 09:31:42PM +0100, Perry Joyce wrote:
> > > Hi,
> > >
> > > I'm seeing a reproducible UVC probe error with a Logitech Brio 500 (046d:0943):
> > >
> > > uvcvideo 1-3:1.0: Found UVC 1.00 device Brio 500 (046d:0943)
> > > uvcvideo 1-3:1.1: Failed to set UVC probe control : -32 (exp. 26).
> > >
> > > Kernel:
> > >
> > > Linux archlinux 7.2.6-1-cachyos-bore #1 SMP PREEMPT_DYNAMIC Thu, 17 Sep 2026
> > > 07:33:37 +0000 x86_64 GNU/Linux
> > >
> > > The webcam otherwise works normally.
> > >
> > > Testing with UVC_QUIRK_PROBE_DEF fixes the initialization error:
> > >
> > > # modprobe -r uvcvideo
> > > # modprobe uvcvideo quirks=0x100
> > >
> > > After loading the module with 0x100, the device initializes without the
> > > probe-control error:
> > >
> > > uvcvideo 1-3:1.0: Found UVC 1.00 device Brio 500 (046d:0943)
> > > uvcvideo 1-3:1.0: Forcing device quirks to 0x100 by module parameter for
> > > testing purpose.
> > > uvcvideo 1-3:1.0: Please report required quirks to the linux-media mailing
> > > list.
> > >
> > > I also tested this across a reboot with:
> > >
> > > options uvcvideo quirks=0x100
> > >
> > > and the probe error remains absent. Normal 1920x1080 MJPEG capture at 30 fps
> > > continues to work.
> > >
> > > Device information:
> > >
> > > idVendor=046d
> > > idProduct=0943
> > > bcdDevice=0.21
> > > Product: Brio 500
> > >
> > > Would it be appropriate to add UVC_QUIRK_PROBE_DEF for this device?
> > >
> > > I'm happy to provide additional logs or test a patch if needed.
> > >
> > >
> > > Kind Regards,
> > > Perry
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>


-- 
Ricardo Ribalda
