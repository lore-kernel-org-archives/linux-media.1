Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86FB2DE70D
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834112; cv=none; b=Laa+8uMcv88fwJ/z1rC8ej9OCX8BzMvnOAQ2S/ywmnuvb7O1ZyM5UsTfuS37jg7r5AzDHGhvHDjRUzKBc6r62ae5gzK4znhFZbgXjwAYE6MQJmaSCizvtYi+2VZHsOWvfmofr4PSooVt40EKdw5aAPz7dMNWuspqNoF9lN+IW4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834112; c=relaxed/simple;
	bh=O7PwgxfanSwSUIYaJ4Mdh55Q8lH7u43rHUluYbtBFso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UEfB44lX2X6FWVQLIlixHnSPYrLDQTO3o4yWwKdRi4K8/vlX/yj3O3I7UFHT043D2fkrGqNuNdzxCXBv3Msx0Kz9rAwxAS+N1Nm2zVu7OU2YL5oaDweS0vbEs6TVWICoPh2lYtk6baNGMt0lBKECmGTWT3W4hjHBpp1MN9g1Ofw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hNkm1NmY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hNkm1NmY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834110; x=1819370110;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O7PwgxfanSwSUIYaJ4Mdh55Q8lH7u43rHUluYbtBFso=;
  b=hNkm1NmYHaBBYXAJWyaJmNw+J8+142T6H/d9AvRbLoPqWmGFpsBA4l4y
   Y5nZfuEvtZRuJMvph2+Q/lhP4jV0+KyZ8B79ElBVb0WJ72VMdDR4iA1bL
   M9waMqOwz8DDS3HwyOtlvXN1oN9DVg7Gvo6bt5e0qDjYk5zBFZS6CZ6c+
   beQwFNwLo93rp/QZORqcQBjlZxHdelGreC6T1bGbT5w2duWuaeriPYgSf
   nfcef/CBjeINRpnDvnWfwdjJ0tukvbL82RW+/ptBhD+PRD6tgCxnVsoyC
   9EpILzYinF2CBs9ApJGFKtlSgll/+d+FY/a6Yjz4VKGoA2lgE29vqwu06
   w==;
X-CSE-ConnectionGUID: w2ekjqayS9a5kry5flgsig==
X-CSE-MsgGUID: rA+V0FzzQwSYvm3gvCF0hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188682"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188682"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:35:09 -0700
X-CSE-ConnectionGUID: teqxDM/bSsyJc+N8FIP5WA==
X-CSE-MsgGUID: T6EohpkkRF+6LmAF5o7TCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384677"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:35:08 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 40/44] media: ipu6: Map ipu7 firmware
Date: Thu, 27 Aug 2026 15:33:32 +0300
Message-ID: <20260827123336.2219048-41-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827123336.2219048-1-antti.laakso@linux.intel.com>
References: <20260827123336.2219048-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ipu7 firmware mapping helpers to handle differences from ipu6.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 81 ++++++++++++++++++++++++++---
 drivers/media/pci/intel/ipu6/ipu6.h |  1 +
 2 files changed, 74 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 6e1d3b7efa20..c73b2426fb75 100644
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
@@ -516,6 +518,56 @@ static int ipu6_map_fw(struct ipu6_device *isp)
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
@@ -525,6 +577,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct ipu6_device *isp;
 	phys_addr_t phys;
 	u32 val, version, sku_id;
+	unsigned long dir;
 	int ret;
 
 	isp = devm_kzalloc(dev, sizeof(*isp), GFP_KERNEL);
@@ -660,7 +713,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto out_ipu6_rpm_put;
 	}
 
-	ret = ipu6_map_fw(isp);
+	ret = IS_IPU7(isp) ? ipu7_map_fw(isp) : ipu6_map_fw(isp);
 	if (ret)
 		goto out_ipu6_rpm_put;
 
@@ -703,16 +756,21 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
 	}
+
+	vfree(isp->fw_code_region);
+	isp->fw_code_region = NULL;
+
 	if (!IS_ERR_OR_NULL(isp->psys) && !IS_ERR_OR_NULL(isp->psys->mmu))
 		ipu6_mmu_cleanup(isp->psys->mmu);
 	if (!IS_ERR_OR_NULL(isp->isys) && !IS_ERR_OR_NULL(isp->isys->mmu))
@@ -728,18 +786,23 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 static void ipu6_pci_remove(struct pci_dev *pdev)
 {
 	struct ipu6_device *isp = pci_get_drvdata(pdev);
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
+	isp->fw_code_region = NULL;
+
 	ipu6_buttress_exit(isp);
 
 	ipu6_bus_del_devices(pdev);
@@ -749,8 +812,10 @@ static void ipu6_pci_remove(struct pci_dev *pdev)
 
 	release_firmware(isp->cpd_fw);
 
-	ipu6_mmu_cleanup(isp->psys->mmu);
-	ipu6_mmu_cleanup(isp->isys->mmu);
+	if (isp->psys)
+		ipu6_mmu_cleanup(isp->psys->mmu);
+	if (isp->isys)
+		ipu6_mmu_cleanup(isp->isys->mmu);
 }
 
 static void ipu6_pci_reset_prepare(struct pci_dev *pdev)
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

