Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B58286D56
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600650; cv=none; b=XmpfLIfsegt8jW3mvycXRrSidsU6Z5KnSVdq5QVi+gxvHJe6KZvZgzIyzzEHkiOH2AEv61ZOv/eO5+WLil73CENq72NEciS1VM5+S2i9RoYv08BbXrbRa4e+iB3KfM8JRyqQWPxEIekogaFaQG4D6AupTZKWmF/CsvWMtshBR3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600650; c=relaxed/simple;
	bh=LWdnGJxMN8QEC/5hoTQHw2gTlcPilj4XvmjrTx09VTQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ahxu7hNRWVDMcWLZGPbt6FVcAg+wg0/imVwaUmUH+jTYsReicnnvDEDQo5/qW8Wg6PIGqvzoRh7eB2gDusOcG3whljyyD93Utd17RPaMXhyMj8n7xSO/k6PyyR2Zp3mHGtOmsT7sixpTnGU9K7/kvpeYOg1gZl4k8S79IRwzoNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLJ9cmKQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLJ9cmKQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790600646; x=1822136646;
  h=date:from:to:cc:subject:message-id;
  bh=LWdnGJxMN8QEC/5hoTQHw2gTlcPilj4XvmjrTx09VTQ=;
  b=fLJ9cmKQeJc2gbPoLGrzdDh3LrvN4Zz+HW5nXo8FT2FS4uGIta4JLLW8
   23jajAnSDDbwatxeZ9Nb7Yp2icU/vbm5LPwUgqS4SVIfl2qkF94XJtuwh
   4N7vR2+JupRVNKod38/rNDAGL+ZXu0ELDDbK/kp8w/17sThThJQSTa+az
   YK8h9JeNFj0cjaNfkd6FcocvgnpOejVnTZGIjE3pneAfE/5+d/3uZXvOq
   kf/lzFrkzEhlv4rGNDdxWJ0HX1XNMdFvYoPHnXK4q7RYMKDz8UgBiV9Gr
   bsJ3xGVeTKlLzp5RrvTUO5Vnlf+oSIbnhpTbGu/34xGD9JawVtN00lCYj
   w==;
X-CSE-ConnectionGUID: FdTqVqSEQxCOVS9WU+IQpQ==
X-CSE-MsgGUID: IGwtYMaISJuVK3bZix8tvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="102669743"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="102669743"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 06:04:05 -0700
X-CSE-ConnectionGUID: 4V9jWDc0Ry2mImKKIL9L9A==
X-CSE-MsgGUID: 0J/2kBkDQpCHfnfGXPEAwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="312966439"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Sep 2026 06:04:04 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBB1V-00000000NyX-3gvj;
	Mon, 28 Sep 2026 13:04:01 +0000
Date: Mon, 28 Sep 2026 21:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 2dcdfb625c3b8fe87454e19dfbc54b3e3f0ad70e
Message-ID: <202609282142.4wihHfaj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 2dcdfb625c3b8fe87454e19dfbc54b3e3f0ad70e  media: vivid: drop unused 'j' variable

elapsed time: 5506m

