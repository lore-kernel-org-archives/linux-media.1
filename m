Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F0A2701B6
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 02:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791254438; cv=none; b=AEl7nzpxHMdgJa823upxAnfUCuSw8GOKgvsw0d9trAHGHgJba4twsivHYbaRlwgC94K0RRSFITVxa5jhU4ZCuk1lfxhKF90fEDOx9wqOAOw/ESJeenXwBjbvN4Er42cT33coK5+mObls16kFz+S3CHRpzCJ4agNbV2xkHtimX+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791254438; c=relaxed/simple;
	bh=15R0MoxjwTZvYQUrCXrBeZ1QqDRqwCjB5W8CtW+4xxI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hUh+QgLCw73RCsiVOASLhbOTgkHb4+I/A4r0neMcS+SRKVU4gLQSmPz00R6MzPprTm2EN88m0dvXQpJrttuWWyMazopPszKu1NhxTbddbEr4a3UnLSJRMNofGavkwgKbovbVntZ3avLqrmnXraFbEMYVGFLFbt/QyAPztOqpnhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hff5CUtf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hff5CUtf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791254436; x=1822790436;
  h=date:from:to:cc:subject:message-id;
  bh=15R0MoxjwTZvYQUrCXrBeZ1QqDRqwCjB5W8CtW+4xxI=;
  b=hff5CUtf5UdNgsvME2B81s2x47Utt5XFo5kBbqugzmfioja5pzbK0giT
   VB/U9JnnkE0utp8JVhy+XlDk4MUZXfqgcqkRTdijlbvKCOzgk40uSbGq4
   WoZcqj5L4jH/l9aIP9f6fV3xfWCCdF55VUlhmc8CAmiMFDEcMAdO9NWCe
   VyIUTsD0vk2aUv27oK89iivXLqdlVJUyguheI/1n1PZB2sIcXdBUciHIZ
   ka4cMinUYueWrQetFg10H+c4YShMuctOHOvhGkEBkHdO6tsQbkrX85QtZ
   aU00hk9GXqEFEFpY6egvvbxKVJi/G2JqS3n3DseS6AA5aJFpX7E0gZ03j
   A==;
X-CSE-ConnectionGUID: Hr0cIBQjQY2fOMjI9dWx2A==
X-CSE-MsgGUID: EumopdkCTA+5Ieb3IPcgCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="108310576"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="108310576"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 19:40:36 -0700
X-CSE-ConnectionGUID: lqLQaxlzR1yVGx03naBMnA==
X-CSE-MsgGUID: 6Buk5HqgTgO8jyhUqmCugw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="274790024"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Oct 2026 19:40:34 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDv6W-0000000014m-14as;
	Tue, 06 Oct 2026 02:40:32 +0000
Date: Tue, 06 Oct 2026 10:39:33 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:devel 26/26]
 drivers/media/i2c/imx576.c:738:20: error: initialization of 'int (*)(struct
 v4l2_subdev *, const struct v4l2_subdev_client_info *, struct
 v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer
 type 'int (*)(struct v4l2_subdev *, stru...
Message-ID: <202610061019.8ldzc0xf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree:   git://linuxtv.org/sailus/media_tree.git devel
head:   d5ffd31776528da0ec4bc883afd056513773566b
commit: d5ffd31776528da0ec4bc883afd056513773566b [26/26] media: i2c: add imx576 image sensor driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20261006/202610061019.8ldzc0xf-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061019.8ldzc0xf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061019.8ldzc0xf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/imx576.c:738:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
     738 |         .set_fmt = imx576_set_pad_format,
         |                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx576.c:738:20: note: (near initialization for 'imx576_pad_ops.set_fmt')
   drivers/media/i2c/imx576.c:416:12: note: 'imx576_set_pad_format' declared here
     416 | static int imx576_set_pad_format(struct v4l2_subdev *sd,
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/imx576.c:739:26: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Wincompatible-pointer-types]
     739 |         .get_selection = imx576_get_selection,
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx576.c:739:26: note: (near initialization for 'imx576_pad_ops.get_selection')
   drivers/media/i2c/imx576.c:453:12: note: 'imx576_get_selection' declared here
     453 | static int imx576_get_selection(struct v4l2_subdev *sd,
         |            ^~~~~~~~~~~~~~~~~~~~


vim +738 drivers/media/i2c/imx576.c

   733	
   734	static const struct v4l2_subdev_pad_ops imx576_pad_ops = {
   735		.enum_mbus_code = imx576_enum_mbus_code,
   736		.enum_frame_size = imx576_enum_frame_size,
   737		.get_fmt = v4l2_subdev_get_fmt,
 > 738		.set_fmt = imx576_set_pad_format,
 > 739		.get_selection = imx576_get_selection,
   740		.enable_streams = imx576_enable_streams,
   741		.disable_streams = imx576_disable_streams,
   742	};
   743	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
