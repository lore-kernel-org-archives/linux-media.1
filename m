Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F01A10F1
	for <linux-media@vger.kernel.org>; Sat, 29 Aug 2026 03:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787975270; cv=none; b=Ow7dD+wuLKrtaVC1q3krJQBSrJ/xECcQAh537G8biOLEtU7Pq+bgsWboo+dLQg+gKJKTrs9N69uZ0mD+2iztI0CbH/2rz4YLGhU5yQMM46MQxk5mBIYRNmk2oWjNp7R9OzuVHE9myuc38ZyfsGizR2z1JxMNTdhbG+imtPLYuMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787975270; c=relaxed/simple;
	bh=57FaLB941ve9BGSy4qI6FCi/oNwVh/E/wEZtaA9U8TY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T5pOFbYRsbb/EWUhsktXhUcPqdPidMZusX853btFaio+qwxhKcnSKJkkShSZOf1ns2tgxf8Ilr4mPqalQXtYHpPo0qn5VBJyIYaHM+APTpT0jmBV6LQ2AbvyW962VmknjBpKddlWGvcSaF57EXp6wj8OZ2/kXDH0pSI4P6fAlYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVnt0zNS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVnt0zNS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787975269; x=1819511269;
  h=date:from:to:cc:subject:message-id;
  bh=57FaLB941ve9BGSy4qI6FCi/oNwVh/E/wEZtaA9U8TY=;
  b=iVnt0zNSe02QDnB1iefhma7vA+3Cg8RHtGXOq2gOIqGL0cfjii0Tqok0
   tLFKC0AZEOU1zswyYhqd8PGvsETebetcwkpHoKVTrmtOHPthk9TmJTVdk
   TGppwdY4mWW4l0qGFa+r5+LJssopUro2s66rs9qmw+Uvn+6sWUaFttDCO
   VcQvB2xWtT3fj7i2Ses4txTj3O6UuYQ72yL9ht1GIsxLUw+yVK9hYSZdQ
   dCxBXNM0skei0ccrspegTGCq53NOFfUYNLNRAscgkz9bPd8f/myHJRvXM
   fpwZEhSnXeC7PSbuqAKVGGArbQ1SICelD8srDdLA3GA/p6ynNXWAqECuC
   w==;
X-CSE-ConnectionGUID: wZamBgFPSfuVTZ6spLy2Mw==
X-CSE-MsgGUID: ZPdOjTr5QeqNSTrZFl4Fig==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="105855693"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="105855693"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 20:47:48 -0700
X-CSE-ConnectionGUID: nLX2faiqTyWeZDVBGQpx2w==
X-CSE-MsgGUID: ENes1GYsRpi2vQKPL81l5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="272534108"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Aug 2026 20:47:47 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0A2i-00000000CLe-2z2M;
	Sat, 29 Aug 2026 03:47:44 +0000
Date: Sat, 29 Aug 2026 11:47:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6] BUILD SUCCESS
 ad890ac8c5a1889e662cd1e5d9cda37c26392c38
Message-ID: <202608291128.PHF03gaj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git ipu6
branch HEAD: ad890ac8c5a1889e662cd1e5d9cda37c26392c38  media: ipu6: Enable ipu7 and ipu7.5

elapsed time: 737m

