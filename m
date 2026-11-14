Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794644950;
	b=IUAKV0nI/OVVg+pGyxUPSg7BrldJGMj+n6a+qiFI1eUPHSwaVsqSbskGs11VSOQBIvuv
	 zet6sdTzAHdVoS8Lgj3jAoRuz439nNlG7owutCfOvRZLyHqSAMnDGcGKtNiEmUlZ+yCMt
	 IqZqMkmfDX3N/rG9iPeaAbjpfTuHsM8sfgeU7MnHltEunFGlYAvxdyAyyTq6ZL50Gq+3w
	 iwNLSZE1MfwzmNGxzrugfAbm3zrbxbCzq5wLQlfqxt6VaW4MQ40fk/seFtqfs8laajdpa
	 zq0wOoUHgqGTgVUemiygZMRsdFou83tW8DKVGfNd/LgJzlg7BTz3csBhozFB73kmF+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794644950;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=KMlBLJWYWBbKawJ5eWPeDX2ngr2KF4zXe88L2BmMmHQ=;
	b=1AmqWUdZwwuz/gssFAXh6d8qQXgghesoesyDnGaX5aUnpRbtVGPkCJO4I3fzGONp90Yg
	 BD54vMhKY6kIUtskDUeAg/ICArAZQrNkJCnvKMOmJuFF0NhGYaLjnuoSMx2zEzM3Ql3s3
	 Gn5q2D+eYPRcrBAFi4tW5VeNRb5eZ4u769Gg/f0uItwk9ZLJ4Pucam++XcTR0bQAfPw8O
	 I2v3Kgq3CFDGjQQKceFXU5deJAmrUX0t0Blh7pE2Q2x+7Dy8qa3MdLyeaBuftkGXPKFNC
	 w8L7ixuQ3eT7QpBI6defjT4dsP4luRG/XvtOedAsUoF42AIhRyYXmDh1H6wiVjORNGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cuKjV4uA;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BC0606A327
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 08:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83BC0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cuKjV4uA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794644950; x=1826180950;
  h=date:from:to:cc:subject:message-id;
  bh=YyYOd0S76+L5+bsHfZm5QHIKzZgVwBLLAV2aev70vgY=;
  b=cuKjV4uALenNg+C2jdAzdzmFJsA6OCj71gwHPo6J5MWAy/cwmcaw0Cz+
   TEvqcXt2O6/GKgMrrOKAU14VddAPWudFCh0eIg/nlp8Y0o01XNwPtKDaN
   tkXdXiJyqfdFk7agHgA2+RvMfpiHt9V4J3dZAoPp6ikgiuNuisnTeTF4q
   c8lCjAkCgqFHS+VjvvhF+jHdFEHTrnJWbP4+u7gZO7FRpspk8oWTPUXwv
   SQ3etKgydEqBC+WikfV7FEFjLsKWkYJ/gb0kdfAxdeDH3Z4Jm6FEWxMHb
   ttImtkqm/uL+zygW8UwMqpWFdwvRehpJd4vB3+jNHDgRW9hlQ4xAvzJRE
   w==;
X-CSE-ConnectionGUID: U/e2up1DTha1znUwNlKrfA==
X-CSE-MsgGUID: yHXg5Q4YQhelwwzwvwc7wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3324196"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3324196"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 00:29:09 -0800
X-CSE-ConnectionGUID: H5qx2wmST22wk+FaudzWPQ==
X-CSE-MsgGUID: 0laaq4K6TRC4/01xKhjZRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="10894501"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 14 Nov 2026 00:29:07 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS98D-000000015B7-1S7X;
	Sat, 14 Nov 2026 08:29:05 +0000
Date: Sat, 14 Nov 2026 16:28:20 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 42b94ef7358f04a0ad2e3541a0db307ed39402f1
Message-ID: <20261114162820.Tu4kEbiv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 42b94ef7358f04a0ad2e3541a0db307ed39402f1  staging: media: tegra-video: use dev_err_probe() in CSI/VI probe

elapsed time: 1501m

