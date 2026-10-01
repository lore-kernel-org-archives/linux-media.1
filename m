Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E6451AED5
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 12:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858757; cv=none; b=I2vjMsx0DSPiRD2isG48vG+7hVoyQjomVgnjv9AIGQBzFU9bGf6bXSlQ5ydrjPyk/O2FOODJrzjrnMmkqchQDaqxpbRlMWGYAaVqOdxGKcscr149R4h2XqRXuFShf0JFrPiTq2RGB7pnoxWSaWYAGTQAnIJVYEnlK932pBhOz/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858757; c=relaxed/simple;
	bh=xLRSIdT+C/KVtTBCmZIB1uVMl1YIoJWkBYh8KTaA0c0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pSJ2ofxYqhhRRfVryw8Hq57wtvMZ+Pp8exUGN1/a7Md8y0SyKtSrRNlY3Mw22cuOBqmsIHeaA9CKsB0Z0qbQziCg7I5ZD9DmO5SwihhZeKdBpxYZofPQJqps/k2YBfnfQWNNvjA8ElMI/UGv9/u2lDiT5UiUqiqwhuPRe2JGApY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OnrLBCz+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OnrLBCz+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790858756; x=1822394756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xLRSIdT+C/KVtTBCmZIB1uVMl1YIoJWkBYh8KTaA0c0=;
  b=OnrLBCz+Trl7SqJqXhjzy+28CBMB5Q6kR05AZExEbdCBzC7eQEWrXyPh
   x8Qq8OmWZ+lZkumyvc6a37xPjk4d6xyr1HAhM4BNJWeMl09BWA19Go06o
   q/lkAbXFJ+2L+fC0ZGrnzqk5bdjnmUPKn5z1XLvpHdEaIZw+Tx/Nc9ddC
   5Pvo0kH/lD4dYRCuHYmoNXDXUFk5fbIGN0pi94QhWREO/XtobZidJV+bX
   1iqUyjfa1maDLBnoEPZpBFFeBYCqxIWqeay5KL5qU1oPqFjD/AzRJaoCE
   Gkmd+qnfYr7TVVvuA80pzo/hBZanTEXO9dcEbqyn6c17Kj1dd0daSSocF
   A==;
