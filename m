Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D623AA9F4
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278715; cv=none; b=ZNl4x78ZD6scdlPKZ7JxRB1aeosClu2zqOpS85SC0Ssidp7OTo5I4kqwSHKRdOoBBJnfo3eEEc+5wolrnG5iljzHGY+CtooJEnDazFL2S2aK4rAcXYfvh5HVdMDgfanrFZdaJDKRKCLa+g5e0+tn5eZthJoywYHwmqA+oBDOUTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278715; c=relaxed/simple;
	bh=y2BfgHYUmjrI3CB52oBfp3JNS4+QDjSal/Svw+xsD0Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wj3Bx2I98VC/CArT5UzuPpHfhhTnb1ARPVGqNQuCm/htJxdOZgbxNwhkX+D2Wm+FJsBAWURIcS592a07n7fshxBQi7ZY4iZ3cRG7+/fgu3zoaVEmF80t8KsmmmB6Ke9XgANjO6Av0a210I8NMUvs10inT22GnjjsVTA1ACJaaec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CH1MMt1d; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CH1MMt1d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791278713; x=1822814713;
  h=date:from:to:cc:subject:message-id;
  bh=y2BfgHYUmjrI3CB52oBfp3JNS4+QDjSal/Svw+xsD0Q=;
  b=CH1MMt1dqFjdgWtLJyePlX82XgRn/YtkfFCSetXrk5bhtzHzd56Rtn/7
   uw2CTHJAibiontvQX+6ocvibGeOF8LK3cdI63QnqvUNj3ODMCJqsoMD1L
   YcytjqzIwZF7DNGvqeweke1W063IHVgeH35EbTWx2AUezDEsPLu/NCIRH
   DpuIFvaoAbbR1rWv3Rx4+L/TYiI7SeomX1wzQe8zu3nQ8tc495emlL6OF
   B8ak/3hwfw4Pph9MGmd9OV9anDJ7KBwPg5mfXyiBN2v/5Fz33SlLk/37s
   ULe2piYfA0GxV6rqaqu/JrgxoOmb1lG0GbEUtm0JeOqwGRaHpSzXVRaLy
   Q==;
X-CSE-ConnectionGUID: Fl2LaOwQQNWmUdgvxcA6iw==
X-CSE-MsgGUID: +mLpYYVlTqKE6ym4U60KLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102482873"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102482873"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 02:25:12 -0700
X-CSE-ConnectionGUID: nfwq1pNSQBqbH0BiOP/Whg==
X-CSE-MsgGUID: a/6YBQXDT/+1g/EnX6zTYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="274898630"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Oct 2026 02:25:11 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE1Q4-000000001Oi-0eQW;
	Tue, 06 Oct 2026 09:25:08 +0000
Date: Tue, 06 Oct 2026 17:25:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD REGRESSION
 d5ffd31776528da0ec4bc883afd056513773566b
Message-ID: <202610061702.hoykzumD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: d5ffd31776528da0ec4bc883afd056513773566b  media: i2c: add imx576 image sensor driver

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202610061019.8ldzc0xf-lkp@intel.com

    drivers/media/i2c/imx576.c:738:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/i2c/imx576.c:738:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
    drivers/media/i2c/imx576.c:739:26: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Werror=incompatible-pointer-types]
    drivers/media/i2c/imx576.c:739:26: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' [-Wincompatible-pointer-types]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
