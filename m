Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821110;
	b=yuTevWZc+YKh7xZDQxhzzPtkpltgF3cwuQnMIDUpow4hdmgg83lE7Voos8gQPAHt4zEB
	 yzkVIGreL/UIunV7D2oEEK/dbRTy9mqb+/ID/pYQxGaSsAftALQNptY2PSLBZBuEFkMOv
	 IJ4f9fABDx0wspxJct5E8J4dnZVkFIY4+JjSvU9ulD3IvAE2Yq7VCznmIWHxuhIgbQ6ld
	 KYhhgUtuCotftbtCBw49zycbEvx8tPSNPxVyq0h5f42XFUyCuynft6EwVWtiVH0mWY11Q
	 u33aoU3HZ+M0lRCUqu4VihvX6zHnl5ShwRG5BmRjyLFLYAWrU9GdF1TcjPQ0tW8DZsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Wdeeq1IL32ANpLr9zkePTgLUPcdx1odsAmb4tfAHis8=;
	b=NvFaXzBo7xo55XapYjlYgCZCfk5vbXcWbV7BfKhts7l/1Ep+qaCY2KYVgLIkPAqcerON
	 DNUSPRMylXBKVG2f0SGEatll8HMCyUlhJLZUVp7Iah/0XgR3BrlEQjrYCZcIFzw5IS+mW
	 sTXXjMAwIcqwMZLhI5vokBSKW0Zxh3vM3vgTAW35iHyoD4G8cXd0gUkqyjwBf+ni5DJA3
	 Gf3lNOdHd18MCXf220Gd7sawiiwdEi3276e4AeJEE+vt4zUi8UkQJGxhjIJp1v7tOLMcv
	 N2BRwxT4MtYTpmXazZRtJMHJ5G/vjmjQKgan5j4qJsGtQDZ2ZBn2FG3F1udYOzkUcDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IHQ/4VeI";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA67606A680
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 23:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDA67606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IHQ/4VeI
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so109806245e9.1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 15:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795821108; x=1796425908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wdeeq1IL32ANpLr9zkePTgLUPcdx1odsAmb4tfAHis8=;
        b=IHQ/4VeIqm+kKIKaNrzLTFc7ztwXHmE/In4v9n+4GFPBsruFlokAuz5tjup4DDQ3KR
         a+oaUb3GDTX5cCWuV7WZxKw084T/mEDOYO5YRsE8hQZFnXXdT2VWAUANkwhYpsFK2Xmm
         Hncw1baZ8YRYVBupcYw15QpNo62ud0Sgx9B2gmzCBgWCHL2oOLH32P5W7plFOZvMbRFz
         WtUoEfk1JYcKRNGzhPpe5vfcj7HP7H9kMVzhepqkwUSYWw6INZzICAGNt99zfq1CO4a1
         1GyIvHe68snad8023sPYEjyk4ylADi2F5YJi8xN7hqL5eyrkZlgnju49a7KJNFhs8mNc
         6ESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795821108; x=1796425908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wdeeq1IL32ANpLr9zkePTgLUPcdx1odsAmb4tfAHis8=;
        b=CZgyHmoRff3sSdNVTEgnWd9Xy5AbItReP3+xVBsJD+7+CXoo+xAp1UAaTos/82q0p4
         2EhshoHvWKgAx4s28hiO7cV1XZdFtNtdLv/hwOmCk2YhabfnlI2kV3iUAYPllURB2YCP
         1e992hsYiUPjloEvVfvrz21DdWeJ7uv1BsDWKAR1Yb8p+IPlYmtT8AGsoIdcCt0PiyTq
         v3fgwjBoNGmuuwaoiYm8aLUye/ZGpuBVn09cpdTEOl0yl1w2te8n1MqLKLRoF4zyf+Uw
         1yIApxwFJ3Ei23vMzfIw0PZ0i5y8k9PRIry4hp57z44DlSApMESRrOEnGrYhaAgNO3u/
         m8BQ==
X-Gm-Message-State: APuU4Z/bkACzdIwaVnH//NLqRg7Gcu8c8wUN0os8iaGf0O4ayoHWTjGt
	COqGQszAE2OxyPiW9YnNgDCUL0MSOdY4EU3sSR46Zy5D3NiGmtYaX/3K
