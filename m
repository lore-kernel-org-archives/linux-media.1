Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFFC2512C8
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 22:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788819226; cv=none; b=jJ6P+ZglFg40M3POqnxtxX2teV2CBOb4uN7ybHJGz4iC/l26V46fY3YO/fxVjvhvbxlsNNB63TC5o5PkJEfNQxqNztcJcUtr0slwC//z6CQy/67YfDSXzKAhZZAAvmFw3k64gPGfraifKUC3B1MYZ1lPVpqQMiNDJSgT6XBVvBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788819226; c=relaxed/simple;
	bh=ckwehfilNW+NXgbXDP+j4EsBNSB/3N4kodo+46/yEes=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D9UZdKEgLqr84NZQHl73V7zZ8bR86zsyGX5SY1u1jTcPeX/Z/xSSZqacoTh/B8RFxRMW+P16zw/iC77aZEBeBdxTAjCtN2lgPnN6SixwredKMV74m3vGtzOu55MdHCy6ceOW/AaV40EIEOid2NHVqP/BFREyLZ7w6GPXjv9khs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vh6WshIp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vh6WshIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788819223; x=1820355223;
  h=date:from:to:cc:subject:message-id;
  bh=ckwehfilNW+NXgbXDP+j4EsBNSB/3N4kodo+46/yEes=;
  b=Vh6WshIpqPhAcI4/dDEycX7cmc25nv57CPQt0T/QeDhT0O/pTU59kGLi
   xR/nkMQG1v8k9PfxuNWB9ymhZwcXuAjnJJP8XuI4utTauyIpwM1DDKed5
   49u/gSGtbEadc+5Q3bzUvtmbWWG/20c5yD03mN1oWHtOetYZ6Md3AGo+9
   Qt6s/lvatYzpoMnJwuIm+eGwEzVJqy2T0v/qVIjzrgrRHKsQHQhsdA7Z9
   gR0c98WdDydF2BE/4r/T0MfmovTgXh7bOdNsyh40jfwGKsLqQi3XOf7Wp
   l/Qf2OTM/J1uYosU4me8MvUc0QQ7/gglQISj+DcFQRlL8tbUoL4D6+c+m
   A==;
X-CSE-ConnectionGUID: RRQBQDorSWyqjigI4OEtnw==
X-CSE-MsgGUID: kLoFTzHASOGdsoDj4YJNtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99552120"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="99552120"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 15:13:43 -0700
X-CSE-ConnectionGUID: 3GqLEdexQQKwOsKCgO6dLg==
X-CSE-MsgGUID: wifg7f2QR4mEHy3JKM9dBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="274324209"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Sep 2026 15:13:42 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3hat-000000001ND-3uxt;
	Mon, 07 Sep 2026 22:13:39 +0000
Date: Tue, 08 Sep 2026 06:13:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:master] BUILD SUCCESS
 ce92674d8d8b29562de397b437e16bee499dd92b
Message-ID: <202609080608.ddNZAmBQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git master
branch HEAD: ce92674d8d8b29562de397b437e16bee499dd92b  media: ipu-bridge: do not use the CVS device lookup for IVSC

elapsed time: 6320m

configs tested: 53
configs skipped: 2

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
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv        allyesconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh           allyesconfig    gcc-16.1.0
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
