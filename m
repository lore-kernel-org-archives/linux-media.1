Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0553B0585
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 12:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980768; cv=none; b=lwrAJO4Cl8XEWgE/QhF19ReadndQpHVRrOK7UYfBk3h1yPYYEsHAMt++GIlPudjS0yjjoD9OCbjAcS2olKfvDFaVr70MWi2ql9iUnhfB014qIc2SgXZGku3vi3DPYSqC1QdddSJtNS9a02lOl5PT46dn9n3DxFcQlCJigw9lBJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980768; c=relaxed/simple;
	bh=VUaLwXx7qdu6w8Hzzq2UIhVMGQvMtsb1X9HuorBBc1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pL2tl37iP0AcmVI62dUy8nGvHeSDGALkzD/oZTxN0aABtqrO4eQe5e8Woltsq4FjapC/o7CN5x7Qwup0QyWocefsZAxjxmwX3/8w/soGgFMxCF8p4zMhRo3P01Ek9FTIzCeXKgIulmHJY/glFsGqt/uqv4A4Y7Ya3IM/D6tU+mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCV9M+k5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCV9M+k5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791980767; x=1823516767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VUaLwXx7qdu6w8Hzzq2UIhVMGQvMtsb1X9HuorBBc1E=;
  b=CCV9M+k50s2CTsMpXSu5AJ8/UtnL4oi0GvExJ/aTKgWSV7Pcr7FsyLeL
   99qEBol5B8VMpJ5kcaMFZoer2uqNTpxscbB5DwQUzLdBEGpnFo0r8sQNC
   mp2LrhHohowBuErdvkgvtOmc3y09tPjUyqKImnq655g5htFT83JN41NTv
   xcU/4X91SCiodb2EPI1z+RZZGH+WGeoOCoT3lTaAAgfZThwNmm+Q1rFwf
   6KJo+ivBZGttvwOVxgXM4S5lV62sixInuEX/4qqPdgYLz49TJbLmauiSO
   hdL3Ulfy7ar2yGjnErjmNwIR3I3ZhJr+xMKJkTDsGytI/12yPFQTjfozx
   w==;
X-CSE-ConnectionGUID: hvvqjcqKSWOS5ZegmTc40Q==
X-CSE-MsgGUID: GU5qMyOmTQCIIYKTxLsqAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="713495"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="713495"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 05:26:06 -0700
X-CSE-ConnectionGUID: qr25JEL9Sk2g4+j2Cbxsfw==
X-CSE-MsgGUID: mqBBHdFiSvCp+Wa/QOxErg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1434363"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.210])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 05:26:05 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DEEEF121B92;
	Wed, 14 Oct 2026 15:26:07 +0300 (EEST)
Date: Wed, 14 Oct 2026 15:26:07 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: John Cronin <john@stromback.com>
Cc: linux-media@vger.kernel.org, hpa@redhat.com, hansg@kernel.org,
	john.cronin@opcenter.com
Subject: Re: [PATCH v5] media: i2c: imx471: return 0 from get_selection after
 filling crop
Message-ID: <as9039ZI3Vo43DXX@kekkonen.localdomain>
References: <20260816194259.151947-1-john.cronin@opcenter.com>
 <20260824123348.3761049-1-john.cronin@opcenter.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824123348.3761049-1-john.cronin@opcenter.com>

Hi John,

On Mon, Aug 24, 2026 at 08:33:48AM -0400, John Cronin wrote:
> libcamera issues VIDIOC_SUBDEV_G_SELECTION with target CROP (rectangle
> 0) during CameraSensorLegacy bring-up. imx471_get_selection filled the
> rectangle then fell out of the switch and returned -EINVAL.
> 
> Compute analog crop in set_pad_format: 2x binning, centered in the
> native array, same idea as imx219. IMX471 2x2-binned 1928x1088 then
> reports CROP as 3856x2176 centered in 4672x3512.
> 
> Tested on ThinkPad X9-15 Gen 1 (SONY471A / IPU7).

Perhaps I'd leave this out of the commit message.

> 
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2454119
> Signed-off-by: John Cronin <john.cronin@opcenter.com>
> Signed-off-by: John Cronin <john@stromback.com>

Is there a Fixes: tag for this one? I think that'd be appropriate, and Cc:
this to stable.

> ---
> v5: drop extra braces; declare crop/bin vars at start of
>     set_pad_format (sorted by line length); wrap to 80 cols;
>     keep only the bug/feature in the commit log
> v4: add Signed-off-by for john@stromback.com
> v3: rebase on media-committers next
> v2: compute analog crop in set_pad_format; return 0 after switch
> 
>  drivers/media/i2c/imx471.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> index 4053aed84..0ea18fbb9 100644
> --- a/drivers/media/i2c/imx471.c
> +++ b/drivers/media/i2c/imx471.c
> @@ -421,6 +421,8 @@ static int imx471_set_pad_format(struct v4l2_subdev *sd,
>  {
>  	struct imx471 *sensor = to_imx471(sd);
>  	const struct imx471_mode *mode;
> +	u8 bin_h, bin_v, binning;
> +	struct v4l2_rect *crop;
>  	int h_blank, ret;
>  
>  	mode = v4l2_find_nearest_size(imx471_modes, ARRAY_SIZE(imx471_modes),
> @@ -431,6 +433,18 @@ static int imx471_set_pad_format(struct v4l2_subdev *sd,
>  
>  	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
>  
> +	/* Analog crop: 2x bin, centered in native array (imx219). */
> +	crop = v4l2_subdev_state_get_crop(sd_state, fmt->pad);
> +	bin_h = min_t(u32,
> +		      IMX471_PIXEL_ARRAY_WIDTH / fmt->format.width, 2);
> +	bin_v = min_t(u32,
> +		      IMX471_PIXEL_ARRAY_HEIGHT / fmt->format.height, 2);
> +	binning = min(bin_h, bin_v);
> +	crop->width = fmt->format.width * binning;
> +	crop->height = fmt->format.height * binning;
> +	crop->left = (IMX471_NATIVE_WIDTH - crop->width) / 2;
> +	crop->top = (IMX471_NATIVE_HEIGHT - crop->height) / 2;
> +
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
>  		return 0;
>  
> @@ -468,7 +482,7 @@ static int imx471_get_selection(struct v4l2_subdev *sd,
>  		sel->r.left = 0;
>  		sel->r.width = IMX471_NATIVE_WIDTH;
>  		sel->r.height = IMX471_NATIVE_HEIGHT;
> -		return 0;
> +		break;
>  
>  	case V4L2_SEL_TGT_CROP_DEFAULT:
>  	case V4L2_SEL_TGT_CROP_BOUNDS:
> @@ -476,10 +490,13 @@ static int imx471_get_selection(struct v4l2_subdev *sd,
>  		sel->r.left = IMX471_PIXEL_ARRAY_LEFT;
>  		sel->r.width = IMX471_PIXEL_ARRAY_WIDTH;
>  		sel->r.height = IMX471_PIXEL_ARRAY_HEIGHT;
> -		return 0;
> +		break;
> +
> +	default:
> +		return -EINVAL;
>  	}
>  
> -	return -EINVAL;
> +	return 0;
>  }
>  
>  static int imx471_init_state(struct v4l2_subdev *sd,
> -- 
> 2.55.0

-- 
Regards,

Sakari Ailus
