Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCAE4A0EF5
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 20:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419250; cv=none; b=g2yG/Vbbx5XZU0aNIlsgZxEUoFeqVuhyaRfZt0MI2vI433y7UVM6UiNM5ZHmhwHMkqemZBoO4K/hLphNCh8/Lao0k4VnISJ2I1C5IVbpNb+HocwsOllf7wU3CNdUIV7pEWqIbglK1K5wgwJphujNP3uuM2HLWAgktJF+BdUirGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419250; c=relaxed/simple;
	bh=QRbGyhqTjf/vvAEKQ4Pu7glBPfIq0z+NYftV8vSZPek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NeXy9b+7ERq8YyXvwbUvDxSCTCEUXAaw0utWxpPJNyJYHBJkdKp2manxjhK2bJx1Tu2rO1ZvX7GE5T4YPRFAm8IcjoDRYy2lF3WjcfBbVJF5TyxqCzYeXQrYrHnOQOyI/CcVU0TzQ2HwDIarimQRuiIo5+FkEydW9C5vWD9xWIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iwJK2gui; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iwJK2gui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789419250; x=1820955250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QRbGyhqTjf/vvAEKQ4Pu7glBPfIq0z+NYftV8vSZPek=;
  b=iwJK2guio8uaJMN0QHnr8Bra69+Gqp23VNDmnho16SDH6kOydrhNpXHk
   eWPTZf5C/Z1OSmq009JVhQC2+Pis5SpuOAz1KV1/5FNpFjAc6Jas5mORB
   MuqOzgVqCW/SfJc7ammtWJrkdI8oDKOVGdDZwzTFOH8YFo9DFz++Nv9U4
   ElzhOkIGwiPyjCT98Zat1DQzFtkCjxJEmQi445q0fsKvkpyFkrRRnp5VN
   aH915yHEu8RMcRnjXYcmYtYZfp/yID5Y5ry07mYRPNes8dWmkgrIaZDx4
   xYl698tDF7hYMaYQLhV9XyJD4W0Yie8Qs+S8eJpOur9r8bjKPNHFnVCD3
   g==;
X-CSE-ConnectionGUID: aQc1PAgITJm9rPRiQtSLzw==
X-CSE-MsgGUID: Tv1aYlxxSnGPLSDdaBZbkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89984137"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89984137"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:54:03 -0700
X-CSE-ConnectionGUID: +npH+SdHSemg3bJrkvy3tg==
X-CSE-MsgGUID: AQ46dJt0SHip0J+0eTY9YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297760763"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.173])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:54:00 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7D804121BD3;
	Mon, 14 Sep 2026 23:53:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x6Dgc-000000035K7-452Z;
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
Subject: [PATCH 19/21] media: ipu6: Move firmware init/cleanup to RPM callbacks
Date: Mon, 14 Sep 2026 23:53:56 +0300
Message-ID: <20260914205358.735307-20-sakari.ailus@linux.intel.com>
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

Move handling firmware initialisation and cleanup away from the rest of
the driver to the runtime PM callbacks. This simplifies the driver,
including removing the ref_count field in struct ipu6_isys.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 10 +++
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 11 +--
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 74 -------------------
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 55 ++++++++++++--
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  2 -
 5 files changed, 59 insertions(+), 93 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 5dc2596766f4..780ac3c4d4e4 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -11,6 +11,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/minmax.h>
+#include <linux/pm_runtime.h>
 #include <linux/sprintf.h>
 #include <linux/string_choices.h>
 
@@ -626,6 +627,10 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	if (!ipu6_isys_csi2_streaming_change(asd, state, pad, &desc, &vc, true))
 		return 0;
 
+	ret = pm_runtime_resume_and_get(sd->dev);
+	if (ret < 0)
+		goto err_del_av;
+
 	ipu6_isys_csi2_setup_watermark(csi2, state, remote_sd);
 
 	stream = ipu6_isys_alloc_stream_firmware(csi2, state, &desc, vc);
@@ -679,6 +684,9 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 
 err_clear_watermark:
 	ipu6_isys_csi2_clear_watermark(csi2);
+	pm_runtime_put(sd->dev);
+
+err_del_av:
 	ipu6_isys_csi2_streaming_change(asd, state, pad, &desc, NULL, false);
 	csi2->stream_ids &= ~sink_streams;
 	list_del(&av->csi2_entry);
