Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C8F3D9DCD
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276716; cv=none; b=rnskqboBJjWMr/kfqKb2OhQPCpTzrxrBQT3O0medxOc49DsyHDX0eWon+n77jBNt0IZce1T9sEMIjfaEp7HjUX0S1/jIoRQ/IiRd7X/cP79mR88ze7TdO+4znn1lgz79QJelA5q5YnfK1bL2lPQ7mU1HEQ/eNao9wz9yfY+oqKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276716; c=relaxed/simple;
	bh=wXmMY4q3CAeFxxaUmRaoaaH/vN95AAB5Tq5v7Vajbac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JyLnmsEKjaeZ/0TWhr/Gvoa2I1Mk1xvKDhBpUJdkHUAxrt2DRV5A7Kip4jPTt/Nh5lXp7970G4oP5Y+Uc2GALVofpQZZ0l4wNX+lCg8eg+eNJNtk+c2l/p+Y3xy4ZLDpHaLAgv3QHGsVC6DQEU89+BnqUAXXHzxvHEQwnGxn6sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJHlo+2V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJHlo+2V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67FB91F00A3A;
	Fri, 17 Jul 2026 08:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276714;
	bh=3zjzu5pc5O/W4V10PZoDt8tHD+YWmteu4fGqpwGPmUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KJHlo+2VQffOyyuToS5KYF3V0c2jyvnkaytcSoYQdVnAHL3F5eDxRm1P559s3RcSl
	 RUalAapO5fHQCDm38H/Emq+RZT2R/5MvUCq+NEuiqJ9FxwhiR7D6hIafrR6shUjbGo
	 ww/wultDESv9VowrM3qQpseKWLtFI7n2+qc0qgnDeFVkXRUhL1vYKj5m2yihaqt4X3
	 9KTtujgMHA2oGPn3LqzJIYwdmqmbNRA/UvXMQbVHLVfSPJQzwqGFXydtQk0X9Pmpoc
	 n4O1QDlamhKTOQXoKBpELtW7KNvacAcdRsKYUbofW04zRjs2PtrbsNw14axtIPWESt
	 uuo40mNc8o/BA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Keke Li <keke.li@amlogic.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 06/19] media: amlogic: c3: isp: drop vb2_queue_release calls
Date: Fri, 17 Jul 2026 10:19:29 +0200
Message-ID: <23c3158b126781da9437ec8facf153bf95520fc4.1784276382.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1784276382.git.hverkuil+cisco@kernel.org>
References: <cover.1784276382.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index 11d85f5342f0..a0d92ac1b78c 100644
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
 		media_entity_cleanup(&cap->vdev.entity);
-		video_unregister_device(&cap->vdev);
+		vb2_video_unregister_device(&cap->vdev);
 		mutex_destroy(&cap->lock);
 	}
 }
diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
index aec3eed0e443..782f18c90995 100644
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
 	media_entity_cleanup(&params->vdev.entity);
-	video_unregister_device(&params->vdev);
+	vb2_video_unregister_device(&params->vdev);
 	mutex_destroy(&params->lock);
 }
 
diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-stats.c
index 8a5d7e1a30c9..78722cbe44b4 100644
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
 	media_entity_cleanup(&stats->vdev.entity);
-	video_unregister_device(&stats->vdev);
+	vb2_video_unregister_device(&stats->vdev);
 	mutex_destroy(&stats->lock);
 }
 
-- 
2.53.0

