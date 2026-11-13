Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530063;
	b=N8n87mGJ0UhAn4Yzdi3eJZcMVcLISiVd5HpVPXVTik7/Y4yf19T4eLxOMRqkjTYLO6I1
	 8uSr/nB7Ph4Ywm+vtiseRfbW2dkoNZpaec3un6RHLkwUhIr/0ydn6HhrDwXqy8QklCPv+
	 oHqFRmZtpElOTrgT7iJZ+LI7IsXSCb9JEUmpC2nNZfCyLoBGXG3Wnuv6AE2V0rKx7Kgo8
	 2BWdZybc7QkJspw0wju/HPA31v5woAfk3QBpWDcrWKB1imRmUrdZPfJOE1ccRZNNTPZS4
	 NtPoLKq52BkvW8tKizud6TPitotIsnyMrKpGEUe//198lCwC/AeZgi46jdbrNTQWZtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530063;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=dbITYfwS8IpDIhWXdOlt9x15OHLNy+ohFDPl2uU8jrI=;
	b=w86Wa00CkO93HiKWbbLjl5ow/AuoWU8GC+q0cD5RqS09yFtpWQSzOtui0yo59h+oXs5E
	 Iy/1pJNZ/F95sHS9RO+P9X6fgIsTnQl3lt/PIBueWpZqLRKAHeZQY5NKRP/7dIOnLLj//
	 r0BtQg6NBgnTQahcaeQomTnj8B9/KwvYT2NlZCJHy6LOcFD3wtMj4hHhAFEDunn12pTWm
	 Z9lA1R0U33Ou4aDl8LdU5A+bu8gkvGTyel6UxMWl7gEImlKHEtzkT6fBkbgZpqYIsCb1z
	 z1CehPUi4zhIeW9VAdhxCbubK1bHOCUhHuBCJ0KHI9mxf1YE2YOUNC+wHnCA56vVVmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l3WDP14+;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29B3606A327
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 00:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F29B3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l3WDP14+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794530062; x=1826066062;
  h=date:from:to:cc:subject:message-id;
  bh=QBVkFEABD1Z78yaVc2m1BwbLBmQs1DcwColhQpYABr0=;
  b=l3WDP14+lnFhuWc5TUuHjQ+wFRRSS9c+HbklSKrwdIJBfCRIHuCe7b9U
   IUAGgiCU9Y+6T6au5CR56v6oHs9/p43mJ9JjwbEjH1W+rtlLGA0PgOKC9
   lVr8bmD4GV4LW3snrqjJuZ/p97ChuSvZtMzTmsLE98pl6n8Vv9Raqftew
   rLpP3tNTKJ0ox45zrhtEJhBhDQhU5qNCQ1CzoHpk89J0j3utvLxj5woFS
   22BLNgVBknXGUtY16Op0zqSK5Jpwqm13xOKKM1V4eVMUdYYTynWBnvf4u
   LamgLZp9lxg6Tbk8sdlcY39uENQeZtoH7wd+TuDB3VJsq63vDTaADzR6x
   A==;
X-CSE-ConnectionGUID: RuU/bQr4R6CaBdn4kY3sfA==
X-CSE-MsgGUID: lHFjOVs3Txm0f70R/Qr1fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3368067"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3368067"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 16:34:22 -0800
X-CSE-ConnectionGUID: oQVEUiOfTjaQq0YIE9cTjg==
X-CSE-MsgGUID: +cLpyLUDQnWbM7wdTeIhHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="9125224"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Nov 2026 16:34:20 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRfFB-000000012EP-2os4;
	Fri, 13 Nov 2026 00:34:17 +0000
Date: Fri, 13 Nov 2026 08:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 606a011812530d55044c01cbade4deaf3cdb5fef
Message-ID: <20261113083335.SrrROF5R-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git next
branch HEAD: 606a011812530d55044c01cbade4deaf3cdb5fef  media: rc: ati_remote: fix NULL input_dev on rc device open

elapsed time: 970m

