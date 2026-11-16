Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866422;
	b=DB2v2zmL6JayBqi5BfctArtR8JY1ZwlMBBovDW8UxZEdVw700kSX+UvMGSseN8pmw3MM
	 YNLNyM3oy6+ISu9/kQRa4Id7qF14KMp+mMOvJfbMEK/PINMPluLZevSp4GzOs1sNwcmHp
	 O0RWLCn7LRh9cS/ZKwYU3Yel2h9tQmO2PTthRjdUXtQmACWszUDRuWh4z5XDrSN3jFDsX
	 zKmCrPEpzw216s2WU4oqewJmymF1DIvZ5l8QxkVp5JorYV87H4053xEqO4nFsSHaWrvKw
	 1JKSTqHw1++YQZ7PWLqbiljyqZYfgmoO3ElpiBRx8zyrHdk5+32+i5/uwlOpM0vZqhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866422;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=aUXpI/E3Sluit3VzwgRd9OPYUnzmKE2fCDEd+ELmo2U=;
	b=MVkFhQDC9rSk0mskIQrsQUaXXLyWfdxfTwT7XtHSF2M4dWwxTYttqZPSF2ZL2O93FiL4
	 /deJL0UBaj0DTdYOkKESKRzo44YcqZvSP8ahDgCF35XPUe7qopRSLwbix9xrX7ZU/T+AE
	 Bfz9WBxahHs44pbk8MXbJEhRnaml2RqTULv92+1Eq+4yiA/pG1QA0HznhbgJjeI71pCko
	 IG5578JwMIyy2HunG23IJTxrMJtGuBseyMSgg1ZKEvqS6RPZ0xPY7wzViR9MJUcjYs3EM
	 9TGS8jQsxMbr/7NFl3pVHtc2AAe79CRYDfeQPMn81/BUJqxkJQ/r9UxHhwUe+cqvo8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WzZSUl3f;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E955606A8A7
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 22:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E955606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WzZSUl3f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794866420; x=1826402420;
  h=date:from:to:cc:subject:message-id;
  bh=6E3w941yi2V6yn94NnptJsU4mMHkp9kgENknzKY/C+A=;
  b=WzZSUl3fyR4UArfH7mKQNWTzqeaI4fC5SV44fJmrB3Jo3yt6UZ7d4nXW
   VLUwM1XD7lqvunhy72QhSlZbWh87ZD39001rdmq/UPLK9GE2nVsxMXGtk
   rCL98fFDBegZV/T2WG1vIc0kc/HYT2qw/UILa8d/AVGArC8HrtIMZUA+F
   kqhRAwb1F5kX5ofBVwWMY7yINLBg9lOXohJeBLB0Z5gh7zgIgkcTwnF+e
   u7DIokCH/QcrTmK+gv4tlj3Sd+wkZfH+eEP7UImPOtoBQehqCP96D4ZoI
   vS+5u/+Ap6CpoXab7FdMEhlcGhgaE9L1UzzApPJXrtn7HsOe+I2ZilHqk
   Q==;
X-CSE-ConnectionGUID: 5Lp5jHuiSzmF9vFa73625w==
X-CSE-MsgGUID: 3pzNQni2R0KzKt8oN8IBKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3635577"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3635577"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 14:00:20 -0800
X-CSE-ConnectionGUID: VDoiAt+YQTuqaYCi89ZQqQ==
X-CSE-MsgGUID: 4lVrSeJSRpu81a2IA8EDPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="11447926"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 16 Nov 2026 14:00:18 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT4kJ-000000019VK-2bqg;
	Mon, 16 Nov 2026 22:00:15 +0000
Date: Tue, 17 Nov 2026 05:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:master] BUILD SUCCESS
 3fc9303dba01676c2090768126e5327e341b7761
Message-ID: <20261117055920.92bv9u8k-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git master
branch HEAD: 3fc9303dba01676c2090768126e5327e341b7761  media: au0828: reject too-short isochronous packets in au0828_isoc_copy

