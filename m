Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266085;
	b=tl50o/7LPGlnXnGLq+GiQ9dIp+QE0IgTnHB9X23C53dmy5irA8H5a6/raaXeN11XLHQW
	 h6z5ddE9qAXRXsuKTo3iNrN/7D5fqpATYFTTorhYJn3PTeRAynmznYtvgTb84xJaOXN3f
	 tM1PqFSfC824+HAs9Mwqa53xZn8MHHsgwmepkf1uzovQVFAOx6YbU11gYhrZxTNBC9OGq
	 ySzf9aWzIB/lK5kpN2B9W2238+JM8Fma/kqrR4Riik0Lun/q7gy55r9ml/OU5gVZUdTpf
	 yMEm4m2glvG9NFYC4JMw4mMaePGKwlchUfVkKtTj3XaM4O0O5X9h3/wd8dOOFKQ6T2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=gv50Olcyh23cLGtHw+qLU1M2dxl4EP1oJehM+5D/N7E=;
	b=ZMTk1QCovjs3t4daSpZJnj0NejCXrmZdHi844IifPKai8l5ZAiaI1Kbw2Tt8sMEoVMeL
	 PxF/f2ZzBYPGXJPszxwPBkjfDfFJrpESuktXzbGWrmQcOzrjKiOzN1Us8sBzGqaYBdlYI
	 zDAp8Upm91eXDHsBp8g2kYzwol0jLGmMTiweysraRfEUXZK/I5BerYsGPYhSPk3jvHneO
	 kMk7NUhpYQTFY74bugseJdiHmNpP2Vztg9lgLsdiVM7GmAIiYf+JqLUSoVv5qvVmCjn2l
	 /H87pzk90E+/pQGS1Esb87V8NoA6YADASUiJpQ/6YtsYFTgcHw9/TCP8JmUQJVF2oEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uNLgluOC;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595CD606A338
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 595CD606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uNLgluOC
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso12965285e9.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 02:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793266084; x=1793870884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gv50Olcyh23cLGtHw+qLU1M2dxl4EP1oJehM+5D/N7E=;
        b=uNLgluOCoeu813gY5/gDyMYCkcEJgXRjN41Enyh8h2WNlSN9kpwfrm5+YCYtxTLqan
         o+JILRVqinJK8kOpLvB0DIQjYJzQeJfDXWFkGLQ3Q8FkYEuDHjI98nEKgmdBqhSfGokx
         zxZtAu6nYQHjhMQnMASaAwm2t/GaLP73E6VOPIi3fCtmGOa6Q7kgn178m4MKPV4cja9+
         BuwJII40PKoPOqH273vUKKqof1bay5QL28/QiOiuv4kQJFY5QZ1N9Bl6cWCq5kXvPajD
         RTwS8Vdj8CCmsvdiYF0wytSovBUG2JHPu3d/vaaWFqCB+XlpA3gAb6PZs3L7ejzv9Nxh
         p/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266084; x=1793870884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gv50Olcyh23cLGtHw+qLU1M2dxl4EP1oJehM+5D/N7E=;
        b=Yl6kcgo6UGvWiun91d+I7Et5WBRXzi2UEl9uGaIl8pVtYCZLC9+rKDZqtlncGR6g6a
         dE+3KXtC5t5W/UfhPpncQkf8rqzzYdWgZEf7dJXiCW3CYAUOmepw1XGOewYm/zSXL8ka
         /eWYcj+p0gYQMsGi0rX254Lov5Q0FUJq2nDFd9cdwiEEl9IDKG1UveGHMkURHsopZN5Z
         fCsMS6OjvMJW0O4o8Q7UBDe3eDdG2uyHlB30NkZmydFechMxuK6FkjKCoDKSKAfwm76t
         cYUiLggY8bGS1ZPFQAAZZzdRbqdYyLx0zHkPwldMBvmHYgKMoTqhXoS7cFc3/6fpn0SR
         8ERA==
X-Gm-Message-State: AFq9FYIGDULOX38NQG/pbfx/S5e3xANP+/5wU/V8Agey5EAXZ3DupySg
	Y9o54mjBlkP9tgqA8kXt0cfI8sds96uO8BpPQVmnVjGCwp+dl2Jfz/qk
