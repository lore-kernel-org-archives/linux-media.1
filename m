Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE152F1FF4
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 01:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785289277; cv=none; b=XDz2tKu625jNjbjDk7qKLqT1UcRc8qF6Iw5OxaZTjF2lCxFrRcOhwkXuPpHVUmuTHvzBgRgvDJ9uUHO++oPveZtdmOSPhruF4tfjjyInnMVKks6tn+cxIro86SKp5c0rMRoCGozs0GtC/tqEyKX6F9xKuRqmIHd4VzJZxn23q0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785289277; c=relaxed/simple;
	bh=6T2ASwXHvQQLV66wqCeDhuzE/qEo+ODOvNR/i+g45gY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VivRuQ8mVF7dXoJ40fNAU75gbp9xswKWzQMay8yV6BmGGn7bz6amxjm+9IXgODdb4qI73bQi9gjp/YVxgZjnBt8aRf4+tG72D3uD+EWX0K/Z/nBOQenawS2N/0/RKUvNg9LdcD0jMBn+sRU+4M1Jo+HFjBlebWAFFyhQ90v6hco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fus1k0w3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fus1k0w3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785289276; x=1816825276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6T2ASwXHvQQLV66wqCeDhuzE/qEo+ODOvNR/i+g45gY=;
  b=fus1k0w3wtnLN7F50vS46KKL2bQ5NljGRtFYtImVpfM+Wf0qm4oLRefY
   h3PHWvgLWvCnG6DR1SkcBFOtmGnnF+zY6F7W6+ohPYAV9ZAhmXimj1llu
   10+bUTRpX/tAQAGdNlczHRkx1LRQ6aiAI5Lbc9U+GJMTFUZU9+H83eTOG
   keS5FlNa7uAjw2YKDRXcI9n10oNzxBHbtRV+5FEvubiIU99XZugHzrHz0
   FobYSDIvpAjXN+TuS88zWGvt5a80KQDAQiWDji7JtIHwAwKGWQwLuPLFA
   DX4Cj7r6x7tiioA769sD4DrZR44bl2eqdG8HSG0Cnjk4y29VRxvm9JtWi
   Q==;
X-CSE-ConnectionGUID: 0FPaMbHMRIm/PJcUGKlouQ==
X-CSE-MsgGUID: N9zj8E+xTsijhqa3xIRP6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85968694"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="85968694"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 18:41:15 -0700
X-CSE-ConnectionGUID: UMQpXZwGT0Cj8Pqr1MIfwA==
X-CSE-MsgGUID: iEwTKfR0QCadt5R15qWQww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="289815018"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 28 Jul 2026 18:41:13 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wotIF-00000000246-16KZ;
	Wed, 29 Jul 2026 01:41:11 +0000
Date: Wed, 29 Jul 2026 03:40:16 +0200
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 "Niklas =?utf-8?Q?S=C3=B6derlund"?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [sailus-media-tree:v4l2-isp 13/25] htmldocs:
 include/uapi/linux/videodev2.h:893: WARNING: Invalid xref:
 std:ref:`v4l2-meta-fmt-rpp-x1-params`. Possible alternatives:
Message-ID: <202607290311.BFAuSpjd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   git://linuxtv.org/sailus/media_tree.git v4l2-isp
head:   7abfe3e3b2e2ecba8132ae60033d4ea1238c1f1e
commit: 1a426ed271eb152cfed4f942a0caaa37e00ea707 [13/25] media: Add RPP_X1_PARAMS and RPP_X1_STATS meta formats
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260729/202607290311.BFAuSpjd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607290311.BFAuSpjd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:63: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:228: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:251: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/networking/checksum-offloads:157: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]
>> include/uapi/linux/videodev2.h:893: WARNING: Invalid xref: std:ref:`v4l2-meta-fmt-rpp-x1-params`. Possible alternatives:
   std:label:`v4l2-meta-fmt-rk-isp1-params` (from userspace-api/media/v4l/metafmt-rkisp1)
   std:label:`v4l2-meta-fmt-params` (from userspace-api/media/v4l/metafmt-intel-ipu3)
   std:label:`v4l2-meta-fmt-c3isp-params` (from userspace-api/media/v4l/metafmt-c3-isp) [ref.missing]
>> include/uapi/linux/videodev2.h:893: WARNING: undefined label: 'v4l2-meta-fmt-rpp-x1-params' [ref.ref]
>> include/uapi/linux/videodev2.h:894: WARNING: Invalid xref: std:ref:`v4l2-meta-fmt-rpp-x1-stats`. Possible alternatives:
   std:label:`v4l2-meta-fmt-rpi-fe-stats` (from userspace-api/media/v4l/metafmt-pisp-fe)
   std:label:`v4l2-meta-fmt-c3isp-stats` (from userspace-api/media/v4l/metafmt-c3-isp)
   std:label:`v4l2-meta-fmt-rk-isp1-stat-3a` (from userspace-api/media/v4l/metafmt-rkisp1) [ref.missing]
>> include/uapi/linux/videodev2.h:894: WARNING: undefined label: 'v4l2-meta-fmt-rpp-x1-stats' [ref.ref]


vim +893 include/uapi/linux/videodev2.h

   891	
   892	/* Vendor specific - used for Dreamchip RPP-X1 ISP */
 > 893	#define V4L2_META_FMT_RPP_X1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
 > 894	#define V4L2_META_FMT_RPP_X1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
   895	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
