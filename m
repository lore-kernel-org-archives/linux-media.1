Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267993;
	b=TpXAMb8KsQG+jNFv9dtf9hfGIYcNet16x451bsvWdIew+g6fnhhgb13WvlNtBLIvLawN
	 Cjm3gb89fZTEJKanDvTsC6JurlN6/OPZIS8Yahr38naoobZ/g1oHP3WVV0OiebQFX/AhN
	 eNTo/yZ7zCgpQ9+CmyGW5XgA8U4oItvm0Q76o2uFfPrqllGGk3u35eqrl+yEEp9ayUx+R
	 N25qFcjun4X3+d7eBXbVmkJ7wReA5JjpB19v6OkiXb1s8pzbnewrMiRnpvSXYnkENMRwN
	 yVNFLW8/02CWn6Je3MdQ1kMUiVzrLy496h4hN2GnDr3fcYRlxHvTbfIqOWb3lUiZJfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wy7GP1vZQ3KHSLFw1MGZPxam0bo/YRDmN4mKBHmVJ+o=;
	b=N/mZgHCwB98bH9dqXerLvr+DRrsm6okdzhudGiyeBzoMV9Juh4z9GbzVoy7mR94Hdeo3
	 0PSluq0gS4VvXrQGuJElXNCdKwm00dtwLyE5TMa8cTZ1x1BZUpskypNSok3PfTBmqILC2
	 LxAhtxoAwnZjBH/PE/d7AAKyEu+cOu7ezZ4ZhI/awm2+MPlGxtYb3xEb16N4zR1Nu5OeU
	 wiTIU5OvhtIa0vi5vKHLIqgcNcpAUjbL6PqxFkrE4Kovk3TeWULBe/YVjBVKp9xt9MnjE
	 RrIK3hdxG/2r6Dqh0/2iyHIkMBX1SK1LYLJnPtLdBagGAxJKzFFNctTuShWWA6l5QXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="f/Egcf13";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AF5606A696
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 13:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34AF5606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f/Egcf13
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso15460755e9.1
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 05:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267992; x=1795872792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wy7GP1vZQ3KHSLFw1MGZPxam0bo/YRDmN4mKBHmVJ+o=;
        b=f/Egcf13cBtnmU/okI7oXvtWWb0nuDpJSc+pwrQQ/pifl4WSG65H0U7pfWalXutABs
         5sY4srrmeOmSYwH1A5sM6S8b3Xyz+aY8rAzIqN9xSKfgrBEeitJwNTbY42gkHPgYE75J
         yLfdwbpLuZcOHYTqfNaWg2xsKT64IN/gHCRNCJVaEz32LUGmRpq6+/507bL4nCKAMwkK
         FHEWjsaNEbpNuQKp12WPnUPlwb/NKuTfW+/EmWcrgwMSQ7mSJNeWF09uqtQbqf34q9I8
         wRNSF49xg59tzvZJnBUhLMU9EZgIVf5fqmJSAWzbGz7UHzbCnHPKOqIQPfJP6/qHfrVL
         fZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267992; x=1795872792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wy7GP1vZQ3KHSLFw1MGZPxam0bo/YRDmN4mKBHmVJ+o=;
        b=cTblGrtahzqirjhYy3o9Ig1dUCSkatUIBfSb9vaCPUFiZWTFpzYCTn9VUmh5m7lw7Z
         2VzuhAx+gENka03MSUnKokdYfkImWBJ8h7Wa8VTnZOFfL+s3609cPrF8VjyiHoMZJpsS
         dJ44YRMpINqMBMktSxqHsHl0pI4MtMrcHp+LE5Mrjo/oOFTqMwY8VTJrDzfhUvrV9sAP
         xCXYKPkyEe6I5S+8cR/wEP2epBZ1YpsIGeO2025IgrTXY6SNC020bu7fcDkb4kKRtK85
         YZH94tWLlZUaTMb3hPIrTjLSQ+mGIkjgb5iSn1PxT/9dTVbmVHchtQnHTw2QBJdZ7GIj
         dHAQ==
X-Gm-Message-State: APuU4Z8mfU5ngsZSFHGQyvl6vLq9BH6Nsi+UTw/zSmmkpIVnhw7M5EqF
	GPU3cC5QKCepwwA9s9434DupMrOCF14pr+H7SQfHNqVjZHTKCHmM+g4eqa7xIg==
