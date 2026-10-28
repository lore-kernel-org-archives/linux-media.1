Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193173;
	b=h9W9eP02cYJ6lYmXpH6pN136kS3Ro8carh0/qOurvdU2QsUoEAa7uF426JRhd8aoW9g8
	 rr9+dTD/8FknKRrsRaHCcIuWhkMi8GOoalGcEGfrXn2GWoQtEs52yP278irludrQyf2CU
	 x0o7KVhI4SVcIkr47r2NzxMMQfAzZ0tTU7yL1FkIg3Ky5/QWRrJ87L8c/5fEfxcUVMoAY
	 ld2e+LGPyKQz3OmjVJTV6bz7Zhu++kezKhqcj4R6ucpBA4a0vlimlpLol5OY42iBViO9k
	 9sRQIT2NfLJ57EyM0o5jTnxHnJcI09klNuYysz3Rin1cbr8pFYOH+j+qVyXDcQD2IWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193173;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=gP2KhUm8pkqsFfEyrj7xDyNmIBEM080kJ5p0POAidv8=;
	b=Z6pXS7SOdBKVNreCXjsVEXoiV6iZYcfnzXE2/LnShm3Yi+eWoXBtp0dOc6xujV4dPsQ7
	 rUpKpzoULuq2LVpaXc0/tm9Tp2YVmC9bNLD/NLHJuH6mNe5S6VX+z2ZyeWeKzwfuM8lfR
	 vxM1PbSUufSDYB6Kjom+hbzhucdx539sYl36SrNFOHgFWyifjI4gw/Bn1c+pGkKJuNEzg
	 mL6qB7J87UcZMZYrTYP7DTcSnqqV1vpal2s+arQCd0Vv/n8uQOxCtd+7feSfc5p/+n1Uu
	 9x5ienuf2GG0f3jACLRUQ6ip/IF12OeWvSziHEscwYV8e9u3ZIjJ1dj0DaCZTk18Igw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l1M9Tbyp;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93724606A31C
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93724606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l1M9Tbyp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793193172; x=1824729172;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Rs0gyVDlKOOKdn8KyCJRr66F8jiNfa4M7RGj9+xsBqA=;
  b=l1M9Tbyp5hh+MCQVa/L597vILJjoBYz45gTQKEdsCZqxxg5tcZuy48mF
   PFlKMKBja6009uhE9oo0//jVk2GuC8bcl279qSE0moZ3FbIQTfCwDDAee
   s+G8XZf7SGbeelPYj8prVXug49MrV/OxPz4UHUwHmXLFMgJn0FZqzCFqs
   I16sZrkjIA9mnIKtLSm+TrRgaut3W69NUj/rX6smDUrwo37nTv08xSRxl
   Djdc1rDdKF07EksSYESusbEvevVrH7MayaYkM90mcaNqpJBizFYruvvqy
   gUoDDbw8K2XRZ91doh7l4ul/CaSS+Kbk/UzxTLjGlR23OV6iusb0/B7Ww
   w==;
X-CSE-ConnectionGUID: VUQd6Ql9Q12u0ufPSyXcTQ==
X-CSE-MsgGUID: cru2IGeTRYuoAOe4fUyeAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1786999"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1786999"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 06:12:51 -0700
X-CSE-ConnectionGUID: UPC5bYubTwKMC6UD/+fJTg==
X-CSE-MsgGUID: YDt8GQlWQr6kepgRoP3wYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4970136"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.217])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 06:12:50 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EC837121BA9;
	Wed, 28 Oct 2026 15:12:53 +0200 (EET)
Date: Wed, 28 Oct 2026 15:12:53 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] media: v4l: Call s_stream() on VCM when it is called
 on the associated sensor
Message-ID: <auH01Y1z2LnWBgEp@kekkonen.localdomain>
References: <20240901211834.145186-1-hdegoede@redhat.com>
 <20240901211834.145186-2-hdegoede@redhat.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240901211834.145186-2-hdegoede@redhat.com>

Hi Hans, Laurent,