configs tested: 106
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha               allnoconfig    gcc-16.1.0
alpha              allyesconfig    gcc-16.1.0
alpha                 defconfig    gcc-16.1.0
arc                allmodconfig    clang-24
arc                 allnoconfig    gcc-16.1.0
arc                allyesconfig    clang-24
arc                   defconfig    gcc-16.1.0
arm                 allnoconfig    clang-17
arm                 allnoconfig    gcc-16.1.0
arm                allyesconfig    clang-24
arm                   defconfig    gcc-16.1.0
arm64              allmodconfig    clang-24
arm64               allnoconfig    gcc-16.1.0
arm64                 defconfig    gcc-16.1.0
csky               allmodconfig    gcc-16.1.0
csky                allnoconfig    gcc-16.1.0
csky                  defconfig    gcc-16.1.0
hexagon            allmodconfig    clang-24
hexagon            allmodconfig    gcc-16.1.0
hexagon             allnoconfig    clang-24
hexagon             allnoconfig    gcc-16.1.0
hexagon               defconfig    gcc-16.1.0
i386               allmodconfig    clang-22
i386                allnoconfig    gcc-14
i386                allnoconfig    gcc-16.1.0
i386               allyesconfig    clang-22
i386                  defconfig    gcc-16.1.0
loongarch          allmodconfig    clang-24
loongarch           allnoconfig    clang-20
loongarch           allnoconfig    gcc-16.1.0
loongarch             defconfig    clang-24
m68k               allmodconfig    gcc-16.1.0
m68k                allnoconfig    gcc-16.1.0
m68k               allyesconfig    clang-24
m68k                  defconfig    clang-24
microblaze          allnoconfig    gcc-16.1.0
microblaze         allyesconfig    gcc-16.1.0
microblaze            defconfig    clang-24
mips               allmodconfig    gcc-16.1.0
mips                allnoconfig    gcc-16.1.0
mips               allyesconfig    gcc-16.1.0
nios2              allmodconfig    clang-20
nios2              allmodconfig    gcc-11.5.0
nios2               allnoconfig    clang-24
nios2               allnoconfig    gcc-11.5.0
nios2                 defconfig    clang-24
openrisc           allmodconfig    clang-20
openrisc           allmodconfig    gcc-16.1.0
openrisc            allnoconfig    clang-24
openrisc            allnoconfig    gcc-16.1.0
openrisc              defconfig    gcc-16.1.0
parisc             allmodconfig    gcc-16.1.0
parisc              allnoconfig    clang-24
parisc              allnoconfig    gcc-16.1.0
parisc             allyesconfig    clang-17
parisc             allyesconfig    gcc-16.1.0
parisc                defconfig    gcc-16.1.0
parisc64              defconfig    clang-24
powerpc            allmodconfig    gcc-16.1.0
powerpc             allnoconfig    clang-24
powerpc             allnoconfig    gcc-16.1.0
riscv              allmodconfig    clang-24
riscv               allnoconfig    clang-24
riscv               allnoconfig    gcc-16.1.0
riscv              allyesconfig    clang-24
riscv                 defconfig    gcc-16.1.0
s390               allmodconfig    clang-17
s390               allmodconfig    clang-24
s390                allnoconfig    clang-24
s390               allyesconfig    gcc-16.1.0
s390                  defconfig    gcc-16.1.0
sh                 allmodconfig    gcc-16.1.0
sh                  allnoconfig    clang-24
sh                  allnoconfig    gcc-16.1.0
sh                 allyesconfig    clang-17
sh                 allyesconfig    gcc-16.1.0
sh                    defconfig    gcc-14
sparc               allnoconfig    clang-24
sparc               allnoconfig    gcc-16.1.0
sparc                 defconfig    gcc-16.1.0
sparc64            allmodconfig    clang-20
sparc64               defconfig    gcc-14
um                 allmodconfig    clang-17
um                  allnoconfig    clang-24
um                 allyesconfig    gcc-14
um                 allyesconfig    gcc-16.1.0
um                    defconfig    gcc-14
um               i386_defconfig    gcc-14
um             x86_64_defconfig    gcc-14
x86_64             allmodconfig    clang-22
x86_64              allnoconfig    clang-22
x86_64              allnoconfig    clang-24
x86_64             allyesconfig    clang-22
x86_64                defconfig    gcc-14
x86_64                    kexec    clang-22
x86_64                 rhel-9.4    clang-22
x86_64             rhel-9.4-bpf    gcc-14
x86_64            rhel-9.4-func    clang-22
x86_64      rhel-9.4-kselftests    clang-22
x86_64           rhel-9.4-kunit    gcc-14
x86_64             rhel-9.4-ltp    gcc-14
x86_64            rhel-9.4-rust    clang-22
xtensa              allnoconfig    clang-24
xtensa              allnoconfig    gcc-16.1.0
xtensa             allyesconfig    clang-20
xtensa             allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
