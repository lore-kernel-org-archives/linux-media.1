Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDEE346E7D
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834111; cv=none; b=TRrPe5QGsAOA9rwFs1XceXY55dW9GQRaOrxyJ6rKSrELECmTfVQHKb5+O3TBgK7R309Tn4st0oTG7Wn6b+T+y5pMIjqWlk5SU78VQ6mBX6XBKUA/3QngJgAV4HdmzsjiqeB+jGjF/r1mnuz7txOXUQrDyXDcBTSI32J8I4UaNh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834111; c=relaxed/simple;
	bh=AjkyD/nCO1+Z1v+HZN6awOswLUYdsRSy41iWbYI5yXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Td3jl2m+3Czw4dCm9/UGDWIPLjF9ujhMhb+rcHBFmnmnARI9MTc5JYvWD/NW7bLY+41TP9UuRPMIIX7Z1/f1AFx92kFuro7ZtFbIcduP2mjbVvi5QQ2xYc/qhOQSrsZps/dNKGRaTr4Tiuyb1nbGg8CTJmkYFgSBJea+YhsWKmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YfUF2kbx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YfUF2kbx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834108; x=1819370108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AjkyD/nCO1+Z1v+HZN6awOswLUYdsRSy41iWbYI5yXM=;
  b=YfUF2kbxYWinzhLVSydhZFlGBC/nsARvZ6yLGD7ktLkEl3JZJWQ+I/gs
   ond9xaRAWtjO6Q+OvDD1Be4tyypK4knM4XPjIxl8XrL7rWleJ5DGz8ZO+
   S96K2fh+E5US0EqQmqQlWHLzgtxbcBk0JnH3HLr7dn+eJD9xKUQ1wYviP
   M5sYNM6FJNXyKNhgoCNRnTS2kzy6WL/OTvgMFhMwE6CfN6ykbXgQiPFjr
   UzocntR/hbn+mjQutTmQLV/28rvCx33g+SJOO9UhGkru8QiRwOaD1N7Sj
   o4nttuBJImZJTALBdAqmXQAGuVaQD4in++uHCkNDwPeJWrtO+sen1hREo
   Q==;
X-CSE-ConnectionGUID: vMnrp+pxSxe+PxhNWEfOnw==
X-CSE-MsgGUID: J4OO91mFQlufBKMeMIWvrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188675"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188675"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:35:07 -0700
X-CSE-ConnectionGUID: AWAbIelxRZKptKHXdsnCvQ==
X-CSE-MsgGUID: jlSd4FUTQumlFkgQzADwHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384650"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:35:06 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 39/44] media: ipu6: Move isys fw mapping to pci_probe
Date: Thu, 27 Aug 2026 15:33:31 +0300
Message-ID: <20260827123336.2219048-40-antti.laakso@linux.intel.com>
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

Consolidate isys and psys firmware mapping into a single location to
simplify ipu7 support and error handling.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-bus.h  |  1 -
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 29 ----------
 drivers/media/pci/intel/ipu6/ipu6.c      | 71 ++++++++++++++++++------
 3 files changed, 54 insertions(+), 47 deletions(-)

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
index af5581da7149..6e1d3b7efa20 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -480,6 +480,42 @@ static void ipu6_configure_vc_mechanism(struct ipu6_device *isp)
 	writel(val, isp->base + BUTTRESS_REG_BTRS_CTRL);
 }
 
+static int __ipu6_map_fw_by_sys(struct ipu6_device *isp, struct ipu6_bus_device *adev)
+{
+	int ret;
+
+	ret = ipu6_map_fw_region(adev, isp->cpd_fw->data, isp->cpd_fw->size,
+				 DMA_TO_DEVICE, 0);
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
+	int ret;
+
+	ret = __ipu6_map_fw_by_sys(isp, isp->psys);
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
@@ -624,19 +660,9 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
@@ -679,7 +705,13 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
@@ -696,13 +728,18 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 static void ipu6_pci_remove(struct pci_dev *pdev)
 {
 	struct ipu6_device *isp = pci_get_drvdata(pdev);
-	struct ipu6_mmu *isys_mmu = isp->isys->mmu;
-	struct ipu6_mmu *psys_mmu = isp->psys->mmu;
 
 	devm_free_irq(&pdev->dev, pdev->irq, isp);
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
@@ -712,8 +749,8 @@ static void ipu6_pci_remove(struct pci_dev *pdev)
 
 	release_firmware(isp->cpd_fw);
 
-	ipu6_mmu_cleanup(psys_mmu);
-	ipu6_mmu_cleanup(isys_mmu);
+	ipu6_mmu_cleanup(isp->psys->mmu);
+	ipu6_mmu_cleanup(isp->isys->mmu);
 }
 
 static void ipu6_pci_reset_prepare(struct pci_dev *pdev)
-- 
2.55.0

