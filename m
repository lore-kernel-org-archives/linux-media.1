Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124273D3CF4;
	Mon, 29 Jun 2026 10:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728451; cv=none; b=lXGfa+X/kUI0VFGxipr+O3cMFqfBbFgPuo8v6Q5hqeYoPi1uuu2AC/Lv4ShWmqEdys7SK/mMpTcuYt9Io7Oz1SWy7T8sM947DpLSXksAfX7pROMY2PWUgA3o2EUCqeNIeMGfkRK5QxOcWfz2+jux+jejBFUCGU/N4DNOyWGVfE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728451; c=relaxed/simple;
	bh=7gujg09bxbT0grkkN3GFmGhgKIh0FHovpcqNURAZ3QU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0+aqQhoVexuX0xK7GYUbDD/4Cde3WvvNfscigIO9F/YnyMI58cPEm0noxfRQl7T0tkXRxi9JR8uL8A6U03OFhFsgY4plIno6rNRIWyaNsHXeXPj7zG9bwXsGH5G8HO0DUfuirRc9Rq2X5trN9iAjjhRIjfh3vWmj18JZbNWYiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UXm1Wpqf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UXm1Wpqf"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E27F12F;
	Mon, 29 Jun 2026 12:20:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782728405;
	bh=7gujg09bxbT0grkkN3GFmGhgKIh0FHovpcqNURAZ3QU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXm1Wpqf+pqCa4FLG7Ox5DvsXP2Z0iVoTcAyvlYVRVQGjEQeiYulvIhFWOqIDHfUc
	 KrTdkLm1djnkDMJviw2erGw3V/qG8dBckzbG5kNG0D37XAoS+XGHP3xYIs505KRrGQ
	 SL3hkPsRgK3PVbmcw08iSMedMj85NiS81oSgr5Yc=
Date: Mon, 29 Jun 2026 13:20:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Nayden.Kanchev@arm.com, Konstantin Babin <Konstantin.Babin@arm.com>,
	Anthony McGivern <anthony.mcgivern@arm.com>,
	vincenzo.frascino@arm.com, linus.walleij@arm.com,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 4/4] media: mali-c55: Implement Gamma block validation
Message-ID: <20260629102046.GD3054459@killaraus.ideasonboard.com>
References: <20260627-mali-c55-ccm-gamma-v3-0-113584c05174@ideasonboard.com>
 <20260627-mali-c55-ccm-gamma-v3-4-113584c05174@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260627-mali-c55-ccm-gamma-v3-4-113584c05174@ideasonboard.com>

On Sat, Jun 27, 2026 at 04:29:16PM +0200, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> Implement validation of Gamma block parameters.
> 
> Gamma gains are expressed as unsigned 12 bits Q4.8 format and their raw
> value cannot be higher than 4095 (BIT(12) - 1).
> 
> Gamma offsets are 12 bits unsigned integers and their value cannot be
> higher than 4095 (BIT(12) - 1).
> 
> The Gamma LUT table is expected to have 0 as first member and 0xfff
> as last member.
> 
> Validate the parameters provided by userspace using the .block_validate
> callback of struct v4l2_isp_params_block_type_info.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

For the same reasons as 3/4, I'd drop this patch.

> ---
> v3:
> - new patch
> ---
>  .../media/platform/arm/mali-c55/mali-c55-params.c  | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> index 5857e9c2daf7..e9ab0e2dee15 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> @@ -581,6 +581,38 @@ static int mali_c55_ccm_validate(struct device *dev,
>  	return 0;
>  }
>  
> +static int mali_c55_gamma_validate(struct device *dev,
> +				   const struct v4l2_isp_block_header *block)
> +{
> +	const struct mali_c55_params_gamma *gamma =
> +		(const struct mali_c55_params_gamma *)(block);
> +
> +	for (unsigned int i = 0; i < 3; i++) {
> +		/* Gains are 12 bits unsigned Q4.8. */
> +		if (gamma->gains[i] > 4095) {
> +			dev_dbg(dev, "Invalid gain value %u\n",
> +				gamma->gains[i]);
> +			return -EINVAL;
> +		}
> +
> +		/* Offsets are 12 bits unsigned integers. */
> +		if (gamma->offs[i] > 4095) {
> +			dev_dbg(dev, "Invalid offset value %u\n",
> +				gamma->offs[i]);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	/* Check the first and last gamma lut entries match the expectations. */
> +	if (gamma->lut[0] != 0 ||
> +	    gamma->lut[MALI_C55_NUM_GAMMA_LUT_ELEMENTS - 1] != 0xfff) {
> +		dev_dbg(dev, "Invalid Gamma LUT table\n");
> +		return -EINVAL;
> +	}

You can possibly hardcode the first and last values to 0 and 0xfff
respectively in mali_c55_params_gamma() if you want to guard against
invalid values being programmed in registers.

> +
> +	return 0;
> +}
> +
>  static const struct v4l2_isp_params_block_type_info
>  mali_c55_params_block_types_info[] = {
>  	[MALI_C55_PARAM_BLOCK_SENSOR_OFFS] = {
> @@ -622,9 +654,11 @@ mali_c55_params_block_types_info[] = {
>  	},
>  	[MALI_C55_PARAM_BLOCK_GAMMA_FR] = {
>  		.size = sizeof(struct mali_c55_params_gamma),
> +		.block_validate = mali_c55_gamma_validate,
>  	},
>  	[MALI_C55_PARAM_BLOCK_GAMMA_DS] = {
>  		.size = sizeof(struct mali_c55_params_gamma),
> +		.block_validate = mali_c55_gamma_validate,
>  	},
>  };
>  

-- 
Regards,

Laurent Pinchart
