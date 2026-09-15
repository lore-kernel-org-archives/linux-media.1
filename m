Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348B83CE0BB
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 03:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789442399; cv=none; b=XL6GJrWfBcDWTlG0Fd+Ww2/yYzVk4FmBK1Wi18Nz4pL4t6X4ZuPkIuNg0gLZsm7UYKTZvPJhELhX2gr/EwCcKQZdVSAmFehHUdcz/lXBF8ESOb0YfjiSg8E+VMSchMJfTNeZdz04iqP7QaA9ihqCxcmkZk5lC8WzEVMeBF0tsXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789442399; c=relaxed/simple;
	bh=Dj11IKlq4dujfRHfQ2KKfFlEcxpfsjQZjLZrROXQYy4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oEqbAZRNKESS0FixJm43BgvFl2J+yV9OE97dRk3gasdg9z7DTzvvKkL1uxtFBEf1R+pDmz5FGTVvCzhIW7FSfXJzIY+fa8FadHExTlMP3nehgm5oCnGhyiYmQvxHB7vuR8H0P2AwPiZl84lDbTM5Sv7uMwu1g6MnlBbn9iGqtaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ewk6p31k; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ewk6p31k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789442397; x=1820978397;
  h=date:from:to:cc:subject:message-id;
  bh=Dj11IKlq4dujfRHfQ2KKfFlEcxpfsjQZjLZrROXQYy4=;
  b=Ewk6p31kf+7uiZ+8mzcHLUHDt6ZsmSrDyty179xbkkCbAD1/YEP1Y46+
   uUzSPsulpSbRuW9mj6NB0Bn61g1tUHfGBdlrOlI3RPsWwIxvsZeJKZtQk
   IZDctRpbv027etej9lyHMiKTTvLsoVkEz+BhVAzCSOwIGAJZSTyOgr1TC
   FysTJQtRBXr8x4OqsLU+Bp7/iqsZtgvBVBtiPUmtclgmAdt+5X8jgv4Ho
   tSfhhZzd1H5yKZCIWRasKhX+GSOUYwziFPXg7NTBwrBe7ae866xZp7kJq
   LeOBnulonU6r1CtP2BJMrbRfiP4SU9vaggeiOWUwRULaVLeAxKVdIafK2
   g==;
X-CSE-ConnectionGUID: +8W4j/B+QMipxhm2YpB6oA==
X-CSE-MsgGUID: gn1kw/rKTgyndXrfbGCyCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107308671"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107308671"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 20:19:55 -0700
X-CSE-ConnectionGUID: 7papYH6aSx+LYDg6LQ6RAQ==
X-CSE-MsgGUID: zE4Q+NopSSC0seA+vbFnhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1039215"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 14 Sep 2026 20:19:54 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6Ji2-000000003w0-49vr;
	Tue, 15 Sep 2026 03:19:50 +0000
Date: Tue, 15 Sep 2026 11:19:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD REGRESSION
 357c2e168b861a3df80c68a9c44de9c9c282ec46
Message-ID: <202609151115.a2tCmAEk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: 357c2e168b861a3df80c68a9c44de9c9c282ec46  Documentation: media: Reword blanking control documentation

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202609131638.i4iLw29I-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202609140333.smSZmqE0-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202609140557.zQdCENMs-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202609140614.KMCttn8e-lkp@intel.com

    drivers/media/pci/intel/ipu6/ipu6-fw-isys.c:664:6: warning: variable 'source' set but not used [-Wunused-but-set-variable]
    drivers/media/pci/intel/ipu6/ipu7-fw-isys.c:597:3: error: cannot jump from this goto statement to its label
    drivers/media/pci/intel/ipu6/ipu7-fw-isys.c:599:3: error: cannot jump from this goto statement to its label
    drivers/media/platform/nxp/imx95-csi-formatter.c:527:14: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
    drivers/media/platform/nxp/imx95-csi-formatter.c:527:35: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Werror=incompatible-pointer-types]
    drivers/media/platform/nxp/imx95-csi-formatter.c:527:35: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arc-allmodconfig
