Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793286758;
	b=2pG+bVb3M/b8tyfMf700BPRJvT2jXNPtnhnf9iPnMzqcc/GOxeD68r++uzg6pWJWMqSe
	 rh/nClv9Swbrq5ok2+brxrkq8FyvDsnl2a6Z+Mmi5YRRDuUTJCbLOSeC4FQmwj/tcuzX1
	 ONXaAKH1byHLs3dkXQYYG2UOqaA/XwwITUUk99g9VJAfsMxwozeYRoh6s+8E9utzeiOgG
	 ZtbHHSBNEwdInzIhudoQOtjv5+N/mPlxbrrhj63o48y7n+u7IjqzyzHosggv1pxQqTFuU
	 H7uBfu6nw4oV52goJxijvvKamurrac9UeVHb8diBT9lPDNtPAkXO1IlDWvAbDajZJzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VpLpdA+yCrDrK4tzoP5LaLfSg6uFoDAIq4N1ZuvvpEw=;
	b=FE+WFBCOLJTDbw5lF9NTNXOk7EvzSEfqi0oHVT4VFtDXFaO7UoyUr2F2iXx5ZdR1AqJE
	 ezg8VU17xFDj/JrfQSvgZ8l+T0zbsZVYaknsOyyY8qErxEClpWf87AZysitQgLeTEwOQz
	 SCxQbwt8nxr5b0uLbRcecTj+1acEuZGXFIMqrXoWR28pVSaoSwnfOv6SkhYwORONPmB2Y
	 QgYQ4HRT48sxFuGX630feEQPmXdp8VZy8RiDbgnxcBvqYVJYkl4M1wS8cpjI+d8LMm6HH
	 hm/gIeMTnWwZ+nSwvh8PAD76mtijYmOWUy2C3f6VifF7fxeZsnd2j18sVhLbAZtJyjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=QJ1PuZIJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F169606A31A
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 15:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F169606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=QJ1PuZIJ
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-9440304604aso93918685a.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 08:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793286756; cv=none;
        d=google.com; s=arc-20260327;
        b=f+AfDzB/eMN/2q78+xoAVGfkbsk8sgHvU+4soouWtN8fGbKpkHEmnnr/fptKL4R5jw
         f/wUekaAebw/7f2kCyihJn0zuYVjnCN/giC0KPSOkWduSFv8NVFuFFmWHa3cIntKYplx
         atBmIfXRx22JTXmGzikPhZN3/Z9Vtvo8RfXuaB6TZVwFi85/durq/clYflVNn4wC2ejy
         lZozBpxcapZOs309EyO69vs8mtY9hrFD5Kvi//flW0OFk4OFJMccTUhe18o37m4PHrjM
         p00GSzTcXs/bCdiThyV0SMVlicBj4Ia/+3eaPRVQSRd4YnaTEqomA+joXfXFuRCfLsCF
         77dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VpLpdA+yCrDrK4tzoP5LaLfSg6uFoDAIq4N1ZuvvpEw=;
        fh=wTcG7kHUWtvKGRllOvtDBzvHH0MJo58KAPkB/ZofKcA=;
        b=iyPU7ZBSiFYdb5CA2FcF2Mg7cMQ6myog02Xvv5Xl7RqSvv8XY29maJhdonkOgWrm+S
         NiFWLN6vqW5RVSf26zciY53OTko1221CTP8hwGw2w9m/OYUTVJfDBawB+PPlBOshlE8o
         NQlaR0SgOBm1hvbnjS/usWifI273dUE8VcMqcHyq4oRU1nwWjDveE5ZW7Orl8nhm3uco
         IZBIwNpIPxinTekb1LH17tecOZcBw9PInIL03Vc6IRgqhJwYOHulcsZud7hIPgxj6Rgv
         s6YlVEVyX3j7aHMPDiJU7Mv4IjJ9c/3NVRC1VUi5T4Gii3WqKbLbROsZs8Fsp3ik/1ks
         x5xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793286756; x=1793891556; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpLpdA+yCrDrK4tzoP5LaLfSg6uFoDAIq4N1ZuvvpEw=;
        b=QJ1PuZIJLWdMBXB20D11/pW68AEffCEZP0jC5HvR/4LAIyPKqEYKmk2GV4gXi5OuWV
         nduYlh40ec0IXb8Q/+bhffsj0v6WHrymaZViiBHHP4xdGYu0zj4O6AJB83RY5cMrjqKl
         s9/dJn4APLOlerpSdceYhotqJxOtP4u2BMA5207mnIIZpqEMlkuvwunItfiyr/nD3r9A
         1lWWpiKUd8haObDhrH6LdTTpyj3Ib6IBUwk6CT2Ra31tORapyLETRFk8+PD7wH2R0waO
         RtVLFcGhW0PA647M04h8X/tpW26M3ESXdgD7gUBvYy7rROo2jU8yHgDMgsIPaOGaV4z5
         l+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793286756; x=1793891556;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VpLpdA+yCrDrK4tzoP5LaLfSg6uFoDAIq4N1ZuvvpEw=;
        b=JqXwNKrRGsKpSQOz3gXeIzT+R5VQh40yLjIWY1bpm27vKbvLh8KcugRE+9jTIm988z
         6+JPfDy8eXbSvRpg2krUchfNbK5BgL4vyqc/VtjcDx/QfD8+YGxB1rgZutooK8KXGXjo
         hvBqarMg9nuh9o4DRNxULFr6Jj6Qu3TM1hFw/my8OlzBveDT/wdukEdfvZeS0TBhw+mh
         A+61zUfqQdXq64+sRNMnw4eNs7+Bcoltd67yudSx3wiL4Gsft2Vv1sYj4nAIIhGwcKmZ
         y4UJQEdnT/k65Lj3bR+CgIVtqIxcxhno5k9VyJo4NNXrB9v3vfpvoREccX+bK5N4KLwz
         B/ug==