X-Gm-Gg: AYBFou0qEp3m10+c77pt7T8Stn7BRKS6rlMStKy2UuL4XSCq3Gz2A0Z2Rr8rGNHBvo/
	x0dkoqF7rUdhpzXH2t49k2hUpVAZcwuhlECXP7kqncct+PTJMcxsPTUFAkkwwxl7RHnrtRbK/tE
	ti40vtbnyZy9c9aZ3rx4WhdpN6KAR5bTNgcc2f8nNIQIfp3jKshnR9FC4b5B2OzlrNEZYL/JpgJ
	7xAylHXQmLrGsmE75er3sXRN5WuMCw+DRwGGYEG863t4nzQ3i4MeL4f6MrKAM0AOYnCyLubSXrg
	RxdGBu3l4GDwiDGoS8dk34btG13qW6B6TkwNGBjqRnqvDgBlTjFymZUkGhqfMplfM5/EH/qU7j6
	sCC+3b+Ufx577UD4VX1UVofUgQU+FBSaOfOh/QWqJfj3Zs/yvRGMl0qzBVSxSaTeHXBdYOMjDm6
	/4hKe1CqGq/AP8F9AxR/SwP1S52WlfDq6rL34hOIdFvqkprB6omIV4Bn2RFydhIl8e5UeViAiJG
	vp/x3UI0YlNm2xsh3znIyEIZ58FVButJEaVhXf4r8xFM0yQqFSdugiRHadtHd9Ij+j0IORUE0pi
	D7aqMPYDpQTMO5LkbkxXfd4VDTzR4SkKcQMxEqqKRQeJVKMAjnVCOe6k/PoF3fi8h+7Krd/mK/f
	SC8jrzCFdHN+0X14fBddXXriF6/85xjRFjfisDKVVLYNhRFeowUrioC/1oZVBqtZC3Sze
X-Received: by 2002:a05:600c:4f4a:b0:4a3:5c67:55ed with SMTP id 5b1f17b1804b1-4a966c40261mr101368175e9.12.1793266083715;
        Thu, 29 Oct 2026 02:28:03 -0700 (PDT)
