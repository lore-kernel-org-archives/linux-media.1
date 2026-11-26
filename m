Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725274;
	b=cWKUVAzu7H8Bp1LU/Mtip3OqI+Ichu8kxMM8v2gZbdo15zeT9iCKfMfykxjeiwH6yaE1
	 uByDAYTwQeBklyKn8ZRN7OZIyvWwhPkI/365ZVAM77WTUGf/7cSM/uuKRjnjLGmYNetCZ
	 nr35R0WiqcOCSJtcwwybxwRTqvEFtK6AviAg+mzMmhbM67NKBpgCmuaME+tBU2ZdkBan3
	 NejR5Buh7hyptOqx4DDPv6A4bjWr1vNKP8xkrsqbV2Al/diuxN+XRB54pm9UlKnAjBsmz
	 uoIPTEkSKNksoA91RE1Arfr7YhD1E44BRPVLn6ewCqgx+MDJjrz0Hno2ZVa2MW33IeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725274;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=OGne5eM0+SOYdfTao3pGc3uBp744aZOrznFGJeRTJ7Y=;
	b=335FuoSZ4PbLZ7Z2Sjg6ln2E2C8Orkxw7J9NXE3OCcM2arEGi1/+T1raASonCxbfU+aX
	 l5cEc6NuZUUii+ANPkhGY8M6o880ITK0FWSHP5r/JFyKOu38PkVoVj4VRSBsS97Ag1aEZ
	 UmGw6l9cDieMigYXs0oyG0fpkGczSFctyXS9Qq/ZrMQ7WZ/DENSz0fD/vRzXGQYRfNM0U
	 DDSFf5Xj9Fc577BkE3HjAHqkiVZSTUpcxr2JfydMQv4a73+MH/FiQ/YOur6xyWHrK6lEO
	 PGHqpDGLVTDihfCbWG04QARPXDEDbkKZ9bbZz+jBcjVpuDWNSGZfjXxRdVcOaOyYJug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="M7NJpqG/";
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB241606A337
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 20:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB241606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M7NJpqG/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795725273; x=1827261273;
  h=date:from:to:cc:subject:message-id;
  bh=cLdI2CJKfkOEjRsA16S1xV+LIZSgK+ehaETVQu6iScI=;
  b=M7NJpqG/td8Oki3sTzPfYRvdxoGdPxOgYZt+pMJLdkVjDfnLj1cn2CPB
   wHLMunMPG5sUbm5aY8ToCZZXbHbahkWJMkyAgbruBmDYzq2zxWcGcj4MH
   B/rVWjylc2ZAHC0xvskIRQ9o9zKqAKyBSllQ92rMSJ61Mi9ShUcHLYuY5
   9kPq86EOGrNHYsTNVQ3/rhhcvL4Q8UFXRfzskgFnXdMd/kpvoXtK1e0py
   NL8m3fUFk53lEO3sY+T2yZVnK953slOUW6goyDBu6gMMBizfNOjWwjV+U
   CkVQUZKUrqK11QndAbhTBLtGSoVjd4oD+yFp0rGIbLEXBsUUmuUCuzKlt
   Q==;
X-CSE-ConnectionGUID: XjaPOxsxQm2AHgBDUvvUKw==
X-CSE-MsgGUID: qa5AB2kKT5yoQXFJMrSRlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4728717"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4728717"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 12:34:32 -0800
X-CSE-ConnectionGUID: nVgZnbo5RLKTl6xsrtO3cQ==
X-CSE-MsgGUID: T+2zz7EqSHeGtcDn37Ixxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12491461"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2026 12:34:31 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWgAl-00000001Uow-3mwq;
	Thu, 26 Nov 2026 20:34:27 +0000
