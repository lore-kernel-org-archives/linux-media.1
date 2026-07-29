Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9010F2475F7;
	Wed, 29 Jul 2026 06:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785305071; cv=none; b=m/yZAahnq6N8WvOwReNW/7GqzHh2hOe/yNHfyeW4bL7Tn2HC9PNQcCfvhOc0QO5Kelsel+VIY4kqH0iwOSjb13mt1UkOwk64zuRqM9TFnRMBBB86N4KQAZQvaGuJGMppuR8UDV8kZgBqiunnHzTFiWVkGGyWGPRHFPX4KwHSBd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785305071; c=relaxed/simple;
	bh=JxXtO3Jg2Y+sqXXnuimd0Rjf96ozt/Scs3Zky+dtv58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YRUaSpXbrxRiA4ZoF7424NODBYE9os5dzYriEtHpR+13SQNNlR3NHVC2zPYdDuGqCnL/Jkl/B7Td43o0RfmZOAShzZFnwAL63GYS0XoRUjr7Hte9vM0VGzKrECg7F3CDoijYvyLUUC4hCa0aNdXt1fhGuNe2Lt4qIEYiCaA1bAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHfOne6+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHfOne6+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785305069; x=1816841069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JxXtO3Jg2Y+sqXXnuimd0Rjf96ozt/Scs3Zky+dtv58=;
  b=nHfOne6+pGiR/xl08rvS+f7WO2gd80J2FAA9sUSyQtsfkLgNTkOrH2jM
   sZF1gtB3GVW0TD9zxpPMgv4RL9ADDXpkgWiPknb9CA2eAaL4QT97g1qXz
   sSgnmU6ofliZY0bbkoZQghkYPlcibnjFQv9UXaivYoJB46y4Y6BJsO4Fw
   wcb2V0QYPlKLXoO3YmCxEkxDFMq+TdqtODbQ//kdFLw532OJGZbTGhqiT
   UlORckz5PJWDJZ28VmTXi3JBY+97GOwCYrjwtdlHxvbZrfbMJfqr7cBRQ
   sAlFlBch78Bolt873D4OhaoQpTtvbh6Kn33K0wBIoGdB2nIIViLIyti6/
   w==;
X-CSE-ConnectionGUID: 8/J0HLbXR6OgDwk6JbR1tg==
X-CSE-MsgGUID: LcoIKl0BTsisvqQpKRizLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="84881639"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="84881639"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 23:04:28 -0700
X-CSE-ConnectionGUID: c/6zE/zTQ22BZwk0/Rn6wQ==
X-CSE-MsgGUID: keanABOBScWgqoxbioxwBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="298136111"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 28 Jul 2026 23:04:26 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woxOx-0000000026Y-3F84;
	Wed, 29 Jul 2026 06:04:23 +0000
Date: Wed, 29 Jul 2026 08:03:30 +0200
From: kernel test robot <lkp@intel.com>
To: "Niklas =?utf-8?Q?S=C3=B6derlund"?= <niklas.soderlund+renesas@ragnatech.se>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
 linux-doc@vger.kernel.org
Subject: [sailus-media-tree:v4l2-isp 15/25] htmldocs:
 Documentation/userspace-api/media/v4l/metafmt-rppx1.rst: WARNING: document
 isn't included in any toctree [toc.not_included]
Message-ID: <202607290801.lvfV5aeM-lkp@intel.com>
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
commit: fae87ce4d08adbcc6274681ea6377698519bcd61 [15/25] media: rppx1: Add framework to support Dreamchip RPPX1 ISP
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260729/202607290801.lvfV5aeM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607290801.lvfV5aeM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:58: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:63: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:228: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:251: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/userspace-api/media/v4l/metafmt-rppx1.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/checksum-offloads:157: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]
   include/uapi/linux/videodev2.h:893: WARNING: Invalid xref: std:ref:`v4l2-meta-fmt-rpp-x1-params`. Possible alternatives:
   std:label:`v4l2-meta-fmt-rppx1-params` (from userspace-api/media/v4l/metafmt-rppx1)
   std:label:`v4l2-meta-fmt-rk-isp1-params` (from userspace-api/media/v4l/metafmt-rkisp1)
   std:label:`v4l2-meta-fmt-params` (from userspace-api/media/v4l/metafmt-intel-ipu3) [ref.missing]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
