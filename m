Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E1B4AB1DC
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 14:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790173007; cv=pass; b=BrNkb8Kr0ZMnLhwKswSwwT97jZn2xJmzXuGJoxnQtNKcDU2oPwP7mNXZIsMP9N9g1K58qNvgG658doYPdMFshKbP33tUdSmp1uH1FMSkVBJyA/BVlXno+jwnejiCO6/lqD/6ZN4ZKLVpdilzgUoeZ1EOzcPFCZhxNvzcnTQ5QVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790173007; c=relaxed/simple;
	bh=FS6lJ3PtLm08vjSBoIe7H4TwoYiMkgHt62cTjrYT4xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lI1xqDgmeYCllyhrDNnu9SRoAHaserDGiX0+D+ozL6jf2OcdoNtaUTo4bhApKbgXcnCVu+vacO4sEyNRkNRtu+l1d6ijz/jpBrEM/u5YUfQXb6ifOM7GPphDomHwZUDsvKVI5XyqIbnIKo4DxWGMP0aYIsAsG5JDZNUFm18YkW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=OL4p5HRA; arc=pass smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="OL4p5HRA"
Received: by mail-oo2-f39.google.com with SMTP id 006d021491bc7-6bff4d6504cso425485eaf.2
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 07:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790173004; cv=none;
        d=google.com; s=arc-20260327;
        b=kAWE6z+R4dAUU1WTeSr+Kf0QnauqZONJ+B/HxRhNVemo4WPpX/vzBIN2OCCXWuf0GI
         RqbHxzKfxYvo9YKWAF0D1DJO+mGLO6NHTPGPPUcZekaCrMkTii25APB7TOCIsUAICPvG
         9HMfOOFFHaJSN+IqlvjwxlHxSCxZR4Z5ymJaACiDYZxjX4fwkdN+BgSoo7ZoNhujqyYK
         i3WmaRXlmMNjKP+E5mcm5SGEWOkqQvR1HFLudlf1li5G2aoQO+9AaE0zOfMiFjkZ8c5Y
         Bglzs5ZpWHNWojaqz+12GkOpO/KyQ8v+MPtGN3IyaDn7KzzPb4aUZEcBKfpwab3eD59b
         vfww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HyPsodE6QAaKDtgJIc9QxauDNUkZzlbmvKbNhaarvmg=;
        fh=N0ZtGgG48E/zCILA+CiNPtJJPe61b33s27HoWDf855M=;
        b=NUUoYz2oY6zaj1nTHknP8Ln5gDlKr/6mZdflDx08IaZvdP6DxtA6ZxntYRIukdHGtP
         cihtcolesyQanMGbA2P9b+vIf4MirV2AhT6snfFTSDNnKgQWAAIKWo3KGDRfvXdeDk7w
         Y/n914xxpgbD4W6QKT+LV99iJbzZdD47b7p0jut9Pk+jnoE7Km1EMZ8HtkgDaR1Qhbhk
         ZPt9TebyhxJ6NgpfPWO7RetIEIeoEcaWhtwr8TiBRvMTEXo1ODg+H7kis8IhEn06HU5y
         JMQiQX2bryPe9e+w3lxk0uvnxTR0ZtBPFl1pRNV4r35+kEgEjG1viIjdCrGj2gvMGEh3
         66ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790173004; x=1790777804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HyPsodE6QAaKDtgJIc9QxauDNUkZzlbmvKbNhaarvmg=;
        b=OL4p5HRAdGRMuZdtfjOSOutJFHVuLpU0D8FWgYcm1+VY5p2AzX9J6KpGCPmhXrglAF
         5QO0Ki0KLhiUjYt1cmNcmRqc6AtIp2Agri86dMYWEFFHpdoO4nD9Gs4R6jAUZ0uaG/Ot
         hR/sZSNa5g4RoXfYdJa83dWFOPBbrQkKT4l0ac7Apv6IEBaH6XF3Im5RliYEXnAXRT9R
         vyZU/lvbD3j6o+v1SF83YWk3fOmcEMhYD6VWc28ibrdIElzW6GhzpDZoXU/v7W/74lyj
         TOQPflZQNw8BA/UmUq/lF6kDUF9s6lWQPDnz880363FTZgB/FUEWnvjb4ffjq3M8E16C
         HvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790173004; x=1790777804;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HyPsodE6QAaKDtgJIc9QxauDNUkZzlbmvKbNhaarvmg=;
        b=y6xny1Rf7PfAHbS2SwuVbyRVBmj1jjkSb7hClAlUd8VfluJEvnQWyBmTJ7sZsq+kaM
         H30+TtkgGYHS+go4+uhcCYs3vodUVc3Dt46FIyubRp3O2jsiYkHoChiA82+YOkm6sfBn
         gg1wGqlzZwnjq6khXlyPYotZKi71BGD4VV41nr9P/pJWy/V5GTDKGjVgQ4yr+nQ+zcze
         hK195XIvA3vzrroPqy1ifecW33D0edM8IMneh8uYtuFr8r6WAF2m/Pg3ijTAzgQuj2Kz
         K+Y+f8tvBqPJEoRPRR6UUmB9hPra1pB/kx4crC+u8rQjsd30tHFZnu+Mt8slnC2Noy6N
         hYcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMUbjaFYVG8hKqerTTXM0ycIiqw3dI6jnuGFEMk35e4i/reaeRi0IPNzrobqtBMYCxHx6BWhP3MbSEiw==@vger.kernel.org
