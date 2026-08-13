Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234F13164B7
	for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 01:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786584363; cv=none; b=fdfyW+adluoSiywBe0L+dNDkpFNJGgqd8xa+umpaqdniKd7dWkPcQ+Ymdm2sPyMXhWFFnz78NkofyYusOkUKYsrvhbkkVIkml8sn+wtWP+S20HUsHolL+xtGKknVQtRXdQFOfVkvSYJqHqggO3vzl1a6EMPjzW6c9q4JPQUdyH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786584363; c=relaxed/simple;
	bh=PdF1uESc1kXqKduiQWNjTmMeqJjd+rAnIRfyBViRv3I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cbpC2f78GiYmzF9KSlg4Z4LIa/Ae/3K1Zy7MfGQaFLtbovzQcMT8vqxhZRqkie2TlxkoACqgdQ1GyKjYuwaMXcMySAUQmKqP40Sw8zfOd4FWTpVwmbErnSatDk+ujQsXEkgIJAQdhrI6jLbS+TgSh7YJS0hwKRW/ru3I/makcVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvbtPmFa; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvbtPmFa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786584361; x=1818120361;
  h=date:from:to:cc:subject:message-id;
  bh=PdF1uESc1kXqKduiQWNjTmMeqJjd+rAnIRfyBViRv3I=;
  b=JvbtPmFaXHeLL5rX4rh5HBqFxOHV9HIsgpwvUFAQPCHnv7JIj/4j2/lt
   myJlaiPP+EJlvOW74V9MBtV79T55m08AqnUADfFtrAH5Sv9jLHD8Z8Vmt
   Ul6f4dStXnZUGaMJIaw0U+lR1UB3Lmc/JLtUplkAbIKneeAfpo1gwP79B
   Wy2xQoC+4E35a8jAO/6rLfQIM56nOYj9eUqioo+ZMkoNkNf171Q2NteEw
   ybD9It18BfcOzVS+JrkQ70O1TmSJs5uSfjKst2miBB0uAWkVVcjyZAS+T
   1NUnMOuYCXpjGrpCbzcGEmyyL3BwmatSRS4PXUpvEYvwH4IYWA6HaaY/j
   Q==;
X-CSE-ConnectionGUID: fIXSOl0aTpu07J9/HJKlPg==
X-CSE-MsgGUID: qmi40CIbSBemxTcmMq1ubw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="90832527"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="90832527"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 18:25:59 -0700
X-CSE-ConnectionGUID: drdMCWHVTeqaOOM3K/TCIg==
X-CSE-MsgGUID: L/Ive4DUSW+Q1k3/+ryC6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="264380973"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Aug 2026 18:25:58 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuKCh-00000000SNQ-2tgg;
	Thu, 13 Aug 2026 01:25:55 +0000
Date: Thu, 13 Aug 2026 09:24:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata] BUILD SUCCESS
 4bfec3e2be568a720fa6bb3b7be45deac0cb7195
Message-ID: <202608130945.uYGRc7L5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata
branch HEAD: 4bfec3e2be568a720fa6bb3b7be45deac0cb7195  Documentation: media: Reword blanking control documentation

elapsed time: 2302m