X-Gm-Gg: AZFdTZebIHgZuQDAUaMmU8Kur2Bx4evMj3OWf/ddvq4oqKzTqC3eRQem8BRxBT6gxR3
	LmTntGrqA49vd5iR//Coesl9035KI5NRKvCvncVReHVyjVbEeJR54fLESvharCDuuGcDdFGDUZK
	wVrcSAxJJ4fkOpbl3yHf+J0oiUasjtGV/I/9vnkPtVTbOzdpl0Tljfd5uQYZ/ofHN6Fo2zkHIS6
	Nc/6qUVZjVJdwBWyS/L8RXgTFcQ4IjudsVPVGWAilQ26/ekkpbyuG2tJdTucU1EoT3i2lDcENgq
	ed6pz00CcuK/KxSAEAgo+DliY2fomrpbittHwVL2ZpfYsdqyQrOVAgfcrXbrfy0OooiZSoKnXYW
	muoPBaDrDu5bPOWk2b5MnQ+hUHizpxuHeLUlYIWUjfHyno/+Jh1WoMWklksYeO4T6KrpIuJwT+O
	DFq44NhUaDpsMaEO1DvdBdttg6pTarBEkvqZaJzMikw1/WCpCsu3Z1m/fC8jpxNvuNfBGPMsSjW
	qswhBs50v+rTrep8zHDkJDKUBmnxI/3OetSlAFfJsOeadC1bd9QMsr7Tb8hFJPu3mvg6dElyhax
	H8KQ+UvBsmycft3In0TXFPATfh/uAWilTvXZv4A/x8c5sJyJNH4BX011gUGhuXAd5KX1kgs5/oD
	rYsVGz20LpO+v
X-Received: by 2002:a05:600c:4e0b:b0:4bb:68f1:5bc0 with SMTP id 5b1f17b1804b1-4bb88920967mr141726435e9.33.1795267991566;
        Sat, 21 Nov 2026 05:33:11 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:33:11 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 12/14] media: atomisp: Allow raw Bayer capture
Date: Sat, 21 Nov 2026 14:31:42 +0100
Message-ID: <5fdbc15a3d9bf4721e9daf3567594cc2080fd26e.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
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

AtomISP currently rejects raw formats and substitutes YUV420. Expose
the supported raw Bayer formats so userspace can select unprocessed
sensor frames with VIDIOC_S_FMT.

Enumerate the sensor's media-bus codes and pass the requested RAW code
to discrete frame-size enumeration. Crop-capable sensors report their
native RAW sizes without conversion padding. Match TRY_FMT to S_FMT
when sensor negotiation falls back to native processed output.

RAW formats expose the sensor transport frame for the ISP2401 copy
pipeline. Processed formats keep the existing padding rules.

Sashiko identified the negotiation and enumeration cases. Codex drafted
the follow-up and exercised it with simulated sensor replies.

Link: https://linuxtv.org/mailman3/hyperkitty/list/media-ci@linuxtv.org/message/TJOXYBYPVBPWJS47TNZF33YCWBAP2WZL/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  36 ++++--
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 106 +++++++++++++-----
 2 files changed, 106 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index c2978e587..bada0eec6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3818,11 +3818,11 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	struct atomisp_sub_device *asd = &isp->asd;
 	struct v4l2_mbus_framefmt ffmt = { };
 	struct v4l2_area padding;
+	bool retried = false;
 	int ret;
 
 	fmt = atomisp_get_format_bridge(f->pixelformat);
