Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530063;
	b=pt/5jc9oZDnTLbP5aqlfHzz+xbPTKPzddQpAyrqZmwqZq8P5nPJOGpVamJcm/LG8NjbM
	 sUecQBpanRPsbAg0kuylFWTesXxF9nxLm6jNxXYyZ7jCxMhpGEPVG2DPZ6Chzu3BkKfGB
	 jAhz+CUNny4tU1I/Dh6XLOMby/PPnOUBi/BMSrm1bLPx2lpw0WmZu14uAb92tYrd3HS2V
	 QszEt7Ff60SBuqFmkDPy9UnsJCC0CSNtN6Ru/6wzrQEEXRn+tzvcVPgFjW2hCFYZZplJN
	 HH3ISlypBF1WW4UXBDqVhmoV2ymZKPEHbfYfU5MbtLCv+KqIvoBF+PyLV6uuRHkoxSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530063;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mgZRkqwcQYVNmus7HO36DDbC47X8YkElt1V5ACQr/HM=;
	b=qB43uIXBGKxNvE+KePSJAvUbF86f0uqs7yC5OeJ9OXez8qudx9nEZocAVLYrGk+6RZiT
	 AMJVmqOppId3xLKqOdwrdxS48jBVbhU0nKAPhV6kNSp/6ycQ6umKD10KHzkf2DH5ZzLIZ
	 m/7bDUSk96dWN4aOGjT4tWx5xVGo5gsGQhTKCmIpoDqU7YIfpoHevS823KVwabMwrdcAH
	 xx6LXUBEMj/a1Y9wbnKUN+imnfKKN7uKPvO/4shysRdRFJUp4k9dr5x7/jr2pNFfulhGE
	 FhrUbyacnqieiVM2wofyqpSd4ToThPgD5z52ve9X5bjmzdA5SE9P4SObFsJcujtXUig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C9feKR1X;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143F5606A88E
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 00:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 143F5606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C9feKR1X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794530063; x=1826066063;
  h=date:from:to:cc:subject:message-id;
  bh=5ukAHWekpKyqqSu8R2LtDRLkMH9cJ8lU7I8I5rmoABI=;
  b=C9feKR1XxC6bZGZ8ygb4NpChFalqj/BsVFkEk7FkwdXSeL82Uj6rl8TK
   Z09QwFIb73IS2L0OEmYYfSq0QUWlnLopDxyAswCdNwWGF0cQ0qCt8DmbW
   MHZ1K94HIibF1GhVkiUEAyVYo3cSKJnOmqRvRnzAPLCcO+kr6NElR5KTf
   9iOxTpEWm5ysI4h1v1jt4r4DeyGekUEFrlE/KDg5XvSJ/zMT/WGVbHnpB
   2kIe9lav2a+3zn8zrrSRLBW871Sxd+X4r+QJhJYdtTqhpm3qMFvv5lGH/
   F7whaSnEsg3J+UcC8d1tV6WqC85Fd/CcmoMvAWbJIWhIJhrzQ900eKe4C
   w==;
X-CSE-ConnectionGUID: NbpMzTjUQ32QmOjdD7WnPA==
X-CSE-MsgGUID: UL8r5ITpSHmpV4ZIodwh/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3368070"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3368070"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 16:34:22 -0800
X-CSE-ConnectionGUID: ffUr6bj3RLaTyw2Rmrm5qg==
X-CSE-MsgGUID: 29Zr0ypxSJq8dwUttjDfAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="9125225"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Nov 2026 16:34:20 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRfFB-000000012EN-2h7w;
	Fri, 13 Nov 2026 00:34:17 +0000
Date: Fri, 13 Nov 2026 08:33:23 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:fixes] BUILD SUCCESS
 b1466305390c6368148cf456278139ef4deebe89
Message-ID: <20261113083323.xKqH5gW6-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git fixes
branch HEAD: b1466305390c6368148cf456278139ef4deebe89  media: videobuf2: finish prepared buffers in VIDIOC_REMOVE_BUFS

elapsed time: 970m

