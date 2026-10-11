Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25441A682C
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 02:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791685802; cv=none; b=M46Hv3lwr/+olgrfuVF1d3Mls0Dc6lKBqmz6zp+rUr1m+SW7hpw/kev859UIyMOhQH/fHlpUHjd0T0OVY0zp3PdrSvMSFxjOKN72fqQDqMohLvBoaGSGTI/mAZLUsHVL8BSw0pYd0+Zh7sTmlaF3kzMxefG6T3HyjpXjVnoYYQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791685802; c=relaxed/simple;
	bh=BpC5M7KLdgspVJTtgf0hCQfc1LbT/K3fiL260V06zJ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rUlHzk9BKYa8kz+jVDns90kwBGraZzLC4duGPOMYOhzDlz0hOat2Ud6uatEQgnhQ2RvpXweIvPcelHm8BWzE9LZM+EzTfBFZ1bnDX1w5CcFGLw4WjTK/5MaSt1+Y/+Dxhv2000x+gnDHFxqxgSs8k97ey3tMGzEkQiD2HA4/QpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1D8DJ/L; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1D8DJ/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791685801; x=1823221801;
  h=date:from:to:cc:subject:message-id;
  bh=BpC5M7KLdgspVJTtgf0hCQfc1LbT/K3fiL260V06zJ0=;
  b=R1D8DJ/Lv4PNqGDvY4d2nTzTKdayXXRih2SAPZOrA41iRZjCns+lObu4
   PenlNw/gWx3PL3foARtFlOvoVFGSC23uBaY3gleFSbJiN/FYSmCSXilC1
   2HRtIWXw7JfAsMjl9w8b9fhJAjC6KTW1KneEvKg8D8wRyM+jvWy0h/0h8
   ZmgvnPencHzjjjyg0geqrRdIReS29cGKBUaNZ74lmPRVFFZGsfatve7Yr
   BmLWubP77+WlLOEcmafKgq6ogQywm1HyBIGbs8yzskVjEn+ytAxZxauLy
   lLqO4axUxqKCpspzCsuI++jA9f/+8wEgRNcHFUBNIbMZwEPi9H1Ocrbza
   A==;
X-CSE-ConnectionGUID: C3XAwDxpQWSfu+cQaPhC+A==
X-CSE-MsgGUID: AIpOCL90T46F2Xp8ne+vZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="437436"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="437436"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 19:30:00 -0700
X-CSE-ConnectionGUID: 0ngdZytiSKCDgKKnP6k8oQ==
X-CSE-MsgGUID: 9DRlb7V3QeK5NNUdzkM7+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="607148"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Oct 2026 19:29:59 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFjK0-00000000AHP-0dwg;
	Sun, 11 Oct 2026 02:29:56 +0000
Date: Sun, 11 Oct 2026 10:29:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6-more] BUILD SUCCESS WITH WARNING
 80de48e2cab73a7c38171de3de224456c804f6bc
Message-ID: <202610111023.RHpOS7rr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git ipu6-more
branch HEAD: 80de48e2cab73a7c38171de3de224456c804f6bc  media: ipu6: Return errors from stream stop and close

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202610110422.Ds1dqsa4-lkp@intel.com

    drivers/media/pci/intel/ipu6/ipu6-isys-queue.c:485:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]

Warning ids grouped by kconfigs:

recent_errors
|-- x86_64-allmodconfig
|   `-- drivers-media-pci-intel-ipu6-ipu6-isys-queue.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-true
|-- x86_64-allyesconfig
|   `-- drivers-media-pci-intel-ipu6-ipu6-isys-queue.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-true
`-- x86_64-randconfig-1009-20261010
    `-- drivers-media-pci-intel-ipu6-ipu6-isys-queue.c:warning:variable-ret-is-used-uninitialized-whenever-if-condition-is-true

elapsed time: 1262m

