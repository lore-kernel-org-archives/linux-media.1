Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A90B49C4B6
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 14:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484128; cv=pass; b=LSAn1tvd99jvs45vyxCZFxKFpQw36vfiArpBlwlXAX2EuFGzG/8Up89h8dcnFr+Z8mJxG+xAqQCS0cqTb01rsYJMx4XejBgXIFTXjac6qdoLYg/4yIQCDWw4WD/a6UsTyalMn2I0c051kX/fBXa8gvJrbw4cTDTP91xmYFXEKHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484128; c=relaxed/simple;
	bh=IQOVHgvKNMsV2dpQitqyeqDC65v1umIV6EK+mzQp5cE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+KF0kyAfZMZAA2UAaKLPFFDIGXAc0XNAoXPVzlNJYcMMQMMqH1QljrCsQ/9IaHBv/aaTHQmCq2ulOwyUKZfboJEO4Gg3ea0nJtYLfRt5/vk/FOlYFvGB+mIIrfSyoy2rX7s/WZr93PVzNHePIL34R6I4NUSXjcfaxkabyH1nk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=UBdYAUdt; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="UBdYAUdt"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9107051ba26so2082656d6.1
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 07:55:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789484119; cv=none;
        d=google.com; s=arc-20260327;
        b=Ox39qHqFUb2Fw+GS1dPqhm9a2u0ZtTcLTjUDkYK9JDuquhlJPAntSrhnXvuU5Hu746
         NeEv9Qb+xcFP1+d6LH8GExLKq9QbzWnv7jwkl0fZLhmf4IAEuDDIG2eGFa6AFSa7ueh4
         8xrMPPyt8lpejaZOtboZlwHD4xdlyxYy/EotqHYx/lZP5GKRnSgpaE6bOQ7lqH5VYuW8
         TmNMKHkQIeKEh964wdWwKUvMaqMo0/S3zZeotaFfEFh6k/HuN9SNqDN20RKFVdjK+lAl
         ZxvGBiPj1zR8VRtdA60xKS/5riICd+Z11Z3LYT8E8lL9h/Q1l6ZzIPYmeLy8rgQSzVsb
         Pt2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YkDpn1JCbSK0XZcKlenB4zRb1JTQeGLgWK+EJPOwUG8=;
        fh=Su/viuO3fb9HRN0crhVyQ35zj4LecwbiHNwGkiZOKTM=;
        b=XmsyHik03n3uvl4j031PCrNsp9yQCrtrgA7qsCud/tYpA5hjoiGpaW9tW//sc/0hV1
         JIKX/KXia7LqDYadqac0L89G/hrTKsmgmxr7Nm31OBt5AfAMF0ft8qgUMLOLDQ2C1ZAx
         Td062/uUlL5tQ2Smz41bSBBzcQCmrBY4AOFwGn4d8u0MRuJheIGyFAquMBEXAQMSbudQ
         0j/CsF2u5FGnnFxUlg94ev0fJf/fLLjs/3AghCTnAqF86ksU8K/KXM0vZi6wEIoBomU4
         b4joKLi1hyK+XIysIXBuWUGIhNHttyKpvc7AqrsvPDvkVlJQ482BjapkB3mYqY4nHmEs
         6cBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1789484119; x=1790088919; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YkDpn1JCbSK0XZcKlenB4zRb1JTQeGLgWK+EJPOwUG8=;
        b=UBdYAUdtVuF1rLO5biBHrUPXGibqLC8D0ggCw166/LgkYrJnhy1amStf0bhL9McmQ8
         hAPn+xPXi3qTrXLrg7Y2+DmnQmeezczqXr28Zhu61Iq5r5036d0oMEpCF/5pbXcNGMY+
         jb71BiodQiqdtvOC8Ri/vlurTZHaK6Ehxpyu0aoJBjp35w/t8xYtpluH6DJCirjdSOD0
         0IlmZeVGxCNidXA0+4Hi5dU0j251h6KXt34gXLz/w3L1lNx4/jhVp24nhynYKX6IiIgM
         nwIvtqLJw7QCLPcau4BqMxyQGe6f+m8GVFuceIuhKlYRJgfuGC4sled2ApY3Kaki0On2
         vpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789484119; x=1790088919;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YkDpn1JCbSK0XZcKlenB4zRb1JTQeGLgWK+EJPOwUG8=;
        b=gON//QTfAcWQ3R6bCn5gxkHDxS1Mi2h3g1W4n9lSQUMFDnPfueSSiAgRAiq4bd3rn1
         uZs7ogNyN9nXisWIw4HWaWislapji76Mz7VICp+gtwZx8DeLGXPW7n2IgOxC/3Ug288Y
         dcbANBQQbbOUAdf/svPiCgUs1WFWeSI3A2o7ThT+b4wRqROXvJq7DCd9YhGUvi4L0UKn
         C8/20FSzJhu/U6U3AnrzuZ909AIc/Ad6r8mt9d+4572TLAOqMe+R86963pY6Mz2H9v/e
         Z1Y1nPdOgYQlByarkp3my4WHP8p5LYXCc71SVheYrI9FJsLhNwmnNtItuN99SFyhoN+7
         WPkw==
