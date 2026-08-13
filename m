Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86FF2D9780
	for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 01:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786584302; cv=none; b=ptQiQwpR4jmbC4TXYAz4AnOxRk/J8fBIEDpSMdiRUqvH/JvzXpNZoXyfHuMLKFMFaCTFvi2angEHoMwtkx3UldcwGX/IbJ5KVa33AkkZ2qmJe1nQ7n5yOzzVlT9OgDq+iB2kSYvT9kCXbx0eSmEFLXG95CRxNS1k6wa1EJN+Ri0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786584302; c=relaxed/simple;
	bh=df5VdVWxl1opCwOTSFhcXaauT1ib4R/H8pebOpK+UPM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZWxFjRNHR+74ebFkv73uHltUZNpesBxiAwUumj32BddtoU0PHksKoeJApppwhQcL72SDwdyLxu1bcycIrcewaAdPujGDs+zTXuWkyF7IlwzewS3SbOotIDcpV56tmmQWkny2YPTNowdaO4sxvb2r919aCuQxHp/JZXTRwMK8eJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EzAjRqBE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzAjRqBE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786584300; x=1818120300;
  h=date:from:to:cc:subject:message-id;
  bh=df5VdVWxl1opCwOTSFhcXaauT1ib4R/H8pebOpK+UPM=;
  b=EzAjRqBEmptj/laYWcbC3EW1PeK2IFQiZ5fPULgNTT3woT/MqKo8rUTc
   QMt/AjisI5wa/kDH4ptI9/RmlK9wSZLOOgyjgAVdS7azk+hKHXNuXF+f4
   YiDK7G7GvzORLqfFyhFSn0uIDZsLyH5MK5T8bp+PTp8pyON25fwKSy7gT
   ZRq/zwdC3tXFg0QnAU/l4kzsKDfbDNQ6Hw2/VCriaepnnLmfTOJYfmw+e
   uKqs/paTlQC1bPn/EpKBIf/HWgzZVZT/E5V6ASrqvySL6jvadbVu5yTp0
   eR8y3retUHGANtx5kPeWQLk1akxVkTMsC2v9fgNRsAW8akNOdBiV6BdNv
   w==;
X-CSE-ConnectionGUID: ruaBpDHnSxCXB2EJFCmaPQ==
X-CSE-MsgGUID: C4CMTxK3T1y9UfFdZ6d7Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87171265"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="87171265"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 18:24:59 -0700
X-CSE-ConnectionGUID: m4Ib7Rl9S0itprAhHnkr5A==
X-CSE-MsgGUID: zyGkJDEQRUaX2M2FuFwyew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="288584554"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Aug 2026 18:24:57 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuKBj-00000000SNA-20nn;
	Thu, 13 Aug 2026 01:24:55 +0000
Date: Thu, 13 Aug 2026 09:23:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 4900cad020c0580dfb1be27776ff10a4ef110cfa
Message-ID: <202608130944.pmAIqBL8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 4900cad020c0580dfb1be27776ff10a4ef110cfa  media: ipu-bridge: check all DMI entries when overriding sensor rotation

elapsed time: 2306m

configs tested: 153
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
hexagon                       randconfig-001    gcc-11.5.0
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
i386                          randconfig-001    clang-22
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
m68k                          sun3_defconfig    gcc-16.1.0
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
riscv                         randconfig-001    clang-24
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
x86_64                        randconfig-001    gcc-14
x86_64               randconfig-001-20260812    clang-22
x86_64               randconfig-001-20260812    gcc-14
x86_64               randconfig-002-20260812    clang-22
x86_64               randconfig-002-20260812    gcc-14
x86_64               randconfig-003-20260812    clang-22
x86_64               randconfig-003-20260812    gcc-14
x86_64               randconfig-004-20260812    clang-22
x86_64               randconfig-004-20260812    gcc-14
x86_64               randconfig-005-20260812    clang-22
x86_64               randconfig-005-20260812    gcc-14
x86_64               randconfig-006-20260812    clang-22
x86_64               randconfig-006-20260812    gcc-14
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
