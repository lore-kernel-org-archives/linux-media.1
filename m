Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F7D3043DC
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 16:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791737041; cv=none; b=VzBWQWJuniQb8x4nHXoHDy0LA06w46frnUStp7ukMaqtOvTn/nnn3wFkC+RV6QQf83C8k7Wm/YCmQIRTn5kGD79YA00PIT3vQPsO3MLR86nOBPjOwqq/4M2Bv7Vz/vgrEQ42oYnGr6DxX8x15hPSlMqrYWqU9h67nUOOibLCbgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791737041; c=relaxed/simple;
	bh=CLBZVssLzyhMAmLsZ1MYVnWysR0eZOQ7A15TU+jDlj4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lDyBCZzFK+bPi3lvEyKeHvEh/ngmfKOeFNjR9mrs9vhrrL20RvE4LtnEzEdxXzYsOz30ftsqAMaQ16ugrrmUXnd+xIu1MHH/YCtiyWaVorQ1WqvYnwapxOKKoUDOqbNd/pcVNTYJ72jnSnB64fH7oQGHMFND9JeJ6EEXH1EXQcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rrvk23UH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rrvk23UH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791737040; x=1823273040;
  h=date:from:to:cc:subject:message-id;
  bh=CLBZVssLzyhMAmLsZ1MYVnWysR0eZOQ7A15TU+jDlj4=;
  b=Rrvk23UHxeNcaXgEvl9jHKYdrB0Lc4KRFrrkK/fTux+cjpAgf75WNyDK
   MO3BUpmdjie8YdKBMncNOsaqxqjzhXNWD4SCjLGKD00ZEsCBtvs6mW+pa
   61TIZ5TxMrAEG8o7rvdMR7ZGlBucRK3Ubmls9TATpPAEAwA7yYifGWuJl
   r5fPxdtn67sW8/OQvNwM8Tts5zVZj4vrO112xOni8Bt0W+0tJPg4pD5qp
   tmng5Ojyr1A1BVqbQU3CCMv+TENiEJgAF/Ql0ymCQmbFRnhOQxgHXF87r
   XdHocYhUhJaRE8P6nl1MI8AF9s1pBWYXoOA3Mqkxnz5YNedzu+CAxsQpp
   w==;
X-CSE-ConnectionGUID: 48bMHYKYQkym/G8JmtvHdA==
X-CSE-MsgGUID: kiggDYpeS3GNx2VUoYM0/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="568620"
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="568620"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 09:43:59 -0700
X-CSE-ConnectionGUID: YsC7iO66Rn6s3idCIZ5iiQ==
X-CSE-MsgGUID: xu5rgbF1RZ6PJqOxL63iEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="1172693"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Oct 2026 09:43:57 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFweR-00000000Ack-0no1;
	Sun, 11 Oct 2026 16:43:55 +0000
Date: Mon, 12 Oct 2026 00:43:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD SUCCESS
 241ce38da6c548aed58d6c04901f26fa571630fe
Message-ID: <202610120046.pFoyE2ef-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: 241ce38da6c548aed58d6c04901f26fa571630fe  media: subdev: Make get_fmt on INTERNAL pads without STREAMS an error

elapsed time: 2116m

configs tested: 174
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
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
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261011    gcc-11.5.0
csky                  randconfig-1001-20261011    gcc-11.5.0
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
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze                       mmu_defconfig    gcc-16.1.0
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                           ath79_defconfig    gcc-16.1.0
mips                          db1xxx_defconfig    gcc-16.1.0
mips                   decstation_64_defconfig    gcc-16.1.0
mips                           eyeq6_defconfig    gcc-16.1.0
mips                       malta_kvm_defconfig    clang-17
mips                       maltaaprp_defconfig    clang-17
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
