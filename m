Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E72E1B4223;
	Fri, 13 Mar 2026 16:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418735; cv=none; b=bn/GG2f89eImw2Y1cXEjEEjllYw8DrUlO4yy43zMu4m3A9hLL7fSc+yAP6ul1a9CeEcth/PyJEvKQ0v3sfEsjj3QHaoOTMdR/fBe95CAMIT8ZTydOofCX6ct9hxYNFpoMzJqVi4mQ3lUqoMLTo940lbS8FRQ02eazkQNbmV2NDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418735; c=relaxed/simple;
	bh=rNd+nkuC9agnhJGGcvxcW2KxLK9WR9rnYE3yF6bfry4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qJ5v7EEjgWi40d5A6ptpa1rkE8vnJ17KU4RT9k9Gv7WQ0ORTyIVYZQw35CUG+Ivk6uYIHuYA+XaH2hLfuu95dTsNzULYKbruYJAyeN3XKFaeTwa660i9ODTUVn9HNDl3fhGl18PdPNIyYaug5p1DrQbOVK9y/C2VCAfBZZO57YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UW6RPWFv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UW6RPWFv"
Received: from [192.168.33.26] (185.182.214.153.nat.pool.zt.hu [185.182.214.153])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C60BE70;
	Fri, 13 Mar 2026 17:17:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773418663;
	bh=rNd+nkuC9agnhJGGcvxcW2KxLK9WR9rnYE3yF6bfry4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UW6RPWFvVMuRY7Kg4oO5EyHx0Sgri1Nzbrt5v2KlV/c2g5qZrhm2lfWPuCmRmQybC
	 gegRzoxPWSkQrmmaN8ZpZvmkV4GWasF3CZlXVkd2F/TxhZpCrzthlodr32/zeOLiFd
	 4KHebSwRqPL0P59HMgLIF5SsE/i6nGSSflUflEOM=
Message-ID: <1f4a3e71-76d0-4ec1-9fe2-75e3872f73d9@ideasonboard.com>
Date: Fri, 13 Mar 2026 17:18:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] media: mali-c55: Bypass the Iridix Tonemap engine
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Anthony McGivern <anthony.mcgivern@arm.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Nayden Kanchev <Nayden.Kanchev@arm.com>,
 Konstantin Babin <Konstantin.Babin@arm.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260313-mali-c55-fixes-v7-0-v2-0-885c07961f30@ideasonboard.com>
 <20260313-mali-c55-fixes-v7-0-v2-5-885c07961f30@ideasonboard.com>
From: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Content-Language: en-US, hu-HU
In-Reply-To: <20260313-mali-c55-fixes-v7-0-v2-5-885c07961f30@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

2026. 03. 13. 15:54 keltezéssel, Jacopo Mondi írta:
> The Iridix Tonemap engine, if not bypassed, applies a digital gain
> in order to compensate under-exposed images.
> 
> This however breaks the exposure and gain regulation performed on the
> sensor.
> 
> If the Iridix Tonemap has to be used, it need to be supported in the
> ISP uAPI and properly configured by userspace.
> 
> As the driver doesn't support it at the moment, bypass it by default.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---

Reviewed-by: Barnabás Pőcze <barnabas.pocze@ideasonboard.com>


>   drivers/media/platform/arm/mali-c55/mali-c55-params.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> index 773e5b6a2b7e..b9fc904a3844 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> @@ -825,6 +825,11 @@ void mali_c55_params_init_isp_config(struct mali_c55 *mali_c55,
>   	/* Disable the temper module's DMA read/write */
>   	mali_c55_ctx_write(mali_c55, MALI_C55_REG_TEMPER_DMA_IO, 0x0);
>   
> +	/* Disable IRIDIX module. */
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BYPASS_3,
> +				 MALI_C55_REG_BYPASS_3_IRIDIX,
> +				 MALI_C55_REG_BYPASS_3_IRIDIX);
> +
>   	/* Bypass the colour noise reduction  */
>   	mali_c55_ctx_write(mali_c55, MALI_C55_REG_BYPASS_4,
>   			   MALI_C55_REG_BYPASS_4_CNR);
> 