configs tested: 187
configs skipped: 2

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261010    gcc-8.5.0
arc                   randconfig-1000-20261011    clang-24
arc                   randconfig-1001-20261010    gcc-8.5.0
arc                   randconfig-1001-20261011    clang-24
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                   randconfig-1000-20261010    gcc-8.5.0
arm                   randconfig-1000-20261011    clang-24
arm                   randconfig-1001-20261010    gcc-8.5.0
arm                   randconfig-1001-20261011    clang-24
arm                   randconfig-1002-20261010    gcc-8.5.0
arm                   randconfig-1002-20261011    clang-24
arm                   randconfig-1003-20261010    gcc-8.5.0
arm                   randconfig-1003-20261011    clang-24
arm                        spear13xx_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261010    gcc-10.5.0
arm64                 randconfig-1001-20261010    gcc-10.5.0
arm64                 randconfig-1002-20261010    gcc-10.5.0
arm64                 randconfig-1003-20261010    gcc-10.5.0
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261010    gcc-10.5.0
csky                  randconfig-1001-20261010    gcc-10.5.0
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261010    clang-17
hexagon               randconfig-1001-20261010    clang-17
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261010    gcc-14
i386        buildonly-randconfig-1001-20261010    gcc-14
i386        buildonly-randconfig-1002-20261010    gcc-14
i386        buildonly-randconfig-1003-20261010    gcc-14
i386        buildonly-randconfig-1004-20261010    gcc-14
i386        buildonly-randconfig-1005-20261010    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261010    clang-22
i386                  randconfig-1001-20261010    clang-22
i386                  randconfig-1002-20261010    clang-22
i386                  randconfig-1003-20261010    clang-22
i386                  randconfig-1004-20261010    clang-22
i386                  randconfig-1005-20261010    clang-22
i386                  randconfig-1006-20261010    clang-22
i386                  randconfig-1007-20261010    gcc-14
i386                  randconfig-1008-20261010    gcc-14
i386                  randconfig-1009-20261010    gcc-14
i386                  randconfig-1010-20261010    gcc-14
i386                  randconfig-1011-20261010    gcc-14
i386                  randconfig-1012-20261010    gcc-14
i386                  randconfig-1013-20261010    gcc-14
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261010    clang-17
loongarch             randconfig-1001-20261010    clang-17
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
mips                          bigsur_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261010    clang-17
nios2                 randconfig-1001-20261010    clang-17
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261011    clang-24
parisc                randconfig-1001-20261011    clang-24
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                         icon_defconfig    gcc-16.1.0
powerpc                     mvme5100_defconfig    gcc-16.1.0
powerpc                        ppc64_defconfig    gcc-16.1.0
powerpc                          ps3_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261011    clang-24
powerpc               randconfig-1001-20261011    clang-24
powerpc64             randconfig-1000-20261011    clang-24
powerpc64             randconfig-1001-20261011    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261010    clang-19
riscv                 randconfig-1000-20261011    clang-17
riscv                 randconfig-1001-20261010    clang-19
riscv                 randconfig-1001-20261011    clang-17
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261010    clang-19
s390                  randconfig-1000-20261011    clang-17
s390                  randconfig-1001-20261010    clang-19
s390                  randconfig-1001-20261011    clang-17
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                              espt_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261010    clang-19
sh                    randconfig-1000-20261011    clang-17
sh                    randconfig-1001-20261010    clang-19
sh                    randconfig-1001-20261011    clang-17
sh                    sh7724_generic_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261010    gcc-16.1.0
sparc                 randconfig-1001-20261010    gcc-16.1.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261010    gcc-16.1.0
sparc64               randconfig-1001-20261010    gcc-16.1.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261010    gcc-16.1.0
um                    randconfig-1001-20261010    gcc-16.1.0
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261011    gcc-14
x86_64      buildonly-randconfig-1001-20261011    gcc-14
x86_64      buildonly-randconfig-1002-20261011    gcc-14
x86_64      buildonly-randconfig-1003-20261011    gcc-14
x86_64      buildonly-randconfig-1004-20261011    gcc-14
x86_64      buildonly-randconfig-1005-20261011    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261011    gcc-14
x86_64                randconfig-1001-20261011    gcc-14
x86_64                randconfig-1002-20261011    gcc-14
x86_64                randconfig-1003-20261011    gcc-14
x86_64                randconfig-1004-20261011    gcc-14
x86_64                randconfig-1005-20261011    gcc-14
x86_64                randconfig-1006-20261010    clang-22
x86_64                randconfig-1007-20261010    clang-22
x86_64                randconfig-1008-20261010    clang-22
x86_64                randconfig-1009-20261010    clang-22
x86_64                randconfig-1010-20261010    clang-22
x86_64                randconfig-1011-20261010    clang-22
x86_64                randconfig-1012-20261010    clang-22
x86_64                randconfig-1013-20261010    clang-22
x86_64                randconfig-1014-20261010    clang-22
x86_64                randconfig-1015-20261010    clang-22
x86_64                randconfig-1016-20261010    clang-22
x86_64                randconfig-1017-20261010    clang-22
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261010    gcc-16.1.0
xtensa                randconfig-1001-20261010    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
