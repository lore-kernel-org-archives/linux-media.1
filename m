Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D454B04B7
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 18:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786559753; cv=none; b=YtOessm1PDl83l4Ns4576GyanZjWNDcyRp5fxkY8+BktK8ldnezx1tWA1nsb+NpQHgIfYJhw1Et8wbCFQSpfgYRi0wKbdZZW87OnxivHPeBptxHZW8JGtQP4CsK3jDAZE/3CYtYgvUyJyyeSEAUCu6AH3rXAosM1OAgtbBTo1ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786559753; c=relaxed/simple;
	bh=1NIZQUYfg9BSi01KzTSM60h3UAC/m69Q7zoRHbS/Hrc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dn/XT6pAT8bKIZ/b6r/f5h/rQGReOQLFezVizvvR9Nmv0eeNcOKd/YFnLWVDcfFhnPbVQVY8ctic0gTtwBAhHDnM8p2pE15/sVSeCFLkHeb7DSVmhRFCN2L7dTr8J3xaL5V8t04HHsoILQySNnmQJYQqmW28LWOrv1Eq65GUtWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LLYkuyvI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LLYkuyvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786559751; x=1818095751;
  h=date:from:to:cc:subject:message-id;
  bh=1NIZQUYfg9BSi01KzTSM60h3UAC/m69Q7zoRHbS/Hrc=;
  b=LLYkuyvIYqvkRG6SKqDUKcEiAnzTLChyukgSgrIoZaH5hOdhXON58ym4
   fTTQovV+TmmEq6lxCjx4d8EMvbAmOf19sm6JSEcX2dT6Msd9yxepOtUex
   SxhJwgCu3zbjaWFHMC0/5tb60E+3usLg5S050YLakX+6z5tMk8Dc3O8ry
   ThlixW8+L+04/CI5iaijS7RTFTZmug1uTBXSHUshexCc0HRNoZr+wt/jR
   w8c+dCIFpSy+h+VR08SUspTNUa21M7JcGZit1T6j9FGtYJ4zMwAZXFF+X
   2mLmCKjdXysjB+lS5h2O6FPVsEXOfdeyS6HY9j+CmpNBtAeaVCBJ6a8L8
   w==;
X-CSE-ConnectionGUID: 66hmlTOPRBeAWbnJlHkRqA==
X-CSE-MsgGUID: cbnxE7kSQSeGcinZzpBrCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="74665212"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="74665212"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 11:35:50 -0700
X-CSE-ConnectionGUID: cp/dw643ReqFVluD4JiDgg==
X-CSE-MsgGUID: oQg70X02RES9DzEk9sHxLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="301971996"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Aug 2026 11:35:50 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuDnn-00000000RMc-12kv;
	Wed, 12 Aug 2026 18:35:47 +0000
Date: Thu, 13 Aug 2026 02:35:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 56c29fa3ee666197516a231e75aed789ae9c530d
Message-ID: <202608130219.zPT3Ni61-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 56c29fa3ee666197516a231e75aed789ae9c530d  media: rzg2l-cru: Align bytesperline to hardware DMA stride requirement

elapsed time: 1898m