elapsed time: 1491m

configs tested: 384
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                     allnoconfig    gcc-16.2.0
alpha                    allyesconfig    gcc-16.2.0
alpha                       defconfig    gcc-16.2.0
alpha        randconfig-2000-20261112    gcc-10.5.0
alpha        randconfig-2000-20261112    gcc-13.5.0
alpha        randconfig-2000-20261115    gcc-14.4.0
alpha        randconfig-2001-20261112    gcc-10.5.0
alpha        randconfig-2001-20261112    gcc-8.5.0
alpha        randconfig-2001-20261115    gcc-16.2.0
alpha        randconfig-2200-20261112    gcc-15.3.0 smatch
alpha        randconfig-2200-20261115    gcc-8.5.0  smatch
alpha       randconfig-r2107-20261115    gcc-12.5.0 cocci
alpha       randconfig-r2109-20261115    gcc-8.5.0  cocci
alpha       randconfig-r2302-20261112    gcc-15.3.0 sparse
alpha       randconfig-r2303-20261115    gcc-14.4.0 sparse
alpha       randconfig-r2307-20261112    gcc-13.5.0 sparse
arc                       allnoconfig    gcc-16.2.0
arc                      allyesconfig    clang-24
arc                         defconfig    gcc-16.2.0
arc          randconfig-2000-20261112    gcc-8.5.0
arc          randconfig-2000-20261115    gcc-8.5.0
arc          randconfig-2001-20261112    gcc-8.5.0
arc          randconfig-2001-20261115    gcc-16.2.0
arc          randconfig-2002-20261112    gcc-8.5.0
arc          randconfig-2002-20261115    gcc-14.4.0
arc          randconfig-2003-20261112    gcc-8.5.0
arc          randconfig-2003-20261115    gcc-16.2.0
arc          randconfig-2004-20261112    gcc-8.5.0
arc          randconfig-2004-20261115    gcc-8.5.0
arc          randconfig-2005-20261112    gcc-8.5.0
arc          randconfig-2005-20261115    gcc-8.5.0
arc          randconfig-2200-20261112    gcc-8.5.0  smatch
arc          randconfig-2200-20261115    gcc-16.2.0 smatch
arc         randconfig-r2102-20261115    gcc-8.5.0  cocci
arc         randconfig-r2106-20261112    gcc-14.4.0 cocci
arc         randconfig-r2301-20261115    gcc-9.5.0  sparse
arc         randconfig-r2308-20261115    gcc-11.5.0 sparse
arm                       allnoconfig    gcc-16.2.0
arm             am200epdkit_defconfig    gcc-16.2.0
arm                         defconfig    gcc-16.2.0
arm          randconfig-2000-20261112    gcc-11.5.0
arm          randconfig-2000-20261115    clang-24
arm          randconfig-2001-20261112    gcc-11.5.0
arm          randconfig-2001-20261115    gcc-10.5.0
arm          randconfig-2002-20261112    gcc-11.5.0
arm          randconfig-2002-20261115    gcc-8.5.0
arm          randconfig-2200-20261112    gcc-10.5.0 smatch
arm          randconfig-2200-20261115    clang-17   smatch
arm         randconfig-r2106-20261115    gcc-8.5.0  cocci
arm         randconfig-r2304-20261115    gcc-8.5.0  sparse
arm         randconfig-r2305-20261115    clang-24   sparse
arm         randconfig-r2307-20261115    clang-21   sparse
arm         randconfig-r2308-20261112    gcc-13.5.0 sparse
arm         randconfig-r2309-20261115    gcc-10.5.0 sparse
arm         randconfig-r2310-20261112    gcc-13.5.0 sparse
arm                   spitz_defconfig    gcc-16.2.0
arm64                    allmodconfig    clang-24
arm64                     allnoconfig    gcc-16.2.0
arm64                       defconfig    gcc-16.2.0
arm64        randconfig-2000-20261112    gcc-11.5.0
arm64        randconfig-2000-20261115    gcc-13.5.0
arm64        randconfig-2001-20261112    gcc-11.5.0
arm64        randconfig-2001-20261115    clang-22
arm64        randconfig-2002-20261112    gcc-11.5.0
arm64        randconfig-2002-20261115    gcc-8.5.0
arm64        randconfig-2200-20261112    clang-24   smatch
arm64        randconfig-2200-20261115    gcc-15.3.0 smatch
arm64       randconfig-r2107-20261115    clang-24   cocci
arm64       randconfig-r2111-20261115    clang-18   cocci
arm64       randconfig-r2302-20261115    gcc-8.5.0  sparse
arm64       randconfig-r2310-20261115    clang-24   sparse
csky                     alldefconfig    gcc-16.2.0
csky                     allmodconfig    gcc-16.2.0
csky                      allnoconfig    gcc-16.2.0
csky                        defconfig    gcc-16.2.0
csky         randconfig-2000-20261112    gcc-16.2.0
csky         randconfig-2000-20261115    gcc-14.4.0
csky         randconfig-2001-20261112    gcc-16.2.0
csky         randconfig-2001-20261115    gcc-12.5.0
csky         randconfig-2200-20261112    gcc-11.5.0 smatch
csky         randconfig-2200-20261115    gcc-12.5.0 smatch
hexagon                  allmodconfig    gcc-16.2.0
hexagon                   allnoconfig    gcc-16.2.0
hexagon                     defconfig    gcc-16.2.0
hexagon      randconfig-1000-20261116    clang-17
hexagon      randconfig-1001-20261116    clang-17
hexagon      randconfig-2000-20261112    gcc-16.2.0
hexagon      randconfig-2000-20261115    clang-24
hexagon      randconfig-2001-20261112    gcc-16.2.0
hexagon      randconfig-2001-20261115    clang-24
hexagon      randconfig-2200-20261115    clang-24   smatch
hexagon     randconfig-r2110-20261115    clang-24   cocci
hexagon     randconfig-r2303-20261115    clang-21   sparse
i386                     allmodconfig    clang-22
i386                      allnoconfig    gcc-16.2.0
i386                     allyesconfig    clang-22
i386                        defconfig    gcc-16.2.0
i386         randconfig-1000-20261116    gcc-14
i386         randconfig-1001-20261116    gcc-14
i386         randconfig-1002-20261116    gcc-14
i386         randconfig-1003-20261116    gcc-14
i386         randconfig-1004-20261116    gcc-14
i386         randconfig-1005-20261116    gcc-14
i386         randconfig-1006-20261116    gcc-14
i386         randconfig-2000-20261112    gcc-14
i386         randconfig-2000-20261115    gcc-14
i386         randconfig-2001-20261112    gcc-14
i386         randconfig-2001-20261115    gcc-14
i386         randconfig-2002-20261112    gcc-14
i386         randconfig-2002-20261115    gcc-12
i386         randconfig-2003-20261112    gcc-14
i386         randconfig-2003-20261115    clang-22
i386         randconfig-2004-20261112    gcc-14
i386         randconfig-2004-20261115    gcc-14
i386         randconfig-2005-20261112    gcc-14
i386         randconfig-2005-20261115    gcc-12
i386         randconfig-2100-20261115    clang-22   cocci
i386         randconfig-2101-20261115    clang-22   cocci
i386         randconfig-2102-20261115    clang-22   cocci
i386         randconfig-2103-20261115    gcc-14     cocci
i386         randconfig-2104-20261115    gcc-14     cocci
i386         randconfig-2105-20261115    gcc-14     cocci
i386         randconfig-2200-20261112    gcc-14     smatch
i386         randconfig-2200-20261115    gcc-14     smatch
i386         randconfig-2300-20261112    clang-22   sparse
i386         randconfig-2300-20261115    clang-22   sparse
i386         randconfig-2301-20261112    clang-22   sparse
i386         randconfig-2301-20261115    gcc-14     sparse
i386         randconfig-2302-20261112    clang-22   sparse
i386         randconfig-2302-20261115    clang-22   sparse
i386        randconfig-r2105-20261115    clang-22   cocci
i386        randconfig-r2110-20261112    gcc-14     cocci
i386        randconfig-r2111-20261112    clang-22   cocci
loongarch                allmodconfig    clang-24
loongarch                 allnoconfig    gcc-16.2.0
loongarch    randconfig-1000-20261116    clang-17
loongarch    randconfig-1001-20261116    clang-17
loongarch    randconfig-2000-20261115    gcc-16.2.0
loongarch    randconfig-2001-20261115    clang-20
loongarch    randconfig-2200-20261115    gcc-16.2.0 smatch
loongarch   randconfig-r2110-20261115    clang-18   cocci
loongarch   randconfig-r2306-20261112    gcc-13.5.0 sparse
m68k                     allmodconfig    gcc-16.2.0
m68k                      allnoconfig    gcc-16.2.0
m68k         randconfig-2000-20261112    gcc-10.5.0
m68k         randconfig-2000-20261112    gcc-16.2.0
m68k         randconfig-2000-20261115    gcc-15.3.0
m68k         randconfig-2001-20261112    gcc-10.5.0
m68k         randconfig-2001-20261115    gcc-8.5.0
m68k         randconfig-2200-20261112    gcc-14.4.0 smatch
m68k         randconfig-2200-20261115    gcc-8.5.0  smatch
m68k        randconfig-r2108-20261115    gcc-10.5.0 cocci
m68k        randconfig-r2308-20261115    gcc-8.5.0  sparse
m68k        randconfig-r2310-20261115    gcc-15.3.0 sparse
microblaze                allnoconfig    gcc-16.2.0
microblaze               allyesconfig    gcc-16.2.0
microblaze              mmu_defconfig    gcc-16.2.0
microblaze   randconfig-2000-20261112    gcc-10.5.0
microblaze   randconfig-2000-20261112    gcc-9.5.0
microblaze   randconfig-2000-20261115    gcc-10.5.0
microblaze   randconfig-2001-20261112    gcc-10.5.0
microblaze   randconfig-2001-20261112    gcc-8.5.0
microblaze   randconfig-2001-20261115    gcc-16.2.0
microblaze   randconfig-2200-20261115    gcc-12.5.0 smatch
microblaze  randconfig-r2304-20261115    gcc-8.5.0  sparse
mips                     allmodconfig    gcc-16.2.0
mips                      allnoconfig    gcc-16.2.0
mips                     allyesconfig    gcc-16.2.0
mips         randconfig-2000-20261115    clang-17
mips         randconfig-2001-20261115    clang-20
mips         randconfig-2002-20261115    clang-24
mips         randconfig-2200-20261112    gcc-13.5.0 smatch
mips         randconfig-2200-20261115    clang-24   smatch
mips        randconfig-r2109-20261112    gcc-12.5.0 cocci
mips        randconfig-r2111-20261115    gcc-8.5.0  cocci
mips               rbtx49xx_defconfig    gcc-16.2.0
nios2                    allmodconfig    clang-20
nios2                     allnoconfig    clang-24
nios2        randconfig-1000-20261116    clang-17
nios2        randconfig-1001-20261116    clang-17
nios2        randconfig-2000-20261115    gcc-8.5.0
nios2        randconfig-2001-20261115    gcc-8.5.0
nios2        randconfig-2200-20261112    gcc-11.5.0 smatch
nios2        randconfig-2200-20261115    gcc-11.5.0 smatch
nios2       randconfig-r2304-20261112    gcc-15.3.0 sparse
nios2       randconfig-r2305-20261112    gcc-15.3.0 sparse
openrisc                 allmodconfig    clang-20
openrisc                  allnoconfig    clang-24
openrisc                    defconfig    gcc-16.2.0
openrisc     randconfig-2000-20261115    gcc-10.5.0
openrisc     randconfig-2001-20261115    gcc-12.5.0
openrisc     randconfig-2002-20261115    gcc-10.5.0
openrisc     randconfig-2200-20261115    gcc-12.5.0 smatch
openrisc    randconfig-r2100-20261115    gcc-9.5.0  cocci
parisc                   allmodconfig    gcc-16.2.0
parisc                    allnoconfig    clang-24
parisc                   allyesconfig    clang-17
parisc                      defconfig    gcc-16.2.0
parisc       randconfig-2000-20261115    gcc-8.5.0
parisc       randconfig-2001-20261115    gcc-14.4.0
parisc       randconfig-2200-20261112    gcc-8.5.0  smatch
parisc       randconfig-2200-20261115    gcc-10.5.0 smatch
parisc      randconfig-r2104-20261115    gcc-11.5.0 cocci
parisc      randconfig-r2300-20261115    gcc-9.5.0  sparse
powerpc             akebono_defconfig    gcc-16.2.0
powerpc                  allmodconfig    gcc-16.2.0
powerpc                   allnoconfig    clang-24
powerpc              arches_defconfig    gcc-16.2.0
powerpc             powernv_defconfig    gcc-16.2.0
powerpc      randconfig-2000-20261115    gcc-15.3.0
powerpc      randconfig-2001-20261115    gcc-9.5.0
powerpc      randconfig-2002-20261115    clang-24
powerpc      randconfig-2200-20261115    clang-17   smatch
powerpc     randconfig-r2105-20261115    gcc-8.5.0  cocci
powerpc     randconfig-r2108-20261112    gcc-14.4.0 cocci
powerpc     randconfig-r2306-20261115    clang-17   sparse
powerpc64    randconfig-2000-20261115    gcc-13.5.0
powerpc64    randconfig-2001-20261115    gcc-8.5.0
powerpc64    randconfig-2002-20261115    gcc-8.5.0
powerpc64    randconfig-2200-20261112    gcc-16.2.0 smatch
powerpc64    randconfig-2200-20261115    clang-24   smatch
powerpc64   randconfig-r2100-20261115    clang-24   cocci
powerpc64   randconfig-r2101-20261115    gcc-13.5.0 cocci
riscv                    allmodconfig    clang-24
riscv                     allnoconfig    clang-24
riscv                       defconfig    gcc-16.2.0
riscv        randconfig-2000-20261115    clang-20
riscv        randconfig-2001-20261115    gcc-8.5.0
riscv        randconfig-2002-20261115    gcc-11.5.0
riscv        randconfig-2003-20261115    gcc-8.5.0
riscv        randconfig-2004-20261115    gcc-15.3.0
riscv        randconfig-2005-20261115    gcc-9.5.0
riscv        randconfig-2200-20261112    clang-24   smatch
riscv        randconfig-2200-20261115    clang-24   smatch
riscv       randconfig-r2309-20261115    clang-24   sparse
s390                     allmodconfig    clang-17
s390                      allnoconfig    clang-24
s390                     allyesconfig    gcc-16.2.0
s390                        defconfig    gcc-16.2.0
s390         randconfig-2000-20261112    clang-24
s390         randconfig-2000-20261115    gcc-11.5.0
s390         randconfig-2001-20261112    clang-24
s390         randconfig-2001-20261115    clang-17
s390         randconfig-2002-20261112    clang-24
s390         randconfig-2002-20261115    clang-24
s390         randconfig-2003-20261112    clang-24
s390         randconfig-2003-20261115    clang-24
s390         randconfig-2004-20261112    clang-24
s390         randconfig-2004-20261115    gcc-8.5.0
s390         randconfig-2005-20261112    clang-24
s390         randconfig-2005-20261115    gcc-13.5.0
s390         randconfig-2200-20261115    clang-24   smatch
s390        randconfig-r2107-20261112    clang-24   cocci
s390        randconfig-r2109-20261115    gcc-9.5.0  cocci
sh                       allmodconfig    gcc-16.2.0
sh                        allnoconfig    clang-24
sh                       allyesconfig    clang-17
sh           randconfig-2000-20261112    gcc-16.2.0
sh           randconfig-2000-20261115    gcc-10.5.0
sh           randconfig-2001-20261112    gcc-16.2.0
sh           randconfig-2001-20261115    gcc-12.5.0
sh           randconfig-2002-20261112    gcc-16.2.0
sh           randconfig-2002-20261115    gcc-10.5.0
sh           randconfig-2003-20261112    gcc-16.2.0
sh           randconfig-2003-20261115    gcc-16.2.0
sh           randconfig-2004-20261112    gcc-16.2.0
sh           randconfig-2004-20261115    gcc-10.5.0
sh           randconfig-2005-20261112    gcc-16.2.0
sh           randconfig-2005-20261115    gcc-12.5.0
sh           randconfig-2200-20261112    gcc-16.2.0 smatch
sh           randconfig-2200-20261115    gcc-16.2.0 smatch
sh          randconfig-r2108-20261115    gcc-10.5.0 cocci
sh          randconfig-r2300-20261112    gcc-15.3.0 sparse
sh          randconfig-r2301-20261115    gcc-16.2.0 sparse
sparc                     allnoconfig    clang-24
sparc                       defconfig    gcc-16.2.0
sparc        randconfig-2000-20261112    clang-24
sparc        randconfig-2000-20261115    gcc-8.5.0
sparc        randconfig-2001-20261112    clang-24
sparc        randconfig-2001-20261115    gcc-8.5.0
sparc        randconfig-2200-20261112    gcc-11.5.0 smatch
sparc        randconfig-2200-20261115    gcc-16.2.0 smatch
sparc       randconfig-r2101-20261115    gcc-16.2.0 cocci
sparc       randconfig-r2102-20261115    gcc-14.4.0 cocci
sparc       randconfig-r2104-20261115    gcc-14.4.0 cocci
sparc       randconfig-r2303-20261112    gcc-15.3.0 sparse
sparc       randconfig-r2306-20261115    gcc-16.2.0 sparse
sparc       randconfig-r2307-20261115    gcc-16.2.0 sparse
sparc       randconfig-r2311-20261115    gcc-13.5.0 sparse
sparc64                  allmodconfig    clang-20
sparc64      randconfig-2000-20261112    clang-24
sparc64      randconfig-2000-20261115    gcc-15.3.0
sparc64      randconfig-2001-20261112    clang-24
sparc64      randconfig-2001-20261115    gcc-9.5.0
sparc64      randconfig-2200-20261115    gcc-13.5.0 smatch
um                       allmodconfig    clang-17
um                        allnoconfig    clang-24
um                       allyesconfig    gcc-16.2.0
um           randconfig-2000-20261112    clang-24
um           randconfig-2000-20261115    gcc-14
um           randconfig-2001-20261112    clang-24
um           randconfig-2001-20261115    clang-24
um           randconfig-2200-20261112    clang-20   smatch
um           randconfig-2200-20261115    clang-24   smatch
um          randconfig-r2103-20261115    gcc-14     cocci
um          randconfig-r2302-20261115    gcc-14     sparse
um          randconfig-r2309-20261112    gcc-13.5.0 sparse
um          randconfig-r2311-20261112    gcc-13.5.0 sparse
um          randconfig-r2311-20261115    gcc-14     sparse
x86_64                   allmodconfig    clang-22
x86_64                    allnoconfig    clang-24
x86_64                   allyesconfig    clang-22
x86_64                          kexec    clang-22
x86_64       randconfig-1000-20261116    gcc-14
x86_64       randconfig-1001-20261116    gcc-14
x86_64       randconfig-1002-20261116    gcc-14
x86_64       randconfig-1003-20261116    gcc-14
x86_64       randconfig-1004-20261116    gcc-14
x86_64       randconfig-1005-20261116    gcc-14
x86_64       randconfig-1006-20261116    clang-22
x86_64       randconfig-1007-20261116    clang-22
x86_64       randconfig-1008-20261116    clang-22
x86_64       randconfig-1009-20261116    clang-22
x86_64       randconfig-1010-20261116    clang-22
x86_64       randconfig-1011-20261116    clang-22
x86_64       randconfig-1012-20261116    clang-22
x86_64       randconfig-1013-20261116    clang-22
x86_64       randconfig-1014-20261116    clang-22
x86_64       randconfig-1015-20261116    clang-22
x86_64       randconfig-1016-20261116    clang-22
x86_64       randconfig-1017-20261116    clang-22
x86_64       randconfig-2000-20261112    gcc-14
x86_64       randconfig-2000-20261115    gcc-14
x86_64       randconfig-2001-20261112    gcc-14
x86_64       randconfig-2001-20261115    gcc-14
x86_64       randconfig-2002-20261112    gcc-14
x86_64       randconfig-2002-20261115    gcc-14
x86_64       randconfig-2003-20261112    gcc-14
x86_64       randconfig-2003-20261115    clang-22
x86_64       randconfig-2004-20261112    gcc-14
x86_64       randconfig-2004-20261115    clang-22
x86_64       randconfig-2005-20261112    gcc-14
x86_64       randconfig-2005-20261115    gcc-14
x86_64       randconfig-2100-20261112    clang-22   cocci
x86_64       randconfig-2100-20261115    clang-22   cocci
x86_64       randconfig-2101-20261112    clang-22   cocci
x86_64       randconfig-2101-20261115    clang-22   cocci
x86_64       randconfig-2102-20261112    clang-22   cocci
x86_64       randconfig-2102-20261115    gcc-14     cocci
x86_64       randconfig-2103-20261112    clang-22   cocci
x86_64       randconfig-2103-20261115    clang-22   cocci
x86_64       randconfig-2104-20261112    clang-22   cocci
x86_64       randconfig-2104-20261115    gcc-14     cocci
x86_64       randconfig-2105-20261112    clang-22   cocci
x86_64       randconfig-2105-20261115    gcc-14     cocci
x86_64       randconfig-2200-20261115    clang-22   smatch
x86_64       randconfig-2300-20261112    clang-22   sparse
x86_64       randconfig-2300-20261115    gcc-14     sparse
x86_64       randconfig-2301-20261112    clang-22   sparse
x86_64       randconfig-2301-20261115    clang-22   sparse
x86_64       randconfig-2302-20261112    clang-22   sparse
x86_64       randconfig-2302-20261115    clang-22   sparse
x86_64      randconfig-r2305-20261115    gcc-14     sparse
x86_64                       rhel-9.4    clang-22
x86_64                   rhel-9.4-bpf    clang-22
x86_64                   rhel-9.4-bpf    gcc-14
x86_64                  rhel-9.4-func    clang-22
x86_64            rhel-9.4-kselftests    clang-22
x86_64                 rhel-9.4-kunit    clang-22
x86_64                 rhel-9.4-kunit    gcc-14
x86_64                   rhel-9.4-ltp    clang-22
x86_64                   rhel-9.4-ltp    gcc-14
x86_64                  rhel-9.4-rust    clang-22
x86_64                  rhel-9.4-rust    clang-22
xtensa                    allnoconfig    clang-24
xtensa                   allyesconfig    clang-20
xtensa       randconfig-2000-20261112    gcc-16.2.0
xtensa       randconfig-2000-20261115    gcc-8.5.0
xtensa       randconfig-2001-20261112    gcc-16.2.0
xtensa       randconfig-2001-20261115    gcc-10.5.0
xtensa       randconfig-2200-20261115    gcc-14.4.0 smatch
xtensa      randconfig-r2103-20261115    gcc-8.5.0  cocci
xtensa      randconfig-r2300-20261115    gcc-15.3.0 sparse
xtensa      randconfig-r2301-20261112    gcc-15.3.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