@@ -740,6 +748,8 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 
 	ipu6_isys_csi2_clear_watermark(csi2);
 
+	pm_runtime_put(sd->dev);
+
 out_del_csi2_entry:
 	list_del(&av->csi2_entry);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index fd2c55a5e781..0c3576282a42 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -516,19 +516,12 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 		goto out_pipeline_stop;
 	}
 
-	ret = ipu6_isys_fw_open(av->isys);
-	if (ret)
-		goto out_pipeline_stop;
-
 	ret = ipu6_isys_stream_start(av);
 	if (ret)
-		goto out_fw_close;
+		goto out_pipeline_stop;
 
 	return 0;
 
-out_fw_close:
-	ipu6_isys_fw_close(av->isys);
-
 out_pipeline_stop:
 	ipu6_isys_stream_cleanup(av);
 
@@ -550,8 +543,6 @@ static void stop_streaming(struct vb2_queue *q)
 	ipu6_isys_stream_cleanup(av);
 
 	return_buffers(aq, VB2_BUF_STATE_ERROR);
-
-	ipu6_isys_fw_close(av->isys);
 }
 
 static unsigned int
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index feb0ad261252..129016e57446 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -813,80 +813,6 @@ static const struct v4l2_file_operations isys_fops = {
 	.release = vb2_fop_release,
 };
 
-int ipu6_isys_fw_open(struct ipu6_isys *isys)
-{
-	struct ipu6_bus_device *adev = isys->adev;
-	const struct ipu6_fw_isys_ops *fw_ops = adev->auxdrv_data->fw_ops;
-	const struct ipu6_isys_internal_pdata *ipdata = isys->pdata->ipdata;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(&adev->auxdev.dev);
-	if (ret < 0)
-		return ret;
-
-	mutex_lock(&isys->mutex);
-
-	if (isys->ref_count++)
-		goto unlock;
-
-	ipu6_configure_spc(adev->isp, &ipdata->hw_variant,
-			   IPU6_CPD_PKG_DIR_ISYS_SERVER_IDX, isys->pdata->base,
-			   adev->pkg_dir, adev->pkg_dir_dma_addr);
-
-	/*
-	 * Buffers could have been left to wrong queue at last closure.
-	 * Move them now back to empty buffer queue.
-	 */
-	ipu6_cleanup_fw_msg_bufs(isys);
-
-	if (isys->fwctx) {
-		/*
-		 * Something went wrong in previous shutdown. As we are now
-		 * restarting isys we can safely delete old context.
-		 */
-		dev_warn(&adev->auxdev.dev, "clearing old context\n");
-		fw_ops->cleanup(isys);
-	}
-
-	ret = fw_ops->init(isys, ipdata->num_parallel_streams);
-	if (ret < 0)
-		goto out;
-
-unlock:
-	mutex_unlock(&isys->mutex);
-
-	return 0;
-
-out:
-	isys->ref_count--;
-	mutex_unlock(&isys->mutex);
-	pm_runtime_put(&adev->auxdev.dev);
-
-	return ret;
-}
-
-void ipu6_isys_fw_close(struct ipu6_isys *isys)
-{
-	mutex_lock(&isys->mutex);
-
-	isys->ref_count--;
-	if (!isys->ref_count) {
-		isys->adev->auxdrv_data->fw_ops->close(isys);
-		if (isys->fwctx) {
-			isys->need_reset = true;
-			dev_warn(&isys->adev->auxdev.dev,
-				 "failed to close fw isys\n");
-		}
-	}
-
-	mutex_unlock(&isys->mutex);
-
-	if (isys->need_reset)
-		pm_runtime_put_sync(&isys->adev->auxdev.dev);
-	else
-		pm_runtime_put(&isys->adev->auxdev.dev);
-}
-
 /*
  * Do everything that's needed to initialise things related to video
  * buffer queue, video node, and the related media entity. The caller
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 5d220138cf37..fc6e87e9764b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -755,7 +755,9 @@ static void isys_unregister_devices(struct ipu6_isys *isys)
 static int isys_runtime_pm_resume(struct device *dev)
 {
 	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
+	const struct ipu6_fw_isys_ops *fw_ops = adev->auxdrv_data->fw_ops;
 	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
+	const struct ipu6_isys_internal_pdata *ipdata = isys->pdata->ipdata;
 	struct ipu6_device *isp = adev->isp;
 	unsigned long flags;
 	int ret;
@@ -768,7 +770,7 @@ static int isys_runtime_pm_resume(struct device *dev)
 
 	ret = ipu6_buttress_start_tsc_sync(isp);
 	if (ret)
-		return ret;
+		goto err_mmu_hw_cleanup;
 
 	spin_lock_irqsave(&isys->power_lock, flags);
 	isys->power = 1;
@@ -781,7 +783,43 @@ static int isys_runtime_pm_resume(struct device *dev)
 		set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_ON);
 	}
 
-	return 0;
+	ipu6_configure_spc(adev->isp, &ipdata->hw_variant,
+			   IPU6_CPD_PKG_DIR_ISYS_SERVER_IDX, isys->pdata->base,
+			   adev->pkg_dir, adev->pkg_dir_dma_addr);
+
+	/*
+	 * Buffers could have been left to wrong queue at last closure.
+	 * Move them now back to empty buffer queue.
+	 */
+	ipu6_cleanup_fw_msg_bufs(isys);
+
+	if (isys->fwctx) {
+		/*
+		 * Something went wrong in previous shutdown. As we are now
+		 * restarting isys we can safely delete old context.
+		 */
+		dev_warn(&adev->auxdev.dev, "clearing old context\n");
+		fw_ops->cleanup(isys);
+	}
+
+	ret = fw_ops->init(isys, ipdata->num_parallel_streams);
+	if (!ret)
+		return 0;
+
+	spin_lock_irqsave(&isys->power_lock, flags);
+	isys->power = 0;
+	spin_unlock_irqrestore(&isys->power_lock, flags);
+
+	isys->phy_termcal_val = 0;
+	cpu_latency_qos_update_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
+
+	if (!IS_IPU7(isp))
+		set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_OFF);
+
+err_mmu_hw_cleanup:
+	ipu6_mmu_hw_cleanup(adev->mmu);
+
+	return ret;
 }
 
 static int isys_runtime_pm_suspend(struct device *dev)
