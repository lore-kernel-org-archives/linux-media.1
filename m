Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D33840F745
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158135; cv=none; b=NZ+SyQW3L3CHninKbZMUCr6Lm9mqnPIwV2nwho80jkin54KK0ozZRvsovxqYTRVWcQzvZ0dAKGrnoOzLLaN4cFhknOOiOlBFZrOQm5tje3FOOM31JsVfJeqCkvshmcB06DqN7MLianiPDORz/vGSeRtxQSOVQ/Py6uomiySDLcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158135; c=relaxed/simple;
	bh=NcPT/q+2K2OYjMtrEhRieu7HgpNYvkWCP13JS/e6kS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PbswnCLn1HGfMlkVPRfJFQHLI/2AGCehtb0FU1N6o0KGoKjR4/57ppcwWTnRvoCHrwMYuKEDak7czAnNRl0LPfFf60nrl+Mq/f+hn9706FKcyFVO59kttG2jCFysfeesu9UbAZ8s4317VGlx10tA30883aHUHLwzXvWQGHPYGO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wi6yIUE+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wi6yIUE+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F3F71F000E9;
	Mon, 27 Jul 2026 13:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158134;
	bh=VPljQBn56b1KRrJjJt99bOmBVv5qLAnkIF603BQrXV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Wi6yIUE+5lGcm7Gd7sK9DYrUpnpUVBg9PxijlNXVNlcK4sruuaXrTwdbfC6Pn/IOA
	 i2qCuc1ogF3sZcckmAUXmweZ8BVStjWLBzJhGbNtzXhavfQ4lQDMlpaP5pJz2ZmBzw
	 8b2BEKQUOwBXMGUdaZbyTaIeztitb+3uxzhBPBDIbB1wGzOctyFF/rJG57ghYGMKR5
	 MkhfqAhCdIdV/1q/zjuDfixqr+sGjS3Wa2xxwTRLb5Hy/2Q6T/Dn0S7sSh/+EAIPcP
	 ZVhqj50SWvZm0H+E+Wd7t39FRuGCIWNWFbN71pOGT2TpwrhMXscpJywvHLy5l8YowY
	 cKQZxLbKOARfw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCHv2 14/19] media: renesas: rzv2h-ivc: drop unnecessary vb2_queue_release calls
Date: Mon, 27 Jul 2026 15:13:01 +0200
Message-ID: <4834c85530aba71b854fc1975785219919140f47.1785157986.git.hverkuil+cisco@kernel.org>
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

No need to call vb2_queue_release if the video device is
never registered.

No need to call vb2_queue_release if vb2_video_unregister_device
is used (it calls vb2_queue_release internally).

Replace a video_unregister_device/vb2_queue_release pair by
vb2_video_unregister_device.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c    | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
index 932fed38cf3f..b39c26a48329 100644
--- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
@@ -511,7 +511,7 @@ int rzv2h_ivc_init_vdev(struct rzv2h_ivc *ivc, struct v4l2_device *v4l2_dev)
 	ivc->vdev.pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&ivc->vdev.dev.entity, 1, &ivc->vdev.pad);
 	if (ret)
-		goto err_release_vb2q;
+		return ret;
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
@@ -531,11 +531,9 @@ int rzv2h_ivc_init_vdev(struct rzv2h_ivc *ivc, struct v4l2_device *v4l2_dev)
 	return 0;
 
 err_unregister_vdev:
-	video_unregister_device(vdev);
+	vb2_video_unregister_device(vdev);
 err_cleanup_vdev_entity:
 	media_entity_cleanup(&vdev->entity);
-err_release_vb2q:
-	vb2_queue_release(vb2q);
 
 	return ret;
 }
@@ -543,9 +541,7 @@ int rzv2h_ivc_init_vdev(struct rzv2h_ivc *ivc, struct v4l2_device *v4l2_dev)
 void rzv2h_deinit_video_dev_and_queue(struct rzv2h_ivc *ivc)
 {
 	struct video_device *vdev = &ivc->vdev.dev;
-	struct vb2_queue *vb2q = &ivc->vdev.vb2q;
 
 	vb2_video_unregister_device(vdev);
 	media_entity_cleanup(&vdev->entity);
-	vb2_queue_release(vb2q);
 }
-- 
2.53.0

