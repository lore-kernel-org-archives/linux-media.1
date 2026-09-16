Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D289E4FB9B3
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 13:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565384; cv=none; b=qvuULZMKtSrJL1uluO7IQi+x06xFm1aVBN5pv3q6rJa3H3MSsAZiI75URB+rJPTIfd7DQwjVyLt1fSTGrUkntJNkYckIcl6eXLF7BHeG8+d5qDuVZJX8C8fEYoUzN4tifEUCJUyaxyTZzfnqaYNSzVu4JwU7l2F8fnw4nK+RZac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565384; c=relaxed/simple;
	bh=iRSyiaN/loEwQyLea94c0d4mLR3Sbgd3RS8oP7hnT5U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BpOdhV2txtpi39xLec/Ip27Xmx5J802dFPcn5Kre1ksJZ2ftt+zH56ib53MkZndEHSeNPiAdqx4QD3vb8UCcYF6XL5nKYmzsKY76insA41CCxe2Yz+BKlTngJg7RYfWT0s2pk39FGmhfN5AZqLcME4FDdfvKcpY/IBYBuJWRVpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=colxVwIW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="colxVwIW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789565380; x=1821101380;
  h=date:from:to:cc:subject:message-id;
  bh=iRSyiaN/loEwQyLea94c0d4mLR3Sbgd3RS8oP7hnT5U=;
  b=colxVwIWbLZ9aHjTRPmbrTaIj7RoQLCIi5DSDCWuD+loJSKnjVRenFbs
   ITcnCUr83bdfDgrvYwKZINv7lB0bdgxJNr89VWEKMu8Wyy2TZlslsXtJe
   124MWbffxIjEHwTpfAz3jSYTqR2som5OFmiArSLg4C2YO+Q28SiE/2McT
   DVHdqi1T8xPdScpmHH42QGq3bZ9hCA7W/t1nPi+zGkjjW3gnEtFIXwz+K
   XGM9z3asgbDmg7F/GM7AQaCGEIpglfnF+Eoqno5OZLyPM/ot82U9JLujq
   JEftlmmsyaLq57NUwP/V54axtrzsRn6ehn6px2tU/yHBEcHcssMCTRlgO
   Q==;
X-CSE-ConnectionGUID: evcJCNTESSOUC//nRdBzWw==
X-CSE-MsgGUID: q3TLqHYoRpGoWtFvFsb6tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89810532"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89810532"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 06:29:38 -0700
X-CSE-ConnectionGUID: VS5BgUbcTXuKZf1ItFPX0A==
X-CSE-MsgGUID: JO8Idn1DS2apiGmr71VBEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="298409005"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Sep 2026 06:29:36 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6phe-0000000069x-0fv5;
	Wed, 16 Sep 2026 13:29:34 +0000
Date: Wed, 16 Sep 2026 21:29:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre] BUILD SUCCESS
 4e4e9da31fa7c05f7ad624cb0b3d080a6c36fa60
Message-ID: <202609162107.yLYiUhDS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata-pre
branch HEAD: 4e4e9da31fa7c05f7ad624cb0b3d080a6c36fa60  media: ipu6: Don't track power status, rely on runtime PM

elapsed time: m

