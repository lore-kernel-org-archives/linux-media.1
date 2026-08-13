Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D46627FD49
	for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 01:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786584361; cv=none; b=CA8lgJYlWXJByJEXa/pEEgByd1S/IMDy22JtKTRm+/DnTdAfFUnzne7J0+l7BgZiuz5TmIbo9/bVbWxfycbdbWCCAGfw9+SPY6ZUXqKQx4LyQ7QeNmAAcKmoP7O2LakehruQkWBPMXxUUUT64aV44N66aNEfNQwAKO7zaLXoXKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786584361; c=relaxed/simple;
	bh=TYMvOu/aeVGptbRlQ/rLA+hAbYnMXRgTAcbPIGHSDCQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pC6MX14WUolHcDcKijap2BXrJk62hOiSFdiNckxQVrXXEkDYPNMGV39tQGhkVejb1jmbx91HLZSq4gOGqALYFsKIYEkm0DoEKQIDlWvMb1zFP0K5P0Fihu5NNVFLFj3rAUJ23NVX5QleUmM8HCw7YJ4aHs2drEHunYh0vSyJjOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dc1k9Q2o; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dc1k9Q2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786584359; x=1818120359;
  h=date:from:to:cc:subject:message-id;
  bh=TYMvOu/aeVGptbRlQ/rLA+hAbYnMXRgTAcbPIGHSDCQ=;
  b=Dc1k9Q2oHWt0rmuhkDn6EO8F6yYFsc9QPz/tXglu1aiKG1AucGUQtnCz
   njmu0KVH5xtiT5oEM/ban4LHLECV2YJl8/vQ8fjgN7cvZphaOoW4UVgfW
   MWrT3MH5cdb2eiI9l4n+WfnG3ZKAaYOfvNKTS/lpnoGGkSU/NXDZipH0C
   hS+g3o3xR/4tZVqaXWNbEUFFOZsa2627iGo8fL+MDCdoxmI/Y/Rm4UnAy
   YH12sWrAvztDEUiq04rJz+qFhID3Bk6nxCRNZwfI8IOYravcY+Wt2woir
   RgRZXigFQrEC/RkgrGhVd+XuCQCdaHOrcUg4RG+QQPiL9M6lRDaE6J2+y
   w==;
X-CSE-ConnectionGUID: c4Y8bW2rQ3OV5CDdkLlIFQ==
X-CSE-MsgGUID: 98+nTSG+RvufBgG2SRfNTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="90832524"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="90832524"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 18:25:59 -0700
X-CSE-ConnectionGUID: h53JLWtVT5654D31nO7WMQ==
X-CSE-MsgGUID: 2v24bFptQseHv64u4EPd9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="264380969"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Aug 2026 18:25:58 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuKCh-00000000SNO-2dn0;
	Thu, 13 Aug 2026 01:25:55 +0000
Date: Thu, 13 Aug 2026 09:25:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre] BUILD SUCCESS
 4807a7231d774ea2d38b0b9aea67f73ee45f951f
Message-ID: <202608130959.iQhKbYxe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git metadata-pre
branch HEAD: 4807a7231d774ea2d38b0b9aea67f73ee45f951f  media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops

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
arc                    nsimosci_hs_defconfig    gcc-16.1.0
arc                           randconfig-001    gcc-12.5.0
arc                           randconfig-001    gcc-13.4.0
arc                  randconfig-001-20260812    gcc-12.5.0
arc                  randconfig-001-20260813    gcc-13.4.0
arc                  randconfig-002-20260812    gcc-12.5.0
arc                  randconfig-002-20260813    gcc-13.4.0
arm                    am200epdkit_defconfig    gcc-16.1.0
arm                       keystone_defconfig    gcc-16.1.0
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
