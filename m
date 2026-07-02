Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F993A8FE8;
	Thu,  2 Jul 2026 08:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981005; cv=none; b=I2PBLH8EVMwqsx+J8yqShB2vcAN+WBneuFuGE0WYrOXmjpNkacEJ+hoNQPdpknsUhwpanVkiXIDp8zV0b3alYgF8xp8dZn8jUsedRLTrmiRDiP1q7WAw1VmuS3Xz+VnnkYcT2fkxlmNDxP6ZIZOdPesihT9xJszVXVPxS96Nmvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981005; c=relaxed/simple;
	bh=ezaNgDDvXmQQ4aI6rKZ0h/AoxsimCU3kFXPg8mdQ0b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSVzIhGdVhuns09iDpftczOGcLmcZn1hTFWVmLrqvXV14NeafksJukLfsDi6oJ9hslykX4lyCem2r2Rr8U2LVGz9zFlqKWEfjd/IK7gkAiFWA7y1UcRkur8A5dr8rCSHEaIRYe/eZZVWZzFLlsc2HYXgWcWEGShSCs4X390mDCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HF3nmept; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HF3nmept"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782981004; x=1814517004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ezaNgDDvXmQQ4aI6rKZ0h/AoxsimCU3kFXPg8mdQ0b4=;
  b=HF3nmepty1wuRSHgxM/dJ/2QvM8okx6FCkgRieZGE3yZtTFRTs/PjToD
   D3Xw7y9lt3yR2bbru5SWAA/LPLZhUUKjZLeJKM2T9Pu0FZTHbh3aMFrJ6
   SPU2+cS/oDVnJLldw8jHuZEt/V4ExESk1lCU4TqBH+jzws5skCDzhTSza
   gO/+ZjyXxG4K4NDKT80u76j0WLqCM87wFrbyEpwwaidC/R1wTkVv54V+W
   6vGv+5srl1sgvJrTWRz8CRCHSY3ba++PHmlCfz5lgou1VaGJ9OnZtNB8R
   Wm/dSUR0edFCAb74weC1zG64lRUjxg+zTypItvTZxvYdgpvqhh616tXQc
   g==;
X-CSE-ConnectionGUID: q8CwbNTLQmq1AlObMTDrwA==
X-CSE-MsgGUID: 4Pe+F6ZiQ5anSHQAmXYB1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="86270317"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="86270317"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 01:30:03 -0700
X-CSE-ConnectionGUID: 1PdDc5xZS2OK3QR/Cc0njQ==
X-CSE-MsgGUID: +oiO/tb9QQmJoEB94ofuUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="290919196"
Received: from vpanait-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.241])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 01:30:01 -0700
Date: Thu, 2 Jul 2026 10:29:29 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/15] media: i2c: os05b10: Add test pattern options
Message-ID: <akYgPq1G9DzhCK_E@mdjait-mobl>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
 <20260325114404.95188-8-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325114404.95188-8-tarang.raval@siliconsignals.io>

Hi Tarang,

On Wed, Mar 25, 2026 at 05:13:53PM +0530, Tarang Raval wrote:
> Add V4L2_CID_TEST_PATTERN support with multiple sensor test-pattern modes
> and program them via register 0x5080. Drop the fixed 0x5080 setting from
> the common register sequence so the pattern is selected only through the
> control.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/os05b10.c | 55 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index bf848eb9ba52..c8de7f5601bf 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -103,6 +103,17 @@
>  #define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
>  #define OS05B10_HDR_ENABLE		0x04
>  
> +#define OS05B10_REG_PRE_ISP_20_0	CCI_REG8(0x5080)
> +#define OS05B10_DISABLED		0x00
> +#define OS05B10_COLOR_BAR_1		0x80
> +#define OS05B10_COLOR_BAR_2		0x84
> +#define OS05B10_COLOR_BAR_3		0x88
> +#define OS05B10_COLOR_BAR_4		0x8c
> +#define OS05B10_COLOR_SQUARE		0x82
> +#define OS05B10_BW_SQUARE		0x92
> +#define OS05B10_TRANSPARENT_EFFECT	0xa0
> +#define OS05B10_ROLLING_BAR_EFFECT	0xc0
> +
>  #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
>  
>  static const struct v4l2_rect os05b10_native_area = {
> @@ -396,7 +407,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
>  	{ CCI_REG8(0x5004), 0x00 },
>  	{ CCI_REG8(0x5005), 0x0e },
>  	{ CCI_REG8(0x5036), 0x00 },
> -	{ CCI_REG8(0x5080), 0x04 },

I suppose not writing 0x04 like before does not change anything ? Maybe
mention this value in the commit message ?

>  	{ CCI_REG8(0x5082), 0x00 },
>  	{ CCI_REG8(0x5180), 0x00 },
>  	{ CCI_REG8(0x5181), 0x10 },
> @@ -514,6 +524,30 @@ static const u32 os05b10_mbus_codes[] = {
>  	MEDIA_BUS_FMT_SBGGR10_1X10,
>  };
>  

two nits here:

> +static const char * const os05b10_test_pattern_menu[] = {
> +	"Disabled",

Uppercase

> +	"colour bar type 1",

or lowercase ?

> +	"colour bar type 2",
> +	"colour bar type 3",
> +	"colour bar type 4",

so colour

> +	"color square",

or color ?

> +	"black-white square",
> +	"transparent effect",
> +	"rolling bar effect",
> +};

--
Kind Regards
Mehdi Djait
