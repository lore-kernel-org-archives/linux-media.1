Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408F2344D92
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834109; cv=none; b=pIiqiw0qcgRQdeYTB8/UItTBg7voz3iKl7MzYQ9voQ37EbjHtos9o7xnTIypyyYmxfRF5+uOoJfyxBdQysiwL3VEzXV0q+YllZyZ2e97/ImhPEwLt0uNPg6ui9TaYVgxmRZoVbhEFIpU/XLT01MSo5q1636zZR2ZpbULBADo5oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834109; c=relaxed/simple;
	bh=AdFL/RZFrBLnoiGw1pblHt4/PHXRUqZ1XvoXP6v0o00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VeyrA2obMuI3Mvwq2lhSsiMflN8Wn8GLhmI8dNsWMt04IBE+i3H2MiCXL1SsXpKNxfhOpEsevW/yVYpmRvMcpJ1tnY6/pguxwGzZ3dhfms6QIyAuidu2/QUmJfH6Jd+owukr3xVx8Ecc7c/ZrjZniAIsmlhgs2Z10nhtF86Cn0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJV5zlIc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJV5zlIc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834106; x=1819370106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AdFL/RZFrBLnoiGw1pblHt4/PHXRUqZ1XvoXP6v0o00=;
  b=gJV5zlIcohiyQaadWiA/BLSa/MsLVCt1SnPlk4krKvROH/zXsZNDjckP
   7FWFWTswzrQ/avsGOndKwD6tx3o6ii9LwGKwH6eTr3ZTuV+ccsnId6W4P
   JYE2tLNsL6ETTV7KMY0Tui57bCjTNnnta6HX/8OR48Il//jymRqHVRf3H
   LcCBrF4nxx/piAwdLLCEMvrb6CrRpjauJ95Zwu/J40i4Bc3ECT6DIguy4
   9roUCSZgjfG85rpqRJtmFuWjCRlzbHfLBFC9YnzV7yws05ZSbU5heK35i
   PkJxntwlbZGb5K8PiOSvv9AvTXvyLMjbprqrxeODrzFpMNIkPbglKVr5a
   w==;
X-CSE-ConnectionGUID: tPUfuGk7RQuGUq/lRKv0ow==
X-CSE-MsgGUID: ctmAKy/sRSi8niMNn2kzhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188669"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188669"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:35:05 -0700
X-CSE-ConnectionGUID: BEysoVucTOCv47NarHHscA==
X-CSE-MsgGUID: /rQ1lWcMSMyr2sIe6GI5xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384621"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:35:04 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 38/44] media: ipu6: Make fw mapping function reusable
Date: Thu, 27 Aug 2026 15:33:30 +0300
Message-ID: <20260827123336.2219048-39-antti.laakso@linux.intel.com>
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

Make ipu6_map_fw_region reusable as for ipu7 we want to map other
buffers too, not only firmware. Also add DMA data direction and mapping
attributes as arguments as these are different for ipu7.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 40 ++++++++++----------
 drivers/media/pci/intel/ipu6/ipu6-buttress.h | 10 ++---
 drivers/media/pci/intel/ipu6/ipu6-isys.c     |  7 ++--
 drivers/media/pci/intel/ipu6/ipu6.c          |  8 ++--
 4 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index 13fd7a083b25..74db0a37561e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -676,55 +676,55 @@ int ipu6_buttress_reset_authentication(struct ipu6_device *isp)
 	return 0;
 }
 
