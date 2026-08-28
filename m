Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D8B45A2AD
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 16:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933736; cv=none; b=VClZIOrtvW+W/4DzoT+jaCEtOwpdvpkWjrU2mf10gmmEiQ//bFhpZ0lmTDOP1kEN0zIXG1mjBiumUqDJ5I2YDzIuPQH4Dtwix8ymu85aA3il1/wMQHlpfbJMlpjIJUb3dOjsXU7h3zHXTEggTJTcubLC4i6tLniRNSdeaTYxCLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933736; c=relaxed/simple;
	bh=l6qatP/1SS7be0G2miVwTO4xWFBkzQQs/ILAgIcLmkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e1fV65QKWGk9AyYGN9gezq6QAZH2IPRh64UlHlq00C1zZhUkOvpGozAjJA2zPK25nnMG11VLH8sJWhqtOA8utO4HQCYRU+yJEGPwpOYX0CYHJe/H9W2qjQnjR2k1QKzj1/H7khEADgp/pz6s+33qwUrF4HNGOhcAIMA/BtVrm/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZ5Jetrp; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZ5Jetrp"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f633e6058so751791f8f.0
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 09:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933731; x=1788538531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCLWLdSI658UBVRaCX9PmNUq6TQMDtUFjTpgX36dYDg=;
        b=CZ5JetrpiCC1xdIvIEK3mLQ5OPFyP40KROF/2EZHHaV8uN65No0m9IGD0t4k84Bu+i
         gBcc4cr2ECbELQszpp33Avtqz9EfcRmBvBuGK45wCxYSj6ZG7g5gS7vpgSGzvKELv5wd
         sISGjhQEdlaDDq1zmsfna/DsYVNHdzs7AEUdu56wkORjCGMwtfDvGXGaZ8O7ul7vD+bA
         7s71ABMX40/6KOS9OuEXYvW5R3rgxFCPuYXiDWd1LrRVrSsmrmhTjvUCekzeRONa2J3k
         YfGgnpXGZBFgAwaJ4POcesFBhZ97HGJYigLcE8N3ExLaJ9tgJFCQvjNr3GFhjfeJSVu/
         QNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933731; x=1788538531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zCLWLdSI658UBVRaCX9PmNUq6TQMDtUFjTpgX36dYDg=;
        b=tUPIOsi54uH0DTmBWThBlWkMfqC77nVup1xJCAARW57caboitfzAHgtUtvVkXsWHp7
         i9DyJW1uou7YqZTTAty8nn+VumB6syUJFWW3yg303N2HvQjhjCvBWvtNVLDrlZpI0gOp
         lzk3F2kDD03ELXpJa9LE8JMZMdTyQc+exb+k6zjMhQSH8g/3pdOWQG7T5KJ2BTFuW/Jp
         WdER/r4TLHF/yfyGDG3xIxwhv0idQZq7U3/zFF0yoGV7oaWw5s0haybP1+yoFmRIqPAF
         cW4pSnS4h1Zja+DTKd5qXiml8y/uCLKKuHuW7vj6DPyFJ5TkQsQ7v0PFRUgn5zxlPxpX
         i8zg==
X-Gm-Message-State: AFuF++kHZWmjNr9HPk7EJtpMi796zg1SNoaZovJuFwaukLyt/dcrpv1o
	Re8AKFsiSakRCS1y1bY1d8f1agRUV67r5/vRbmXmXsleX7xaDBYYCvOifMcF+mRm
X-Gm-Gg: AR+sD10smlS4N4elOh2556bb4x/zaECxSfwcJcpqIA7AXCRqeAVPA9/T9WjpZNk8Ebs
	xdeXqy8q1odz2BBWvDAEtxHSYpTVGqIhNKaGzJ/Xwfl7bfDWlvPieNiumG2ygjcVpKeSRMPQBsd
	fDo91WULcEOmbkPWfR1I+FKAd96d7AtHQ/NCLOurOzyQiQmfKbBfQdBnPM2eMCJvxkGUUfqVYEW
	k9PaNqcwsvNJam9vMmJ+auFY3qhE+arLiAYYBIHw+Z9mACjexNeWrM/NfPRLlBiAbIr1n153emH
	oIbMIvwpxfxZWouJbUxQMXBb5ZnFdvz4ZD91gPMErG71kHAKuUi6AzR4fRKEMho7MMaZxiOshzd
	hT8Hg0tiI9it8O+qoKPXa670TznPNB+mFatgkCD9CxSOHOlZ1tWoiW+UkpMzfz6R6R2Y9XbJejV
	gOOaJQ7kaRRnJGTvuNNI8Bnu4jnhGpwGSXn5zX/md3ulTuQusmfj/hKwJdsK8tgl3CqcSG4PNHX
	C/qIyQOGYqSfsSn9/YRtwcBns4P73FeN+BG5m3SjA==
