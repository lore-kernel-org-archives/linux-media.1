Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1602726B95B
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 00:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787618313; cv=none; b=aVq8sS40Z4klBuVPnTucE5PH0yVEX0IZFW30uU5bCoX4ysoXnzX+bduDF+JLiLZvitkM/Xx6rYekuYXPBDYuTjqYL/IQbsdSEfuK3rV98F2s9RQqa+KscTOTMLhJjnW/xr6Cf9z+LK+bF64nXbfHT/De4TdiwUrcKSVEx5eYEV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787618313; c=relaxed/simple;
	bh=jkLrQH2YdRzrfuVQZKHnylKxApbVGDdY6Gv0bGO/rk8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U5quSnBC6cOCvZVxHNnlpClXgPoE5QatAqeDu0inrDan9o6Hi2XPy+bo9fQs87tlxtn9AdJ2recVmWWDg/8zXmlXwWGiwwNPnZ/D2Ui4DIExLqxEAz87924iXLeH3AnLpmdZw1iM7pPWSTpQ0Ch/mAJux42sz+A5D/e75tJiPs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCSACA/q; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCSACA/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787618312; x=1819154312;
  h=date:from:to:cc:subject:message-id;
  bh=jkLrQH2YdRzrfuVQZKHnylKxApbVGDdY6Gv0bGO/rk8=;
  b=hCSACA/qRFIfJ7UApkRrmaGql0nvvmSFBk/5aKUWthbam1UbQ8ACq87L
   BdTdeV6vdsLW/w1c94QcRkyZWCt270kxVyPXye5VZ3NuoF/WpkKGXH0ND
   mfsvLX/JZF0Osi2jDA8biq9tC3YZVkngFVdLHAUL6rYjW52+ooZAYsVtD
   9oa/R4UUn1DpRMcn3WnGXrJw3F52MCLhQzRYyP5NHrASZJ3bqmklw3PR9
   ZcRaA1tXG4dUzm6ZqQUI+n3DhaauMrCFeR+RnBitE25U23fv2+0F3fHgb
   heOL7t+RwQnZOmGEkqyXmgHvlHJ6dyoRZKfuQ96I39g9goURN9d/XX9r1
   A==;
X-CSE-ConnectionGUID: C8wD/uQIQ1e5oDJzU52NiQ==
X-CSE-MsgGUID: 20YjgovbTAavO2E7SVqMfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="110864992"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="110864992"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 17:38:31 -0700
X-CSE-ConnectionGUID: zls3svFTRxi4p9mOvOWI7w==
X-CSE-MsgGUID: 7SUtnNs/T02Q9fs9Vf0Zdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="305385308"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Aug 2026 17:38:31 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyfBG-000000004gz-1zHr;
	Tue, 25 Aug 2026 00:38:23 +0000
Date: Tue, 25 Aug 2026 08:37:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:frame-desc] BUILD SUCCESS WITH WARNING
 7c1e8e3f907ccd6c51f2c23e1a4ac09b6d4b1f04
Message-ID: <202608250840.0IWsSMuv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git frame-desc
branch HEAD: 7c1e8e3f907ccd6c51f2c23e1a4ac09b6d4b1f04  media: j721e-csi2rx: Use v4l2_subdev_get_frame_desc()

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202608242201.UypJNTA2-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202608242231.UUc2L5th-lkp@intel.com

    drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:51:25: warning: format '%p' expects argument of type 'void *', but argument 5 has type 'long int' [-Wformat=]
    drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:109:25: warning: format '%p' expects argument of type 'void *', but argument 5 has type 'long int' [-Wformat=]

Warning ids grouped by kconfigs:

recent_errors
|-- arc-allmodconfig
|   `-- drivers-media-platform-nxp-imx8-isi-imx8-isi-crossbar.c:warning:format-p-expects-argument-of-type-void-but-argument-has-type-long-int
`-- parisc-allmodconfig
    `-- drivers-media-platform-rockchip-rkisp1-rkisp1-isp.c:warning:format-p-expects-argument-of-type-void-but-argument-has-type-long-int

elapsed time: 775m

configs tested: 15
configs skipped: 1

tested configs:
alpha               allnoconfig    gcc-16.1.0
alpha              allyesconfig    gcc-16.1.0
alpha                 defconfig    gcc-16.1.0
arc                allmodconfig    gcc-16.1.0
arc                allyesconfig    gcc-16.1.0
csky               allmodconfig    gcc-16.1.0
i386               allmodconfig    gcc-14
loongarch             defconfig    clang-24
loongarch  loongson32_defconfig    clang-18
nios2              allmodconfig    gcc-11.5.0
nios2               allnoconfig    gcc-11.5.0
parisc             allmodconfig    gcc-16.1.0
parisc             allyesconfig    gcc-16.1.0
parisc                defconfig    gcc-16.1.0
sh                    defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
