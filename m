Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344A83655E4
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 17:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790876132; cv=pass; b=Todn7mO+Xo9aqVbv7Q+eJ3MoRZjqkv/lzpL0CkJoZ8v3zvHU2ft/6zOEcpZPzvhjtqj3fU+0ty0OIgwdeZDmyKhAhXpVaYArYx01QwRc5OmJOhBG0FvSEhEQ4qm0XDY/mCqLBaNu7kpo1EJEA4nt1q2DbwwZI7CHMqzEZVc+7II=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790876132; c=relaxed/simple;
	bh=5H89zJsT1glGqIxNV28jSb1zxhMXNmpaBKbJAUPPgw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qphE9Aee320pktkJHV5dOPJ74HrjCep6q8VS6Ch/CSlX/WJFlKtgyJYvuve+Ws1/34TcQDI9OTOdP6ImQ71g6WvXNivAIrTUNCEm5xPPsVKMYhEo14u+JYLRrWuVFU31W3d4NXJdNE5q4EEIyegJsuB4qxm8zUY6PWxjC6CFBQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Jb/yu2UT; arc=pass smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Jb/yu2UT"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-80a71781323so3989850a34.1
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 10:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790876129; cv=none;
        d=google.com; s=arc-20260327;
        b=WOOKa6z7BOCq60JQm4ilCp4HSu+lWtYSFpsKNyLy5pFl7bzrWr/T64JK0ZgcuOHz58
         l4FB+7v38bgbVvDFlTHobj/8pxEUOLGaSG6Pev7fwXe2wnCkPxL+JSN8YHKm960kOGbg
         6kyovhPY2VqoloqPIQmqiNj1yWFY+FjNNaqRuSV1k/A4oT/cKsnR+CeUI0mykHKEpYiV
         1mdaYQcpL4tDsCuBiRbh/FF8G03KeDqDwDbHsahmhifgG09mCiYPSMBJ4wqiSZ6k20o/
         AbTDiQE73yxPUXQxlnE19S3FsqLNNpbC4kxGU4lpJ2PQCi2BgzZO3O+dZiY9xnjFyLiX
         RvBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1DJxKX88BCdOiMB3cylf6j7NNRjIHAc5OsvnEtisRD8=;
        fh=OP+BgDo4TaVeneJ6YG4hU0pi7Y98teg9tlN/6AMIy3I=;
        b=EqyIrBPC8FAa3cKKEGqm7uCpR9usgwR+R6NwtQ6HFm60WSBGemhmarRDEfhw3/9z8f
         X08J3ktog+xr3jV8q9XAwETdYAvekCzbM/6MbSr9gwFyrKYnrUIHa3woD+cmpnnmd3Cc
         +m7FVkHAq5kD7kMnO16rPJfMiS70lBe3DAlUhMjw5CqdLY1J0yVDG9QI6Wegogmp7Ypj
         GTBcfDUWAQojLNnxSZ7yEI3joN/CStD6xQNd13obBT39+2WYAXTNB1aDxZ4URJgMwb5e
         RbqEDBRxdXdHqyU280ekhsloNxcDRoRnjmX2KkFiKv2UWOAPiQVbBkCEQglp4qu7LZ27
         vCeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790876129; x=1791480929; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1DJxKX88BCdOiMB3cylf6j7NNRjIHAc5OsvnEtisRD8=;
        b=Jb/yu2UTC93xe+8+MkpKhOjTLyXs+OmTsoht3cwNmJ492U+Mv2wAQP1aCPRPEOqN+g
         BIrtJ9KErbxJHPzf0pjzxZT0kNdwkVn5lsC2TO5de29I7w4SjiN8XcwuIUx5756Vzjfn
         vlDbyUeJwO5gnAIz2UpC5FtnRKKJqol8MMfAnDfzMYud+F9A88irykF/B7u/3BNucyhA
         RVY8U2h9MDjJdcayTxdkM6/nvoVNvDvQuSkJKbLu3/lMFPEi2RCDX75NpW0sJG4TACNP
         +UY7nClIAeE7jqA3WSWQ2elYESXzmV4DqdQ1GtmUryw2kl1IJAqrG2BPn+5sOCMBayil
         k/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790876129; x=1791480929;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1DJxKX88BCdOiMB3cylf6j7NNRjIHAc5OsvnEtisRD8=;
        b=bOV1+Tn5HwSbHrDisuW6Eo86N7Y/+mQ1D697AnlldqM1SamOtONoaubymkBj6JITsH
         ZMx7ZCIoDuSYjACHBw3/pRtFpacLkGshtyUZDUkpIxtruIBNPw4jRxsGdohWP5xuJJlC
         5LENmOxRD4+JEBrpPyTy6kAMu9oBlELR4wrX62T5FKJ5RntsGO/j5oSfwYxeT6idbg7v
         eznkdxzAB2TEY0Taqzd6WOzVS12hSyFAAcWETydTUQfFONwDWuE1yOL/8c4syaSYKszm
         WC0PsB+3nB0VsD1whRkk+y51zr1LfUIJBVzNOMdjSExssTam3PDyaf2dmgik65AMBwW6
         Qgbg==
