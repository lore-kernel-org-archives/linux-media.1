Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794336080;
	b=2mRUZjY4JkjlT8aC9qV+OuXRVDrqKaFutH+j9Up6Y+86QtwXEGD+jvc9BHms60a0JvhM
	 GggOwTl1/TbIu28jn5Ad0+ofcAOHdHVQuG0vVhf8dQSOHYvrTYSnQjt5QSAD6/x5oset+
	 E/PJa2PRfeYxuADXFVh7S0mBf1TjsPWgVl50Nl+BVU5k2IYLEZgSM/Uz7F4vhbHwBGzf4
	 AX93sFXyb7eSWTH+ChSsxgbhO2hSa0eoocihLC9gFfjr3nDnxKr7XHrQnTb6ipvxkMmtP
	 3UFTNry0rkjbPLWhSZh2cYEM9ZIiRW5ZDU7IYH0xCodFYSb47lEBTz1e084XFuT5TSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=av4ENrPPV1tGMkw5tLRd7+RJ2zUb0Iw82xvXCZIZOuU=;
	b=yDONL6T3Bx7GX6w+1u/prFJ0loWmZPiVu5awTiROPrmaeoOoj5tOBUVFWKxmFf1mOlNv
	 ejLsvTNIr9byxi/eN5XNW5hHnW0uikJoxDqR0lSLqMdOKaup9hLc46uqUTdWZ/mT0CXuC
	 +721sJOsjNqn/XyWY/6NcJUMnVAhPdGYLeOL/IsIeq1a6BhK3jmBpVSRWHmaW+phx2BoC
	 QBKL5Wbi324ZEacu+PBpV8mnrGNBovOU/FPJcXnSQYGoOx2ZdD+bRHv629wMkqgJUObxz
	 FW/VDzHKIRYrAv8Kx6aqnNLUVjA5/4dPlDex774zr4u9gbREDugNIs9jbgNxmY1mtwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DtcS/EXD";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF0160A6F52
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 18:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAF0160A6F52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DtcS/EXD
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso18762155e9.0
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 10:41:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794336078; cv=none;
        d=google.com; s=arc-20260327;
        b=hIRQvK8N40OOv+Xe6PI2O8odJt/CdgG9UWLebVVI1RZ5ZFSwcjNaltZmD9bD5sddMN
         e2Rt7mrDQjCnQnH+1TvgK/B0e87kSuA75q2IqL7OQu14kle8XnhE9sB5k3a1AypHzSQ8
         LAxT0v8gCaNtZhzMFe0g9cP6x+co7nmAtndz7ne8RWq/Grwpr3WdB1oBoMoEftXhtFwV
         tl7GOm1HSVyNZUDP0f4sRsSm33nRIEDRVkHiYoBBPURJjhPU+OifQ64r8kIyVxi21ljE
         kYjjmwqPkak4mi4sWDtz/O7dTaSlbzJcqT89CTO4UjhAOEbR+pXCors5RKJOKM3WKWh0
         5LjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=av4ENrPPV1tGMkw5tLRd7+RJ2zUb0Iw82xvXCZIZOuU=;
        fh=QSqGzsxusVsT2Y8v0HP4Oh/FFUrQGFPwhJXcxp2utEg=;
        b=JYf5RgoRHJG8w9TKUcLV3VcB9/ypL/Ejvwg2aj0lDULg7Dq0dRSVBQHJqtY1f2EdK9
         8h16Nh+N4XfAnrYVvSIsOk+N7V65WX4kmJwGUbun5ul9mi7nmuNa0nauM1x9fHNIAx2o
         MxYHFMYFxjGFQyWnObU4OHwdYszOjp7V0ANbzir2uI+bx7qhLlMMF3XpE/pnSEKs5Ns2
         QfQnNwlDd1Y+leLi1S7TUNTn3qpLiJtkYveopjAplyb6cUe7TXL25Gz3lMo43WGmnACW
         CSyfQJ7NbrjMllp3FtCfAe20Ejum3fYMxnC94EzIhA5d6vjbI64XAAorCiL+LcAsSVgS
         UEAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336078; x=1794940878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=av4ENrPPV1tGMkw5tLRd7+RJ2zUb0Iw82xvXCZIZOuU=;
        b=DtcS/EXD9Ce+96Ky5V6gDgJEKfa8GTqySzpgPBqvf+DY8iFoulGaFbygjpNNvjG/jX
         CFeUtcWzvnPfCOu1H5kobRE8nwug+xDTEUERU4B6M59NUgrJ1evjNpEeDcVAbesU4Uyj
         hlrjUAthBeVRD8Qb4uzBlnjokI7iy/1e3Fyuye2yUNSt8i2CB4Z4gvMul/+ZeO/bUv8K
         QVZxdvamx3o4dwIWpG9m4m3Xpj6vC+K3wGn1eTjpjB0N5qY531tLbw9bNgZtJDU8qDCV
         jcfFyWlXhJQqIjO7bo+Ch/eZCNRN6Ln++xQ4tvg6vvBN7qtKqydo1aEMqufS9zaCxXtG
         94Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336078; x=1794940878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=av4ENrPPV1tGMkw5tLRd7+RJ2zUb0Iw82xvXCZIZOuU=;
        b=vORi/BlJRt0VPWCD0NIRNzXabcmkYvDTuLkneb50yV4vfhXuHzc08oMPqTi/uT/uRc
         YHzAgCU63GdOe82OqVQEpwMxkiiB9+CU9Z6R77kuzyPwC6gddXzMc25bc5Bg/nSAPjsF
         iZkO1+WGcucw/kK7/Yu21j2EteCPZDsph0iJYQLvyOG+lMLWtsQnC7FC71A5x3kGLMTt
         a1MXGmUBgf4Ar2LFpqZX1cLaYrmfpXiA4QvvEdGYCyCnvUkl4XtJg/R21rajkHueYo97
         Ugh4PIffU0SIDCERRSNL5SHyj0IDhosrh7LQwLbiV9YAnrBE2pTpABKAulFoo/XIqZ0o
         6UVw==
