Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1967D414A27
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158140; cv=none; b=iq5QAFzTMeAtI9/WUxeW+xw9m9wYSr6JBpZBEbs/gxjrROf5qAgOSEYjZc2Oj51JbzJKoxinytra68x4zyqIS6xXn9QtLxHHtV1W64dhhXG4qbuBp0ozI1px+UzYRyM+3nv7X2XehpqSMUu7HdaPf0SwLi8T6qj8FSB0tFmjdGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158140; c=relaxed/simple;
	bh=Bb4ttMeGjv0vvzPgQNZYLk2UTimJmQ5SgiK6znKyDNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cD5tZswGfqXigWRzgVaVevT8tBiCTbX04MJMoXWZQZ4QjDMTTI+tRC+54BJGXv9FYmqk/uo7/5uHBFIULnEAg+19FbN1/+5M4IDJanjCfAxDDDNhT5sZY4oJ1K7KLBJQ26Xg37ftJWYiDW4MNTJux2Aj/R4xeKHP5UOiSH/FYA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lYqjVda9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lYqjVda9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993091F00A3A;
	Mon, 27 Jul 2026 13:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158139;
	bh=+kzSVRiwXPfmP3ZvbI0xfSFIo0oec45X8F8jO7wnxGo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lYqjVda9H+Buip7HIcROFMi6J3Y5On01anHi43Pi+wVa+pruGTjJ7CcMYmn2vvsdL
	 Tyi3/6jFP72nuGcGRwTKfqXYy5LE2bkEP5dDB/6edeeIGfiVKgEjPMn5vijhB2gcbO
	 /oHN/J5oZrbXRK/35ipCfiM9GWYzOtJfta3cUYQxkRkv2PSE7kUETq4KrJUjXaPFuu
	 MpetiyPsRcUiiBkEgyK5O3nZihtqTTgoHNpL64ulKa5h48N7BYL7+fj5kbVdeU80vZ
	 J6VXHYDtXcgcZqFlOjDk44Y8pcaif42IwBNk1VARBI6huVIOPOc7xDeDJod8x8UQhG
	 By+ejNWBF4aZg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCHv2 17/19] staging: media: imx: drop vb2_queue_release call
Date: Mon, 27 Jul 2026 15:13:04 +0200
Message-ID: <21af94d0f48c540359e7909d74e687c7bb998b2b.1785157986.git.hverkuil+cisco@kernel.org>
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

Replace vb2_queue_release/v4l2_fh_release by _vb2_fop_release.

Replace video_unregister_device by vb2_video_unregister_device to
ensure vb2_queue_release is called from vb2_video_unregister_device.

Call media_entity_cleanup after unregistering the device instead of
before to ensure that the queue release code can still access the
media entity if needed.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Steve Longerbeam <slongerbeam@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index bfd71d25facc..85ec8f11fc62 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -804,18 +804,13 @@ static int capture_release(struct file *file)
 {
 	struct capture_priv *priv = video_drvdata(file);
 	struct video_device *vfd = priv->vdev.vfd;
-	struct vb2_queue *vq = &priv->q;
 
 	mutex_lock(&priv->mutex);
 
-	if (file->private_data == vq->owner) {
-		vb2_queue_release(vq);
-		vq->owner = NULL;
-	}
+	_vb2_fop_release(file, NULL);
 
 	v4l2_pipeline_pm_put(&vfd->entity);
 
-	v4l2_fh_release(file);
 	mutex_unlock(&priv->mutex);
 	return 0;
 }
@@ -938,7 +933,7 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev,
 				    &vfd->entity, 0, link_flags);
 	if (ret) {
 		dev_err(priv->dev, "failed to create link to device node\n");
-		video_unregister_device(vfd);
+		vb2_video_unregister_device(vfd);
 		return ret;
 	}
 
@@ -954,8 +949,8 @@ void imx_media_capture_device_unregister(struct imx_media_video_dev *vdev)
 	struct capture_priv *priv = to_capture_priv(vdev);
 	struct video_device *vfd = priv->vdev.vfd;
 
+	vb2_video_unregister_device(vfd);
 	media_entity_cleanup(&vfd->entity);
-	video_unregister_device(vfd);
 }
 EXPORT_SYMBOL_GPL(imx_media_capture_device_unregister);
 
-- 
2.53.0

