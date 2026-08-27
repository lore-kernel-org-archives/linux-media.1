Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7562E7387
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834118; cv=none; b=h/dLRoNmddw68aj4x2CkSy7dtX9isv4Czq2ZU4/gIIGONmfuJZy3CNhFWX5Brt4zLhxaaHvqfi3wejzWBfaRXPkp35VbUCzYsl9YzzuIcj6L4RkB+FFBr1kjpnI8FOceJwCF0m6GPcUbqQy3vIpUh6dmL+1jllMM7t8N8sGSxeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834118; c=relaxed/simple;
	bh=WpTSn+qlmDUhVqJsThvvqcFXonj5IwvIhsODOliNtvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qK8/iuOzSnlbVB6DGyKeRO6iKA7AiaAiTBWpSsUXc5dyaB5LUZP5BRC/NAPA9dW+iYubvKfMcgUbkwXAfZvxyfDQfexo2BSidVhGkH6fa6IHD/rpOfYgdlQQpBub2yAhNeciElfEKA9VambxXovj4r3IIo5UzBib+kFFh2ppeXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L16yD4oJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L16yD4oJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834116; x=1819370116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WpTSn+qlmDUhVqJsThvvqcFXonj5IwvIhsODOliNtvM=;
  b=L16yD4oJHRHWwLD3b101i3G8YGs3d3rKFWEkRh0MvYsFvD0gsjlNgZFY
   ouRtUpg/z/izoaxHyKG3+c1bE5NeBCsUlh8MsGdNnPlzgVMNxvFbumxJE
   Wso26/raNZPmNIceM21d3z6QYOzhEqt5XBiN9u3bmHd+b8b9V7p/WWwg9
   sCY7I0DyNo7oLxDoEl0E9UFVctsu2wJpJdOr5oONXbvD1qqE62Zk3Fg18
   7zq+ayOboOdUfoIrmy4m+hZ5jHU4Bq4hQ0RhvVu78MesZk+ZcVTWBmbDf
   WvzZwUqNsBB4dJoexmqhIz5VfL5qTq19xsfKFLZgxMhGgJAYOYSSZS+HG
   w==;
X-CSE-ConnectionGUID: PVIJIarATPSTP1i2stlLYA==
X-CSE-MsgGUID: PBxDzOC4T6CuhRfZYRv7Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188695"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188695"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:35:13 -0700
X-CSE-ConnectionGUID: pwV2u4G2TlaxsFJT0NOjQg==
X-CSE-MsgGUID: xcL9ITvTTBCqmzZ4y0UhSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384708"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:35:11 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 42/44] media: ipu6: Add ipu7.5 buttress support
Date: Thu, 27 Aug 2026 15:33:34 +0300
Message-ID: <20260827123336.2219048-43-antti.laakso@linux.intel.com>
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

The ipu7.5 buttress differs from ipu7 slightly,
add support for ipu7.5.
Also set hardware version, firmware and model names
for ipu7.5.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c  | 53 +++++++++++++++++--
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |  7 +++
 drivers/media/pci/intel/ipu6/ipu6.c           | 38 +++++++++++++
 drivers/media/pci/intel/ipu6/ipu6.h           |  1 +
 4 files changed, 94 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index 74db0a37561e..105de1744dff 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2013--2024 Intel Corporation
  */
 
+#include <asm/cpu_device_id.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/completion.h>
@@ -900,11 +901,30 @@ static int ipu6_buttress_send_tsc_request(struct ipu6_device *isp)
 	return ret;
 }
 
-int ipu6_buttress_start_tsc_sync(struct ipu6_device *isp)
+static int __ipu7p5_start_tsc_sync(struct ipu6_device *isp)
 {
-	unsigned int i;
+	u32 val;
+
+	val = readl(isp->base + IPU7_BUTTRESS_REG_TSC_CTL);
+	val |= IPU7_BUTTRESS_SEL_PB_TIMESTAMP;
+	writel(val, isp->base + IPU7_BUTTRESS_REG_TSC_CTL);
+
+	for (unsigned int i = 0; i < BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX; i++) {
+		val = readl(isp->base + IPU7_BUTTRESS_REG_PB_TIMESTAMP_VALID);
+		if (val == 1)
+			return 0;
+
+		usleep_range(40, 50);
+	}
+
+	dev_err(&isp->pdev->dev, "TSC sync failed (timeout)\n");
+
+	return -ETIMEDOUT;
+}
 
