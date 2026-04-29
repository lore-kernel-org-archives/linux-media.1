Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF473A6F0F
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 07:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777447340; cv=none; b=iymhhQoTO6VmbbWqsy82oEUHbmXH9pLG3c2vlmOo4lWEmE0WOhRSCVPRCcMIaOGrvLWubJv1gD4o7abwP2UP4j8TEBbl+vZyaSw53vwhCDdEVNArhDfpQ4qJYf8JBzPB7EXP7zIQbJeJ1Bb/1LiOI24GvY/yWxAr4l5SOL+UxgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777447340; c=relaxed/simple;
	bh=/ZIj71H6tSeT3GiyOW6v6FaeUnS1pyHF0P2L9U9RmUc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rgnL6DQWm+DUBhRlRJ6cpl2HfLlpYmUGaS6rVf8wreq6ate6XmG/hE4HKhDxmKzup8501+0+l1R0Si+gzmIqxHzLVptVQh3ZrN1qiuFnWF0dHhZva79XUFihJgbZH24EOpaL7elyoE31mgb87lfICIZB0sImIsSD0TBMv//OvYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=myWGB0/x; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myWGB0/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777447337; x=1808983337;
  h=date:from:to:cc:subject:message-id;
  bh=/ZIj71H6tSeT3GiyOW6v6FaeUnS1pyHF0P2L9U9RmUc=;
  b=myWGB0/xmYp6VZ7F5ZsaIAyph9TluH6XkgrkQ6JxoMNmMvY5nvuKSCcf
   XilxOztwvtTZqF00r2HAqMH/kauYqClLh+/6d2yK406YASnKnv6MvskQK
   /pOJLRfi05jjpIWhumHTFMfxIsUt2ioNoZOVTQKpG5FmGI39Iy0ieENSa
   Twf/+fvHRUrNpwdzqjRT5sSvOgkvP2Xnsrh+fuMoBFx2KCb5R01bb3mCe
   0Xpa9DRoLi0rc5sM+7KXYrkOMCpVmp7uZtkcoDSalv6LwSAQm35IDrcCf
   LEYFXDHJsrFa1p5g+bwkdP2CQkyLvlHQQ2dYDng1KpcqLFQaTRY7J97cx
   g==;
X-CSE-ConnectionGUID: aH+3fqWpQN22l+0U4w7AHQ==
X-CSE-MsgGUID: h6fAtZvZQ4qUp5ZRm+EDRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="88678591"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="88678591"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 00:22:16 -0700
X-CSE-ConnectionGUID: QHWBM+h3RQi76GYlkQDhBw==
X-CSE-MsgGUID: H68LAGmgRf+T6MfsFo/7Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="233327962"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Apr 2026 00:22:15 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHzFM-00000000Aje-2dCh;
	Wed, 29 Apr 2026 07:22:12 +0000
Date: Wed, 29 Apr 2026 15:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 80/122]
 drivers/media/i2c/ccs/ccs-core.c:2486:47: error: passing argument 2 of
 'ccs_get_format' from incompatible pointer type
Message-ID: <202604291512.J1OPGgas-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   489ab6e79288be8d219b68525a13699fde0248ae
commit: f3d14633599ac2e30aeb1e1af17db73b46682931 [80/122] media: ccs: Add support for embedded data stream
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260429/202604291512.J1OPGgas-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604291512.J1OPGgas-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604291512.J1OPGgas-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/ccs/ccs-core.c: In function 'ccs_set_format':
>> drivers/media/i2c/ccs/ccs-core.c:2486:47: error: passing argument 2 of 'ccs_get_format' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2486 |                 return ccs_get_format(subdev, ci, sd_state, fmt);
         |                                               ^~
         |                                               |
         |                                               const struct v4l2_subdev_client_info *
   drivers/media/i2c/ccs/ccs-core.c:2299:53: note: expected 'struct v4l2_subdev_state *' but argument is of type 'const struct v4l2_subdev_client_info *'
    2299 |                           struct v4l2_subdev_state *sd_state,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:2486:51: error: passing argument 3 of 'ccs_get_format' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2486 |                 return ccs_get_format(subdev, ci, sd_state, fmt);
         |                                                   ^~~~~~~~
         |                                                   |
         |                                                   struct v4l2_subdev_state *
   drivers/media/i2c/ccs/ccs-core.c:2300:54: note: expected 'struct v4l2_subdev_format *' but argument is of type 'struct v4l2_subdev_state *'
    2300 |                           struct v4l2_subdev_format *fmt)
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
>> drivers/media/i2c/ccs/ccs-core.c:2486:24: error: too many arguments to function 'ccs_get_format'
    2486 |                 return ccs_get_format(subdev, ci, sd_state, fmt);
         |                        ^~~~~~~~~~~~~~
   drivers/media/i2c/ccs/ccs-core.c:2298:12: note: declared here
    2298 | static int ccs_get_format(struct v4l2_subdev *subdev,
         |            ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ccs_get_format +2486 drivers/media/i2c/ccs/ccs-core.c

  2475	
  2476	static int ccs_set_format(struct v4l2_subdev *subdev,
  2477				  const struct v4l2_subdev_client_info *ci,
  2478				  struct v4l2_subdev_state *sd_state,
  2479				  struct v4l2_subdev_format *fmt)
  2480	{
  2481		struct ccs_sensor *sensor = to_ccs_sensor(subdev);
  2482		struct ccs_subdev *ssd = to_ccs_subdev(subdev);
  2483		struct v4l2_rect *crop;
  2484	
  2485		if (ssd == sensor->src && fmt->pad == CCS_PAD_META)
> 2486			return ccs_get_format(subdev, ci, sd_state, fmt);
  2487	
  2488		if (ssd == sensor->src && fmt->stream == CCS_STREAM_META) {
  2489			ccs_set_format_meta(subdev, sd_state, &fmt->format);
  2490	
  2491			return 0;
  2492		}
  2493	
  2494		if (fmt->pad == ssd->source_pad) {
  2495			int rval;
  2496	
  2497			rval = ccs_set_format_source(subdev, NULL, sd_state, fmt);
  2498			if (ccs_embedded_data_lines(sensor) && ssd == sensor->src)
  2499				ccs_set_format_meta(subdev, sd_state, NULL);
  2500	
  2501			return rval;
  2502		}
  2503	
  2504		/* Sink pad. Width and height are changeable here. */
  2505		fmt->format.code = ccs_get_mbus_code(subdev, fmt->pad);
  2506	
  2507		fmt->format.width &= ~1;
  2508		fmt->format.height &= ~1;
  2509		fmt->format.field = V4L2_FIELD_NONE;
  2510	
  2511		fmt->format.width =
  2512			clamp(fmt->format.width,
  2513			      CCS_LIM(sensor, MIN_X_OUTPUT_SIZE),
  2514			      CCS_LIM(sensor, MAX_X_OUTPUT_SIZE));
  2515		fmt->format.height =
  2516			clamp(fmt->format.height,
  2517			      CCS_LIM(sensor, MIN_Y_OUTPUT_SIZE),
  2518			      CCS_LIM(sensor, MAX_Y_OUTPUT_SIZE));
  2519	
  2520		crop = v4l2_subdev_state_get_crop(sd_state, ssd->sink_pad,
  2521						  CCS_STREAM_PIXEL);
  2522	
  2523		crop->left = 0;
  2524		crop->top = 0;
  2525		crop->width = fmt->format.width;
  2526		crop->height = fmt->format.height;
  2527		ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_CROP);
  2528	
  2529		return 0;
  2530	}
  2531	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
