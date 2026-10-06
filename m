Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EC93A6B67
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 09:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278361; cv=none; b=r1KsqdY5JkQmhOTDLMIUgZul/xgl+2PlUWxdFklT3ZLVb4BqMeVfwAMYd13aVeIuuT5R6ZUq/V9QrTBK3f1o35iqz3Sgt0YHwYYscFTx+1LQJPYO41RTKFcBWI9a9lr8ECA/HK+hwPyvBKocLw9Eh4d/MJhC+QXNCi/xZMhs0DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278361; c=relaxed/simple;
	bh=hbzWsUHoG7lTd7RYU+7POSFye3W4XZyRw6pHt9mY8C8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ELzDbBcpugipYOSlfpa/pKK2NoKPdJlZNIXZqiwS1lgJ+oreV0rvowvnF+/v5tbbT82d4W+27yTdlfm+GYbWqls5a+26fGFjlb7V1lL+yDxa84h8vUDL8EknW7Aya+UX2Win++Pp5tjSEvLSHMYUu1+tRpV/c8+1AVOhcf9mdsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kln8r78S; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kln8r78S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791278355; x=1822814355;
  h=date:from:to:cc:subject:message-id;
  bh=hbzWsUHoG7lTd7RYU+7POSFye3W4XZyRw6pHt9mY8C8=;
  b=Kln8r78SL2GQCTvZbiSz4VAoTxkXr23eDMK7zEfFo9RxJsKYzS1vgVFb
   JJA9jBumTxcqUnU4jOuX3e4wCq5xQNLGcgkOax8ERssPojyNxgCSN/LzI
   Z2ZQ4u9WccOGOhqUdcoNSYrHGcMmM+IabSTTE4WFH/1MExLXLPIabj+7Y
   4PH2gm0r3WvVrg4r1Vcv0YxdD4zpR9wIkPoLVI0ja9pCXvJjdq2wG83VU
   opE7A/TRCQ/EI5Ls+m4dZJbeV1Jo3Xv+4P33AjM2AoVeGvtEWs8guOnZ5
   hehCoaBsXWnomgM6NJ4xbMMWLtrcMyYVaVIqrFqU4FQPrqmGZsfzzXJ+A
   w==;
X-CSE-ConnectionGUID: I2k4MFxnRGqrDIMbaAky0A==
X-CSE-MsgGUID: vEJbzJynSpeY7V2qLEaucQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="110424"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="110424"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 02:19:12 -0700
X-CSE-ConnectionGUID: wRt2UPqPTNq+XobNsJNJfw==
X-CSE-MsgGUID: O0U2KAmnRVaX8qJJKXy/Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="1124137"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 06 Oct 2026 02:19:10 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE1KF-000000001OC-2IxP;
	Tue, 06 Oct 2026 09:19:07 +0000
Date: Tue, 06 Oct 2026 17:18:50 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media:next] BUILD SUCCESS
 89a3d2a2237e017cdbefcb036db71ce74e67faf5
Message-ID: <202610061746.eqUXhtKd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media.git next
branch HEAD: 89a3d2a2237e017cdbefcb036db71ce74e67faf5  media: iris: fix 64-bit division in iris_set_slice_count()

elapsed time: 1498m

