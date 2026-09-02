Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0CF4A8A12
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 14:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360862; cv=none; b=RbxG7pw+y7/+yT/tNhpdpG+dqpZcWDTA6UwGUDJOHUHDsgwuzf3arc/XG1Ji5NZ2B4jMIiY1sl49v50iCM11xcC+bW6wGBKVCQ3TH3gEQsrivapd6LjLI+v8z53HcdHmeGCrVIWG/8/4QN23YqHjSvuB4CVmQ5mK0JYFv+wDxmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360862; c=relaxed/simple;
	bh=//jCPP+eb8u5m4CIItyod+pODqByyo2ifauCpaFZfQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VMyAGO1Jw9qp7zy9CRAFzUqjlzrFpkCWnjVcw+d1+nqpFjiq0pYC9f22Qc61hPzNl62TluBMDDdo0aNm9GpBpPetrJ6v1V7pfGvk+H4uMTNncB1CTwg04/GX9ywJQEu3FDUKfmwKQajS0TZAkfwjYD3fofyW5iK8CguPe/QRL9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTf3ZsKu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTf3ZsKu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so7664385e9.1
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 07:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360857; x=1788965657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ch1L0Y83sVLilf517YsasLyC766SqlDIh2xPLCeCC2Y=;
        b=PTf3ZsKu43DNemKwCtOCKTd4+2FDPV7poHONylNZ6fe9T/2+9kF7zjhATVHDngMSAN
         grjUWOmskKbZ3hQVLukDxqQE50cSyjcEImB0eq+X0YOn0T9RfW7c4MD5aVXQ8qhGgbnz
         grz7P81JFrH1LPxDe/cP8M54KqAj86PFOG/A3b5t5U4kcwuCie9iraS23JT8xioYvDeY
         4SqyqGbKuSTsPy/gCvQQTVKjoSloZ2sjtVoVgW5ibQfs0OupSlP4Zw8kn2oiP4tmGHJv
         Ol0s7S0b8+bkalnrizYXLn872P8E1pLIHplNl2Y2EWSWjG74wWJXHgZd+KyCY96Ga3qV
         DX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360857; x=1788965657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ch1L0Y83sVLilf517YsasLyC766SqlDIh2xPLCeCC2Y=;
        b=f77huSM4+BkhvrzdIzJHHeU3VQyZv8q5jcxBwj5u9agheAWRolkoaMwp3Gha6Latkf
         RlPwBTPNlMQMliiN8ERRlEXsDmrAfa0x8CvOr2Q3bgaufazf5h3vKfWGFhZjD99uh9mL
         IgtMd7Flj9eqLbfpq0/Wy5R9wyqbveNYteTLHiqX1z33JWSK/oeT6RiyGEEqWZiL9d8W
         r+tq9llxDsysmeLCfRnsO185nRICADi95sUx30mvak7AdaRDHhoREaWDzFChbL4TPMVY
         JxAPtmSE3Yu5h0YAwGSTGlOlcklmHTLw5XrpVZ1qDCop3h4UKgQNWV8cwmsbGLIkcgZO
         gnXg==
X-Forwarded-Encrypted: i=1; AHgh+RoIvH+00h8M39QqTdE2l1ccfdagOKhAdpwN8yix0kDJC/FbSLc3GTH6wbw4XFcSnXhjeiDkwS/4tBAhKg==@vger.kernel.org
X-Gm-Message-State: AFuF++kLbafgmlxh+uHCL13AyyhU5AgbWDF5IvIf6aFoYlcbtOi710M8
	Vmv6Le8qpaqrTYm4kT009oVUDdzlXSnwWsICBM3n+zpr865fuxtpsPkf
X-Gm-Gg: AR+sD1228bJfG3cWvqwZofzzAfzZxp5wYe5yItgEJFyZ5lxBF+dzNY0UPWTAxXFwlpU
	1PdoFzErWkV/exW+p4SjPEtA/es+84EY0fAM8JrZ7TmL6z78mZIJ/goAE66gC63gmVYmNTUC2Ct
	OVjJjNrwJEh11OEA3VuaHk5v4vuMdp7uHjf75cDaE3/L2FeY3QLxmYyCDZ0k45ZUN7cdMO1t166
	koP7aVdkU6iUqRiYsfl1fnXQI0V9Fm4TM+H1x8Pvld5ZlNYsCJZt6hX4FEyrguLuyQWGW2nFYZx
	0ALsyxEaBzbhJQ3wNPKGdXoEkMjMe246lVquhks72zd8nwiFlPr6Fn0U2+gS+Edfe3CXP3NDXeu
	eCtDh0nAXD/+B9S/Kj26vO5+Oy0C6bAhiw5pnRjsN7t2aJLU1h0pQBCkJsZuJAjyO2v+flwhQ57
	c/uGJxPkoHSJT8GlyhZhjbYMmeJtMnmDGtNAWwNKMvywWKcUWYo9b59AC53Ois/jUAPwO9Bafba
	ELyw8s9xJl2EOBSGe49POcntucB0CpAYdedGwyld/W/
