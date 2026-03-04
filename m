Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879ED391834
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 08:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613390; cv=none; b=Hjz+VdVfnAbf3I26u2XMamMqTOVlWrkCApnZn9nCKYtvINO8enbAD+GasfUfIpYQplZ7pgcJP75S3epOB0HlUYLacrZ+6zmKndKrof2IuDlu7Z98076EI0yE9i+MZ4uyrK8bEnQVH142MiDAmJ/8T4eR9ci02OXEL5Lar3Y3VkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613390; c=relaxed/simple;
	bh=QWta2HkrrQLQXe+MkpdvjUUHnaP2lUDtKLS1ZD56CuM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E/3h9FAjA1Wz6xCDA7XCr/L+v6Fz55fupnS1RqLAc0hQGoZ9w8b/Zf3TV+7JqP+RZpodInnLDxUobS1DBuuRPtkfuOEhTSksqo7rlhtd2KJvVlfgFqTywbqoO7eTThhh+SDl6T/ec6yC3E7URdpOxOToX3QXvTpfAbiwhdh2sj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/S5T/vO; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/S5T/vO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772613388; x=1804149388;
  h=date:from:to:cc:subject:message-id;
  bh=QWta2HkrrQLQXe+MkpdvjUUHnaP2lUDtKLS1ZD56CuM=;
  b=n/S5T/vOe9aN0zJYXs4FZ6t0V0kSv9gIc/GBG2/OrEj/pSUByLaVMqwW
   LWsbULdKy1P2waHK8R7vFyN20V+AHw5KLtC07HAQgBc/KdNi+CAhJQojc
   9aKfCnbP/5aYpm++/TPDMFXTcG579aL2MECElVeRRnYT7R90Jdxr4SLDp
   3Z346bCD0nPT2crnPuHSUeH8A/i31hhTVYJcouD1Aiy3edCTIG3A9tFkJ
   9w8kuT2QRHN5PpRUQsiwTfg2San+hH9cYVgDD30oc9G7RgcoKFPh86EbV
   LR8h1P4SqtAEgFTJrZ7tDQEkaAjR7euRNvH5ML8947xfGPhGBpnt+qBub
   Q==;
X-CSE-ConnectionGUID: 3100HgWuTdSgvEGlCmEoSg==
X-CSE-MsgGUID: lztr5mpMS9K451HzVIprTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73718666"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="73718666"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 00:36:28 -0800
X-CSE-ConnectionGUID: AQ+JRmlhTtOfyO3lh1JelA==
X-CSE-MsgGUID: FQVBD3RSQbCEXXHBi6dZng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="244971078"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Mar 2026 00:36:26 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxhiS-000000003U1-2xrZ;
	Wed, 04 Mar 2026 08:36:24 +0000
Date: Wed, 04 Mar 2026 16:36:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:atomisp] BUILD SUCCESS
 8ffc6ac7790a9157fd11ab8364484ad5f45963c1
Message-ID: <202603041609.T9jNd9G8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git atomisp
branch HEAD: 8ffc6ac7790a9157fd11ab8364484ad5f45963c1  staging: media: atomisp: Kill OP_std_modadd() macro

elapsed time: 1417m

configs tested: 54
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-15.2.0
alpha        allyesconfig    gcc-15.2.0
arc          allmodconfig    gcc-15.2.0
arc           allnoconfig    gcc-15.2.0
arc          allyesconfig    gcc-15.2.0
arm           allnoconfig    clang-23
arm          allyesconfig    gcc-15.2.0
arm64        allmodconfig    clang-19
arm64         allnoconfig    gcc-15.2.0
csky         allmodconfig    gcc-15.2.0
csky          allnoconfig    gcc-15.2.0
hexagon      allmodconfig    clang-17
hexagon       allnoconfig    clang-23
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-23
m68k         allmodconfig    gcc-15.2.0
m68k          allnoconfig    gcc-15.2.0
m68k         allyesconfig    gcc-15.2.0
microblaze    allnoconfig    gcc-15.2.0
microblaze   allyesconfig    gcc-15.2.0
mips         allmodconfig    gcc-15.2.0
mips          allnoconfig    gcc-15.2.0
mips         allyesconfig    gcc-15.2.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-15.2.0
openrisc      allnoconfig    gcc-15.2.0
parisc       allmodconfig    gcc-15.2.0
parisc        allnoconfig    gcc-15.2.0
parisc       allyesconfig    gcc-15.2.0
powerpc      allmodconfig    gcc-15.2.0
powerpc       allnoconfig    gcc-15.2.0
riscv        allmodconfig    clang-23
riscv         allnoconfig    gcc-15.2.0
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390          allnoconfig    clang-23
s390         allyesconfig    gcc-15.2.0
sh           allmodconfig    gcc-15.2.0
sh            allnoconfig    gcc-15.2.0
sh           allyesconfig    gcc-15.2.0
sparc         allnoconfig    gcc-15.2.0
sparc64      allmodconfig    clang-23
um           allmodconfig    clang-19
um            allnoconfig    clang-23
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-20
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64      rhel-9.4-rust    clang-20
xtensa        allnoconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
