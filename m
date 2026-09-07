Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net [178.154.239.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A8B44AB88
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 10:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776923; cv=none; b=sV2HuYmY6x5ZG+1SZe/qCVQa9tGN5ANnj2QblWA1fz47+uR4ZcsUMqiRKbCtyEojtCqIqkhwF1zTqtH1j5U4GyldlHMVWUSbWb38MzDR15yPeH1nPL+zXTj92vA4VjOm7bfGpXOYY1+YUOqBDf9Q4Wd8vtvOCjQGNaNADChdllg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776923; c=relaxed/simple;
	bh=VdZrvPF+6Sbr1E1BI3LTxn7jKiPjHpLQhIIWdbaFPyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Iz6Lx49sLtxoR/aqmb5+lNEGW9sov/XqStPsbNjoiWiDP6O1RhsPutc6wqGLzSkewRtbYN6ZAOcqPnM1IqS0VSU3LOLucqjEPvVx08t+fnqglNo3cdWITq9RwxIubFV0UKKjHkqc3lS8SWsev8yttez5B+FT1Mu7g11jBoofSNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=G7INNOo0; arc=none smtp.client-ip=178.154.239.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="G7INNOo0"
Received: from mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:9cd:0:640:e66:0])
	by forward102d.mail.yandex.net (postfix) with ESMTPS id 45677C0180;
	Mon, 07 Sep 2026 13:28:32 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net (smtp) with ESMTPSA id USJdU1Fd5Gk0-KGF02kVM;
	Mon, 07 Sep 2026 13:28:31 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1788776911; bh=eu8J2XS22Xrjfmi9RlHCkcLh0odpjj+c+tkZa1OHhKc=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=G7INNOo0rYx+DHPD3XtEm9mY2SNur/9XGcF7SG8eukmSRBU9hOIWrEInFFq2SMy80
	 swet4r9gyPDmost+KUZHeRoggh/zLXwLPTWThZ7NX1ALKpYzDHuJsXa2TKeyszIy40
	 jiaYJEBqVl8pZWpHeR39PdKnP/Y7NjcLz/2tB2jw=
Authentication-Results: mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com
Subject: [RESEND PATCH 1/2] media: em28xx: adjust initialization order in em28xx_v4l2_init()
Date: Mon,  7 Sep 2026 13:28:23 +0300
Message-ID: <20260907102824.95222-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In em28xx_v4l2_init(), call to vb2_video_unregister_device() during
'unregister_dev' cleanup assumes that queues of the corresponding 'struct
video_device' instance (i.e. 'vdev' of 'struct em28xx_v4l2')  are properly
initialized, triggering an undefined behavior otherwise. So call
em28xx_vb2_setup() immediately after video_register_device() and,
since the former is actually non-void, do not ignore the value returned.

Reported-by: syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=dd0f06181ab66b93dc00
Fixes: 37ecc7b1278f ("[media] em28xx: add media controller support")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/media/usb/em28xx/em28xx-video.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index c418add65bb5..324855ff5e86 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2992,13 +2992,19 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		goto unregister_dev;
 	}
 
+	v4l2->vb_vbiq.lock = &v4l2->vb_vbi_queue_lock;
+	ret = em28xx_vb2_setup(dev);
+	if (ret) {
+		dev_err(&dev->intf->dev, "unable to setup device queues, error %d\n", ret);
+		goto unregister_dev;
+	}
+
 	/* Allocate and fill vbi video_device struct */
 	if (em28xx_vbi_supported(dev) == 1) {
 		em28xx_vdev_init(dev, &v4l2->vbi_dev, &em28xx_video_template,
 				 "vbi");
 
 		v4l2->vbi_dev.queue = &v4l2->vb_vbiq;
-		v4l2->vbi_dev.queue->lock = &v4l2->vb_vbi_queue_lock;
 		v4l2->vbi_dev.device_caps = V4L2_CAP_STREAMING |
 			V4L2_CAP_READWRITE | V4L2_CAP_VBI_CAPTURE;
 		if ((v4l2->vdev.device_caps & V4L2_CAP_TUNER) == 0)
@@ -3068,9 +3074,6 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	/* Save some power by putting tuner to sleep */
 	v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, standby);
 
-	/* initialize videobuf2 stuff */
-	em28xx_vb2_setup(dev);
-
 	dev_info(&dev->intf->dev,
 		 "V4L2 extension successfully initialized\n");
 
-- 
2.55.0

