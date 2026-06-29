Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FBC3BED7F;
	Mon, 29 Jun 2026 08:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782720645; cv=none; b=P9MYUUSkgtKPaIqaaB6NrY1Vr0J8ch37vQiUADmupBu5Qlt6ReIZqs96rSXtMmAk6PFote5O4DAo9auSjxeF3m4h2G7/bCwwBokgx+JUfOmHuYYRx6ybdFh6qjGksIT0TzOLmBWYOfaA7DE9onr0wWHySvMaNTCIrFh2HDUaEJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782720645; c=relaxed/simple;
	bh=PXOv89/+9ybQuJUazvzWRXCKLDWYuD72FGOxWNtRk4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bBVMs+hG6LnsAUjqSJGUHBEGc1s0g25EZ7E2TzSQ1Xvmr+nh5KEUXTeUOcXt2DGsu8uBlwYOYFRoF6IV5nPGxTGqjKEhdK8oVhGPWhSGEL/KZvH+SJJcxT3PgbMxyrre/uos3BmRCTkIJkLIv6OM8/cVxwZm9O7MG+xYPYR13V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=RkrN6BLB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RkrN6BLB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEA481A00;
	Mon, 29 Jun 2026 01:10:37 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDAF63F836;
	Mon, 29 Jun 2026 01:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782720642; bh=PXOv89/+9ybQuJUazvzWRXCKLDWYuD72FGOxWNtRk4I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RkrN6BLB41AGJNDKp9Ia9eQ8NrrnZNioHKHdFX7yuaFy3nb+scjISiE4/twVniAp5
	 sCxmr67EFPk6COHmOC6fQnW+BvKrmI+/HUd2T4deE/d1l/WcSyH9h3dlq2kTKRUz6Y
	 5SRFVLf7owhGzI0sKw8L8s1uIL0C3au4HJytVOpI=
Message-ID: <79a5548b-39a3-4e64-8c7b-81ed6166a2c5@arm.com>
Date: Mon, 29 Jun 2026 09:10:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] media: mali-c55: Implement Gamma block validation
Content-Language: en-GB
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nayden.Kanchev@arm.com,
 Konstantin Babin <Konstantin.Babin@arm.com>,
 Anthony McGivern <anthony.mcgivern@arm.com>, linus.walleij@arm.com,
 laurent.pinchart@ideasonboard.com,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
References: <20260627-mali-c55-ccm-gamma-v3-0-113584c05174@ideasonboard.com>
 <20260627-mali-c55-ccm-gamma-v3-4-113584c05174@ideasonboard.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260627-mali-c55-ccm-gamma-v3-4-113584c05174@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jacopo,

thank you for your patch.

On 27/06/2026 15:29, Jacopo Mondi wrote:
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
> 

Looks good overall. I have just one comment. With this:

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

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

I am still learning about these things and might be wrong. Should not we also
validate that intermediate LUT entries are monotonic and non-decreasing?

> +		dev_dbg(dev, "Invalid Gamma LUT table\n");
> +		return -EINVAL;
> +	}
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
> 

-- 
Regards,
Vincenzo