On Sun, Sep 01, 2024 at 11:18:33PM +0200, Hans de Goede wrote:
> Currently VCM drivers power-up the VCM as soon as the VCM's /dev node
> is opened and through the runtime-pm device-link to the sensor this
> also powers up the sensor.
> 
> Powering up the VCM and sensor when the /dev node is opened is undesirable,
> without a VCM sensors delay powering up until s_stream(1) is called. This
> allows querying / negotiating capabilities without powering things up.
> 
> Sometimes a long running daemon like pipewire may keep the /dev node open
> all the time. The kernel should still be able to powerdown the VCM + sensor
> in this scenario.
> 
> VCM drivers should be able to do the same as sensor drivers and only
> power-up the VCM when s_stream(1) is called on the VCM subdev, but this
> requires that s_stream() is actually called on the VCM when the sensor
> starts / stops streaming.
> 
> The s_stream() call on sensor subdevs is done by CSI-receiver/ISP drivers.
> To avoid needing to change all these call sites to also call s_stream()
> on the VCM (if there is one) handle the VCM in the v4l2-core similar to how
> the core takes care of turning on/off the privacy LED.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c  | 20 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-subdev.c | 28 +++++++++++++++++++++------
>  include/media/v4l2-subdev.h           |  2 ++
>  3 files changed, 44 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index ee884a8221fb..9b854f1d1051 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -330,6 +330,11 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
>  		return 0;
>  	}
>  
> +	if (sd->entity.function == MEDIA_ENT_F_LENS) {

There can be, at least in principle, multiple lenses to control per a sensor.
I don't think we have limitations elsewhere in the framework; still API-wise
we're limited to focus.

> +		dev_dbg(n->sd->dev, "Using %s VCM\n", dev_name(sd->dev));
> +		n->sd->vcm = sd;
> +	}
> +
>  	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
>  
>  	return IS_ERR(link) ? PTR_ERR(link) : 0;
> @@ -871,6 +876,21 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
>  	if (!sd->async_list.next)
>  		return;
>  
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +	if (sd->entity.function == MEDIA_ENT_F_LENS && sd->v4l2_dev && sd->v4l2_dev->mdev) {
> +		struct media_entity *entity;
> +
> +		media_device_for_each_entity(entity, sd->v4l2_dev->mdev) {
> +			struct v4l2_subdev *it = media_entity_to_v4l2_subdev(entity);
> +
> +			if (it->vcm == sd) {
> +				dev_dbg(it->dev, "Clearing VCM\n");
> +				it->vcm = NULL;
> +			}
> +		}
> +	}
> +#endif
> +
>  	v4l2_subdev_put_privacy_led(sd);
>  
>  	mutex_lock(&list_lock);
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 7c5812d55315..24a68d90f686 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -148,17 +148,33 @@ static int subdev_close(struct file *file)
>  }
>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>  
> -static void v4l2_subdev_enable_privacy_led(struct v4l2_subdev *sd)
> +static void v4l2_subdev_enable_privacy_led_and_vcm(struct v4l2_subdev *sd)
>  {
>  #if IS_REACHABLE(CONFIG_LEDS_CLASS)
>  	if (!IS_ERR_OR_NULL(sd->privacy_led))
>  		led_set_brightness(sd->privacy_led,
>  				   sd->privacy_led->max_brightness);
>  #endif
> +
> +	if (sd->vcm && !sd->vcm_enabled &&
> +	    v4l2_subdev_has_op(sd->vcm, video, s_stream)) {
> +		int ret;
> +
> +		ret = v4l2_subdev_call(sd->vcm, video, s_stream, 1);

Would it be wrong to just use Runtime PM for this?

I'm not sure I like the approach taken in the patch but then again the
other suggested solutions don't seem obviously better either.

In the long run, I think we should have a way to tell drivers the userspace
would like the (largely I²C) devices to remain in initialised state rather
than be powered down. That'll require per-file handle controls in practice
so that will have to wait for some time. But it would probably work well
with this.

> +		if (ret)
> +			dev_err(sd->vcm->dev, "Error powering on VCM: %d\n", ret);
> +		else
> +			sd->vcm_enabled = true;
> +	}
>  }
>  
> -static void v4l2_subdev_disable_privacy_led(struct v4l2_subdev *sd)
> +static void v4l2_subdev_disable_privacy_led_and_vcm(struct v4l2_subdev *sd)
>  {
> +	if (sd->vcm && sd->vcm_enabled) {
> +		v4l2_subdev_call(sd->vcm, video, s_stream, 0);
> +		sd->vcm_enabled = false;
> +	}
> +
>  #if IS_REACHABLE(CONFIG_LEDS_CLASS)
>  	if (!IS_ERR_OR_NULL(sd->privacy_led))
>  		led_set_brightness(sd->privacy_led, 0);
> @@ -466,9 +482,9 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
>  		sd->s_stream_enabled = enable;
>  
>  		if (enable)
> -			v4l2_subdev_enable_privacy_led(sd);
> +			v4l2_subdev_enable_privacy_led_and_vcm(sd);
>  		else
> -			v4l2_subdev_disable_privacy_led(sd);
> +			v4l2_subdev_disable_privacy_led_and_vcm(sd);
>  	}
>  
>  	return ret;
> @@ -2289,7 +2305,7 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
>  	 * for all cases.
>  	 */
>  	if (!use_s_stream && !already_streaming)
> -		v4l2_subdev_enable_privacy_led(sd);
> +		v4l2_subdev_enable_privacy_led_and_vcm(sd);
>  
>  done:
>  	if (!use_s_stream)
> @@ -2382,7 +2398,7 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
>  done:
>  	if (!use_s_stream) {
>  		if (!v4l2_subdev_is_streaming(sd))
> -			v4l2_subdev_disable_privacy_led(sd);
> +			v4l2_subdev_disable_privacy_led_and_vcm(sd);
>  
>  		v4l2_subdev_unlock_state(state);
>  	}
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index bd235d325ff9..6568a0cc070b 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1094,6 +1094,7 @@ struct v4l2_subdev {
>  	 */
>  
>  	struct led_classdev *privacy_led;
> +	struct v4l2_subdev *vcm;
>  
>  	/*
>  	 * TODO: active_state should most likely be changed from a pointer to an
> @@ -1104,6 +1105,7 @@ struct v4l2_subdev {
>  	struct v4l2_subdev_state *active_state;
>  	u64 enabled_pads;
>  	bool s_stream_enabled;
> +	bool vcm_enabled;
>  };
>  
>  

-- 
Regards,

Sakari Ailus
