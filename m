Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E66351C25
	for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 07:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784447861; cv=none; b=mg/IRRq4X5gtyLytDiRZKIGGA98TJowQjP6fytn8gk3300eE3kHj4J3+UskYsAIheg1e5VmIV94Ii7rPkyjSO8ck8h7J0i0DzNOi7Jxa9Y9GwJbINRfqPu9WFY+Ty2+7IqSIV8bPCGegDGN75KgCr1fE0E9xX1zA8AlSuOvbvqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784447861; c=relaxed/simple;
	bh=ZHRVZhPzlyp+x7ruhcCcGaCk7KkIkLpi8O5C2Fboo1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eM3G3Gd8dpOgOajrCafujQqIJk+2+2x28lEndRjMwTs0WFN98chmrOFjc7qOYKBJVUYBeUP4amx+l8fKQMxGTt5jS7q3X/sENy4TUIiq0jijjbNOHDanGZlaJvyu8qqo/i3WWpx+kPTHZBpm9oLMAB6Vd8HgU0tT7kpoAv2+Nd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhe+BFrz; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhe+BFrz"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b00d083818so2340205e87.1
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 00:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784447858; x=1785052658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9QbUYJZtIOWTqXjFT0yqfZhtKIKPSa7W9f9Fx5FbY2Q=;
        b=lhe+BFrzjWiF6aYLyI3lVhU1oRT1oZws39tO1TS2FqZNeQnRwVpi4JW8VWARqs05iW
         q6rJuwdYD02yrzS1GkbDxXi/GLMhXuvF/dJ0RnHZ2+i4I+QKrKXA09WOD0Ozhsey6BA5
         JAr6wxD2NH4vJed5jDj28J83/erApld9SXbHiqr3oTgg55jdrk0sGQeEjC8vT1xE3sLx
         yIk9RIp+21edyguG8QFBaAiG5fAETUi0DBuCdla6ARxq5vY5OFXLcapaF/Jl3Avw1tFY
         syv5R/2DwXJS+HqOUylFlXoyVZHON8dvkawLE/DWBPPF0xJY8E7H1ylMYHxxRzVsu/0M
         E95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784447858; x=1785052658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9QbUYJZtIOWTqXjFT0yqfZhtKIKPSa7W9f9Fx5FbY2Q=;
        b=hPnfOG4laauX99C33TGg3OWv1NqlJEPdxqD/rXhWBrUjQ+D4YE/SSKKsTQQrJofplJ
         6ivivFIm+2e1IRoIDt8V4ZsgMT3X1wtmSZXrIEdRMPzfYqo8NSy+Iqmj2udVJaBGukNs
         NcXqrWnrw4ZaAfwZplNy+NOdtBF1Sqssgx7YYSSjJwtnSUAiPSHUrA/KSg/0u2LuVY9v
         f7IAA3ZTGVwakFX96zLfjEmlPwKM5leLZeU7TRmZ9bTVo16VOA6n4wGRRI3ecr4/xIuQ
         Hst/LccyZSYzJWVOw6alI9YeBIWBZhn23e/+9jxDui5SybuBKsi3dRKapBNRDMxzF73r
         e5aA==
X-Gm-Message-State: AOJu0YwMSiHxLB2ilaiHFGnQV/hGB24JD8ceM/Xn0gKNCZbPYcr8wJI5
	CDYZ9iwCIE2BMS9iWwwPKEhLpfcBQlquwOGdTRmq3AgZlMzHUVccbGjR9UGG78KE
X-Gm-Gg: AfdE7cl2F0/Dge3RxrQgxRNuSUyuSbbn4YD0ZcXXo9c1ygktIpMx651eb6qipCp1cc7
	WTCuH8d/ZEiiZxZqd9s63yE7TlVDG5o13dl1M5lSSwTIksIREvxehnvs1iWD5q2MzyyQFtkQ80x
	sFJn9AhlfmY100S4ksxp/9mbgDrgQ0Le/CiJVKvEwoBgIpD+um+FXZTv1zxEoQRLy1U04dHBslB
	BRI4xeA3bYCknTy1qbvMJn59088+iPSF8wP/dky/oVfCiZnPc1o1lacUb/8I5kXC4hQX9Nr8dtX
	ObalpGaIIx2ymMbEuuYlQ4Ba47mHNklGdr96MenuZUK740aN8Ew92ap7UYa8gclfXsBb0mf8JL7
	ByHnkI8u4qX9NtQiUJXW/Id83eOGSUq3onUWWucjEoOzEFb08wabgFAGwqUCDdr6K5s+mzgC5dX
	maTstfMnc0CPiFbITcQFID/+q0csHgXMnFTK4dBG+KiJ00ZOZWlMIHls617ZQ=
X-Received: by 2002:a05:6512:6412:b0:5b1:5e19:c496 with SMTP id 2adb3069b0e04-5b28a17760bmr2314551e87.14.1784447857959;
        Sun, 19 Jul 2026 00:57:37 -0700 (PDT)
Received: from thinkpad ([5.212.61.200])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e0e926sm1604207e87.54.2026.07.19.00.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 00:57:36 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	linux-sunxi@lists.linux.dev,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v5 2/2] media: sun6i-csi: capture: Implement vidioc_enum_framesizes
Date: Sun, 19 Jul 2026 14:57:14 +0330
Message-Id: <20260719112714.72802-3-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260719112714.72802-1-arash.golgol@gmail.com>
References: <20260719112714.72802-1-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Report the stepwise frame size range supported by the CSI capture
hardware for the pixel formats exposed by the driver.

The hardware does not perform scaling and accepts any even width and
height within the reported limits.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index d90abba21309..e17c7f82ff47 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -738,6 +738,33 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
+static int sun6i_csi_capture_enum_framesize(struct file *file, void *fh,
+					    struct v4l2_frmsizeenum *fsize)
+{
+	if (fsize->index)
+		return -EINVAL;
+
+	/* Only accept format in map table. */
+	if (!sun6i_csi_capture_format_find(fsize->pixel_format))
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = SUN6I_CSI_CAPTURE_WIDTH_MIN;
+	fsize->stepwise.max_width = SUN6I_CSI_CAPTURE_WIDTH_MAX;
+	fsize->stepwise.min_height = SUN6I_CSI_CAPTURE_HEIGHT_MIN;
+	fsize->stepwise.max_height = SUN6I_CSI_CAPTURE_HEIGHT_MAX;
+
+	if (fsize->pixel_format == V4L2_PIX_FMT_NV12_16L16) {
+		fsize->stepwise.step_width = 16;
+		fsize->stepwise.step_height = 16;
+	} else {
+		fsize->stepwise.step_width = 2;
+		fsize->stepwise.step_height = 2;
+	}
+
+	return 0;
+}
+
 static int sun6i_csi_capture_g_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
@@ -805,6 +832,7 @@ static const struct v4l2_ioctl_ops sun6i_csi_capture_ioctl_ops = {
 	.vidioc_querycap		= sun6i_csi_capture_querycap,
 
 	.vidioc_enum_fmt_vid_cap	= sun6i_csi_capture_enum_fmt,
+	.vidioc_enum_framesizes		= sun6i_csi_capture_enum_framesize,
 	.vidioc_g_fmt_vid_cap		= sun6i_csi_capture_g_fmt,
 	.vidioc_s_fmt_vid_cap		= sun6i_csi_capture_s_fmt,
 	.vidioc_try_fmt_vid_cap		= sun6i_csi_capture_try_fmt,
-- 
2.34.1

