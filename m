Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9D33914E8
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312642; cv=none; b=thDvG94d4sm9fs8QeQlqk17TdGmH4nf6gcp0mq0IXdKlh6i5VGWIEwzpBINskkfACNZL98o8WUIJ2jyGGVZX4A5+H4hxO2OeyuLxnEtKxGfBv3gbBhFk9vS54f98Np+A7dMGiaT5FZ60WoODe6CnMj1+a1iDHQp9V/4NiKJRDpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312642; c=relaxed/simple;
	bh=EJZ23Z4oP+I/dpUP6x9pkNxSz0FW6UX8L7QyShL9wRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a+a3kKErs9pgeGHdYA35nxhihRKeKVxTxNZOfTTjPMqMtDS5mvGR+nVhUnt8BhNhVU9WZfSw1F/K2KylD5uadbHPpMAFUNVggK1TY0dJWhB9cYMaLtVeLeYnkAMtSSFkMSjU3xx+mm++FfD4EGBL/VpWn6M/gpumXLM2zRD9caw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DAtgibWF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DAtgibWF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312641; x=1818848641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EJZ23Z4oP+I/dpUP6x9pkNxSz0FW6UX8L7QyShL9wRU=;
  b=DAtgibWFslLU3DWwZTiQu/VYSZWS+9vfJgzIaXc8p+ZTTqaQlDvekoZf
   ayFo+N6EbmXvE4674fcfuzYV8xJlVOnu90WPbuosbxTNEKHfkw/i5ONmM
   aoLNzdnWk/VJOeN0L2skwh8rfxDx3DG+ngCwWRDKaqN5SXGNp/JLg5m1V
   +Ds2vUYWlHL6nnBQ6tqfPsJjvVwPJLjq1uUiymNDmRwxn3+jlfEhD4DYP
   jXfc867rjLieKM2RpnDvID+swSCId4rBbIfrGrwLGdmj1zPDjebA7Zh/G
   lj+8SAIQSe9VUeXmllWu0O5v/lsP6bzdwg7AxSyO5tK/ya3KbjIcVYLD6
   Q==;
X-CSE-ConnectionGUID: 7AnwVy9VTXy7BPQG0P4n7g==
X-CSE-MsgGUID: ci13EOK9SGaPaL02rAd+nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989042"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989042"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:01 -0700
X-CSE-ConnectionGUID: HXUq8ZVQShGQ6YI2w5kj+A==
X-CSE-MsgGUID: yu0Vdzt8Qtay68ELl+Fb8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172211"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:43:59 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 09/44] media: ipu6: Prepare buttress for ipu7 support
Date: Fri, 21 Aug 2026 14:42:27 +0300
Message-ID: <20260821114302.365532-10-antti.laakso@linux.intel.com>
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

Introduce a struct to hold buttress registers and bitmasks that vary
across hardware versions beyond ipu6 to simplify support for future
hardware versions.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c  | 96 ++++++++++---------
 drivers/media/pci/intel/ipu6/ipu6-buttress.h  | 25 +++++
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |  2 +-
 drivers/media/pci/intel/ipu6/ipu6.c           | 26 +++++
 4 files changed, 101 insertions(+), 48 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index cbe356589a9d..3c5f4e407b7c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -55,11 +55,6 @@
 
 #define BUTTRESS_MAX_CONSECUTIVE_IRQS	100
 
