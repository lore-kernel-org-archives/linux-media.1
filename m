Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB099503906
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 22:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790634540; cv=none; b=Cwak3jfenmUHfhhuZ40Dso5jqh+3s5SyYFR3TrZY4qOg1kEV2uCLbT+svMVrY6OHnrJCoym9SL0v+27pm3gyKc0U4DlxTicndWEOtoFYI+snrAnXneI5HsrpoWgItKzX+tw3fe8DwJCR0D2D83d/U1HANbmlTfyyn+GF/D8U5no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790634540; c=relaxed/simple;
	bh=Jsf+iXNzePWVR8I+pHsNpQBhVRMzkxFm3S6hVrJyafw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JHX4m9URP+IZTiklo8W7B5j88BHhBpwPmxaRzS896T0XBC2Fu7N2nzEt93BskTHLLzu6W3XNVlUXufwfUoMRz7geY/tXil0QTZwTe8L9hRbPbXi2JR06pIWmTpemlqp6VXN/nqyrRGGb794ViIRC28wH6zpVIzhWcQI+xYxzefY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZmsZhNVs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmsZhNVs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790634538; x=1822170538;
  h=date:from:to:cc:subject:message-id;
  bh=Jsf+iXNzePWVR8I+pHsNpQBhVRMzkxFm3S6hVrJyafw=;
  b=ZmsZhNVsC8S3ooxzqM/y0aP6t/QiGVwTd3e06JDgW39K3E2zawuaWG2U
   usZ5A8et4iXhTsGiSPTy2NLqyC/367kKo3OBX+4ciKxiXEL6sGXix39bP
   cp740R133rImHDW4llfoDdwnMrFkhLEXblDn4hQsiTZw2Rqp9o0V41/ip
   THe6bG0L3j6xxEBWLPLnBOskJ2guxiD3TTeChmRGj8QOGF4fsLeARYvqe
   XgoVraUJMLAwyA/cioEni6t1iIi0465D0L8Zegk9Y3t4SQoyS0XGdPTUq
   3G7IgKhXtxw8Sa4bi3SeSWQYzy9fn3QMEEp2pCfniivG+hTm3e3XcqlYr
   Q==;
X-CSE-ConnectionGUID: 0THMke7VR+Gp/Vb3HepqWQ==
X-CSE-MsgGUID: 8GYbXJ3NQcuoTDwKP9ivEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101916073"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="101916073"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:28:58 -0700
X-CSE-ConnectionGUID: lxL+mj/AQY6ZPhcS4A0i8g==
X-CSE-MsgGUID: 71mfXu7PTIeGSP0K1HY8FA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Sep 2026 15:28:57 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBJqA-00000000ObQ-132d;
	Mon, 28 Sep 2026 22:28:54 +0000
Date: Tue, 29 Sep 2026 06:28:03 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:next] BUILD SUCCESS
 58348f64125e9a3e44d3abb275ca7f4e6c9641e5
Message-ID: <202609290659.qcF0zELE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git next
branch HEAD: 58348f64125e9a3e44d3abb275ca7f4e6c9641e5  media: ipu6: Support upstream sub-devices without get_frame_desc()

elapsed time: 1299m

