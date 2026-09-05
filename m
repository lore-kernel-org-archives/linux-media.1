Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD3C39525E
	for <linux-media@vger.kernel.org>; Sat,  5 Sep 2026 20:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788638883; cv=none; b=m9NooQnfCnRHlZRTw/wGw8ISAIcCUl7kHBoW/UyUGW0s+A0p0FURFnG+89wJwzenNQi1FDdM+nU2rPaX8I3vt2trkM18R7HrZvtd27lXkv5DhxvCquxjvD8s8AWVgzaAgVowGI1Mwht2fncLVscII3jhjPTfCDI/ha4gihR/it8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788638883; c=relaxed/simple;
	bh=1BKgAfjMbhdWGMafHAUkft3H4+4fIJIoU1FGfAMCpPM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nCgx7K/tCsLf9sMFEw+dna/J4WT5qiOa+mGpfor3N0wPly9SAk7s+EA2vhLg8gh4ZP7TFvTPSqHim+DChpSN2DZRHUPzM9hgreW7RXN+mWjxHJ2splAKp/RjYanHzfVrEj6zJFfV/qZa/Dh/y/+BDafnxH3rOFR5IoMFR4BHf9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SkwTad5m; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SkwTad5m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788638882; x=1820174882;
  h=date:from:to:cc:subject:message-id;
  bh=1BKgAfjMbhdWGMafHAUkft3H4+4fIJIoU1FGfAMCpPM=;
  b=SkwTad5m9EFWukifKiOJD4k+ypLJC2ARBn7i/kMPFH4S2d+wG/stat+2
   VemobTfrirMIvW/w9inFN56+LwPpzpiBWPj2XL7HUa+2cwdfd3s1sQOZZ
   ll+7AYBtIjGZpw0fMvo89qWSK6qz7yel3YA52+O2/TEN4+scN66mfDwDB
   xcKQ49vgUb4t7vujUvzVZv8Q69Tvr60tXDTakWtDOpXDo6+9h0vpkbfF2
   l8LdzGvfPlX4al/cbufofcjsq7uGUnOEasQrMXPIG0JLlhtO2XfFbBJrM
   OpXipaAqhDkP8cmHO3bbZXYqsji8x7deLmPHH40A+p8dvWAArBr0v8JZo
   g==;
X-CSE-ConnectionGUID: BTVAjpb5TkmBXGG742v25A==
X-CSE-MsgGUID: J+S/oiuJR0SWfXfGldFUpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="100458227"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="100458227"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 13:08:01 -0700
X-CSE-ConnectionGUID: V4vmsZ2ZQ1yU88KPphEe0w==
X-CSE-MsgGUID: Jv/Qm858R3mby3kxu1RSoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="300241409"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Sep 2026 13:08:00 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2wgA-00000000143-19kX;
	Sat, 05 Sep 2026 20:07:58 +0000
Date: Sun, 06 Sep 2026 04:07:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 f9536a8065d9eed0d9114878c56ffc4e5a18bdfc
Message-ID: <202609060420.sl5kl12V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: f9536a8065d9eed0d9114878c56ffc4e5a18bdfc  media: ipu-bridge: Add support additional link frequency

elapsed time: 2077m

configs tested: 55
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2         allnoconfig    clang-24
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc       allyesconfig    clang-17
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh           allyesconfig    clang-17
sparc         allnoconfig    clang-24
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
