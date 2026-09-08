Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632D14028F2
	for <linux-media@vger.kernel.org>; Tue,  8 Sep 2026 08:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855810; cv=none; b=hihc5UWj3SuCQuYuB5o8SHgiLGW5kMX1aW1rVQccL6MKToNGngfZgDTiZAbv6aELClojsaPx6JGU+kYFvFMlfFfLY/Vp+BzbNLtkq0zL7R1DG5FqiSaVO47k3en53ffGafqY6PQYyP3eeC02WMkv3OZaUA/LHX1DD9oytQqt+P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855810; c=relaxed/simple;
	bh=mlA0vIGGg7fbX+HVpBE8Wg4DzovyOe2aAyZcDsioO9M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JPhNk+ZZ8a/dkN8O9gLW5JnrA0G716mWefk8OMB5nmGR1/TXuMdFTrzCG1/Nbv90FKn0zOodC2l1Kej4gbpH3kBBQMFSJzlBQ2A9qEH6kld8DWGHPefxtu9dDSH+Jfv1nEGbnzqTDfUcPhHQj2NNFNMMH/oQFnHGAKRkoKbSLeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mzh70w3a; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mzh70w3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788855808; x=1820391808;
  h=date:from:to:cc:subject:message-id;
  bh=mlA0vIGGg7fbX+HVpBE8Wg4DzovyOe2aAyZcDsioO9M=;
  b=mzh70w3aAkyYCvQlwAS5Oj3tKhQLfm+pyQ8WrG3N+pUtjnTWagDL02Rr
   5HUevTXVSUtCfbdQ4w4Mmtif8ieKKxxbunqK/ppqSMAxSZnoU+wczn03j
   iX45x6PbiYYgJHPY76SrJWLHTUTenUglrujPRgib+WVaVkSVIqcckJ6gz
   Tz4fmdBd3syPAdB8DAQTDJIPqavmCE4PlvLZQQkp8OdRQh8JUDc/auNsa
   E2IVhkZv8HzslEXpg4S8uaQDYT73zACcSzLGdiitg70S3liQ/ixVI+Jsm
   XFcW32n5J/Kskl1dhAhKo2n7w06kjZqNnXqwN+jaUTEfE79fs8Ui1n1G/
   A==;
X-CSE-ConnectionGUID: Bw2e3GGJQriFYsLTGTfAUg==
X-CSE-MsgGUID: ImrBQtEiTquCn8T3Q3FTuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106765521"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="106765521"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:23:27 -0700
X-CSE-ConnectionGUID: /0OIy8PST5SFTVzCq2ftpg==
X-CSE-MsgGUID: Zye/MMxDTcidmNfFjRYeRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="274450120"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Sep 2026 01:23:26 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3r6y-000000001tB-2O4j;
	Tue, 08 Sep 2026 08:23:24 +0000
Date: Tue, 08 Sep 2026 16:22:42 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:fixes] BUILD SUCCESS
 37bef2170d4c88fc3d708eecf3ef0f4032bc1372
Message-ID: <202609081639.yuHdT0kG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git fixes
branch HEAD: 37bef2170d4c88fc3d708eecf3ef0f4032bc1372  media: mediatek: vcodec: bound AV1 tile-start copy to the array capacity

elapsed time: 1406m

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
