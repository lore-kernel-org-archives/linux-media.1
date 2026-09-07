Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F42041A926
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 07:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767728; cv=none; b=B/ZQyWIhBqnbpTK7s+bNvgImEMTf2UOLNrwMN/Z2YaGiQImoLbJOjxjZWt+K2r06r+S5TrjfSXQ09v/qauxPX2VPTOrK6eFk5eQ5XFiQsUg6m35FXvF8Vjg4/sjKJ6wahsbLXzed2Hicsc94Voj86DdjRru0KmxPy0wl3mNXadQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767728; c=relaxed/simple;
	bh=CSqW7OYGCvrjBmigcPdElo+8RyqAKnS0E38v46iR45o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S8ThuRFemChf4bbVUItgPG+L8HJPku75tSJaKtVmc8SOIVLyNhpLJTIaOSOrF0kO452CJHmuJtsqkzrXKC1QsEtMZEZfZb72LX4ue63Ovavt+kc2y+yPLMYEouYaeCdU1heIG/GwHHghBZAUKrboER2Nyef0lqIEQ2p3vDtWMa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pde7KcWj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pde7KcWj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788767726; x=1820303726;
  h=date:from:to:cc:subject:message-id;
  bh=CSqW7OYGCvrjBmigcPdElo+8RyqAKnS0E38v46iR45o=;
  b=Pde7KcWjKJvVoCnuYaV0xCO4XaYnSaBbq5LZXSusOJKXUHQv2J01GmfG
   FKM3RLGGM/+gvk9eM8EoPpCfFoS0I3cxId8oMIwmo/G0O7xZ3llU677Tp
   J38hyzBWPX/NTC/XhR4yFGVN9rHWTJs/qWbWRwZx60overUw8F/S/IMUX
   i6g8BI4oTFj44K77ZA6CT5FPdXyEP0qfXoKO3UiVYOYEe13vaGDhVNTy4
   oMA8IM1jacwt0ASpZKgyTnOHsmqU2HJEfHEd7qNQ2j1TXEvefkNBwTnyP
   YWOPdNlVPKaerwwCu8On1se58lEhQtW9gLqMvAL+z+WFhzHmWjIQml2Kk
   Q==;
X-CSE-ConnectionGUID: MGOZiNWMRKGm2FCq/zy9Sw==
X-CSE-MsgGUID: z4n8gsiXQTGIiWZpWUraLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="99825564"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="99825564"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 00:55:25 -0700
X-CSE-ConnectionGUID: FeRmRTjRSxehkB7ZdkimJg==
X-CSE-MsgGUID: mudbXluGQKaLysgxoyATxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="266289602"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Sep 2026 00:55:24 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3UCH-000000000HY-2gjW;
	Mon, 07 Sep 2026 07:55:21 +0000
Date: Mon, 07 Sep 2026 14:42:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6] BUILD SUCCESS
 6f6d9729301fbf8fadff3c1822cdd730ef6cd213
Message-ID: <202609071453.Wr61Aa3p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git ipu6
branch HEAD: 6f6d9729301fbf8fadff3c1822cdd730ef6cd213  media: ipu6: Enable support for IPU 7 and IPU 7.5

elapsed time: 4351m

configs tested: 43
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    gcc-16.1.0
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
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2         allnoconfig    clang-24
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
parisc        allnoconfig    clang-24
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
s390          allnoconfig    clang-24
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sparc         allnoconfig    clang-24
sparc64      allmodconfig    clang-20
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
