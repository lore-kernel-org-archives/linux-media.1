Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823443;
	b=Xcx9JW5znjmFM58IP98dHFDxIoK6BsEGJ+7tf3Xc9UCplnc5UGEWgqqSJ8w+sDvtD9xJ
	 2ZQvwfUJGPatAa/D+JQoJ8op965B9PTMb7D2UFiQV/t5qzEUm6Tb/Da59OrvbAB7ZFp9n
	 950g2Dckune7hhYBCG+9JcsUl8ta6YRYCNFoKYE7vTCGyVZytC36Ffw5LLBDg0aqo9Ux+
	 t8LS7CA7nMkFGMdJeuK1WNKVbJMETUjlEv5U9KrsXvR0Q3uYoPcJMl1LBI9l4ynp3ck7f
	 bp7RMy9nantzA95yozLkrkgFH+WVRVtVJfPdcH1LJG6uurYpMHs8eD1HJ1/FaKVSg5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823443;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=dDOTCpmw7MJ2uEO02GTgD/8nKou2PHjMT3uloiaQ1OY=;
	b=wBOgmoNfpCr+Bom6IpsT5pMFZZVVh7cIBupaDIxXOsn+xtndxXiLLp9uH7M8WHurnFbe
	 69PDHF1jGo3UMgkCTLIBYAf/+twfqOP1DgGRPguTLLBw7CupezIpsbJCHdHLt0c4FhmMj
	 GSHto1bQsAsm4EkTpPwBJtb8SPXnVB6FBaFuBak0nkbbqQUGDBz92+sTPjGvRvmZbnFaf
	 4CIxfCuNFnA0D4MPbz80WlK9w3V9TXcGJH2GbxfPcQnasOcFSusbI3x6sEYS7Sksmn5dm
	 Kr9GjUsKNYrc1IMInpyQgCZrFuEbdbmLMAgcW06k0cx5+1X+wDCDxUzuVT0q7eyyH3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OUD4Yvec;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869EA606A31C
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 10:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 869EA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OUD4Yvec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794823443; x=1826359443;
  h=date:from:to:cc:subject:message-id;
  bh=CHD51zInh0y9FJKCgVOykKJnxvabIp1PiBey8FUC3hs=;
  b=OUD4YveczmZ00BXEQG6hGEDwAZDs/YjoPHVx9907lyPFzB1K/rB2cvCf
   LDzhrVy4Ii7At7k0Dfoul71TEqGFGG+Z7w85vbtQjtabMAd8ilpIuGSwq
   AZYo/cs6/3d6tHzgU6IY3LQYh9nDf0cBtlhuGt9pi5eg7GYR9unkYG5PQ
   BfxcHV1fVycZhA06b7ttkER2BZj+blMzD2/DinUgqwW9zfT89Y9SGFhlz
   EovrvJSUV1U0f1x/1VyqCFHs5oeEIyHk19p1386Zt8EaFQonNKtXM4ePr
   FC2NlCryJbTAm6BzX9MwiMFdXB+JQVmvDGPzsLSyqLy71bEz8g3y7cElT
   w==;
X-CSE-ConnectionGUID: BZctfsseTF207Ztm7zXNQQ==
X-CSE-MsgGUID: 0k9scZFYSSeuz0lOjZUXJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3463034"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3463034"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 02:04:03 -0800
X-CSE-ConnectionGUID: hWrFhOSuTimKNljCb31/zA==
X-CSE-MsgGUID: xKxxbm84SUimF1lpbqWiAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9501508"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Nov 2026 02:04:01 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xStZ8-000000018JQ-3clt;
	Mon, 16 Nov 2026 10:03:58 +0000
Date: Mon, 16 Nov 2026 18:03:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 48fe5a7834cc10081887d7bcd9ff0a4cadc3fa8c
Message-ID: <20261116180300.nQJNOkfM-lkp@intel.com>
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
branch HEAD: 48fe5a7834cc10081887d7bcd9ff0a4cadc3fa8c  media: ipu6: Keep psys out of direct-complete on system suspend

elapsed time: 2948m

