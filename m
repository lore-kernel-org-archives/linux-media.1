Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701F1415F0E;
	Tue, 21 Jul 2026 17:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784656267; cv=none; b=XUCy0BRdipC3s7KEsD1BFOxpvYVmAU4fphHyV7BBBEmJgoj735+5MciQZpk8qn44DluKJecmvFPrO7M3SF1/Aj6UM9otCuhfK8l5bkqcEo6RyLDnXbv9zpFAT5hGlyKLPpzLn0OCCyqzWDxChUDXPAqlud+Wo/62uho7aSgKUkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784656267; c=relaxed/simple;
	bh=Dv+SVGiVgomshLT/GZc90uzu6kJkJinMymTgp5KB7fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4MA+TtaH/wVrUuPDfcjTORMm/C4FpYRs36HKw/cYrqYhprznoIDiJt7KS4mZ+qKycplJOSrtC15EedgoMcaV4JSmV6OL6OomJt/L9lH6cDnAqOjvE2HO6bspIjpF5jNC/7cdQ/qa1BtMZqijJW0zFuwod14GNB/fdsC6woo3oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/ZCsgOo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/ZCsgOo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784656266; x=1816192266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dv+SVGiVgomshLT/GZc90uzu6kJkJinMymTgp5KB7fw=;
  b=M/ZCsgOoYRfCeagL/mVUIFv4/JL/YBYIN2C53INLVTwMs57I98S6DRrI
   /H8Pot23bB7NS7EhGHGZ0Bfrb6SR7/HdELkttxLX9S/FQiopJ9xfmKrWv
   2xpNJc/NZ4W6zJwcg4Idtf1CRvz3E2+Gyx7T3/p1tU7Iy5fQK3SnZAj/L
   j/2rl4LrdTfc0djcspbgQsPkNOFtW5hb7ynNw4qdBf4910doASrJVS7ls
   X1SAwgi2qB0JazDCjofnmB+EmL8viK9Ye3lfGPrctBCvQrBXSPSB3jaC4
   n/Vuy3j6BQC/JvvKaJQoZjdUTY2yoH2dqIItqLYhfSp09XBVJVklKX3hr
   Q==;
X-CSE-ConnectionGUID: rTkJzZj1QQe6S4gZ6UyHyQ==
X-CSE-MsgGUID: 7/ltIcMZR9qnnQq0eygEeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85030463"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="85030463"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:51:05 -0700
X-CSE-ConnectionGUID: 6vZ3RK7DS/W+bRGIUznhJg==
X-CSE-MsgGUID: Yobd4ihwQBqYJdNLABqoFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="255185274"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.135])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:51:02 -0700
Date: Tue, 21 Jul 2026 19:50:55 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, 
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/17] media: i2c: os05b10: Add test pattern options
Message-ID: <al-xEoRrdO7nyO8d@mdjait-mobl>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-8-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718200912.16001-8-tarang.raval@siliconsignals.io>

Hi Tarang,

On Sun, Jul 19, 2026 at 01:38:58AM +0530, Tarang Raval wrote:
> Add V4L2_CID_TEST_PATTERN support with multiple sensor test-pattern modes
> and program them via register 0x5080. Drop the fixed 0x5080 setting from
> the common register sequence so the pattern is selected only through the
> control.
> 
> Removing the default write of 0x04 to register 0x5080 does not change the
> sensor's default behaviour. The value 0x04 leaves the test pattern enable
> bit (bit 7) cleared, so the sensor remains in normal streaming mode. It
> only programs the color bar style field, which is ignored unless a test
> pattern is enabled.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/os05b10.c | 55 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index 61c51844a91e..4e177eacc815 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -102,6 +102,17 @@
>  
>  #define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
>  
> +#define OS05B10_REG_PRE_ISP_20_0       CCI_REG8(0x5080)
> +#define OS05B10_DISABLED               0x00
> +#define OS05B10_COLOR_BAR_1            0x80
> +#define OS05B10_COLOR_BAR_2            0x84
> +#define OS05B10_COLOR_BAR_3            0x88
> +#define OS05B10_COLOR_BAR_4            0x8c
> +#define OS05B10_COLOR_SQUARE           0x82
> +#define OS05B10_BW_SQUARE              0x92
> +#define OS05B10_TRANSPARENT_EFFECT     0xa0
> +#define OS05B10_ROLLING_BAR_EFFECT     0xc0
> +
>  #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
>  
>  static const struct v4l2_rect os05b10_native_area = {
> @@ -395,7 +406,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
>  	{ CCI_REG8(0x5004), 0x00 },
>  	{ CCI_REG8(0x5005), 0x0e },
>  	{ CCI_REG8(0x5036), 0x00 },
> -	{ CCI_REG8(0x5080), 0x04 },
>  	{ CCI_REG8(0x5082), 0x00 },
>  	{ CCI_REG8(0x5180), 0x00 },
>  	{ CCI_REG8(0x5181), 0x10 },
> @@ -513,6 +523,30 @@ static const u32 os05b10_mbus_codes[] = {
>  	MEDIA_BUS_FMT_SBGGR10_1X10,
>  };
>  
> +static const char * const os05b10_test_pattern_menu[] = {
> +	"Disabled",
> +	"Colour bar type 1",

nit: make it color to be consistent with the rest of the driver ?

> +	"Colour bar type 2",
> +	"Colour bar type 3",
> +	"Colour bar type 4",
> +	"Colour square",
> +	"Black-white square",
> +	"Transparent effect",
> +	"Rolling bar effect",
> +};

--
Kind Regards
Mehdi Djait
