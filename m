Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793479649;
	b=W2a3lPxHMBfnTYhG6/y11Ttk17y43GYEmDLfpk/X9mhwWobzoBOJk2FU9H1XnX+SdUOC
	 FyCvcZYkXrq36HxWPDm6qjqmzURpRVELQQ2gIdZ7knTvhzeFlNzcN1NG363ycJT4/qCgZ
	 hq5uyIa0Ydl61IECyKWUEfmh/8fzNXQxNkc0CmQrsatWkx85XcAyB7DkZlC037K08r+yC
	 dEqDgZyEkC4HWrPuEKOzsMxDYG55jZiW+Tf1c9YHlAZb3ixaY4h+almkrB7OGipGZrSZd
	 0ED3AMQYJkyfVFcy1sB87rH73N+oyZcK5SA7AjJGPGxnDetZMJmGjgoYiVgce6XM3gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793479649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6pRrbeo6zVDPi8G+cRc3tH7FP8XtYrfaTkuc/zmCEVs=;
	b=yKew1mb5lWuWZal6eiX/uohYByFV9uIzl0n1+B+O3SD3gwvsFmdIpKHYB4lEYITV1QJY
	 GTf3M1mTsR9480DJ7uhG9lEh8ljQ8Tk6mOt+/DpT6PZetnJAFpRwbBduz1JY6rfTOMPo1
	 QZRYJa6Xtr+MWB9hF1LrwX1P2CFrL5aKlTQsONcdYdlrJkyAFHwUckYvdoFirJYu/Dx68
	 88AXjbCf/UnWX3fwsZyFunv0mc7Cpy19Ds1OBy7IGQ7mSMuv0aUvm3jAOOGJlW/XgZzZB
	 p9VtwHnGef+IvWoSgzx/Qh5uW7emH9WW0F5YdBWTG4LifjrYZhvEOv7jNHYqsCAub9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UC+LJti3;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F990606A31E
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 20:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F990606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UC+LJti3
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so13482355e9.0
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 13:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793479646; x=1794084446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6pRrbeo6zVDPi8G+cRc3tH7FP8XtYrfaTkuc/zmCEVs=;
        b=UC+LJti3Yv47rlpsQtHWSUfnCSQ7T09uTWdO9TVT1rB2t2tdyw0SWFQ3j2d+ZVrwve
         4r0z4s9Fx0oXKO6rVnZgEcoywRiNHsuirCmGjU+qyd/vGbHa5WR+WbjGLiOm2+cLJ9/l
         gZUhrUw1iE+VasqZ8qabyUDE3xLwiEyw4CNY38lU/K2KhtgI/l+ZS98pDDWarhGLSCPz
         Y1p+u+oQuA2T5Uwv3+1rXrvhvV5ZDVAO1j+VB1NgIYFSIaSa2fOTqh+Up5yNdCTb6vGr
         fu1dIeM9gZ2PQ2cZiLI/FAg2xDaJ78VNKPK/a5kTx7smUBYQgZLGeMDPCXzSktEaq9Lc
         hANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793479646; x=1794084446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6pRrbeo6zVDPi8G+cRc3tH7FP8XtYrfaTkuc/zmCEVs=;
        b=MADF/sOY7pbuipfaCRCYKbBk+Npj9fnrWDgkJM6OpmmF4bRem1ufeyd3IeMrJxBvo7
         ihDhiY9k2uEJ+UYMb/qJ5XSTNO3VWyPVsfG2gyyPvWU/TDUYH9z4IJ7kiGFQPVK9fIPw
         wmXjJBwV3v5uq2vYO8jIL4wlUpmNkT8Gjp7a9Gddo5FA6cRS/4X/3fTfOBy9mpuPzO/5
         2ghZsEzr6FiMeywKYRUa/ZWZfb14BdejqhFSHRXNNgkfRTHAj2enJuv1JkF2Zl3X0Lom
         AeJwRcBTWsu3pA1gd4L7OnWvvoPjspNGO0T9FlBV/Cgd5hzjkwJI9d+nmVyA80/L5ben
         aPcw==