|   `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- arc-allmodconfig
|   |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
|   `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- arc-allyesconfig
|   |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
|   `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- arm-allyesconfig
|   |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
|   `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- csky-allmodconfig
|   |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
|   `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- i386-allmodconfig
|   |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
|   `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- i386-allyesconfig
|   |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
|   `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- m68k-allmodconfig
|   |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
|   `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- m68k-allyesconfig
|   |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
|   `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- microblaze-allyesconfig
|   |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
|   `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- mips-allmodconfig
|   |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
|   `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- mips-allyesconfig
|   |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
|   `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- nios2-allmodconfig
|   |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
|   `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- openrisc-allmodconfig
|   |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
|   `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- parisc-allmodconfig
|   |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
|   `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- parisc-allyesconfig
|   |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
|   `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- powerpc-allmodconfig
|   |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
|   `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- s390-allyesconfig
|   |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
|   `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- sh-allmodconfig
|   |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
|   `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- sh-allyesconfig
|   |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
|   `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
|-- um-allyesconfig
|   |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
|   `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ
`-- xtensa-allyesconfig
    |-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incompatible-pointer-type-i
    `-- drivers-media-i2c-imx576.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_selection-)-from-incompatible-pointer-typ

elapsed time: 1313m

configs tested: 190
configs skipped: 9

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    clang-24
alpha                                defconfig    gcc-16.1.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                      haps_hs_smp_defconfig    clang-24
arc                   randconfig-1000-20261006    clang-24
arc                   randconfig-1001-20261006    clang-24
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                          lpc32xx_defconfig    gcc-16.1.0
arm                         mvebu_v7_defconfig    clang-24
arm                         mvebu_v7_defconfig    gcc-16.1.0
arm                              mxs_defconfig    gcc-16.1.0
arm                           pxa3xx_defconfig    clang-24
arm                   randconfig-1000-20261006    clang-24
arm                   randconfig-1001-20261006    clang-24
arm                   randconfig-1002-20261006    clang-24
arm                   randconfig-1003-20261006    clang-24
arm                         realview_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261006    gcc-16.1.0
arm64                 randconfig-1001-20261006    gcc-16.1.0
arm64                 randconfig-1002-20261006    gcc-16.1.0
arm64                 randconfig-1003-20261006    gcc-16.1.0
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261006    gcc-16.1.0
csky                  randconfig-1001-20261006    gcc-16.1.0
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261006    gcc-13.4.0
hexagon               randconfig-1001-20261006    gcc-13.4.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261006    gcc-14
i386        buildonly-randconfig-1001-20261006    gcc-14
i386        buildonly-randconfig-1002-20261006    gcc-14
i386        buildonly-randconfig-1003-20261006    gcc-14
i386        buildonly-randconfig-1004-20261006    gcc-14
i386        buildonly-randconfig-1005-20261006    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261006    gcc-14
i386                  randconfig-1001-20261006    gcc-14
i386                  randconfig-1002-20261006    gcc-14
i386                  randconfig-1003-20261006    gcc-14
i386                  randconfig-1004-20261006    gcc-14
i386                  randconfig-1005-20261006    gcc-14
i386                  randconfig-1006-20261006    gcc-14
i386                  randconfig-1007-20261006    gcc-14
i386                  randconfig-1008-20261006    gcc-14
i386                  randconfig-1009-20261006    gcc-14
i386                  randconfig-1010-20261006    gcc-14
i386                  randconfig-1011-20261006    gcc-14
i386                  randconfig-1012-20261006    gcc-14
i386                  randconfig-1013-20261006    gcc-14
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261006    gcc-13.4.0
loongarch             randconfig-1001-20261006    gcc-13.4.0
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    clang-24
m68k                        bvme6000_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                         m5307c3_defconfig    gcc-16.1.0
m68k                          nettel_defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                       loongson1_defconfig    gcc-16.1.0
mips                         omega2p_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261006    gcc-13.4.0
nios2                 randconfig-1001-20261006    gcc-13.4.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc          de0_nano_multicore_defconfig    gcc-16.1.0
openrisc                             defconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261006    gcc-14.3.0
parisc                randconfig-1001-20261006    gcc-14.3.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                  mpc836x_rdk_defconfig    clang-24
powerpc               randconfig-1000-20261006    gcc-14.3.0
powerpc               randconfig-1001-20261006    gcc-14.3.0
powerpc                      tqm8541_defconfig    gcc-16.1.0
powerpc                      tqm8548_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261006    gcc-14.3.0
powerpc64             randconfig-1001-20261006    gcc-14.3.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                     nommu_virt_defconfig    clang-24
riscv                 randconfig-1000-20261006    clang-24
riscv                 randconfig-1001-20261006    clang-24
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261006    clang-24
s390                  randconfig-1001-20261006    clang-24
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                           r7780mp_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261006    clang-24
sh                    randconfig-1001-20261006    clang-24
sh                            se7619_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261006    gcc-14
sparc                 randconfig-1001-20261006    gcc-14
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261006    gcc-14
sparc64               randconfig-1001-20261006    gcc-14
um                                alldefconfig    gcc-16.1.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261006    gcc-14
um                    randconfig-1001-20261006    gcc-14
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261006    gcc-14
x86_64      buildonly-randconfig-1001-20261006    gcc-14
x86_64      buildonly-randconfig-1002-20261006    gcc-14
x86_64      buildonly-randconfig-1003-20261006    gcc-14
x86_64      buildonly-randconfig-1004-20261006    gcc-14
x86_64      buildonly-randconfig-1005-20261006    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261006    gcc-14
x86_64                randconfig-1001-20261006    gcc-14
x86_64                randconfig-1002-20261006    gcc-14
x86_64                randconfig-1003-20261006    gcc-14
x86_64                randconfig-1004-20261006    gcc-14
x86_64                randconfig-1005-20261006    gcc-14
x86_64                randconfig-1006-20261006    gcc-14
x86_64                randconfig-1007-20261006    gcc-14
x86_64                randconfig-1008-20261006    gcc-14
x86_64                randconfig-1009-20261006    gcc-14
x86_64                randconfig-1010-20261006    gcc-14
x86_64                randconfig-1011-20261006    gcc-14
x86_64                randconfig-1012-20261006    gcc-14
x86_64                randconfig-1013-20261006    gcc-14
x86_64                randconfig-1014-20261006    gcc-14
x86_64                randconfig-1015-20261006    gcc-14
x86_64                randconfig-1016-20261006    gcc-14
x86_64                randconfig-1017-20261006    gcc-14
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261006    gcc-14
xtensa                randconfig-1001-20261006    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
