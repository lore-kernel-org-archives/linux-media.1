Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABE147A87E
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 11:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041575; cv=none; b=fUAyjG/vTef5xZeFs1dzpQJHrWyHTL7x52Ae5Q2z9GfvEboWMHuySwpju2taROfs4qCfVSItz/UjEpmibtxS1XOY9+RnJW33ipmocVNy8qtHqDxjo2PAct0wJMQUHIWQ0a+oh991HWBp8/RePfvEqLKzGydGGFcXHXKyuUT6Nk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041575; c=relaxed/simple;
	bh=7Rl98cv+LU4A31+k1gC11LyxFISl3eA1zrLO7U7Ti6g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pnp2mLrWnLFqftDRtfDvQvrZMTc+dsQ1mRGkJW0cPbFUxDM/MbjsKH2gGbSJDRlp0VozGR2ZJz1cTIh5VMzYm7zDhzzeWqAqb86X3V+GF1jJLvA9dPWXryqfTDYwVGfUNrODqlyoPqw+JAfYDgUqlqBzIQm8cL6bV0ptz0IJGsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZHsHbCs; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZHsHbCs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789041574; x=1820577574;
  h=date:from:to:cc:subject:message-id;
  bh=7Rl98cv+LU4A31+k1gC11LyxFISl3eA1zrLO7U7Ti6g=;
  b=lZHsHbCsYGn22y/wAPj6DMv2raeyRtSoMYI6Rn8yM+6MgTofThEQr5vk
   RoJXvnGjT18tkvVmtwFRL1vFdzAiwaNRGyHTdJm0u/CGI8Er7j52MNgGX
   s5FcYGiVmysBji8L7udK5DNyELbudmUwXx6acIV0IesVBm7HC/yp4hRXU
   KsDFtvJ5Qy1itGZ2bFN+4uUEaLzLjk6+58jE76vNJPImiHpFI62k8J1An
   JKyfxGvNUd8qK5h1uCgD0CyyGLaP0oNsn2cYYECDWfuJTBAucb+ocDs/P
   PFlCQAZQGIQgElg2Ku72aSFqlHuZgDZPfy54/QsIEcrxkEf3Jiwhjt0Ha
   w==;
X-CSE-ConnectionGUID: uVOG4ozHQFa+Ofdvrpodhg==
X-CSE-MsgGUID: ulhJGF5NSEqiPq4c6cv6yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="9276"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="9276"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 04:59:33 -0700
X-CSE-ConnectionGUID: AWWtgWCHTJmXiCpiL7Z6hA==
X-CSE-MsgGUID: AIrOS5nzR0u3UC1PeTrm+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="275135632"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Sep 2026 04:59:32 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4dRC-000000001mF-0dDP;
	Thu, 10 Sep 2026 11:59:30 +0000
Date: Thu, 10 Sep 2026 19:58:35 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 df9e11101656fa6accbd85a9d6bb056aa78c3c18
Message-ID: <202609101929.pm8gSmp6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: df9e11101656fa6accbd85a9d6bb056aa78c3c18  media: cec: meson: ao-cec-g12a: Make sure clk_init_data is fully initialized

elapsed time: 1306m

configs tested: 55
configs skipped: 4

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
