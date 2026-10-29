Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793285690;
	b=2M4fc/0mRWGuwshAhC+NKacnYUp0lSRouFJxjY51zC6tPYR+N+6bEj/hwgD7zU8MHSOi
	 RV++CT3UmPg5j2+FkPCyqN9ZLr21YuwaMIQTqBQEI62DI2CeqdAq8LVS6IzhCyGKpvC75
	 oYvXSYDknobT/QF8aNKbu/Xp5EUIJymctAzLWOPtggsK4FmBUxTqegDj8GKbWgaUqbaeJ
	 RL9C2XEEwzNs5xxVCBbH5IbQtutxbKd1/G8jW94MI69wRsFJBlXnsZ+0BVCdxdxMHSqAT
	 2j5h2QJO4npJ/YTxKxZBgmKwsnIzJSfM4ks9AfW3qgO4bHxFef3yNj7Typ8UrYWq/Iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jZf3jjTodnM7qc1wo9plUNoH8ssRvL1DxBE038OooOQ=;
	b=yz/Lv0NFFWwuR0kQaxSpg/OCvKyOqt4L/+h/whbKE7etoGqi6mZhX9LWRzUSp7A3f7jg
	 mJ/RIbpmfFn7qwjaH5YNn34RB/iPnPInL7KOw6Cx/V4RE5pr4/TNeT8UUiOkxt8ctITTl
	 fzsSN91cJsCHOhBAzleaboAWtlrvIRHecnovk0XFlv+MrQW/wnEHE0eKc2kKq94Jsxjb2
	 chjfCmKvrCtpPrd5N5bdL8VcfwLRL9k1syFTHeq4YPBg5UPCx9KIbN9ov5KehBAfodxLV
	 8Ukct3YZftVKvaZkwgJDNe6Hm3N7bqNIOrFibG6LeVksHiI1M/w/MRmffM5wUd2BQEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b="Rlq737/y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDCB606A31D
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 14:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FDCB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=Rlq737/y
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-49429181ce9so1309828fac.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 07:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793285688; cv=none;
        d=google.com; s=arc-20260327;
        b=c+l1ch0gFA9R3vrG0U0OEObeXvUN381FMcWbw0l+LflI4iWB99umZFTALBi5DosxkD
         TWcgXt/Oeekm/fbMHKeAyGzqJm6wyV39IvgM177tYT7GVAa05xbJiGPREHAvLbC47VQ+
         bqxroZOxI18Xg4POawe0dm+3weJ6R5gPw0/vxIDEQBvT7oQVLz3ha8MGstsDBCaXkdcy
         n6/hqBPQNQbu21t2rm7jybFhOZwnfQpXNG8SwHTVEqpJ8W0BRQTlC987tplU7l7ENM+M
         fkCstyLfpETku6lC9xzg8R7IR2oBPtQ5s8ZY1/mVmBhxmur78nuvqJeWmMVJiGi56IBd
         Haog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jZf3jjTodnM7qc1wo9plUNoH8ssRvL1DxBE038OooOQ=;
        fh=qrOP/PAmRL7DgxQFVDBTm7aE5JdDrWRLbFyagigpoeU=;
        b=J3M6Lqhvo1d/xfcywoCBOJe3ZIB6F58ATjHYm7NTMLk719yu7QC69RgUZAMHo1QRxu
         O7wJOK2pOxioXr0/mIIeMHMUfKjKeEP2EjdC/3/lI87aHPvxnNYr7F8zpTOLv/Dh0POw
         vi2l2a6l0xtLt+brlOg2zTGmPHxFXDVLpWJ8v77V19h8hqwGtwjrVKnhDWZ+kacIjPh8
         RG/qGDxlkjrpEr8WVLIELTvq5vcyz9TE3gdeipeN+GYDpNNnYexFIKjZ6CN5XJEnrx0P
         cI5c5WYnuhHqkT04Qo+rAkkXNJKrSRTCyOcWRPzNVqQyJ27fpvkgEivK6cg0Pk7RTyKg
         VgwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793285688; x=1793890488; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZf3jjTodnM7qc1wo9plUNoH8ssRvL1DxBE038OooOQ=;
        b=Rlq737/yw9y59C+5F9yht1LHNkLvTUU8EY9Zv4CqfWn8wkp+QpjKh1HxZwqlMBYdcG
         oZoJE304EjTAOTyhFCE66H6FE1ocYOxvW6c3bhkpbfg7yREaQVYPxA5IGfD0/NgNPzt+
         yjj9TB9S10m1ZBC8O+1hXmmGX9+gUCp9Z/xK0/OKxtkJ080+y9RAsBkSV07rvQANnrFg
         u2FmEnEjzgHLg59clH8eEzy0q5nqYpkkxTMgHSr0gM9uI/8ug+sMt7puTq1cWJNmkleD
         X/F9UyYNOZBkcUVa88DNEFcIEEknHraT1inWTX1+Yul+mgYNWdpjen+rGq3MOCdmW6ma
         H43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285688; x=1793890488;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jZf3jjTodnM7qc1wo9plUNoH8ssRvL1DxBE038OooOQ=;
        b=QrrncODh8EH7ZSmUEDkyMaqb09AFXjkqQBAH0Rr6ORPyBOsdB4KHcTLA2pl9TWVuTU
         nWLwMkk2fbeOhyiypMlq12+4gQAEc/i0qduhUG6AE4H4HnhJhL4Br3NRUkWsWiwpb6mY
         Yw1ui+x5AtDoZF2dmShdNYy8HqPp9AsBZM1v6xgzy9a3zHBz4jwSUHtMtI51PNQwY50w
         UmP1HBKBJUjW4yekGEx0Byzhdv3+5r4OWXXnys2ieyQa9+/aeclDVHe6Gb/eMKoJdZjx
         qBuDrSKpTpwnsGmxNtU3gGYbPSD0CbWQm9QhkfGJZeXvnLe6RUgvPeecgxjmhxULbA8a
         sLRw==
