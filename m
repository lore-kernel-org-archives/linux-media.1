Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146353D093A
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 07:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839910; cv=none; b=JGWN1SmSrGjr118BoS4S53jpD1pa5wRUg4xt1RuR+8MbCx5hwUBuQuOTHmd6WfQDLZpg5EHLck7PtuNloqEOeiL2KIkVuhN1UVzkVDXIr8B3a3aMR0tiPNruIyru4BOgT0nWepajrDxLsXU85TeY38pBqrORF9BWp7CPSd4m9/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839910; c=relaxed/simple;
	bh=gaxr4yKGdjRjG/Jv41s6laP+4DgqnbcAhvkfnP0/isQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f3bZOu39y5iZYBfZHKB6Ma7rKGtuAeYKwElNRaoTkbDwnJzQ4Ybwi8v3xswQqLnHPmkRMkgIpl18Sg7cDeSrUt7cu7ZFHdULpzsMSP6WsWvqUlmyJHxCre7rIAQMbOP6/0J0oXx9Xs0142Dr/cVHJSBw5CMR1aSVcwOxU4AT4RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ht0SDs2z; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ht0SDs2z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790839908; x=1822375908;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gaxr4yKGdjRjG/Jv41s6laP+4DgqnbcAhvkfnP0/isQ=;
  b=Ht0SDs2z4NgMgsf26Ceb432UpAAsvlDdXaSNmqmGdKuxAhbsmrTj2WsE
   HxoMfc8VODtUcdunmQsIkqRsan8aX1eYn6xsQe6hQ+qy4D+JIp/WQQB8g
   mc6hMnuH3KFk4Mz6UUld7ke8lhKA/nDSxkS9Q4McFMsX+NeGzvljEO7r/
   16BI8Kki6G28Q0irmSlBuWh1PAWB2BMCFTNtiIDOuEpB9VjBkXIzciXkJ
   39LVZhGqaRMWTjGMJZxyl6lf71DtZk5Ziop3cuOGDlsXvgmw6O6TTZBnu
   LiShtsKdnzlnIcIBtR0434alqJ+1Kh4B/xhh6axeMSe6EYW+Sku7VQMLA
   w==;
X-CSE-ConnectionGUID: AFgKz5CvRyytlo1F4rr4dA==
X-CSE-MsgGUID: qvC33ERpRuuDLjvEzhMk6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="79150761"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="79150761"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:31:48 -0700
X-CSE-ConnectionGUID: P9J+5ZzCTImGOVpGT41aDQ==
X-CSE-MsgGUID: yFUfEmQCTQ6K3l/fc4gt0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="279215607"
Received: from vtg-bdc-vm10.iil.intel.com ([143.185.124.149])
  by orviesa004.jf.intel.com with ESMTP; 01 Oct 2026 00:31:47 -0700
From: Divyamani Tripathi <divyamani.tripathi@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com,
	manik.bajpai@intel.com,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH v2 2/7] media: ipu6: add IS_IPU8() macro
Date: Thu,  1 Oct 2026 10:31:29 +0300
Message-ID: <20261001073134.4031143-3-divyamani.tripathi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001073134.4031143-1-divyamani.tripathi@intel.com>
References: <20261001073134.4031143-1-divyamani.tripathi@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add IPU_VERSION_8 and an IS_IPU8() accessor mirroring
IS_IPU7()/IS_IPU7P5(), plus the IPU8 firmware/model name defines, as
the baseline for the rest of this series.

Signed-off-by: Divyamani Tripathi <divyamani.tripathi@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index 72c5063d5198..20ffbb4a9934 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -18,6 +18,7 @@ struct ipu6_bus_device;
 #define IPU6_MEDIA_DEV_MODEL_NAME	"ipu6"
 #define IPU7_MEDIA_DEV_MODEL_NAME	"ipu7"
 #define IPU7P5_MEDIA_DEV_MODEL_NAME	"ipu7.5"
+#define IPU8_MEDIA_DEV_MODEL_NAME	"ipu8"
 
 #define IPU6SE_FIRMWARE_NAME		"intel/ipu/ipu6se_fw.bin"
 #define IPU6EP_FIRMWARE_NAME		"intel/ipu/ipu6ep_fw.bin"
@@ -26,6 +27,7 @@ struct ipu6_bus_device;
 #define IPU6EPADLN_FIRMWARE_NAME	"intel/ipu/ipu6epadln_fw.bin"
 #define IPU7_FIRMWARE_NAME		"intel/ipu/ipu7_fw.bin"
 #define IPU7P5_FIRMWARE_NAME		"intel/ipu/ipu7ptl_fw.bin"
+#define IPU8_FIRMWARE_NAME		"intel/ipu/ipu8_fw.bin"
 
 #define IPU_VERSION_6		BIT(0) /* TGL */
 #define IPU_VERSION_6SE		BIT(1) /* JSL */
@@ -33,6 +35,7 @@ struct ipu6_bus_device;
 #define IPU_VERSION_6EP_MTL	BIT(3) /* MTL */
 #define IPU_VERSION_7		BIT(4) /* LNL */
 #define IPU_VERSION_7P5		BIT(5) /* PTL */
+#define IPU_VERSION_8		BIT(6) /* NVL */
 
 #define IS_IPU6_TGL(isp)	((isp)->hw_ver & IPU_VERSION_6)
 #define IS_IPU6SE(isp)		((isp)->hw_ver & IPU_VERSION_6SE)
@@ -42,6 +45,7 @@ struct ipu6_bus_device;
 				 (IPU_VERSION_7 | IPU_VERSION_7P5))
 #define IS_IPU7_MTL(isp)	((isp)->hw_ver & IPU_VERSION_7)
 #define IS_IPU7P5(isp)		((isp)->hw_ver & IPU_VERSION_7P5)
+#define IS_IPU8(isp)		((isp)->hw_ver & IPU_VERSION_8)
 
 /*
  * ISYS DMA can overshoot. For higher resolutions over allocation is one line
-- 
2.43.0

