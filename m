Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC3937F8DB;
	Mon,  3 Aug 2026 10:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753184; cv=none; b=t1FljSSTwGyD5e9rpxK8QYAM1kUqrDtc+O5bfaGQ6h3xFkBvcKDgJlp/NI3fAKSec7+FduG4Y9FPBshd8Grp737Wuw/Xl2kHSjJJ/68yhQrgvIfSQiBp+dIUwEHEiVXVLwJKmrMdL+uxdDUUOT6jVydzLBoNffRXY36k+u+EMEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753184; c=relaxed/simple;
	bh=pvvVBBdPmwtc1XqUFY4o6ezb+U0sw/2o9BVK9vwNk+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hyo6x2ZjbvCFWP6eNPNSsQOPBg8eVTgJ3hqpC9/sY+L/BHugRGQglI5sFi/zpFl3Hq0aczogMdpuhed68py4AfQfftSiefI9W5toONBgIpJJ1Es6qAxZxd8jlc0Kc9s5rE1WM4oJH+A8tc2a1WrA7i54G2e5PibrPsfRcUOT/sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqEOEK2f; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqEOEK2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785753182; x=1817289182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pvvVBBdPmwtc1XqUFY4o6ezb+U0sw/2o9BVK9vwNk+8=;
  b=NqEOEK2fzWXT81HI7papkACITwkPL+qeMU/yF93fA+1kAr2kZI0USOOE
   lpNmRMQpCtXGA5uDb4uVqBIZiZZYmrIUIcNIn5Viubk5eyqzH+dNOZN3A
   lOzY2D6yuCF+Bg/Yy6CYR9ruV4g/ewuDn8zQrppmDb1NLw4st+OnqFLJl
   wnJj+WFdEYgUQApGrEsAvwsKJjtje0Og0dt7NhVD1MdzOT27wNIKGjqCj
   nGbzks3rGON4ZrYJGdpNmmjwd3M2uykOVlnCylsUr3Cwp3J3R1pJ8aWAW
   Q0iPc9IZjZ/az11631pu+sfz4M9lhyexiMAQ7ammFWm8oQTVuaSzmeh87
   g==;
X-CSE-ConnectionGUID: 1pAX0ZNlTt2yJAyfGgpY7A==
X-CSE-MsgGUID: QrlaPZSaSPSzH/LG66rPwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86488362"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="86488362"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 03:33:01 -0700
X-CSE-ConnectionGUID: hse4iVV4Sea9JeRrrseioQ==
X-CSE-MsgGUID: ZwTmyxOfQI2NOCGAGhTvKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="263172193"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.14])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 03:28:40 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C92601205B0;
	Mon, 03 Aug 2026 13:28:43 +0300 (EEST)
Date: Mon, 3 Aug 2026 13:28:43 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Philippe Baetens <philippebaetens@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
Message-ID: <anBtWwyNVdKi90Zg@kekkonen.localdomain>
References: <20260727-mira220-v10-0-8825794e6095@ideasonboard.com>
 <20260727-mira220-v10-2-8825794e6095@ideasonboard.com>
 <amjAgRnL0vM2eQJl@kekkonen.localdomain>
 <amypEMpDvY47VkG5@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amypEMpDvY47VkG5@zed>

Hi Jacopo,

On Fri, Jul 31, 2026 at 04:15:53PM +0200, Jacopo Mondi wrote:

...

> > > +	/* Sensor control mode */
> > > +	{ CCI_REG8(0x0043), 0x0 }, //  Sensor Control Mode.SLEEP_POWER_MODE(0)
> > > +	{ CCI_REG8(0x0043), 0x0 }, //  Sensor Control Mode.IDLE_POWER_MODE(0)
> > > +	{ CCI_REG8(0x0043), 0x4 }, //  Sensor Control Mode.SYSTEM_CLOCK_ENABLE(0)
> > > +	{ CCI_REG8(0x0043), 0xC }, //  Sensor Control Mode.SRAM_CLOCK_ENABLE(0)
> > > +	{ CCI_REG8(0x1001), 0x41 }, //  Sensor Control Mode.EXT_EVENT_SEL(0)
> > > +	{ CCI_REG8(0x10f2), 0x1 }, //  Sensor Control Mode.NB_OF_FRAMES_A(0)
> > > +	{ CCI_REG8(0x10f3), 0x0 }, //  Sensor Control Mode.NB_OF_FRAMES_A(1)
> > > +	{ CCI_REG8(0x0012), 0x0 }, //  IO Drive Strength.DIG_DRIVE_STRENGTH(0)
> > > +	{ CCI_REG8(0x0012), 0x0 }, //  IO Drive Strength.CCI_DRIVE_STRENGTH(0)
> > > +	{ CCI_REG8(0x1001), 0x41 }, //  Readout && Exposure.EXT_EXP_PW_SEL(0)
> > > +	{ CCI_REG8(0x10d0), 0x0 }, //  Readout && Exposure.EXT_EXP_PW_DELAY(0)
> > > +	{ CCI_REG8(0x10d1), 0x0 }, //  Readout && Exposure.EXT_EXP_PW_DELAY(1)
> > > +	/* MIPI */
> > > +	{ CCI_REG8(0x6006), 0x0 }, //  MIPI.TX_CTRL_EN(0)
> > > +	{ CCI_REG8(0x5004), 0x1 }, //  MIPI.datarate
> > > +	{ CCI_REG8(0x5086), 0x2 }, //  MIPI.datarate
> > > +	{ CCI_REG8(0x5087), 0x4e }, //  MIPI.datarate
> > > +	{ CCI_REG8(0x5088), 0x0 }, //  MIPI.datarate
> > > +	{ CCI_REG8(0x5090), 0x0 }, //  MIPI.datarate
> >
> > How many of these registers are actually 16 or 32 bits? Does the sensor
> > support wider than single-octet writes -- few don't?
> 
> The sensor is said to support both single read/write and burst read/write
> sequences.
> 
> There is room for improvements here, but as the startup latency is not
> a concern for the time being, I would leave this as an exercize for
> later

