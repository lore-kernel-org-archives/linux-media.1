Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B9A34E777
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 17:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790874250; cv=pass; b=oO5wr1bjNaUQ/GCiVC0kHjY9WZKkbHzjyTsxwIwtZINnmigZulUFQualUJDzzLP7e8+YLtovLOJ/CqRXmm0x7zL2hbk+MlSp8kiZePpgPC7A3X/GlgKQyaH54M8SsuNm0pmv2o3i6BJGmuKQsE6YW9Dmha6dQ+aKxk7P9d4VVNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790874250; c=relaxed/simple;
	bh=byLBT7HDFqr69hS5GMj7sfJ5ssvj5rFdRAKLw+o47Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyY3NwJESsOqe3WTlIZ81jz0gULrzrb+t89ELxQCimykeYzq69ZeotTOEiph85BqQkF2HF76G4ULEe7+32W2cl7qU7ad3wrFZbrPg8+12kBMmKVShQlOkaCYr3zf38cYa+d8fmXwzmIeFnLGedJLIwGDxUU5wf4r+l+wxI+EGaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=GTSMN0Dx; arc=pass smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="GTSMN0Dx"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-80a18990c76so4287926a34.2
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 10:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790874237; cv=none;
        d=google.com; s=arc-20260327;
        b=AEc75QWYIzVOrn5JvP/Kx1whQ0r5tTu1QUyslUuNF2KZDaSs8qNgGH8KSnqY4il619
         MCAcG03AmTAF3uJda7i2PUN4stxwbryVr/Bnc+w6v/EP0INV4w4iHfs6GshsmTAVPyNZ
         1PV3I7M/Cc+X2vzKL8w5O6msIHWHRc2efTV9+y1HZ4ctBl7WaeCEZVvQ+6Mvd/9Zsx6H
         akvQF8oXqZuU6+2bKPBproBxfXuh0CdzgeddD3ef/DcLdx6s79B6kQB65L9hja1+hdRY
         tw0vM+0NyxXaBHV0Npnea+1xCLyjslpANt/pNd4WiHX+mQYnHjGqmwk0aAw6MoVOQaKR
         m1qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WKwlZwjH4KajUILUoFDyW1MJ1Fouv/7qeX0q4t9PILM=;
        fh=wq9RWEK8ToXcajzCTQ3dMPSYqZjvSSI6V+FSHjzn6TI=;
        b=JixEkakIJGUea0HAzxHS2aa7SBtUgoQpYzcAZXO1PJqnP3JsuSfqwi9XAQ4Bpfcrjv
         hoYvlopn7rqXoBWe+/3Qfg3WUT88iW6c+Fibt5mIZEPVPnCQhNXrR9oWgFvVNbh58V44
         3ujICeamwlR/ZEgWAlHvIjz+VwE3h6mHgG1M4VL2/d3tjrOovOwcCkE8tkZ5j0HH/+Nj
         I0H/YKL9gBjjoF8BEymEzf+XduKv2yuBXO/LwlR/Z0zJJY1j+3DfDe3t2cTVX2GZblu4
         OYnOG/YibI7t/n/EINwtsr2AlsKk/+Ei/rfvvLrzM0S8TfO2FvB53AoQW6bGxZAx4x0+
         drvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790874237; x=1791479037; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WKwlZwjH4KajUILUoFDyW1MJ1Fouv/7qeX0q4t9PILM=;
        b=GTSMN0Dx4OncnqOS3he8BCTk9mEx5zN+bxfVgtfAmpmprNrbhPnrTMS6vUpiLOfHSP
         n5pHKiQFC5v4328MbdBYsmUIBKSzr/STkwLbtJB9e6GYLS6lGGj4UZpddw2yXBlLhuRq
         DPBG9h2PDZdLR3K+e3q9ocUZ+gGNnRBvvPfQzqd38WetlfXx3cPQebuFjB+vAE56GlHu
         TKZoLdyeJMBgTvM3dhdqQg2tbdbIHOji0lR5/c8lMU18WT0Cq8fplhk9jba5Jgagfq8Q
         Bds4XUYyugk9HGPLCNCZDpX9nv3TuHPatmBs1ncvrBdFZMElF1AaWOjn49R7otWLIYSC
         7SmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790874237; x=1791479037;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WKwlZwjH4KajUILUoFDyW1MJ1Fouv/7qeX0q4t9PILM=;
        b=DSpSLCIijJ2PBYPVklCyTOeSeiDEzJZ+IzhMRSlVVBLUhmsg8u1qsPMRpFY0x32Ktd
         5obMugfXgW4eFhQITEIetc5DC5z/Su+tRpzcoLkm1nKfYbP3NJBlzfAYP8AwdrlHOJMW
         ePufNOo/1/gqwu0tNWpaRSU9WGC5/LKTGNfL5jGByuvzHdsQ9v+k2+g9ST9mT/4NQ7ag
         vzf5+lZaQMJBywacM07ppzS1+qCvde747pVjE6LMK53m02y7MvwZQB7FRwbENDh/nYff
         oT9f7Iqr/8r5SrEsHDNB65x4QnC2GG6xaXWwZqj7ObKaX89SpP3Lyh3RDVVtj3IK4vHG
         ebjA==
X-Forwarded-Encrypted: i=1; AKwUvByGIyoK75eF4OIeiKLvEPr0R/0nWeSobZO8VnkmJ2YuUjit5Lzl8xDKKPpvS4wcyheL5LB/A5ef/iJCew==@vger.kernel.org
X-Gm-Message-State: AFuF++mBNQEF6sBuSQxTMh4BgovfbOEsUEYmQX0qmYhJVSwA7+XWlTJI
	uUD/s/SlyFsGFZZblBDmsKMqZx27qgnCbTAyLxYxrMi0Rj0lxlY1IJX26S3OH36jB+KyuQMNnQ1
	I1NfDUsMNCi4iJSQoXPncLmruDmfV6rJqorB0jjSxlA==
