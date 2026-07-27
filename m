Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D2B40E8FB
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158119; cv=none; b=RLtoDwHRQhpsRE159RPQgB6QUwRFRSFnHgK/sgfGwfywSktg+4nOTUrb7KX7Z8pJsX4R8GsU01B7XyydOv9D+EP6PMrL+MWBybE7zCMEfHzXfuNukzmTwJjnuGNxkIfBXm3P2rv8HMOCJ9hW7StKon+x4xIEe4kf4JaQG2H5vDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158119; c=relaxed/simple;
	bh=pp9qCPrtogu65Rx74dAbX+FGbbCTdpcZaIs2GGDqaCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZISTX96YbZZNSxPGCL4OvSGdywn7Ear1qErFvSD3O0lsztrsLYdrHDfQ9y/V4aKKwM/ZM47nsmxivO+RALvhxw6gNLhEK9YE1Zy4vQo5kZ+UtRXWszQy+RFy4gGOIMwJ5Fnhx3tl0Sp4MCXbMs7WVyzlDhF62SFE2I36HAaPdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfStsHiI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfStsHiI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852611F000E9;
	Mon, 27 Jul 2026 13:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158118;
	bh=n4cvgkd2Qhz/lHWto+5JjYMuBUjD1EELYxXN10uds2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HfStsHiItWl9v5VjfB4M0+x/Iv9Tc2gHR1uVwFT/ft9v2hkCnWRoYSDi9Fw7cSXz3
	 oRNzUdrcmSE1zvZTttLsFdQxyVJIZDm7pvmWc9FNKA6tLrQ08JBkzVPoamqxUf6XD8
	 X42pwijZQPDl+C1JVRUfjH1hLVvhIjSa3Ng2XsN3sLQEy6Y8CvKO4slFvvrgKKdakV
	 mJy1GcWmtKIT9MU2RyV8ZezkZUAolf2qWqII1U14wdH0eMOxKQLdigEd93r7+tOlQo
	 D9ETurVSIelynbhRbq/nrMlprKoh8tdymYGwqSkrj1n/hHcjgYrzVTJzAk/qVz9BAv
	 XkORB0BcsiVEg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 04/19] media: pci: zoran: use vb2_video_unregister_device
Date: Mon, 27 Jul 2026 15:12:51 +0200
Message-ID: <4b8efcd7d11e6d6e4eb588cf0520fc56be9fd826.1785157986.git.hverkuil+cisco@kernel.org>
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

Drop call to vb2_queue_release, use vb2_video_unregister_device instead.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/pci/zoran/zoran.h        | 1 -
 drivers/media/pci/zoran/zoran_card.c   | 4 +---
 drivers/media/pci/zoran/zoran_driver.c | 5 -----
 3 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/media/pci/zoran/zoran.h b/drivers/media/pci/zoran/zoran.h
index d05e222b3921..da2bb01f84d5 100644
--- a/drivers/media/pci/zoran/zoran.h
+++ b/drivers/media/pci/zoran/zoran.h
@@ -318,5 +318,4 @@ static inline struct zoran *to_zoran(struct v4l2_device *v4l2_dev)
 	pci_info((zr)->pci_dev, format, ##args) \
 
 int zoran_queue_init(struct zoran *zr, struct vb2_queue *vq, int dir);
-void zoran_queue_exit(struct zoran *zr);
 int zr_set_buf(struct zoran *zr);
diff --git a/drivers/media/pci/zoran/zoran_card.c b/drivers/media/pci/zoran/zoran_card.c
index 8bcf355a5418..5f6f550904dc 100644
--- a/drivers/media/pci/zoran/zoran_card.c
+++ b/drivers/media/pci/zoran/zoran_card.c
@@ -885,7 +885,7 @@ static int zoran_init_video_device(struct zoran *zr, struct video_device *video_
 
 static void zoran_exit_video_devices(struct zoran *zr)
 {
-	video_unregister_device(zr->video_dev);
+	vb2_video_unregister_device(zr->video_dev);
 	kfree(zr->video_dev);
 }
 
@@ -1072,8 +1072,6 @@ static void zoran_remove(struct pci_dev *pdev)
 
 	debugfs_remove_recursive(zr->dbgfs_dir);
 
-	zoran_queue_exit(zr);
-
 	/* unregister videocodec bus */
 	if (zr->codec)
 		videocodec_detach(zr->codec);
diff --git a/drivers/media/pci/zoran/zoran_driver.c b/drivers/media/pci/zoran/zoran_driver.c
index 5b4d5dd06edb..2e7e3fbe490c 100644
--- a/drivers/media/pci/zoran/zoran_driver.c
+++ b/drivers/media/pci/zoran/zoran_driver.c
@@ -976,8 +976,3 @@ int zoran_queue_init(struct zoran *zr, struct vb2_queue *vq, int dir)
 	zr->video_dev->queue = vq;
 	return 0;
 }
-
-void zoran_queue_exit(struct zoran *zr)
-{
-	vb2_queue_release(zr->video_dev->queue);
-}
-- 
2.53.0

