Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DA040B116
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 19:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789586600; cv=none; b=ditjuwpb61JFqufgpRIxSp18eZo5iuz3SqeN5KD5LMHsLH7xIC/gMw82g0tPhEtN9XZADBnMJ5dxFO4ADDhhG5uvD1rTm8/K0KBdrRJx9InW7DzP3r3qxgOurI6PyVx++nQDeUN2NLrBgUBkPVi92BHSslwT2QpRswc2alEHKvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789586600; c=relaxed/simple;
	bh=N3QK+6CyxWINjh2plNkOXM21VyYcVwC8MNPol9LB4aA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VgC8TcDTkSEQz3lWQeB7E+MMhQZiyWuiL1n2RGk6kLN48V+m2V/V5H49rEfvP8FmUEfi8iw7OnV9WQ2KchkpxzTJlOxzrGkWETeLEx9Mn3HoYdqnyl8WWrpKsZ4xJwMlQqSvHSxTWIxY0iyyGfXLy5AitpsV1IGRyO4eC1GGWaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zn3F3SAI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zn3F3SAI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789586588; x=1821122588;
  h=date:from:to:cc:subject:message-id;
  bh=N3QK+6CyxWINjh2plNkOXM21VyYcVwC8MNPol9LB4aA=;
  b=Zn3F3SAISbjKTDIR+GnkwtbQbVydSxRCgRLXojljesn9KFOBMeoacIvR
   lK5fAHZRKr+oSAPLjt15aoYiKbRABUJnIjvHvv+EIYiZWuDccSSVvAM/I
   ivQqRGXagw9zV25zwLK5iXExM7z6VmRQE8aeWfSha6dVYCErvGSuc8fCZ
   p2gWkQQX4uDKjQg3Jbx2T83efH7hG3gYPTJYx7lpNAr+yUSFT18F0HI+G
   nRQMOoSmcCu8OvCTe57i4tyEg8rOXcs/tUhkNg6Nq9hh3MbkfDcX1EjWt
   umY+LTs17/quwKhwteEYcIDcbiCyvdYLYI/u1lTCqIUse/QhtiZXSS0Fe
   A==;
X-CSE-ConnectionGUID: i5up7QrrR9eUTJzIvLkMKw==
X-CSE-MsgGUID: xAW802wQQeW147Ht7j0ceQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89991181"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89991181"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 12:23:05 -0700
X-CSE-ConnectionGUID: qx8+A7vKQACzk0gm2A3i2A==
X-CSE-MsgGUID: gIzZPknLSzGzHbqeayZwEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1652827"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 16 Sep 2026 12:23:03 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6vDh-000000006dH-0lJs;
	Wed, 16 Sep 2026 19:23:01 +0000
Date: Thu, 17 Sep 2026 03:22:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD SUCCESS
 4a802aa00b7cbd46705931c39a640d6b221ed722
Message-ID: <202609170307.kvxH0uz8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: 4a802aa00b7cbd46705931c39a640d6b221ed722  Documentation: media: Reword blanking control documentation

elapsed time: m

