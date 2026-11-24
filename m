Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554514;
	b=MWNstMRqFY2b/LC761ftaigjFEzgmSevJAHxMmskU1KV2vfypmNh3WHQmDCEjx2hsUm1
	 OcpN0IzkZlIim+gnNs7H6S3ZxVfET/phefSyoJbRNZBCUD2+2j7OvMB/zgaVqYmSrKIZQ
	 2VkcWUVbFLZ7mNETY47ZCf4pDN513cXXXpY6amW2Zb42RPcg/wnpLpnvujxrQmw0v5Nhi
	 ARAki2D+xnwhcnkQ97mpRQ7krq4J9PJzsUIRmE31Wud+9JPbfIqM4QhreRZb7e5y6tq2V
	 ThS2HO3vY6ac9c86NCrR7TpT+72dPTmpFKUqiJBYpJ+eXVKd6nqw8lfJ24pJK4dTDyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554514;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=LyUABeECbOdwS5CtRY1GzRPOWRANg0wPOCY1FI81AvA=;
	b=rGVWRkcHgOtPKujWP7OlUfs5oQ8wf1IhmCb/pht3YGoOEWkN8KGj1Xn5ZZPzu6RAdlys
	 AuVm9UeO4iSPKTJEfbN/3D7tHyYc0j/gagiqfDZ9Vhx//dLL9n0/ay/XUAZVvNtdMgW1b
	 RkWIlXiNbnr65MnzGZhFpkOKTOr/Q93gUhLGNdWol2WyfjatYEfmH0SBAZOXcA2iYQdhf
	 DYun5fsHTjUPuy4YbUPAQ18Uv0CTSxtaEVHuke2JwNvbfuktd/IsEJDFTQ5F2exXmmex5
	 6ycXf0auTywTQrg8hEAXHipP+m0ENclGkGPZ9k6dc1iEyb6X5LmsQs9EnG5hT1m1F6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bis3088z;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92230606A31E
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 21:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92230606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bis3088z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795554514; x=1827090514;
  h=date:from:to:cc:subject:message-id;
  bh=GvqN9Hkpw5SpVrlOkd6i8xi/q5e1x/0XEPfXqy6yO10=;
  b=bis3088zyhhtsAPnQD8mWbrti8pKbS7Yfn7fX6huPgAY+FHwVFePE3NA
   rCuvO1OzEVwEMLe8f77JIGFjghjcHfYtMGQiYRA4wT2xTvrpkXt+PPKxS
   qL/TdMkShVP2JBKefX/V+hM04k14nZ60BJwC5RSPAeLC7E81WfBuSOwWN
   xM43wmEIYhMGpJPPQhRynuat6NM718w2KL0s5kr+Kva7dQdwHIub1dLK2
   BmfbsFOckCtbwZHh4g5qoU3MeZOsRlA27PQTpgSyn82iOWWHxTvok8rdM
   XbByGcfdfygL3wgmc8FbOYlfsdF90hrShZDmonh+F4H/yBXxHEtGjdp3J
   A==;
X-CSE-ConnectionGUID: zv98i1oqRX2yrJdOW92jDQ==
X-CSE-MsgGUID: XhW/7jipRWaoxMeLl3fRrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4471098"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4471098"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 13:08:33 -0800
X-CSE-ConnectionGUID: Oy7baZTZQ5K/c5do4tk6OQ==
X-CSE-MsgGUID: OnRpX7xuShyIa6WrdtD7Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="12096228"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Nov 2026 13:08:31 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVxka-00000001QHC-2zvt;
	Tue, 24 Nov 2026 21:08:28 +0000
Date: Wed, 25 Nov 2026 05:08:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org
Subject: [linuxtv-media-pending:next] BUILD SUCCESS
 b7ac871daee981f1963f632586ff9b9d898ce5dd
Message-ID: <20261125050827.bNIuPINU-lkp@intel.com>
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
branch HEAD: b7ac871daee981f1963f632586ff9b9d898ce5dd  media: rc: meson-ir: allow the receiver to wake the system

elapsed time: 2902m

