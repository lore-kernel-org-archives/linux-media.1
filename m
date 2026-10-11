Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0315D339B41
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 16:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791737043; cv=none; b=D29a/Agb7OA18gD30dynNV6+dPnqxo3XqbRE6FX94+3lp0yBSOnwlhje/ASH4ryY6Kf0+/44EtxV5cLUiKvENj6umcSDRfcczzmhetu6iQIl9tUbkvGXP/KfUwaRKUjhoLLXtaAuu0Cy1F2kIBbOKOlHaNA+g95zJZOuLKXpouQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791737043; c=relaxed/simple;
	bh=E8tZ5lUlseQoTfyzAEiS4kQKBq8AJNkclMabbzbLPFQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NSNtQehI4+Lr00NBi0/6q9ujfy+HJc+fmsUrbzYR6sIItdPd+kQV+uDjslAklkJKRDqSuazKYVoGyRyUIdbVY1k+nXBhl2ZUFK1J9ullVqiL0GvbPoND5dY1QKowWmPz/0lIhNrM4xTQb7QF4q7tQofnQl0evK8Zk4r68vNvGvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S7MfuUbO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7MfuUbO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791737042; x=1823273042;
  h=date:from:to:cc:subject:message-id;
  bh=E8tZ5lUlseQoTfyzAEiS4kQKBq8AJNkclMabbzbLPFQ=;
  b=S7MfuUbOBljjxoGOJPwsy77igT1lg94Pc8o4ZnQ4V+E/4XirdviNoxpb
   hDBdTLahnmiD7AchUP6GX4F5FqVfiEFrFGVC7Tdb5i4GKSDe5lxkp53wm
   d/0U3+ff1ykjGkDkzF/2IZVzhD/b5/KQzjhad834TZs+eOeRpF1KbRTvv
   u4FCC5F3XrZX0Wq4xMTUUW20llGa9QL4xrgxblx2fA2L3xLOBDNaRJKeI
   d9B3GU+D3/f15R3zE0uh2q4yZQocQgjX666hVomHhy8PvXpu/4vkS5eWc
   CifPPDzlVcrq4M5d0oZVk5naejyD2oYUO+BzyMWT8NEhlikhncPr36WlS
   g==;
X-CSE-ConnectionGUID: BOirQBSpTBGPcHg7abB6xg==
X-CSE-MsgGUID: LumP3sBWQxyCCy1JgB6jHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="568622"
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="568622"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 09:43:59 -0700
X-CSE-ConnectionGUID: EjM3HFAyTNqXXG6L/L3IFw==
X-CSE-MsgGUID: aJz6sYIxRL6OHQvcgHVCMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="1172695"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Oct 2026 09:43:58 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFweR-00000000Aci-0jJR;
	Sun, 11 Oct 2026 16:43:55 +0000
Date: Mon, 12 Oct 2026 00:43:34 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 f39567cc92272f987c056d8c92f7c93f3fdf53ef
Message-ID: <202610120003.9Gt5zmMb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: f39567cc92272f987c056d8c92f7c93f3fdf53ef  media: i2c: imx576: select VIDEO_CCS_PLL to repair build error

elapsed time: 2116m

configs tested: 182
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2101-20261009    gcc-10.5.0 cocci
alpha                randconfig-r2102-20261009    gcc-8.5.0  cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                      haps_hs_smp_defconfig    clang-17
arc                   randconfig-1000-20261011    clang-24
arc                   randconfig-1001-20261011    clang-24
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                           exynos_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261011    clang-24
arm                   randconfig-1001-20261011    clang-24
arm                   randconfig-1002-20261011    clang-24
arm                   randconfig-1003-20261011    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261011    gcc-11.5.0
arm64                 randconfig-1001-20261011    gcc-11.5.0
arm64                 randconfig-1002-20261011    gcc-11.5.0
arm64                 randconfig-1003-20261011    gcc-11.5.0
arm64                randconfig-r2107-20261009    gcc-9.5.0  cocci
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261011    gcc-11.5.0
csky                  randconfig-1001-20261011    gcc-11.5.0
csky                 randconfig-r2100-20261009    gcc-16.1.0 cocci
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261011    clang-24
hexagon               randconfig-1001-20261011    clang-24
i386                               allnoconfig    gcc-16.1.0
i386        buildonly-randconfig-1000-20261011    clang-22
i386        buildonly-randconfig-1001-20261011    clang-22
i386        buildonly-randconfig-1002-20261011    clang-22
i386        buildonly-randconfig-1003-20261011    clang-22
i386        buildonly-randconfig-1004-20261011    clang-22
i386        buildonly-randconfig-1005-20261011    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1007-20261011    clang-22
i386                  randconfig-1008-20261011    clang-22
i386                  randconfig-1009-20261011    clang-22
i386                  randconfig-1010-20261011    clang-22
i386                  randconfig-1011-20261011    clang-22
i386                  randconfig-1012-20261011    clang-22
i386                  randconfig-1013-20261011    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261011    clang-24
loongarch             randconfig-1001-20261011    clang-24
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5275evb_defconfig    gcc-16.1.0
m68k                         mvme16x_defconfig    gcc-16.1.0
m68k                 randconfig-r2104-20261009    gcc-16.1.0 cocci
m68k                 randconfig-r2105-20261009    gcc-8.5.0  cocci
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze                       mmu_defconfig    gcc-16.1.0
microblaze           randconfig-r2106-20261009    gcc-16.1.0 cocci
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                           ath79_defconfig    gcc-16.1.0
mips                          db1xxx_defconfig    gcc-16.1.0
mips                   decstation_64_defconfig    gcc-16.1.0
mips                           eyeq6_defconfig    gcc-16.1.0
mips                       malta_kvm_defconfig    clang-17
mips                       maltaaprp_defconfig    clang-17
mips                 randconfig-r2103-20261009    gcc-9.5.0  cocci
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261011    clang-24
nios2                 randconfig-1001-20261011    clang-24
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
powerpc                       arches_defconfig    gcc-16.1.0
powerpc                    lite5200b_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261011    clang-24
powerpc               randconfig-1001-20261011    clang-24
powerpc64                         alldefconfig    clang-17
powerpc64             randconfig-1000-20261011    clang-24
powerpc64             randconfig-1001-20261011    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261011    clang-17
riscv                 randconfig-1001-20261011    clang-17
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                           debug_defconfig    clang-17
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261011    clang-17
s390                  randconfig-1001-20261011    clang-17
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                 ecovec24-romimage_defconfig    clang-17
sh                    randconfig-1000-20261011    clang-17
sh                    randconfig-1001-20261011    clang-17
sh                    sh7724_generic_defconfig    clang-17
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261011    gcc-9.5.0
sparc                 randconfig-1001-20261011    gcc-9.5.0
sparc                        sparc32_defconfig    clang-17
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261011    gcc-9.5.0
sparc64               randconfig-1001-20261011    gcc-9.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261011    gcc-9.5.0
um                    randconfig-1001-20261011    gcc-9.5.0
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
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
x86_64                randconfig-1012-20261011    clang-22
x86_64                randconfig-1013-20261011    clang-22
x86_64                randconfig-1014-20261011    clang-22
x86_64                randconfig-1015-20261011    clang-22
x86_64                randconfig-1016-20261011    clang-22
x86_64                randconfig-1017-20261011    clang-22
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                           iss_defconfig    gcc-16.1.0
xtensa                   nommu_kc705_defconfig    gcc-16.1.0
xtensa                randconfig-1000-20261011    gcc-9.5.0
xtensa                randconfig-1001-20261011    gcc-9.5.0
xtensa                     xip_kc705_defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