X-Gm-Message-State: AFuF++lXdX7hzYnNT4o3Q6E0VzI4GaJT0d7+KJYBx3MUqZqWs+7PmH9t
	UE0RC2BHUETkaM2ESQImsBusdvO16uQZ9UtIJyyxo/p3y+mL8s0PuATiCNFGPyGLSVPymDG/6Bv
	CDyxvtDAEKfa59xwGc7qZO48RwxMEJJjEDZWQ/SuFSg==
X-Gm-Gg: AYBFou02sB11XXaTNeubcTXyDbAhsXDKTRxQUtvBau0MlvlW+mGJA1MVpLVgThrvBSZ
	qwFRNlEai+C2wD7oVE7z/oqjSmJ2mHTxgjJzVaPfmota7XFiUzG17T6HyoFhr3xuIAab3ttGwyP
	WzNDYpZnCPAw6GDiFfdkhCjvfdDMvGpgYmETfDygLQm0Sa4dLdoatngJ9mWUp/bACwy2hjccnvk
	8yq9S4BhZkaKPmWI/LUgVvO/0FxCO0f+523DSYMZSil8QoY4HN+DIzAHyKdUyjthlX5ICAcvHJR
	QgH4i9t+T5kgOw7AzeWhgxylU4rqCFaJQMN4KB7XnJPxcetEEBDAZ8fZaANkwmVlaU4rABNsRFj
	92hCgEaecZAKcCzFHCl7pdBVD/lGkpNASYFleCAL2/kB6Z+avYiwyldxxanSjQlL8DwkfWThw0A
	p9+0MRWmI=
X-Received: by 2002:a05:6820:160c:b0:6c9:80d8:a208 with SMTP id
 006d021491bc7-6d2d2621218mr2667331eaf.69.1790173004100; Wed, 23 Sep 2026
 07:16:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev> <20260914-ov9282-fixes-v1-2-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-2-f520af59df1b@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Sep 2026 15:16:27 +0100
X-Gm-Features: AclHuK85j1iihFqHzwDk0it4LC2GOSDRVIxZLiQQ06VTey-4VmPaz28Or5uQf_U
Message-ID: <CAPY8ntBUtZ3zkJrekAuXamMH-M+4gcS9vEid3DFrLgrwg2jQmw@mail.gmail.com>
Subject: Re: [PATCH 02/10] media: i2c: ov9282: fix line time and exposure time calculation
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard

On Mon, 14 Sept 2026 at 20:21, Richard Leitner
<richard.leitner@linux.dev> wrote:
>
> ov9282_exposure_to_us() divided the line length by the pixel rate control=
,
> which is the MIPI rate and not the clock HTS is counted in.

It really shouldn't be. PIXEL_RATE is the pixel array and LINK_FREQ is
the MIPI rate. Many drivers do conflate the two.

However I did notice a couple of weeks back that pixel_rate is
incorrect for 8bit readout on ov9282 [1]. (It's correct for 10bit
readout).

<quote> Actually I see the problem. In the hardware the pixel rate for 8 bi=
t
is scaled by the change of PLL2 multiplier from 0x50 to 0x60 =3D x1.2.
The pixel rate control is scaled from /10 to /8 or x1.25. 1.2/1.25 =3D
0.96, so my 96% of speed would be spot on. The use of link frequency
in computing pixel rate is totally bogus as they are on independent
PLLs </quote>

