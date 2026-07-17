Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B977C3DE438
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276729; cv=none; b=u4LO25ei5DJznEACbuTYi9l+Q/5YDQ1HxxGdattDvBaCM88KQ9Ke9HvbbPPMoqP0DkqxOfxRnZ0LxpQ5j45BCnZiJHZp3iZUCHiOsr0prUTr+BFHiT4lckeoDJHf6cKHtEZn2V91EyYeBTNsvRFLdHI/QBWGNt8VWdMECvz+7g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276729; c=relaxed/simple;
	bh=O1Zm72TtpkfgCpTxTXnpkhYUUjFJI3znsPo+wCaOmZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AShxgiy1uRrqM3uv7WtJwV4sYMqRmNKvAhoLImLi1N5XuZYuO42ZcoRYsNFWkY1aj7wBNiu2VcqugS9+vYy++GnmP+MEn6i3Rx5aHaWQPR4WKwVYdXbdhaMoq0uohMe8ygYN0j0/u+uMsmGtuWM86j660Fe7NmgiCUwiH7NwLD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SRCA7gG3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRCA7gG3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 096B41F000E9;
	Fri, 17 Jul 2026 08:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276728;
	bh=Joc2XM8mB8HOb/exMmm6s/b1RMUNsZC8YQx5whwtWEs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SRCA7gG3oUHyThaZCjUMj/Qm0CpkQRezHvT3o6INrzwL+LRhG/nG23lhNHLjJFAck
	 SpM5tY1gqjyCnaM+7clPL4E9xLbhRDWj8C/Y0ZTl1XTvCMJjDnBOCeqV8t9PopuBfP
	 w0OXxMmnk9bdSxrwu8BbkfGWTzsvMAVFe1/Vc0ZpIHxgBs7WY1co3cFFbZ7o44VqKF
	 1UXKXKnUAGd41U7PY2qirZD6aPM8ftq3GIVAqup3X5WQfm5mxK4iSmIBnw9bYzYd1r
	 rlVjzv+iSj+BeijAltwf5exUNp3t7U3scX6H0HahwBKgIJhD0yEZAM4HAwjuInWg/g
	 d51eLiEcEO3gA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 14/19] media: renesas: rzv2h-ivc: drop unnecessary vb2_queue_release calls
Date: Fri, 17 Jul 2026 10:19:37 +0200
Message-ID: <f46445de6e04a00c59f5e9ea13ec5ec53642474f.1784276382.git.hverkuil+cisco@kernel.org>
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

No need to call vb2_queue_release if the video device is
never registered.

No need to call vb2_queue_release if vb2_video_unregister_device
is used (it calls vb2_queue_release internally).

Replace a video_unregister_device/vb2_queue_release pair by
vb2_video_unregister_device.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
index 932fed38cf3f..d37179dc8bda 100644
--- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
@@ -511,7 +511,7 @@ int rzv2h_ivc_init_vdev(struct rzv2h_ivc *ivc, struct v4l2_device *v4l2_dev)
 	ivc->vdev.pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&ivc->vdev.dev.entity, 1, &ivc->vdev.pad);
 	if (ret)
-		goto err_release_vb2q;
+		return ret;
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
@@ -531,11 +531,9 @@ int rzv2h_ivc_init_vdev(struct rzv2h_ivc *ivc, struct v4l2_device *v4l2_dev)
 	return 0;
 
 err_unregister_vdev:
-	video_unregister_device(vdev);
+	vb2_video_unregister_device(vdev);
 err_cleanup_vdev_entity:
 	media_entity_cleanup(&vdev->entity);
-err_release_vb2q:
-	vb2_queue_release(vb2q);
 
 	return ret;
 }
@@ -547,5 +545,4 @@ void rzv2h_deinit_video_dev_and_queue(struct rzv2h_ivc *ivc)
 
 	vb2_video_unregister_device(vdev);
 	media_entity_cleanup(&vdev->entity);
-	vb2_queue_release(vb2q);
 }
-- 
2.53.0