-int ipu6_buttress_map_fw_image(struct ipu6_bus_device *sys,
-			       const struct firmware *fw, struct sg_table *sgt)
+int ipu6_map_fw_region(struct ipu6_bus_device *sys, const void *data,
+		       size_t size, enum dma_data_direction dir,
+		       unsigned long attrs)
 {
-	bool is_vmalloc = is_vmalloc_addr(fw->data);
+	bool is_vmalloc = is_vmalloc_addr(data);
 	struct pci_dev *pdev = sys->isp->pdev;
+	struct sg_table *sgt = &sys->fw_sgt;
 	struct page **pages;
-	const void *addr;
 	unsigned long n_pages;
 	unsigned int i;
 	int ret;
 
-	if (!is_vmalloc && !virt_addr_valid(fw->data))
+	if (!is_vmalloc && !virt_addr_valid(data))
 		return -EDOM;
 
-	n_pages = PFN_UP(fw->size);
+	n_pages = PFN_UP(size);
 
 	pages = kmalloc_objs(*pages, n_pages);
 	if (!pages)
 		return -ENOMEM;
 
-	addr = fw->data;
 	for (i = 0; i < n_pages; i++) {
 		struct page *p = is_vmalloc ?
-			vmalloc_to_page(addr) : virt_to_page(addr);
+			vmalloc_to_page(data) : virt_to_page(data);
 
 		if (!p) {
 			ret = -ENOMEM;
 			goto out;
 		}
 		pages[i] = p;
-		addr += PAGE_SIZE;
+		data += PAGE_SIZE;
 	}
 
-	ret = sg_alloc_table_from_pages(sgt, pages, n_pages, 0, fw->size,
+	ret = sg_alloc_table_from_pages(sgt, pages, n_pages, 0, size,
 					GFP_KERNEL);
 	if (ret) {
 		ret = -ENOMEM;
 		goto out;
 	}
 
-	ret = dma_map_sgtable(&pdev->dev, sgt, DMA_TO_DEVICE, 0);
+	ret = dma_map_sgtable(&pdev->dev, sgt, dir, 0);
 	if (ret) {
 		sg_free_table(sgt);
 		goto out;
 	}
 
-	ret = ipu6_dma_map_sgtable(sys, sgt, DMA_TO_DEVICE, 0);
+	ret = ipu6_dma_map_sgtable(sys, sgt, dir, attrs);
 	if (ret) {
-		dma_unmap_sgtable(&pdev->dev, sgt, DMA_TO_DEVICE, 0);
+		dma_unmap_sgtable(&pdev->dev, sgt, dir, 0);
 		sg_free_table(sgt);
 		goto out;
 	}
@@ -736,18 +736,18 @@ int ipu6_buttress_map_fw_image(struct ipu6_bus_device *sys,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_buttress_map_fw_image, "INTEL_IPU6");
+EXPORT_SYMBOL_NS_GPL(ipu6_map_fw_region, "INTEL_IPU6");
 
-void ipu6_buttress_unmap_fw_image(struct ipu6_bus_device *sys,
-				  struct sg_table *sgt)
+void ipu6_unmap_fw_region(struct ipu6_bus_device *sys,
+			  enum dma_data_direction dir)
 {
 	struct pci_dev *pdev = sys->isp->pdev;
 
-	ipu6_dma_unmap_sgtable(sys, sgt, DMA_TO_DEVICE, 0);
-	dma_unmap_sgtable(&pdev->dev, sgt, DMA_TO_DEVICE, 0);
-	sg_free_table(sgt);
+	ipu6_dma_unmap_sgtable(sys, &sys->fw_sgt, dir, 0);
+	dma_unmap_sgtable(&pdev->dev, &sys->fw_sgt, dir, 0);
+	sg_free_table(&sys->fw_sgt);
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_buttress_unmap_fw_image, "INTEL_IPU6");
+EXPORT_SYMBOL_NS_GPL(ipu6_unmap_fw_region, "INTEL_IPU6");
 
 int ipu6_buttress_authenticate(struct ipu6_device *isp)
 {
diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
index 47a49e961945..79d8f5893686 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
@@ -84,11 +84,11 @@ struct ipu6_ipc_buttress_bulk_msg {
 };
 
 int ipu6_buttress_ipc_reset(struct ipu6_device *isp);
-int ipu6_buttress_map_fw_image(struct ipu6_bus_device *sys,
-			       const struct firmware *fw,
-			       struct sg_table *sgt);
-void ipu6_buttress_unmap_fw_image(struct ipu6_bus_device *sys,
-				  struct sg_table *sgt);
+int ipu6_map_fw_region(struct ipu6_bus_device *sys, const void *data,
+		       size_t size, enum dma_data_direction dir,
+		       unsigned long attrs);
+void ipu6_unmap_fw_region(struct ipu6_bus_device *sys,
+			  enum dma_data_direction dir);
 int ipu6_buttress_power(struct device *dev,
 			const struct ipu6_buttress_ctrl *ctrl, bool on);
 bool ipu6_buttress_get_secure_mode(struct ipu6_device *isp);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 5a3ba5007249..459121e6c1cb 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1042,7 +1042,8 @@ static int isys_probe(struct auxiliary_device *auxdev,
 
 	if (!isp->secure_mode) {
 		fw = isp->cpd_fw;
-		ret = ipu6_buttress_map_fw_image(adev, fw, &adev->fw_sgt);
+		ret = ipu6_map_fw_region(adev, fw->data, fw->size,
+					 DMA_TO_DEVICE, 0);
 		if (ret)
 			goto release_firmware;
 
@@ -1082,7 +1083,7 @@ static int isys_probe(struct auxiliary_device *auxdev,
 		ipu6_cpd_free_pkg_dir(adev);
 remove_shared_buffer:
 	if (!isp->secure_mode)
-		ipu6_buttress_unmap_fw_image(adev, &adev->fw_sgt);
+		ipu6_unmap_fw_region(adev, DMA_TO_DEVICE);
 release_firmware:
 	if (!isp->secure_mode)
 		release_firmware(adev->fw);
@@ -1112,7 +1113,7 @@ static void isys_remove(struct auxiliary_device *auxdev)
 
 	if (!isp->secure_mode) {
 		ipu6_cpd_free_pkg_dir(adev);
-		ipu6_buttress_unmap_fw_image(adev, &adev->fw_sgt);
+		ipu6_unmap_fw_region(adev, DMA_TO_DEVICE);
 		release_firmware(adev->fw);
 	}
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 428ad046e239..af5581da7149 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -624,8 +624,8 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto out_ipu6_rpm_put;
 	}
 
-	ret = ipu6_buttress_map_fw_image(isp->psys, isp->cpd_fw,
-					 &isp->psys->fw_sgt);
+	ret = ipu6_map_fw_region(isp->psys, isp->cpd_fw->data,
+				 isp->cpd_fw->size, DMA_TO_DEVICE, 0);
 	if (ret) {
 		dev_err_probe(&isp->pdev->dev, ret, "failed to map fw image\n");
 		goto out_ipu6_rpm_put;
@@ -679,7 +679,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 out_ipu6_bus_del_devices:
 	if (!IS_ERR_OR_NULL(isp->psys)) {
 		ipu6_cpd_free_pkg_dir(isp->psys);
-		ipu6_buttress_unmap_fw_image(isp->psys, &isp->psys->fw_sgt);
+		ipu6_unmap_fw_region(isp->psys, DMA_TO_DEVICE);
 	}
 	if (!IS_ERR_OR_NULL(isp->psys) && !IS_ERR_OR_NULL(isp->psys->mmu))
 		ipu6_mmu_cleanup(isp->psys->mmu);
@@ -702,7 +702,7 @@ static void ipu6_pci_remove(struct pci_dev *pdev)
 	devm_free_irq(&pdev->dev, pdev->irq, isp);
 	ipu6_cpd_free_pkg_dir(isp->psys);
 
-	ipu6_buttress_unmap_fw_image(isp->psys, &isp->psys->fw_sgt);
+	ipu6_unmap_fw_region(isp->psys, DMA_TO_DEVICE);
 	ipu6_buttress_exit(isp);
 
 	ipu6_bus_del_devices(pdev);
-- 
2.55.0

