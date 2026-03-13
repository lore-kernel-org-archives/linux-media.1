Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EAE3BD25E;
	Fri, 13 Mar 2026 16:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417688; cv=none; b=HOOA5Gyp103O/uTvuX31Ab4yDHAf2U7ZvIpOV05qmfOYEk8nBDlgP40gYP24nrp9l4mAAYjke1UhIMS4lIrSG/FKbmLlVW5CvDKrVP09JssDB1bezF9QmYkWGIDc6SIBMIEpo4QR2TwHBdJ3OBFB5ROD3qsEyGnGmT7DHKcaGh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417688; c=relaxed/simple;
	bh=SopbJpuXGNqT79D3hh1W7Dwm7h74yJEcJ7bvCVTQUTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hFcPbqK+hebkDi8h46PFtgajgEUFs7t/K9OVyfEjyxTgqgP+At7OPeZGvvWCchSvrgqxagOFlV4UD5QNiLHlAqRuymveBO+XvcSJyX39G5lC3ZKw6YuKuLHSnGm1bKBwjg8LcNhIahQmV5Hbgd/cRzkKHI7XpOyKZhKjhYCEMR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wOcB4oKM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wOcB4oKM"
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB41A5A5;
	Fri, 13 Mar 2026 17:00:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773417616;
	bh=SopbJpuXGNqT79D3hh1W7Dwm7h74yJEcJ7bvCVTQUTk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wOcB4oKMG/XtgutGRDvZR3HERwpDuLpsQ6OloKQUIqmLjupOFxiBY2AYQlN8l7Gxh
	 2c10HIhKrJWB20y+4TOYadyQlovYuuKT3AFempuOoIox5Z9iG7CdztgHQc2gpeJE74
	 LibvnBXXeeRy+6Rit/YvMoAeP0KasLNr40hTHkJ8=
Message-ID: <9e9077dc-aa7f-4365-ad03-9edddd563488@ideasonboard.com>
Date: Fri, 13 Mar 2026 16:01:21 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] media: mali-c55: Fully reset the ISP configuration
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Anthony McGivern <anthony.mcgivern@arm.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Nayden Kanchev <Nayden.Kanchev@arm.com>,
 Konstantin Babin <Konstantin.Babin@arm.com>,
 =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260313-mali-c55-fixes-v7-0-v2-0-885c07961f30@ideasonboard.com>
 <20260313-mali-c55-fixes-v7-0-v2-3-885c07961f30@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260313-mali-c55-fixes-v7-0-v2-3-885c07961f30@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo

On 13/03/2026 14:53, Jacopo Mondi wrote:
> The Mali C55 driver uses an auto-suspend delay of 2000 milli-seconds.
> 
> As the delay is quite large, it is certainly possible that two
> consecutive calls to enable_streams() do not go through a suspend of the
> peripheral, meaning we cannot rely on POW register values for the ISP
> configuration.
> 
> To prevent a streaming session to be initialized with settings from the
> previous one, reset the full ISP configuration to know state disabling or
> bypassing all the ISP blocks the driver supports.

Oh that's annoying - good spot...perhaps the auto-suspend delay should be reduced too, though I 
think this change is prudent anyway:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> 
> Cc: stable@vger.kernel.org
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>   .../media/platform/arm/mali-c55/mali-c55-params.c  | 50 ++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> index c84a6047a570..773e5b6a2b7e 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> @@ -781,6 +781,43 @@ void mali_c55_params_init_isp_config(struct mali_c55 *mali_c55,
>   				 MALI_C55_REG_BYPASS_3_SQUARE_BE,
>   				 MALI_C55_REG_BYPASS_3_SQUARE_BE);
>   
> +	/* Bypass the sensor offset correction (BLS) module */
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BYPASS_3,
> +		MALI_C55_REG_BYPASS_3_SENSOR_OFFSET_PRE_SH,
> +		MALI_C55_REG_BYPASS_3_SENSOR_OFFSET_PRE_SH);
> +
> +	/* Configure 1x digital gain. */
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_DIGITAL_GAIN,
> +				 MALI_C55_DIGITAL_GAIN_MASK, 256);
> +
> +	/* Set all AWB gains to 1x. at both AWB configuration points*/
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_GAINS1,
> +				 MALI_C55_AWB_GAIN00_MASK, 256);
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_GAINS1,
> +				 MALI_C55_AWB_GAIN01_MASK,
> +				 MALI_C55_AWB_GAIN01(256));
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_GAINS2,
> +				 MALI_C55_AWB_GAIN10_MASK, 256);
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_GAINS2,
> +				 MALI_C55_AWB_GAIN11_MASK,
> +				 MALI_C55_AWB_GAIN11(256));
> +
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_GAINS1_AEXP,
> +				 MALI_C55_AWB_GAIN00_MASK, 256);
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_GAINS1_AEXP,
> +				 MALI_C55_AWB_GAIN01_MASK,
> +				 MALI_C55_AWB_GAIN01(256));
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_GAINS2_AEXP,
> +				 MALI_C55_AWB_GAIN10_MASK, 256);
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_GAINS2_AEXP,
> +				 MALI_C55_AWB_GAIN11_MASK,
> +				 MALI_C55_AWB_GAIN11(256));
> +
> +	/* Bypass mesh shading corrections (LSC). */
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
> +				 MALI_C55_MESH_SHADING_ENABLE_MASK,
> +				 false);
> +
>   	/* Bypass the temper module */
>   	mali_c55_ctx_write(mali_c55, MALI_C55_REG_BYPASS_2,
>   			   MALI_C55_REG_BYPASS_2_TEMPER);
> @@ -802,6 +839,19 @@ void mali_c55_params_init_isp_config(struct mali_c55 *mali_c55,
>   
>   	/* Disable the colour correction matrix */
>   	mali_c55_ctx_write(mali_c55, MALI_C55_REG_CCM_ENABLE, 0);
> +
> +	/* Disable AWB stats. */
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
> +				 MALI_C55_AWB_DISABLE_MASK,
> +				 MALI_C55_AWB_DISABLE_MASK);
> +
> +	/* Disable auto-exposure 1024-bin histograms at both tap points. */
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
> +				 MALI_C55_AEXP_HIST_DISABLE_MASK,
> +				 MALI_C55_AEXP_HIST_DISABLE);
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
> +				 MALI_C55_AEXP_IHIST_DISABLE_MASK,
> +				 MALI_C55_AEXP_IHIST_DISABLE);
>   }
>   
>   void mali_c55_unregister_params(struct mali_c55 *mali_c55)
> 