configs tested: 687
configs skipped: 18

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r1302-20260925    clang-18   sparse
alpha                randconfig-r2102-20260924    gcc-11.5.0 cocci
alpha                randconfig-r2102-20260927    gcc-8.5.0  cocci
alpha                randconfig-r2103-20260924    gcc-11.5.0 cocci
alpha                randconfig-r2103-20260927    clang-24   cocci
alpha                randconfig-r2106-20260924    gcc-14     cocci
alpha                randconfig-r2106-20260927    gcc-15.2.0 cocci
alpha                randconfig-r2200-20260924    gcc-14.3.0 smatch
alpha                randconfig-r2303-20260927    clang-22   sparse
alpha                randconfig-r2309-20260927    gcc-16.1.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                       axs103_smp_defconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                          haps_hs_defconfig    gcc-16.1.0
arc                   randconfig-1000-20260925    clang-24
arc                   randconfig-1000-20260926    clang-24
arc                   randconfig-1000-20260927    gcc-11.5.0
arc                   randconfig-1000-20260928    clang-24
arc                   randconfig-1001-20260925    clang-24
arc                   randconfig-1001-20260926    clang-24
arc                   randconfig-1001-20260927    gcc-11.5.0
arc                   randconfig-1001-20260928    clang-24
arc                  randconfig-r1301-20260926    gcc-9.5.0  sparse
arc                  randconfig-r1307-20260926    gcc-9.5.0  sparse
arc                  randconfig-r1309-20260925    clang-22   sparse
arc                  randconfig-r2101-20260925    gcc-9.5.0  cocci
arc                  randconfig-r2101-20260927    gcc-9.5.0  cocci
arc                  randconfig-r2103-20260927    gcc-9.5.0  cocci
arc                  randconfig-r2104-20260928    gcc-16.1.0 cocci
arc                  randconfig-r2105-20260924    gcc-10.5.0 cocci
arc                  randconfig-r2107-20260925    gcc-16.1.0 cocci
arc                  randconfig-r2301-20260927    clang-22   sparse
arc                  randconfig-r2303-20260928    clang-24   sparse
arc                  randconfig-r2308-20260927    gcc-16.1.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                        aspeed_g4_defconfig    gcc-16.1.0
arm                          axm55xx_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                            h3600_defconfig    gcc-16.1.0
arm                             hisi_defconfig    clang-24
arm                       jornada720_defconfig    clang-24
arm                         keystone_defconfig    clang-24
arm                        omap2plus_defconfig    gcc-16.1.0
arm                   randconfig-1000-20260925    clang-24
arm                   randconfig-1000-20260926    clang-24
arm                   randconfig-1000-20260927    gcc-11.5.0
arm                   randconfig-1000-20260928    clang-24
arm                   randconfig-1001-20260925    clang-24
arm                   randconfig-1001-20260926    clang-24
arm                   randconfig-1001-20260927    gcc-11.5.0
arm                   randconfig-1001-20260928    clang-24
arm                   randconfig-1002-20260925    clang-24
arm                   randconfig-1002-20260926    clang-24
arm                   randconfig-1002-20260927    gcc-11.5.0
arm                   randconfig-1002-20260928    clang-24
arm                   randconfig-1003-20260925    clang-24
arm                   randconfig-1003-20260926    clang-24
arm                   randconfig-1003-20260927    gcc-11.5.0
arm                   randconfig-1003-20260928    clang-24
arm                  randconfig-r1307-20260926    gcc-8.5.0  sparse
arm                  randconfig-r2104-20260927    clang-22   cocci
arm                  randconfig-r2107-20260927    clang-17   cocci
arm                  randconfig-r2201-20260926    clang-20   smatch
arm                  randconfig-r2300-20260927    clang-22   sparse
arm                  randconfig-r2303-20260927    clang-22   sparse
arm                  randconfig-r2304-20260927    clang-22   sparse
arm                  randconfig-r2304-20260928    clang-24   sparse
arm                            sama5_defconfig    gcc-16.1.0
arm                           sp7021_defconfig    clang-24
arm                         spear3xx_defconfig    gcc-16.1.0
arm                            u8500_defconfig    gcc-11.5.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260925    clang-24
arm64                 randconfig-1000-20260926    gcc-8.5.0
arm64                 randconfig-1001-20260925    clang-24
arm64                 randconfig-1001-20260926    gcc-8.5.0
arm64                 randconfig-1002-20260925    clang-24
arm64                 randconfig-1002-20260926    gcc-8.5.0
arm64                 randconfig-1003-20260925    clang-24
arm64                 randconfig-1003-20260926    gcc-8.5.0
arm64                randconfig-r1303-20260925    clang-18   sparse
arm64                randconfig-r2305-20260927    gcc-15.2.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260925    clang-24
csky                  randconfig-1000-20260926    gcc-8.5.0
csky                  randconfig-1001-20260925    clang-24
csky                  randconfig-1001-20260926    gcc-8.5.0
csky                 randconfig-r1302-20260926    gcc-13.4.0 sparse
csky                 randconfig-r1302-20260926    gcc-9.5.0  sparse
csky                 randconfig-r1309-20260926    gcc-16.1.0 sparse
csky                 randconfig-r1309-20260926    gcc-9.5.0  sparse
csky                 randconfig-r2106-20260927    clang-17   cocci
csky                 randconfig-r2200-20260925    gcc-10.5.0 smatch
csky                 randconfig-r2300-20260927    gcc-15.2.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260925    gcc-9.5.0
hexagon               randconfig-1000-20260926    gcc-10.5.0
hexagon               randconfig-1000-20260927    gcc-11.5.0
hexagon               randconfig-1001-20260925    gcc-9.5.0
hexagon               randconfig-1001-20260926    gcc-10.5.0
hexagon               randconfig-1001-20260927    gcc-11.5.0
hexagon              randconfig-r2103-20260924    gcc-14     cocci
hexagon              randconfig-r2104-20260927    clang-24   cocci
hexagon              randconfig-r2107-20260924    gcc-14     cocci
hexagon              randconfig-r2107-20260927    clang-17   cocci
hexagon              randconfig-r2302-20260927    clang-22   sparse
hexagon              randconfig-r2304-20260927    gcc-15.2.0 sparse
hexagon              randconfig-r2306-20260927    clang-22   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260925    clang-22
i386        buildonly-randconfig-1000-20260926    gcc-14
i386        buildonly-randconfig-1001-20260925    clang-22
i386        buildonly-randconfig-1001-20260926    gcc-14
i386        buildonly-randconfig-1002-20260925    clang-22
i386        buildonly-randconfig-1002-20260926    gcc-14
i386        buildonly-randconfig-1003-20260925    clang-22
i386        buildonly-randconfig-1003-20260926    gcc-14
i386        buildonly-randconfig-1004-20260925    clang-22
i386        buildonly-randconfig-1004-20260926    gcc-14
i386        buildonly-randconfig-1005-20260925    clang-22
i386        buildonly-randconfig-1005-20260926    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260925    clang-22
i386                  randconfig-1000-20260926    gcc-14
i386                  randconfig-1000-20260927    clang-22
i386                  randconfig-1001-20260925    clang-22
i386                  randconfig-1001-20260926    gcc-14
i386                  randconfig-1001-20260927    clang-22
i386                  randconfig-1002-20260925    clang-22
i386                  randconfig-1002-20260926    gcc-14
i386                  randconfig-1002-20260927    clang-22
i386                  randconfig-1003-20260925    clang-22
i386                  randconfig-1003-20260926    gcc-14
i386                  randconfig-1003-20260927    clang-22
i386                  randconfig-1004-20260925    clang-22
i386                  randconfig-1004-20260926    gcc-14
i386                  randconfig-1004-20260927    clang-22
i386                  randconfig-1005-20260925    clang-22
i386                  randconfig-1005-20260926    gcc-14
i386                  randconfig-1005-20260927    clang-22
i386                  randconfig-1006-20260925    clang-22
i386                  randconfig-1006-20260926    gcc-14
i386                  randconfig-1006-20260927    clang-22
i386                  randconfig-1007-20260925    gcc-12
i386                  randconfig-1007-20260926    gcc-14
i386                  randconfig-1007-20260927    gcc-14
i386                  randconfig-1008-20260925    gcc-12
i386                  randconfig-1008-20260926    gcc-14
i386                  randconfig-1008-20260927    gcc-14
i386                  randconfig-1009-20260925    gcc-12
i386                  randconfig-1009-20260926    gcc-14
i386                  randconfig-1009-20260927    gcc-14
i386                  randconfig-1010-20260925    gcc-12
i386                  randconfig-1010-20260926    gcc-14
i386                  randconfig-1010-20260927    gcc-14
i386                  randconfig-1011-20260925    gcc-12
i386                  randconfig-1011-20260926    gcc-14
i386                  randconfig-1011-20260927    gcc-14
i386                  randconfig-1012-20260925    gcc-12
i386                  randconfig-1012-20260926    gcc-14
i386                  randconfig-1012-20260927    gcc-14
i386                  randconfig-1013-20260925    gcc-12
i386                  randconfig-1013-20260926    gcc-14
i386                  randconfig-1013-20260927    gcc-14
i386                  randconfig-1300-20260925    clang-22   sparse
i386                  randconfig-1300-20260926    gcc-13     sparse
i386                  randconfig-1301-20260925    clang-22   sparse
i386                  randconfig-1301-20260926    gcc-13     sparse
i386                  randconfig-1302-20260925    clang-22   sparse
i386                  randconfig-1302-20260926    gcc-13     sparse
i386                  randconfig-2100-20260924    clang-22   cocci
i386                  randconfig-2100-20260924    gcc-14     cocci
i386                  randconfig-2100-20260925    clang-22   cocci
i386                  randconfig-2100-20260926    gcc-14     cocci
i386                  randconfig-2100-20260927    clang-22   cocci
i386                  randconfig-2100-20260928    gcc-14     cocci
i386                  randconfig-2101-20260924    gcc-14     cocci
i386                  randconfig-2101-20260925    clang-22   cocci
i386                  randconfig-2101-20260926    gcc-14     cocci
i386                  randconfig-2101-20260927    clang-22   cocci
i386                  randconfig-2101-20260928    gcc-14     cocci
i386                  randconfig-2102-20260924    clang-22   cocci
i386                  randconfig-2102-20260924    gcc-14     cocci
i386                  randconfig-2102-20260925    clang-22   cocci
i386                  randconfig-2102-20260926    gcc-14     cocci
i386                  randconfig-2102-20260927    clang-22   cocci
i386                  randconfig-2102-20260928    gcc-14     cocci
i386                  randconfig-2103-20260924    gcc-14     cocci
i386                  randconfig-2103-20260925    clang-22   cocci
i386                  randconfig-2103-20260926    gcc-14     cocci
i386                  randconfig-2103-20260927    clang-22   cocci
i386                  randconfig-2103-20260928    gcc-14     cocci
i386                  randconfig-2200-20260924    clang-22   smatch
i386                  randconfig-2200-20260925    gcc-14     smatch
i386                  randconfig-2200-20260927    clang-22   smatch
i386                  randconfig-2200-20260928    clang-22   smatch
i386                  randconfig-2300-20260927    clang-22   sparse
i386                  randconfig-2300-20260928    clang-22   sparse
i386                  randconfig-2301-20260927    clang-22   sparse
i386                  randconfig-2301-20260928    clang-22   sparse
i386                  randconfig-2302-20260927    clang-22   sparse
i386                  randconfig-2302-20260928    clang-22   sparse
i386                 randconfig-r1300-20260926    gcc-8.5.0  sparse
i386                 randconfig-r1307-20260925    clang-22   sparse
i386                 randconfig-r2100-20260924    gcc-14     cocci
i386                 randconfig-r2102-20260927    gcc-9.5.0  cocci
i386                 randconfig-r2107-20260927    clang-24   cocci
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260925    gcc-9.5.0
loongarch             randconfig-1000-20260926    gcc-10.5.0
loongarch             randconfig-1000-20260927    gcc-11.5.0
loongarch             randconfig-1001-20260925    gcc-9.5.0
loongarch             randconfig-1001-20260926    gcc-10.5.0
loongarch             randconfig-1001-20260927    gcc-11.5.0
loongarch            randconfig-r1305-20260925    clang-18   sparse
loongarch            randconfig-r1306-20260925    clang-22   sparse
loongarch            randconfig-r1308-20260925    clang-22   sparse
loongarch            randconfig-r1309-20260926    gcc-8.5.0  sparse
loongarch            randconfig-r2201-20260924    gcc-13.4.0 smatch
loongarch            randconfig-r2306-20260927    gcc-16.1.0 sparse
loongarch            randconfig-r2308-20260926    clang-22   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                           hp300_defconfig    gcc-16.1.0
m68k                        m5475evb_defconfig    gcc-16.1.0
m68k                             q40_defconfig    gcc-16.1.0
m68k                 randconfig-r1304-20260926    gcc-8.5.0  sparse
m68k                 randconfig-r1305-20260926    gcc-9.5.0  sparse
m68k                 randconfig-r1308-20260926    gcc-16.1.0 sparse
m68k                 randconfig-r2101-20260924    gcc-14     cocci
m68k                 randconfig-r2102-20260926    clang-24   cocci
m68k                 randconfig-r2105-20260927    gcc-15.2.0 cocci
m68k                 randconfig-r2106-20260924    gcc-10.5.0 cocci
m68k                 randconfig-r2201-20260924    gcc-8.5.0  smatch
m68k                 randconfig-r2301-20260927    clang-22   sparse
m68k                 randconfig-r2301-20260927    gcc-15.2.0 sparse
m68k                            sun3_defconfig    clang-24
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2100-20260927    clang-24   cocci
microblaze           randconfig-r2101-20260924    gcc-11.5.0 cocci
microblaze           randconfig-r2102-20260924    gcc-8.5.0  cocci
microblaze           randconfig-r2106-20260927    gcc-12.5.0 cocci
microblaze           randconfig-r2106-20260928    gcc-16.1.0 cocci
microblaze           randconfig-r2107-20260924    gcc-10.5.0 cocci
microblaze           randconfig-r2202-20260927    gcc-13.4.0 smatch
microblaze           randconfig-r2300-20260927    clang-22   sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                           ath25_defconfig    gcc-11.5.0
mips                            ci20_defconfig    clang-24
mips                      cu1000-neo_defconfig    gcc-16.1.0
mips                 econet_en751221_defconfig    gcc-16.1.0
mips                           eyeq6_defconfig    gcc-16.1.0
mips                       fuloong2e_defconfig    gcc-16.1.0
mips                            ip27_defconfig    gcc-16.1.0
mips                      loongson2k_defconfig    gcc-16.1.0
mips                       maltasmvp_defconfig    gcc-16.1.0
mips                         omega2p_defconfig    gcc-16.1.0
mips                 randconfig-r2101-20260924    clang-21   cocci
mips                 randconfig-r2103-20260927    gcc-8.5.0  cocci
mips                 randconfig-r2200-20260926    gcc-15.2.0 smatch
mips                 randconfig-r2202-20260926    clang-17   smatch
mips                 randconfig-r2305-20260927    clang-22   sparse
mips                           rm200_defconfig    gcc-16.1.0
nios2                             alldefconfig    gcc-11.5.0
nios2                             alldefconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260925    gcc-9.5.0
nios2                 randconfig-1000-20260926    gcc-10.5.0
nios2                 randconfig-1000-20260927    gcc-11.5.0
nios2                 randconfig-1001-20260925    gcc-9.5.0
nios2                 randconfig-1001-20260926    gcc-10.5.0
nios2                 randconfig-1001-20260927    gcc-11.5.0
nios2                randconfig-r1305-20260926    gcc-13.4.0 sparse
nios2                randconfig-r2100-20260927    gcc-9.5.0  cocci
nios2                randconfig-r2105-20260924    gcc-14     cocci
nios2                randconfig-r2202-20260928    gcc-11.5.0 smatch
nios2                randconfig-r2303-20260927    clang-22   sparse
nios2                randconfig-r2303-20260927    gcc-15.2.0 sparse
nios2                randconfig-r2307-20260926    clang-22   sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r1308-20260926    gcc-8.5.0  sparse
openrisc             randconfig-r2101-20260927    gcc-13.4.0 cocci
openrisc             randconfig-r2104-20260924    gcc-10.5.0 cocci
openrisc             randconfig-r2106-20260927    clang-24   cocci
openrisc             randconfig-r2200-20260924    gcc-13.4.0 smatch
openrisc             randconfig-r2200-20260927    gcc-16.1.0 smatch
openrisc             randconfig-r2302-20260928    clang-24   sparse
openrisc             randconfig-r2305-20260928    clang-24   sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                            allyesconfig    gcc-16.1.0
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260925    clang-24
parisc                randconfig-1000-20260926    clang-24
parisc                randconfig-1000-20260927    clang-24
parisc                randconfig-1001-20260925    clang-24
parisc                randconfig-1001-20260926    clang-24
parisc                randconfig-1001-20260927    clang-24
parisc               randconfig-r1300-20260925    clang-18   sparse
parisc               randconfig-r2100-20260927    gcc-8.5.0  cocci
parisc               randconfig-r2103-20260927    gcc-13.4.0 cocci
parisc               randconfig-r2104-20260926    gcc-8.5.0  cocci
parisc               randconfig-r2200-20260928    gcc-8.5.0  smatch
parisc               randconfig-r2300-20260927    clang-22   sparse
parisc               randconfig-r2300-20260928    clang-24   sparse
parisc               randconfig-r2309-20260926    clang-22   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                  canyonlands_defconfig    gcc-11.5.0
powerpc                    currituck_defconfig    gcc-16.1.0
powerpc                   mpc885_ads_defconfig    gcc-16.1.0
powerpc                      rainier_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20260925    clang-24
powerpc               randconfig-1000-20260926    clang-24
powerpc               randconfig-1000-20260927    clang-24
powerpc               randconfig-1001-20260925    clang-24
powerpc               randconfig-1001-20260926    clang-24
powerpc               randconfig-1001-20260927    clang-24
powerpc              randconfig-r2100-20260926    clang-24   cocci
powerpc              randconfig-r2105-20260927    clang-17   cocci
powerpc              randconfig-r2105-20260927    clang-19   cocci
powerpc              randconfig-r2201-20260927    clang-24   smatch
powerpc              randconfig-r2302-20260927    gcc-15.2.0 sparse
powerpc              randconfig-r2304-20260927    clang-22   sparse
powerpc              randconfig-r2307-20260927    gcc-16.1.0 sparse
powerpc                      redwood_defconfig    gcc-16.1.0
powerpc                      tqm8540_defconfig    gcc-11.5.0
powerpc                          wii_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20260925    clang-24
powerpc64             randconfig-1000-20260926    clang-24
powerpc64             randconfig-1000-20260927    clang-24
powerpc64             randconfig-1001-20260925    clang-24
powerpc64             randconfig-1001-20260926    clang-24
powerpc64             randconfig-1001-20260927    clang-24
powerpc64            randconfig-r1306-20260926    gcc-16.1.0 sparse
powerpc64            randconfig-r2102-20260927    gcc-13.4.0 cocci
powerpc64            randconfig-r2201-20260927    clang-24   smatch
powerpc64            randconfig-r2202-20260924    gcc-11.5.0 smatch
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260925    clang-24
riscv                 randconfig-1000-20260926    gcc-9.5.0
riscv                 randconfig-1000-20260928    clang-24
riscv                 randconfig-1001-20260925    clang-24
riscv                 randconfig-1001-20260926    gcc-9.5.0
riscv                 randconfig-1001-20260928    clang-24
riscv                 randconfig-2000-20260924    clang-24
riscv                 randconfig-2000-20260925    gcc-11.5.0
riscv                 randconfig-2000-20260926    gcc-12.5.0
riscv                 randconfig-2000-20260927    clang-24
riscv                 randconfig-2001-20260924    clang-24
riscv                 randconfig-2001-20260925    gcc-11.5.0
riscv                 randconfig-2001-20260926    gcc-12.5.0
riscv                 randconfig-2001-20260927    clang-24
riscv                randconfig-r1301-20260926    gcc-13.4.0 sparse
riscv                randconfig-r2102-20260927    clang-24   cocci
riscv                randconfig-r2103-20260926    clang-24   cocci
riscv                randconfig-r2104-20260927    gcc-15.2.0 cocci
riscv                randconfig-r2107-20260926    gcc-8.5.0  cocci
riscv                randconfig-r2201-20260927    gcc-8.5.0  smatch
riscv                randconfig-r2301-20260927    clang-22   sparse
riscv                randconfig-r2304-20260927    clang-22   sparse
riscv                randconfig-r2305-20260927    clang-22   sparse
riscv                randconfig-r2307-20260927    clang-24   sparse
riscv                randconfig-r2308-20260927    clang-24   sparse
s390                              alldefconfig    gcc-16.1.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260925    clang-24
s390                  randconfig-1000-20260926    gcc-9.5.0
s390                  randconfig-1000-20260928    clang-24
s390                  randconfig-1001-20260925    clang-24
s390                  randconfig-1001-20260926    gcc-9.5.0
s390                  randconfig-1001-20260928    clang-24
s390                  randconfig-2000-20260924    clang-24
s390                  randconfig-2000-20260925    gcc-11.5.0
s390                  randconfig-2000-20260926    gcc-12.5.0
s390                  randconfig-2000-20260927    clang-24
s390                  randconfig-2001-20260924    clang-24
s390                  randconfig-2001-20260925    gcc-11.5.0
s390                  randconfig-2001-20260926    gcc-12.5.0
s390                  randconfig-2001-20260927    clang-24
s390                 randconfig-r1305-20260926    gcc-8.5.0  sparse
s390                 randconfig-r2101-20260927    clang-24   cocci
s390                 randconfig-r2103-20260924    clang-17   cocci
s390                 randconfig-r2103-20260925    gcc-9.5.0  cocci
s390                 randconfig-r2200-20260924    clang-17   smatch
s390                 randconfig-r2202-20260927    clang-24   smatch
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                allyesconfig    gcc-16.1.0
sh                          apsh4a3a_defconfig    gcc-16.1.0
sh                                   defconfig    gcc-14
sh                             hp6xx_defconfig    gcc-16.1.0
sh                           kfr2r09_defconfig    gcc-11.5.0
sh                             migor_defconfig    gcc-11.5.0
sh                    randconfig-1000-20260925    clang-24
sh                    randconfig-1000-20260926    gcc-9.5.0
sh                    randconfig-1000-20260928    clang-24
sh                    randconfig-1001-20260925    clang-24
sh                    randconfig-1001-20260926    gcc-9.5.0
sh                    randconfig-1001-20260928    clang-24
sh                    randconfig-2000-20260924    clang-24
sh                    randconfig-2000-20260925    gcc-11.5.0
sh                    randconfig-2000-20260926    gcc-12.5.0
sh                    randconfig-2000-20260927    clang-24
sh                    randconfig-2001-20260924    clang-24
sh                    randconfig-2001-20260925    gcc-11.5.0
sh                    randconfig-2001-20260926    gcc-12.5.0
sh                    randconfig-2001-20260927    clang-24
sh                   randconfig-r1303-20260926    gcc-9.5.0  sparse
sh                   randconfig-r2100-20260925    gcc-9.5.0  cocci
sh                   randconfig-r2102-20260924    gcc-14     cocci
sh                   randconfig-r2104-20260925    gcc-16.1.0 cocci
sh                   randconfig-r2105-20260926    gcc-8.5.0  cocci
sh                   randconfig-r2107-20260928    gcc-16.1.0 cocci
sh                   randconfig-r2200-20260927    gcc-13.4.0 smatch
sh                   randconfig-r2202-20260924    gcc-14.3.0 smatch
sh                   randconfig-r2305-20260927    clang-22   sparse
sh                   randconfig-r2308-20260927    clang-22   sparse
sh                   randconfig-r2309-20260927    clang-22   sparse
sh                    rts7751r2dplus_defconfig    gcc-16.1.0
sh                    secureedge5410_defconfig    gcc-11.5.0
sh                             titan_defconfig    gcc-16.1.0
sh                           urquell_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260925    gcc-12
sparc                 randconfig-1000-20260926    gcc-14
sparc                 randconfig-1001-20260925    gcc-12
sparc                 randconfig-1001-20260926    gcc-14
sparc                 randconfig-2000-20260924    gcc-13.4.0
sparc                 randconfig-2000-20260925    gcc-16.1.0
sparc                 randconfig-2000-20260927    gcc-16.1.0
sparc                 randconfig-2000-20260928    gcc-13.4.0
sparc                 randconfig-2001-20260924    gcc-13.4.0
sparc                 randconfig-2001-20260925    gcc-16.1.0
sparc                 randconfig-2001-20260927    gcc-16.1.0
sparc                 randconfig-2001-20260928    gcc-13.4.0
sparc                randconfig-r1301-20260925    clang-18   sparse
sparc                randconfig-r1303-20260926    gcc-13.4.0 sparse
sparc                randconfig-r1304-20260925    clang-18   sparse
sparc                randconfig-r1306-20260926    gcc-8.5.0  sparse
sparc                randconfig-r1307-20260926    gcc-16.1.0 sparse
sparc                randconfig-r2105-20260925    gcc-16.1.0 cocci
sparc                randconfig-r2105-20260927    clang-24   cocci
sparc                randconfig-r2106-20260925    gcc-16.1.0 cocci
sparc                randconfig-r2107-20260927    gcc-15.2.0 cocci
sparc                randconfig-r2202-20260925    gcc-15.2.0 smatch
sparc                randconfig-r2306-20260927    clang-24   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260925    gcc-12
sparc64               randconfig-1000-20260926    gcc-14
sparc64               randconfig-1001-20260925    gcc-12
sparc64               randconfig-1001-20260926    gcc-14
sparc64               randconfig-2000-20260924    gcc-13.4.0
sparc64               randconfig-2000-20260925    gcc-16.1.0
sparc64               randconfig-2000-20260927    gcc-16.1.0
sparc64               randconfig-2000-20260928    gcc-13.4.0
sparc64               randconfig-2001-20260924    gcc-13.4.0
sparc64               randconfig-2001-20260925    gcc-16.1.0
sparc64               randconfig-2001-20260927    gcc-16.1.0
sparc64               randconfig-2001-20260928    gcc-13.4.0
sparc64              randconfig-r1300-20260926    gcc-9.5.0  sparse
sparc64              randconfig-r1302-20260926    gcc-8.5.0  sparse
sparc64              randconfig-r1303-20260926    gcc-8.5.0  sparse
sparc64              randconfig-r1304-20260926    gcc-13.4.0 sparse
sparc64              randconfig-r2100-20260924    clang-20   cocci
sparc64              randconfig-r2100-20260924    gcc-11.5.0 cocci
sparc64              randconfig-r2101-20260926    clang-24   cocci
sparc64              randconfig-r2101-20260927    gcc-8.5.0  cocci
sparc64              randconfig-r2105-20260928    gcc-16.1.0 cocci
sparc64              randconfig-r2106-20260926    gcc-8.5.0  cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260925    gcc-12
um                    randconfig-1000-20260926    gcc-14
um                    randconfig-1001-20260925    gcc-12
um                    randconfig-1001-20260926    gcc-14
um                    randconfig-2000-20260924    gcc-13.4.0
um                    randconfig-2000-20260925    gcc-16.1.0
um                    randconfig-2000-20260927    gcc-16.1.0
um                    randconfig-2000-20260928    gcc-13.4.0
um                    randconfig-2001-20260924    gcc-13.4.0
um                    randconfig-2001-20260925    gcc-16.1.0
um                    randconfig-2001-20260927    gcc-16.1.0
um                    randconfig-2001-20260928    gcc-13.4.0
um                   randconfig-r1304-20260926    gcc-9.5.0  sparse
um                   randconfig-r2201-20260924    gcc-14     smatch
um                   randconfig-r2202-20260927    gcc-14     smatch
um                   randconfig-r2301-20260928    clang-24   sparse
um                   randconfig-r2302-20260927    clang-22   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260925    clang-22
x86_64      buildonly-randconfig-1000-20260926    gcc-14
x86_64      buildonly-randconfig-1000-20260927    gcc-14
x86_64      buildonly-randconfig-1000-20260928    gcc-14
x86_64      buildonly-randconfig-1001-20260925    clang-22
x86_64      buildonly-randconfig-1001-20260926    gcc-14
x86_64      buildonly-randconfig-1001-20260927    gcc-14
x86_64      buildonly-randconfig-1001-20260928    gcc-14
x86_64      buildonly-randconfig-1002-20260925    clang-22
x86_64      buildonly-randconfig-1002-20260926    gcc-14
x86_64      buildonly-randconfig-1002-20260927    gcc-14
x86_64      buildonly-randconfig-1002-20260928    gcc-14
x86_64      buildonly-randconfig-1003-20260925    clang-22
x86_64      buildonly-randconfig-1003-20260926    gcc-14
x86_64      buildonly-randconfig-1003-20260927    gcc-14
x86_64      buildonly-randconfig-1003-20260928    gcc-14
x86_64      buildonly-randconfig-1004-20260925    clang-22
x86_64      buildonly-randconfig-1004-20260926    gcc-14
x86_64      buildonly-randconfig-1004-20260927    gcc-14
x86_64      buildonly-randconfig-1004-20260928    gcc-14
x86_64      buildonly-randconfig-1005-20260925    clang-22
x86_64      buildonly-randconfig-1005-20260926    gcc-14
x86_64      buildonly-randconfig-1005-20260927    gcc-14
x86_64      buildonly-randconfig-1005-20260928    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260925    gcc-14
x86_64                randconfig-1000-20260926    gcc-14
x86_64                randconfig-1000-20260927    clang-22
x86_64                randconfig-1001-20260925    gcc-14
x86_64                randconfig-1001-20260926    gcc-14
x86_64                randconfig-1001-20260927    clang-22
x86_64                randconfig-1002-20260925    gcc-14
x86_64                randconfig-1002-20260926    gcc-14
x86_64                randconfig-1002-20260927    clang-22
x86_64                randconfig-1003-20260925    gcc-14
x86_64                randconfig-1003-20260926    gcc-14
x86_64                randconfig-1003-20260927    clang-22
x86_64                randconfig-1004-20260925    gcc-14
x86_64                randconfig-1004-20260926    gcc-14
x86_64                randconfig-1004-20260927    clang-22
x86_64                randconfig-1005-20260925    gcc-14
x86_64                randconfig-1005-20260926    gcc-14
x86_64                randconfig-1005-20260927    clang-22
x86_64                randconfig-1006-20260925    clang-22
x86_64                randconfig-1006-20260926    gcc-14
x86_64                randconfig-1006-20260928    gcc-14
x86_64                randconfig-1007-20260925    clang-22
x86_64                randconfig-1007-20260926    gcc-14
x86_64                randconfig-1007-20260928    gcc-14
x86_64                randconfig-1008-20260925    clang-22
x86_64                randconfig-1008-20260926    gcc-14
x86_64                randconfig-1008-20260928    gcc-14
x86_64                randconfig-1009-20260925    clang-22
x86_64                randconfig-1009-20260926    gcc-14
x86_64                randconfig-1009-20260928    gcc-14
x86_64                randconfig-1010-20260925    clang-22
x86_64                randconfig-1010-20260926    gcc-14
x86_64                randconfig-1010-20260928    gcc-14
x86_64                randconfig-1011-20260925    clang-22
x86_64                randconfig-1011-20260926    gcc-14
x86_64                randconfig-1011-20260928    gcc-14
x86_64                randconfig-1012-20260925    clang-22
x86_64                randconfig-1012-20260926    clang-22
x86_64                randconfig-1013-20260925    clang-22
x86_64                randconfig-1013-20260926    clang-22
x86_64                randconfig-1014-20260925    clang-22
x86_64                randconfig-1014-20260926    clang-22
x86_64                randconfig-1015-20260925    clang-22
x86_64                randconfig-1015-20260926    clang-22
x86_64                randconfig-1016-20260925    clang-22
x86_64                randconfig-1016-20260926    clang-22
x86_64                randconfig-1017-20260925    clang-22
x86_64                randconfig-1017-20260926    clang-22
x86_64                randconfig-1300-20260925    clang-22   sparse
x86_64                randconfig-1300-20260926    gcc-13     sparse
x86_64                randconfig-1301-20260925    clang-22   sparse
x86_64                randconfig-1301-20260926    gcc-13     sparse
x86_64                randconfig-1302-20260925    clang-22   sparse
x86_64                randconfig-1302-20260926    gcc-13     sparse
x86_64                randconfig-2100-20260924    clang-22   cocci
x86_64                randconfig-2100-20260924    gcc-14     cocci
x86_64                randconfig-2100-20260925    clang-22   cocci
x86_64                randconfig-2100-20260926    clang-22   cocci
x86_64                randconfig-2100-20260927    clang-22   cocci
x86_64                randconfig-2100-20260928    gcc-12     cocci
x86_64                randconfig-2101-20260924    clang-22   cocci
x86_64                randconfig-2101-20260925    clang-22   cocci
x86_64                randconfig-2101-20260926    clang-22   cocci
x86_64                randconfig-2101-20260927    clang-22   cocci
x86_64                randconfig-2101-20260928    gcc-12     cocci
x86_64                randconfig-2102-20260924    clang-22   cocci
x86_64                randconfig-2102-20260925    clang-22   cocci
x86_64                randconfig-2102-20260926    clang-22   cocci
x86_64                randconfig-2102-20260927    clang-22   cocci
x86_64                randconfig-2102-20260928    gcc-12     cocci
x86_64                randconfig-2103-20260924    clang-22   cocci
x86_64                randconfig-2103-20260925    clang-22   cocci
x86_64                randconfig-2103-20260926    clang-22   cocci
x86_64                randconfig-2103-20260927    clang-22   cocci
x86_64                randconfig-2103-20260928    gcc-12     cocci
x86_64                randconfig-2200-20260924    clang-22   smatch
x86_64                randconfig-2200-20260926    clang-22   smatch
x86_64                randconfig-2200-20260927    gcc-14     smatch
x86_64                randconfig-2200-20260928    gcc-14     smatch
x86_64                randconfig-2300-20260927    clang-22   sparse
x86_64                randconfig-2300-20260928    clang-22   sparse
x86_64                randconfig-2301-20260927    clang-22   sparse
x86_64                randconfig-2301-20260928    clang-22   sparse
x86_64                randconfig-2302-20260927    clang-22   sparse
x86_64                randconfig-2302-20260928    clang-22   sparse
x86_64               randconfig-r1301-20260926    gcc-8.5.0  sparse
x86_64               randconfig-r1306-20260926    gcc-9.5.0  sparse
x86_64               randconfig-r1308-20260926    gcc-9.5.0  sparse
x86_64               randconfig-r2104-20260924    gcc-14     cocci
x86_64               randconfig-r2200-20260927    gcc-14     smatch
x86_64               randconfig-r2201-20260927    clang-22   smatch
x86_64               randconfig-r2202-20260924    gcc-14     smatch
x86_64               randconfig-r2202-20260927    gcc-13     smatch
x86_64               randconfig-r2306-20260926    clang-22   sparse
x86_64               randconfig-r2307-20260927    clang-22   sparse
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
xtensa                randconfig-1000-20260925    gcc-12
xtensa                randconfig-1000-20260926    gcc-14
xtensa                randconfig-1001-20260925    gcc-12
xtensa                randconfig-1001-20260926    gcc-14
xtensa                randconfig-2000-20260924    gcc-13.4.0
xtensa                randconfig-2000-20260925    gcc-16.1.0
xtensa                randconfig-2000-20260927    gcc-16.1.0
xtensa                randconfig-2000-20260928    gcc-13.4.0
xtensa                randconfig-2001-20260924    gcc-13.4.0
xtensa                randconfig-2001-20260925    gcc-16.1.0
xtensa                randconfig-2001-20260927    gcc-16.1.0
xtensa                randconfig-2001-20260928    gcc-13.4.0
xtensa               randconfig-r1300-20260926    gcc-13.4.0 sparse
xtensa               randconfig-r2100-20260927    gcc-13.4.0 cocci
xtensa               randconfig-r2102-20260925    gcc-9.5.0  cocci
xtensa               randconfig-r2104-20260927    clang-17   cocci
xtensa               randconfig-r2201-20260927    gcc-16.1.0 smatch
xtensa               randconfig-r2309-20260927    clang-24   sparse
xtensa                     xip_kc705_defconfig    clang-24

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