X-Forwarded-Encrypted: i=1; AKwUvBwCs26Zz5NUImCCJOwQ/CEHQW3FVmpZuES5XD30HW7w6ftca2i1a+BmKZ2zJYJKW7mQwT7qDa2Nn3i2UQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mYxF4KsH3Y/FbZjbDuSp4QJgR6ipg+ihXFwyMKdVI79QrSaqmE
	Z0wqrF/yJtUya5OpbscYQlRojmT1114I9aIyZS6Z3JjuUFAd25OY93HeMAgVHSwDEXWENQlPSQk
	tn3KRi+UnaXjSUIR8OUTHsa7P04dWAVFnK4DIO+onjw==
X-Gm-Gg: AYBFou0JLvg4KSR8WMgPwRpccNrkjKVZo8dajWfTOU1FDezoQtSguHydvl+D+pEpD/Z
	wCAZ4nurvlyjbRCdvggKNyDkm0oIljDDykE2Z+uS2hFEh6tN2bQoRpf95ssUg10vR6jS7AweXNt
	7+QIuKt3tfxfqGSY/ZWnZ3WV7bzXre73u0I0vDrHsGvFB2bSlB9B7GvQ1mwz7dDNDiDbU+X3Vik
	+beU4VAdvuHwISQS7diZUjLAK1b19ay6XEqTA7QckvaZxxU3VOipHkVWyRVR5SNqj4ZK0LXfkLn
	wfaL8Llw/8NHaRjTaOOjIG7ccR2+AhCLmd9ZAfoYMIRSSM5NJSpPMS/caRYH1vXG0dzRRwb/+ql
	DTyBjhwePel+qVPlsQTqjcRW2fhnIIBqNpbq9GQCliVpSONKQqIxnWlZfXChb1rZDUdAfvwve
X-Received: by 2002:a05:6214:4890:b0:90e:9dea:82f0 with SMTP id
 6a1803df08f44-9123a453bfemr21659816d6.15.1789484118558; Tue, 15 Sep 2026
 07:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev> <20260914-ov9282-fixes-v1-8-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-8-f520af59df1b@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 15 Sep 2026 15:55:01 +0100
X-Gm-Features: AcwNN1XJ97RRaChz_Ari5H04vXbpih7jQTNs_yqFVO4YUf8A61DtI85agIxDfRM
Message-ID: <CAPY8ntB-vJR-Z-x3NV18NHueVGuo6zd8J7Mf6GQDYgZuJq8LDw@mail.gmail.com>
Subject: Re: [PATCH 08/10] media: i2c: ov9282: harmonize dev_err_probe usage
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Richard

On Mon, 14 Sept 2026 at 20:21, Richard Leitner
<richard.leitner@linux.dev> wrote:
>
> Use dev_err_probe() for all error messages during probing. This ensures
> there's a common "look-and-feel" in the drivers source code as well as
> the system log.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 38 ++++++++++++++++++--------------------
>  1 file changed, 18 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 28f8b05b4c09e..f728709fcf0a6 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -1109,26 +1109,25 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
>         ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
>                                                      GPIOD_OUT_LOW);
>         if (IS_ERR(ov9282->reset_gpio)) {
> -               dev_err(ov9282->dev, "failed to get reset gpio %pe",
> -                       ov9282->reset_gpio);
> -               return PTR_ERR(ov9282->reset_gpio);
> +               return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->reset_gpio),
> +                                    "failed to get reset gpio");
>         }
>
>         /* Get sensor input clock */
>         ov9282->inclk = devm_v4l2_sensor_clk_get(ov9282->dev, NULL);
>         if (IS_ERR(ov9282->inclk))
>                 return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->inclk),
> -                                    "could not get inclk\n");
> +                                    "could not get inclk");

