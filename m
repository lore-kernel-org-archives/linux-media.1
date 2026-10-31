Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480968;
	b=BTAUf/zEO5kGbkq9UDSaxbuLPn8fh8X6S0QVcjfOpryAi4gVFZq/MDE5mHRKGjUIOBqk
	 eLsDDQOyHidScJ17Uh5h1CldsvmjpKzdYuCn9tX47qvcoMDZcvae9Oonyoymy8lkmLNpR
	 jfJIPhqvXEnlWuDgjV/Moe0Gf8OtOQLdjgMjI/hmmsKnTIRUOJ3D+yKS8g83XXXRF7uvx
	 PpxlYXAg9wob0vmVH6qLAf9TIANdwSIWWFD8qZyW7uqqiGpYu+CmT5tA+Qc9mbmifBVIs
	 MYb16AUBRoBt22Tbs0h08AqDMXca/WwgD6JJk/tAIOALJVExX1lk2qxCaL2SHG1mz2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w/8hoYbs4XtN+m/HSlOA+igEXqiDy3aZFHqgsjMNcQk=;
	b=28Am7bUWwhOPqraATEyEd5cTJmeQ7qyiPvpnbt5WwGjEYEjO3/6JEpT3I+RjgypIGljQ
	 uPbjla3hNOs6NC2DlFjnDPub4F8dQQs/mFKeHOW4g3Fj0IYIHZkHNn/HPdbs60ZLXuYSs
	 THy9QfiMQVBOtB4JKNMroYSR+T4FMszbn81SqcE9BfbXsKkp1Dh30Ry9ogVu6NXb41Y2X
	 sQCYUNXyRhh9cXjekyezs3H0o7aAm+L0Gsdwi9iDLpQpNNzZk9QYVOhxm5su5Doq5wSi3
	 lECNjDkZgaGrCM5FsAW7SpKnR1KH0aAU/6JXJg7D3VqlEixqbmgz1tddwOzCcbkeJfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uqYbYdvg;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD19606A31C
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 21:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DD19606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uqYbYdvg
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so981972f8f.0
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 14:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793480966; x=1794085766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w/8hoYbs4XtN+m/HSlOA+igEXqiDy3aZFHqgsjMNcQk=;
        b=uqYbYdvguytgoD7FHJG5tY6rU8OIQiX6tqmAZwTE61SMy0wE28EnrcSxS59sQ2fW2q
         0ZdszXd8P9zhRcp/q2O+3QYWesl+NJbOte+HC5NowJThc+/fBZooJUc7tBKiVXZ70LJx
         DMky81QW7YSd2TXrzRj3WaSGT7meRbPZaqv9IwKBGzelACshDnTZXIACQJjcyXhEa0i8
         7RzjcauZfQmGGELTG3wiw01jfXR+tvLsEr3UTDe4Gh3y7dl4L+B0gduv/5tevT/YiSLC
         aRJT3gPWCVB643970/gcfVh9bH/uiCSUGXyDRFF0BFK3WOk9HZEr7HnTPm28IU2DST19
         oTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793480966; x=1794085766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/8hoYbs4XtN+m/HSlOA+igEXqiDy3aZFHqgsjMNcQk=;
        b=pM71Cu6Vhw4CIxL9u4aNO6tKqfnZRMe8/g2oxy8QNBieyK6T+ew672fpUiowoZAI9q
         wDjkmJH6S5fNKDnwaU9WKHVDIZxusLNpqkBoezxzG2yAHoEjn9QdFW1eus9Cqujdupb0
         vyUmSzpwhhEOcjYUTNXQpwcAPtBBNNEBJPE48bhck1d1NQD3T/01JxZBxTh9dtWjKqmg
         bYqRJfVhEIrMdhThc7vYthW2ZEAN7OlumZhHK6A1deAg0ScVV67pfkbyGxyyK0zOYuDz
         F9Crew0b/MVgQDH0eHoHqxHywToCZL8aoBOAaGxtEw8LmYK+JPSL8TCTlCahC3PH1Fvs
         w6WA==
X-Forwarded-Encrypted: i=1; AKwUvBxc/hAd5f7t4lwoF2vSspAh+sANOcF6ttDey1dOQYFX2xcZZeg/XaQ2TFO80+3/u+/9g8WToIc5eteCHw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIU/GZEK2pce5Egq/FTJ4uIYwshbfZrtOAHPTRJHV0AhXBtOBFy
	0SVOIOaL+EDx6Kspqp0a95J02daGOzStHN0bxN80WW3PI1plC65s3+CSC4lCcA==
