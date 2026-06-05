Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E803988F8;
	Fri,  5 Jun 2026 08:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649366; cv=none; b=qPD9XOegRS62WIG8jxsZNAbMJKGtCBbkiJab2yRWgAqy/XF09S6mQtBnOJ4ezUfkpJt3Oj3uYp1Aq2KOLzWLvWWKNEvQ2f8ayNTpoFPE9qBj7C/xdnu7rSsAUWtmKU0bjWM2IggQRLRxjl/fYilI5FQNyyNEq0K42l8gLcAeJxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649366; c=relaxed/simple;
	bh=MBWZib5l50WfG33f/b/qcsZdOZojhitXJDU75/edpMU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jESqvym0K3uCqResub6dxGgd0ZkIWJt0LvnY1wDXfGEcqDkLoXLZEN7k7GHA6SVh1aDCwIVdyiE7ITa/IOXyN74XPvETN97/z8ao0VFm98XXY0gGI5SCT0x7xpoaDgzDU2iaak1p6CLb4JTnpn/WcLgfw3z2gY5M5bE/ob60Qww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lr2pfS3B; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lr2pfS3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780649365; x=1812185365;
  h=date:from:to:cc:subject:message-id;
  bh=MBWZib5l50WfG33f/b/qcsZdOZojhitXJDU75/edpMU=;
  b=lr2pfS3Bwgsoq+Qmk4pigNruEhPZoGumDuwJGWs9m4OU8ckLFBiyfQy/
   XM8aUIy7GWTII/M+x0vgE0JsOBHbWYNlxSKM21Mv9YIZsacf+9hikSL5r
   HgY8tpZqi9OdwT6ewtlvEuqB8PGFaRntPE/PXB/yP2NGW+7UIYfub4FUy
   Fpf6cFAwRdJU5mmK+HTZPILucYgoTcpxyFLJaSPX3ep4FRKRYRnI/uXNT
   b7YfskP6yMrGb+20yL8qlTPcrRlhTNUQfXFQSUNCegE8z6hp5ktkxqaxu
   Gujqx6dXcD/j6KzFf9Vn5J8j+GPs4qGKiXNM0f61TlZyAetHE0I/a3/bH
   w==;
X-CSE-ConnectionGUID: qFlG6a8vS86oZFFCNe57Lw==
X-CSE-MsgGUID: iFaWA0GZQUOyEr2Xa23YYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92968293"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="92968293"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 01:49:15 -0700
X-CSE-ConnectionGUID: SaGMq8PGRQOmi7sL9gQjYg==
X-CSE-MsgGUID: zMRhoDRdRb6Q3qs8ZcoQpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="242303454"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2026 01:49:13 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVQEo-000000002XL-2fyb;
	Fri, 05 Jun 2026 08:49:10 +0000
Date: Fri, 05 Jun 2026 10:48:29 +0200
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [sailus-media-tree:partial-reg 9/9] htmldocs: Warning:
 Documentation/userspace-api/media/mediactl/media-ioc-dqevent.rst references a
 file that doesn't exist: Documentation/media/uapi/fdl-appendix.rst
Message-ID: <202606051009.SvtAY0cZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree:   git://linuxtv.org/sailus/media_tree.git partial-reg
head:   b7d01dab7d47849d483b459ff2abf50497b52149
commit: b7d01dab7d47849d483b459ff2abf50497b52149 [9/9] Documentation: media: Add Media controller event documentation
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260605/202606051009.SvtAY0cZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051009.SvtAY0cZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst references a file that doesn't exist: Documentation/filesystems/gfs2-uevents.rst
   Warning: Documentation/translations/zh_CN/filesystems/gfs2.rst references a file that doesn't exist: Documentation/filesystems/gfs2.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
>> Warning: Documentation/userspace-api/media/mediactl/media-ioc-dqevent.rst references a file that doesn't exist: Documentation/media/uapi/fdl-appendix.rst
>> Warning: Documentation/userspace-api/media/mediactl/media-ioc-subscribe-event.rst references a file that doesn't exist: Documentation/media/uapi/fdl-appendix.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
--
   c:type:`MC.media_v2_entity` (from userspace-api/media/mediactl/media-ioc-g-topology)
   c:enum:`media_entity_type` (from driver-api/media/mc-core)
   c:struct:`media_entity_enum` (from driver-api/media/mc-core) [ref.missing]
   include/uapi/linux/media.h:390: WARNING: Invalid xref: c:type:`MC.media_event_subscription`. Possible alternatives:
   c:type:`media_event_subscription` (from userspace-api/media/mediactl/media-ioc-subscribe-event) [ref.missing]
>> Documentation/userspace-api/media/mediactl/media-ioc-subscribe-event.rst:76: WARNING: undefined label: 'media_subscribe_event' [ref.ref]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
