Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net [178.154.239.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079CB3E16A9
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 11:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787656054; cv=none; b=CFIMiHj3qHLLKxiXmwBDkvrIGh1x8n23uEB2e3WtRG/Oj9PMFp2hQaI2oQsPpLGjtrwx2hgTN/249CgmYCxlHSdwqXeZYTkn+R5pHfA+i08Z5LdQrtDTqO1RBhV4qwXdvOQzCz9dKPKtcV7FlpsC4ft3DskMQfQ51GOa3Q1U/mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787656054; c=relaxed/simple;
	bh=O4YrfeEuUX9KV9FPV2rmxB2V4nezjoKok4Ekb3X3Qtg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bugx4JrMDAzIN5klh6ilSgYeduxzRdl0TF9TFJ4Zpb3OCD1f7kZNXChsy9AZ0H7ME/IAIVML0V9n6NpdiP6tsf7qF1e3orWzvMY+iUizSHLpa7icq3UU34Wyi8FoRU+3wsweemwvrxcis6dZoko4Yz5W8gNERFcewOuSfSE/1s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=OwKlk6uq; arc=none smtp.client-ip=178.154.239.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="OwKlk6uq"
Received: from mail-nwsmtp-smtp-production-main-58.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-58.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:8b0f:0:640:dbc5:0])
	by forward103d.mail.yandex.net (postfix) with ESMTPS id 0819AC0058;
	Tue, 25 Aug 2026 14:07:22 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-58.iva.yp-c.yandex.net (smtp) with ESMTPSA id K7aX4wofBCg0-zOHkIRs3;
	Tue, 25 Aug 2026 14:07:21 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1787656041; bh=qr43rbfRQIasXEIQ3kOKkgeIBQAgFK/XX+Fzt0nV0/E=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=OwKlk6uqqzVxqEx9jHkeHeSWMTZKOt4mhn/4j7FSH9j3VpAtSBZ0aFhl88hh6RHj7
	 lOaxavtGoC34qPMfXoYMjoOWwJPgvlJmZ1a/E91vg+l5flQ5oAHHeagpFTQx5M6MZa
	 gEpRjY9+JPpyoDvrOuMMiSfmw/e1VPpBkfeL6ubw=
Authentication-Results: mail-nwsmtp-smtp-production-main-58.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com
Subject: [PATCH 1/2] media: em28xx: adjust initialization order in em28xx_v4l2_init()
Date: Tue, 25 Aug 2026 14:07:18 +0300
Message-ID: <20260825110719.752093-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 'em28xx_v4l2_init()', call to 'vb2_video_unregister_device()' during
'unregister_dev' cleanup assumes that queues of the corresponding 'struct
video_device' instance (i.e. 'vdev' of 'struct em28xx_v4l2')  are properly
initialized, triggering an undefined behavior otherwise. So call
'em28xx_vb2_setup()' immediately after 'video_register_device()' and,
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