configs tested: 267
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             alldefconfig    gcc-16.2.0
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261112    clang-24
arc                   randconfig-1000-20261113    gcc-10.5.0
arc                   randconfig-1001-20261112    clang-24
arc                   randconfig-1001-20261113    gcc-10.5.0
arm                               alldefconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                             dove_defconfig    gcc-16.2.0
arm                           gemini_defconfig    gcc-16.2.0
arm                            imxrt_defconfig    gcc-16.2.0
arm                       integrator_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261112    clang-24
arm                   randconfig-1000-20261113    gcc-10.5.0
arm                   randconfig-1001-20261112    clang-24
arm                   randconfig-1001-20261113    gcc-10.5.0
arm                   randconfig-1002-20261112    clang-24
arm                   randconfig-1002-20261113    gcc-10.5.0
arm                   randconfig-1003-20261112    clang-24
arm                   randconfig-1003-20261113    gcc-10.5.0
arm                          s3c6400_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261112    gcc-14.4.0
arm64                 randconfig-1001-20261112    gcc-14.4.0
arm64                 randconfig-1002-20261112    gcc-14.4.0
arm64                 randconfig-1003-20261112    gcc-14.4.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261112    gcc-14.4.0
csky                  randconfig-1001-20261112    gcc-14.4.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261112    clang-24
hexagon               randconfig-1000-20261113    clang-24
hexagon               randconfig-1001-20261112    clang-24
hexagon               randconfig-1001-20261113    clang-24
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261112    clang-22
i386        buildonly-randconfig-1000-20261113    clang-22
i386        buildonly-randconfig-1001-20261112    clang-22
i386        buildonly-randconfig-1001-20261113    clang-22
i386        buildonly-randconfig-1002-20261112    clang-22
i386        buildonly-randconfig-1002-20261113    clang-22
i386        buildonly-randconfig-1003-20261112    clang-22
i386        buildonly-randconfig-1003-20261113    clang-22
i386        buildonly-randconfig-1004-20261112    clang-22
i386        buildonly-randconfig-1004-20261113    clang-22
i386        buildonly-randconfig-1005-20261112    clang-22
i386        buildonly-randconfig-1005-20261113    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261112    gcc-14
i386                  randconfig-1001-20261112    gcc-14
i386                  randconfig-1002-20261112    gcc-14
i386                  randconfig-1003-20261112    gcc-14
i386                  randconfig-1004-20261112    gcc-14
i386                  randconfig-1005-20261112    gcc-14
i386                  randconfig-1006-20261112    gcc-14
i386                  randconfig-1007-20261112    clang-22
i386                  randconfig-1007-20261113    clang-22
i386                  randconfig-1008-20261112    clang-22
i386                  randconfig-1008-20261113    clang-22
i386                  randconfig-1009-20261112    clang-22
i386                  randconfig-1009-20261113    clang-22
i386                  randconfig-1010-20261112    clang-22
i386                  randconfig-1010-20261113    clang-22
i386                  randconfig-1011-20261112    clang-22
i386                  randconfig-1011-20261113    clang-22
i386                  randconfig-1012-20261112    clang-22
i386                  randconfig-1012-20261113    clang-22
i386                  randconfig-1013-20261112    clang-22
i386                  randconfig-1013-20261113    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    gcc-16.2.0
loongarch             randconfig-1000-20261112    clang-24
loongarch             randconfig-1000-20261113    clang-24
loongarch             randconfig-1001-20261112    clang-24
loongarch             randconfig-1001-20261113    clang-24
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.2.0
m68k                        m5282evb_defconfig    gcc-16.2.0
m68k                             mac_defconfig    gcc-16.2.0
m68k                         mvme147_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                        bmips_be_defconfig    gcc-16.2.0
mips                      decstation_defconfig    gcc-16.2.0
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                            ip28_defconfig    gcc-16.2.0
mips                         maltaup_defconfig    gcc-16.2.0
mips                       pic32mzda_defconfig    gcc-16.2.0
mips                        rbtx49xx_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261112    clang-24
nios2                 randconfig-1000-20261113    clang-24
nios2                 randconfig-1001-20261112    clang-24
nios2                 randconfig-1001-20261113    clang-24
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261112    gcc-12.5.0
parisc                randconfig-1000-20261113    gcc-13.5.0
parisc                randconfig-1001-20261112    gcc-12.5.0
parisc                randconfig-1001-20261113    gcc-13.5.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                         icon_defconfig    gcc-16.2.0
powerpc                  mpc832x_rdb_defconfig    gcc-16.2.0
powerpc                       ppc64e_defconfig    gcc-16.2.0
powerpc                       ppc6xx_defconfig    gcc-16.2.0
powerpc                      rainier_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261112    gcc-12.5.0
powerpc               randconfig-1000-20261113    gcc-13.5.0
powerpc               randconfig-1001-20261112    gcc-12.5.0
powerpc               randconfig-1001-20261113    gcc-13.5.0
powerpc                  xes_mpc85xx_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261112    gcc-12.5.0
powerpc64             randconfig-1000-20261113    gcc-13.5.0
powerpc64             randconfig-1001-20261112    gcc-12.5.0
powerpc64             randconfig-1001-20261113    gcc-13.5.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261112    gcc-9.5.0
riscv                 randconfig-1000-20261113    gcc-12.5.0
riscv                 randconfig-1001-20261112    gcc-9.5.0
riscv                 randconfig-1001-20261113    gcc-12.5.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261112    gcc-9.5.0
s390                  randconfig-1000-20261113    gcc-12.5.0
s390                  randconfig-1001-20261112    gcc-9.5.0
s390                  randconfig-1001-20261113    gcc-12.5.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                           kfr2r09_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261112    gcc-9.5.0
sh                    randconfig-1000-20261113    gcc-12.5.0
sh                    randconfig-1001-20261112    gcc-9.5.0
sh                    randconfig-1001-20261113    gcc-12.5.0
sh                           rsk7269_defconfig    gcc-16.2.0
sh                      sh7710voipgw_defconfig    gcc-16.2.0
sh                         sh7757lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261112    gcc-8.5.0
sparc                 randconfig-1000-20261113    gcc-8.5.0
sparc                 randconfig-1001-20261112    gcc-8.5.0
sparc                 randconfig-1001-20261113    gcc-8.5.0
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261112    gcc-8.5.0
sparc64               randconfig-1000-20261113    gcc-8.5.0
sparc64               randconfig-1001-20261112    gcc-8.5.0
sparc64               randconfig-1001-20261113    gcc-8.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261112    gcc-8.5.0
um                    randconfig-1000-20261113    gcc-8.5.0
um                    randconfig-1001-20261112    gcc-8.5.0
um                    randconfig-1001-20261113    gcc-8.5.0
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261112    gcc-14
x86_64      buildonly-randconfig-1000-20261113    clang-22
x86_64      buildonly-randconfig-1001-20261112    gcc-14
x86_64      buildonly-randconfig-1001-20261113    clang-22
x86_64      buildonly-randconfig-1002-20261112    gcc-14
x86_64      buildonly-randconfig-1002-20261113    clang-22
x86_64      buildonly-randconfig-1003-20261112    gcc-14
x86_64      buildonly-randconfig-1003-20261113    clang-22
x86_64      buildonly-randconfig-1004-20261112    gcc-14
x86_64      buildonly-randconfig-1004-20261113    clang-22
x86_64      buildonly-randconfig-1005-20261112    gcc-14
x86_64      buildonly-randconfig-1005-20261113    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261112    clang-22
x86_64                randconfig-1000-20261113    clang-22
x86_64                randconfig-1001-20261112    clang-22
x86_64                randconfig-1001-20261113    clang-22
x86_64                randconfig-1002-20261112    clang-22
x86_64                randconfig-1002-20261113    clang-22
x86_64                randconfig-1003-20261112    clang-22
x86_64                randconfig-1003-20261113    clang-22
x86_64                randconfig-1004-20261112    clang-22
x86_64                randconfig-1004-20261113    clang-22
x86_64                randconfig-1005-20261112    clang-22
x86_64                randconfig-1005-20261113    clang-22
x86_64                randconfig-1006-20261112    gcc-14
x86_64                randconfig-1006-20261113    clang-22
x86_64                randconfig-1007-20261112    gcc-14
x86_64                randconfig-1007-20261113    clang-22
x86_64                randconfig-1008-20261112    gcc-14
x86_64                randconfig-1008-20261113    clang-22
x86_64                randconfig-1009-20261112    gcc-14
x86_64                randconfig-1009-20261113    clang-22
x86_64                randconfig-1010-20261112    gcc-14
x86_64                randconfig-1010-20261113    clang-22
x86_64                randconfig-1011-20261112    gcc-14
x86_64                randconfig-1011-20261113    clang-22
x86_64                randconfig-1012-20261112    clang-22
x86_64                randconfig-1012-20261113    gcc-14
x86_64                randconfig-1013-20261112    clang-22
x86_64                randconfig-1013-20261113    gcc-14
x86_64                randconfig-1014-20261112    clang-22
x86_64                randconfig-1014-20261113    gcc-14
x86_64                randconfig-1015-20261112    clang-22
x86_64                randconfig-1015-20261113    gcc-14
x86_64                randconfig-1016-20261112    clang-22
x86_64                randconfig-1016-20261113    gcc-14
x86_64                randconfig-1017-20261112    clang-22
x86_64                randconfig-1017-20261113    gcc-14
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261112    gcc-8.5.0
xtensa                randconfig-1000-20261113    gcc-8.5.0
xtensa                randconfig-1001-20261112    gcc-8.5.0
xtensa                randconfig-1001-20261113    gcc-8.5.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