X-Forwarded-Encrypted: i=1; AKwUvBwCdJd2FK15anfSb/r7sd/FmH1s4mWpaX4NbS/qmtAzwXOi8pQefqv0sOhDrIFIzn3cy05JmRJHzuCiHg==@vger.kernel.org
X-Gm-Message-State: AFuF++nPR+6JC6C0TW1H88xoCFFc22HkxFNo1W8B84m2BFqu731YTcod
	cGPX8o7RyezsUfe9Mna0+IjImVCe+f0R7aWNkYxYz5Xtvb6R/TomowY+I0iiRT78bIJ2Kpxsndk
	exMy2uIwwZ7giOdOhmcTbRYL2EQGK+G/Jpt8xtUyddA==
X-Gm-Gg: AYBFou060EsG9K2wpilHToOZYc3kPJvIulcXWGzekagqxogwQ/rphJ07FCwvX3iK6DX
	yazkM7EXW0SMgfpCKCBmeO/6fG9zFiwnTFQy6D2MeOsO2tJSSDWL2lKKzeYA1Sjth5PUpOUSqO0
	g76I42V75wODQmdoCfrz10FNJsxuLwovZ2SsNh8vrpLWtb2c87pcfTtZkEeQJIjrUuZZj0CanOm
	p0Vr+We8+c4cLtpgNlnpmmVz/Hjni5ALwVZ6d9SNaOcO99k5rfnhGiphUo3dyK8FnBk38duw/jy
	59tAC6GSd1EH/VVa0dTY0bjceW8lhVkXLX8ggP6q3+6TLFm3Z/381fuFp0W+5h0AOqX4Q87Qd7H
	E30hVUNAO4hsYEigdMS+SZvVrzhOE4h8eBOieCzL70bccYNr59Zt9FrS6rp9LhZkStq87uFqJ
X-Received: by 2002:a05:6820:81c9:b0:6de:73e2:4982 with SMTP id
 006d021491bc7-6df361231c0mr42119eaf.88.1790876128897; Thu, 01 Oct 2026
 10:35:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
 <20261001-v4l2-sensor-detect-v1-3-a45993be17b8@kernel.org> <CAPY8ntBFTGmGHRZX0QAtbV=fQi4p3Obp19SfNHdFq_DrW3-T7g@mail.gmail.com>
