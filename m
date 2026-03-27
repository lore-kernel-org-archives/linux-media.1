Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E015E3BF69C
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 07:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774596541; cv=none; b=a+/JgOF9sImWnjiiltQRdYD8jHL+Qz8grDfgGduGSatKx6lLqDJfuB62EHjXssJs6JYzIAqErfgDOL3tf7/jExiW78t8Wv8oXWY5zE3ubXQvkr9kgXRx9tMfaSWYYDShMtLB4K8lt6uWHV2yQCnD/WX3uiHjHFZ7P8imuCDi+XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774596541; c=relaxed/simple;
	bh=V/vD5nwhMWjZen8sZJKGYg3mxV5U0mPfPQEQZfdzTuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9AGKjCuqLgicysd/yb1fq2XfZOFGY00LMhPD1zjURvFawgUw3w8nnqtqG1cBnBCZy/DhmVnD5qxrGdPpUdmJKlt1kplxXZKWTiOVVibpz2cL6MTNeMaBAXuflBnGTAEDJ9pez7D43yhKbpLPlfZ2DbQIkFvhcX29OwEhS3iVas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nI0VTCFe; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nI0VTCFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774596533; x=1806132533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V/vD5nwhMWjZen8sZJKGYg3mxV5U0mPfPQEQZfdzTuo=;
  b=nI0VTCFeg7TGwKGto63VBHArqiteamgUOUi3pQHPmdKY3v2gt2GLn1Mr
   sJV+8FCyvBKsWh9YZj9nmaEpukI+qDfMtA8ZOQ4l0xjHZ5Pe862raYiOX
   PyMvyejrj658LFJURzWmUAjZPxzzsgie+hHJmsgS6LwozwHuMaYsgCNTE
   UmlZKJf157H3Kas4ioxc5cJR+dBaLtP8HeSUpqcjq8HHRYV4PmnHEkcQ0
   GEhckO9MeVwmqf8COkdnN98IfE+VkvlQkNhSFB84o3RHH0rKNiF1CBgXE
   QB5r7yoIG95zLMP1FikLN1MwfFYgKMCOStR0YM3ZxByX+ah/e5qsAv+HE
   Q==;
X-CSE-ConnectionGUID: dVLoZ2rWQU+LpeiTfdvvRg==
X-CSE-MsgGUID: N1JgfaaeQXqtMBHuwkAhog==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75633488"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="75633488"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 00:28:53 -0700
X-CSE-ConnectionGUID: nw/w3xEXQbm7OmnTC0IuBQ==
X-CSE-MsgGUID: tYebg695Rxy3lZMio+clYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="225246742"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 27 Mar 2026 00:28:52 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w61cf-000000007Sn-0hyl;
	Fri, 27 Mar 2026 07:28:49 +0000
Date: Fri, 27 Mar 2026 08:28:13 +0100
From: kernel test robot <lkp@intel.com>
To: Matthew Laux <matthew.laux@gmail.com>, linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, mchehab@kernel.org,
	gregkh@linuxfoundation.org, Matthew Laux <matthew.laux@gmail.com>
Subject: Re: [PATCH 1/1] staging: media: add driver for StarTech USB3HDCAP
Message-ID: <202603270851.dIxOgNPA-lkp@intel.com>
References: <20260325170634.55528-2-matthew.laux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325170634.55528-2-matthew.laux@gmail.com>

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0e2c4117c3512cf6b8f54c2c3d37564bfa3ccd67]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Laux/staging-media-add-driver-for-StarTech-USB3HDCAP/20260327-130544
base:   0e2c4117c3512cf6b8f54c2c3d37564bfa3ccd67
patch link:    https://lore.kernel.org/r/20260325170634.55528-2-matthew.laux%40gmail.com
patch subject: [PATCH 1/1] staging: media: add driver for StarTech USB3HDCAP
reproduce: (https://download.01.org/0day-ci/archive/20260327/202603270851.dIxOgNPA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270851.dIxOgNPA-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/staging/media/usb3hdcap/usb3hdcap-video.c: 7 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 446: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
