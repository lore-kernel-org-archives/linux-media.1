Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937C93D76
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 01:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791683579; cv=none; b=Wyz8DlufmdzbDpXUodkcyqvGDnbbd0qwbJ3fxOy2Uwttiw6dTQkVAq8SP+xI0B1hvmEejDZYGBcW9ToqYvhLpIjmVV2unoCluKgVNCricbJTNiA5ZfkArsmgvtyqnH0HZrzKw02TUQxtIsL4dGjYhgr+c0pJssCxLwpyQPWTdaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791683579; c=relaxed/simple;
	bh=m2oKtltTniN7l0gbZlcXOHp691JRYED+EfzNTzFRhl8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=avndf/35OKFa6+VzDYosgtVUMvMHW4NwxhtzZpDl7QBSYPyyv68uBzsyXWiQfBxWxZ5hOqS586aYsH6HTJIafHEkGz4xsm1tZxmilyYJZ75mUwZETEmohK0vFkpJxm0x7Qq9j1ybMJFSfsdMBkta0kg2lNpUq1qyqVHGay3zi1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ji29a6e8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ji29a6e8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791683578; x=1823219578;
  h=date:from:to:cc:subject:message-id;
  bh=m2oKtltTniN7l0gbZlcXOHp691JRYED+EfzNTzFRhl8=;
  b=Ji29a6e8f2ydrwAgQFOgDaeJzPOV/FTRlAGd0HgUNsIUXoR+dCVys3yc
   qXMVZqw8+sQYeZeDPHDHdxC7c+i+o+x/kb4cLx3VRBNqztUtlI/T39NXV
   4XyXWsAWY6xLw6WEd3cNSxF0xh1dBGO3r5pzZOTmeXZfCBIZ8vl68jxmK
   tIsfk+1AXYUVZyN/X1AY+3T7vm8XNgBL64cRHMp66kzixt6PC68h3IlKh
   0pAvmWPt+lfM2E1MkGXJFWIQWq51ThCUSR4lUK9z7B2jY8xGek0DszQ4O
   f+0sAXk1+Med/zsjZLvu7K90ch8vPjUqXEaV0zsFcMGMohtxq5Ta+/bLR
   w==;
X-CSE-ConnectionGUID: eLrQmurqRuiKmRyeVBVy6A==
X-CSE-MsgGUID: ZCFVlEyZRDum1reRes0DEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="426688"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="426688"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 18:52:57 -0700
X-CSE-ConnectionGUID: PHnhmrNRR/uMEZiPAWLdEA==
X-CSE-MsgGUID: IC+uthnWRl67rpIZYdhlag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="969760"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Oct 2026 18:52:56 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFik9-00000000AEY-0ztS;
	Sun, 11 Oct 2026 01:52:53 +0000
Date: Sun, 11 Oct 2026 09:52:24 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 d7e7bca7169873b46e857c025c10f3336c1258d8
Message-ID: <202610110920.GINAWyu7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: d7e7bca7169873b46e857c025c10f3336c1258d8  media: i2c: imx576: Fix line length register

elapsed time: 1226m