configs tested: 222
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-24
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-24
arc                                 defconfig    gcc-16.1.0
arc                 nsimosci_hs_smp_defconfig    clang-20
arc                   randconfig-001-20260916    clang-24
arc                   randconfig-002-20260916    clang-24
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-24
arm                                 defconfig    gcc-16.1.0
arm                      integrator_defconfig    gcc-16.1.0
arm                         lpc32xx_defconfig    gcc-16.1.0
arm                   randconfig-001-20260916    clang-24
arm                   randconfig-002-20260916    clang-24
arm                   randconfig-003-20260916    clang-24
arm                   randconfig-004-20260916    clang-24
arm                 randconfig-r1306-20260916    clang-18   sparse
arm                 randconfig-r1308-20260916    clang-18   sparse
arm                           tegra_defconfig    clang-20
arm64                            allmodconfig    clang-24
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260916    gcc-16.1.0
arm64                 randconfig-002-20260916    gcc-16.1.0
arm64                 randconfig-003-20260916    gcc-16.1.0
arm64                 randconfig-004-20260916    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260916    gcc-16.1.0
csky                  randconfig-002-20260916    gcc-16.1.0
csky                 randconfig-r111-20260916    clang-24   sparse
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260916    gcc-16.1.0
hexagon               randconfig-002-20260916    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260916    clang-22
i386        buildonly-randconfig-002-20260916    clang-22
i386        buildonly-randconfig-003-20260916    clang-22
i386        buildonly-randconfig-004-20260916    clang-22
i386        buildonly-randconfig-005-20260916    clang-22
i386        buildonly-randconfig-006-20260916    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260916    gcc-14
i386                  randconfig-002-20260916    gcc-14
i386                  randconfig-003-20260916    gcc-14
i386                  randconfig-004-20260916    gcc-14
i386                  randconfig-005-20260916    gcc-14
i386                  randconfig-006-20260916    gcc-14
i386                  randconfig-007-20260916    gcc-14
i386                  randconfig-011-20260916    clang-22
i386                  randconfig-012-20260916    clang-22
i386                  randconfig-013-20260916    clang-22
i386                  randconfig-014-20260916    clang-22
i386                  randconfig-015-20260916    clang-22
i386                  randconfig-016-20260916    clang-22
i386                  randconfig-017-20260916    clang-22
i386                  randconfig-061-20260916    clang-22   sparse
i386                  randconfig-062-20260916    clang-22   sparse
i386                  randconfig-063-20260916    clang-22   sparse
i386                 randconfig-1000-20260916    gcc-14
i386                 randconfig-1001-20260916    gcc-14
i386                 randconfig-1002-20260916    gcc-14
i386                 randconfig-1003-20260916    gcc-14
i386                 randconfig-1004-20260916    gcc-14
i386                 randconfig-1005-20260916    gcc-14
i386                 randconfig-1006-20260916    gcc-14
i386                 randconfig-r112-20260916    clang-24   sparse
loongarch                        allmodconfig    clang-24
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-24
loongarch             randconfig-001-20260916    gcc-16.1.0
loongarch             randconfig-002-20260916    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-24
m68k                                defconfig    clang-24
m68k                          hp300_defconfig    gcc-16.1.0
m68k                       m5329evb_defconfig    clang-20
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-24
microblaze           randconfig-r121-20260916    clang-24   sparse
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                         cobalt_defconfig    gcc-16.1.0
mips                 randconfig-r113-20260916    clang-24   sparse
mips                        vocore2_defconfig    clang-20
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-24
nios2                               defconfig    clang-24
nios2                 randconfig-001-20260916    gcc-16.1.0
nios2                 randconfig-002-20260916    gcc-16.1.0
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-24
openrisc                            defconfig    gcc-16.1.0
openrisc             randconfig-r123-20260916    clang-24   sparse
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-24
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260916    clang-24
parisc                randconfig-002-20260916    clang-24
parisc               randconfig-r132-20260916    gcc-11.5.0 sparse
parisc64                         alldefconfig    clang-20
parisc64                            defconfig    clang-24
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-24
powerpc                   currituck_defconfig    clang-20
powerpc                     ksi8560_defconfig    gcc-16.1.0
powerpc                     mpc512x_defconfig    clang-20
powerpc               randconfig-001-20260916    clang-24
powerpc               randconfig-002-20260916    clang-24
powerpc              randconfig-r113-20260916    clang-24   sparse
powerpc              randconfig-r122-20260916    clang-24   sparse
powerpc             randconfig-r1307-20260916    clang-18   sparse
powerpc64             randconfig-001-20260916    clang-24
powerpc64             randconfig-002-20260916    clang-24
powerpc64            randconfig-r122-20260916    clang-24   sparse
riscv                            allmodconfig    clang-24
riscv                             allnoconfig    clang-24
riscv                            allyesconfig    clang-24
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260916    gcc-16.1.0
riscv                 randconfig-002-20260916    gcc-16.1.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-24
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260916    gcc-16.1.0
s390                  randconfig-002-20260916    gcc-16.1.0
s390                 randconfig-r133-20260916    gcc-11.5.0 sparse
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-24
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                ecovec24-romimage_defconfig    gcc-16.1.0
sh                          kfr2r09_defconfig    gcc-16.1.0
sh                    randconfig-001-20260916    gcc-16.1.0
sh                    randconfig-002-20260916    gcc-16.1.0
sh                   randconfig-r123-20260916    clang-24   sparse
sh                          sdk7786_defconfig    clang-20
sparc                             allnoconfig    clang-24
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260916    gcc-14.3.0
sparc                 randconfig-002-20260916    gcc-14.3.0
sparc               randconfig-r1309-20260916    clang-18   sparse
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260916    gcc-14.3.0
sparc64               randconfig-002-20260916    gcc-14.3.0
sparc64              randconfig-r112-20260916    clang-24   sparse
sparc64              randconfig-r134-20260916    gcc-11.5.0 sparse
um                               allmodconfig    clang-17
um                                allnoconfig    clang-24
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260916    gcc-14.3.0
um                    randconfig-002-20260916    gcc-14.3.0
um                   randconfig-r121-20260916    clang-24   sparse
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-24
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260916    clang-22
x86_64      buildonly-randconfig-002-20260916    clang-22
x86_64      buildonly-randconfig-003-20260916    clang-22
x86_64      buildonly-randconfig-004-20260916    clang-22
x86_64      buildonly-randconfig-005-20260916    clang-22
x86_64      buildonly-randconfig-006-20260916    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-011-20260916    gcc-14
x86_64                randconfig-012-20260916    gcc-14
x86_64                randconfig-013-20260916    gcc-14
x86_64                randconfig-014-20260916    gcc-14
x86_64                randconfig-015-20260916    gcc-14
x86_64                randconfig-016-20260916    gcc-14
x86_64                randconfig-071-20260916    gcc-14
x86_64                randconfig-072-20260916    gcc-14
x86_64                randconfig-073-20260916    gcc-14
x86_64                randconfig-074-20260916    gcc-14
x86_64                randconfig-075-20260916    gcc-14
x86_64                randconfig-076-20260916    gcc-14
x86_64               randconfig-1000-20260916    clang-22
x86_64               randconfig-1001-20260916    clang-22
x86_64               randconfig-1002-20260916    clang-22
x86_64               randconfig-1003-20260916    clang-22
x86_64               randconfig-1004-20260916    clang-22
x86_64               randconfig-1005-20260916    clang-22
x86_64               randconfig-1006-20260916    clang-22
x86_64               randconfig-1007-20260916    clang-22
x86_64               randconfig-1008-20260916    clang-22
x86_64               randconfig-1009-20260916    clang-22
x86_64               randconfig-1010-20260916    clang-22
x86_64               randconfig-1011-20260916    clang-22
x86_64                randconfig-121-20260916    clang-22   sparse
x86_64                randconfig-122-20260916    clang-22   sparse
x86_64                randconfig-123-20260916    clang-22   sparse
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-24
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260916    gcc-14.3.0
xtensa                randconfig-002-20260916    gcc-14.3.0
xtensa               randconfig-r111-20260916    clang-24   sparse
xtensa               randconfig-r131-20260916    gcc-11.5.0 sparse
xtensa                    smp_lx200_defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
