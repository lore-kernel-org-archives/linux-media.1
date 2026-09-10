Received: from forward205b.mail.yandex.net (forward205b.mail.yandex.net [178.154.239.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D5E5650FD
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 17:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059844; cv=none; b=kYdaNeIwH54LpOgC6zdufPf+wigzikxYl6bGrjhtYUcFrSY5CBwSqhXEZp04sEppM2PzmXSpVjzOg7M/It1ivNJkAWrpgGOMsXHwFBmJTW5iKIo5OMKDTyOVtIdflGbn/aC/D2RY4iWkTMfDgHIxL1qZEEGWy570UE9HmkjvssU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059844; c=relaxed/simple;
	bh=gPr7xZ6iwbaXbHjFf7VRl+CXPkoffdhFqkubwBlwHM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a16yCadfpD7efD342pY5232aJbhQ0aHvTA8JTSkIk7vfGA1V3kv2/4Z2Vnq9zArzqxSzP0OdHhGnTobSpJAgYEp9UfCSchijel17MU4rqENusw26nKYTE0Shv0dmP5DpZvoyX643ciPyoBobcZaC0BqXhtq1xc4T5fnjIacrx3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=PkymjGli; arc=none smtp.client-ip=178.154.239.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="PkymjGli"
Received: from forward100b.mail.yandex.net (forward100b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d100])
	by forward205b.mail.yandex.net (postfix) with ESMTPS id 452CC8729E
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 19:58:36 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-57.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-57.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:313e:0:640:a643:0])
	by forward100b.mail.yandex.net (postfix) with ESMTPS id 73DCE8062B;
	Thu, 10 Sep 2026 19:58:27 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-57.sas.yp-c.yandex.net (smtp) with ESMTPSA id QwS1puqg9a60-5G3CFJt1;
	Thu, 10 Sep 2026 19:58:27 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1789059507; bh=1xNDLLn9IDBJ7A59kJm3V5g4pi9+QBfknShcyxM0Vo8=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=PkymjGliVWxcqOj7K+uueGFcRJHlflb51sYVG5ZqgNMLXSoRupwZyfrACdZnkZifQ
	 CebbQI7iVzhfN3oGKls7NmDMmReOdElSNlikvU3oYZheQKt56f9x4mvMX87GlDRETE
	 u79f2buxECYeRGpxtqoa/kvkbQX3CPPX/O3bf/sI=
Authentication-Results: mail-nwsmtp-smtp-production-main-57.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 1/2] media: em28xx: adjust queues handling in em28xx_vb2_setup()
Date: Thu, 10 Sep 2026 19:58:07 +0300
Message-ID: <20260910165808.1019448-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In em28xx_vb2_setup(), setup lock pointers as expected by
vb2_core_queue_init(), initialize VBI queue only if supported by
device, and release video capture queue with vb2_queue_release()
if vb2_queue_init() has failed for VBI queue, respectively.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/media/usb/em28xx/em28xx-video.c | 32 +++++++++++++++----------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index c418add65bb5..560e0b01f8cb 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -1405,24 +1405,30 @@ static int em28xx_vb2_setup(struct em28xx *dev)
 	q->buf_struct_size = sizeof(struct em28xx_buffer);
 	q->ops = &em28xx_video_qops;
 	q->mem_ops = &vb2_vmalloc_memops;
+	q->lock = &v4l2->vb_queue_lock;
 
 	rc = vb2_queue_init(q);
 	if (rc < 0)
 		return rc;
 
-	/* Setup Videobuf2 for VBI capture */
-	q = &v4l2->vb_vbiq;
-	q->type = V4L2_BUF_TYPE_VBI_CAPTURE;
-	q->io_modes = VB2_READ | VB2_MMAP | VB2_USERPTR;
-	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->drv_priv = dev;
-	q->buf_struct_size = sizeof(struct em28xx_buffer);
-	q->ops = &em28xx_vbi_qops;
-	q->mem_ops = &vb2_vmalloc_memops;
-
-	rc = vb2_queue_init(q);
-	if (rc < 0)
-		return rc;
+	/* Setup Videobuf2 for VBI capture if supported */
+	if (em28xx_vbi_supported(dev)) {
+		q = &v4l2->vb_vbiq;
+		q->type = V4L2_BUF_TYPE_VBI_CAPTURE;
+		q->io_modes = VB2_READ | VB2_MMAP | VB2_USERPTR;
+		q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+		q->drv_priv = dev;
+		q->buf_struct_size = sizeof(struct em28xx_buffer);
+		q->ops = &em28xx_vbi_qops;
+		q->mem_ops = &vb2_vmalloc_memops;
+		q->lock = &v4l2->vb_vbi_queue_lock;
+
+		rc = vb2_queue_init(q);
+		if (rc < 0) {
+			vb2_queue_release(&v4l2->vb_vidq);
+			return rc;
+		}
+	}
 
 	return 0;
 }
-- 
2.55.0

