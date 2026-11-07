Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794048993;
	b=iDOWalPJX/n8hcm2crM/ck/1NoCMlDNvgHmyLhr0knnnY1B2sRakUr9Y7MWFDw9D7sxz
	 RvBbmGRHK7nJt6HPozHmtmOqY4pHLqBoQEGlt/zgsa5bZdvyPjkW58SB2+DFS9az92zZV
	 333Sz+uEpYj+CYInlbTMmjzMrohMSUIqiF9W7EEdaa4CknxoxAMNhXVeTSAd+WuzjKMqU
	 NszzQn2AwKRwcJwQBGW0fvSWx5VLTYkVbG/BrR0HWjTKYHrNsoq8J+lQhwAPS02NwZF2F
	 KhhAUwYkXYEc5s4yfRUpQTuOHRzQ5m1YKeKKD058lAHR4SYBz0pHBa3mjEXSqKYDkuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794048993;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=BsBKBHNe/rfHRQ/3tvtOC3Hm3jAZoNziDsI4NkMo/fk=;
	b=JzuCW8LJsw1nYcbIkr5m/H2Z4O/g0f9uSu/4woD1Jw43UlUGCvsafx8Gh22LArMyK/kl
	 Gxrmivoo1VyCmORj8max9jDIY2Psc5rqV5UYFBIBYXkLAP9LDNjT0uV8y4/md793HuXH5
	 TMDAH4kye8V0js10rarPmqtXwA7XAq9Nc7VCTml1yAz4EwyIsAy+vFdc2UD4+1TI3AmCc
	 ODUKNamJetkNPFLPWqFdICrph9FmU4kS1wxYUCBa5yByAMYiDo+HH7PSwpaW39kYTEEu1
	 vM/ecS7OPyC3a2HBeXxp+jnsgCoocqB0dDPBrRqMih82iKnBmrT2MVWx3GdINpKFY9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g6HpI63u;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D7E606A326
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 10:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3D7E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g6HpI63u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794048991; x=1825584991;
  h=date:from:to:cc:subject:message-id;
  bh=8rb6QsL9zDwSSTCxe+EGFwGV78qH9FJkFIJ0rm5Yt1M=;
  b=g6HpI63uEhu+TnhgwahgC151qaa+sgPiVaAkV3BpvFoKtV23yBwMdu4z
   +Low0mFDr+dIgJ6mRmXcBhsv+mztop/PspxuozE/06P0ND+sPVPeHq6KL
   WnwiGfqM52UR4UXDKlU7TiMUW8TYntoSudLBdjuYeVsysdYn+zJpiMUfF
   VcfA6G+iRA/wYhJRs5XTI8yYU4PHBpfqU/McJ1Odg1rCRAi5omNb/L5kp
   dJz+WkXe2oXXm2KV7I5dIbWWZGqmDKRqkx+1teIPGmR98PHMpgKtiXuOP
   My7pLoVTAx2iyf9CV9HUUdC8a42mUFUK4g4xesGT8D1O9wPsRZlQQJILD
   A==;
X-CSE-ConnectionGUID: EyIslqgzQFenyYi/TW0DIA==
X-CSE-MsgGUID: 9bnubZJgRBqyCKrKUdPDxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2880498"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2880498"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 02:56:30 -0800
X-CSE-ConnectionGUID: iDN9YGzfSw+ZPvXhyu0J1w==
X-CSE-MsgGUID: W9m20bW3Qp2uc4GdDV35dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7642701"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Nov 2026 02:56:28 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPe5y-00000000qjt-3BCI;
	Sat, 07 Nov 2026 10:56:26 +0000
Date: Sat, 07 Nov 2026 18:55:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6] BUILD SUCCESS
 eb54886218675f2d63faf2efcebc4c5808017e70
Message-ID: <20261107185554.0RD49Ji3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list

tree/branch: git://linuxtv.org/sailus/media_tree.git ipu6
branch HEAD: eb54886218675f2d63faf2efcebc4c5808017e70  media: intel/ipu6: pass the device to dev_err() in ipu6_mmu_unmap()

elapsed time: 945m