If you correct OV9282_PIXEL_RATE_8BIT to being 192000000 (instead of
the current 200000000), does that solve your problem without
recomputing things?

  Dave

[1] https://lore.kernel.org/linux-media/CAPY8ntBaSHjztuSLTOtv9KYvEbmcbinSMJ=
78ZDg+0sZg-1fz3Q@mail.gmail.com/
The original reporter did come back to me and acknowledge he was using
the downstream Rockchip driver which is doing the wrong thing.

> The right
> clock is PLL2's system clock. With the PLL2 dividers left at their reset
> values the chain
>
> SYS_CLK =3D XVCLK  / pre_div0 / pre_div * loop_div / sys_pre_div / sys_di=
v
>         =3D    24  /    1     /    3    * loop_div /     4       /    2
>
> collapses to SYS_CLK =3D loop_div MHz.
>
> Fix this by introducing a new static function to calculate the current
> line time and use it in ov9282_exposure_to_us().
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 46 +++++++++++++++++++++++++++++++++++++---=
------
>  1 file changed, 37 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index c10b2e205834e..3f83a6cf338d8 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -10,10 +10,12 @@
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
>  #include <linux/math.h>
> +#include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/time64.h>
>
>  #include <media/v4l2-cci.h>
>  #include <media/v4l2-ctrls.h>
> @@ -472,6 +474,41 @@ static inline struct ov9282 *to_ov9282(struct v4l2_s=
ubdev *subdev)
>         return container_of(subdev, struct ov9282, sd);
>  }
>
> +/**
> + * ov9282_line_time_ns() - Calculate duration of one sensor line.
> + * @ov9282: pointer to ov9282 device
> + *
> + * The line time and therefore OV9282_REG_TIMING_HTS and the strobe fram=
e span
> + * are counted in PLL2's system clock. We assume the PLL2 dividers are a=
t their
> + * reset values, so the formula reduces to SYS_CLK =3D loop_div MHz.
> + *
> + * Return: line time in nanoseconds.
> + */
> +static u32 ov9282_line_time_ns(struct ov9282 *ov9282)
> +{
> +       u32 hts =3D ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
> +       u32 sclk_rate_mhz =3D ov9282->code =3D=3D MEDIA_BUS_FMT_Y10_1X10 =
?
> +               OV9282_PLL_CTRL_0D_RAW10 : OV9282_PLL_CTRL_0D_RAW8;
> +
> +       /*
> +        * OV9282_REG_TIMING_HTS counts 2-pixel units
> +        */
> +       return DIV_ROUND_CLOSEST(hts * (u32)NSEC_PER_USEC, 2 * sclk_rate_=
mhz);
> +}
> +
> +/**
> + * ov9282_exposure_to_us() - Convert an exposure register value to micro=
seconds
> + * @ov9282: pointer to ov9282 device
> + * @exposure: exposure register value to convert
> + *
> + * Return: microsecond represenation of the given exposure register valu=
e.
> + */
> +static u32 ov9282_exposure_to_us(struct ov9282 *ov9282, u32 exposure)
> +{
> +       return div_u64((u64)exposure * ov9282_line_time_ns(ov9282),
> +                      NSEC_PER_USEC);
> +}
> +
>  /**
>   * ov9282_update_controls() - Update control ranges based on streaming m=
ode
>   * @ov9282: pointer to ov9282 device
> @@ -510,15 +547,6 @@ static int ov9282_update_controls(struct ov9282 *ov9=
282,
>                                         mode->vblank_max, 1, mode->vblank=
);
>  }
>
> -static u32 ov9282_exposure_to_us(struct ov9282 *ov9282, u32 exposure)
> -{
> -       /* calculate exposure time in =C2=B5s */
> -       u32 frame_width =3D ov9282->cur_mode->width + ov9282->hblank_ctrl=
->val;
> -       u32 trow_us =3D frame_width / (ov9282->pixel_rate->val / 1000000U=
L);
> -
> -       return exposure * trow_us;
> -}
> -
>  /**
>   * ov9282_update_exp_gain() - Set updated exposure and gain
>   * @ov9282: pointer to ov9282 device
>
> --
> 2.53.0
>
>
