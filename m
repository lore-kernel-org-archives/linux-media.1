Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601150;
	b=FnaQoapLX/O9XystM/X53Qe3X1/pfosJNVGnNBMhNDRVyuhBfd2SKRA3uExTFu74R905
	 5z1WfzmWFmyTbCb9KpP3aZU/1PlEzgUzAW9njrVtDo90Toie+fwjOwTi6sR6DULudPEXv
	 Yj6DCEVuvy7ES72CXSrSGmekylxntK9tWtH15zEkII+U0iaDVGfG38ec1AJA0CA6q02Cl
	 p4NAnzbn65FPy3Wx/w+p17Rr6WJvZ1nqOatLIyfl1aXvl587qoU00YBvw5P4tmvb1yagf
	 eSB8QvLzpaj8M+u2aPKoxjSB7b3PKfZME9BPWNi3v5mCaejj95GkeW2GxgDPuQa8BPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0rCOlQ5bsIFBwd6yys44g6VpWqmRtulZR/81kpY9NLw=;
	b=27xlrNBI8xEqtpqyGQ/eAcSldzPMz/D5iygz1DlD4KwID/6ZEPEQAJ6AdxlpxzejpiJo
	 zxlCiuq4RRekcTxMrzB9/P73wi1KtW3ZELBRDMEdenQYIEyVKZDM71OHVoxLepdnV4f0O
	 F35jOVENW2t2MIRjUy5AD1JpW6ZbUG+Emq+v4/IER8hgrgX+J06svbEjpj2FUHsb8Kjog
	 dcRYnJc1f4FXUNRGCQKB6pyrkUDuCgctxTZIDtiXZqZqiND7mtMtc7u1C7OtNHvWf69xf
	 kL4z0YCucm6AT63MlLTJ8uLqoNasoqW9kNm2T2uxmTbb867XZDXQOpyupW01+FJRG8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="f+T/H2MH";
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ABD606A32A
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69ABD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f+T/H2MH
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb628232d2so3063353a12.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 02:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795601149; x=1796205949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0rCOlQ5bsIFBwd6yys44g6VpWqmRtulZR/81kpY9NLw=;
        b=f+T/H2MHWB3bGHrJ+sN69CkyTlV9/dGzIjhB9gVSS6KO9dpdW9FVNedgVvBlhLHwGh
         75FlTmpCuI3dHujxblcjLulAY0yj3yNi4xzZMowA0Egc2d1jgAnzje5LtmbPDB7XOPGC
         3jigvujZu5scBmrGj7UbcBaTJoKgtSnAhHrnvNfBso2xrM604Gih7+k6IhdMiLgaDgOw
         PXoiwvHqhrxHoTJuo+JNWpPbM/ELBalT7+aGqkZr4/Cpzg6WAKfc8tdgZjEkgi3v/UTD
         p5t9OHKpXQ5sI/nwePATm7v5vTzXrdRfCSDpVl9bpAocpknvj3r95jy6mtQ8culvypuP
         90QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601149; x=1796205949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0rCOlQ5bsIFBwd6yys44g6VpWqmRtulZR/81kpY9NLw=;
        b=JXd+alJEXZSeinZXTHZ8kF9gk3K5m1pVhRWmOiolJYoL7P7rHlvHgO8BTxh7zO36Dd
         teysUGAodEXA1/ur+9qPZaWdGu1TZFJEovNPpGVZFqYmaadU/UjsyZosN/5ebcDa2pjh
         AC49blU2TJ6VWUIfQVApQESsyQHUpycSEcOgqlbn7WCy3PSTvrhtYX3FPsejWQTFB+rF
         /TFXBqn7JJy2WzwmaiEZOx7NdgmlhVij3Ke8+2LfoT1247Igs7+77Yv65bGRH6QqHDWv
         N4aQY0eUZeBPuefpNQXYhCPV86sgRQD6FsPKLZdTWnlF4YbeNv3I/5nRDs5eozDJItTg
         m5lg==
X-Gm-Message-State: APuU4Z8omyFapUuw9zJy8uj9Ab7GHYNRTzhi0EOF3f6gc+4KgbbXSp2t
	82nnw/DIIhAkvzrblkfGbyQs1Mvfa/5gZ48z+XDhhb3zS8lgCfeNfey+
