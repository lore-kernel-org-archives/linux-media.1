Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924F635C1BD;
	Tue, 14 Jul 2026 11:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784028989; cv=none; b=ZipxwWuxh+ISJex2upTXB7Or3UDz+8uxd4ZgOASL9T/YRJCmEWa/UfOvw9AIg12LtkTZsuJP3Q3vT7bmiBIhjMuB4Z8IxeFWWB3zy37f7X9GLO10thM6rCbhtrjsXbm9VhKs6oq2QIh7cGtOoReuWaK/4EV6o2E+VvO5Zp7vrDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784028989; c=relaxed/simple;
	bh=YDjvmbpWIrtlGPcVMzL5cFtWnoLtPzwtrwnMNnUkhPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXAF0IP2pxq88RYgQ6FR1+l0pwNoJzsRwE8ZbkeI3m62FQKdHFszm8VzyBd+6jh01Sl8PMW9zEBZc3Ka0FT03/L3bqRhjCEau0w8P0l70ngud7zN10HqVGI551OSbyF9b3/19jTDvVQNA5SDKLe68XZ8tx1u3/KEx/EwkWz6YTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PgVN1X/a; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PgVN1X/a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784028988; x=1815564988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YDjvmbpWIrtlGPcVMzL5cFtWnoLtPzwtrwnMNnUkhPw=;
  b=PgVN1X/ad+HrQCO/5K6tYKJ4WM1xlluyr02pjpkRF9kzht6CtpJiEIrw
   1XjpyjtEqWnPb8aK/S303BlwlWmFKCFbHyIfmhdn5vWcE8p+iwx0JcShd
   DHriYOEq9TDNEXLTOa2aK1+tMjkBMTZyvH0lrNIfNSUJjRf+WVCds/wuA
   e8INGeeFzdapKXrrNU64VzfH4pAgCgLBRfpvIteuUEB/M2xhZcw1Q5LDv
   1TSDZOzoJ4+NdD8i7w2fOMfhpFLprBEgIr6QwqBm8dsmayT3CJ1I2N0GR
   shBdpGkjr4XTfJ/IHVMbPbq3V1U9WOpxPfzr6gRfMOxwmegCgZ/vhX5Lj
   A==;
X-CSE-ConnectionGUID: BADjSHWiRt+ypBWhf6Rtrw==
X-CSE-MsgGUID: 3giPNZLJSdqLHtFgUPl0pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="95249122"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="95249122"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 04:36:27 -0700
X-CSE-ConnectionGUID: hMR+49mZT0mZA6vNwnKt+g==
X-CSE-MsgGUID: 5GCO/4VHT2q88LKYf3rxiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="285910405"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.245])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 04:36:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BA8BC11F8AD;
	Tue, 14 Jul 2026 14:36:22 +0300 (EEST)
Date: Tue, 14 Jul 2026 14:36:22 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Acayan <mailingradian@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Heidelberg <david@ixit.cz>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 12/20] media: imx355: Use pm_runtime autosuspend_delay
Message-ID: <alYfNhqYLLP7Ob2m@kekkonen.localdomain>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
 <20260708-media-imx355-v3-12-9df386a623d7@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-media-imx355-v3-12-9df386a623d7@raspberrypi.com>

Hi Dave,

On Wed, Jul 08, 2026 at 03:48:48PM +0100, Dave Stevenson wrote:
> Avoid powering the sensor up and down unnecessarily by using
> pm_runtime's autosuspend_delay feature.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/imx355.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index ee1f41a66a0b..f01a1a5ae7c9 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -1073,7 +1073,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
>  			goto err_rpm_put;
>  	} else {
>  		imx355_stop_streaming(imx355);
> -		pm_runtime_put(imx355->dev);
> +		pm_runtime_put_autosuspend(imx355->dev);
>  	}
>  
>  	/* vflip and hflip cannot change during streaming */
> @@ -1085,7 +1085,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
>  	return ret;
>  
>  err_rpm_put:
> -	pm_runtime_put(imx355->dev);
> +	pm_runtime_put_autosuspend(imx355->dev);
>  err_unlock:
>  	mutex_unlock(&imx355->mutex);
>  
> @@ -1436,6 +1436,8 @@ static int imx355_probe(struct i2c_client *client)
>  	pm_runtime_set_active(imx355->dev);
>  	pm_runtime_enable(imx355->dev);
>  	pm_runtime_idle(imx355->dev);
> +	pm_runtime_set_autosuspend_delay(imx355->dev, 1000);
> +	pm_runtime_use_autosuspend(imx355->dev);

I think it'd make sense to do this before calling pm_runtime_idle(),
wouldn't it?

There's also a pre-existing bug here: if pm_runtime_idle() powers the
sensor off before calling pm_runtime_disable(), imx355_power_off() will get
called twice. The easiest fix is to call pm_runtime_idle() only after
v4l2_async_register_subdev_sensor().

This should be fixed before adding autosuspend support.

>  
>  	ret = v4l2_async_register_subdev_sensor(&imx355->sd);
>  	if (ret < 0)
> @@ -1446,6 +1448,7 @@ static int imx355_probe(struct i2c_client *client)
>  error_media_entity_runtime_pm:
>  	pm_runtime_disable(imx355->dev);
>  	pm_runtime_set_suspended(imx355->dev);
> +	pm_runtime_dont_use_autosuspend(imx355->dev);
>  	media_entity_cleanup(&imx355->sd.entity);
>  
>  error_handler_free:
> @@ -1476,6 +1479,8 @@ static void imx355_remove(struct i2c_client *client)
>  		pm_runtime_set_suspended(imx355->dev);
>  	}
>  
> +	pm_runtime_dont_use_autosuspend(imx355->dev);
> +
>  	mutex_destroy(&imx355->mutex);
>  }
>  
> 

-- 
Kind regards,

Sakari Ailus
