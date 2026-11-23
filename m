Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795477452;
	b=MEQqiZebcV7ho4luQ1vHZJTztHtz4LR1U+M7B4Kpw3hqy1uGDk7hG0xAv5bMPSlryx7U
	 3tlfq2qs1gh96TO10yT5pENzWfyY7s4XHKqWZPvGPrJz69LclIaXd1dMzwvyw2qKNCreP
	 +WZx5/VuLHI1/MZpENuHzoHcC8Jo0whlh9pm+vLZc94Bo72LYehJsjLii1G8rLHmVx64v
	 jUijInD1jARiwpDWcxCNzMVqeEzWKtt1DiaenixPo7YTL6zzkONXzmc4HDTGMSJoCCg1/
	 S19O+W9xagqJHjsufqIXJabAa1b++r9hKnO40EnvfvwxBopzp0xhnKZ+nFZl83Pul+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477452;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8jRK+xnytOqo+51GFqmHuUc7sKX3EkzMFjlI4WLJLG0=;
	b=4SAgbe+4H9g+FqjdLAq3nO81U70SCsDlMBG4teXmVbccJH534VZlTuo+UKU+chE07sRL
	 SJQo8c8rbjqsgPZOpGyoY7+qfPFEX6yAqAGCSA5j9xwlBVYEUbvfVhFtd+VMt8fVCxWhv
	 hQenXB/30bLWJVZp1d8y6s1yGSAQDfdQfscnChGA/XUu395svF8WK+bOLwmIj0pgES8x7
	 GvSNmg4ct7nKkubwhS0Rx2FAJyU+gsTdCaQg5/p0JYLcZNbw78QUJVlOkGX6sqDHU/QCR
	 L8cRQ4pRod3gfZvpWA6uoxkOAW8bf3dnge+iQ3yj1DOQ43xrMapaSyIxzSMB1jxkkjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kNBj/heC";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09689606A327;
	Mon, 23 Nov 2026 23:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kNBj/heC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795477451;
	b=0HdoVN4RcN53h1tVPA0htRAt/dQKKMDbEul9zdCUu9ckh0oRKNIFhhTK+STt7Nx96OkJ
	 Z9vOJ40h3MOgckTpnmuQY2uP35fBj+ZmKdyei9f0VtbBWGT70iHE7n4s9UEn72XWuEE0d
	 Rb0+l2LP5h1E8S8C4cwYsXfvvZwEpGWbQBRhtQdDG4ll0kiW3z3kr21ktR5T1eY+Zn8qT
	 UqW66BUcjUlEhXGH5Dw8seWeIoS7OO23Xt6IP7hQWdtQya2SWrPkYQKfiiHV0XY0W29WB
	 mL0idPX8AbMjxtSNj1rm73/h0q6lRS8Zsxs76i+tXB5lJXiaU3j2u68HvCcy+FIMzMA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795477451;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8jRK+xnytOqo+51GFqmHuUc7sKX3EkzMFjlI4WLJLG0=;
	b=NLOzk025+UoiDhRC0fllwHiv6RwiPLfckLnus4DmNHRm/ng+8YktLLybiwMuXHGsxDgd
	 TOlgohdBwA5EM7Xj3NnF46a6J5/zHvPRDi+IL909vCo8YiG43HaDMjWPhpvqKbsMsDqr6
	 qVngTwzpHSmjXKmE4OK1+H1uqfGGmdWSGOlNu1RT7b65j4d9/Iw+mspmjr5h47+sceXEA
	 +TOY/RFsjAj2fed2pfP1MP7niMA1D66t4CMIeqrLx9/8qVZc/NBML/nA9z9pfA3RUdVL/
	 bRLvTYMiiqIOB2PKg2gyYDLC6ygNV7o/L6nB+gzrYpu7v+jLcFwdaP+Q7aa41re4kiA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 822601F000CF;
	Mon, 23 Nov 2026 23:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795477451;
	bh=8jRK+xnytOqo+51GFqmHuUc7sKX3EkzMFjlI4WLJLG0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=kNBj/heCrniMRmuXk7fkmYF41aaiwaqw2HtyewWV2PGCnTEtbBpucdVikEPjXv/yp
	 vN/u8fBoBfdr/iPxLkzpTh3PxmslNM4vSqNE5koZiRvuECzvmA9aSK72agTXng3y9Y
	 4b6wU11E53pFIi18UsSHal73pNX1LBj/QKwCJsoCPbpawXhE9MNAT06pyECx7ZdTgC
	 tmKUAoYkjB3dnYR4/yqn9lV5zqGBmjYMnng8eryPOWf2naig84ujjCF9h1ssJgyQSS
	 jGD07QAuB+C+Z1ANnDWZGMhoeID3RWbwsQph3tm4U/6MMVx7AWRrpI9+Ayd3SJk4YO
	 KwPOQPAgzKHkQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 00F564C7E6;
	Mon, 23 Nov 2026 23:43:56 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 00:43:57 +0100