Related to the previous comment, it'd be nice to have human-readable names
also for these registers. I'm fine with that if you promise to address this
later. :-)

...

> > > +	ret = pm_runtime_resume_and_get(&client->dev);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	/*
> > > +	 * Apply default values of current mode. Stop streaming before
> > > +	 * uploading register sequence.
> > > +	 */
> > > +	ret = mira220_write_stop_streaming_regs(mira220);
> > > +	if (ret)
> > > +		goto err_rpm_put;
> > > +
> > > +	ret = cci_multi_reg_write(mira220->regmap, mira220_init_reg_list,
> > > +				  ARRAY_SIZE(mira220_init_reg_list), NULL);
> > > +	if (ret)
> > > +		goto err_rpm_put;
> > > +
> > > +	ret = mira220_otp_restore(mira220);
> > > +	if (ret)
> > > +		goto err_rpm_put;
> > > +
> > > +	ret = mira220_set_bus_config(mira220);
> > > +	if (ret)
> > > +		goto err_rpm_put;
> > > +
> > > +	ret = mira220_set_framefmt(mira220, state);
> > > +	if (ret)
> > > +		goto err_rpm_put;
> >
> > Instead of a series of ifs and gotos, you could do
> >
> > 	if (!ret)
> > 		...;
> >
> > Up to you.
> >
> 
> 	ret = pm_runtime_resume_and_get(&client->dev);
> 	if (ret < 0)
> 		return ret;
> 
> 	/*
> 	 * Apply default values of current mode. Stop streaming before
> 	 * uploading register sequence.
> 	 */
> 	if (!ret)
> 		ret = mira220_write_stop_streaming_regs(mira220);
> 	if (!ret)
> 		ret = cci_multi_reg_write(mira220->regmap, mira220_init_reg_list,
> 					  ARRAY_SIZE(mira220_init_reg_list), NULL);
> 	if (!ret)
> 		ret = mira220_otp_restore(mira220);
> 	if (!ret)
> 		ret = mira220_set_bus_config(mira220);
> 	if (!ret)
> 		ret = mira220_set_framefmt(mira220, state);
> 
> 	/* Apply customized values from user */
> 	if (!ret)
> 		ret = __v4l2_ctrl_handler_setup(mira220->sd.ctrl_handler);
> 	if (!ret)
> 		ret = mira220_write_start_streaming_regs(mira220);
> 
> 	if (ret)
> 		goto err_rpm_put;
> 
> 	/* vflip and hflip cannot change during streaming */
> 	__v4l2_ctrl_grab(mira220->hflip, true);
> 	__v4l2_ctrl_grab(mira220->vflip, true);
> 
> 	return 0;
> 
> Looks a bit unusual, but I think I can do that

Such a pattern is used in quite a few sensor drivers.

...