X-Received: by 2002:a05:6000:2904:b0:482:e963:22bc with SMTP id ffacd0b85a97d-482f79a7548mr14687981f8f.6.1787933730940;
        Fri, 28 Aug 2026 09:15:30 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:30 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 13/15] media: atomisp: Use struct v4l2_area for padding
Date: Fri, 28 Aug 2026 18:14:55 +0200
Message-ID: <d75701c5a72daf6b36305297a44e925e5ed6b935.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The padding helper passes width and height as four separate scalar
arguments even though they form two logical dimensions.

Pass the requested size and returned padding as struct v4l2_area values.
This makes the dimensions explicit and simplifies all three callers.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Link: https://lore.kernel.org/linux-media/apCc_pt5dDxGJrei@ashevche-desk.local/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 51 +++++++++++--------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  6 +--
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 14 +++--
 3 files changed, 42 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..51dd59d98b3b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3562,9 +3562,9 @@ static void atomisp_fill_pix_format(struct v4l2_pix_format *f,
 	f->xfer_func = V4L2_XFER_FUNC_709;
 }
 
-/* Get sensor padding values for the non padded width x height resolution */
-void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
-			 u32 *padding_w, u32 *padding_h)
+/* Get sensor padding values for the non-padded size */
+void atomisp_get_padding(struct atomisp_device *isp, struct v4l2_area size,
+			 struct v4l2_area *pad)
 {
 	struct atomisp_input_subdev *input = &isp->inputs[isp->asd.input_curr];
 	struct v4l2_rect native_rect = input->native_rect;
@@ -3574,22 +3574,23 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 	struct v4l2_mbus_framefmt *sink;
 
 	if (!input->crop_support) {
-		*padding_w = pad_w;
-		*padding_h = pad_h;
+		pad->width = pad_w;
+		pad->height = pad_h;
 		return;
 	}
 
-	width = min(width, input->active_rect.width);
-	height = min(height, input->active_rect.height);
+	size.width = min(size.width, input->active_rect.width);
+	size.height = min(size.height, input->active_rect.height);
 
-	if (input->binning_support && width <= (input->active_rect.width / 2) &&
-				      height <= (input->active_rect.height / 2)) {
+	if (input->binning_support &&
+	    size.width <= (input->active_rect.width / 2) &&
+	    size.height <= (input->active_rect.height / 2)) {
 		native_rect.width /= 2;
 		native_rect.height /= 2;
 	}
 
-	*padding_w = min_t(u32, (native_rect.width - width) & ~1, pad_w);
-	*padding_h = min_t(u32, (native_rect.height - height) & ~1, pad_h);
+	pad->width = min_t(u32, (native_rect.width - size.width) & ~1, pad_w);
+	pad->height = min_t(u32, (native_rect.height - size.height) & ~1, pad_h);
 
 	/* The below minimum padding requirements are for BYT / ISP2400 only */
 	if (IS_ISP2401)
@@ -3617,8 +3618,8 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 		min_pad_h += 2;
 
 apply_min_padding:
-	*padding_w = max_t(u32, *padding_w, min_pad_w);
-	*padding_h = max_t(u32, *padding_h, min_pad_h);
+	pad->width = max_t(u32, pad->width, min_pad_w);
+	pad->height = max_t(u32, pad->height, min_pad_h);
 }
 
 int atomisp_s_sensor_power(struct atomisp_device *isp, unsigned int input, bool on)
@@ -3800,7 +3801,8 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	const struct atomisp_format_bridge *fmt, *snr_fmt;
 	struct atomisp_sub_device *asd = &isp->asd;
 	struct v4l2_mbus_framefmt ffmt = { };
-	u32 padding_w, padding_h;
+	struct v4l2_area padding;
+	struct v4l2_area size;
 	int ret;
 
 	fmt = atomisp_get_format_bridge(f->pixelformat);
@@ -3827,10 +3829,12 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	 * resolution + padding. Add padding here and remove it again after
 	 * the set_fmt call, like atomisp_set_fmt_to_snr() does.
 	 */
-	atomisp_get_padding(isp, f->width, f->height, &padding_w, &padding_h);
+	size.width = f->width;
+	size.height = f->height;
+	atomisp_get_padding(isp, size, &padding);
 	v4l2_fill_mbus_format(&ffmt, f, fmt->mbus_code);
-	ffmt.width += padding_w;
-	ffmt.height += padding_h;
+	ffmt.width += padding.width;
+	ffmt.height += padding.height;
 
 	dev_dbg(isp->dev, "try_mbus_fmt: try %ux%u\n", ffmt.width, ffmt.height);
 
@@ -3847,8 +3851,8 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 		return -EINVAL;
 	}
 
