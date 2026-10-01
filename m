Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8036C3CCFCC
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 09:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848693; cv=none; b=jgMEmDjRAIZiNN5nqrw/82Vgg1dH0SgpD56njyy5GzggMfvA/tBj3NJs1lwwc6cbmLW/SbEULIkYTr40Vbnv+VWnCWMsjnwaT9MpzVEBse8xxIvyhChW1WVN+Oz4q+1e86/z70UC0KpGa6RI11Oe8wHswjF0arLnJJolZRKC+34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848693; c=relaxed/simple;
	bh=pB/LbEV3t+JDT1LbeBz2fSGdfzP/AW8ziElTLryNtlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NWdEod+X9xVhHw1lUVargprl6Fgi2/sYvQDUa6PdffatLJbosuinxJIqcauDP1f/nniiGUcCfXWzKORWf+uaYUttdreKilQtlI46yVVSO0zI1tIyP5IMKBA7SlteBtlEnMPh1C7KhylMKooL6G7DE3rLGUkRggDGXEw15AtF9xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edUhQWjd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edUhQWjd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790848691; x=1822384691;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pB/LbEV3t+JDT1LbeBz2fSGdfzP/AW8ziElTLryNtlo=;
  b=edUhQWjdZa6/X/BKkKRHHIOz/ZcxTQZz5zliwMBcVL4zuuvpjMVfLT8L
   oHb8MmFZhgWF+6NegVJmw1DmoL9cTxw2GNdMOlIIUioXUqrur1EF3Qxh/
   F1T/L5sswoE3LHtOmMwkYBuuNA34PB3zOI6ontnGpd6CAxxquGZrV7ZrU
   /VQGRnjSGBw2oKsHi0jeM19eGMLWBgRJU6lEOx+5sjhho9JpFhiOzgEqw
   R+fTAsg56BXtm3p6L994TAbqbvbDRMqOxcl/A0hzBi4KI6Xk7wwFLN/lw
   /M6wWSw7P+kaA5WKg610Y95fLVuEVJPDpc4QFiMHaQ6k3SY6hx3GV29bl
   Q==;
X-CSE-ConnectionGUID: BpNCUomNT++r/A82ScEb6w==
X-CSE-MsgGUID: 6GwSaOQEQta+W6oYWRCheg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="117129546"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="117129546"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 02:58:10 -0700
X-CSE-ConnectionGUID: lpJjSwXATFq9q6EKmEgQgA==
X-CSE-MsgGUID: RGfCfvBSTTmG/Z/fyeCKEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="272383036"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.7])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 02:58:09 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8F19F121D05;
	Thu, 01 Oct 2026 12:58:06 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xCDVi-00000000AQD-3pQk;
	Thu, 01 Oct 2026 12:55:30 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH v2 1/1] media: ipu6: Take IPU8 support into account in Kconfig
Date: Thu,  1 Oct 2026 12:55:30 +0300
Message-ID: <20261001095530.40054-1-sakari.ailus@linux.intel.com>
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
since v1:

- The  VIDEO_INTEL_IPU6_IPU7 only affects IPUs 7 and 7.5.

 drivers/media/pci/intel/ipu6/Kconfig | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel/ipu6/Kconfig
index a1d036a78b57..3d3c7778be38 100644
--- a/drivers/media/pci/intel/ipu6/Kconfig
+++ b/drivers/media/pci/intel/ipu6/Kconfig
@@ -1,5 +1,5 @@
 config VIDEO_INTEL_IPU6
-	tristate "Intel IPU6 driver"
+	tristate "Intel IPU 6/7/8 driver"
 	depends on ACPI || COMPILE_TEST
 	depends on VIDEO_DEV
 	depends on X86 && HAS_DMA
@@ -11,11 +11,12 @@ config VIDEO_INTEL_IPU6
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
 	bool "Support IPU 7 and IPU 7.5 in ipu6 driver by default"

-- 
2.47.3

