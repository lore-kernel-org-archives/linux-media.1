Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A7940DB48
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158121; cv=none; b=YdjenAKe76kD4HiUa2y52rbqkc4U8CuXbxn57bNM3yeuFtpN3pcS7lgmrVOazvZqoGa2N03nTIg2vQyuSEv5CwhNnCDzr4ncUPknj7y9tyhtleJ8zzzj9PUUAzvAeg1a5sxNo4uE7w+gQBtt+eeyD4c97h+hkaSto5+AuZpqz/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158121; c=relaxed/simple;
	bh=H1vVzL1to916FISLjuoio+6Svj9YHF0uxUAv2tKwDGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YFbyLX/5WIDGcLNpKMQjRO3XxPpfHJu7bblLnvl2CgzjTAX0lmXhNyoz2aRoL04DUje4wGBP9+MLXp/drkHpaZEVUk6TZV7u9VilqAXf65dSRJP+jeMoaGUKpyUrh+l8f0TaKDkSyfDCCVHAMhdDLb6fiqvTkwvwBIzqKh5VSyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imnak9pL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imnak9pL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60941F00A3A;
	Mon, 27 Jul 2026 13:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158120;
	bh=sE6DcuUiINAf4P/JBXB0FoBqpEllXFZb4J0JEtaOBMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=imnak9pLeQG/MnlVm6g7G4m4nNxzALvDiSoHTbkYJ7NqMzMrnkV3xZB+14PgFV1/R
	 gXvVjUOu052v/ftirH3aYoSZcr+iMGXTDGSAO9zJ8X7bj3k/bHqCo2WbPvYPsN5mnS
	 4Q2GMtB/+1vRTuRMJ3rUpGkSz0yzcHwIYtJb53LT4I0oT8xoHwoOX2VnDIJPsjnJf5
	 siglEOzCUNlL/twh4MC7UemChAi6AtLk6oi7zQaBKu1C9dTby287TQbfR9o7LXVfCv
	 miNxxawPYxTpJSJLnbsVV2GwGv5mi41GjYNwG74CgT7e/zHjZr03I4ti3SErFRRJRu
	 aqAsL+wKPZVyg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCHv2 05/19] media: platform: amd: isp4: drop vb2_queue_release calls
Date: Mon, 27 Jul 2026 15:12:52 +0200
Message-ID: <0250235e682b141523eb6c7d0bc4f627ee0ab3a6.1785157986.git.hverkuil+cisco@kernel.org>
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

Drop the unnecessary vb2_queue_release() calls from failure
paths before the video device is registered.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Acked-by: Bin Du <bin.du@amd.com>
Cc: Nirujogi Pratap <pratap.nirujogi@amd.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/amd/isp4/isp4_video.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/amd/isp4/isp4_video.c b/drivers/media/platform/amd/isp4/isp4_video.c
index 0cebb39f98e1..0e702add6144 100644
--- a/drivers/media/platform/amd/isp4/isp4_video.c
+++ b/drivers/media/platform/amd/isp4/isp4_video.c
@@ -742,13 +742,13 @@ int isp4vid_dev_init(struct isp4vid_dev *isp_vdev, struct v4l2_subdev *isp_sd)
 	ret = isp4vid_fill_buffer_size(&isp_vdev->format);
 	if (ret) {
 		dev_err(v4l2_dev->dev, "fail to fill buffer size: %d\n", ret);
-		goto err_release_vb2_queue;
+		return ret;
 	}
 
 	ret = isp4vid_set_fmt_2_isp(isp_sd, &isp_vdev->format);
 	if (ret) {
 		dev_err(v4l2_dev->dev, "fail init format :%d\n", ret);
-		goto err_release_vb2_queue;
+		return ret;
 	}
 
 	/* Initialize the video_device struct */
@@ -760,7 +760,7 @@ int isp4vid_dev_init(struct isp4vid_dev *isp_vdev, struct v4l2_subdev *isp_sd)
 
 	if (ret) {
 		dev_err(v4l2_dev->dev, "init media entity pad fail:%d\n", ret);
-		goto err_release_vb2_queue;
+		return ret;
 	}
 
 	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE |
@@ -786,8 +786,6 @@ int isp4vid_dev_init(struct isp4vid_dev *isp_vdev, struct v4l2_subdev *isp_sd)
 
 err_entity_cleanup:
 	media_entity_cleanup(&isp_vdev->vdev.entity);
-err_release_vb2_queue:
-	vb2_queue_release(q);
 	return ret;
 }
 
-- 
2.53.0