X-Forwarded-Encrypted: i=1; AKwUvBz94c88qg8FseYQWPqUXohz6Q7Tlwn/7BaYL6AWU8RwixFGTRNvnLlljeYBbYSpOo9BjQ9Y3vTUi7vKhA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKkZaDD8DfenfkmUOiSkNc8LlGiQGdclt6mK41gl17LPrtNGirz
	O8tsDuHcB6oM6vPvFpB3fRchSmMKu1RyktF29ek7QcQJw1qWby+bUUf7UT18SylsrhJk5l1W2O0
	6hRbltCMd7+ATlpmO2Y+ah7co1cHyzPpr36CJv76qNw==
X-Gm-Gg: AYBFou08gzRF8PA6GE24JpHf8fwMKIrNNT/45wcs7+cD8M2B75asb8KaRU8YwPhs3mD
	nOnuz0slxduODEIJ3KGoXGTYiocbtQclxLHRAm3gayewiBWhtPWl9A9nRFTAA7gCNhcVL1T+ujm
	6Rzy8dMdGp8fyrz81U8dDqBb6VMYER67JkgSHg55CiH0nquznXYazuwQ2RJ1mggNhTdEop19EGU
	gofSiC6x7Lp9h4/DLTVU+AF8x/v8Fyis6SFzEJrY47lQ3+Kxytkvoi7EA5zMOOhPQELfXPkZWOj
	KXHbHLoRELpxN9Hx+ecZ5qNmiN0lk7JqsYa9Dd2GqGrn0KOrZ6Tx5dT969+qH+JmHoEIEXsLg6j
	EQ029UGlCIslUA7xqo2b0ultGDl+surSyjnjMYIcAaoU+GaqiZnVfdAqWAbWaFNo9pZwbgtIbjQ
	9YxMKRCk8pm2m7grE9UvzYUhQzIw3fSPGazUCtmaj4DVdFBtt33w22Uw==
X-Received: by 2002:a05:6870:8a09:b0:47c:4f69:3f1f with SMTP id
 586e51a60fabf-4a8bb4595e8mr4158986fac.14.1793285688482; Thu, 29 Oct 2026
 07:54:48 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-ov9282-fixes-v2-0-3bb376d8b1a9@linux.dev> <20261014-ov9282-fixes-v2-4-3bb376d8b1a9@linux.dev>
In-Reply-To: <20261014-ov9282-fixes-v2-4-3bb376d8b1a9@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:54:32 +0000
X-Gm-Features: AclHuK9PiAlyIOE9H6TgjFTZyWCGr5hpHVaWb1aHCZKckP8QEuz-8cMUmUpjv44
Message-ID: <CAPY8ntDNa8xuVRS6on=WoVghzJj_An3EydpEb=RwNDE1tmO9Kg@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] media: i2c: ov9282: fix flash duration range calculation
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

On Wed, 14 Oct 2026 at 07:49, Richard Leitner <richard.leitner@linux.dev> wrote:
>
> The flash_duration range calculation was broken. The maximum was
> calculated from the current exposure time. This limited the hardware
> without a strong reason. The minimum was fixed to 0, although the
> hardware treats register values 0 and 1 equally for the strobe_duration.
> The default value was never calculated from the raw register value to
> actual microseconds.
>
> Furthermore the flash_duration range update sat inside
> ov9282_update_exp_gain(), which ov9282_set_ctrl() only reaches after
> the pm_runtime_get_if_in_use() early return.

