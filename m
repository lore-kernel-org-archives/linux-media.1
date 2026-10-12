Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F20D4DA9BB
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 19:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791833140; cv=none; b=sTnKu58KPs08eKQYRI1qI0tiZ89JO2sRFGOwfTXJ0oqPxGRwHyxgj5MyZvCNVwWW+E88ycAFCX3uuFyQ3EdFfdBi12DOQP472hJWL/RQ4Qr6xibwLU4fYSh/bwxGkdnfK1F7gSzt/Sycyj7HFJr+FBik1A9BgE+RdyICRIN9vCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791833140; c=relaxed/simple;
	bh=MB99RfFn0mZgAGDozLnh06Bb+IxYKb6E9lx5H3uIVSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QZkcM/QDeCNg6Fy3gNPupsFx7qfXectwWshyOalQl4sLkoIzkGtFItMZPU6TObioYK6RqKxUIA6RuL8ZFTe95PfV29GCbLnk4ekX2AevJxxZ42wpeFrzHIdm0tXRMSro50Tyv63myHmIlA+e0yopmfL5IF5NqIs2+f8mPbeb9wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K+WsH/ep; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+WsH/ep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791833140; x=1823369140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MB99RfFn0mZgAGDozLnh06Bb+IxYKb6E9lx5H3uIVSE=;
  b=K+WsH/ep1MjgBFKQiQXT20OBcveAeEOTYpyomMPOT4j4NNgVTlLDXGX+
   0OMBxrZI3wt2VIKdMywrjiuFaQgGp4yLQf7GU803B6oG2czukWQDjM3Hj
   2fi6VjkZsQIyRRM92imqo4e5za2sRhofl6ZCA1EvGxto/yKwIifCAGSvR
   iVZMGFHRWGvc1Ye8TC7dlsmNHEwMx5dfKj2tTbfp0DSSEnsHiKFZxtj1o
   0jpgO39E056RfjFt8ew/Mw0U/iF6+mk+9znLyPaAUnwu75T5Tr8r4xx8t
   OPy4uLaEF/z9+1Cry4VBcOjY8HpmOvPCrhUOYMsAlilDZjR/jXc5i32lx
   g==;
X-CSE-ConnectionGUID: zryH0w6qSe2b62g0jYiVzQ==
X-CSE-MsgGUID: n5jiDrvqRima8+xkvyo3ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="537702"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="537702"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 12:25:39 -0700
X-CSE-ConnectionGUID: Yp1ZoE4wQiu/FrI40iseCw==
X-CSE-MsgGUID: L184a+2sSoCrR+Y+vwUgjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1062263"
Received: from aduenasd-mobl5.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.178])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 12:25:37 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	miguel.vadillo@intel.com,
	sakari.ailus@linux.intel.com,
	mehdi.djait@linux.intel.com
Cc: antti.laakso@linux.intel.com
Subject: [PATCH 2/2] media: cvs: Remove runtime PM support
Date: Mon, 12 Oct 2026 22:25:25 +0300
Message-ID: <347b1ce25fd4d3197dbe47db2b23b6d0535b0bae.1791831649.git.antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791831649.git.antti.laakso@linux.intel.com>
References: <cover.1791831649.git.antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CSI link is handed to the host on stream enable and back to the
CVS on stream disable. The runtime PM is doing the same, and is now
unnecessary. Remove runtime PM.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/i2c/cvs/core.c | 65 +++---------------------------------
 drivers/media/i2c/cvs/icvs.h |  2 +-
 drivers/media/i2c/cvs/v4l2.c | 30 +++++------------
 3 files changed, 14 insertions(+), 83 deletions(-)

diff --git a/drivers/media/i2c/cvs/core.c b/drivers/media/i2c/cvs/core.c
index 489a5ce7bd1d..0cd5f747eaeb 100644
--- a/drivers/media/i2c/cvs/core.c
+++ b/drivers/media/i2c/cvs/core.c
@@ -15,7 +15,6 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/time64.h>
 #include <linux/workqueue.h>
