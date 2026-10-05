Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591AB317163
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 13:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791207939; cv=none; b=ABOpEZD7gTvy9D0jmCUAR8FlQtDqHKgZhwFCoMoqaaizLaIRIl6oHNVMQNfUftjbALjRzOT0pxyFGMxP1hAuWznwVYXxcgKV+xHr6IQzVODoRAnCqnzL8bKSsKJQeJe9odU11WQgdjvvfEqq7cCf51NDLjzrIkBNJa2W0wcmULw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791207939; c=relaxed/simple;
	bh=rj5ogt8RfjVHmmzdnZyiFFv7H397Q2hoEggIvjLYYTw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ntieUwDGTyTlNXSBlHvCIV5QoR2MJ8P2Z9a0aLSSAiIyjK3br+C8eE9viqvTTaFFG5ZGYv6y//t+un57wFD2jA/wuoq90RwjqyHdD9uf5ora+sac3WNhOQWcHLd7u2NMQcCxGiGWJ5HCw29Pq9TK0WDkSWATNM46i0zsXHIMkhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k24agnDt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k24agnDt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791207937; x=1822743937;
  h=date:from:to:cc:subject:message-id;
  bh=rj5ogt8RfjVHmmzdnZyiFFv7H397Q2hoEggIvjLYYTw=;
  b=k24agnDtQKyQFngf4R+j0RrLV//OGAI4E0ZSObrHcv5VN7B9vSCJ4+RF
   r67rVSba4cnlIB9opz0QSt5FaOJdljD2r4TdpXkX5s298g+siZZY/9tfO
   4P2Zz/aXQneGR9lzOANNRj9MmShYgTkcz3KOKd5dzxnwTyaPOSrZxxTWF
   Q/Dk8LsiqMLjGdjpPaUkyj47UlRsB7R3FCKQw7GfEa2hE3PP2UfUMillP
   BjNWwAzEIO3FfJFWgctnmJFIO1aGnJ67zm/rfJV6W5MahvNbZ+CIPZMI+
   yyFAldEAj6Mt4EcEkVj5j7lIkn5GjNAYwO9SmrsMUIGmCI7U4NC1Cg4Vt
   g==;
X-CSE-ConnectionGUID: hf6ixglnR8COgEaKE1HybQ==
X-CSE-MsgGUID: iCoHdJXhTOGP34OSmHl6fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91983445"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="91983445"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 06:45:36 -0700
X-CSE-ConnectionGUID: JrABMIiKRECmfcoHNsGPsw==
X-CSE-MsgGUID: Do+G5kb3QwW+HnBxmtyx0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="304774619"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Oct 2026 06:45:35 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDj0W-000000000Mx-3lJv;
	Mon, 05 Oct 2026 13:45:32 +0000
Date: Mon, 05 Oct 2026 21:45:18 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:master] BUILD SUCCESS
 9cfc1aca0781ce08e307b6c9dd617d37021544a8
Message-ID: <202610052115.Lu3Akcwv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git master
branch HEAD: 9cfc1aca0781ce08e307b6c9dd617d37021544a8  media: mali-c55: Ignore disconnected queues when checking readiness

elapsed time: 1156m