Subject: [PATCH v2 5/5] media: qcom: camss: video: factor pipeline stream
 start/stop into helper
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-camss-fixes-v2-5-231a5523cd59@gmail.com>
References: <20261124-camss-fixes-v2-0-231a5523cd59@gmail.com>
In-Reply-To: <20261124-camss-fixes-v2-0-231a5523cd59@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795477434; l=6145;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=cw2sebxPTgI0BsRX0snuOY9H/0VCCimk2e0LvMdO0cQ=;
 b=+0vCu/P7GyPM1uHh0QIJfEc12tA0odd9DKfOstDWl4/FVFA+rCQC51JqPB2vO8eSWWImxS9OD
 vrgirMv01MdBD0ETmZxNkti4cblZ4CWywK0jhsADYIpY6nsD5yNe69a
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

If a subdevice fails to start partway through video_start_streaming(),
previously started subdevices earlier in the pipeline (such as the VFE
and CSID) are never stopped, leaking VFE stream counts and write master
reservations. Conversely, video_stop_streaming() returns early on the
first subdevice stop error, leaving remaining upstream subdevices
running and skipping media pipeline teardown and buffer flushing.

Factor pipeline stream state changes into a shared helper,
camss_subdev_pipeline_set_stream(), using v4l2_subdev_enable_streams()
and v4l2_subdev_disable_streams(). Unwind partial start failures by
disabling the pipeline (-EALREADY skips subdevices that were never
enabled), and continue stopping remaining subdevices if an error occurs
during teardown.

Iterate over each entity's sink pads with media_pad_remote_pad_first()
rather than media_entity_remote_source_pad_unique() so entities with
multiple active sink links (such as a VFE fed by both a CSID subdevice
and a parameters video device) do not fail uniqueness checks.

Fixes: 0ac2586c410f ("media: camss: Add files which handle the video device nodes")
Suggested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20261031041154.308030-3-xiaqinghuan@mail.ustc.edu.cn
Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-video.c | 116 +++++++++++++++---------
 1 file changed, 72 insertions(+), 44 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6..c19b0d1 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -7,12 +7,14 @@
  * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
  * Copyright (C) 2015-2018 Linaro Ltd.
  */
+#include <linux/bits.h>
 #include <linux/slab.h>
 #include <media/media-entity.h>
 #include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
 #include <media/videobuf2-dma-sg.h>
 
 #include "camss-video.h"
@@ -249,13 +251,73 @@ static int video_prepare_streaming(struct vb2_queue *q)
 	return ret;
 }
 
