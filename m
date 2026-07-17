Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F9E3DE438
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276726; cv=none; b=o60QqbuBwhHntHOrtyRZ87U4bpArAEtKy5OJCgE3vTuLjiM2kU6wQ7we462WHqfOjAYCYBjkrGh2VceA/sTKOplVKVQtNzy7RHVnPBNHqPBVr4AeQIeLWKKykzP+wI2uUJ3XB7tm5IL+wx+QmRomFm9LewLNHk6iTOQrvl3ptRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276726; c=relaxed/simple;
	bh=vasKhCCkCyhbKGZlJPQY0pvOIVPm4vMZ5TtvUX05ogc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dfV/LcJF0ieO962MZGVnVz91UILKh6dzsbz+QRi2B3yf/KlTOXaN2d79zLpI9hG3DoehSHwKRzphY4hi7KjE6RQdi3NvPb51MEI9by5ZNr1NHzd/UeindHzKOvjmdp3fxR8X0xyVACMv3hXB8aiQNBrzhd4A2qvtixlc3H7rNKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQ232Ak/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQ232Ak/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 838B11F000E9;
	Fri, 17 Jul 2026 08:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276724;
	bh=0ne8fv6z+qjFWSjm3iPf7zpNr/gJl5svMxBsKploUuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CQ232Ak/AVRFNlbzPN946/W3cH5+DxvYccwImQfUCaBGfXgyrpDyD3eies9p4kHkd
	 b2Dq3x2I0bDVCZZB3TTHwYZqaePgp1Cs8oWCB/OvdXHbeSBBmwheincd8vzqV6OrwY
	 p0JZmME80xdAelPuzVIgqPqqkM/Z3TtCPI/j/+aU5IQEb2THbt5fkLVMXsY1U7EZma
	 HVRH07QCfLMWwWVVfDcLedNCFkzRA89ugOkqS16zmZypj5Q7CDO6vxn+dKtVZakQ9D
	 RXXXrsVMbGN6xQwYdTinxjR4t1EHwWf8SAWDY//7AMpRd4sKben3uuWMxzUIo0BknG
	 9mEmO/SZIhK0g==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Subject: [PATCH 12/19] media: raspberrypi: pisp_be: use vb2_video_unregister_device
Date: Fri, 17 Jul 2026 10:19:35 +0200
Message-ID: <5825a08d449fb9302943636b3c656a1e8803cf35.1784276382.git.hverkuil+cisco@kernel.org>
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

Use vb2_video_unregister_device instead of the
video_unregister_device/vb2_queue_release pair.

This simplifies the code.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
---
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index d60d92d2ffa1..4689e961bb19 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1443,7 +1443,7 @@ static int pispbe_init_node(struct pispbe_dev *pispbe, unsigned int id)
 		dev_err(pispbe->dev,
 			"Failed to register media pads for %s device node\n",
 			NODE_NAME(node));
-		goto err_unregister_queue;
+		goto err_mutex_destroy;
 	}
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
@@ -1451,7 +1451,7 @@ static int pispbe_init_node(struct pispbe_dev *pispbe, unsigned int id)
 		dev_err(pispbe->dev,
 			"Failed to register video %s device node\n",
 			NODE_NAME(node));
-		goto err_unregister_queue;
+		goto err_mutex_destroy;
 	}
 	video_set_drvdata(vdev, node);
 
@@ -1472,9 +1472,7 @@ static int pispbe_init_node(struct pispbe_dev *pispbe, unsigned int id)
 	return 0;
 
 err_unregister_video_dev:
-	video_unregister_device(&node->vfd);
-err_unregister_queue:
-	vb2_queue_release(&node->queue);
+	vb2_video_unregister_device(&node->vfd);
 err_mutex_destroy:
 	mutex_destroy(&node->node_lock);
 	mutex_destroy(&node->queue_lock);
@@ -1576,8 +1574,7 @@ static int pispbe_init_devices(struct pispbe_dev *pispbe)
 	media_device_unregister(mdev);
 err_unregister_nodes:
 	while (num_regist-- > 0) {
-		video_unregister_device(&pispbe->node[num_regist].vfd);
-		vb2_queue_release(&pispbe->node[num_regist].queue);
+		vb2_video_unregister_device(&pispbe->node[num_regist].vfd);
 	}
 	v4l2_device_unregister_subdev(&pispbe->sd);
 	media_entity_cleanup(&pispbe->sd.entity);
@@ -1605,8 +1602,7 @@ static void pispbe_destroy_devices(struct pispbe_dev *pispbe)
 	media_device_unregister(&pispbe->mdev);
 
 	for (int i = PISPBE_NUM_NODES - 1; i >= 0; i--) {
-		video_unregister_device(&pispbe->node[i].vfd);
-		vb2_queue_release(&pispbe->node[i].queue);
+		vb2_video_unregister_device(&pispbe->node[i].vfd);
 		mutex_destroy(&pispbe->node[i].node_lock);
 		mutex_destroy(&pispbe->node[i].queue_lock);
 	}
-- 
2.53.0

