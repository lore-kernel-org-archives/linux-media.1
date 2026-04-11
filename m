Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E0D242D97
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 02:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775873696; cv=none; b=BAher8xl2h9M98apk+4pUFJhb4i8w4PKsWoMFAz0kM3zb8lzLoPg7hidWZG784kcEnduCv+RkJIXYcOFRJQqbAe+/179jUPDKtkt1VAC/B1dLuN6g1soFuM0A0WupiZSRzluL3hPQgtX226EFT7UaQm5roTlJ15+rsP5PVz2bgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775873696; c=relaxed/simple;
	bh=VusP0RQ2D455ycRUfIc3dwYifIhrM8O0jE1DFc3pFvw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gUwSbs0MN3HlqvzYorQfYAgMRk924EtxiwfgelS4TJUl+XpdOxMKeJr+d/7RqYVbTUkDJROOnR2JaI5/JdNJalQbrqy+lvsb88aai7hfgISRfI0u2ItLAnffZeWzj7XV4pLSXST8N5hdNlc910kmgfQHxwZynHijytyxmUbs4f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ahEtq2md; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ahEtq2md"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775873695; x=1807409695;
  h=date:from:to:cc:subject:message-id;
  bh=VusP0RQ2D455ycRUfIc3dwYifIhrM8O0jE1DFc3pFvw=;
  b=ahEtq2mdcLz8D+8Agjknn7cKR4SJFA41WUlpKIOk36t0k7wEIkuRb4IL
   fIod9+rw+KerrLJHbeynhPgscrzhVelAnc2hSo8DryK3T7XoasmJZSGaI
   gapVkOAdiCfi3g7cf2J/3HdCUkg+X3NUUWq2dDZmYLK0ifQjOFYnW7Kmn
   mZUCbaVYMX3pL3NnoUiIR9ZPDWNSkZ+KqiMawFx43U5ymELwsh+WZ2dvv
   fF51aQhcbCtToCiqDl4W5tiXl1p4yMuWXgb/TbfcxkMfJanq0ePfovWWq
   7tETCgO9iKDmN9HYxg2hzuqJdqjIKDf8Yfn3ccddNBUO5g/+xqtmd3JcB
   g==;
X-CSE-ConnectionGUID: lvmUuJrAQQa4bdbiUoX3Sg==
X-CSE-MsgGUID: 8mc7VfWGT3WC8+593OEtsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76783860"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76783860"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 19:14:55 -0700
X-CSE-ConnectionGUID: CQ5Yo+hyQYaKgN4E/2/qWQ==
X-CSE-MsgGUID: BLuvGsjWSAeX1iF7qhYStw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="259723850"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Apr 2026 19:14:53 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBNs2-000000000cL-2MwO;
	Sat, 11 Apr 2026 02:14:50 +0000
Date: Sat, 11 Apr 2026 10:14:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 93/116] ERROR: modpost:
 "__divdi3" [drivers/media/i2c/imx219.ko] undefined!
Message-ID: <202604111045.YRLcHzQR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   ace2f872475ed78b708d667f1b2d004b192eeeb1
commit: 88970a049656e406988e5300e0f9f9474e83c8e8 [93/116] media: imx219: Allow configuring cropping and binning through CRSM
config: i386-buildonly-randconfig-006-20260411 (https://download.01.org/0day-ci/archive/20260411/202604111045.YRLcHzQR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111045.YRLcHzQR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111045.YRLcHzQR-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__divdi3" [drivers/media/i2c/imx219.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