configs tested: 137
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        randconfig-2000-20261114    gcc-8.5.0
alpha        randconfig-2001-20261114    gcc-9.5.0
alpha        randconfig-2200-20261114    gcc-9.5.0  smatch
arc          randconfig-2000-20261114    gcc-11.5.0
arc          randconfig-2001-20261114    gcc-13.5.0
arc          randconfig-2002-20261114    gcc-11.5.0
arc          randconfig-2003-20261114    gcc-13.5.0
arc          randconfig-2004-20261114    gcc-8.5.0
arc          randconfig-2005-20261114    gcc-9.5.0
arc          randconfig-2200-20261114    gcc-8.5.0  smatch
arc         randconfig-r2107-20261114    gcc-14.4.0 cocci
arm          randconfig-2000-20261114    gcc-10.5.0
arm          randconfig-2001-20261114    gcc-11.5.0
arm          randconfig-2002-20261114    gcc-10.5.0
arm          randconfig-2200-20261114    clang-17   smatch
arm         randconfig-r2310-20261114    clang-24   sparse
arm64        randconfig-2000-20261114    clang-22
arm64        randconfig-2001-20261114    gcc-14.4.0
arm64        randconfig-2002-20261114    clang-24
arm64        randconfig-2200-20261114    clang-17   smatch
arm64       randconfig-r2105-20261114    gcc-10.5.0 cocci
csky         randconfig-2000-20261114    gcc-16.2.0
csky         randconfig-2001-20261114    gcc-13.5.0
csky         randconfig-2200-20261114    gcc-16.2.0 smatch
csky        randconfig-r2301-20261114    gcc-16.2.0 sparse
hexagon      randconfig-2000-20261114    clang-24
hexagon      randconfig-2001-20261114    clang-24
hexagon      randconfig-2200-20261114    clang-24   smatch
i386         randconfig-2000-20261114    clang-22
i386         randconfig-2001-20261114    clang-22
i386         randconfig-2002-20261114    clang-22
i386         randconfig-2003-20261114    gcc-14
i386         randconfig-2004-20261114    gcc-14
i386         randconfig-2005-20261114    gcc-14
i386         randconfig-2100-20261114    gcc-14     cocci
i386         randconfig-2101-20261114    clang-22   cocci
i386         randconfig-2102-20261114    gcc-14     cocci
i386         randconfig-2103-20261114    gcc-14     cocci
i386         randconfig-2104-20261114    gcc-14     cocci
i386         randconfig-2105-20261114    clang-22   cocci
i386         randconfig-2200-20261114    gcc-14     smatch
i386         randconfig-2300-20261114    gcc-12     sparse
i386         randconfig-2301-20261114    gcc-14     sparse
i386         randconfig-2302-20261114    gcc-14     sparse
i386        randconfig-r2111-20261114    clang-22   cocci
i386        randconfig-r2303-20261114    gcc-14     sparse
loongarch    randconfig-2000-20261114    clang-22
loongarch    randconfig-2001-20261114    clang-24
loongarch    randconfig-2200-20261114    clang-18   smatch
loongarch   randconfig-r2106-20261114    clang-24   cocci
m68k         randconfig-2000-20261114    gcc-8.5.0
m68k         randconfig-2001-20261114    gcc-12.5.0
m68k         randconfig-2200-20261114    gcc-16.2.0 smatch
m68k        randconfig-r2307-20261114    gcc-15.3.0 sparse
microblaze   randconfig-2000-20261114    gcc-15.3.0
microblaze   randconfig-2001-20261114    gcc-9.5.0
microblaze   randconfig-2200-20261114    gcc-9.5.0  smatch
mips         randconfig-2000-20261114    clang-24
mips         randconfig-2001-20261114    gcc-8.5.0
mips         randconfig-2002-20261114    gcc-13.5.0
mips         randconfig-2200-20261114    gcc-15.3.0 smatch
nios2        randconfig-2000-20261114    gcc-11.5.0
nios2        randconfig-2001-20261114    gcc-11.5.0
nios2        randconfig-2200-20261114    gcc-11.5.0 smatch
nios2       randconfig-r2311-20261114    gcc-8.5.0  sparse
openrisc     randconfig-2000-20261114    gcc-16.2.0
openrisc     randconfig-2001-20261114    gcc-9.5.0
openrisc     randconfig-2002-20261114    gcc-16.2.0
openrisc     randconfig-2200-20261114    gcc-16.2.0 smatch
openrisc    randconfig-r2102-20261114    gcc-16.2.0 cocci
parisc       randconfig-2000-20261114    gcc-13.5.0
parisc       randconfig-2001-20261114    gcc-15.3.0
parisc       randconfig-2200-20261114    gcc-8.5.0  smatch
parisc      randconfig-r2103-20261114    gcc-8.5.0  cocci
parisc      randconfig-r2110-20261114    gcc-8.5.0  cocci
parisc      randconfig-r2300-20261114    gcc-16.2.0 sparse
parisc      randconfig-r2302-20261114    gcc-8.5.0  sparse
powerpc      randconfig-2000-20261114    gcc-8.5.0
powerpc      randconfig-2001-20261114    clang-19
powerpc      randconfig-2002-20261114    clang-21
powerpc      randconfig-2200-20261114    clang-24   smatch
powerpc     randconfig-r2104-20261114    clang-17   cocci
powerpc     randconfig-r2109-20261114    gcc-14.4.0 cocci
powerpc     randconfig-r2304-20261114    clang-19   sparse
powerpc     randconfig-r2306-20261114    gcc-10.5.0 sparse
powerpc64    randconfig-2000-20261114    clang-19
powerpc64    randconfig-2001-20261114    gcc-8.5.0
powerpc64    randconfig-2002-20261114    clang-24
powerpc64    randconfig-2200-20261114    clang-17   smatch
riscv        randconfig-2000-20261114    clang-24
riscv        randconfig-2001-20261114    gcc-16.2.0
riscv        randconfig-2002-20261114    gcc-14.4.0
riscv        randconfig-2003-20261114    gcc-12.5.0
riscv        randconfig-2004-20261114    clang-17
riscv        randconfig-2005-20261114    clang-19
riscv        randconfig-2200-20261114    clang-24   smatch
s390         randconfig-2000-20261114    clang-21
s390         randconfig-2001-20261114    clang-24
s390         randconfig-2002-20261114    clang-24
s390         randconfig-2003-20261114    gcc-12.5.0
s390         randconfig-2004-20261114    clang-17
s390         randconfig-2005-20261114    clang-24
s390         randconfig-2200-20261114    clang-24   smatch
s390        randconfig-r2108-20261114    clang-22   cocci
sh           randconfig-2000-20261114    gcc-16.2.0
sh           randconfig-2001-20261114    gcc-16.2.0
sh           randconfig-2002-20261114    gcc-16.2.0
sh           randconfig-2003-20261114    gcc-16.2.0
sh           randconfig-2004-20261114    gcc-11.5.0
sh           randconfig-2005-20261114    gcc-13.5.0
sh           randconfig-2200-20261114    gcc-9.5.0  smatch
sh          randconfig-r2100-20261114    gcc-15.3.0 cocci
sh          randconfig-r2305-20261114    gcc-16.2.0 sparse
sparc        randconfig-2000-20261114    gcc-11.5.0
sparc        randconfig-2001-20261114    gcc-13.5.0
sparc        randconfig-2200-20261114    gcc-8.5.0  smatch
sparc64      randconfig-2000-20261114    clang-24
sparc64      randconfig-2001-20261114    gcc-8.5.0
sparc64      randconfig-2200-20261114    gcc-16.2.0 smatch
sparc64     randconfig-r2308-20261114    gcc-8.5.0  sparse
um           randconfig-2000-20261114    clang-24
um           randconfig-2001-20261114    clang-21
um           randconfig-2200-20261114    gcc-14     smatch
x86_64       randconfig-2000-20261114    gcc-14
x86_64       randconfig-2001-20261114    gcc-14
x86_64       randconfig-2002-20261114    clang-22
x86_64       randconfig-2003-20261114    gcc-14
x86_64       randconfig-2004-20261114    gcc-14
x86_64       randconfig-2005-20261114    gcc-14
x86_64       randconfig-2200-20261114    gcc-14     smatch
x86_64       randconfig-2300-20261114    gcc-12     sparse
x86_64       randconfig-2301-20261114    gcc-14     sparse
x86_64       randconfig-2302-20261114    clang-22   sparse
x86_64      randconfig-r2101-20261114    clang-22   cocci
xtensa       randconfig-2000-20261114    gcc-9.5.0
xtensa       randconfig-2001-20261114    gcc-11.5.0
xtensa      randconfig-r2309-20261114    gcc-12.5.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
