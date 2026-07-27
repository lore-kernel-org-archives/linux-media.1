Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3598540EBA3
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158118; cv=none; b=LBoQl2vHiA2UxVEgruiiW6rWQ9QYHhpwxLbIBV1xAxz/XUy9vJXsIq+6YvvfJ42sv7aRoXvV9FX8rBkPFVDWX6+0EOiZOG2KEMEpmZtxLtKdxdWP8DRJtFNpnMjE1P40eij8wJDTKG95iUAf9cXVXeoscxmFMGKrQxD93xhyCUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158118; c=relaxed/simple;
	bh=QAWCkRSCRs8LG8+SmtnkbG/fA9+lB/faVjAbLrz8QvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hWzlQGKszbEt++Nv92pwUNShiOj2o7vOB9LqIGy3YkLBmxcHOZkIQKGJET5wObILXwkZcda+B5Ywx2xvjINreLtAXXbZxFRrtcuARoyVwHr+l9KdLUodnee3YhC8iG2gGuMlvThA5TYAfVFfdUtx9kddaFV5iAqtMLijF7SoWY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n02ApHm/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n02ApHm/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4A81F00A3A;
	Mon, 27 Jul 2026 13:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158117;
	bh=QQ39O9ahU7cK4RcwWbgEjPp7YStJzRsq+Ho42PsF6Wc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n02ApHm/2HpxyPwL66blKNOws5vxoPlMEhd96wWV+drUKmkGzvMqfcIot5/np+VVd
	 p+Ny320nxOLT6rjugpXPVBTdoEAvcE9wrQ8kZKRW4oggldX+n6X+SZrix+Ff/Z8eEx
	 Pa7/KXyk0+MwixqPXVIX3Zif94r0lJFVEcUrS8C70ulLhz6eR1cBAgGym0+Mwd/GPV
	 nJ3ccPCmM5fypop2TdNWUcdNHU/zpRB8fZBfGd/vhaHml0C2zZ4moO4rA9QQtBGZ92
	 A+anj0zunp4PRBRFq/OG3oWAabwpJPB7VFx/pFKphyGFfePTj5IL4kXR2Y+Nc5qPt/
	 irD+tvx41ynkw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCHv2 03/19] media: pci: ipu6: drop calls to vb2_video_unregister_device and vb2_queue_release
Date: Mon, 27 Jul 2026 15:12:50 +0200
Message-ID: <29a6348e81b08ba04f403136b6d101e6474eecac.1785157986.git.hverkuil+cisco@kernel.org>
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

Both the calls to vb2_video_unregister_device and vb2_queue_release
are not needed: drop these. The video device was never registered,
so there is also no need for any cleanup.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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

