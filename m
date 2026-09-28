Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E02A4BC029
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 12:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597446; cv=none; b=ETSO9fSjU3RS/L/VViqdJVi0MyPdrgYMmFZkFTStRLzQRzbqIPP2OE4XoYU9is2u2QvQltKnL58tkeqq9aPr0eJrcxJ2rmBeylR2DvgGuaOsZ2NEuH5eDXja06T8ULScxEyQFsZ/BOLiMjUCAq/gSiXIeUycWzIfCKVGIAWIh6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597446; c=relaxed/simple;
	bh=hsmTgOXWY31yOiEwYfObS2Rz+k0nCQ4lsbwNkTGpX2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=il7nxjrPJU/eIU+7UNm+JcSunGjkpP2o8O9fxEG+oWlOoujPjzmJOZflxJ6YWKrh9nyezcZht/Qzv8km6CCZl++yLRPetXrma8TdgjlMwXW2ecCd+5PKCIFJPdl+HzEawV1GiMOl66bPHs5c1mz0F5mamloEgyDFW1JHVE94mLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y1H5em9p; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y1H5em9p"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a47d6146d1so227309a91.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 05:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790597444; x=1791202244; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zm7WiEcvZgYFQgA/86utiXIUrMSJvOJdKJld1YmBXzI=;
        b=Y1H5em9pLZNQJBnm2rtlcEJqoKJteI+XGTE7Sy1C/tdhop+9Ao/EWXOJl4R+g+NQek
         PnfV8MdAQNS46ICQgdXGOEpFEo1QXW/6YKCO5hyIiVv9EmCK61klZ48UCKfp7gLYp1+8
         2Aw0w/hU8dqV0R8jKaQD/+AOPErlRxOPznIgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790597444; x=1791202244;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zm7WiEcvZgYFQgA/86utiXIUrMSJvOJdKJld1YmBXzI=;
        b=VunXYSppIv1xTVOtd3vMFTz+1rv8stw2YkM8E7RMIcyzu8WqmYx43JbsVo1poqKleG
         ekIEKEAfwJ1jPMFr/Bq0xm1l8xyj5UA5n7v6od2x2ocxK1lSKUYeiK6vsW1PYTvVJFo0
         gVnGimfkrIFjMRRQxLQX9H7pg1uSj/NUp/xGr3yQ0nEInERZsVpI42Atmkz8FcqQYkhG
         Qdw/vKpkIEey1/MaERByqy6sGixHv79mJvAuLn4MZy210SYZk2l2patjniFRmnz9OCJj
         Vy6XNjD/wxgpvAZVoSMLbG4Ob3LGj+g4XJ5C32UryivoTK0BtHN2KtGL4vJMLUAexT/6
         +xnw==
X-Forwarded-Encrypted: i=1; AKwUvBw3wWKyyz4LilcUzceyZyxdIjDGb25IF+oT59dLuLBJPqIt4GxKUhcldRFgpQ/dcPgt95/h2B3VG18Slw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7YrAO+KZP8OQm9TOnwI/R9nnTzhM2dIvWWM7DFm6UC3diCIHc
	p1yxcIs9Ix0fqLCS3qpy5uZknyZZsT1QCK5aqXW9ewlg6Zu6QtsCIpANhPru8rR1USRiOVyqowU
	k9ek=
X-Gm-Gg: AYBFou3FhLk+F+zRcPvMJmtUoD+fKdYNmxYUuXpiPKQe7sTVF/0mQYdy2W7nHcwReKJ
	5Xea2TiO7faRy6swk/B0pF9BR4POtn+qwAqhQPrfT9+YF9HqwlDaxTzs6Oq4GJ8dX7vDcB2/HqT
	cT8q7gJcc713Q6ExBvdZP6zb3pTNHeuMNczkqSUB4Ho79oHTorE+kKgMSvBpHJi8oRZvjjbvlcP
	9rPingONPgMnDoCp9mkEXi5npSCCLRFbQINJD6ys+fr1W653dncCJLQhT4LEmMf73p4B8H2DVyt
	t+WWyHggRKcqjPPH0K3cFvydMV9AbP7N/LzlGjoOdzSdcQO4IYdz/8mYYrmt3ZxdoW8lC2CsnLA
	UxC8tlgo4Qe0ZaBEtZWPgdjjhVkTBuMPKzv+suY8UvqaiNLGc1pPg7ZfRmsT861Pll6pUE3fQKT
	er1VhYhIZ/AX70lwroV3CObAWxyenlZ2CDH1DcxnWFd/lPUHIZ8My7hzNyOjZdod5vnwtNlUhp+
	F4uE3efGWCSg8u7/3roav/rU746An+YAxatkw==
