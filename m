Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6F73DD512
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276712; cv=none; b=WVpnFOBcnFD6123jutGZEIcJ1jcCLZrtIHrJIAD+KH8L12stBkV8ezTEzRMPrMl8LB0J99KTdStNOsYcKPBsTTlxOf/DDtCTKCffEFxjiNSU4cnsyDgQeSZqJUVa7bb3Km+/UvEUGZvf8OT0WvT38vquCLRwlHpy+Mt9Krhahbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276712; c=relaxed/simple;
	bh=J6dEyZz3u8eaLHZI4oWnX1G09aErE0XU9F5oD1vPe00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CrrarA6LUsUEkIbh79HPKqZqXj8qgcRInuFVekSRnjiC1dQcaIvvNbM93SbrCYLpsGGpGtuy4U0k+hSJ8/z4fgHEXkrhCzMj4pSQg8rMROfwr1YWTaJBLlNJwUOwkUpJb1E2jWD/Ja0YK/pZRW6DnqypfboZT6+Xiz88Z3G59OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlJPmIsm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlJPmIsm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7A41F00A3A;
	Fri, 17 Jul 2026 08:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276711;
	bh=jzinmXNBrrxHrzy7oDAh9RFf83k/z8zoyb5L2oHlQLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SlJPmIsmU6p+vDmx0+H2De0v4OQMzBSsQL39HQ42Fs2zJyOeQIMw9ZkyPQ5XnuqjL
	 AZyu94eKM9PcQbJEKsnHZJrMJBZ4nVMoUyUP3ciEdF78zsfaTAUEYua3nftJorvarm
	 CXemWpC1sf/qfHJ6jlT7nugdyemMMadZ98JdCI3e9MwR1Ud6+cV7x4jG0LdKX069iK
	 etWsyc6+E3gLN8WrDVN2hMysKwYvVTLW2SztmBD20mVzEHpOA/Gd3nTaTz/0WCzDDz
	 Z4WigcoeuSnTvY2zl064XdwhA7QGvGDGKC9n0YJmGE3dMtLvWd+avM51aAxxz7XbTO
	 QHwc6qQwPUkPw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 04/19] media: pci: zoran: use vb2_video_unregister_device
Date: Fri, 17 Jul 2026 10:19:27 +0200
Message-ID: <296c32aa8ec2c6b0d92bb12c76216b50529cf4a8.1784276382.git.hverkuil+cisco@kernel.org>
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

