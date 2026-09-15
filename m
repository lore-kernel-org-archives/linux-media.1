Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BED73F075A
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 02:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789440653; cv=none; b=ErBS5pS/L0kH+NPD1NYgCUbeS8e/FG8okRHdicFe1/UkcfrekC/r7AvfjQBtOTEmB7VHWWnpvhtcu+qLEIX0qhz3yPP+K5xSYU0c9I+FB0lOozdZa8ZzJ/19gZNC9rzwufmNzrVOu/wZyDhirYk6cSlGkrJxF5A0A+Vt6ulkQZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789440653; c=relaxed/simple;
	bh=/5h8dKE8bOhvXErNelDimPP/HaCnQd5jVSU0vlbQ8J8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D/VzoQ+ig8hmHUjaKFOwHSVUMIS+XnYae6Do7nPavaax01EJw4ba9AZOJNA1vexcB3UrG3OR0rHrhcBtKoUUdBX+95Uu9U/uJCdNu4rH3NYZI3snlJSsE2k574ELPqwbddrUCd3idMr5bFZg8YjzTarBZVw9gUW1MdwZs5my5GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IDKqN+Y+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IDKqN+Y+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789440651; x=1820976651;
  h=date:from:to:cc:subject:message-id;
  bh=/5h8dKE8bOhvXErNelDimPP/HaCnQd5jVSU0vlbQ8J8=;
  b=IDKqN+Y+BtMz0eFpc9LJUfgveesAZ+KAgVhPZDuLReHcqNh0i0aHrb66
   Nzp5D3Q6P/U9+gPVDvzQXMDJrkBnHBJHOT/3p/uot8oDoKISIY+zd5obi
   pApwNTShn4y+Fnodgqam3LNVr83t8EQwh8aLciq1UJdDrkKsjibr0tMtH
   1PmIsOMMiZYmJW45Zoz87bP7ZjDQXOj5f1ZVk3tXqfBgvRRom8wGQQQ+P
   hF8/flcy3FeZfu8qZfYQGqvQ7p3UUTmtzNA44zdCA0uXbKpIcPXJDdwI9
   mmWDH7uY1mXXRSeEhZwNIQQDT3UQJTsk+4NFcJ/mk4vRj4X7sGOW6P79K
   w==;
X-CSE-ConnectionGUID: LJrQMZmaQrGT7DEf6p5lbQ==
X-CSE-MsgGUID: XFOVMFTITdWZI0rR1HN08w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93661581"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93661581"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 19:50:50 -0700
X-CSE-ConnectionGUID: qWvWouF3RXeFvgMxgeFL8A==
X-CSE-MsgGUID: U0ncedCLQYqWNaj6e6Of2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1030866"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 14 Sep 2026 19:50:48 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6JFt-000000003sl-18HL;
	Tue, 15 Sep 2026 02:50:45 +0000
Date: Tue, 15 Sep 2026 10:50:19 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 b38d06ad1e13c32970d58039c154f009b81a3368
Message-ID: <202609151015.RZQvS7F0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: b38d06ad1e13c32970d58039c154f009b81a3368  media: ipu6: Fix up missing IWYU issue

elapsed time: 1370m

