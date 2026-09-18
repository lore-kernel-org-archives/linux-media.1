Received: from mail-qk2-f6.google.com (mail-qk2-f6.google.com [74.125.230.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D9A3B42E8
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 22:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769270; cv=none; b=tYYLCK/ke97EQgE3+2RKNq5wwGICEHvzTCt9bf2+d8zMRtMHJQ/mAHY+BzngUP2yCPbHnWOweHTz6Nm1hcjYMXTl4a7HhcpwtOJSCfYs+XIUt35oYMxyo9a1Ow75cyZBUHxEwKvhHJlKg9AwBKwjwRE99eGnNogf6Da3dRUfO5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769270; c=relaxed/simple;
	bh=Eigm0fQw2qgUBKDDTtXVjCoe6eTezJyeT/4KdAwHvDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KYnnwX3wWGLW7hGENxKZi3T6ZVaxfMHFOV7pl513ANPBG4H0+z7Kdn0diDtV+uZIpLrwgQkLU/9qkzEZVNdknJ3h88AsRGDRU5PLlmwbJArKvDDZOggowGG5R7x5kINyxAmU6x0n/0HCbpKltYcBCAvgbU/Yh4CwhFLBtZRac1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BidoGuaX; arc=none smtp.client-ip=74.125.230.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BidoGuaX"
Received: by mail-qk2-f6.google.com with SMTP id d75a77b69052e-52fa263dd47so7774981cf.0
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 15:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789769268; x=1790374068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n2bkwkwkaWWCi1cIo9w4jtLW4D49/2kOiQh/YFzTqig=;
        b=BidoGuaXeBw+NU5KQzrz9t43TptB0EWNgc8eQVAjQIMjCv5aT5BtKdLchXQ42knCHq
         q8eOcnLPPpwYjIPDCLcPkW69vrSW+J5GG27gSFelHCjDJogeWuo3OFYzJACfbgNQDZi8
         I9sbvD3DO4dn0AkSUsB61X4rz2qpBpk5Do2XrinHTDSjKBH57RJsz+qyPUc86kfBT1N/
         kaF+Y5KCbbvZR6YXrM61F+NcoNtmxAaX4k9V261CQteHiIFV9+7AL8DvCMj5tgQ1TdUC
         Hu8cxz02uTnWxloA5ybo3EcYpzJLKDUMikqNnuEMO0qVu7uc0AQ++46mTSGK0P6gNJ0x
         dyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789769268; x=1790374068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n2bkwkwkaWWCi1cIo9w4jtLW4D49/2kOiQh/YFzTqig=;
        b=Fwv877ET10pOlIpUAD9S3yVXUte4p47s/vtGdEbyYT7m3JOwWz6dsJ2F/ETJSjcyPP
         74y2JiKSq6+KGRgg6CrvLM1qInr7/uaBK2NsLhRtNekIb6j3kHOANyFkHti6I/SDPn10
         sAxUN8KQR6VW4EuvqgomK889WdF8jC2ag955OczVJINDDnEMP9AqMa/UdnJ6pV36Zps3
         M4hm4CdrP9H5yRJI4JkuyOp2popMKser2VaaJi4oJcjiq0QfHYrj9APBZDdIO3R9FWpM
         q1bfPOFpTmQRoyCf1VwJCViT3qLfuZyI9+LWAELNNASif1ST2iVtT/iR0MPCeZTUV1i/
         C2Vg==
X-Gm-Message-State: AFuF++lkDNSNyYq9eKatG6vYC0vn+MCewJP0MpX29TBHRctwfZwZFAC0
	Wx9kH7KHzmhwVy8tUOM8QO5D3fXlJDYiY/hgm8AB7keY/Ny11sX5pjWcxl9QEQ83hcAPmQ==
X-Gm-Gg: AYBFou0OJl/ZNDFsm8LCmUJ7mnLca6RcSGkDMO3bwvDsj4/XhNTFY582dV4IzGqSw4o
	6e4/rRl0OVO6mGJfzL6eBBoFCzq8TYVhWrEB+xu1NKGgZO9N4U2ncQKhu05zV1z6gxkoE+hYzSy
	VT6y9PnD4Hv0ZScwW9c092eno9PbNGsgceAb9AIICb5XWEynW3kgKQ+dHvHS+lUc0SfYl70ML22
	wC0x9HOVYDD0GUwxqocCc2huJvWcqziHOpYO4YTcPDmnTValhUvp+7eXil4XUry0J6M2G9+SzMx
	DO4i2llIl25UqbcLc4UayiN/nMnKGE1tBwPUuhqSnwxsz+lJVXTNX2HPrJvo1dNuaDgKP6A+N59
	KshO1wZKCCgTDASTESb/uTOCDZKrfGnBmKrHBm9hZh9KZwPKDQrCZ04M/1pUh4BqpFUjldSo8x+
	ziOZm3IVUANPIbPo3ED7OrwCWJ2HXS6KF6b8aM+7J7WohPVd1TsL4V2uOt1h0X34iUw8YqTc4cN
	MtKYAJUjgKRs3XdDwlugPpwD0vujGTVHvdF33z6HimX
X-Received: by 2002:ac8:7d08:0:b0:51b:ecbb:206f with SMTP id d75a77b69052e-5329e2bf30dmr63462291cf.32.1789769267701;
        Fri, 18 Sep 2026 15:07:47 -0700 (PDT)
Received: from Interstice (pool-96-239-109-94.nycmny.fios.verizon.net. [96.239.109.94])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae5f2643sm6974991cf.6.2026.09.18.15.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:07:47 -0700 (PDT)
From: David Wood <d01.devel@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org
Subject: [PATCH] media: em28xx: complete frames from non-interlaced sources
Date: Fri, 18 Sep 2026 18:07:42 -0400
Message-ID: <20260918220743.2043647-1-d01.devel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Non-interlaced 60 Hz sources, such as the 240p output of classic game
consoles, produce 262 lines per field with no half-line offset, so every
field has the same parity. The TVP5150 tracks such a signal without
trouble (locked, 60 Hz, vertical line count 524 instead of 525) but
reports the same field ID for every field, and the em2860 forwards that
in its field-start header. On an EM2860/TVP5150 reference design
(eb1a:5051) fed by a NES, 112 of 113 consecutive headers in a 6 s stream
carry field ID 1 (bottom); the lone top-field header is the first one.

finish_field_prepare_next() only completes a buffer and starts the next
one when a top field arrives, so with such a source no frame is ever
delivered: streaming starts, the first buffer never finishes, and the
application sits in select() until it times out. Disturbing the cable
briefly loses sync, yields a stray top-field header and lets a single
frame through -- the "one frame, then it freezes" symptom.

Track the previous field ID. When a header repeats the ID of the field
before it, give the new field the opposite parity instead of taking the
ID literally, so consecutive fields are woven into a frame the same way
a genuine top/bottom pair is. Interlaced streams alternate IDs and are
unaffected. A dropped field in one now lands two bottom fields in the
same buffer, which the copy path already tolerates, and the following
top field starts a new frame as before.

With this the NES streams at 29.9 fps with a stable, correctly woven
picture. Each frame holds two consecutive progressive source frames, so
an application that wants the source's 60 fps back can bob-deinterlace.

Signed-off-by: David Wood <d01.devel@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 26 +++++++++++++++++++++++--
 drivers/media/usb/em28xx/em28xx.h       |  1 +
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 5f13f63..5b570a9 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -627,6 +627,27 @@ finish_field_prepare_next(struct em28xx *dev,
 	return buf;
 }
 
+/*
+ * Set the parity of the field that starts with this header.
+ *
+ * Non-interlaced sources, such as the 240p output of classic game consoles,
+ * generate every field with the same parity, so the bridge reports the same
+ * field ID over and over. A top field never arrives and no frame is ever
+ * completed. Detect a repeated field ID and alternate the parity instead, so
+ * consecutive fields are woven into a frame like a genuine interlaced pair.
+ */
+static inline void em28xx_set_field_parity(struct em28xx_v4l2 *v4l2,
+					   int field_id)
+{
+	bool top_field = !(field_id & 1);
+
+	if (field_id == v4l2->last_field_id)
+		top_field = !v4l2->top_field;
+
+	v4l2->last_field_id = field_id;
+	v4l2->top_field = top_field;
+}
+
 /*
  * Process data packet according to the em2710/em2750/em28xx frame data format
  */
@@ -661,14 +682,14 @@ static inline void process_frame_data_em28xx(struct em28xx *dev,
 			v4l2->capture_type = 0;
 			v4l2->vbi_read = 0;
 			em28xx_isocdbg("VBI START HEADER !!!\n");
-			v4l2->top_field = !(data_pkt[2] & 1);
+			em28xx_set_field_parity(v4l2, data_pkt[2] & 1);
 			data_pkt += 4;
 			data_len -= 4;
 		} else if (data_pkt[0] == 0x22 && data_pkt[1] == 0x5a) {
 			/* Field start (VBI disabled) */
 			v4l2->capture_type = 2;
 			em28xx_isocdbg("VIDEO START HEADER !!!\n");
-			v4l2->top_field = !(data_pkt[2] & 1);
+			em28xx_set_field_parity(v4l2, data_pkt[2] & 1);
 			data_pkt += 4;
 			data_len -= 4;
 		}
@@ -1099,6 +1120,7 @@ int em28xx_start_analog_streaming(struct vb2_queue *vq, unsigned int count)
 		em28xx_wake_i2c(dev);
 
 		v4l2->capture_type = -1;
+		v4l2->last_field_id = -1;
 		rc = em28xx_init_usb_xfer(dev, EM28XX_ANALOG_MODE,
 					  dev->analog_xfer_bulk,
 					  EM28XX_NUM_BUFS,
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index f3449c2..dc732f6 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -588,6 +588,7 @@ struct em28xx_v4l2 {
 	/* Capture state tracking */
 	int capture_type;
 	bool top_field;
+	int last_field_id;
 	int vbi_read;
 	unsigned int field_count;
 
