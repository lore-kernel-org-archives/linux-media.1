Received: from mail-oo2-f34.google.com (mail-oo2-f34.google.com [74.125.231.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF98501F30
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 16:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.162
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873465; cv=pass; b=dbVt9UE7ESfnu0jElAbBER2CX15af6AZ93BGpf5FW6OxQQnFlQUucVVOqexXHsklVvVsvT3ZejS25WibvZPRJxC5heQ+sZKzVt2qctTBVn9oSLlJybJcyL7bW46et47pxliZ2d+8qvRfkzNhOy4aVap4HkVgUKs/WIr4PixOLKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873465; c=relaxed/simple;
	bh=Z/Pt4iHzmTGZd8lDgdQqN+liVD+302dlRQrpejVIGb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=De+EzqGG2UZEIw/vHaTJBI50sahwph8lNM1bS/ga8eW1E0NluagdH5sKSJGDtkupS/ksQIlBk7wxCxInRZKWYQbr622Ac58ZY429e9Rwzt140rAL6H/pTz414T7bWQdlphfHotLp7h/LdVROpWju58GknMVMr3hSYiKYlrL9DN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=cgI1RHyt; arc=pass smtp.client-ip=74.125.231.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="cgI1RHyt"
Received: by mail-oo2-f34.google.com with SMTP id 006d021491bc7-6de64084488so375555eaf.3
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 09:50:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790873456; cv=none;
        d=google.com; s=arc-20260327;
        b=SDQSmDEguY0wI4XJWYRZVDh1ijyalru2rEtoBfpuOmKz+ludi32aTHvvm3uu+tpOdP
         l75ZLGuGV3wfyZyFD3gVaXyW3hEOKTj99jxb4HRYssWytZAPiJlHoxy5jly9geX0C8RU
         5PO5xKT2L8Bosl1Gjjd2lYkztTZGwoELZQ10AIohGvKxK6Dt6KXyOk6PkWrTpcNxkSzV
         NgHXARMyNlraMlfBAslILZGBjf/2ps3xgnfkZdJscA+LGBpZY1ss/DzRrAimVYKK4+/D
         3L7MSeTh/4t8Pdkir5MEGzWJHBbdqi+Gw1K42Ab2lA8K8Ak6ipxM9yfNDxi7LWyzuATl
         YnRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M4UDS/r0ws+k3dZ66A0pvwJmVSCNZ/qISAilbB0LD6s=;
        fh=4Jr6Mr7AP96t3i05Lq0nr1DWpxOdpkRcnd7jD2ZTBKQ=;
        b=IIbRV4tCjVgkXDuAwD+eDBQm1M6TxlNryS03NF0pLoEKqxUTjstD6h+9tKhqHdD2gz
         NfdCpN/udCG5vru4xU2cO7uE9RkOUQ5E+cXXFmNjRz4THwwuwYy2uCGR6NNRvx6AJUjT
         0PzUMVXGu+QOytzhHM8fvHni8m6FxOY7pBoQ8/gZA+ImoYJmqQqcpkeF0/4t6zlBwM8O
         6FTiFmxNqKD/LqAoYBvFrRtCyGVvMB68EYIfV+kOoDqlmtKuOOxbXT01sYwRzeaPODFE
         DDTpu6tCbi6FlUVQ51AByeAmTjgC2l/OkJVMAhL0UZSspklodPtOHmKh2NwYLGC52Ozt
         e4Zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790873456; x=1791478256; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4UDS/r0ws+k3dZ66A0pvwJmVSCNZ/qISAilbB0LD6s=;
        b=cgI1RHytfVAFFdIdjx/z35eWFWQWtzRSMjH7sTmKcPXA7Lw46jFBmuC+275qFp68CQ
         dpltNj5cTiiqbr87pw+KnhpWGYPsAwaivigXkhFJPhGQrdmq0O6bpJHqgWYYARuj0N4+
         pWUFdgmsHwopYfslmuJu0Icn3Eu3upbz3rFm5BKqCd8xEO/ADr4ZYFclEeq5BsDIToqo
         sWokxBpNzrsqcSj2pYntzyGhsSO3ROwDhkER1nvGLsrBNvgWr5l4fSbQfTsHRQzJ9VKS
         mc/+4t+9hDCDwaeswf6wgNNilT16sn/V0VOQTnZ2WZVsQHCgbSdh7EIC/W89Y34SLp6F
         /+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873456; x=1791478256;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M4UDS/r0ws+k3dZ66A0pvwJmVSCNZ/qISAilbB0LD6s=;
        b=zTCGEIGOpp1i1f9OM9RHRsp+0siTMMp+NmyIPm5K/Vn+gUZedvzkh6RqLsA63vyXif
         nF8Zf2Oo5xf16sIJPvtogfEC2/S83j4LXE71szG2Am0HfuBht1IdHR6a6kKbGuvif5qa
         QYtwwoYoen7TkIIHjGCM//Ciz3EjjZar+Luw87sJ+naMuKVqY+O+B75JUC7NFT7ssYyP
         1yWx9HlNF/Vq6bZtEmlrj8zAgTy1mQF26jO3jY2oK5CWHP6l8F2H9Cl2F9VBV3aw5ciy
         7MUyund0C73J9HBjJ7qmMGuwGTiToIhToHvUztjSP5fzO5RepID133FaPuINZqfVzcwE
         ZwCg==
X-Forwarded-Encrypted: i=1; AKwUvBzqtRRlq38dLgVnIpzSXVAduF8QHUYCtHvYgcPpPvIPrr1nkAMsQc6M5FbGXEDLdOdkSDUr5y5m4fjgXg==@vger.kernel.org
X-Gm-Message-State: AFuF++ncW5g1urrook6yxJXBF+rnDG2pxRIuGc5B62bkQ4JPKFpRz38l
	Z2A3uxMCvR82LJ5CFT/NkBEGlY0hJcIcCeY6+3i9CVap9s9zPNN+HuQRHnC/TXgjgOUSeCXFwKj
	Pej5CF7oiPgxY9OSasxtaEIyUPsDgDG8O1odCoVkhDQ==
X-Gm-Gg: AYBFou3cIYVbYiKLY7RYCF/5FQd7FvXfBVpAIIXE6sy7AfTLxC7Kcftj7x/HjxiVIVW
	BgUh7wa9LoA5Wv4QMUk9jj5TILptW6NlB35FW6mZZwcYVCbhF91eNWo7JvizorDJB8C18yGuw8D
	qMmAmI0h4VngKrDzYa864y63MhXCEnI6OfvPD4yOrje5edtbkuNJ1m1OENgyembBGDDbpI9Ebe+
	9EWQ0ho8uG3JmVZRK7G3aPKbGQ85w55L8VnveBoexSF2S71XqayKpaK5Pl0SQ6GOOssRbfs6+Yt
	piUvX6EzMaoxjxPKNT1UrBDObyjrqaJNiEksW3EumqFtXw+nLHIgdroSVZ4UsaXiPwwNmPApOSH
	vC8TZ1HpyfFyyoRABQbjuiSk/dfLrUuQe5prmh/5u7fHcCRMRJ+C8tTKLQK/9ozQwYDZP4aW8
X-Received: by 2002:a05:6820:4c89:b0:6c9:80d8:a1ec with SMTP id
 006d021491bc7-6dcf5b2beb1mr4733964eaf.41.1790873455249; Thu, 01 Oct 2026
 09:50:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org> <20261001-v4l2-sensor-detect-v1-3-a45993be17b8@kernel.org>
In-Reply-To: <20261001-v4l2-sensor-detect-v1-3-a45993be17b8@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 1 Oct 2026 17:50:36 +0100
X-Gm-Features: AclHuK8bZj6T-wpokTrd8IamyDPA2xXVzcpmrKfxvmyZWiIGgRZgvlAzYjIYUmY
Message-ID: <CAPY8ntBFTGmGHRZX0QAtbV=fQi4p3Obp19SfNHdFq_DrW3-T7g@mail.gmail.com>
Subject: Re: [PATCH RFC 3/5] media: imx219: Allow driver probe with missing sensor
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Maxime Ripard <mripard@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mattijs

On Thu, 1 Oct 2026 at 13:55, Mattijs Korpershoek
<mkorpershoek@kernel.org> wrote:
>
> Probe() should complete even when a sensor is disconnected. This would
> allow the v4l-subdev to be created and improve fault tolerance.
>
> Currently, the driver reads the CHIP_ID over i2c in the probe().
> When we can't read CHIP_ID, the probe errors out - which result in the
> v4l2-subdev not being created.
>
> Remove all i2c communications to allow the driver to probe with a
> missing sensor.
>
> Note: Since we no longer power on the sensor during probe, the driver
> now starts in suspended mode by default.
>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> ---
>  drivers/media/i2c/imx219.c | 72 +++++++++++++++++++++-------------------------
>  1 file changed, 33 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 7978fee5f4a2..aeac70123b9b 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -1000,6 +1000,29 @@ static int imx219_init_state(struct v4l2_subdev *sd,
>         return imx219_set_pad_format(sd, state, &fmt);
>  }
>
> +/* Verify chip ID */
> +static int imx219_identify_module(struct imx219 *imx219)
> +{
> +       struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> +       int ret;
> +       u64 val;
> +
> +       ret = cci_read(imx219->regmap, IMX219_REG_CHIP_ID, &val, NULL);
> +       if (ret) {
> +               dev_dbg(&client->dev, "failed to read chip id %x\n",
> +                       IMX219_CHIP_ID);
> +               return ret;
> +       }
> +
> +       if (val != IMX219_CHIP_ID) {
> +               dev_dbg(&client->dev, "chip id mismatch: %x!=%llx\n",
> +                       IMX219_CHIP_ID, val);
> +               return -EIO;
> +       }
> +
> +       return 0;
> +}
> +
>  static const struct v4l2_subdev_video_ops imx219_video_ops = {
>         .s_stream = v4l2_subdev_s_stream_helper,
>  };
> @@ -1056,6 +1079,14 @@ static int imx219_power_on(struct device *dev)
>         usleep_range(IMX219_XCLR_MIN_DELAY_US,
>                      IMX219_XCLR_MIN_DELAY_US + IMX219_XCLR_DELAY_RANGE_US);
>
> +       /*
> +        * If we can't identify the module here, it might be disconnected.
> +        * Consider power_on() complete and exit early in that case.
> +        */
> +       ret = imx219_identify_module(imx219);

Do we need to identify the module on every power on? Admittedly it's a
lightweight operation here, but for imx678 and the other Starvis2
sensors I'm currently working with you're needing to come out of
standby and wait 80ms before reading the ID registers.

Looking at the rest of the series, polling of detect would notice if
the sensor goes away again within a system that cares about it, so
caching the first successful identify would largely restore the
behaviour for systems that don't care about fault tolerance.
Actually I'd be tempted to keep a call to detect/identify from within
probe so that if the sensor is connected at boot we don't have any
change in behaviour, nor the reporting of the unknown status.

  Dave

> +       if (ret)
> +               return 0;
> +
>         /*
>          * Sensor doesn't enter LP-11 state upon power up until and unless
>          * streaming is started, so upon power up switch the modes to:
> @@ -1117,27 +1148,6 @@ static int imx219_get_regulators(struct imx219 *imx219)
>                                        imx219->supplies);
>  }
>
> -/* Verify chip ID */
> -static int imx219_identify_module(struct imx219 *imx219)
> -{
> -       struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> -       int ret;
> -       u64 val;
> -
> -       ret = cci_read(imx219->regmap, IMX219_REG_CHIP_ID, &val, NULL);
> -       if (ret)
> -               return dev_err_probe(&client->dev, ret,
> -                                    "failed to read chip id %x\n",
> -                                    IMX219_CHIP_ID);
> -
> -       if (val != IMX219_CHIP_ID)
> -               return dev_err_probe(&client->dev, -EIO,
> -                                    "chip id mismatch: %x!=%llx\n",
> -                                    IMX219_CHIP_ID, val);
> -
> -       return 0;
> -}
> -
>  static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
>  {
>         struct fwnode_handle *endpoint;
> @@ -1252,21 +1262,9 @@ static int imx219_probe(struct i2c_client *client)
>                 return dev_err_probe(dev, PTR_ERR(imx219->reset_gpio),
>                                      "failed to get reset gpio\n");
>
> -       /*
> -        * The sensor must be powered for imx219_identify_module()
> -        * to be able to read the CHIP_ID register
> -        */
> -       ret = imx219_power_on(dev);
> -       if (ret)
> -               return ret;
> -
> -       ret = imx219_identify_module(imx219);
> -       if (ret)
> -               goto error_power_off;
> -
>         ret = imx219_init_controls(imx219);
>         if (ret)
> -               goto error_power_off;
> +               return ret;
>
>         /* Initialize subdev */
>         imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> @@ -1288,7 +1286,7 @@ static int imx219_probe(struct i2c_client *client)
>                 goto error_media_entity;
>         }
>
> -       pm_runtime_set_active(dev);
> +       pm_runtime_set_suspended(dev);
>         pm_runtime_enable(dev);
>
>         ret = v4l2_async_register_subdev_sensor(&imx219->sd);
> @@ -1298,7 +1296,6 @@ static int imx219_probe(struct i2c_client *client)
>                 goto error_subdev_cleanup;
>         }
>
> -       pm_runtime_idle(dev);
>         pm_runtime_set_autosuspend_delay(dev, 1000);
>         pm_runtime_use_autosuspend(dev);
>
> @@ -1315,9 +1312,6 @@ static int imx219_probe(struct i2c_client *client)
>  error_handler_free:
>         imx219_free_controls(imx219);
>
> -error_power_off:
> -       imx219_power_off(dev);
> -
>         return ret;
>  }
>
>
> --
> 2.55.0
>