Date: Fri, 27 Nov 2026 04:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 b4e3c4b6a36fd76f57bf3e48638f68ddecc54ba4
Message-ID: <20261127043332.0VIpp2Et-lkp@intel.com>
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
branch HEAD: b4e3c4b6a36fd76f57bf3e48638f68ddecc54ba4  media: v4l2-ctrls: set handler error if array allocation fails

elapsed time: 1476m

configs tested: 322
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261125    gcc-12.5.0
alpha                 randconfig-2001-20261125    gcc-8.5.0
alpha                 randconfig-2200-20261125    gcc-10.5.0 smatch
alpha                 randconfig-2200-20261126    gcc-9.5.0  smatch
alpha                randconfig-r2106-20261125    gcc-8.5.0  cocci
alpha                randconfig-r2108-20261125    gcc-12.5.0 cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-2000-20261125    gcc-8.5.0
arc                   randconfig-2001-20261125    gcc-10.5.0
arc                   randconfig-2002-20261125    gcc-16.2.0
arc                   randconfig-2003-20261125    gcc-10.5.0
arc                   randconfig-2004-20261125    gcc-12.5.0
arc                   randconfig-2005-20261125    gcc-10.5.0
arc                   randconfig-2200-20261125    gcc-14.4.0 smatch
arc                   randconfig-2200-20261126    gcc-8.5.0  smatch
arc                  randconfig-r2110-20261125    gcc-16.2.0 cocci
arc                  randconfig-r2310-20261126    gcc-8.5.0  sparse
arc                  randconfig-r2311-20261126    gcc-8.5.0  sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                           ixp4xx_defconfig    gcc-16.2.0
arm                   randconfig-2000-20261125    clang-17
arm                   randconfig-2001-20261125    clang-22
arm                   randconfig-2002-20261125    clang-17
arm                   randconfig-2200-20261125    clang-21   smatch
arm                   randconfig-2200-20261126    gcc-8.5.0  smatch
arm                  randconfig-r2308-20261126    gcc-8.5.0  sparse
arm                          s3c6400_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-2000-20261125    clang-24
arm64                 randconfig-2001-20261125    gcc-8.5.0
arm64                 randconfig-2002-20261125    clang-17
arm64                 randconfig-2200-20261125    gcc-13.5.0 smatch
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-2000-20261125    gcc-16.2.0
csky                  randconfig-2001-20261125    gcc-14.4.0
csky                  randconfig-2200-20261125    gcc-16.2.0 smatch
csky                 randconfig-r2102-20261125    gcc-13.5.0 cocci
csky                 randconfig-r2110-20261125    gcc-10.5.0 cocci
csky                 randconfig-r2305-20261125    gcc-9.5.0  sparse
csky                 randconfig-r2307-20261126    gcc-8.5.0  sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261126    gcc-11.5.0
hexagon               randconfig-1001-20261126    gcc-11.5.0
hexagon               randconfig-2000-20261125    clang-17
hexagon               randconfig-2001-20261125    clang-24
hexagon               randconfig-2200-20261125    clang-17   smatch
hexagon              randconfig-r2111-20261125    clang-17   cocci
hexagon              randconfig-r2307-20261125    clang-17   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261126    gcc-14
i386        buildonly-randconfig-1001-20261126    gcc-14
i386        buildonly-randconfig-1002-20261126    gcc-14
i386        buildonly-randconfig-1003-20261126    gcc-14
i386        buildonly-randconfig-1004-20261126    gcc-14
i386        buildonly-randconfig-1005-20261126    gcc-14
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261126    clang-22
i386                  randconfig-1001-20261126    clang-22
i386                  randconfig-1002-20261126    clang-22
i386                  randconfig-1003-20261126    clang-22
i386                  randconfig-1004-20261126    clang-22
i386                  randconfig-1005-20261126    clang-22
i386                  randconfig-1006-20261126    clang-22
i386                  randconfig-2000-20261125    clang-22
i386                  randconfig-2001-20261125    gcc-14
i386                  randconfig-2002-20261125    gcc-14
i386                  randconfig-2003-20261125    gcc-14
i386                  randconfig-2004-20261125    clang-22
i386                  randconfig-2005-20261125    clang-22
i386                  randconfig-2100-20261125    clang-22   cocci
i386                  randconfig-2101-20261125    clang-22   cocci
i386                  randconfig-2102-20261125    clang-22   cocci
i386                  randconfig-2103-20261125    clang-22   cocci
i386                  randconfig-2104-20261125    gcc-14     cocci
i386                  randconfig-2105-20261125    clang-22   cocci
i386                  randconfig-2200-20261125    clang-22   smatch
i386                  randconfig-2300-20261125    clang-22   sparse
i386                  randconfig-2301-20261125    clang-22   sparse
i386                  randconfig-2302-20261125    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261126    gcc-11.5.0
loongarch             randconfig-1001-20261126    gcc-11.5.0
loongarch             randconfig-2000-20261125    clang-19
loongarch             randconfig-2001-20261125    gcc-16.2.0
loongarch             randconfig-2200-20261125    clang-18   smatch
loongarch             randconfig-2200-20261126    gcc-14.4.0 smatch
loongarch            randconfig-r2107-20261125    clang-24   cocci
loongarch            randconfig-r2308-20261125    gcc-16.2.0 sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                  randconfig-2000-20261125    gcc-8.5.0
m68k                  randconfig-2001-20261125    gcc-11.5.0
m68k                  randconfig-2200-20261125    gcc-15.3.0 smatch
m68k                 randconfig-r2105-20261125    gcc-14.4.0 cocci
m68k                 randconfig-r2108-20261125    gcc-16.2.0 cocci
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261125    gcc-12.5.0
microblaze            randconfig-2001-20261125    gcc-10.5.0
microblaze            randconfig-2200-20261125    gcc-8.5.0  smatch
microblaze            randconfig-2200-20261126    gcc-9.5.0  smatch
microblaze           randconfig-r2100-20261125    gcc-8.5.0  cocci
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                         maltaup_defconfig    clang-20
mips                  randconfig-2000-20261125    gcc-14.4.0
mips                  randconfig-2000-20261126    gcc-16.2.0
mips                  randconfig-2001-20261125    clang-17
mips                  randconfig-2001-20261126    gcc-16.2.0
mips                  randconfig-2002-20261125    clang-24
mips                  randconfig-2002-20261126    gcc-16.2.0
mips                  randconfig-2200-20261125    clang-24   smatch
mips                    sb1250_swarm_defconfig    clang-20
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261126    gcc-11.5.0
nios2                 randconfig-1001-20261126    gcc-11.5.0
nios2                 randconfig-2000-20261125    gcc-8.5.0
nios2                 randconfig-2001-20261125    gcc-8.5.0
nios2                 randconfig-2200-20261125    gcc-8.5.0  smatch
nios2                 randconfig-2200-20261126    gcc-9.5.0  smatch
nios2                randconfig-r2103-20261125    gcc-11.5.0 cocci
nios2                randconfig-r2109-20261125    gcc-11.5.0 cocci
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc              randconfig-2000-20261125    gcc-12.5.0
openrisc              randconfig-2000-20261126    gcc-16.2.0
openrisc              randconfig-2001-20261125    gcc-10.5.0
openrisc              randconfig-2001-20261126    gcc-16.2.0
openrisc              randconfig-2002-20261125    gcc-16.2.0
openrisc              randconfig-2002-20261126    gcc-16.2.0
openrisc              randconfig-2200-20261125    gcc-10.5.0 smatch
openrisc              randconfig-2200-20261126    gcc-9.5.0  smatch
openrisc             randconfig-r2301-20261125    gcc-11.5.0 sparse
openrisc             randconfig-r2309-20261125    gcc-15.3.0 sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                randconfig-1000-20261126    gcc-13.5.0
parisc                randconfig-1001-20261126    gcc-13.5.0
parisc                randconfig-2000-20261125    gcc-10.5.0
parisc                randconfig-2001-20261125    gcc-8.5.0
parisc                randconfig-2200-20261125    gcc-12.5.0 smatch
parisc                randconfig-2200-20261126    gcc-15.3.0 smatch
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    gcc-16.2.0
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                        ebony_defconfig    gcc-16.2.0
powerpc                   iss476-smp_defconfig    clang-20
powerpc                  mpc834x_itx_defconfig    gcc-16.2.0
powerpc                mpc834x_itxgp_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261126    gcc-13.5.0
powerpc               randconfig-1001-20261126    gcc-13.5.0
powerpc               randconfig-2000-20261125    clang-17
powerpc               randconfig-2001-20261125    gcc-11.5.0
powerpc               randconfig-2002-20261125    gcc-9.5.0
powerpc               randconfig-2200-20261125    gcc-11.5.0 smatch
powerpc               randconfig-2200-20261126    clang-24   smatch
powerpc              randconfig-r2304-20261125    clang-17   sparse
powerpc              randconfig-r2306-20261126    gcc-8.5.0  sparse
powerpc                      tqm5200_defconfig    clang-20
powerpc                       tqm8xx_defconfig    clang-20
powerpc                          wii_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261126    gcc-13.5.0
powerpc64             randconfig-1001-20261126    gcc-13.5.0
powerpc64             randconfig-2000-20261125    gcc-15.3.0
powerpc64             randconfig-2001-20261125    clang-17
powerpc64             randconfig-2002-20261125    clang-17
powerpc64             randconfig-2200-20261125    gcc-13.5.0 smatch
powerpc64             randconfig-2200-20261126    clang-24   smatch
powerpc64            randconfig-r2300-20261125    gcc-11.5.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                 randconfig-1001-20261126    clang-20
riscv                 randconfig-2000-20261125    gcc-13.5.0
riscv                 randconfig-2001-20261125    gcc-8.5.0
riscv                 randconfig-2002-20261125    gcc-8.5.0
riscv                 randconfig-2003-20261125    gcc-11.5.0
riscv                 randconfig-2004-20261125    gcc-8.5.0
riscv                 randconfig-2005-20261125    clang-24
riscv                 randconfig-2200-20261125    gcc-8.5.0  smatch
riscv                randconfig-r2101-20261125    clang-24   cocci
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                  randconfig-1000-20261126    clang-20
s390                  randconfig-1001-20261126    clang-20
s390                  randconfig-2000-20261125    gcc-8.5.0
s390                  randconfig-2001-20261125    gcc-11.5.0
s390                  randconfig-2002-20261125    clang-24
s390                  randconfig-2003-20261125    gcc-8.5.0
s390                  randconfig-2004-20261125    clang-24
s390                  randconfig-2005-20261125    clang-20
s390                  randconfig-2200-20261125    gcc-15.3.0 smatch
s390                  randconfig-2200-20261126    gcc-16.2.0 smatch
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                          apsh4a3a_defconfig    clang-20
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261126    clang-20
sh                    randconfig-1001-20261126    clang-20
sh                    randconfig-2000-20261125    gcc-16.2.0
sh                    randconfig-2000-20261126    gcc-9.5.0
sh                    randconfig-2001-20261125    gcc-14.4.0
sh                    randconfig-2001-20261126    gcc-9.5.0
sh                    randconfig-2002-20261125    gcc-16.2.0
sh                    randconfig-2002-20261126    gcc-9.5.0
sh                    randconfig-2003-20261125    gcc-14.4.0
sh                    randconfig-2003-20261126    gcc-9.5.0
sh                    randconfig-2004-20261125    gcc-16.2.0
sh                    randconfig-2004-20261126    gcc-9.5.0
sh                    randconfig-2005-20261125    gcc-10.5.0
sh                    randconfig-2005-20261126    gcc-9.5.0
sh                    randconfig-2200-20261125    gcc-14.4.0 smatch
sh                    randconfig-2200-20261126    gcc-16.2.0 smatch
sh                    rts7751r2dplus_defconfig    clang-20
sparc                              allnoconfig    clang-24
sparc                 randconfig-1000-20261126    clang-17
sparc                 randconfig-1001-20261126    clang-17
sparc                 randconfig-2000-20261125    gcc-16.2.0
sparc                 randconfig-2001-20261125    gcc-16.2.0
sparc                 randconfig-2200-20261125    gcc-14.4.0 smatch
sparc                randconfig-r2303-20261125    gcc-8.5.0  sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261126    clang-17
sparc64               randconfig-1001-20261126    clang-17
sparc64               randconfig-2000-20261125    clang-24
sparc64               randconfig-2001-20261125    gcc-8.5.0
sparc64               randconfig-2200-20261125    gcc-15.3.0 smatch
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261126    clang-17
um                    randconfig-1001-20261126    clang-17
um                    randconfig-2000-20261125    clang-17
um                    randconfig-2001-20261125    clang-22
um                    randconfig-2200-20261125    clang-17   smatch
um                    randconfig-2200-20261126    gcc-12     smatch
um                   randconfig-r2302-20261125    gcc-14     sparse
um                   randconfig-r2309-20261126    gcc-8.5.0  sparse
um                            x86_64_defconfig    gcc-14
x86_64                            alldefconfig    clang-20
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261126    clang-22
x86_64      buildonly-randconfig-1001-20261126    clang-22
x86_64      buildonly-randconfig-1002-20261126    clang-22
x86_64      buildonly-randconfig-1003-20261126    clang-22
x86_64      buildonly-randconfig-1004-20261126    clang-22
x86_64      buildonly-randconfig-1005-20261126    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261126    clang-22
x86_64                randconfig-1001-20261126    clang-22
x86_64                randconfig-1002-20261126    clang-22
x86_64                randconfig-1003-20261126    clang-22
x86_64                randconfig-1004-20261126    clang-22
x86_64                randconfig-1005-20261126    clang-22
x86_64                randconfig-2000-20261125    gcc-14
x86_64                randconfig-2001-20261125    gcc-14
x86_64                randconfig-2002-20261125    gcc-14
x86_64                randconfig-2003-20261125    gcc-14
x86_64                randconfig-2004-20261125    gcc-14
x86_64                randconfig-2005-20261125    gcc-14
x86_64                randconfig-2100-20261125    gcc-13     cocci
x86_64                randconfig-2101-20261125    clang-22   cocci
x86_64                randconfig-2102-20261125    clang-22   cocci
x86_64                randconfig-2103-20261125    clang-22   cocci
x86_64                randconfig-2104-20261125    gcc-14     cocci
x86_64                randconfig-2105-20261125    gcc-14     cocci
x86_64                randconfig-2200-20261125    gcc-14     smatch
x86_64                randconfig-2300-20261125    clang-22   sparse
x86_64                randconfig-2301-20261125    clang-22   sparse
x86_64                randconfig-2302-20261125    clang-22   sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                            alldefconfig    gcc-16.2.0
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261126    clang-17
xtensa                randconfig-1001-20261126    clang-17
xtensa                randconfig-2000-20261125    gcc-10.5.0
xtensa                randconfig-2001-20261125    gcc-12.5.0
xtensa                randconfig-2200-20261125    gcc-16.2.0 smatch
xtensa                randconfig-2200-20261126    gcc-11.5.0 smatch
xtensa               randconfig-r2104-20261125    gcc-8.5.0  cocci
xtensa               randconfig-r2306-20261125    gcc-13.5.0 sparse
xtensa               randconfig-r2310-20261125    gcc-14.4.0 sparse
xtensa               randconfig-r2311-20261125    gcc-8.5.0  sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
