Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387465;
	b=RQbqe0fD8DsFVr+g/u+AEjDs6EyMZ630GrLfDcx9Y5js6wJQpdUJigGazLWjKZ3XuF3T
	 8WPsMTv70hgJu5YPNWKL9dL21CFR+JF2V4vgoZ2JWaM5CPRA9Qk68zzDRbW5edr2x+7N0
	 413w4e8SbEdaM+iYfO5qTUoZ/lPgBZ1bwCbMxn/OtiWvg4Pk1n6D8KKcQwZne+SPJiJz4
	 c+y/Oud15WTcj2U70OIgOv2Cre1J8V4lTUv7R+fjcm6eGg5wEJisoB3YI88XNBIrHuUil
	 qCMo8POKyiPwmc63Wnf5YrHkQ2NcXm2NYraA4qyu/v8MnsUmo6w6uzoEJRuM0zK2gWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387465;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=MAL5D9nRXI9Cw0qB+FI+vFXfPl1HOMwdXU/PlOWLbok=;
	b=G/7OxUchmcEIgJVJKJjgY+W+t3SiTpMNOgM39fhDr304V420Bd/3acouicVR4IgJ1uRP
	 77aqBFwn5t1GstkFUmupciCJ9dXxlw7rHrPTdO2MVt73sz17bWVEyeabd/TP+VxYee6cb
	 MxhmEWdy1bGtFlCFQaw0VYX5Zg2z/f/ur1OmioN6OcBL3vzyAWaWNOSn22n5UcAvGmhbS
	 7eRkTV7s/4vYP3snsqsBjNPdi4i1kHH8gSIiG6MqHEOeC2aex9vwMfpD0K4j6GzsZJAmo
	 Gv6b/PRLq158fUGH704xbIUd/fA2UWaT3vDZxRJ5M49XX6Pq0FuCQ+BAN1y1ow018gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YTHZGIuR;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819C560A2602
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 08:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 819C560A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YTHZGIuR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794387465; x=1825923465;
  h=date:from:to:cc:subject:message-id;
  bh=3/OrmtsTjDvmn0Y0tAet40PWozvpXkvlt9flrua9Gi0=;
  b=YTHZGIuRENFZK3Y2IR8lTp2rznNvGT3rEY3ozQCR+D24+e41rTbtp920
   BfteLQdbq3kPsiN9cqZDWoJWtfXlq/gsU7B+b16Tg4u0hfQbL9I0D8MB8
   9HX1JPH0FYc6q8i8Euy7uYuHPlce2kEV7Dore5HC1o6yKYzOs/Q/PISs8
   g9RmLDX3zyWoe3w1VEZv+fV1Edvtvp4zVB6Zo/RpGWVQKP/Lii8XcnY65
   +vFerHlUgXMnr6i2Xbw4e68MxLfL4S1hdsI6ZkbgtTzaK3CSjydd/pdZh
   58XLfPjwb+kXvgV0ED4Tbxj4SZWghSnBmieQ9RAMg23W6UrHIfoNb/j40
   w==;
X-CSE-ConnectionGUID: IQsm64sPSL++whDGsfqSlQ==
X-CSE-MsgGUID: 6fF4EyxPRxeEh30JWkXWxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3027191"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3027191"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 00:57:44 -0800
X-CSE-ConnectionGUID: tXMkxsESR7iFGhFOMnii9g==
X-CSE-MsgGUID: DnuOfjd2TqeAsyL8AWgpGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8235071"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Nov 2026 00:57:42 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xR49D-00000000yUd-3kND;
	Wed, 11 Nov 2026 08:57:39 +0000
Date: Wed, 11 Nov 2026 16:57:33 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:fixes] BUILD SUCCESS
 b4fdacb0244b87fbadb230819a0a42a5b1ecb324
Message-ID: <20261111165733.5FJdWOTD-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git fixes
branch HEAD: b4fdacb0244b87fbadb230819a0a42a5b1ecb324  media: intel/ipu6: clamp crop top offset in ipu6_isys_csi2_set_sel()

elapsed time: 987m

