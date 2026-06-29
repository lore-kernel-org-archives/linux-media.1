Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C100D35D615;
	Mon, 29 Jun 2026 07:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782719539; cv=none; b=obj8iz9spb5m2SuTEXnZAmeYlSUGZfPIZ/C7D9qErYf/KLtG71JDDCLzycNbiCebDvCOCGxK3bo+sQHSDC+NHOp1CR9UOM/0G9J1u9TOdiZ5PMRFQsWQjWJ8NbSof3Pt5CHkyTAk0G76q9hgdSlL6la6C36Kw9GzNHY465b/ceY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782719539; c=relaxed/simple;
	bh=1b+y9QTx3PqV4SZFvMHAtVMig0XKsZlYHL8zhvzSEOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JujCiOjjZsjDDR8hPwe4gQG+gp4e38+cC/eVZAaTI1Q/5y13gB0F6RD8ziciFT7PMl6cqSgSdpHPkLZXoAqvtTaHAV/O/t0lT39t36/J2CuKENXhofUlJofl3Ls01oFSSbp3n7YMjcGCg846eecfmTBM2gNGv47iU1fH2BB67Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fiK5Qs38; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fiK5Qs38"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53D641762;
	Mon, 29 Jun 2026 00:52:08 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20F323F836;
	Mon, 29 Jun 2026 00:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782719532; bh=1b+y9QTx3PqV4SZFvMHAtVMig0XKsZlYHL8zhvzSEOE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fiK5Qs38ZbTpP21enUksf6I3vQi3y6QlZZz0hm1zKH2e3fmbAOpnL86lYkXALeQyS
	 FE/VkScq7Vx0c84sj5NSnCt+zoM0xUpxcEpdmHc+OrkiH9ZIU6G7W+w5v3ecoX3lO/
	 UkwGT9ROgrE0HsjaXH4vOAFGGg81019nfZRPY1oM=
Message-ID: <7afdc0fa-343b-4159-a357-180d692c9dd2@arm.com>
Date: Mon, 29 Jun 2026 08:52:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: mali-c55: Implement CCM block validation
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
 <20260627-mali-c55-ccm-gamma-v3-2-113584c05174@ideasonboard.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260627-mali-c55-ccm-gamma-v3-2-113584c05174@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jacopo,

thank you for your patch.

On 27/06/2026 15:29, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> Implement validation of CCM block parameters.
> 
> CCM coefficients are expressed as 13 bits signed Q4.8 format and their
> raw value cannot be higher than 8191 (BIT(13) - 1).
> 
> CCM gains are expressed as unsigned 12 bits Q4.8 format and their raw
> value cannot be higher than 4095 (BIT(12) - 1).
> 
> CCM offsets are 12 bits unsigned integers and their value cannot be
> higher than 4095 (BIT(12) - 1).
> 
> Validate the parameters provided by userspace using the .block_validate
> callback of struct v4l2_isp_params_block_type_info.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
>

I have a couple of comments. With this:

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
> v3:
> - new patch
> ---
>  .../media/platform/arm/mali-c55/mali-c55-params.c  | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> index 0da5215c52c3..333e66ee3923 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> @@ -477,6 +477,41 @@ static const mali_c55_params_handler mali_c55_params_handlers[] = {
>  	[MALI_C55_PARAM_BLOCK_CCM] = &mali_c55_params_ccm,
>  };
>  
> +static int mali_c55_ccm_validate(struct device *dev,
> +				 const struct v4l2_isp_block_header *block)
> +{
> +	const struct mali_c55_params_ccm *ccm =
> +		(const struct mali_c55_params_ccm *)(block);
> +
> +	for (unsigned int i = 0; i < 3; i++) {
> +

Nit: extra blank line after the for opening brace, kernel style usually avoids this.

> +		for (unsigned int j = 0; j < 3; j++) {
> +			/* Coefficients are 13 bits signed Q4.8. */
> +			if (ccm->coeffs[i][j] > 8191) {

No magic numbers please :) Maybe use GENMASK(12, 0) or BIT(13) - 1 for
readability and consistency with the commit message, and similarly GENMASK(11,
0) or BIT(12) - 1 for gains and offsets. This also avoids magic numbers in
validation. The same could be applied to the other cases in this patch.

> +				dev_dbg(dev, "Invalid ccm coefficient %u\n",
> +					ccm->coeffs[i][j]);
> +				return -EINVAL;
> +			}
> +		}
> +
> +		/* Gains are 12 bits unsigned Q4.8. */
> +		if (ccm->gains[i] > 4095) {
> +			dev_dbg(dev, "Invalid ccm gain %u\n",
> +				ccm->gains[i]);
> +			return -EINVAL;
> +		}
> +
> +		/* Offsets are 12 bits unsigned integers. */
> +		if (ccm->offs[i] > 4095) {
> +			dev_dbg(dev, "Invalid ccm offset %u\n",
> +				ccm->offs[i]);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct v4l2_isp_params_block_type_info
>  mali_c55_params_block_types_info[] = {
>  	[MALI_C55_PARAM_BLOCK_SENSOR_OFFS] = {
> @@ -514,6 +549,7 @@ mali_c55_params_block_types_info[] = {
>  	},
>  	[MALI_C55_PARAM_BLOCK_CCM] = {
>  		.size = sizeof(struct mali_c55_params_ccm),
> +		.block_validate = mali_c55_ccm_validate,
>  	},
>  };
>  
> 

-- 
Regards,
Vincenzo

