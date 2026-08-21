Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256F648C402
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312711; cv=none; b=qiNTKPe+h61o17qSSGeppPDah4tyCLZTv9JyrTjE/y/yeKAEFBh8xyEsYpNQ8hh1xYLIZW2eZQYUiq7N1JccQY73ISlKkO5EwdsAs+j3zdXXtNpdppFuUoq3IF6FWCqmwWsXO26tkzAhvuIAUkPIJi7CQOXkLti8q0AD/nHTfjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312711; c=relaxed/simple;
	bh=zBGTynn29rKVEhYnGp2ddShTShMROqWcp73/q99rTZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nHUD+KuP9OtWqfCHq6Apc7ajx13rKCZeO8hB2YpTwLkf+5m+eTurfeHQHFv9CE//Kx3f0smo6KdnqvZkkSPyEZID3O26zWiae+gexMTIqA0Lq6jFvL5zGSgaQd28JlajEx16oBVCns20P64X1f5W6X1OU6Lp4Q/dVQW3v4rQRb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dVUeyaEr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVUeyaEr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312710; x=1818848710;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zBGTynn29rKVEhYnGp2ddShTShMROqWcp73/q99rTZg=;
  b=dVUeyaErMtrmzXJp8nOcbY0eaAQLUVSNWtvgU3tniCtYecA3a+TVjZD2
   Iz6nxcxoww7D9YulxkyQSXHubQiH3FHFJDHTy+6kba8kxZxpzb8nMzfHo
   YShc0pL0mtET68KOyxXk9l/OZsK5fB89DcUm+4uigosFUmSgUcJDhNJuG
   1RR8Ldf8u0CzsSndkYFD5sK0/9fQAaAEEj6/794VB8kL63/vO5tiGkMNJ
   E38zilqR/G30C2uumznfXrlbs7I00J6wkVtyrVD/GWF409j2FpNJf1pB0
   MdluqmdZRm3a8Oz+6d+5UQNIMAu2PsOlwA7EgUhARZbbt/YG2czD9qpN9
   g==;
X-CSE-ConnectionGUID: FLKSYjS6SqmQIQOVbnsP6Q==
X-CSE-MsgGUID: ZLd2bJieTlCql7gZT7ToZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989138"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989138"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:45:10 -0700
X-CSE-ConnectionGUID: J8mHf0pmQ1WgWhw5Z18JPQ==
X-CSE-MsgGUID: Jlcb8C3kR8m6BgBN4bYPLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172478"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:45:08 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 40/44] media: ipu6: Map ipu7 firmware
Date: Fri, 21 Aug 2026 14:42:58 +0300
Message-ID: <20260821114302.365532-41-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821114302.365532-1-antti.laakso@linux.intel.com>
References: <20260821114302.365532-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mapping of ipu7 firmware is slightly different compared to ipu6. Add
helpers for it and call them similar to ipu6.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 75 ++++++++++++++++++++++++++---
 drivers/media/pci/intel/ipu6/ipu6.h |  1 +
 2 files changed, 70 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index d27ffd7ac6f0..93f28ec9a74d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -19,6 +19,7 @@
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/vmalloc.h>
 
 #include <media/ipu-bridge.h>
 #include <media/ipu6-pci-table.h>
@@ -27,6 +28,7 @@
 #include "ipu6-bus.h"
 #include "ipu6-buttress.h"
 #include "ipu6-cpd.h"
+#include "ipu6-dma.h"
 #include "ipu6-isys.h"
 #include "ipu6-mmu.h"
 #include "ipu6-platform-buttress-regs.h"
@@ -514,6 +516,57 @@ static int ipu6_map_fw(struct ipu6_device *isp)
 	return 0;
 }
 
