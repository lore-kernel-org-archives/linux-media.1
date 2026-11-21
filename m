Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267991;
	b=Q/Izxi4S2zcO7vvGewxJCv+TwAu6CTg8ChClA76uVEPyPhCe/UaJ9IPZQC1d0lf5OFyZ
	 mfsUuQHOqSZZiN/ikiGFuGC96LdFvyesc+/sdvQN07ZhDf+fgZZWTE6ogkj5ld9tylikF
	 LX6+cQSxrnnt3Ul7BZviF8EcAEwlSd3JJiLJVKymbMgqUhpIsrZclwLDMgDC5KvalVVdk
	 khQmygxqoAVs3qXrM/ZMuaILkySPIiC8F1ootL8MZutTFnnoR+B65oCrvu1mYWo48OmR3
	 qAaQImUguKoJNLByb79NgxmieHlTvAp0NGszdRzzj/6nwpHk/EiQyHre2qDtfqfVoNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f/q2KFLslNeb4ArIB+R/WClzDLnnPNZKULOfzYTc6DE=;
	b=cITgwOAIxXC0I1kt2m6AA5Si9caQpVCiYL1vv2pXg4TtKuIDvgeRovznj9PuK4P6UnRG
	 RLZDL2Ypj/UNibRYnunMVA5d8La/pGI63sRPz6ccHSLXim2/S+2ID+bv8XHD92fwyi9Mc
	 bmGBJXzWxEtid0E/+eAOzvx6vVLTWl93Y97h4LMkMAr4QtV41Uymlg6i7B+/Br+ovTgYi
	 ome8HGRT9oF9OiFlsh9LjdVRDPrQbhz1wl6M4AgaaMGADuBDgQ5LxkCRcWWU7gzg9h72F
	 lkBwCHyM0He8XEX1/OgVCYTMUV3kEzh3qBA5J+hukFSBKAlm1TsY9pYvaHlsaERCUZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fZrs+0MN;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAAE606A333
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 13:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DAAE606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fZrs+0MN
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so1384538f8f.0
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 05:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267990; x=1795872790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/q2KFLslNeb4ArIB+R/WClzDLnnPNZKULOfzYTc6DE=;
        b=fZrs+0MNM9MIq+FAAWRgY1tw9VVXaDJ5Ugj3J5SVVlG8SI5J88SOwfe3n+onG9axF8
         Pkpv9n/ifZnbjt96owRFNLIX4aGpC5imSnb4/YuueyECtBFoc8ps9/TSVBZYpqUsc2re
         5WdWkBbZrDggVYiXndZayA+JVJUKZwVDRh3U1Du+623qnpJy7wmHcWk6cmMgiuut4I7e
         ASI8ZAuI3OmsmfDlEpQnrJxw/5BwslYwdgtfmp5Il9wft2bl2WK96U6krhqORgS3qYf/
         nO9j3mQlbw6fSxOBKhLLaC2j8AvCQtHqerxEwB9yRC/Uo2uABdMyf8cq4UcQLcmXgiQM
         APvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267990; x=1795872790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f/q2KFLslNeb4ArIB+R/WClzDLnnPNZKULOfzYTc6DE=;
        b=0Xj/5+65s7VE0vTEzZea0z1MmskbLRVHfglJ/M0g/G+dB/f3hXlFWO5aNDpDnASKZp
         AviWH2TIL8sJOKcRqgmlNX2lz1f56kTI+L/MToXGqe6I97kQWfiW3WCiHRp/QVz7QUv+
         Qepuz3g8W4HW95VijlDbBPod3qdNbAngikeNtP7WhgNXjLV/ZqY5IDjy7VndeJDLBGub
         XHG3toDMAT5SnFOSFUTL9hjEreM5D1pIvddVZd800KBW16UCGKxvSry82OZkbMd8944B
         bKg001APb5h6AFwhzfS7LN1aKM7xYrSF2WFU8OpvtvaPxrfBc3QFaki13yZ0g6XC5Luq
         I5lw==
X-Gm-Message-State: APuU4Z9rbdBJq5sJXXwFWx99HOVDluD9Dd2sFSdqRb0obdlHS7Tuc91v
	+bp+1i3qx4xIYuzp7EZdOu1RufE4UpHJpbdwTa4qrsXGW24gB9WABSHRqQA9Yg==