-static const u32 ipu6_adev_irq_mask[2] = {
-	BUTTRESS_ISR_IS_IRQ,
-	BUTTRESS_ISR_PS_IRQ
-};
-
 int ipu6_buttress_ipc_reset(struct ipu6_device *isp,
 			    struct ipu6_buttress_ipc *ipc)
 {
@@ -337,7 +332,8 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 	struct ipu6_device *isp = isp_ptr;
 	struct ipu6_bus_device *adev[] = { isp->isys, isp->psys };
 	struct ipu6_buttress *b = &isp->buttress;
-	u32 reg_irq_sts = BUTTRESS_REG_ISR_STATUS;
+	const struct ipu6_buttress_registers *regs = b->regs;
+	const u32 adev_irq_mask[] = { regs->irq_is, regs->irq_ps };
 	irqreturn_t ret = IRQ_NONE;
 	u32 disable_irqs = 0;
 	u32 irq_status;
@@ -348,7 +344,7 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 	if (!active)
 		return IRQ_NONE;
 
-	irq_status = readl(isp->base + reg_irq_sts);
+	irq_status = readl(isp->base + regs->irq_status);
 	if (irq_status == 0 || WARN_ON_ONCE(irq_status == 0xffffffffu)) {
 		if (active > 0)
 			pm_runtime_put_noidle(&isp->pdev->dev);
@@ -356,26 +352,26 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 	}
 
 	do {
-		writel(irq_status, isp->base + BUTTRESS_REG_ISR_CLEAR);
+		writel(irq_status, isp->base + regs->irq_clear);
 
-		for (i = 0; i < ARRAY_SIZE(ipu6_adev_irq_mask); i++) {
+		for (i = 0; i < ARRAY_SIZE(adev_irq_mask); i++) {
 			irqreturn_t r = ipu6_buttress_call_isr(adev[i]);
 
-			if (!(irq_status & ipu6_adev_irq_mask[i]))
+			if (!(irq_status & adev_irq_mask[i]))
 				continue;
 
 			if (r == IRQ_WAKE_THREAD) {
 				ret = IRQ_WAKE_THREAD;
-				disable_irqs |= ipu6_adev_irq_mask[i];
+				disable_irqs |= adev_irq_mask[i];
 			} else if (ret == IRQ_NONE && r == IRQ_HANDLED) {
 				ret = IRQ_HANDLED;
 			}
 		}
 
-		if ((irq_status & BUTTRESS_EVENT) && ret == IRQ_NONE)
+		if ((irq_status & regs->irq_events) && ret == IRQ_NONE)
 			ret = IRQ_HANDLED;
 
-		if (irq_status & BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING) {
+		if (irq_status & regs->irq_cse_ipc) {
 			dev_dbg(&isp->pdev->dev,
 				"BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING\n");
 
@@ -383,13 +379,13 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 			complete(&b->ipc.recv_complete);
 		}
 
-		if (irq_status & BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE) {
+		if (irq_status & regs->irq_exec_done) {
 			dev_dbg(&isp->pdev->dev,
 				"BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE\n");
 			complete(&b->ipc.send_complete);
 		}
 
-		if (irq_status & BUTTRESS_ISR_SAI_VIOLATION &&
+		if (irq_status & regs->irq_sai &&
 		    ipu6_buttress_get_secure_mode(isp))
 			dev_err(&isp->pdev->dev,
 				"BUTTRESS_ISR_SAI_VIOLATION\n");
@@ -408,12 +404,12 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 			break;
 		}
 
-		irq_status = readl(isp->base + reg_irq_sts);
+		irq_status = readl(isp->base + regs->irq_status);
 	} while (irq_status);
 
 	if (disable_irqs)
-		writel(BUTTRESS_IRQS & ~disable_irqs,
-		       isp->base + BUTTRESS_REG_ISR_ENABLE);
+		writel(regs->irq_all & ~disable_irqs,
+		       isp->base + regs->irq_enable);
 
 	if (active > 0)
 		pm_runtime_put(&isp->pdev->dev);
@@ -424,12 +420,13 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
 irqreturn_t ipu6_buttress_isr_threaded(int irq, void *isp_ptr)
 {
 	struct ipu6_device *isp = isp_ptr;
+	const struct ipu6_buttress_registers *regs = isp->buttress.regs;
 	struct ipu6_bus_device *adev[] = { isp->isys, isp->psys };
 	const struct ipu6_auxdrv_data *drv_data = NULL;
 	irqreturn_t ret = IRQ_NONE;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(ipu6_adev_irq_mask) && adev[i]; i++) {
+	for (i = 0; i < ARRAY_SIZE(adev) && adev[i]; i++) {
 		drv_data = adev[i]->auxdrv_data;
 		if (!drv_data)
 			continue;
@@ -439,7 +436,7 @@ irqreturn_t ipu6_buttress_isr_threaded(int irq, void *isp_ptr)
 			ret = IRQ_HANDLED;
 	}
 
-	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_ISR_ENABLE);
+	writel(regs->irq_all, isp->base + regs->irq_enable);
 
 	return ret;
 }
@@ -472,7 +469,7 @@ int ipu6_buttress_power(struct device *dev,
 
 	writel(val, isp->base + ctrl->freq_ctl);
 
-	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_PWR_STATE,
+	ret = readl_poll_timeout(isp->base + isp->buttress.regs->pwr_status,
 				 val, (val & ctrl->pwr_sts_mask) == pwr_sts,
 				 100, BUTTRESS_POWER_TIMEOUT_US);
 	if (ret)
@@ -488,7 +485,7 @@ bool ipu6_buttress_get_secure_mode(struct ipu6_device *isp)
 {
 	u32 val;
 
-	val = readl(isp->base + BUTTRESS_REG_SECURITY_CTL);
+	val = readl(isp->base + isp->buttress.regs->security_ctl);
 
 	return val & BUTTRESS_SECURITY_CTL_FW_SECURE_MODE;
 }
@@ -500,7 +497,7 @@ bool ipu6_buttress_auth_done(struct ipu6_device *isp)
 	if (!isp->secure_mode)
 		return true;
 
-	val = readl(isp->base + BUTTRESS_REG_SECURITY_CTL);
+	val = readl(isp->base + isp->buttress.regs->security_ctl);
 	val = FIELD_GET(BUTTRESS_SECURITY_CTL_FW_SETUP_MASK, val);
 
 	return val == BUTTRESS_SECURITY_CTL_AUTH_DONE;
@@ -518,10 +515,10 @@ int ipu6_buttress_reset_authentication(struct ipu6_device *isp)
 	}
 
 	writel(BUTTRESS_FW_RESET_CTL_START, isp->base +
-	       BUTTRESS_REG_FW_RESET_CTL);
+	       isp->buttress.regs->fw_reset_ctl);
 
-	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_FW_RESET_CTL, val,
-				 val & BUTTRESS_FW_RESET_CTL_DONE, 500,
+	ret = readl_poll_timeout(isp->base + isp->buttress.regs->fw_reset_ctl,
+				 val, val & BUTTRESS_FW_RESET_CTL_DONE, 500,
 				 BUTTRESS_CSE_FWRESET_TIMEOUT_US);
 	if (ret) {
 		dev_err(&isp->pdev->dev,
@@ -530,7 +527,8 @@ int ipu6_buttress_reset_authentication(struct ipu6_device *isp)
 	}
 
 	dev_dbg(&isp->pdev->dev, "FW reset for authentication done\n");
-	writel(0, isp->base + BUTTRESS_REG_FW_RESET_CTL);
+	writel(0, isp->base + isp->buttress.regs->fw_reset_ctl);
+
 	/* leave some time for HW restore */
 	usleep_range(800, 1000);
 
@@ -660,7 +658,7 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
 	mask = BUTTRESS_SECURITY_CTL_FW_SETUP_MASK;
 	done = BUTTRESS_SECURITY_CTL_FW_SETUP_DONE;
 	fail = BUTTRESS_SECURITY_CTL_AUTH_FAILED;
-	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_SECURITY_CTL, data,
+	ret = readl_poll_timeout(isp->base + b->regs->security_ctl, data,
 				 ((data & mask) == done ||
 				  (data & mask) == fail), 500,
 				 BUTTRESS_CSE_BOOTLOAD_TIMEOUT_US);
@@ -700,7 +698,7 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
 	}
 
 	done = BUTTRESS_SECURITY_CTL_AUTH_DONE;
-	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_SECURITY_CTL, data,
+	ret = readl_poll_timeout(isp->base + b->regs->security_ctl, data,
 				 ((data & mask) == done ||
 				  (data & mask) == fail), 500,
 				 BUTTRESS_CSE_AUTHENTICATE_TIMEOUT_US);
@@ -725,15 +723,16 @@ int ipu6_buttress_authenticate(struct ipu6_device *isp)
 
 static int ipu6_buttress_send_tsc_request(struct ipu6_device *isp)
 {
+	const struct ipu6_buttress_registers *regs = isp->buttress.regs;
 	u32 val, mask, done;
 	int ret;
 
 	mask = BUTTRESS_PWR_STATE_HH_STATUS_MASK;
 
 	writel(BUTTRESS_FABRIC_CMD_START_TSC_SYNC,
-	       isp->base + BUTTRESS_REG_FABRIC_CMD);
+	       isp->base + regs->fabric_cmd);
 
-	val = readl(isp->base + BUTTRESS_REG_PWR_STATE);
+	val = readl(isp->base + regs->pwr_status);
 	val = FIELD_GET(mask, val);
 	if (val == BUTTRESS_PWR_STATE_HH_STATE_ERR) {
 		dev_err(&isp->pdev->dev, "Start tsc sync failed\n");
@@ -741,8 +740,8 @@ static int ipu6_buttress_send_tsc_request(struct ipu6_device *isp)
 	}
 
 	done = BUTTRESS_PWR_STATE_HH_STATE_DONE;
-	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_PWR_STATE, val,
-				 FIELD_GET(mask, val) == done, 500,
+	ret = readl_poll_timeout(isp->base + regs->pwr_status,
+				 val, FIELD_GET(mask, val) == done, 500,
 				 BUTTRESS_TSC_SYNC_TIMEOUT_US);
 	if (ret)
 		dev_err(&isp->pdev->dev, "Start tsc sync timeout\n");
@@ -762,11 +761,13 @@ int ipu6_buttress_start_tsc_sync(struct ipu6_device *isp)
 		if (ret != -ETIMEDOUT)
 			return ret;
 
-		val = readl(isp->base + BUTTRESS_REG_TSW_CTL);
+		u32 tsw_ctl = isp->buttress.regs->tsw_ctl;
+
+		val = readl(isp->base + tsw_ctl);
 		val = val | BUTTRESS_TSW_CTL_SOFT_RESET;
-		writel(val, isp->base + BUTTRESS_REG_TSW_CTL);
+		writel(val, isp->base + tsw_ctl);
 		val = val & ~BUTTRESS_TSW_CTL_SOFT_RESET;
-		writel(val, isp->base + BUTTRESS_REG_TSW_CTL);
+		writel(val, isp->base + tsw_ctl);
 	}
 
 	dev_err(&isp->pdev->dev, "TSC sync failed (timeout)\n");
@@ -777,13 +778,14 @@ EXPORT_SYMBOL_NS_GPL(ipu6_buttress_start_tsc_sync, "INTEL_IPU6");
 
 void ipu6_buttress_tsc_read(struct ipu6_device *isp, u64 *val)
 {
+	void __iomem *tsc = isp->base + isp->buttress.regs->tsc_lo;
 	u32 tsc_hi_1, tsc_hi_2, tsc_lo;
 	unsigned long flags;
 
 	local_irq_save(flags);
-	tsc_hi_1 = readl(isp->base + BUTTRESS_REG_TSC_HI);
-	tsc_lo = readl(isp->base + BUTTRESS_REG_TSC_LO);
-	tsc_hi_2 = readl(isp->base + BUTTRESS_REG_TSC_HI);
+	tsc_hi_1 = readl(tsc + BUTTRESS_TSC_HI_OFFSET);
+	tsc_lo = readl(tsc);
+	tsc_hi_2 = readl(tsc + BUTTRESS_TSC_HI_OFFSET);
 	if (tsc_hi_1 == tsc_hi_2) {
 		*val = (u64)tsc_hi_1 << 32 | tsc_lo;
 	} else {
@@ -816,9 +818,9 @@ void ipu6_buttress_restore(struct ipu6_device *isp)
 {
 	struct ipu6_buttress *b = &isp->buttress;
 
-	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_ISR_CLEAR);
-	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_ISR_ENABLE);
-	writel(b->wdt_cached_value, isp->base + BUTTRESS_REG_WDT);
+	writel(b->regs->irq_all, isp->base + b->regs->irq_clear);
+	writel(b->regs->irq_all, isp->base + b->regs->irq_enable);
+	writel(b->wdt_cached_value, isp->base + b->regs->wdt);
 }
 
 int ipu6_buttress_init(struct ipu6_device *isp)
@@ -851,12 +853,12 @@ int ipu6_buttress_init(struct ipu6_device *isp)
 		readl(isp->base + BUTTRESS_REG_SECURITY_TOUCH),
 		readl(isp->base + BUTTRESS_REG_CAMERA_MASK));
 
