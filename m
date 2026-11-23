Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459650;
	b=uChgGSq93GLjDXzLzoLjIQScRZcD7t/HAzokNgF4GCZ8WkehdZbNFMpqI6U3HrMNX06Y
	 +AS0b2X0fN7uKQDdnhoEcxKBSDjOmdMXjq7ri4av+4ASFLNMDddGUXDwPzRzoTV108cjP
	 PwoWQpSPSXKZKjzfDkZ4W5nCXm/HMt1H6PlCHcUZL2OcrO55jQJYc+JqKIktSLDU95Uiy
	 EujU3df0g15gJBIUgBezb+aoAAh+Pda3wpeskEC5BZ3DJdFT+If5iCJGpH4PIxlGAnB4w
	 t0xA//gl6Bj6Si5z9yTZBUZTS9saBR/yGsaFChYT2Rwe7kIOl2q7SYOeAeV7XW/u2gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459650;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=BFhk7KNw6tTjqC1vRODMwUqNQx4e84W/bgMoMm4CftU=;
	b=5YAJo12q/Y5B5UoDpQ7vUvE/q38v0EjUqlCbq6ZmnRre+bpLEy6Fp6ha6dR61uurGLsP
	 xfM7xwxuiAWi6YyJjzGYbc9O/wkmIEYgtsPx2eyaJ+ASSEsEFKvwb60erpyPKa1AVXiPM
	 VK0WQVzTs6ArJx1yD+kEYq+LKVRwzq2bZbqfcfVVzB0wVr3mAZjF6x5+HmFk9jh+4NdFA
	 rSxUJfzUHX8JmkfktzZTrY+0swtFbmiAMciyRUnMr9jj3tV3Lk7EF1fM3cHdIAIdjB3pV
	 bvL4EiDBCviHlHzoiXCgT7UYRX0n4EdK0oibOKTcmJ4yR4GlqCCF+8HIkQ/PP7RYaFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iEK9biQ0;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BFD606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 18:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89BFD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iEK9biQ0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795459649; x=1826995649;
  h=date:from:to:cc:subject:message-id;
  bh=f1e/luLKjcrwthB+P0GZhiXZfqS2Bhpstj/Y+iE9YKg=;
  b=iEK9biQ0b+InEjgMpATweReBklhpVszpBu+Nn9V7dityIvIStlM0/mOa
   Q1BkwAcQpgetlKzR2PnY59Ab9FurkXWtCCjEVXvRmAwSiLOMWwDFzcQwc
   fFTNzj/tnkX8tsg0EBA/IEO/NuqN6bhCVbeQU7eMN78nFOAS+iCGzUlFS
   hR8l4vCagXBMj7P/bhXC1usiH9qrW/98MqAUVQ86ZMfSvIuOOBMLGpBDK
   3eA1B71+bpdXd1nqsVVFSMwC//YR5C5+qcINytDnwLpvX6KQm99eyQJLY
   JtEPq2eAr6MbxKg4Yn9ellGj4TsagxGNCzzVAsoNF76CA91Shdlm/2SJJ
   w==;
X-CSE-ConnectionGUID: jHxSzmxvTe+yKA1Gr+2/bg==
X-CSE-MsgGUID: uhaQRTO2RYCs1FJze06kmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4323512"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4323512"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:47:29 -0800
X-CSE-ConnectionGUID: 5/XZgvuERPCVjkmGfth7wA==
X-CSE-MsgGUID: ZumudOEWSaKdBOgOFCd3xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11274316"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Nov 2026 10:47:28 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVZ4X-00000001Nig-2kGU;
	Mon, 23 Nov 2026 18:47:25 +0000
Date: Tue, 24 Nov 2026 02:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:next] BUILD SUCCESS
 ccf78740d63813c452c035b57d17a650492562fa
Message-ID: <20261124024650.9mbVZzr7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list

tree/branch: git://linuxtv.org/sailus/media_tree.git next
branch HEAD: ccf78740d63813c452c035b57d17a650492562fa  media: i2c: ov8856: Enable runtime PM before registering the sub-device

elapsed time: 2696m