-	/* Currently, raw formats are broken!!! */
-	if (!fmt || fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+	if (!fmt) {
 		f->pixelformat = V4L2_PIX_FMT_YUV420;
 
 		fmt = atomisp_get_format_bridge(f->pixelformat);
@@ -3840,23 +3840,24 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	}
 
 	/*
-	 * atomisp_set_fmt() will set the sensor resolution to the requested
-	 * resolution + padding. Add padding here and remove it again after
-	 * the set_fmt call, like atomisp_set_fmt_to_snr() does.
+	 * Match S_FMT: only Bayer-to-processed conversion needs padding.
+	 * Start with the requested format and retry without padding if the
+	 * sensor supplies a native processed format.
 	 */
-	atomisp_get_pix_padding(isp, f, &padding);
+	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+		padding = (struct v4l2_area) { };
+	else
+		atomisp_get_pix_padding(isp, f, &padding);
+
+retry:
 	v4l2_fill_mbus_format(&ffmt, f, fmt->mbus_code);
 	ffmt.width += padding.width;
 	ffmt.height += padding.height;
 
-	dev_dbg(isp->dev, "try_mbus_fmt: try %ux%u\n", ffmt.width, ffmt.height);
-
 	ret = atomisp_set_sensor_crop_and_fmt(isp, &ffmt, V4L2_SUBDEV_FORMAT_TRY);
 	if (ret)
 		return ret;
 
-	dev_dbg(isp->dev, "try_mbus_fmt: got %ux%u\n", ffmt.width, ffmt.height);
-
 	snr_fmt = atomisp_get_format_bridge_from_mbus(ffmt.code);
 	if (!snr_fmt) {
 		dev_err(isp->dev, "unknown sensor format 0x%8.8x\n",
@@ -3864,6 +3865,21 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 		return -EINVAL;
 	}
 
+	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+		fmt = snr_fmt;
+		f->pixelformat = fmt->pixelformat;
+	} else if (!atomisp_is_mbuscode_raw(ffmt.code) &&
+		   (padding.width || padding.height)) {
+		padding = (struct v4l2_area) { };
+		retried = true;
+		goto retry;
+	} else if (retried && atomisp_is_mbuscode_raw(ffmt.code)) {
+		return -EINVAL;
+	}
+
+	if (ffmt.width < padding.width || ffmt.height < padding.height)
+		return -EINVAL;
+
 	f->width = ffmt.width - padding.width;
 	f->height = ffmt.height - padding.height;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 87c29a940..948efa320 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -7,6 +7,7 @@
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
  */
 
+#include <linux/bitmap.h>
 #include <linux/delay.h>
 #include <linux/pci.h>
 
@@ -447,6 +448,36 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 	return ret;
 }
 
