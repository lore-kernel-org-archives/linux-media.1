Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BE84756DD
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365207; cv=none; b=MHGZ93Q5qiZPrkrdaBTSv8T55Y95XE00lzp2NYPU4fqfh0ftcTR6Mm4eBXrVc4xpDqo1isZNLLnFnOLeqAKe66ReWOnUWkiZHQaXVuV3fGWzMOr9qscZNqzHqVXLM9urzk20lhbGCoIVth8sblr/X+YkD7Iqeo7kZ2ykyIwZ0e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365207; c=relaxed/simple;
	bh=fW0s8uinCQc4dq0dOxjuKpK8Tq1BiQ9CzfOtYlGfsiQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YueT5RYiHgcYnJUkZo2kZtz5l6xVVpJbSM7DzPeXfk4gKsgJzg/le/PsZAj2BrYRt7cX75B2/ocW3KcBABuKlTOqayRU5PNf7ptofUhA/xeolOmhZ1ojofuZzse18m4DA5Y+hZHwwrZchOzx1hDlJL1djVBextUe1XiN7lZsl20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHEIImCc; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHEIImCc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791365165; x=1822901165;
  h=date:from:to:cc:subject:message-id;
  bh=fW0s8uinCQc4dq0dOxjuKpK8Tq1BiQ9CzfOtYlGfsiQ=;
  b=fHEIImCcgai5Pr+W8UXyM5FEYZYk/vMtl2Yac0Q7bHSqnT2AW+oA+FCW
   nkuP54yCsTpLSTwepDh0i0Mh/Ym7gVUbuiyD/5+lw+I3Y69okaSKWR7GI
   d8kQ7FbBTZENpKV5m4ox6Q8Ha0bs3rxmO2ztwhdRqet2+B1d379hD3eis
   jfQVn/H+9W7cdvKD8/7kZxgUO/v3gczKDePh5kudscInOtsXmifQo+S+l
   mAsLMb0U8xUmk5YrN76Gcyal1AH9X83NMyanarP1AKxRh4aCGuLjimiPP
   q7c5zywTYF8RXwAsLsevCIX/ekvrAKS7t3URgF/mfOtiVqu7el0HSeUq/
   A==;
X-CSE-ConnectionGUID: PdGLHtE9ScyU5BsQD4b1QA==
X-CSE-MsgGUID: ojR/2EIUSUGkpqpULxp05w==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="5873"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="5873"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 02:26:04 -0700
X-CSE-ConnectionGUID: 96uZst/0QpuYmeaZSrP27w==
X-CSE-MsgGUID: 775naakqT5e9O7K2H6Yvow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="15499"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Oct 2026 02:26:02 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xENuR-000000002ki-2tLM;
	Wed, 07 Oct 2026 09:25:59 +0000
Date: Wed, 07 Oct 2026 17:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS WITH UNVERIFIED
 WARNING ee2e9bf41d3e78b85486986cb861305576c6fe21
Message-ID: <202610071718.h1FeSNsy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: ee2e9bf41d3e78b85486986cb861305576c6fe21  media: i2c: add imx576 image sensor driver

Unverified Warning (likely false positive, kindly check if interested):

    https://lore.kernel.org/oe-kbuild/202610061033.FttmuZAj-lkp@intel.com

    drivers/media/i2c/maxim-serdes/max9296a.c:337 max9296a_log_phy_status() warn: subtract is higher precedence than shift
    drivers/media/i2c/maxim-serdes/max9296a.c:691 max9296a_set_pipe_remap() warn: subtract is higher precedence than shift
    drivers/media/i2c/maxim-serdes/max9296a.c:758 max96714_set_pipe_stream_id() warn: subtract is higher precedence than shift

Warning ids grouped by kconfigs:

