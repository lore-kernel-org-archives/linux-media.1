Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793284845;
	b=EZovatgnSxG/GdxmzZWtqI4l96+9lnXChC8SKS0aymuH+WB2CMh9Z2kHNDDmfGhOoM+I
	 av5JEB/CzO9eTScV3x66wsI8jElLQ4HkF/ma64sMJuRJ428TlxQNndvdiGSaPUWr8LYgg
	 g5F767f1pAPuf+qNr62mhBAWxuWTEJh1g30CKAfry/RZ+Buk85cCH35SskzuMFwHCoT51
	 65QIoYZELX111DYSUcBSuT9O/0WHqgAQC6LiWqAssqRqExHTBEbocalZYUp7k5UOOIPSv
	 I1TrIGUNitKbep8jVZ0U4bN6la04Gyl3YVznWL6HN+oTh7+eJCN3FACNnwCv7rlxwdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UpLR92yvazEzYcMkjgQMdu/DL7UIZCfUmYSsebhADbI=;
	b=2/2mJvJ2GRm1MsCRuopQ9xJxN2rzc1kcoZYE0DgneM/0SOzfmN/jURsG5amdj39LJuRy
	 exzj+GWGn9cAnNlI57/2Htf6jtMxGf7mCFtOD0Z7qTrC/mhxEnYyKZwgxpEPzEx/SZ55z
	 RxtBkV35lRJZsNsO1j2KeqzGPGlh7XX1t4HJm31MVwvikNx4+y4sVCzrZyQlZJiUQZlP4
	 OFQFHdj+d2mQjVdv6Dwq3DquXH1S8SasQZNEmnDhfFs45JyW3pEDVysRh+E0Uj1+GgZeh
	 mkraY8EJvWBwBxV5f/WMeskM0EjnNGUHwms8CTkTTEwWu/YlwOcS6L5bb840YfMW0ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b="Xb/1Iab+";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA02606A31F
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 14:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BA02606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=Xb/1Iab+
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4a822463a22so1378218fac.2
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 07:40:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793284843; cv=none;
        d=google.com; s=arc-20260327;
        b=Hkw3Ca+4n5qhe6TMu13i9nHZm+rQ3/yXwkag/u3AHi44oqiErR/TmdWNFR2wuRq5oh
         s3PNsOIzjBvrGft7PhTVQSAF+H+dUL23FBk3B+otJs46/Z5biuPTPRyFsf+sfYW9nhOL
         SwrhbQIpr+66Cf8TMPOnNDmLNczlWJsfklRj6RxRDJ2l/uxoVmcJjXQp8SEeZGV/2IVe
         uGyRRa4YZQruf9r3pUVNiCZ3MYH6TF8o3VH4vygR59cMpjIek686SmLiOVlaZU151BcR
         djNEc1uWADpzbGhit6gXjgQSEoecgaVgQm3vNj0urR/+aLTAENwkV7ZfOaKbXi/6vroy
         mnuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UpLR92yvazEzYcMkjgQMdu/DL7UIZCfUmYSsebhADbI=;
        fh=lEhBj6Rn7Y/G2YvffIXhDB3Fg6iVJniu/N1oYKFeuho=;
        b=FSnaJsCQiqPsp+Gf+8T2l1TaXOPyoN/3cfF4vDAzsAlypZRqDCoZOB94BuIzMwDCFx
         tD9aRtG4QWKQnzAmVXEtBJOc4Pu2li/zcNzAwC18emIMeoFNBLFwMMf0vxW+eHzDOr4s
         gxvALCRPXTXoyq/Vqu4/IKfWgWZygTru4zKalFOMZR7S6uqL466UQjAvC4I8r5gBguJs
         fYtJiOorPoxmMSYPvXUbfMa3VVi/tDgT45KCUd4ZjLUv+UWQj/5S3pHPkLVKJ9dV+XJG
         zziaI/wmNMNz0jvrD/h48ISokswjYrRst+G0b3PysMtRcs8uH28ij+Yr0kdoUqYlRH1e
         DaYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793284843; x=1793889643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UpLR92yvazEzYcMkjgQMdu/DL7UIZCfUmYSsebhADbI=;
        b=Xb/1Iab+QgqcujhXdJyn6dLqo8XyrBoDPSjoAB0wuGBJ/YQNDYb8yzKZrbJaDUkzP1
         kg49UF4YKogpBfbzxaKgDYeSkhMxcaLWNfNSnD3SU2PnUuEjhHHvt3PzUKyMb9dHmfTQ
         ktQBOMnFeutICvOi6pY2MY3RIwvyW5i0TjbbqNQtRM3uHxnx3pGglwVg5kkOFvUrEd5H
         w7E+nq/sMVn+AqJ+J5wIEi8wEkJtLNa9Dys9Goflj6y8AC30dOnm1UtoXSxVwsmrs9Fa
         o7LSPlCveVaLcbgfv3a9B7zGkBaIdRvz5xj4mNqiHjCBJzAjV5j3UV/pfqDJoTA6v3qn
         HFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284843; x=1793889643;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UpLR92yvazEzYcMkjgQMdu/DL7UIZCfUmYSsebhADbI=;
        b=xs5v8nbXxZyFiy98ODFIoErV4IJrIdIkNI62Z68qLENm9Q5dK7T/y8HhhZVmg7v+Pi
         i3fZqTiF0kA5texvMbNCyllKpaGmNeU94loROmXgnH9KssbWDqqhAL88cYZi7wRubYKA
         FVkeQQTYgJ/J0484I03gUrX3w5p17pir7N/CHTJN4Q4paBbh7eKi66MLoxML7vGAi9l0
         xwu1T1niYtwrhVeKMynjliKkMuWQDKbd6wWiwo2YjxXxyjKPqfj5rZJyAuI+gu21ZnpQ
         9AH+0QIDQTjG94a6WzG+Cl4xwy+PMlgdvsLwut22uff+wbWI0hpcDk2mUGpRwJL3VA9Z
         kBDg==
