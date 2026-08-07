Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ACF368D5E
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 22:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786143594; cv=none; b=tz/Yi3mMXN4q1UQt3DJuVOLvmNWcwkiatyrWEeyVzQzyDIEmuHkGsIXHsNpxpBgG7bXvWEP/Qe1NFQq8AUwP6wSJ+dtC8eTf2Ko7MJzL+S5UWvcQE571QagsJQiEw4aTT7n7KAxYn4kcYlsL7su122eLNvlKWN2xDp4cFF76JpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786143594; c=relaxed/simple;
	bh=HQXdKqMyYpn53XzwKh8abU3hhbPv15S0pddZknslWAE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ronrc6DPWbneyu8FhUxnA/+qMV3bakY2YNlbYUlnl61j7jUstD576bLNYHC9ixsuX3A6cFAsUADxvQTyGRHNFaEf+6Pi3CvFyfNj74gdydAw8eN6adj7rvUzVgx73qjvhdpWidnVsspf9kk8utCwCQKz1MPlWBrRLbYrvjfp/k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6p0v2of; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6p0v2of"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786143593; x=1817679593;
  h=date:from:to:cc:subject:message-id;
  bh=HQXdKqMyYpn53XzwKh8abU3hhbPv15S0pddZknslWAE=;
  b=i6p0v2ofyTPnCWJVTKCp0sMMZhjfaRaoBjXWVSvhkNNWY/oI6f/SCyGb
   myjiDmcFTDGKWTzGUigugV3tgp3FXIL+fjQprbXTc4YCklpnEk4QlQG2z
   fSnwVCJXEHIFzqzTy5VXKJiwjkXSmNZFRUnFuMreDNWxQh/ivR4gfrRjR
   XAjfBeQXUsj/tpEDPOkp7pHowMRED5ZTDnAFFncTCgK0a5/1Phk7G+LkT
   hw33Cck8P+cz5wohOr5+tEiSpNw/cgFgsHmiQtAD7gSM+0ftWIUdwaVto
   Ky9UlnuUzU7QRSddEGc8+CrAPOKa5p8JuV+cgFe3vl/EV5GZ+nXxoclVC
   w==;
X-CSE-ConnectionGUID: 7SIa/84eRymwywdswKsK5A==
X-CSE-MsgGUID: 0iGZdFn+TcaSX930p0QNBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="97912956"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="97912956"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 15:59:52 -0700
X-CSE-ConnectionGUID: nxA4bAWfRI6p0C3gRg0hXg==
X-CSE-MsgGUID: iTogsAmPRmyCUgFpGZfHWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="266367670"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Aug 2026 15:59:51 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsTXY-00000000JRR-3IrR;
	Fri, 07 Aug 2026 22:59:48 +0000
Date: Sat, 08 Aug 2026 06:58:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 8a6e017c06fbc1b96af618e82a4d35889d442964
Message-ID: <202608080642.Tm9ksX59-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 8a6e017c06fbc1b96af618e82a4d35889d442964  media: rcar-isp: Fix VSPX reference leaks

elapsed time: 1724m

