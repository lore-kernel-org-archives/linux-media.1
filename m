Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672AE3C65F4
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787216148; cv=pass; b=EQbB/oqodw+fn5BhxPchjCwKX4Ilov2PsViKRVpEErgXDrQ/yi5BOnP0vZsR6KoUrweDylz+JTUF2oVinViSXMi7OwHCWwgv6DTETpAwxy3tWfHvhcLYhYRCzT3eGhkZj0gRvdPZXzxUqOjy/Eqo7IZgxNZX91NWzH0LIEwH2aE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787216148; c=relaxed/simple;
	bh=yq6qBaYEd8EWyUc0cX7E33WMuFA5Gh/NyidWLLeEDsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QBmFnUA2fmBtoSOSA4h0Vo6x3t8iz4V5zzBTa83S5tYKVsAfmndCrfs8NtUzcnhyHvg7x+RLVNBBPqjELe29tOLxegvIHqZw0DrqCGRn8eSzYFOtIdip+CuX5Y9RbotPG7QTyV4/1xwBWsfYI70DHYZtXNU5Rdwis4fzmTGij0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9DbdMSx; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9DbdMSx"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f904e80eeso1823640f8f.1
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 01:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787216143; cv=none;
        d=google.com; s=arc-20260327;
        b=NEq0TkFMmxzMZs0UJpxCuBFzjNy8PMhZphW01oHaeTQffd0ZKw39aIIdZFCy5mbG9P
         WfuiopiouSxXBa7RfluT5ioT/xcD4auvznJkClpCJbO+TtGkYbXgp6LoZiRVrgjotwY1
         2gCYo7NvGkpg+lyEoZph5b3cCJsMfyOHsyfOlwoc2UQRfYjehcjZyBajDKyb5yTH3LJl
         thrIDX1X6T0+Lt9ogHX6E0I+Ypsy7semysqtld5j1ZIBICLRfVIMKxbUJ7zXRT5T7wgx
         wD+XURTuXw2Jqa+l6g4cvc2CotT8rXFssfYxF8iamgoIhsxu6Btxk3MuUcOWF3uJG8u5
         NqOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q4u+NdUMNPAkV97SlmJLYtbUzZRlFDkakz/9HAp+z3M=;
        fh=Tk5Xkc+uPVqkai7hJ9PxCMIU256yFJwHziPsmuDjhnE=;
        b=ZjIQtaO/0hzRpyDayFGklp1U6h79s1YdD8qkkRZBOi5bA8rT3JuM/O3bxWNpRwUnzH
         kVUxXdL0FkE10KkZkNyuJtIWJufO4njilY3J0OCMQfOYwbzo1RWR08njt9Zlhi5nOB47
         TSk00nJkD4NW9gqKcaEZG9Bu5Zwsrlj4K5+B/xiDqEgZDteRUTFJZ8LGfOwJ8EDcfga1
         LOSBWXYfwPPRvK/KjrXs0kHhFJXHAWzd5uhbhD+jIAVctlfa0iCXcXXGMPviR3Cqdboi
         P9NUv0Loahr1ODpgR7jVPjXepXyyz0PAsFYRlsxvXIDz9XC7pxMWb+kX9risBtvTG6HC
         CZEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787216143; x=1787820943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q4u+NdUMNPAkV97SlmJLYtbUzZRlFDkakz/9HAp+z3M=;
        b=O9DbdMSxWwIsyL9H4+pXHVuf3+8Ue9IhODOEOq34AxJfMlCQunXb2QmbOR956XXEmy
         XFDOfHi019fDzX/zE1EINaUXw3nsD9zGNXQqxWevFdbTR5dFBx2u1hPishriMk7YK2jb
         fLRy7zsPjq34kP/ibu+X6Sn31+MoJEtoLjxBP90MNEs4IzEE6PPoerQQZUTRgI3IPT7H
         Bgg6bJEiZfUHJA9PaxJedpqJX8RihtqCas09tWarmGWmv7XYxQ1t0u4Itb2zi20aMngw
         Z/zekTnoeHA+Da3/gFPQZZTGzBCwIXTPP6JrJgq/ILS/xuJ6OXTgY3qwR1baxdM9EjS3
         Qf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787216143; x=1787820943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4u+NdUMNPAkV97SlmJLYtbUzZRlFDkakz/9HAp+z3M=;
        b=StdifgC8s4i6Cug3GKV1h9klk9meJkVKoNewI4QSDegnblBzZdn82QntsGWnZyUdkj
         KQixS4cTeg257WS7/cCzRF4ge/9UcaFmVJyEnLncjBfLbSzou/cDbPrznMeQADimZGRy
         jeiBmV6dB7fownEZCIAGJ5ZpzVMgk2Vrp+iqWpcdp+OVlqatl6/bKbPrym2WLDfhyi85
         Gyp8veRN8MQ+xRsr8sNNGS0DV++ydFyQecAE/8yshSW80yG36BDLDBxISzeO5wsUk9Mt
         TsNIoLMF3ScviV34M1F7qokjRQUXFIbz2dQ4HArhkyLerH1Pw5IYoORAkz5JBaG+Mbdv
         42KA==