configs tested: 150
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-12.5.0
arc                  randconfig-001-20260812    gcc-12.5.0
arc                  randconfig-002-20260812    gcc-12.5.0
arm                    am200epdkit_defconfig    gcc-16.1.0
arm                  randconfig-001-20260812    gcc-12.5.0
arm                  randconfig-002-20260812    gcc-12.5.0
arm                  randconfig-003-20260812    gcc-12.5.0
arm                  randconfig-004-20260812    gcc-12.5.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260812    clang-24
arm64                randconfig-001-20260812    gcc-10.5.0
arm64                randconfig-001-20260812    gcc-14.3.0
arm64                randconfig-002-20260812    clang-20
arm64                randconfig-002-20260812    gcc-10.5.0
arm64                randconfig-002-20260812    gcc-14.3.0
arm64                randconfig-003-20260812    clang-17
arm64                randconfig-003-20260812    gcc-10.5.0
arm64                randconfig-003-20260812    gcc-14.3.0
arm64                randconfig-004-20260812    clang-24
arm64                randconfig-004-20260812    gcc-10.5.0
arm64                randconfig-004-20260812    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260812    gcc-10.5.0
csky                 randconfig-001-20260812    gcc-14.3.0
csky                 randconfig-002-20260812    gcc-10.5.0
csky                 randconfig-002-20260812    gcc-14.3.0
csky                 randconfig-002-20260812    gcc-16.1.0
hexagon              randconfig-001-20260812    clang-24
hexagon              randconfig-001-20260812    gcc-11.5.0
hexagon              randconfig-002-20260812    clang-17
hexagon              randconfig-002-20260812    gcc-11.5.0
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    clang-22
i386       buildonly-randconfig-001-20260812    clang-22
i386       buildonly-randconfig-002-20260812    clang-22
i386       buildonly-randconfig-002-20260812    gcc-14
i386       buildonly-randconfig-003-20260812    clang-22
i386       buildonly-randconfig-004-20260812    clang-22
i386       buildonly-randconfig-005-20260812    clang-22
i386       buildonly-randconfig-005-20260812    gcc-14
i386       buildonly-randconfig-006-20260812    clang-22
i386                 randconfig-001-20260812    clang-22
i386                 randconfig-001-20260812    gcc-14
i386                 randconfig-002-20260812    clang-22
i386                 randconfig-002-20260812    gcc-14
i386                 randconfig-003-20260812    clang-22
i386                 randconfig-004-20260812    clang-22
i386                 randconfig-004-20260812    gcc-14
i386                 randconfig-005-20260812    clang-22
i386                 randconfig-005-20260812    gcc-14
i386                 randconfig-006-20260812    clang-22
i386                 randconfig-007-20260812    clang-22
i386                 randconfig-007-20260812    gcc-14
i386                 randconfig-011-20260812    gcc-12
i386                 randconfig-012-20260812    gcc-12
i386                 randconfig-013-20260812    gcc-12
i386                 randconfig-014-20260812    gcc-12
i386                 randconfig-015-20260812    gcc-12
i386                 randconfig-016-20260812    gcc-12
i386                 randconfig-017-20260812    gcc-12
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260812    clang-24
loongarch            randconfig-001-20260812    gcc-11.5.0
loongarch            randconfig-002-20260812    clang-24
loongarch            randconfig-002-20260812    gcc-11.5.0
mips                      bmips_be_defconfig    gcc-16.1.0
mips                    cu1000-neo_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260812    gcc-11.5.0
nios2                randconfig-002-20260812    gcc-10.5.0
nios2                randconfig-002-20260812    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260812    clang-17
parisc               randconfig-001-20260812    gcc-8.5.0
parisc               randconfig-002-20260812    clang-17
parisc               randconfig-002-20260812    gcc-8.5.0
powerpc              randconfig-001-20260812    clang-17
powerpc              randconfig-001-20260812    gcc-14.3.0
powerpc              randconfig-002-20260812    clang-17
powerpc              randconfig-002-20260812    clang-24
powerpc64            randconfig-001-20260812    clang-17
powerpc64            randconfig-002-20260812    clang-17
powerpc64            randconfig-002-20260812    clang-24
riscv                randconfig-001-20260812    clang-24
riscv                randconfig-002-20260812    clang-24
s390                 randconfig-001-20260812    clang-24
s390                 randconfig-002-20260812    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260812    clang-24
sh                   randconfig-002-20260812    clang-24
sparc                randconfig-001-20260811    gcc-16.1.0
sparc                randconfig-001-20260812    gcc-13.4.0
sparc                randconfig-002-20260811    gcc-16.1.0
sparc                randconfig-002-20260812    gcc-13.4.0
sparc64              randconfig-001-20260811    gcc-8.5.0
sparc64              randconfig-001-20260812    gcc-13.4.0
sparc64              randconfig-002-20260811    gcc-8.5.0
sparc64              randconfig-002-20260812    gcc-13.4.0
um                   randconfig-001-20260811    gcc-14
um                   randconfig-001-20260812    gcc-13.4.0
um                   randconfig-002-20260811    gcc-14
um                   randconfig-002-20260812    gcc-13.4.0
x86_64              buildonly-randconfig-001    gcc-14
x86_64     buildonly-randconfig-001-20260812    gcc-14
x86_64     buildonly-randconfig-002-20260812    gcc-14
x86_64     buildonly-randconfig-003-20260812    gcc-14
x86_64     buildonly-randconfig-004-20260812    gcc-14
x86_64     buildonly-randconfig-005-20260812    gcc-14
x86_64     buildonly-randconfig-006-20260812    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260811    clang-22
x86_64               randconfig-001-20260812    clang-22
x86_64               randconfig-002-20260811    gcc-14
x86_64               randconfig-002-20260812    clang-22
x86_64               randconfig-003-20260811    clang-22
x86_64               randconfig-003-20260812    clang-22
x86_64               randconfig-004-20260811    gcc-14
x86_64               randconfig-004-20260812    clang-22
x86_64               randconfig-005-20260811    clang-22
x86_64               randconfig-005-20260812    clang-22
x86_64               randconfig-006-20260811    gcc-13
x86_64               randconfig-006-20260812    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260812    clang-22
x86_64               randconfig-012-20260812    clang-22
x86_64               randconfig-013-20260812    clang-22
x86_64               randconfig-014-20260812    clang-22
x86_64               randconfig-015-20260812    clang-22
x86_64               randconfig-016-20260812    clang-22
x86_64               randconfig-071-20260812    clang-22
x86_64               randconfig-072-20260812    clang-22
x86_64               randconfig-073-20260812    clang-22
x86_64               randconfig-073-20260812    gcc-14
x86_64               randconfig-074-20260812    clang-22
x86_64               randconfig-075-20260812    clang-22
x86_64               randconfig-075-20260812    gcc-14
x86_64               randconfig-076-20260812    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260811    gcc-16.1.0
xtensa               randconfig-001-20260812    gcc-13.4.0
xtensa               randconfig-002-20260811    gcc-10.5.0
xtensa               randconfig-002-20260812    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
