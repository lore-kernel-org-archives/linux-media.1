Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D626326D44;
	Tue, 21 Jul 2026 17:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784655832; cv=none; b=eJPOlgzIT9FTYyXGIWmikldH3w2eMrynn8lOdizq0F86eukFmenYgtMB673TpRvTTciq90Dv/iKill9/+0m3W29qEMuzpSt9cA1SKNoNpxZ3DqyhkXxcnODmv+a1ejWtS5IoXfRS0l5PxTehIDUZdAanCxAe4uzqPnObHEugFK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784655832; c=relaxed/simple;
	bh=NKhyk2dGI1ko1Ro6BzT+kdnhmRqf4BgeP9YNraoI/7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2Kvb3lHL9FuIfJKQU+KqdUdOfsUv/kNG8PrUlTJn1iAdgyqjmoWKEP715hCtD9cj4Ycea8Pw5T/3DcjKyHisCcORAvBcCLmL2+3a6jSsCwJhpG/1nvykW1iUe+BTbn+e0qjXHe1LOMllaEd/mEVvHaSmaJelkb+ab+MjBKOe4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ar+oXSEh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ar+oXSEh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784655832; x=1816191832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NKhyk2dGI1ko1Ro6BzT+kdnhmRqf4BgeP9YNraoI/7I=;
  b=ar+oXSEh9ocMfEolo354fUGW91SdRgQT0+m4Eu0RbbtYXdDJZziwxG1H
   xm9YFwiYeqVNT8jB1RvuWnowkoMOqKl7BuSoQGObLQ4K0NCGWHp4UkidG
   r18pv7w4UJ5RPnkA+Oul1C15t9XPPYy1aaeLaSaSssznU7SiwqOfv2/iw
   6+VhXI9K8WzSKgru0YkZZZG34zyA3tt9af/YIkbIAkXdcjn07KRPJYffH
   B5Y3FVmV2qoOmBcX3nWMuo5D1dnCzKkKsE9D9O3n6PfrgIjzey/W2gExq
   MuJ39CD1SAJ1hNH5IRroEwP+GP1LpZ9+R8TiUwSOH2P7ZZjaeyQwm0Jtm
   g==;
X-CSE-ConnectionGUID: OwDZHsoKSayZbmtML42RLg==
X-CSE-MsgGUID: vwqp6sNcQ52inLRlMpuaSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96782487"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="96782487"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:43:51 -0700
X-CSE-ConnectionGUID: Sol+Ev6CQImg/RRoYBZy1A==
X-CSE-MsgGUID: ky2n9a72RJ6nT9SzF/q3Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="258488216"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.135])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:43:47 -0700
Date: Tue, 21 Jul 2026 19:43:40 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, 
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/17] media: i2c: os05b10: Add H/V flip support
Message-ID: <al-vFc6M7Z5cY5ZG@mdjait-mobl>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-7-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718200912.16001-7-tarang.raval@siliconsignals.io>

Hi Tarang,

On Sun, Jul 19, 2026 at 01:38:57AM +0530, Tarang Raval wrote:
> Add HFLIP and VFLIP controls, lock them while streaming,
> and update the reported Bayer format based on the flip state.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/os05b10.c | 56 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 52 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index abf3d2970900..61c51844a91e 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -96,6 +96,10 @@
>  #define OS05B10_MIRROR			BIT(3)
>  #define OS05B10_FLIP			GENMASK(5, 4)
>  
> +#define OS05B10_REG_ANALOG_FLIP         CCI_REG8(0x3716)
> +#define OS05B10_FLIP_ENABLE             0x04
> +#define OS05B10_FLIP_DISABLE            0x24
> +
>  #define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
>  
>  #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
> @@ -231,7 +235,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
>  	{ CCI_REG8(0x370f), 0x1c },
>  	{ CCI_REG8(0x3710), 0x00 },
>  	{ CCI_REG8(0x3713), 0x00 },
> -	{ CCI_REG8(0x3716), 0x24 },
>  	{ CCI_REG8(0x371a), 0x1e },
>  	{ CCI_REG8(0x3724), 0x09 },
>  	{ CCI_REG8(0x3725), 0xb2 },
> @@ -465,6 +468,8 @@ struct os05b10 {
>  	struct v4l2_ctrl *vblank;
>  	struct v4l2_ctrl *gain;
>  	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *vflip;
> +	struct v4l2_ctrl *hflip;
>  
>  	u32 link_freq_index;
>  	u32 data_lanes;
> @@ -513,6 +518,16 @@ static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
>  	return container_of_const(sd, struct os05b10, sd);
>  };
>  
> +static u32 os05b10_get_format_code(struct os05b10 *os05b10)
> +{
> +	static const u32 codes[2][2] = {
> +		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
> +		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
> +	};
> +
> +	return codes[os05b10->vflip->val][os05b10->hflip->val];
> +}
> +
>  static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
> @@ -556,6 +571,20 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
>  		ret = cci_write(os05b10->cci, OS05B10_REG_EXPOSURE,
>  				ctrl->val, NULL);
>  		break;
> +	case V4L2_CID_HFLIP:
> +	case V4L2_CID_VFLIP:
> +		ret = cci_update_bits(os05b10->cci, OS05B10_REG_FORMAT1,
> +				      OS05B10_MIRROR | OS05B10_FLIP,
> +				      (!os05b10->hflip->val ?
> +				       OS05B10_MIRROR : 0) |
> +				      (os05b10->vflip->val ?
> +				       OS05B10_FLIP : 0), NULL);
> +
> +		ret |= cci_write(os05b10->cci, OS05B10_REG_ANALOG_FLIP,
> +				 (os05b10->vflip->val == 1) ?
> +				 OS05B10_FLIP_ENABLE : OS05B10_FLIP_DISABLE,
> +				 NULL);

I don't know about the ret |= assignment

You can use the last parameter of the cci_*() helpers. That would make
this cleaner and not combine two error codes to produce something weird.

If you pass &ret to cci_write() the helper will check if an error
already occured and return it.

> +		break;
>  	default:
>  		ret = -EINVAL;
>  		break;

--
Kind Regards
Mehdi Djait
