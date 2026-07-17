Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D573E0096
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276736; cv=none; b=FnsuaoL0D11hNNDo2aueJ32MB5CuGdCYYkBpjw1MwuxFz7BTiNRi6wS5kBsb9d/84FUbz5PcCcr1qgVK/Qleed/fcE0U4Ti5r9GevRAwZ+IceDaBJwH3fG7KjNljoQTF+NQI71yOK3vR62aym0H2j0WJ6PFt52LQr9XyZ4sld00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276736; c=relaxed/simple;
	bh=W6a0yZzl7YD/juLyLVSB9btRwjs3FDZh/jkD9DMXCTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h9PiZCWXzbW9lCje6fOz8sPw7+BdhBoLTTn2Jw7mLfgVa/6IK3IxTeJfLYsILmLpYT67XqdypoKflIz7tkr4dnCwxJGYf/o6nr4MWGQaBc7mKT9hJi8+aUhPkpVMjaY60ejbFL8cu09FhRWTDHekJj4zUz3/qCRxYUXbMQrWqS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFRRQYpO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFRRQYpO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8571F000E9;
	Fri, 17 Jul 2026 08:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276734;
	bh=ODMwatRiU1waL9Fg2yjeBtRe/UsbLFlhby4k+zOiN+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nFRRQYpOC1UgeSPNdE0WgE9dHdRqfBKTktH5aBmkTme1c5VjroTbJYJSKRFW7IyQ3
	 lchvypSZL66XURmqjd8XLSf6tcm7sMZnna2C0l3z1HYBXhYPzo3SsKhorahL/beiIV
	 0Sxcd5toVzMF+n/IJOhPxbEb93mYd74q1Nt5m9m7x+AaoQE9CJY/2jsbNw0y7DV47I
	 BtJyM8/ldil1dFhteJ31wWMib1VbOooVOa0Sp/cCmoXIXI8IKQ7IvgWfEEsS+VDQBL
	 vCfDEXL2uptxNByg/tDkLOWplNXWtrNwp0doshRf1J/lqlvDWqdKIPmkgNzxs3HjwE
	 l8SGnkgoZPkHg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 18/19] staging: media: ipu7: drop unnecessary cleanup calls
Date: Fri, 17 Jul 2026 10:19:41 +0200
Message-ID: <f53405513d94e58f164ba42618b712689998f4dd.1784276382.git.hverkuil+cisco@kernel.org>
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

If the video device isn't registered, then there is no
need to call vb2_video_unregister_device or vb2_queue_release.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/ipu7/ipu7-isys-video.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.c b/drivers/staging/media/ipu7/ipu7-isys-video.c
index 8c6730833f24..5f3f091aabb5 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-video.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-video.c
@@ -1035,7 +1035,7 @@ int ipu7_isys_video_init(struct ipu7_isys_video *av)
 	av->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 	ret = media_entity_pads_init(&av->vdev.entity, 1, &av->pad);
 	if (ret)
-		goto out_vb2_queue_cleanup;
+		goto out_mutex_destroy;
 
 	av->vdev.entity.ops = &entity_ops;
 	av->vdev.release = video_device_release_empty;
@@ -1058,12 +1058,8 @@ int ipu7_isys_video_init(struct ipu7_isys_video *av)
 	return ret;
 
 out_media_entity_cleanup:
-	vb2_video_unregister_device(&av->vdev);
 	media_entity_cleanup(&av->vdev.entity);
 
-out_vb2_queue_cleanup:
-	vb2_queue_release(&av->aq.vbq);
-
 out_mutex_destroy:
 	mutex_destroy(&av->mutex);
 
-- 
2.53.0