-	f->width = ffmt.width - padding_w;
-	f->height = ffmt.height - padding_h;
+	f->width = ffmt.width - padding.width;
+	f->height = ffmt.height - padding.height;
 
 	/*
 	 * If the format is jpeg or custom RAW, then the width and height will
@@ -4334,6 +4338,8 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	const struct atomisp_format_bridge *format_bridge;
 	const struct atomisp_format_bridge *snr_format_bridge;
 	struct ia_css_frame_info output_info;
+	struct v4l2_area padding;
+	struct v4l2_area size;
 	unsigned int dvs_env_w = 0, dvs_env_h = 0;
 	struct v4l2_mbus_framefmt isp_source_fmt = {0};
 	struct v4l2_rect isp_sink_crop;
@@ -4366,8 +4372,11 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 				ATOMISP_SUBDEV_PAD_SOURCE, &isp_source_fmt);
 
 	if (atomisp_subdev_format_conversion(asd)) {
-		atomisp_get_padding(isp, f->fmt.pix.width, f->fmt.pix.height,
-				    &asd->sink_pad_padding_w, &asd->sink_pad_padding_h);
+		size.width = f->fmt.pix.width;
+		size.height = f->fmt.pix.height;
+		atomisp_get_padding(isp, size, &padding);
+		asd->sink_pad_padding_w = padding.width;
+		asd->sink_pad_padding_h = padding.height;
 	} else {
 		asd->sink_pad_padding_w = 0;
 		asd->sink_pad_padding_h = 0;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index d3d1f2574e77..8a84e774f4d5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -225,9 +225,9 @@ int atomisp_makeup_css_parameters(struct atomisp_sub_device *asd,
 int atomisp_compare_grid(struct atomisp_sub_device *asd,
 			 struct atomisp_grid_info *atomgrid);
 
-/* Get sensor padding values for the non padded width x height resolution */
-void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
-			 u32 *padding_w, u32 *padding_h);
+/* Get sensor padding values for the non-padded size */
+void atomisp_get_padding(struct atomisp_device *isp, struct v4l2_area size,
+			 struct v4l2_area *pad);
 
 /* Set sensor power (no-op if already on/off) */
 int atomisp_s_sensor_power(struct atomisp_device *isp, unsigned int input, bool on);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 50366bf10f32..43bca68d1e6d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -470,15 +470,19 @@ static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 		{  800,  600 },
 		{  640,  480 },
 	};
-	u32 padding_w, padding_h;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(frame_sizes); i++) {
-		atomisp_get_padding(isp, frame_sizes[i].width, frame_sizes[i].height,
-				    &padding_w, &padding_h);
+		struct v4l2_area size = {
+			.width = frame_sizes[i].width,
+			.height = frame_sizes[i].height,
+		};
+		struct v4l2_area padding;
 
-		if ((frame_sizes[i].width + padding_w) > native->width ||
-		    (frame_sizes[i].height + padding_h) > native->height)
+		atomisp_get_padding(isp, size, &padding);
+
+		if ((frame_sizes[i].width + padding.width) > native->width ||
+		    (frame_sizes[i].height + padding.height) > native->height)
 			continue;
 
 		/*
-- 
2.53.0