X-Forwarded-Encrypted: i=1; AHgh+RrjNySamQo/IIHXtnSc06+hySevRuzk3oLXhFkV96nDHaF+Fpj+MpbYTiS74I20IVtf5dUnAYGSxMlnjQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lJS5MCdLpFp12/BLs8dn/HBbY6oC/FFJ4vU+qW3fkVITy5JZAJ
	vHz8q56Y0nbw5J5+P6bfTB9dgI8Q2fyIWm34YPUgWvdYxzQdwTyXquJrplOh1fCV+vsWQQjPYxh
	cSF8u87n44mj28phIHJz3hib4lN+znas=
X-Gm-Gg: AR+sD11o99hPbsMAeWy5fgs5Nr1adGa56iCbXAmw9HtusTxdxrVqg1N/ps35NKbqUKs
	UFX1p9vuDhbJd6qzV8ZVBHZL5S+h1VfnOAPzX+MQ1ApXNAmdtfaeUB6BzmZBcybicjXz7Mgo/mi
	umjtoWMXojqT6/vEx2AlWWhRfm++3T18/H0PIPPZVVZV48oK6xtuIrejP/DCCXInyLwu6w0p/DN
	EHvtHJm/61BIwoh8MNYgDFHSaiSP/dMDDsmXFy54w7avDWW3n0WKm8BUOAOH1brXk8/0Ft3x7mN
	6N0djyNvvSjXHNCzCto1/Ky/V/ZUa/oaa3mzUejjSMR1PiyVBtUu9O7gW8yE253FKzG3cVU8ewj
	qNPAUaFYpNYZEU2RYoD5DB/ps4hG92F8=
X-Received: by 2002:a05:6000:2383:b0:47d:ee9d:90c8 with SMTP id
 ffacd0b85a97d-482b1e872e3mr17978958f8f.3.1787216143464; Thu, 20 Aug 2026
 01:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819102812.2592880-1-tommaso.merciai.xr@bp.renesas.com>
 <20260819102812.2592880-6-tommaso.merciai.xr@bp.renesas.com> <aoW8O_p_DyG0P5p3@zed>