|   `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|-- arc-allyesconfig
|   `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|-- arm-allyesconfig
|   `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|-- arm-randconfig-002-20260915
|   `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-
|-- arm64-allmodconfig
|   `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-
|-- arm64-randconfig-002-20260914
|   `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-
|-- i386-allmodconfig
|   |-- drivers-media-pci-intel-ipu6-ipu6-fw-isys.c:warning:variable-source-set-but-not-used
|   `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|-- i386-allyesconfig
|   |-- drivers-media-pci-intel-ipu6-ipu6-fw-isys.c:warning:variable-source-set-but-not-used
|   `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|-- i386-buildonly-randconfig-005-20260914
|   `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|-- i386-randconfig-003-20260914
|   |-- drivers-media-pci-intel-ipu6-ipu6-fw-isys.c:warning:variable-source-set-but-not-used
|   `-- drivers-media-pci-intel-ipu6-ipu7-fw-isys.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- i386-randconfig-012-20260913
|   |-- drivers-media-pci-intel-ipu6-ipu6-fw-isys.c:warning:variable-source-set-but-not-used
|   `-- drivers-media-pci-intel-ipu6-ipu7-fw-isys.c:error:cannot-jump-from-this-goto-statement-to-its-label
|-- i386-randconfig-r111-20260914
|   `-- drivers-media-pci-intel-ipu6-ipu6-fw-isys.c:warning:variable-source-set-but-not-used
|-- loongarch-allmodconfig
|   `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-
|-- mips-allmodconfig
|   `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|-- mips-allyesconfig
|   `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|-- powerpc-allmodconfig
|   `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|-- sh-allmodconfig
|   `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|-- sh-allyesconfig
|   `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|-- sh-randconfig-r111-20260913
|   `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|-- sparc64-allmodconfig
|   `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-
|-- um-allmodconfig
|   `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-
|-- um-allyesconfig
|   `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom
|-- x86_64-allmodconfig
|   |-- drivers-media-pci-intel-ipu6-ipu6-fw-isys.c:warning:variable-source-set-but-not-used
|   |-- drivers-media-pci-intel-ipu6-ipu7-fw-isys.c:error:cannot-jump-from-this-goto-statement-to-its-label
|   `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-
|-- x86_64-allyesconfig
|   |-- drivers-media-pci-intel-ipu6-ipu6-fw-isys.c:warning:variable-source-set-but-not-used
|   |-- drivers-media-pci-intel-ipu6-ipu7-fw-isys.c:error:cannot-jump-from-this-goto-statement-to-its-label
|   `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:incompatible-function-pointer-types-initializing-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-
|-- x86_64-buildonly-randconfig-001-20260915
|   |-- drivers-media-pci-intel-ipu6-ipu6-fw-isys.c:warning:variable-source-set-but-not-used
|   `-- drivers-media-pci-intel-ipu6-ipu7-fw-isys.c:error:cannot-jump-from-this-goto-statement-to-its-label
`-- xtensa-allyesconfig
    `-- drivers-media-platform-nxp-imx95-csi-formatter.c:error:initialization-of-int-(-)(struct-v4l2_subdev-const-struct-v4l2_subdev_client_info-struct-v4l2_subdev_state-struct-v4l2_subdev_format-)-from-incom

elapsed time: 3135m

configs tested: 516
configs skipped: 52

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-24
arc                              allmodconfig    clang-24
arc                               allnoconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-24
arc                              allyesconfig    clang-24
arc                          axs101_defconfig    gcc-16.1.0
arc                          axs103_defconfig    clang-17
arc                      axs103_smp_defconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                     haps_hs_smp_defconfig    gcc-16.1.0
arc                        nsim_700_defconfig    clang-17
arc                     nsimosci_hs_defconfig    gcc-16.1.0
arc                 nsimosci_hs_smp_defconfig    clang-21
arc                   randconfig-001-20260913    gcc-10.5.0
arc                   randconfig-001-20260914    gcc-13.4.0
arc                   randconfig-001-20260915    clang-24
arc                   randconfig-002-20260913    gcc-10.5.0
arc                   randconfig-002-20260914    gcc-13.4.0
arc                   randconfig-002-20260915    clang-24
arc                  randconfig-r113-20260914    gcc-8.5.0 sparse
arc                  randconfig-r121-20260914    gcc-8.5.0 sparse
arc                  randconfig-r123-20260914    clang-17 sparse
arc                  randconfig-r132-20260914    gcc-8.5.0 sparse
arc                           tb10x_defconfig    clang-17
arc                        vdk_hs38_defconfig    gcc-16.1.0
arm                               allnoconfig    gcc-16.1.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-24
arm                              allyesconfig    clang-24
arm                                 defconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                          exynos_defconfig    gcc-16.1.0
arm                      footbridge_defconfig    gcc-16.1.0
arm                            hisi_defconfig    gcc-16.1.0
arm                       imx_v6_v7_defconfig    clang-24
arm                        keystone_defconfig    gcc-16.1.0
arm                         lpc18xx_defconfig    clang-21
arm                         lpc18xx_defconfig    gcc-16.1.0
arm                        mvebu_v7_defconfig    clang-17
arm                           omap1_defconfig    gcc-16.1.0
arm                       omap2plus_defconfig    clang-17
arm                         orion5x_defconfig    clang-21
arm                         orion5x_defconfig    clang-24
arm                             pxa_defconfig    clang-21
arm                             pxa_defconfig    gcc-16.1.0
arm                   randconfig-001-20260913    gcc-10.5.0
arm                   randconfig-001-20260914    gcc-13.4.0
arm                   randconfig-001-20260915    clang-24
arm                   randconfig-002-20260913    gcc-10.5.0
arm                   randconfig-002-20260914    gcc-13.4.0
arm                   randconfig-002-20260915    clang-24
arm                   randconfig-003-20260913    gcc-10.5.0
arm                   randconfig-003-20260914    gcc-13.4.0
arm                   randconfig-003-20260915    clang-24
arm                   randconfig-004-20260913    gcc-10.5.0
arm                   randconfig-004-20260914    gcc-13.4.0
arm                   randconfig-004-20260915    clang-24
arm                  randconfig-r113-20260914    gcc-11.5.0 sparse
arm                  randconfig-r122-20260914    clang-17 sparse
arm                  randconfig-r133-20260914    gcc-8.5.0 sparse
arm                  randconfig-r134-20260914    clang-22 sparse
arm                         socfpga_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-24
arm64                            allmodconfig    clang-24
arm64                             allnoconfig    gcc-16.1.0
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260913    gcc-16.1.0
arm64                 randconfig-001-20260914    gcc-9.5.0
arm64                 randconfig-001-20260915    gcc-12.5.0
arm64                 randconfig-002-20260913    gcc-16.1.0
arm64                 randconfig-002-20260914    gcc-9.5.0
arm64                 randconfig-002-20260915    gcc-12.5.0
arm64                 randconfig-003-20260913    gcc-16.1.0
arm64                 randconfig-003-20260914    gcc-9.5.0
arm64                 randconfig-003-20260915    gcc-12.5.0
arm64                 randconfig-004-20260913    gcc-16.1.0
arm64                 randconfig-004-20260914    gcc-9.5.0
arm64                 randconfig-004-20260915    gcc-12.5.0
arm64                randconfig-r112-20260914    gcc-8.5.0 sparse
arm64                randconfig-r121-20260914    gcc-11.5.0 sparse
arm64                randconfig-r131-20260914    gcc-15.2.0 sparse
arm64                randconfig-r131-20260914    gcc-16.1.0 sparse
arm64                randconfig-r132-20260914    gcc-14 sparse
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260913    gcc-16.1.0
csky                  randconfig-001-20260914    gcc-9.5.0
csky                  randconfig-001-20260915    gcc-12.5.0
csky                  randconfig-002-20260913    gcc-16.1.0
csky                  randconfig-002-20260914    gcc-9.5.0
csky                  randconfig-002-20260915    gcc-12.5.0
csky                 randconfig-r111-20260914    gcc-8.5.0 sparse
csky                 randconfig-r123-20260914    gcc-8.5.0 sparse
csky                 randconfig-r134-20260915    gcc-12.5.0 sparse
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260913    clang-24
hexagon               randconfig-001-20260914    gcc-13.4.0
hexagon               randconfig-001-20260915    clang-24
hexagon               randconfig-002-20260913    clang-24
hexagon               randconfig-002-20260914    gcc-13.4.0
hexagon               randconfig-002-20260915    clang-24
hexagon              randconfig-r131-20260914    gcc-14 sparse
hexagon              randconfig-r134-20260914    gcc-14 sparse
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260914    gcc-14
i386        buildonly-randconfig-001-20260915    clang-22
i386        buildonly-randconfig-002-20260914    gcc-14
i386        buildonly-randconfig-002-20260915    clang-22
i386        buildonly-randconfig-003-20260914    gcc-14
i386        buildonly-randconfig-003-20260915    clang-22
i386        buildonly-randconfig-004-20260914    gcc-14
i386        buildonly-randconfig-004-20260915    clang-22
i386        buildonly-randconfig-005-20260914    gcc-14
i386        buildonly-randconfig-005-20260915    clang-22
i386        buildonly-randconfig-006-20260914    gcc-14
i386        buildonly-randconfig-006-20260915    clang-22
i386                                defconfig    gcc-16.1.0
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260914    clang-22
i386                  randconfig-001-20260915    clang-22
i386                  randconfig-002-20260914    clang-22
i386                  randconfig-002-20260915    clang-22
i386                  randconfig-003-20260914    clang-22
i386                  randconfig-003-20260915    clang-22
i386                  randconfig-004-20260914    clang-22
i386                  randconfig-004-20260915    clang-22
i386                  randconfig-005-20260914    clang-22
i386                  randconfig-005-20260915    clang-22
i386                  randconfig-006-20260914    clang-22
i386                  randconfig-006-20260915    clang-22
i386                  randconfig-007-20260914    clang-22
i386                  randconfig-007-20260915    clang-22
i386                  randconfig-011-20260913    gcc-14
i386                  randconfig-011-20260914    clang-22
i386                  randconfig-011-20260915    gcc-14
i386                  randconfig-012-20260913    gcc-14
i386                  randconfig-012-20260914    clang-22
i386                  randconfig-013-20260913    gcc-14
i386                  randconfig-013-20260914    clang-22
i386                  randconfig-013-20260915    gcc-14
i386                  randconfig-014-20260913    gcc-14
i386                  randconfig-014-20260914    clang-22
i386                  randconfig-014-20260915    gcc-14
i386                  randconfig-015-20260913    gcc-14
i386                  randconfig-015-20260914    clang-22
i386                  randconfig-016-20260913    gcc-14
i386                  randconfig-016-20260914    clang-22
i386                  randconfig-017-20260913    gcc-14
i386                  randconfig-017-20260914    clang-22
i386                  randconfig-017-20260915    gcc-14
i386                  randconfig-061-20260914    gcc-14 sparse
i386                  randconfig-062-20260914    gcc-14 sparse
i386                  randconfig-063-20260914    gcc-14 sparse
i386                 randconfig-r111-20260914    clang-17 sparse
i386                 randconfig-r134-20260914    clang-22 sparse
i386                 randconfig-r134-20260914    gcc-14 sparse
loongarch                        allmodconfig    clang-24
loongarch                        allmodconfig    clang-24
loongarch                         allnoconfig    gcc-16.1.0
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-24
loongarch                           defconfig    clang-24
loongarch                loongson64_defconfig    clang-24
loongarch             randconfig-001-20260913    clang-24
loongarch             randconfig-001-20260914    gcc-13.4.0
loongarch             randconfig-001-20260915    clang-24
loongarch             randconfig-002-20260913    clang-24
loongarch             randconfig-002-20260914    gcc-13.4.0
loongarch             randconfig-002-20260915    clang-24
loongarch            randconfig-r111-20260914    gcc-11.5.0 sparse
loongarch            randconfig-r113-20260914    clang-17 sparse
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-24
m68k                             allyesconfig    clang-24
m68k                          amiga_defconfig    gcc-16.1.0
m68k                                defconfig    clang-24
m68k                                defconfig    clang-24
m68k                       m5235evb_defconfig    clang-17
m68k                       m5249evb_defconfig    gcc-16.1.0
m68k                       m5282evb_defconfig    gcc-16.1.0
m68k                        m5407c3_defconfig    clang-17
m68k                 randconfig-r134-20260915    gcc-11.5.0 sparse
m68k                          sun3x_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-24
microblaze                          defconfig    clang-24
mips                             allmodconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                         bigsur_defconfig    clang-17
mips                       bmips_be_defconfig    gcc-16.1.0
mips                      bmips_stb_defconfig    clang-17
mips                         cobalt_defconfig    gcc-16.1.0
mips                     cu1000-neo_defconfig    gcc-16.1.0
mips                  decstation_64_defconfig    gcc-16.1.0
mips                 decstation_r4k_defconfig    gcc-16.1.0
mips                econet_en751221_defconfig    clang-21
mips                           ip22_defconfig    gcc-16.1.0
mips                           ip32_defconfig    clang-24
mips                        omega2p_defconfig    gcc-16.1.0
mips                 randconfig-r131-20260915    gcc-12.5.0 sparse
mips                 randconfig-r132-20260914    gcc-16.1.0 sparse
mips                 randconfig-r133-20260914    clang-22 sparse
mips                         rt305x_defconfig    clang-17
mips                         rt305x_defconfig    clang-24
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-24
nios2                             allnoconfig    clang-24
nios2                             allnoconfig    gcc-16.1.0
nios2                               defconfig    clang-24
nios2                               defconfig    clang-24
nios2                 randconfig-001-20260913    clang-24
nios2                 randconfig-001-20260914    gcc-13.4.0
nios2                 randconfig-001-20260914    gcc-8.5.0
nios2                 randconfig-001-20260915    clang-24
nios2                 randconfig-002-20260913    clang-24
nios2                 randconfig-002-20260914    gcc-13.4.0
nios2                 randconfig-002-20260914    gcc-8.5.0
nios2                 randconfig-002-20260915    clang-24
nios2                randconfig-r131-20260914    gcc-8.5.0 sparse
nios2                randconfig-r133-20260914    clang-22 sparse
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-24
openrisc                          allnoconfig    clang-24
openrisc                          allnoconfig    gcc-16.1.0
openrisc                   de0_nano_defconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
openrisc             randconfig-r121-20260914    clang-17 sparse
parisc                           allmodconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-24
parisc                            allnoconfig    clang-24
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                generic-64bit_defconfig    gcc-16.1.0
parisc                randconfig-001-20260913    gcc-8.5.0
parisc                randconfig-001-20260914    gcc-8.5.0
parisc                randconfig-001-20260915    gcc-8.5.0
parisc                randconfig-002-20260913    gcc-8.5.0
parisc                randconfig-002-20260914    gcc-8.5.0
parisc                randconfig-002-20260915    gcc-8.5.0
parisc64                            defconfig    clang-24
parisc64                            defconfig    clang-24
powerpc                          allmodconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-24
powerpc                           allnoconfig    clang-24
powerpc                           allnoconfig    gcc-16.1.0
powerpc                      arches_defconfig    gcc-16.1.0
powerpc                   currituck_defconfig    gcc-16.1.0
powerpc                     ep8248e_defconfig    clang-24
powerpc                        fsp2_defconfig    gcc-16.1.0
powerpc                    ge_imp3a_defconfig    gcc-16.1.0
powerpc                      katmai_defconfig    gcc-16.1.0
powerpc                     kmeter1_defconfig    gcc-16.1.0
powerpc                 linkstation_defconfig    gcc-16.1.0
powerpc                   motionpro_defconfig    clang-17
powerpc                     mpc83xx_defconfig    gcc-16.1.0
powerpc                  mpc866_ads_defconfig    clang-17
powerpc                  mpc885_ads_defconfig    clang-21
powerpc                      pasemi_defconfig    clang-24
powerpc                     powernv_defconfig    gcc-16.1.0
powerpc                         ps3_defconfig    clang-17
powerpc                         ps3_defconfig    gcc-16.1.0
powerpc               randconfig-001-20260913    gcc-8.5.0
powerpc               randconfig-001-20260914    gcc-8.5.0
powerpc               randconfig-001-20260915    gcc-8.5.0
powerpc               randconfig-002-20260913    gcc-8.5.0
powerpc               randconfig-002-20260914    gcc-8.5.0
powerpc               randconfig-002-20260915    gcc-8.5.0
powerpc              randconfig-r122-20260914    gcc-8.5.0 sparse
powerpc              randconfig-r133-20260915    gcc-12.5.0 sparse
powerpc              randconfig-r134-20260914    gcc-16.1.0 sparse
powerpc                 xes_mpc85xx_defconfig    gcc-16.1.0
powerpc64             randconfig-001-20260913    gcc-8.5.0
powerpc64             randconfig-001-20260914    gcc-8.5.0
powerpc64             randconfig-001-20260915    gcc-8.5.0
powerpc64             randconfig-002-20260913    gcc-8.5.0
powerpc64             randconfig-002-20260914    gcc-8.5.0
powerpc64             randconfig-002-20260915    gcc-8.5.0
powerpc64            randconfig-r132-20260915    gcc-12.5.0 sparse
riscv                            allmodconfig    clang-24
riscv                            allmodconfig    clang-24
riscv                             allnoconfig    clang-24
riscv                             allnoconfig    clang-24
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-24
riscv                            allyesconfig    clang-24
riscv                               defconfig    gcc-16.1.0
riscv                               defconfig    gcc-16.1.0
riscv                    nommu_virt_defconfig    clang-24
riscv                    nommu_virt_defconfig    gcc-16.1.0
riscv                 randconfig-001-20260913    gcc-14.3.0
riscv                 randconfig-001-20260914    gcc-13.4.0
riscv                 randconfig-002-20260913    gcc-14.3.0
riscv                 randconfig-002-20260914    gcc-13.4.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-24
s390                              allnoconfig    clang-24
s390                             allyesconfig    gcc-16.1.0
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260913    gcc-14.3.0
s390                  randconfig-001-20260914    gcc-13.4.0
s390                  randconfig-002-20260913    gcc-14.3.0
s390                  randconfig-002-20260914    gcc-13.4.0
s390                 randconfig-r122-20260914    gcc-11.5.0 sparse
s390                 randconfig-r131-20260915    gcc-11.5.0 sparse
s390                       zfcpdump_defconfig    gcc-16.1.0
sh                               alldefconfig    gcc-16.1.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-24
sh                                allnoconfig    clang-24
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                         ap325rxa_defconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-14
sh                        dreamcast_defconfig    gcc-16.1.0
sh                             espt_defconfig    gcc-16.1.0
sh                               j2_defconfig    gcc-16.1.0
sh                 kfr2r09-romimage_defconfig    gcc-16.1.0
sh                          kfr2r09_defconfig    clang-17
sh                    randconfig-001-20260913    gcc-14.3.0
sh                    randconfig-001-20260914    gcc-13.4.0
sh                    randconfig-002-20260913    gcc-14.3.0
sh                    randconfig-002-20260914    gcc-13.4.0
sh                          rsk7264_defconfig    gcc-16.1.0
sh                          sdk7786_defconfig    clang-21
sh                            shmin_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-24
sparc                             allnoconfig    clang-24
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260913    gcc-15.2.0
sparc                 randconfig-001-20260914    gcc-16.1.0
sparc                 randconfig-001-20260915    gcc-13.4.0
sparc                 randconfig-002-20260913    gcc-15.2.0
sparc                 randconfig-002-20260914    gcc-16.1.0
sparc                 randconfig-002-20260915    gcc-13.4.0
sparc                randconfig-r112-20260914    clang-17 sparse
sparc                randconfig-r123-20260914    gcc-11.5.0 sparse
sparc                randconfig-r131-20260914    clang-22 sparse
sparc                randconfig-r132-20260914    gcc-14 sparse
sparc                randconfig-r133-20260914    gcc-15.2.0 sparse
sparc64                          alldefconfig    clang-17
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260913    gcc-15.2.0
sparc64               randconfig-001-20260914    gcc-16.1.0
sparc64               randconfig-001-20260915    gcc-13.4.0
sparc64               randconfig-002-20260913    gcc-15.2.0
sparc64               randconfig-002-20260914    gcc-16.1.0
sparc64               randconfig-002-20260915    gcc-13.4.0
sparc64              randconfig-r112-20260914    gcc-11.5.0 sparse
sparc64              randconfig-r131-20260914    clang-22 sparse
sparc64              randconfig-r134-20260914    gcc-8.5.0 sparse
um                               allmodconfig    clang-17
um                                allnoconfig    clang-24
um                                allnoconfig    clang-24
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             i386_defconfig    gcc-16.1.0
um                    randconfig-001-20260913    gcc-15.2.0
um                    randconfig-001-20260914    gcc-16.1.0
um                    randconfig-001-20260915    gcc-13.4.0
um                    randconfig-002-20260913    gcc-15.2.0
um                    randconfig-002-20260914    gcc-16.1.0
um                    randconfig-002-20260915    gcc-13.4.0
um                   randconfig-r132-20260915    gcc-11.5.0 sparse
um                   randconfig-r133-20260914    gcc-14 sparse
um                   randconfig-r133-20260915    gcc-11.5.0 sparse
um                           x86_64_defconfig    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           alldefconfig    gcc-16.1.0
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-24
x86_64                            allnoconfig    clang-24
x86_64                            allnoconfig    gcc-16.1.0
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260913    clang-22
x86_64      buildonly-randconfig-001-20260914    gcc-14
x86_64      buildonly-randconfig-001-20260915    clang-22
x86_64      buildonly-randconfig-002-20260913    clang-22
x86_64      buildonly-randconfig-002-20260914    gcc-14
x86_64      buildonly-randconfig-002-20260915    clang-22
x86_64      buildonly-randconfig-003-20260913    clang-22
x86_64      buildonly-randconfig-003-20260914    gcc-14
x86_64      buildonly-randconfig-003-20260915    clang-22
x86_64      buildonly-randconfig-004-20260913    clang-22
x86_64      buildonly-randconfig-004-20260914    gcc-14
x86_64      buildonly-randconfig-004-20260915    clang-22
x86_64      buildonly-randconfig-005-20260913    clang-22
x86_64      buildonly-randconfig-005-20260914    gcc-14
x86_64      buildonly-randconfig-005-20260915    clang-22
x86_64      buildonly-randconfig-006-20260913    clang-22
x86_64      buildonly-randconfig-006-20260914    gcc-14
x86_64      buildonly-randconfig-006-20260915    clang-22
x86_64                              defconfig    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260913    clang-22
x86_64                randconfig-001-20260914    gcc-14
x86_64                randconfig-002-20260913    clang-22
x86_64                randconfig-002-20260914    gcc-14
x86_64                randconfig-003-20260913    clang-22
x86_64                randconfig-003-20260914    gcc-14
x86_64                randconfig-004-20260913    clang-22
x86_64                randconfig-004-20260914    gcc-14
x86_64                randconfig-005-20260913    clang-22
x86_64                randconfig-005-20260914    gcc-14
x86_64                randconfig-006-20260913    clang-22
x86_64                randconfig-006-20260914    gcc-14
x86_64                randconfig-011-20260913    gcc-14
x86_64                randconfig-011-20260914    clang-22
x86_64                randconfig-011-20260915    gcc-14
x86_64                randconfig-012-20260913    gcc-14
x86_64                randconfig-012-20260914    clang-22
x86_64                randconfig-012-20260915    gcc-14
x86_64                randconfig-013-20260913    gcc-14
x86_64                randconfig-013-20260914    clang-22
x86_64                randconfig-013-20260915    gcc-14
x86_64                randconfig-014-20260913    gcc-14
x86_64                randconfig-014-20260914    clang-22
x86_64                randconfig-014-20260915    gcc-14
x86_64                randconfig-015-20260913    gcc-14
x86_64                randconfig-015-20260914    clang-22
x86_64                randconfig-015-20260915    gcc-14
x86_64                randconfig-016-20260913    gcc-14
x86_64                randconfig-016-20260914    clang-22
x86_64                randconfig-016-20260915    gcc-14
x86_64                randconfig-071-20260914    clang-22
x86_64                randconfig-071-20260915    clang-22
x86_64                randconfig-072-20260914    clang-22
x86_64                randconfig-072-20260915    clang-22
x86_64                randconfig-073-20260914    clang-22
x86_64                randconfig-073-20260915    clang-22
x86_64                randconfig-074-20260914    clang-22
x86_64                randconfig-074-20260915    clang-22
x86_64                randconfig-075-20260914    clang-22
x86_64                randconfig-075-20260915    clang-22
x86_64                randconfig-076-20260914    clang-22
x86_64                randconfig-076-20260915    clang-22
x86_64                randconfig-121-20260914    gcc-14 sparse
x86_64                randconfig-122-20260914    gcc-14 sparse
x86_64                randconfig-123-20260914    gcc-14 sparse
x86_64               randconfig-r132-20260914    clang-22 sparse
x86_64               randconfig-r133-20260914    gcc-14 sparse
x86_64               randconfig-r133-20260914    gcc-16.1.0 sparse
x86_64               randconfig-r134-20260914    gcc-15.2.0 sparse
x86_64                               rhel-9.4    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                               rhel-9.4    gcc-14
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                          rhel-9.4-func    clang-22
x86_64                          rhel-9.4-func    gcc-14
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                    rhel-9.4-kselftests    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                           alldefconfig    clang-21
xtensa                            allnoconfig    clang-24
xtensa                            allnoconfig    clang-24
xtensa                           allyesconfig    clang-20
xtensa                          iss_defconfig    gcc-16.1.0
xtensa                randconfig-001-20260913    gcc-15.2.0
xtensa                randconfig-001-20260914    gcc-16.1.0
xtensa                randconfig-001-20260915    gcc-13.4.0
xtensa                randconfig-002-20260913    gcc-15.2.0
xtensa                randconfig-002-20260914    gcc-16.1.0
xtensa                randconfig-002-20260915    gcc-13.4.0
xtensa               randconfig-r131-20260914    gcc-14 sparse
xtensa               randconfig-r132-20260914    gcc-15.2.0 sparse
xtensa                         virt_defconfig    clang-17

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
