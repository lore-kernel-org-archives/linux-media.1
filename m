Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A46A4457AD
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 10:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322749; cv=none; b=EfJLg99TCBbz1n2KHPmDFf5r28uMMGgynzZsFEIWKJiRQrkIsBcI5WHzdiO/G89hYyOCb63PR4Tc2TxeRE5p88aWWp3mX7qt4ddUKRNiq734cFlYEktQ4v2c32XK0lRSllHRFTYDrpN/AbqAHMJ2DPfJ7Fkmd5BGH5FudEpwd4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322749; c=relaxed/simple;
	bh=eTFqBCGqS+3fKvm2c9sIbcsswtCOgPVUWd3sC34wdkE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hiR6+USl7+B92DRpLia3IjeonOK0VPauX92WhKXeE4lPAKmNt+NyjTJyE9RZSaYnFBtTh5jUjZ1yvvdUsqQajEgSjREs5VuNOPa3ju9sP/ekgKw1dwJvlHRAqfOHcXYe24/i3+hrcBIL/k7oNQ2BoY01X/kJmB/9+PY9kSLQJjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXOtmOpy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXOtmOpy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785322749; x=1816858749;
  h=date:from:to:cc:subject:message-id;
  bh=eTFqBCGqS+3fKvm2c9sIbcsswtCOgPVUWd3sC34wdkE=;
  b=SXOtmOpyfINviL0RonVHXJDfwMcht3GY7+bI3Y5noRMudQtsWRwMzbO8
   FNlxq11XWlqef1xpw32u68giw9p6QJl1N96oL0WquTiGXaZbM5e0k+tAU
   G2qI2lqoxIPN9sWXk0tnDf3w3W/X2ffvv+BmCpnxzoiTG6z34HFc+qYr5
   JHr/beGB7cGYKK3nsOTWqwYeolg1jiebSOV/QZdzogSRVSZyzyrA5hiXs
   Afw/ULvajSaeWdFGkoAiwE7EFiBSebr72MqMAPjiKapkIGu/ju1i9c6L+
   z9QGcuHj6jqYQkmpkdNbNt/FyxumEKkapOblB8kxQ7ZenV5h5I4YXX2Ai
   g==;
X-CSE-ConnectionGUID: LU8jaGKyQm2p7dl8lpLUDw==
X-CSE-MsgGUID: aHLQ/Hu9TRq+IGrGKy7rjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89812420"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="89812420"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 03:59:09 -0700
X-CSE-ConnectionGUID: D/zkgJ/uRzSaEjtVCSp+NA==
X-CSE-MsgGUID: JgMPOGVfQSOTc2yi1VpJFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="256056353"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jul 2026 03:59:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wp208-00000000fIN-2vCQ;
	Wed, 29 Jul 2026 10:59:04 +0000
Date: Wed, 29 Jul 2026 18:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 4f26c8345dbfa92f19078c788be1b9bfd425ed60
Message-ID: <202607291857.Y3dkFZZF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 4f26c8345dbfa92f19078c788be1b9bfd425ed60  media: bcm2835-unicam: Fix pipeline wrong validation for unpacked formats

elapsed time: 1491m

