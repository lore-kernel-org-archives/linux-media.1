Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871843;
	b=Y15nIkEJy7Sm3mdikExTtD5n3X7SrejkXpV1OiDpNLXjX4v1pjXPuZCKoLMyE6Yaby25
	 ujdfC5cQKja1VQAxWq/DJ88ZSxQvG6IZdc7oYwdSnk2JpskdpSbov8e0SW1GvIx3dFm0R
	 Q6cclV5yt8uOq29AQKfFVhfNg3Ya9QvKWVrIAWeDRiwRtO5G4xJt+rg+444mWx0lISoen
	 B9/NvBb0wOmt3YmDUmV30ySNjh/whtddZv6u3G8MQK69kQc3fCmZIsngXTew82ZsFZrlJ
	 WuRoBHSFWeERsY0nbplor0jy53QpLAJ+OfLBEx3VDbYzqcni3gShRxVhj0lwwDXFuaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871843;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=K7gLYLDxJaZMxmnJSWmFjJKevtcs1ARX1xQiokE4kfA=;
	b=zRd+wPqhPyH+6lRtSVSHWdhmV8papKfiZgGGg5skdVJxzGWUcX3bVti/h3bFo1uYZovb
	 2jmPQF2RIorMtWBkHz1Ooe1XfZH0hYSBXYUKftNf5Epxo2wyskR1GnK4RgqalQ2vdEyqd
	 zIZLHJT4mHZBCr1uHt/O7jIsxOTlWlvbkdPoZwRYxZFkfHe60KwuiKq5QSlJI91i5dtmR
	 JvZlmMfKru+zy9tedgqD/FYAXGCjY9bpDrR+NCQ1mAoVf58++/9M+2AH+laLoNqFxrflT
	 WLQv7SwxkIh8r13YevmlywwsnREi3jEC1P7al08yJuX9dCwl3HcxGV0iUkqKZBnmA8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="N0edd8U/";
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C4A606D801
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 09:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4C4A606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N0edd8U/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793871843; x=1825407843;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2HDIt5lWJDuSmCfYb1ZEb+hUs1kS2nrYLiAdUKp3R5o=;
  b=N0edd8U/hCeFlFzE+oJ1Mjx7riXnFeVaXGwtuhE1qabjhnoRnFlim7vI
   IsoH69GreIgljjyOwUTm+zsLHkjNXA7uVAtAbmgVuuoECQJnmShxKzkaj
   kpFqYsRlmkPa0CITRgf3UthRGJyu3bsne8zm/DA+UZuLUTApdp7rO8xV8
   wLdDakNG2qt5RyjSbEC2K0F2w5lu376Q9foBO902BgKZ2kWPjQka8xeFn
   yBH0jSiZWE3KBzOczLkyeDy6qYjeLFINXxuE8vO2vJuuy9ldHyxaMiTn0
   DP8cjnF5/RMUenT2ORt4br7b31a87GU8yj5Ptyp7oMdrTCbdfI95p6pPl
   w==;
X-CSE-ConnectionGUID: fQTS0OX+QayUYA20lTwzDg==
X-CSE-MsgGUID: ulW3RdYPSCq/XNw4K7H90Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2685189"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2685189"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:44:02 -0800
X-CSE-ConnectionGUID: ISDnxJV6TKKaD0lp3Tp7CQ==
X-CSE-MsgGUID: xPesxnVLSOia8IRJGDcFnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8730169"
Received: from abityuts-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.182])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:44:00 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 71672121B97;
	Thu, 05 Nov 2026 11:44:10 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xOu0p-0000000DHQW-3Wyw;
	Thu, 05 Nov 2026 11:44:03 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: andriy.shevchenko@linux.intel.com,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: [PATCH 1/1] media: ipu6: Improve Kconfig help text
Date: Thu,  5 Nov 2026 11:44:03 +0200
Message-ID: <20261105094403.3165245-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add IPU 7.5 to the menu item name and list the supported variants and the
SoCs they're found in.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/Kconfig | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel/ipu6/Kconfig
index 3d3c7778be38..00e5e4ce7c64 100644
--- a/drivers/media/pci/intel/ipu6/Kconfig
+++ b/drivers/media/pci/intel/ipu6/Kconfig
@@ -1,5 +1,5 @@
 config VIDEO_INTEL_IPU6
-	tristate "Intel IPU 6/7/8 driver"
+	tristate "Intel IPU 6/7/7.5/8 driver"
 	depends on ACPI || COMPILE_TEST
 	depends on VIDEO_DEV
 	depends on X86 && HAS_DMA
@@ -11,9 +11,18 @@ config VIDEO_INTEL_IPU6
 	select VIDEOBUF2_DMA_SG
 	select V4L2_FWNODE
 	help
-	  This is the driver for 6th, 7th and 8th Gen Intel Image
-	  Processing Units, found in Intel SoCs since Tiger lake and used
-	  for capturing images and video from camera sensors.
+	  This is the driver for 6th generation and newer Intel IPUs (Image
+	  Processing Units). The following IPU variants, found in SoCs listed
+	  below, are supported:
+
+	  - IPU 6 (Tiger Lake)
+	  - IPU 6 SE (Jasper Lake)
+	  - IPU 6 EP (Alder Lake, Raptor Lake and Meteor Lake)
+	  - IPU 7 (Lunar Lake)
+	  - IPU 7.5 (Panther Lake)
+	  - IPU 8 (Nova Lake)
+
+	  Currently the CSI-2 receiver functionality is supported.
 
 	  To compile this driver, say Y here! The two modules will be
 	  called intel_ipu6 and intel_ipu6_isys.

base-commit: 06d48a18b0ef9f24e79a668b4f864734eefd2ba6
-- 
2.47.3