configs tested: 338
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2102-20260927    gcc-8.5.0  cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                          haps_hs_defconfig    gcc-16.1.0
arc                   randconfig-1000-20260928    clang-24
arc                   randconfig-1000-20260929    clang-17
arc                   randconfig-1001-20260928    clang-24
arc                   randconfig-1001-20260929    clang-17
arc                  randconfig-r2106-20260928    clang-17   cocci
arc                     vdk_hs38_smp_defconfig    gcc-16.1.0
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                            h3600_defconfig    gcc-16.1.0
arm                          lpc32xx_defconfig    gcc-16.1.0
arm                          mv78xx0_defconfig    gcc-16.1.0
arm                         mvebu_v5_defconfig    clang-24
arm                   randconfig-1000-20260928    clang-24
arm                   randconfig-1000-20260929    clang-17
arm                   randconfig-1001-20260928    clang-24
arm                   randconfig-1001-20260929    clang-17
arm                   randconfig-1002-20260928    clang-24
arm                   randconfig-1002-20260929    clang-17
arm                   randconfig-1003-20260928    clang-24
arm                   randconfig-1003-20260929    clang-17
arm                  randconfig-r2107-20260927    clang-17   cocci
arm                  randconfig-r2300-20260927    clang-22   sparse
arm                  randconfig-r2304-20260927    clang-22   sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260928    gcc-15.2.0
arm64                 randconfig-1000-20260929    clang-24
arm64                 randconfig-1001-20260928    gcc-15.2.0
arm64                 randconfig-1001-20260929    clang-24
arm64                 randconfig-1002-20260928    gcc-15.2.0
arm64                 randconfig-1002-20260929    clang-24
arm64                 randconfig-1003-20260928    gcc-15.2.0
arm64                 randconfig-1003-20260929    clang-24
arm64                randconfig-r2305-20260927    gcc-15.2.0 sparse
arm64                randconfig-r2306-20260928    gcc-14.3.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260928    gcc-15.2.0
csky                  randconfig-1000-20260929    clang-24
csky                  randconfig-1001-20260928    gcc-15.2.0
csky                  randconfig-1001-20260929    clang-24
csky                 randconfig-r2106-20260927    clang-17   cocci
csky                 randconfig-r2107-20260928    clang-17   cocci
csky                 randconfig-r2300-20260927    gcc-15.2.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260928    gcc-8.5.0
hexagon               randconfig-1001-20260928    gcc-8.5.0
hexagon              randconfig-r2102-20260928    gcc-11.5.0 cocci
hexagon              randconfig-r2104-20260927    clang-24   cocci
hexagon              randconfig-r2304-20260927    gcc-15.2.0 sparse
hexagon              randconfig-r2306-20260927    clang-22   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386        buildonly-randconfig-1000-20260928    clang-22
i386        buildonly-randconfig-1001-20260928    clang-22
i386        buildonly-randconfig-1002-20260928    clang-22
i386        buildonly-randconfig-1003-20260928    clang-22
i386        buildonly-randconfig-1004-20260928    clang-22
i386        buildonly-randconfig-1005-20260928    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260928    gcc-14
i386                  randconfig-1001-20260928    gcc-14
i386                  randconfig-1002-20260928    gcc-14
i386                  randconfig-1003-20260928    gcc-14
i386                  randconfig-1004-20260928    gcc-14
i386                  randconfig-1005-20260928    gcc-14
i386                  randconfig-1006-20260928    gcc-14
i386                  randconfig-1007-20260928    clang-22
i386                  randconfig-1007-20260929    gcc-14
i386                  randconfig-1008-20260928    clang-22
i386                  randconfig-1008-20260929    gcc-14
i386                  randconfig-1009-20260928    clang-22
i386                  randconfig-1009-20260929    gcc-14
i386                  randconfig-1010-20260928    clang-22
i386                  randconfig-1010-20260929    gcc-14
i386                  randconfig-1011-20260928    clang-22
i386                  randconfig-1011-20260929    gcc-14
i386                  randconfig-1012-20260928    clang-22
i386                  randconfig-1012-20260929    gcc-14
i386                  randconfig-1013-20260928    clang-22
i386                  randconfig-1013-20260929    gcc-14
i386                  randconfig-2100-20260927    clang-22   cocci
i386                  randconfig-2100-20260928    gcc-14     cocci
i386                  randconfig-2101-20260927    clang-22   cocci
i386                  randconfig-2101-20260928    gcc-14     cocci
i386                  randconfig-2102-20260927    clang-22   cocci
i386                  randconfig-2102-20260928    gcc-14     cocci
i386                  randconfig-2103-20260927    clang-22   cocci
i386                  randconfig-2103-20260928    gcc-14     cocci
i386                  randconfig-2200-20260927    clang-22   smatch
i386                  randconfig-2200-20260928    clang-22   smatch
i386                  randconfig-2300-20260927    clang-22   sparse
i386                  randconfig-2300-20260928    clang-22   sparse
i386                  randconfig-2301-20260927    clang-22   sparse
i386                  randconfig-2301-20260928    clang-22   sparse
i386                  randconfig-2302-20260927    clang-22   sparse
i386                  randconfig-2302-20260928    clang-22   sparse
i386                 randconfig-r2107-20260927    clang-24   cocci
i386                 randconfig-r2202-20260928    gcc-14     smatch
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260928    gcc-8.5.0
loongarch             randconfig-1001-20260928    gcc-8.5.0
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                 randconfig-r2201-20260928    gcc-12.5.0 smatch
m68k                 randconfig-r2301-20260927    gcc-15.2.0 sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2103-20260928    gcc-11.5.0 cocci
microblaze           randconfig-r2202-20260927    gcc-13.4.0 smatch
microblaze           randconfig-r2309-20260928    gcc-14.3.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                       fuloong2e_defconfig    gcc-16.1.0
mips                       loongson3_defconfig    gcc-16.1.0
mips                         omega2p_defconfig    gcc-16.1.0
mips                 randconfig-r2103-20260927    gcc-8.5.0  cocci
mips                 randconfig-r2305-20260927    clang-22   sparse
mips                         vocore2_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260928    gcc-8.5.0
nios2                 randconfig-1001-20260928    gcc-8.5.0
nios2                randconfig-r2303-20260927    clang-22   sparse
nios2                randconfig-r2303-20260927    gcc-15.2.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2101-20260927    gcc-13.4.0 cocci
openrisc             randconfig-r2104-20260928    clang-17   cocci
openrisc             randconfig-r2106-20260927    clang-24   cocci
openrisc             randconfig-r2200-20260927    gcc-16.1.0 smatch
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260928    clang-24
parisc                randconfig-1000-20260929    gcc-8.5.0
parisc                randconfig-1001-20260928    clang-24
parisc                randconfig-1001-20260929    gcc-8.5.0
parisc               randconfig-r2100-20260927    gcc-8.5.0  cocci
parisc               randconfig-r2103-20260927    gcc-13.4.0 cocci
parisc               randconfig-r2200-20260928    gcc-8.5.0  smatch
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                       bamboo_defconfig    clang-24
powerpc                  linkstation_defconfig    clang-24
powerpc                  mpc834x_itx_defconfig    clang-24
powerpc                       ppc6xx_defconfig    gcc-16.1.0
powerpc                      rainier_defconfig    clang-24
powerpc               randconfig-1000-20260928    clang-24
powerpc               randconfig-1000-20260929    gcc-8.5.0
powerpc               randconfig-1001-20260928    clang-24
powerpc               randconfig-1001-20260929    gcc-8.5.0
powerpc              randconfig-r2105-20260927    clang-17   cocci
powerpc              randconfig-r2302-20260927    gcc-15.2.0 sparse
powerpc              randconfig-r2307-20260928    gcc-14.3.0 sparse
powerpc                      redwood_defconfig    gcc-16.1.0
powerpc                          wii_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20260928    clang-24
powerpc64             randconfig-1000-20260929    gcc-8.5.0
powerpc64             randconfig-1001-20260928    clang-24
powerpc64             randconfig-1001-20260929    gcc-8.5.0
powerpc64            randconfig-r2102-20260927    gcc-13.4.0 cocci
powerpc64            randconfig-r2105-20260928    clang-17   cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260928    clang-24
riscv                 randconfig-1000-20260929    clang-24
riscv                 randconfig-1001-20260928    clang-24
riscv                 randconfig-1001-20260929    clang-24
riscv                 randconfig-2000-20260927    clang-24
riscv                 randconfig-2000-20260928    gcc-8.5.0
riscv                 randconfig-2001-20260927    clang-24
riscv                 randconfig-2001-20260928    gcc-8.5.0
riscv                randconfig-r2201-20260927    gcc-8.5.0  smatch
riscv                randconfig-r2301-20260927    clang-22   sparse
riscv                randconfig-r2307-20260927    clang-24   sparse
riscv                randconfig-r2308-20260927    clang-24   sparse
s390                              alldefconfig    gcc-16.1.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260928    clang-24
s390                  randconfig-1000-20260929    clang-24
s390                  randconfig-1001-20260928    clang-24
s390                  randconfig-1001-20260929    clang-24
s390                  randconfig-2000-20260927    clang-24
s390                  randconfig-2000-20260928    gcc-8.5.0
s390                  randconfig-2001-20260927    clang-24
s390                  randconfig-2001-20260928    gcc-8.5.0
s390                        zfcpdump_defconfig    clang-24
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    clang-24
sh                         edosk7705_defconfig    gcc-16.1.0
sh                             hp6xx_defconfig    gcc-16.1.0
sh                    randconfig-1000-20260928    clang-24
sh                    randconfig-1000-20260929    clang-24
sh                    randconfig-1001-20260928    clang-24
sh                    randconfig-1001-20260929    clang-24
sh                    randconfig-2000-20260927    clang-24
sh                    randconfig-2000-20260928    gcc-8.5.0
sh                    randconfig-2001-20260927    clang-24
sh                    randconfig-2001-20260928    gcc-8.5.0
sh                   randconfig-r2308-20260927    clang-22   sparse
sh                   randconfig-r2309-20260927    clang-22   sparse
sh                            se7712_defconfig    gcc-16.1.0
sh                    sh7770_generic_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260928    clang-17
sparc                 randconfig-1001-20260928    clang-17
sparc                 randconfig-2000-20260927    gcc-16.1.0
sparc                 randconfig-2000-20260928    gcc-13.4.0
sparc                 randconfig-2001-20260927    gcc-16.1.0
sparc                 randconfig-2001-20260928    gcc-13.4.0
sparc                randconfig-r2100-20260928    gcc-11.5.0 cocci
sparc                randconfig-r2105-20260927    clang-24   cocci
sparc                randconfig-r2306-20260927    clang-24   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260928    clang-17
sparc64               randconfig-1001-20260928    clang-17
sparc64               randconfig-2000-20260927    gcc-16.1.0
sparc64               randconfig-2000-20260928    gcc-13.4.0
sparc64               randconfig-2001-20260927    gcc-16.1.0
sparc64               randconfig-2001-20260928    gcc-13.4.0
sparc64              randconfig-r2101-20260927    gcc-8.5.0  cocci
sparc64              randconfig-r2308-20260928    gcc-14.3.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260928    clang-17
um                    randconfig-1001-20260928    clang-17
um                    randconfig-2000-20260927    gcc-16.1.0
um                    randconfig-2000-20260928    gcc-13.4.0
um                    randconfig-2001-20260927    gcc-16.1.0
um                    randconfig-2001-20260928    gcc-13.4.0
um                   randconfig-r2202-20260927    gcc-14     smatch
um                   randconfig-r2302-20260927    clang-22   sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20260928    gcc-14
x86_64      buildonly-randconfig-1001-20260928    gcc-14
x86_64      buildonly-randconfig-1002-20260928    gcc-14
x86_64      buildonly-randconfig-1003-20260928    gcc-14
x86_64      buildonly-randconfig-1004-20260928    gcc-14
x86_64      buildonly-randconfig-1005-20260928    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260928    gcc-14
x86_64                randconfig-1001-20260928    gcc-14
x86_64                randconfig-1002-20260928    gcc-14
x86_64                randconfig-1003-20260928    gcc-14
x86_64                randconfig-1004-20260928    gcc-14
x86_64                randconfig-1005-20260928    gcc-14
x86_64                randconfig-1006-20260928    gcc-14
x86_64                randconfig-1007-20260928    gcc-14
x86_64                randconfig-1008-20260928    gcc-14
x86_64                randconfig-1009-20260928    gcc-14
x86_64                randconfig-1010-20260928    gcc-14
x86_64                randconfig-1011-20260928    gcc-14
x86_64                randconfig-1012-20260928    clang-22
x86_64                randconfig-1013-20260928    clang-22
x86_64                randconfig-1014-20260928    clang-22
x86_64                randconfig-1015-20260928    clang-22
x86_64                randconfig-1016-20260928    clang-22
x86_64                randconfig-1017-20260928    clang-22
x86_64                randconfig-2100-20260927    clang-22   cocci
x86_64                randconfig-2100-20260928    gcc-12     cocci
x86_64                randconfig-2101-20260927    clang-22   cocci
x86_64                randconfig-2101-20260928    gcc-12     cocci
x86_64                randconfig-2102-20260927    clang-22   cocci
x86_64                randconfig-2102-20260928    gcc-12     cocci
x86_64                randconfig-2103-20260927    clang-22   cocci
x86_64                randconfig-2103-20260928    gcc-12     cocci
x86_64                randconfig-2200-20260927    gcc-14     smatch
x86_64                randconfig-2200-20260928    gcc-14     smatch
x86_64                randconfig-2300-20260927    clang-22   sparse
x86_64                randconfig-2300-20260928    clang-22   sparse
x86_64                randconfig-2301-20260927    clang-22   sparse
x86_64                randconfig-2301-20260928    clang-22   sparse
x86_64                randconfig-2302-20260927    clang-22   sparse
x86_64                randconfig-2302-20260928    clang-22   sparse
x86_64               randconfig-r2307-20260927    clang-22   sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20260928    clang-17
xtensa                randconfig-1001-20260928    clang-17
xtensa                randconfig-2000-20260927    gcc-16.1.0
xtensa                randconfig-2000-20260928    gcc-13.4.0
xtensa                randconfig-2001-20260927    gcc-16.1.0
xtensa                randconfig-2001-20260928    gcc-13.4.0
xtensa               randconfig-r2100-20260927    gcc-13.4.0 cocci
xtensa               randconfig-r2101-20260928    gcc-11.5.0 cocci
xtensa               randconfig-r2104-20260927    clang-17   cocci
xtensa               randconfig-r2201-20260927    gcc-16.1.0 smatch
xtensa               randconfig-r2309-20260927    clang-24   sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