-	b->wdt_cached_value = readl(isp->base + BUTTRESS_REG_WDT);
-	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_ISR_CLEAR);
-	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_ISR_ENABLE);
+	b->wdt_cached_value = readl(isp->base + b->regs->wdt);
+	writel(b->regs->irq_all, isp->base + b->regs->irq_clear);
+	writel(b->regs->irq_all, isp->base + b->regs->irq_enable);
 
 	/* get ref_clk frequency by reading the indication in btrs control */
-	val = readl(isp->base + BUTTRESS_REG_BTRS_CTRL);
+	val = readl(isp->base + b->regs->btrs_ctrl);
 	val = FIELD_GET(BUTTRESS_REG_BTRS_CTRL_REF_CLK_IND, val);
 
 	switch (val) {
@@ -902,7 +904,7 @@ void ipu6_buttress_exit(struct ipu6_device *isp)
 {
 	struct ipu6_buttress *b = &isp->buttress;
 
-	writel(0, isp->base + BUTTRESS_REG_ISR_ENABLE);
+	writel(0, isp->base + b->regs->irq_enable);
 
 	mutex_destroy(&b->power_mutex);
 	mutex_destroy(&b->auth_mutex);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
index b1c1a10e3e6d..68586a32fda3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
@@ -42,9 +42,34 @@ struct ipu6_buttress_ipc {
 	u32 data0_in;
 };
 
+struct ipu6_buttress_registers {
+	/* Registers */
+	u32 irq_status;
+	u32 irq_clear;
+	u32 irq_enable;
+	u32 pwr_status;
+	u32 security_ctl;
+	u32 fw_reset_ctl;
+	u32 fabric_cmd;
+	u32 tsw_ctl;
+	u32 tsc_lo;
+	u32 wdt;
+	u32 btrs_ctrl;
+
+	/* Bitmasks */
+	u32 irq_is;
+	u32 irq_ps;
+	u32 irq_all;
+	u32 irq_events;
+	u32 irq_cse_ipc;
+	u32 irq_exec_done;
+	u32 irq_sai;
+};
+
 struct ipu6_buttress {
 	struct mutex power_mutex, auth_mutex, cons_mutex, ipc_mutex;
 	struct ipu6_buttress_ipc ipc;
+	const struct ipu6_buttress_registers *regs;
 	struct list_head constraints;
 	u32 wdt_cached_value;
 	bool force_suspend;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
index efd65e494c16..5006cce74b23 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
@@ -212,7 +212,7 @@ enum {
 #define BUTTRESS_TSW_CTL_SOFT_RESET	BIT(8)
 
 #define BUTTRESS_REG_TSC_LO	0x164
-#define BUTTRESS_REG_TSC_HI	0x168
+#define BUTTRESS_TSC_HI_OFFSET	4
 
 #define BUTTRESS_IRQS		(BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING | \
 				 BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE |    \
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index efb58bc4d127..55e660fda421 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -228,6 +228,30 @@ static const struct ipu6_buttress_ctrl psys_buttress_ctrl = {
 	.pwr_sts_off = IPU6_BUTTRESS_PWR_STATE_DN_DONE,
 };
 
+static const struct ipu6_buttress_registers ipu6_buttress_regs = {
+	/* Registers */
+	.irq_status	= BUTTRESS_REG_ISR_STATUS,
+	.irq_clear	= BUTTRESS_REG_ISR_CLEAR,
+	.irq_enable	= BUTTRESS_REG_ISR_ENABLE,
+	.pwr_status	= BUTTRESS_REG_PWR_STATE,
+	.security_ctl	= BUTTRESS_REG_SECURITY_CTL,
+	.fw_reset_ctl	= BUTTRESS_REG_FW_RESET_CTL,
+	.fabric_cmd	= BUTTRESS_REG_FABRIC_CMD,
+	.tsw_ctl	= BUTTRESS_REG_TSW_CTL,
+	.tsc_lo		= BUTTRESS_REG_TSC_LO,
+	.wdt		= BUTTRESS_REG_WDT,
+	.btrs_ctrl	= BUTTRESS_REG_BTRS_CTRL,
+
+	/* Bitmasks */
+	.irq_is		= BUTTRESS_ISR_IS_IRQ,
+	.irq_ps		= BUTTRESS_ISR_PS_IRQ,
+	.irq_all	= BUTTRESS_IRQS,
+	.irq_events	= BUTTRESS_EVENT,
+	.irq_cse_ipc	= BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING,
+	.irq_exec_done	= BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE,
+	.irq_sai	= BUTTRESS_ISR_SAI_VIOLATION,
+};
+
 static void
 ipu6_pkg_dir_configure_spc(struct ipu6_device *isp,
 			   const struct ipu6_hw_variants *hw_variant,
@@ -522,6 +546,8 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	pci_set_master(pdev);
 
 	isp->cpd_metadata_cmpnt_size = sizeof(struct ipu6_cpd_metadata_cmpnt);
+	isp->buttress.regs = &ipu6_buttress_regs;
+
 	switch (id->device) {
 	case PCI_DEVICE_ID_INTEL_IPU6:
 		isp->hw_ver = IPU_VERSION_6;
-- 
2.55.0

