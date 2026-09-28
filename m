Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F0839184A
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 19:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624964; cv=none; b=QcdLlEyteITn3jkuixY+SOo1bg4SPrFQnhw4E2DIIAjfHnkcFFMNdV0Jdv7pduEU0ONclpvWiU6lLUGx8Lx6HKvkI7+23o1nsNOaWWCfZKfGjpwr5lPfjCcOAM5ScceIBWw8eN4BgiOQ226t3TtJNu8ltfsjQccUngO17yCr9SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624964; c=relaxed/simple;
	bh=LXDoVcg81MiG1sQyzMH6pbErIfy13ilp/6xeL+JZsqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BsOzq5I8aWxDvkVvYC/Pv4AIqRayr28TnQrdUFFlc/GHjp06r0K4+MiWoLPvqKFtVh9RzoAgKuO1ZHbZeYwOUumXUiJnAcMb7f1e0TRFElt5AVgHLa3pCGRFI51J49pnXtfIaXruwaAPOzvHuNBIUqDk+hRzAwcMs+4tYJzQsPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D5URFPQb; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D5URFPQb"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so1838241a91.2
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 12:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790624963; x=1791229763; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DIzIH4sC3j48Y/7JpNE/XdjFo0EqRvLt2ihZhDXSe3Q=;
        b=D5URFPQb08Rqsc2EHxfJ15vQHoYdjlVQ7WMgzlF2gakMw4IsdCAM9qpn3lPVnWz4dW
         WhHBnMmKLgdJwg+E9smyWjKPCMCpmiUJZkuWJNhpBDHx+MFnELi3jjRnWbL0Xun0o6pp
         5Zpoe0Kdu5rbmm783fSIFh1cf2JAjW3uDrqig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624963; x=1791229763;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DIzIH4sC3j48Y/7JpNE/XdjFo0EqRvLt2ihZhDXSe3Q=;
        b=T9//yvcxFQQR9S9gA3Je9+FCH8fnzZF2tzr1qLSGCgL3U4MUKEHwUF/Q5zcyyquYog
         WGOK4qzZkFY/VObSn49PRyICtWHqr/v4zVbSdrXKkDgMdOvNWWyQWBMbaVlsrdxeAAzl
         bhRFYmf1QLdi8rxF60e2z45RA8RI1LfTVFyUdHe4tUGQP3O2AC/INnacmqAEKm8QOUpy
         in3KA43TYvuBkdupNYkAK9yVSoCkml+dQNg/zuwPGumZ0cZWcXsbwBDPGIKmP5vcS+iU
         FIUZo9iiGLqzsxSu0vnnQERNg/lKxGMisp7xozXQN+wjd2BEdOwmfoVPHvP+nGcorKhm
         CNaw==
X-Forwarded-Encrypted: i=1; AKwUvBxi5I+rQIwaBujlWCx5qlERPfLKGdk9UabLG535jr0aRFg40sEKSc+tjAWZF2ItXefjjHmEw7gw2vzTJA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJpf9Zq417OwtGtX+hi4e4nNsSihxdg10SsVHQWzL2Rt95+E3SA
	p9GELrbgY6OhT/an5HaBStwVJ93llug+7wncVouX6ipqjmBHkIxFGzXxvQZifXoFdaNiW12tQYa
	VbMzXPNNt
X-Gm-Gg: AYBFou0icYb0Zg5KZAL3p+NX3nrpVvnObV3ZnsYRHt+Y+JYuvVBOPJERvXtJyXf6QAU
	W9A4ALlRlvs3iDdheoWv6qeVpyaAuiXoykTwTftTSEWwVio2vfDq6mMqWfCGrBYgFDpBGK9dc/y
	w/lcU7wYuSLTC24HAMnlfgkiIDLNSN3um5VO5MTnK8brhy5mderlTc3luSgoNqw6VGQZNBpH6dX
	P6agIYdtodngDIMT6VPROakKbj0FVkXEH86Q5P/X0ugxpmgc/hdE61lY8NHN2hS5ibvUxb76Wl0
	iZ5OODJB9O4ypJw2W0H2EUvn6DKQOrvCxpWLzQJA3S2GOljS65zmSCuJW4OU9LrBpPCCVQXteDb
	IMiZ9QckiwYvKvkiyEQ5OzfKPc58j61ZiLEbglhgy1lcCRF6RdNoLpZ72X/JhS47GiZfDNE4wNA
	l4zWN9YbF1tzrsu98MuuNiYpNTHuy1+p08/oB2NetELUj/gdwnPwBBLrGovoDABVkoO9JqK1igC
	dXTy6DN0dbkVrHAIlPpA3EADjImv6mJZ0I5Dg==