X-Forwarded-Encrypted: i=1; AKwUvByHkQUBTw11GIX+kGw7rqfMcWJYPqwhNajnaVbUSU0BKONWxpi3FTY39/KRD3hHpgQrStKRGetjJmJJgg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJpb/ujzCce9TXalx97QzQEKrKy9hdvLO9EvLTNliwzwWWEpZlW
	88HxVGXEv3bxfSgwUupoBSG/OSg2QtUBLZ5Jn4PUm22/4POURXFxcWKN2dAkrGBKwViG4kC038F
	pQ1Rn4xVVPchLDWB9a9YsikDG7/9vLWJscwf6330yrg==
X-Gm-Gg: AYBFou1/V3cGwAZInjvDttazBDUpx4kBORGEPC+oePiO6DKysNd9BS/RfmlT2S8npev
	ld+8dBc9lQ29TfgkQmt0dFe4/3TIG9GImpMy1Vw32TmoQWbWzMe1TMNVuWz0vebuhJN4xr9vEcT
	B8LjbYJ7Jad/3gmi+/2sKVn8bT9mG279KUTtkc+bu85SNP3H0A7v+99poyWDegIWJecCbjhWGD4
	OeHfLI2aEJdib4yICYmBmciDc59egQd+QSbOuR4Ph7h2AZit8TBDHBN31AIpcNRQ7oX/S3eErnU
	1bMvROlfd1vJDtTrswXc/G04xUCkBaOqKrkxmz6pBdmilGni6jJkokOG9QV2QUmIPSESBlCrdd9
	xIu6AJ4YgAN2DzyLy8kba30LZWuBTo70BymKm3x7xZNhkNxWtkoy4GIFJFA+INYuw0Ah9hvx7eF
	trYRfEuyPuzixksML0Rp81VoNDkmyFzgTjuIzdZh18Xifnyd5yoGc3jkkBqMcegeXxuV3o3pDtt
	B4=
X-Received: by 2002:a05:620a:4052:b0:93c:290e:9e9c with SMTP id
 af79cd13be357-9441337e6c2mr427309985a.16.1793286756364; Thu, 29 Oct 2026
 08:12:36 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-ov9282-fixes-v2-0-3bb376d8b1a9@linux.dev> <20261014-ov9282-fixes-v2-8-3bb376d8b1a9@linux.dev>
