Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD557283FD4
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 12:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598949; cv=none; b=CD8pG40i43cka3LtoRSFNjG+VEmadkRHW9mrceCUmAcIpoLcvRG+IbcBeR9A7L5DDDnwgvS+SiqmUDxv4N3GYwR8zDciIYOr3Kvkcdjjt++n5NbDJS2mVbBjCsHsK14vdia58U8xp7rl262sPJxMhb531+7vdTYDVZ4jsie3Ofs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598949; c=relaxed/simple;
	bh=73vKtw6aDU7dW85iYUC8zer7SLZnvtJKJF+MDMclS40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/f3VGpv8eQoiu/Trnxq1vtzljh+RSeA7W8C1saQpnwrXxx2Co/gqrr54Gv+8Cz/GP6OXh7d3toowsWJICfJ0PV37thsmvK+2rZAEZwMPyE05K+Ou/rTqi2GBsM9LMBvxHUVg9zaBxmQMS7KUCcDtpHTzeNal9hL2A7uVc/2HQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ecFuww7Z; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ecFuww7Z"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0f64df6a6so679199a91.3
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 05:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790598947; x=1791203747; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OGOKZcnbtkuor5V4UVqa15Vs2El3sc7IIltQAs0Fj2I=;
        b=ecFuww7ZkbH/yNJkslU60G6I+NcyP1qywJkghAk654c0tdEM2Sclp4bSqfWwrwGbeW
         rXjiCCsMV0YBabDoU6yhZnS50lC4gS5rYDjpMUfYy6a6v5pFZgWkMmM5Yap+4RNvkcfx
         mNxLuHlkNI1dtKGZ3r0R/qKL7i9uSUhU4++Ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598947; x=1791203747;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OGOKZcnbtkuor5V4UVqa15Vs2El3sc7IIltQAs0Fj2I=;
        b=R559NgUXR7KvRar7QtGjkStbdHae9SxltcwrUtimLhqUZ+rIZcUf7fNcq+NYQEIgkl
         J7tZSXnGkM7utTm3pyUG5E5qmEUHhVZGnjbLabIzAGBi5YQ6KxibArigSlyvrUuD2Ws0
         k+oabhn9dCStxx0DO3TbNAtMLluCTbiAYhgektMiPq/I9rbPvCXbNdakRnUXg5fhJrtK
         pWFPDRV4NsGVZ3Ja9PHeYyQ1DUym4FomysTkpBeoHcVxOKwLZcpI/TQ5ScKNh9y5MyNz
         St7SoMOGqpMU5vxNPjEHa9pCPaZjmRVJ++EZmUTwQHJoZG6atPvzsXDzKt62XHkQOO/2
         qbng==
X-Forwarded-Encrypted: i=1; AKwUvBzBOPTuONxaUGfIiWcoCAM9EdcnBCY+j4gjcC10khkt4IqoG/0GZpSxh3elkUUF4zgzZ4thRVV8ZHGxaA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKC9zAXxatt/hH02Tx6c8pAySEIuEA2m7Mf+p0eUjS8OJvgn2XB
	fotxUYnFBLq1OgD1R5uB0+s4MZLZeY2EPQkQ9uwHpCKC76OP5EKuhtXRFcUq5Z2hfTcO/moMgoq
	Oy7U=
X-Gm-Gg: AYBFou2sEnXMFrDTZ2F9Z6NClDp9zXCSJMu6Ytx87+7H8Rg0uGr54ha6+QguZ+lRzeU
	l8NOIJBvGsfOgP44zhLFShx+0zXU0zs7uA4SviG4P+UVOuZqRwH7YR4PcbszxcErtrwY69a6ip9
	HNQrKbOs2PKXZNrtrpsoW6Tmxk5efCKQ6hbTQmYkTyNQSkN4QvVLzZ3DiJr3eeTyfuA+rtJBMzi
	QH1nxxEASHQcOR/fRDq94vTtjff610D27pe2uXGXxrU5k78j5E8CbGE2lskphz8laPj+quLsGR2
	OfiGjV90gyDl/JVBGCEUommAvD/+26UdI13yK9fUPANquP39sEzd/eBD1rbT5tTFRbaLIVz0O7a
	GTWG8QOrNcUme3eCYmKkSUfaHTAroy45o74H/pRtfdEMLFSr0OV8LrKkOXmMkLM3YW1OMaarPNH
	qlxNSf3I45rXqM8yxdt+upgC+BYvYOJ1MBA8OpnAkTK1O+wSLXxpLabbH5G32mgrlgphdsoFhS9
	IMfd5B6btYx2HNRXtBogOBT5kifT1elE7Cbxlk=
