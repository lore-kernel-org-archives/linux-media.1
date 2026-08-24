Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D757364933
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 14:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583068; cv=none; b=Lezvl8IigYYyqH0ih5XHTM7UcSIaxRkExG+SjyNfpzhN7WlttFrDaaagPseUUCj09qyhCdMYg3q8oZoEq3VEqEkdchb9vT5Rge6pSkHTQE6SrU4MJvrixC1yt53Wt11lik6o1NFS0uuBz2qVG/mGYVaoM2tzD27cmTt+hRkmmaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583068; c=relaxed/simple;
	bh=fOZiwFAE9Wuvlu3PhFUKTUS0M9KyCx8yhpdH6laDcUk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qmyMQ0DxheknGuNulZMoW+wRKyXQh7wHzhDfpvaJUKoqfnTrWGiGRNg4xksw0HT+HGDSWqe4MuP3IZa5x4Q8wNSjDNnawI8q2mEKWxvxUI/vuuysNJEThFzAZE0bSmyLL2N4JccyKVPC44NvTbmjwxmOj5xkcdajWmrh2wlSkMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hyp3Nhok; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hyp3Nhok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787583066; x=1819119066;
  h=date:from:to:cc:subject:message-id;
  bh=fOZiwFAE9Wuvlu3PhFUKTUS0M9KyCx8yhpdH6laDcUk=;
  b=hyp3Nhok8761uj4dpWZZAGMh/JWt5Ahv1K1GxKeGUszOVgYfuanmrsC3
   OBNSuf1bvLL0L6WJV6SU9WxKk0HXeupKW4qeSZXb6HCtlHXyQC1LWHdtu
   TzRBJV2VtpDvklM8B93rrh9zxW3/QGiCF1HXr2i9t0JCnxSoGjJRrn8CP
   n0LQV1g88KzxzvoU3UFYN8bj8TLFK983Tjm+Wkp5ksUANCnDUsyMU/jR/
   PMDcwjFMnpeDnIc+NDkjGZQ1cGw8N/qBFb3rKvMwWpB0KxFxiSkqu0GBQ
   etuB0q0f+pDuyEGLBkCT2eaFNo+dUbFQauILNl+oa3O+im04XsZGODMca
   w==;
X-CSE-ConnectionGUID: GMjaVYoCTIKVaPCc8X01+A==
X-CSE-MsgGUID: vrg2NjeYQ66FjksjUmWa2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88161289"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88161289"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 07:51:06 -0700
X-CSE-ConnectionGUID: CSA0CGsxTE2otHpAWbZOGw==
X-CSE-MsgGUID: zTMmo3kST3aW3GahTyZwiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="267589894"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Aug 2026 07:51:04 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyW0j-000000003HR-3jM0;
	Mon, 24 Aug 2026 14:50:55 +0000
Date: Mon, 24 Aug 2026 22:50:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:frame-desc 31/38]
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:109:25: warning: format
 '%p' expects argument of type 'void *', but argument 5 has type 'long int'
Message-ID: <202608242231.UUc2L5th-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree:   git://linuxtv.org/sailus/media_tree.git frame-desc
head:   7c1e8e3f907ccd6c51f2c23e1a4ac09b6d4b1f04
commit: 212ff03f220ab9cdff207d0ff3c6a459e1f1e1d5 [31/38] media: rkisp1: Use v4l2_subdev_get_frame_desc()
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260824/202608242231.UUc2L5th-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608242231.UUc2L5th-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608242231.UUc2L5th-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/pm_runtime.h:11,
                    from drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:13:
   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c: In function 'rkisp1_gasket_enable':
>> drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:109:25: warning: format '%p' expects argument of type 'void *', but argument 5 has type 'long int' [-Wformat=]
     109 |                         "failed to get frame descriptor from '%s':%u: %pe\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:108:17: note: in expansion of macro 'dev_err'
     108 |                 dev_err(rkisp1->dev,
         |                 ^~~~~~~
   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:109:72: note: format string is defined here
     109 |                         "failed to get frame descriptor from '%s':%u: %pe\n",
         |                                                                       ~^
         |                                                                        |
         |                                                                        void *
         |                                                                       %ld


vim +109 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c

    86	
    87	static int rkisp1_gasket_enable(struct rkisp1_device *rkisp1,
    88					struct media_pad *source)
    89	{
    90		struct v4l2_subdev *source_sd;
    91		unsigned int dt;
    92		u32 mask;
    93		u32 val;
    94	
    95		/*
    96		 * Configure and enable the gasket with the CSI-2 data type. Set the
    97		 * vsync polarity as active high, as that is what the ISP is configured
    98		 * to expect in ISP_ACQ_PROP. Enable left justification, as the i.MX8MP
    99		 * ISP has a 16-bit wide input and expects data to be left-aligned.
   100		 */
   101	
   102		source_sd = media_entity_to_v4l2_subdev(source->entity);
   103	
   104		struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
   105			v4l2_subdev_get_frame_desc(source_sd, source->index,
   106						   V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
   107		if (IS_ERR(fd)) {
   108			dev_err(rkisp1->dev,
 > 109				"failed to get frame descriptor from '%s':%u: %pe\n",
   110				source_sd->name, 0, PTR_ERR(fd));
   111			return PTR_ERR(fd);
   112		}
   113	
   114		if (fd->num_entries != 1) {
   115			dev_err(rkisp1->dev, "invalid frame descriptor for '%s':%u\n",
   116				source_sd->name, 0);
   117			return -EINVAL;
   118		}
   119	
   120		dt = fd->entry[0].bus.csi2.dt;
   121	
   122		if (rkisp1->gasket_id == 0) {
   123			mask = ISP_DEWARP_CONTROL_MIPI_CSI1_HS_POLARITY
   124			     | ISP_DEWARP_CONTROL_MIPI_CSI1_VS_SEL_MASK
   125			     | ISP_DEWARP_CONTROL_MIPI_ISP1_LEFT_JUST_MODE
   126			     | ISP_DEWARP_CONTROL_MIPI_ISP1_DATA_TYPE_MASK
   127			     | ISP_DEWARP_CONTROL_GPR_ISP_0_DISABLE;
   128			val = ISP_DEWARP_CONTROL_MIPI_CSI1_VS_SEL_POSITIVE
   129			    | ISP_DEWARP_CONTROL_MIPI_ISP1_LEFT_JUST_MODE
   130			    | ISP_DEWARP_CONTROL_MIPI_ISP1_DATA_TYPE(dt);
   131		} else {
   132			mask = ISP_DEWARP_CONTROL_MIPI_CSI2_HS_POLARITY
   133			     | ISP_DEWARP_CONTROL_MIPI_CSI2_VS_SEL_MASK
   134			     | ISP_DEWARP_CONTROL_MIPI_ISP2_LEFT_JUST_MODE
   135			     | ISP_DEWARP_CONTROL_MIPI_ISP2_DATA_TYPE_MASK
   136			     | ISP_DEWARP_CONTROL_GPR_ISP_1_DISABLE;
   137			val = ISP_DEWARP_CONTROL_MIPI_CSI2_VS_SEL_POSITIVE
   138			    | ISP_DEWARP_CONTROL_MIPI_ISP2_LEFT_JUST_MODE
   139			    | ISP_DEWARP_CONTROL_MIPI_ISP2_DATA_TYPE(dt);
   140		}
   141	
   142		regmap_update_bits(rkisp1->gasket, ISP_DEWARP_CONTROL, mask, val);
   143	
   144		return 0;
   145	}
   146	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
