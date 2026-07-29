Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCB543E4BF
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314881; cv=none; b=UPB8tmoi29SsHDFKBbMgcAjAodwiezJTJKfKm8yN+ATurR7BV1p7LTazbOp+fqW/H+4R8VIrDjviZaIOa7wsNJDNX0HqLrnIVwyhYr9PiDGT8VxjjLzWWWfykOjl/fcB/EXGRVkJNeYV1ZqD11ICcavTek3k/FfJZJaLNOXebtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314881; c=relaxed/simple;
	bh=WC/6Sc1sE5YWXlVvP5MzpKbm2vHRAD8V186o4g/pZgQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sRcFBIQeYJ7RS8/dvy677ZrGaUY2wxt5cHfjmSM3eyI5IvLgz8R+rgfoOQxquvHHrpZSOjfh2ZxsKTL9+gTKGxAr5E9UV2UHOV8HIZYhcRZ6uOvFAgnVVmOxtOi0SscGO4AimoJmG1IdxVVTDh5PZz4dJWY/u/bCKnT610tFj9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vy8m9qLL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vy8m9qLL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785314879; x=1816850879;
  h=date:from:to:cc:subject:message-id;
  bh=WC/6Sc1sE5YWXlVvP5MzpKbm2vHRAD8V186o4g/pZgQ=;
  b=Vy8m9qLLDpJmpOqOYo8JUk57I+TH5vRjM7uzhkUEFieQhFiIkvL77Y4B
   a2AUXGXmftM8q+oWKnncYbvxWAYwplRYVHo71KNymtdtQMh+p4SSW7oqb
   aTklyWU0s9d5wfEpNdcYkJPjhjqFRpQiggWpT+6ETCdpmaZVfld178pII
   /Nt04iuxNliMIlH8R/Ptvcv23bf+12Kogrz0WmunTmFi9mDE6NH8mBHIv
   /jY/h3jT1hYgTujgZ7eZA7z0dTuo+O9dXgvTw2xG+D2e04G/EbAtllChx
   Wc8wFYwIP6knkPBaLqOG5iz8Jdfq/tZqDRu1brYyJuZtVzbVQknlYwIaM
   A==;
X-CSE-ConnectionGUID: BJk4P96HRAiU86GqXVcPtQ==
X-CSE-MsgGUID: hnX5rWkNSIaQ36FhWxMLRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89589926"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="89589926"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 01:47:59 -0700
X-CSE-ConnectionGUID: e9eY6nhIRlyPSkxgrKJaGw==
X-CSE-MsgGUID: +nf8YXREQ/C74DP4zvnheg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="264989807"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 29 Jul 2026 01:47:58 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wozx7-00000000fCx-16yM;
	Wed, 29 Jul 2026 08:47:52 +0000
Date: Wed, 29 Jul 2026 16:47:40 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 95f76f51937fdfb0fc1e14cae606b1ef574a56f3
Message-ID: <202607291625.nWjBumLJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 95f76f51937fdfb0fc1e14cae606b1ef574a56f3  media: em28xx: defer audio-only extension registration

elapsed time: 917m

configs tested: 109
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
arm64                randconfig-001-20260729    clang-17
arm64                randconfig-002-20260729    clang-17
arm64                randconfig-003-20260729    clang-17
arm64                randconfig-004-20260729    clang-17
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260729    clang-17
csky                 randconfig-002-20260729    clang-17
hexagon              randconfig-001-20260729    gcc-9.5.0
hexagon              randconfig-002-20260729    gcc-9.5.0
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    gcc-14
i386       buildonly-randconfig-001-20260729    gcc-14
i386       buildonly-randconfig-002-20260729    gcc-14
i386       buildonly-randconfig-003-20260729    gcc-14
i386       buildonly-randconfig-004-20260729    gcc-14
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
mips                       bcm63xx_defconfig    clang-24
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
riscv            nommu_k210_sdcard_defconfig    gcc-16.1.0
riscv                randconfig-001-20260729    gcc-15.2.0
riscv                randconfig-002-20260729    gcc-15.2.0
s390                 randconfig-001-20260729    gcc-15.2.0
s390                 randconfig-002-20260729    gcc-15.2.0
sh                              alldefconfig    gcc-16.1.0
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
x86_64                        randconfig-001    clang-22
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
