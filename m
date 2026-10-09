Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F184A3843
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 08:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533583; cv=none; b=VsD9v63T0T77eKQSIvFuWzo47JnYGMEFjr18J4rNraDJASFGRRrau1cxzhpJ+bmQ4bzlLADiuanJJPpnNHcIFDIu36JOBtZ4lAz1n2P0OS+ApWIQeBDXjEzFovsWe/yrFQUZq3Qysmcd8lArK01o9ZE5OPAJjwMko2zZrnu2Q0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533583; c=relaxed/simple;
	bh=Lg+sBcOOfIK8ZpWrX1araej/cD8zTIUPHWUyfzruX14=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iH7EG03uwMUVrJ55DoEByNgXw6o1g6trixe0rERiUy3Z5YhoYDcakYpFSHy4A8j4vyw3SBdRp0ZdMnM+qEuO+Y7HdJO5qZwVRPXX+ETUaIwg+uF+mBoWkawQjZJnqOnvOW3coW9YePmj2IGLmJDXpMoIWRpKU7La7P8+GopbKmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6JbxUsf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6JbxUsf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791533575; x=1823069575;
  h=date:from:to:cc:subject:message-id;
  bh=Lg+sBcOOfIK8ZpWrX1araej/cD8zTIUPHWUyfzruX14=;
  b=F6JbxUsfqjrQMEDY1+NFaUNSUHCVjNs8/yrnQKBiDftvCs56x5R2/VPw
   NOzxWrRBH0bkAu+K9OhSyTZBo6XAo+oznTaHTn7qlPtSz/XU1oQgiA+Pp
   IB5fHZL+oInZsyQbDxk/VTMFOOozddhyPKKklDDYzoaPt4WVsX/t/mL85
   Ld7TMjomNcwoj28VzTPTzVBwEuWzzdVJJAGuJDgw0YyH6wWETXXBU/A71
   rNGdHp/PJgkSXhv95YiZjb5qEqMqqP8ucx2kTEAiTwn0ulhSqDutg/RNc
   Etdn51nxabGQFHag3UY46Tl0BTIP1t7pZFldNAfQlsxdrDRSx94Hn14Mk
   w==;
X-CSE-ConnectionGUID: yf4Ccy4sTiiNvz9oRqa2VA==
X-CSE-MsgGUID: Gb+t/TodS+amUyQmeBcS4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="225439"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="225439"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:12:54 -0700
X-CSE-ConnectionGUID: nfwyDpHFSDqVESHSdu1ELw==
X-CSE-MsgGUID: eaUTHbv0SB6YPDCOqzhSAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="250961"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Oct 2026 01:12:53 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF5ij-000000005Um-1Gr1;
	Fri, 09 Oct 2026 08:12:49 +0000
Date: Fri, 09 Oct 2026 16:11:54 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media:next] BUILD SUCCESS
 8e26d4c20ed218db6c3123480a4a4e2545680566
Message-ID: <202610091649.7velQ7EC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media.git next
branch HEAD: 8e26d4c20ed218db6c3123480a4a4e2545680566  media: hantro: disable runtime PM before hardware teardown

elapsed time: 5715m