Received: from PC-Marco.local ([151.59.117.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm50821065e9.11.2026.10.29.02.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:28:03 -0700 (PDT)
From: Marco Ziliani <rylos78@gmail.com>
Date: Thu, 29 Oct 2026 10:27:53 +0100
Subject: [PATCH v2 2/3] media: i2c: ov5693: Keep the Bayer order when
 flipping at full resolution
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-ov5693-fixes-v2-2-2526d7b13030@gmail.com>
References: <20261029-ov5693-fixes-v2-0-2526d7b13030@gmail.com>
In-Reply-To: <20261029-ov5693-fixes-v2-0-2526d7b13030@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, 
 Tony Garcia <tony@loafecho.com>, Simon Kruse <simon0x+git@proton.me>, 
 "D. Manresa" <dmanresa@gmail.com>, linux-kernel@vger.kernel.org, 
 Marco Ziliani <rylos78@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793266079; l=4414;
 i=rylos78@gmail.com; s=20261027; h=from:subject:message-id;
 bh=c2JXLazU12+3pgQEGqbk1oCR+N8hqQzt7tcW8ttLxNQ=;
 b=FPq29hBvMUTozAtKGykwQWWVYA2i9FPUvMYhExm+jNr6p9p+OM9FdTR8kVDVsWAImkZYo/0Um
 Q3lw/lsnlO9Dp8PNugZhvvCQUxw95yNBPLwXn17oBt5Fb9MOf8Nukqd
X-Developer-Key: i=rylos78@gmail.com; a=ed25519;
 pk=nXCfiK5yExPZCMp+lfKif3gdXkfjkUK2qk7bDW+ixMo=

In the full (unbinned) readout each of the horizontal and vertical
flips moves the Bayer phase by one column. With exactly one flip
enabled the CSI-2 receiver gets GBRG instead of the SBGGR10 the driver
reports, which gives a magenta and green image; with both enabled the
two shifts cancel out.

The crop start is only honoured in steps of two pixels, so compensate
by shifting the output window by one column when hflip XOR vflip, and
widen the crop by two columns, within the pixel array, so that the
window still fits. Reprogram the window when either flip changes. The
binned readout is left unchanged.

With this change, raw 2592x1944 frames come out BGGR at all four
hflip/vflip settings on the Surface Pro 5 (IPU3); the same change in
the linux-surface tree gave BGGR at all four settings on a Surface
Pro 7 (IPU4P) and a Surface Pro 9 (IPU6). Without it, the order is only
right with both flips off or both on.

Fixes: 89aef879cb53 ("media: i2c: Add support for ov5693 sensor")
Link: https://github.com/linux-surface/kernel/pull/181
Tested-by: Chris Simpson <chris@nilk.net>
Tested-by: Tony Garcia <tony@loafecho.com>
Signed-off-by: Marco Ziliani <rylos78@gmail.com>
---
 drivers/media/i2c/ov5693.c | 56 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 48 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index d09095c3e..9fedc087e 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -361,6 +361,49 @@ static const u8 ov5693_test_pattern_bits[] = {
 
 /* V4L2 Controls Functions */
 
+/*
+ * In the full (unbinned) readout each flip moves the Bayer phase by one
+ * column, so with exactly one of them enabled the CSI-2 receiver gets GBRG
+ * instead of the SBGGR10 the driver reports; with both enabled the two shifts
+ * cancel out. The crop start is only honoured in steps of two pixels, so
+ * compensate by shifting the output window by one column instead, and widen
+ * the crop so that the window still fits.
+ */
+static bool ov5693_bayer_shift(struct ov5693_device *ov5693)
+{
+	const struct ov5693_mode *mode = &ov5693->mode;
+	bool hflip, vflip;
+
+	if (mode->binning_x || mode->binning_y)
+		return false;
+
+	hflip = ov5693->ctrls.hflip && ov5693->ctrls.hflip->val;
+	vflip = ov5693->ctrls.vflip && ov5693->ctrls.vflip->val;
+
+	return hflip ^ vflip;
+}
+
+static int ov5693_window_x_configure(struct ov5693_device *ov5693)
+{
+	const struct ov5693_mode *mode = &ov5693->mode;
+	bool shift = ov5693_bayer_shift(ov5693);
+	u32 crop_end = mode->crop.left + mode->crop.width;
+	int ret = 0;
+
+	/* Widen the crop for the shifted window, within the pixel array */
+	if (shift)
+		crop_end = min(crop_end + 2,
+			       max_t(u32, crop_end, OV5693_NATIVE_WIDTH - 1));
+
+	/* Offset X */
+	cci_write(ov5693->regmap, OV5693_OFFSET_START_X_REG, shift, &ret);
+
+	/* Crop End X */
+	cci_write(ov5693->regmap, OV5693_CROP_END_X_REG, crop_end, &ret);
+
+	return ret;
+}
+
 static int ov5693_flip_vert_configure(struct ov5693_device *ov5693,
 				      bool enable)
 {
@@ -373,7 +416,7 @@ static int ov5693_flip_vert_configure(struct ov5693_device *ov5693,
 	if (ret)
 		return ret;
 
-	return 0;
+	return ov5693_window_x_configure(ov5693);
 }
 
 static int ov5693_flip_horz_configure(struct ov5693_device *ov5693,
@@ -388,7 +431,7 @@ static int ov5693_flip_horz_configure(struct ov5693_device *ov5693,
 	if (ret)
 		return ret;
 
-	return 0;
+	return ov5693_window_x_configure(ov5693);
 }
 
 static int ov5693_get_exposure(struct ov5693_device *ov5693, s32 *value)
@@ -566,16 +609,13 @@ static int ov5693_mode_configure(struct ov5693_device *ov5693)
 	cci_write(ov5693->regmap, OV5693_CROP_START_X_REG, mode->crop.left,
 		  &ret);
 
-	/* Offset X */
-	cci_write(ov5693->regmap, OV5693_OFFSET_START_X_REG, 0, &ret);
-
 	/* Output Size X */
 	cci_write(ov5693->regmap, OV5693_OUTPUT_SIZE_X_REG, mode->format.width,
 		  &ret);
 
-	/* Crop End X */
-	cci_write(ov5693->regmap, OV5693_CROP_END_X_REG,
-		  mode->crop.left + mode->crop.width, &ret);
+	/* Offset X and Crop End X follow the flips, see ov5693_bayer_shift() */
+	if (!ret)
+		ret = ov5693_window_x_configure(ov5693);
 
 	/* Horizontal Total Size */
 	cci_write(ov5693->regmap, OV5693_TIMING_HTS_REG, OV5693_FIXED_PPL,

-- 
2.56.0