+static int __ipu7_map_fw_non_secure(struct ipu6_device *isp)
+{
+	int ret;
+
+	/*
+	 * Allocate and map memory for running the firmware. Not
+	 * required in secure mode, in which firmware runs in IMR.
+	 */
+	isp->fw_code_region = vmalloc(IPU7_FW_CODE_REGION_SIZE);
+	if (!isp->fw_code_region)
+		return -ENOMEM;
+
+	ret = ipu7_cpd_copy_binary(isp->cpd_fw->data, "isys",
+				   isp->fw_code_region, &isp->isys->fw_entry);
+	if (ret)
+		return ret;
+
+	ret = ipu6_map_fw_region(isp->isys, isp->fw_code_region,
+				 IPU7_FW_CODE_REGION_SIZE, DMA_BIDIRECTIONAL,
+				 DMA_ATTR_RESERVE_REGION);
+	if (ret)
+		return ret;
+
+	ret = ipu7_cpd_copy_binary(isp->cpd_fw->data, "psys",
+				   isp->fw_code_region, &isp->psys->fw_entry);
+	if (ret)
+		return ret;
+
+	return ipu6_map_fw_region(isp->psys, isp->fw_code_region,
+				  IPU7_FW_CODE_REGION_SIZE, DMA_BIDIRECTIONAL,
+				  DMA_ATTR_RESERVE_REGION);
+}
+
+static int ipu7_map_fw(struct ipu6_device *isp)
+{
+	int ret;
+
+	ret = isp->secure_mode ?
+		ipu6_map_fw_region(isp->psys, isp->cpd_fw->data,
+				   isp->cpd_fw->size, DMA_BIDIRECTIONAL, 0) :
+		__ipu7_map_fw_non_secure(isp);
+
+	if (ret) {
+		dev_err_probe(&isp->pdev->dev, ret,
+			      "Failed to init ipu7 firmware region\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	const struct ipu6_buttress_ctrl *isys_ctrl, *psys_ctrl;
@@ -523,6 +576,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct ipu6_device *isp;
 	phys_addr_t phys;
 	u32 val, version, sku_id;
+	unsigned long dir;
 	int ret;
 
 	isp = devm_kzalloc(dev, sizeof(*isp), GFP_KERNEL);
@@ -658,7 +712,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto out_ipu6_rpm_put;
 	}
 
-	ret = ipu6_map_fw(isp);
+	ret = IS_IPU7(isp) ? ipu7_map_fw(isp) : ipu6_map_fw(isp);
 	if (ret)
 		goto out_ipu6_rpm_put;
 
@@ -701,15 +755,20 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 out_ipu6_rpm_put:
 	pm_runtime_put_sync(&isp->psys->auxdev.dev);
 out_ipu6_bus_del_devices:
+	dir = IS_IPU7(isp) ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE;
 	if (!IS_ERR_OR_NULL(isp->psys)) {
 		ipu6_cpd_free_pkg_dir(isp->psys);
 		if (isp->psys->fw_sgt.nents)
-			ipu6_unmap_fw_region(isp->psys, DMA_TO_DEVICE);
+			ipu6_unmap_fw_region(isp->psys, dir);
 	}
 	if (!IS_ERR_OR_NULL(isp->isys)) {
 		ipu6_cpd_free_pkg_dir(isp->isys);
 		if (isp->isys->fw_sgt.nents)
-			ipu6_unmap_fw_region(isp->isys, DMA_TO_DEVICE);
+			ipu6_unmap_fw_region(isp->isys, dir);
+	}
+	if (isp->fw_code_region) {
+		vfree(isp->fw_code_region);
+		isp->fw_code_region = NULL;
 	}
 	if (!IS_ERR_OR_NULL(isp->psys) && !IS_ERR_OR_NULL(isp->psys->mmu))
 		ipu6_mmu_cleanup(isp->psys->mmu);
@@ -728,18 +787,22 @@ static void ipu6_pci_remove(struct pci_dev *pdev)
 	struct ipu6_device *isp = pci_get_drvdata(pdev);
 	struct ipu6_mmu *isys_mmu = isp->isys->mmu;
 	struct ipu6_mmu *psys_mmu = isp->psys->mmu;
+	unsigned long dir;
 
 	devm_free_irq(&pdev->dev, pdev->irq, isp);
-	ipu6_cpd_free_pkg_dir(isp->psys);
 
-	ipu6_unmap_fw_region(isp->psys, DMA_TO_DEVICE);
+	dir = IS_IPU7(isp) ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE;
+	ipu6_cpd_free_pkg_dir(isp->psys);
+	ipu6_unmap_fw_region(isp->psys, dir);
 
 	if (isp->isys) {
 		ipu6_cpd_free_pkg_dir(isp->isys);
 		if (isp->isys->fw_sgt.nents)
-			ipu6_unmap_fw_region(isp->isys, DMA_TO_DEVICE);
+			ipu6_unmap_fw_region(isp->isys, dir);
 	}
 
+	vfree(isp->fw_code_region);
+
 	ipu6_buttress_exit(isp);
 
 	ipu6_bus_del_devices(pdev);
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index 6bef45a02c2b..a2992ffe8e3c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -70,6 +70,7 @@ struct ipu6_device {
 	bool secure_mode;
 	u8 hw_ver;
 	bool bus_ready_to_probe;
+	u32 *fw_code_region;
 };
 
 #define IPU_PSYS	0
-- 
2.55.0