In-Reply-To: <20261014-ov9282-fixes-v2-8-3bb376d8b1a9@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 15:12:17 +0000
X-Gm-Features: AclHuK-uUWfGkjzNpPgxkc9h9-DVCMS05G89F7iEGV7DilP91VXl08Uhulon7tc
Message-ID: <CAPY8ntAYERfaKFs5ub9xpu0Ds45dFz6+aABGsdmzZMay+LT-gw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] media: i2c: ov9282: harmonize dev_err_probe usage
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, Martina Krasteva <martinax.krasteva@intel.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Gyula Kelemen <gyula.kelemen@advasolutions.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 07:49, Richard Leitner <richard.leitner@linux.dev> wrote:
>
> Use dev_err_probe() for all error messages during probing. This ensures
> there's a common "look-and-feel" in the drivers source code as well as
> the system log.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/ov9282.c | 32 +++++++++++++++-----------------
>  1 file changed, 15 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index f877cb9e78c38..8b01d9d43f0df 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -1077,9 +1077,8 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
>         ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
>                                                      GPIOD_OUT_LOW);
>         if (IS_ERR(ov9282->reset_gpio)) {
> -               dev_err(ov9282->dev, "failed to get reset gpio %pe",
> -                       ov9282->reset_gpio);
> -               return PTR_ERR(ov9282->reset_gpio);
> +               return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->reset_gpio),
> +                                    "failed to get reset gpio\n");
>         }
>
>         /* Get sensor input clock */
> @@ -1095,8 +1094,8 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
>
>         rate = clk_get_rate(ov9282->inclk);
>         if (rate != OV9282_INCLK_RATE) {
> -               dev_err(ov9282->dev, "inclk frequency mismatch");
> -               return -EINVAL;
> +               return dev_err_probe(ov9282->dev, -EINVAL,
> +                                    "inclk frequency mismatch\n");
>         }
>
>         ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> @@ -1112,16 +1111,15 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
>                 bus_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
>
>         if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV9282_NUM_DATA_LANES) {
> -               dev_err(ov9282->dev,
> -                       "number of CSI2 data lanes %d is not supported",
> -                       bus_cfg.bus.mipi_csi2.num_data_lanes);
> -               ret = -EINVAL;
> +               ret = dev_err_probe(ov9282->dev, -EINVAL,
> +                                   "number of CSI2 data lanes %d is not supported\n",
> +                                   bus_cfg.bus.mipi_csi2.num_data_lanes);
>                 goto done_endpoint_free;
>         }
>
>         if (!bus_cfg.nr_of_link_frequencies) {
> -               dev_err(ov9282->dev, "no link frequencies defined");
> -               ret = -EINVAL;
> +               ret = dev_err_probe(ov9282->dev, -EINVAL,
> +                                   "no link frequencies defined\n");
>                 goto done_endpoint_free;
>         }
>
> @@ -1352,8 +1350,8 @@ static int ov9282_probe(struct i2c_client *client)
>
>         ret = ov9282_parse_hw_config(ov9282);
>         if (ret) {
> -               dev_err(ov9282->dev, "HW configuration is not supported");
> -               return ret;
> +               return dev_err_probe(ov9282->dev, ret,
> +                                    "HW configuration is not supported\n");
>         }
>
>         ov9282->regmap = devm_cci_regmap_init_i2c(client, 16);
> @@ -1364,12 +1362,12 @@ static int ov9282_probe(struct i2c_client *client)
>         ret = ov9282_power_on(ov9282->dev);
>         if (ret)
>                 return dev_err_probe(ov9282->dev, ret,
> -                                    "failed to power-on the sensor");
> +                                    "failed to power-on the sensor\n");
>
>         /* Check module identity */
>         ret = ov9282_detect(ov9282);
>         if (ret) {
> -               dev_err(ov9282->dev, "failed to find sensor: %d", ret);
> +               dev_err_probe(ov9282->dev, ret, "failed to find sensor\n");
>                 goto error_power_off;
>         }
>
> @@ -1379,7 +1377,7 @@ static int ov9282_probe(struct i2c_client *client)
>
>         ret = ov9282_init_controls(ov9282);
>         if (ret) {
> -               dev_err(ov9282->dev, "failed to init controls: %d", ret);
> +               dev_err_probe(ov9282->dev, ret, "failed to init controls\n");
>                 goto error_power_off;
>         }
>
> @@ -1392,7 +1390,7 @@ static int ov9282_probe(struct i2c_client *client)
>         ov9282->pad.flags = MEDIA_PAD_FL_SOURCE;
>         ret = media_entity_pads_init(&ov9282->sd.entity, 1, &ov9282->pad);
>         if (ret) {
> -               dev_err(ov9282->dev, "failed to init entity pads: %d", ret);
> +               dev_err_probe(ov9282->dev, ret, "failed to init entity pads\n");
>                 goto error_handler_free;
>         }
>
>
> --
> 2.53.0
>
>