configs tested: 142
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
arc                           randconfig-001    gcc-13.4.0
arc                  randconfig-001-20260812    gcc-12.5.0
arc                  randconfig-001-20260813    gcc-13.4.0
arc                  randconfig-002-20260812    gcc-12.5.0
arc                  randconfig-002-20260813    gcc-13.4.0
arm                    am200epdkit_defconfig    gcc-16.1.0
arm                       keystone_defconfig    gcc-16.1.0
arm                        mv78xx0_defconfig    clang-24
arm                  randconfig-001-20260812    gcc-12.5.0
arm                  randconfig-001-20260813    gcc-13.4.0
arm                  randconfig-002-20260812    gcc-12.5.0
arm                  randconfig-002-20260813    gcc-13.4.0
arm                  randconfig-003-20260812    gcc-12.5.0
arm                  randconfig-003-20260813    gcc-13.4.0
arm                  randconfig-004-20260812    gcc-12.5.0
arm                  randconfig-004-20260813    gcc-13.4.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260812    gcc-10.5.0
arm64                randconfig-001-20260812    gcc-14.3.0
arm64                randconfig-001-20260813    gcc-14.3.0
arm64                randconfig-002-20260812    gcc-10.5.0
arm64                randconfig-002-20260812    gcc-14.3.0
arm64                randconfig-002-20260813    gcc-14.3.0
arm64                randconfig-003-20260812    gcc-10.5.0
arm64                randconfig-003-20260812    gcc-14.3.0
arm64                randconfig-003-20260813    gcc-14.3.0
arm64                randconfig-004-20260812    gcc-10.5.0
arm64                randconfig-004-20260812    gcc-14.3.0
arm64                randconfig-004-20260813    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260812    gcc-10.5.0
csky                 randconfig-001-20260812    gcc-14.3.0
csky                 randconfig-001-20260813    gcc-14.3.0
csky                 randconfig-002-20260812    gcc-10.5.0
csky                 randconfig-002-20260812    gcc-14.3.0
csky                 randconfig-002-20260813    gcc-14.3.0
hexagon              randconfig-001-20260812    gcc-11.5.0
hexagon              randconfig-002-20260812    gcc-11.5.0
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    clang-22
i386       buildonly-randconfig-001-20260812    clang-22
i386       buildonly-randconfig-002-20260812    clang-22
i386       buildonly-randconfig-003-20260812    clang-22
i386       buildonly-randconfig-004-20260812    clang-22
i386       buildonly-randconfig-005-20260812    clang-22
i386       buildonly-randconfig-006-20260812    clang-22
i386                 randconfig-001-20260812    clang-22
i386                 randconfig-002-20260812    clang-22
i386                 randconfig-003-20260812    clang-22
i386                 randconfig-004-20260812    clang-22
i386                 randconfig-005-20260812    clang-22
i386                 randconfig-006-20260812    clang-22
i386                 randconfig-007-20260812    clang-22
i386                          randconfig-011    gcc-12
i386                 randconfig-011-20260812    gcc-12
i386                 randconfig-012-20260812    gcc-12
i386                 randconfig-013-20260812    gcc-12
i386                 randconfig-014-20260812    gcc-12
i386                 randconfig-015-20260812    gcc-12
i386                 randconfig-016-20260812    gcc-12
i386                 randconfig-017-20260812    gcc-12
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260812    gcc-11.5.0
loongarch            randconfig-002-20260812    gcc-11.5.0
mips                    cu1000-neo_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260812    gcc-11.5.0
nios2                randconfig-002-20260812    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260812    clang-17
parisc               randconfig-001-20260813    gcc-10.5.0
parisc               randconfig-002-20260812    clang-17
parisc               randconfig-002-20260813    gcc-10.5.0
powerpc                   amigaone_defconfig    gcc-16.1.0
powerpc              randconfig-001-20260812    clang-17
powerpc              randconfig-001-20260813    gcc-10.5.0
powerpc              randconfig-002-20260812    clang-17
powerpc              randconfig-002-20260813    gcc-10.5.0
powerpc64            randconfig-001-20260812    clang-17
powerpc64            randconfig-001-20260813    gcc-10.5.0
powerpc64            randconfig-002-20260812    clang-17
powerpc64            randconfig-002-20260813    gcc-10.5.0
riscv                         randconfig-001    gcc-10.5.0
riscv                randconfig-001-20260812    clang-24
riscv                randconfig-001-20260813    gcc-10.5.0
riscv                randconfig-002-20260812    clang-24
riscv                randconfig-002-20260813    gcc-10.5.0
s390                 randconfig-001-20260812    clang-24
s390                 randconfig-001-20260813    gcc-10.5.0
s390                 randconfig-002-20260812    clang-24
s390                 randconfig-002-20260813    gcc-10.5.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260812    clang-24
sh                   randconfig-001-20260813    gcc-10.5.0
sh                   randconfig-002-20260812    clang-24
sh                   randconfig-002-20260813    gcc-10.5.0
sparc                         randconfig-001    gcc-13.4.0
sparc                randconfig-001-20260812    gcc-13.4.0
sparc                randconfig-002-20260812    gcc-13.4.0
sparc64              randconfig-001-20260812    gcc-13.4.0
sparc64              randconfig-002-20260812    gcc-13.4.0
um                   randconfig-001-20260812    gcc-13.4.0
um                   randconfig-002-20260812    gcc-13.4.0
x86_64              buildonly-randconfig-001    gcc-14
x86_64     buildonly-randconfig-001-20260812    gcc-14
x86_64     buildonly-randconfig-002-20260812    gcc-14
x86_64     buildonly-randconfig-003-20260812    gcc-14
x86_64     buildonly-randconfig-004-20260812    gcc-14
x86_64     buildonly-randconfig-005-20260812    gcc-14
x86_64     buildonly-randconfig-006-20260812    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260812    clang-22
x86_64               randconfig-002-20260812    clang-22
x86_64               randconfig-003-20260812    clang-22
x86_64               randconfig-004-20260812    clang-22
x86_64               randconfig-005-20260812    clang-22
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
x86_64               randconfig-074-20260812    clang-22
x86_64               randconfig-075-20260812    clang-22
x86_64               randconfig-076-20260812    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260812    gcc-13.4.0
xtensa               randconfig-002-20260812    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