+static int atomisp_enum_raw_formats(struct v4l2_subdev *sensor,
+				    unsigned long *raw_formats)
+{
+	struct v4l2_subdev_mbus_code_enum code = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	struct v4l2_subdev_state *state;
+	unsigned int i;
+	int ret;
+
+	state = v4l2_subdev_lock_and_get_active_state(sensor);
+	for (;; code.index++) {
+		ret = v4l2_subdev_call(sensor, pad, enum_mbus_code, state, &code);
+		if (ret)
+			break;
+
+		for (i = 0; i < ARRAY_SIZE(atomisp_output_fmts); i++) {
+			const struct atomisp_format_bridge *fmt = &atomisp_output_fmts[i];
+
+			if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
+			    fmt->mbus_code == code.code)
+				set_bit(i, raw_formats);
+		}
+	}
+	if (state)
+		v4l2_subdev_unlock_state(state);
+
+	return ret == -EINVAL || ret == -ENOIOCTLCMD ? 0 : ret;
+}
+
 /*
  * With crop any framesize <= sensor-size can be made, give
  * userspace a list of sizes to choice from.
@@ -455,7 +486,7 @@ static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 					      struct v4l2_frmsizeenum *fsize,
 					      const struct v4l2_rect *active,
 					      const struct v4l2_rect *native,
-					      int *valid_sizes)
+					      bool raw, int *valid_sizes)
 {
 	static const struct v4l2_area frame_sizes[] = {
 		{ 1920, 1440 },
@@ -472,10 +503,22 @@ static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 	};
 	int i;
 
+	if (raw && (*valid_sizes)++ == fsize->index) {
+		fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
+		fsize->discrete.width = native->width;
+		fsize->discrete.height = native->height;
+		return 0;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(frame_sizes); i++) {
-		struct v4l2_area padding;
+		struct v4l2_area padding = { };
+
+		if (raw && frame_sizes[i].width == native->width &&
+		    frame_sizes[i].height == native->height)
+			continue;
 
-		atomisp_get_padding(isp, frame_sizes[i], &padding);
+		if (!raw)
+			atomisp_get_padding(isp, frame_sizes[i], &padding);
 
 		if ((frame_sizes[i].width + padding.width) > native->width ||
 		    (frame_sizes[i].height + padding.height) > native->height)
@@ -503,14 +546,14 @@ static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 }
 
 static int atomisp_enum_framesizes_crop(struct atomisp_device *isp,
-					struct v4l2_frmsizeenum *fsize)
+					struct v4l2_frmsizeenum *fsize, bool raw)
 {
 	struct atomisp_input_subdev *input = &isp->inputs[isp->asd.input_curr];
 	struct v4l2_rect active = input->active_rect;
 	struct v4l2_rect native = input->native_rect;
 	int ret, valid_sizes = 0;
 
-	ret = atomisp_enum_framesizes_crop_inner(isp, fsize, &active, &native, &valid_sizes);
+	ret = atomisp_enum_framesizes_crop_inner(isp, fsize, &active, &native, raw, &valid_sizes);
 	if (ret == 0)
 		return 0;
 
@@ -522,7 +565,7 @@ static int atomisp_enum_framesizes_crop(struct atomisp_device *isp,
 	native.width /= 2;
 	native.height /= 2;
 
-	return atomisp_enum_framesizes_crop_inner(isp, fsize, &active, &native, &valid_sizes);
+	return atomisp_enum_framesizes_crop_inner(isp, fsize, &active, &native, raw, &valid_sizes);
 }
 
 static int atomisp_enum_framesizes(struct file *file, void *priv,
@@ -537,14 +580,33 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.code = input->code,
 	};
+	const struct atomisp_format_bridge *format;
 	struct v4l2_subdev_state *act_sd_state;
 	int ret;
 
 	if (!input->sensor)
 		return -EINVAL;
 
+	format = atomisp_get_format_bridge(fsize->pixel_format);
+	if (!format)
+		return -EINVAL;
+
+	if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+		fse.code = format->mbus_code;
+		if (input->crop_support) {
+			DECLARE_BITMAP(raw_formats, ARRAY_SIZE(atomisp_output_fmts)) = { };
+
+			ret = atomisp_enum_raw_formats(input->sensor, raw_formats);
+			if (ret)
+				return ret;
+			if (!test_bit(format - atomisp_output_fmts, raw_formats))
+				return -EINVAL;
+		}
+	}
+
 	if (input->crop_support)
-		return atomisp_enum_framesizes_crop(isp, fsize);
+		return atomisp_enum_framesizes_crop(isp, fsize,
+						   format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW);
 
 	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->sensor);
 	ret = v4l2_subdev_call(input->sensor, pad, enum_frame_size,
@@ -555,8 +617,13 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 		return ret;
 
 	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-	fsize->discrete.width = fse.max_width - pad_w;
-	fsize->discrete.height = fse.max_height - pad_h;
+	if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+		fsize->discrete.width = fse.max_width;
+		fsize->discrete.height = fse.max_height;
+	} else {
+		fsize->discrete.width = fse.max_width - pad_w;
+		fsize->discrete.height = fse.max_height - pad_h;
+	}
 
 	return 0;
 }
@@ -602,35 +669,22 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 	struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
-	struct v4l2_subdev_mbus_code_enum code = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
+	DECLARE_BITMAP(raw_formats, ARRAY_SIZE(atomisp_output_fmts)) = { };
 	const struct atomisp_format_bridge *format;
-	struct v4l2_subdev_state *act_sd_state;
 	unsigned int i, fi = 0;
 	int ret;
 
 	if (!input->sensor)
 		return -EINVAL;
 
-	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->sensor);
-	ret = v4l2_subdev_call(input->sensor, pad, enum_mbus_code,
-			       act_sd_state, &code);
-	if (act_sd_state)
-		v4l2_subdev_unlock_state(act_sd_state);
+	ret = atomisp_enum_raw_formats(input->sensor, raw_formats);
 	if (ret)
 		return ret;
 
 	for (i = 0; i < ARRAY_SIZE(atomisp_output_fmts); i++) {
 		format = &atomisp_output_fmts[i];
-
-		/*
-		 * Is the atomisp-supported format is valid for the
-		 * sensor (configuration)? If not, skip it.
-		 *
-		 * FIXME: fix the pipeline to allow sensor format too.
-		 */
-		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
+		    !test_bit(i, raw_formats))
 			continue;
 
 		/* Found a match. Now let's pick f->index'th one. */
-- 
2.53.0


