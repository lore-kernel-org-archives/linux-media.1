Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8124E3254
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 19:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790622240; cv=none; b=KmqHS3lyXwoXE1ji23JgR2uWdl/m73rAJJaLtWIoddBmAmtZb7szOlb/WpAvwYpSCzzwKom5Ulmy2VV4ZVWl4K3jq6vEdHaMNb1SvIb0TTgr2E6imiZVq5pFonRF3AO5VRmEa0cDqKznc+ExQhNjxHbCP9+8urDvu6XaxawrWrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790622240; c=relaxed/simple;
	bh=Ii6su9q+Ms7ruL5ubHuRQW/zkqyBvMkD3ORd5XV/dDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TTBqfpZitP8mjQsh28K3z5EtZ4Z9I9eXn9Q60nU5KMbpGbXm/BKDtPBgZHODujClE30R9vu83rVPAAcJPeD0nZH+M7n0vJbSd5p7UqlatYZ/Fsyms6yJK8fFSYzwJcqTyFToDyfNtpG38fmSlwTaN7iDzatluJTKBDp7ZmGh2CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cjSDRNOc; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cjSDRNOc"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0d31bda43so1862415a91.1
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 12:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790622238; x=1791227038; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yb4VU0xO3Kw3ynFT3ZuY69A5vTUlTGRQrwm4GlcKD7M=;
        b=cjSDRNOcmc5KpAjEzK2CvwAH9JxPRp1G2SyxutLuN6K3irC++h5xeQgK6dBWikxIcu
         hV94yZyZE+9ARJ61zXPRCA/GTv9gnHfhXpZ+aV5Ir53eIk3Zc95rHSa5Kr536iEuRc8z
         /rviAfgnpkycJYcQUYtpWeDA8SJxT4YKFVgkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790622238; x=1791227038;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yb4VU0xO3Kw3ynFT3ZuY69A5vTUlTGRQrwm4GlcKD7M=;
        b=g5pOSw2awedurm9hjsFR8eIKj/U/k4oGcrbDiXwema7YpRkFViVUgfZXmdT0TwziJW
         P5uLq44pftV5pLH4/6lPcs7pMS9SAszm/lfowAJQ60Q9fNe4nj7GmqaF29ZdtqL70L1r
         lCHMrRimVFWcTLWc5oPX9m0T6my0WitFZHxfchPvInR+t+l+Lz5dc4rVpxRkVXCjxvNr
         puiEytXtncavAyTsF6THLCUrMkQYbc/xBWDd+ud4hSGLyf+KZMBmlWB8OUIIB16e/xNH
         vebtE0FqzHQHaIrvab2AdKTKHop5W50S8CTzldra6HVCAokm7UZymPu/S/duHUvupaHE
         /GIA==
X-Forwarded-Encrypted: i=1; AKwUvBz7agkr2LfI/R0PD8OY4p7OIa8p2YHNKqjdQJLZTKnQ0lkOyuDiJhjr9yqWNVgvTQMQqvmmCx0DoLdIyg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ74UIL5EjHTGaRgfCJqslsIeZikcEChHbdKexIBclEphV7OcJF
	/CLGdSeSwMB9+X83Dcge8eJAtXnDD2qk4HHoPcdzGX0uXgOnkiSRbS7X+Ayzo/lhqpN/2esZ6ym
	oaNUXmw==
X-Gm-Gg: AYBFou2I1YLKivVfVm5mi2o9uGH5ZbX9OqJWUxTaVk1bhlerHT5joFl8unidLmOeFoL
	XAZDIpTGMv7dxDN2Ln8KTRrpU/xu7neivK6DPZh3ZSA7PSOQR49+J5TYTkKbnE/DXKoonJLrQLs
	L5JReduy8BTcH48MkhNIuJZqDzPuJ3GyLx/n6p39es9zfnZGe8ss6Lajro9hMwb12Ipb9NF3g4v
	1JdprJkGSRaY8LfjESVWucqpDm4BrVRdwVwsf0GEtueD4wWglhP67yBgC8MuvrvR1P4PvmJ8PjH
	HG5imwyWsCiiB2Hgas4kEC1RC9CGXYjb7ow609Rz2r8t5b+SVZP9WlcZdvADtDz07zm7I4dJj1C
	QOrrHYHVqiO61pVljvJKruBlw6oVLeEUabrcRH3fc68iGR2MbLyTQli0W0lpIwyNcnheJH5Gz2b
	FiLvYiO4EmlHdVKpHTXzF3ayvsxqgry9YBKEtNtLcTuTJ4gJg4JXRK5veBx9jVRuyGfPwqxqDmN
	ARlAEpE21pfd/74wt01YtbcsEaJypQvuV1tNQPkhrKl6mip
