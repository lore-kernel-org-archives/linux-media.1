Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57215259C9C
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834038; cv=none; b=k2y+PBjVZGkoiCPaeLdsj1dMzMl2s0dTUlNmfWkCWtCWXYSgaKuhK0NO192ey2ClTk75EEtEBjnkbIBa8rhKVmqREPlV5FxhOM+/aA9iPMev/4he7usyxYtzYmq6reD+PSnJPPE9BADqJCaj2GaQpERE2inBDUBAgCqN67nXWcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834038; c=relaxed/simple;
	bh=/ned6zzkzTfD4yaJOnDpfz6sROe5y0rzyUXxXnHL2RY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bPLuDyZysV38xcmFYVbG4HBrfiFw5+VDXBYNmXjSlf33P9G43Qt14DBnR/wflBVtCugOfFP7iKfQd0he/O1KzJ/Sib1nLimZukleHCzFQclfEJ5F5xlpIBH6TRMI1XRvmNXQFVf/wbKK4Z3tRi7J7rgLdotb+MCRbSD2plkhXgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H65G4lWs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H65G4lWs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834031; x=1819370031;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/ned6zzkzTfD4yaJOnDpfz6sROe5y0rzyUXxXnHL2RY=;
  b=H65G4lWsvS71a1abJwfN92NKO3ZY/lCN72EhAd5SgyvztFAtv8FtZ/Wp
   Jjs13k/kqVaq9BkDG6pZ4zF8PZaT0pNMLWmyaP4+Y4NbogHi0hFUIhtdq
   EtgOLdjUICCXP/c04aSMuuo9rM8B9sgCqanzScHAAYasTrv4cjo4YAybV
   csFg8dgHdfV1r2ET+863GBcql+BM64uJtYxrgcW1HqwvjU0p3bdNv5n6W
   J7D4mQrVFYDfBj5YtZhHZy/G9nWOU65MBNnTa4+NayQ/X/1vRnghwyqCT
   YBDVg3OlBjBB1+/eWvKn+C+qXOwRC00j0dfsa5YbI3FSGA04ISlTqPbnV
   A==;
X-CSE-ConnectionGUID: q31V6uJPTlC/kTcyQH2ZXA==
X-CSE-MsgGUID: fNdDT5bzR3iqqA45txyY6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188476"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188476"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:33:51 -0700
X-CSE-ConnectionGUID: DGKUplIcTIKgkDVKcoPD+A==
X-CSE-MsgGUID: ZQoNKokuROmmd0DvGZDLIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384197"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:33:49 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 01/44] media: ipu6: Add helpers for IPU runtime variation
Date: Thu, 27 Aug 2026 15:32:53 +0300
Message-ID: <20260827123336.2219048-2-antti.laakso@linux.intel.com>
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

