Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E71948C8A3
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312710; cv=none; b=esGgvgwdeYLd7T6brR4DoujCXePMGqqoFnCX6Rx8KC2/tvU43R7gJTp9MSvcViX60ARHS4hxx4Ww2USnswMAjcOK4FHhYUH5hpVAktph9uaCT5NNSL2tmhHDbuBR1anHMtl9BsXtG4mcKLDBdXWX+unENRGm+pu+P1zF3yiuW74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312710; c=relaxed/simple;
	bh=+MWGL4P0HP1zUfRKqo0T/BJKa+iSfJj6xZvMo/prAgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eoaKdCQDoCdSjvRU2arUrYxWNPhPZVE7THMJE2IqtOm1E0oF0+GfF/5YG/z/5OIZaPfaeByFJimdU43DA0lS4wr9bf8cvAzvb5oSIVbA4A/BWGHVglk0ovtUwPhn7D68xQafQoaJ8Sj4XqNqm7Fy8jh2nE6qCf/Y9ncGEkBLzjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JN3kxlVU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JN3kxlVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312708; x=1818848708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+MWGL4P0HP1zUfRKqo0T/BJKa+iSfJj6xZvMo/prAgA=;
  b=JN3kxlVUMm2FzsASlt8tdKxiw1obmkGYt6ohhGUG0/FvjZMOnp5Z0s7H
   UDqDpWiUR/9sfBJuU3AmfAbis0A7gGxcPid1ivn12pYQaJVyBWbqLUmxr
   I8hBq6sQix5zLr4mMYNQOSMDW8+0B7U+4Wu6oHORZVx4COgiQquBFcFwi
   FcWOR0qxDrOBHR0+CBHCHG5Je4CAO/EGrgso9YCyRtIb2f/kPHt9VkBX0
   LjtWzRzOpjCUMxgDOkkHLZAFQtX/Ec7MBvuftEIEncn3wVx6ItLeUcIhj
   tOHdrnC36iHLmFP+67HH4yGzr6ff0qkedDN/LeIjW+f5wKOKOA/OLKUlf
   g==;
X-CSE-ConnectionGUID: 7OH4Ulf7TJWg6dF8XLUCDg==
X-CSE-MsgGUID: 9XeL1nj2Rsi9WatNiKSMPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989133"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989133"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:45:08 -0700
X-CSE-ConnectionGUID: q3Z5tbinRaK0VAzSwjpzSQ==
X-CSE-MsgGUID: cl0pXwMcTSKaT7M+UUq5KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172467"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:45:05 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 39/44] media: ipu6: Move isys fw mapping to pci_probe
Date: Fri, 21 Aug 2026 14:42:57 +0300
Message-ID: <20260821114302.365532-40-antti.laakso@linux.intel.com>
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

We are bout to add ipu7 firmware mapping. It is slightly different from
ipu6. Handling this and possible errors is easier when both isys and
psys mapping is in one place.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-bus.h  |  1 -
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 29 -----------
 drivers/media/pci/intel/ipu6/ipu6.c      | 63 +++++++++++++++++++-----
 3 files changed, 50 insertions(+), 43 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-bus.h b/drivers/media/pci/intel/ipu6/ipu6-bus.h
index aef8e4a66c4a..d2f93eb03dea 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-bus.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-bus.h
@@ -26,7 +26,6 @@ struct ipu6_bus_device {
 	struct ipu6_mmu *mmu;
 	struct ipu6_device *isp;
 	const struct ipu6_buttress_ctrl *ctrl;
-	const struct firmware *fw;
 	struct sg_table fw_sgt;
 	u64 *pkg_dir;
 	dma_addr_t pkg_dir_dma_addr;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 459121e6c1cb..3fb34d2d189c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -995,7 +995,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	const struct ipu6_isys_internal_csi2_pdata *csi2_pdata;
 	struct ipu6_bus_device *adev = auxdev_to_adev(auxdev);
 	struct ipu6_device *isp = adev->isp;
-	const struct firmware *fw;
 	struct ipu6_isys *isys;
 	unsigned int i;
 	int ret;
@@ -1040,18 +1039,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
 
 	isys_stream_init(isys);
 
-	if (!isp->secure_mode) {
-		fw = isp->cpd_fw;
-		ret = ipu6_map_fw_region(adev, fw->data, fw->size,
-					 DMA_TO_DEVICE, 0);
-		if (ret)
-			goto release_firmware;
-
-		ret = ipu6_cpd_create_pkg_dir(adev, isp->cpd_fw->data);
-		if (ret)
-			goto remove_shared_buffer;
-	}
-
 	cpu_latency_qos_add_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
 
 	ret = alloc_fw_msg_bufs(isys, 20);
@@ -1079,14 +1066,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	free_fw_msg_bufs(isys);
 out_remove_pkg_dir_shared_buffer:
 	cpu_latency_qos_remove_request(&isys->pm_qos);
-	if (!isp->secure_mode)
-		ipu6_cpd_free_pkg_dir(adev);
-remove_shared_buffer:
-	if (!isp->secure_mode)
-		ipu6_unmap_fw_region(adev, DMA_TO_DEVICE);
-release_firmware:
-	if (!isp->secure_mode)
-		release_firmware(adev->fw);
 
 	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++)
 		mutex_destroy(&isys->streams[i].mutex);
