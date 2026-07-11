Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E8C223DE5
	for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 04:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783742873; cv=none; b=B+8UOFvmO0LpzhPk3NZdsAhTMV4Ed/kTv23B6LBPmLArbFNGcGdolMcOSIA3EGeAKJSv5f5PX4kwnEtnxgD2FNod8FnRF/RjS317DnOnEvTPrQ4osfzVfyXYvsmneULbqC8k+5/t4JcH1dsiNzcxvBSHQmn36i4fijJXJNj9qyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783742873; c=relaxed/simple;
	bh=YG+fMwnKY7c4ldfR8srAXB2raifCa8SMGQIyMWt5JMI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jdznibdjqf6OOrlQnLIG/M69jWeIZutw5JOGJgluvt/roa2O+wdAs62egHDAOxUX9iJqnN20fBtFe80qG+d4F2fMbUUB49PQena5/mpKKomRzQvRsoy+TAsGVx2IoCTpKojpd1g3Z2AAUOVnCkmRuRM5RjUzQBJbGSDsn7RSzYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AlMs5sJc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AlMs5sJc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783742871; x=1815278871;
  h=date:from:to:cc:subject:message-id;
  bh=YG+fMwnKY7c4ldfR8srAXB2raifCa8SMGQIyMWt5JMI=;
  b=AlMs5sJcz5Rpu7ORuYEJmpNJKdtcJxsE7IXV+hpH5MyLMdXp2SMHqJr7
   5sMDAmNIse2r6X7+evScZo00KIqE0Q1zyST2MFeZSjF2yATYixky8bamu
   hRTf+JCUhHPf/dk6WvPG2cmx97jrIIKLKIt9l91ryaweTdG9OWR2cVNYb
   oAbCP9F43sUADD3lIndP2wnbXVSRsrS9JTyiVKTUOA5/yKnVoX86SqCkp
   5U4NPIwQYerOTrO8EvkAYpPsLvDZGYpNMBzwaqwLxSKZuQpLlqfpWXfbg
   /ZdKCqZ2QwO60Kqc6wWiNafR/DkDg6Ml+cCFtXozukZejy6hDlopPxzAe
   g==;
X-CSE-ConnectionGUID: hnuFIHNSQI6IrE3GYNSzYQ==
X-CSE-MsgGUID: oCbYp63yS8uwKuYC7PI7mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88121716"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88121716"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 21:07:51 -0700
X-CSE-ConnectionGUID: Xi9DxTGQQIKDkGtEF+agiA==
X-CSE-MsgGUID: aK2KCsqVRIypyyjPvHcl6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259364775"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 10 Jul 2026 21:07:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiP07-00000000JiF-28oK;
	Sat, 11 Jul 2026 04:07:42 +0000
Date: Sat, 11 Jul 2026 12:06:47 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 85aa8122459eb96d2f3e0d32af436cf8d0961f8f
Message-ID: <202607111235.JvoNRCDQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 85aa8122459eb96d2f3e0d32af436cf8d0961f8f  media: drivers/media/dvb-core: CodeStyle for dvb_frontend_open()

elapsed time: 727m