configs tested: 274
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
alpha                randconfig-r121-20260914    gcc-12.5.0 sparse
alpha                randconfig-r132-20260914    gcc-12.5.0 sparse
arc                              allmodconfig    clang-24
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-24
arc                                 defconfig    gcc-16.1.0
arc                         haps_hs_defconfig    clang-24
arc                   randconfig-001-20260914    gcc-13.4.0
arc                   randconfig-001-20260915    clang-24
arc                   randconfig-002-20260914    gcc-13.4.0
arc                   randconfig-002-20260915    clang-24
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-24
arm                                 defconfig    gcc-16.1.0
arm                            mmp2_defconfig    gcc-16.1.0
arm                   randconfig-001-20260914    gcc-13.4.0
arm                   randconfig-001-20260915    clang-24
arm                   randconfig-002-20260914    gcc-13.4.0
arm                   randconfig-002-20260915    clang-24
arm                   randconfig-003-20260914    gcc-13.4.0
arm                   randconfig-003-20260915    clang-24
arm                   randconfig-004-20260914    gcc-13.4.0
arm                   randconfig-004-20260915    clang-24
arm                    vt8500_v6_v7_defconfig    gcc-14
arm64                            allmodconfig    clang-24
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260914    gcc-9.5.0
arm64                 randconfig-001-20260915    gcc-12.5.0
arm64                 randconfig-002-20260914    gcc-9.5.0
arm64                 randconfig-002-20260915    gcc-12.5.0
arm64                 randconfig-003-20260914    gcc-9.5.0
arm64                 randconfig-003-20260915    gcc-12.5.0
arm64                 randconfig-004-20260914    gcc-9.5.0
arm64                 randconfig-004-20260915    gcc-12.5.0
arm64                randconfig-r112-20260915    clang-24 sparse
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260914    gcc-9.5.0
csky                  randconfig-001-20260915    gcc-12.5.0
csky                  randconfig-002-20260914    gcc-9.5.0
csky                  randconfig-002-20260915    gcc-12.5.0
csky                 randconfig-r121-20260915    clang-24 sparse
csky                 randconfig-r122-20260914    gcc-12.5.0 sparse
csky                 randconfig-r131-20260914    gcc-13.4.0 sparse
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260914    gcc-13.4.0
hexagon               randconfig-001-20260915    clang-24
hexagon               randconfig-002-20260914    gcc-13.4.0
hexagon               randconfig-002-20260915    clang-24
hexagon              randconfig-r113-20260915    clang-24 sparse
hexagon              randconfig-r133-20260914    gcc-12.5.0 sparse
hexagon              randconfig-r134-20260915    gcc-15.2.0 sparse
i386                             allmodconfig    clang-22
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
i386                  randconfig-011-20260914    clang-22
i386                  randconfig-011-20260915    gcc-14
i386                  randconfig-012-20260914    clang-22
i386                  randconfig-012-20260915    gcc-14
i386                  randconfig-013-20260914    clang-22
i386                  randconfig-013-20260915    gcc-14
i386                  randconfig-014-20260914    clang-22
i386                  randconfig-014-20260915    gcc-14
i386                  randconfig-015-20260914    clang-22
i386                  randconfig-015-20260915    gcc-14
i386                  randconfig-016-20260914    clang-22
i386                  randconfig-016-20260915    gcc-14
i386                  randconfig-017-20260914    clang-22
i386                  randconfig-017-20260915    gcc-14
i386                  randconfig-061-20260914    gcc-14 sparse
i386                  randconfig-062-20260914    gcc-14 sparse
i386                  randconfig-063-20260914    gcc-14 sparse
i386                 randconfig-r132-20260914    gcc-13.4.0 sparse
loongarch                        allmodconfig    clang-24
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-24
loongarch             randconfig-001-20260914    gcc-13.4.0
loongarch             randconfig-001-20260915    clang-24
loongarch             randconfig-002-20260914    gcc-13.4.0
loongarch             randconfig-002-20260915    clang-24
loongarch            randconfig-r122-20260915    clang-24 sparse
loongarch            randconfig-r131-20260914    gcc-12.5.0 sparse
loongarch            randconfig-r131-20260915    gcc-15.2.0 sparse
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-24
m68k                                defconfig    clang-24
m68k                        mvme16x_defconfig    gcc-14
m68k                 randconfig-r111-20260914    gcc-12.5.0 sparse
m68k                 randconfig-r113-20260914    gcc-12.5.0 sparse
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-24
microblaze           randconfig-r123-20260914    gcc-12.5.0 sparse
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                        bcm47xx_defconfig    clang-24
mips                           ip22_defconfig    gcc-16.1.0
mips                           ip32_defconfig    gcc-14
mips                 randconfig-r134-20260914    gcc-13.4.0 sparse
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-24
nios2                               defconfig    clang-24
nios2                 randconfig-001-20260914    gcc-13.4.0
nios2                 randconfig-001-20260915    clang-24
nios2                 randconfig-002-20260914    gcc-13.4.0
nios2                 randconfig-002-20260915    clang-24
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-24
openrisc                   de0_nano_defconfig    clang-24
openrisc                            defconfig    gcc-16.1.0
openrisc             randconfig-r112-20260914    gcc-12.5.0 sparse
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-24
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260914    gcc-8.5.0
parisc                randconfig-001-20260915    gcc-8.5.0
parisc                randconfig-002-20260914    gcc-8.5.0
parisc                randconfig-002-20260915    gcc-8.5.0
parisc               randconfig-r133-20260914    gcc-13.4.0 sparse
parisc64                            defconfig    clang-24
powerpc                           allnoconfig    clang-24
powerpc                    ge_imp3a_defconfig    gcc-14
powerpc                  mpc866_ads_defconfig    clang-24
powerpc                      pasemi_defconfig    clang-24
powerpc               randconfig-001-20260914    gcc-8.5.0
powerpc               randconfig-001-20260915    gcc-8.5.0
powerpc               randconfig-002-20260914    gcc-8.5.0
powerpc               randconfig-002-20260915    gcc-8.5.0
powerpc                    socrates_defconfig    clang-24
powerpc                     tqm8541_defconfig    gcc-16.1.0
powerpc64             randconfig-001-20260914    gcc-8.5.0
powerpc64             randconfig-001-20260915    gcc-8.5.0
powerpc64             randconfig-002-20260914    gcc-8.5.0
powerpc64             randconfig-002-20260915    gcc-8.5.0
riscv                            allmodconfig    clang-24
riscv                             allnoconfig    clang-24
riscv                            allyesconfig    clang-24
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260914    gcc-13.4.0
riscv                 randconfig-002-20260914    gcc-13.4.0
riscv                randconfig-r111-20260915    clang-24 sparse
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-24
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260914    gcc-13.4.0
s390                  randconfig-002-20260914    gcc-13.4.0
s390                 randconfig-r123-20260915    clang-24 sparse
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-24
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                          kfr2r09_defconfig    gcc-16.1.0
sh                            migor_defconfig    gcc-16.1.0
sh                          r7780mp_defconfig    clang-24
sh                    randconfig-001-20260914    gcc-13.4.0
sh                    randconfig-002-20260914    gcc-13.4.0
sh                           se7705_defconfig    gcc-14
sh                           se7751_defconfig    gcc-16.1.0
sh                   sh7770_generic_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-24
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260914    gcc-16.1.0
sparc                 randconfig-001-20260915    gcc-13.4.0
sparc                 randconfig-002-20260914    gcc-16.1.0
sparc                 randconfig-002-20260915    gcc-13.4.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260914    gcc-16.1.0
sparc64               randconfig-001-20260915    gcc-13.4.0
sparc64               randconfig-002-20260914    gcc-16.1.0
sparc64               randconfig-002-20260915    gcc-13.4.0
sparc64              randconfig-r132-20260915    gcc-15.2.0 sparse
sparc64              randconfig-r133-20260915    gcc-15.2.0 sparse
sparc64              randconfig-r134-20260914    gcc-12.5.0 sparse
um                               allmodconfig    clang-17
um                                allnoconfig    clang-24
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260914    gcc-16.1.0
um                    randconfig-001-20260915    gcc-13.4.0
um                    randconfig-002-20260914    gcc-16.1.0
um                    randconfig-002-20260915    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-24
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260914    gcc-14
x86_64      buildonly-randconfig-001-20260915    clang-22
x86_64      buildonly-randconfig-002-20260914    gcc-14
x86_64      buildonly-randconfig-002-20260915    clang-22
x86_64      buildonly-randconfig-003-20260914    gcc-14
x86_64      buildonly-randconfig-003-20260915    clang-22
x86_64      buildonly-randconfig-004-20260914    gcc-14
x86_64      buildonly-randconfig-004-20260915    clang-22
x86_64      buildonly-randconfig-005-20260914    gcc-14
x86_64      buildonly-randconfig-005-20260915    clang-22
x86_64      buildonly-randconfig-006-20260914    gcc-14
x86_64      buildonly-randconfig-006-20260915    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-011-20260914    clang-22
x86_64                randconfig-011-20260915    gcc-14
x86_64                randconfig-012-20260914    clang-22
x86_64                randconfig-012-20260915    gcc-14
x86_64                randconfig-013-20260914    clang-22
x86_64                randconfig-013-20260915    gcc-14
x86_64                randconfig-014-20260914    clang-22
x86_64                randconfig-014-20260915    gcc-14
x86_64                randconfig-015-20260914    clang-22
x86_64                randconfig-015-20260915    gcc-14
x86_64                randconfig-016-20260914    clang-22
x86_64                randconfig-016-20260915    gcc-14
x86_64                randconfig-071-20260914    clang-22
x86_64                randconfig-072-20260914    clang-22
x86_64                randconfig-073-20260914    clang-22
x86_64                randconfig-074-20260914    clang-22
x86_64                randconfig-075-20260914    clang-22
x86_64                randconfig-076-20260914    clang-22
x86_64                randconfig-121-20260914    gcc-14 sparse
x86_64                randconfig-122-20260914    gcc-14 sparse
x86_64                randconfig-123-20260914    gcc-14 sparse
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                           alldefconfig    clang-24
xtensa                            allnoconfig    clang-24
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260914    gcc-16.1.0
xtensa                randconfig-001-20260915    gcc-13.4.0
xtensa                randconfig-002-20260914    gcc-16.1.0
xtensa                randconfig-002-20260915    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