configs tested: 653
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261110    gcc-12.5.0
alpha                 randconfig-2000-20261111    gcc-8.5.0
alpha                 randconfig-2001-20261110    gcc-12.5.0
alpha                 randconfig-2001-20261111    gcc-8.5.0
alpha                 randconfig-2200-20261110    gcc-9.5.0  smatch
alpha                 randconfig-2200-20261111    gcc-12.5.0 smatch
alpha                randconfig-r2102-20261110    gcc-8.5.0  cocci
alpha                randconfig-r2107-20261111    gcc-10.5.0 cocci
alpha                randconfig-r2109-20261110    clang-24   cocci
alpha                randconfig-r2111-20261111    gcc-9.5.0  cocci
alpha                randconfig-r2301-20261110    gcc-10.5.0 sparse
alpha                randconfig-r2303-20261110    gcc-16.2.0 sparse
alpha                randconfig-r2303-20261111    gcc-8.5.0  sparse
alpha                randconfig-r2307-20261111    gcc-14     sparse
alpha                randconfig-r2310-20261110    gcc-11.5.0 sparse
arc                               allmodconfig    clang-24
arc                               allmodconfig    gcc-16.2.0
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                         nsimosci_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261111    gcc-15.3.0
arc                   randconfig-1001-20261111    gcc-15.3.0
arc                   randconfig-2000-20261110    gcc-8.5.0
arc                   randconfig-2000-20261111    gcc-14.4.0
arc                   randconfig-2001-20261110    gcc-8.5.0
arc                   randconfig-2001-20261111    gcc-14.4.0
arc                   randconfig-2002-20261110    gcc-8.5.0
arc                   randconfig-2002-20261111    gcc-14.4.0
arc                   randconfig-2003-20261110    gcc-8.5.0
arc                   randconfig-2003-20261111    gcc-14.4.0
arc                   randconfig-2004-20261110    gcc-8.5.0
arc                   randconfig-2004-20261111    gcc-14.4.0
arc                   randconfig-2005-20261110    gcc-8.5.0
arc                   randconfig-2005-20261111    gcc-14.4.0
arc                   randconfig-2200-20261110    gcc-8.5.0  smatch
arc                   randconfig-2200-20261111    gcc-16.2.0 smatch
arc                  randconfig-r2100-20261110    gcc-8.5.0  cocci
arc                  randconfig-r2104-20261111    gcc-8.5.0  cocci
arc                  randconfig-r2110-20261111    gcc-10.5.0 cocci
arc                  randconfig-r2300-20261110    gcc-10.5.0 sparse
arc                  randconfig-r2300-20261111    gcc-8.5.0  sparse
arc                  randconfig-r2301-20261110    clang-24   sparse
arc                  randconfig-r2301-20261111    gcc-8.5.0  sparse
arc                  randconfig-r2306-20261111    clang-24   sparse
arc                  randconfig-r2307-20261110    clang-24   sparse
arc                  randconfig-r2308-20261111    gcc-11.5.0 sparse
arc                  randconfig-r2308-20261111    gcc-14     sparse
arc                  randconfig-r2311-20261110    clang-24   sparse
arc                  randconfig-r2311-20261111    gcc-8.5.0  sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          bcm2835_defconfig    gcc-16.2.0
arm                      davinci_all_defconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                       footbridge_defconfig    gcc-16.2.0
arm                         mvebu_v7_defconfig    clang-24
arm                         mvebu_v7_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261111    gcc-15.3.0
arm                   randconfig-1001-20261111    gcc-15.3.0
arm                   randconfig-1002-20261111    gcc-15.3.0
arm                   randconfig-1003-20261111    gcc-15.3.0
arm                   randconfig-2000-20261110    clang-24
arm                   randconfig-2000-20261111    gcc-16.2.0
arm                   randconfig-2001-20261110    clang-24
arm                   randconfig-2001-20261111    gcc-16.2.0
arm                   randconfig-2002-20261110    clang-24
arm                   randconfig-2002-20261111    gcc-16.2.0
arm                   randconfig-2200-20261110    gcc-11.5.0 smatch
arm                   randconfig-2200-20261111    gcc-8.5.0  smatch
arm                  randconfig-r2102-20261110    gcc-12.5.0 cocci
arm                  randconfig-r2103-20261111    gcc-8.5.0  cocci
arm                  randconfig-r2104-20261110    gcc-8.5.0  cocci
arm                  randconfig-r2108-20261110    gcc-8.5.0  cocci
arm                  randconfig-r2304-20261110    gcc-10.5.0 sparse
arm                  randconfig-r2305-20261111    gcc-16.2.0 sparse
arm                  randconfig-r2308-20261111    gcc-8.5.0  sparse
arm                  randconfig-r2310-20261111    gcc-8.5.0  sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261111    gcc-13.5.0
arm64                 randconfig-1001-20261111    gcc-13.5.0
arm64                 randconfig-1002-20261111    gcc-13.5.0
arm64                 randconfig-1003-20261111    gcc-13.5.0
arm64                 randconfig-2000-20261110    clang-24
arm64                 randconfig-2000-20261111    gcc-16.2.0
arm64                 randconfig-2001-20261110    clang-24
arm64                 randconfig-2001-20261111    gcc-16.2.0
arm64                 randconfig-2002-20261110    clang-24
arm64                 randconfig-2002-20261111    gcc-16.2.0
arm64                 randconfig-2200-20261110    clang-24   smatch
arm64                 randconfig-2200-20261111    gcc-11.5.0 smatch
arm64                randconfig-r2101-20261110    gcc-8.5.0  cocci
arm64                randconfig-r2102-20261110    clang-22   cocci
arm64                randconfig-r2106-20261110    clang-24   cocci
arm64                randconfig-r2106-20261111    gcc-9.5.0  cocci
arm64                randconfig-r2108-20261110    clang-24   cocci
arm64                randconfig-r2110-20261110    clang-19   cocci
arm64                randconfig-r2302-20261110    clang-24   sparse
arm64                randconfig-r2304-20261110    clang-24   sparse
arm64                randconfig-r2307-20261110    clang-24   sparse
arm64                randconfig-r2309-20261110    clang-24   sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261111    gcc-13.5.0
csky                  randconfig-1001-20261111    gcc-13.5.0
csky                  randconfig-2000-20261110    gcc-11.5.0
csky                  randconfig-2000-20261111    gcc-16.2.0
csky                  randconfig-2001-20261110    gcc-11.5.0
csky                  randconfig-2001-20261111    gcc-16.2.0
csky                  randconfig-2200-20261110    gcc-16.2.0 smatch
csky                  randconfig-2200-20261111    gcc-16.2.0 smatch
csky                 randconfig-r2100-20261111    gcc-8.5.0  cocci
csky                 randconfig-r2102-20261111    gcc-8.5.0  cocci
csky                 randconfig-r2103-20261110    clang-22   cocci
csky                 randconfig-r2108-20261110    clang-19   cocci
csky                 randconfig-r2110-20261110    clang-24   cocci
csky                 randconfig-r2110-20261111    gcc-11.5.0 cocci
csky                 randconfig-r2300-20261110    gcc-16.2.0 sparse
csky                 randconfig-r2301-20261110    gcc-8.5.0  sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261111    clang-17
hexagon               randconfig-1001-20261111    clang-17
hexagon               randconfig-2000-20261110    gcc-11.5.0
hexagon               randconfig-2000-20261111    gcc-16.2.0
hexagon               randconfig-2001-20261110    gcc-11.5.0
hexagon               randconfig-2001-20261111    gcc-16.2.0
hexagon               randconfig-2200-20261110    clang-24   smatch
hexagon               randconfig-2200-20261111    clang-24   smatch
hexagon              randconfig-r2111-20261110    clang-24   cocci
hexagon              randconfig-r2111-20261111    gcc-12.5.0 cocci
hexagon              randconfig-r2308-20261110    clang-24   sparse
hexagon              randconfig-r2308-20261111    clang-24   sparse
hexagon              randconfig-r2309-20261110    gcc-15.3.0 sparse
hexagon              randconfig-r2311-20261111    gcc-11.5.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261111    clang-22
i386        buildonly-randconfig-1001-20261111    clang-22
i386        buildonly-randconfig-1002-20261111    clang-22
i386        buildonly-randconfig-1003-20261111    clang-22
i386        buildonly-randconfig-1004-20261111    clang-22
i386        buildonly-randconfig-1005-20261111    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261111    gcc-13
i386                  randconfig-1001-20261111    gcc-13
i386                  randconfig-1002-20261111    gcc-13
i386                  randconfig-1003-20261111    gcc-13
i386                  randconfig-1004-20261111    gcc-13
i386                  randconfig-1005-20261111    gcc-13
i386                  randconfig-1006-20261111    gcc-13
i386                  randconfig-1007-20261111    clang-22
i386                  randconfig-1008-20261111    clang-22
i386                  randconfig-1009-20261111    clang-22
i386                  randconfig-1010-20261111    clang-22
i386                  randconfig-1011-20261111    clang-22
i386                  randconfig-1012-20261111    clang-22
i386                  randconfig-1013-20261111    clang-22
i386                  randconfig-2000-20261110    clang-22
i386                  randconfig-2000-20261111    gcc-14
i386                  randconfig-2001-20261110    clang-22
i386                  randconfig-2001-20261111    gcc-14
i386                  randconfig-2002-20261110    clang-22
i386                  randconfig-2002-20261111    gcc-14
i386                  randconfig-2003-20261110    clang-22
i386                  randconfig-2003-20261111    gcc-14
i386                  randconfig-2004-20261110    clang-22
i386                  randconfig-2004-20261111    gcc-14
i386                  randconfig-2005-20261110    clang-22
i386                  randconfig-2005-20261111    gcc-14
i386                  randconfig-2100-20261110    gcc-14     cocci
i386                  randconfig-2100-20261111    gcc-14     cocci
i386                  randconfig-2101-20261110    gcc-14     cocci
i386                  randconfig-2101-20261111    gcc-14     cocci
i386                  randconfig-2102-20261110    gcc-14     cocci
i386                  randconfig-2102-20261111    gcc-14     cocci
i386                  randconfig-2103-20261110    gcc-14     cocci
i386                  randconfig-2103-20261111    gcc-14     cocci
i386                  randconfig-2104-20261110    gcc-14     cocci
i386                  randconfig-2104-20261111    gcc-14     cocci
i386                  randconfig-2105-20261110    gcc-14     cocci
i386                  randconfig-2105-20261111    gcc-14     cocci
i386                  randconfig-2200-20261110    gcc-13     smatch
i386                  randconfig-2200-20261111    gcc-14     smatch
i386                  randconfig-2300-20261110    clang-22   sparse
i386                  randconfig-2300-20261111    gcc-14     sparse
i386                  randconfig-2301-20261110    clang-22   sparse
i386                  randconfig-2301-20261111    gcc-14     sparse
i386                  randconfig-2302-20261110    clang-22   sparse
i386                  randconfig-2302-20261111    gcc-14     sparse
i386                 randconfig-r2100-20261110    clang-22   cocci
i386                 randconfig-r2104-20261111    gcc-8.5.0  cocci
i386                 randconfig-r2106-20261111    gcc-8.5.0  cocci
i386                 randconfig-r2109-20261111    clang-24   cocci
i386                 randconfig-r2307-20261111    clang-24   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261111    clang-17
loongarch             randconfig-1001-20261111    clang-17
loongarch             randconfig-2000-20261110    gcc-11.5.0
loongarch             randconfig-2000-20261111    gcc-11.5.0
loongarch             randconfig-2001-20261110    gcc-11.5.0
loongarch             randconfig-2001-20261111    gcc-11.5.0
loongarch             randconfig-2200-20261110    clang-24   smatch
loongarch             randconfig-2200-20261111    gcc-16.2.0 smatch
loongarch            randconfig-r2103-20261110    gcc-12.5.0 cocci
loongarch            randconfig-r2103-20261111    gcc-8.5.0  cocci
loongarch            randconfig-r2107-20261110    clang-19   cocci
loongarch            randconfig-r2109-20261111    gcc-9.5.0  cocci
loongarch            randconfig-r2303-20261110    gcc-8.5.0  sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                              allyesconfig    gcc-16.2.0
m68k                          amcore_defconfig    gcc-16.2.0
m68k                           atari_defconfig    gcc-16.2.0
m68k                                 defconfig    clang-24
m68k                  randconfig-2000-20261110    gcc-12.5.0
m68k                  randconfig-2000-20261111    gcc-8.5.0
m68k                  randconfig-2001-20261110    gcc-12.5.0
m68k                  randconfig-2001-20261111    gcc-8.5.0
m68k                  randconfig-2200-20261110    gcc-16.2.0 smatch
m68k                  randconfig-2200-20261111    gcc-9.5.0  smatch
m68k                 randconfig-r2102-20261111    gcc-8.5.0  cocci
m68k                 randconfig-r2103-20261110    gcc-8.5.0  cocci
m68k                 randconfig-r2105-20261111    gcc-8.5.0  cocci
m68k                 randconfig-r2107-20261111    gcc-9.5.0  cocci
m68k                 randconfig-r2108-20261111    gcc-11.5.0 cocci
m68k                 randconfig-r2111-20261110    clang-19   cocci
m68k                 randconfig-r2111-20261111    gcc-8.5.0  cocci
m68k                 randconfig-r2300-20261110    gcc-8.5.0  sparse
m68k                 randconfig-r2301-20261111    clang-24   sparse
m68k                 randconfig-r2302-20261110    gcc-16.2.0 sparse
m68k                 randconfig-r2304-20261110    gcc-16.2.0 sparse
m68k                 randconfig-r2304-20261111    clang-24   sparse
m68k                 randconfig-r2311-20261110    clang-24   sparse
m68k                 randconfig-r2311-20261110    gcc-11.5.0 sparse
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261111    gcc-8.5.0
microblaze            randconfig-2001-20261110    gcc-12.5.0
microblaze            randconfig-2001-20261111    gcc-8.5.0
microblaze            randconfig-2200-20261110    gcc-8.5.0  smatch
microblaze            randconfig-2200-20261111    gcc-8.5.0  smatch
microblaze           randconfig-r2107-20261110    gcc-8.5.0  cocci
microblaze           randconfig-r2107-20261111    clang-24   cocci
microblaze           randconfig-r2111-20261111    gcc-10.5.0 cocci
microblaze           randconfig-r2302-20261111    gcc-8.5.0  sparse
microblaze           randconfig-r2307-20261110    gcc-15.3.0 sparse
microblaze           randconfig-r2308-20261111    gcc-16.2.0 sparse
microblaze           randconfig-r2309-20261111    gcc-16.2.0 sparse
microblaze           randconfig-r2310-20261110    clang-24   sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                      cu1830-neo_defconfig    gcc-16.2.0
mips                      decstation_defconfig    gcc-16.2.0
mips                           eyeq6_defconfig    clang-24
mips                             gpr_defconfig    clang-24
mips                        lemote2f_defconfig    clang-24
mips                      loongson2k_defconfig    gcc-16.2.0
mips                            mtx1_defconfig    clang-24
mips                  randconfig-2000-20261110    gcc-16.2.0
mips                  randconfig-2000-20261111    gcc-10.5.0
mips                  randconfig-2001-20261110    gcc-16.2.0
mips                  randconfig-2001-20261111    gcc-10.5.0
mips                  randconfig-2002-20261110    gcc-16.2.0
mips                  randconfig-2002-20261111    gcc-10.5.0
mips                  randconfig-2200-20261110    clang-17   smatch
mips                  randconfig-2200-20261111    clang-19   smatch
mips                 randconfig-r2104-20261110    gcc-12.5.0 cocci
mips                 randconfig-r2106-20261111    clang-24   cocci
mips                 randconfig-r2109-20261111    gcc-10.5.0 cocci
mips                 randconfig-r2109-20261111    gcc-11.5.0 cocci
mips                 randconfig-r2110-20261110    gcc-8.5.0  cocci
mips                 randconfig-r2300-20261110    gcc-16.2.0 sparse
mips                 randconfig-r2300-20261111    gcc-8.5.0  sparse
mips                 randconfig-r2303-20261110    clang-24   sparse
mips                 randconfig-r2303-20261111    clang-24   sparse
mips                 randconfig-r2305-20261110    gcc-8.5.0  sparse
mips                 randconfig-r2308-20261110    gcc-11.5.0 sparse
mips                 randconfig-r2309-20261110    clang-24   sparse
mips                 randconfig-r2310-20261111    gcc-11.5.0 sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261111    clang-17
nios2                 randconfig-1001-20261111    clang-17
nios2                 randconfig-2000-20261110    gcc-11.5.0
nios2                 randconfig-2000-20261111    gcc-11.5.0
nios2                 randconfig-2001-20261110    gcc-11.5.0
nios2                 randconfig-2001-20261111    gcc-11.5.0
nios2                 randconfig-2200-20261110    gcc-11.5.0 smatch
nios2                 randconfig-2200-20261111    gcc-8.5.0  smatch
nios2                randconfig-r2101-20261110    gcc-12.5.0 cocci
nios2                randconfig-r2101-20261111    gcc-8.5.0  cocci
nios2                randconfig-r2104-20261111    gcc-10.5.0 cocci
nios2                randconfig-r2105-20261111    gcc-8.5.0  cocci
openrisc                          alldefconfig    gcc-16.2.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261110    gcc-16.2.0
openrisc              randconfig-2000-20261111    gcc-10.5.0
openrisc              randconfig-2001-20261110    gcc-16.2.0
openrisc              randconfig-2001-20261111    gcc-10.5.0
openrisc              randconfig-2002-20261110    gcc-16.2.0
openrisc              randconfig-2002-20261111    gcc-10.5.0
openrisc              randconfig-2200-20261110    gcc-9.5.0  smatch
openrisc              randconfig-2200-20261111    gcc-16.2.0 smatch
openrisc             randconfig-r2105-20261111    gcc-8.5.0  cocci
openrisc             randconfig-r2106-20261111    gcc-10.5.0 cocci
openrisc             randconfig-r2109-20261110    clang-24   cocci
openrisc             randconfig-r2111-20261110    gcc-8.5.0  cocci
openrisc             randconfig-r2301-20261110    gcc-16.2.0 sparse
openrisc             randconfig-r2302-20261110    gcc-16.2.0 sparse
openrisc             randconfig-r2302-20261111    gcc-16.2.0 sparse
openrisc             randconfig-r2305-20261110    gcc-10.5.0 sparse
openrisc             randconfig-r2306-20261111    gcc-16.2.0 sparse
openrisc             randconfig-r2309-20261111    clang-24   sparse
openrisc             randconfig-r2311-20261111    gcc-14     sparse
parisc                            alldefconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261111    gcc-15.3.0
parisc                randconfig-1001-20261111    gcc-15.3.0
parisc                randconfig-2000-20261110    gcc-11.5.0
parisc                randconfig-2000-20261111    gcc-11.5.0
parisc                randconfig-2001-20261110    gcc-11.5.0
parisc                randconfig-2001-20261111    gcc-11.5.0
parisc                randconfig-2200-20261110    gcc-15.3.0 smatch
parisc                randconfig-2200-20261111    gcc-14.4.0 smatch
parisc               randconfig-r2101-20261111    gcc-8.5.0  cocci
parisc               randconfig-r2105-20261111    gcc-10.5.0 cocci
parisc               randconfig-r2108-20261111    gcc-12.5.0 cocci
parisc               randconfig-r2303-20261111    gcc-16.2.0 sparse
parisc               randconfig-r2305-20261111    gcc-8.5.0  sparse
parisc               randconfig-r2311-20261111    clang-24   sparse
parisc64                          alldefconfig    clang-24
parisc64                          alldefconfig    gcc-16.2.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                        eiger_defconfig    gcc-16.2.0
powerpc                         icon_defconfig    gcc-16.2.0
powerpc                   iss476-smp_defconfig    gcc-16.2.0
powerpc                    microwatt_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261111    gcc-15.3.0
powerpc               randconfig-1001-20261111    gcc-15.3.0
powerpc               randconfig-2000-20261110    gcc-10.5.0
powerpc               randconfig-2000-20261111    gcc-11.5.0
powerpc               randconfig-2001-20261110    gcc-10.5.0
powerpc               randconfig-2001-20261111    gcc-11.5.0
powerpc               randconfig-2002-20261110    gcc-10.5.0
powerpc               randconfig-2002-20261111    gcc-11.5.0
powerpc               randconfig-2200-20261110    clang-24   smatch
powerpc               randconfig-2200-20261111    gcc-13.5.0 smatch
powerpc              randconfig-r2103-20261111    gcc-10.5.0 cocci
powerpc              randconfig-r2108-20261110    clang-24   cocci
powerpc              randconfig-r2109-20261110    gcc-8.5.0  cocci
powerpc              randconfig-r2111-20261110    clang-24   cocci
powerpc              randconfig-r2303-20261110    gcc-16.2.0 sparse
powerpc              randconfig-r2305-20261110    gcc-16.2.0 sparse
powerpc              randconfig-r2306-20261110    clang-24   sparse
powerpc              randconfig-r2307-20261111    gcc-11.5.0 sparse
powerpc                      tqm8555_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261111    gcc-15.3.0
powerpc64             randconfig-1001-20261111    gcc-15.3.0
powerpc64             randconfig-2000-20261110    gcc-10.5.0
powerpc64             randconfig-2000-20261111    gcc-11.5.0
powerpc64             randconfig-2001-20261110    gcc-10.5.0
powerpc64             randconfig-2001-20261111    gcc-11.5.0
powerpc64             randconfig-2002-20261110    gcc-10.5.0
powerpc64             randconfig-2002-20261111    gcc-11.5.0
powerpc64             randconfig-2200-20261110    clang-24   smatch
powerpc64             randconfig-2200-20261111    gcc-11.5.0 smatch
powerpc64            randconfig-r2101-20261111    gcc-10.5.0 cocci
powerpc64            randconfig-r2103-20261111    gcc-8.5.0  cocci
powerpc64            randconfig-r2106-20261111    gcc-11.5.0 cocci
powerpc64            randconfig-r2109-20261111    gcc-8.5.0  cocci
powerpc64            randconfig-r2111-20261111    gcc-11.5.0 cocci
powerpc64            randconfig-r2300-20261111    gcc-16.2.0 sparse
powerpc64            randconfig-r2302-20261111    clang-24   sparse
powerpc64            randconfig-r2307-20261110    gcc-11.5.0 sparse
powerpc64            randconfig-r2308-20261110    gcc-15.3.0 sparse
powerpc64            randconfig-r2310-20261110    clang-24   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261111    clang-17
riscv                 randconfig-1001-20261111    clang-17
riscv                 randconfig-2000-20261110    gcc-12.5.0
riscv                 randconfig-2000-20261111    clang-21
riscv                 randconfig-2001-20261110    gcc-12.5.0
riscv                 randconfig-2001-20261111    clang-21
riscv                 randconfig-2002-20261110    gcc-12.5.0
riscv                 randconfig-2002-20261111    clang-21
riscv                 randconfig-2003-20261110    gcc-12.5.0
riscv                 randconfig-2003-20261111    clang-21
riscv                 randconfig-2004-20261110    gcc-12.5.0
riscv                 randconfig-2004-20261111    clang-21
riscv                 randconfig-2005-20261110    gcc-12.5.0
riscv                 randconfig-2005-20261111    clang-21
riscv                 randconfig-2200-20261110    gcc-8.5.0  smatch
riscv                randconfig-r2105-20261110    gcc-8.5.0  cocci
riscv                randconfig-r2106-20261110    gcc-8.5.0  cocci
riscv                randconfig-r2107-20261111    gcc-12.5.0 cocci
riscv                randconfig-r2108-20261111    gcc-8.5.0  cocci
riscv                randconfig-r2110-20261111    gcc-8.5.0  cocci
riscv                randconfig-r2304-20261110    gcc-8.5.0  sparse
riscv                randconfig-r2304-20261111    gcc-16.2.0 sparse
riscv                randconfig-r2304-20261111    gcc-8.5.0  sparse
riscv                randconfig-r2305-20261111    clang-24   sparse
riscv                randconfig-r2306-20261111    gcc-11.5.0 sparse
riscv                randconfig-r2311-20261110    gcc-15.3.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261111    clang-17
s390                  randconfig-1001-20261111    clang-17
s390                  randconfig-2000-20261110    clang-20
s390                  randconfig-2000-20261111    gcc-8.5.0
s390                  randconfig-2001-20261110    clang-20
s390                  randconfig-2001-20261111    gcc-8.5.0
s390                  randconfig-2002-20261110    clang-20
s390                  randconfig-2002-20261111    gcc-8.5.0
s390                  randconfig-2003-20261110    clang-20
s390                  randconfig-2003-20261111    gcc-8.5.0
s390                  randconfig-2004-20261110    clang-20
s390                  randconfig-2004-20261111    gcc-8.5.0
s390                  randconfig-2005-20261110    clang-20
s390                  randconfig-2005-20261111    gcc-8.5.0
s390                  randconfig-2200-20261110    clang-18   smatch
s390                 randconfig-r2104-20261110    clang-22   cocci
s390                 randconfig-r2104-20261111    gcc-8.5.0  cocci
s390                 randconfig-r2106-20261110    clang-19   cocci
s390                 randconfig-r2107-20261110    clang-24   cocci
s390                 randconfig-r2108-20261111    clang-24   cocci
s390                 randconfig-r2110-20261111    gcc-12.5.0 cocci
s390                 randconfig-r2300-20261110    clang-24   sparse
s390                 randconfig-r2305-20261111    gcc-8.5.0  sparse
s390                 randconfig-r2306-20261111    gcc-8.5.0  sparse
s390                 randconfig-r2308-20261110    clang-24   sparse
s390                 randconfig-r2310-20261111    clang-24   sparse
s390                 randconfig-r2311-20261110    clang-24   sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                 ecovec24-romimage_defconfig    gcc-16.2.0
sh                  kfr2r09-romimage_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261111    clang-17
sh                    randconfig-1001-20261111    clang-17
sh                    randconfig-2000-20261110    gcc-9.5.0
sh                    randconfig-2000-20261111    gcc-16.2.0
sh                    randconfig-2001-20261110    gcc-9.5.0
sh                    randconfig-2001-20261111    gcc-16.2.0
sh                    randconfig-2002-20261110    gcc-9.5.0
sh                    randconfig-2002-20261111    gcc-16.2.0
sh                    randconfig-2003-20261110    gcc-9.5.0
sh                    randconfig-2003-20261111    gcc-16.2.0
sh                    randconfig-2004-20261110    gcc-9.5.0
sh                    randconfig-2004-20261111    gcc-16.2.0
sh                    randconfig-2005-20261110    gcc-9.5.0
sh                    randconfig-2005-20261111    gcc-16.2.0
sh                    randconfig-2200-20261110    gcc-16.2.0 smatch
sh                    randconfig-2200-20261111    gcc-16.2.0 smatch
sh                   randconfig-r2105-20261110    gcc-12.5.0 cocci
sh                   randconfig-r2108-20261111    gcc-9.5.0  cocci
sh                   randconfig-r2111-20261111    clang-24   cocci
sh                   randconfig-r2301-20261111    gcc-8.5.0  sparse
sh                   randconfig-r2302-20261110    gcc-10.5.0 sparse
sh                   randconfig-r2304-20261111    gcc-8.5.0  sparse
sh                   randconfig-r2305-20261110    clang-24   sparse
sh                   randconfig-r2307-20261111    gcc-8.5.0  sparse
sh                   randconfig-r2310-20261111    gcc-14     sparse
sh                            se7722_defconfig    gcc-16.2.0
sh                    secureedge5410_defconfig    gcc-16.2.0
sh                               ul2_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261111    gcc-16.2.0
sparc                 randconfig-1001-20261111    gcc-16.2.0
sparc                 randconfig-2000-20261110    gcc-14
sparc                 randconfig-2000-20261111    clang-18
sparc                 randconfig-2001-20261110    gcc-14
sparc                 randconfig-2001-20261111    clang-18
sparc                 randconfig-2200-20261110    gcc-13.5.0 smatch
sparc                 randconfig-2200-20261111    gcc-12.5.0 smatch
sparc                randconfig-r2101-20261110    clang-22   cocci
sparc                randconfig-r2107-20261110    clang-24   cocci
sparc                randconfig-r2107-20261111    gcc-8.5.0  cocci
sparc                randconfig-r2109-20261110    clang-19   cocci
sparc                randconfig-r2109-20261111    gcc-12.5.0 cocci
sparc                randconfig-r2306-20261110    gcc-15.3.0 sparse
sparc                randconfig-r2307-20261110    clang-24   sparse
sparc                randconfig-r2309-20261110    gcc-11.5.0 sparse
sparc                randconfig-r2310-20261111    gcc-16.2.0 sparse
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261111    gcc-16.2.0
sparc64               randconfig-1001-20261111    gcc-16.2.0
sparc64               randconfig-2000-20261110    gcc-14
sparc64               randconfig-2000-20261111    clang-18
sparc64               randconfig-2001-20261110    gcc-14
sparc64               randconfig-2001-20261111    clang-18
sparc64               randconfig-2200-20261110    clang-24   smatch
sparc64               randconfig-2200-20261111    gcc-9.5.0  smatch
sparc64              randconfig-r2100-20261111    gcc-10.5.0 cocci
sparc64              randconfig-r2100-20261111    gcc-8.5.0  cocci
sparc64              randconfig-r2101-20261111    gcc-8.5.0  cocci
sparc64              randconfig-r2110-20261111    clang-24   cocci
sparc64              randconfig-r2110-20261111    gcc-9.5.0  cocci
sparc64              randconfig-r2303-20261110    gcc-10.5.0 sparse
sparc64              randconfig-r2309-20261111    gcc-11.5.0 sparse
sparc64              randconfig-r2309-20261111    gcc-8.5.0  sparse
sparc64              randconfig-r2310-20261110    gcc-15.3.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261111    gcc-16.2.0
um                    randconfig-1001-20261111    gcc-16.2.0
um                    randconfig-2000-20261110    gcc-14
um                    randconfig-2000-20261111    clang-18
um                    randconfig-2001-20261110    gcc-14
um                    randconfig-2001-20261111    clang-18
um                    randconfig-2200-20261110    gcc-14     smatch
um                    randconfig-2200-20261111    clang-24   smatch
um                   randconfig-r2102-20261111    gcc-8.5.0  cocci
um                   randconfig-r2105-20261110    clang-22   cocci
um                   randconfig-r2106-20261111    gcc-12.5.0 cocci
um                   randconfig-r2107-20261111    gcc-11.5.0 cocci
um                   randconfig-r2301-20261111    gcc-16.2.0 sparse
um                   randconfig-r2302-20261111    gcc-8.5.0  sparse
um                   randconfig-r2306-20261110    clang-24   sparse
um                   randconfig-r2307-20261111    gcc-16.2.0 sparse
um                   randconfig-r2309-20261110    clang-24   sparse
um                   randconfig-r2310-20261110    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261111    gcc-14
x86_64      buildonly-randconfig-1001-20261111    gcc-14
x86_64      buildonly-randconfig-1002-20261111    gcc-14
x86_64      buildonly-randconfig-1003-20261111    gcc-14
x86_64      buildonly-randconfig-1004-20261111    gcc-14
x86_64      buildonly-randconfig-1005-20261111    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261111    clang-22
x86_64                randconfig-1001-20261111    clang-22
x86_64                randconfig-1002-20261111    clang-22
x86_64                randconfig-1003-20261111    clang-22
x86_64                randconfig-1004-20261111    clang-22
x86_64                randconfig-1005-20261111    clang-22
x86_64                randconfig-1006-20261111    clang-22
x86_64                randconfig-1007-20261111    clang-22
x86_64                randconfig-1008-20261111    clang-22
x86_64                randconfig-1009-20261111    clang-22
x86_64                randconfig-1010-20261111    clang-22
x86_64                randconfig-1011-20261111    clang-22
x86_64                randconfig-1012-20261111    gcc-14
x86_64                randconfig-1013-20261111    gcc-14
x86_64                randconfig-1014-20261111    gcc-14
x86_64                randconfig-1015-20261111    gcc-14
x86_64                randconfig-1016-20261111    gcc-14
x86_64                randconfig-1017-20261111    gcc-14
x86_64                randconfig-2000-20261110    clang-22
x86_64                randconfig-2000-20261111    clang-22
x86_64                randconfig-2001-20261110    clang-22
x86_64                randconfig-2001-20261111    clang-22
x86_64                randconfig-2002-20261110    clang-22
x86_64                randconfig-2002-20261111    clang-22
x86_64                randconfig-2003-20261110    clang-22
x86_64                randconfig-2003-20261111    clang-22
x86_64                randconfig-2004-20261110    clang-22
x86_64                randconfig-2004-20261111    clang-22
x86_64                randconfig-2005-20261110    clang-22
x86_64                randconfig-2005-20261111    clang-22
x86_64                randconfig-2100-20261110    clang-22   cocci
x86_64                randconfig-2100-20261111    clang-22   cocci
x86_64                randconfig-2101-20261110    clang-22   cocci
x86_64                randconfig-2101-20261111    clang-22   cocci
x86_64                randconfig-2102-20261110    clang-22   cocci
x86_64                randconfig-2102-20261111    clang-22   cocci
x86_64                randconfig-2103-20261110    clang-22   cocci
x86_64                randconfig-2103-20261111    clang-22   cocci
x86_64                randconfig-2104-20261110    clang-22   cocci
x86_64                randconfig-2104-20261111    clang-22   cocci
x86_64                randconfig-2105-20261110    clang-22   cocci
x86_64                randconfig-2105-20261111    clang-22   cocci
x86_64                randconfig-2200-20261110    gcc-14     smatch
x86_64                randconfig-2200-20261111    gcc-14     smatch
x86_64                randconfig-2300-20261110    clang-22   sparse
x86_64                randconfig-2300-20261111    gcc-14     sparse
x86_64                randconfig-2301-20261110    clang-22   sparse
x86_64                randconfig-2301-20261111    gcc-14     sparse
x86_64                randconfig-2302-20261110    clang-22   sparse
x86_64                randconfig-2302-20261111    gcc-14     sparse
x86_64               randconfig-r2102-20261111    gcc-10.5.0 cocci
x86_64               randconfig-r2108-20261111    gcc-10.5.0 cocci
x86_64               randconfig-r2303-20261111    gcc-8.5.0  sparse
x86_64               randconfig-r2306-20261111    gcc-14     sparse
x86_64               randconfig-r2311-20261111    gcc-16.2.0 sparse
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
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261111    gcc-16.2.0
xtensa                randconfig-1001-20261111    gcc-16.2.0
xtensa                randconfig-2000-20261110    gcc-11.5.0
xtensa                randconfig-2000-20261111    gcc-16.2.0
xtensa                randconfig-2001-20261110    gcc-11.5.0
xtensa                randconfig-2001-20261111    gcc-16.2.0
xtensa                randconfig-2200-20261110    gcc-11.5.0 smatch
xtensa                randconfig-2200-20261111    gcc-8.5.0  smatch
xtensa               randconfig-r2100-20261110    gcc-12.5.0 cocci
xtensa               randconfig-r2100-20261111    gcc-8.5.0  cocci
xtensa               randconfig-r2110-20261110    clang-24   cocci
xtensa               randconfig-r2300-20261111    clang-24   sparse
xtensa               randconfig-r2301-20261110    gcc-16.2.0 sparse
xtensa               randconfig-r2302-20261110    gcc-8.5.0  sparse
xtensa               randconfig-r2304-20261110    gcc-16.2.0 sparse
xtensa               randconfig-r2306-20261110    clang-24   sparse
xtensa               randconfig-r2306-20261110    gcc-11.5.0 sparse
xtensa               randconfig-r2309-20261111    gcc-14     sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