configs tested: 117
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260729    gcc-8.5.0
arc                  randconfig-002-20260729    gcc-8.5.0
arm                  randconfig-001-20260729    gcc-8.5.0
arm                  randconfig-002-20260729    gcc-8.5.0
arm                  randconfig-003-20260729    gcc-8.5.0
arm                  randconfig-004-20260729    gcc-8.5.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260729    clang-17
arm64                randconfig-001-20260729    gcc-14.3.0
arm64                randconfig-002-20260729    clang-17
arm64                randconfig-002-20260729    gcc-14.3.0
arm64                randconfig-003-20260729    clang-17
arm64                randconfig-003-20260729    gcc-14.3.0
arm64                randconfig-004-20260729    clang-17
arm64                randconfig-004-20260729    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260729    clang-17
csky                 randconfig-001-20260729    gcc-14.3.0
csky                 randconfig-002-20260729    clang-17
csky                 randconfig-002-20260729    gcc-14.3.0
hexagon              randconfig-001-20260729    gcc-9.5.0
hexagon              randconfig-002-20260729    gcc-9.5.0
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    gcc-14
i386       buildonly-randconfig-001-20260729    gcc-14
i386       buildonly-randconfig-002-20260729    clang-22
i386       buildonly-randconfig-002-20260729    gcc-14
i386       buildonly-randconfig-003-20260729    gcc-14
i386       buildonly-randconfig-004-20260729    clang-22
i386       buildonly-randconfig-004-20260729    gcc-14
i386       buildonly-randconfig-005-20260729    clang-22
i386       buildonly-randconfig-005-20260729    gcc-14
i386       buildonly-randconfig-006-20260729    gcc-14
i386                          randconfig-001    clang-22
i386                 randconfig-001-20260729    clang-22
i386                 randconfig-002-20260729    clang-22
i386                 randconfig-003-20260729    clang-22
i386                 randconfig-004-20260729    clang-22
i386                 randconfig-005-20260729    clang-22
i386                 randconfig-006-20260729    clang-22
i386                 randconfig-007-20260729    clang-22
i386                          randconfig-011    gcc-14
i386                 randconfig-011-20260729    gcc-14
i386                 randconfig-012-20260729    gcc-14
i386                 randconfig-013-20260729    gcc-14
i386                 randconfig-014-20260729    gcc-14
i386                 randconfig-015-20260729    gcc-14
i386                 randconfig-016-20260729    gcc-14
i386                 randconfig-017-20260729    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260729    gcc-9.5.0
loongarch            randconfig-002-20260729    gcc-9.5.0
m68k                       m5272c3_defconfig    gcc-16.1.0
mips                          gcw0_defconfig    clang-24
mips                     maltaaprp_defconfig    clang-17
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260729    gcc-9.5.0
nios2                randconfig-002-20260729    gcc-9.5.0
parisc                          alldefconfig    gcc-16.1.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260729    clang-24
parisc               randconfig-002-20260729    clang-24
powerpc              randconfig-001-20260729    clang-24
powerpc              randconfig-002-20260729    clang-24
powerpc64            randconfig-001-20260729    clang-24
powerpc64            randconfig-002-20260729    clang-24
riscv                         randconfig-001    gcc-15.2.0
riscv                randconfig-001-20260729    gcc-15.2.0
riscv                randconfig-002-20260729    gcc-15.2.0
s390                 randconfig-001-20260729    gcc-15.2.0
s390                 randconfig-002-20260729    gcc-15.2.0
sh                                 defconfig    gcc-16.1.0
sh                           hp6xx_defconfig    gcc-16.1.0
sh                   randconfig-001-20260729    gcc-15.2.0
sh                   randconfig-002-20260729    gcc-15.2.0
sparc                randconfig-001-20260729    gcc-10.5.0
sparc                randconfig-002-20260729    gcc-10.5.0
sparc64              randconfig-001-20260729    gcc-10.5.0
sparc64              randconfig-002-20260729    gcc-10.5.0
um                   randconfig-001-20260729    gcc-10.5.0
um                   randconfig-002-20260729    gcc-10.5.0
x86_64     buildonly-randconfig-001-20260729    clang-22
x86_64     buildonly-randconfig-002-20260729    clang-22
x86_64     buildonly-randconfig-003-20260729    clang-22
x86_64     buildonly-randconfig-004-20260729    clang-22
x86_64     buildonly-randconfig-005-20260729    clang-22
x86_64     buildonly-randconfig-006-20260729    clang-22
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260729    clang-22
x86_64               randconfig-002-20260729    clang-22
x86_64               randconfig-003-20260729    clang-22
x86_64               randconfig-004-20260729    clang-22
x86_64               randconfig-005-20260729    clang-22
x86_64               randconfig-006-20260729    clang-22
x86_64               randconfig-011-20260729    gcc-14
x86_64               randconfig-012-20260729    gcc-14
x86_64               randconfig-013-20260729    gcc-14
x86_64               randconfig-014-20260729    gcc-14
x86_64               randconfig-015-20260729    gcc-14
x86_64               randconfig-016-20260729    gcc-14
x86_64               randconfig-071-20260729    gcc-12
x86_64               randconfig-072-20260729    gcc-12
x86_64               randconfig-073-20260729    gcc-12
x86_64               randconfig-074-20260729    gcc-12
x86_64               randconfig-075-20260729    gcc-12
x86_64               randconfig-076-20260729    gcc-12
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260729    gcc-10.5.0
xtensa               randconfig-002-20260729    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