configs tested: 448
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    clang-24
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2102-20261002    gcc-16.1.0 cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                      haps_hs_smp_defconfig    clang-24
arc                   randconfig-1000-20261006    clang-24
arc                   randconfig-1001-20261006    clang-24
arc                  randconfig-r2100-20261002    gcc-16.1.0 cocci
arc                  randconfig-r2300-20261002    gcc-14     sparse
arc                  randconfig-r2300-20261002    gcc-14.3.0 sparse
arc                  randconfig-r2300-20261005    gcc-11.5.0 sparse
arc                  randconfig-r2306-20261002    gcc-16.1.0 sparse
arc                  randconfig-r2306-20261005    gcc-8.5.0  sparse
arc                  randconfig-r2308-20261005    gcc-14.3.0 sparse
arc                  randconfig-r2309-20261002    clang-20   sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                          lpc32xx_defconfig    gcc-16.1.0
arm                         mvebu_v7_defconfig    clang-24
arm                         mvebu_v7_defconfig    gcc-16.1.0
arm                              mxs_defconfig    gcc-16.1.0
arm                           pxa3xx_defconfig    clang-24
arm                   randconfig-1000-20261006    clang-24
arm                   randconfig-1001-20261006    clang-24
arm                   randconfig-1002-20261006    clang-24
arm                   randconfig-1003-20261006    clang-24
arm                  randconfig-r2103-20261005    clang-24   cocci
arm                  randconfig-r2106-20261002    clang-24   cocci
arm                  randconfig-r2106-20261002    gcc-16.1.0 cocci
arm                  randconfig-r2201-20261005    clang-24   smatch
arm                  randconfig-r2309-20261003    gcc-8.5.0  sparse
arm                         realview_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261006    gcc-16.1.0
arm64                 randconfig-1001-20261006    gcc-16.1.0
arm64                 randconfig-1002-20261006    gcc-16.1.0
arm64                 randconfig-1003-20261006    gcc-16.1.0
arm64                randconfig-r2102-20261005    clang-24   cocci
arm64                randconfig-r2104-20261003    gcc-11.5.0 cocci
arm64                randconfig-r2104-20261005    gcc-15.2.0 cocci
arm64                randconfig-r2107-20261002    clang-24   cocci
arm64                randconfig-r2202-20261003    clang-24   smatch
arm64                randconfig-r2202-20261005    clang-24   smatch
arm64                randconfig-r2300-20261003    gcc-9.5.0  sparse
arm64                randconfig-r2307-20261003    gcc-8.5.0  sparse
arm64                randconfig-r2308-20261005    clang-24   sparse
arm64                randconfig-r2309-20261002    gcc-16.1.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261006    gcc-16.1.0
csky                  randconfig-1001-20261006    gcc-16.1.0
csky                 randconfig-r2300-20261003    gcc-14     sparse
csky                 randconfig-r2301-20261002    gcc-16.1.0 sparse
csky                 randconfig-r2307-20261003    gcc-11.5.0 sparse
csky                 randconfig-r2307-20261005    gcc-16.1.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261006    gcc-13.4.0
hexagon               randconfig-1001-20261006    gcc-13.4.0
hexagon              randconfig-r2103-20261002    gcc-16.1.0 cocci
hexagon              randconfig-r2202-20261002    clang-18   smatch
hexagon              randconfig-r2302-20261002    gcc-16.1.0 sparse
hexagon              randconfig-r2304-20261003    gcc-14     sparse
hexagon              randconfig-r2309-20261005    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261006    gcc-14
i386        buildonly-randconfig-1001-20261006    gcc-14
i386        buildonly-randconfig-1002-20261006    gcc-14
i386        buildonly-randconfig-1003-20261006    gcc-14
i386        buildonly-randconfig-1004-20261006    gcc-14
i386        buildonly-randconfig-1005-20261006    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261006    gcc-14
i386                  randconfig-1001-20261006    gcc-14
i386                  randconfig-1002-20261006    gcc-14
i386                  randconfig-1003-20261006    gcc-14
i386                  randconfig-1004-20261006    gcc-14
i386                  randconfig-1005-20261006    gcc-14
i386                  randconfig-1006-20261006    gcc-14
i386                  randconfig-1007-20261006    gcc-14
i386                  randconfig-1008-20261006    gcc-14
i386                  randconfig-1009-20261006    gcc-14
i386                  randconfig-1010-20261006    gcc-14
i386                  randconfig-1011-20261006    gcc-14
i386                  randconfig-1012-20261006    gcc-14
i386                  randconfig-1013-20261006    gcc-14
i386                  randconfig-2100-20261002    gcc-14     cocci
i386                  randconfig-2100-20261003    gcc-14     cocci
i386                  randconfig-2100-20261005    gcc-14     cocci
i386                  randconfig-2101-20261002    gcc-14     cocci
i386                  randconfig-2101-20261003    gcc-14     cocci
i386                  randconfig-2101-20261005    gcc-14     cocci
i386                  randconfig-2102-20261002    gcc-14     cocci
i386                  randconfig-2102-20261003    gcc-14     cocci
i386                  randconfig-2102-20261005    gcc-14     cocci
i386                  randconfig-2103-20261002    gcc-14     cocci
i386                  randconfig-2103-20261003    gcc-14     cocci
i386                  randconfig-2103-20261005    gcc-14     cocci
i386                  randconfig-2200-20261002    gcc-14     smatch
i386                  randconfig-2200-20261003    gcc-14     smatch
i386                  randconfig-2200-20261005    gcc-14     smatch
i386                  randconfig-2300-20261002    gcc-12     sparse
i386                  randconfig-2300-20261003    clang-22   sparse
i386                  randconfig-2300-20261005    clang-22   sparse
i386                  randconfig-2301-20261002    gcc-12     sparse
i386                  randconfig-2301-20261003    clang-22   sparse
i386                  randconfig-2301-20261005    clang-22   sparse
i386                  randconfig-2302-20261002    gcc-12     sparse
i386                  randconfig-2302-20261003    clang-22   sparse
i386                  randconfig-2302-20261005    clang-22   sparse
i386                 randconfig-r2103-20261003    gcc-13.4.0 cocci
i386                 randconfig-r2103-20261005    gcc-16.1.0 cocci
i386                 randconfig-r2107-20261003    clang-21   cocci
i386                 randconfig-r2107-20261005    gcc-8.5.0  cocci
i386                 randconfig-r2201-20261002    gcc-14     smatch
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261006    gcc-13.4.0
loongarch             randconfig-1001-20261006    gcc-13.4.0
loongarch            randconfig-r2102-20261003    gcc-13.4.0 cocci
loongarch            randconfig-r2106-20261005    gcc-16.1.0 cocci
loongarch            randconfig-r2200-20261002    gcc-16.1.0 smatch
loongarch            randconfig-r2201-20261003    gcc-16.1.0 smatch
loongarch            randconfig-r2202-20261002    gcc-16.1.0 smatch
loongarch            randconfig-r2304-20261002    clang-24   sparse
loongarch            randconfig-r2305-20261002    gcc-14     sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    clang-24
m68k                        bvme6000_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                         m5307c3_defconfig    gcc-16.1.0
m68k                          nettel_defconfig    gcc-16.1.0
m68k                 randconfig-r2101-20261003    gcc-12.5.0 cocci
m68k                 randconfig-r2102-20261005    gcc-16.1.0 cocci
m68k                 randconfig-r2103-20261002    clang-17   cocci
m68k                 randconfig-r2103-20261003    gcc-12.5.0 cocci
m68k                 randconfig-r2105-20261005    gcc-8.5.0  cocci
m68k                 randconfig-r2106-20261005    gcc-8.5.0  cocci
m68k                 randconfig-r2201-20261003    gcc-9.5.0  smatch
m68k                 randconfig-r2202-20261003    gcc-11.5.0 smatch
m68k                 randconfig-r2301-20261003    gcc-14     sparse
m68k                 randconfig-r2301-20261005    gcc-11.5.0 sparse
m68k                 randconfig-r2306-20261005    gcc-14.3.0 sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2100-20261005    clang-24   cocci
microblaze           randconfig-r2101-20261005    clang-24   cocci
microblaze           randconfig-r2104-20261005    gcc-16.1.0 cocci
microblaze           randconfig-r2107-20261005    gcc-15.2.0 cocci
microblaze           randconfig-r2200-20261003    gcc-8.5.0  smatch
microblaze           randconfig-r2200-20261005    gcc-9.5.0  smatch
microblaze           randconfig-r2301-20261002    gcc-8.5.0  sparse
microblaze           randconfig-r2305-20261003    gcc-9.5.0  sparse
microblaze           randconfig-r2307-20261002    gcc-16.1.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                       loongson1_defconfig    gcc-16.1.0
mips                         omega2p_defconfig    gcc-16.1.0
mips                 randconfig-r2101-20261003    gcc-13.4.0 cocci
mips                 randconfig-r2105-20261005    gcc-16.1.0 cocci
mips                 randconfig-r2200-20261002    gcc-8.5.0  smatch
mips                 randconfig-r2200-20261003    clang-24   smatch
mips                 randconfig-r2303-20261003    gcc-9.5.0  sparse
mips                 randconfig-r2303-20261005    gcc-11.5.0 sparse
mips                 randconfig-r2305-20261002    clang-17   sparse
mips                 randconfig-r2307-20261005    clang-24   sparse
mips                 randconfig-r2308-20261003    gcc-8.5.0  sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261006    gcc-13.4.0
nios2                 randconfig-1001-20261006    gcc-13.4.0
nios2                randconfig-r2101-20261002    clang-17   cocci
nios2                randconfig-r2104-20261005    gcc-8.5.0  cocci
nios2                randconfig-r2106-20261005    gcc-15.2.0 cocci
nios2                randconfig-r2303-20261005    gcc-9.5.0  sparse
nios2                randconfig-r2306-20261003    gcc-8.5.0  sparse
nios2                randconfig-r2308-20261005    gcc-11.5.0 sparse
nios2                randconfig-r2309-20261005    gcc-8.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc          de0_nano_multicore_defconfig    gcc-16.1.0
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2302-20261003    gcc-9.5.0  sparse
openrisc             randconfig-r2303-20261002    gcc-16.1.0 sparse
openrisc             randconfig-r2306-20261003    gcc-11.5.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261006    gcc-14.3.0
parisc                randconfig-1001-20261006    gcc-14.3.0
parisc               randconfig-r2101-20261005    gcc-16.1.0 cocci
parisc               randconfig-r2102-20261003    gcc-12.5.0 cocci
parisc               randconfig-r2104-20261002    gcc-16.1.0 cocci
parisc               randconfig-r2105-20261005    gcc-15.2.0 cocci
parisc               randconfig-r2300-20261005    gcc-9.5.0  sparse
parisc               randconfig-r2307-20261005    gcc-8.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                  mpc836x_rdk_defconfig    clang-24
powerpc               randconfig-1000-20261006    gcc-14.3.0
powerpc               randconfig-1001-20261006    gcc-14.3.0
powerpc              randconfig-r2102-20261002    clang-17   cocci
powerpc              randconfig-r2104-20261002    clang-24   cocci
powerpc              randconfig-r2104-20261003    clang-21   cocci
powerpc              randconfig-r2107-20261003    gcc-11.5.0 cocci
powerpc              randconfig-r2107-20261005    gcc-16.1.0 cocci
powerpc              randconfig-r2302-20261005    gcc-11.5.0 sparse
powerpc              randconfig-r2303-20261002    gcc-14     sparse
powerpc                      tqm8541_defconfig    gcc-16.1.0
powerpc                      tqm8548_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261006    gcc-14.3.0
powerpc64             randconfig-1001-20261006    gcc-14.3.0
powerpc64            randconfig-r2106-20261003    gcc-11.5.0 cocci
powerpc64            randconfig-r2200-20261005    gcc-12.5.0 smatch
powerpc64            randconfig-r2302-20261002    gcc-12.5.0 sparse
powerpc64            randconfig-r2305-20261002    gcc-16.1.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                     nommu_virt_defconfig    clang-24
riscv                 randconfig-1000-20261006    clang-24
riscv                 randconfig-1001-20261006    clang-24
riscv                 randconfig-2000-20261002    gcc-9.5.0
riscv                 randconfig-2000-20261003    gcc-16.1.0
riscv                 randconfig-2000-20261005    gcc-16.1.0
riscv                 randconfig-2001-20261002    gcc-9.5.0
riscv                 randconfig-2001-20261003    gcc-16.1.0
riscv                 randconfig-2001-20261005    gcc-16.1.0
riscv                randconfig-r2100-20261005    gcc-13.4.0 cocci
riscv                randconfig-r2101-20261005    gcc-13.4.0 cocci
riscv                randconfig-r2102-20261005    gcc-13.4.0 cocci
riscv                randconfig-r2202-20261005    clang-24   smatch
riscv                randconfig-r2301-20261003    gcc-9.5.0  sparse
riscv                randconfig-r2306-20261005    clang-24   sparse
riscv                randconfig-r2306-20261005    gcc-8.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261006    clang-24
s390                  randconfig-1001-20261006    clang-24
s390                  randconfig-2000-20261002    gcc-9.5.0
s390                  randconfig-2000-20261003    gcc-16.1.0
s390                  randconfig-2000-20261005    gcc-16.1.0
s390                  randconfig-2001-20261002    gcc-9.5.0
s390                  randconfig-2001-20261003    gcc-16.1.0
s390                  randconfig-2001-20261005    gcc-16.1.0
s390                 randconfig-r2100-20261002    clang-17   cocci
s390                 randconfig-r2100-20261003    gcc-12.5.0 cocci
s390                 randconfig-r2309-20261003    gcc-11.5.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                           r7780mp_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261006    clang-24
sh                    randconfig-1001-20261006    clang-24
sh                    randconfig-2000-20261002    gcc-9.5.0
sh                    randconfig-2000-20261003    gcc-16.1.0
sh                    randconfig-2000-20261005    gcc-16.1.0
sh                    randconfig-2001-20261002    gcc-9.5.0
sh                    randconfig-2001-20261003    gcc-16.1.0
sh                    randconfig-2001-20261005    gcc-16.1.0
sh                   randconfig-r2100-20261005    gcc-16.1.0 cocci
sh                   randconfig-r2301-20261005    gcc-9.5.0  sparse
sh                   randconfig-r2302-20261005    gcc-9.5.0  sparse
sh                   randconfig-r2304-20261003    gcc-9.5.0  sparse
sh                            se7619_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261006    gcc-14
sparc                 randconfig-1001-20261006    gcc-14
sparc                 randconfig-2000-20261002    clang-24
sparc                 randconfig-2000-20261003    gcc-14
sparc                 randconfig-2000-20261004    gcc-8.5.0
sparc                 randconfig-2000-20261005    clang-17
sparc                 randconfig-2001-20261002    clang-24
sparc                 randconfig-2001-20261003    gcc-14
sparc                 randconfig-2001-20261004    gcc-15.2.0
sparc                 randconfig-2001-20261005    clang-17
sparc                randconfig-r2105-20261003    gcc-11.5.0 cocci
sparc                randconfig-r2107-20261002    gcc-16.1.0 cocci
sparc                randconfig-r2201-20261002    gcc-8.5.0  smatch
sparc                randconfig-r2201-20261005    gcc-15.2.0 smatch
sparc                randconfig-r2304-20261005    gcc-11.5.0 sparse
sparc                randconfig-r2308-20261005    gcc-8.5.0  sparse
sparc                randconfig-r2309-20261005    clang-24   sparse
sparc                randconfig-r2309-20261005    gcc-14.3.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261006    gcc-14
sparc64               randconfig-1001-20261006    gcc-14
sparc64               randconfig-2000-20261002    clang-24
sparc64               randconfig-2000-20261003    gcc-14
sparc64               randconfig-2000-20261004    clang-20
sparc64               randconfig-2000-20261005    clang-17
sparc64               randconfig-2001-20261002    clang-24
sparc64               randconfig-2001-20261003    gcc-14
sparc64               randconfig-2001-20261004    gcc-10.5.0
sparc64               randconfig-2001-20261005    clang-17
sparc64              randconfig-r2105-20261002    clang-24   cocci
sparc64              randconfig-r2105-20261002    gcc-16.1.0 cocci
sparc64              randconfig-r2106-20261003    clang-21   cocci
sparc64              randconfig-r2200-20261002    gcc-15.2.0 smatch
sparc64              randconfig-r2302-20261002    gcc-14     sparse
sparc64              randconfig-r2304-20261002    gcc-16.1.0 sparse
sparc64              randconfig-r2306-20261002    clang-20   sparse
sparc64              randconfig-r2308-20261002    clang-20   sparse
sparc64              randconfig-r2308-20261002    gcc-16.1.0 sparse
um                                alldefconfig    gcc-16.1.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261006    gcc-14
um                    randconfig-1001-20261006    gcc-14
um                    randconfig-2000-20261002    clang-24
um                    randconfig-2000-20261003    gcc-14
um                    randconfig-2000-20261004    gcc-14
um                    randconfig-2000-20261005    clang-17
um                    randconfig-2001-20261002    clang-24
um                    randconfig-2001-20261003    gcc-14
um                    randconfig-2001-20261004    clang-17
um                    randconfig-2001-20261005    clang-17
um                   randconfig-r2105-20261003    clang-21   cocci
um                   randconfig-r2301-20261002    gcc-14     sparse
um                   randconfig-r2304-20261005    gcc-9.5.0  sparse
um                   randconfig-r2305-20261005    gcc-11.5.0 sparse
um                   randconfig-r2307-20261005    gcc-14.3.0 sparse
um                   randconfig-r2308-20261003    gcc-11.5.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-22   checkkconfigsymbols
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261006    gcc-14
x86_64      buildonly-randconfig-1001-20261006    gcc-14
x86_64      buildonly-randconfig-1002-20261006    gcc-14
x86_64      buildonly-randconfig-1003-20261006    gcc-14
x86_64      buildonly-randconfig-1004-20261006    gcc-14
x86_64      buildonly-randconfig-1005-20261006    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261006    gcc-14
x86_64                randconfig-1001-20261006    gcc-14
x86_64                randconfig-1002-20261006    gcc-14
x86_64                randconfig-1003-20261006    gcc-14
x86_64                randconfig-1004-20261006    gcc-14
x86_64                randconfig-1005-20261006    gcc-14
x86_64                randconfig-1006-20261006    gcc-14
x86_64                randconfig-1007-20261006    gcc-14
x86_64                randconfig-1008-20261006    gcc-14
x86_64                randconfig-1009-20261006    gcc-14
x86_64                randconfig-1010-20261006    gcc-14
x86_64                randconfig-1011-20261006    gcc-14
x86_64                randconfig-1012-20261006    gcc-14
x86_64                randconfig-1013-20261006    gcc-14
x86_64                randconfig-1014-20261006    gcc-14
x86_64                randconfig-1015-20261006    gcc-14
x86_64                randconfig-1016-20261006    gcc-14
x86_64                randconfig-1017-20261006    gcc-14
x86_64                randconfig-2100-20261002    gcc-14     cocci
x86_64                randconfig-2100-20261003    clang-22   cocci
x86_64                randconfig-2100-20261004    gcc-14     cocci
x86_64                randconfig-2100-20261005    clang-22   cocci
x86_64                randconfig-2101-20261002    gcc-14     cocci
x86_64                randconfig-2101-20261003    clang-22   cocci
x86_64                randconfig-2101-20261004    clang-22   cocci
x86_64                randconfig-2101-20261005    clang-22   cocci
x86_64                randconfig-2102-20261002    gcc-14     cocci
x86_64                randconfig-2102-20261003    clang-22   cocci
x86_64                randconfig-2102-20261004    gcc-14     cocci
x86_64                randconfig-2102-20261005    clang-22   cocci
x86_64                randconfig-2103-20261002    gcc-14     cocci
x86_64                randconfig-2103-20261003    clang-22   cocci
x86_64                randconfig-2103-20261004    gcc-14     cocci
x86_64                randconfig-2103-20261005    clang-22   cocci
x86_64                randconfig-2200-20261002    clang-22   smatch
x86_64                randconfig-2200-20261003    gcc-14     smatch
x86_64                randconfig-2200-20261005    clang-22   smatch
x86_64                randconfig-2300-20261002    gcc-12     sparse
x86_64                randconfig-2300-20261003    clang-22   sparse
x86_64                randconfig-2300-20261005    clang-22   sparse
x86_64                randconfig-2301-20261002    gcc-12     sparse
x86_64                randconfig-2301-20261003    clang-22   sparse
x86_64                randconfig-2301-20261005    clang-22   sparse
x86_64                randconfig-2302-20261002    gcc-12     sparse
x86_64                randconfig-2302-20261003    clang-22   sparse
x86_64                randconfig-2302-20261005    clang-22   sparse
x86_64               randconfig-r2101-20261002    gcc-16.1.0 cocci
x86_64               randconfig-r2103-20261005    gcc-13.4.0 cocci
x86_64               randconfig-r2303-20261003    gcc-14     sparse
x86_64               randconfig-r2305-20261003    gcc-14     sparse
x86_64               randconfig-r2305-20261005    gcc-9.5.0  sparse
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
xtensa                randconfig-1000-20261006    gcc-14
xtensa                randconfig-1001-20261006    gcc-14
xtensa                randconfig-2000-20261002    clang-24
xtensa                randconfig-2000-20261003    gcc-14
xtensa                randconfig-2000-20261004    gcc-8.5.0
xtensa                randconfig-2000-20261005    clang-17
xtensa                randconfig-2001-20261002    clang-24
xtensa                randconfig-2001-20261003    gcc-14
xtensa                randconfig-2001-20261004    gcc-9.5.0
xtensa                randconfig-2001-20261005    clang-17
xtensa               randconfig-r2100-20261003    gcc-13.4.0 cocci
xtensa               randconfig-r2201-20261002    gcc-8.5.0  smatch
xtensa               randconfig-r2202-20261005    gcc-10.5.0 smatch
xtensa               randconfig-r2300-20261002    gcc-16.1.0 sparse
xtensa               randconfig-r2302-20261003    gcc-14     sparse
xtensa               randconfig-r2303-20261002    gcc-12.5.0 sparse
xtensa               randconfig-r2304-20261002    gcc-14     sparse
xtensa               randconfig-r2307-20261002    clang-20   sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
