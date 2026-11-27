Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795751435;
	b=cCJhEG3bczXiB1jz5jZ0/caGDs2tC43wyFQ6I7zeV0n72OO5cmPwVTm0DM7j9pm31I6Y
	 0Y0fYgquVJanymBSKLTxaGcZqY3b0tfAFlZZzY7AwiMQwnVFQzZRpuqQGnJk4eceKlxna
	 9E9GAn92aotnxoRTNE6HkJsIkwR1Uh0ksBp1imxCeGbPiV9nPhWbDr2JKfPecVmpEXWG+
	 zIIgz0HIUhkzZVtSREIllDjncHZ86lItOoqI6tlVxn37Ex2v4EPkFGVeTXanDWaLUYNwi
	 Z9SV6yASh6478aOf2TZxgLnu2BnsAznDxUBVNDtzzopdFfVqdQthnw130ckzHl+H56w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795751435;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ZYsqMNDA+kD5cV72E9fL8r6yOmNjuoz60L28eZpvDOE=;
	b=kytozQAi2MBcTOVErRxMeTNZBnsq7CbsbKlFtZBFvAi5HQ+uTCWSuFqeLU4ubWBHrxVY
	 cCsqle2O98NTojbry559N6TH/BKKFTb+LaslomREqU2ovFAlUjDj/bSnS9t+BHGjqUiLR
	 /I9/9Nx4Q7WhO9A9xXEfzsuuUHa8AFLwgEJ3SX3qm2Y0erEaOZLStfLceQITl7k+XeHJk
	 CFB22n9SWAn7p1cot1rTLacRieHDBnZ31QxQAsEoPlHyfS2XfyfssDRWbm9IZDxg4vUqd
	 o9PsvEPP8eKuKWb3s3b4fRivW5oV3E8dKwiFmnNb7i294dkbIUr+uploy1z2uR7qfIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kaihong.com;
	spf=pass smtp.mailfrom=kaihong.com;
	arc=none smtp.remote-ip=115.124.28.219
Received: from out28-219.mail.aliyun.com (out28-219.mail.aliyun.com [115.124.28.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1912D606A31C;
	Fri, 27 Nov 2026 03:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1912D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kaihong.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaihong.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1057066|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00636292-0.00524632-0.988391;FP=7095139096082257836|1|1|2|0|-1|-1|-1;HT=maildocker-contentspam033037006180;MF=wangjichen@kaihong.com;NM=1;PH=DS;RN=4;RT=4;SR=0;TI=SMTPD_---.kB6E6If_1795751424;
Received: from ubuntu.example.org(mailfrom:wangjichen@kaihong.com fp:SMTPD_---.kB6E6If_1795751424 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 27 Nov 2026 11:50:24 +0800
From: Wang Jichen <wangjichen@kaihong.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: syzbot+8769efb8c3d52870334c@syzkaller.appspotmail.com
Subject: [PATCH] media: em28xx: check media_device_init() before register
Date: Fri, 27 Nov 2026 03:50:23 +0000
Message-Id: <20261127035024.3598938-1-wangjichen@kaihong.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

em28xx_init_dev() ignored -ENOMEM from em28xx_media_device_init() while
em28xx_usb_probe() still called media_device_register(NULL) under
CONFIG_MEDIA_CONTROLLER.

Reported-by: syzbot+8769efb8c3d52870334c@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=8769efb8c3d52870334c
Signed-off-by: Wang Jichen <wangjichen@kaihong.com>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 8440eafad..8618f4077 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3944,7 +3944,9 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
 	else
 		dev_info(&dev->intf->dev, "chip ID is %s\n", chip_name);
 
-	em28xx_media_device_init(dev, udev);
+	retval = em28xx_media_device_init(dev, udev);
+	if (retval)
+		return retval;
 
 	if (dev->is_audio_only) {
 		retval = em28xx_audio_setup(dev);
@@ -4438,11 +4440,13 @@ static int em28xx_usb_probe(struct usb_interface *intf,
 	 * topology will likely change after the load of the em28xx subdrivers.
 	 */
 #ifdef CONFIG_MEDIA_CONTROLLER
-	/*
-	 * No need to check the return value, the device will still be
-	 * usable without media controller API.
-	 */
-	retval = media_device_register(dev->media_dev);
+	if (dev->media_dev) {
+		/*
+		 * media_device_register() may fail; the device remains usable
+		 * without the media controller API in that case.
+		 */
+		media_device_register(dev->media_dev);
+	}
 #endif
 
 	return 0;
-- 
2.34.1