X-Received: by 2002:a05:600c:8411:b0:49b:9105:cdaf with SMTP id 5b1f17b1804b1-49ce58204a0mr95925455e9.8.1788360857170;
        Wed, 02 Sep 2026 07:54:17 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:16 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 15/16] media: atomisp: allow raw Bayer capture
Date: Wed,  2 Sep 2026 16:53:44 +0200
Message-ID: <5a163a69a3cb3b139f2c7ba5eee5b32bac575d27.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AtomISP currently rejects all raw formats and silently substitutes
YUV420. This prevents userspace camera processing stacks from obtaining
unprocessed sensor frames.

Enumerate only the raw format matching the sensor media-bus code and
reconcile raw requests with the code selected by the sensor. Userspace
opts in by selecting that raw V4L2 pixel format with VIDIOC_S_FMT.

Raw formats expose the full sensor transport frame so ISP2401 can use
its copy pipeline. Processed formats retain the existing global padding
behavior; selecting a smaller receiver crop remains a userspace pipeline
decision.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 14 +++++++++++---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 19 ++++++++++++++++---
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 759effdb2e8d..99d2b73b160d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3815,8 +3815,7 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	int ret;
 
 	fmt = atomisp_get_format_bridge(f->pixelformat);
-	/* Currently, raw formats are broken!!! */
-	if (!fmt || fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+	if (!fmt) {
 		f->pixelformat = V4L2_PIX_FMT_YUV420;
 
 		fmt = atomisp_get_format_bridge(f->pixelformat);
@@ -3838,7 +3837,10 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	 * resolution + padding. Add padding here and remove it again after
 	 * the set_fmt call, like atomisp_set_fmt_to_snr() does.
 	 */
-	atomisp_get_pix_padding(isp, f, &padding);
+	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+		padding = (struct v4l2_area) { };
+	else
+		atomisp_get_pix_padding(isp, f, &padding);
 	v4l2_fill_mbus_format(&ffmt, f, fmt->mbus_code);
 	ffmt.width += padding.width;
 	ffmt.height += padding.height;
@@ -3858,6 +3860,12 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 		return -EINVAL;
 	}
 
+	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
+	    fmt->mbus_code != snr_fmt->mbus_code) {
+		fmt = snr_fmt;
+		f->pixelformat = fmt->pixelformat;
+	}
+
 	f->width = ffmt.width - padding.width;
 	f->height = ffmt.height - padding.height;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 87c29a940f9b..aa6d13a4de89 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -537,12 +537,21 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.code = input->code,
 	};
+	const struct atomisp_format_bridge *format;
 	struct v4l2_subdev_state *act_sd_state;
+	struct v4l2_area padding = {
+		.width = pad_w,
+		.height = pad_h,
+	};
 	int ret;
 
 	if (!input->sensor)
 		return -EINVAL;
 
+	format = atomisp_get_format_bridge(fsize->pixel_format);
+	if (!format)
+		return -EINVAL;
+
 	if (input->crop_support)
 		return atomisp_enum_framesizes_crop(isp, fsize);
 
@@ -554,9 +563,12 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
+	if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+		padding = (struct v4l2_area) { };
+
 	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-	fsize->discrete.width = fse.max_width - pad_w;
-	fsize->discrete.height = fse.max_height - pad_h;
+	fsize->discrete.width = fse.max_width - padding.width;
+	fsize->discrete.height = fse.max_height - padding.height;
 
 	return 0;
 }
@@ -630,7 +642,8 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 		 *
 		 * FIXME: fix the pipeline to allow sensor format too.
 		 */
-		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
+		    format->mbus_code != code.code)
 			continue;
 
 		/* Found a match. Now let's pick f->index'th one. */
-- 
2.53.0

