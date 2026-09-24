Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3924AA006
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 17:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790272716; cv=none; b=SVFyrnB4YvWGOMz9ukWxA6YAAOy0qT4q4eub9wjiSTN0C00rFO2Z2uY2JfWSOhrOnUwUVRxJfb7lXS61LMfuEs60V3fu7MZHuH9lGO1NUxTcrWkIUk+1WxcL1Iwk1Jqd8bF3W9Q6Qi1OtT+OojHAQXDcJZyHQyuEtIowy3bY2Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790272716; c=relaxed/simple;
	bh=QPyeon6Q78N18Gjs8llq/JPRyhxb3P48y47Ix8VcKaM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VhYco9IKpQodRuQ/Euk4/VD76C13oCrD/BdjxLD3o0/dRdfsiyOG9/C1SdDQevStdfSM0qTzxvJPVMzAn6uj1lgqrHOXAEKT9NBhCY59Ie7Anu/EjpHjGrDwmTau7t9vOFq0Bg38ed520ZM6klgSr1hGUWTjV1RxYDk01tAID/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBfSlMXo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBfSlMXo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790272714; x=1821808714;
  h=date:from:to:cc:subject:message-id;
  bh=QPyeon6Q78N18Gjs8llq/JPRyhxb3P48y47Ix8VcKaM=;
  b=JBfSlMXooiR3c3KUWhTPCemdnLFCpKrcKBtP3DykFbvkrP2zNLnxD65s
   COfzmYz0jjLL0yxI9VWvKSfMMEZF0JkoCTvS1W1mKUpkI4PNGuErFOG6I
   QuW4Eh/c6ChgOS7az54AP/UChO9TQ5l34ja4okYt5nvQTzjfcOqtS/TkC
   XfODR0rSNQNKp0YJy6hzd6r6lGeDWGdXml+Fogwm8lPyoPEq9/Jdfih2Z
   cTyx0ur3TMftrdgZBlIb+65U4ORHulkL4zYZegke17KoYTMa08tKiXqvQ
   oyLnN3HbIWoECURq56ZYsT8F+c22d4J0h5Cd8QzXIYs2pL59NLjZFELiq
   g==;
X-CSE-ConnectionGUID: ORwKpRxBQCC2wOEFkp8LKg==
X-CSE-MsgGUID: vQ0m/i43Q9mxdoKMgag9vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93945054"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="93945054"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 10:58:34 -0700
X-CSE-ConnectionGUID: gD4zuiAwTaymWqttoBw+8A==
X-CSE-MsgGUID: h+3cu468RJK6RBAkV6GZ3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="282182490"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Sep 2026 10:58:32 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9niH-00000000JIU-1pin;
	Thu, 24 Sep 2026 17:58:29 +0000
Date: Fri, 25 Sep 2026 01:57:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:next] BUILD SUCCESS
 aedd77ea8168f00687c1248cdf115071e869cf93
Message-ID: <202609250127.jJPtWNE2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git next
branch HEAD: aedd77ea8168f00687c1248cdf115071e869cf93  media: qcom: camss: use fwnode_graph_for_each_endpoint_scoped() to simplify code

elapsed time: 4315m

