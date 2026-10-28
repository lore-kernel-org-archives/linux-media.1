Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186537;
	b=aZ8H3ptvTyjPl4YcsFKGb8ORY5Vi+q5Sba43nxGKfBt7+3tUYl1kvnVSSOIXITf3wSfH
	 UEr9m50pXBWkWGd5lSgSiuFMjN69wdTujfYG7Twn+SiMAv+Xmmt65rKZUvoCfjXZYpQqr
	 Fe5Zd7fojcDsUVZLVl1WGfMS0FDmCWziEt31VrGUnFgrKwHH+ohjU8k1lbXVPOqYYLHTj
	 r6ckpT2HXtxkSCoaaaaOPQfKjtb5abKBSBEQ2Be0mqddCpw3AW9SrcfKGZmPt/Hvqus8c
	 NBtQG11NhKp2s0HvstltumOvdtJ4YHDAIgP9vFRzIFdZec6rZVp9ytp7uXlE1gWRTUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7HveEJ2C4RUbIkJr1+d3vrT5XPh0GNrPluA7ej7bKw8=;
	b=ThtWMkDiw3nmCEyPR3SEy/mODnB2ibIuoe7gJhGddZcj7Tlax6oa897/tJK0YxZko7Ab
	 e4Qdd+O+2B+LoX61aA5mz80OZWKJpgwdm24P64nw4Bajj/x6UkFwO/9z5KwnhQ5VzYCz2
	 DgDk1hF3ghY1wpuVx9W9U1RInZ+08X9FkcyBNK+UQlq6+3wSkAsgcMVxBIEanTJb0x98q
	 i/SDyai+GMS1SvB05uqbVdeQjNoeJXujEqRUJljwpJAkyKf2kbDb+ukaTmcmAu81zqop2
	 IjmhIuMbzh0OXG7apkt0Mm/hsBGArIVVc/FwDnGqPTa+/X3QX/MR/bg0XtSY4QTwO1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FXvvWg7c;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76D0606A31D
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 11:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C76D0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FXvvWg7c
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2eac4936dfdso1707035ad.2
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 04:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186536; x=1793791336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7HveEJ2C4RUbIkJr1+d3vrT5XPh0GNrPluA7ej7bKw8=;
        b=FXvvWg7cyjsZ8/5TSFJLJVrKqw08jFQAqnklg6/EMUazs5Pl39g8Z3FPE/2sTUKN/J
         koJXODjeq1hl5OSG72+c/9U/Lh2kT/sfZA96qoS8wNYbdQ6RRgE7jLo+QEQ2mub6uNC+
         CPOhXXghOaAWR2a51WbOMTt1xTPkMU2HZT1qq3Fx+KufhekdnkjVuPVO0zpTNZmcJtN7
         cR6lkVSRh3HB11k5dGbA3+L/cVqwy9sCSV95B2dAETsaM8xTgAdOmAQRGwinsicikthR
         brctEmKmQw3RcqZvqGjiUozXVZqh6PsiN6CyXhUSCsv4UhULHJMYX71x5e3jVvzpzh0n
         wnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186536; x=1793791336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7HveEJ2C4RUbIkJr1+d3vrT5XPh0GNrPluA7ej7bKw8=;
        b=keAvkCVEcjTwkF9zDIx0SNupTonsrmLOek5KrXTrZuid2DiJQ1OWhfxDf+sS2WvdMO
         3sshancUhHwRfBPfORomgBO2HtGtlDzGCTZI6mfQuJQx6Tp6h6nxbNZ8XDAxb4DSF5vr
         oURcrgvixEGqj3OpPSxzgajeIYfxKRDLX8ndXVFDHdDvAoLDt0SCrSmnEzmpaEtltGir
         zLiIqo+BumiEMc7nAoND46WWB91xyperA2cY7KZHHM3fvndwCNRUS0Lm2Prh1lv4GbD7
         zVq+vaZ9/ZfNDFD+YpOTZH8buXgM73uZbx8fk3trviPXtz85Rbg7YSk2SoIMglOIO1z1
         qDzw==
X-Gm-Message-State: AFq9FYJ4gCcrQ3rV7Wjll43WbOHav7K++LjdkXJBkEa9YtpYNNmv0C1I
	u9lAzM5R9PYrX4eaJn1xSJ1VqyWhYgiSx3xWwVYBKjZlC+xA2vXP/beokdRnZDx2Rn0=
