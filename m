Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDC519AD90
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 01:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787707135; cv=none; b=A0bVI6BrSo2A4kO2hWmHtsqUrtL9DCF3IBclfyLGfM8fobDiPKedJYymb++oA8rPd4+Vhg0QNUwvErWIREJtgCSveDI1FMZ1HGwHQls6E3iHOkDen1p6/7ENrXf0QVEEjcgAgUHe2/eUVgG3B3DPT8OwHUdHeEILrI2wYyfEkOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787707135; c=relaxed/simple;
	bh=gLkIlyDiy+ZkpvMiUkk9yotgDi4f/YzkbPF2nqVYo+Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hb2aonw5E/947548Pel/SPqlA06qkVFbjB3eFLLDV/vs0USI5ghPQmID5eNZOkNgzNBKmyeAtiAQuYEcptq7PH+i6aQIGzeA8ju5exKxqoLvk+zyuDYPcEpI0xdznahlZJocXuZYlFB7eC9cehhhjyFZBqdm+GYeloCEotVwYdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iiqDsOtz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iiqDsOtz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787707134; x=1819243134;
  h=date:from:to:cc:subject:message-id;
  bh=gLkIlyDiy+ZkpvMiUkk9yotgDi4f/YzkbPF2nqVYo+Q=;
  b=iiqDsOtzS6iSYttYoGjVSAAycGN9RP1eUNeGf/N3HpwXFbPY/chzAmm9
   a9c38cTW9MhocbBv8C6VdX0Y88JbuWErK8IlpM553QfdzYuVUV09g0MIK
   l12Zw6LW1sGvT0Q0dZiwlfM4KFMRYqjV4HaocxpOoNni3rBeib7fs/15G
   a7DETxSsnr4kdxXCSVIkYTGLWnaiQPKXCrrxKZJQOeNDuckgHBFszG6Vz
   v80aJyIh9ciPpTTvmzP/3jGaJVm9Jj0Ln0ywkyDhto5N/UvPBNSQX1dSG
   WKAtOOhEHwmQbWG2md2fOKTaFV2QncFTWXRKItr78YG7Q3fP3CubJ6kI9
   A==;
X-CSE-ConnectionGUID: 0YjZSnlQT+aF+ibDWTOzhw==
X-CSE-MsgGUID: QuZVJL0tSXyxb+p1LCmJIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="90695212"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="90695212"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 18:18:53 -0700
X-CSE-ConnectionGUID: qsOtZ6wtTvqzqorhsLzoIw==
X-CSE-MsgGUID: WwnYSdjbS1iGEA0FXc1rLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="264829156"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Aug 2026 18:18:52 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wz2Hx-000000006j7-2KTA;
	Wed, 26 Aug 2026 01:18:49 +0000
Date: Wed, 26 Aug 2026 09:18:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:frame-desc] BUILD SUCCESS
 a6b8f5ff11e99a995999a413048dff8914630d52
Message-ID: <202608260908.hh5JiJkW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git frame-desc
branch HEAD: a6b8f5ff11e99a995999a413048dff8914630d52  media: j721e-csi2rx: Use v4l2_subdev_get_frame_desc()

elapsed time: 808m

configs tested: 17
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha          allnoconfig    gcc-16.1.0
alpha         allyesconfig    gcc-16.1.0
alpha            defconfig    gcc-16.1.0
arc           allmodconfig    gcc-16.1.0
arc           allyesconfig    gcc-16.1.0
csky          allmodconfig    gcc-16.1.0
i386          allmodconfig    gcc-14
loongarch        defconfig    clang-24
mips       eyeq6_defconfig    clang-24
nios2         allmodconfig    gcc-11.5.0
nios2          allnoconfig    gcc-11.5.0
parisc        allmodconfig    gcc-16.1.0
parisc        allyesconfig    gcc-16.1.0
parisc           defconfig    gcc-16.1.0
sh               defconfig    gcc-16.1.0
x86_64               kexec    clang-22
x86_64        rhel-9.4-bpf    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