X-Received: by 2002:a17:90b:3d92:b0:3a0:f0a1:b45a with SMTP id 98e67ed59e1d1-3a0f0a1b93amr4873175a91.65.1790624962338;
        Mon, 28 Sep 2026 12:49:22 -0700 (PDT)
Received: from mail-dl2-f31.google.com (mail-dl2-f31.google.com. [74.125.229.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497604d60sm1084189a91.0.2026.09.28.12.49.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 12:49:22 -0700 (PDT)
Received: by mail-dl2-f31.google.com with SMTP id a92af1059eb24-149d5ec8e96so333705c88.3
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 12:49:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz32di+WlzohUKrfKiwUn5sb43s5VYZQM6TXFyBos90h7J6uDuetHmjtPILsQGcv99RPFJL5eHsEcQYnA==@vger.kernel.org
X-Received: by 2002:a05:701b:2301:b0:12d:f0e8:9696 with SMTP id
 a92af1059eb24-146ce1a9a9fmr12914251c88.4.1790624959572; Mon, 28 Sep 2026
 12:49:19 -0700 (PDT)
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
 <20260928184429.GE210522@killaraus.ideasonboard.com> <CANiDSCs8N-m1F7LMuerVbYF8xrBPBeVTg2_UX4p6M7g=9yz_Sg@mail.gmail.com>
 <20260928194459.GH210522@killaraus.ideasonboard.com>
In-Reply-To: <20260928194459.GH210522@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 21:49:05 +0200
X-Gmail-Original-Message-ID: <CANiDSCs4WOB7jpyXHEAjGOGYf4_69OmUW3LdpB_cxQDmfHr-_Q@mail.gmail.com>
X-Gm-Features: AclHuK9OfvkWCsRZx0tpuXdlH0HC2GbUT_-WgGorjcgEWP_YAcO-2ScTCE4VM3Y
Message-ID: <CANiDSCs4WOB7jpyXHEAjGOGYf4_69OmUW3LdpB_cxQDmfHr-_Q@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix bounds for descriptor parsing
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@skynet.be>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Sept 2026 at 21:45, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Sep 28, 2026 at 09:03:41PM +0200, Ricardo Ribalda wrote:
> > On Mon, 28 Sept 2026 at 20:44, Laurent Pinchart wrote:
> > > On Mon, Sep 28, 2026 at 04:03:15PM +0200, Ricardo Ribalda wrote:
> > > > On Mon, 28 Sept 2026 at 14:41, Laurent Pinchart wrote:
> > > > > On Mon, Sep 28, 2026 at 02:35:29PM +0200, Ricardo Ribalda wrote:
> > > > > > On Mon, 28 Sept 2026 at 14:24, Laurent Pinchart wrote:
> > > > > > > On Mon, Sep 28, 2026 at 02:10:26PM +0200, Ricardo Ribalda wrote:
> > > > > > > > On Mon, 28 Sept 2026 at 14:02, Laurent Pinchart wrote:
> > > > > > > > > On Fri, Sep 11, 2026 at 01:23:50PM +0000, Ricardo Ribalda wrote:
> > > > > > > > > > uvc_parse_control() passes descriptor by descriptor to
> > > > > > > > > > uvc_parse_standard_control() with the number of bytes remaining in the
> > > > > > > > > > buffer, not the number of bytes of that descriptor.
> > > > > > > > > >
> > > > > > > > > > Because of this, malformed descriptors could leak over the next
> > > > > > > > > > descriptor, leaving malformed data in our structures.
> > > > > > > > >
> > > > > > > > > What issue does this fix in practice ?
> > > > > > > >
> > > > > > > > Look into uvc_parse_standard_control().
> > > > > > > > Let's take the UVC_VC_HEADER
> > > > > > > >
> > > > > > > > Imagine we have a malformed control at the beginning of the descriptor that has:
> > > > > > > >
> > > > > > > > buffer[0] = 3
> > > > > > > > buffer[2] = UVC_VC_HEADER
> > > > > > > > buffer[3] => Beggining of next control
> > > > > > > >
> > > > > > > > With the current code, buffer[3...X] is parsed as UVC_VC_HEADER.
> > > > > > > >
> > > > > > > > What does it fix in practice? It avoids that data outside the controls
> > > > > > > > is parsed as part of the control.
> > > > > > >
> > > > > > > I understand that, but what does it fix in practice ? And have you
> > > > > > > encountered a device that exhibits such a problem ?
> > > > > >
> > > > > > I have not encountered such devices, but even if they do not exist
> > > > > > they are easy to emulate and use for escalation.
> > > > >
> > > > > That's what I'd like to understand, can this be used for any kind of
> > > > > escalation ?
> > > >
> > > > It is very difficult (impossible?) to prove that something is not
> > > > exploitable, especially as the code evolves.
> > >
> > > Regardless of whether or not all the bytes parsed by the
> > > uvc_parse_vendor_control() and uvc_parse_vendor_control() functions are
> > > part of the control descriptor or are split across multiple descriptors,
> > > they all come from the USB descriptors buffer and are all ultimately
> > > under device control.
> > >
> > > As far as I can tell, all this patch does it add a check on buffer[0]
> > > but has no impact on anything else. If a device can supply USB
> > > descriptors data with an invalid buffer[0] that currently causes any
> > > type of issue in the driver, the same device could supply the exact same
> > > USB descriptors with buffer[0] set to a value that will be accepted and
> > > still cause the same issue. Am I missing something ?
> > >
> > > > We could spend hours trying to craft a payload, plus extra time in
> > > > future reviews whenever uvc_parse_vendor_control() changes. It is much
> > > > safer to just enforce the correct bounds now.
> > >
> > > So is your concern only about introducing issues in the future without
> > > noticing ?
> >
> > My main concerns are that the function's API looks wrong and yes, it
> > could introduce bugs in the future.
>
> I agree there's a quite small risk of introducing future bugs. This is
> what I wanted to know, if there was an actual issue today (as in
> exploitable bugs), or if it was only a forward-looking change.
>
> > we basically have:
> > parse_field(void *data, size_t total_length)
> >
> > instead of:
> > parse_field(void *data, size_t field_length)
> >
> > btw: in parse_field we are ignoring the field_legth in most of the cases.
> >
> > I am happy to drop the cc and fixes tags if you want to consider this
> > just a boring cleanup
>
> As it stands, I think the risk of introducing regressions is likely
> smaller. bLength can't be completely off or the USB core would fail
> parsing descriptors. It could be smaller than needed while still
> pointing to the next descriptors, with the control parsing then using
> the first few bytes of the next descriptor, but the chance that would
> result in values that don't cause observable weird effects are slim.
>
> So I think we can merge this change. I'd drop the backport as we're not
> fixing any existing issue. And maybe avoid "Fix" in the subject, to
> avoid autosel being triggered ?

sgtm. Do you need a v2 or can you modify it locally when merging?

Thanks!

>
> > > > As you said, the risk to break current hardware is low. If it happens
> > > > tis change is small enough to make it easy to revert.
> > > >
> > > > > > We add minimal code and solve a family of bugs. Do you think that it
> > > > > > is a better pattern that uvc_parse_vendor_control() and
> > > > > > uvc_parse_vendor_control() have visibility beyond the control that
> > > > > > they are parsing?
> > > > >
> > > > > I'm concerned that some devices may stop working. The risk is likely
> > > > > small though, but I'd like to understand what we get from this patch to
> > > > > see if it's worth the risk.
> > > > >
> > > > > > > > > > Change the code so we pass the actual length of the descriptor to the
> > > > > > > > > > parser.
> > > > > > > > > >
> > > > > > > > > > Note that this makes the existing check more strict and some devices
> > > > > > > > > > that are wrongly parsed today will not be probed now.
> > > > > > > > > >
> > > > > > > > > > Cc: stable@vger.kernel.org
> > > > > > > > > > Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> > > > > > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > > > > > ---
> > > > > > > > > >  drivers/media/usb/uvc/uvc_driver.c | 7 +++++--
> > > > > > > > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > > > > > > > >
> > > > > > > > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > > > index e289cc71ba98..429f1ab19a2a 100644
> > > > > > > > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > > > > @@ -1248,11 +1248,14 @@ static int uvc_parse_control(struct uvc_device *dev)
> > > > > > > > > >        */
> > > > > > > > > >
> > > > > > > > > >       while (buflen > 2) {
> > > > > > > > > > -             if (uvc_parse_vendor_control(dev, buffer, buflen) ||
> > > > > > > > > > +             if (buflen < buffer[0] || buffer[0] < 3)
> > > > > > > > > > +                     return -EINVAL;
> > > > > > > > > > +
> > > > > > > > > > +             if (uvc_parse_vendor_control(dev, buffer, buffer[0]) ||
> > > > > > > > > >                   buffer[1] != USB_DT_CS_INTERFACE)
> > > > > > > > > >                       goto next_descriptor;
> > > > > > > > > >
> > > > > > > > > > -             ret = uvc_parse_standard_control(dev, buffer, buflen);
> > > > > > > > > > +             ret = uvc_parse_standard_control(dev, buffer, buffer[0]);
> > > > > > > > > >               if (ret < 0)
> > > > > > > > > >                       return ret;
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > ---
> > > > > > > > > > base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
> > > > > > > > > > change-id: 20260911-uvc-ctrl-bound-9c1940f06fc7
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
