Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8B34BF920
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 13:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602360; cv=none; b=nAxVCL6p80Lo+Dp8Hc1LaIldDihatfpTeRHC2AB5wiwk35DGkh/xjnF96kHafIl5JaVAWft0Ta0Zhg3xLtpfEyxy5bhn71IXs1tFweTXbAEm813Cz3ga8HXaWrtNu47eQEeWPhWYzFCc2vmd+nOPJtjQQC6Y08tI1FXwQ/MWihQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602360; c=relaxed/simple;
	bh=MVXQTin4/5A0iVla6oq+dFiBBhZi9Q2530/0uafB2Eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tl7A4XhW5yqt4pMng0KLszIiqKp1KObHclpOiAWnqAtSPE+9AeoZF3WhJZLipnKcozwlTA/c4BcAIETZJwB+L8mIADH8PCqEYys9cAqocqbu0VqidzaS2Oq77lh8W0rtCzamPlbiCMcaFSrAQtMFrY5vze2BXNPEYHWhzawkqr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YjEEIvPe; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YjEEIvPe"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a2adb9bc3cso676097a91.2
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 06:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790602358; x=1791207158; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjW5WSrKHWZBlf6PacnfszCDiPshVdQjSexGrtbbzg8=;
        b=YjEEIvPeS1rTTM7TH5ZRNvjHR0ZyrZPuJv1W3H1Kmz8MiE7rxYmXrjotuHciOE8i/Z
         SyCFt1/4k5Gen49wE0ILTduyFFEHzqgertljQszaXZr90WxuAtwxf/ryuhBXiTgZ1j/x
         zt3FJBl2/g3bTgJIG+9++NPNP0njfTltBnDS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790602358; x=1791207158;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kjW5WSrKHWZBlf6PacnfszCDiPshVdQjSexGrtbbzg8=;
        b=gym06E+HwA6J+6+8MXdeBI7NZHd8ZceyuLVnhgRWb4u8PfVnQhXiuueyN+oxrwS8ZX
         fNYY2u9ADBonlq3X8UVEWw5cQIjF04NYbLW7NCC/4uTcl77D+nnX0tIpJbLbAisqLNPV
         Kkcarcil6jvA4iUXFu/JBUFSnruhKolfnFTK41Rrlly1DkAQh10zBjSfR6FSoLM0MpCu
         0aWITPIUum9haj2P84xmFKGFG/+eBLOzVCUlUesIZyM300LaaZMs85yYCXbG6AZ5Y426
         A8oPC5sqbnj38HZ5fX7cURLI8XEm+dNh48mahYMxe+z4Qm2t6M+YmBVJZEt0S0LtIJvS
         FMSA==
X-Forwarded-Encrypted: i=1; AKwUvBxFt3xJVMuTLqjSlZc4o2qumlPB277FC8Rof9jtSrKODIcGm4HZPLAyrOIFBPUbp0ZcNUl2y2V8W5gvNg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIspQw3j/3j+HRSUiuvtHwlbq5RdiQSAyBFd938awm1j9T/3IFU
	aq9jhBAIMgzuzjX3CR3imPFYmBewwFZ84A8jLC6HmUXMWqlc/m/cSf7fqb8mQi5vXy6PjPqJA5o
	bbRE=
X-Gm-Gg: AYBFou2hxrjoqiJMmMUcQqpnLttcr0vt0UqzC4zofjZEMfleStMXxeS2J0g48UZWYpG
	HQEx6NJOhZHcVv2f5qXNUL9j2KgUF1HISp+K2XI/Dq/1qHPweZJqD9j7CD6GgLAo09ot09uxFQj
	lCXD7yK6bZLyNRRWb8MYW3TcUxhBpeIKGJox3XH2J0WEmRB2WSUOtnL2re6bGzsgmLgmq9l7tAo
	37gVfavqzJTwgm49QLnCkH/F/ch41EcJmwhZqx3XEc8aT+J3HAMe+kPFkvD8afXUhkYDV+Q61cf
	IBoHBIrN0v0NkR7DQM0+5a5O6voYK/jrU6LlJ8b3z25hEuHdLfe3uWBIpjwyB3Kw72EDQBbNgw7
	wG7d+D+QK/iJlOsIkuITHO7r3yDDBT6fb0PvQq4DBS78X/HQVHRmu5IwROwmvLM4NsLiOW1li91
	MhAMRD4qUywGJhg4aykBBK5tIxTTo/pnViAPOFQyHm2N+WJnIRPB2KKiDq4c4HpIDb7gp8fYOIx
	hXSZ0Zsfywcp5Di3oZKHO26zdA4CNkK37N3Yg==
