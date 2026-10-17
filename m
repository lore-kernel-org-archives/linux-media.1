Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B47145D5C0
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 22:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792274528; cv=none; b=M6/ogxr5OdIIfODsxwnUtkk8jycnIb9kXZZJo5meTDFV+W1hG9PcKAC0GlUlvxh1adZT74s/lntyFJTkIzBwZXFD285hE8h2j6Byg4WTrQ9USPub32S/jrZeZ5acY1uYPQp7cmTdOy4Q72MOmhdMgVeyN0xbUgMJlgtIDIY/WxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792274528; c=relaxed/simple;
	bh=VB0k8/4YMroH2a8GNymnVlvAEaNyb0xNaQnrDrKT8LI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l76rN/NPOrK2cpBVZOGTmHBFtvV9WQ5tlIEGAr7isa2gPhcNbcwOrEYNSkdpkNzAMhoFUNBxjDX/hQYXO709xDeyKlptUBlfzneGQVTkGeIjejM6GyPN5irgpSD7QGFeZ+fI9Ex5tN6owzhAu11bfvF4YcGj6U0Ot/YU71VYLAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K097jZSc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K097jZSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792274525; x=1823810525;
  h=date:from:to:cc:subject:message-id;
  bh=VB0k8/4YMroH2a8GNymnVlvAEaNyb0xNaQnrDrKT8LI=;
  b=K097jZScHwRKBW3WzFloqvMLrE9m84DTCyhEsG0DjnmdIsMBOMF8KHiy
   0HWzfFmAj8Wy1Tu8w7W4xbKx58aAYwMvCk9zyEHA19CmA+1LVEdPz4S2Q
   SGGy3h5NB7U31NmwG/3kjld+NjLvSuotClT1/fjzfm3jv+CUba3g0GmFG
   eKnQ2Rs/exAorb89AOGSlNDkQR40NP/zcyQhHwDgzeQAKrDwYtZTn0eSm
   ZyUpWuLe4ePHEofjFxnwJ2++CJD5d1Ri2X3oTD58AK1118J7vY7pzLYyc
   u11cUA8Mt2HtgPNwW3vN+mu91YrJFmFC4pwoY7EYqXcthpP+h1db89+S9
   A==;
X-CSE-ConnectionGUID: 4nJ6G7B4QeajFIBvf9Yc2g==
X-CSE-MsgGUID: wWiGxtfXQeifbzxiWdh/Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="1037587"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="1037587"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 15:02:04 -0700
X-CSE-ConnectionGUID: yBERnhMgTrq9qnn1qNDPPQ==
X-CSE-MsgGUID: cVdFiTOTSyeEmXOOy++ZDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2198312"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Oct 2026 15:02:02 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xICTX-00000000Jo6-34Mq;
	Sat, 17 Oct 2026 22:01:59 +0000
Date: Sun, 18 Oct 2026 06:01:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:media-ref] BUILD REGRESSION
 cf47170584526b52366e936406ce2430b99a03a9
