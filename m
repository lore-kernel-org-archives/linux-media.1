Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FE131E825;
	Fri, 19 Jun 2026 05:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781846834; cv=none; b=CBb8kMd9pLzcOqDsMxk/8sH/ulI2f33XayPkcEl8LuwKS9hP3+/cklR2tL+LCUlXVssc8JaVw/1mOQAAo755b86rL77+5iXmkXGUTrhiFL3eHRlrbrcntsa6C3nUsoW9VmiLX2JPaYZ3lYWhcDFPagVyfG4CxeXDwHwUWdSF0D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781846834; c=relaxed/simple;
	bh=QnDVv3PMSR+bMRnOEYkvFZrCcz9vpEPE/77orFsXWGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q8T9iJXiu2098FRq0rfjOMn2fX7tGjtK+byIvFLeMpVNdPhKp39UImBBvdG6VchRpWtkeUfMp9D7I2U8w5bb84xaieVa6tAfn6gDaXZ44Qc5WHBw4W49IxhkYnZzd69JoFhgRRakxquHW4IwbnY5yzdUUQisz/gcQOkatdfNQuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p4ebt1P0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p4ebt1P0"
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2404:7a81:160:2100:327:f131:c148:b7f8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12BCD16CB;
	Fri, 19 Jun 2026 07:26:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781846796;
	bh=QnDVv3PMSR+bMRnOEYkvFZrCcz9vpEPE/77orFsXWGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p4ebt1P0dF/qmFlJgTmGp1UaORVFW4gB+w4mfbpOCX3U3Bc7qfQuPkVzZBR2Pn45E
	 ZRC7zd/KwiDYFUYjoi/X1BkBk8VF8IylBQSH9S0uhMrShIhzJQAF1JCtfwecU/Wilj
	 4k5NO1OC56o/I6DoIEHkDMvFSn26fZ+ZArudey5s=
From: Paul Elder <paul.elder@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	michael.riesch@collabora.com,
	xuhf@rock-chips.com,
	stefan.klug@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	nicolas.dufresne@collabora.com,
	ribalda@chromium.org,
	sakari.ailus@linux.intel.com
Subject: [RFC PATCH 3/6] media: rkcif: Use shared media graph
Date: Fri, 19 Jun 2026 14:26:30 +0900
Message-ID: <20260619052637.1110672-4-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
References: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make rkcif use shared media graph. This allows it to be in the same
media graph as rkisp2 on the rk3588, opening to door to allowing the
entire capture pipeline to run in inline mode.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 .../platform/rockchip/rkcif/rkcif-common.h    |  2 +-
 .../media/platform/rockchip/rkcif/rkcif-dev.c | 32 +++++++++----------
 .../platform/rockchip/rkcif/rkcif-interface.c | 10 ++++++
 3 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
index 4d9211ba9bda..f2989d152ba2 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -242,7 +242,7 @@ struct rkcif_device {
 
 	struct rkcif_interface interfaces[RKCIF_IF_MAX];
 
-	struct media_device media_dev;
+	struct media_device *media_dev;
 	struct v4l2_device v4l2_dev;
 	struct v4l2_async_notifier notifier;
 };
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
index be3a174b9aab..4c86e3e2f3cd 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
@@ -20,6 +20,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+#include <media/mc-shared-graph.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mc.h>
 
@@ -165,6 +166,7 @@ static int rkcif_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rkcif_device *rkcif;
+	struct media_device *mdev;
 	int ret, irq;
 
 	rkcif = devm_kzalloc(dev, sizeof(*rkcif), GFP_KERNEL);
@@ -212,22 +214,22 @@ static int rkcif_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
-	rkcif->media_dev.dev = dev;
-	strscpy(rkcif->media_dev.model, RKCIF_DRIVER_NAME,
-		sizeof(rkcif->media_dev.model));
-	media_device_init(&rkcif->media_dev);
+	mdev = media_device_shared_join(rkcif->dev);
+	if (IS_ERR(mdev)) {
+		dev_err(dev, "failed to register media device: %d\n", ret);
+		goto err_pm_runtime_disable;
+	}
+
+	rkcif->media_dev = mdev;
+	rkcif->media_dev->dev = dev;
+	strscpy(rkcif->media_dev->model, RKCIF_DRIVER_NAME,
+		sizeof(rkcif->media_dev->model));
 
-	rkcif->v4l2_dev.mdev = &rkcif->media_dev;
+	rkcif->v4l2_dev.mdev = rkcif->media_dev;
 	ret = v4l2_device_register(dev, &rkcif->v4l2_dev);
 	if (ret)
 		goto err_media_dev_cleanup;
 
-	ret = media_device_register(&rkcif->media_dev);
-	if (ret < 0) {
-		dev_err(dev, "failed to register media device: %d\n", ret);
-		goto err_v4l2_dev_unregister;
-	}
-
 	v4l2_async_nf_init(&rkcif->notifier, &rkcif->v4l2_dev);
 	rkcif->notifier.ops = &rkcif_notifier_ops;
 
@@ -247,11 +249,10 @@ static int rkcif_probe(struct platform_device *pdev)
 	rkcif_unregister(rkcif);
 err_notifier_cleanup:
 	v4l2_async_nf_cleanup(&rkcif->notifier);
-	media_device_unregister(&rkcif->media_dev);
-err_v4l2_dev_unregister:
 	v4l2_device_unregister(&rkcif->v4l2_dev);
 err_media_dev_cleanup:
-	media_device_cleanup(&rkcif->media_dev);
+	media_device_shared_leave(rkcif->media_dev, rkcif->dev);
+err_pm_runtime_disable:
 	pm_runtime_disable(&pdev->dev);
 	return ret;
 }
@@ -263,9 +264,8 @@ static void rkcif_remove(struct platform_device *pdev)
 	v4l2_async_nf_unregister(&rkcif->notifier);
 	rkcif_unregister(rkcif);
 	v4l2_async_nf_cleanup(&rkcif->notifier);
-	media_device_unregister(&rkcif->media_dev);
 	v4l2_device_unregister(&rkcif->v4l2_dev);
-	media_device_cleanup(&rkcif->media_dev);
+	media_device_shared_leave(rkcif->media_dev, rkcif->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
index 414a9980cf2e..cd791186f224 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2025 Collabora, Ltd.
  */
 
+#include <media/mc-shared-graph.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mc.h>
@@ -399,6 +400,15 @@ int rkcif_interface_register(struct rkcif_device *rkcif,
 	if (ret)
 		goto err_subdev_unregister;
 
+	ret = media_device_shared_join_link_source(interface->rkcif->media_dev,
+						   interface->rkcif->dev,
+						   &interface->sd.entity,
+						   RKCIF_IF_PAD_SRC,
+						   0);
+	if (ret)
+		goto err_subdev_unregister;
+
+
 	return 0;
 
 err_subdev_unregister:
-- 
2.47.2

