Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC444A0912
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 20:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419250; cv=none; b=sHvqhquUKOih8lDQAnvX0Lrilpzmsh+6HNrVBJ0/H9eb8k8Lfw+YvqhMzyvWgZzba+fZbpmIs5L9C5Jn3CfuncV+6wFZniCWajoEAkSqQ/c6Y8HW56hl1PGxNSW8UJg0oNjt87+0423cwb/2NlN8htrBFcN9ec8Kgaf3H6Vc1u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419250; c=relaxed/simple;
	bh=/piytyv95S7W2hl+Iu4qSFNJklWDkAEMhMk6N7wWsPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CkLuy4rDcNAfixqfFnS3o8lebvX5XMd4GzLu4bn8OVfy7tCZjmL456RTFjmzQIkr+kOEGu92+zJeI0REWxSGDN1kmNTNT7ICKXWZ01D6CGw51z3d3mQsMRBBIJ2H7upj7q1JSUBEDm7ptCo3cTlPf3QD8V7p37IIrwk7Mau4GU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iAnPH4UP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iAnPH4UP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789419249; x=1820955249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/piytyv95S7W2hl+Iu4qSFNJklWDkAEMhMk6N7wWsPM=;
  b=iAnPH4UPyDB3QMy4agUcmrbGsiWIz5rVeEgUKhs0Xlbw2onZNJ55TToB
   DXsDXAg/NN3CUrDgN7Jdc/WvaIajdD390j44XS75nvlPFTtuVuPg9l7Ms
   pEvaDMgfmiNphqPHuyEZViINgZewk/5OYnDAPgJ0Z8dPIFc/CXU4nwyYz
   vKMUovXHoPyPOo5fSnhjkdxujkSlEx8vVInEolWeDK4FS3Yqy+yKi5RsB
   +IdmZfKttXlQoqA6i06EvNhH+lLjmIOtOWihp3iLTSQL6JTfBWmrzNNe6
   WmjhUexn3QO5LJuuUqZjeSloeAK2dXAnVkMFROLJ8qBJl09HmMFGDEyfV
   Q==;
X-CSE-ConnectionGUID: Oz6OcR9DRm+2h8iSwAbViQ==
X-CSE-MsgGUID: EGCSNyuYT+KtBgGOkKBVWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89984135"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89984135"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:54:03 -0700
X-CSE-ConnectionGUID: tKheBhZZSSaa8/M/Coy4+A==
X-CSE-MsgGUID: 8ddyZ8bnQHGGu1/iEThEEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297760757"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.173])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:54:00 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7D832121BE3;
	Mon, 14 Sep 2026 23:53:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x6Dgc-000000035KB-48p6;
	Mon, 14 Sep 2026 23:53:58 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH 20/21] media: ipu6: Don't track power status, rely on runtime PM
Date: Mon, 14 Sep 2026 23:53:57 +0300
Message-ID: <20260914205358.735307-21-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914205358.735307-1-sakari.ailus@linux.intel.com>
References: <20260914205358.735307-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rely on runtime PM suspending and resuming the device and so remove
tracking of power state. Also remove the power_lock spinlock that
serialised firmware initialisation and cleanup with the ISR. This is no
longer necessary as the ISR now runs when the device is in RPM_ACTIVE
state.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c | 21 +++++++--------------
 drivers/media/pci/intel/ipu6/ipu6-isys.c    | 16 ----------------
 drivers/media/pci/intel/ipu6/ipu6-isys.h    |  5 -----
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c | 20 ++++++++++++--------
 4 files changed, 19 insertions(+), 43 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