configs tested: 328
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261112    gcc-10.5.0
alpha                 randconfig-2001-20261112    gcc-10.5.0
alpha                 randconfig-2200-20261112    gcc-15.3.0 smatch
alpha                randconfig-r2102-20261112    gcc-16.2.0 cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261113    gcc-10.5.0
arc                   randconfig-1001-20261113    gcc-10.5.0
arc                   randconfig-2000-20261112    gcc-8.5.0
arc                   randconfig-2001-20261112    gcc-8.5.0
arc                   randconfig-2002-20261112    gcc-8.5.0
arc                   randconfig-2003-20261112    gcc-8.5.0
arc                   randconfig-2004-20261112    gcc-8.5.0
arc                   randconfig-2005-20261112    gcc-8.5.0
arc                   randconfig-2200-20261112    gcc-8.5.0  smatch
arc                  randconfig-r2103-20261112    gcc-16.2.0 cocci
arc                  randconfig-r2305-20261112    clang-24   sparse
arc                  randconfig-r2311-20261112    gcc-9.5.0  sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                        aspeed_g4_defconfig    clang-17
arm                                  defconfig    gcc-16.2.0
arm                       footbridge_defconfig    clang-17
arm                           pxa168_defconfig    clang-17
arm                   randconfig-1000-20261113    gcc-10.5.0
arm                   randconfig-1001-20261113    gcc-10.5.0
arm                   randconfig-1002-20261113    gcc-10.5.0
arm                   randconfig-1003-20261113    gcc-10.5.0
arm                   randconfig-2000-20261112    gcc-11.5.0
arm                   randconfig-2001-20261112    gcc-11.5.0
arm                   randconfig-2002-20261112    gcc-11.5.0
arm                   randconfig-2200-20261112    gcc-10.5.0 smatch
arm                  randconfig-r2101-20261112    gcc-11.5.0 cocci
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-2000-20261112    gcc-11.5.0
arm64                 randconfig-2001-20261112    gcc-11.5.0
arm64                 randconfig-2002-20261112    gcc-11.5.0
arm64                 randconfig-2200-20261112    clang-24   smatch
arm64                randconfig-r2302-20261112    gcc-8.5.0  sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-2000-20261112    gcc-16.2.0
csky                  randconfig-2001-20261112    gcc-16.2.0
csky                  randconfig-2200-20261112    gcc-11.5.0 smatch
csky                 randconfig-r2104-20261112    gcc-15.3.0 cocci
csky                 randconfig-r2107-20261112    gcc-16.2.0 cocci
csky                 randconfig-r2111-20261112    gcc-16.2.0 cocci
csky                 randconfig-r2301-20261112    gcc-8.5.0  sparse
csky                 randconfig-r2303-20261112    clang-24   sparse
csky                 randconfig-r2309-20261112    gcc-14     sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261113    clang-24
hexagon               randconfig-1001-20261113    clang-24
hexagon               randconfig-2000-20261112    gcc-16.2.0
hexagon               randconfig-2001-20261112    gcc-16.2.0
hexagon               randconfig-2200-20261112    clang-22   smatch
hexagon              randconfig-r2105-20261112    gcc-16.2.0 cocci
hexagon              randconfig-r2106-20261112    clang-20   cocci
hexagon              randconfig-r2106-20261112    gcc-12.5.0 cocci
hexagon              randconfig-r2302-20261112    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1007-20261114    clang-22
i386                  randconfig-1008-20261114    clang-22
i386                  randconfig-1009-20261114    clang-22
i386                  randconfig-1010-20261114    clang-22
i386                  randconfig-1011-20261114    clang-22
i386                  randconfig-1012-20261114    clang-22
i386                  randconfig-1013-20261114    clang-22
i386                  randconfig-2000-20261112    gcc-14
i386                  randconfig-2001-20261112    gcc-14
i386                  randconfig-2002-20261112    gcc-14
i386                  randconfig-2003-20261112    gcc-14
i386                  randconfig-2004-20261112    gcc-14
i386                  randconfig-2005-20261112    gcc-14
i386                  randconfig-2100-20261112    clang-22   cocci
i386                  randconfig-2101-20261112    clang-22   cocci
i386                  randconfig-2102-20261112    clang-22   cocci
i386                  randconfig-2103-20261112    clang-22   cocci
i386                  randconfig-2104-20261112    clang-22   cocci
i386                  randconfig-2105-20261112    clang-22   cocci
i386                  randconfig-2200-20261112    gcc-14     smatch
i386                  randconfig-2300-20261112    clang-22   sparse
i386                  randconfig-2301-20261112    clang-22   sparse
i386                  randconfig-2302-20261112    clang-22   sparse
i386                 randconfig-r2102-20261112    gcc-15.3.0 cocci
i386                 randconfig-r2105-20261112    gcc-15.3.0 cocci
i386                 randconfig-r2106-20261112    gcc-16.2.0 cocci
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261113    clang-24
loongarch             randconfig-1001-20261113    clang-24
loongarch             randconfig-2000-20261112    gcc-9.5.0
loongarch             randconfig-2001-20261112    gcc-9.5.0
loongarch             randconfig-2200-20261112    clang-24   smatch
loongarch            randconfig-r2100-20261112    gcc-11.5.0 cocci
loongarch            randconfig-r2107-20261112    clang-20   cocci
loongarch            randconfig-r2303-20261112    gcc-8.5.0  sparse
loongarch            randconfig-r2306-20261112    gcc-14     sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    clang-17
m68k                  randconfig-2000-20261112    gcc-10.5.0
m68k                  randconfig-2001-20261112    gcc-10.5.0
m68k                  randconfig-2200-20261112    gcc-14.4.0 smatch
m68k                 randconfig-r2101-20261112    gcc-16.2.0 cocci
m68k                 randconfig-r2109-20261112    gcc-16.2.0 cocci
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261112    gcc-10.5.0
microblaze            randconfig-2001-20261112    gcc-10.5.0
microblaze            randconfig-2200-20261112    gcc-15.3.0 smatch
microblaze           randconfig-r2108-20261112    gcc-16.2.0 cocci
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                          db1xxx_defconfig    clang-17
mips                            ip32_defconfig    clang-17
mips                  randconfig-2000-20261112    gcc-13.5.0
mips                  randconfig-2001-20261112    gcc-13.5.0
mips                  randconfig-2002-20261112    gcc-13.5.0
mips                  randconfig-2200-20261112    gcc-13.5.0 smatch
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261113    clang-24
nios2                 randconfig-1001-20261113    clang-24
nios2                 randconfig-2000-20261112    gcc-9.5.0
nios2                 randconfig-2001-20261112    gcc-9.5.0
nios2                 randconfig-2200-20261112    gcc-11.5.0 smatch
nios2                randconfig-r2110-20261112    gcc-16.2.0 cocci
nios2                randconfig-r2310-20261112    gcc-9.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261112    gcc-13.5.0
openrisc              randconfig-2001-20261112    gcc-13.5.0
openrisc              randconfig-2002-20261112    gcc-13.5.0
openrisc              randconfig-2200-20261112    gcc-16.2.0 smatch
openrisc             randconfig-r2104-20261112    gcc-11.5.0 cocci
openrisc             randconfig-r2107-20261112    gcc-12.5.0 cocci
openrisc             randconfig-r2301-20261112    clang-24   sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261114    gcc-8.5.0
parisc                randconfig-1001-20261114    gcc-8.5.0
parisc                randconfig-2000-20261112    gcc-9.5.0
parisc                randconfig-2001-20261112    gcc-9.5.0
parisc                randconfig-2200-20261112    gcc-8.5.0  smatch
parisc               randconfig-r2102-20261112    gcc-11.5.0 cocci
parisc               randconfig-r2305-20261112    gcc-8.5.0  sparse
parisc               randconfig-r2308-20261112    gcc-9.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                  mpc8313_rdb_defconfig    clang-17
powerpc               randconfig-1000-20261114    gcc-8.5.0
powerpc               randconfig-1001-20261114    gcc-8.5.0
powerpc               randconfig-2000-20261112    clang-17
powerpc               randconfig-2001-20261112    clang-17
powerpc               randconfig-2002-20261112    clang-17
powerpc               randconfig-2200-20261112    clang-24   smatch
powerpc              randconfig-r2109-20261112    gcc-12.5.0 cocci
powerpc              randconfig-r2310-20261112    gcc-14     sparse
powerpc64             randconfig-1000-20261114    gcc-8.5.0
powerpc64             randconfig-1001-20261114    gcc-8.5.0
powerpc64             randconfig-2000-20261112    clang-17
powerpc64             randconfig-2001-20261112    clang-17
powerpc64             randconfig-2002-20261112    clang-17
powerpc64            randconfig-r2100-20261112    gcc-15.3.0 cocci
powerpc64            randconfig-r2110-20261112    gcc-12.5.0 cocci
powerpc64            randconfig-r2300-20261112    clang-24   sparse
powerpc64            randconfig-r2304-20261112    clang-24   sparse
powerpc64            randconfig-r2307-20261112    gcc-14     sparse
powerpc64            randconfig-r2308-20261112    gcc-14     sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-2000-20261112    clang-19
riscv                 randconfig-2001-20261112    clang-19
riscv                 randconfig-2002-20261112    clang-19
riscv                 randconfig-2003-20261112    clang-19
riscv                 randconfig-2004-20261112    clang-19
riscv                 randconfig-2005-20261112    clang-19
riscv                 randconfig-2200-20261112    clang-24   smatch
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-2000-20261112    clang-24
s390                  randconfig-2001-20261112    clang-24
s390                  randconfig-2002-20261112    clang-24
s390                  randconfig-2003-20261112    clang-24
s390                  randconfig-2004-20261112    clang-24
s390                  randconfig-2005-20261112    clang-24
s390                  randconfig-2200-20261112    clang-24   smatch
s390                 randconfig-r2104-20261112    gcc-16.2.0 cocci
s390                 randconfig-r2105-20261112    gcc-11.5.0 cocci
s390                 randconfig-r2109-20261112    clang-20   cocci
s390                 randconfig-r2111-20261112    clang-20   cocci
s390                 randconfig-r2304-20261112    clang-24   sparse
s390                 randconfig-r2306-20261112    gcc-9.5.0  sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                          ap325rxa_defconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-2000-20261112    gcc-16.2.0
sh                    randconfig-2001-20261112    gcc-16.2.0
sh                    randconfig-2002-20261112    gcc-16.2.0
sh                    randconfig-2003-20261112    gcc-16.2.0
sh                    randconfig-2004-20261112    gcc-16.2.0
sh                    randconfig-2005-20261112    gcc-16.2.0
sh                    randconfig-2200-20261112    gcc-16.2.0 smatch
sh                   randconfig-r2101-20261112    gcc-15.3.0 cocci
sh                   randconfig-r2103-20261112    gcc-15.3.0 cocci
sh                   randconfig-r2304-20261112    gcc-8.5.0  sparse
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261114    gcc-12.5.0
sparc                 randconfig-1001-20261114    gcc-12.5.0
sparc                 randconfig-2000-20261112    clang-24
sparc                 randconfig-2001-20261112    clang-24
sparc                 randconfig-2200-20261112    gcc-11.5.0 smatch
sparc                randconfig-r2103-20261112    gcc-11.5.0 cocci
sparc                randconfig-r2108-20261112    clang-20   cocci
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261114    gcc-12.5.0
sparc64               randconfig-1001-20261114    gcc-12.5.0
sparc64               randconfig-2000-20261112    clang-24
sparc64               randconfig-2001-20261112    clang-24
sparc64               randconfig-2200-20261112    gcc-10.5.0 smatch
sparc64              randconfig-r2108-20261112    gcc-12.5.0 cocci
sparc64              randconfig-r2303-20261112    clang-24   sparse
sparc64              randconfig-r2307-20261112    gcc-9.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261114    gcc-12.5.0
um                    randconfig-1001-20261114    gcc-12.5.0
um                    randconfig-2000-20261112    clang-24
um                    randconfig-2001-20261112    clang-24
um                    randconfig-2200-20261112    clang-20   smatch
um                   randconfig-r2110-20261112    clang-20   cocci
um                   randconfig-r2111-20261112    gcc-12.5.0 cocci
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261113    clang-22
x86_64      buildonly-randconfig-1001-20261113    clang-22
x86_64      buildonly-randconfig-1002-20261113    clang-22
x86_64      buildonly-randconfig-1003-20261113    clang-22
x86_64      buildonly-randconfig-1004-20261113    clang-22
x86_64      buildonly-randconfig-1005-20261113    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261113    clang-22
x86_64                randconfig-1001-20261113    clang-22
x86_64                randconfig-1002-20261113    clang-22
x86_64                randconfig-1003-20261113    clang-22
x86_64                randconfig-1004-20261113    clang-22
x86_64                randconfig-1005-20261113    clang-22
x86_64                randconfig-1006-20261114    gcc-14
x86_64                randconfig-1007-20261114    gcc-14
x86_64                randconfig-1008-20261114    gcc-14
x86_64                randconfig-1009-20261114    gcc-14
x86_64                randconfig-1010-20261114    gcc-14
x86_64                randconfig-1011-20261114    gcc-14
x86_64                randconfig-2000-20261112    gcc-14
x86_64                randconfig-2001-20261112    gcc-14
x86_64                randconfig-2002-20261112    gcc-14
x86_64                randconfig-2003-20261112    gcc-14
x86_64                randconfig-2004-20261112    gcc-14
x86_64                randconfig-2005-20261112    gcc-14
x86_64                randconfig-2100-20261112    clang-22   cocci
x86_64                randconfig-2101-20261112    clang-22   cocci
x86_64                randconfig-2102-20261112    clang-22   cocci
x86_64                randconfig-2103-20261112    clang-22   cocci
x86_64                randconfig-2104-20261112    clang-22   cocci
x86_64                randconfig-2105-20261112    clang-22   cocci
x86_64                randconfig-2200-20261112    gcc-13     smatch
x86_64                randconfig-2300-20261112    clang-22   sparse
x86_64                randconfig-2301-20261112    clang-22   sparse
x86_64                randconfig-2302-20261112    clang-22   sparse
x86_64               randconfig-r2100-20261112    gcc-16.2.0 cocci
x86_64               randconfig-r2305-20261112    clang-24   sparse
x86_64               randconfig-r2311-20261112    gcc-14     sparse
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
xtensa                randconfig-1000-20261114    gcc-12.5.0
xtensa                randconfig-1001-20261114    gcc-12.5.0
xtensa                randconfig-2000-20261112    gcc-16.2.0
xtensa                randconfig-2001-20261112    gcc-16.2.0
xtensa                randconfig-2200-20261112    gcc-13.5.0 smatch
xtensa               randconfig-r2300-20261112    clang-24   sparse
xtensa               randconfig-r2300-20261112    gcc-8.5.0  sparse
xtensa               randconfig-r2309-20261112    gcc-9.5.0  sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