X-Gm-Gg: AZFdTZcf/PuOI+7vNMrXeQB9o+F46S6aZwypfX9fmHQvZbG3IhtveerP3cIDqBFS4yI
	yCJIh35qJRK9EgEgpaFWyz0evsKFoFxa3iMGBx/wVn6BJuhYiXedZZf51lSepHj9arAD/tR1mam
	w1I87bmd+G2lpfs8KMIf16kAOo7m/fzJlAMncVmeMDn3icirRhcWT1wvsVXnsjKHR1OuKu+8xM5
	l6X+Plg9Pj67mBZY6COIBcJZiJs7GmrIVJdvwgjcutYLDuVRsd8OHxOxzK7vphulufJtzWFvpfi
	6PZKL9REB7plmKs398P0SaZ687/LzryFe6FOZG5xov+rnLRPSxgxJpM2g6vP/ThxVi5FE+07O+q
	kurNsOssF+Fj4EEsz4xxaWlliumPhetCtqRG0vLrRdukT+o2MIyIUGRKQ8Rfpuf2dtvk7VsmC/M
	qjQNFVrDNSrRApJheV8NysKB2lR5HlnY34eO/azuu0yhcPMLhy1MwNW3rRMTb0ibAx8zcf16Bjs
	KVZbp8ahj7lpH1zcVFUZ137u8MeWkmrS6YXiSzlGtw5rSBx+paL0cR4DnCqlrXSPgYxm1qG8dDd
	HURLbrKf/lzj7dJvrJ+/+KE9etLqGJAJLTNwKPfysbQ=
X-Received: by 2002:a05:6a20:d49b:b0:3fa:f23f:a1d2 with SMTP id adf61e73a8af0-4014d4579c2mr19163287637.37.1795601148570;
        Wed, 25 Nov 2026 02:05:48 -0800 (PST)
