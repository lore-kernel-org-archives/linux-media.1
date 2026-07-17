Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514AF3DC856
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276714; cv=none; b=SwiSw/AsDcUMWZ96+0SyCtwFSzmDez7m91abC3KV0hB9XJ2H3FARL/93Hi9kzAXblPCDjZqkCph5VYSMVDomt8op8TDjmUvokwrhz1vQ0mGUdeKJdSmTExaub172/QfJDL6GYL6CTFdWYL7woJeqh8IRThqSh2et8LcakEACuYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276714; c=relaxed/simple;
	bh=GPfGil4D89WP9UbgDlwrjU1faXlulv/w93KRr1JzDZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/ehZiW+QaTp13av6XlYLjAq0JCM4ys/ZCBopffwvQMKfmuwHf3eOw1Gurh0OZnAHIUpAGS662A+BH0Js12I4THb7oafl5dlijQqpHjbVp9aJhEWsuxTy41+gQbPObw+4SICqu/iseKxE6+S0aMId+67J2up5YDYIP+LK00cx7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lP0A6kju; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lP0A6kju"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 779421F000E9;
	Fri, 17 Jul 2026 08:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276713;
	bh=l2VPp2gWcRNG4EcP2kHZc/Ixw81rFzuW5XROQ6JpdzM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lP0A6kjuTSVZfFqTes4bKnDDDFk2WvE3RcFrbEbT8y0DFQjyz6RTeCOYqOPKzQZjs
	 +dHS4M4nyI8SYe8LsJwTvOfhMrkcKN/SL/1GWOvH23QJiArIAeGvcY3H8aOoq9KB2K
	 eVQfwt5G0Dwi/yEPrYN91HAVwcrcsW6v0510kY9qSoKhaZO7lPjESLxVHFMJNE0CE5
	 yt8pJ7kM/aVsR6x9FY5Jm+hmALAAnDZng2FghabxAFqWNztiRs/8S+FvRf8IIYPZ59
	 6/Ci7ojfktkqG84obE9/LVgeGRfIQtvHHmw4ExZ9q5hf4cqJkayIh59+Ubac+7/JWF
	 SUFl5Za2MEu4Q==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 05/19] media: platform: amd: isp4: drop vb2_queue_release calls
Date: Fri, 17 Jul 2026 10:19:28 +0200
Message-ID: <78b9e1f607f16526b9f69ec32a4b89b65e77b163.1784276382.git.hverkuil+cisco@kernel.org>
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

These calls are not needed since the video device was never
registered.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Bin Du <bin.du@amd.com>
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