-	for (i = 0; i < BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX; i++) {
+static int __ipu6_start_tsc_sync(struct ipu6_device *isp)
+{
+	for (unsigned int i = 0; i < BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX; i++) {
 		u32 val;
 		int ret;
 
@@ -925,6 +945,14 @@ int ipu6_buttress_start_tsc_sync(struct ipu6_device *isp)
 
 	return -ETIMEDOUT;
 }
+
+int ipu6_buttress_start_tsc_sync(struct ipu6_device *isp)
+{
+	if (IS_IPU7P5(isp))
+		return __ipu7p5_start_tsc_sync(isp);
+
+	return __ipu6_start_tsc_sync(isp);
+}
 EXPORT_SYMBOL_NS_GPL(ipu6_buttress_start_tsc_sync, "INTEL_IPU6");
 
 void ipu6_buttress_tsc_read(struct ipu6_device *isp, u64 *val)
@@ -987,6 +1015,13 @@ u32 ipu7_buttress_get_isys_freq(struct ipu6_device *isp)
 }
 EXPORT_SYMBOL_NS_GPL(ipu7_buttress_get_isys_freq, "INTEL_IPU6");
 
+static const struct x86_cpu_id ipu7_misc_cfg_exclusion[] = {
+	X86_MATCH_VFM_STEPS(INTEL_PANTHERLAKE_L, 0x1, 0x1, 0),
+	{},
+};
+
+#define IPU7_WRXREQOP_OVRD_VAL_MASK  GENMASK(22, 19)
+
 static void ipu7_buttress_setup(struct ipu6_device *isp)
 {
 	struct ipu6_buttress *b = &isp->buttress;
@@ -995,12 +1030,20 @@ static void ipu7_buttress_setup(struct ipu6_device *isp)
 	/* program PB BAR */
 	writel(0, isp->pb_base + IPU7_GLOBAL_INTERRUPT_MASK);
 	val = readl(isp->pb_base + IPU7_BAR2_MISC_CONFIG);
+
 	val |= 0x100U;
+	if (!IS_IPU7_MTL(isp) && !x86_match_cpu(ipu7_misc_cfg_exclusion))
+		val |= FIELD_PREP(IPU7_WRXREQOP_OVRD_VAL_MASK, 0xf) | BIT(18);
 
 	writel(val, isp->pb_base + IPU7_BAR2_MISC_CONFIG);
 
-	writel(BIT(22), isp->pb_base + IPU7_TLBID_HASH_ENABLE_63_32);
-	writel(BIT(1), isp->pb_base + IPU7_TLBID_HASH_ENABLE_127_96);
+	if (IS_IPU7P5(isp)) {
+		writel(BIT(14), isp->pb_base + IPU7_TLBID_HASH_ENABLE_63_32);
+		writel(BIT(9), isp->pb_base + IPU7_TLBID_HASH_ENABLE_95_64);
+	} else {
+		writel(BIT(22), isp->pb_base + IPU7_TLBID_HASH_ENABLE_63_32);
+		writel(BIT(1), isp->pb_base + IPU7_TLBID_HASH_ENABLE_127_96);
+	}
 
 	writel(b->regs->irq_all, isp->base + b->regs->irq_clear);
 	writel(b->regs->irq_all, isp->base + IPU7_BUTTRESS_REG_IRQ_MASK);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
index c4da72c6bd8f..57e661cc2177 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
@@ -233,6 +233,8 @@ enum {
 #define IPU7_BUTTRESS_REG_TSC_CMD		0x2014
 #define IPU7_BUTTRESS_REG_TSC_CTL		0x2018
 #define IPU7_BUTTRESS_REG_TSC_LO		0x201c
+#define IPU7_BUTTRESS_REG_PB_TIMESTAMP_LO	0x2030
+#define IPU7_BUTTRESS_REG_PB_TIMESTAMP_VALID	0x2038
 #define IPU7_BUTTRESS_REG_IS_WORKPOINT_REQ	0x2104
 #define IPU7_BUTTRESS_REG_PS_WORKPOINT_REQ	0x2100
 #define IPU7_BUTTRESS_REG_IDLE_WDT		0x218c
@@ -319,8 +321,13 @@ enum {
 
 /* PB registers */
 #define IPU7_GLOBAL_INTERRUPT_MASK		0x8
+#define IPU7_TLBID_HASH_ENABLE_31_0		0x30
 #define IPU7_TLBID_HASH_ENABLE_63_32		0x34
+#define IPU7_TLBID_HASH_ENABLE_95_64		0x38
 #define IPU7_TLBID_HASH_ENABLE_127_96		0x3c
 #define IPU7_BAR2_MISC_CONFIG			0x64
 
+/* IPU7.5 */
+#define IPU7_BUTTRESS_SEL_PB_TIMESTAMP		BIT(9)
+
 #endif /* IPU6_PLATFORM_BUTTRESS_REGS_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 21b277bebf26..46ed7018d7d6 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -197,6 +197,36 @@ static const struct ipu6_buttress_registers ipu7_buttress_regs = {
 	.irq_sai	= IPU7_BUTTRESS_IRQ_SAI_VIOLATION,
 };
 
+static const struct ipu6_buttress_registers ipu7p5_buttress_regs = {
+	/* Registers */
+	.irq_status	= IPU7_BUTTRESS_REG_IRQ_STATUS,
+	.irq_clear	= IPU7_BUTTRESS_REG_IRQ_CLEAR,
+	.irq_enable	= IPU7_BUTTRESS_REG_IRQ_ENABLE,
+	.pwr_status	= IPU7_BUTTRESS_REG_PWR_STATUS,
+	.security_ctl	= IPU7_BUTTRESS_REG_SECURITY_CTL,
+	.fw_reset_ctl	= IPU7_BUTTRESS_REG_FW_RESET_CTL,
+	.fabric_cmd	= IPU7_BUTTRESS_REG_TSC_CMD,
+	.tsw_ctl	= IPU7_BUTTRESS_REG_TSC_CTL,
+	.tsc_lo		= IPU7_BUTTRESS_REG_PB_TIMESTAMP_LO,
+	.wdt		= IPU7_BUTTRESS_REG_IDLE_WDT,
+	.csr_in		= IPU7_BUTTRESS_REG_CSE2IUCSR,
+	.csr_out	= IPU7_BUTTRESS_REG_IU2CSECSR,
+	.db0_in		= IPU7_BUTTRESS_REG_CSE2IUDB0,
+	.db0_out	= IPU7_BUTTRESS_REG_IU2CSEDB0,
+	.data0_in	= IPU7_BUTTRESS_REG_CSE2IUDATA0,
+	.data0_out	= IPU7_BUTTRESS_REG_IU2CSEDATA0,
+	.sku_id		= IPU7_BUTTRESS_REG_SKU,
+
+	/* Bitmasks */
+	.irq_is		= IPU7_BUTTRESS_IRQ_IS_IRQ,
+	.irq_ps		= IPU7_BUTTRESS_IRQ_PS_IRQ,
+	.irq_all	= IPU7_BUTTRESS_IRQS,
+	.irq_events	= IPU7_BUTTRESS_IRQS,
+	.irq_cse_ipc	= IPU7_BUTTRESS_IRQ_IPC_FROM_CSE_IS_WAITING,
+	.irq_exec_done	= IPU7_BUTTRESS_IRQ_IPC_EXEC_DONE_BY_CSE,
+	.irq_sai	= IPU7_BUTTRESS_IRQ_SAI_VIOLATION,
+};
+
 static void
 ipu6_pkg_dir_configure_spc(struct ipu6_device *isp,
 			   const struct ipu6_hw_variants *hw_variant,
@@ -622,6 +652,14 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		isys_ctrl = &ipu7_isys_buttress_ctrl;
 		psys_ctrl = &ipu7_psys_buttress_ctrl;
 		break;
+	case PCI_DEVICE_ID_INTEL_IPU7P5:
+		isp->hw_ver = IPU_VERSION_7P5;
+		isp->cpd_fw_name = IPU7P5_FIRMWARE_NAME;
+		isp->model_name = IPU7P5_MEDIA_DEV_MODEL_NAME;
+		isp->buttress.regs = &ipu7p5_buttress_regs;
+		isys_ctrl = &ipu7_isys_buttress_ctrl;
+		psys_ctrl = &ipu7_psys_buttress_ctrl;
+		break;
 	default:
 		return dev_err_probe(dev, -ENODEV,
 				     "Unsupported IPU6 device %x\n",
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index 8a696caf4b88..72c5063d5198 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -25,6 +25,7 @@ struct ipu6_bus_device;
 #define IPU6EPMTL_FIRMWARE_NAME		"intel/ipu/ipu6epmtl_fw.bin"
 #define IPU6EPADLN_FIRMWARE_NAME	"intel/ipu/ipu6epadln_fw.bin"
 #define IPU7_FIRMWARE_NAME		"intel/ipu/ipu7_fw.bin"
+#define IPU7P5_FIRMWARE_NAME		"intel/ipu/ipu7ptl_fw.bin"
 
 #define IPU_VERSION_6		BIT(0) /* TGL */
 #define IPU_VERSION_6SE		BIT(1) /* JSL */
-- 
2.55.0