configs tested: 374
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2100-20261009    clang-24   cocci
alpha                randconfig-r2102-20261010    gcc-12.5.0 cocci
alpha                randconfig-r2202-20261010    gcc-8.5.0  smatch
alpha                randconfig-r2307-20261009    gcc-11.5.0 sparse
alpha                randconfig-r2308-20261009    gcc-11.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261010    gcc-8.5.0
arc                   randconfig-1000-20261011    clang-24
arc                   randconfig-1001-20261010    gcc-8.5.0
arc                   randconfig-1001-20261011    clang-24
arc                  randconfig-r2200-20261010    gcc-14.3.0 smatch
arc                  randconfig-r2300-20261009    clang-22   sparse
arc                  randconfig-r2305-20261010    clang-17   sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                           moxart_defconfig    clang-24
arm                          nhk8815_defconfig    clang-24
arm                   randconfig-1000-20261010    gcc-8.5.0
arm                   randconfig-1000-20261011    clang-24
arm                   randconfig-1001-20261010    gcc-8.5.0
arm                   randconfig-1001-20261011    clang-24
arm                   randconfig-1002-20261010    gcc-8.5.0
arm                   randconfig-1002-20261011    clang-24
arm                   randconfig-1003-20261010    gcc-8.5.0
arm                   randconfig-1003-20261011    clang-24
arm                  randconfig-r2202-20261009    clang-24   smatch
arm                  randconfig-r2301-20261009    gcc-8.5.0  sparse
arm                  randconfig-r2306-20261010    gcc-14     sparse
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261010    gcc-10.5.0
arm64                 randconfig-1001-20261010    gcc-10.5.0
arm64                 randconfig-1002-20261010    gcc-10.5.0
arm64                 randconfig-1003-20261010    gcc-10.5.0
arm64                randconfig-r2104-20261010    gcc-14     cocci
arm64                randconfig-r2301-20261010    gcc-15.2.0 sparse
arm64                randconfig-r2304-20261010    gcc-16.1.0 sparse
arm64                randconfig-r2306-20261009    clang-24   sparse
arm64                randconfig-r2309-20261009    gcc-11.5.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261010    gcc-10.5.0
csky                  randconfig-1001-20261010    gcc-10.5.0
csky                 randconfig-r2103-20261010    clang-24   cocci
csky                 randconfig-r2103-20261010    gcc-16.1.0 cocci
csky                 randconfig-r2104-20261009    gcc-16.1.0 cocci
csky                 randconfig-r2300-20261010    gcc-16.1.0 sparse
csky                 randconfig-r2304-20261010    gcc-15.2.0 sparse
csky                 randconfig-r2309-20261009    clang-24   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261010    clang-17
hexagon               randconfig-1001-20261010    clang-17
hexagon              randconfig-r2100-20261010    clang-24   cocci
hexagon              randconfig-r2103-20261010    gcc-12.5.0 cocci
hexagon              randconfig-r2104-20261009    gcc-16.1.0 cocci
hexagon              randconfig-r2106-20261009    gcc-16.1.0 cocci
hexagon              randconfig-r2200-20261010    clang-24   smatch
hexagon              randconfig-r2302-20261010    clang-17   sparse
hexagon              randconfig-r2303-20261009    clang-22   sparse
hexagon              randconfig-r2306-20261009    clang-24   sparse
i386                               allnoconfig    gcc-16.1.0
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
i386                  randconfig-2100-20261009    clang-22   cocci
i386                  randconfig-2100-20261010    clang-22   cocci
i386                  randconfig-2101-20261009    clang-22   cocci
i386                  randconfig-2101-20261010    clang-22   cocci
i386                  randconfig-2102-20261009    clang-22   cocci
i386                  randconfig-2102-20261010    clang-22   cocci
i386                  randconfig-2103-20261009    clang-22   cocci
i386                  randconfig-2103-20261010    clang-22   cocci
i386                  randconfig-2200-20261009    gcc-14     smatch
i386                  randconfig-2200-20261010    gcc-12     smatch
i386                  randconfig-2300-20261009    clang-22   sparse
i386                  randconfig-2300-20261010    gcc-14     sparse
i386                  randconfig-2301-20261009    clang-22   sparse
i386                  randconfig-2301-20261010    gcc-14     sparse
i386                  randconfig-2302-20261009    clang-22   sparse
i386                  randconfig-2302-20261010    gcc-14     sparse
i386                 randconfig-r2307-20261009    gcc-14     sparse
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch                 loongson32_defconfig    clang-24
loongarch             randconfig-1000-20261010    clang-17
loongarch             randconfig-1001-20261010    clang-17
loongarch            randconfig-r2107-20261010    gcc-14     cocci
loongarch            randconfig-r2300-20261010    clang-17   sparse
loongarch            randconfig-r2308-20261009    gcc-16.1.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5307c3_defconfig    clang-24
m68k                 randconfig-r2107-20261009    gcc-16.1.0 cocci
m68k                 randconfig-r2202-20261009    gcc-8.5.0  smatch
m68k                 randconfig-r2202-20261010    gcc-13.4.0 smatch
m68k                 randconfig-r2303-20261009    gcc-16.1.0 sparse
m68k                 randconfig-r2307-20261010    gcc-14     sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2105-20261010    gcc-8.5.0  cocci
microblaze           randconfig-r2200-20261009    gcc-9.5.0  smatch
microblaze           randconfig-r2302-20261010    gcc-15.2.0 sparse
microblaze           randconfig-r2304-20261010    clang-17   sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                  decstation_r4k_defconfig    clang-24
mips                     maltaup_xpa_defconfig    clang-24
mips                 randconfig-r2101-20261010    gcc-12.5.0 cocci
mips                 randconfig-r2103-20261009    clang-24   cocci
mips                 randconfig-r2103-20261009    gcc-12     cocci
mips                 randconfig-r2106-20261010    gcc-8.5.0  cocci
mips                 randconfig-r2107-20261010    gcc-8.5.0  cocci
mips                 randconfig-r2202-20261010    clang-18   smatch
mips                 randconfig-r2304-20261009    clang-17   sparse
mips                 randconfig-r2305-20261009    gcc-16.1.0 sparse
mips                 randconfig-r2307-20261009    clang-24   sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261010    clang-17
nios2                 randconfig-1001-20261010    clang-17
nios2                randconfig-r2100-20261009    gcc-12     cocci
nios2                randconfig-r2200-20261009    gcc-8.5.0  smatch
nios2                randconfig-r2306-20261009    gcc-11.5.0 sparse
nios2                randconfig-r2308-20261009    clang-24   sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2104-20261010    gcc-8.5.0  cocci
openrisc             randconfig-r2105-20261009    gcc-16.1.0 cocci
openrisc             randconfig-r2301-20261010    gcc-16.1.0 sparse
openrisc             randconfig-r2305-20261009    gcc-11.5.0 sparse
openrisc             randconfig-r2309-20261009    gcc-11.5.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                 generic-64bit_defconfig    clang-24
parisc                randconfig-1000-20261010    clang-24
parisc                randconfig-1001-20261010    clang-24
parisc               randconfig-r2101-20261010    clang-24   cocci
parisc               randconfig-r2201-20261010    gcc-10.5.0 smatch
parisc               randconfig-r2305-20261010    gcc-16.1.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                      mpc5200_defconfig    clang-24
powerpc               randconfig-1000-20261010    clang-24
powerpc               randconfig-1001-20261010    clang-24
powerpc              randconfig-r2101-20261009    clang-24   cocci
powerpc              randconfig-r2107-20261010    clang-20   cocci
powerpc              randconfig-r2201-20261009    clang-24   smatch
powerpc              randconfig-r2303-20261009    gcc-16.1.0 sparse
powerpc              randconfig-r2306-20261009    gcc-11.5.0 sparse
powerpc              randconfig-r2308-20261010    gcc-14     sparse
powerpc64             randconfig-1000-20261010    clang-24
powerpc64             randconfig-1001-20261010    clang-24
powerpc64            randconfig-r2104-20261010    clang-20   cocci
powerpc64            randconfig-r2301-20261010    clang-17   sparse
powerpc64            randconfig-r2304-20261009    clang-22   sparse
powerpc64            randconfig-r2309-20261010    gcc-14     sparse
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261010    clang-19
riscv                 randconfig-1000-20261011    clang-17
riscv                 randconfig-1001-20261010    clang-19
riscv                 randconfig-1001-20261011    clang-17
riscv                 randconfig-2000-20261009    gcc-16.1.0
riscv                 randconfig-2000-20261010    gcc-16.1.0
riscv                 randconfig-2001-20261009    gcc-16.1.0
riscv                 randconfig-2001-20261010    gcc-16.1.0
riscv                randconfig-r2100-20261010    gcc-12.5.0 cocci
riscv                randconfig-r2101-20261009    gcc-12     cocci
riscv                randconfig-r2200-20261009    gcc-10.5.0 smatch
riscv                randconfig-r2300-20261010    gcc-15.2.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261010    clang-19
s390                  randconfig-1000-20261011    clang-17
s390                  randconfig-1001-20261010    clang-19
s390                  randconfig-1001-20261011    clang-17
s390                  randconfig-2000-20261009    gcc-16.1.0
s390                  randconfig-2000-20261010    gcc-16.1.0
s390                  randconfig-2001-20261009    gcc-16.1.0
s390                  randconfig-2001-20261010    gcc-16.1.0
s390                 randconfig-r2100-20261010    gcc-16.1.0 cocci
s390                 randconfig-r2102-20261009    clang-24   cocci
s390                 randconfig-r2300-20261009    gcc-15.2.0 sparse
s390                 randconfig-r2301-20261009    gcc-16.1.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261010    clang-19
sh                    randconfig-1000-20261011    clang-17
sh                    randconfig-1001-20261010    clang-19
sh                    randconfig-1001-20261011    clang-17
sh                    randconfig-2000-20261009    gcc-16.1.0
sh                    randconfig-2000-20261010    gcc-16.1.0
sh                    randconfig-2001-20261009    gcc-16.1.0
sh                    randconfig-2001-20261010    gcc-16.1.0
sh                   randconfig-r2107-20261009    gcc-16.1.0 cocci
sh                   randconfig-r2301-20261009    clang-22   sparse
sh                   randconfig-r2302-20261010    gcc-16.1.0 sparse
sh                   randconfig-r2303-20261010    clang-17   sparse
sh                   randconfig-r2308-20261009    clang-24   sparse
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261010    gcc-16.1.0
sparc                 randconfig-1001-20261010    gcc-16.1.0
sparc                 randconfig-2000-20261009    clang-17
sparc                 randconfig-2000-20261010    gcc-16.1.0
sparc                 randconfig-2001-20261009    clang-17
sparc                 randconfig-2001-20261010    gcc-16.1.0
sparc                randconfig-r2101-20261010    gcc-16.1.0 cocci
sparc                randconfig-r2105-20261009    gcc-16.1.0 cocci
sparc                randconfig-r2106-20261009    gcc-16.1.0 cocci
sparc                randconfig-r2106-20261010    clang-20   cocci
sparc                randconfig-r2201-20261009    gcc-11.5.0 smatch
sparc                randconfig-r2300-20261009    gcc-16.1.0 sparse
sparc                randconfig-r2302-20261009    gcc-16.1.0 sparse
sparc                randconfig-r2303-20261010    gcc-16.1.0 sparse
sparc                randconfig-r2304-20261009    gcc-16.1.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261010    gcc-16.1.0
sparc64               randconfig-1001-20261010    gcc-16.1.0
sparc64               randconfig-2000-20261009    clang-17
sparc64               randconfig-2000-20261010    gcc-16.1.0
sparc64               randconfig-2001-20261009    clang-17
sparc64               randconfig-2001-20261010    gcc-16.1.0
sparc64              randconfig-r2102-20261010    clang-24   cocci
sparc64              randconfig-r2104-20261009    gcc-16.1.0 cocci
sparc64              randconfig-r2105-20261010    gcc-14     cocci
sparc64              randconfig-r2305-20261010    gcc-15.2.0 sparse
sparc64              randconfig-r2306-20261010    gcc-14     sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261010    gcc-16.1.0
um                    randconfig-1001-20261010    gcc-16.1.0
um                    randconfig-2000-20261009    clang-17
um                    randconfig-2000-20261010    gcc-16.1.0
um                    randconfig-2001-20261009    clang-17
um                    randconfig-2001-20261010    gcc-16.1.0
um                   randconfig-r2102-20261009    gcc-12     cocci
um                   randconfig-r2105-20261009    gcc-16.1.0 cocci
um                   randconfig-r2105-20261010    clang-20   cocci
um                   randconfig-r2201-20261010    clang-17   smatch
um                   randconfig-r2302-20261009    clang-22   sparse
um                   randconfig-r2307-20261009    clang-24   sparse
um                   randconfig-r2309-20261009    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261010    clang-22
x86_64      buildonly-randconfig-1000-20261011    gcc-14
x86_64      buildonly-randconfig-1001-20261010    clang-22
x86_64      buildonly-randconfig-1001-20261011    gcc-14
x86_64      buildonly-randconfig-1002-20261010    clang-22
x86_64      buildonly-randconfig-1002-20261011    gcc-14
x86_64      buildonly-randconfig-1003-20261010    clang-22
x86_64      buildonly-randconfig-1003-20261011    gcc-14
x86_64      buildonly-randconfig-1004-20261010    clang-22
x86_64      buildonly-randconfig-1004-20261011    gcc-14
x86_64      buildonly-randconfig-1005-20261010    clang-22
x86_64      buildonly-randconfig-1005-20261011    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261010    gcc-14
x86_64                randconfig-1000-20261011    gcc-14
x86_64                randconfig-1001-20261010    gcc-14
x86_64                randconfig-1001-20261011    gcc-14
x86_64                randconfig-1002-20261010    gcc-14
x86_64                randconfig-1002-20261011    gcc-14
x86_64                randconfig-1003-20261010    gcc-14
x86_64                randconfig-1003-20261011    gcc-14
x86_64                randconfig-1004-20261010    gcc-14
x86_64                randconfig-1004-20261011    gcc-14
x86_64                randconfig-1005-20261010    gcc-14
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
x86_64                randconfig-2100-20261009    clang-22   cocci
x86_64                randconfig-2100-20261010    clang-22   cocci
x86_64                randconfig-2101-20261009    clang-22   cocci
x86_64                randconfig-2101-20261010    clang-22   cocci
x86_64                randconfig-2102-20261009    clang-22   cocci
x86_64                randconfig-2102-20261010    clang-22   cocci
x86_64                randconfig-2103-20261009    clang-22   cocci
x86_64                randconfig-2103-20261010    clang-22   cocci
x86_64                randconfig-2200-20261009    gcc-14     smatch
x86_64                randconfig-2300-20261009    clang-22   sparse
x86_64                randconfig-2300-20261010    gcc-14     sparse
x86_64                randconfig-2301-20261009    clang-22   sparse
x86_64                randconfig-2301-20261010    gcc-14     sparse
x86_64                randconfig-2302-20261009    clang-22   sparse
x86_64                randconfig-2302-20261010    gcc-14     sparse
x86_64               randconfig-r2106-20261010    gcc-14     cocci
x86_64               randconfig-r2200-20261009    clang-22   smatch
x86_64               randconfig-r2201-20261009    gcc-14     smatch
x86_64               randconfig-r2201-20261010    clang-22   smatch
x86_64               randconfig-r2303-20261010    gcc-15.2.0 sparse
x86_64               randconfig-r2305-20261009    clang-22   sparse
x86_64               randconfig-r2307-20261010    gcc-14     sparse
x86_64               randconfig-r2309-20261010    gcc-14     sparse
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
xtensa                randconfig-1000-20261010    gcc-16.1.0
xtensa                randconfig-1001-20261010    gcc-16.1.0
xtensa                randconfig-2000-20261009    clang-17
xtensa                randconfig-2000-20261010    gcc-16.1.0
xtensa                randconfig-2001-20261009    clang-17
xtensa                randconfig-2001-20261010    gcc-16.1.0
xtensa               randconfig-r2102-20261010    gcc-16.1.0 cocci
xtensa               randconfig-r2200-20261010    gcc-8.5.0  smatch
xtensa               randconfig-r2308-20261010    gcc-14     sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
