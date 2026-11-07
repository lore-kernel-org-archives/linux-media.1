Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794025926;
	b=vMtrNwxoO0bWfO5PU1Dtc46KpePuHrCzcHPaIOUFFrRcLUViTN0peQQ9CtPthvfVzrip
	 dTjWzex+vDoJG41LmwEIfLctvGHTBUPuTTck/J1X3VO9n+3NmDyuubbWdIpBzLPO3LlDr
	 ySxD/O0+sP6Oq3pZ6DjhtJu8a/Uv3vu41XgMYAToSqIaY9N1e9m+JQ5NiuviTvIeD05Jf
	 niPr62VSQptOpF0xZWaE1mxtHwSG/HLY3lbowQFeAGM4taOTKsJBlCbMbXZ5d2+ctU+W4
	 9Z1gvkJwFyILMm7Izf641wpw7WqgsN2DI6oNZd+7aaMqwdVxtdn80xJGs60XDvsli0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794025926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UXb4T+4yF65d01rXW8bhdUP5pOZHT/ojuN1hL7c/AAM=;
	b=Kr6+rpxZ98816ov3bejmkh11kw+5G2oA7agOErsAK5zxj/WCu6nrvyhXL7S6FOx+gCOt
	 T+D5ZaQzDorVcKVr+lCx9G4avR1ggD8oUd8Cx23TGIInTBVPJe77HS+ntOE4cqYMn+FPb
	 KQzF5706CtsfpKrHkFtIhxthlQHAmIlhGMTZalej3gtND0oB3rjfkrv1nD3DcrDP8awZd
	 qApAziTm3IydEM9RumgwfltMy/d3y28qthLmCNdGAvj4CyBy0h7fdnOp58uCIzPz1S3l9
	 fiFaw1qqBFt5C1mQeXEzP84teMQvNBJwEAJhP4yQVSWks3EFWedpM3UC/KxbqH5WUDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lhTcNhgU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A88F606A32E
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 04:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A88F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lhTcNhgU
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491846221ffso1144929f8f.3
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 20:32:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794025924; cv=none;
        d=google.com; s=arc-20260327;
        b=MQWlybTJbQpaRO836ctztCSsOf2bGaDYpa+a86QwjHWCOxT1DjY6qRLNywwwDzPvYz
         WBMPlQ91TM4KUj0gWjZbMxf1o3OejOxmrNs1q/hD/kugsasUpKS62++QhNFz14JQgvLK
         SFNphZa4to1yrYPmzsB5ahEylkKG/gz2/yjAoxOBeA5KxvTD/tW6thdYGqEuKLEJdEfx
         FWh35YIHJNHucF2wtJMO2Xka0fivLBNC4xtT2FHzEcQuqcgK76FPfDI9rdfI4+ggZnUV
         NQDLcDp5sWPFbUMYMNzTF94tVCIq6R3War+T5mcY2h0VL1CFzfxRo0ZssmG50W96r/j/
         qzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UXb4T+4yF65d01rXW8bhdUP5pOZHT/ojuN1hL7c/AAM=;
        fh=x8/GirkP6jDo88+HvGOC4MU0slsL/7pnslltYmJqCuU=;
        b=fbjp2RwZ4mx81Ez/pdvB/2bByaCrRYs3XNek+VkoACg0jig0TC4P1RxeV39QsLRXin
         +cO2TEyH/U4eki+5OA9WkEZOqLhqgHHIHs2YVqRhWV/N/Z7LdyRHbpehLxBitQBcdPNA
         kyhwnvoKLr95jLaUUwJa6bgsPxmqQpGK+rMka8aLF4kLMx23sZo+jbHQcyLDNfj/3QDV
         9tXleLU9CXh3L4d9h1Fd2a4RnHhen/mxm3o9UdMiZ3kDmocBw0bjkrRdJQGp7QSi2nlX
         xDu1DYeFG6Ozj+eDjLEvGMWEanFhAtrFjHBf0GuFG0tdZDuhJ3QpkivsbNEpoDhBAQe1
         tzvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794025924; x=1794630724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UXb4T+4yF65d01rXW8bhdUP5pOZHT/ojuN1hL7c/AAM=;
        b=lhTcNhgUGZGmJscgsQiceRcIbM98qm6Vd0daoPOmsUQVvGAQgB06t4miVd5d7husrA
         ZbCUcz2UrGZeDVRNgZsY/UON1EO3fd5xoug0eFrej8XtNl+VGBszzcyA1t7K7G1nQm/i
         rE/5xon8hFZUYlMs+wL17SN1xbvkSQvwXcTRaXmaIrCt30Af/D0p2VpOo0qSXXh7dzFw
         q+PbVwvJEdCywa/JQ/ESWJX48o3rVt5NvO3WuwMgZKVQS9/SYH35CghdXXCbGpH8LBUk
         ZEdmIgjRABhyXs4RbSCr7HSJTNcodLK6Lpg8ZhcJSNC8ohtxM2an5jqgmdYDMCxSResM
         ROAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794025924; x=1794630724;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UXb4T+4yF65d01rXW8bhdUP5pOZHT/ojuN1hL7c/AAM=;
        b=BFrg85JxHHt7zYnXQtSZ85oqj6/SeAnHXy6c1qajTY7rAXMjl2KnlSHnhMJYTAWFCh
         SBLYar2nMGoQe4Xk8Lf5rQVFUgTL6o4psVyYgDjtf/6neApFxyHvfpYHhIOCp7xlWs1V
         AU1NhAjVmDs54M8Z7O3ayrCIFnCgyQKhrW3rXccT+igBH3jfK9zCFQFWEuKNdkvqM9W4
         yi2PeAR6gIcv0S2clDcqYECDLF5lBK40X1A18ToxNHgyCZNOGaRDimOLL7sLrFLLaX1A
         ynrK+jXX35Lh+LEs9JDayv6iwrSdw5Etz8gM84iI4nd9V/+YrXdKZtNWt+gn69ahRLvr
         WXuw==