+/*
+ * camss_subdev_pipeline_set_stream - Enable or disable subdevices in pipeline
+ * @video: CAMSS video device
+ * @entity: Media entity whose upstream subdevices are toggled
+ * @enable: true to enable streams, false to disable streams
+ *
+ * Walk upstream across all sink pads of @entity so entities with multiple
+ * active sink links (such as a VFE fed by both a CSID subdevice and a
+ * parameters video output node) do not fail uniqueness checks.
+ *
+ * Return: 0 on success, or the error code of the first subdevice that failed.
+ */
+static int camss_subdev_pipeline_set_stream(struct camss_video *video,
+					    struct media_entity *entity,
+					    bool enable)
+{
+	struct media_pad *sink_pad;
+	int ret = 0;
+
+	media_entity_for_each_pad(entity, sink_pad) {
+		struct v4l2_subdev *subdev;
+		struct media_pad *pad;
+		int err;
+
+		if (!(sink_pad->flags & MEDIA_PAD_FL_SINK))
+			continue;
+
+		pad = media_pad_remote_pad_first(sink_pad);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			continue;
+
+		subdev = media_entity_to_v4l2_subdev(pad->entity);
+		if (enable)
+			err = v4l2_subdev_enable_streams(subdev, pad->index,
+							 BIT_ULL(0));
+		else
+			err = v4l2_subdev_disable_streams(subdev, pad->index,
+							  BIT_ULL(0));
+
+		if (err && err != -EALREADY && err != -ENOIOCTLCMD) {
+			if (enable)
+				return err;
+
+			dev_err(video->camss->dev,
+				"Failed to stop %s pad %u: %d\n",
+				pad->entity->name, pad->index, err);
+			if (!ret)
+				ret = err;
+		}
+
+		err = camss_subdev_pipeline_set_stream(video, pad->entity,
+						       enable);
+		if (err) {
+			if (enable)
+				return err;
+			if (!ret)
+				ret = err;
+		}
+	}
+
+	return ret;
+}
+
 static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct camss_video *video = vb2_get_drv_priv(q);
 	struct video_device *vdev = &video->vdev;
-	struct media_entity *entity;
-	struct media_pad *pad;
-	struct v4l2_subdev *subdev;
 	int ret;
 
 	ret = video_device_pipeline_alloc_start(vdev);
@@ -268,26 +330,15 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ret < 0)
 		goto error;
 
-	entity = &vdev->entity;
-	while (1) {
-		pad = &entity->pads[0];
-		if (!(pad->flags & MEDIA_PAD_FL_SINK))
-			break;
-
-		pad = media_pad_remote_pad_first(pad);
-		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
-			break;
-
-		entity = pad->entity;
-		subdev = media_entity_to_v4l2_subdev(entity);
-
-		ret = v4l2_subdev_call(subdev, video, s_stream, 1);
-		if (ret < 0 && ret != -ENOIOCTLCMD)
-			goto error;
-	}
+	ret = camss_subdev_pipeline_set_stream(video, &vdev->entity, true);
+	if (ret < 0)
+		goto error_stop_subdevs;
 
 	return 0;
 
+error_stop_subdevs:
+	camss_subdev_pipeline_set_stream(video, &vdev->entity, false);
+
 error:
 	video_device_pipeline_stop(vdev);
 
@@ -301,31 +352,8 @@ static void video_stop_streaming(struct vb2_queue *q)
 {
 	struct camss_video *video = vb2_get_drv_priv(q);
 	struct video_device *vdev = &video->vdev;
-	struct media_entity *entity;
-	struct media_pad *pad;
-	struct v4l2_subdev *subdev;
-	int ret;
-
-	entity = &vdev->entity;
-	while (1) {
-		pad = &entity->pads[0];
-		if (!(pad->flags & MEDIA_PAD_FL_SINK))
-			break;
-
-		pad = media_pad_remote_pad_first(pad);
-		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
-			break;
-
-		entity = pad->entity;
-		subdev = media_entity_to_v4l2_subdev(entity);
-
-		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
 
-		if (ret) {
-			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
-			return;
-		}
-	}
+	camss_subdev_pipeline_set_stream(video, &vdev->entity, false);
 
 	video_device_pipeline_stop(vdev);
 

-- 
2.56.0