@@ -1099,9 +1078,7 @@ static int isys_probe(struct auxiliary_device *auxdev,
 
 static void isys_remove(struct auxiliary_device *auxdev)
 {
-	struct ipu6_bus_device *adev = auxdev_to_adev(auxdev);
 	struct ipu6_isys *isys = dev_get_drvdata(&auxdev->dev);
-	struct ipu6_device *isp = adev->isp;
 	unsigned int i;
 
 	free_fw_msg_bufs(isys);
@@ -1111,12 +1088,6 @@ static void isys_remove(struct auxiliary_device *auxdev)
 
 	cpu_latency_qos_remove_request(&isys->pm_qos);
 
-	if (!isp->secure_mode) {
-		ipu6_cpd_free_pkg_dir(adev);
-		ipu6_unmap_fw_region(adev, DMA_TO_DEVICE);
-		release_firmware(adev->fw);
-	}
-
 	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++)
 		mutex_destroy(&isys->streams[i].mutex);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index af5581da7149..d27ffd7ac6f0 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -480,6 +480,40 @@ static void ipu6_configure_vc_mechanism(struct ipu6_device *isp)
 	writel(val, isp->base + BUTTRESS_REG_BTRS_CTRL);
 }
 
+static int __ipu6_map_fw_by_sys(struct ipu6_device *isp, struct ipu6_bus_device *adev)
+{
+	int ret = ipu6_map_fw_region(adev, isp->cpd_fw->data, isp->cpd_fw->size,
+				 DMA_TO_DEVICE, 0);
+
+	if (ret) {
+		dev_err_probe(&isp->pdev->dev, ret,
+			      "Firmware mapping failed\n");
+		return ret;
+	}
+
+	ret = ipu6_cpd_create_pkg_dir(adev, isp->cpd_fw->data);
+	if (ret) {
+		dev_err_probe(&isp->pdev->dev, ret,
+			      "failed to create pkg dir\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ipu6_map_fw(struct ipu6_device *isp)
+{
+	int ret = __ipu6_map_fw_by_sys(isp, isp->psys);
+
+	if (ret)
+		return ret;
+
+	if (!isp->secure_mode)
+		return __ipu6_map_fw_by_sys(isp, isp->isys);
+
+	return 0;
+}
+
 static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	const struct ipu6_buttress_ctrl *isys_ctrl, *psys_ctrl;
@@ -624,19 +658,9 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto out_ipu6_rpm_put;
 	}
 
-	ret = ipu6_map_fw_region(isp->psys, isp->cpd_fw->data,
-				 isp->cpd_fw->size, DMA_TO_DEVICE, 0);
-	if (ret) {
-		dev_err_probe(&isp->pdev->dev, ret, "failed to map fw image\n");
-		goto out_ipu6_rpm_put;
-	}
-
-	ret = ipu6_cpd_create_pkg_dir(isp->psys, isp->cpd_fw->data);
-	if (ret) {
-		dev_err_probe(&isp->pdev->dev, ret,
-			      "failed to create pkg dir\n");
+	ret = ipu6_map_fw(isp);
+	if (ret)
 		goto out_ipu6_rpm_put;
-	}
 
 	ret = devm_request_threaded_irq(dev, pdev->irq, ipu6_buttress_isr,
 					ipu6_buttress_isr_threaded,
@@ -679,7 +703,13 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 out_ipu6_bus_del_devices:
 	if (!IS_ERR_OR_NULL(isp->psys)) {
 		ipu6_cpd_free_pkg_dir(isp->psys);
-		ipu6_unmap_fw_region(isp->psys, DMA_TO_DEVICE);
+		if (isp->psys->fw_sgt.nents)
+			ipu6_unmap_fw_region(isp->psys, DMA_TO_DEVICE);
+	}
+	if (!IS_ERR_OR_NULL(isp->isys)) {
+		ipu6_cpd_free_pkg_dir(isp->isys);
+		if (isp->isys->fw_sgt.nents)
+			ipu6_unmap_fw_region(isp->isys, DMA_TO_DEVICE);
 	}
 	if (!IS_ERR_OR_NULL(isp->psys) && !IS_ERR_OR_NULL(isp->psys->mmu))
 		ipu6_mmu_cleanup(isp->psys->mmu);
@@ -703,6 +733,13 @@ static void ipu6_pci_remove(struct pci_dev *pdev)
 	ipu6_cpd_free_pkg_dir(isp->psys);
 
 	ipu6_unmap_fw_region(isp->psys, DMA_TO_DEVICE);
+
+	if (isp->isys) {
+		ipu6_cpd_free_pkg_dir(isp->isys);
+		if (isp->isys->fw_sgt.nents)
+			ipu6_unmap_fw_region(isp->isys, DMA_TO_DEVICE);
+	}
+
 	ipu6_buttress_exit(isp);
 
 	ipu6_bus_del_devices(pdev);
-- 
2.55.0