X-Gm-Gg: AZFdTZdz1Ph9Brro/hfv8/ELkpOnWzALI5tK4nYFbSr6Q5Ic7RzNaYlFuKIJMeV/Unx
	82fjbeV9GRg59uwAtwkwKU/SPZ30s7PTCXaFOi6C++vW7BlEzcMmbpgoeBNBlyegOVNNY2ITv9U
	j3Zl7mX7i9t30dAtu2lmIrkVA1d1jAyF1XVqZaJm1EFmSFjmw0rK50OekGHOU43TAqwkfZxEFJH
	IHiw8mO/aoGCqfsNMHAcyuOfzH6pYopzhmgkV8vG45JhmWyQhsLwGAVjsp3QeeP/324b924Ig6n
	zF0d8mk8EwG+ECqXIeVOKQoJzeYHvFibaC/F+OLPyTBbBeHXh9HcWRWX6atSNjEZXJm7Xh4KAi/
	5cb2SxIPg/es0AYcnmw0ng27iIdSR2dAMRxMl0+ZthbZ885eppueEQSyo0f7dGJCvezeF9brlFY
	i3AhH3ksxW3roTfkzdi2nBlwoi9KYtskKnnKrKF8G570+gl+P6nurs79PsXFhOD6vz0RtHAPpX+
	juZtj5/WKZtROymlFNlKRg0tIT0ClgnEqUgbSutnSK0dUiQN/fCSnhYeIkkFXetphwJtmlDTTOi
	Sj+3vIWKs+0C8lETicwWe9HV+BPpC+CNN83nKxj/vGQtN0VM9A8IYkj9pZAq6FYVLUnMe+797KD
	8XfqMZ5QUsFT50cZAdtm91KVRBj690zOPX1k76eNVRbLrxDPtgUsF7TR4A0rMo1LpCSY=
X-Received: by 2002:a05:600c:4504:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb887fc396mr532920035e9.3.1795821108259;
        Fri, 27 Nov 2026 15:11:48 -0800 (PST)
Received: from PC-Marco.local ([151.59.46.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm600062645e9.9.2026.11.27.15.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 15:11:47 -0800 (PST)
From: Marco Ziliani <rylos78@gmail.com>
Date: Sat, 28 Nov 2026 00:11:35 +0100
Subject: [PATCH v3 3/4] media: i2c: ov5693: Keep the Bayer order when
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
Message-Id: <20261128-ov5693-fixes-v3-3-bcdd169958b6@gmail.com>
References: <20261128-ov5693-fixes-v3-0-bcdd169958b6@gmail.com>
In-Reply-To: <20261128-ov5693-fixes-v3-0-bcdd169958b6@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, 
 Tony Garcia <tony@loafecho.com>, Simon Kruse <simon0x+git@proton.me>, 
 "D. Manresa" <dmanresa@gmail.com>, linux-kernel@vger.kernel.org, 
 Marco Ziliani <rylos78@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795821102; l=4414;
 i=rylos78@gmail.com; s=20261027; h=from:subject:message-id;
 bh=MDJ2pUMEH9krmBt9BTvtRbT2jFwIEfo5scQTlWbx4JI=;
 b=JnP1DR0C0FxBcnM9Eyp5wtAnrYPNzSnsmVjIk32ls0hcQaKg8bTMyTXds5298zGW3LI+m/uYn
 XSEwTSIDxBNB//VSPmtHNAmFMhhQSTlrJ7UJMAlBrx5ckgTHVCzXZQt
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
index 3cab73b89..6e76e289f 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -367,6 +367,49 @@ static const u8 ov5693_test_pattern_bits[] = {
 
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
@@ -378,7 +421,7 @@ static int ov5693_flip_vert_configure(struct ov5693_device *ov5693,
 	if (ret)
 		return ret;
 
-	return 0;
+	return ov5693_window_x_configure(ov5693);
 }
 
 static int ov5693_flip_horz_configure(struct ov5693_device *ov5693,
@@ -392,7 +435,7 @@ static int ov5693_flip_horz_configure(struct ov5693_device *ov5693,
 	if (ret)
 		return ret;
 
-	return 0;
+	return ov5693_window_x_configure(ov5693);
 }
 
 static int ov5693_get_exposure(struct ov5693_device *ov5693, s32 *value)
@@ -570,16 +613,13 @@ static int ov5693_mode_configure(struct ov5693_device *ov5693)
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
2.56.1