> > > +	/* By default, PIXEL_RATE is read only */
> > > +	v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops, V4L2_CID_PIXEL_RATE,
> > > +			  MIRA220_PIXEL_RATE, MIRA220_PIXEL_RATE, 1,
> > > +			  MIRA220_PIXEL_RATE);
> > > +
> > > +	min_vblank = mira220_calc_min_vblank(mira220);
> > > +	mira220->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
> > > +					    V4L2_CID_VBLANK,
> > > +					    min_vblank, MIRA220_MAX_VBLANK, 1,
> > > +					    min_vblank);
> > > +
> > > +	ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr, NULL, V4L2_CID_LINK_FREQ,
> > > +				      0, 0, &mira220_link_freqs[0]);
> > > +	if (ctrl)
> > > +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > +
> > > +	/*
> > > +	 * Scale hblank according to the number of enabled data lanes to match
> > > +	 * row_length.
> > > +	 */
> > > +	hblank_val = MIRA220_LLP_1600x1400_304 * (2 / mira220->lanes)
> > > +		   - MIRA220_PIXEL_ARRAY_WIDTH;
> > > +	ctrl = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK, hblank_val,
> > > +				 hblank_val, 1, hblank_val);
> > > +	if (ctrl)
> > > +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > +
> > > +	/* Max exposure is determined by vblank + vsize and Tglob. */
> > > +	max_exposure = mira220_calc_exposure(mira220,
> > > +					     MIRA220_PIXEL_ARRAY_HEIGHT,
> > > +					     min_vblank);
> > > +
> > > +	mira220->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
> > > +					      V4L2_CID_EXPOSURE,
> > > +					      MIRA220_EXPOSURE_MIN,
> > > +					      max_exposure, 1,
> > > +					      MIRA220_DEFAULT_EXPOSURE);
> > > +
> > > +	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_ANALOGUE_GAIN,
> > > +			  MIRA220_ANALOG_GAIN_MIN, MIRA220_ANALOG_GAIN_MAX,
> > > +			  MIRA220_ANALOG_GAIN_STEP,
> > > +			  MIRA220_ANALOG_GAIN_DEFAULT);
> > > +
> > > +	mira220->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
> > > +					   V4L2_CID_HFLIP, 0, 1, 1, 0);
> > > +	if (mira220->hflip)
> > > +		mira220->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> >
> > You can omit these checks if you move setting the control flags after
> 
> ah yes
> 
> > checking for the handler's error state. I'd use different variables for the
> > hblank and vblank controls for this reason.
> 
> vblank is writable and stored in the driver structure
> 
> link_freq and hblank are RO and re-use the local 'ctrl' variable.

I indeed meant link_freq indeed, not vblank.

> 
> if I move everything below, I'll have to use 2 different variables for
> sure

Yes, that'd be nice.

...

> > > +	ret = v4l2_async_register_subdev_sensor(&mira220->sd);
> > > +	if (ret < 0) {
> > > +		dev_err_probe(dev, ret,
> > > +			      "failed to register sensor sub-device\n");
> > > +		goto error_subdev_cleanup;
> > > +	}
> > > +
> > > +	pm_runtime_idle(dev);
> >
> > You probably want to call pm_runtime_idle() after setting autosuspend
> > delay.
> >
> To be honest I copied this from imx219 but I can certainly change it.

That could be fixed as well. I'll write a patch for it. :-)

> 
> 
> 
> > > +	pm_runtime_set_autosuspend_delay(dev, 1000);
> > > +	pm_runtime_use_autosuspend(dev);
> > > +
> > > +	return 0;
> > > +
> > > +error_subdev_cleanup:
> > > +	v4l2_subdev_cleanup(&mira220->sd);
> > > +error_media_entity:
> > > +	media_entity_cleanup(&mira220->sd.entity);
> > > +error_handler_free:
> > > +	v4l2_ctrl_handler_free(mira220->sd.ctrl_handler);
> > > +error_power_off:
> > > +	pm_runtime_disable(dev);
> > > +	mira220_power_off(dev);
> > > +	pm_runtime_set_suspended(dev);
> >
> > A newline here perhaps?
> >
> 
> Usually I like to keep error path returns compact
> 
> Thanks, I'll send a new version soon.
> It's mostly minor stuff, do you think I can get this in for this cycle
> (a bit last minute, I know)
> 
> Thanks
>   j
> 
> 
> > > +	return ret;
> > > +}
> > > +
> > > +static void mira220_remove(struct i2c_client *client)
> > > +{
> > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +	struct mira220 *mira220 = to_mira220(sd);
> > > +
> > > +	v4l2_async_unregister_subdev(sd);
> > > +	v4l2_subdev_cleanup(&mira220->sd);
> > > +	media_entity_cleanup(&sd->entity);
> > > +
> > > +	v4l2_ctrl_handler_free(mira220->sd.ctrl_handler);
> > > +
> > > +	pm_runtime_disable(&client->dev);
> > > +	if (!pm_runtime_status_suspended(&client->dev))
> > > +		mira220_power_off(&client->dev);
> > > +	pm_runtime_set_suspended(&client->dev);
> > > +}
> > > +
> > > +static const struct dev_pm_ops mira220_pm_ops = {
> > > +	SET_RUNTIME_PM_OPS(mira220_power_off, mira220_power_on, NULL)
> > > +};
> > > +
> > > +static const struct of_device_id mira220_dt_ids[] = {
> > > +	{ .compatible = "ams,mira220" },
> > > +	{ /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, mira220_dt_ids);
> > > +
> > > +static struct i2c_driver mira220_i2c_driver = {
> > > +	.driver = {
> > > +		.name = "mira220",
> > > +		.of_match_table	= mira220_dt_ids,
> > > +		.pm = pm_ptr(&mira220_pm_ops),

If CONFIG_PM isn't defined, mira220_pm_ops needs to use __maybe_unused. I'd
just drop pm_ops() here.

-- 
Regards,

Sakari Ailus
