Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F31B439004
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 14:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581203; cv=none; b=SXg3mUoYmQlX6c//+c1NXzvojvu8KWU+t8SaenLzpvUkcoiJMlWJmiZmPkOD3Ii7MtlzXEGpl3UvKEetCxZBoFKZx/Hjj/w33zymAc5KDVEYtbIcnPoa9jNiIKTpd/mRR0ItDOM9nOzNxDE3n4LKYIg+2m64wePseUIUXq5IOh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581203; c=relaxed/simple;
	bh=5ovlW63ro1JbbkESw40127Pgk8UGxN6ANib6O/lV18M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aUaoFbloP5T5FUeVdT9OESM1pNTiOOUIE/quICK3xdktUmYud8UcWUpDeIYOC/XAav/TQXHYGYV5hd3/C/wOyQzbTQVuOiQbGQ8jMB+yQQJek0uO+MbouqcHLYyKa17VM4/qA4a1Tdx5K74HNRhnq3m+uUptVBH7I6G2SceCsic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J8KYsV83; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J8KYsV83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787581200; x=1819117200;
  h=date:from:to:cc:subject:message-id;
  bh=5ovlW63ro1JbbkESw40127Pgk8UGxN6ANib6O/lV18M=;
  b=J8KYsV83Wwg+aKLlfv/2GXLe7pjx6vDpRxleH82ck7mUuDqtsNr7mZse
   QnBR4wbp8KFA4rCQ3PyFsATvPQ4FXZl2Rs1T4GPyfQ9DLjetJvXE3AWYa
   Y3FEnRvD3+gQrU1D22EuXl4mU1jVUBaPBVEHxSH7iwILQuiy0n3eZrU7u
   dyfMOHVvCcxdWxL6lSCVhuaVtPwjxuRKLJnS44owRJIUfAYvdUHnE1Myt
   TIM5JUoRhXyW9uGKesPJFYwIUxUSmuV+hxynKxkXpsQNO7TV99WuVmdbi
   H55pcBb79DE5wJefYq7xZJ3WnISJx2XEr+L3tENDt7E/p1a3t9NQVYyeN
   w==;
X-CSE-ConnectionGUID: mP/4UFAfTXe3aUGQY6Tsxw==
X-CSE-MsgGUID: V7BNFlqcRq68sirmzaXoIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98625135"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="98625135"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 07:20:00 -0700
X-CSE-ConnectionGUID: 79SjdCSsRza2v9AvzjhUAg==
X-CSE-MsgGUID: CsS7e8fMTw27LeqmSs4tgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="264400046"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Aug 2026 07:19:58 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyVWg-000000003EQ-2tak;
	Mon, 24 Aug 2026 14:19:52 +0000
Date: Mon, 24 Aug 2026 22:19:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 Frank Li <Frank.Li@nxp.com>
Subject: [sailus-media-tree:frame-desc 28/38]
 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:51:25: warning:
 format '%p' expects argument of type 'void *', but argument 5 has type 'long
 int'
Message-ID: <202608242201.UypJNTA2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree:   git://linuxtv.org/sailus/media_tree.git frame-desc
head:   7c1e8e3f907ccd6c51f2c23e1a4ac09b6d4b1f04
commit: d4fcc2fd2e12bdb46cd8a49eff24056dd12ad846 [28/38] media: nxp: imx8-isi: Use v4l2_subdev_get_frame_desc()
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260824/202608242201.UypJNTA2-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608242201.UypJNTA2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608242201.UypJNTA2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:9:
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function 'mxc_isi_crossbar_gasket_enable':
>> drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:51:25: warning: format '%p' expects argument of type 'void *', but argument 5 has type 'long int' [-Wformat=]
      51 |                         "failed to get frame descriptor from '%s':%u: %pe\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:50:17: note: in expansion of macro 'dev_err'
      50 |                 dev_err(isi->dev,
         |                 ^~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:51:72: note: format string is defined here
      51 |                         "failed to get frame descriptor from '%s':%u: %pe\n",
         |                                                                       ~^
         |                                                                        |
         |                                                                        void *
         |                                                                       %ld


vim +51 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c

    27	
    28	static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
    29						  struct v4l2_subdev_state *state,
    30						  struct v4l2_subdev *remote_sd,
    31						  u32 remote_pad, unsigned int port)
    32	{
    33		struct mxc_isi_dev *isi = xbar->isi;
    34		const struct mxc_gasket_ops *gasket_ops = isi->pdata->gasket_ops;
    35		const struct v4l2_mbus_framefmt *fmt;
    36	
    37		if (!gasket_ops)
    38			return 0;
    39	
    40		/*
    41		 * Configure and enable the gasket with the frame size and CSI-2 data
    42		 * type. For YUV422 8-bit, enable dual component mode unconditionally,
    43		 * to match the configuration of the CSIS.
    44		 */
    45	
    46		struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
    47			v4l2_subdev_get_frame_desc(remote_sd, remote_pad,
    48						   V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL);
    49		if (IS_ERR(fd)) {
    50			dev_err(isi->dev,
  > 51				"failed to get frame descriptor from '%s':%u: %pe\n",
    52				remote_sd->name, remote_pad, PTR_ERR(fd));
    53			return PTR_ERR(fd);
    54		}
    55	
    56		if (fd->num_entries != 1) {
    57			dev_err(isi->dev, "invalid frame descriptor for '%s':%u\n",
    58				remote_sd->name, remote_pad);
    59			return -EINVAL;
    60		}
    61	
    62		fmt = v4l2_subdev_state_get_format(state, port, 0);
    63		if (!fmt)
    64			return -EINVAL;
    65	
    66		gasket_ops->enable(isi, fd, fmt, port);
    67		return 0;
    68	}
    69	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
