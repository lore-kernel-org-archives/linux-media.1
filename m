Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F033DDAF3
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276724; cv=none; b=Y18hxjBneHjIC1Yc3kcIu7Z8TmSH/d1ZpzP+GV0H4lxUotq7usYFLWNbgS2bVOvPlIIvWkWTjHNEPSxVA2oscw6Y3qmY8Exl0hw0F/o5mHZ7I1TwcnR4MCpFPtFxPQctWjSalLUQDNs4nogh5QGxw1nNF7y8D2s6MRwYuyo0D8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276724; c=relaxed/simple;
	bh=Hu0gm6fs0IL/57YTu1cFt68WJBM3yDEvBFxN9fYPvi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LknHWwbb06JywNGT8qUjEsHWw1sYrm5wXS2xtfNW3EBq1pdhe6IzNmxExNCLAFanFA0KelSEQQhbjnICnd2jFtm3M46dsN9rtFlaqYpXYAxQHTn3Rux/dMz5wrdymKXc+v2h/UNdbrFs1EAXjcPQC3zOVpJn1N6L+rQrY7bK+Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBVIAqwk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBVIAqwk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C127A1F00A3A;
	Fri, 17 Jul 2026 08:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276723;
	bh=2zkULi+/aMLOEqNpNR7PiaSmmyAClbC/hyWp9FPqXPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WBVIAqwkZHn7vXURtrVQ2eq9fQ/K0RB3jXGHXYLGWCrvSR4vlE4j0+5ob56Ki3t7D
	 1zZ3evRKoSWUn0x4ZDgxhj1sG61rqTgWe51MMJH4QoNtaBAWwuIc/ZoEq1Z9yFA5Gf
	 EMi3n/dXSS8LbIAHcc990rjqDb1rJa8FYalyv+w61g8IZVWoMUTm4lQUovJBdGnJt8
	 V5zWbM79VVGdaRsOhg8hKMojeyO10tmNsxc9dbL07534G0rRb4fdYIGtKK3MA7Z74y
	 FXQ0PoCDwqcbLQt2Pruwx/xmUvLkZnmhoruYVXIyIstl4ewFK6YRNzZbp4RMTHiFGx
	 n94P+muoGIB9w==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 11/19] media: nxp: imx7-media-csi: use _vb2_fop_release/vb2_video_unregister_device
Date: Fri, 17 Jul 2026 10:19:34 +0200
Message-ID: <b782f0db9e0521f97f001d71e3acdc0bc610b066.1784276382.git.hverkuil+cisco@kernel.org>
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

Use _vb2_fop_release instead of manually calling vb2_queue_release
and v4l2_fh_release.

Use vb2_video_unregister_device instead of video_unregister_device
to ensure vb2_queue_release is called inside vb2_video_unregister_device
if needed.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 7ddc7ba06e3d..eb2b54944ed1 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1545,14 +1545,10 @@ static int imx7_csi_video_release(struct file *file)
 
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
@@ -1627,7 +1623,7 @@ static int imx7_csi_video_register(struct imx7_csi *csi)
 				    MEDIA_LNK_FL_ENABLED);
 	if (ret) {
 		dev_err(csi->dev, "failed to create link to device node\n");
-		video_unregister_device(vdev);
+		vb2_video_unregister_device(vdev);
 		return ret;
 	}
 
@@ -1637,7 +1633,7 @@ static int imx7_csi_video_register(struct imx7_csi *csi)
 static void imx7_csi_video_unregister(struct imx7_csi *csi)
 {
 	media_entity_cleanup(&csi->vdev->entity);
-	video_unregister_device(csi->vdev);
+	vb2_video_unregister_device(csi->vdev);
 }
 
 static int imx7_csi_video_init(struct imx7_csi *csi)
-- 
2.53.0

