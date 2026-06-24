Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D6D399CF0;
	Wed, 24 Jun 2026 08:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782291358; cv=none; b=Tm2bt3DJDYqNcbWZxmtDck4CTfkM3+AqpoRg2VA43LRvwWb/7pTI7z4QnK684C9YSFO34G/DJ/bkiJ4v3N1xKYDoiwFtuiH0OG1C+g3IMrDRce/jEJ74YYbA+SKkRe2Hl4a79cl5IvSp1FcOxi6wYD47lhBlOt0ObYGK7k3ofd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782291358; c=relaxed/simple;
	bh=bYFN6cFo+ZbkWtMegzCgipaxB6cvFdqEP/LpckOcsKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R9Vk0eu+JAPh92/S2KyQi/4arWrNRMvj9Dwlo/bD1Ndfc4w0i4Uic1OkqBRlWi+UtsqODhEh5D+GBMewP1nwNetLdrc0RbY0BBqRHUGsuRA7KolPBBdlsMRop2PBiq/n81NNF7UvLlRrVlCGSWgEdxBcujAdvhlGMUsbMpLALTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LDfFA2Mh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDfFA2Mh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782291357; x=1813827357;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bYFN6cFo+ZbkWtMegzCgipaxB6cvFdqEP/LpckOcsKs=;
  b=LDfFA2MhEXBsauDq3P1ap7krapDbUs8zAZKi1jZJs7UdyFwjIH8/PSc9
   YrVc+XMwcTDequIgMvPXZJ0VSvwJzBw4xguzqL6sQp4iguShn54sNeBqR
   WzT/zFwjNjGFH+z3x4Xzqijwy5hrpIM1w7AwppaOdJDfaeshVWj9RLsG5
   JCn/QvW7RExcHvVylpkH78k9vgEhJui8I84U+e80FBQ6ZIKA9gyghC3NL
   xc7T2p8arz9812iBw0fHaX92nonUB9pd02mAgjhXQ4qUUQmvqwCRzbC3R
   WtNYiNeVQdJPIZBSR3r6F0LbElcYWriCHSsEIlFFJsJinWHKnf1Hnrmjj
   Q==;
X-CSE-ConnectionGUID: dX5cQuY8QzW0phYoxXXepw==
X-CSE-MsgGUID: J+05I0bGShysny3iykvzSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="70558387"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="70558387"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 01:55:56 -0700
X-CSE-ConnectionGUID: OVt3CiO0TQ6ExSkMrbdMsw==
X-CSE-MsgGUID: 89zwSy07THGOsTjvB01Vwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="253654257"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.168])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 01:55:53 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5F64C121C4D;
	Wed, 24 Jun 2026 11:55:52 +0300 (EEST)
Date: Wed, 24 Jun 2026 11:55:52 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Serin Yeh <serin.yeh@intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Damjan Georgievski <gdamjan@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Message-ID: <ajubmHMhiuRyyLoM@kekkonen.localdomain>
References: <20260624033508.27391-1-hpa@redhat.com>
 <20260624033508.27391-4-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624033508.27391-4-hpa@redhat.com>

Hi Kate,

Thanks for the update.

On Wed, Jun 24, 2026 at 11:35:08AM +0800, Kate Hsuan wrote:
...

> +static int imx471_set_pad_format(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_format *fmt)
> +{
> +	struct imx471 *sensor = to_imx471(sd);
> +	const struct imx471_mode *mode;
> +	int h_blank, ret;
> +
> +	mode = v4l2_find_nearest_size(imx471_modes, ARRAY_SIZE(imx471_modes),
> +				      width, height, fmt->format.width,
> +				      fmt->format.height);
> +
> +	imx471_update_pad_format(sensor, mode, fmt);
> +
> +	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> +		return 0;
> +
> +	if (media_entity_is_streaming(&sensor->sd.entity))
> +		return -EBUSY;
> +
> +	ret = __v4l2_ctrl_modify_range(sensor->vblank,
> +				       mode->fll_min - mode->height,
> +				       IMX471_FLL_MAX - mode->height,
> +				       1,
> +				       mode->fll_def - mode->height);
> +	if (ret)
> +		return ret;
> +
> +	h_blank = mode->llp - mode->width;
> +	/*
> +	 * Currently hblank is not changeable.
> +	 * So FPS control is done only by vblank.
> +	 */
> +	return __v4l2_ctrl_modify_range(sensor->hblank, h_blank,
> +					h_blank, 1, h_blank);
> +}

...

> +
> +static int imx471_init_state(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_state *sd_state)
> +{
> +	struct v4l2_subdev_format fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,

The purpose of the init_state op is to initialise the provided state only,
it's not allowed to change the sensor configuration.

> +		.format = {
> +			.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +			.width = imx471_modes[0].width,
> +			.height = imx471_modes[0].height,
> +		},
> +	};
> +
> +	return imx471_set_pad_format(sd, sd_state, &fmt);
> +}

-- 
Kind regards,

Sakari Ailus