X-Forwarded-Encrypted: i=1; AL+hErHrbkUHWaeuYpa5/QLUIVLhPvU72/gLLtf1B2LmJRX8hRRIovLLd+jPMJIoqkIB+OplBG0bT/D0S+5Zsg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8xW3EX8z/GdP+q4tnJkqyTdaLa7fbAJ1ZoS8XPBUCH0taRYgfx
	QZaj2tVybSSIAGS8yZzr2fb8X2ATyntOnS3z7yLDBTpP8xnBltOVHut69HMgLXYs4g7oMvOmO8Z
	urpbBMoR2rvgXyx0YFTunmZTb79V6S/X0FcFdQC0=
X-Gm-Gg: AYBFou1NWW1bz9aGpsTOsKB1qh53JdQy+pUoBe/J0xP3rOUhVjo7JEajbbq3UCWWnHV
	pGkjYXEyqrH80Mm0SmR1RRSXSuEg2/q2zObVb3vmoeMOEjonkJywVVUfJuFmQ+Lpclxy50e3SoM
	AqkUU7V06ezHDNoH90WjPA/IVlUsK1RQa4r+yTMjam+aburk8UycPXjhw+s451JXl5FXRR5nU3X
	oJvFl+CYReFUuwHqarzHwfjJyuGjoXH8+48+8FbDrDj37yRguqbhq31JEA9QoENdn+0QTVmqLQ5
	GtzaeTloLFYSE5UcJdMaccsIR2g0zTl2Ba7qxcA0BbIjwoTuiGkA77XH26CpN2mX2O0U/zq0Xr/
	GSnT0QR++SgFrlPVkn6Vv22p4k76IuuRnSAO6PLweejE7KqUSAL9XqdnhIJu5M6X8JdP/epg=
X-Received: by 2002:a05:6000:2c03:b0:493:28c4:331e with SMTP id
 ffacd0b85a97d-49328c435cemr5949999f8f.28.1794025924400; Fri, 06 Nov 2026
 20:32:04 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106074639.452630-1-nikitash.mariiaw@gmail.com> <au2uDjVhB9232IuB@devuan>