In-Reply-To: <CAPY8ntBFTGmGHRZX0QAtbV=fQi4p3Obp19SfNHdFq_DrW3-T7g@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 1 Oct 2026 18:35:11 +0100
X-Gm-Features: AclHuK_nzKwrsM4uFwJ0K2koZLlkJjsdVdz_VVCTPh2QZ6rYOUslpVzj1zpy9pU
Message-ID: <CAPY8ntAzRMXc61DvLRRFQBQXxWbVx26r5jCf_dg3PCeiGqKSaw@mail.gmail.com>
Subject: Re: [PATCH RFC 3/5] media: imx219: Allow driver probe with missing sensor
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Michael Riesch <michael.riesch@collabora.com>, Maxime Ripard <mripard@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 17:50, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Mattijs
>
> On Thu, 1 Oct 2026 at 13:55, Mattijs Korpershoek
> <mkorpershoek@kernel.org> wrote:
> >
> > Probe() should complete even when a sensor is disconnected. This would
> > allow the v4l-subdev to be created and improve fault tolerance.
> >
> > Currently, the driver reads the CHIP_ID over i2c in the probe().
> > When we can't read CHIP_ID, the probe errors out - which result in the
> > v4l2-subdev not being created.
> >
> > Remove all i2c communications to allow the driver to probe with a
> > missing sensor.
> >
> > Note: Since we no longer power on the sensor during probe, the driver
> > now starts in suspended mode by default.
> >
> > Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> > ---
> >  drivers/media/i2c/imx219.c | 72 +++++++++++++++++++++-------------------------
> >  1 file changed, 33 insertions(+), 39 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 7978fee5f4a2..aeac70123b9b 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -1000,6 +1000,29 @@ static int imx219_init_state(struct v4l2_subdev *sd,
> >         return imx219_set_pad_format(sd, state, &fmt);
> >  }
> >
> > +/* Verify chip ID */
> > +static int imx219_identify_module(struct imx219 *imx219)
> > +{
> > +       struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> > +       int ret;
> > +       u64 val;
> > +
> > +       ret = cci_read(imx219->regmap, IMX219_REG_CHIP_ID, &val, NULL);
> > +       if (ret) {
> > +               dev_dbg(&client->dev, "failed to read chip id %x\n",
> > +                       IMX219_CHIP_ID);
> > +               return ret;
> > +       }
> > +
> > +       if (val != IMX219_CHIP_ID) {
> > +               dev_dbg(&client->dev, "chip id mismatch: %x!=%llx\n",
> > +                       IMX219_CHIP_ID, val);
> > +               return -EIO;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  static const struct v4l2_subdev_video_ops imx219_video_ops = {
> >         .s_stream = v4l2_subdev_s_stream_helper,
> >  };
> > @@ -1056,6 +1079,14 @@ static int imx219_power_on(struct device *dev)
> >         usleep_range(IMX219_XCLR_MIN_DELAY_US,
> >                      IMX219_XCLR_MIN_DELAY_US + IMX219_XCLR_DELAY_RANGE_US);
> >
> > +       /*
> > +        * If we can't identify the module here, it might be disconnected.
> > +        * Consider power_on() complete and exit early in that case.
> > +        */
> > +       ret = imx219_identify_module(imx219);
>
> Do we need to identify the module on every power on? Admittedly it's a
> lightweight operation here, but for imx678 and the other Starvis2
> sensors I'm currently working with you're needing to come out of
> standby and wait 80ms before reading the ID registers.
>
> Looking at the rest of the series, polling of detect would notice if
> the sensor goes away again within a system that cares about it, so
> caching the first successful identify would largely restore the
> behaviour for systems that don't care about fault tolerance.
> Actually I'd be tempted to keep a call to detect/identify from within
> probe so that if the sensor is connected at boot we don't have any
> change in behaviour, nor the reporting of the unknown status.

And a follow up thought on this one too.

We already return any errors from the I2C writes in
imx219_enable_streams, so reading the ID value here is fairly
redundant. The likelihood of someone having connected a totally
different I2C device on the same I2C bus and address is very low, so
if the writes succeed then you can reasonably assume that the relevant
device is connected.

Perhaps a more useful solution is to still try reading the device ID
during probe. An I2C failure at that point shouldn't abort probe, but
a mismatch on the ID register after a successful read should. Again
that keeps existing users experiencing largely the current behaviour,
but your use case of fault tolerance if not present will also work.

  Dave

>   Dave
>
> > +       if (ret)
> > +               return 0;
> > +
> >         /*
> >          * Sensor doesn't enter LP-11 state upon power up until and unless
> >          * streaming is started, so upon power up switch the modes to:
> > @@ -1117,27 +1148,6 @@ static int imx219_get_regulators(struct imx219 *imx219)
> >                                        imx219->supplies);
> >  }
> >
> > -/* Verify chip ID */
> > -static int imx219_identify_module(struct imx219 *imx219)
> > -{
> > -       struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> > -       int ret;
> > -       u64 val;
> > -
> > -       ret = cci_read(imx219->regmap, IMX219_REG_CHIP_ID, &val, NULL);
> > -       if (ret)
> > -               return dev_err_probe(&client->dev, ret,
> > -                                    "failed to read chip id %x\n",
> > -                                    IMX219_CHIP_ID);
> > -
> > -       if (val != IMX219_CHIP_ID)
> > -               return dev_err_probe(&client->dev, -EIO,
> > -                                    "chip id mismatch: %x!=%llx\n",
> > -                                    IMX219_CHIP_ID, val);
> > -
> > -       return 0;
> > -}
> > -
> >  static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
> >  {
> >         struct fwnode_handle *endpoint;
> > @@ -1252,21 +1262,9 @@ static int imx219_probe(struct i2c_client *client)
> >                 return dev_err_probe(dev, PTR_ERR(imx219->reset_gpio),
> >                                      "failed to get reset gpio\n");
> >
> > -       /*
> > -        * The sensor must be powered for imx219_identify_module()
> > -        * to be able to read the CHIP_ID register
> > -        */
> > -       ret = imx219_power_on(dev);
> > -       if (ret)
> > -               return ret;
> > -
> > -       ret = imx219_identify_module(imx219);
> > -       if (ret)
> > -               goto error_power_off;
> > -
> >         ret = imx219_init_controls(imx219);
> >         if (ret)
> > -               goto error_power_off;
> > +               return ret;
> >
> >         /* Initialize subdev */
> >         imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > @@ -1288,7 +1286,7 @@ static int imx219_probe(struct i2c_client *client)
> >                 goto error_media_entity;
> >         }
> >
> > -       pm_runtime_set_active(dev);
> > +       pm_runtime_set_suspended(dev);
> >         pm_runtime_enable(dev);
> >
> >         ret = v4l2_async_register_subdev_sensor(&imx219->sd);
> > @@ -1298,7 +1296,6 @@ static int imx219_probe(struct i2c_client *client)
> >                 goto error_subdev_cleanup;
> >         }
> >
> > -       pm_runtime_idle(dev);
> >         pm_runtime_set_autosuspend_delay(dev, 1000);
> >         pm_runtime_use_autosuspend(dev);
> >
> > @@ -1315,9 +1312,6 @@ static int imx219_probe(struct i2c_client *client)
> >  error_handler_free:
> >         imx219_free_controls(imx219);
> >
> > -error_power_off:
> > -       imx219_power_off(dev);
> > -
> >         return ret;
> >  }
> >
> >
> > --
> > 2.55.0
> >
