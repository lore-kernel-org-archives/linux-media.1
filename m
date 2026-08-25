Received: from forward103b.mail.yandex.net (forward103b.mail.yandex.net [178.154.239.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D858E3F211A
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 11:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787656056; cv=none; b=j7cdb3r+PesN0k/ncde3pB3mKytRxjH5aWrXU0qFYg+on+IoDxEhXWjX9sgHu5xKVVvcpvhAQn+Z+s8xiEVtLeA89xq5zeNyRk3OsClm98Pagclqf/mqwM6ETvkgnK5KQvivCj7ZBoBzuyuJAdxsAJ3Q6SwJ1d83Dz0IymlX2Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787656056; c=relaxed/simple;
	bh=qoKzUsFbu9X8lrxwnWW83mkhtuAsPJZNFKaHs+zPWuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EmUg2UuAMc+Kfk9OxEf1JwkbYcuGAuz8hRMeWipdj4HUAofVQGQytIV0VM7viDhnDaS8ptasmDHPYaDpQjK8sqIeQ3OIQonAG5ylLozrV+WeB7LllkHOfdCFbCc1rKKKPdQNQ06Pmv7tx8b58VZLzYEZCuF+n1n2R2gl0ne2FkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=aapzlBnq; arc=none smtp.client-ip=178.154.239.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="aapzlBnq"
Received: from mail-nwsmtp-smtp-production-main-58.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-58.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:8b0f:0:640:dbc5:0])
	by forward103b.mail.yandex.net (postfix) with ESMTPS id D34A6C00A1;
	Tue, 25 Aug 2026 14:07:22 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-58.iva.yp-c.yandex.net (smtp) with ESMTPSA id K7aX4wofBCg0-ob3n63JL;
	Tue, 25 Aug 2026 14:07:22 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1787656042; bh=ueAK44nopVgVSAtWpxtv5WyiTJvi3+FpeyRGOHDLyrQ=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=aapzlBnqXenFhpIWUwtDeOzX+m+LKrwP9X5yg4SXOIac3c4k2v9BGT4qeFSXVVq8A
	 XZIY03TrOBtoAMMXV5JdiDE2NbKZ8Ic7zAU6dnytA0BT9MO1h1XD0Ozt/62kUG7CcK
	 kUg5JXxJu74GXAlCJd5CB9/RWxKRbFFMlEXH0qxo=
Authentication-Results: mail-nwsmtp-smtp-production-main-58.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com
Subject: [PATCH 2/2] media: em28xx: fix race between em28xx_free_v4l2() and em28xx_v4l2_fini()
Date: Tue, 25 Aug 2026 14:07:19 +0300
Message-ID: <20260825110719.752093-2-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825110719.752093-1-dmantipov@yandex.ru>
References: <20260825110719.752093-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Take device (an instance of 'struct em28xx') lock in 'em28xx_free_v4l2()'
and do the same early in 'em28xx_v4l2_fini()' to avoid UaF-triggering
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

