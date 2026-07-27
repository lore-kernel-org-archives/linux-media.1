Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3B4412279
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158132; cv=none; b=JZwJvrP3/XgUSkXBUIvcxeLKDepB6z7aAYlpSmI/YsYNEem8AIeN297Inh15MG2vxqhGVoxTGMUv+gNU8iYSRV2dmIdongln3c7aD7KuvrgtWQaXnIEhMzqcwEn11btlMqGmsOtW6QG58GZrVSZx6yWIKkUuB5v4bKDUgOypsP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158132; c=relaxed/simple;
	bh=+jL1FSO89Bhbj+i60eM5fWkog5TIK7G3W/futS0v9vY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b86vDdqJLfvgjW4XZ1+2OyorMPv/pTTTBLA9HRX6qetAcKleB9+8G3ZDtGTb9//vbWIBjYw5/D5HzT5wS3EWC/C7QZOFXSn8qOVOGNFQdg/HJDcPup4ac5SQ3jPLIPydRCEeNJA9JL2H0U/AO6WsBptXCItd0SKfc80BOwiJ9A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RE6YIWja; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RE6YIWja"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9BD1F000E9;
	Mon, 27 Jul 2026 13:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158131;
	bh=h653pPrDJZSvlDrmYzvG4/1Lg29aI1ike3cJms3NL3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RE6YIWjaE8vG7f5z4oUdhOprnOPp89odTHXPR7gphvNSykVuCLJTFEU+eO2lxByVQ
	 rgQ7w+ZriJcmlPHatm6h4gNtLRm8UFLFpumkztueG1WG7Y4yQ08KNcidM63THVNAeZ
	 mMBUXnpBaNH0YdSjHSg0BnJ0HSJ3lLNLAc5UHHnEAOgZBUm7OaFpMPVooqRlHlVlek
	 XEyB0xmtJq9EdtlST4Lg94HGcIhnoZPjcIwknYoeDku3k7bZ2SQP7RHYTY5tL6v4jf
	 2CVyAqcsbggU/IhrjcDUTBk2CU14ibxH1NTyc/Z7YDVrnhLCFAXqnEdeWWcrN7SF4d
	 6npIa17r3EEqg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Subject: [PATCHv2 12/19] media: raspberrypi: pisp_be: use vb2_video_unregister_device
Date: Mon, 27 Jul 2026 15:12:59 +0200
Message-ID: <133ab8a07ed325dd7d7240100a4d895a2e2b17b1.1785157986.git.hverkuil+cisco@kernel.org>
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