X-Received: by 2002:a17:903:2f50:b0:2dd:c0ff:e72a with SMTP id d9443c01a7336-2df7dff64ffmr95316545ad.60.1790602358057;
        Mon, 28 Sep 2026 06:32:38 -0700 (PDT)
Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com. [74.125.229.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9144b527sm41771185ad.66.2026.09.28.06.32.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:32:37 -0700 (PDT)
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1438f55921fso770457c88.1
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 06:32:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByURgaKD5n/vd1+0TWFXHcVvXjp8m1VAN7toNsTnDoHhE9f4NouTxcDkqv4j/S7SI0IpaaTBRqXxf5FsA==@vger.kernel.org
X-Received: by 2002:a05:701b:428a:20b0:144:c128:4c4b with SMTP id
 a92af1059eb24-146d077b8afmr9195740c88.36.1790602354542; Mon, 28 Sep 2026
 06:32:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903081145.8382-1-rh_king@163.com> <CANiDSCsqZzFY+KMKGBg06vm6rGR4FMy63hd0HShiHfb+vpqyqg@mail.gmail.com>
 <20260928132407.GG4406@killaraus.ideasonboard.com>
In-Reply-To: <20260928132407.GG4406@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 15:32:20 +0200
X-Gmail-Original-Message-ID: <CANiDSCt8kntjSh4TWFb4N-DxwEpsbqtUUTtNJ-hOuGRofz791A@mail.gmail.com>
X-Gm-Features: AclHuK-PdmlYvMLhbLcHdOUIGOFXJv-QPERf5awH97_XGN5zm6QhE19yXB4erPY
Message-ID: <CANiDSCt8kntjSh4TWFb4N-DxwEpsbqtUUTtNJ-hOuGRofz791A@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Add quirk for Luxvisions RGB Camera (30c9:0122)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kean Ren <rh_king@163.com>, linux-media@vger.kernel.org, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Mon, 28 Sept 2026 at 15:24, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Sep 04, 2026 at 11:15:15AM +0200, Ricardo Ribalda wrote:
> > On Thu, 3 Sept 2026 at 10:58, Kean Ren <rh_king@163.com> wrote:
> > >
> > > The device binds cleanly but delivers no image data; USB autosuspend is
> > > suspending the streaming endpoint. Disable autosuspend for it.
> > >
> > > Issue found on Lenovo ThinkPad X13 (codename Zelda, Intel); confirmed
> > > working with this quirk.
> > >
> > Link: https://lore.kernel.org/linux-media/20260904090751.1814783-1-rh_king@163.com/T/#mf5306ef689ce38ed331a3098272cb0ac2588ed79
>
> When linking to the original thread on lore, the patch.msgid.link domain
> is preferred (see Documentation/process/maintainer-tip.rst). That would
> be
>
> Link: https://patch.msgid.link/linux-media/20260904090751.1814783-1-rh_king@163.com/
>
> Did you mean to specifically link to the descriptors though ? As they're
> in the same mail thread, I think the link to the patch itself should be
> enough. Do you prefer otherwise ?

I wanted to link the usb descriptors. I'd rather have them copy pasted
in to the commit message or with a link to lore
(For the usb descriptors I think the doc says that we have to use lore )


>
> > > Tested-by: Kean Ren <rh_king@163.com>
> >
> > nit: I think we do not usually add the Tested-by: tag for authors. We
> > expect that it has been tested :)
>
> Maybe we shouldn't :-) We merge plenty of code that hasn't been tested
> by the author, a prime example being API refactoring. Actually, reading
> Documentation/, I can't see anything that explicitly approves or forbids
> a Tested-by tag from the author.
>
> This being said, for driver patches like these I would certainly expect
> the author to have tested the change.
>
> > > Signed-off-by: Kean Ren <rh_king@163.com>
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index e289cc71ba98..32bf353013a1 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -3216,6 +3216,15 @@ static const struct usb_device_id uvc_ids[] = {
> > >           .bInterfaceSubClass   = 1,
> > >           .bInterfaceProtocol   = 0,
> > >           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> > > +       /* Luxvisions Innotech Integrated RGB Camera (Lenovo laptops) */
> > > +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > > +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > > +         .idVendor             = 0x30c9,
> > > +         .idProduct            = 0x0122,
> > > +         .bInterfaceClass      = USB_CLASS_VIDEO,
> > > +         .bInterfaceSubClass   = 1,
> > > +         .bInterfaceProtocol   = 0,
> > > +         .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
> >
> > The quirks are sorted by vid:pid. Sorry I did not notice this before.

Can we please add this to the CI? It is a bit of a waste of time to
manually verify that they are properly sorted

>
> I can handle this when applying.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > >         /* Intel Realsense D435i depth camera */
> > >         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > >                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda
