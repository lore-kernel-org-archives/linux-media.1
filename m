Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D5A331EDF
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 07:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077374; cv=none; b=Iao4ORgLdK6lDtEhWL7vIL9G21bMN+X7CMIsdmjGcUpeI6eM1w2syNrsO5FhUU9l68IWcw7ByYlUQTDgHgJNCDU7YTH9jzVtElBVVl8uaIo0ze1BAkK8xcfuWClO8jxIJadalgCWXsl1P3/qQDlUC4hQZ5NXObHWX0Vl1/TEGdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077374; c=relaxed/simple;
	bh=U/Of1n+uhq6/5QV3nX+KcQG7+Y52KmwUJE41/smBUE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFghPFjC797FKOFVltqYdv/0kl3qTtDS3eSaqw7a+cB2dL6fsnmqiZtyomE3wsB0+8z0Cr5hwV0It+eGrRuDwWic0/7o8dd2WBberkoRQSQOPsO5NZHHZdZPFFdcBfeHF/m7u0O21+dxU8XXMn80yQoGfjUOvPM7VwooO3uus44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ig9ZHfGl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ig9ZHfGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781077373; x=1812613373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U/Of1n+uhq6/5QV3nX+KcQG7+Y52KmwUJE41/smBUE4=;
  b=ig9ZHfGlNI8JKeN5+zA88bWMFB8bQMg3v8xwiZgSsiHCIHQ00z+sFxtv
   NLXW5bUoGqmY4/yZbDLH6KhZx9+MfS6FONds22U/bXcF0u6hnw8LS2fTJ
   2KCujN1IAkpLYsoCGG+K2IV3omuUbl8+VKO2JnVmA9Ee92fNuUGLdp/YJ
   zMXZKeEFlBbZwUjwdVfpEWOY2JrgJqxlmt0PECwAir2NN55c1+DKQGPxA
   z11FhDAkCVUhG9jk4x7ZpC3WF19vDuaoP6Sv4EFTU8QDyNsPSh/rjrb5s
   NNkozui+sUJeD/nD22BIlpf2l0mQXNTdx0PKiPKo310e8N0J12JGErHZz
   g==;
X-CSE-ConnectionGUID: VdwNX/YVQ12yE+e1fj0R3A==
X-CSE-MsgGUID: 8a+GdNuCSyazPGN2P0MG2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="80880076"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="80880076"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 00:42:52 -0700
X-CSE-ConnectionGUID: ohw6bWEmTX2ZXdk8ZS6ldw==
X-CSE-MsgGUID: g1sISfTPRauvHiHpqz1e6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="276284611"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.253])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 00:42:50 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 06581121C50;
	Wed, 10 Jun 2026 10:42:47 +0300 (EEST)
Date: Wed, 10 Jun 2026 10:42:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jurison Murati <eng.juri@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: ov8865: Program the mode on stream start
 if needed
Message-ID: <aikVdle5ZEqT2Cqz@kekkonen.localdomain>
References: <20260609232255.13559-1-eng.juri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609232255.13559-1-eng.juri@gmail.com>

Hi Jurison,

On Wed, Jun 10, 2026 at 01:22:54AM +0200, Jurison Murati wrote:
> The sensor registers are only written in the runtime PM resume
> handler; ov8865_set_fmt() merely stores the requested mode, relying on
> the sensor being runtime suspended between uses so that the next
> resume applies it.
> 
> That assumption breaks when something keeps the sensor powered. On
> IPU3 platforms, ipu_bridge instantiates the VCM device with a
> DL_FLAG_PM_RUNTIME device link to the sensor, so a userspace process
> holding the VCM subdev open (e.g. wireplumber's camera monitor) pins
> the sensor runtime-active. A subsequent set_fmt() then never reaches
> the hardware: the sensor keeps streaming the mode programmed on the
> last resume while the CSI-2 receiver expects the newly negotiated
> format.
> 
> On a Surface Book 2 (IPU3, ov8865 + dw9719 VCM), requesting the
> 3264x2448 mode while the hardware was left programmed for the
> 1632x1224 binned mode makes ipu3-cio2 report "frame sync error" and
> "payload length is 10340352, received 2585088" (exactly one binned
> frame) for every frame, and the inverse case stalls the stream after
> a single frame. Camera applications end up displaying one bogus frame
> forever.
> 
> Track the mode actually programmed into the hardware, invalidate it
> when the sensor is powered off, and reprogram the sensor on stream
> start whenever it does not match the negotiated mode, re-applying the
> control values afterwards.
> 
> Signed-off-by: Jurison Murati <eng.juri@gmail.com>
> ---
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -670,6 +670,10 @@
>  	const struct ov8865_mode *mode;
>  	u32 mbus_code;
>  
> +	/* Mode currently programmed into the hardware, NULL when unpowered. */
> +	const struct ov8865_mode *hw_mode;

We'd rather like to get rid of state outside sub-device state, not add more
of it.

> +	u32 hw_mbus_code;

Same for this one.

Could you simply write the configuration to the sensor when it changes?

> +
>  	bool streaming;
>  };
>  
> @@ -2383,6 +2387,9 @@
>  		return ret;
>  	}
>  
> +	sensor->state.hw_mode = sensor->state.mode;
> +	sensor->state.hw_mbus_code = sensor->state.mbus_code;
> +
>  	return 0;
>  }
>  
> @@ -2618,6 +2625,25 @@
>  	}
>  
>  	mutex_lock(&sensor->mutex);
> +
> +	/*
> +	 * If something else kept the sensor powered (e.g. the VCM's PM
> +	 * device link holding it active), runtime resume did not run when
> +	 * streaming was requested and the hardware may still be programmed
> +	 * for a previous mode. Reprogram it to match the current state.
> +	 */
> +	if (enable && (state->hw_mode != state->mode ||
> +		       state->hw_mbus_code != state->mbus_code)) {
> +		ret = ov8865_sensor_init(sensor);
> +		if (!ret)
> +			ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
> +		if (ret) {
> +			mutex_unlock(&sensor->mutex);
> +			pm_runtime_put(sensor->dev);
> +			return ret;
> +		}
> +	}
> +
>  	ret = ov8865_sw_standby(sensor, !enable);
>  	mutex_unlock(&sensor->mutex);
>  
> @@ -2895,6 +2921,8 @@
>  	ret = ov8865_sensor_power(sensor, false);
>  	if (ret)
>  		ov8865_sw_standby(sensor, false);
> +	else
> +		state->hw_mode = NULL;
>  
>  complete:
>  	mutex_unlock(&sensor->mutex);

-- 
Regards,

Sakari Ailus
