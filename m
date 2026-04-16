Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B7B26AF4
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 14:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776349721; cv=none; b=iS6gKk68Cu5PJs2qtAhms0v6zTKKePG8uL2st82CMvoWUGRZCJbRM0bAvutKWQfWHvh0YeQT9Cw/TH+LhdpOvrB4Z1OiYssHLatFp/r5DsnDsDjEK7Rtr+hiQRYmNlGv+GoK4Tr94+PFgKLjVYXiujOU9SMpo50o6kFYvP8+W50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776349721; c=relaxed/simple;
	bh=Un1XxPJ3OlZFaFaLqB5NnRBDSzmrpWTNy7etUJRDZZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRlQyoGj38bAayfZqQ2ci+D7bCz+G8wIRalmlYz7HQIVtW4s30UecbXCJSBj9EXuLm9jN7fH4LsGyRkvnKoQnPzae67bpqunfzZVN0bPVxJQzbd8RM4UWQROXOB/cfCXiSR7lVI3PXZM5soVO64VgUi5MfLuYILR2ghXAqpWlME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eDxysJ/Q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eDxysJ/Q"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B4312132;
	Thu, 16 Apr 2026 16:27:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776349624;
	bh=Un1XxPJ3OlZFaFaLqB5NnRBDSzmrpWTNy7etUJRDZZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eDxysJ/QnJBkpKKLIen7HnFkuYLwuuofBO5gHNw8T4Efw8XdQprp6l3kJRyvG6Weg
	 dD36tDD7e6SKh4sRjaoolOaKwicHSA48U8QOCWjEAIr6fb2KczMA4xSCIjJx5hcq9r
	 wuYPTKPwpmkZsszJib61kyDOwm6fk+9dqEzBqj4M=
Date: Thu, 16 Apr 2026 17:28:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 12/29] media: ov9282: Remove redundant kernel-doc
 comments
Message-ID: <20260416142837.GJ1775831@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-13-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-13-sakari.ailus@linux.intel.com>

On Wed, Apr 08, 2026 at 06:39:21PM +0300, Sakari Ailus wrote:
> Remove kernel-doc comments from regular callback functions. These comments
> have no information value.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ov9282.c | 67 --------------------------------------
>  1 file changed, 67 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 2167fb73ea41..5b6f897a74fc 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -586,18 +586,6 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
>  	return DIV_ROUND_UP(value * frame_width, OV9282_STROBE_SPAN_FACTOR);
>  }
>  
> -/**
> - * ov9282_set_ctrl() - Set subdevice control
> - * @ctrl: pointer to v4l2_ctrl structure
> - *
> - * Supported controls:
> - * - V4L2_CID_VBLANK
> - * - cluster controls:
> - *   - V4L2_CID_ANALOGUE_GAIN
> - *   - V4L2_CID_EXPOSURE
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct ov9282 *ov9282 =
> @@ -704,14 +692,6 @@ static const struct v4l2_ctrl_ops ov9282_ctrl_ops = {
>  	.try_ctrl = ov9282_try_ctrl,
>  };
>  
> -/**
> - * ov9282_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
> - * @sd: pointer to ov9282 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @code: V4L2 sub-device code enumeration need to be filled
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int ov9282_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)
> @@ -780,14 +760,6 @@ static void ov9282_fill_pad_format(struct ov9282 *ov9282,
>  	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
>  }
>  
> -/**
> - * ov9282_get_pad_format() - Get subdevice pad format
> - * @sd: pointer to ov9282 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @fmt: V4L2 sub-device format need to be set
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int ov9282_get_pad_format(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_format *fmt)
> @@ -807,14 +779,6 @@ static int ov9282_get_pad_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -/**
> - * ov9282_set_pad_format() - Set subdevice pad format
> - * @sd: pointer to ov9282 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - * @fmt: V4L2 sub-device format need to be set
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int ov9282_set_pad_format(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_format *fmt)
> @@ -852,13 +816,6 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> -/**
> - * ov9282_init_state() - Initialize sub-device state
> - * @sd: pointer to ov9282 V4L2 sub-device structure
> - * @sd_state: V4L2 sub-device configuration
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int ov9282_init_state(struct v4l2_subdev *sd,
>  			     struct v4l2_subdev_state *sd_state)
>  {
> @@ -1157,12 +1114,6 @@ static const struct v4l2_subdev_internal_ops ov9282_internal_ops = {
>  	.init_state = ov9282_init_state,
>  };
>  
> -/**
> - * ov9282_power_on() - Sensor power on sequence
> - * @dev: pointer to i2c device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int ov9282_power_on(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> @@ -1206,12 +1157,6 @@ static int ov9282_power_on(struct device *dev)
>  	return ret;
>  }
>  
> -/**
> - * ov9282_power_off() - Sensor power off sequence
> - * @dev: pointer to i2c device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int ov9282_power_off(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> @@ -1333,12 +1278,6 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	return 0;
>  }
>  
> -/**
> - * ov9282_probe() - I2C client device binding
> - * @client: pointer to i2c client device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static int ov9282_probe(struct i2c_client *client)
>  {
>  	struct ov9282 *ov9282;
> @@ -1435,12 +1374,6 @@ static int ov9282_probe(struct i2c_client *client)
>  	return ret;
>  }
>  
> -/**
> - * ov9282_remove() - I2C client device unbinding
> - * @client: pointer to I2C client device
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
>  static void ov9282_remove(struct i2c_client *client)
>  {
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);

-- 
Regards,

Laurent Pinchart
