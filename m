Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FE3351C11
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 09:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761632; cv=none; b=PP7SHAhr4kx+0x87LxSudAYZu1NyXDMwpZtlC/W4qLy8BwithObRkRgcsNohg1ehIzpyCtIljPBT6voNVTxaiexV4FTnHmQX2Vmck0xvtVCRtN9slYQnJrMu9GgSu6dpt8jFqXC4ryTHaSGcnDrJbezIgWB3zqQQnDwBrDbp0SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761632; c=relaxed/simple;
	bh=JuTEs+6s4TT4CkU5OlWWOWC+9dFNFlTFiT812wHpef4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NBsliutuNDFyo6NHhzkwBeQwg/RByBlERMTSNGMYb15MCDWyNwCMKDyU6jJHT1ZhDWTCsM690+awHvQ1v0kOc9SbitvJFKfaRGVf0vObB7EXc0LcGPOEekd7q58d0ouNgBktOll+uHiCvALdDliSLKM9cdVdKQAKvGc8SKRDLJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fvcSQ4AP; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fvcSQ4AP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790761631; x=1822297631;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JuTEs+6s4TT4CkU5OlWWOWC+9dFNFlTFiT812wHpef4=;
  b=fvcSQ4AP/cgtF/e9qmW8cC23EV5Wf0lgVvohbEGrHmx2ltj+gmTy0RUD
   sayuJo1g6kldV25ZKwY8AsqvOhy/ySkO5AcWOc8EdJbl7lvEkPW9JM+B7
   9aZdImc4Y6dretXgytNpY1Fp5ZQLPSZGI4aHnWgKBAmAOTz2+JVgkEXC5
   icUvtR5E/uQcBvUkrkrvCCE7bfudO1tnHmGHURjkzjHsVbG/A+JI311mr
   Lu2mpbgingorZCncvYWIOHQnG4nqI4KsOlgpbwWrauRjibA8OVFxeoHCN
   79Pvz6BDTkVcTjkqzXY8uZVyjNDL0xtiUUfqhIyWmV9B63eXmNkNbygyh
   A==;
X-CSE-ConnectionGUID: uPMu7lSYQwWuBEa3Q99KGQ==
X-CSE-MsgGUID: rTbBh7vtQV+UQHtRt0R/TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="93981056"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="93981056"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:47:11 -0700
X-CSE-ConnectionGUID: R2kbhhQeTVGcIgxSXGln5Q==
X-CSE-MsgGUID: sD8axZEhQXuBLZ4EHdHdGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="272104740"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.109])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:47:09 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B951511F925;
	Wed, 30 Sep 2026 12:47:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xBqu8-0000000BhCP-3JvG;
	Wed, 30 Sep 2026 12:47:12 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH 1/1] media: ipu6: Take IPU8 support into account in Kconfig
Date: Wed, 30 Sep 2026 12:47:12 +0300
Message-ID: <20260930094712.2787658-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update Kconfig for support of IPU 7, 7.5 and 8 in mind.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/Kconfig | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel/ipu6/Kconfig
index a1d036a78b57..378ea84e3b1c 100644
--- a/drivers/media/pci/intel/ipu6/Kconfig
+++ b/drivers/media/pci/intel/ipu6/Kconfig
@@ -1,5 +1,5 @@
 config VIDEO_INTEL_IPU6
-	tristate "Intel IPU6 driver"
+	tristate "Intel IPU 6/7/8 driver"
 	depends on ACPI || COMPILE_TEST
 	depends on VIDEO_DEV
 	depends on X86 && HAS_DMA
@@ -11,17 +11,19 @@ config VIDEO_INTEL_IPU6
 	select VIDEOBUF2_DMA_SG
 	select V4L2_FWNODE
 	help
-	  This is the 6th Gen Intel Image Processing Unit, found in Intel SoCs
-	  and used for capturing images and video from camera sensors.
+	  This is the driver for 6th, 7th and 8th Gen Intel Image
+	  Processing Units, found in Intel SoCs since Tiger lake and used
+	  for capturing images and video from camera sensors.
 
-	  To compile this driver, say Y here! It contains 2 modules -
-	  intel_ipu6 and intel_ipu6_isys.
+	  To compile this driver, say Y here! The two modules will be
+	  called intel_ipu6 and intel_ipu6_isys.
 
 config VIDEO_INTEL_IPU6_IPU7
-	bool "Support IPU 7 and IPU 7.5 in ipu6 driver by default"
+	bool "Support IPU 7, 7.5 and 8 in ipu6 driver by default"
 	depends on VIDEO_INTEL_IPU6
 	default y
 	help
-	  Support Intel IPU 7 and IPU 7.5 in ipu6 driver by default, instead of
-	  the ipu7 staging driver. This behaviour can be changed at runtime with
-	  module parameters in the respective drivers.
+	  Support Intel IPU 7, IPU 7.5 and IPU 8 in ipu6 driver by
+	  default, instead of the ipu7 staging driver. This behaviour can
+	  be changed at runtime with module parameters in the respective
+	  drivers.

-- 
2.47.3