X-Gm-Gg: AZFdTZcTgnn0gwdvF/C0d5HJoRyHvjwl3Mzm97T9cwQTQ7TbgrKxhPR7vNU6ea/k64o
	PZpmH4g4RVdp8dCkOXxZ7JpkeNVXuEKzinwXHLJttelEuoqUBmEzWghrxU1+NPN0HkO1KTh7lwg
	pg8RnGwrXLy1MzCUxJgMmz0f+eNqVnVORtSPRd6tqYeI+yJbj+UCUsTPwMu+iErfO/WTczcQH+G
	9u6StDyJoT0PNoxZ1sCnaEX0IsJRa2+ghewmRzUDiJZYVTTMg4aL9FHJOi6bZUiQ8CY0rzLBANY
	8In/bqJEwJwjVrVxBucxK42MWLRxEk1+euhuVy3W1VEKtRTeGKfhImOmcPMoLpifGvi++D5Zj8q
	b55IfUsVnjWASIHqZ4l3ZiagxOFZiQRjnE35kGsKZuokbdfvde3klv/QPiE73x3ef/YBTcNbNAy
	Z51OIhY5fYLdiy0mZtXWhQ7G4I8o3pv+mjddWJY8pmHCzkkFJFQtY3h7UkPO0mcJOdFoqGmptWr
	0mmE38HXhxM8JaOwVUmjNJTELhW+wYppOn4330n8XdBcrU6bM0VjdwzBqSYcKHSqPZrzS29NRlb
	eHcY9J+/cZtNLtnJW0ezA2FIwBwBsrVsVmzdae+aotGCxSarIz+OsBe/AqzHTGz5NVYePqf+mUj
	n2CTjNZ3tNSnTmT44xOX5ueCLbTtl3VyRHA==
X-Received: by 2002:a05:600c:4f10:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4bb88807909mr144086335e9.5.1795267989738;
        Sat, 21 Nov 2026 05:33:09 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:33:09 -0800 (PST)
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
Subject: [PATCH v11 11/14] media: atomisp: Use struct v4l2_area for padding
Date: Sat, 21 Nov 2026 14:31:41 +0100
Message-ID: <4bfc1985f4d39e0ed48dddb63ad8b0cd7bb816e0.1795267528.git.mauriziocasciano7@gmail.com>
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

The padding helper passes width and height as four separate scalar
arguments even though they form two logical dimensions.

Pass the requested size and returned padding as struct v4l2_area values.
This makes the dimensions explicit and simplifies all three callers.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 69 +++++++++++--------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  6 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 15 ++--
 .../media/atomisp/pci/atomisp_subdev.c        |  4 +-
 .../media/atomisp/pci/atomisp_subdev.h        |  3 +-
 5 files changed, 54 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index e66a7d1c7..c2978e587 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3561,9 +3561,9 @@ static void atomisp_fill_pix_format(struct v4l2_pix_format *f,
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
@@ -3573,22 +3573,24 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
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
+	pad->height = min_t(u32, (native_rect.height - size.height) & ~1,
+			    pad_h);
 
 	/* The below minimum padding requirements are for BYT / ISP2400 only */
 	if (IS_ISP2401)
@@ -3616,8 +3618,18 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 		min_pad_h += 2;
 
 apply_min_padding:
-	*padding_w = max_t(u32, *padding_w, min_pad_w);
-	*padding_h = max_t(u32, *padding_h, min_pad_h);
+	pad->width = max_t(u32, pad->width, min_pad_w);
+	pad->height = max_t(u32, pad->height, min_pad_h);
+}
+
+static void
+atomisp_get_pix_padding(struct atomisp_device *isp,
+			struct v4l2_pix_format *f,
+			struct v4l2_area *pad)
+{
+	struct v4l2_area size = { .width = f->width, .height = f->height };
+
+	atomisp_get_padding(isp, size, pad);
 }
 
 int atomisp_s_sensor_power(struct atomisp_device *isp, unsigned int input, bool on)
@@ -3805,7 +3817,7 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	const struct atomisp_format_bridge *fmt, *snr_fmt;
 	struct atomisp_sub_device *asd = &isp->asd;
 	struct v4l2_mbus_framefmt ffmt = { };
-	u32 padding_w, padding_h;
+	struct v4l2_area padding;
 	int ret;
 
 	fmt = atomisp_get_format_bridge(f->pixelformat);
@@ -3832,10 +3844,10 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	 * resolution + padding. Add padding here and remove it again after
 	 * the set_fmt call, like atomisp_set_fmt_to_snr() does.
 	 */
-	atomisp_get_padding(isp, f->width, f->height, &padding_w, &padding_h);
+	atomisp_get_pix_padding(isp, f, &padding);
 	v4l2_fill_mbus_format(&ffmt, f, fmt->mbus_code);
-	ffmt.width += padding_w;
-	ffmt.height += padding_h;
+	ffmt.width += padding.width;
+	ffmt.height += padding.height;
 
 	dev_dbg(isp->dev, "try_mbus_fmt: try %ux%u\n", ffmt.width, ffmt.height);
 
@@ -3852,8 +3864,8 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 		return -EINVAL;
 	}
 