configs tested: 416
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r1302-20260922    clang-20   sparse
alpha                randconfig-r1303-20260922    clang-20   sparse
alpha                randconfig-r1304-20260924    gcc-16.1.0 sparse
alpha                randconfig-r2101-20260918    clang-22   cocci
alpha                randconfig-r2101-20260923    gcc-10.5.0 cocci
alpha                randconfig-r2201-20260923    gcc-8.5.0  smatch
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                      haps_hs_smp_defconfig    gcc-16.1.0
arc                         nsimosci_defconfig    gcc-16.1.0
arc                   randconfig-1000-20260924    clang-24
arc                   randconfig-1001-20260924    clang-24
arc                  randconfig-r2104-20260918    gcc-14.3.0 cocci
arc                  randconfig-r2107-20260918    clang-24   cocci
arc                         vdk_hs38_defconfig    gcc-16.1.0
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                           ep93xx_defconfig    clang-24
arm                         multi_v7_defconfig    clang-24
arm                   randconfig-1000-20260924    clang-24
arm                   randconfig-1001-20260924    clang-24
arm                   randconfig-1002-20260924    clang-24
arm                   randconfig-1003-20260924    clang-24
arm                  randconfig-r1300-20260923    gcc-8.5.0  sparse
arm                  randconfig-r1305-20260924    gcc-16.1.0 sparse
arm                  randconfig-r2102-20260923    clang-24   cocci
arm                  randconfig-r2202-20260918    clang-17   smatch
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260922    gcc-9.5.0
arm64                 randconfig-1000-20260924    gcc-11.5.0
arm64                 randconfig-1001-20260922    gcc-9.5.0
arm64                 randconfig-1001-20260924    gcc-11.5.0
arm64                 randconfig-1002-20260922    gcc-9.5.0
arm64                 randconfig-1002-20260924    gcc-11.5.0
arm64                 randconfig-1003-20260922    gcc-9.5.0
arm64                 randconfig-1003-20260924    gcc-11.5.0
arm64                randconfig-r1302-20260924    gcc-16.1.0 sparse
arm64                randconfig-r1303-20260923    gcc-8.5.0  sparse
arm64                randconfig-r1306-20260922    gcc-16.1.0 sparse
arm64                randconfig-r1307-20260924    gcc-11.5.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260922    gcc-9.5.0
csky                  randconfig-1000-20260924    gcc-11.5.0
csky                  randconfig-1001-20260922    gcc-9.5.0
csky                  randconfig-1001-20260924    gcc-11.5.0
csky                 randconfig-r1300-20260924    gcc-16.1.0 sparse
csky                 randconfig-r1302-20260923    gcc-8.5.0  sparse
csky                 randconfig-r1308-20260922    gcc-16.1.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260922    gcc-10.5.0
hexagon               randconfig-1000-20260924    gcc-8.5.0
hexagon               randconfig-1001-20260922    gcc-10.5.0
hexagon               randconfig-1001-20260924    gcc-8.5.0
hexagon              randconfig-r1301-20260924    gcc-16.1.0 sparse
i386                               allnoconfig    gcc-16.1.0
i386        buildonly-randconfig-1000-20260922    gcc-14
i386        buildonly-randconfig-1000-20260924    gcc-14
i386        buildonly-randconfig-1001-20260922    gcc-14
i386        buildonly-randconfig-1001-20260924    gcc-14
i386        buildonly-randconfig-1002-20260922    gcc-14
i386        buildonly-randconfig-1002-20260924    gcc-14
i386        buildonly-randconfig-1003-20260922    gcc-14
i386        buildonly-randconfig-1003-20260924    gcc-14
i386        buildonly-randconfig-1004-20260922    gcc-14
i386        buildonly-randconfig-1004-20260924    gcc-14
i386        buildonly-randconfig-1005-20260922    gcc-14
i386        buildonly-randconfig-1005-20260924    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260922    clang-22
i386                  randconfig-1000-20260924    gcc-12
i386                  randconfig-1001-20260922    clang-22
i386                  randconfig-1001-20260924    gcc-12
i386                  randconfig-1002-20260922    clang-22
i386                  randconfig-1002-20260924    gcc-12
i386                  randconfig-1003-20260922    clang-22
i386                  randconfig-1003-20260924    gcc-12
i386                  randconfig-1004-20260922    clang-22
i386                  randconfig-1004-20260924    gcc-12
i386                  randconfig-1005-20260922    clang-22
i386                  randconfig-1005-20260924    gcc-12
i386                  randconfig-1006-20260922    clang-22
i386                  randconfig-1006-20260924    gcc-12
i386                  randconfig-1007-20260922    gcc-14
i386                  randconfig-1007-20260924    clang-22
i386                  randconfig-1008-20260922    gcc-14
i386                  randconfig-1008-20260924    clang-22
i386                  randconfig-1009-20260922    gcc-14
i386                  randconfig-1009-20260924    clang-22
i386                  randconfig-1010-20260922    gcc-14
i386                  randconfig-1010-20260924    clang-22
i386                  randconfig-1011-20260922    gcc-14
i386                  randconfig-1011-20260924    clang-22
i386                  randconfig-1012-20260922    gcc-14
i386                  randconfig-1012-20260924    clang-22
i386                  randconfig-1013-20260922    gcc-14
i386                  randconfig-1013-20260924    clang-22
i386                  randconfig-1300-20260922    gcc-14     sparse
i386                  randconfig-1300-20260924    clang-22   sparse
i386                  randconfig-1301-20260922    gcc-14     sparse
i386                  randconfig-1301-20260924    clang-22   sparse
i386                  randconfig-1302-20260922    gcc-14     sparse
i386                  randconfig-1302-20260924    clang-22   sparse
i386                  randconfig-2100-20260918    clang-22   cocci
i386                  randconfig-2100-20260923    clang-22   cocci
i386                  randconfig-2101-20260918    clang-22   cocci
i386                  randconfig-2101-20260918    gcc-14     cocci
i386                  randconfig-2101-20260923    clang-22   cocci
i386                  randconfig-2102-20260918    clang-22   cocci
i386                  randconfig-2102-20260923    clang-22   cocci
i386                  randconfig-2103-20260918    clang-22   cocci
i386                  randconfig-2103-20260923    clang-22   cocci
i386                  randconfig-2200-20260918    clang-22   smatch
i386                  randconfig-2200-20260923    gcc-12     smatch
i386                 randconfig-r2100-20260923    gcc-14     cocci
i386                 randconfig-r2200-20260918    clang-22   smatch
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260922    gcc-10.5.0
loongarch             randconfig-1000-20260924    gcc-8.5.0
loongarch             randconfig-1001-20260922    gcc-10.5.0
loongarch             randconfig-1001-20260924    gcc-8.5.0
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                          amcore_defconfig    gcc-16.1.0
m68k                           amiga_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.1.0
m68k                         m5307c3_defconfig    gcc-16.1.0
m68k                             mac_defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                         bcm47xx_defconfig    gcc-16.1.0
mips                        bmips_be_defconfig    gcc-16.1.0
mips                 randconfig-r1301-20260922    clang-20   sparse
mips                 randconfig-r1309-20260924    gcc-11.5.0 sparse
mips                 randconfig-r2102-20260918    gcc-10.5.0 cocci
mips                 randconfig-r2202-20260918    gcc-15.2.0 smatch
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260922    gcc-10.5.0
nios2                 randconfig-1000-20260924    gcc-8.5.0
nios2                 randconfig-1001-20260922    gcc-10.5.0
nios2                 randconfig-1001-20260924    gcc-8.5.0
nios2                randconfig-r1303-20260924    gcc-16.1.0 sparse
nios2                randconfig-r1305-20260923    gcc-8.5.0  sparse
nios2                randconfig-r1306-20260924    gcc-11.5.0 sparse
nios2                randconfig-r2107-20260918    gcc-10.5.0 cocci
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc                   or1klitex_defconfig    gcc-16.1.0
openrisc             randconfig-r2201-20260918    gcc-16.1.0 smatch
parisc                            alldefconfig    clang-24
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260922    gcc-8.5.0
parisc                randconfig-1000-20260924    gcc-8.5.0
parisc                randconfig-1001-20260922    gcc-8.5.0
parisc                randconfig-1001-20260924    gcc-8.5.0
parisc               randconfig-r1306-20260924    gcc-14     sparse
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    clang-24
powerpc                     adder875_defconfig    gcc-16.1.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                  canyonlands_defconfig    gcc-16.1.0
powerpc                       mgcoge_defconfig    gcc-16.1.0
powerpc                  mpc8313_rdb_defconfig    gcc-16.1.0
powerpc                      ppa8548_defconfig    clang-24
powerpc               randconfig-1000-20260922    gcc-8.5.0
powerpc               randconfig-1000-20260924    gcc-8.5.0
powerpc               randconfig-1001-20260922    gcc-8.5.0
powerpc               randconfig-1001-20260924    gcc-8.5.0
powerpc              randconfig-r1304-20260923    gcc-8.5.0  sparse
powerpc              randconfig-r2105-20260918    clang-24   cocci
powerpc64             randconfig-1000-20260922    gcc-8.5.0
powerpc64             randconfig-1000-20260924    gcc-8.5.0
powerpc64             randconfig-1001-20260922    gcc-8.5.0
powerpc64             randconfig-1001-20260924    gcc-8.5.0
powerpc64            randconfig-r1300-20260922    clang-20   sparse
powerpc64            randconfig-r1309-20260924    gcc-14     sparse
powerpc64            randconfig-r2103-20260923    gcc-14     cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260922    gcc-13.4.0
riscv                 randconfig-1000-20260924    gcc-15.2.0
riscv                 randconfig-1001-20260922    gcc-13.4.0
riscv                 randconfig-1001-20260924    gcc-15.2.0
riscv                 randconfig-2000-20260918    gcc-13.4.0
riscv                 randconfig-2000-20260923    gcc-9.5.0
riscv                 randconfig-2001-20260918    gcc-13.4.0
riscv                 randconfig-2001-20260923    gcc-8.5.0
riscv                 randconfig-2001-20260923    gcc-9.5.0
riscv                randconfig-r1305-20260922    clang-20   sparse
riscv                randconfig-r2100-20260923    gcc-8.5.0  cocci
riscv                randconfig-r2102-20260918    clang-22   cocci
riscv                randconfig-r2105-20260918    clang-19   cocci
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260922    gcc-13.4.0
s390                  randconfig-1000-20260924    gcc-15.2.0
s390                  randconfig-1001-20260922    gcc-13.4.0
s390                  randconfig-1001-20260924    gcc-15.2.0
s390                  randconfig-2000-20260918    gcc-13.4.0
s390                  randconfig-2000-20260923    clang-17
s390                  randconfig-2000-20260923    gcc-9.5.0
s390                  randconfig-2001-20260918    gcc-13.4.0
s390                  randconfig-2001-20260923    clang-24
s390                  randconfig-2001-20260923    gcc-9.5.0
s390                 randconfig-r1301-20260923    gcc-8.5.0  sparse
s390                 randconfig-r1308-20260924    gcc-11.5.0 sparse
s390                 randconfig-r2106-20260918    clang-17   cocci
sh                                alldefconfig    gcc-16.1.0
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                      magicpanelr2_defconfig    clang-24
sh                    randconfig-1000-20260922    gcc-13.4.0
sh                    randconfig-1000-20260924    gcc-15.2.0
sh                    randconfig-1001-20260922    gcc-13.4.0
sh                    randconfig-1001-20260924    gcc-15.2.0
sh                    randconfig-2000-20260918    gcc-13.4.0
sh                    randconfig-2000-20260923    gcc-12.5.0
sh                    randconfig-2000-20260923    gcc-9.5.0
sh                    randconfig-2001-20260918    gcc-13.4.0
sh                    randconfig-2001-20260923    gcc-14.3.0
sh                    randconfig-2001-20260923    gcc-9.5.0
sh                   randconfig-r1307-20260922    gcc-16.1.0 sparse
sh                   randconfig-r2100-20260918    gcc-13.4.0 cocci
sh                   randconfig-r2101-20260918    gcc-16.1.0 cocci
sh                   randconfig-r2101-20260923    gcc-14     cocci
sh                   randconfig-r2200-20260918    gcc-16.1.0 smatch
sh                    rts7751r2dplus_defconfig    clang-24
sh                           sdk7780_defconfig    gcc-16.1.0
sh                    sh7724_generic_defconfig    gcc-16.1.0
sh                   sh7785lcr_32bit_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260922    gcc-14
sparc                 randconfig-1000-20260924    clang-17
sparc                 randconfig-1001-20260922    gcc-14
sparc                 randconfig-1001-20260924    clang-17
sparc                 randconfig-2000-20260918    gcc-14
sparc                 randconfig-2000-20260918    gcc-8.5.0
sparc                 randconfig-2000-20260923    gcc-14.3.0
sparc                 randconfig-2001-20260918    gcc-11.5.0
sparc                 randconfig-2001-20260918    gcc-14
sparc                 randconfig-2001-20260923    gcc-14.3.0
sparc                randconfig-r1308-20260924    gcc-14     sparse
sparc                randconfig-r2104-20260918    clang-24   cocci
sparc                randconfig-r2106-20260918    clang-24   cocci
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260922    gcc-14
sparc64               randconfig-1000-20260924    clang-17
sparc64               randconfig-1001-20260922    gcc-14
sparc64               randconfig-1001-20260924    clang-17
sparc64               randconfig-2000-20260918    gcc-14
sparc64               randconfig-2000-20260918    gcc-8.5.0
sparc64               randconfig-2000-20260923    gcc-14.3.0
sparc64               randconfig-2001-20260918    clang-20
sparc64               randconfig-2001-20260918    gcc-14
sparc64               randconfig-2001-20260923    gcc-14.3.0
sparc64              randconfig-r1304-20260922    clang-20   sparse
sparc64              randconfig-r2103-20260918    clang-22   cocci
sparc64              randconfig-r2103-20260918    gcc-8.5.0  cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260922    gcc-14
um                    randconfig-1000-20260924    clang-17
um                    randconfig-1001-20260922    gcc-14
um                    randconfig-1001-20260924    clang-17
um                    randconfig-2000-20260918    gcc-14
um                    randconfig-2000-20260923    gcc-14.3.0
um                    randconfig-2001-20260918    gcc-14
um                    randconfig-2001-20260923    gcc-14.3.0
um                   randconfig-r1307-20260924    gcc-14     sparse
um                   randconfig-r2103-20260923    gcc-12     cocci
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20260922    gcc-14
x86_64      buildonly-randconfig-1000-20260923    gcc-14
x86_64      buildonly-randconfig-1000-20260924    clang-22
x86_64      buildonly-randconfig-1001-20260922    gcc-14
x86_64      buildonly-randconfig-1001-20260923    gcc-14
x86_64      buildonly-randconfig-1001-20260924    clang-22
x86_64      buildonly-randconfig-1002-20260922    gcc-14
x86_64      buildonly-randconfig-1002-20260923    gcc-14
x86_64      buildonly-randconfig-1002-20260924    clang-22
x86_64      buildonly-randconfig-1003-20260922    gcc-14
x86_64      buildonly-randconfig-1003-20260923    gcc-14
x86_64      buildonly-randconfig-1003-20260924    clang-22
x86_64      buildonly-randconfig-1004-20260922    gcc-14
x86_64      buildonly-randconfig-1004-20260923    gcc-14
x86_64      buildonly-randconfig-1004-20260924    clang-22
x86_64      buildonly-randconfig-1005-20260922    gcc-14
x86_64      buildonly-randconfig-1005-20260923    gcc-14
x86_64      buildonly-randconfig-1005-20260924    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260922    clang-22
x86_64                randconfig-1000-20260924    clang-22
x86_64                randconfig-1001-20260922    clang-22
x86_64                randconfig-1001-20260924    clang-22
x86_64                randconfig-1002-20260922    clang-22
x86_64                randconfig-1002-20260924    clang-22
x86_64                randconfig-1003-20260922    clang-22
x86_64                randconfig-1003-20260924    clang-22
x86_64                randconfig-1004-20260922    clang-22
x86_64                randconfig-1004-20260924    clang-22
x86_64                randconfig-1005-20260922    clang-22
x86_64                randconfig-1005-20260924    clang-22
x86_64                randconfig-1006-20260922    clang-22
x86_64                randconfig-1006-20260924    clang-22
x86_64                randconfig-1007-20260922    clang-22
x86_64                randconfig-1007-20260924    clang-22
x86_64                randconfig-1008-20260922    clang-22
x86_64                randconfig-1008-20260924    clang-22
x86_64                randconfig-1009-20260922    clang-22
x86_64                randconfig-1009-20260924    clang-22
x86_64                randconfig-1010-20260922    clang-22
x86_64                randconfig-1010-20260924    clang-22
x86_64                randconfig-1011-20260922    clang-22
x86_64                randconfig-1011-20260924    clang-22
x86_64                randconfig-1012-20260922    clang-22
x86_64                randconfig-1012-20260923    gcc-14
x86_64                randconfig-1012-20260924    clang-22
x86_64                randconfig-1013-20260922    clang-22
x86_64                randconfig-1013-20260923    gcc-14
x86_64                randconfig-1013-20260924    clang-22
x86_64                randconfig-1014-20260922    clang-22
x86_64                randconfig-1014-20260923    gcc-14
x86_64                randconfig-1014-20260924    clang-22
x86_64                randconfig-1015-20260922    clang-22
x86_64                randconfig-1015-20260923    gcc-14
x86_64                randconfig-1015-20260924    clang-22
x86_64                randconfig-1016-20260922    clang-22
x86_64                randconfig-1016-20260923    gcc-14
x86_64                randconfig-1016-20260924    clang-22
x86_64                randconfig-1017-20260922    clang-22
x86_64                randconfig-1017-20260923    gcc-14
x86_64                randconfig-1017-20260924    clang-22
x86_64                randconfig-1300-20260922    gcc-14     sparse
x86_64                randconfig-1300-20260924    clang-22   sparse
x86_64                randconfig-1301-20260922    gcc-14     sparse
x86_64                randconfig-1301-20260924    clang-22   sparse
x86_64                randconfig-1302-20260922    gcc-14     sparse
x86_64                randconfig-1302-20260924    clang-22   sparse
x86_64                randconfig-2100-20260918    clang-22   cocci
x86_64                randconfig-2100-20260923    clang-22   cocci
x86_64                randconfig-2101-20260918    clang-22   cocci
x86_64                randconfig-2101-20260923    clang-22   cocci
x86_64                randconfig-2102-20260918    clang-22   cocci
x86_64                randconfig-2102-20260923    clang-22   cocci
x86_64                randconfig-2103-20260918    clang-22   cocci
x86_64                randconfig-2103-20260923    clang-22   cocci
x86_64                randconfig-2200-20260918    gcc-14     smatch
x86_64                randconfig-2200-20260923    gcc-14     smatch
x86_64               randconfig-r2100-20260918    clang-22   cocci
x86_64               randconfig-r2102-20260923    gcc-14     cocci
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                            alldefconfig    gcc-16.1.0
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20260922    gcc-14
xtensa                randconfig-1000-20260924    clang-17
xtensa                randconfig-1001-20260922    gcc-14
xtensa                randconfig-1001-20260924    clang-17
xtensa                randconfig-2000-20260918    gcc-14
xtensa                randconfig-2000-20260918    gcc-8.5.0
xtensa                randconfig-2000-20260923    gcc-14.3.0
xtensa                randconfig-2001-20260918    gcc-13.4.0
xtensa                randconfig-2001-20260918    gcc-14
xtensa                randconfig-2001-20260923    gcc-14.3.0
xtensa               randconfig-r2202-20260923    gcc-10.5.0 smatch

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
