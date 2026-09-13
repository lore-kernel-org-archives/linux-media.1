Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB643B7747
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 19:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326840; cv=none; b=VGyX1Nna6kU70czVv6+xyWwdUvYBvsIm8NwIDDWuUO7kUW8NOvN5oEAmZj3SeXvhhCZLlgmHGLXVSr37ju/CjpYvvLAVR9FkTEO/eYa/z8wjDpte+34CnVa6xTNH8V5+jusVg1yYwHvYd+qcViPcJ5pAsKmFy4V6pxnhK0kpFec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326840; c=relaxed/simple;
	bh=73EdWm/8REcLzCvwRq9rvSU4CkJ54TXvkVJntrtdLw4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fm46xN1977tdHiVN0qM4kHt2kU4+nVItsFFP/v1qJbpWtOrsJdD/pKjHIVxeg46xab2Oll3rHiWiyTgY2M6xIUugCGCTrsakN/nKUJ8tVEI5XTx6Ln1VNYsspbjyPwNZUEcZDU7sU4rbFmPYaWRwPRPJT8Hx+RXZziOgiiF2whw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RePnqGh/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RePnqGh/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789326839; x=1820862839;
  h=date:from:to:cc:subject:message-id;
  bh=73EdWm/8REcLzCvwRq9rvSU4CkJ54TXvkVJntrtdLw4=;
  b=RePnqGh/A9rKmxoG53HAsEmJRvov/6IxX6+OlZCPP6ibe7VUiif58Rvh
   VcYJ3K0TM1TzJvVfpgDA4NAi6+K2Rx97KGMVrgwqby92PIkwOi0brinIT
   +dpQ/GUDwXXANTz4sVjHyiOrEd86T/oPsiHjnFxkWTB+RjBo2fJuCIdWd
   qJvCJF+NFesYeG8qPRtCRBHIvCwzZSE4fX6V5Qx3cjcBBVDYW2voXUF7t
   JbkTXdemoQDZ8o5gKT0Oysd3Zv2p1VRzFCTPwU7zywu7jXqzLLRFj9Jjw
   bSCNAgr6I/AH+dYzI/YYawlYHEMD67wrT8sDF+1iNSM/+Cl43Igh/nvvH
   Q==;
X-CSE-ConnectionGUID: HS84x/S7SNqoK7xyWcdIqg==
X-CSE-MsgGUID: atoM+WANQwGPW80N9XukHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="112467610"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="112467610"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 12:13:58 -0700
X-CSE-ConnectionGUID: gcjOwFR9QnCCl/1uLYB9wg==
X-CSE-MsgGUID: AyYE0GzWRdmLorn8yuapvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="271035069"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Sep 2026 12:13:57 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5peD-000000001Dn-3zWs;
	Sun, 13 Sep 2026 19:13:53 +0000
Date: Mon, 14 Sep 2026 03:13:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 Frank Li <Frank.Li@nxp.com>
Subject: [sailus-media-tree:metadata 79/169]
 drivers/media/platform/nxp/imx95-csi-formatter.c:527:35: error:
 initialization of 'int (*)(struct v4l2_subdev *, const struct
 v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct
 v4l2_subdev_format *)' from incompatible pointer type 'int (*)(stru...
Message-ID: <202609140333.smSZmqE0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   357c2e168b861a3df80c68a9c44de9c9c282ec46
commit: cd854e06923fe7a8c466ef89a0308bcab2adf45e [79/169] media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops
config: sh-randconfig-r111-20260913 (https://download.01.org/0day-ci/archive/20260914/202609140333.smSZmqE0-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609140333.smSZmqE0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609140333.smSZmqE0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/nxp/imx95-csi-formatter.c:527:35: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
     527 |         .set_fmt                = csi_formatter_subdev_set_fmt,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx95-csi-formatter.c:527:35: note: (near initialization for 'formatter_subdev_pad_ops.set_fmt')
   cc1: some warnings being treated as errors


vim +527 drivers/media/platform/nxp/imx95-csi-formatter.c

3652add7e9b01d Guoniu Zhou 2026-07-28  523  
3652add7e9b01d Guoniu Zhou 2026-07-28  524  static const struct v4l2_subdev_pad_ops formatter_subdev_pad_ops = {
3652add7e9b01d Guoniu Zhou 2026-07-28  525  	.enum_mbus_code		= csi_formatter_subdev_enum_mbus_code,
3652add7e9b01d Guoniu Zhou 2026-07-28  526  	.get_fmt		= v4l2_subdev_get_fmt,
3652add7e9b01d Guoniu Zhou 2026-07-28 @527  	.set_fmt		= csi_formatter_subdev_set_fmt,
3652add7e9b01d Guoniu Zhou 2026-07-28  528  	.get_frame_desc		= v4l2_subdev_get_frame_desc_passthrough,
3652add7e9b01d Guoniu Zhou 2026-07-28  529  	.set_routing		= csi_formatter_subdev_set_routing,
3652add7e9b01d Guoniu Zhou 2026-07-28  530  	.enable_streams		= csi_formatter_subdev_enable_streams,
3652add7e9b01d Guoniu Zhou 2026-07-28  531  	.disable_streams	= csi_formatter_subdev_disable_streams,
3652add7e9b01d Guoniu Zhou 2026-07-28  532  };
3652add7e9b01d Guoniu Zhou 2026-07-28  533  

:::::: The code at line 527 was first introduced by commit
:::::: 3652add7e9b01d6ea4d3d4ff3ade8f60084867f6 media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver

:::::: TO: Guoniu Zhou <guoniu.zhou@nxp.com>
:::::: CC: Hans Verkuil <hverkuil+cisco@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