X-Gm-Gg: AYBFou0i96wNd84DM8X+mRNO7frTwVpHek1DWQBUR6s/KVWoz/hGGm62zpmUlrmDCvl
	yrMZNkQoAtuFy6NLKb2f5PEcxIuDIBgMZ8sp8+XZU5DT5glWo25c4n5zt2hcmUKeEUOqBOtI1i1
	sFsgLPFGKfEArabfxVDE5Qjr8Aip9zVgv5sGlthDM0U/f12/YS4Qf4EjTjhFaSITQT9IHv0orrV
	zxmv+se+ARZlf6R8nLWPFHKKXttOeE36/SOo/b6Mt7iKAw0Pzifl3EfbrlCGcwKC5MCszPenYtU
	kLVuKWHzxwu2xj/qE5uq9lbjjQTwwLjMDFvqhbEqJgH6i7LUSX32MzO/RTCfqxpsezdsw90o420
	0MY3QQPHKLM5o7sGECAvw6uLPs5FLB79WbrOCnBiUIiAO5xdCuTximXVjsLvFp3iL1LI8Hv3a
X-Received: by 2002:a05:6808:191a:b0:4f4:fac9:cb8f with SMTP id
 5614622812f47-4f4fac9ea96mr415336b6e.57.1790874236734; Thu, 01 Oct 2026
 10:03:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org> <20261001-v4l2-sensor-detect-v1-1-a45993be17b8@kernel.org>
In-Reply-To: <20261001-v4l2-sensor-detect-v1-1-a45993be17b8@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 1 Oct 2026 18:03:40 +0100
X-Gm-Features: AclHuK8fyk69sMKVWToykLdi6kR3HB27CJAYMnIp5EXpxK-M1DJf-LTrlx8MAwI
Message-ID: <CAPY8ntDXoLr3KO5sRKR=AOs603m2NWHYBZHu-ag8R+wYs+pYzQ@mail.gmail.com>
Subject: Re: [PATCH RFC 1/5] media: imx219: Move LP-11 state switch to power_on()
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Maxime Ripard <mripard@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mattijs

On Thu, 1 Oct 2026 at 13:55, Mattijs Korpershoek
<mkorpershoek@kernel.org> wrote:
>
> During probe(), we write the IMX219_MODE_STREAMING register to
> transition from streaming -> standby to force LP-11 state.
>
> This should be done at each power-up of the sensor, but is only
> done *once* for the driver lifecycle (at probe).
>
> Move the LP-11 sequence to power_on() to ensure that it's always put
> into standby mode whenever the pm framework detects it's a power up.

Actually this is an interesting one for the Renesas folks to answer as
they added this.

Yes the sensor powers up with the MIPI lanes in LP00, transitioning to
LP10, then LP11, and finally to HS when starting streaming.
On stopping streaming, the MIPI lanes remain in LP11 until the XCLR
reset line is dropped.

If their hardware wants to see LP11, then how does it keep working if
the sensor has the reset line wired up which would take it back to
LP00? What phase exactly is it that needs this, and how long does LP11
need to be held for?
Do they have power gating such that the CSI receiver block ever gets
powered off and needs to go through the loop again?

I'm not against the patch, but it'd be nice to understand what the
requirements actually are. The sensor goes through LP11 even without
this, so it's something sensitive in a state machine somewhere.

  Dave

> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> ---
>  drivers/media/i2c/imx219.c | 44 ++++++++++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 9571f3622d2d..7978fee5f4a2 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -1056,8 +1056,32 @@ static int imx219_power_on(struct device *dev)
>         usleep_range(IMX219_XCLR_MIN_DELAY_US,
>                      IMX219_XCLR_MIN_DELAY_US + IMX219_XCLR_DELAY_RANGE_US);
>
> +       /*
> +        * Sensor doesn't enter LP-11 state upon power up until and unless
> +        * streaming is started, so upon power up switch the modes to:
> +        * streaming -> standby
> +        */
> +       ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
> +                       IMX219_MODE_STREAMING, NULL);
> +       if (ret < 0)
> +               goto gpio_off;
> +
> +       usleep_range(100, 110);
> +
> +       /* put sensor back to standby mode */
> +       ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
> +                       IMX219_MODE_STANDBY, NULL);
> +       if (ret < 0)
> +               goto gpio_off;
> +
> +       usleep_range(100, 110);
> +
>         return 0;
>
> +gpio_off:
> +       gpiod_set_value_cansleep(imx219->reset_gpio, 0);
> +       clk_disable_unprepare(imx219->xclk);
> +
>  reg_off:
>         regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
>
> @@ -1240,26 +1264,6 @@ static int imx219_probe(struct i2c_client *client)
>         if (ret)
>                 goto error_power_off;
>
> -       /*
> -        * Sensor doesn't enter LP-11 state upon power up until and unless
> -        * streaming is started, so upon power up switch the modes to:
> -        * streaming -> standby
> -        */
> -       ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
> -                       IMX219_MODE_STREAMING, NULL);
> -       if (ret < 0)
> -               goto error_power_off;
> -
> -       usleep_range(100, 110);
> -
> -       /* put sensor back to standby mode */
> -       ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
> -                       IMX219_MODE_STANDBY, NULL);
> -       if (ret < 0)
> -               goto error_power_off;
> -
> -       usleep_range(100, 110);
> -
>         ret = imx219_init_controls(imx219);
>         if (ret)
>                 goto error_power_off;
>
> --
> 2.55.0
>