X-Forwarded-Encrypted: i=1; AKwUvByQdvPtJnet+1K7eAWNkqxvGOdhF7qlysz31mr0CbQnLQSssKOlU2nk7wb0BAkcXLtQS7w49Wg+T+shgA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIF9a6OhcL4mgjD4dNlanqpspdvXrGiOP7PXcRGGz31s2Ge54DQ
	7usUM7xPI7kJ6+8kPbM2GkGa58lz3xgKiMa7aSLk+Hcazvna9HRRG+cNPJxbgkixNHv49hMhySz
	S2zXTTcECxRamweVt50pw6VRJ+ufgXnxPjAr8FKPQzg==
X-Gm-Gg: AYBFou1PMBUTYZt+3TnGRt5LMwSdtXh/z0ymTnF5BCckOkhsU02cV2I8+9MguM2xMQR
	d0gSs+dX4mEAlCZHQ+Xs7lIME+IM/YBfn4ARx2TFkIbjvtp/PRn01rJigiu+jnIA3OxsgMpxjIq
	5+mRY7m7VvH3rCAibONj5mcRkamigeCIYqL0NH0KclgnfORFbO3r73z+e2IDUuXMTwSnq/6i9XA
	CbG3ZTEcW1r8Bb9dyekw14jSEAO2d8KFJN78x+rsluH/koTD50rdDTtDfleHLrC0VL44bNX9T57
	c74UvOfkTXvxT+z5ZX53UiBKzETQ02Q8Im/Ujm8mcLR8xg3pnvnNy3jO9lVo3VHEG8RESmHmFPY
	FMl1MjaenBuT/TLGlteKQwfPwJSD9X6/rpcfNGbK47hbfuFgfhf1bCv++hXIN6S9JnH+A5zfuHL
	u9ftz1OjN9ujDc/QmOkBU25Eq+F/7alflqtzVsprd6VEc5VkUqby3xC2oQeWYOSCyKb8LjJXUHz
	/Y=
X-Received: by 2002:a05:6870:1408:b0:4a8:5c86:20bd with SMTP id
 586e51a60fabf-4a8bb5a3fe0mr4334153fac.14.1793284843148; Thu, 29 Oct 2026
 07:40:43 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-ov9282-fixes-v2-0-3bb376d8b1a9@linux.dev> <20261014-ov9282-fixes-v2-2-3bb376d8b1a9@linux.dev>