X-Forwarded-Encrypted: i=1; AL+hErEv3CjFtLqVzZqzVK/MXo25yfT/1Z54sQza0WxduTsRHDAjvSHfmncp0y+ilYe7TA513zoQ+4uii4EyaQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Cr6wu5lcI5fKp/0TQtDtKK3AZp5NYMU0Iz7hdW/1EoIEUj8IT
	vZY4opdgyAc7J5yOEOoGhJXVUU0XRmi22SJEOoE/FYiaGg47QQVoiejkVqGTVXNQ8zQpxD7fIbm
	OxZ2PjBDSnXEfrjRfSbp+cqfx0XtLvT8=
X-Gm-Gg: AYBFou0ZrBFTcSiA8LrTzltPC8imwiqxFGIdU6qDSs6JjXFFKkY1BN44D8pVTgnvV8p
	+b2uTcsh3hvhVwW7lXA/A32mmRCTjBQ+9IAxTGnLhLoGqPk6MUOyUxUc4rfKUYMnYzmh5gpzjWB
	IOs74ttvMwol/mW0lMaiEVuR26loDQkfO7g7Yr2OlM4/vi7G/E34YOZX6NkqSx8EN4Aq7tjwj4J
	FtPBRkk4VUAFDl17kwsgwCvpF0q4EoskQ5CZplAQqW6A5THqcYTWI6Wl3C9bru2BTMRzWqWSFlc
	NzI5FfZHXZ0kkFlO1we1IbXguWWzdN19S8Z9I6jxmj4VYIBwMIHpek9zwTrmAaRTRYNqAFebXKi
	vR5mzZCU/x2LAXYMViDvV9K2eNsZH4PTmyChqLAUk7v6ppEXMC2r7M+J9eLgnY/wAKeqAYg2p
X-Received: by 2002:a05:600c:4e41:b0:4b7:6942:39be with SMTP id
 5b1f17b1804b1-4ba0234ed60mr59966285e9.24.1794336077840; Tue, 10 Nov 2026
 10:41:17 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106074639.452630-1-nikitash.mariiaw@gmail.com>
 <cd073632-0919-4015-8daf-39cfe24391e8@kernel.org> <20261110135444.7d8070ec@pumpkin>
In-Reply-To: <20261110135444.7d8070ec@pumpkin>
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Date: Tue, 10 Nov 2026 10:41:06 -0800
X-Gm-Features: AclHuK9_7M2m4zG_NQ4qW5SK5DvtnSnNqDvZRn6nCgKPOE6JXbdQL3_rS3KQX_Y
Message-ID: <CAPDEY+X=pVsiY5cib8e_Vu3KNW0QNV6hXF+GSLs9gyD8rMXa6w@mail.gmail.com>
Subject: Re: [PATCH] media: radio: Replace strlcat() with seq_buf in TEA drivers
To: David Laight <david.laight.linux@gmail.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, hverkuil@kernel.org, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, kees@kernel.org, justinstitt@google.com, 
	morbo@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 5:54=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Tue, 10 Nov 2026 11:08:30 +0100
> Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>
> > On 06/11/2026 08:46, Mariia Nikitash wrote:
> > > In preparation for removing the deprecated strlcat() API[1],
> > > replace the strscpy() and strlcat() calls used to construct
> > > V4L2 card names in the TEA5777 and TEA575x radio drivers.
> > >
> > > seq_buf tracks the current write position and remaining capacity
> > > across appends, avoiding repeated scans of the destination buffer.
> > > This preserves the resulting strings, including truncation behavior.
> > >
> > > Link: https://github.com/KSPP/linux/issues/370 [1]
> > > Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> >
> > Nacked-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> >

Hi,



> > This is silly. Just use scnprintf().
>
> Or wait for someone to add a call that just does what is needed.
> In this case the first stscpy() returns the length (and it is often
> known).
> So you could have:
>         len =3D strscpy(buf, tea->card[, buflen]);
>         len =3D strscpy_at(buf, len, " TEA5777"[, buflen]);
> or:
>         len =3D strscat(buf, buflen, tea->card, " TEA5777", ....);
> or some variant that will do a strnlen(buf, buflen) to get the offset.
>
> But it really is best to leave the strlcat() calls in there for now.
>

Thanks Hans and David for the feedback.

I agree that seq_buf is too complex here. I'll look into using
scnprintf() as Hans suggested.

David, I also see your point about leaving strlcat() in place until a
more suitable append helper is available. I'll revisit the approach
before deciding on a v2.


Best,
Mariia

> David
>
> >
> > Regards,
> >
> >       Hans
> >
> > > ---
> > >  drivers/media/radio/radio-tea5777.c | 10 ++++++++--
> > >  drivers/media/radio/tea575x.c       | 10 ++++++++--
> > >  2 files changed, 16 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/radio/radio-tea5777.c b/drivers/media/radi=
o/radio-tea5777.c
> > > index fb9de7bbcd19..2b1c7f6ddd60 100644
> > > --- a/drivers/media/radio/radio-tea5777.c
> > > +++ b/drivers/media/radio/radio-tea5777.c
> > > @@ -13,6 +13,7 @@
> > >  #include <linux/init.h>
> > >  #include <linux/module.h>
> > >  #include <linux/sched.h>
> > > +#include <linux/seq_buf.h>
> > >  #include <linux/slab.h>
> > >  #include <media/v4l2-device.h>
> > >  #include <media/v4l2-dev.h>
> > > @@ -255,10 +256,15 @@ static int vidioc_querycap(struct file *file, v=
oid  *priv,
> > >                                     struct v4l2_capability *v)
> > >  {
> > >     struct radio_tea5777 *tea =3D video_drvdata(file);
> > > +   struct seq_buf s;
> > >
> > >     strscpy(v->driver, tea->v4l2_dev->name, sizeof(v->driver));
> > > -   strscpy(v->card, tea->card, sizeof(v->card));
> > > -   strlcat(v->card, " TEA5777", sizeof(v->card));
> > > +
> > > +   seq_buf_init(&s, (char *)v->card, sizeof(v->card));
> > > +   seq_buf_puts(&s, (const char *)tea->card);
> > > +   seq_buf_puts(&s, " TEA5777");
> > > +   seq_buf_terminate(&s);
> > > +
> > >     strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
> > >     return 0;
> > >  }
> > > diff --git a/drivers/media/radio/tea575x.c b/drivers/media/radio/tea5=
75x.c
> > > index c37315226c42..e49228eb7c46 100644
> > > --- a/drivers/media/radio/tea575x.c
> > > +++ b/drivers/media/radio/tea575x.c
> > > @@ -9,6 +9,7 @@
> > >  #include <linux/module.h>
> > >  #include <linux/init.h>
> > >  #include <linux/slab.h>
> > > +#include <linux/seq_buf.h>
> > >  #include <linux/sched.h>
> > >  #include <asm/io.h>
> > >  #include <media/v4l2-device.h>
> > > @@ -221,10 +222,15 @@ static int vidioc_querycap(struct file *file, v=
oid  *priv,
> > >                                     struct v4l2_capability *v)
> > >  {
> > >     struct snd_tea575x *tea =3D video_drvdata(file);
> > > +   struct seq_buf s;
> > >
> > >     strscpy(v->driver, tea->v4l2_dev->name, sizeof(v->driver));
> > > -   strscpy(v->card, tea->card, sizeof(v->card));
> > > -   strlcat(v->card, tea->tea5759 ? " TEA5759" : " TEA5757", sizeof(v=
->card));
> > > +
> > > +   seq_buf_init(&s, (char *)v->card, sizeof(v->card));
> > > +   seq_buf_puts(&s, (const char *)tea->card);
> > > +   seq_buf_puts(&s, tea->tea5759 ? " TEA5759" : " TEA5757");
> > > +   seq_buf_terminate(&s);
> > > +
> > >     strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
> > >     return 0;
> > >  }
> >
> >
>
