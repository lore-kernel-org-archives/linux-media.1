Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BC63FE67B
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 07:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643714; cv=none; b=Ktb2CaN7NtA4IMEBQRoqWDGBGPGcEbtcWa9hjDRkM1NzDoxAHeOevbjm1M6aWPonnONFyBQazTHTOlV7gRrYcXSPFP8quvjuCCoL+n+OSJO8iUDmTeHpcUKj34yPmBZFTVgA49A+U/R6g/lfs16kv9InRHiQorLblAjJqqyjcmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643714; c=relaxed/simple;
	bh=iTpwPmTDeMfRQX8QHlTfMizFa3gAK/XsXh9hux068/0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=APuqkUSYneMoHfvCiTpZRl/g9LtueVQ9wQ6y2vuLvODAZ6uhgWdZU9ebAx/g3o1PsTZxO4Ahi3w9QbG1J54NVVTmDM9dwf+Ma5A3vVeEtwE/Z7D+LnuzBWOsp+mj7ek/73h/cG0KCz89lcIMQLSYBTJAbSYQA8bTum6Msze9xaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUihsG1W; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUihsG1W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780643713; x=1812179713;
  h=date:from:to:cc:subject:message-id;
  bh=iTpwPmTDeMfRQX8QHlTfMizFa3gAK/XsXh9hux068/0=;
  b=IUihsG1WYMzvvwg5gDOlwjYEviivp0fsZX2Xl4YztLgVCZ4Ew8wbpely
   apY6tGgpbXHWPf1BopoqyJO7511zLac0wa0sn9TjnnuAl0/RLOlXGT5Dt
   CzIwm73Z0i/4H9vPomJz1/aIXGWaUoo2a2YWwNT3QpnJH3Y3zpkeHe8Al
   FLgGWQc4/WtyfEfbr0Uak9abt0tamUscrAOHv3/h5NQsLCscgW4OCpwM3
   5pfXANz7XtEJuMvFqJlsNzv7eWqG97NYySv8u+TrgTomf38cuD5yvgpjC
   DXq9dtrv6d+u54XVi9kfvxY4ynEKlj12yJi6Q9a4nAbFNDNgTJrpqcQoQ
   Q==;
X-CSE-ConnectionGUID: cQoD2g77SR2T5/+iIVBdYQ==
X-CSE-MsgGUID: 1vsHqDKZRVuFwquWo31eyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85328560"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="85328560"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 00:15:12 -0700
X-CSE-ConnectionGUID: BwZX5p6SSoaGceqxQy/cPQ==
X-CSE-MsgGUID: Zot2d3gXR0aHFFWv4bJL6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="249108123"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 05 Jun 2026 00:15:11 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVOlo-000000002VJ-2cUP;
	Fri, 05 Jun 2026 07:15:08 +0000
Date: Fri, 05 Jun 2026 09:15:02 +0200
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:partial-reg 8/9] htmldocs:
 include/uapi/linux/media.h:370: WARNING: Invalid xref:
 std:ref:`media-event-entity-registration`. Possible alternatives:
Message-ID: <202606050936.Lu7298HY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree:   git://linuxtv.org/sailus/media_tree.git partial-reg
head:   b7d01dab7d47849d483b459ff2abf50497b52149
commit: 9aa2d8a3b823666c50d500fbc9d3f5d88804405c [8/9] media: mc: Add MEDIA_EVENT_ENTITY_REGISTRATION
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260605/202606050936.Lu7298HY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050936.Lu7298HY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/uapi/linux/media.h:369: WARNING: Invalid xref: std:ref:`media-event-all`. Possible alternatives:
   std:label:`media-ent-f-lens` (from userspace-api/media/mediactl/media-types)
   c:macro:`media_entity_call` (from driver-api/media/mc-core)
   std:label:`media-request-api` (from userspace-api/media/mediactl/request-api) [ref.missing]
   include/uapi/linux/media.h:369: WARNING: undefined label: 'media-event-all' [ref.ref]
>> include/uapi/linux/media.h:370: WARNING: Invalid xref: std:ref:`media-event-entity-registration`. Possible alternatives:
   c:struct:`media_entity_operations` (from driver-api/media/mc-core)
   c:function:`media_entity_is_streaming` (from driver-api/media/mc-core)
   std:label:`media-entity-functions` (from userspace-api/media/mediactl/media-types) [ref.missing]
>> include/uapi/linux/media.h:370: WARNING: undefined label: 'media-event-entity-registration' [ref.ref]
   include/uapi/linux/media.h:377: WARNING: Invalid xref: c:type:`MC.media_event`. Possible alternatives:
   c:function:`media_device_init` (from driver-api/media/mc-core)
   c:struct:`media_entity` (from driver-api/media/mc-core)
   c:struct:`media_device` (from driver-api/media/mc-core) [ref.missing]
>> include/uapi/linux/media.h:372: WARNING: Invalid xref: c:type:`MC.media_event_entity_reg`. Possible alternatives:
   c:type:`MC.media_v2_entity` (from userspace-api/media/mediactl/media-ioc-g-topology)
   c:enum:`media_entity_type` (from driver-api/media/mc-core)
   c:struct:`media_entity_enum` (from driver-api/media/mc-core) [ref.missing]
   include/uapi/linux/media.h:390: WARNING: Invalid xref: c:type:`MC.media_event_subscription`. Possible alternatives:
   c:type:`V4L.v4l2_event_subscription` (from userspace-api/media/v4l/vidioc-subscribe-event)


vim +370 include/uapi/linux/media.h

   368	
   369	#define MEDIA_EVENT_ALL			0
 > 370	#define MEDIA_EVENT_ENTITY_REGISTRATION	1
   371	
 > 372	struct media_event_entity_reg {
   373		__u32 entity_id;
   374		__u32 pending;
   375	} __attribute__ ((packed));
   376	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