configs tested: 370
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             alldefconfig    gcc-16.1.0
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2101-20261004    gcc-11.5.0 cocci
alpha                randconfig-r2105-20261004    clang-24   cocci
alpha                randconfig-r2300-20261004    gcc-15.2.0 sparse
alpha                randconfig-r2301-20261004    clang-24   sparse
alpha                randconfig-r2302-20261004    gcc-8.5.0  sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261005    gcc-8.5.0
arc                   randconfig-1001-20261005    gcc-8.5.0
arc                  randconfig-r2100-20261004    gcc-8.5.0  cocci
arc                  randconfig-r2105-20261001    gcc-8.5.0  cocci
arc                  randconfig-r2302-20261004    clang-24   sparse
arc                  randconfig-r2309-20261004    gcc-9.5.0  sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                          bcm2835_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                        imx_v4_v5_defconfig    gcc-16.1.0
arm                         mvebu_v7_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261005    gcc-8.5.0
arm                   randconfig-1001-20261005    gcc-8.5.0
arm                   randconfig-1002-20261005    gcc-8.5.0
arm                   randconfig-1003-20261005    gcc-8.5.0
arm                  randconfig-r2107-20261004    gcc-14.3.0 cocci
arm                  randconfig-r2201-20261004    gcc-13.4.0 smatch
arm                  randconfig-r2202-20261004    gcc-11.5.0 smatch
arm                  randconfig-r2300-20261004    gcc-16.1.0 sparse
arm                  randconfig-r2304-20261004    gcc-16.1.0 sparse
arm                  randconfig-r2306-20261004    gcc-14.3.0 sparse
arm                         spear6xx_defconfig    gcc-16.1.0
arm                         vexpress_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261005    gcc-16.1.0
arm64                 randconfig-1001-20261005    gcc-16.1.0
arm64                 randconfig-1002-20261005    gcc-16.1.0
arm64                 randconfig-1003-20261005    gcc-16.1.0
arm64                randconfig-r2100-20261004    gcc-11.5.0 cocci
arm64                randconfig-r2305-20261004    clang-24   sparse
arm64                randconfig-r2309-20261004    clang-18   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261005    gcc-16.1.0
csky                  randconfig-1001-20261005    gcc-16.1.0
csky                 randconfig-r2303-20261001    gcc-16.1.0 sparse
csky                 randconfig-r2304-20261004    clang-24   sparse
csky                 randconfig-r2304-20261004    gcc-10.5.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261005    gcc-16.1.0
hexagon               randconfig-1001-20261005    gcc-16.1.0
hexagon              randconfig-r2200-20261001    clang-24   smatch
hexagon              randconfig-r2200-20261004    clang-24   smatch
hexagon              randconfig-r2201-20261004    clang-24   smatch
hexagon              randconfig-r2300-20261004    clang-24   sparse
hexagon              randconfig-r2304-20261004    gcc-8.5.0  sparse
hexagon              randconfig-r2306-20261001    gcc-14     sparse
hexagon              randconfig-r2307-20261004    gcc-14.3.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261005    clang-22
i386        buildonly-randconfig-1001-20261005    clang-22
i386        buildonly-randconfig-1002-20261005    clang-22
i386        buildonly-randconfig-1003-20261005    clang-22
i386        buildonly-randconfig-1004-20261005    clang-22
i386        buildonly-randconfig-1005-20261005    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261005    clang-22
i386                  randconfig-1001-20261005    clang-22
i386                  randconfig-1002-20261005    clang-22
i386                  randconfig-1003-20261005    clang-22
i386                  randconfig-1004-20261005    clang-22
i386                  randconfig-1005-20261005    clang-22
i386                  randconfig-1006-20261005    clang-22
i386                  randconfig-1007-20261005    clang-22
i386                  randconfig-1008-20261005    clang-22
i386                  randconfig-1009-20261005    clang-22
i386                  randconfig-1010-20261005    clang-22
i386                  randconfig-1011-20261005    clang-22
i386                  randconfig-1012-20261005    clang-22
i386                  randconfig-1013-20261005    clang-22
i386                  randconfig-2100-20261001    gcc-14     cocci
i386                  randconfig-2100-20261004    clang-22   cocci
i386                  randconfig-2101-20261001    gcc-14     cocci
i386                  randconfig-2101-20261004    clang-22   cocci
i386                  randconfig-2101-20261004    gcc-14     cocci
i386                  randconfig-2102-20261001    gcc-14     cocci
i386                  randconfig-2102-20261004    clang-22   cocci
i386                  randconfig-2102-20261004    gcc-14     cocci
i386                  randconfig-2103-20261001    gcc-14     cocci
i386                  randconfig-2103-20261004    clang-22   cocci
i386                  randconfig-2103-20261004    gcc-14     cocci
i386                  randconfig-2200-20261001    clang-22   smatch
i386                  randconfig-2200-20261004    clang-22   smatch
i386                  randconfig-2300-20261001    gcc-14     sparse
i386                  randconfig-2300-20261004    clang-22   sparse
i386                  randconfig-2301-20261001    gcc-14     sparse
i386                  randconfig-2301-20261004    clang-22   sparse
i386                  randconfig-2302-20261001    gcc-14     sparse
i386                  randconfig-2302-20261004    clang-22   sparse
i386                 randconfig-r2100-20261004    clang-24   cocci
i386                 randconfig-r2100-20261004    gcc-11.5.0 cocci
i386                 randconfig-r2308-20261004    gcc-14.3.0 sparse
i386                 randconfig-r2309-20261001    gcc-14     sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261005    gcc-16.1.0
loongarch             randconfig-1001-20261005    gcc-16.1.0
loongarch            randconfig-r2102-20261004    clang-24   cocci
loongarch            randconfig-r2103-20261004    clang-24   cocci
loongarch            randconfig-r2202-20261001    clang-21   smatch
loongarch            randconfig-r2302-20261004    gcc-16.1.0 sparse
loongarch            randconfig-r2304-20261001    gcc-16.1.0 sparse
loongarch            randconfig-r2306-20261004    gcc-14.3.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         mvme16x_defconfig    gcc-16.1.0
m68k                             q40_defconfig    gcc-16.1.0
m68k                 randconfig-r2101-20261004    gcc-15.2.0 cocci
m68k                 randconfig-r2102-20261004    gcc-11.5.0 cocci
m68k                 randconfig-r2103-20261004    gcc-11.5.0 cocci
m68k                 randconfig-r2200-20261004    gcc-8.5.0  smatch
m68k                 randconfig-r2302-20261004    gcc-8.5.0  sparse
m68k                 randconfig-r2306-20261004    gcc-15.2.0 sparse
m68k                 randconfig-r2307-20261004    gcc-9.5.0  sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze                       mmu_defconfig    gcc-16.1.0
microblaze           randconfig-r2201-20261004    gcc-8.5.0  smatch
microblaze           randconfig-r2301-20261004    gcc-13.4.0 sparse
microblaze           randconfig-r2303-20261004    gcc-8.5.0  sparse
microblaze           randconfig-r2305-20261004    gcc-16.1.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                 randconfig-r2100-20261004    gcc-8.5.0  cocci
mips                 randconfig-r2106-20261004    gcc-14.3.0 cocci
mips                 randconfig-r2200-20261004    gcc-15.2.0 smatch
mips                 randconfig-r2301-20261001    gcc-16.1.0 sparse
mips                 randconfig-r2307-20261004    gcc-14.3.0 sparse
mips                 randconfig-r2308-20261001    gcc-14     sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261005    gcc-16.1.0
nios2                 randconfig-1001-20261005    gcc-16.1.0
nios2                randconfig-r2103-20261004    clang-24   cocci
nios2                randconfig-r2107-20261004    clang-24   cocci
nios2                randconfig-r2200-20261004    gcc-8.5.0  smatch
nios2                randconfig-r2201-20261001    gcc-10.5.0 smatch
nios2                randconfig-r2202-20261004    gcc-8.5.0  smatch
nios2                randconfig-r2300-20261004    gcc-8.5.0  sparse
nios2                randconfig-r2303-20261004    gcc-11.5.0 sparse
nios2                randconfig-r2305-20261001    gcc-16.1.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2102-20261004    gcc-11.5.0 cocci
openrisc             randconfig-r2103-20261001    clang-24   cocci
openrisc             randconfig-r2105-20261004    gcc-14.3.0 cocci
openrisc             randconfig-r2307-20261001    gcc-14     sparse
openrisc             randconfig-r2307-20261004    gcc-14.3.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261005    gcc-8.5.0
parisc                randconfig-1001-20261005    gcc-8.5.0
parisc               randconfig-r2305-20261004    gcc-16.1.0 sparse
parisc               randconfig-r2306-20261004    gcc-10.5.0 sparse
parisc               randconfig-r2306-20261004    gcc-9.5.0  sparse
parisc               randconfig-r2308-20261004    gcc-14.3.0 sparse
parisc               randconfig-r2308-20261004    gcc-9.5.0  sparse
parisc               randconfig-r2309-20261004    gcc-14.3.0 sparse
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    gcc-16.1.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                       arches_defconfig    gcc-16.1.0
powerpc                    bluestone_defconfig    gcc-16.1.0
powerpc                         cell_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261005    gcc-8.5.0
powerpc               randconfig-1001-20261005    gcc-8.5.0
powerpc              randconfig-r2101-20261001    clang-24   cocci
powerpc              randconfig-r2102-20261001    clang-24   cocci
powerpc              randconfig-r2104-20261004    clang-24   cocci
powerpc              randconfig-r2106-20261004    clang-24   cocci
powerpc              randconfig-r2301-20261004    gcc-16.1.0 sparse
powerpc              randconfig-r2304-20261004    clang-24   sparse
powerpc              randconfig-r2309-20261004    gcc-14.3.0 sparse
powerpc                     sam440ep_defconfig    gcc-16.1.0
powerpc                      tqm8540_defconfig    gcc-16.1.0
powerpc64                         alldefconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261005    gcc-8.5.0
powerpc64             randconfig-1001-20261005    gcc-8.5.0
powerpc64            randconfig-r2202-20261004    clang-24   smatch
powerpc64            randconfig-r2309-20261004    clang-17   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv              nommu_k210_sdcard_defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261005    clang-17
riscv                 randconfig-1001-20261005    clang-17
riscv                 randconfig-2000-20261001    gcc-10.5.0
riscv                 randconfig-2000-20261004    gcc-11.5.0
riscv                 randconfig-2001-20261001    gcc-10.5.0
riscv                 randconfig-2001-20261004    gcc-11.5.0
riscv                randconfig-r2101-20261004    clang-24   cocci
riscv                randconfig-r2102-20261004    clang-24   cocci
riscv                randconfig-r2103-20261004    gcc-11.5.0 cocci
riscv                randconfig-r2200-20261004    gcc-11.5.0 smatch
riscv                randconfig-r2300-20261001    gcc-16.1.0 sparse
riscv                randconfig-r2301-20261004    gcc-8.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261005    clang-17
s390                  randconfig-1001-20261005    clang-17
s390                  randconfig-2000-20261001    gcc-10.5.0
s390                  randconfig-2000-20261004    gcc-11.5.0
s390                  randconfig-2001-20261001    gcc-10.5.0
s390                  randconfig-2001-20261004    gcc-11.5.0
s390                 randconfig-r2101-20261004    gcc-11.5.0 cocci
s390                 randconfig-r2103-20261004    gcc-10.5.0 cocci
s390                 randconfig-r2202-20261004    gcc-9.5.0  smatch
s390                 randconfig-r2302-20261001    gcc-16.1.0 sparse
s390                 randconfig-r2303-20261004    gcc-16.1.0 sparse
s390                 randconfig-r2303-20261004    gcc-8.5.0  sparse
s390                 randconfig-r2308-20261004    clang-19   sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         edosk7705_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261005    clang-17
sh                    randconfig-1001-20261005    clang-17
sh                    randconfig-2000-20261001    gcc-10.5.0
sh                    randconfig-2000-20261004    gcc-11.5.0
sh                    randconfig-2001-20261001    gcc-10.5.0
sh                    randconfig-2001-20261004    gcc-11.5.0
sh                   randconfig-r2100-20261001    clang-24   cocci
sh                   randconfig-r2104-20261004    gcc-10.5.0 cocci
sh                   randconfig-r2104-20261004    gcc-14.3.0 cocci
sh                   randconfig-r2105-20261004    gcc-10.5.0 cocci
sh                       rts7751r2d1_defconfig    gcc-16.1.0
sh                            se7750_defconfig    gcc-16.1.0
sh                               ul2_defconfig    gcc-16.1.0
sh                           urquell_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261005    clang-24
sparc                 randconfig-1001-20261005    clang-24
sparc                 randconfig-2000-20261001    clang-24
sparc                 randconfig-2000-20261004    clang-17
sparc                 randconfig-2001-20261001    clang-24
sparc                 randconfig-2001-20261004    clang-17
sparc                randconfig-r2107-20261001    gcc-8.5.0  cocci
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261005    clang-24
sparc64               randconfig-1001-20261005    clang-24
sparc64               randconfig-2000-20261001    clang-24
sparc64               randconfig-2000-20261004    clang-17
sparc64               randconfig-2001-20261001    clang-24
sparc64               randconfig-2001-20261004    clang-17
sparc64              randconfig-r2102-20261004    clang-20   cocci
sparc64              randconfig-r2106-20261001    gcc-8.5.0  cocci
sparc64              randconfig-r2302-20261004    gcc-10.5.0 sparse
sparc64              randconfig-r2307-20261004    gcc-16.1.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261005    clang-24
um                    randconfig-1001-20261005    clang-24
um                    randconfig-2000-20261001    clang-24
um                    randconfig-2000-20261004    clang-17
um                    randconfig-2001-20261001    clang-24
um                    randconfig-2001-20261004    clang-17
um                   randconfig-r2303-20261004    clang-24   sparse
um                   randconfig-r2308-20261004    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-22   checkkconfigsymbols
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261005    gcc-13
x86_64      buildonly-randconfig-1001-20261005    gcc-13
x86_64      buildonly-randconfig-1002-20261005    gcc-13
x86_64      buildonly-randconfig-1003-20261005    gcc-13
x86_64      buildonly-randconfig-1004-20261005    gcc-13
x86_64      buildonly-randconfig-1005-20261005    gcc-13
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261005    gcc-14
x86_64                randconfig-1001-20261005    gcc-14
x86_64                randconfig-1002-20261005    gcc-14
x86_64                randconfig-1003-20261005    gcc-14
x86_64                randconfig-1004-20261005    gcc-14
x86_64                randconfig-1005-20261005    gcc-14
x86_64                randconfig-1006-20261005    gcc-14
x86_64                randconfig-1007-20261005    gcc-14
x86_64                randconfig-1008-20261005    gcc-14
x86_64                randconfig-1009-20261005    gcc-14
x86_64                randconfig-1010-20261005    gcc-14
x86_64                randconfig-1011-20261005    gcc-14
x86_64                randconfig-1012-20261005    gcc-14
x86_64                randconfig-1013-20261005    gcc-14
x86_64                randconfig-1014-20261005    gcc-14
x86_64                randconfig-1015-20261005    gcc-14
x86_64                randconfig-1016-20261005    gcc-14
x86_64                randconfig-1017-20261005    gcc-14
x86_64                randconfig-2100-20261001    gcc-14     cocci
x86_64                randconfig-2100-20261004    gcc-14     cocci
x86_64                randconfig-2101-20261001    gcc-14     cocci
x86_64                randconfig-2101-20261004    clang-22   cocci
x86_64                randconfig-2101-20261004    gcc-14     cocci
x86_64                randconfig-2102-20261001    gcc-14     cocci
x86_64                randconfig-2102-20261004    gcc-14     cocci
x86_64                randconfig-2103-20261001    gcc-14     cocci
x86_64                randconfig-2103-20261004    gcc-14     cocci
x86_64                randconfig-2200-20261001    clang-22   smatch
x86_64                randconfig-2200-20261004    gcc-14     smatch
x86_64                randconfig-2300-20261001    gcc-14     sparse
x86_64                randconfig-2300-20261004    clang-22   sparse
x86_64                randconfig-2301-20261001    gcc-14     sparse
x86_64                randconfig-2301-20261004    clang-22   sparse
x86_64                randconfig-2302-20261001    gcc-14     sparse
x86_64                randconfig-2302-20261004    clang-22   sparse
x86_64               randconfig-r2101-20261004    gcc-14     cocci
x86_64               randconfig-r2107-20261004    gcc-10.5.0 cocci
x86_64               randconfig-r2301-20261004    clang-22   sparse
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
xtensa                randconfig-1000-20261005    clang-24
xtensa                randconfig-1001-20261005    clang-24
xtensa                randconfig-2000-20261001    clang-24
xtensa                randconfig-2000-20261004    clang-17
xtensa                randconfig-2001-20261001    clang-24
xtensa                randconfig-2001-20261004    clang-17
xtensa               randconfig-r2104-20261001    gcc-8.5.0  cocci
xtensa               randconfig-r2106-20261004    gcc-10.5.0 cocci
xtensa               randconfig-r2300-20261004    gcc-16.1.0 sparse
xtensa               randconfig-r2305-20261004    gcc-8.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