configs tested: 267
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             alldefconfig    gcc-16.2.0
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261112    clang-24
arc                   randconfig-1000-20261113    gcc-10.5.0
arc                   randconfig-1001-20261112    clang-24
arc                   randconfig-1001-20261113    gcc-10.5.0
arm                               alldefconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                             dove_defconfig    gcc-16.2.0
arm                           gemini_defconfig    gcc-16.2.0
arm                            imxrt_defconfig    gcc-16.2.0
arm                       integrator_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261112    clang-24
arm                   randconfig-1000-20261113    gcc-10.5.0
arm                   randconfig-1001-20261112    clang-24
arm                   randconfig-1001-20261113    gcc-10.5.0
arm                   randconfig-1002-20261112    clang-24
arm                   randconfig-1002-20261113    gcc-10.5.0
arm                   randconfig-1003-20261112    clang-24
arm                   randconfig-1003-20261113    gcc-10.5.0
arm                          s3c6400_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261112    gcc-14.4.0
arm64                 randconfig-1001-20261112    gcc-14.4.0
arm64                 randconfig-1002-20261112    gcc-14.4.0
arm64                 randconfig-1003-20261112    gcc-14.4.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261112    gcc-14.4.0
csky                  randconfig-1001-20261112    gcc-14.4.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261112    clang-24
hexagon               randconfig-1000-20261113    clang-24
hexagon               randconfig-1001-20261112    clang-24
hexagon               randconfig-1001-20261113    clang-24
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261112    clang-22
i386        buildonly-randconfig-1000-20261113    clang-22
i386        buildonly-randconfig-1001-20261112    clang-22
i386        buildonly-randconfig-1001-20261113    clang-22
i386        buildonly-randconfig-1002-20261112    clang-22
i386        buildonly-randconfig-1002-20261113    clang-22
i386        buildonly-randconfig-1003-20261112    clang-22
i386        buildonly-randconfig-1003-20261113    clang-22
i386        buildonly-randconfig-1004-20261112    clang-22
i386        buildonly-randconfig-1004-20261113    clang-22
i386        buildonly-randconfig-1005-20261112    clang-22
i386        buildonly-randconfig-1005-20261113    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261112    gcc-14
i386                  randconfig-1001-20261112    gcc-14
i386                  randconfig-1002-20261112    gcc-14
i386                  randconfig-1003-20261112    gcc-14
i386                  randconfig-1004-20261112    gcc-14
i386                  randconfig-1005-20261112    gcc-14
i386                  randconfig-1006-20261112    gcc-14
i386                  randconfig-1007-20261112    clang-22
i386                  randconfig-1007-20261113    clang-22
i386                  randconfig-1008-20261112    clang-22
i386                  randconfig-1008-20261113    clang-22
i386                  randconfig-1009-20261112    clang-22
i386                  randconfig-1009-20261113    clang-22
i386                  randconfig-1010-20261112    clang-22
i386                  randconfig-1010-20261113    clang-22
i386                  randconfig-1011-20261112    clang-22
i386                  randconfig-1011-20261113    clang-22
i386                  randconfig-1012-20261112    clang-22
i386                  randconfig-1012-20261113    clang-22
i386                  randconfig-1013-20261112    clang-22
i386                  randconfig-1013-20261113    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    gcc-16.2.0
loongarch             randconfig-1000-20261112    clang-24
loongarch             randconfig-1000-20261113    clang-24
loongarch             randconfig-1001-20261112    clang-24
loongarch             randconfig-1001-20261113    clang-24
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.2.0
m68k                        m5282evb_defconfig    gcc-16.2.0
m68k                             mac_defconfig    gcc-16.2.0
m68k                         mvme147_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                        bmips_be_defconfig    gcc-16.2.0
mips                      decstation_defconfig    gcc-16.2.0
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                            ip28_defconfig    gcc-16.2.0
mips                         maltaup_defconfig    gcc-16.2.0
mips                       pic32mzda_defconfig    gcc-16.2.0
mips                        rbtx49xx_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261112    clang-24
nios2                 randconfig-1000-20261113    clang-24
nios2                 randconfig-1001-20261112    clang-24
nios2                 randconfig-1001-20261113    clang-24
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261112    gcc-12.5.0
parisc                randconfig-1000-20261113    gcc-13.5.0
parisc                randconfig-1001-20261112    gcc-12.5.0
parisc                randconfig-1001-20261113    gcc-13.5.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                         icon_defconfig    gcc-16.2.0
powerpc                  mpc832x_rdb_defconfig    gcc-16.2.0
powerpc                       ppc64e_defconfig    gcc-16.2.0
powerpc                       ppc6xx_defconfig    gcc-16.2.0
powerpc                      rainier_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261112    gcc-12.5.0
powerpc               randconfig-1000-20261113    gcc-13.5.0
powerpc               randconfig-1001-20261112    gcc-12.5.0
powerpc               randconfig-1001-20261113    gcc-13.5.0
powerpc                  xes_mpc85xx_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261112    gcc-12.5.0
powerpc64             randconfig-1000-20261113    gcc-13.5.0
powerpc64             randconfig-1001-20261112    gcc-12.5.0
powerpc64             randconfig-1001-20261113    gcc-13.5.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261112    gcc-9.5.0
riscv                 randconfig-1000-20261113    gcc-12.5.0
riscv                 randconfig-1001-20261112    gcc-9.5.0
riscv                 randconfig-1001-20261113    gcc-12.5.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261112    gcc-9.5.0
s390                  randconfig-1000-20261113    gcc-12.5.0
s390                  randconfig-1001-20261112    gcc-9.5.0
s390                  randconfig-1001-20261113    gcc-12.5.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                           kfr2r09_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261112    gcc-9.5.0
sh                    randconfig-1000-20261113    gcc-12.5.0
sh                    randconfig-1001-20261112    gcc-9.5.0
sh                    randconfig-1001-20261113    gcc-12.5.0
sh                           rsk7269_defconfig    gcc-16.2.0
sh                      sh7710voipgw_defconfig    gcc-16.2.0
sh                         sh7757lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261112    gcc-8.5.0
sparc                 randconfig-1000-20261113    gcc-8.5.0
sparc                 randconfig-1001-20261112    gcc-8.5.0
sparc                 randconfig-1001-20261113    gcc-8.5.0
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261112    gcc-8.5.0
sparc64               randconfig-1000-20261113    gcc-8.5.0
sparc64               randconfig-1001-20261112    gcc-8.5.0
sparc64               randconfig-1001-20261113    gcc-8.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261112    gcc-8.5.0
um                    randconfig-1000-20261113    gcc-8.5.0
um                    randconfig-1001-20261112    gcc-8.5.0
um                    randconfig-1001-20261113    gcc-8.5.0
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261112    gcc-14
x86_64      buildonly-randconfig-1000-20261113    clang-22
x86_64      buildonly-randconfig-1001-20261112    gcc-14
x86_64      buildonly-randconfig-1001-20261113    clang-22
x86_64      buildonly-randconfig-1002-20261112    gcc-14
x86_64      buildonly-randconfig-1002-20261113    clang-22
x86_64      buildonly-randconfig-1003-20261112    gcc-14
x86_64      buildonly-randconfig-1003-20261113    clang-22
x86_64      buildonly-randconfig-1004-20261112    gcc-14
x86_64      buildonly-randconfig-1004-20261113    clang-22
x86_64      buildonly-randconfig-1005-20261112    gcc-14
x86_64      buildonly-randconfig-1005-20261113    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261112    clang-22
x86_64                randconfig-1000-20261113    clang-22
x86_64                randconfig-1001-20261112    clang-22
x86_64                randconfig-1001-20261113    clang-22
x86_64                randconfig-1002-20261112    clang-22
x86_64                randconfig-1002-20261113    clang-22
x86_64                randconfig-1003-20261112    clang-22
x86_64                randconfig-1003-20261113    clang-22
x86_64                randconfig-1004-20261112    clang-22
x86_64                randconfig-1004-20261113    clang-22
x86_64                randconfig-1005-20261112    clang-22
x86_64                randconfig-1005-20261113    clang-22
x86_64                randconfig-1006-20261112    gcc-14
x86_64                randconfig-1006-20261113    clang-22
x86_64                randconfig-1007-20261112    gcc-14
x86_64                randconfig-1007-20261113    clang-22
x86_64                randconfig-1008-20261112    gcc-14
x86_64                randconfig-1008-20261113    clang-22
x86_64                randconfig-1009-20261112    gcc-14
x86_64                randconfig-1009-20261113    clang-22
x86_64                randconfig-1010-20261112    gcc-14
x86_64                randconfig-1010-20261113    clang-22
x86_64                randconfig-1011-20261112    gcc-14
x86_64                randconfig-1011-20261113    clang-22
x86_64                randconfig-1012-20261112    clang-22
x86_64                randconfig-1012-20261113    gcc-14
x86_64                randconfig-1013-20261112    clang-22
x86_64                randconfig-1013-20261113    gcc-14
x86_64                randconfig-1014-20261112    clang-22
x86_64                randconfig-1014-20261113    gcc-14
x86_64                randconfig-1015-20261112    clang-22
x86_64                randconfig-1015-20261113    gcc-14
x86_64                randconfig-1016-20261112    clang-22
x86_64                randconfig-1016-20261113    gcc-14
x86_64                randconfig-1017-20261112    clang-22
x86_64                randconfig-1017-20261113    gcc-14
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261112    gcc-8.5.0
xtensa                randconfig-1000-20261113    gcc-8.5.0
xtensa                randconfig-1001-20261112    gcc-8.5.0
xtensa                randconfig-1001-20261113    gcc-8.5.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
