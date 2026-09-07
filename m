Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net [178.154.239.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BAF44470E
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 10:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776923; cv=none; b=TDAYjPOiaTBpxWUT27AgqBbM97zomiP2BnWlY26X0wmDfRCEt7LeQqzsc7qzd/WBnRym21IlMKyIycLcXgxfjCSQ3eTb1ZyBQ5Zgr8C1ieDUAEm8b6qtlxfyO0Qk9UdL9WiaOKPZ/5KKQ0+JiAvvWLG2R8lwwitsX++n2X2vIhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776923; c=relaxed/simple;
	bh=hrXoFWwjgASY8UOJcxujbHXwKsLOdz40ZTWCMvIHlFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LPddptomjpXu1zIfloPK7kla3kF3T2NHzRuyazCe/EMfShBcasrwUe9bJz5zoC1EExuLdW+MYaXr6HTV38uiyPSzXQ+tVYbOOZd8nTh8rpyKYrV7iKG+V3MDgKbazDrpuCA3ftNWndEyYCYlfzBTsn2JeeM+i0L857X2PwjYg+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=rADZgjPu; arc=none smtp.client-ip=178.154.239.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="rADZgjPu"
Received: from mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:9cd:0:640:e66:0])
	by forward102d.mail.yandex.net (postfix) with ESMTPS id CF581C0134;
	Mon, 07 Sep 2026 13:28:32 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net (smtp) with ESMTPSA id USJdU1Fd5Gk0-dWBlGNLq;
	Mon, 07 Sep 2026 13:28:32 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1788776912; bh=SjhjyvqUdgNeU3La6OFUHj/f9GfMRg16wPHqIIXqWks=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=rADZgjPu9ryt5O4cqtwVZ8y9q6mEPA1fYuWo/NRHm4fmzhY8CBBVsKBXX2Gt9Rv6P
	 69pAHJWDi6EJUiv8kbk0OAXQ2+2tQWob2oiHHOEZvGzOmp6B6iJMHjKqScl78ziozE
	 DIoeGQ5U9A8zzwBS7B/Us1j0OhrQmvllGiJSSPTg=
Authentication-Results: mail-nwsmtp-smtp-production-main-94.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com
Subject: [RESEND PATCH 2/2] media: em28xx: fix race between em28xx_free_v4l2() and em28xx_v4l2_fini()
Date: Mon,  7 Sep 2026 13:28:24 +0300
Message-ID: <20260907102824.95222-2-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907102824.95222-1-dmantipov@yandex.ru>
References: <20260907102824.95222-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Take device (an instance of 'struct em28xx') lock in em28xx_free_v4l2()
and do the same early in em28xx_v4l2_fini() to avoid UaF-triggering
racy access to 'v4l2' member.

Reported-by: syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=dd0f06181ab66b93dc00
Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/media/usb/em28xx/em28xx-video.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 324855ff5e86..3b8766d00897 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2305,9 +2305,14 @@ static void em28xx_free_v4l2(struct v4l2_device *v4l2_dev)
 		container_of(v4l2_dev, struct em28xx_v4l2, v4l2_dev);
 	struct em28xx *dev = v4l2->dev;
 
+	mutex_lock(&dev->lock);
+
 	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
 	v4l2_device_unregister(v4l2_dev);
 	dev->v4l2 = NULL;
+
+	mutex_unlock(&dev->lock);
+
 	kfree(v4l2);
 	kref_put(&dev->ref, em28xx_free_device);
 }
@@ -2388,25 +2393,24 @@ static int em28xx_v4l2_open(struct file *filp)
  */
 static int em28xx_v4l2_fini(struct em28xx *dev)
 {
-	struct em28xx_v4l2 *v4l2 = dev->v4l2;
+	struct em28xx_v4l2 *v4l2;
 
-	if (dev->is_audio_only) {
-		/* Shouldn't initialize IR for this interface */
-		return 0;
-	}
+	mutex_lock(&dev->lock);
 
-	if (!dev->has_video) {
-		/* This device does not support the v4l2 extension */
+	if (dev->is_audio_only || /* Shouldn't initialize IR for this interface */
+	    !dev->has_video) {    /* This device does not support the v4l2 extension */
+		mutex_unlock(&dev->lock);
 		return 0;
 	}
 
-	if (!v4l2)
+	v4l2 = dev->v4l2;
+	if (!v4l2) {
+		mutex_unlock(&dev->lock);
 		return 0;
+	}
 
 	dev_info(&dev->intf->dev, "Closing video extension\n");
 
-	mutex_lock(&dev->lock);
-
 	v4l2_device_disconnect(&v4l2->v4l2_dev);
 
 	em28xx_uninit_usb_xfer(dev, EM28XX_ANALOG_MODE);
-- 
2.55.0

