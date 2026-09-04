Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F9142A175
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 06:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788502990; cv=none; b=RrROBCymRiUpZBXnm+pHsz1xfqLVzD0O/6D1MxN6wB2tcANdDjW2IdiMN9TKwA16BgHyn6O3o+35bvSGWfW5mzWQBnRGpQURhKrmKnDvyQhVVqGZP7chiaVz4VttqUhdyaCMCXwuB0iF7Ow6HiWG7Kl4VswDmDRNiguTzcoLzKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788502990; c=relaxed/simple;
	bh=Qj0+OR/8JjwGDpzmkwEPl1x+qMLOC+IXwEVhvsJlDkw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dQ1L1FEoEbaAJ11iAfR5ecJx97BAJZGmfLHce1+bpyRvkJqsGHJRuBtg15CCxT385Hb/VnC7PXhgGUvKVcds1TuBGfifzq9I/KXqlsnBCi6H1Njd8ipQzGugawVZyhp4B+NQu+llBqr4kMMRjga7X4u4l7YcgEcRIV5tx5JOYho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XdXtL+QT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XdXtL+QT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788502989; x=1820038989;
  h=date:from:to:cc:subject:message-id;
  bh=Qj0+OR/8JjwGDpzmkwEPl1x+qMLOC+IXwEVhvsJlDkw=;
  b=XdXtL+QTFTPD1ksc3fcuJcjQ/YnkxMdkWHpzg3AekUTtVkv+Ya3Jgmpt
   KxbL9zo3lk855AGDJlZUB2Qrv9/MJL1YSAAPEgmORD/Iiso/9iT1NAaX4
   Rxo7JlD0VGsBCy7WUpr7zoU/KHAJ7eYbuhmlQfFUzOqdMYo79vBOGUx0j
   sjZHBxkWlFZxLYKLVcjoTZI9WRz8Rp/mKq27AiEt/Bhsc/awGsIlsV4ow
   1oygrUpsAKcZHI48ozhZVD4tZqSmu/8ZmhnIuDvEkOcTQpv4NA8cSl+oy
   z13Eyn5XbAz0QvmlBaogCVU9+MQ5wJCPpcPcDo+fS47plmKTe715aq8Pu
   Q==;
X-CSE-ConnectionGUID: MAayEtW3RviWI/Kv/GkdOA==
X-CSE-MsgGUID: 1pRGLf68TC6N47EdNchzdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="89052791"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="89052791"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 23:23:08 -0700
X-CSE-ConnectionGUID: b0A6kXtST6GTwVcVB2qLXQ==
X-CSE-MsgGUID: EGSStKa1TH2jAx8D+IV0Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="269938008"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Sep 2026 23:23:07 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2NKK-000000005xs-2N5i;
	Fri, 04 Sep 2026 06:23:04 +0000
Date: Fri, 04 Sep 2026 14:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:fixes] BUILD SUCCESS
 e04ffff543db06308a8100f6aa3a65aebcd9834c
Message-ID: <202609041417.2pCAxkLj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: https://git.linuxtv.org/media-ci/media-pending.git fixes
branch HEAD: e04ffff543db06308a8100f6aa3a65aebcd9834c  media: rppx1: bls: read the raw pattern from the PRE2 acquisition module

elapsed time: 2861m

configs tested: 62
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arc          allyesconfig    gcc-16.1.0
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    clang-24
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    clang-24
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    clang-20
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    clang-24
openrisc     allmodconfig    gcc-16.1.0
openrisc      allnoconfig    clang-24
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc       allyesconfig    gcc-16.1.0
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-24
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh           allyesconfig    gcc-16.1.0
sparc         allnoconfig    clang-24
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-14
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
