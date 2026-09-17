Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51419331203
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 06:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628160; cv=none; b=Bshc9wpsERK6bKebJ/Nei3O5uqe5aD5TB8UGEH09MHNc+v5GX8MG5Hf7pj2R5JbPvF7o9BAkHNiAOLJsp86MYiGPY6wUuCQCjEc04yYiVc2i+QKof/FTrN7ccyT4kPYh1eW/4lsLymaj66kv7Y/nnqz64gGYXyOQw7Qumyvn6mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628160; c=relaxed/simple;
	bh=Smr8rNUX01ghF2gMkLSIe6LZyu7EAowuNAFHPfN8rgY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cQ41FBPtfTN4KslAaUezlCJiAnygyudP62QRquwZc9WGt+RSl1kK9AhX/0dTbGEZdGcTEUxt9vs50f4xVgL4Qlw1rPdD12I/pxbKGsTxVFv7JteSr0vLAwnYHkhrTmLXYjpp8yPNDlHtxwDsaD8+uBsHc1QesnUXetEtinEpxow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V4mSNjqK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V4mSNjqK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789628158; x=1821164158;
  h=date:from:to:cc:subject:message-id;
  bh=Smr8rNUX01ghF2gMkLSIe6LZyu7EAowuNAFHPfN8rgY=;
  b=V4mSNjqKj8G4rKhLXZN3SBfBOn4DT7i2V7e5mOmcg8fUUV5XyNcQpdNT
   zZ7GnRqvfqFA7wjuQrrI6P/20ualgCMEPNxFhQMp3RadtiOxTntZHtEcm
   qmaKdQp1ZDyJv1NTOiT7FjXXMGZZa5V76yJeEZvad2WKnOdAgKydhkmAg
   vqw6n1tG6J6Cop+h17C1YluVSwMZUgYUWHdckMe/NcjPhDkwfobwTIpEf
   NFOpfLuplP7Mq7B5yjwkeiEf2WFxBZpWOycR1XwODCgRQSIsAhMa9yMhA
   J7Ica2SdzmKZHWLgBS44fqDR1/lwpWlMxzSeL2OOhHwQOdclNwXj4o5yo
   w==;
X-CSE-ConnectionGUID: azid5rAbRXGbJhSSLV46vg==
X-CSE-MsgGUID: 6oYZX19SSSuENkla1iUROA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92530268"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92530268"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 23:55:57 -0700
X-CSE-ConnectionGUID: UnNrRS/GRdmeVEf5ManwGA==
X-CSE-MsgGUID: 4YQ1umSOR5CqQDw4fiqd+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1825848"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 16 Sep 2026 23:55:56 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x762D-000000007Dd-2XrS;
	Thu, 17 Sep 2026 06:55:53 +0000
Date: Thu, 17 Sep 2026 14:55:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6] BUILD SUCCESS
 0fe315d3e693253f3579d6a5e89f96df9b7631e3
Message-ID: <202609171441.YBfgmPbP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git ipu6
branch HEAD: 0fe315d3e693253f3579d6a5e89f96df9b7631e3  media: ipu6: Support upstream sub-devices without get_frame_desc()

elapsed time: m