configs tested: 196
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260711    gcc-13.4.0
arc                   randconfig-002-20260711    gcc-13.4.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                           omap1_defconfig    gcc-16.1.0
arm                   randconfig-001-20260711    gcc-13.4.0
arm                   randconfig-002-20260711    gcc-13.4.0
arm                   randconfig-003-20260711    gcc-13.4.0
arm                   randconfig-004-20260711    gcc-13.4.0
arm                        vexpress_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260711    gcc-16.1.0
arm64                 randconfig-002-20260711    gcc-16.1.0
arm64                 randconfig-003-20260711    gcc-16.1.0
arm64                 randconfig-004-20260711    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260711    gcc-16.1.0
csky                  randconfig-002-20260711    gcc-16.1.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260711    gcc-16.1.0
hexagon               randconfig-002-20260711    gcc-16.1.0
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260711    gcc-14
i386        buildonly-randconfig-002-20260711    gcc-14
i386        buildonly-randconfig-003-20260711    gcc-14
i386        buildonly-randconfig-004-20260711    gcc-14
i386        buildonly-randconfig-005-20260711    gcc-14
i386        buildonly-randconfig-006-20260711    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260711    clang-22
i386                  randconfig-002-20260711    clang-22
i386                  randconfig-003-20260711    clang-22
i386                  randconfig-004-20260711    clang-22
i386                  randconfig-005-20260711    clang-22
i386                  randconfig-006-20260711    clang-22
i386                  randconfig-007-20260711    clang-22
i386                  randconfig-011-20260711    gcc-13
i386                  randconfig-012-20260711    gcc-13
i386                  randconfig-013-20260711    gcc-13
i386                  randconfig-014-20260711    gcc-13
i386                  randconfig-015-20260711    gcc-13
i386                  randconfig-016-20260711    gcc-13
i386                  randconfig-017-20260711    gcc-13
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260711    gcc-16.1.0
loongarch             randconfig-002-20260711    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                malta_qemu_32r6_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260711    gcc-16.1.0
nios2                 randconfig-002-20260711    gcc-16.1.0
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    clang-17
parisc                         randconfig-001    gcc-10.5.0
parisc                randconfig-001-20260711    clang-17
parisc                randconfig-001-20260711    gcc-10.5.0
parisc                         randconfig-002    clang-17
parisc                         randconfig-002    gcc-10.5.0
parisc                randconfig-002-20260711    clang-17
parisc                randconfig-002-20260711    gcc-10.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                    mvme5100_defconfig    gcc-16.1.0
powerpc                        randconfig-001    clang-17
powerpc                        randconfig-001    gcc-10.5.0
powerpc               randconfig-001-20260711    clang-17
powerpc               randconfig-001-20260711    gcc-10.5.0
powerpc                        randconfig-002    clang-17
powerpc                        randconfig-002    gcc-10.5.0
powerpc               randconfig-002-20260711    clang-17
powerpc64                      randconfig-001    clang-17
powerpc64             randconfig-001-20260711    clang-17
powerpc64             randconfig-001-20260711    gcc-10.5.0
powerpc64                      randconfig-002    clang-17
powerpc64                      randconfig-002    gcc-10.5.0
powerpc64             randconfig-002-20260711    clang-17
powerpc64             randconfig-002-20260711    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                 randconfig-001-20260711    gcc-8.5.0
riscv                 randconfig-002-20260711    gcc-8.5.0
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                  randconfig-001-20260711    gcc-8.5.0
s390                  randconfig-002-20260711    gcc-8.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260711    gcc-8.5.0
sh                    randconfig-002-20260711    gcc-8.5.0
sh                   sh7724_generic_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260711    gcc-16.1.0
sparc                 randconfig-002-20260711    gcc-16.1.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260711    gcc-16.1.0
sparc64               randconfig-002-20260711    gcc-16.1.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260711    gcc-16.1.0
um                    randconfig-002-20260711    gcc-16.1.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260711    gcc-14
x86_64      buildonly-randconfig-002-20260711    gcc-14
x86_64      buildonly-randconfig-003-20260711    gcc-14
x86_64      buildonly-randconfig-004-20260711    gcc-14
x86_64      buildonly-randconfig-005-20260711    gcc-14
x86_64      buildonly-randconfig-006-20260711    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260711    gcc-14
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260711    gcc-14
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260711    gcc-14
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260711    gcc-14
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260711    gcc-14
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260711    gcc-14
x86_64                randconfig-011-20260711    gcc-14
x86_64                randconfig-012-20260711    gcc-14
x86_64                randconfig-013-20260711    gcc-14
x86_64                randconfig-014-20260711    gcc-14
x86_64                randconfig-015-20260711    gcc-14
x86_64                randconfig-016-20260711    gcc-14
x86_64                randconfig-071-20260711    gcc-14
x86_64                randconfig-072-20260711    gcc-14
x86_64                randconfig-073-20260711    gcc-14
x86_64                randconfig-074-20260711    gcc-14
x86_64                randconfig-075-20260711    gcc-14
x86_64                randconfig-076-20260711    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260711    gcc-16.1.0
xtensa                randconfig-002-20260711    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
