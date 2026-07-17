Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52E63DC856
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276722; cv=none; b=Nju114/yjH/PRoqwA2m05hBI2mseFFRtrUbuMUISTnP8GGoagM4WKhRaC+XZ/uaoMIXayqok65gzQxqRselAnz6Q9H5t4b4BfA+YmkhskmzerAYfxhRCTTtcTQUckSHjHcHtOgHCmUDrw0HZ4ZXqx/QnzFJ+tSAciZrPbk8tlqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276722; c=relaxed/simple;
	bh=0s7OpW7CrDyuyfZHSJgN5LMbhUW72uvBueGaAZ5WOqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AMauMmCkUsjJjTRgHRZFsvrZHt5XQD8WmvImM6MxTS3jJshHve9MHher6+OWFZsc2K8bM6P8eScMzJTBxNgDmk8WdQOPyjNft1ZuKbaEYl05vhNsGDii4yjsyzl52TYJsl928/U2TeMD5cQcJNi16gqwz05ceoPpBXsNLFDCuXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkDQh+4T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkDQh+4T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09EE51F00ACA;
	Fri, 17 Jul 2026 08:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276721;
	bh=aR57J0frKQQEGeppWXg6Dxg/fhoZdkncu54BJU10HsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hkDQh+4T31ncXFvB7iQ2Bo87J/OdXZSkGr/J6R0VHJ4GOBecQujwywjrQ/nvpTnW6
	 fy/o98W8wt0owN3ZdrJa4qevjHzNT2tv+2pu1OTq7z6wHdBx2YYXJ7kkry130/beqM
	 PX7w0tQqRfcvYSbNwgoVrFNLnKS+KmgJU3LF9C3T78kC2D5CLtaKvWnU1BlcjgD3cU
	 mxBIwv6BVCfhoCJZNnRyvGyRVzw/zQwIHPFLg0wwfA6lGnwIektKYsSLt634QjBCb6
	 qRoNlFY2vwhgQ2bQb/uP14lYFKserfa/wDu8CzxYFtfgf4r0+55gs4GsfoxWls/rbi
	 Y4pFYya7qg3JQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Joseph Liu <kwliu@nuvoton.com>,
	Marvin Lin <kflin@nuvoton.com>
Subject: [PATCH 10/19] media: nuvoton: drop unnecessary vb2_queue_release calls
Date: Fri, 17 Jul 2026 10:19:33 +0200
Message-ID: <658aa73893bcac9a67f05d1a61fdc01a212ec824.1784276382.git.hverkuil+cisco@kernel.org>
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

There is no need to call vb2_queue_release if video device
registration fails.

And use vb2_video_unregister_device instead of the
video_unregister_device/vb2_queue_release pair since that
will call vb2_queue_release internally.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Joseph Liu <kwliu@nuvoton.com>
Cc: Marvin Lin <kflin@nuvoton.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 52505af35c08..088dec771b67 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1635,13 +1635,11 @@ static int npcm_video_setup_video(struct npcm_video *video)
 	rc = video_register_device(vdev, VFL_TYPE_VIDEO, 0);
 	if (rc) {
 		dev_err(video->dev, "Failed to register video device\n");
-		goto rel_vb_queue;
+		goto rel_ctrl_handler;
 	}
 
 	return 0;
 
-rel_vb_queue:
-	vb2_queue_release(vbq);
 rel_ctrl_handler:
 	v4l2_ctrl_handler_free(&video->ctrl_handler);
 	v4l2_device_unregister(v4l2_dev);
@@ -1807,8 +1805,7 @@ static void npcm_video_remove(struct platform_device *pdev)
 	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
 	struct npcm_video *video = to_npcm_video(v4l2_dev);
 
-	video_unregister_device(&video->vdev);
-	vb2_queue_release(&video->queue);
+	vb2_video_unregister_device(&video->vdev);
 	v4l2_ctrl_handler_free(&video->ctrl_handler);
 	v4l2_device_unregister(v4l2_dev);
 	if (video->ece.enable)
-- 
2.53.0