configs tested: 277
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                    randconfig-001-20260916    clang-24
arc                    randconfig-002-20260916    clang-24
arc                   randconfig-1000-20260916    gcc-10.5.0
arc                   randconfig-1001-20260916    gcc-10.5.0
arc                  randconfig-r1303-20260916    gcc-11.5.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                            h3600_defconfig    gcc-16.1.0
arm                    randconfig-001-20260916    clang-24
arm                    randconfig-002-20260916    clang-24
arm                    randconfig-003-20260916    clang-24
arm                    randconfig-004-20260916    clang-24
arm                   randconfig-1000-20260916    gcc-10.5.0
arm                   randconfig-1001-20260916    gcc-10.5.0
arm                   randconfig-1002-20260916    gcc-10.5.0
arm                   randconfig-1003-20260916    gcc-10.5.0
arm                   randconfig-r133-20260916    gcc-16.1.0 sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                  randconfig-001-20260916    gcc-16.1.0
arm64                  randconfig-002-20260916    gcc-16.1.0
arm64                  randconfig-003-20260916    gcc-16.1.0
arm64                  randconfig-004-20260916    gcc-16.1.0
arm64                 randconfig-1000-20260916    gcc-14.3.0
arm64                 randconfig-1001-20260916    gcc-14.3.0
arm64                 randconfig-1002-20260916    gcc-14.3.0
arm64                 randconfig-1003-20260916    gcc-14.3.0
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                   randconfig-001-20260916    gcc-16.1.0
csky                   randconfig-002-20260916    gcc-16.1.0
csky                  randconfig-1000-20260916    gcc-14.3.0
csky                  randconfig-1001-20260916    gcc-14.3.0
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon                randconfig-001-20260916    gcc-16.1.0
hexagon                randconfig-002-20260916    gcc-16.1.0
hexagon               randconfig-1000-20260916    gcc-16.1.0
hexagon               randconfig-1001-20260916    gcc-16.1.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386         buildonly-randconfig-001-20260916    clang-22
i386         buildonly-randconfig-002-20260916    clang-22
i386         buildonly-randconfig-003-20260916    clang-22
i386         buildonly-randconfig-004-20260916    clang-22
i386         buildonly-randconfig-005-20260916    clang-22
i386         buildonly-randconfig-006-20260916    clang-22
i386        buildonly-randconfig-1000-20260916    clang-22
i386        buildonly-randconfig-1001-20260916    clang-22
i386        buildonly-randconfig-1002-20260916    clang-22
i386        buildonly-randconfig-1003-20260916    clang-22
i386        buildonly-randconfig-1004-20260916    clang-22
i386        buildonly-randconfig-1005-20260916    clang-22
i386                                 defconfig    gcc-16.1.0
i386                   randconfig-001-20260916    gcc-14
i386                   randconfig-002-20260916    gcc-14
i386                   randconfig-003-20260916    gcc-14
i386                   randconfig-004-20260916    gcc-14
i386                   randconfig-005-20260916    gcc-14
i386                   randconfig-006-20260916    gcc-14
i386                   randconfig-007-20260916    gcc-14
i386                   randconfig-011-20260916    clang-22
i386                   randconfig-012-20260916    clang-22
i386                   randconfig-013-20260916    clang-22
i386                   randconfig-014-20260916    clang-22
i386                   randconfig-015-20260916    clang-22
i386                   randconfig-016-20260916    clang-22
i386                   randconfig-017-20260916    clang-22
i386                  randconfig-1000-20260916    gcc-14
i386                  randconfig-1001-20260916    gcc-14
i386                  randconfig-1002-20260916    gcc-14
i386                  randconfig-1003-20260916    gcc-14
i386                  randconfig-1004-20260916    gcc-14
i386                  randconfig-1005-20260916    gcc-14
i386                  randconfig-1006-20260916    gcc-14
i386                  randconfig-1007-20260916    clang-22
i386                  randconfig-1008-20260916    clang-22
i386                  randconfig-1009-20260916    clang-22
i386                  randconfig-1010-20260916    clang-22
i386                  randconfig-1011-20260916    clang-22
i386                  randconfig-1012-20260916    clang-22
i386                  randconfig-1013-20260916    clang-22
i386                  randconfig-1300-20260916    clang-22   sparse
i386                  randconfig-1301-20260916    clang-22   sparse
i386                  randconfig-1302-20260916    clang-22   sparse
i386                  randconfig-r131-20260916    gcc-16.1.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch              randconfig-001-20260916    gcc-16.1.0
loongarch              randconfig-002-20260916    gcc-16.1.0
loongarch             randconfig-1000-20260916    gcc-16.1.0
loongarch             randconfig-1001-20260916    gcc-16.1.0
loongarch             randconfig-r111-20260916    gcc-12.5.0 sparse
loongarch             randconfig-r121-20260916    gcc-12.5.0 sparse
loongarch            randconfig-r1300-20260916    gcc-11.5.0 sparse
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
mips                            ip22_defconfig    gcc-16.1.0
mips                            ip27_defconfig    clang-17
mips                       maltaaprp_defconfig    clang-17
mips                  randconfig-r123-20260916    gcc-12.5.0 sparse
mips                 randconfig-r1307-20260916    gcc-12.5.0 sparse
mips                            rs90_defconfig    gcc-16.1.0
nios2                          3c120_defconfig    clang-17
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                  randconfig-001-20260916    gcc-16.1.0
nios2                  randconfig-002-20260916    gcc-16.1.0
nios2                 randconfig-1000-20260916    gcc-16.1.0
nios2                 randconfig-1001-20260916    gcc-16.1.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc              randconfig-r134-20260916    gcc-16.1.0 sparse
openrisc                  simple_smp_defconfig    clang-17
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                 randconfig-001-20260916    clang-24
parisc                 randconfig-002-20260916    clang-24
parisc                randconfig-1000-20260916    gcc-10.5.0
parisc                randconfig-1001-20260916    gcc-10.5.0
parisc                randconfig-r122-20260916    gcc-12.5.0 sparse
parisc               randconfig-r1302-20260916    gcc-11.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                         cell_defconfig    gcc-16.1.0
powerpc                        ebony_defconfig    clang-17
powerpc                  linkstation_defconfig    gcc-16.1.0
powerpc                randconfig-001-20260916    clang-24
powerpc                randconfig-002-20260916    clang-24
powerpc               randconfig-1000-20260916    gcc-10.5.0
powerpc               randconfig-1001-20260916    gcc-10.5.0
powerpc               randconfig-r113-20260916    gcc-12.5.0 sparse
powerpc              randconfig-r1305-20260916    gcc-11.5.0 sparse
powerpc              randconfig-r1308-20260916    gcc-12.5.0 sparse
powerpc                          wii_defconfig    gcc-16.1.0
powerpc64              randconfig-001-20260916    clang-24
powerpc64              randconfig-002-20260916    clang-24
powerpc64             randconfig-1000-20260916    gcc-10.5.0
powerpc64             randconfig-1001-20260916    gcc-10.5.0
powerpc64             randconfig-r112-20260916    gcc-12.5.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                  randconfig-001-20260916    gcc-16.1.0
riscv                  randconfig-002-20260916    gcc-16.1.0
riscv                 randconfig-1000-20260916    gcc-8.5.0
riscv                 randconfig-1001-20260916    gcc-8.5.0
riscv                randconfig-r1306-20260916    gcc-12.5.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                   randconfig-001-20260916    gcc-16.1.0
s390                   randconfig-002-20260916    gcc-16.1.0
s390                  randconfig-1000-20260916    gcc-8.5.0
s390                  randconfig-1001-20260916    gcc-8.5.0
s390                        zfcpdump_defconfig    clang-17
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                           lboxre2_defconfig    gcc-16.1.0
sh                           r7785rp_defconfig    clang-17
sh                     randconfig-001-20260916    gcc-16.1.0
sh                     randconfig-002-20260916    gcc-16.1.0
sh                    randconfig-1000-20260916    gcc-8.5.0
sh                    randconfig-1001-20260916    gcc-8.5.0
sh                            se7751_defconfig    gcc-16.1.0
sh                         sh7763rdp_defconfig    clang-17
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                  randconfig-001-20260916    gcc-14.3.0
sparc                  randconfig-002-20260916    gcc-14.3.0
sparc                 randconfig-1000-20260916    clang-24
sparc                 randconfig-1001-20260916    clang-24
sparc                randconfig-r1309-20260916    gcc-12.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64                randconfig-001-20260916    gcc-14.3.0
sparc64                randconfig-002-20260916    gcc-14.3.0
sparc64               randconfig-1000-20260916    clang-24
sparc64               randconfig-1001-20260916    clang-24
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                     randconfig-001-20260916    gcc-14.3.0
um                     randconfig-002-20260916    gcc-14.3.0
um                    randconfig-1000-20260916    clang-24
um                    randconfig-1001-20260916    clang-24
um                    randconfig-r132-20260916    gcc-16.1.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20260916    gcc-14
x86_64      buildonly-randconfig-1001-20260916    gcc-14
x86_64      buildonly-randconfig-1002-20260916    gcc-14
x86_64      buildonly-randconfig-1003-20260916    gcc-14
x86_64      buildonly-randconfig-1004-20260916    gcc-14
x86_64      buildonly-randconfig-1005-20260916    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                 randconfig-001-20260916    clang-22
x86_64                 randconfig-002-20260916    clang-22
x86_64                 randconfig-003-20260916    clang-22
x86_64                 randconfig-004-20260916    clang-22
x86_64                 randconfig-005-20260916    clang-22
x86_64                 randconfig-006-20260916    clang-22
x86_64                 randconfig-011-20260916    gcc-14
x86_64                 randconfig-012-20260916    gcc-14
x86_64                 randconfig-013-20260916    gcc-14
x86_64                 randconfig-014-20260916    gcc-14
x86_64                 randconfig-015-20260916    gcc-14
x86_64                 randconfig-016-20260916    gcc-14
x86_64                 randconfig-071-20260916    gcc-14
x86_64                 randconfig-072-20260916    gcc-14
x86_64                 randconfig-073-20260916    gcc-14
x86_64                 randconfig-074-20260916    gcc-14
x86_64                 randconfig-075-20260916    gcc-14
x86_64                 randconfig-076-20260916    gcc-14
x86_64                randconfig-1000-20260916    clang-22
x86_64                randconfig-1001-20260916    clang-22
x86_64                randconfig-1002-20260916    clang-22
x86_64                randconfig-1003-20260916    clang-22
x86_64                randconfig-1004-20260916    clang-22
x86_64                randconfig-1005-20260916    clang-22
x86_64                randconfig-1006-20260916    clang-22
x86_64                randconfig-1007-20260916    clang-22
x86_64                randconfig-1008-20260916    clang-22
x86_64                randconfig-1009-20260916    clang-22
x86_64                randconfig-1010-20260916    clang-22
x86_64                randconfig-1011-20260916    clang-22
x86_64                randconfig-1300-20260916    clang-22   sparse
x86_64                randconfig-1301-20260916    clang-22   sparse
x86_64                randconfig-1302-20260916    clang-22   sparse
x86_64               randconfig-r1301-20260916    gcc-11.5.0 sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                 randconfig-001-20260916    gcc-14.3.0
xtensa                 randconfig-002-20260916    gcc-14.3.0
xtensa                randconfig-1000-20260916    clang-24
xtensa                randconfig-1001-20260916    clang-24
xtensa               randconfig-r1304-20260916    gcc-11.5.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