Message-ID: <202610180657.Y7FlQ9QN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git media-ref
branch HEAD: cf47170584526b52366e936406ce2430b99a03a9  media: Documentation: Document media device memory safety helper

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202610172349.NeNGF1lj-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202610180038.NjDarZVo-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202610180552.6MBNpZSk-lkp@intel.com

    drivers/media/mc/mc-device.c:31:1: error: expected ')'
    drivers/media/mc/mc-device.c:31:1: error: unknown type name 'param_check_unsigned'
    drivers/media/mc/mc-device.c:31:1: error: use of undeclared identifier 'param_ops_unsigned'; did you mean 'param_ops_uint'?
    drivers/media/mc/mc-device.c:31:31: error: expected '}'
    drivers/media/mc/mc-device.c:32:1: error: expected ')'
    drivers/media/mc/mc-device.c:32:1: error: unknown type name 'param_check_unsigned'
    drivers/media/mc/mc-device.c:32:1: error: use of undeclared identifier 'param_ops_unsigned'; did you mean 'param_ops_uint'?
    drivers/media/mc/mc-device.c:32:31: error: expected '}'
    drivers/media/mc/mc-device.c:761:49: error: use of undeclared identifier 'devnode'
    drivers/media/mc/mc-devnode.c:233:33: error: use of undeclared identifier 'mdev'
    include/linux/moduleparam.h:163:32: error: expected ')' before ',' token
    include/linux/moduleparam.h:164:32: error: 'param_ops_unsigned' undeclared here (not in a function); did you mean 'param_ops_uint'?

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arc-allmodconfig
|   |-- include-linux-moduleparam.h:error:expected-)-before-token
|   `-- include-linux-moduleparam.h:error:param_ops_unsigned-undeclared-here-(not-in-a-function)
|-- arm-allyesconfig
|   |-- include-linux-moduleparam.h:error:expected-)-before-token
|   `-- include-linux-moduleparam.h:error:param_ops_unsigned-undeclared-here-(not-in-a-function)
|-- arm-aspeed_g4_defconfig
|   |-- drivers-media-mc-mc-device.c:error:expected
|   |-- drivers-media-mc-mc-device.c:error:expected-)
|   |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
|   `-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned
|-- arm-defconfig
|   |-- drivers-media-mc-mc-device.c:error:expected
|   |-- drivers-media-mc-mc-device.c:error:expected-)
|   |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
|   `-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned
|-- arm-randconfig-1001-20261018
|   |-- drivers-media-mc-mc-device.c:error:expected
|   |-- drivers-media-mc-mc-device.c:error:expected-)
|   |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
|   `-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned
|-- arm64-allmodconfig
|   |-- drivers-media-mc-mc-device.c:error:expected
|   |-- drivers-media-mc-mc-device.c:error:expected-)
|   |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
|   `-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned
|-- hexagon-allmodconfig
|   |-- drivers-media-mc-mc-device.c:error:expected
|   |-- drivers-media-mc-mc-device.c:error:expected-)
|   |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
|   `-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned
|-- hexagon-randconfig-1000-20261018
|   |-- drivers-media-mc-mc-device.c:error:expected
|   |-- drivers-media-mc-mc-device.c:error:expected-)
|   |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
|   `-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned
|-- hexagon-randconfig-1001-20261017
|   |-- drivers-media-mc-mc-device.c:error:expected
|   |-- drivers-media-mc-mc-device.c:error:expected-)
|   |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
|   |-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-devnode
|   |-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned
|   `-- drivers-media-mc-mc-devnode.c:error:use-of-undeclared-identifier-mdev
|-- hexagon-randconfig-1001-20261018
|   |-- drivers-media-mc-mc-device.c:error:expected
|   |-- drivers-media-mc-mc-device.c:error:expected-)
|   |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
|   `-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned
|-- i386-randconfig-1011-20261017
|   |-- drivers-media-mc-mc-device.c:error:expected
|   |-- drivers-media-mc-mc-device.c:error:expected-)
|   |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
|   `-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned
|-- loongarch-allmodconfig
|   |-- drivers-media-mc-mc-device.c:error:expected
|   |-- drivers-media-mc-mc-device.c:error:expected-)
|   |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
|   `-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned
|-- loongarch-randconfig-1000-20261018
|   |-- drivers-media-mc-mc-device.c:error:expected
|   |-- drivers-media-mc-mc-device.c:error:expected-)
|   |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
|   `-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned
|-- microblaze-allyesconfig
|   |-- include-linux-moduleparam.h:error:expected-)-before-token
|   `-- include-linux-moduleparam.h:error:param_ops_unsigned-undeclared-here-(not-in-a-function)
|-- mips-allmodconfig
|   |-- include-linux-moduleparam.h:error:expected-)-before-token
|   `-- include-linux-moduleparam.h:error:param_ops_unsigned-undeclared-here-(not-in-a-function)
|-- nios2-allmodconfig
|   |-- include-linux-moduleparam.h:error:expected-)-before-token
|   `-- include-linux-moduleparam.h:error:param_ops_unsigned-undeclared-here-(not-in-a-function)
|-- openrisc-allmodconfig
|   |-- include-linux-moduleparam.h:error:expected-)-before-token
|   `-- include-linux-moduleparam.h:error:param_ops_unsigned-undeclared-here-(not-in-a-function)
|-- parisc-allmodconfig
|   |-- include-linux-moduleparam.h:error:expected-)-before-token
|   `-- include-linux-moduleparam.h:error:param_ops_unsigned-undeclared-here-(not-in-a-function)
|-- powerpc-allmodconfig
|   |-- include-linux-moduleparam.h:error:expected-)-before-token
|   `-- include-linux-moduleparam.h:error:param_ops_unsigned-undeclared-here-(not-in-a-function)
|-- riscv-allmodconfig
|   |-- drivers-media-mc-mc-device.c:error:expected
|   |-- drivers-media-mc-mc-device.c:error:expected-)
|   |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
|   `-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned
|-- riscv-allyesconfig
|   |-- drivers-media-mc-mc-device.c:error:expected
|   |-- drivers-media-mc-mc-device.c:error:expected-)
|   |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
|   `-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned
|-- s390-allmodconfig
|   |-- drivers-media-mc-mc-device.c:error:expected
|   |-- drivers-media-mc-mc-device.c:error:expected-)
|   |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
|   `-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned
|-- s390-allyesconfig
|   |-- include-linux-moduleparam.h:error:expected-)-before-token
|   `-- include-linux-moduleparam.h:error:param_ops_unsigned-undeclared-here-(not-in-a-function)
|-- sh-randconfig-1000-20261017
|   |-- include-linux-moduleparam.h:error:expected-)-before-token
|   `-- include-linux-moduleparam.h:error:param_ops_unsigned-undeclared-here-(not-in-a-function)
|-- sparc64-allmodconfig
|   |-- drivers-media-mc-mc-device.c:error:expected
|   |-- drivers-media-mc-mc-device.c:error:expected-)
|   |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
|   `-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned
|-- sparc64-randconfig-1001-20261018
|   |-- drivers-media-mc-mc-device.c:error:expected
|   |-- drivers-media-mc-mc-device.c:error:expected-)
|   |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
|   `-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned
|-- um-allmodconfig
|   |-- drivers-media-mc-mc-device.c:error:expected
|   |-- drivers-media-mc-mc-device.c:error:expected-)
|   |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
|   `-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned
|-- um-randconfig-1000-20261018
|   |-- drivers-media-mc-mc-device.c:error:expected
|   |-- drivers-media-mc-mc-device.c:error:expected-)
|   |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
|   `-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned
|-- x86_64-buildonly-randconfig-1003-20261018
|   |-- drivers-media-mc-mc-device.c:error:expected
|   |-- drivers-media-mc-mc-device.c:error:expected-)
|   |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
|   `-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned
|-- x86_64-buildonly-randconfig-1005-20261018
|   |-- drivers-media-mc-mc-device.c:error:expected
|   |-- drivers-media-mc-mc-device.c:error:expected-)
|   |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
|   `-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned
|-- x86_64-randconfig-1017-20261017
|   |-- drivers-media-mc-mc-device.c:error:expected
|   |-- drivers-media-mc-mc-device.c:error:expected-)
|   |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
|   `-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned
`-- x86_64-rhel-9.4-rust
    |-- drivers-media-mc-mc-device.c:error:expected
    |-- drivers-media-mc-mc-device.c:error:expected-)
    |-- drivers-media-mc-mc-device.c:error:unknown-type-name-param_check_unsigned
    `-- drivers-media-mc-mc-device.c:error:use-of-undeclared-identifier-param_ops_unsigned

elapsed time: 1898m

configs tested: 236
configs skipped: 8

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261017    gcc-10.5.0
arc                   randconfig-1000-20261018    gcc-8.5.0
arc                   randconfig-1001-20261017    gcc-10.5.0
arc                   randconfig-1001-20261018    gcc-8.5.0
arc                         vdk_hs38_defconfig    gcc-16.1.0
arm                               alldefconfig    gcc-16.1.0
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                        aspeed_g4_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                         multi_v5_defconfig    clang-24
arm                        netwinder_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261017    gcc-10.5.0
arm                   randconfig-1000-20261018    gcc-8.5.0
arm                   randconfig-1001-20261017    gcc-10.5.0
arm                   randconfig-1001-20261018    gcc-8.5.0
arm                   randconfig-1002-20261017    gcc-10.5.0
arm                   randconfig-1002-20261018    gcc-8.5.0
arm                   randconfig-1003-20261017    gcc-10.5.0
arm                   randconfig-1003-20261018    gcc-8.5.0
arm                          socfpga_defconfig    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261017    clang-24
arm64                 randconfig-1000-20261018    gcc-14.3.0
arm64                 randconfig-1001-20261017    clang-24
arm64                 randconfig-1001-20261018    gcc-14.3.0
arm64                 randconfig-1002-20261017    clang-24
arm64                 randconfig-1002-20261018    gcc-14.3.0
arm64                 randconfig-1003-20261017    clang-24
arm64                 randconfig-1003-20261018    gcc-14.3.0
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261017    clang-24
csky                  randconfig-1000-20261018    gcc-14.3.0
csky                  randconfig-1001-20261017    clang-24
csky                  randconfig-1001-20261018    gcc-14.3.0
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261017    clang-21
hexagon               randconfig-1000-20261018    clang-21
hexagon               randconfig-1001-20261017    clang-21
hexagon               randconfig-1001-20261018    clang-21
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261017    gcc-14
i386        buildonly-randconfig-1001-20261017    gcc-14
i386        buildonly-randconfig-1002-20261017    gcc-14
i386        buildonly-randconfig-1003-20261017    gcc-14
i386        buildonly-randconfig-1004-20261017    gcc-14
i386        buildonly-randconfig-1005-20261017    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261017    clang-22
i386                  randconfig-1001-20261017    clang-22
i386                  randconfig-1002-20261017    clang-22
i386                  randconfig-1003-20261017    clang-22
i386                  randconfig-1004-20261017    clang-22
i386                  randconfig-1005-20261017    clang-22
i386                  randconfig-1006-20261017    clang-22
i386                  randconfig-1007-20261017    clang-22
i386                  randconfig-1008-20261017    clang-22
i386                  randconfig-1009-20261017    clang-22
i386                  randconfig-1010-20261017    clang-22
i386                  randconfig-1011-20261017    clang-22
i386                  randconfig-1012-20261017    clang-22
i386                  randconfig-1013-20261017    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261017    clang-21
loongarch             randconfig-1000-20261018    clang-21
loongarch             randconfig-1001-20261017    clang-21
loongarch             randconfig-1001-20261018    clang-21
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                   cavium_octeon_defconfig    clang-24
mips                   cavium_octeon_defconfig    gcc-16.1.0
mips                      loongson2k_defconfig    clang-24
mips                    sb1250_swarm_defconfig    clang-24
mips                    sb1250_swarm_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261017    clang-21
nios2                 randconfig-1000-20261018    clang-21
nios2                 randconfig-1001-20261017    clang-21
nios2                 randconfig-1001-20261018    clang-21
openrisc                          allmodconfig    clang-20
openrisc                          allmodconfig    gcc-11.5.0
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261017    gcc-15.2.0
parisc                randconfig-1000-20261018    clang-24
parisc                randconfig-1001-20261017    gcc-15.2.0
parisc                randconfig-1001-20261018    clang-24
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                       ep88xc_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261017    gcc-15.2.0
powerpc               randconfig-1000-20261018    clang-24
powerpc               randconfig-1001-20261017    gcc-15.2.0
powerpc               randconfig-1001-20261018    clang-24
powerpc                     socrates_defconfig    gcc-16.1.0
powerpc                      tqm8548_defconfig    clang-24
powerpc64             randconfig-1000-20261017    gcc-15.2.0
powerpc64             randconfig-1000-20261018    clang-24
powerpc64             randconfig-1001-20261017    gcc-15.2.0
powerpc64             randconfig-1001-20261018    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261017    clang-19
riscv                 randconfig-1000-20261018    clang-17
riscv                 randconfig-1001-20261017    clang-19
riscv                 randconfig-1001-20261018    clang-17
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261017    clang-19
s390                  randconfig-1000-20261018    clang-17
s390                  randconfig-1001-20261017    clang-19
s390                  randconfig-1001-20261018    clang-17
s390                        zfcpdump_defconfig    gcc-16.1.0
sh                                alldefconfig    gcc-16.1.0
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                          ap325rxa_defconfig    gcc-16.1.0
sh                                   defconfig    gcc-14
sh                           lboxre2_defconfig    gcc-16.1.0
sh                             migor_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261017    clang-19
sh                    randconfig-1000-20261018    clang-17
sh                    randconfig-1001-20261017    clang-19
sh                    randconfig-1001-20261018    clang-17
sh                           rsk7264_defconfig    gcc-16.1.0
sh                           rsk7269_defconfig    clang-24
sh                            sh2007_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261017    gcc-15.2.0
sparc                 randconfig-1000-20261018    clang-24
sparc                 randconfig-1001-20261017    gcc-15.2.0
sparc                 randconfig-1001-20261018    clang-24
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261017    gcc-15.2.0
sparc64               randconfig-1000-20261018    clang-24
sparc64               randconfig-1001-20261017    gcc-15.2.0
sparc64               randconfig-1001-20261018    clang-24
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261017    gcc-15.2.0
um                    randconfig-1000-20261018    clang-24
um                    randconfig-1001-20261017    gcc-15.2.0
um                    randconfig-1001-20261018    clang-24
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261017    gcc-14
x86_64      buildonly-randconfig-1000-20261018    clang-22
x86_64      buildonly-randconfig-1001-20261017    gcc-14
x86_64      buildonly-randconfig-1001-20261018    clang-22
x86_64      buildonly-randconfig-1002-20261017    gcc-14
x86_64      buildonly-randconfig-1002-20261018    clang-22
x86_64      buildonly-randconfig-1003-20261017    gcc-14
x86_64      buildonly-randconfig-1003-20261018    clang-22
x86_64      buildonly-randconfig-1004-20261017    gcc-14
x86_64      buildonly-randconfig-1004-20261018    clang-22
x86_64      buildonly-randconfig-1005-20261017    gcc-14
x86_64      buildonly-randconfig-1005-20261018    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261017    gcc-14
x86_64                randconfig-1001-20261017    gcc-14
x86_64                randconfig-1002-20261017    gcc-14
x86_64                randconfig-1003-20261017    gcc-14
x86_64                randconfig-1004-20261017    gcc-14
x86_64                randconfig-1005-20261017    gcc-14
x86_64                randconfig-1006-20261017    clang-22
x86_64                randconfig-1007-20261017    clang-22
x86_64                randconfig-1008-20261017    clang-22
x86_64                randconfig-1009-20261017    clang-22
x86_64                randconfig-1010-20261017    clang-22
x86_64                randconfig-1011-20261017    clang-22
x86_64                randconfig-1012-20261017    clang-22
x86_64                randconfig-1013-20261017    clang-22
x86_64                randconfig-1014-20261017    clang-22
x86_64                randconfig-1015-20261017    clang-22
x86_64                randconfig-1016-20261017    clang-22
x86_64                randconfig-1017-20261017    clang-22
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261017    gcc-15.2.0
xtensa                randconfig-1000-20261018    clang-24
xtensa                randconfig-1001-20261017    gcc-15.2.0
xtensa                randconfig-1001-20261018    clang-24

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