X-Received: by 2002:a17:90b:4a89:b0:3a0:c13d:8b20 with SMTP id 98e67ed59e1d1-3a0c13d8ec4mr5146064a91.31.1790597444202;
        Mon, 28 Sep 2026 05:10:44 -0700 (PDT)
Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com. [74.125.229.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9355e54sm20138830a91.5.2026.09.28.05.10.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 05:10:42 -0700 (PDT)
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04f7f2so1796439c88.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 05:10:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzuc4GsUz6sUtiXmSsirwzC0KrT3EDvKdz6GIvsMhjevsHmB4pR1DmHthxfGI5lhcMkwzjJBiNr11ngww==@vger.kernel.org
X-Received: by 2002:a05:7022:689b:b0:141:aa71:6e02 with SMTP id
 a92af1059eb24-146ce2a0f65mr14559278c88.2.1790597441109; Mon, 28 Sep 2026
 05:10:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-uvc-ctrl-bound-v1-1-7b5cfc68bae1@chromium.org> <20260928120252.GB4406@killaraus.ideasonboard.com>
In-Reply-To: <20260928120252.GB4406@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 14:10:26 +0200
X-Gmail-Original-Message-ID: <CANiDSCv5pd-3aO0Eb1-rvsAOGNpB4rhpjtnTosU6Ca+xBxN1qQ@mail.gmail.com>
X-Gm-Features: AclHuK_-lgmEmOmfxcxZ6_9uVZ5ilRo7HifkMu9cud87ufINOQ3FYQtiYfguUNg
Message-ID: <CANiDSCv5pd-3aO0Eb1-rvsAOGNpB4rhpjtnTosU6Ca+xBxN1qQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix bounds for descriptor parsing
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@skynet.be>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent


On Mon, 28 Sept 2026 at 14:02, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Fri, Sep 11, 2026 at 01:23:50PM +0000, Ricardo Ribalda wrote:
> > uvc_parse_control() passes descriptor by descriptor to
> > uvc_parse_standard_control() with the number of bytes remaining in the
> > buffer, not the number of bytes of that descriptor.
> >
> > Because of this, malformed descriptors could leak over the next
> > descriptor, leaving malformed data in our structures.
>
> What issue does this fix in practice ?

Look into uvc_parse_standard_control().
Let's take the UVC_VC_HEADER

Imagine we have a malformed control at the beginning of the descriptor that has:

buffer[0] = 3
buffer[2] = UVC_VC_HEADER
buffer[3] => Beggining of next control

With the current code, buffer[3...X] is parsed as UVC_VC_HEADER.

What does it fix in practice? It avoids that data outside the controls
is parsed as part of the control.


>
> > Change the code so we pass the actual length of the descriptor to the
> > parser.
> >
> > Note that this makes the existing check more strict and some devices
> > that are wrongly parsed today will not be probed now.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index e289cc71ba98..429f1ab19a2a 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -1248,11 +1248,14 @@ static int uvc_parse_control(struct uvc_device *dev)
> >        */
> >
> >       while (buflen > 2) {
> > -             if (uvc_parse_vendor_control(dev, buffer, buflen) ||
> > +             if (buflen < buffer[0] || buffer[0] < 3)
> > +                     return -EINVAL;
> > +
> > +             if (uvc_parse_vendor_control(dev, buffer, buffer[0]) ||
> >                   buffer[1] != USB_DT_CS_INTERFACE)
> >                       goto next_descriptor;
> >
> > -             ret = uvc_parse_standard_control(dev, buffer, buflen);
> > +             ret = uvc_parse_standard_control(dev, buffer, buffer[0]);
> >               if (ret < 0)
> >                       return ret;
> >
> >
> > ---
> > base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
> > change-id: 20260911-uvc-ctrl-bound-9c1940f06fc7
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
