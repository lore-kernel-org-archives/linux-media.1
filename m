Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDF912CDBE;
	Mon, 29 Jun 2026 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747958; cv=none; b=vBk2VJjMeg+xgVhePGXMJg4IXSss9FwY4hOVukloJgvtWRIE6EK7NRThmnHFV07l9NkC/8yGNZLMPD8G+YaVhrLGsqljv20cpQ5dijCtWNG4NQEaCPbySWqGxWfYql4b17MAyewmDtlDB/uxFTwAeI9vsqv3915DYmUKeUnniQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747958; c=relaxed/simple;
	bh=EXF7J8G1MgMQTGLx+WsqDKY2qMRuoU6OfIUz7fTbTck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CrYVlEAuxOnkG+wPq4dBK5t57y4P5JnLpDc6yjhCR4YaP0WAQJctYn2+GbBCDv30NO1nBYnSdb4wSGCoxZ6NafQcUOsu8PBfErdCYoouiIJoHnLwZkxyKlItTbFcRu6CQNt92YcszmEDblYRnxQJsZihqoc5OLf1dRoW2FTUEw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LeCO1XGC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LeCO1XGC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782747957; x=1814283957;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EXF7J8G1MgMQTGLx+WsqDKY2qMRuoU6OfIUz7fTbTck=;
  b=LeCO1XGCmQ1BEA2HriYdYwCkNqkiZDDHdzR7Z3IIEjXqTclSgD9XXK/R
   dcWCC7EMgZL78BiSJ+mbLUrrUFQsdXcfG5xZttyshiZUtyj7JDiOXmxM/
   J1tsRmObbmN5iqiv1RwBrn6rXAgMummahi3PtMo1i5gGVh5R51OKXWQj8
   Ipd3iy6O7U64YiN8m77VXx4RwCyYErIqU6+BVwlyts1ejmooWGmg3wojL
   MmAzjFp9prVZZdfK3d3j2Mdl1gm1tLD0Eygx/82pPZTd8M+NgPOw50w1o
   8Kw0ofdEXei9Md6sfkMUnU7BMpNtpfUGoB9AaWfr9IoOEUSLlCOzMVvXW
   g==;
X-CSE-ConnectionGUID: y0WZc15tQNCntCSWQwNyfg==
X-CSE-MsgGUID: /0bS+v4pSiW3gx1NU8vOVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83491408"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83491408"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:45:56 -0700
X-CSE-ConnectionGUID: tEzmpXanTAmTeRi42wlYZA==
X-CSE-MsgGUID: Ra0jwP9RSBSeXMVf4JcZdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="275220040"
Received: from abityuts-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.82])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:45:53 -0700
Date: Mon, 29 Jun 2026 17:45:46 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/15] media: i2c: os05b10: add register definitions
 and use them in init table
Message-ID: <akKS61cHniBT0sky@mdjait-mobl>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
 <20260325114404.95188-4-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325114404.95188-4-tarang.raval@siliconsignals.io>

Hi Tarang,

