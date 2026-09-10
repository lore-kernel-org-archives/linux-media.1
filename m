Received: from forward101b.mail.yandex.net (forward101b.mail.yandex.net [178.154.239.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C44F4AB1DA
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 16:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059521; cv=none; b=WsK/Z6Zkyy1CKGtsndjU/KJVOtzn0Yg0vGDjbVcNY6n7Iuzb/AG2LbZ+fnYphvbMG/grM2f0IqCZ7RJb5ceC+hwEfZ2RBVkLN+dA5hrPdtKVD2SbsoaQ/E7E0qSQNzhSJZFN0nBrHWCyXGh3LznqvaJ+i/g9KjKp0qvnyZCKnrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059521; c=relaxed/simple;
	bh=NRMslCpEoowKGpECLznJXe5S3Q/IZIZLwERlsI9uOIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MCLlqJVtve6JLKZIx1ZDc2s3v9Ux9KiIcf4EwskliSI6coguOBvI0JoHJvkysDRCj8y94tv8u71CSot0k7pAWDp35ojs/5t1uM+2VMR3pyOKQyPDPi1kglHNYP9SlP2KiuawjqCk1alFiQTJ10jha8PE0lUZD2Hk3Kpm15thvQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=l8eXV6as; arc=none smtp.client-ip=178.154.239.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="l8eXV6as"
Received: from mail-nwsmtp-smtp-production-main-57.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-57.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:313e:0:640:a643:0])
	by forward101b.mail.yandex.net (postfix) with ESMTPS id 31860C0074;
	Thu, 10 Sep 2026 19:58:28 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-57.sas.yp-c.yandex.net (smtp) with ESMTPSA id QwS1puqg9a60-CyPkQ8KK;
	Thu, 10 Sep 2026 19:58:27 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1789059507; bh=B+OkEVbIEuiBnI9Yq1Im9A7WNQZTMQaw/1Y8kP4gLmM=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=l8eXV6asoc1xNgG5JEH9ddQQMcETv3ZqyKVEo+9DGH6s2CWnKAoLBTZDc0fcF9hTz
	 73ZUcaz8GvrGrZScKNYPVoFmmBv+9lyP0hP5ewMOHHgfhxhULEocfmBRyIT/eZ+X2N
	 VzyDL4q7HDKIwTQnzWvihqxpoiAov0qBnHirGB/Y=
Authentication-Results: mail-nwsmtp-smtp-production-main-57.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com
Subject: [PATCH 2/2] media: em28xx: setup queues before registering V4L2 device
Date: Thu, 10 Sep 2026 19:58:08 +0300
Message-ID: <20260910165808.1019448-2-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910165808.1019448-1-dmantipov@yandex.ru>
References: <20260910165808.1019448-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust em28xx_v4l2_init() to setup video and VBI capture queues
before calling video_register_device(), thus making error cleanup
work as expected.

Reported-by: syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=dd0f06181ab66b93dc00
Suggested-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/media/usb/em28xx/em28xx-video.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 560e0b01f8cb..4696bb1888fd 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2989,6 +2989,14 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	if (dev->chip_id == CHIP_ID_EM2828X || dev->board.decoder == EM28XX_BUILTIN)
 		v4l2_disable_ioctl(&v4l2->vdev, VIDIOC_ENUM_FRAMESIZES);
 
+	/* initialize videobuf2 stuff */
+	ret = em28xx_vb2_setup(dev);
+	if (ret) {
+		dev_err(&dev->intf->dev,
+			"unable to setup videobuf queues (error=%i).\n", ret);
+		goto unregister_dev;
+	}
+
 	/* register v4l2 video video_device */
 	ret = video_register_device(&v4l2->vdev, VFL_TYPE_VIDEO,
 				    video_nr[dev->devno]);
@@ -3074,9 +3082,6 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	/* Save some power by putting tuner to sleep */
 	v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, standby);
 
-	/* initialize videobuf2 stuff */
-	em28xx_vb2_setup(dev);
-
 	dev_info(&dev->intf->dev,
 		 "V4L2 extension successfully initialized\n");
 
-- 
2.55.0