configs tested: 125
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260807    gcc-14.3.0
arc                  randconfig-001-20260808    gcc-9.5.0
arc                  randconfig-002-20260807    gcc-14.3.0
arc                  randconfig-002-20260808    gcc-9.5.0
arm                  randconfig-001-20260807    gcc-14.3.0
arm                  randconfig-001-20260808    gcc-9.5.0
arm                  randconfig-002-20260807    gcc-14.3.0
arm                  randconfig-002-20260808    gcc-9.5.0
arm                  randconfig-003-20260807    gcc-14.3.0
arm                  randconfig-003-20260808    gcc-9.5.0
arm                  randconfig-004-20260807    gcc-14.3.0
arm                  randconfig-004-20260808    gcc-9.5.0
arm                          sama5_defconfig    gcc-16.1.0
arm64                randconfig-001-20260807    gcc-16.1.0
arm64                randconfig-002-20260807    gcc-16.1.0
arm64                randconfig-003-20260807    gcc-16.1.0
arm64                randconfig-004-20260807    gcc-16.1.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260807    gcc-16.1.0
csky                 randconfig-002-20260807    gcc-16.1.0
hexagon              randconfig-001-20260807    clang-18
hexagon              randconfig-001-20260808    gcc-16.1.0
hexagon              randconfig-002-20260807    clang-18
hexagon              randconfig-002-20260808    gcc-16.1.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260807    gcc-13
i386       buildonly-randconfig-002-20260807    gcc-13
i386       buildonly-randconfig-003-20260807    gcc-13
i386       buildonly-randconfig-004-20260807    gcc-13
i386       buildonly-randconfig-005-20260807    gcc-13
i386       buildonly-randconfig-006-20260807    gcc-13
i386                 randconfig-001-20260807    gcc-14
i386                 randconfig-002-20260807    gcc-14
i386                 randconfig-003-20260807    gcc-14
i386                 randconfig-004-20260807    gcc-14
i386                 randconfig-005-20260807    gcc-14
i386                 randconfig-006-20260807    gcc-14
i386                 randconfig-007-20260807    gcc-14
i386                 randconfig-011-20260807    clang-22
i386                 randconfig-012-20260807    clang-22
i386                 randconfig-013-20260807    clang-22
i386                 randconfig-014-20260807    clang-22
i386                 randconfig-015-20260807    clang-22
i386                 randconfig-016-20260807    clang-22
i386                 randconfig-017-20260807    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260807    clang-18
loongarch            randconfig-001-20260808    gcc-16.1.0
loongarch            randconfig-002-20260807    clang-18
loongarch            randconfig-002-20260808    gcc-16.1.0
mips                      rbtx49xx_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260807    clang-18
nios2                randconfig-001-20260808    gcc-16.1.0
nios2                randconfig-002-20260807    clang-18
nios2                randconfig-002-20260808    gcc-16.1.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260807    gcc-8.5.0
parisc               randconfig-001-20260808    gcc-8.5.0
parisc               randconfig-002-20260807    gcc-8.5.0
parisc               randconfig-002-20260808    gcc-8.5.0
powerpc              randconfig-001-20260807    gcc-8.5.0
powerpc              randconfig-001-20260808    gcc-8.5.0
powerpc              randconfig-002-20260807    gcc-8.5.0
powerpc              randconfig-002-20260808    gcc-8.5.0
powerpc64            randconfig-001-20260807    gcc-8.5.0
powerpc64            randconfig-001-20260808    gcc-8.5.0
powerpc64            randconfig-002-20260807    gcc-8.5.0
powerpc64            randconfig-002-20260808    gcc-8.5.0
riscv                randconfig-001-20260807    gcc-12.5.0
riscv                randconfig-001-20260808    clang-24
riscv                randconfig-002-20260807    gcc-12.5.0
riscv                randconfig-002-20260808    clang-24
s390                 randconfig-001-20260807    gcc-12.5.0
s390                 randconfig-001-20260808    clang-24
s390                 randconfig-002-20260807    gcc-12.5.0
s390                 randconfig-002-20260808    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260807    gcc-12.5.0
sh                   randconfig-001-20260808    clang-24
sh                   randconfig-002-20260807    gcc-12.5.0
sh                   randconfig-002-20260808    clang-24
sparc                randconfig-001-20260807    gcc-16.1.0
sparc                randconfig-002-20260807    gcc-16.1.0
sparc64              randconfig-001-20260807    gcc-16.1.0
sparc64              randconfig-002-20260807    gcc-16.1.0
um                   randconfig-001-20260807    gcc-16.1.0
um                   randconfig-002-20260807    gcc-16.1.0
x86_64     buildonly-randconfig-001-20260807    clang-22
x86_64     buildonly-randconfig-002-20260807    clang-22
x86_64     buildonly-randconfig-003-20260807    clang-22
x86_64     buildonly-randconfig-004-20260807    clang-22
x86_64     buildonly-randconfig-005-20260807    clang-22
x86_64     buildonly-randconfig-006-20260807    clang-22
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260807    clang-22
x86_64               randconfig-002-20260807    clang-22
x86_64               randconfig-003-20260807    clang-22
x86_64               randconfig-004-20260807    clang-22
x86_64               randconfig-005-20260807    clang-22
x86_64               randconfig-006-20260807    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260806    clang-22
x86_64               randconfig-012-20260806    clang-22
x86_64               randconfig-013-20260806    clang-22
x86_64               randconfig-014-20260806    clang-22
x86_64               randconfig-015-20260806    clang-22
x86_64               randconfig-016-20260806    clang-22
x86_64               randconfig-071-20260807    clang-22
x86_64               randconfig-072-20260807    clang-22
x86_64               randconfig-073-20260807    clang-22
x86_64               randconfig-074-20260807    clang-22
x86_64               randconfig-075-20260807    clang-22
x86_64               randconfig-076-20260807    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260807    gcc-16.1.0
xtensa               randconfig-002-20260807    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
