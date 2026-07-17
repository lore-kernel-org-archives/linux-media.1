Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBAD3DFC8A
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276734; cv=none; b=kWcJQWFUA1RKEhcmU2+gjuCkUeyzXaNntNvBTo8sPMECCUahCbzSI55UR8aLVs2g1Eg5BM9haL9ew1IVL10paEk44KkRPYuTtthRBKKD/pEwsBiK6lNZtKhcpK5wjgNu1dfcE4Hj58ow+oenWYf615/DVL2DLROoNz7StDUsinw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276734; c=relaxed/simple;
	bh=Ju3D8rUT4ZOMKVKEWIOdbSTGHHG5uFEFXCrfnWryTK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qFLRp8Oicg83vYcwYAg4hpRKezM0j3rAxBntOpQAMPIG0pPmAwoUelFOt8ZMpifRs9MtlerGWts2IlZh5Jie2IxVBhdDEsq8dbTGeGPVN5Bo9tG2+esOsqT1u7DqbVXZmD0qkmyXs15vX1fMEQtEO0bz6qosE+z1/9OHH3RS0zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GzN2/Zxu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GzN2/Zxu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2861F00A3A;
	Fri, 17 Jul 2026 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276733;
	bh=DIkQE7Zd3yJHsiZH/soVWT4kHvmyV+xNIhnXhyeRvZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GzN2/ZxuJVKVChZNc1CDx2Kx9272wJjAQ5+TNcZx+t8kCRmrWVnnhr/TpNT+49+AD
	 WtM//6zKkZPTxyKJ04zs8d/PesJRp6GmA/K65sqKCrtfp2N7kdgLZv5VPKJEXPogOf
	 cIa1f2ZUvkqorSens9u9EXCrSAjfrw1Zm6XkvmiBleyK0GcOQpRiX53CrFlaPm9JpB
	 NvHOgtz0FdqiF4Cyyje3y7q0b1IkLmbWIvmjTe4XnQ6Ll6Mk2XMSjxDNEJYj7hzC1J
	 nQlwEVuU2rZtBhR30cx/AI6M2V6bnByZb3VEsqt0JuiOFT5JpSf98vGx9jAVJhMj90
	 JtMTWoKo+qj8w==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 17/19] staging: media: imx: drop vb2_queue_release call
Date: Fri, 17 Jul 2026 10:19:40 +0200
Message-ID: <2adccbdebd9c899d63d9788f69693c2b609fcfa0.1784276382.git.hverkuil+cisco@kernel.org>
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

Replace vb2_queue_release/v4l2_fh_release by _vb2_fop_release.

Replace video_unregister_device by vb2_video_unregister_device to
ensure vb2_queue_release is called from vb2_video_unregister_device.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Steve Longerbeam <slongerbeam@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index bfd71d25facc..e95989a6f861 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -808,14 +808,10 @@ static int capture_release(struct file *file)
 
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
@@ -938,7 +934,7 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev,
 				    &vfd->entity, 0, link_flags);
 	if (ret) {
 		dev_err(priv->dev, "failed to create link to device node\n");
-		video_unregister_device(vfd);
+		vb2_video_unregister_device(vfd);
 		return ret;
 	}
 
@@ -955,7 +951,7 @@ void imx_media_capture_device_unregister(struct imx_media_video_dev *vdev)
 	struct video_device *vfd = priv->vdev.vfd;
 
 	media_entity_cleanup(&vfd->entity);
-	video_unregister_device(vfd);
+	vb2_video_unregister_device(vfd);
 }
 EXPORT_SYMBOL_GPL(imx_media_capture_device_unregister);
 
-- 
2.53.0