configs tested: 214
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               alldefconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                             hsdk_defconfig    gcc-16.2.0
arc                         nsimosci_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261107    gcc-12.5.0
arc                   randconfig-1001-20261107    gcc-12.5.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                         clps711x_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                            h3600_defconfig    gcc-16.2.0
arm                           ixp4xx_defconfig    gcc-16.2.0
arm                    milbeaut_m10v_defconfig    gcc-16.2.0
arm                         multi_v7_defconfig    gcc-16.2.0
arm                         mvebu_v5_defconfig    gcc-16.2.0
arm                         neponset_defconfig    gcc-16.2.0
arm                        omap2plus_defconfig    gcc-16.2.0
arm                           pxa910_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261107    gcc-12.5.0
arm                   randconfig-1001-20261107    gcc-12.5.0
arm                   randconfig-1002-20261107    gcc-12.5.0
arm                   randconfig-1003-20261107    gcc-12.5.0
arm                              rpc_defconfig    gcc-16.2.0
arm                           sp7021_defconfig    gcc-16.2.0
arm                            spitz_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261107    gcc-11.5.0
arm64                 randconfig-1001-20261107    gcc-11.5.0
arm64                 randconfig-1002-20261107    gcc-11.5.0
arm64                 randconfig-1003-20261107    gcc-11.5.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261107    gcc-11.5.0
csky                  randconfig-1001-20261107    gcc-11.5.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261107    clang-18
hexagon               randconfig-1001-20261107    clang-18
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261107    gcc-14
i386        buildonly-randconfig-1001-20261107    gcc-14
i386        buildonly-randconfig-1002-20261107    gcc-14
i386        buildonly-randconfig-1003-20261107    gcc-14
i386        buildonly-randconfig-1004-20261107    gcc-14
i386        buildonly-randconfig-1005-20261107    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261107    clang-22
i386                  randconfig-1001-20261107    clang-22
i386                  randconfig-1002-20261107    clang-22
i386                  randconfig-1003-20261107    clang-22
i386                  randconfig-1004-20261107    clang-22
i386                  randconfig-1005-20261107    clang-22
i386                  randconfig-1006-20261107    clang-22
i386                  randconfig-1007-20261107    clang-22
i386                  randconfig-1008-20261107    clang-22
i386                  randconfig-1009-20261107    clang-22
i386                  randconfig-1010-20261107    clang-22
i386                  randconfig-1011-20261107    clang-22
i386                  randconfig-1012-20261107    clang-22
i386                  randconfig-1013-20261107    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    gcc-16.2.0
loongarch             randconfig-1000-20261107    clang-18
loongarch             randconfig-1001-20261107    clang-18
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5329evb_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                        bmips_be_defconfig    gcc-16.2.0
mips                      cu1830-neo_defconfig    gcc-16.2.0
mips                      decstation_defconfig    gcc-16.2.0
mips                            gcw0_defconfig    gcc-16.2.0
mips                            ip27_defconfig    gcc-16.2.0
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                   maltasmvp_eva_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261107    clang-18
nios2                 randconfig-1001-20261107    clang-18
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc                  simple_smp_defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261107    clang-24
parisc                randconfig-1001-20261107    clang-24
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    gcc-16.2.0
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                  canyonlands_defconfig    gcc-16.2.0
powerpc                       katmai_defconfig    gcc-16.2.0
powerpc                      kmeter1_defconfig    gcc-16.2.0
powerpc                      ksi8560_defconfig    gcc-16.2.0
powerpc                       mgcoge_defconfig    gcc-16.2.0
powerpc                       pmac32_defconfig    gcc-16.2.0
powerpc                      rainier_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261107    clang-24
powerpc               randconfig-1001-20261107    clang-24
powerpc                      tqm8555_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261107    clang-24
powerpc64             randconfig-1001-20261107    clang-24
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                     nommu_k210_defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261107    gcc-11.5.0
riscv                 randconfig-1001-20261107    gcc-11.5.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261107    gcc-11.5.0
s390                  randconfig-1001-20261107    gcc-11.5.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                           r7780mp_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261107    gcc-11.5.0
sh                    randconfig-1001-20261107    gcc-11.5.0
sh                            se7343_defconfig    gcc-16.2.0
sh                            se7619_defconfig    gcc-16.2.0
sh                            se7712_defconfig    gcc-16.2.0
sh                            se7751_defconfig    gcc-16.2.0
sh                            sh2007_defconfig    gcc-16.2.0
sh                         sh7785lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261107    gcc-10.5.0
sparc                 randconfig-1001-20261107    gcc-10.5.0
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261107    gcc-10.5.0
sparc64               randconfig-1001-20261107    gcc-10.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261107    gcc-10.5.0
um                    randconfig-1001-20261107    gcc-10.5.0
um                            x86_64_defconfig    gcc-14
um                            x86_64_defconfig    gcc-16.2.0
x86_64                            alldefconfig    gcc-16.2.0
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261107    gcc-14
x86_64      buildonly-randconfig-1001-20261107    gcc-14
x86_64      buildonly-randconfig-1002-20261107    gcc-14
x86_64      buildonly-randconfig-1003-20261107    gcc-14
x86_64      buildonly-randconfig-1004-20261107    gcc-14
x86_64      buildonly-randconfig-1005-20261107    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261107    gcc-14
x86_64                randconfig-1001-20261107    gcc-14
x86_64                randconfig-1002-20261107    gcc-14
x86_64                randconfig-1003-20261107    gcc-14
x86_64                randconfig-1004-20261107    gcc-14
x86_64                randconfig-1005-20261107    gcc-14
x86_64                randconfig-1006-20261107    gcc-13
x86_64                randconfig-1007-20261107    gcc-13
x86_64                randconfig-1008-20261107    gcc-13
x86_64                randconfig-1009-20261107    gcc-13
x86_64                randconfig-1010-20261107    gcc-13
x86_64                randconfig-1011-20261107    gcc-13
x86_64                randconfig-1012-20261107    clang-22
x86_64                randconfig-1013-20261107    clang-22
x86_64                randconfig-1014-20261107    clang-22
x86_64                randconfig-1015-20261107    clang-22
x86_64                randconfig-1016-20261107    clang-22
x86_64                randconfig-1017-20261107    clang-22
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261107    gcc-10.5.0
xtensa                randconfig-1001-20261107    gcc-10.5.0
xtensa                          virt_defconfig    gcc-16.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