only reaches if pm_runtime_get_if_in_use() doesn't return early.

>  So with the sensor idle
> the range kept whatever value it had when it last streamed.
>
> Fix those issues by correctly calculating the values on line time changes
> (i.e. HBLANK updates) as this is the "time base" for the register value.
>
> The maximum is chosen to be S32_MAX microseconds. This was done to keep
> the code short and avoid additional back-and-forth conversions. As the
> hardware allows strobe durations from 1 up to U32_MAX line times, S32_MAX
> microseconds is always in this range. Line times for the supported
> modes, hblank values and pixel rates may vary between ~7.5 and ~205
> microseconds.
>
> Fixes: b95d8058a2786 ("media: i2c: ov9282: implement try_ctrl for strobe_duration")
> Fixes: df60764ea5210 ("media: i2c: ov9282: dynamic flash_duration maximum")
> Cc: stable@vger.kernel.org
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 41 +++++++++++++++++++++++++++++++----------
>  1 file changed, 31 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index e2a1f875160b9..e6920e18b7818 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -514,6 +514,26 @@ static u32 ov9282_us_to_lines(struct ov9282 *ov9282, u32 duration)
>                             ov9282_line_time_ns(ov9282));
>  }
>
> +/**
> + * ov9282_update_ctrl_flash_duration() - Update flash_duration control range
> + * @ov9282: pointer to ov9282 device
> + *
> + * As the actual microseconds value of the flash_duration range (default,
> + * minimum, maximum) are dependent on the line time recalculate and apply them
> + * to the v4l2 property in this function.
> + *
> + * Return: 0 if successful, error code otherwise.
> + */
> +static int ov9282_update_ctrl_flash_duration(struct ov9282 *ov9282)
> +{
> +       u32 fd_min_us = ov9282_lines_to_us(ov9282, 1);
> +       u32 fd_def_us = ov9282_lines_to_us(ov9282,
> +                                          OV9282_STROBE_FRAME_SPAN_DEFAULT);
> +
> +       return __v4l2_ctrl_modify_range(ov9282->flash_duration, fd_min_us,
> +                                       S32_MAX, 1, fd_def_us);
> +}
> +
>  /**
>   * ov9282_update_controls() - Update control ranges based on streaming mode
>   * @ov9282: pointer to ov9282 device
> @@ -577,12 +597,6 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
>                 goto error_release_group_hold;
>
>         ret = cci_write(ov9282->regmap, OV9282_REG_AGAIN, gain, NULL);
> -       if (ret)
> -               goto error_release_group_hold;
> -
> -       ret = __v4l2_ctrl_modify_range(ov9282->flash_duration,
> -                                      0, exposure_us, 1,
> -                                      OV9282_STROBE_FRAME_SPAN_DEFAULT);
>
>  error_release_group_hold:
>         ret_hold = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0, NULL);
> @@ -616,6 +630,11 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>                 if (ret)
>                         return ret;
>                 break;
> +       case V4L2_CID_HBLANK:
> +               ret = ov9282_update_ctrl_flash_duration(ov9282);
> +               if (ret)
> +                       return ret;
> +               break;
>         }
>
>         /* Set controls only if sensor is in power on state */
> @@ -1190,8 +1209,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>         const struct ov9282_mode *mode = ov9282->cur_mode;
>         struct v4l2_fwnode_device_properties props;
>         u32 hblank_min;
> -       u32 exposure_us;
>         u32 lpfr;
> +       u32 fd_min;
> +       u32 fd_def;
>         int ret;
>
>         ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
> @@ -1260,11 +1280,12 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>         v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
>                           V4L2_CID_FLASH_STROBE_OE, 0, 1, 1, 0);
>
> -       exposure_us = ov9282_lines_to_us(ov9282, OV9282_EXPOSURE_DEFAULT);
> +       fd_min = ov9282_lines_to_us(ov9282, 1);
> +       fd_def = ov9282_lines_to_us(ov9282, OV9282_STROBE_FRAME_SPAN_DEFAULT);
>         ov9282->flash_duration =
>                 v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
> -                                 V4L2_CID_FLASH_DURATION, 0, exposure_us, 1,
> -                                 OV9282_STROBE_FRAME_SPAN_DEFAULT);
> +                                 V4L2_CID_FLASH_DURATION, fd_min, S32_MAX, 1,
> +                                 fd_def);

Observation that this changes the default from
OV9282_STROBE_FRAME_SPAN_DEFAULT to ov9282_lines_to_us(ov9282,
OV9282_STROBE_FRAME_SPAN_DEFAULT);. I won't quibble over that though
as any sane user will be setting their desired duration.

Ideally with the commit text fixed:
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

>
>         ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
>         if (!ret) {
>
> --
> 2.53.0
>
>