And replace inline functions with defines.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c |  4 +--
 drivers/media/pci/intel/ipu6/ipu6.c      | 29 ++++++++--------
 drivers/media/pci/intel/ipu6/ipu6.h      | 42 +++++-------------------
 3 files changed, 25 insertions(+), 50 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 24db2763de54..799e7b30e6a2 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1104,9 +1104,9 @@ static int isys_probe(struct auxiliary_device *auxdev,
 
 	isys_iwake_watermark_init(isys);
 
-	if (is_ipu6se(adev->isp->hw_ver))
+	if (IS_IPU6SE(adev->isp))
 		isys->phy_set_power = ipu6_isys_jsl_phy_set_power;
-	else if (is_ipu6ep_mtl(adev->isp->hw_ver))
+	else if (IS_IPU6EP_MTL(adev->isp))
 		isys->phy_set_power = ipu6_isys_dwc_phy_set_power;
 	else
 		isys->phy_set_power = ipu6_isys_mcd_phy_set_power;
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 5449a2006bcc..6d3235352a1c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -290,8 +290,6 @@ EXPORT_SYMBOL_NS_GPL(ipu6_configure_spc, "INTEL_IPU6");
 
 static void ipu6_internal_pdata_init(struct ipu6_device *isp)
 {
-	u8 hw_ver = isp->hw_ver;
-
 	isys_ipdata.num_parallel_streams = IPU6_ISYS_NUM_STREAMS;
 	isys_ipdata.sram_gran_shift = IPU6_SRAM_GRANULARITY_SHIFT;
 	isys_ipdata.sram_gran_size = IPU6_SRAM_GRANULARITY_SIZE;
@@ -314,19 +312,19 @@ static void ipu6_internal_pdata_init(struct ipu6_device *isp)
 		IPU6_REG_ISYS_CSI_TOP_CTRL0_IRQ_STATUS;
 	isys_ipdata.csi2.ctrl0_irq_lnp =
 		IPU6_REG_ISYS_CSI_TOP_CTRL0_IRQ_LEVEL_NOT_PULSE;
-	isys_ipdata.enhanced_iwake = is_ipu6ep_mtl(hw_ver) || is_ipu6ep(hw_ver);
+	isys_ipdata.enhanced_iwake = IS_IPU6EP_MTL(isp) || IS_IPU6EP(isp);
 	psys_ipdata.hw_variant.spc_offset = IPU6_PSYS_SPC_OFFSET;
 	isys_ipdata.csi2.fw_access_port_ofs = CSI_REG_HUB_FW_ACCESS_PORT_OFS;
 
-	if (is_ipu6ep(hw_ver)) {
+	if (IS_IPU6EP(isp)) {
 		isys_ipdata.ltr = IPU6EP_LTR_VALUE;
 		isys_ipdata.memopen_threshold = IPU6EP_MIN_MEMOPEN_TH;
 	}
 
-	if (is_ipu6_tgl(hw_ver))
+	if (IS_IPU6_TGL(isp))
 		isys_ipdata.csi2.nports = IPU6_TGL_ISYS_CSI2_NPORTS;
 
-	if (is_ipu6ep_mtl(hw_ver)) {
+	if (IS_IPU6EP_MTL(isp)) {
 		isys_ipdata.csi2.nports = IPU6EP_MTL_ISYS_CSI2_NPORTS;
 
 		isys_ipdata.csi2.ctrl0_irq_edge =
@@ -347,7 +345,7 @@ static void ipu6_internal_pdata_init(struct ipu6_device *isp)
 		isys_ipdata.memopen_threshold = IPU6EP_MTL_MIN_MEMOPEN_TH;
 	}
 
-	if (is_ipu6se(hw_ver)) {
+	if (IS_IPU6SE(isp)) {
 		isys_ipdata.csi2.nports = IPU6SE_ISYS_CSI2_NPORTS;
 		isys_ipdata.csi2.irq_mask = IPU6SE_CSI_RX_ERROR_IRQ_MASK;
 		isys_ipdata.num_parallel_streams = IPU6SE_ISYS_NUM_STREAMS;
@@ -454,12 +452,13 @@ ipu6_psys_init(struct pci_dev *pdev, struct device *parent,
 	return psys_adev;
 }
 
-static int ipu6_pci_config_setup(struct pci_dev *dev, u8 hw_ver)
+static int ipu6_pci_config_setup(struct pci_dev *dev)
 {
+	struct ipu6_device *isp = pci_get_drvdata(dev);
 	int ret;
 
 	/* No PCI msi capability for IPU6EP */
-	if (is_ipu6ep(hw_ver) || is_ipu6ep_mtl(hw_ver)) {
+	if (IS_IPU6EP(isp) || IS_IPU6EP_MTL(isp)) {
 		/* likely do nothing as msi not enabled by default */
 		pci_disable_msi(dev);
 		return 0;
@@ -525,26 +524,26 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	isp->cpd_metadata_cmpnt_size = sizeof(struct ipu6_cpd_metadata_cmpnt);
 	switch (id->device) {
 	case PCI_DEVICE_ID_INTEL_IPU6:
-		isp->hw_ver = IPU6_VER_6;
+		isp->hw_ver = IPU_VERSION_6;
 		isp->cpd_fw_name = IPU6_FIRMWARE_NAME;
 		break;
 	case PCI_DEVICE_ID_INTEL_IPU6SE:
-		isp->hw_ver = IPU6_VER_6SE;
+		isp->hw_ver = IPU_VERSION_6SE;
 		isp->cpd_fw_name = IPU6SE_FIRMWARE_NAME;
 		isp->cpd_metadata_cmpnt_size =
 			sizeof(struct ipu6se_cpd_metadata_cmpnt);
 		break;
 	case PCI_DEVICE_ID_INTEL_IPU6EP_ADLP:
 	case PCI_DEVICE_ID_INTEL_IPU6EP_RPLP:
-		isp->hw_ver = IPU6_VER_6EP;
+		isp->hw_ver = IPU_VERSION_6EP;
 		isp->cpd_fw_name = IPU6EP_FIRMWARE_NAME;
 		break;
 	case PCI_DEVICE_ID_INTEL_IPU6EP_ADLN:
-		isp->hw_ver = IPU6_VER_6EP;
+		isp->hw_ver = IPU_VERSION_6EP;
 		isp->cpd_fw_name = IPU6EPADLN_FIRMWARE_NAME;
 		break;
 	case PCI_DEVICE_ID_INTEL_IPU6EP_MTL:
-		isp->hw_ver = IPU6_VER_6EP_MTL;
+		isp->hw_ver = IPU_VERSION_6EP_MTL;
 		isp->cpd_fw_name = IPU6EPMTL_FIRMWARE_NAME;
 		break;
 	default:
@@ -564,7 +563,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
-	ret = ipu6_pci_config_setup(pdev, isp->hw_ver);
+	ret = ipu6_pci_config_setup(pdev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index 92e3c3414c91..07ca59048f44 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -23,39 +23,15 @@ struct ipu6_bus_device;
 #define IPU6EPMTL_FIRMWARE_NAME		"intel/ipu/ipu6epmtl_fw.bin"
 #define IPU6EPADLN_FIRMWARE_NAME	"intel/ipu/ipu6epadln_fw.bin"
 
-enum ipu6_version {
-	IPU6_VER_INVALID = 0,
-	IPU6_VER_6 = 1,
-	IPU6_VER_6SE = 3,
-	IPU6_VER_6EP = 5,
-	IPU6_VER_6EP_MTL = 6,
-};
-
-/*
- * IPU6 - TGL
- * IPU6SE - JSL
- * IPU6EP - ADL/RPL
- * IPU6EP_MTL - MTL
- */
-static inline bool is_ipu6se(u8 hw_ver)
-{
-	return hw_ver == IPU6_VER_6SE;
-}
-
-static inline bool is_ipu6ep(u8 hw_ver)
-{
-	return hw_ver == IPU6_VER_6EP;
-}
-
-static inline bool is_ipu6ep_mtl(u8 hw_ver)
-{
-	return hw_ver == IPU6_VER_6EP_MTL;
-}
-
-static inline bool is_ipu6_tgl(u8 hw_ver)
-{
-	return hw_ver == IPU6_VER_6;
-}
+#define IPU_VERSION_6		BIT(0) /* TGL */
+#define IPU_VERSION_6SE		BIT(1) /* JSL */
+#define IPU_VERSION_6EP		BIT(2) /* ADL/RPL */
+#define IPU_VERSION_6EP_MTL	BIT(3) /* MTL */
+
+#define IS_IPU6_TGL(isp)	((isp)->hw_ver & IPU_VERSION_6)
+#define IS_IPU6SE(isp)		((isp)->hw_ver & IPU_VERSION_6SE)
+#define IS_IPU6EP(isp)		((isp)->hw_ver & IPU_VERSION_6EP)
+#define IS_IPU6EP_MTL(isp)	((isp)->hw_ver & IPU_VERSION_6EP_MTL)
 
 /*
  * ISYS DMA can overshoot. For higher resolutions over allocation is one line
-- 
2.55.0