configs tested: 265
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        randconfig-2000-20261122    gcc-8.5.0
alpha        randconfig-2000-20261123    gcc-8.5.0
alpha        randconfig-2001-20261122    gcc-8.5.0
alpha        randconfig-2001-20261123    gcc-8.5.0
alpha        randconfig-2200-20261122    gcc-8.5.0  smatch
alpha        randconfig-2200-20261123    gcc-12.5.0 smatch
alpha       randconfig-r2101-20261123    gcc-8.5.0  cocci
alpha       randconfig-r2106-20261123    clang-24   cocci
arc          randconfig-2000-20261123    gcc-12.5.0
arc          randconfig-2000-20261123    gcc-14.4.0
arc          randconfig-2001-20261123    gcc-12.5.0
arc          randconfig-2002-20261123    gcc-12.5.0
arc          randconfig-2002-20261123    gcc-8.5.0
arc          randconfig-2003-20261123    gcc-12.5.0
arc          randconfig-2004-20261123    gcc-12.5.0
arc          randconfig-2004-20261123    gcc-14.4.0
arc          randconfig-2005-20261123    gcc-12.5.0
arc          randconfig-2200-20261122    gcc-9.5.0  smatch
arc          randconfig-2200-20261123    gcc-12.5.0 smatch
arc         randconfig-r2102-20261123    gcc-8.5.0  cocci
arc         randconfig-r2310-20261123    gcc-8.5.0  sparse
arm          randconfig-2000-20261123    gcc-16.2.0
arm          randconfig-2000-20261123    gcc-8.5.0
arm          randconfig-2001-20261123    gcc-8.5.0
arm          randconfig-2002-20261123    clang-20
arm          randconfig-2002-20261123    gcc-8.5.0
arm          randconfig-2200-20261122    clang-19   smatch
arm          randconfig-2200-20261123    gcc-8.5.0  smatch
arm         randconfig-r2110-20261122    clang-24   cocci
arm         randconfig-r2309-20261123    clang-24   sparse
arm64        randconfig-2000-20261123    clang-24
arm64        randconfig-2000-20261123    gcc-8.5.0
arm64        randconfig-2001-20261123    gcc-8.5.0
arm64        randconfig-2002-20261123    clang-24
arm64        randconfig-2002-20261123    gcc-8.5.0
arm64        randconfig-2200-20261122    gcc-10.5.0 smatch
arm64        randconfig-2200-20261123    clang-17   smatch
arm64       randconfig-r2304-20261122    gcc-10.5.0 sparse
arm64       randconfig-r2307-20261123    clang-24   sparse
csky         randconfig-2000-20261122    gcc-15.3.0
csky         randconfig-2000-20261123    gcc-12.5.0
csky         randconfig-2001-20261122    gcc-9.5.0
csky         randconfig-2001-20261123    gcc-12.5.0
csky         randconfig-2200-20261122    gcc-9.5.0  smatch
csky         randconfig-2200-20261123    gcc-16.2.0 smatch
csky        randconfig-r2300-20261122    gcc-16.2.0 sparse
csky        randconfig-r2303-20261123    gcc-12     sparse
hexagon      randconfig-2000-20261122    clang-22
hexagon      randconfig-2000-20261123    gcc-12.5.0
hexagon      randconfig-2001-20261122    clang-24
hexagon      randconfig-2001-20261123    gcc-12.5.0
hexagon      randconfig-2200-20261122    clang-24   smatch
hexagon      randconfig-2200-20261123    clang-24   smatch
i386         randconfig-2000-20261123    clang-22
i386         randconfig-2000-20261123    gcc-14
i386         randconfig-2001-20261123    clang-22
i386         randconfig-2001-20261123    gcc-14
i386         randconfig-2002-20261123    gcc-14
i386         randconfig-2003-20261123    clang-22
i386         randconfig-2003-20261123    gcc-14
i386         randconfig-2004-20261123    gcc-14
i386         randconfig-2005-20261123    gcc-12
i386         randconfig-2005-20261123    gcc-14
i386         randconfig-2100-20261123    clang-22   cocci
i386         randconfig-2101-20261123    clang-22   cocci
i386         randconfig-2102-20261123    clang-22   cocci
i386         randconfig-2103-20261123    clang-22   cocci
i386         randconfig-2103-20261123    gcc-14     cocci
i386         randconfig-2104-20261123    clang-22   cocci
i386         randconfig-2105-20261123    clang-22   cocci
i386         randconfig-2105-20261123    gcc-14     cocci
i386         randconfig-2200-20261123    gcc-14     smatch
i386         randconfig-2300-20261123    gcc-13     sparse
i386         randconfig-2300-20261123    gcc-14     sparse
i386         randconfig-2301-20261123    clang-22   sparse
i386         randconfig-2301-20261123    gcc-14     sparse
i386         randconfig-2302-20261123    clang-22   sparse
i386         randconfig-2302-20261123    gcc-14     sparse
i386        randconfig-r2100-20261122    clang-22   cocci
i386        randconfig-r2103-20261123    gcc-8.5.0  cocci
i386        randconfig-r2311-20261123    gcc-14     sparse
loongarch    randconfig-2000-20261123    gcc-16.2.0
loongarch    randconfig-2001-20261123    clang-22
loongarch    randconfig-2001-20261123    gcc-16.2.0
loongarch    randconfig-2200-20261122    clang-24   smatch
loongarch    randconfig-2200-20261123    clang-24   smatch
loongarch   randconfig-r2300-20261123    gcc-12     sparse
loongarch   randconfig-r2302-20261122    gcc-16.2.0 sparse
m68k         randconfig-2000-20261122    gcc-14.4.0
m68k         randconfig-2000-20261123    gcc-8.5.0
m68k         randconfig-2001-20261122    gcc-12.5.0
m68k         randconfig-2001-20261123    gcc-8.5.0
m68k         randconfig-2200-20261122    gcc-12.5.0 smatch
m68k         randconfig-2200-20261123    gcc-8.5.0  smatch
m68k        randconfig-r2104-20261123    gcc-10.5.0 cocci
m68k        randconfig-r2105-20261123    gcc-8.5.0  cocci
microblaze   randconfig-2000-20261122    gcc-15.3.0
microblaze   randconfig-2000-20261123    gcc-8.5.0
microblaze   randconfig-2001-20261122    gcc-13.5.0
microblaze   randconfig-2200-20261122    gcc-8.5.0  smatch
microblaze   randconfig-2200-20261123    gcc-16.2.0 smatch
mips         randconfig-2000-20261123    gcc-10.5.0
mips         randconfig-2000-20261123    gcc-8.5.0
mips         randconfig-2001-20261123    gcc-10.5.0
mips         randconfig-2002-20261123    gcc-10.5.0
mips         randconfig-2002-20261123    gcc-16.2.0
mips         randconfig-2200-20261122    gcc-11.5.0 smatch
mips         randconfig-2200-20261123    gcc-14.4.0 smatch
mips        randconfig-r2100-20261123    gcc-8.5.0  cocci
mips        randconfig-r2101-20261122    clang-17   cocci
mips        randconfig-r2102-20261123    clang-24   cocci
mips        randconfig-r2108-20261123    clang-24   cocci
mips        randconfig-r2305-20261123    gcc-12     sparse
nios2        randconfig-2000-20261123    gcc-16.2.0
nios2        randconfig-2000-20261123    gcc-8.5.0
nios2        randconfig-2001-20261123    gcc-11.5.0
nios2        randconfig-2001-20261123    gcc-16.2.0
nios2        randconfig-2200-20261123    gcc-8.5.0  smatch
nios2       randconfig-r2105-20261123    gcc-8.5.0  cocci
openrisc     randconfig-2000-20261123    gcc-10.5.0
openrisc     randconfig-2001-20261123    gcc-10.5.0
openrisc     randconfig-2001-20261123    gcc-16.2.0
openrisc     randconfig-2002-20261123    gcc-10.5.0
openrisc     randconfig-2200-20261122    gcc-16.2.0 smatch
openrisc     randconfig-2200-20261123    gcc-12.5.0 smatch
openrisc    randconfig-r2106-20261122    gcc-16.2.0 cocci
openrisc    randconfig-r2107-20261123    clang-24   cocci
openrisc    randconfig-r2301-20261123    gcc-12     sparse
openrisc    randconfig-r2304-20261123    gcc-12     sparse
openrisc    randconfig-r2308-20261123    gcc-15.3.0 sparse
parisc       randconfig-2000-20261123    gcc-16.2.0
parisc       randconfig-2000-20261123    gcc-8.5.0
parisc       randconfig-2001-20261123    gcc-10.5.0
parisc       randconfig-2001-20261123    gcc-16.2.0
parisc       randconfig-2200-20261122    gcc-8.5.0  smatch
parisc       randconfig-2200-20261123    gcc-14.4.0 smatch
parisc      randconfig-r2103-20261123    gcc-9.5.0  cocci
parisc      randconfig-r2104-20261122    gcc-14.4.0 cocci
powerpc      randconfig-2000-20261122    gcc-14.4.0
powerpc      randconfig-2000-20261123    clang-21
powerpc      randconfig-2001-20261122    clang-24
powerpc      randconfig-2001-20261123    clang-21
powerpc      randconfig-2002-20261122    clang-24
powerpc      randconfig-2002-20261123    clang-21
powerpc      randconfig-2200-20261123    gcc-9.5.0  smatch
powerpc64    randconfig-2000-20261122    clang-24
powerpc64    randconfig-2000-20261123    clang-21
powerpc64    randconfig-2001-20261122    gcc-14.4.0
powerpc64    randconfig-2001-20261123    clang-21
powerpc64    randconfig-2002-20261122    gcc-8.5.0
powerpc64    randconfig-2002-20261123    clang-21
powerpc64    randconfig-2200-20261123    gcc-15.3.0 smatch
powerpc64   randconfig-r2104-20261123    gcc-8.5.0  cocci
powerpc64   randconfig-r2107-20261122    clang-17   cocci
powerpc64   randconfig-r2310-20261123    clang-24   sparse
powerpc64   randconfig-r2311-20261123    clang-24   sparse
riscv        randconfig-2000-20261123    gcc-11.5.0
riscv        randconfig-2001-20261123    gcc-11.5.0
riscv        randconfig-2001-20261123    gcc-13.5.0
riscv        randconfig-2002-20261123    gcc-11.5.0
riscv        randconfig-2002-20261123    gcc-8.5.0
riscv        randconfig-2003-20261123    gcc-11.5.0
riscv        randconfig-2003-20261123    gcc-8.5.0
riscv        randconfig-2004-20261123    clang-24
riscv        randconfig-2004-20261123    gcc-11.5.0
riscv        randconfig-2005-20261123    gcc-11.5.0
riscv        randconfig-2005-20261123    gcc-13.5.0
riscv        randconfig-2200-20261123    clang-17   smatch
riscv       randconfig-r2307-20261123    clang-24   sparse
riscv       randconfig-r2308-20261123    clang-24   sparse
s390         randconfig-2000-20261123    clang-20
s390         randconfig-2000-20261123    gcc-15.3.0
s390         randconfig-2001-20261123    clang-20
s390         randconfig-2001-20261123    gcc-9.5.0
s390         randconfig-2002-20261123    clang-20
s390         randconfig-2003-20261123    clang-20
s390         randconfig-2003-20261123    clang-22
s390         randconfig-2004-20261123    clang-20
s390         randconfig-2004-20261123    gcc-15.3.0
s390         randconfig-2005-20261123    clang-20
s390         randconfig-2005-20261123    gcc-8.5.0
s390         randconfig-2200-20261123    clang-24   smatch
s390        randconfig-r2109-20261123    clang-24   cocci
sh           randconfig-2000-20261122    gcc-15.3.0
sh           randconfig-2000-20261123    gcc-16.2.0
sh           randconfig-2001-20261122    gcc-9.5.0
sh           randconfig-2001-20261123    gcc-16.2.0
sh           randconfig-2002-20261122    gcc-15.3.0
sh           randconfig-2002-20261123    gcc-16.2.0
sh           randconfig-2003-20261122    gcc-13.5.0
sh           randconfig-2003-20261123    gcc-16.2.0
sh           randconfig-2004-20261122    gcc-11.5.0
sh           randconfig-2004-20261123    gcc-16.2.0
sh           randconfig-2005-20261122    gcc-13.5.0
sh           randconfig-2005-20261123    gcc-16.2.0
sh           randconfig-2200-20261122    gcc-13.5.0 smatch
sh           randconfig-2200-20261123    gcc-16.2.0 smatch
sh          randconfig-r2100-20261123    gcc-16.2.0 cocci
sh          randconfig-r2306-20261123    clang-24   sparse
sparc        randconfig-2000-20261123    gcc-16.2.0
sparc        randconfig-2000-20261123    gcc-9.5.0
sparc        randconfig-2001-20261123    gcc-8.5.0
sparc        randconfig-2001-20261123    gcc-9.5.0
sparc        randconfig-2200-20261122    gcc-16.2.0 smatch
sparc        randconfig-2200-20261123    gcc-12.5.0 smatch
sparc       randconfig-r2111-20261122    gcc-16.2.0 cocci
sparc       randconfig-r2303-20261122    gcc-8.5.0  sparse
sparc       randconfig-r2306-20261123    gcc-8.5.0  sparse
sparc64      randconfig-2000-20261123    clang-24
sparc64      randconfig-2000-20261123    gcc-9.5.0
sparc64      randconfig-2001-20261123    gcc-9.5.0
sparc64      randconfig-2200-20261122    clang-20   smatch
sparc64      randconfig-2200-20261123    clang-22   smatch
um           randconfig-2000-20261123    gcc-14
um           randconfig-2000-20261123    gcc-9.5.0
um           randconfig-2001-20261123    gcc-14
um           randconfig-2001-20261123    gcc-9.5.0
um           randconfig-2200-20261123    clang-21   smatch
um          randconfig-r2103-20261122    clang-24   cocci
um          randconfig-r2108-20261122    clang-24   cocci
um          randconfig-r2109-20261122    clang-24   cocci
um          randconfig-r2111-20261123    clang-24   cocci
x86_64                          kexec    clang-22
x86_64       randconfig-2000-20261123    gcc-14
x86_64       randconfig-2001-20261123    gcc-14
x86_64       randconfig-2002-20261123    gcc-14
x86_64       randconfig-2003-20261123    gcc-14
x86_64       randconfig-2004-20261123    gcc-14
x86_64       randconfig-2005-20261123    gcc-14
x86_64       randconfig-2100-20261123    clang-22   cocci
x86_64       randconfig-2100-20261123    gcc-14     cocci
x86_64       randconfig-2101-20261123    clang-22   cocci
x86_64       randconfig-2102-20261123    clang-22   cocci
x86_64       randconfig-2103-20261123    clang-22   cocci
x86_64       randconfig-2104-20261123    clang-22   cocci
x86_64       randconfig-2105-20261123    clang-22   cocci
x86_64       randconfig-2105-20261123    gcc-13     cocci
x86_64       randconfig-2200-20261122    clang-22   smatch
x86_64       randconfig-2200-20261123    gcc-14     smatch
x86_64       randconfig-2300-20261123    clang-22   sparse
x86_64       randconfig-2300-20261123    gcc-14     sparse
x86_64       randconfig-2301-20261123    gcc-14     sparse
x86_64       randconfig-2302-20261123    gcc-14     sparse
x86_64      randconfig-r2302-20261123    gcc-12     sparse
x86_64                       rhel-9.4    clang-22
x86_64                   rhel-9.4-bpf    clang-22
x86_64                   rhel-9.4-bpf    gcc-14
x86_64                  rhel-9.4-func    clang-22
x86_64            rhel-9.4-kselftests    clang-22
x86_64                 rhel-9.4-kunit    clang-22
x86_64                 rhel-9.4-kunit    gcc-14
x86_64                   rhel-9.4-ltp    clang-22
x86_64                   rhel-9.4-ltp    gcc-14
x86_64                  rhel-9.4-rust    clang-22
xtensa       randconfig-2000-20261122    gcc-9.5.0
xtensa       randconfig-2000-20261123    gcc-12.5.0
xtensa       randconfig-2001-20261122    gcc-8.5.0
xtensa       randconfig-2001-20261123    gcc-12.5.0
xtensa       randconfig-2200-20261123    gcc-8.5.0  smatch
xtensa      randconfig-r2101-20261123    gcc-8.5.0  cocci
xtensa      randconfig-r2105-20261122    gcc-8.5.0  cocci
xtensa      randconfig-r2110-20261123    clang-24   cocci
xtensa      randconfig-r2301-20261122    gcc-8.5.0  sparse
xtensa      randconfig-r2305-20261122    gcc-8.5.0  sparse
xtensa      randconfig-r2309-20261123    clang-24   sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
