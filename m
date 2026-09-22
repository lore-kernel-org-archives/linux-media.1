Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA68541472
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 12:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078761; cv=none; b=BmmoS4f03qZydwwgDZv79R4cKNYpD3QEW9icFobhiqpRANViTGjkb4vMlpiV3SJdvJgp5IUfVRrigkMmHdxKyqV6BbpmZ02nP8K6T9PwEItf7o3EboWOOXqj5uBIj1aFkMiU6PkelJP/R30Bo0W2eQ+lX8sQRCfGz80cozolCXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078761; c=relaxed/simple;
	bh=Br00EIywNJnJVLMW3xtgc6XxwvURAPUNOYHCh9Xeduw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R8nwqUNGHS0CTLI7I6WYFuDR5BTp7pPw0dyVdyx3Ygl94gaiXNomhhSrl3lwDpVhyZuK0tBiUqCUYJEG7IWKrWq8zoKfPjy/UdbRHeFgpI1iNQj1/zne94f9kvkYm1+rYOExYRH2w80kCPEETkjbXjBQD4KaRtnpzeiRdT94ukM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOVFz2BR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOVFz2BR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790078758; x=1821614758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Br00EIywNJnJVLMW3xtgc6XxwvURAPUNOYHCh9Xeduw=;
  b=IOVFz2BRo6y9i79/VqgkLoDX1A5YIe0s5HAq1wcx479nDALcnv3j5ddZ
   OpOp31ds5xzxtAt882ENJU2mFkd3QBdnNJVLUaSQNbOjhfV5CbjhAMVIR
   6r3mcUvTtXmp8Ifm2eOatBe9fxuED7kO2tnKDQMQYHhZxBUlDsaNem+4u
   +zdPblAEnqyCTcuolPyjAwDr1KyYrSmy/h1n46h03qmt3Nu+eXyBTvbff
   mf4p05L47Vmpf5IMuNKdZG8RIMnMkKyS9SDSZTXimqo5HpcWXUwy/OMYG
   fW7IIJuwSNgWxcWiWT68tycWTREBYctjfudZaDq8Fj55OCmXtlxhmfjSR
   g==;
X-CSE-ConnectionGUID: J1MrWF6CRMCnt1RjFB3tsA==
X-CSE-MsgGUID: 3FemSYfvSmOBnPvIjr1khw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="78227124"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="78227124"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:51 -0700
X-CSE-ConnectionGUID: fiRN39ywQYmkciVUcSAVFg==
X-CSE-MsgGUID: tC8dVOAASJyO229CcYrKVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="301029196"
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:05:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D242B121D95;
	Tue, 22 Sep 2026 15:05:40 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x8zFj-00000003lIi-02J1;
	Tue, 22 Sep 2026 15:05:39 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	Nicola Fiorillo <nicfio@gmail.com>
Subject: [PATCH v3 19/21] media: ipu6: Move firmware init/cleanup to RPM callbacks
Date: Tue, 22 Sep 2026 15:05:36 +0300
Message-ID: <20260922120538.896684-20-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922120538.896684-1-sakari.ailus@linux.intel.com>
References: <20260922120538.896684-1-sakari.ailus@linux.intel.com>
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
index adee933bcfcd..6cf58d8aa876 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -11,6 +11,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/minmax.h>
+#include <linux/pm_runtime.h>
 #include <linux/sprintf.h>
 #include <linux/string_choices.h>
 
@@ -629,6 +630,10 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	if (ret < 0)
 		goto err_av_del;
 
+	ret = pm_runtime_resume_and_get(sd->dev);
+	if (ret < 0)
+		goto err_del_av;
+
 	ipu6_isys_csi2_setup_watermark(csi2, state, remote_sd);
 
 	stream = ipu6_isys_alloc_stream_firmware(csi2, state, &desc, vc);
@@ -682,6 +687,9 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 
 err_clear_watermark:
 	ipu6_isys_csi2_clear_watermark(csi2);
+	pm_runtime_put(sd->dev);
+
+err_del_av:
 	ipu6_isys_csi2_streaming_change(asd, state, pad, &desc, NULL, false);
 	csi2->stream_ids &= ~sink_streams;
 err_av_del:
@@ -746,6 +754,8 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 
 	ipu6_isys_csi2_clear_watermark(csi2);
 
+	pm_runtime_put(sd->dev);
+
 out_del_csi2_entry:
 	list_del(&av->csi2_entry);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index c7be7e1efe13..2608e3b91acb 100644
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

