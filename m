Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D18A45517B
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 11:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150704; cv=none; b=ED7b64ZyCXJjFulUVPSk/UnB4EFpyvOXanO6Ep8PIs2uuConDSd+7TpTHccMSQDK9uaRi/e2N782Witq25Xt4jzIFldvmRRhabic9Re/kA+UnvC269NfnvlQU9WsyLLY+BQ7W+v64kWNT+UatmT7gu2xpFeZQAfA+iOSt3pN8HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150704; c=relaxed/simple;
	bh=u12a3ffdWSavn8fNOGG7iWoAKs0u1jgbl02dvxJqvRg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qe7u00vwJaietZ+PmeYSO1OWk1WApH69QtakOn+A3LOrH7b7V37dj4mLTUWzGFGY3Pox1Fmbn7ixSv1HUe9uupERgu54THy2DpkgfXsPUgsk30ZpHo5rzvm4Si8wseKht+1AyyTM1w55FyV58mJ1p16iFpvNyTNSetzmjlBltOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ojatnic1; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ojatnic1"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso3305350f8f.2
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 04:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792150701; x=1792755501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RpfLOWvwn4Sw81+kUb+I/pmHrcilS6w6yVVATPuvlIc=;
        b=ojatnic1iZunxcm1GweYKL4ichOX0ka396RbzArBijdNvulVQ2MqEvuZHZnkzuqgs5
         aRTTdvQnGhL1U9WuaxkObXst9sjYYUKmr2gJBOKdZ1dVdzvsq2PZBRen6iS60c6/Q/81
         nUWr6+Am745gsDsogXPipnou5yfW+vaKxoZJejs5oQvy1mlbWOxOZx8r735f2/MuzXL8
         w6ohlOTmdrCL3kBJfzSZWRQrrFN8lVHsKKUQg80yOv+12ww9FpUA/2CSfAQCXp6RuGYy
         iJ6KmX2fLXjYouCdhlb1UmMnyP5+ImeLTSmC3jsVqvWnMh7T+71pgpwsUWw9ebU48qj/
         hhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792150701; x=1792755501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RpfLOWvwn4Sw81+kUb+I/pmHrcilS6w6yVVATPuvlIc=;
        b=OuiqoAXUTK0Xhhr4KyoxexIjOQ3ykU1B/mfi9BPJJhqi/PHLlxbpXxXjQRTAnY4r3J
         ahOVjlT1l7vOtVy4AtOKkdc3bST2iCiOL8mZMdGJrKtD2r5IJsc4RSLZcTwtdvKG+Mku
         E5Bc6b0RuofgKxIWKel6BWJF1SSa7bVSxm6KaIYqGWcJGR7LP7Q5IKYRKvzgObgtrhiV
         A2jB+tD5ywlBtHQQNJa+MPM9CzOaRgKRVEEzoTfHmipJWyoyt2Sdc1WNk6iZbF3XmIGe
         1oU/XpAqQUyWDjr7RQGm0UNc6qkxJ2tR4i/X+3p53N8lJQRAtifjxVUhKaCewNpaSEDi
         /wCw==
X-Gm-Message-State: AFq9FYKED+vwrCUZvEE/JprgGG/8N+ArMwGuHdxvXl021wPj7V/XqA7v
	k5T8sOvJSOmmZXAXs39PnK1ghf7IwAx2k1fWEH/qe5JPl+hLlOqv3Vd8
X-Gm-Gg: AYBFou0QqY1Vr9yUeOcr4liS2cjDObNFqK8JZ+fSKX/6eWGcgQFWe54KBkx0L7pQzG6
	6xIBNW4H488xVc6FPi8zl1SejZvJFyK1SKOQPfHLc7WXV/OZcXPyPg7H4GpTWmw56HuHkvXA1ew
	cw/KfJ9hbKhNR8arb72/5oGycMorXWW6iXd42y6GrSz6LdGP77OwEb+kzRWeTk+v+aMrqehjrR9
	nDXcnQUFNlW28hS7aS4HB1tZDW8lIN0JuwAvmWNxfulZxx5ofuOGHD0Cb3JAE0cH513Rg28y5Ci
	8l0zBkxaADxSgBsr+vGuOi8yAYj5yYUMs3wjBu/uf5IbpEWiMcw34n7odgzrn4AYd++uVkI+6yp
	EqDYIc0465NF0oaT5iSOninT556Ay/s6LmODBme7qLYHvLtqPWNMe/JMC3nL2VE1NxVsuXCyXR+
	Ibc/3rL2H0WbEvT6odf50LQ9B+ilumeWjsCVGCsNNweKX6GFUHwkqa6N1pqxPPIm2JNjOfVmYhu
	i8RCCG+J6kkmIjDrDxWU1u15fKFV4DkQd2rpOmUNIjPWT0QJUHzI7JCTw==
X-Received: by 2002:a05:600c:4f89:b0:4a1:acaa:9d4c with SMTP id 5b1f17b1804b1-4a1acaa9f79mr226601125e9.25.1792150701481;
        Fri, 16 Oct 2026 04:38:21 -0700 (PDT)
Received: from thinkpad ([2.176.196.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfe4d2321sm4363551f8f.19.2026.10.16.04.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:38:21 -0700 (PDT)
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
Subject: [PATCH v1 2/3] media: sun6i-csi: capture: Add enum_framesizes support
Date: Fri, 16 Oct 2026 15:08:45 +0330
Message-Id: <20261016113846.8602-3-arash.golgol@gmail.com>
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

Implement VIDIOC_ENUM_FRAMESIZES as a stepwise range from the minimum
and maximum sizes supported by the hardware. The step follows the
alignment enforced by try_fmt: 16 for NV12_16L16 and 2 otherwise.

Assisted-by: Claude:claude-sonnet-5-5
Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index f55edfd0b174..3adb10b62857 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -746,6 +746,30 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
+static int sun6i_csi_capture_enum_framesizes(struct file *file, void *priv,
+					     struct v4l2_frmsizeenum *fsize)
+{
+	unsigned int step;
+
+	if (fsize->index != 0)
+		return -EINVAL;
+
+	if (!sun6i_csi_capture_format_find(fsize->pixel_format))
+		return -EINVAL;
+
+	step = 1U << sun6i_csi_capture_format_align(fsize->pixel_format);
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width  = SUN6I_CSI_CAPTURE_WIDTH_MIN;
+	fsize->stepwise.max_width  = SUN6I_CSI_CAPTURE_WIDTH_MAX;
+	fsize->stepwise.step_width = step;
+	fsize->stepwise.min_height = SUN6I_CSI_CAPTURE_HEIGHT_MIN;
+	fsize->stepwise.max_height = SUN6I_CSI_CAPTURE_HEIGHT_MAX;
+	fsize->stepwise.step_height = step;
+
+	return 0;
+}
+
 static int sun6i_csi_capture_g_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
@@ -813,6 +837,7 @@ static const struct v4l2_ioctl_ops sun6i_csi_capture_ioctl_ops = {
 	.vidioc_querycap		= sun6i_csi_capture_querycap,
 
 	.vidioc_enum_fmt_vid_cap	= sun6i_csi_capture_enum_fmt,
+	.vidioc_enum_framesizes		= sun6i_csi_capture_enum_framesizes,
 	.vidioc_g_fmt_vid_cap		= sun6i_csi_capture_g_fmt,
 	.vidioc_s_fmt_vid_cap		= sun6i_csi_capture_s_fmt,
 	.vidioc_try_fmt_vid_cap		= sun6i_csi_capture_try_fmt,
-- 
2.34.1