@@ -790,15 +828,18 @@ static int isys_runtime_pm_suspend(struct device *dev)
 	struct ipu6_isys *isys = dev_get_drvdata(dev);
 	struct ipu6_device *isp = adev->isp;
 	unsigned long flags;
+	int ret = 0;
+
+	isys->adev->auxdrv_data->fw_ops->close(isys);
+	if (isys->fwctx) {
+		dev_warn(&isys->adev->auxdev.dev, "failed to close fw isys\n");
+		ret = -EIO;
+	}
 
 	spin_lock_irqsave(&isys->power_lock, flags);
 	isys->power = 0;
 	spin_unlock_irqrestore(&isys->power_lock, flags);
 
-	mutex_lock(&isys->mutex);
-	isys->need_reset = false;
-	mutex_unlock(&isys->mutex);
-
 	isys->phy_termcal_val = 0;
 	cpu_latency_qos_update_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
 
@@ -807,7 +848,7 @@ static int isys_runtime_pm_suspend(struct device *dev)
 
 	ipu6_mmu_hw_cleanup(adev->mmu);
 
-	return 0;
+	return ret;
 }
 
 static int isys_suspend(struct device *dev)
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index d7d211ad5a54..4991078c18b2 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -89,7 +89,6 @@ struct sensor_async_sd {
  * @fwctx: fw communication layer context pointer
  * @phy_termcal_val: the termination calibration value, only used for DWC PHY
  * @need_reset: Isys requires d0i0->i3 transition
- * @ref_count: total number of callers fw open
  * @mutex: serialise access isys video open/release related operations
  * @stream_mutex: serialise stream start and stop, queueing requests
  * @pdata: platform data pointer
@@ -113,7 +112,6 @@ struct ipu6_isys {
 	bool icache_prefetch;
 	bool csi2_cse_ipc_not_supported;
 	bool iwake_watermark_enabled;
-	unsigned int ref_count;
 	unsigned int sensor_type;
 
 	struct mutex mutex;
-- 
2.47.3