configs tested: 496
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2102-20261008    clang-22   cocci
alpha                randconfig-r2102-20261008    gcc-8.5.0  cocci
alpha                randconfig-r2106-20261008    clang-24   cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                          haps_hs_defconfig    gcc-16.1.0
arc                   randconfig-1000-20261005    gcc-8.5.0
arc                   randconfig-1000-20261009    gcc-10.5.0
arc                   randconfig-1001-20261005    gcc-8.5.0
arc                   randconfig-1001-20261009    gcc-10.5.0
arc                  randconfig-r2105-20261005    gcc-9.5.0  cocci
arc                  randconfig-r2202-20261005    gcc-14.3.0 smatch
arc                  randconfig-r2202-20261008    gcc-15.2.0 smatch
arc                  randconfig-r2300-20261008    clang-24   sparse
arc                  randconfig-r2303-20261008    gcc-10.5.0 sparse
arc                  randconfig-r2304-20261008    clang-24   sparse
arc                  randconfig-r2304-20261008    gcc-16.1.0 sparse
arc                  randconfig-r2306-20261005    gcc-15.2.0 sparse
arc                  randconfig-r2309-20261008    gcc-14.3.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                          bcm2835_defconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                             mps2_defconfig    clang-24
arm                           pxa3xx_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261005    gcc-8.5.0
arm                   randconfig-1000-20261009    gcc-10.5.0
arm                   randconfig-1001-20261005    gcc-8.5.0
arm                   randconfig-1001-20261009    gcc-10.5.0
arm                   randconfig-1002-20261005    gcc-8.5.0
arm                   randconfig-1002-20261009    gcc-10.5.0
arm                   randconfig-1003-20261005    gcc-8.5.0
arm                   randconfig-1003-20261009    gcc-10.5.0
arm                  randconfig-r2101-20261008    gcc-8.5.0  cocci
arm                  randconfig-r2104-20261008    gcc-16.1.0 cocci
arm                  randconfig-r2107-20261008    gcc-16.1.0 cocci
arm                  randconfig-r2107-20261008    gcc-8.5.0  cocci
arm                  randconfig-r2200-20261008    clang-17   smatch
arm                  randconfig-r2201-20261008    gcc-8.5.0  smatch
arm                  randconfig-r2300-20261007    clang-24   sparse
arm                  randconfig-r2300-20261008    clang-22   sparse
arm                  randconfig-r2300-20261008    gcc-10.5.0 sparse
arm                  randconfig-r2302-20261008    gcc-16.1.0 sparse
arm                  randconfig-r2303-20261008    gcc-16.1.0 sparse
arm                  randconfig-r2307-20261008    gcc-12.5.0 sparse
arm                  randconfig-r2309-20261008    gcc-12.5.0 sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261005    gcc-16.1.0
arm64                 randconfig-1000-20261009    gcc-15.2.0
arm64                 randconfig-1001-20261005    gcc-16.1.0
arm64                 randconfig-1001-20261009    gcc-15.2.0
arm64                 randconfig-1002-20261005    gcc-16.1.0
arm64                 randconfig-1002-20261009    gcc-15.2.0
arm64                 randconfig-1003-20261005    gcc-16.1.0
arm64                 randconfig-1003-20261009    gcc-15.2.0
arm64                randconfig-r2103-20261005    gcc-8.5.0  cocci
arm64                randconfig-r2107-20261005    gcc-13.4.0 cocci
arm64                randconfig-r2107-20261008    clang-24   cocci
arm64                randconfig-r2202-20261005    clang-24   smatch
arm64                randconfig-r2202-20261008    clang-24   smatch
arm64                randconfig-r2303-20261008    clang-22   sparse
arm64                randconfig-r2304-20261008    gcc-10.5.0 sparse
arm64                randconfig-r2305-20261007    clang-24   sparse
arm64                randconfig-r2309-20261005    gcc-15.2.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261005    gcc-16.1.0
csky                  randconfig-1000-20261009    gcc-15.2.0
csky                  randconfig-1001-20261005    gcc-16.1.0
csky                  randconfig-1001-20261009    gcc-15.2.0
csky                 randconfig-r2105-20261008    clang-24   cocci
csky                 randconfig-r2107-20261008    clang-24   cocci
csky                 randconfig-r2300-20261008    gcc-16.1.0 sparse
csky                 randconfig-r2301-20261008    gcc-10.5.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261005    gcc-16.1.0
hexagon               randconfig-1000-20261009    clang-18
hexagon               randconfig-1001-20261005    gcc-16.1.0
hexagon               randconfig-1001-20261009    clang-18
hexagon              randconfig-r2105-20261008    clang-24   cocci
hexagon              randconfig-r2107-20261005    gcc-14.3.0 cocci
hexagon              randconfig-r2201-20261008    clang-24   smatch
hexagon              randconfig-r2304-20261008    gcc-16.1.0 sparse
hexagon              randconfig-r2308-20261005    gcc-15.2.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386        buildonly-randconfig-1000-20261005    clang-22
i386        buildonly-randconfig-1000-20261009    clang-22
i386        buildonly-randconfig-1001-20261005    clang-22
i386        buildonly-randconfig-1001-20261009    clang-22
i386        buildonly-randconfig-1002-20261005    clang-22
i386        buildonly-randconfig-1002-20261009    clang-22
i386        buildonly-randconfig-1003-20261005    clang-22
i386        buildonly-randconfig-1003-20261009    clang-22
i386        buildonly-randconfig-1004-20261005    clang-22
i386        buildonly-randconfig-1004-20261009    clang-22
i386        buildonly-randconfig-1005-20261005    clang-22
i386        buildonly-randconfig-1005-20261009    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261005    clang-22
i386                  randconfig-1000-20261009    clang-22
i386                  randconfig-1001-20261005    clang-22
i386                  randconfig-1001-20261009    clang-22
i386                  randconfig-1002-20261005    clang-22
i386                  randconfig-1002-20261009    clang-22
i386                  randconfig-1003-20261005    clang-22
i386                  randconfig-1003-20261009    clang-22
i386                  randconfig-1004-20261005    clang-22
i386                  randconfig-1004-20261009    clang-22
i386                  randconfig-1005-20261005    clang-22
i386                  randconfig-1005-20261009    clang-22
i386                  randconfig-1006-20261005    clang-22
i386                  randconfig-1006-20261009    clang-22
i386                  randconfig-1007-20261006    gcc-14
i386                  randconfig-1007-20261009    clang-22
i386                  randconfig-1008-20261006    gcc-14
i386                  randconfig-1008-20261009    clang-22
i386                  randconfig-1009-20261006    gcc-14
i386                  randconfig-1009-20261009    clang-22
i386                  randconfig-1010-20261006    gcc-14
i386                  randconfig-1010-20261009    clang-22
i386                  randconfig-1011-20261006    gcc-14
i386                  randconfig-1011-20261009    clang-22
i386                  randconfig-1012-20261006    gcc-14
i386                  randconfig-1012-20261009    clang-22
i386                  randconfig-1013-20261006    gcc-14
i386                  randconfig-1013-20261009    clang-22
i386                  randconfig-2100-20261005    gcc-14     cocci
i386                  randconfig-2100-20261008    clang-22   cocci
i386                  randconfig-2101-20261005    gcc-14     cocci
i386                  randconfig-2101-20261008    clang-22   cocci
i386                  randconfig-2102-20261005    gcc-14     cocci
i386                  randconfig-2102-20261008    clang-22   cocci
i386                  randconfig-2103-20261005    gcc-14     cocci
i386                  randconfig-2103-20261008    clang-22   cocci
i386                  randconfig-2200-20261005    gcc-14     smatch
i386                  randconfig-2200-20261008    clang-22   smatch
i386                  randconfig-2300-20261005    clang-22   sparse
i386                  randconfig-2300-20261005    gcc-14     sparse
i386                  randconfig-2300-20261008    clang-22   sparse
i386                  randconfig-2301-20261005    clang-22   sparse
i386                  randconfig-2301-20261005    gcc-13     sparse
i386                  randconfig-2301-20261008    clang-22   sparse
i386                  randconfig-2302-20261005    clang-22   sparse
i386                  randconfig-2302-20261008    clang-22   sparse
i386                 randconfig-r2100-20261008    gcc-8.5.0  cocci
i386                 randconfig-r2101-20261008    clang-22   cocci
i386                 randconfig-r2102-20261008    clang-22   cocci
i386                 randconfig-r2106-20261005    gcc-14.3.0 cocci
i386                 randconfig-r2300-20261005    gcc-13.4.0 sparse
i386                 randconfig-r2300-20261008    gcc-10.5.0 sparse
i386                 randconfig-r2302-20261008    gcc-16.1.0 sparse
i386                 randconfig-r2305-20261005    gcc-13.4.0 sparse
i386                 randconfig-r2307-20261008    gcc-14     sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261005    gcc-16.1.0
loongarch             randconfig-1000-20261009    clang-18
loongarch             randconfig-1001-20261005    gcc-16.1.0
loongarch             randconfig-1001-20261009    clang-18
loongarch            randconfig-r2100-20261008    gcc-12.5.0 cocci
loongarch            randconfig-r2200-20261005    clang-24   smatch
loongarch            randconfig-r2301-20261007    gcc-15.2.0 sparse
loongarch            randconfig-r2307-20261008    clang-24   sparse
loongarch            randconfig-r2308-20261008    gcc-14.3.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                           hp300_defconfig    clang-24
m68k                 randconfig-r2104-20261005    gcc-14.3.0 cocci
m68k                 randconfig-r2202-20261008    gcc-8.5.0  smatch
m68k                 randconfig-r2306-20261008    gcc-15.2.0 sparse
m68k                 randconfig-r2309-20261008    gcc-14     sparse
microblaze                        alldefconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2102-20261008    clang-24   cocci
microblaze           randconfig-r2103-20261008    gcc-12.5.0 cocci
microblaze           randconfig-r2301-20261008    gcc-16.1.0 sparse
microblaze           randconfig-r2305-20261008    gcc-10.5.0 sparse
microblaze           randconfig-r2305-20261008    gcc-16.1.0 sparse
microblaze           randconfig-r2308-20261008    gcc-14     sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                         bcm63xx_defconfig    clang-24
mips                           eyeq6_defconfig    gcc-16.1.0
mips                 randconfig-r2100-20261008    gcc-8.5.0  cocci
mips                 randconfig-r2107-20261008    gcc-16.1.0 cocci
mips                 randconfig-r2202-20261008    gcc-15.2.0 smatch
mips                 randconfig-r2301-20261008    gcc-10.5.0 sparse
mips                 randconfig-r2306-20261008    clang-24   sparse
nios2                             alldefconfig    clang-24
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261005    gcc-16.1.0
nios2                 randconfig-1000-20261009    clang-18
nios2                 randconfig-1001-20261005    gcc-16.1.0
nios2                 randconfig-1001-20261009    clang-18
nios2                randconfig-r2104-20261008    gcc-8.5.0  cocci
nios2                randconfig-r2201-20261005    gcc-11.5.0 smatch
nios2                randconfig-r2301-20261008    clang-24   sparse
nios2                randconfig-r2301-20261008    gcc-16.1.0 sparse
nios2                randconfig-r2302-20261007    gcc-9.5.0  sparse
nios2                randconfig-r2302-20261008    gcc-10.5.0 sparse
nios2                randconfig-r2305-20261008    gcc-10.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2101-20261008    clang-22   cocci
openrisc             randconfig-r2101-20261008    gcc-12.5.0 cocci
openrisc             randconfig-r2104-20261008    gcc-16.1.0 cocci
openrisc             randconfig-r2200-20261008    gcc-16.1.0 smatch
openrisc             randconfig-r2201-20261005    gcc-16.1.0 smatch
openrisc             randconfig-r2301-20261008    gcc-15.2.0 sparse
openrisc             randconfig-r2303-20261007    gcc-9.5.0  sparse
openrisc             randconfig-r2305-20261008    clang-24   sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261005    gcc-8.5.0
parisc                randconfig-1000-20261009    gcc-8.5.0
parisc                randconfig-1001-20261005    gcc-8.5.0
parisc                randconfig-1001-20261009    gcc-8.5.0
parisc               randconfig-r2101-20261008    gcc-8.5.0  cocci
parisc               randconfig-r2102-20261005    gcc-8.5.0  cocci
parisc               randconfig-r2200-20261008    gcc-13.4.0 smatch
parisc               randconfig-r2300-20261008    gcc-16.1.0 sparse
parisc               randconfig-r2302-20261008    clang-22   sparse
parisc               randconfig-r2308-20261008    gcc-14.3.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                       chrp32_defconfig    clang-24
powerpc                        holly_defconfig    clang-24
powerpc                       ppc44x_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261005    gcc-8.5.0
powerpc               randconfig-1000-20261009    gcc-8.5.0
powerpc               randconfig-1001-20261005    gcc-8.5.0
powerpc               randconfig-1001-20261009    gcc-8.5.0
powerpc              randconfig-r2100-20261008    clang-22   cocci
powerpc              randconfig-r2103-20261008    clang-22   cocci
powerpc              randconfig-r2105-20261008    gcc-16.1.0 cocci
powerpc              randconfig-r2106-20261008    clang-24   cocci
powerpc              randconfig-r2107-20261008    clang-24   cocci
powerpc              randconfig-r2201-20261008    clang-17   smatch
powerpc              randconfig-r2301-20261005    gcc-13.4.0 sparse
powerpc              randconfig-r2305-20261008    clang-22   sparse
powerpc                      tqm8548_defconfig    gcc-16.1.0
powerpc                         warp_defconfig    gcc-16.1.0
powerpc                          wii_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261005    gcc-8.5.0
powerpc64             randconfig-1000-20261009    gcc-8.5.0
powerpc64             randconfig-1001-20261005    gcc-8.5.0
powerpc64             randconfig-1001-20261009    gcc-8.5.0
powerpc64            randconfig-r2102-20261008    gcc-8.5.0  cocci
powerpc64            randconfig-r2103-20261008    clang-22   cocci
powerpc64            randconfig-r2105-20261008    gcc-8.5.0  cocci
powerpc64            randconfig-r2303-20261008    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261005    clang-17
riscv                 randconfig-1000-20261009    gcc-16.1.0
riscv                 randconfig-1001-20261005    clang-17
riscv                 randconfig-1001-20261009    gcc-16.1.0
riscv                 randconfig-2000-20261005    gcc-16.1.0
riscv                 randconfig-2000-20261008    gcc-11.5.0
riscv                 randconfig-2001-20261005    gcc-16.1.0
riscv                 randconfig-2001-20261008    gcc-11.5.0
riscv                randconfig-r2101-20261008    clang-24   cocci
riscv                randconfig-r2103-20261008    gcc-8.5.0  cocci
riscv                randconfig-r2104-20261008    clang-24   cocci
riscv                randconfig-r2105-20261008    clang-24   cocci
riscv                randconfig-r2106-20261005    gcc-8.5.0  cocci
riscv                randconfig-r2106-20261008    gcc-8.5.0  cocci
riscv                randconfig-r2304-20261005    gcc-13.4.0 sparse
riscv                randconfig-r2304-20261007    gcc-8.5.0  sparse
riscv                randconfig-r2304-20261008    clang-22   sparse
riscv                randconfig-r2307-20261008    clang-24   sparse
riscv                randconfig-r2309-20261008    gcc-15.2.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261005    clang-17
s390                  randconfig-1000-20261009    gcc-16.1.0
s390                  randconfig-1001-20261005    clang-17
s390                  randconfig-1001-20261009    gcc-16.1.0
s390                  randconfig-2000-20261005    gcc-16.1.0
s390                  randconfig-2000-20261008    gcc-11.5.0
s390                  randconfig-2001-20261005    gcc-16.1.0
s390                  randconfig-2001-20261008    gcc-11.5.0
s390                 randconfig-r2100-20261008    clang-24   cocci
s390                 randconfig-r2107-20261008    gcc-8.5.0  cocci
s390                 randconfig-r2201-20261008    gcc-11.5.0 smatch
s390                 randconfig-r2202-20261008    clang-17   smatch
s390                 randconfig-r2302-20261008    clang-24   sparse
s390                 randconfig-r2303-20261005    gcc-13.4.0 sparse
s390                 randconfig-r2305-20261008    gcc-16.1.0 sparse
s390                 randconfig-r2306-20261008    gcc-14.3.0 sparse
s390                 randconfig-r2309-20261008    clang-24   sparse
s390                 randconfig-r2309-20261008    gcc-14.3.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                  kfr2r09-romimage_defconfig    clang-24
sh                    randconfig-1000-20261005    clang-17
sh                    randconfig-1000-20261009    gcc-16.1.0
sh                    randconfig-1001-20261005    clang-17
sh                    randconfig-1001-20261009    gcc-16.1.0
sh                    randconfig-2000-20261005    gcc-16.1.0
sh                    randconfig-2000-20261008    gcc-11.5.0
sh                    randconfig-2001-20261005    gcc-16.1.0
sh                    randconfig-2001-20261008    gcc-11.5.0
sh                   randconfig-r2103-20261008    gcc-8.5.0  cocci
sh                   randconfig-r2104-20261005    gcc-16.1.0 cocci
sh                   randconfig-r2105-20261005    gcc-14.3.0 cocci
sh                   randconfig-r2200-20261008    gcc-16.1.0 smatch
sh                   randconfig-r2202-20261008    gcc-16.1.0 smatch
sh                   randconfig-r2303-20261008    gcc-15.2.0 sparse
sh                   randconfig-r2303-20261008    gcc-16.1.0 sparse
sh                   randconfig-r2308-20261008    clang-24   sparse
sh                   randconfig-r2308-20261008    gcc-12.5.0 sparse
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261005    clang-24
sparc                 randconfig-1000-20261009    clang-18
sparc                 randconfig-1001-20261005    clang-24
sparc                 randconfig-1001-20261009    clang-18
sparc                 randconfig-2000-20261005    clang-17
sparc                 randconfig-2000-20261008    gcc-14
sparc                 randconfig-2001-20261005    clang-17
sparc                 randconfig-2001-20261008    gcc-14
sparc                randconfig-r2101-20261005    gcc-8.5.0  cocci
sparc                randconfig-r2103-20261008    clang-24   cocci
sparc                randconfig-r2104-20261008    gcc-8.5.0  cocci
sparc                randconfig-r2105-20261008    gcc-8.5.0  cocci
sparc                randconfig-r2106-20261008    gcc-16.1.0 cocci
sparc                randconfig-r2201-20261008    gcc-8.5.0  smatch
sparc                randconfig-r2300-20261008    gcc-15.2.0 sparse
sparc                randconfig-r2301-20261008    clang-22   sparse
sparc                randconfig-r2302-20261008    gcc-15.2.0 sparse
sparc                randconfig-r2304-20261008    gcc-10.5.0 sparse
sparc                randconfig-r2304-20261008    gcc-15.2.0 sparse
sparc                randconfig-r2307-20261005    gcc-15.2.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261005    clang-24
sparc64               randconfig-1000-20261009    clang-18
sparc64               randconfig-1001-20261005    clang-24
sparc64               randconfig-1001-20261009    clang-18
sparc64               randconfig-2000-20261005    clang-17
sparc64               randconfig-2000-20261008    gcc-14
sparc64               randconfig-2001-20261005    clang-17
sparc64               randconfig-2001-20261008    gcc-14
sparc64              randconfig-r2100-20261008    clang-22   cocci
sparc64              randconfig-r2100-20261008    gcc-8.5.0  cocci
sparc64              randconfig-r2101-20261008    gcc-8.5.0  cocci
sparc64              randconfig-r2102-20261008    gcc-12.5.0 cocci
sparc64              randconfig-r2102-20261008    gcc-8.5.0  cocci
sparc64              randconfig-r2106-20261008    gcc-16.1.0 cocci
sparc64              randconfig-r2302-20261005    gcc-13.4.0 sparse
sparc64              randconfig-r2307-20261008    gcc-15.2.0 sparse
sparc64              randconfig-r2308-20261008    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261005    clang-24
um                    randconfig-1000-20261009    clang-18
um                    randconfig-1001-20261005    clang-24
um                    randconfig-1001-20261009    clang-18
um                    randconfig-2000-20261005    clang-17
um                    randconfig-2000-20261008    gcc-14
um                    randconfig-2001-20261005    clang-17
um                    randconfig-2001-20261008    gcc-14
um                   randconfig-r2104-20261008    clang-24   cocci
um                   randconfig-r2105-20261008    gcc-16.1.0 cocci
um                   randconfig-r2200-20261008    clang-17   smatch
um                   randconfig-r2202-20261008    clang-17   smatch
um                   randconfig-r2306-20261008    clang-24   sparse
um                   randconfig-r2307-20261008    gcc-14.3.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261005    gcc-13
x86_64      buildonly-randconfig-1000-20261009    clang-22
x86_64      buildonly-randconfig-1001-20261005    gcc-13
x86_64      buildonly-randconfig-1001-20261009    clang-22
x86_64      buildonly-randconfig-1002-20261005    gcc-13
x86_64      buildonly-randconfig-1002-20261009    clang-22
x86_64      buildonly-randconfig-1003-20261005    gcc-13
x86_64      buildonly-randconfig-1003-20261009    clang-22
x86_64      buildonly-randconfig-1004-20261005    gcc-13
x86_64      buildonly-randconfig-1004-20261009    clang-22
x86_64      buildonly-randconfig-1005-20261005    gcc-13
x86_64      buildonly-randconfig-1005-20261009    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261005    gcc-14
x86_64                randconfig-1000-20261009    gcc-14
x86_64                randconfig-1001-20261005    gcc-14
x86_64                randconfig-1001-20261009    gcc-14
x86_64                randconfig-1002-20261005    gcc-14
x86_64                randconfig-1002-20261009    gcc-14
x86_64                randconfig-1003-20261005    gcc-14
x86_64                randconfig-1003-20261009    gcc-14
x86_64                randconfig-1004-20261005    gcc-14
x86_64                randconfig-1004-20261009    gcc-14
x86_64                randconfig-1005-20261005    gcc-14
x86_64                randconfig-1005-20261009    gcc-14
x86_64                randconfig-1006-20261005    gcc-14
x86_64                randconfig-1007-20261005    gcc-14
x86_64                randconfig-1008-20261005    gcc-14
x86_64                randconfig-1009-20261005    gcc-14
x86_64                randconfig-1010-20261005    gcc-14
x86_64                randconfig-1011-20261005    gcc-14
x86_64                randconfig-1012-20261006    gcc-14
x86_64                randconfig-1012-20261009    gcc-14
x86_64                randconfig-1013-20261006    gcc-14
x86_64                randconfig-1013-20261009    gcc-14
x86_64                randconfig-1014-20261006    gcc-14
x86_64                randconfig-1014-20261009    gcc-14
x86_64                randconfig-1015-20261006    gcc-14
x86_64                randconfig-1015-20261009    gcc-14
x86_64                randconfig-1016-20261006    gcc-14
x86_64                randconfig-1016-20261009    gcc-14
x86_64                randconfig-1017-20261006    gcc-14
x86_64                randconfig-1017-20261009    gcc-14
x86_64                randconfig-2100-20261005    clang-22   cocci
x86_64                randconfig-2100-20261008    clang-22   cocci
x86_64                randconfig-2101-20261005    clang-22   cocci
x86_64                randconfig-2101-20261008    clang-22   cocci
x86_64                randconfig-2102-20261005    clang-22   cocci
x86_64                randconfig-2102-20261008    clang-22   cocci
x86_64                randconfig-2103-20261005    clang-22   cocci
x86_64                randconfig-2103-20261008    clang-22   cocci
x86_64                randconfig-2200-20261005    clang-22   smatch
x86_64                randconfig-2200-20261007    gcc-14     smatch
x86_64                randconfig-2200-20261008    gcc-14     smatch
x86_64                randconfig-2300-20261005    clang-22   sparse
x86_64                randconfig-2300-20261008    clang-22   sparse
x86_64                randconfig-2301-20261005    clang-22   sparse
x86_64                randconfig-2301-20261005    gcc-14     sparse
x86_64                randconfig-2301-20261008    clang-22   sparse
x86_64                randconfig-2302-20261005    clang-22   sparse
x86_64                randconfig-2302-20261008    clang-22   sparse
x86_64               randconfig-r2106-20261008    clang-24   cocci
x86_64               randconfig-r2303-20261008    gcc-10.5.0 sparse
x86_64               randconfig-r2305-20261008    gcc-15.2.0 sparse
x86_64               randconfig-r2306-20261008    gcc-14     sparse
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
xtensa                randconfig-1000-20261009    clang-18
xtensa                randconfig-1001-20261005    clang-24
xtensa                randconfig-1001-20261009    clang-18
xtensa                randconfig-2000-20261005    clang-17
xtensa                randconfig-2000-20261008    gcc-14
xtensa                randconfig-2001-20261005    clang-17
xtensa                randconfig-2001-20261008    gcc-14
xtensa               randconfig-r2100-20261005    gcc-8.5.0  cocci
xtensa               randconfig-r2201-20261008    gcc-13.4.0 smatch
xtensa               randconfig-r2306-20261008    gcc-12.5.0 sparse
xtensa               randconfig-r2307-20261008    gcc-14.3.0 sparse
xtensa               randconfig-r2308-20261008    gcc-15.2.0 sparse
xtensa               randconfig-r2309-20261008    clang-24   sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