@@ -603,9 +602,6 @@ int cvs_send(struct icvs *ctx, struct icvs_cmd *cmd, size_t len)
  * @ctx: CVS device context
  * @owner: Desired owner (ICVS_CSI_LINK_HOST or ICVS_CSI_LINK_CVS)
  *
- * Called from runtime PM callbacks to claim or release the CSI-2 link.
- * Also callable directly for error recovery paths.
- *
  * Return: 0 on success or negative errno.
  */
 int cvs_set_link_owner(struct icvs *ctx, enum icvs_csi_link_owner owner)
@@ -800,21 +796,12 @@ static int cvs_core_probe(struct device *dev, struct i2c_client *i2c)
 	}
 
 	dev_set_drvdata(dev, ctx);
-	pm_runtime_set_autosuspend_delay(dev, 1000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_enable(dev);
-	pm_runtime_idle(dev);
 
 	/*
-	 * Create a PM runtime device link with IPU as consumer and CVS as
-	 * supplier. When the IPU runtime-resumes to start streaming, the PM
-	 * framework automatically resumes CVS first, triggering
-	 * cvs_runtime_resume() which hands CSI-2 link ownership to the host.
+	 * Create a device link with IPU as consumer and CVS as supplier so
+	 * that CVS suspends after and resumes before the IPU.
 	 */
-	ctx->ipu_link = device_link_add(&ipu->dev, dev,
-					DL_FLAG_PM_RUNTIME |
-					DL_FLAG_RPM_ACTIVE |
-					DL_FLAG_STATELESS);
+	ctx->ipu_link = device_link_add(&ipu->dev, dev, DL_FLAG_STATELESS);
 	if (!ctx->ipu_link) {
 		dev_err(dev, "IPU device link failed\n");
 		ret = -ENODEV;
@@ -829,12 +816,7 @@ static int cvs_core_probe(struct device *dev, struct i2c_client *i2c)
 	return 0;
 
 err_csi_remove:
-	if (ctx->ipu_link)
-		device_link_del(ctx->ipu_link);
 	cvs_csi_remove(ctx);
-	pm_runtime_dont_use_autosuspend(dev);
-	pm_runtime_disable(dev);
-	pm_runtime_set_suspended(dev);
 
 err_put_ipu:
 	put_device(&ipu->dev);
@@ -864,12 +846,7 @@ static void cvs_core_remove(struct device *dev)
 	cancel_delayed_work_sync(&ctx->work);
 	cvs_csi_remove(ctx);
 
-	if (ctx->ipu_link)
-		device_link_del(ctx->ipu_link);
-
-	pm_runtime_put_noidle(dev);
-	pm_runtime_disable(dev);
-	pm_runtime_set_suspended(dev);
+	device_link_del(ctx->ipu_link);
 
 	cvs_reset(ctx);
 }
@@ -921,42 +898,8 @@ static int __maybe_unused cvs_resume(struct device *dev)
 	return 0;
 }
 
-/**
- * cvs_runtime_resume - Runtime PM resume: claim CSI-2 link ownership
- * @dev: Device
- *
- * Triggered automatically when the IPU (consumer) runtime-resumes, because
- * a DL_FLAG_PM_RUNTIME device link makes CVS the supplier. Transfers CSI-2
- * link ownership to the host so the IPU can start receiving sensor frames.
- *
- * Return: 0 on success or negative errno.
- */
-static int __maybe_unused cvs_runtime_resume(struct device *dev)
-{
-	struct icvs *ctx = dev_get_drvdata(dev);
-
-	return cvs_set_link_owner(ctx, ICVS_CSI_LINK_HOST);
-}
-
-/**
- * cvs_runtime_suspend - Runtime PM suspend: release CSI-2 link ownership
- * @dev: Device
- *
- * Called when the streaming reference is dropped by cvs_csi_disable_streams
- * via pm_runtime_put_autosuspend. Returns CSI-2 link ownership to CVS firmware.
- *
- * Return: 0 on success or negative errno.
- */
-static int __maybe_unused cvs_runtime_suspend(struct device *dev)
-{
-	struct icvs *ctx = dev_get_drvdata(dev);
-
-	return cvs_set_link_owner(ctx, ICVS_CSI_LINK_CVS);
-}
-
 static const struct dev_pm_ops __maybe_unused cvs_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(cvs_suspend, cvs_resume)