-	f->width = ffmt.width - padding_w;
-	f->height = ffmt.height - padding_h;
+	f->width = ffmt.width - padding.width;
+	f->height = ffmt.height - padding.height;
 
 	/*
 	 * If the format is jpeg or custom RAW, then the width and height will
@@ -4273,11 +4285,12 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 		return -EINVAL;
 
 	v4l2_fill_mbus_format(&ffmt, f, format->mbus_code);
-	ffmt.height += asd->sink_pad_padding_h + dvs_env_h;
-	ffmt.width += asd->sink_pad_padding_w + dvs_env_w;
+	ffmt.height += asd->sink_pad_padding.height + dvs_env_h;
+	ffmt.width += asd->sink_pad_padding.width + dvs_env_w;
 
 	dev_dbg(isp->dev, "s_mbus_fmt: ask %ux%u (padding %ux%u, dvs %ux%u)\n",
-		ffmt.width, ffmt.height, asd->sink_pad_padding_w, asd->sink_pad_padding_h,
+		ffmt.width, ffmt.height, asd->sink_pad_padding.width,
+		asd->sink_pad_padding.height,
 		dvs_env_w, dvs_env_h);
 
 	__atomisp_init_stream_info(ATOMISP_INPUT_STREAM_GENERAL, stream_info);
@@ -4370,13 +4383,11 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 				V4L2_SUBDEV_FORMAT_ACTIVE,
 				ATOMISP_SUBDEV_PAD_SOURCE, &isp_source_fmt);
 
-	if (atomisp_subdev_format_conversion(asd)) {
-		atomisp_get_padding(isp, f->fmt.pix.width, f->fmt.pix.height,
-				    &asd->sink_pad_padding_w, &asd->sink_pad_padding_h);
-	} else {
-		asd->sink_pad_padding_w = 0;
-		asd->sink_pad_padding_h = 0;
-	}
+	if (atomisp_subdev_format_conversion(asd))
+		atomisp_get_pix_padding(isp, &f->fmt.pix,
+					&asd->sink_pad_padding);
+	else
+		asd->sink_pad_padding = (struct v4l2_area) { };
 
 	atomisp_get_dis_envelop(asd, f->fmt.pix.width, f->fmt.pix.height,
 				&dvs_env_w, &dvs_env_h);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index d3d1f2574..8a84e774f 100644
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
index 50366bf10..87c29a940 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -457,7 +457,7 @@ static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 					      const struct v4l2_rect *native,
 					      int *valid_sizes)
 {
-	static const struct v4l2_frmsize_discrete frame_sizes[] = {
+	static const struct v4l2_area frame_sizes[] = {
 		{ 1920, 1440 },
 		{ 1920, 1200 },
 		{ 1920, 1080 },
@@ -470,15 +470,15 @@ static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 		{  800,  600 },
 		{  640,  480 },
 	};
-	u32 padding_w, padding_h;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(frame_sizes); i++) {
-		atomisp_get_padding(isp, frame_sizes[i].width, frame_sizes[i].height,
-				    &padding_w, &padding_h);
+		struct v4l2_area padding;
 
-		if ((frame_sizes[i].width + padding_w) > native->width ||
-		    (frame_sizes[i].height + padding_h) > native->height)
+		atomisp_get_padding(isp, frame_sizes[i], &padding);
+
+		if ((frame_sizes[i].width + padding.width) > native->width ||
+		    (frame_sizes[i].height + padding.height) > native->height)
 			continue;
 
 		/*
@@ -491,7 +491,8 @@ static int atomisp_enum_framesizes_crop_inner(struct atomisp_device *isp,
 
 		if (*valid_sizes == fsize->index) {
 			fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-			fsize->discrete = frame_sizes[i];
+			fsize->discrete.width = frame_sizes[i].width;
+			fsize->discrete.height = frame_sizes[i].height;
 			return 0;
 		}
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index bdd2d9b18..495032966 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -327,8 +327,8 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 
 		if (atomisp_subdev_format_conversion(isp_sd)
 		    && crop[pad]->width && crop[pad]->height) {
-			crop[pad]->width -= isp_sd->sink_pad_padding_w;
-			crop[pad]->height -= isp_sd->sink_pad_padding_h;
+			crop[pad]->width -= isp_sd->sink_pad_padding.width;
+			crop[pad]->height -= isp_sd->sink_pad_padding.height;
 		}
 
 		if (isp_sd->params.video_dis_en &&
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index b12bb65be..0045f380d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -214,8 +214,7 @@ struct atomisp_sub_device {
 	struct media_pad pads[ATOMISP_SUBDEV_PADS_NUM];
 	struct atomisp_pad_format fmt[ATOMISP_SUBDEV_PADS_NUM];
 	/* Padding for currently set sink-pad fmt */
-	u32 sink_pad_padding_w;
-	u32 sink_pad_padding_h;
+	struct v4l2_area sink_pad_padding;
 
 	unsigned int output;
 	struct atomisp_video_pipe video_out;
-- 
2.53.0


