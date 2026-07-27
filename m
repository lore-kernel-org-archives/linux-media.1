Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237CE40F734
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158123; cv=none; b=YXjwvrJo0aB0y/j56plRNO/UKE0sTL9m0mO8QTS7fHUN3jRwyVbysnJBFgKybqQR1MxpT+KrC6nCCD4waTxlRIbsX7E5iePH5SKn358ZyDtW1vn3rRUuYEDkeX3knNfPtZaSv6X3BA9DZxz97G4kLy8wc5DOVB6Gsn06y2/BaLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158123; c=relaxed/simple;
	bh=HcVWGkNIHmvex4g93O+3SlqBlWnKXgxh3ogX8S67NhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IIFlXhvZyFnyDdfUkxgcr+MaZTn4tRJte8ZZRXDAI21AM0YCzzu33AJpxLLVEmiMI33SOyxaxlrSWmYytW6UM82EaF06AcC+is59Sp8AP7xp5/oYxfY/IdChSUzVtdi9VDhqaxUKo7uPItpT+xd46ixOlT4Hsu3uBS3ptWqKBPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UifoXqeL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UifoXqeL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910231F000E9;
	Mon, 27 Jul 2026 13:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158121;
	bh=4XwxiZri45UpeKsWYg+QrjZ9Z0d7ngqeW8CPEC3wl4s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UifoXqeLWTpOfJIkuZOC9q8BScurcMmSmgUgDQp4h5r/g7cKxgRJFKbbXCjc65J4V
	 UC5vaa5F2uMDjnAuTAr3NVG77m634qmP1VrH/pZ7v4OZVNaQmfb7+GF5lRImOR31Gz
	 /xnoU1EQJzTh3GooFjU+QfUEYFwAhF1b/YLacHL5dVbaCdDQnl5fT53jkdxk9uD/D1
	 XsUi+LjhxAmz0EwThFO0bb5TWWL9b//unfMW50+/7Sj8bKollI9XE7THYnBE2boOc0
	 MC/EozlFMHmUtNfNbta2rUfu4Y7YSf8PbH/T0FURYecgHe547okg8c/RwLF6oAPWtr
	 OEpPs9ZQ9abBw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Keke Li <keke.li@amlogic.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCHv2 06/19] media: amlogic: c3: isp: drop vb2_queue_release calls
Date: Mon, 27 Jul 2026 15:12:53 +0200
Message-ID: <ed09811dc7bf7ee2ab927b73066770d2aed13d44.1785157986.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785157986.git.hverkuil+cisco@kernel.org>
References: <cover.1785157986.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vb2_queue_release() function should not be called directly from a
driver. Leave that to the helper functions.

Either that function was called when the video device was not
yet registered (so nothing to release), or use vb2_video_unregister_device
instead of the video_unregister_device/vb2_queue_release pair.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Keke Li <keke.li@amlogic.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/platform/amlogic/c3/isp/c3-isp-capture.c    |  7 ++-----
 drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 11 ++++-------
 drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c  |  7 ++-----
 3 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c
index 11d85f5342f0..75c73e2e18f5 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-capture.c
@@ -720,7 +720,7 @@ static int c3_isp_register_capture(struct c3_isp_capture *cap)
 	cap->pad.flags = MEDIA_PAD_FL_SINK;
 	ret = media_entity_pads_init(&vdev->entity, 1, &cap->pad);
 	if (ret)
-		goto err_queue_release;
+		goto err_destroy;
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
@@ -733,8 +733,6 @@ static int c3_isp_register_capture(struct c3_isp_capture *cap)
 
 err_entity_cleanup:
 	media_entity_cleanup(&vdev->entity);
-err_queue_release:
-	vb2_queue_release(vb2_q);
 err_destroy:
 	mutex_destroy(&cap->lock);
 	return ret;
@@ -789,9 +787,8 @@ void c3_isp_captures_unregister(struct c3_isp_device *isp)
 
 		if (!cap->isp)
 			continue;
-		vb2_queue_release(&cap->vb2_q);
+		vb2_video_unregister_device(&cap->vdev);
 		media_entity_cleanup(&cap->vdev.entity);
-		video_unregister_device(&cap->vdev);
 		mutex_destroy(&cap->lock);
 	}
 }
diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
index aec3eed0e443..b305755f77aa 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
@@ -876,12 +876,12 @@ int c3_isp_params_register(struct c3_isp_device *isp)
 
 	ret = vb2_queue_init(vb2_q);
 	if (ret)
-		goto err_detroy;
+		goto err_destroy;
 
 	params->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&vdev->entity, 1, &params->pad);
 	if (ret)
-		goto err_queue_release;
+		goto err_destroy;
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret < 0) {
@@ -894,9 +894,7 @@ int c3_isp_params_register(struct c3_isp_device *isp)
 
 err_entity_cleanup:
 	media_entity_cleanup(&vdev->entity);
-err_queue_release:
-	vb2_queue_release(vb2_q);
-err_detroy:
+err_destroy:
 	mutex_destroy(&params->lock);
 	return ret;
 }
@@ -905,9 +903,8 @@ void c3_isp_params_unregister(struct c3_isp_device *isp)
 {
 	struct c3_isp_params *params = &isp->params;
 
-	vb2_queue_release(&params->vb2_q);
+	vb2_video_unregister_device(&params->vdev);
 	media_entity_cleanup(&params->vdev.entity);
-	video_unregister_device(&params->vdev);
 	mutex_destroy(&params->lock);
 }
 
diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c
index 8a5d7e1a30c9..983dd91b1933 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c
@@ -279,7 +279,7 @@ int c3_isp_stats_register(struct c3_isp_device *isp)
 	stats->pad.flags = MEDIA_PAD_FL_SINK;
 	ret = media_entity_pads_init(&vdev->entity, 1, &stats->pad);
 	if (ret)
-		goto err_queue_release;
+		goto err_destroy;
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
@@ -292,8 +292,6 @@ int c3_isp_stats_register(struct c3_isp_device *isp)
 
 err_entity_cleanup:
 	media_entity_cleanup(&vdev->entity);
-err_queue_release:
-	vb2_queue_release(vb2_q);
 err_destroy:
 	mutex_destroy(&stats->lock);
 	return ret;
@@ -303,9 +301,8 @@ void c3_isp_stats_unregister(struct c3_isp_device *isp)
 {
 	struct c3_isp_stats *stats = &isp->stats;
 
-	vb2_queue_release(&stats->vb2_q);
+	vb2_video_unregister_device(&stats->vdev);
 	media_entity_cleanup(&stats->vdev.entity);
-	video_unregister_device(&stats->vdev);
 	mutex_destroy(&stats->lock);
 }
 
-- 
2.53.0