recent_errors
`-- x86_64-randconfig-r2201-20261006
    |-- drivers-media-i2c-maxim-serdes-max9296a.c-max9296a_log_phy_status()-warn:subtract-is-higher-precedence-than-shift
    |-- drivers-media-i2c-maxim-serdes-max9296a.c-max9296a_set_pipe_remap()-warn:subtract-is-higher-precedence-than-shift
    `-- drivers-media-i2c-maxim-serdes-max9296a.c-max96714_set_pipe_stream_id()-warn:subtract-is-higher-precedence-than-shift

elapsed time: 1093m

configs tested: 390
configs skipped: 7

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2103-20261006    gcc-8.5.0  cocci
alpha                randconfig-r2307-20261006    clang-19   sparse
alpha                randconfig-r2308-20261006    clang-19   sparse
alpha                randconfig-r2309-20261005    gcc-12.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                  nsimosci_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-1000-20261007    clang-24
arc                   randconfig-1001-20261007    clang-24
arc                  randconfig-r2107-20261006    gcc-14.3.0 cocci
arc                  randconfig-r2107-20261006    gcc-8.5.0  cocci
arc                  randconfig-r2201-20261006    gcc-11.5.0 smatch
arc                  randconfig-r2202-20261006    gcc-9.5.0  smatch
arc                  randconfig-r2303-20261006    clang-24   sparse
arm                               alldefconfig    gcc-16.1.0
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                      davinci_all_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                            omap1_defconfig    gcc-16.1.0
arm                           pxa168_defconfig    gcc-16.1.0
arm                           pxa3xx_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261007    clang-24
arm                   randconfig-1001-20261007    clang-24
arm                   randconfig-1002-20261007    clang-24
arm                   randconfig-1003-20261007    clang-24
arm                  randconfig-r2105-20261006    gcc-14.3.0 cocci
arm                  randconfig-r2302-20261006    gcc-13.4.0 sparse
arm                  randconfig-r2303-20261006    gcc-13.4.0 sparse
arm                          wpcm450_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261007    gcc-13.4.0
arm64                 randconfig-1001-20261007    gcc-13.4.0
arm64                 randconfig-1002-20261007    gcc-13.4.0
arm64                 randconfig-1003-20261007    gcc-13.4.0
arm64                randconfig-r2101-20261006    clang-24   cocci
arm64                randconfig-r2104-20261006    clang-17   cocci
arm64                randconfig-r2104-20261006    gcc-11.5.0 cocci
arm64                randconfig-r2105-20261006    clang-24   cocci
arm64                randconfig-r2106-20261006    clang-17   cocci
arm64                randconfig-r2202-20261006    clang-17   smatch
arm64                randconfig-r2308-20261006    gcc-14.3.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261007    gcc-13.4.0
csky                  randconfig-1001-20261007    gcc-13.4.0
csky                 randconfig-r2106-20261006    gcc-8.5.0  cocci
csky                 randconfig-r2201-20261006    gcc-9.5.0  smatch
csky                 randconfig-r2309-20261006    gcc-14.3.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261007    gcc-12.5.0
hexagon               randconfig-1001-20261007    gcc-12.5.0
hexagon              randconfig-r2100-20261006    gcc-8.5.0  cocci
hexagon              randconfig-r2103-20261006    clang-24   cocci
hexagon              randconfig-r2106-20261006    gcc-11.5.0 cocci
hexagon              randconfig-r2301-20261006    gcc-13.4.0 sparse
hexagon              randconfig-r2302-20261006    clang-17   sparse
hexagon              randconfig-r2302-20261006    gcc-14.3.0 sparse
hexagon              randconfig-r2304-20261006    gcc-13.4.0 sparse
hexagon              randconfig-r2305-20261006    gcc-14.3.0 sparse
hexagon              randconfig-r2306-20261006    gcc-14.3.0 sparse
hexagon              randconfig-r2309-20261006    gcc-14.3.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261007    gcc-14
i386        buildonly-randconfig-1001-20261007    gcc-14
i386        buildonly-randconfig-1002-20261007    gcc-14
i386        buildonly-randconfig-1003-20261007    gcc-14
i386        buildonly-randconfig-1004-20261007    gcc-14
i386        buildonly-randconfig-1005-20261007    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261007    clang-22
i386                  randconfig-1001-20261007    clang-22
i386                  randconfig-1002-20261007    clang-22
i386                  randconfig-1003-20261007    clang-22
i386                  randconfig-1004-20261007    clang-22
i386                  randconfig-1005-20261007    clang-22
i386                  randconfig-1006-20261007    clang-22
i386                  randconfig-1007-20261007    gcc-14
i386                  randconfig-1008-20261007    gcc-14
i386                  randconfig-1009-20261007    gcc-14
i386                  randconfig-1010-20261007    gcc-14
i386                  randconfig-1011-20261007    gcc-14
i386                  randconfig-1012-20261007    gcc-14
i386                  randconfig-1013-20261007    gcc-14
i386                  randconfig-2100-20261005    gcc-14     cocci
i386                  randconfig-2100-20261006    clang-22   cocci
i386                  randconfig-2101-20261005    gcc-14     cocci
i386                  randconfig-2101-20261006    clang-22   cocci
i386                  randconfig-2102-20261005    clang-22   cocci
i386                  randconfig-2102-20261006    clang-22   cocci
i386                  randconfig-2103-20261005    clang-22   cocci
i386                  randconfig-2103-20261006    clang-22   cocci
i386                  randconfig-2200-20261006    gcc-13     smatch
i386                  randconfig-2300-20261005    gcc-14     sparse
i386                  randconfig-2300-20261006    gcc-14     sparse
i386                  randconfig-2301-20261005    gcc-13     sparse
i386                  randconfig-2301-20261006    gcc-14     sparse
i386                  randconfig-2302-20261005    clang-22   sparse
i386                  randconfig-2302-20261006    gcc-14     sparse
i386                 randconfig-r2100-20261006    clang-24   cocci
i386                 randconfig-r2105-20261006    clang-17   cocci
i386                 randconfig-r2305-20261006    gcc-13.4.0 sparse
i386                 randconfig-r2306-20261005    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261007    gcc-12.5.0
loongarch             randconfig-1001-20261007    gcc-12.5.0
loongarch            randconfig-r2101-20261006    gcc-8.5.0  cocci
loongarch            randconfig-r2104-20261006    gcc-8.5.0  cocci
loongarch            randconfig-r2106-20261006    gcc-16.1.0 cocci
loongarch            randconfig-r2200-20261006    clang-18   smatch
loongarch            randconfig-r2201-20261006    gcc-13.4.0 smatch
loongarch            randconfig-r2305-20261006    clang-24   sparse
loongarch            randconfig-r2307-20261006    gcc-14.3.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         mvme147_defconfig    gcc-16.1.0
m68k                 randconfig-r2106-20261006    gcc-8.5.0  cocci
m68k                 randconfig-r2107-20261006    gcc-8.5.0  cocci
m68k                 randconfig-r2202-20261006    gcc-8.5.0  smatch
m68k                 randconfig-r2300-20261006    gcc-13.4.0 sparse
m68k                 randconfig-r2301-20261006    gcc-14.3.0 sparse
m68k                 randconfig-r2307-20261006    clang-19   sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2101-20261006    clang-24   cocci
microblaze           randconfig-r2104-20261006    gcc-11.5.0 cocci
microblaze           randconfig-r2107-20261006    clang-17   cocci
microblaze           randconfig-r2107-20261006    gcc-11.5.0 cocci
microblaze           randconfig-r2302-20261006    gcc-13.4.0 sparse
microblaze           randconfig-r2303-20261006    gcc-11.5.0 sparse
microblaze           randconfig-r2304-20261006    clang-24   sparse
microblaze           randconfig-r2304-20261006    gcc-8.5.0  sparse
microblaze           randconfig-r2305-20261006    clang-24   sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                           ath79_defconfig    gcc-16.1.0
mips                        bmips_be_defconfig    gcc-16.1.0
mips                            jazz_defconfig    gcc-16.1.0
mips                   maltasmvp_eva_defconfig    gcc-16.1.0
mips                 randconfig-r2102-20261006    clang-24   cocci
mips                 randconfig-r2107-20261006    gcc-11.5.0 cocci
mips                 randconfig-r2302-20261006    clang-24   sparse
mips                 randconfig-r2303-20261006    gcc-8.5.0  sparse
mips                 randconfig-r2304-20261006    gcc-13.4.0 sparse
mips                 randconfig-r2305-20261006    clang-24   sparse
mips                 randconfig-r2308-20261006    clang-24   sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261007    gcc-12.5.0
nios2                 randconfig-1001-20261007    gcc-12.5.0
nios2                randconfig-r2100-20261006    gcc-14.3.0 cocci
nios2                randconfig-r2106-20261006    gcc-11.5.0 cocci
nios2                randconfig-r2304-20261006    clang-24   sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2103-20261006    gcc-14.3.0 cocci
openrisc             randconfig-r2200-20261006    gcc-13.4.0 smatch
openrisc             randconfig-r2202-20261006    gcc-16.1.0 smatch
openrisc             randconfig-r2307-20261006    gcc-14.3.0 sparse
openrisc                        virt_defconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261007    gcc-15.2.0
parisc                randconfig-1001-20261007    gcc-15.2.0
parisc               randconfig-r2100-20261006    gcc-8.5.0  cocci
parisc               randconfig-r2101-20261006    gcc-8.5.0  cocci
parisc               randconfig-r2103-20261006    gcc-8.5.0  cocci
parisc               randconfig-r2104-20261006    clang-17   cocci
parisc               randconfig-r2107-20261006    gcc-14.3.0 cocci
parisc               randconfig-r2305-20261006    gcc-8.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                        ebony_defconfig    gcc-16.1.0
powerpc                     ge_imp3a_defconfig    gcc-16.1.0
powerpc                         icon_defconfig    gcc-16.1.0
powerpc                    motionpro_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261007    gcc-15.2.0
powerpc               randconfig-1001-20261007    gcc-15.2.0
powerpc              randconfig-r2100-20261006    clang-24   cocci
powerpc              randconfig-r2104-20261006    gcc-16.1.0 cocci
powerpc              randconfig-r2105-20261006    gcc-16.1.0 cocci
powerpc              randconfig-r2300-20261006    gcc-14.3.0 sparse
powerpc              randconfig-r2303-20261006    gcc-13.4.0 sparse
powerpc              randconfig-r2303-20261006    gcc-14.3.0 sparse
powerpc                      stx_gp3_defconfig    gcc-16.1.0
powerpc                  xes_mpc85xx_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20261007    gcc-15.2.0
powerpc64             randconfig-1001-20261007    gcc-15.2.0
powerpc64            randconfig-r2102-20261006    clang-24   cocci
powerpc64            randconfig-r2103-20261006    gcc-8.5.0  cocci
powerpc64            randconfig-r2104-20261006    gcc-8.5.0  cocci
powerpc64            randconfig-r2105-20261006    gcc-11.5.0 cocci
powerpc64            randconfig-r2303-20261006    clang-24   sparse
powerpc64            randconfig-r2307-20261006    clang-24   sparse
powerpc64            randconfig-r2309-20261006    gcc-14.3.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261007    clang-24
riscv                 randconfig-1001-20261007    clang-24
riscv                 randconfig-2000-20261006    gcc-14.3.0
riscv                 randconfig-2000-20261006    gcc-16.1.0
riscv                 randconfig-2001-20261006    gcc-16.1.0
riscv                randconfig-r2101-20261006    gcc-14.3.0 cocci
riscv                randconfig-r2301-20261006    gcc-13.4.0 sparse
riscv                randconfig-r2306-20261006    gcc-14.3.0 sparse
riscv                randconfig-r2308-20261006    gcc-14.3.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261007    clang-24
s390                  randconfig-1001-20261007    clang-24
s390                  randconfig-2000-20261006    gcc-14.3.0
s390                  randconfig-2000-20261006    gcc-16.1.0
s390                  randconfig-2001-20261006    gcc-16.1.0
s390                  randconfig-2001-20261006    gcc-8.5.0
s390                 randconfig-r2102-20261006    gcc-8.5.0  cocci
s390                 randconfig-r2306-20261006    clang-19   sparse
s390                 randconfig-r2309-20261006    gcc-14.3.0 sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.1.0
sh                           lboxre2_defconfig    gcc-16.1.0
sh                    randconfig-1000-20261007    clang-24
sh                    randconfig-1001-20261007    clang-24
sh                    randconfig-2000-20261006    gcc-16.1.0
sh                    randconfig-2001-20261006    gcc-16.1.0
sh                   randconfig-r2102-20261006    gcc-8.5.0  cocci
sh                   randconfig-r2105-20261006    gcc-11.5.0 cocci
sh                   randconfig-r2200-20261006    gcc-16.1.0 smatch
sh                   randconfig-r2300-20261006    gcc-13.4.0 sparse
sh                   randconfig-r2306-20261006    clang-19   sparse
sh                   randconfig-r2306-20261006    clang-24   sparse
sh                   randconfig-r2307-20261005    gcc-12.5.0 sparse
sh                   randconfig-r2308-20261005    gcc-14.3.0 sparse
sh                   randconfig-r2308-20261006    clang-19   sparse
sh                           rsk7264_defconfig    gcc-16.1.0
sh                    secureedge5410_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261007    clang-17
sparc                 randconfig-1001-20261007    clang-17
sparc                 randconfig-2000-20261006    clang-24
sparc                 randconfig-2001-20261006    clang-24
sparc                randconfig-r2102-20261006    gcc-14.3.0 cocci
sparc                randconfig-r2104-20261006    gcc-14.3.0 cocci
sparc                randconfig-r2107-20261006    gcc-16.1.0 cocci
sparc                randconfig-r2300-20261006    clang-24   sparse
sparc                randconfig-r2301-20261006    gcc-15.2.0 sparse
sparc                randconfig-r2302-20261006    gcc-8.5.0  sparse
sparc                randconfig-r2304-20261006    gcc-14.3.0 sparse
sparc                randconfig-r2309-20261006    clang-24   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261007    clang-17
sparc64               randconfig-1001-20261007    clang-17
sparc64               randconfig-2000-20261006    clang-24
sparc64               randconfig-2001-20261006    clang-24
sparc64              randconfig-r2103-20261006    clang-24   cocci
sparc64              randconfig-r2106-20261006    gcc-14.3.0 cocci
sparc64              randconfig-r2300-20261006    clang-24   sparse
sparc64              randconfig-r2301-20261006    gcc-8.5.0  sparse
sparc64              randconfig-r2306-20261006    gcc-14.3.0 sparse
sparc64              randconfig-r2307-20261006    gcc-14.3.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261007    clang-17
um                    randconfig-1001-20261007    clang-17
um                    randconfig-2000-20261006    clang-24
um                    randconfig-2001-20261006    clang-24
um                   randconfig-r2105-20261006    gcc-8.5.0  cocci
um                   randconfig-r2200-20261005    gcc-13     smatch
um                   randconfig-r2300-20261006    gcc-8.5.0  sparse
um                   randconfig-r2301-20261006    clang-24   sparse
um                   randconfig-r2307-20261006    gcc-14.3.0 sparse
um                   randconfig-r2309-20261006    clang-19   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261006    gcc-14
x86_64      buildonly-randconfig-1000-20261007    gcc-14
x86_64      buildonly-randconfig-1001-20261006    gcc-14
x86_64      buildonly-randconfig-1001-20261007    gcc-14
x86_64      buildonly-randconfig-1002-20261006    gcc-14
x86_64      buildonly-randconfig-1002-20261007    gcc-14
x86_64      buildonly-randconfig-1003-20261006    gcc-14
x86_64      buildonly-randconfig-1003-20261007    gcc-14
x86_64      buildonly-randconfig-1004-20261006    gcc-14
x86_64      buildonly-randconfig-1004-20261007    gcc-14
x86_64      buildonly-randconfig-1005-20261006    gcc-14
x86_64      buildonly-randconfig-1005-20261007    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261007    clang-22
x86_64                randconfig-1001-20261007    clang-22
x86_64                randconfig-1002-20261007    clang-22
x86_64                randconfig-1003-20261007    clang-22
x86_64                randconfig-1004-20261007    clang-22
x86_64                randconfig-1005-20261007    clang-22
x86_64                randconfig-1006-20261006    gcc-14
x86_64                randconfig-1006-20261007    clang-22
x86_64                randconfig-1007-20261006    gcc-14
x86_64                randconfig-1007-20261007    clang-22
x86_64                randconfig-1008-20261006    gcc-14
x86_64                randconfig-1008-20261007    clang-22
x86_64                randconfig-1009-20261006    gcc-14
x86_64                randconfig-1009-20261007    clang-22
x86_64                randconfig-1010-20261006    gcc-14
x86_64                randconfig-1010-20261007    clang-22
x86_64                randconfig-1011-20261006    gcc-14
x86_64                randconfig-1011-20261007    clang-22
x86_64                randconfig-1012-20261007    gcc-12
x86_64                randconfig-1013-20261007    gcc-12
x86_64                randconfig-1014-20261007    gcc-12
x86_64                randconfig-1015-20261007    gcc-12
x86_64                randconfig-1016-20261007    gcc-12
x86_64                randconfig-1017-20261007    gcc-12
x86_64                randconfig-2100-20261006    clang-22   cocci
x86_64                randconfig-2101-20261006    clang-22   cocci
x86_64                randconfig-2102-20261006    clang-22   cocci
x86_64                randconfig-2102-20261006    gcc-14     cocci
x86_64                randconfig-2103-20261006    clang-22   cocci
x86_64                randconfig-2200-20261006    clang-22   smatch
x86_64                randconfig-2300-20261005    clang-22   sparse
x86_64                randconfig-2300-20261006    gcc-14     sparse
x86_64                randconfig-2301-20261005    gcc-14     sparse
x86_64                randconfig-2301-20261006    gcc-14     sparse
x86_64                randconfig-2302-20261005    clang-22   sparse
x86_64                randconfig-2302-20261006    gcc-14     sparse
x86_64               randconfig-r2100-20261006    gcc-8.5.0  cocci
x86_64               randconfig-r2101-20261006    gcc-8.5.0  cocci
x86_64               randconfig-r2200-20261006    clang-22   smatch
x86_64               randconfig-r2201-20261006    gcc-12     smatch
x86_64               randconfig-r2202-20261006    gcc-14     smatch
x86_64               randconfig-r2304-20261006    gcc-8.5.0  sparse
x86_64               randconfig-r2305-20261006    gcc-13.4.0 sparse
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
xtensa                randconfig-1000-20261007    clang-17
xtensa                randconfig-1001-20261007    clang-17
xtensa                randconfig-2000-20261006    clang-24
xtensa                randconfig-2001-20261006    clang-24
xtensa               randconfig-r2102-20261006    gcc-8.5.0  cocci
xtensa               randconfig-r2105-20261006    gcc-8.5.0  cocci
xtensa               randconfig-r2202-20261006    gcc-9.5.0  smatch
xtensa               randconfig-r2302-20261006    clang-24   sparse
xtensa               randconfig-r2306-20261006    gcc-14.3.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