My understanding is that dev_err_probe should always have the \n on
the end of the log text.
Admittedly "failed to get reset gpio %pe" above is missing it, but
removing it off all the other instances seems to be the wrong fix.

Otherwise the patch looks fine.

  Dave

>
>         ret = ov9282_configure_regulators(ov9282);
>         if (ret)
>                 return dev_err_probe(ov9282->dev, ret,
> -                                    "Failed to get power regulators\n");
> +                                    "Failed to get power regulators");
>
>         rate = clk_get_rate(ov9282->inclk);
>         if (rate != OV9282_INCLK_RATE) {
> -               dev_err(ov9282->dev, "inclk frequency mismatch");
> -               return -EINVAL;
> +               return dev_err_probe(ov9282->dev, -EINVAL,
> +                                    "inclk frequency mismatch");
>         }
>
>         ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> @@ -1144,16 +1143,15 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
>                 bus_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
>
>         if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV9282_NUM_DATA_LANES) {
> -               dev_err(ov9282->dev,
> -                       "number of CSI2 data lanes %d is not supported",
> -                       bus_cfg.bus.mipi_csi2.num_data_lanes);
> -               ret = -EINVAL;
> +               ret = dev_err_probe(ov9282->dev, -EINVAL,
> +                                   "number of CSI2 data lanes %d is not supported",
> +                                   bus_cfg.bus.mipi_csi2.num_data_lanes);
>                 goto done_endpoint_free;
>         }
>
>         if (!bus_cfg.nr_of_link_frequencies) {
> -               dev_err(ov9282->dev, "no link frequencies defined");
> -               ret = -EINVAL;
> +               ret = dev_err_probe(ov9282->dev, -EINVAL,
> +                                   "no link frequencies defined");
>                 goto done_endpoint_free;
>         }
>
> @@ -1382,14 +1380,14 @@ static int ov9282_probe(struct i2c_client *client)
>
>         ret = ov9282_parse_hw_config(ov9282);
>         if (ret) {
> -               dev_err(ov9282->dev, "HW configuration is not supported");
> -               return ret;
> +               return dev_err_probe(ov9282->dev, ret,
> +                                    "HW configuration is not supported");
>         }
>
>         ov9282->regmap = devm_cci_regmap_init_i2c(client, 16);
>         if (IS_ERR(ov9282->regmap))
>                 return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->regmap),
> -                                    "Failed to init CCI\n");
> +                                    "Failed to init CCI");
>
>         ret = ov9282_power_on(ov9282->dev);
>         if (ret)
> @@ -1399,7 +1397,7 @@ static int ov9282_probe(struct i2c_client *client)
>         /* Check module identity */
>         ret = ov9282_detect(ov9282);
>         if (ret) {
> -               dev_err(ov9282->dev, "failed to find sensor: %d", ret);
> +               dev_err_probe(ov9282->dev, ret, "failed to find sensor");
>                 goto error_power_off;
>         }
>
> @@ -1409,7 +1407,7 @@ static int ov9282_probe(struct i2c_client *client)
>
>         ret = ov9282_init_controls(ov9282);
>         if (ret) {
> -               dev_err(ov9282->dev, "failed to init controls: %d", ret);
> +               dev_err_probe(ov9282->dev, ret, "failed to init controls");
>                 goto error_power_off;
>         }
>
> @@ -1422,14 +1420,14 @@ static int ov9282_probe(struct i2c_client *client)
>         ov9282->pad.flags = MEDIA_PAD_FL_SOURCE;
>         ret = media_entity_pads_init(&ov9282->sd.entity, 1, &ov9282->pad);
>         if (ret) {
> -               dev_err(ov9282->dev, "failed to init entity pads: %d", ret);
> +               dev_err_probe(ov9282->dev, ret, "failed to init entity pads");
>                 goto error_handler_free;
>         }
>
>         ov9282->sd.state_lock = ov9282->ctrl_handler.lock;
>         ret = v4l2_subdev_init_finalize(&ov9282->sd);
>         if (ret < 0) {
> -               dev_err_probe(ov9282->dev, ret, "failed to init subdev\n");
> +               dev_err_probe(ov9282->dev, ret, "failed to init subdev");
>                 goto error_media_entity;
>         }
>
>
> --
> 2.53.0
>
>