In-Reply-To: <aoW8O_p_DyG0P5p3@zed>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 09:55:00 +0100
X-Gm-Features: AcwNN1U3WRaznNUlioKHrhx5tA4kU23Omg_nTO7h7nNJohBAgFWIGrpJrMB2n4Y
Message-ID: <CA+V-a8t-cVQdB5WEkvAmGpEriyttaprfjzd+BRaN+QX9Rt-YJQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] media: rzg2l-cru: Replace has_stride with
 stride_align field
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Isaac Scott <isaac.scott@ideasonboard.com>, Paul Cercueil <paul@crapouillou.net>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 3:24=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Tommaso,
>    thanks for the update
>
> On Wed, Aug 19, 2026 at 12:28:09PM +0200, Tommaso Merciai wrote:
> > RZG2L_CRU_STRIDE_ALIGN hardcodes an alignment only RZ/G3E and RZ/V2H
> > need, as only they have an AMnIS register.
> >
> > Store the alignment into rzg2l_cru_info instead: 128 on RZ/G3E, 1 on
> > RZ/G2L, and update the code accordingly.
> >
> > No functional change intended.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v5->v6:
> >  - New patch.
> >
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c  | 3 ++-
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 2 +-
> >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 7 +++----
> >  3 files changed, 6 insertions(+), 6 deletions(-)
> >

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/dr=
ivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > index 3c5fbd857371..a2b833e2bf9a 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > @@ -361,7 +361,7 @@ static const struct rzg2l_cru_info rzg3e_cru_info =
=3D {
> >       .max_width =3D 4095,
> >       .max_height =3D 4095,
> >       .image_conv =3D ICnIPMC_C0,
> > -     .has_stride =3D true,
> > +     .stride_align =3D 128,
>
> We could use a #define here
>
I think to be consistent with most of the members of rzg3e_cru_info
raw value should be OK?

Cheers,
Prabhakar

> Apart from that, the patch looks good, thank you!
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> >       .regs =3D rzg3e_cru_regs,
> >       .irq_handler =3D rzg3e_cru_irq,
> >       .enable_interrupts =3D rzg3e_cru_enable_interrupts,
> > @@ -406,6 +406,7 @@ static const struct rzg2l_cru_info rzg2l_cru_info =
=3D {
> >       .max_width =3D 2800,
> >       .max_height =3D 4095,
> >       .image_conv =3D ICnMC,
> > +     .stride_align =3D 1,
> >       .regs =3D rzg2l_cru_regs,
> >       .irq_handler =3D rzg2l_cru_irq,
> >       .enable_interrupts =3D rzg2l_cru_enable_interrupts,
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > index b426bc7898bf..2c192d370dcb 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > @@ -75,7 +75,7 @@ struct rzg2l_cru_info {
> >       unsigned int max_height;
> >       u16 image_conv;
> >       const u16 *regs;
> > -     bool has_stride;
> > +     u8 stride_align;
> >       irqreturn_t (*irq_handler)(int irq, void *data);
> >       void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
> >       void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/d=
rivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index 27a35ef2a6df..a7b6dce66570 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -32,7 +32,6 @@
> >  #define RZG2L_CRU_DEFAULT_COLORSPACE V4L2_COLORSPACE_SRGB
> >
> >  #define RZG2L_CRU_STRIDE_MAX         32640
> > -#define RZG2L_CRU_STRIDE_ALIGN               128
> >
> >  struct rzg2l_cru_buffer {
> >       struct vb2_v4l2_buffer vb;
> > @@ -277,11 +276,11 @@ static void rzg2l_cru_initialize_axi(struct rzg2l=
_cru_dev *cru)
> >               rzg2l_cru_fill_hw_slot(cru, cru->num_buf - 1);
> >       }
> >
> > -     if (info->has_stride) {
> > +     if (info->stride_align > 1) {
> >               u32 stride =3D cru->format.bytesperline;
> >               u32 amnis;
> >
> > -             stride /=3D RZG2L_CRU_STRIDE_ALIGN;
> > +             stride /=3D info->stride_align;
> >               amnis =3D rzg2l_cru_read(cru, AMnIS) & ~AMnIS_IS_MASK;
> >               rzg2l_cru_write(cru, AMnIS, amnis | AMnIS_IS(stride));
> >       }
> > @@ -850,7 +849,7 @@ static void rzg2l_cru_format_align(struct rzg2l_cru=
_dev *cru,
> >                             &pix->height, 240, info->max_height, 2, 0);
> >
> >       v4l2_fill_pixfmt_aligned(pix, pix->pixelformat, pix->width, pix->=
height,
> > -                              info->has_stride ? RZG2L_CRU_STRIDE_ALIG=
N : 1);
> > +                              info->stride_align);
> >
> >       dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
> >               pix->width, pix->height, pix->bytesperline, pix->sizeimag=
e);
> > --
> > 2.54.0
> >
>
