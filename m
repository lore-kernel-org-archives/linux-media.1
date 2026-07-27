Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B31A411F8C
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158129; cv=none; b=KgjGRXT2YOsKbFIYAcGoK0rA2h/xS5Zk4TAzQSDw5cY+rnKkYJsfjrTQSYqx4NxXxGcDCVtq+NGr++W62mjsrhdhtwuy2X/lUggps7jFJmV506MGUizWoWnUmcR8s2yvQjnLNQVIbxL7D3jRzxuINDweJR5PFwHJrLnCSqTu9Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158129; c=relaxed/simple;
	bh=ocd1cWNvJ1s5or1jh25AYYvhhsfciz9NdhoFWwW0D6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltSwbrhpJMixWRsgscHSi9p09BhAENB8bnctiC8Hafl5U3/tMiIQIn0PiNoB9ZEswltL/mNsZilYdmpuASKjHPj+HEYRE9+ebSla7HqYSlIMgvdWt1/unmay+DICFfELKrpOm9KZxdMQXqtqMXNRID2raAd0WX8cm4GyRN5i8pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJXlcgGb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJXlcgGb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79A71F000E9;
	Mon, 27 Jul 2026 13:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158127;
	bh=m7cakHFGx0MewcQ75JCHL7KztNi5jxST28L1PcsYYTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IJXlcgGbFHKqNQoouvZOCNr2JYKVWvUOoUokAtwV94FznkJoSUi7E3WXvrLCj/8B5
	 DhkhyrKOssuSvUCCI8uwmDPZmOu4O+HmZ160e6qhCfPWWDBReyJIpMgcmRssxET8XD
	 /t+WjJQ0l5+QE0RuR4mB+ateAIn2g8J0FnPDHOwTxJ50SLQZtzQLMUcaGfmGH/eBXI
	 UDdlegGVB06YtlkBbTmxBgpe6x7X1ufyLb7+/MvVhQSe6KHUVArBgfwbZefNG1YyJe
	 ajZ8saHpgF1ssA4OFgIjfnGWIKDuvygwI0Et1TKlm3QWd2MiP5tJLEhicV5sdqhGcE
	 hcPTiVRDh/l9Q==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Joseph Liu <kwliu@nuvoton.com>,
	Marvin Lin <kflin@nuvoton.com>
Subject: [PATCHv2 10/19] media: nuvoton: drop unnecessary vb2_queue_release calls
Date: Mon, 27 Jul 2026 15:12:57 +0200
Message-ID: <43a8c5430f3c6e95cdad2721a7e11a992def41fc.1785157986.git.hverkuil+cisco@kernel.org>
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

