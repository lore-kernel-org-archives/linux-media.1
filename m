Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88068420E89
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 11:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150700; cv=none; b=OgIgknJzgdgMQNlk+eDyGXjmzOCCVyhCQ7C0rUF4HSo/GQxhmIbjrN7r5mcLX9OSkeg6Za6k+HYIVgy1hSQiGOXth+8EYNuBAi+8rbmNh3xkZEULdMsb7BS8zIRQ1kd40W6MhbIyS4Gz/lX8kCx8+/sfKz374atrogbdmwNSFx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150700; c=relaxed/simple;
	bh=VoUuUGfUoUaoTTo2wGAmG1gaSD9/V0C+2aX5k0YX2Fc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ixkAKeG+vJU78BpHKMQ3BgWKmjhJIyL/QzX6pjpJWNo9xKvueWaXL0bUnJSQMfXrxdm9LbNs7as+aPDYQDghXDgrX4Uj6O6zD0+6wx/N3+2HrqWwN4sme7VuvFSu2dvkbkUy5BdygogatGIl6/pWTBRjJJUIEvqbICmpCiqivZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpyiSXze; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpyiSXze"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a16c399641so60957105e9.2
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 04:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792150696; x=1792755496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HE4aOaMM6rfgfLxamiGTUaP3vk+wjNz3+/pqgNF8zrA=;
        b=LpyiSXzehV0s7ekyWU14ENjDtOrVMwT68NCOVHRILVLb/uEoOheV6QsSQKb+1Tyw74
         b+PhrCktm9OM+CR1JcXn6vWmwW6qmXf02iHuGSQGiNDW+EWBUTy+aDPyLuG1vNBoWsFt
         E94C/Lw7PD5WWIPqABf8rvJCPbZZyDmJ+WW9Dl2nj9TxPNBf9iF9jxDJdraxU3y5L5eF
         6I6xRKKwTrdzwdRda8p7+GND9+5t5egppje0BU5800v2XO8D6V5yk0tKUKNMTNSDmn6E
         3TimD5W9YhqwrG0NYjoXybScVXgZ+QVZdnbdAAFuDTEeG2kEzonkGKLBR45vt1bGxeK+
         m9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792150696; x=1792755496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HE4aOaMM6rfgfLxamiGTUaP3vk+wjNz3+/pqgNF8zrA=;
        b=jOimtpq2eGp9dm9GTU1xtAEDxW2GMPjW99iufu33nByx2KA79Ok4QA7CCbI6uVUgQI
         oIONV1MtT+7TIY4zwdPUNER42b1Cr+7cAbWCDkWp3ugmVKVeSpQqwiLNkL4SwIU1Nojv
         Ko0RS/ZTylWIDxrHP39tg7hgY/6rQ9uJ87jBnS1LPpE8G7pzrxRFHqBqcRuLDwcCMvHw
         6CMdsDpiLzj6H270hYavPWw73Slu+o2CE00AbYUHUdrU1Oa89ealmjJWXOWt9aMXa+8v
         7Qs0Kp5qecnGK3ftYkGQRr7g4uhnvmwFVb4PjUXgLjhRig5ukeZTrHtnfsihAnuvgfnp
         Fm4g==
X-Gm-Message-State: AFq9FYKHMu/oWx7QZL7zGsK6V9/eJFg/z7rGMwZvPze1gWFBwpIWtqzc
	w2gliOZFcb9+aipZ6uhpbc3w3hdhAz3ieYFI1S6Y6OJ1MRObYel1R23t