index 0214d7105fbe..f4f1cf7c86d2 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -7,6 +7,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/pm_runtime.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
@@ -131,7 +132,6 @@ static int ipu6_fw_isys_close(struct ipu6_isys *isys)
 {
 	struct device *dev = &isys->adev->auxdev.dev;
 	int retry = IPU6_ISYS_CLOSE_RETRY;
-	unsigned long flags;
 	void *fwctx;
 	int ret;
 
@@ -141,11 +141,9 @@ static int ipu6_fw_isys_close(struct ipu6_isys *isys)
 	 * to SP icache.
 	 * spinlock to wait the interrupt handler to be finished
 	 */
-	spin_lock_irqsave(&isys->power_lock, flags);
 	ret = ipu6_fw_com_close(isys->fwctx);
 	fwctx = isys->fwctx;
 	isys->fwctx = NULL;
-	spin_unlock_irqrestore(&isys->power_lock, flags);
 	if (ret)
 		dev_err(dev, "Device close failure: %d\n", ret);
 
@@ -158,9 +156,7 @@ static int ipu6_fw_isys_close(struct ipu6_isys *isys)
 
 	if (ret) {
 		dev_err(dev, "Device release time out %d\n", ret);
-		spin_lock_irqsave(&isys->power_lock, flags);
 		isys->fwctx = fwctx;
-		spin_unlock_irqrestore(&isys->power_lock, flags);
 	}
 
 	return ret;
@@ -531,9 +527,6 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
 	u32 index;
 	u64 ts;
 
-	if (!isys->fwctx)
-		return 1;
-
 	resp = ipu6_fw_isys_get_resp(isys);
 	if (!resp)
 		return 1;
@@ -699,12 +692,11 @@ irqreturn_t ipu6_isys_isr(struct ipu6_bus_device *adev)
 	void __iomem *base = isys->pdata->base;
 	u32 status_sw, status_csi;
 	u32 ctrl0_status, ctrl0_clear;
+	int pm_status;
 
-	spin_lock(&isys->power_lock);
-	if (!isys->power) {
-		spin_unlock(&isys->power_lock);
-		return IRQ_NONE;
-	}
+	pm_status = pm_runtime_get_if_active(&adev->auxdev.dev);
+	if (!pm_status)
+		return 0;
 
 	ctrl0_status = isys->pdata->ipdata->csi2.ctrl0_irq_status;
 	ctrl0_clear = isys->pdata->ipdata->csi2.ctrl0_irq_clear;
@@ -749,7 +741,8 @@ irqreturn_t ipu6_isys_isr(struct ipu6_bus_device *adev)
 
 	writel(ISYS_UNISPART_IRQS, base + IPU6_REG_ISYS_UNISPART_IRQ_MASK);
 
-	spin_unlock(&isys->power_lock);
+	if (pm_status > 0)
+		pm_runtime_put(&adev->auxdev.dev);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index fc6e87e9764b..60f5f9ea2910 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -759,7 +759,6 @@ static int isys_runtime_pm_resume(struct device *dev)
 	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
 	const struct ipu6_isys_internal_pdata *ipdata = isys->pdata->ipdata;
 	struct ipu6_device *isp = adev->isp;
-	unsigned long flags;
 	int ret;
 
 	ret = ipu6_mmu_hw_init(adev->mmu);
@@ -772,10 +771,6 @@ static int isys_runtime_pm_resume(struct device *dev)
 	if (ret)
 		goto err_mmu_hw_cleanup;
 
-	spin_lock_irqsave(&isys->power_lock, flags);
-	isys->power = 1;
-	spin_unlock_irqrestore(&isys->power_lock, flags);
-
 	if (IS_IPU7(isp)) {
 		ipu7_isys_setup_hw(isys);
 	} else {
@@ -806,10 +801,6 @@ static int isys_runtime_pm_resume(struct device *dev)
 	if (!ret)
 		return 0;
 
-	spin_lock_irqsave(&isys->power_lock, flags);
-	isys->power = 0;
-	spin_unlock_irqrestore(&isys->power_lock, flags);
-
 	isys->phy_termcal_val = 0;
 	cpu_latency_qos_update_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
 
@@ -827,7 +818,6 @@ static int isys_runtime_pm_suspend(struct device *dev)
 	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
 	struct ipu6_isys *isys = dev_get_drvdata(dev);
 	struct ipu6_device *isp = adev->isp;
-	unsigned long flags;
 	int ret = 0;
 
 	isys->adev->auxdrv_data->fw_ops->close(isys);
@@ -836,10 +826,6 @@ static int isys_runtime_pm_suspend(struct device *dev)
 		ret = -EIO;
 	}
 
-	spin_lock_irqsave(&isys->power_lock, flags);
-	isys->power = 0;
-	spin_unlock_irqrestore(&isys->power_lock, flags);
-
 	isys->phy_termcal_val = 0;
 	cpu_latency_qos_update_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
 
@@ -1016,8 +1002,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	isys->sensor_type = isys->pdata->ipdata->sensor_type_start;
 
 	spin_lock_init(&isys->streams_lock);
-	spin_lock_init(&isys->power_lock);
-	isys->power = 0;
 	isys->phy_termcal_val = 0;
 
 	mutex_init(&isys->mutex);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index 4991078c18b2..2af20f56a965 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -80,9 +80,6 @@ struct sensor_async_sd {
  * @media_dev: Media device
  * @v4l2_dev: V4L2 device
  * @adev: ISYS bus device
- * @power: Is ISYS powered on or not?
- * @isr_bits: Which bits does the ISR handle?
- * @power_lock: Serialise access to power (power state in general)
  * @csi2_rx_ctrl_cached: cached shared value between all CSI2 receivers
  * @streams_lock: serialise access to streams
  * @streams: streams per firmware stream ID
@@ -99,8 +96,6 @@ struct ipu6_isys {
 	struct v4l2_device v4l2_dev;
 	struct ipu6_bus_device *adev;
 
-	int power;
-	spinlock_t power_lock;
 	u32 isr_csi2_bits;
 	u32 csi2_rx_ctrl_cached;
 	spinlock_t streams_lock;
diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
index 96acd76dcd2e..acc290d96a2c 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
@@ -5,6 +5,7 @@
 
 #include <linux/cleanup.h>
 #include <linux/cacheflush.h>
+#include <linux/pm_runtime.h>
 
 #include "ipu6-bus.h"
 #include "ipu6-dma.h"
@@ -553,9 +554,6 @@ static int ipu7_isys_isr_one(struct ipu6_bus_device *adev)
 	unsigned long flags;
 	u64 ts;
 
-	if (!isys->fwctx)
-		return 1;
-
 	resp = ipu7_fw_isys_get_resp(isys);
 	if (!resp)
 		return 1;
@@ -753,11 +751,11 @@ irqreturn_t ipu7_isys_isr(struct ipu6_bus_device *adev)
 	void __iomem *base = isys->pdata->base;
 	u32 status_sw, status_csi;
 	u32 csi_offset, sw_offset;
+	int pm_status;
 
-	guard(spinlock)(&isys->power_lock);
-
-	if (!isys->power)
-		return IRQ_NONE;
+	pm_status = pm_runtime_get_if_active(&adev->auxdev.dev);
+	if (!pm_status)
+		return 0;
 
 	csi_offset = IPU7_IS_IO_CSI2_LEGACY_IRQ_CTRL_BASE;
 	sw_offset = IPU7_IS_UC_CTRL_BASE;
@@ -765,8 +763,11 @@ irqreturn_t ipu7_isys_isr(struct ipu6_bus_device *adev)
 	status_csi = readl(base + csi_offset + IPU7_IRQ_CTL_STATUS);
 	status_sw = readl(base + sw_offset + IPU7_TO_SW_IRQ_CNTL_STATUS);
 
-	if (!status_csi && !status_sw)
+	if (!status_csi && !status_sw) {
+		if (pm_status > 0)
+			pm_runtime_put(&adev->auxdev.dev);
 		return IRQ_NONE;
+	}
 
 	do {
 		writel(status_sw, base + sw_offset + IPU7_TO_SW_IRQ_CNTL_CLEAR);
@@ -789,5 +790,8 @@ irqreturn_t ipu7_isys_isr(struct ipu6_bus_device *adev)
 	writel(IPU7_IS_UC_TO_SW_IRQ_MASK,
 	       base + sw_offset + IPU7_TO_SW_IRQ_CNTL_MASK_N);
 
+	if (pm_status > 0)
+		pm_runtime_put(&adev->auxdev.dev);
+
 	return IRQ_HANDLED;
 }
-- 
2.47.3