X-Gm-Gg: AYBFou1005jnN+M0v3XxYeP8ILRpodSv61tT6qyvz+OJbhi/iUUjfJHocZRoZ/QV7+7
	KUjrZGl5J1JilU1SUWEg/Hs65M11tB7kGfUip+Lk+Ns64Ha/gjNcEI1zZwwEmbQjeaYkiBMqk2c
	fa2UVk66d3h2WPaqkuY2EB5dQOGCjiLSp0lzEx0ECGH+H9O/RozJGgmLsHJ+znZkChUdzw/1UtY
	xyx90g2IXqhO8gmLxkoT+PCWWWYvPfkN1d2VtAXRex0ot8iuhjmU9jneN2wzFyvslOcPFLBzVjE
	iDEkwN4M3X3IgHm//WqgQE3yCB5dSoI4Km2oWkOWn6zryAn/shf5zx+qO0vvXjegZOPkw74nXNe
	eBB6fQiLwlw/+/Wz5YWeb+x7gjY5gdld6RV/tYWJp1Bct+j7qL5H11lJ8E7Ki6loNyy5nG8vGuT
	0dWVMYp5p7dOnHRnO6biH5txuwoBhv3YbjjN6AXsBI9bkAnfpn6Cfo2jGOCIkmqaL6wYcVXBdL3
	SFj5FyUuJVvx9xrUuX5qvGjko7KypjI+te3wj+futN9VBJFZ8jeVPy0s+OsK0PZc3SUZClx38ts
	PSow7NUReuQ5KShHeJLAmWYsPLgwkOG6kStuTKdQITJzMeUc9ulQmQJY0edTjGUG9lgc5tWWdxO
	SPQSyzUSJ++ZPaWtHPdQRDGlD
X-Received: by 2002:a5d:64c9:0:b0:48c:585b:8825 with SMTP id ffacd0b85a97d-48e6e2db4a1mr16251497f8f.18.1793480965675;
        Sat, 31 Oct 2026 14:09:25 -0700 (PDT)
Received: from DESKTOP-IR7J1S9.localdomain ([105.98.98.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm10793317f8f.51.2026.10.31.14.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:09:25 -0700 (PDT)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com,
	Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: em28xx: fix v4l2 use-after-free after failed init
Date: Sat, 31 Oct 2026 22:09:21 +0100
Message-ID: <20261031210922.323-1-drifabdelmalekmohamedsaid@gmail.com>
X-Mailer: git-send-email 2.43.0
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

em28xx_v4l2_init() publishes the new object in dev->v4l2 before the
video device is registered. If a later initialization step fails -past
v4l2_device_register-,  the error path unregisters the device nodes and
drops the initial v4l2_device reference, but previously left dev->v4l2
pointing at the freed object.

syzbot reported:

BUG: KASAN: slab-use-after-free in v4l2_device_disconnect+0xa4/0xc0
		drivers/media/v4l2-core/v4l2-device.c:78

em28xx_v4l2_fini() is called later from USB disconnect. It reads
dev->v4l2 before taking dev->lock, and on the failed-init path it owns
no reference. The last close of the video node can therefore drop the
final v4l2_device reference and free the object between that read and
its use in v4l2_device_disconnect(), causing a use-after-free.

Fixing this by clearing dev->v4l2 under dev->lock in the init error path
before dropping the initial reference, and read it under dev->lock in fini.
This makes fini see NULL after a failed init, while the successful path
continues to hold the initial reference until fini is done.

Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
Reported-by: syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1e71765881a6fc43185f
Cc: stable@vger.kernel.org
Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
---
v2: added unlock in early return in em28xx_v4l2_fini
v1:https://lore.kernel.org/all/20261031204723.1415-1-drifabdelmalekmohamedsaid@gmail.com/T/
 drivers/media/usb/em28xx/em28xx-video.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d486..924a3f7977c9 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2414,7 +2414,7 @@ static int em28xx_v4l2_open(struct file *filp)
  */
 static int em28xx_v4l2_fini(struct em28xx *dev)
 {
-	struct em28xx_v4l2 *v4l2 = dev->v4l2;
+	struct em28xx_v4l2 *v4l2;
 
 	if (dev->is_audio_only) {
 		/* Shouldn't initialize IR for this interface */
@@ -2426,13 +2426,17 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
 		return 0;
 	}
 
-	if (!v4l2)
-		return 0;
-
 	dev_info(&dev->intf->dev, "Closing video extension\n");
 
 	mutex_lock(&dev->lock);
 
+	/* matches em28xx_v4l2_init error paths */
+	v4l2 = dev->v4l2;
+	if (!v4l2){
+		mutex_unlock(&dev->lock);
+		return 0;
+	}
+
 	v4l2_device_disconnect(&v4l2->v4l2_dev);
 
 	em28xx_uninit_usb_xfer(dev, EM28XX_ANALOG_MODE);
@@ -3129,6 +3133,9 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		vb2_video_unregister_device(&v4l2->vdev);
 	}
 
+	/* matches check in em28xx_v4l2_fini (under the same lock) */
+	dev->v4l2 = NULL;
+
 	mutex_unlock(&dev->lock);
 
 	/*
-- 
2.43.0