X-Gm-Gg: AYBFou2HDyrkWWlphvk5I1q15g2ZHTjmEB57h+uUkYdHicCIii56OOl0GIo6lKovdac
	o9mPNN6UggEFFYEOvYKbbbIemcpXtDDAULC5U7x1LzOCJhykyaIKtPsaIOZ/JIrWy58M3JWLUPy
	whgzWigMdJEJkhUjnmp8fErWG8nkFFUZ+3lDlytc6X+NQYouXyQEVp9rykQSMwV+IfUaDXxj4m8
	9vdWV/NW/IAyB6KHDhokqLD8GtGMUbUBgX6cdfFf7YMULM6CHtS6+CGf64KehrQLxv3j55uAKEl
	G1KFhFtftHHkT5qG3qdOmQcjvJxpHRpcuSe/vAjqwiOt1VHPv4BcTZXKo+FRAEklpU3SSryjphu
	9CHgwmKNAsLkPDibXR6Tl6g/pU8YbjWdFW9OgU0z5QOsyZwzi5BTr8dkMltvLGmkBiv3hU2+YLX
	X+ZFKgYiG3PrcNEVAwWhrqoJmDobhZWji3sf2A9NS5qumP66Ky0FKCXA1s9RM/7DTE+nZkifCQS
	s1Xob2YIe2PquvvVdNsKhcITxoftSzJvqsvOM0Xuu5znrxM8ZLJgBVpSA==
X-Received: by 2002:a05:600c:4fcb:b0:4a1:811c:8083 with SMTP id 5b1f17b1804b1-4a18e4c3600mr448860065e9.33.1792150695791;
        Fri, 16 Oct 2026 04:38:15 -0700 (PDT)
Received: from thinkpad ([2.176.196.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cdf2f0d1sm22383595e9.2.2026.10.16.04.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:38:15 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v1 1/3] media: sun6i-csi: capture: Align size to 16 for NV12_16L16
Date: Fri, 16 Oct 2026 15:08:44 +0330
Message-Id: <20261016113846.8602-2-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016113846.8602-1-arash.golgol@gmail.com>
References: <20261016113846.8602-1-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NV12_16L16 format is made of 16x16 tiles, so both the width and
the height must be a multiple of 16. The format preparation always
aligned dimensions to 2 pixels, whatever the pixel format, which
allowed sizes covering partial tiles.

Select the alignment from the pixel format, and do so after the
pixel format fallback so that the final format is the one used.

Assisted-by: Claude:claude-sonnet-5-5
Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index d90abba21309..f55edfd0b174 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -41,6 +41,12 @@ void sun6i_csi_capture_format(struct sun6i_csi_device *csi_dev,
 		*field = csi_dev->capture.format.fmt.pix.field;
 }
 
+static unsigned int sun6i_csi_capture_format_align(u32 pixelformat)
+{
+	/* Returns log2 of the required alignment. */
+	return pixelformat == V4L2_PIX_FMT_NV12_16L16 ? 4 : 1;
+}
+
 /* Format */
 
 static const struct sun6i_csi_capture_format sun6i_csi_capture_formats[] = {
@@ -665,17 +671,19 @@ static void sun6i_csi_capture_format_prepare(struct v4l2_format *format)
 {
 	struct v4l2_pix_format *pix_format = &format->fmt.pix;
 	const struct v4l2_format_info *info;
-	unsigned int width, height;
-
-	v4l_bound_align_image(&pix_format->width, SUN6I_CSI_CAPTURE_WIDTH_MIN,
-			      SUN6I_CSI_CAPTURE_WIDTH_MAX, 1,
-			      &pix_format->height, SUN6I_CSI_CAPTURE_HEIGHT_MIN,
-			      SUN6I_CSI_CAPTURE_HEIGHT_MAX, 1, 0);
+	unsigned int width, height, align;
 
 	if (!sun6i_csi_capture_format_find(pix_format->pixelformat))
 		pix_format->pixelformat =
 			sun6i_csi_capture_formats[0].pixelformat;
 
+	align = sun6i_csi_capture_format_align(pix_format->pixelformat);
+
+	v4l_bound_align_image(&pix_format->width, SUN6I_CSI_CAPTURE_WIDTH_MIN,
+			      SUN6I_CSI_CAPTURE_WIDTH_MAX, align,
+			      &pix_format->height, SUN6I_CSI_CAPTURE_HEIGHT_MIN,
+			      SUN6I_CSI_CAPTURE_HEIGHT_MAX, align, 0);
+
 	width = pix_format->width;
 	height = pix_format->height;
 
-- 
2.34.1