On Wed, Mar 25, 2026 at 05:13:49PM +0530, Tarang Raval wrote:
> Define named register macros for OS05B10 and replace raw register
> addresses in the common initialization array with the new definitions.
> This improves readability and maintainability without changing
> functionality.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/os05b10.c | 111 +++++++++++++++++++++++-------------
>  1 file changed, 71 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index 62fb856cbdea..751494fdba6d 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -38,6 +38,20 @@
>  #define OS05B10_MODE_STANDBY		0x00
>  #define OS05B10_MODE_STREAMING		0x01
>  
> +#define OS05B10_REG_PLL_CTRL_01		CCI_REG8(0x0301)
> +#define OS05B10_REG_PLL_CTRL_03		CCI_REG8(0x0303)
> +#define OS05B10_REG_PLL_CTRL_05		CCI_REG8(0x0305)
> +#define OS05B10_REG_PLL_CTRL_06		CCI_REG8(0x0306)
> +#define OS05B10_REG_PLL_CTRL_25		CCI_REG8(0x0325)
> +
> +#define OS05B10_REG_MIPI_SC_CTRL	CCI_REG8(0x3016)
> +#define OS05B10_4_LANE_MODE		0x72
> +#define OS05B10_2_LANE_MODE		0x32
> +
> +#define OS05B10_REG_MIPI_SC_CTRL_1	CCI_REG8(0x3022)
> +#define OS05B10_10BIT_MODE		0x01
> +#define OS05B10_12BIT_MODE		0x61
> +
>  #define OS05B10_REG_EXPOSURE		CCI_REG24(0x3500)
>  #define OS05B10_EXPOSURE_MIN		2
>  #define OS05B10_EXPOSURE_STEP		1
> @@ -49,11 +63,42 @@
>  #define OS05B10_ANALOG_GAIN_STEP	1
>  #define OS05B10_ANALOG_GAIN_DEFAULT	0x80
>  
> +#define OS05B10_REG_DIGITAL_GAIN	CCI_REG16(0x350a)
> +#define OS05B10_DIGITAL_GAIN_MIN	0x400
> +#define OS05B10_DIGITAL_GAIN_MAX	0x3fff
> +#define OS05B10_DIGITAL_GAIN_STEP	16
> +#define OS05B10_DIGITAL_GAIN_DEFAULT	0x400
> +
> +#define OS05B10_REG_ANALOG_GAIN_SHORT	CCI_REG16(0x350c)
> +#define OS05B10_REG_DIGITAL_GAIN_SHORT	CCI_REG16(0x350e)
> +#define OS05B10_REG_EXPOSURE_SHORT	CCI_REG24(0x3510)
> +
> +#define OS05B10_REG_X_ADDR_START	CCI_REG16(0x3800)
> +#define OS05B10_REG_Y_ADDR_START	CCI_REG16(0x3802)
> +#define OS05B10_REG_X_ADDR_END		CCI_REG16(0x3804)
> +#define OS05B10_REG_Y_ADDR_END		CCI_REG16(0x3806)
> +#define OS05B10_REG_X_OUTPUT_SIZE	CCI_REG16(0x3808)
> +#define OS05B10_REG_Y_OUTPUT_SIZE	CCI_REG16(0x380a)
> +
>  #define OS05B10_REG_HTS			CCI_REG16(0x380c)
>  
>  #define OS05B10_REG_VTS			CCI_REG16(0x380e)
>  #define OS05B10_VTS_MAX			0x7fff
>  
> +#define OS05B10_REG_ISP_X_WIN		CCI_REG16(0x3810)
> +#define OS05B10_REG_ISP_Y_WIN		CCI_REG16(0x3812)
> +#define OS05B10_REG_X_INC_ODD		CCI_REG8(0x3814)
> +#define OS05B10_REG_X_INC_EVEN		CCI_REG8(0x3815)
> +#define OS05B10_REG_Y_INC_ODD		CCI_REG8(0x3816)
> +#define OS05B10_REG_Y_INC_EVEN		CCI_REG8(0x3817)
> +
> +#define OS05B10_REG_FORMAT1		CCI_REG8(0x3820)
> +#define OS05B10_MIRROR			BIT(3)
> +#define OS05B10_FLIP			GENMASK(5, 4)
> +
> +#define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
> +#define OS05B10_HDR_ENABLE		0x04

Is this BIT(2) ? The define is also not used.

> +
>  #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
>  
>  static const struct v4l2_rect os05b10_native_area = {
> @@ -77,30 +122,25 @@ static const char * const os05b10_supply_name[] = {
>  };
>  
>  static const struct cci_reg_sequence os05b10_common_regs[] = {
> -	{ CCI_REG8(0x0301), 0x44 },
> -	{ CCI_REG8(0x0303), 0x02 },
> -	{ CCI_REG8(0x0305), 0x32 },
> -	{ CCI_REG8(0x0306), 0x00 },
> -	{ CCI_REG8(0x0325), 0x3b },
> +	{ OS05B10_REG_PLL_CTRL_01, 0x44 },
> +	{ OS05B10_REG_PLL_CTRL_03, 0x02 },
> +	{ OS05B10_REG_PLL_CTRL_05, 0x32 },
> +	{ OS05B10_REG_PLL_CTRL_06, 0x00 },
> +	{ OS05B10_REG_PLL_CTRL_25, 0x3b },
>  	{ CCI_REG8(0x3002), 0x21 },
> -	{ CCI_REG8(0x3016), 0x72 },
> +	{ OS05B10_REG_MIPI_SC_CTRL, 0x72 },
>  	{ CCI_REG8(0x301e), 0xb4 },
>  	{ CCI_REG8(0x301f), 0xd0 },
>  	{ CCI_REG8(0x3021), 0x03 },
> -	{ CCI_REG8(0x3022), 0x01 },
> +	{ OS05B10_REG_MIPI_SC_CTRL_1, 0x01 },
>  	{ CCI_REG8(0x3107), 0xa1 },
>  	{ CCI_REG8(0x3108), 0x7d },
>  	{ CCI_REG8(0x3109), 0xfc },
>  	{ CCI_REG8(0x3503), 0x88 },
> -	{ CCI_REG8(0x350a), 0x04 },
> -	{ CCI_REG8(0x350b), 0x00 },
> -	{ CCI_REG8(0x350c), 0x00 },
> -	{ CCI_REG8(0x350d), 0x80 },
> -	{ CCI_REG8(0x350e), 0x04 },
> -	{ CCI_REG8(0x350f), 0x00 },
> -	{ CCI_REG8(0x3510), 0x00 },
> -	{ CCI_REG8(0x3511), 0x00 },
> -	{ CCI_REG8(0x3512), 0x20 },
> +	{ OS05B10_REG_DIGITAL_GAIN, 0x0400 },

Are you setting the register to OS05B10_REG_DIGITAL_GAIN_DEFAULT ? It is
defined above

--
Kind Regards
Mehdi Djait