Received: from a-VirtualBox ([168.188.125.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87334890csm8784410b3a.33.2026.11.25.02.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:05:47 -0800 (PST)
From: Minseo Park <hiyoukou@gmail.com>
To: sakari.ailus@linux.intel.com,
	kieran.bingham@ideasonboard.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	uajain@igalia.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Minseo Park <hiyoukou@gmail.com>
Subject: [PATCH] media: imx335: do not change the sensor state from the TRY path
Date: Wed, 25 Nov 2026 19:05:36 +0900
Message-ID: <20261125100536.3746-1-hiyoukou@gmail.com>
X-Mailer: git-send-email 2.53.0
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

imx335_set_pad_format() stores the requested media bus code into
imx335->cur_mbus_code before it looks at fmt->which, so a
VIDIOC_SUBDEV_S_FMT with which == V4L2_SUBDEV_FORMAT_TRY changes it as
well.

That used to be observable, because the driver's own .get_fmt returned
cur_mbus_code too.  Since commit df3ef05b51e0 ("media: imx355: Use
subdev active state"), which changes imx335 despite what its subject
says, .get_fmt is v4l2_subdev_get_fmt() and reports the subdev state.
A TRY call now leaves the active format alone while still changing the
code the sensor is programmed with: imx335_set_framefmt() derives the
output bit width from cur_mbus_code and writes it to IMX335_REG_MDBIT
when streaming starts.

A TRY request on any handle therefore makes the sensor emit 12-bit data
for an active format that still reads as 10-bit, or the other way
round, while the receiver and the buffers behind it were set up from
that active format.

Drop the device wide copy and take the code from the subdev state, which
.enable_streams() is already given.  imx335_fill_pad_format() and
imx335_set_framefmt() now receive the code to use, so the TRY path only
writes to the state of the handle it was called on.

An unsupported code now falls back to the code in the state being
configured rather than to the device wide one, which for a TRY call is
the format of that handle.

cur_mode is not affected, it is already only assigned when
fmt->which is V4L2_SUBDEV_FORMAT_ACTIVE.

Fixes: cfa49ff0558a ("media: i2c: imx335: Support 2592x1940 10-bit mode")
Signed-off-by: Minseo Park <hiyoukou@gmail.com>
---
 drivers/media/i2c/imx335.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 5790aa4fabeb..48f42a4adf80 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -215,7 +215,6 @@ struct imx335_mode {
  * @lane_mode: Mode for number of connected data lanes
  * @cur_mode: Pointer to current selected sensor mode
  * @link_freq_bitmap: Menu bitmap for link_freq_ctrl
- * @cur_mbus_code: Currently selected media bus format code
  */
 struct imx335 {
 	struct device *dev;
@@ -241,7 +240,6 @@ struct imx335 {
 	u32 lane_mode;
 	const struct imx335_mode *cur_mode;
 	unsigned long link_freq_bitmap;
-	u32 cur_mbus_code;
 };
 
 static const char * const imx335_tpg_menu[] = {
@@ -853,17 +851,16 @@ static int imx335_enum_frame_size(struct v4l2_subdev *sd,
 /**
  * imx335_fill_pad_format() - Fill subdevice pad format
  *                            from selected sensor mode
- * @imx335: pointer to imx335 device
  * @mode: pointer to imx335_mode sensor mode
+ * @code: media bus format code to report
  * @fmt: V4L2 sub-device format need to be filled
  */
-static void imx335_fill_pad_format(struct imx335 *imx335,
-				   const struct imx335_mode *mode,
+static void imx335_fill_pad_format(const struct imx335_mode *mode, u32 code,
 				   struct v4l2_subdev_format *fmt)
 {
 	fmt->format.width = mode->width;
 	fmt->format.height = mode->height;
-	fmt->format.code = imx335->cur_mbus_code;
+	fmt->format.code = code;
 	fmt->format.field = V4L2_FIELD_NONE;
 	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
 	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
@@ -888,20 +885,24 @@ static int imx335_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx335_mode *mode;
 	struct v4l2_rect *crop;
 	int i, ret = 0;
+	u32 code;
 
 	mode = v4l2_find_nearest_size(supported_modes,
 				      ARRAY_SIZE(supported_modes),
 				      width, height,
 				      fmt->format.width, fmt->format.height);
 
+	format = v4l2_subdev_state_get_format(sd_state, fmt->pad);
+
+	/* Keep the current code if the requested one is not supported. */
+	code = format->code;
 	for (i = 0; i < ARRAY_SIZE(imx335_mbus_codes); i++) {
 		if (imx335_mbus_codes[i] == fmt->format.code)
-			imx335->cur_mbus_code = imx335_mbus_codes[i];
+			code = imx335_mbus_codes[i];
 	}
 
-	imx335_fill_pad_format(imx335, mode, fmt);
+	imx335_fill_pad_format(mode, code, fmt);
 
-	format = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 	*format = fmt->format;
 
 	crop = v4l2_subdev_state_get_crop(sd_state, fmt->pad);
@@ -937,7 +938,8 @@ static int imx335_init_state(struct v4l2_subdev *sd,
 	struct v4l2_subdev_format fmt = { 0 };
 
 	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
-	imx335_fill_pad_format(imx335, &supported_modes[0], &fmt);
+	imx335_fill_pad_format(&supported_modes[0], imx335_mbus_codes[0],
+			       &fmt);
 
 	__v4l2_ctrl_modify_range(imx335->link_freq_ctrl, 0,
 				 __fls(imx335->link_freq_bitmap),
@@ -978,7 +980,7 @@ static int imx335_get_selection(struct v4l2_subdev *sd,
 	return -EINVAL;
 }
 
-static int imx335_set_framefmt(struct imx335 *imx335)
+static int imx335_set_framefmt(struct imx335 *imx335, u32 code)
 {
 	/*
 	 * In the all-pixel scan mode the AD conversion shall match the output
@@ -989,7 +991,7 @@ static int imx335_set_framefmt(struct imx335 *imx335)
 	 * That's as much as the documentation gives us...
 	 */
 	int ret = 0;
-	u8 bpp = imx335->cur_mbus_code == MEDIA_BUS_FMT_SRGGB10_1X10 ? 10 : 12;
+	u8 bpp = code == MEDIA_BUS_FMT_SRGGB10_1X10 ? 10 : 12;
 	u8 ad_conv = bpp;
 
 	/* Start with the output mode */
@@ -1025,6 +1027,7 @@ static int imx335_enable_streams(struct v4l2_subdev *sd,
 				 u64 streams_mask)
 {
 	struct imx335 *imx335 = to_imx335(sd);
+	const struct v4l2_mbus_framefmt *fmt;
 	const struct imx335_reg_list *reg_list;
 	int ret;
 
@@ -1058,7 +1061,8 @@ static int imx335_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
-	ret = imx335_set_framefmt(imx335);
+	fmt = v4l2_subdev_state_get_format(state, pad);
+	ret = imx335_set_framefmt(imx335, fmt->code);
 	if (ret) {
 		dev_err(imx335->dev, "%s failed to set frame format: %d\n",
 			__func__, ret);
@@ -1477,7 +1481,6 @@ static int imx335_probe(struct i2c_client *client)
 
 	/* Set default mode to max resolution */
 	imx335->cur_mode = &supported_modes[0];
-	imx335->cur_mbus_code = imx335_mbus_codes[0];
 	imx335->vblank = imx335->cur_mode->vblank;
 
 	ret = imx335_init_controls(imx335);
-- 
2.43.0