In-Reply-To: <au2uDjVhB9232IuB@devuan>
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Date: Fri, 6 Nov 2026 20:31:53 -0800
X-Gm-Features: AclHuK9rBZ-IeP-aPeV2Q8ycPShnWIqSPPLruBPolqxGt1zwis9sIKCEuFaBges
Message-ID: <CAPDEY+Wa2+zxSVz8fewXDP78eA8-3ymAKurXuvB1Dhx7heLMiQ@mail.gmail.com>
Subject: Re: [PATCH] media: radio: Replace strlcat() with seq_buf in TEA drivers
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: hverkuil@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	kees@kernel.org, justinstitt@google.com, morbo@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 2:39=E2=80=AFAM Alejandro Colomar
<alx+linux-hardening@kernel.org> wrote:
>
> Hi Mariia,
>
> > Date: 2026-11-05 23:46:39-0800
> > From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> >
> > In preparation for removing the deprecated strlcat() API[1],
> > replace the strscpy() and strlcat() calls used to construct
> > V4L2 card names in the TEA5777 and TEA575x radio drivers.
> >
> > seq_buf tracks the current write position and remaining capacity
> > across appends, avoiding repeated scans of the destination buffer.
> > This preserves the resulting strings, including truncation behavior.
> >
> > Link: https://github.com/KSPP/linux/issues/370 [1]
> > Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> > ---
> >  drivers/media/radio/radio-tea5777.c | 10 ++++++++--
> >  drivers/media/radio/tea575x.c       | 10 ++++++++--
> >  2 files changed, 16 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/radio/radio-tea5777.c b/drivers/media/radio/=
radio-tea5777.c
> > index fb9de7bbcd19..2b1c7f6ddd60 100644
> > --- a/drivers/media/radio/radio-tea5777.c
> > +++ b/drivers/media/radio/radio-tea5777.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/init.h>
> >  #include <linux/module.h>
> >  #include <linux/sched.h>
> > +#include <linux/seq_buf.h>
> >  #include <linux/slab.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-dev.h>
> > @@ -255,10 +256,15 @@ static int vidioc_querycap(struct file *file, voi=
d  *priv,
> >                                       struct v4l2_capability *v)
> >  {
> >       struct radio_tea5777 *tea =3D video_drvdata(file);
> > +     struct seq_buf s;
> >
> >       strscpy(v->driver, tea->v4l2_dev->name, sizeof(v->driver));
> > -     strscpy(v->card, tea->card, sizeof(v->card));
> > -     strlcat(v->card, " TEA5777", sizeof(v->card));
> > +
> > +     seq_buf_init(&s, (char *)v->card, sizeof(v->card));
> > +     seq_buf_puts(&s, (const char *)tea->card);
> > +     seq_buf_puts(&s, " TEA5777");
> > +     seq_buf_terminate(&s);
> > +
>
> Why are the casts needed?

Hi Alex,

I added the casts to make conversions from u8/__u8 to
character-pointer types expected by the seq_buf helpers explicit.

I'm also considering simplifying these two-part string constructions
using scnprintf() instead. Would this approach be preferred?



> Have a lovely day!
> Alex

Thanks,
Mariia
>
> >       strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
> >       return 0;
> >  }
> > diff --git a/drivers/media/radio/tea575x.c b/drivers/media/radio/tea575=
x.c
> > index c37315226c42..e49228eb7c46 100644
> > --- a/drivers/media/radio/tea575x.c
> > +++ b/drivers/media/radio/tea575x.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/module.h>
> >  #include <linux/init.h>
> >  #include <linux/slab.h>
> > +#include <linux/seq_buf.h>
> >  #include <linux/sched.h>
> >  #include <asm/io.h>
> >  #include <media/v4l2-device.h>
> > @@ -221,10 +222,15 @@ static int vidioc_querycap(struct file *file, voi=
d  *priv,
> >                                       struct v4l2_capability *v)
> >  {
> >       struct snd_tea575x *tea =3D video_drvdata(file);
> > +     struct seq_buf s;
> >
> >       strscpy(v->driver, tea->v4l2_dev->name, sizeof(v->driver));
> > -     strscpy(v->card, tea->card, sizeof(v->card));
> > -     strlcat(v->card, tea->tea5759 ? " TEA5759" : " TEA5757", sizeof(v=
->card));
> > +
> > +     seq_buf_init(&s, (char *)v->card, sizeof(v->card));
> > +     seq_buf_puts(&s, (const char *)tea->card);
> > +     seq_buf_puts(&s, tea->tea5759 ? " TEA5759" : " TEA5757");
> > +     seq_buf_terminate(&s);
> > +
> >       strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
> >       return 0;
> >  }
> > --
> > 2.43.0
> >
> >
>
> --
> <https://www.alejandro-colomar.es>