configs tested: 229
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                 randconfig-2000-20261121    gcc-16.2.0
alpha                 randconfig-2001-20261121    gcc-14.4.0
alpha                randconfig-r2104-20261121    gcc-16.2.0 cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                   randconfig-2200-20261120    gcc-15.3.0 smatch
arc                  randconfig-r2103-20261121    gcc-13.5.0 cocci
arc                  randconfig-r2301-20261120    gcc-10.5.0 sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                  randconfig-r2100-20261121    gcc-8.5.0  cocci
arm                  randconfig-r2106-20261120    gcc-14.4.0 cocci
arm                              rpc_defconfig    gcc-16.2.0
arm                          wpcm450_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                 randconfig-1000-20261123    clang-17
arm64                 randconfig-1001-20261123    clang-17
arm64                 randconfig-1002-20261123    clang-17
arm64                 randconfig-1003-20261123    clang-17
arm64                 randconfig-2200-20261120    clang-17   smatch
arm64                randconfig-r2105-20261121    gcc-8.5.0  cocci
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                  randconfig-1000-20261123    clang-17
csky                  randconfig-1001-20261123    clang-17
csky                  randconfig-2000-20261121    gcc-16.2.0
csky                  randconfig-2001-20261121    gcc-16.2.0
csky                  randconfig-2200-20261120    gcc-15.3.0 smatch
csky                 randconfig-r2111-20261120    gcc-16.2.0 cocci
hexagon                            allnoconfig    gcc-16.2.0
hexagon               randconfig-2000-20261121    clang-24
hexagon               randconfig-2001-20261121    clang-24
hexagon               randconfig-2200-20261120    clang-17   smatch
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386                  randconfig-2000-20261120    gcc-14
i386                  randconfig-2001-20261120    gcc-14
i386                  randconfig-2002-20261120    clang-22
i386                  randconfig-2003-20261120    clang-22
i386                  randconfig-2004-20261120    clang-22
i386                  randconfig-2005-20261120    clang-22
i386                  randconfig-2100-20261120    clang-22   cocci
i386                  randconfig-2101-20261120    gcc-14     cocci
i386                  randconfig-2102-20261120    gcc-14     cocci
i386                  randconfig-2103-20261120    clang-22   cocci
i386                  randconfig-2104-20261120    gcc-14     cocci
i386                  randconfig-2105-20261120    gcc-12     cocci
i386                  randconfig-2200-20261120    clang-22   smatch
i386                 randconfig-r2102-20261121    gcc-14     cocci
i386                 randconfig-r2300-20261120    clang-22   sparse
i386                 randconfig-r2302-20261120    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-2000-20261120    clang-24
loongarch             randconfig-2001-20261120    clang-20
loongarch             randconfig-2200-20261120    clang-18   smatch
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5329evb_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261121    gcc-13.5.0
m68k                  randconfig-2001-20261121    gcc-8.5.0
m68k                  randconfig-2200-20261120    gcc-14.4.0 smatch
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261121    gcc-8.5.0
microblaze            randconfig-2001-20261121    gcc-10.5.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                           ath25_defconfig    gcc-16.2.0
mips                       fuloong2e_defconfig    gcc-16.2.0
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261120    gcc-15.3.0
mips                  randconfig-2001-20261120    clang-19
mips                  randconfig-2002-20261120    gcc-11.5.0
mips                  randconfig-2200-20261121    clang-21   smatch
mips                 randconfig-r2105-20261121    gcc-9.5.0  cocci
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-2000-20261120    gcc-8.5.0
nios2                 randconfig-2001-20261120    gcc-8.5.0
nios2                 randconfig-2200-20261120    gcc-11.5.0 smatch
nios2                randconfig-r2305-20261120    gcc-11.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc              randconfig-2000-20261120    gcc-9.5.0
openrisc              randconfig-2001-20261120    gcc-11.5.0
openrisc              randconfig-2002-20261120    gcc-9.5.0
openrisc              randconfig-2200-20261120    gcc-11.5.0 smatch
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                randconfig-1000-20261123    clang-24
parisc                randconfig-1001-20261123    clang-24
parisc                randconfig-2000-20261120    gcc-8.5.0
parisc                randconfig-2001-20261120    gcc-13.5.0
parisc                randconfig-2200-20261120    gcc-8.5.0  smatch
parisc               randconfig-r2110-20261120    gcc-11.5.0 cocci
parisc64                             defconfig    clang-24
powerpc                            allnoconfig    clang-24
powerpc               randconfig-1000-20261123    clang-24
powerpc               randconfig-1001-20261123    clang-24
powerpc               randconfig-2000-20261120    clang-17
powerpc               randconfig-2001-20261120    clang-19
powerpc               randconfig-2002-20261120    clang-24
powerpc               randconfig-2200-20261121    gcc-11.5.0 smatch
powerpc              randconfig-r2303-20261120    clang-24   sparse
powerpc64             randconfig-1000-20261123    clang-24
powerpc64             randconfig-1001-20261123    clang-24
powerpc64             randconfig-2000-20261120    clang-24
powerpc64             randconfig-2001-20261120    clang-24
powerpc64             randconfig-2002-20261120    clang-18
powerpc64             randconfig-2200-20261121    gcc-10.5.0 smatch
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                 randconfig-2000-20261120    clang-24
riscv                 randconfig-2001-20261120    gcc-10.5.0
riscv                 randconfig-2002-20261120    gcc-8.5.0
riscv                 randconfig-2003-20261120    clang-24
riscv                 randconfig-2004-20261120    clang-20
riscv                 randconfig-2005-20261120    gcc-10.5.0
riscv                 randconfig-2200-20261120    gcc-8.5.0  smatch
riscv                randconfig-r2101-20261121    gcc-13.5.0 cocci
riscv                randconfig-r2102-20261121    gcc-15.3.0 cocci
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                  randconfig-2000-20261120    gcc-8.5.0
s390                  randconfig-2001-20261120    clang-24
s390                  randconfig-2002-20261120    clang-24
s390                  randconfig-2003-20261120    clang-24
s390                  randconfig-2004-20261120    gcc-16.2.0
s390                  randconfig-2005-20261120    clang-24
s390                  randconfig-2200-20261120    clang-17   smatch
s390                 randconfig-r2104-20261121    clang-24   cocci
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                    randconfig-2000-20261120    gcc-16.2.0
sh                    randconfig-2001-20261120    gcc-16.2.0
sh                    randconfig-2002-20261120    gcc-16.2.0
sh                    randconfig-2003-20261120    gcc-11.5.0
sh                    randconfig-2004-20261120    gcc-16.2.0
sh                    randconfig-2005-20261120    gcc-15.3.0
sh                    randconfig-2200-20261120    gcc-11.5.0 smatch
sh                   randconfig-r2100-20261121    gcc-16.2.0 cocci
sh                              shx3_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                 randconfig-1000-20261123    gcc-14
sparc                 randconfig-1001-20261123    gcc-14
sparc                 randconfig-2000-20261120    gcc-16.2.0
sparc                 randconfig-2001-20261120    gcc-8.5.0
sparc64                           allmodconfig    clang-20
sparc64               randconfig-1000-20261123    gcc-14
sparc64               randconfig-1001-20261123    gcc-14
sparc64               randconfig-2000-20261120    gcc-8.5.0
sparc64               randconfig-2001-20261120    gcc-8.5.0
sparc64               randconfig-2200-20261120    gcc-14.4.0 smatch
sparc64              randconfig-r2103-20261121    gcc-15.3.0 cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                    randconfig-1000-20261123    gcc-14
um                    randconfig-1001-20261123    gcc-14
um                    randconfig-2000-20261120    clang-24
um                    randconfig-2001-20261120    gcc-14
um                    randconfig-2200-20261121    gcc-14     smatch
um                   randconfig-r2107-20261120    clang-24   cocci
um                   randconfig-r2108-20261120    gcc-14     cocci
um                   randconfig-r2304-20261120    gcc-14     sparse
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261123    clang-22
x86_64      buildonly-randconfig-1001-20261123    clang-22
x86_64      buildonly-randconfig-1002-20261123    clang-22
x86_64      buildonly-randconfig-1003-20261123    clang-22
x86_64      buildonly-randconfig-1004-20261123    clang-22
x86_64      buildonly-randconfig-1005-20261123    clang-22
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261123    gcc-14
x86_64                randconfig-1001-20261123    gcc-14
x86_64                randconfig-1002-20261123    gcc-14
x86_64                randconfig-1003-20261123    gcc-14
x86_64                randconfig-1004-20261123    gcc-14
x86_64                randconfig-1005-20261123    gcc-14
x86_64                randconfig-1012-20261123    gcc-14
x86_64                randconfig-1013-20261123    gcc-14
x86_64                randconfig-1014-20261123    gcc-14
x86_64                randconfig-1015-20261123    gcc-14
x86_64                randconfig-1016-20261123    gcc-14
x86_64                randconfig-1017-20261123    gcc-14
x86_64                randconfig-2000-20261120    gcc-14
x86_64                randconfig-2001-20261120    gcc-14
x86_64                randconfig-2002-20261120    clang-22
x86_64                randconfig-2003-20261120    clang-22
x86_64                randconfig-2004-20261120    clang-22
x86_64                randconfig-2005-20261120    gcc-14
x86_64                randconfig-2100-20261120    gcc-14     cocci
x86_64                randconfig-2101-20261120    gcc-14     cocci
x86_64                randconfig-2102-20261120    gcc-14     cocci
x86_64                randconfig-2103-20261120    clang-22   cocci
x86_64                randconfig-2104-20261120    clang-22   cocci
x86_64                randconfig-2105-20261120    clang-22   cocci
x86_64                randconfig-2200-20261120    clang-22   smatch
x86_64               randconfig-r2109-20261120    gcc-13     cocci
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261123    gcc-14
xtensa                randconfig-1001-20261123    gcc-14
xtensa                randconfig-2000-20261121    gcc-8.5.0
xtensa                randconfig-2001-20261121    gcc-12.5.0
xtensa                randconfig-2200-20261120    gcc-9.5.0  smatch
xtensa                     smp_lx200_defconfig    gcc-16.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
