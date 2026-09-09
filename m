Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56370248F57
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 02:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788920019; cv=none; b=POt0gMsJoNX92YQi72baNJqvhBQbr1zgKk5zyYQoZjJ4vXmrx178EJKrzJWr2pylmx3+qNvDLpdUIeubDmnLNdYssC9jcsBoEhcrLm6hmkAuwJmNcs05ntxPyQrBPEyFHkY++NxTyAdAaWdJ8RhgApE2ZycEoNgd6jU9fY2kKn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788920019; c=relaxed/simple;
	bh=9s4pQ7QCzVAxziiTjer5fTmC1ORjU03XOE+z9JDn97I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a3wYwjDBb3phlL6TfZIkSgC4dVPTm2ZDwfjxDAqSUPMvF6MIMZwpm/9lilHrdPXWTJV8Bc1VblfyOJrxR3CEdMOD68uwRYFNTFiUxSamfmocEi8xT1+5zjmZ0sAqnyLj8xa2XNxP8J9A3/fCDOprFIE/gFN2kI1a9dml3UuLlFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+XF92Wh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+XF92Wh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788920017; x=1820456017;
  h=date:from:to:cc:subject:message-id;
  bh=9s4pQ7QCzVAxziiTjer5fTmC1ORjU03XOE+z9JDn97I=;
  b=V+XF92Wh7Env5Iw2FIiR4D+u5IChg3ureD5V4lM9UkG738oBGu0q6DYR
   dhCfrD+hjr/Feo6tyH0DdPt1/0mYZNagTdVZ8S8czL0jQVqRJNHBHER9z
   91t1/3FCNeqSiWy0XV7zLjV4UWXYijieBqb8qIMbyOb5vOx++QgXn6qN1
   Ghl6jZWxcnB7NMfiRAVm0rbNNZ466sOOpjZUejCuDhHCfYo7179CigQxO
   lBXoK0VXsizO/hfn8lBLHqvUQZgngnc+bc1qIwvWOuDKGe3LysCosb9bK
   4Pyohrfsyz5P2E9x/f2C6eZQ3FO8Af+G21u6/LcJaVBwPTvFLRv0and92
   w==;
X-CSE-ConnectionGUID: Fyp4OjjmTeOqxUhQkzq5QA==
X-CSE-MsgGUID: 4ZoBDUEOTbOcUgYwG9efmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100691414"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="100691414"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 19:13:37 -0700
X-CSE-ConnectionGUID: KyXPighqQoOnahrTXliRIQ==
X-CSE-MsgGUID: 3+hBmCgcSke5Uj/s9QkQhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="296113016"
Received: from lkp-server01.sh.intel.com (HELO dc5b8f51e05b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2026 19:13:36 -0700
Received: from kbuild by dc5b8f51e05b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x47ob-000000001CT-2qws;
	Wed, 09 Sep 2026 02:13:33 +0000
Date: Wed, 09 Sep 2026 10:13:28 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:ipu6] BUILD SUCCESS
 83345575c7f971891082b76b75e3d67a36ce5283
Message-ID: <202609091022.J5NUHJ9T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git ipu6
branch HEAD: 83345575c7f971891082b76b75e3d67a36ce5283  staging: media: ipu7: Update TODO file

elapsed time: 1488m

configs tested: 47
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        allnoconfig    gcc-16.1.0
alpha       allyesconfig    gcc-16.1.0
arc         allmodconfig    gcc-16.1.0
arc          allnoconfig    gcc-16.1.0
arc         allyesconfig    gcc-16.1.0
arm          allnoconfig    clang-17
arm         allyesconfig    gcc-16.1.0
arm64        allnoconfig    gcc-16.1.0
csky        allmodconfig    gcc-16.1.0
csky         allnoconfig    gcc-16.1.0
hexagon     allmodconfig    clang-24
hexagon      allnoconfig    clang-24
i386         allnoconfig    gcc-14
loongarch    allnoconfig    clang-20
m68k        allmodconfig    gcc-16.1.0
m68k         allnoconfig    gcc-16.1.0
m68k        allyesconfig    gcc-16.1.0
microblaze   allnoconfig    gcc-16.1.0
microblaze  allyesconfig    gcc-16.1.0
mips        allmodconfig    gcc-16.1.0
mips         allnoconfig    gcc-16.1.0
mips        allyesconfig    gcc-16.1.0
nios2       allmodconfig    gcc-11.5.0
nios2        allnoconfig    gcc-11.5.0
openrisc    allmodconfig    gcc-16.1.0
openrisc     allnoconfig    gcc-16.1.0
parisc      allmodconfig    gcc-16.1.0
parisc       allnoconfig    gcc-16.1.0
parisc      allyesconfig    gcc-16.1.0
powerpc     allmodconfig    gcc-16.1.0
powerpc      allnoconfig    gcc-16.1.0
riscv        allnoconfig    gcc-16.1.0
riscv       allyesconfig    clang-24
s390        allmodconfig    clang-24
s390         allnoconfig    clang-24
s390        allyesconfig    gcc-16.1.0
sh          allmodconfig    gcc-16.1.0
sh           allnoconfig    gcc-16.1.0
sh          allyesconfig    gcc-16.1.0
sparc        allnoconfig    gcc-16.1.0
sparc64     allmodconfig    clang-20
um          allmodconfig    clang-17
um           allnoconfig    clang-17
um          allyesconfig    gcc-14
x86_64       allnoconfig    clang-22
xtensa       allnoconfig    gcc-16.1.0
xtensa      allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