X-Received: by 2002:a17:90b:5306:b0:3a0:ede7:dfe0 with SMTP id 98e67ed59e1d1-3a0ede7f9ebmr6227968a91.23.1790622237936;
        Mon, 28 Sep 2026 12:03:57 -0700 (PDT)
Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com. [74.125.229.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49804220fsm907654a91.12.2026.09.28.12.03.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 12:03:57 -0700 (PDT)
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-144f7915355so2941755c88.3
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 12:03:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwQn3Bh+oubtjdBQG5escEpoh6duMge0znc1oOf5+3gGPKhhWPeS55r9by6GEO8HoRMHMSux0vBFitoww==@vger.kernel.org
X-Received: by 2002:a05:701b:4243:20b0:144:eb46:be0 with SMTP id
 a92af1059eb24-146ce67ed9dmr11205429c88.13.1790622236106; Mon, 28 Sep 2026
 12:03:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-uvc-ctrl-bound-v1-1-7b5cfc68bae1@chromium.org>
 <20260928120252.GB4406@killaraus.ideasonboard.com> <CANiDSCv5pd-3aO0Eb1-rvsAOGNpB4rhpjtnTosU6Ca+xBxN1qQ@mail.gmail.com>
 <20260928122450.GA166131@killaraus.ideasonboard.com> <CANiDSCuBFLYXFbq7Vox7AhdhftfzC9Ga6FKL-2F1o08cHQjoAA@mail.gmail.com>
 <20260928124109.GF157191@killaraus.ideasonboard.com> <CANiDSCvvJd0_taNYvHm894kPpyOWQ+TaxC_XRVOs5qrUHod08Q@mail.gmail.com>
 <20260928184429.GE210522@killaraus.ideasonboard.com>
In-Reply-To: <20260928184429.GE210522@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 21:03:41 +0200
X-Gmail-Original-Message-ID: <CANiDSCs8N-m1F7LMuerVbYF8xrBPBeVTg2_UX4p6M7g=9yz_Sg@mail.gmail.com>
X-Gm-Features: AclHuK96cFmDAaZ7pA9J38bcgxdWVUQY-fBUQnA5y78NAtvlOMQREwr8C3c2N04
Message-ID: <CANiDSCs8N-m1F7LMuerVbYF8xrBPBeVTg2_UX4p6M7g=9yz_Sg@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix bounds for descriptor parsing
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@skynet.be>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Sept 2026 at 20:44, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Sep 28, 2026 at 04:03:15PM +0200, Ricardo Ribalda wrote:
> > On Mon, 28 Sept 2026 at 14:41, Laurent Pinchart wrote:
> > > On Mon, Sep 28, 2026 at 02:35:29PM +0200, Ricardo Ribalda wrote:
> > > > On Mon, 28 Sept 2026 at 14:24, Laurent Pinchart wrote:
> > > > > On Mon, Sep 28, 2026 at 02:10:26PM +0200, Ricardo Ribalda wrote:
> > > > > > On Mon, 28 Sept 2026 at 14:02, Laurent Pinchart wrote:
> > > > > > > On Fri, Sep 11, 2026 at 01:23:50PM +0000, Ricardo Ribalda wrote:
> > > > > > > > uvc_parse_control() passes descriptor by descriptor to
> > > > > > > > uvc_parse_standard_control() with the number of bytes remaining in the
> > > > > > > > buffer, not the number of bytes of that descriptor.
> > > > > > > >
> > > > > > > > Because of this, malformed descriptors could leak over the next
> > > > > > > > descriptor, leaving malformed data in our structures.
> > > > > > >
> > > > > > > What issue does this fix in practice ?
> > > > > >
> > > > > > Look into uvc_parse_standard_control().
> > > > > > Let's take the UVC_VC_HEADER
> > > > > >
> > > > > > Imagine we have a malformed control at the beginning of the descriptor that has:
> > > > > >
> > > > > > buffer[0] = 3
> > > > > > buffer[2] = UVC_VC_HEADER
> > > > > > buffer[3] => Beggining of next control
> > > > > >
> > > > > > With the current code, buffer[3...X] is parsed as UVC_VC_HEADER.
> > > > > >
> > > > > > What does it fix in practice? It avoids that data outside the controls
> > > > > > is parsed as part of the control.
> > > > >
> > > > > I understand that, but what does it fix in practice ? And have you
> > > > > encountered a device that exhibits such a problem ?
> > > >
> > > > I have not encountered such devices, but even if they do not exist
> > > > they are easy to emulate and use for escalation.
> > >
> > > That's what I'd like to understand, can this be used for any kind of
> > > escalation ?
> >
> > It is very difficult (impossible?) to prove that something is not
> > exploitable, especially as the code evolves.
>
> Regardless of whether or not all the bytes parsed by the
> uvc_parse_vendor_control() and uvc_parse_vendor_control() functions are
> part of the control descriptor or are split across multiple descriptors,
> they all come from the USB descriptors buffer and are all ultimately
> under device control.
>
> As far as I can tell, all this patch does it add a check on buffer[0]
> but has no impact on anything else. If a device can supply USB
> descriptors data with an invalid buffer[0] that currently causes any
> type of issue in the driver, the same device could supply the exact same
> USB descriptors with buffer[0] set to a value that will be accepted and
> still cause the same issue. Am I missing something ?
>
> > We could spend hours trying to craft a payload, plus extra time in
> > future reviews whenever uvc_parse_vendor_control() changes. It is much
> > safer to just enforce the correct bounds now.
>
> So is your concern only about introducing issues in the future without
> noticing ?

My main concerns are that the function's API looks wrong and yes, it
could introduce bugs in the future.

we basically have:
parse_field(void *data, size_t total_length)

instead of:
parse_field(void *data, size_t field_length)

btw: in parse_field we are ignoring the field_legth in most of the cases.

I am happy to drop the cc and fixes tags if you want to consider this
just a boring cleanup


>
> > As you said, the risk to break current hardware is low. If it happens
> > tis change is small enough to make it easy to revert.
> >
> > > > We add minimal code and solve a family of bugs. Do you think that it
> > > > is a better pattern that uvc_parse_vendor_control() and
> > > > uvc_parse_vendor_control() have visibility beyond the control that
> > > > they are parsing?
> > >
> > > I'm concerned that some devices may stop working. The risk is likely
> > > small though, but I'd like to understand what we get from this patch to
> > > see if it's worth the risk.
> > >
> > > > > > > > Change the code so we pass the actual length of the descriptor to the
> > > > > > > > parser.
> > > > > > > >
> > > > > > > > Note that this makes the existing check more strict and some devices
> > > > > > > > that are wrongly parsed today will not be probed now.
> > > > > > > >
> > > > > > > > Cc: stable@vger.kernel.org
> > > > > > > > Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> > > > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > > > ---
> > > > > > > >  drivers/media/usb/uvc/uvc_driver.c | 7 +++++--
> > > > > > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > index e289cc71ba98..429f1ab19a2a 100644
> > > > > > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > @@ -1248,11 +1248,14 @@ static int uvc_parse_control(struct uvc_device *dev)
> > > > > > > >        */
> > > > > > > >
> > > > > > > >       while (buflen > 2) {
> > > > > > > > -             if (uvc_parse_vendor_control(dev, buffer, buflen) ||
> > > > > > > > +             if (buflen < buffer[0] || buffer[0] < 3)
> > > > > > > > +                     return -EINVAL;
> > > > > > > > +
> > > > > > > > +             if (uvc_parse_vendor_control(dev, buffer, buffer[0]) ||
> > > > > > > >                   buffer[1] != USB_DT_CS_INTERFACE)
> > > > > > > >                       goto next_descriptor;
> > > > > > > >
> > > > > > > > -             ret = uvc_parse_standard_control(dev, buffer, buflen);
> > > > > > > > +             ret = uvc_parse_standard_control(dev, buffer, buffer[0]);
> > > > > > > >               if (ret < 0)
> > > > > > > >                       return ret;
> > > > > > > >
> > > > > > > >
> > > > > > > > ---
> > > > > > > > base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
> > > > > > > > change-id: 20260911-uvc-ctrl-bound-9c1940f06fc7
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