X-Forwarded-Encrypted: i=1; AKwUvByHBsqIBExk6xsrqUqMfo6SbI2P9e5+35NZEGSp2yj3c0m1pqfLF8tUgiO9323LVt86JLORXPZ1r4dOCQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKTBR1RTAZfG1MUyKib9CW2puNE9uWxwqnlzjRR/seKfwkuYZ7n
	BC0KBRwTm/iFMNDyDZv4dPUzGzTcFBYaglzbsx9YYepqQ9O3MyeZ5ZbI
X-Gm-Gg: AYBFou02bcb9cZ71ce6e2tQLAVv9bRhvAw2IyG3wT3gXyGTggmCFnHTf+rVQx26EUlV
	z3btd59oxEjgA92E0EetXhNb26QBxjojZ6YylY/qO7SbLJf6AjvVMBD3g+w0TCMvtCTIPQLqFcU
	uE8c3oJCuKrgD8v2AtbL44jLEArxXThcYz9UdXt9yJ83jKaQoCfKkk3+KuFv2fNahUejMkDaVQR
	1CX22HlDpGw/q5NAW0jzkRbT2nJR+N+x0sSQNkwZ7K5Q7tblWs+zLiUdVlRKm8US7J0kCse6kuI
	MKnOP0KLwnP3jVMPXoacIIPn51NuNzNlSrDB0tIDq8sc3patuE20LWXwVHQwGOZOgJMTfhK4fHj
	OzrvJKHHuaoYiyN/GBY1P9aGxuCjmbQnHaxH9N0tiwfEI1lEA/SO1/j0oQJFb4D6+BlOirMg2S+
	g8xTHU/UkowBjQpX1W480Go2psHLxBzBOWWdJl4s/irK58mqQXkQTfq6y6wKkuGRSsFo9WIYlYA
	sCGmFWFyqaUg4LqKJmnJPperuytQdGCSbfR1VJheAyZ3LZ3xrutLikj1GIWmbxOPAeRP/e9YIgr
	q8LO2aCPsTWa/nFCn3ehoNVkM056RxGDbrEMf4Cn6Bx5EIsH6gLInJsPDsQpsrutyU+CgDSZd1K
	47+w=
X-Received: by 2002:a05:600c:628d:b0:4a1:e01e:1927 with SMTP id 5b1f17b1804b1-4ac17d16a1bmr137026755e9.5.1793479646321;
        Sat, 31 Oct 2026 13:47:26 -0700 (PDT)
Received: from DESKTOP-IR7J1S9.localdomain ([105.98.98.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e77409821sm6564471f8f.0.2026.10.31.13.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:47:25 -0700 (PDT)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com,
	Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: em28xx: fix v4l2 use-after-free after failed init
Date: Sat, 31 Oct 2026 21:47:23 +0100
Message-ID: <20261031204723.1415-1-drifabdelmalekmohamedsaid@gmail.com>
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
 drivers/media/usb/em28xx/em28xx-video.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d486..572e6835b851 100644
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
@@ -2426,13 +2426,15 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
 		return 0;
 	}
 
-	if (!v4l2)
-		return 0;
-
 	dev_info(&dev->intf->dev, "Closing video extension\n");
 
 	mutex_lock(&dev->lock);
 
+	/* matches em28xx_v4l2_init error paths */
+	v4l2 = dev->v4l2;
+	if (!v4l2)
+		return 0;
+
 	v4l2_device_disconnect(&v4l2->v4l2_dev);
 
 	em28xx_uninit_usb_xfer(dev, EM28XX_ANALOG_MODE);
@@ -3129,6 +3131,9 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		vb2_video_unregister_device(&v4l2->vdev);
 	}
 
+	/* matches check in em28xx_v4l2_fini (under the same lock) */
+	dev->v4l2 = NULL;
+
 	mutex_unlock(&dev->lock);
 
 	/*
-- 
2.43.0

