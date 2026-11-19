Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795051792;
	b=j3NfSR40fV2iZULMk1dwnYvhIMI2jHyjuz7Y2efNXIIJ7IVm7cUuo+ZQY6VQgF1SeBDT
	 ahSZNx6Z3EB4Xhwi0vzOTBo0GpcnLh2Qk7BCBILsnds1Ca/drLFmuRyGsDNG4pwd6kK9R
	 DPCsut9BlC6RvYeVOkNrDlxbLFFxjd3Qzjwnf76TO3sAO7gDbSWPp6zc98QVV7VpRroVH
	 OtmJNMu9G1/81PHDsGO2j/P+MAL8M71tKHFSc+eX4VpTx3ViQDg1wUyBt/jGX2ttcIny5
	 bLXoOi5w7MkIZCbtrjvSILlVZkgIkpWARTzawEd8W+LNM8pP/KX09kIEdf0Mo0+tSkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795051792;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=x4fAcRoJ2YTGq9ddQwXxO1AMt8z5W7KBXaV1qNqSSsc=;
	b=UsTjQB/2bN5P3lSrQYdvGRM43MSTRZ9lsb8gBmoj+lRBQJ37jCaAZaMuWcX/LVSJG9wS
	 9U7se/benfXA+ZyDCxvsdQb1lrRyy/rccusX8IbiPdkDjHt4PDdom8gISGKXKKxtVOxFg
	 bVhZQSBvhq+k1OVSzEogR+5cjq34IOqXXO+VjFTN/klxsXEZ0XXNMdtMVUbSfHfvfDkDd
	 fjVRb/ByIyWcHQoohTixuQzbxdAC0R+u5NK0fekHlyj/UTYFnmsKhyYPSWVw8Oh3sT38H
	 LsPq5uhnz+9BD5AGqIoTfCXe+s0+C/OboBAR2k5RViSN2Ir8af+bGugUlGXeNY2Nf6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Flv8VXJM;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0778660A2605;
	Thu, 19 Nov 2026 01:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0778660A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Flv8VXJM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795051791; x=1826587791;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nEwdCDBlkKdiY4PZlmFX9Tey5suWOxV9KHgcjcIGKAU=;
  b=Flv8VXJMzGuwvTyypSdrBQlCx4inOvO7AKAb5nDEB6fLcosuArcudGgs
   24/rDID9WvQ75OJ2JvyWyvXX5M+r5d9FSIUqeJhExAsJiZO9ACsx8JndI
   HlMX6lXz+5TT/x8uLNcPOMLFGKX50En6Fd1OtP8I/1I1WMStxKCwl+mgL
   n7eXmzE5ssvHlBk/qWnFV4pw2FnDKJJhJhJ0ucrLbJ7CzYiSEWmE6xJPt
   Ir2quAzsJqTnV75LdUpET4E1eCfPpYlJ6eePhtqyT2DDPpzl8F49mRvmz
   zsUgyr6F4pSK1blGlnNhhADV8Y7gVlfyt9vAsiIQcrsOLHw2eJQLrTXmK
   A==;
X-CSE-ConnectionGUID: jQSuYnYyQxGZjOhWwbpFaA==
X-CSE-MsgGUID: m1gFudbyS8+eiSH2JgEYtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3775563"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3775563"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 17:29:51 -0800
X-CSE-ConnectionGUID: dx7/84LIQbWLRaPWHrkw0w==
X-CSE-MsgGUID: l61BKaPPTcCGoHoGTqv/fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10431095"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Nov 2026 17:29:47 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTqy9-00000001EjY-1jg5;
	Thu, 19 Nov 2026 01:29:45 +0000
Date: Thu, 19 Nov 2026 09:28:57 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>, linux-kernel@vger.kernel.org,
	michal.simek@amd.com, git@amd.com
Cc: oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] media: xilinx: vip: Make use of the
 devm_clk_get_enabled()
Message-ID: <202611190940.8mpjaLm0-lkp@intel.com>
References: <abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek@amd.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek@amd.com>

Hi Michal,

kernel test robot noticed the following build errors:

[auto build test ERROR on v7.4-rc3]
[also build test ERROR on linus/master next-20261116]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Simek/media-xilinx-vip-Make-use-of-the-devm_clk_get_enabled/20261118-103132
base:   v7.4-rc3
patch link:    https://lore.kernel.org/r/abfe9f93f9f93d256b0d60d081e6111d7169c08f.1794994290.git.michal.simek%40amd.com
patch subject: [PATCH] media: xilinx: vip: Make use of the devm_clk_get_enabled()
config: arm-randconfig-1000-20261119 (https://download.01.org/0day-ci/archive/20261119/202611190940.8mpjaLm0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/202611190940.8mpjaLm0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611190940.8mpjaLm0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/xilinx/xilinx-vip.c: In function 'xvip_init_resources':
>> drivers/media/platform/xilinx/xilinx-vip.c:215:21: error: implicit declaration of function 'devm_clk_get_enable'; did you mean 'devm_clk_get_enabled'? [-Wimplicit-function-declaration]
     215 |         xvip->clk = devm_clk_get_enable(xvip->dev, NULL);
         |                     ^~~~~~~~~~~~~~~~~~~
         |                     devm_clk_get_enabled
>> drivers/media/platform/xilinx/xilinx-vip.c:215:19: error: assignment to 'struct clk *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     215 |         xvip->clk = devm_clk_get_enable(xvip->dev, NULL);
         |                   ^


vim +215 drivers/media/platform/xilinx/xilinx-vip.c

   206	
   207	int xvip_init_resources(struct xvip_device *xvip)
   208	{
   209		struct platform_device *pdev = to_platform_device(xvip->dev);
   210	
   211		xvip->iomem = devm_platform_ioremap_resource(pdev, 0);
   212		if (IS_ERR(xvip->iomem))
   213			return PTR_ERR(xvip->iomem);
   214	
 > 215		xvip->clk = devm_clk_get_enable(xvip->dev, NULL);
   216		if (IS_ERR(xvip->clk))
   217			return PTR_ERR(xvip->clk);
   218	
   219		return 0;
   220	}
   221	EXPORT_SYMBOL_GPL(xvip_init_resources);
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