configs tested: 310
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r1306-20260917    clang-24   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20260916    gcc-10.5.0
arc                   randconfig-1000-20260917    gcc-15.2.0
arc                   randconfig-1001-20260916    gcc-10.5.0
arc                   randconfig-1001-20260917    gcc-15.2.0
arc                  randconfig-r1302-20260917    gcc-8.5.0  sparse
arc                  randconfig-r1303-20260917    gcc-8.5.0  sparse
arc                  randconfig-r1305-20260917    gcc-8.5.0  sparse
arc                  randconfig-r1306-20260917    clang-22   sparse
arc                  randconfig-r1307-20260916    gcc-16.1.0 sparse
arc                  randconfig-r1308-20260916    gcc-16.1.0 sparse
arc                            tb10x_defconfig    gcc-16.1.0
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                        aspeed_g4_defconfig    clang-24
arm                        aspeed_g4_defconfig    gcc-16.1.0
arm                          assabet_defconfig    clang-24
arm                          at91_dt_defconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                        imx_v6_v7_defconfig    gcc-16.1.0
arm                       jornada720_defconfig    clang-24
arm                          nhk8815_defconfig    clang-24
arm                          orion5x_defconfig    clang-24
arm                   randconfig-1000-20260916    gcc-10.5.0
arm                   randconfig-1000-20260917    gcc-15.2.0
arm                   randconfig-1001-20260916    gcc-10.5.0
arm                   randconfig-1001-20260917    gcc-15.2.0
arm                   randconfig-1002-20260916    gcc-10.5.0
arm                   randconfig-1002-20260917    gcc-15.2.0
arm                   randconfig-1003-20260916    gcc-10.5.0
arm                   randconfig-1003-20260917    gcc-15.2.0
arm                         realview_defconfig    clang-24
arm                            spitz_defconfig    clang-24
arm64                             alldefconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260916    gcc-14.3.0
arm64                 randconfig-1000-20260917    gcc-11.5.0
arm64                 randconfig-1001-20260916    gcc-14.3.0
arm64                 randconfig-1001-20260917    gcc-11.5.0
arm64                 randconfig-1002-20260916    gcc-14.3.0
arm64                 randconfig-1002-20260917    gcc-11.5.0
arm64                 randconfig-1003-20260916    gcc-14.3.0
arm64                 randconfig-1003-20260917    gcc-11.5.0
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260916    gcc-14.3.0
csky                  randconfig-1000-20260917    gcc-11.5.0
csky                  randconfig-1001-20260916    gcc-14.3.0
csky                  randconfig-1001-20260917    gcc-11.5.0
csky                 randconfig-r1308-20260917    clang-24   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260916    gcc-16.1.0
hexagon               randconfig-1000-20260917    clang-24
hexagon               randconfig-1001-20260916    gcc-16.1.0
hexagon               randconfig-1001-20260917    clang-24
hexagon              randconfig-r1301-20260917    gcc-8.5.0  sparse
hexagon              randconfig-r1302-20260917    clang-18   sparse
hexagon              randconfig-r1304-20260917    gcc-8.5.0  sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260916    clang-22
i386        buildonly-randconfig-1000-20260917    gcc-13
i386        buildonly-randconfig-1001-20260916    clang-22
i386        buildonly-randconfig-1001-20260917    gcc-13
i386        buildonly-randconfig-1002-20260916    clang-22
i386        buildonly-randconfig-1002-20260917    gcc-13
i386        buildonly-randconfig-1003-20260916    clang-22
i386        buildonly-randconfig-1003-20260917    gcc-13
i386        buildonly-randconfig-1004-20260916    clang-22
i386        buildonly-randconfig-1004-20260917    gcc-13
i386        buildonly-randconfig-1005-20260916    clang-22
i386        buildonly-randconfig-1005-20260917    gcc-13
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260916    gcc-14
i386                  randconfig-1000-20260917    clang-22
i386                  randconfig-1001-20260916    gcc-14
i386                  randconfig-1001-20260917    clang-22
i386                  randconfig-1002-20260916    gcc-14
i386                  randconfig-1002-20260917    clang-22
i386                  randconfig-1003-20260916    gcc-14
i386                  randconfig-1003-20260917    clang-22
i386                  randconfig-1004-20260916    gcc-14
i386                  randconfig-1004-20260917    clang-22
i386                  randconfig-1005-20260916    gcc-14
i386                  randconfig-1005-20260917    clang-22
i386                  randconfig-1006-20260916    gcc-14
i386                  randconfig-1006-20260917    clang-22
i386                  randconfig-1007-20260917    clang-22
i386                  randconfig-1008-20260917    clang-22
i386                  randconfig-1009-20260917    clang-22
i386                  randconfig-1010-20260917    clang-22
i386                  randconfig-1011-20260917    clang-22
i386                  randconfig-1012-20260917    clang-22
i386                  randconfig-1013-20260917    clang-22
i386                  randconfig-1300-20260916    clang-22   sparse
i386                  randconfig-1300-20260917    gcc-14     sparse
i386                  randconfig-1301-20260916    clang-22   sparse
i386                  randconfig-1301-20260917    gcc-14     sparse
i386                  randconfig-1302-20260916    clang-22   sparse
i386                  randconfig-1302-20260917    gcc-14     sparse
i386                 randconfig-r1300-20260917    clang-18   sparse
i386                 randconfig-r1301-20260916    gcc-14     sparse
i386                 randconfig-r1305-20260917    clang-18   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    clang-24
loongarch             randconfig-1000-20260916    gcc-16.1.0
loongarch             randconfig-1000-20260917    clang-24
loongarch             randconfig-1001-20260916    gcc-16.1.0
loongarch             randconfig-1001-20260917    clang-24
loongarch            randconfig-r1307-20260917    clang-24   sparse
loongarch            randconfig-r1309-20260917    clang-22   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5407c3_defconfig    clang-24
m68k                         mvme147_defconfig    clang-24
m68k                 randconfig-r1304-20260917    clang-18   sparse
m68k                           sun3x_defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                           ath25_defconfig    clang-24
mips                          cobalt_defconfig    gcc-16.1.0
mips                            ip27_defconfig    gcc-16.1.0
mips                         maltaup_defconfig    clang-24
mips                 randconfig-r1301-20260917    clang-18   sparse
mips                 randconfig-r1304-20260916    gcc-14     sparse
mips                 randconfig-r1309-20260917    clang-24   sparse
mips                    sb1250_swarm_defconfig    clang-24
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260916    gcc-16.1.0
nios2                 randconfig-1000-20260917    clang-24
nios2                 randconfig-1001-20260916    gcc-16.1.0
nios2                 randconfig-1001-20260917    clang-24
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r1300-20260917    gcc-8.5.0  sparse
openrisc             randconfig-r1303-20260916    gcc-14     sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                 generic-32bit_defconfig    clang-24
parisc                randconfig-1000-20260916    gcc-10.5.0
parisc                randconfig-1000-20260917    gcc-11.5.0
parisc                randconfig-1001-20260916    gcc-10.5.0
parisc                randconfig-1001-20260917    gcc-11.5.0
parisc               randconfig-r1300-20260916    gcc-14     sparse
parisc               randconfig-r1303-20260917    clang-18   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                        holly_defconfig    clang-24
powerpc                       ppc44x_defconfig    clang-24
powerpc               randconfig-1000-20260916    gcc-10.5.0
powerpc               randconfig-1000-20260917    gcc-11.5.0
powerpc               randconfig-1001-20260916    gcc-10.5.0
powerpc               randconfig-1001-20260917    gcc-11.5.0
powerpc              randconfig-r1302-20260916    gcc-14     sparse
powerpc64             randconfig-1000-20260916    gcc-10.5.0
powerpc64             randconfig-1000-20260917    gcc-11.5.0
powerpc64             randconfig-1001-20260916    gcc-10.5.0
powerpc64             randconfig-1001-20260917    gcc-11.5.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                     nommu_k210_defconfig    clang-24
riscv                 randconfig-1000-20260916    gcc-8.5.0
riscv                 randconfig-1000-20260917    clang-17
riscv                 randconfig-1001-20260916    gcc-8.5.0
riscv                 randconfig-1001-20260917    clang-17
riscv                randconfig-r1307-20260917    clang-22   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260916    gcc-8.5.0
s390                  randconfig-1000-20260917    clang-17
s390                  randconfig-1001-20260916    gcc-8.5.0
s390                  randconfig-1001-20260917    clang-17
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                           lboxre2_defconfig    clang-24
sh                    randconfig-1000-20260916    gcc-8.5.0
sh                    randconfig-1000-20260917    clang-17
sh                    randconfig-1001-20260916    gcc-8.5.0
sh                    randconfig-1001-20260917    clang-17
sh                   randconfig-r1306-20260916    gcc-16.1.0 sparse
sh                           sdk7780_defconfig    clang-24
sh                    sh7724_generic_defconfig    clang-24
sh                             shmin_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260916    clang-24
sparc                 randconfig-1000-20260917    clang-17
sparc                 randconfig-1001-20260916    clang-24
sparc                 randconfig-1001-20260917    clang-17
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260916    clang-24
sparc64               randconfig-1000-20260917    clang-17
sparc64               randconfig-1001-20260916    clang-24
sparc64               randconfig-1001-20260917    clang-17
sparc64              randconfig-r1305-20260916    gcc-14     sparse
sparc64              randconfig-r1309-20260916    gcc-16.1.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260916    clang-24
um                    randconfig-1000-20260917    clang-17
um                    randconfig-1001-20260916    clang-24
um                    randconfig-1001-20260917    clang-17
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20260916    gcc-14
x86_64      buildonly-randconfig-1000-20260917    gcc-14
x86_64      buildonly-randconfig-1001-20260916    gcc-14
x86_64      buildonly-randconfig-1001-20260917    gcc-14
x86_64      buildonly-randconfig-1002-20260916    gcc-14
x86_64      buildonly-randconfig-1002-20260917    gcc-14
x86_64      buildonly-randconfig-1003-20260916    gcc-14
x86_64      buildonly-randconfig-1003-20260917    gcc-14
x86_64      buildonly-randconfig-1004-20260916    gcc-14
x86_64      buildonly-randconfig-1004-20260917    gcc-14
x86_64      buildonly-randconfig-1005-20260916    gcc-14
x86_64      buildonly-randconfig-1005-20260917    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260916    clang-22
x86_64                randconfig-1000-20260917    clang-22
x86_64                randconfig-1001-20260916    clang-22
x86_64                randconfig-1001-20260917    clang-22
x86_64                randconfig-1002-20260916    clang-22
x86_64                randconfig-1002-20260917    clang-22
x86_64                randconfig-1003-20260916    clang-22
x86_64                randconfig-1003-20260917    clang-22
x86_64                randconfig-1004-20260916    clang-22
x86_64                randconfig-1004-20260917    clang-22
x86_64                randconfig-1005-20260916    clang-22
x86_64                randconfig-1005-20260917    clang-22
x86_64                randconfig-1006-20260916    clang-22
x86_64                randconfig-1006-20260917    clang-22
x86_64                randconfig-1007-20260916    clang-22
x86_64                randconfig-1007-20260917    clang-22
x86_64                randconfig-1008-20260916    clang-22
x86_64                randconfig-1008-20260917    clang-22
x86_64                randconfig-1009-20260916    clang-22
x86_64                randconfig-1009-20260917    clang-22
x86_64                randconfig-1010-20260916    clang-22
x86_64                randconfig-1010-20260917    clang-22
x86_64                randconfig-1011-20260916    clang-22
x86_64                randconfig-1011-20260917    clang-22
x86_64                randconfig-1012-20260916    gcc-14
x86_64                randconfig-1012-20260917    clang-22
x86_64                randconfig-1013-20260916    gcc-14
x86_64                randconfig-1013-20260917    clang-22
x86_64                randconfig-1014-20260916    gcc-14
x86_64                randconfig-1014-20260917    clang-22
x86_64                randconfig-1015-20260916    gcc-14
x86_64                randconfig-1015-20260917    clang-22
x86_64                randconfig-1016-20260916    gcc-14
x86_64                randconfig-1016-20260917    clang-22
x86_64                randconfig-1017-20260916    gcc-14
x86_64                randconfig-1017-20260917    clang-22
x86_64                randconfig-1300-20260916    clang-22   sparse
x86_64                randconfig-1300-20260917    gcc-14     sparse
x86_64                randconfig-1301-20260916    clang-22   sparse
x86_64                randconfig-1301-20260917    gcc-14     sparse
x86_64                randconfig-1302-20260916    clang-22   sparse
x86_64                randconfig-1302-20260917    gcc-14     sparse
x86_64               randconfig-r1308-20260917    clang-22   sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20260916    clang-24
xtensa                randconfig-1000-20260917    clang-17
xtensa                randconfig-1001-20260916    clang-24
xtensa                randconfig-1001-20260917    clang-17

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