-	SET_RUNTIME_PM_OPS(cvs_runtime_suspend, cvs_runtime_resume, NULL)
 };
 
 static const struct acpi_device_id intel_cvs_acpi_match[] = {
diff --git a/drivers/media/i2c/cvs/icvs.h b/drivers/media/i2c/cvs/icvs.h
index 17beb0920dd2..18ec76ce49a6 100644
--- a/drivers/media/i2c/cvs/icvs.h
+++ b/drivers/media/i2c/cvs/icvs.h
@@ -432,7 +432,7 @@ enum icvs_state {
  * @freq_ctrl: (future) frequency control pointer
  * @pads: Local media pads (sink/source)
  * @nr_of_lanes: Active CSI-2 lane count
- * @ipu_link: PM runtime device link (IPU consumer, CVS supplier)
+ * @ipu_link: Device link for suspend/resume ordering
  * @res: Resource capability (light/full)
  * @caps: Reported device protocol capabilities
  * @prefix: Firmware response prefix present
diff --git a/drivers/media/i2c/cvs/v4l2.c b/drivers/media/i2c/cvs/v4l2.c
index 5a9d7caaee3f..37cde9f115a0 100644
--- a/drivers/media/i2c/cvs/v4l2.c
+++ b/drivers/media/i2c/cvs/v4l2.c
@@ -7,7 +7,6 @@
 #include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/module.h>
-#include <linux/pm_runtime.h>
 #include <linux/property.h>
 
 #include <media/v4l2-async.h>
@@ -83,6 +82,10 @@ static int cvs_csi_enable_streams(struct v4l2_subdev *sd,
 	s64 link_freq;
 	int ret;
 
+	link_freq = v4l2_get_link_freq(ctx->remote, 0, 0);
+	if (link_freq < 0)
+		return link_freq;
+
 	ret = cvs_set_link_owner(ctx, ICVS_CSI_LINK_HOST);
 	if (ret) {
 		dev_err(dev, "failed to hand over CSI link to host: %d\n",
@@ -90,36 +93,23 @@ static int cvs_csi_enable_streams(struct v4l2_subdev *sd,
 		return ret;
 	}
 
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0)
-		return ret;
-
-	link_freq = v4l2_get_link_freq(ctx->remote, 0, 0);
-	if (link_freq < 0) {
-		ret = link_freq;
-		goto err_rpm_put;
-	}
-
 	if (ctx->i2c_client) {
 		ret = csi_set_link_cfg(ctx, link_freq);
 		if (ret < 0)
-			goto err_rpm_put_sync;
+			goto err_release_link;
 	}
 
 	ret = v4l2_subdev_enable_streams(remote_sd,
 					 ctx->remote->index,
 					 streams_mask);
 	if (ret)
-		goto err_rpm_put_sync;
+		goto err_release_link;
 
 	return 0;
 
-err_rpm_put_sync:
-	/* Bypass autosuspend to immediately release ownership on error */
-	pm_runtime_put_sync(dev);
-	return ret;
-err_rpm_put:
-	pm_runtime_put_autosuspend(dev);
+err_release_link:
+	cvs_set_link_owner(ctx, ICVS_CSI_LINK_CVS);
+
 	return ret;
 }
 
@@ -144,8 +134,6 @@ static int cvs_csi_disable_streams(struct v4l2_subdev *sd,
 		dev_err(dev, "failed to hand over CSI link to CVS: %d\n",
 			link_ret);
 
-	pm_runtime_put_autosuspend(dev);
-
 	return ret ? : link_ret;
 }
 
-- 
2.55.0