X-Received: by 2002:a17:90b:388c:b0:3a0:e7e7:69a9 with SMTP id 98e67ed59e1d1-3a0e7e76fc9mr4699516a91.29.1790598946794;
        Mon, 28 Sep 2026 05:35:46 -0700 (PDT)
Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com. [74.125.229.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b94936ddsm20595023a91.7.2026.09.28.05.35.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 05:35:46 -0700 (PDT)
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144e32aaa1cso1656913c88.2
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 05:35:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxB7kmYXZdY45l3D2a/yTgjHI+zYDxd5FJEu4ANTYcMnYoKSub/MCqGaRNPdlBOOzObuFISDdbu5+I9Pg==@vger.kernel.org
X-Received: by 2002:a05:7022:b059:10b0:143:298e:459f with SMTP id
 a92af1059eb24-146d096cf16mr9764812c88.42.1790598943539; Mon, 28 Sep 2026
 05:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-uvc-ctrl-bound-v1-1-7b5cfc68bae1@chromium.org>
 <20260928120252.GB4406@killaraus.ideasonboard.com> <CANiDSCv5pd-3aO0Eb1-rvsAOGNpB4rhpjtnTosU6Ca+xBxN1qQ@mail.gmail.com>
 <20260928122450.GA166131@killaraus.ideasonboard.com>
In-Reply-To: <20260928122450.GA166131@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 14:35:29 +0200
X-Gmail-Original-Message-ID: <CANiDSCuBFLYXFbq7Vox7AhdhftfzC9Ga6FKL-2F1o08cHQjoAA@mail.gmail.com>
X-Gm-Features: AclHuK-QPMoirQ8WWBZFkgJeJP3t1AaILGIrQSKW8AmLJATjcu8qyr8-bswBwxQ
Message-ID: <CANiDSCuBFLYXFbq7Vox7AhdhftfzC9Ga6FKL-2F1o08cHQjoAA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix bounds for descriptor parsing
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@skynet.be>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Sept 2026 at 14:24, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Sep 28, 2026 at 02:10:26PM +0200, Ricardo Ribalda wrote:
> > On Mon, 28 Sept 2026 at 14:02, Laurent Pinchart wrote:
> > > On Fri, Sep 11, 2026 at 01:23:50PM +0000, Ricardo Ribalda wrote:
> > > > uvc_parse_control() passes descriptor by descriptor to
> > > > uvc_parse_standard_control() with the number of bytes remaining in the
> > > > buffer, not the number of bytes of that descriptor.
> > > >
> > > > Because of this, malformed descriptors could leak over the next
> > > > descriptor, leaving malformed data in our structures.
> > >
> > > What issue does this fix in practice ?
> >
> > Look into uvc_parse_standard_control().
> > Let's take the UVC_VC_HEADER
> >
> > Imagine we have a malformed control at the beginning of the descriptor that has:
> >
> > buffer[0] = 3
> > buffer[2] = UVC_VC_HEADER
> > buffer[3] => Beggining of next control
> >
> > With the current code, buffer[3...X] is parsed as UVC_VC_HEADER.
> >
> > What does it fix in practice? It avoids that data outside the controls
> > is parsed as part of the control.
>
> I understand that, but what does it fix in practice ? And have you
> encountered a device that exhibits such a problem ?

I have not encountered such devices, but even if they do not exist
they are easy to emulate and use for escalation.

We add minimal code and solve a family of bugs. Do you think that it
is a better pattern that uvc_parse_vendor_control() and
uvc_parse_vendor_control() have visibility beyond the control that
they are parsing?

>
> > > > Change the code so we pass the actual length of the descriptor to the
> > > > parser.
> > > >
> > > > Note that this makes the existing check more strict and some devices
> > > > that are wrongly parsed today will not be probed now.
> > > >
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_driver.c | 7 +++++--
> > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > index e289cc71ba98..429f1ab19a2a 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -1248,11 +1248,14 @@ static int uvc_parse_control(struct uvc_device *dev)
> > > >        */
> > > >
> > > >       while (buflen > 2) {
> > > > -             if (uvc_parse_vendor_control(dev, buffer, buflen) ||
> > > > +             if (buflen < buffer[0] || buffer[0] < 3)
> > > > +                     return -EINVAL;
> > > > +
> > > > +             if (uvc_parse_vendor_control(dev, buffer, buffer[0]) ||
> > > >                   buffer[1] != USB_DT_CS_INTERFACE)
> > > >                       goto next_descriptor;
> > > >
> > > > -             ret = uvc_parse_standard_control(dev, buffer, buflen);
> > > > +             ret = uvc_parse_standard_control(dev, buffer, buffer[0]);
> > > >               if (ret < 0)
> > > >                       return ret;
> > > >
> > > >
> > > > ---
> > > > base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
> > > > change-id: 20260911-uvc-ctrl-bound-9c1940f06fc7
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