In-Reply-To: <20261014-ov9282-fixes-v2-2-3bb376d8b1a9@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:40:26 +0000
X-Gm-Features: AclHuK9aWEHtDyHMrF09cYcyP1s_VnFKtV14syxMLcpu9Ygt6KIgxBSI2jLY9YI
Message-ID: <CAPY8ntCKPLt9zfBRemqG=nuwUBB2gcO7bO_4Zk6TfwB0nzP=tQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] media: i2c: ov9282: fix pixel rate and line time calculation
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, Martina Krasteva <martinax.krasteva@intel.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Gyula Kelemen <gyula.kelemen@advasolutions.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Oct 2026 at 07:49, Richard Leitner <richard.leitner@linux.dev> w=
rote:
>
> The OV9282_PIXEL_RATE_8BIT is calculated incorrectly from the
> OV9282_LINK_FREQ. The hardware scales the pixel rate by changing the
> multiplier from 0x50 (for 10 bit) to 0x60 (for 8 bit). Resulting in a
> x1.2 factor.
>
> The current OV9282_PIXEL_RATE_8BIT calculation scales from /10
> (for 10 bit) to /8 (for 8 bit). This results in a x1.25 factor.
>
> As all the inputs to the pixel rate calculation are constant in this
> driver also define the OV9282_PIXEL_RATE_{8,10}BIT as constants.
> Additionally introduce a new function to calculate the current
> line time in nanoseconds and use it in ov9282_exposure_to_us().
>
> Kudos to Dave Stevenson for pointing me into the right direction!
>
> Link: https://lore.kernel.org/linux-media/CAPY8ntBaSHjztuSLTOtv9KYvEbmcbi=
nSMJ78ZDg+0sZg-1fz3Q@mail.gmail.com/
> Fixes: df60764ea5210 ("media: i2c: ov9282: dynamic flash_duration maximum=
")
> Fixes: 43ac0cac18f41 ("media: i2c: ov9282: Add support for 8bit readout")
> Cc: stable@vger.kernel.org
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov9282.c | 50 +++++++++++++++++++++++++++++++++-------=
------
>  1 file changed, 36 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index c10b2e205834e..5907f57b34523 100644
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
> @@ -111,11 +113,14 @@
>  #define OV9282_LINK_FREQ       400000000
>  #define OV9282_NUM_DATA_LANES  2
>
> -/* Pixel rate */
> -#define OV9282_PIXEL_RATE_10BIT                (OV9282_LINK_FREQ * 2 * \
> -                                        OV9282_NUM_DATA_LANES / 10)
> -#define OV9282_PIXEL_RATE_8BIT         (OV9282_LINK_FREQ * 2 * \
> -                                        OV9282_NUM_DATA_LANES / 8)
> +/*
> + * Pixel rate: Derived from the PLL2 clock tree.
> + * For 10 bit it's exactly the same as the sample PLL configuration.
> + * For 8 bit the PLL2 multiplier (REG_PLL_CTRL_0D) is changed 0x50 -> 0x=
60,
> + * which results in x1.2 and therefore 160 MHz x 1.2 =3D 192 MHz.
> + */
> +#define OV9282_PIXEL_RATE_10BIT        160000000
> +#define OV9282_PIXEL_RATE_8BIT 192000000
>
>  /*
>   * OV9282 native and active pixel array size.
> @@ -472,6 +477,32 @@ static inline struct ov9282 *to_ov9282(struct v4l2_s=
ubdev *subdev)
>         return container_of(subdev, struct ov9282, sd);
>  }
>
> +/**
> + * ov9282_line_time_ns() - Calculate duration of one sensor line.
> + * @ov9282: pointer to ov9282 device
> + *
> + * Return: line time in nanoseconds.
> + */
> +static u32 ov9282_line_time_ns(struct ov9282 *ov9282)
> +{
> +       u64 hts =3D ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
> +
> +       return div_u64(hts * NSEC_PER_SEC, *ov9282->pixel_rate->p_cur.p_s=
64);
> +}
> +
> +/**
> + * ov9282_exposure_to_us() - Convert an exposure register value to micro=
seconds
> + * @ov9282: pointer to ov9282 device
> + * @exposure: exposure register value to convert
> + *
> + * Return: microsecond representation of the given exposure register val=
ue.
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
> @@ -510,15 +541,6 @@ static int ov9282_update_controls(struct ov9282 *ov9=
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