X-Gm-Gg: AYBFou0N8+yNY6UcAl6bA4aFUSTN4+wLqu3BgcySuwC8hci6DDSNq3E2WvBCDUPfjMt
	LAFmtb9zDjX/3svXMTTCEz/fHz7wg8vHmQm9z1Y5BnstxvauO6wWDW0wSCyrZKSfNRLWSssj7cC
	lETMfo4/5aKoDdP/SvBLkh4my+J/Nvwj9njKhZYE79dL+gEiMy/LYIoHgtGup/969dUKkDY1KsU
	w+8oe84i/CIujHM3DMyTBBSEs+VwS0w4EVRT1dEYrlG0aF8yD/WT7CAGv5O1Coz27ANkbhOgHga
	v99wA4Y0VJ3I7YIGxKIHMAC1Qoqb5V/22YovH9st9DAXzYDHFM9L0Ev2BFJpDFGGmx79yLuySr6
	ghMqd/n1ct13Mk+npBbzuD/qRXsK8LmJidJQjJxPp3Wji7ZV66xn22OkjgORJFXt8iEHPW+TkqD
	R6xsW2yBLU+kWhjJ4udUGt91kckNLFbOWA3NTwZPNqq1jnD43PUQrGWy6SoR+5lX3rXf2BhzgN8
	YDmRNGJWEaRIAJTrxuqyEUg167MNq67sg7ugJznm8dA74F4Ag4vEUxdaS5DqLRxO7r23NJ+fXSW
	lGnxA//pG5121tQaAF+6BxLTWBcv4CQFSrpR2aFcbGLVtWF53RvdCVv5KmmLQpHL6rIbKfi84g5
	bRUXgH0ls5PXstddQ460YAuftIMUNbqZLgFtx5lBIP5D5CXmBGQ9dG9ucxPKFMb88/rlgRhtkWt
	ikyWPwJlSnESHW3OTkcLw=
X-Received: by 2002:a17:902:f607:b0:2e9:5714:607a with SMTP id d9443c01a7336-2eb002be8a8mr33330655ad.2.1793186536102;
        Wed, 28 Oct 2026 04:22:16 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eafcdb52e6sm10157945ad.74.2026.10.28.04.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:22:15 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/9] media: i2c: ov7251: Add orientation and rotation controls
Date: Wed, 28 Oct 2026 20:21:51 +0900
Message-ID: <20261028112154.855185-7-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112154.855185-1-antoine.pichot@gmail.com>
References: <20261028112154.855185-1-antoine.pichot@gmail.com>
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

Parse the firmware device properties and register the
V4L2_CID_CAMERA_ORIENTATION and V4L2_CID_CAMERA_SENSOR_ROTATION
controls, as documented in
Documentation/driver-api/media/camera-sensor.rst. libcamera uses them to
place the camera and to correct the image orientation.

While at it, bump the control handler size hint to the number of
controls the driver now creates.

On the Microsoft Surface Book 2 the ACPI _PLD (via ipu-bridge) reports
the IR sensor as front facing with no rotation.

Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
Tested-by: D. Manresa <dmanresa@gmail.com> # Surface Pro 7+, IPU6 (8086:9a19)
---
 drivers/media/i2c/ov7251.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 8277e28ac645..d591b9169de8 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1512,10 +1512,16 @@ static int ov7251_detect_chip(struct ov7251 *ov7251)
 static int ov7251_init_ctrls(struct ov7251 *ov7251)
 {
 	const struct ov7251_mode_info *mode = ov7251->current_mode;
+	struct v4l2_fwnode_device_properties props;
 	int vblank_max, vblank_def;
 	int hblank;
+	int ret;
 
-	v4l2_ctrl_handler_init(&ov7251->ctrls, 7);
+	ret = v4l2_fwnode_device_parse(ov7251->dev, &props);
+	if (ret)
+		return ret;
+
+	v4l2_ctrl_handler_init(&ov7251->ctrls, 11);
 
 	v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
 			  V4L2_CID_HFLIP, 0, 1, 1, 0);
@@ -1563,6 +1569,9 @@ static int ov7251_init_ctrls(struct ov7251 *ov7251)
 					   OV7251_TIMING_MIN_VTS, vblank_max, 1,
 					   vblank_def);
 
+	v4l2_ctrl_new_fwnode_properties(&ov7251->ctrls, &ov7251_ctrl_ops,
+					&props);
+
 	ov7251->sd.ctrl_handler = &ov7251->ctrls;
 
 	if (ov7251->ctrls.error) {
-- 
2.56.0

