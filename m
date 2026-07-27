Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9C9412264
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158131; cv=none; b=sXW7UhL0inszq2BSmzBQQHcfPKTjjvqMssVCB9ces5vGAytDoYvtQIc+eXyYZfQ9bos5RS/Ciag987LMDFZyfkGhuXieiLWMX9xqgbaoAojXNU0t19w6Onjfmyh05QMU4GwscR46b/k13hWdQVqdmA+fTNE2yyOb6kscrAZI4DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158131; c=relaxed/simple;
	bh=tx4T+F5WVSjirNSuddMSPe72dK4KIWWmAxVNMYvhBVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f/lMxxmLFUXFr12sYYQJGCmRHE069wED8mlDgmyr2PsLtp6ujzoQcsJkPdikrLdFBXrh4QKeSrkDIA93K3au+0/eWqAyWrtFcbrg31+FYBUZJXtD6mEsS0pa+VypmrXsttNEHQOLgAwZOwtEQcGnI2nH/eoLb+9ne7cO46L/tFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OY0t9DXR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OY0t9DXR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B631F00A3A;
	Mon, 27 Jul 2026 13:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158129;
	bh=qchMYHsR2kuiYlT9E8Dd4VqewMQOldJifKbW2znWJvg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OY0t9DXRURV7wonjbj42vAEM68PaDSlvTOSp/rcqvAaLMoO9gWgyB8opLq/cjFErw
	 WCfylLV38vkXBP+Q5Iz5SJVdds1dh5zQgw3Q3kvQid+bVu6wP3sLO8DA5kPqiIJGY6
	 TCtkX+Xgohv7ReGBdFf7OaIqTBGn95ZnxiishYO+Z4sbrWRIGAuzMfckl/PzyAGnHM
	 cUFZ8iTltvJXVrhIMOOnLl6s5E8XbLo+T9bovgzu4eGaJBoylSiUIDQ73L0LPzUppP
	 07h7k1+rYNkCVS7CgbAxc7Jbw9oZazBxDx3gicTSmVcmyB2pLA/r3o9taKNwVqN3Oh
	 V8yvxECqEi1XQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCHv2 11/19] media: nxp: imx7-media-csi: use _vb2_fop_release/vb2_video_unregister_device
Date: Mon, 27 Jul 2026 15:12:58 +0200
Message-ID: <e6523ce61991b99869301ab78c2f055343e28014.1785157986.git.hverkuil+cisco@kernel.org>
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

Use _vb2_fop_release instead of manually calling vb2_queue_release
and v4l2_fh_release.

Note that with this change the v4l2_fh is released before
v4l2_pipeline_pm_put is called, but v4l2_pipeline_pm_put does not
use the v4l2_fh information.

Use vb2_video_unregister_device instead of video_unregister_device
to ensure vb2_queue_release is called inside vb2_video_unregister_device
when streaming. That way streaming is guaranteed to be stopped when
the device is unregistered.

Call media_entity_cleanup after unregistering the device instead of
before to ensure that the queue release code can still access the
media entity if needed.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 7ddc7ba06e3d..cb7a198a2ccf 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1541,18 +1541,13 @@ static int imx7_csi_video_open(struct file *file)
 static int imx7_csi_video_release(struct file *file)
 {
 	struct imx7_csi *csi = video_drvdata(file);
-	struct vb2_queue *vq = &csi->q;
 
 	mutex_lock(&csi->vdev_mutex);
 
-	if (file->private_data == vq->owner) {
-		vb2_queue_release(vq);
-		vq->owner = NULL;
-	}
+	_vb2_fop_release(file, NULL);
 
 	v4l2_pipeline_pm_put(&csi->vdev->entity);
 
-	v4l2_fh_release(file);
 	mutex_unlock(&csi->vdev_mutex);
 	return 0;
 }
@@ -1627,7 +1622,7 @@ static int imx7_csi_video_register(struct imx7_csi *csi)
 				    MEDIA_LNK_FL_ENABLED);
 	if (ret) {
 		dev_err(csi->dev, "failed to create link to device node\n");
-		video_unregister_device(vdev);
+		vb2_video_unregister_device(vdev);
 		return ret;
 	}
 
@@ -1636,8 +1631,8 @@ static int imx7_csi_video_register(struct imx7_csi *csi)
 
 static void imx7_csi_video_unregister(struct imx7_csi *csi)
 {
+	vb2_video_unregister_device(csi->vdev);
 	media_entity_cleanup(&csi->vdev->entity);
-	video_unregister_device(csi->vdev);
 }
 
 static int imx7_csi_video_init(struct imx7_csi *csi)
-- 
2.53.0

