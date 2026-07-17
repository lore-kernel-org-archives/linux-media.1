Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28413D9DCD
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276711; cv=none; b=dV6uDFCIACNNN7+8tNoTgtMr6zsEUMDDLIJH4IOPHqp1CHDPCShZeKjlja21aZJoKBO+Oz38PLtc52Bb6+hNfogS9Mp1WoKiJav/4o7TQNiu24O8alIAQ8madFsePOMYiJTdcdyxgr8WutpuE5CH0QsLsojsR/XOMQXcULsSfaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276711; c=relaxed/simple;
	bh=2jyFj9PTlhXnWMDyBlE43OxWYzBIFaox+LR2BI4sjB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aK148K0Xl6me2QQ+YJUqdm4+4665ytYNXESMFkAhKfEeYpiQ5x15AsmIRpYMFtpD97tj+L7Q8nX0Ok+arVE5508z4NNBHWeQOl+rQH79bdocG2k+RYxczSANwFyoVM/A4XIeWxxPELVqLuKK5cL6wGhzki2V9Sbw//Bu4H2X2+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTJjoups; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTJjoups"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A4E1F000E9;
	Fri, 17 Jul 2026 08:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276709;
	bh=DppN76xjRNCWVqoHC+nI8jufMXrnAHFzS37EYc4RlAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nTJjoupsMlvBz/jsH94TDbZiS0hk2vUX4uU6Tm1gQxD3FXH5EufdLuu198/+ulfrG
	 8sLnyCTy/wCQ0hsvNLr0zJU98TI6k3nXPZh0AKouKlA0wCPKt3/HKqCVQkoGEo3Xjk
	 2dFpzBFHH7OY6uiBDci1rQQO6ntqxsqNB09Lx8XcGCvEOG3i8wH7Gc7VrnyMH2N5V1
	 Z2XHRErqfKDk36P5vgeprYxAUhG0saf28w1+0tn6+jbVmZhA8NBC6VqfS+QaMksnCg
	 H/u9qjpbq0vGNZRToiCuJBRrkYHmp9lArfhDMhI67yGPD1VYjZ7442Duat8Vk2goj4
	 btXdrCiF5St4w==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 03/19] media: pci: ipu6: drop calls to vb2_video_unregister_device and vb2_queue_release
Date: Fri, 17 Jul 2026 10:19:26 +0200
Message-ID: <86049ec7dfa6f3119e7eb61b708703170a92a25d.1784276382.git.hverkuil+cisco@kernel.org>
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

Both the calls to vb2_video_unregister_device and vb2_queue_release
are not needed: drop these. The video device was never registered,
so there is also no need for any cleanup.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 3ac48d2076da..b8dab3a29ab0 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -1267,7 +1267,7 @@ int ipu6_isys_video_init(struct ipu6_isys_video *av)
 	av->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 	ret = media_entity_pads_init(&av->vdev.entity, 1, &av->pad);
 	if (ret)
-		goto out_vb2_queue_release;
+		goto out_free_watermark;
 
 	av->vdev.entity.ops = &entity_ops;
 	av->vdev.release = video_device_release_empty;
@@ -1293,12 +1293,8 @@ int ipu6_isys_video_init(struct ipu6_isys_video *av)
 	return ret;
 
 out_media_entity_cleanup:
-	vb2_video_unregister_device(&av->vdev);
 	media_entity_cleanup(&av->vdev.entity);
 
-out_vb2_queue_release:
-	vb2_queue_release(&av->aq.vbq);
-
 out_free_watermark:
 	mutex_destroy(&av->mutex);
 
-- 
2.53.0

