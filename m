Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD74372045
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 16:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784304375; cv=none; b=Dy0NVqKsGWnQHuT1vuGOwnj79S+g2wfKjArs5zSst0FSK0p7gc1qcU4UMzxkx2NJJ/ajLyfA6AkDq7m8ltXwy2jqBdj3g1zKC68fmfxWkSYC8hM3DzJ1SA176Fe0EwicGTVIKgWLTbKC0B92gFOFqNmtOvyxR63CFBd/aqPUMUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784304375; c=relaxed/simple;
	bh=H1k0d5nueQY2kXWjFqFdXAC+193REXYAdbNl4ofy6dQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uVyaXkgGKmP4D2DeMGpcv1gwDXVMZhmF7TZ0qtD7DTeGxOlHUYVlTdvcyvrZ+ruic3D5KSdY+AsQ6p06sSzRKyYAcGtVJBZY+G861SIRMGybNT5aM4obGEb8VXQcsKckJ5WY0Uu7imfy/SJbdARt/IHFoVr/KN9WJEsONNfSlDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DF8EWB1/; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DF8EWB1/"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39d4c864bfbso50936671fa.1
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 09:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784304370; x=1784909170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=toQ9yiBWtG+Up1Zylcu9tHLCyoLfcGQvSFRzIedvl6s=;
        b=DF8EWB1/g74/pz9ame+QG3RfZSaSbdUNej76MOWKWGsRuUO5gPTY/vGiKozGchuTJj
         qlvLL3m5E7FObT62Ks0F0ALhfIljKG+eTs9qfcLawdwL4aeMk4HDziUJVMN9Ie3p+1Iz
         5sgMz9zRi1VV4MTgsSZ3fiWVFFnGk+QEcicqIRwVWJTBou0Z9Gs+Lf7Dgi3PYg3xNMLJ
         EvodNc/lHWclkT+PK5VZDGsSpi/sxvcCcsaO5qCM2GzZrx1mtKGvVRj/i4dZ6TZ4gHBX
         1SbU+iAAxQwBeR5JO9seYn1x9pujbfrob6KjRsTPKK9O/3DdSuuOFx7rP0ogbbSt+Q8A
         atKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784304370; x=1784909170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=toQ9yiBWtG+Up1Zylcu9tHLCyoLfcGQvSFRzIedvl6s=;
        b=Fk+vSAVkwMl7+8KyGuz7MKsOGlT3fQljJAgPRRKyG39CfFO9Z08YIPQrDzXPnSwUdk
         w/FyanKfhuqq2iv4bGdaYJw5DdT04PrUjCd8zxP1atiEL4FTm49lwE3mT3RPsEa0y2QZ
         LJeGyOuhl7oxzHX8ssIIS9vdkMA1umVNJC46KAy3m4u89ZVbnK1UnOS5FXFvIqSWjaXm
         ostuLyWR8rMQ+uF+D45NKBFRSDbujQaSZqLKndguHDqkEQkrPr5cTjJiTTpDJQ3V1FcZ
         t2tsGePOCKRjN4V/SVM9IB8qWVgscvZpojDA7PfT1et7M/Z8MZsRbe9b8evgNeC2I7j8
         Erlw==
X-Gm-Message-State: AOJu0Yyfmiha6tu6KiYaoX94/kD5bVhNkhCsXRU1IgOcCvcG3G98/g8N
	xzH2kXU9PRsqhNBDUREEH88620j4tmuZ2AQHe4knPdUVao3P9R7/FmTXniOqzgAwRPY=
X-Gm-Gg: AfdE7cnv3tJ1g6kLiaYTI3l9NzfYZb/8uIhX+v3xnEjdWVEjWo1KX1RrSSWKBiwta+1
	j0uiSleHWWzJ0vh7cf0f67Fh+ZH/oyEHCOa53DPH528em+nt7xMJle9PG+qEGmoVGGqrfjnv8CY
	R3vE5br2EiLzHfQit1OB7CyUxuAF22M6NHWG03Pr9Qln3m83MPlMzjZRA2hyFwVVVblEuB7Ba+V
	7vK+jsEIl8QUrqsIS9/4DF/LofLyd1RHhDnIDNRvgoNnOWVv/SzPttfiZjP1DnLWpKDZixza+Bb
	ADfArG4QtqKo5hObqnuS2Aa7I1IpMwjEtoRUGPw5UGkWFtExblSiCYVQtmoM7ZQkD8zt1inXNcB
	ArzFisQhLPWaQhXEbW/n1MptI8m2I0GnYTXIvVzfY5kEDgir//NxEfNu5z/wuDugZAllaWnEJn0
	CLgigyudXzxswwrzAxSvDsAyfdLosXG71knvW3zCCZZ0lyL8Xv+HwHyxL7BVik
X-Received: by 2002:a05:6512:15a3:b0:5ae:c27b:f7a0 with SMTP id 2adb3069b0e04-5b28f8551f1mr764576e87.11.1784304369207;
        Fri, 17 Jul 2026 09:06:09 -0700 (PDT)
Received: from thinkpad ([5.215.185.239])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291daf111sm454996e87.37.2026.07.17.09.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:06:08 -0700 (PDT)
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
Subject: [PATCH v4 2/2] media: sun6i-csi: capture: Implement vidioc_enum_framesizes
Date: Fri, 17 Jul 2026 19:35:47 +0330
Message-Id: <20260717160547.44460-3-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717160547.44460-1-arash.golgol@gmail.com>
References: <20260717160547.44460-1-arash.golgol@gmail.com>
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
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Tested-by: Paul Kocialkowski <paulk@sys-base.io>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index d90abba21309..f788b4234673 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -738,6 +738,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
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
+	fsize->stepwise.step_width = 2;
+	fsize->stepwise.step_height = 2;
+
+	return 0;
+}
+
 static int sun6i_csi_capture_g_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
@@ -805,6 +826,7 @@ static const struct v4l2_ioctl_ops sun6i_csi_capture_ioctl_ops = {
 	.vidioc_querycap		= sun6i_csi_capture_querycap,
 
 	.vidioc_enum_fmt_vid_cap	= sun6i_csi_capture_enum_fmt,
+	.vidioc_enum_framesizes		= sun6i_csi_capture_enum_framesize,
 	.vidioc_g_fmt_vid_cap		= sun6i_csi_capture_g_fmt,
 	.vidioc_s_fmt_vid_cap		= sun6i_csi_capture_s_fmt,
 	.vidioc_try_fmt_vid_cap		= sun6i_csi_capture_try_fmt,
-- 
2.34.1