X-CSE-ConnectionGUID: FauOR17mTlS1hxrUM9PExQ==
X-CSE-MsgGUID: 7G4UGebcRLmwE9wYuzQWMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="101774559"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="101774559"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 05:45:56 -0700
X-CSE-ConnectionGUID: 97bzrAY1RgaMReu1p6JKsQ==
X-CSE-MsgGUID: ODPRINQJQUWf1+ilc27mog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="313934906"
Received: from cooperst-gp119.amr.corp.intel.com (HELO alaakso-desk.intel.com) ([10.125.111.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 05:45:54 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com,
	divyamani.tripathi@intel.com
Cc: manik.bajpai@intel.com
Subject: [PATCH 3/7] media: ipu6: Pass the fw context to the ipu7 boot helpers
Date: Thu,  1 Oct 2026 15:45:36 +0300
Message-ID: <20261001124540.2129309-4-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001124540.2129309-1-antti.laakso@linux.intel.com>
References: <20261001124540.2129309-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keep the ipu7 boot helpers sub-system agnostic by passing the
firmware context explicitly. No functional change.

Assisted-by: LLM
Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu7-boot.c    | 26 +++++++--------------
 drivers/media/pci/intel/ipu6/ipu7-boot.h    |  7 ++++--
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c |  9 ++++---
 3 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu7-boot.c b/drivers/media/pci/intel/ipu6/ipu7-boot.c
index 952c73efd237..f695d668d46b 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-boot.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-boot.c
@@ -12,7 +12,6 @@
 #include "ipu6-bus.h"
 #include "ipu6-buttress.h"
 #include "ipu6-dma.h"
-#include "ipu6-isys.h"
 #include "ipu6-platform-buttress-regs.h"
 #include "ipu7-boot.h"
 #include "ipu7-platform-regs.h"
@@ -163,11 +162,10 @@ static void ipu7_boot_cell_stop(const struct ipu6_bus_device *adev)
 	writel(val, base + regs->status_ctrl_reg);
 }
 
-static int ipu7_boot_cell_init(const struct ipu6_bus_device *adev)
+static int ipu7_boot_cell_init(const struct ipu6_bus_device *adev,
+			       const struct ipu7_fw_com_context *fwctx)
 {
 	const struct boot_regs *regs = &boot_regs[adev->ctrl->subsys_id];
-	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
-	struct ipu7_fw_com_context *fwctx = isys->fwctx;
 	void __iomem *base = adev->isp->base;
 
 	writel(fwctx->fw_entry, base + regs->fw_start_address_reg);
@@ -191,12 +189,11 @@ static void init_cfg_versions(struct ipu7_boot_abi_cfg *boot_cfg, u32 length, u8
 }
 
 int ipu6_ipu7_init_boot_config(struct ipu6_bus_device *adev,
+			       struct ipu7_fw_com_context *fwctx,
 			       struct ipu7_fw_com_queue_config *qconfigs,
 			       int num_queues, u32 uc_freq,
 			       dma_addr_t subsys_config, u8 major)
 {
-	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
-	struct ipu7_fw_com_context *fwctx = isys->fwctx;
 	struct ipu7_boot_abi_cfg *boot_config;
 	struct ipu7_fw_com_queue_params_config *cfgs;
 	struct device *dev = &adev->auxdev.dev;
@@ -269,16 +266,12 @@ int ipu6_ipu7_init_boot_config(struct ipu6_bus_device *adev,
 }
 EXPORT_SYMBOL_NS_GPL(ipu6_ipu7_init_boot_config, "INTEL_IPU6");
 
-void ipu6_ipu7_release_boot_config(struct ipu6_bus_device *adev)
+void ipu6_ipu7_release_boot_config(struct ipu6_bus_device *adev,
+				   struct ipu7_fw_com_context *fwctx)
 {
-	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
-	struct ipu7_fw_com_context *fwctx;
-
-	if (!isys || !isys->fwctx)
+	if (!fwctx)
 		return;
 
-	fwctx = isys->fwctx;
-
 	if (fwctx->queue_mem) {
 		ipu6_dma_free(adev, fwctx->queue_mem_size,
 			      fwctx->queue_mem,
@@ -297,18 +290,17 @@ void ipu6_ipu7_release_boot_config(struct ipu6_bus_device *adev)
 }
 EXPORT_SYMBOL_NS_GPL(ipu6_ipu7_release_boot_config, "INTEL_IPU6");
 
-int ipu6_ipu7_boot_start_fw(const struct ipu6_bus_device *adev)
+int ipu6_ipu7_boot_start_fw(const struct ipu6_bus_device *adev,
+			    struct ipu7_fw_com_context *fwctx)
 {
 	const struct device *dev = &adev->auxdev.dev;
-	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
-	struct ipu7_fw_com_context *fwctx = isys->fwctx;
 	u32 timeout = IPU7_FW_START_STOP_TIMEOUT;
 	void __iomem *base = adev->isp->base;
 	u32 boot_state, last_boot_state;
 	u32 indices_addr, msg_ver, id;
 	int ret;
 
-	ret = ipu7_boot_cell_init(adev);
+	ret = ipu7_boot_cell_init(adev, fwctx);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/pci/intel/ipu6/ipu7-boot.h b/drivers/media/pci/intel/ipu6/ipu7-boot.h
index f2172b53bed5..48b7cbbde3d3 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-boot.h
+++ b/drivers/media/pci/intel/ipu6/ipu7-boot.h
@@ -36,11 +36,14 @@ struct ipu7_boot_abi_cfg {
 } __packed;
 
 int ipu6_ipu7_init_boot_config(struct ipu6_bus_device *adev,
+			       struct ipu7_fw_com_context *fwctx,
 			       struct ipu7_fw_com_queue_config *qconfigs,
 			       int num_queues, u32 uc_freq,
 			       dma_addr_t subsys_config, u8 major);
-void ipu6_ipu7_release_boot_config(struct ipu6_bus_device *adev);
-int ipu6_ipu7_boot_start_fw(const struct ipu6_bus_device *adev);
+void ipu6_ipu7_release_boot_config(struct ipu6_bus_device *adev,
+				   struct ipu7_fw_com_context *fwctx);
+int ipu6_ipu7_boot_start_fw(const struct ipu6_bus_device *adev,
+			    struct ipu7_fw_com_context *fwctx);
 int ipu6_ipu7_boot_stop_fw(const struct ipu6_bus_device *adev);
 
 #endif
diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
index ae8f40f94cc9..b22a01cf6f1b 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
@@ -25,7 +25,7 @@ static void ipu7_fw_isys_cleanup(struct ipu6_isys *isys)
 	if (!fwctx)
 		return;
 
-	ipu6_ipu7_release_boot_config(adev);
+	ipu6_ipu7_release_boot_config(adev, fwctx);
 
 	if (fwctx->fw_config) {
 		ipu6_dma_free(adev, sizeof(*fwctx->fw_config), fwctx->fw_config,
@@ -41,7 +41,7 @@ static void ipu7_fw_isys_cleanup(struct ipu6_isys *isys)
 
 static int ipu7_fw_isys_open(struct ipu6_isys *isys)
 {
-	return ipu6_ipu7_boot_start_fw(isys->adev);
+	return ipu6_ipu7_boot_start_fw(isys->adev, isys->fwctx);
 }
 
 static int ipu7_fw_isys_close(struct ipu6_isys *isys)
@@ -133,9 +133,8 @@ static int ipu7_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
 
 	isys->fwctx = fwctx;
 
-	/* IPU8 firmware expects boot-message major version 2, not 1 */
-	ret = ipu6_ipu7_init_boot_config(adev, queue_configs, num_queues,
-					 freq, fw_config_dma_addr,
+	ret = ipu6_ipu7_init_boot_config(adev, fwctx, queue_configs,
+					 num_queues, freq, fw_config_dma_addr,
 					 IS_IPU8(adev->isp) ? 2U : 1U);
 	if (ret) {
 		ipu7_fw_isys_cleanup(isys);
-- 
2.55.0

