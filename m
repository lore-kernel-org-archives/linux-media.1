Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102737;
	b=dUAEnxIK7mWs+2AvAlRfJE0dTYV4C1lXCp6VB6bXeFvds11o35DruyXR3347bAEeU+0p
	 +0XQ/OtTutGxxin0ryOgJo6+VAoX6bWBznIRNy2xVzF491Hoti071NtWCTjEXd1DANVDi
	 uLJnQl9e61ns5IafwG/rVq2nOcAhblZurxj1WdTI3mMElvryRvdiOUo/8LGy7QT3DI2pY
	 3acICVV3WI+mOehykWVx/YUerQUZN8emIGYD9+WgdUupC8gGCqVK2tJGtKP3lGBwBi9vd
	 dAH2wF1FUq/NiPe1NptTk4TK1BOehjK49nB2fLdKW2IYxWtw1cCPO2Y6pv06woR9ckg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102737;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SblzndgWuxBESsMbvgL1Kl/cf6qJE1+ZpEWgIKNJvXI=;
	b=htdVM0UiKqTU3lp9wDeg3xptvPjEwoEyu73qYHfiYQsjQRQJqXvAEs93aioAPv/ModZP
	 Sz6Pyv0vXaQbPNkxQU5Zz9cV6RD74hSFiE9f3r8ar9bfQvvTiZF1Cr0WkPISt0dJJCZik
	 D17mEa/ZzQkiJs3q7a/+gVHdKFjR2hv0sd+/M0m81Lnw8hgRjHN/kX8p2PMlf4y4HbMEc
	 Sb6vL6RitAgR7F3ivKXzDNoxj4ZEO3hRmdkKY3c9P7uMATp7bavq5IFIEFdJJHsKqc6tw
	 gZZNt2GSacUHBZdRUIZJcpicru9YepDTjdUPxUJZlaPdHzZhrkA/A+tD4bJv7YNH6ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TCgQtHsx;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872BA606A32A;
	Thu, 19 Nov 2026 15:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 872BA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TCgQtHsx
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21D4A1C01;
	Thu, 19 Nov 2026 07:38:37 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D92A3F882;
	Thu, 19 Nov 2026 07:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102720; bh=xCBC+IE/uhfiW5BLQw9T3NFTTbgxZ//j9x0ngvdunWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TCgQtHsxM4GGlZiJ1Vu9sZ+OZTonKwLq9cFAw7O3+HbE26vGQ5IUfL24LoRKKeG/z
	 ERmUv/aWYVahjT5tJZELMZh7zFenlNKj/J0BPd6BK36WNSyX8MRiJI3ysfhXorF+Ch
	 XiXMRF6MnRRchQA9dIBw/k+mMdFh1qhWJgMZI9RM=
From: Charvi Mehta <charvi.mehta@arm.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Charvi Mehta <charvi.mehta@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Rathinavel Sankaralingam <rath.sankaralingam@arm.com>,
	Shobhit Pandey <shobhit.pandey@arm.com>
Subject: [RFC PATCH 07/28] media: mali-vpu: implement TRY_FMT and S_FMT ioctls
Date: Thu, 19 Nov 2026 15:37:37 +0000
Message-ID: <20261119153758.1426673-8-charvi.mehta@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119153758.1426673-1-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
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

Implement VIDIOC_TRY_FMT and VIDIOC_S_FMT for the decoder OUTPUT and
CAPTURE queues.

Move format lookup and buffer layout calculation into shared helpers so
session initialization and format negotiation use the same sizing rules.

Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 drivers/media/platform/arm/mali-vpu/Makefile  |   3 +-
 .../platform/arm/mali-vpu/mali-vpu-formats.c  |  81 +++++++++++
 .../platform/arm/mali-vpu/mali-vpu-formats.h  |  10 ++
 .../platform/arm/mali-vpu/mali-vpu-session.c  |  24 +---
 .../platform/arm/mali-vpu/mali-vpu-vidioc.c   | 132 +++++++++++++++---
 5 files changed, 209 insertions(+), 41 deletions(-)
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-formats.c

diff --git a/drivers/media/platform/arm/mali-vpu/Makefile b/drivers/media/platform/arm/mali-vpu/Makefile
index 94ddde02fc528..1dc62621d9dc0 100644
--- a/drivers/media/platform/arm/mali-vpu/Makefile
+++ b/drivers/media/platform/arm/mali-vpu/Makefile
@@ -6,6 +6,7 @@ mali-vpu-objs := mali-vpu-probe.o \
 		mali-vpu-session.o \
 		mali-vpu-dec.o \
 		mali-vpu-buffer.o \
-		mali-vpu-vb2.o
+		mali-vpu-vb2.o \
+		mali-vpu-formats.o
 
 obj-$(CONFIG_VIDEO_MALI_VPU) += mali-vpu.o
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.c
new file mode 100644
index 0000000000000..d268435432371
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#include <linux/errno.h>
+#include <linux/minmax.h>
+#include <linux/mm.h>
+#include <linux/overflow.h>
+#include <linux/string.h>
+#include <media/v4l2-common.h>
+
+#include "mali-vpu-formats.h"
+#include "mali-vpu-session.h"
+
+const struct mali_vpu_format_desc *
+mali_vpu_find_format(struct mali_vpu_session *sess, u32 pixfmt,
+		     enum v4l2_buf_type type)
+{
+	const struct mali_vpu_format_list *fmt_list;
+	u32 i;
+
+	switch (type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		fmt_list = &sess->port_src.supported_fmts;
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		fmt_list = &sess->port_dst.supported_fmts;
+		break;
+	default:
+		return NULL;
+	}
+
+	for (i = 0; i < fmt_list->num_fmts; i++) {
+		if (fmt_list->fmts[i].fourcc == pixfmt)
+			return &fmt_list->fmts[i];
+	}
+
+	return NULL;
+}
+
+int mali_vpu_fill_pixmp_fmt(const struct mali_vpu_format_desc *fmt,
+			    u32 width, u32 height,
+			    struct v4l2_pix_format_mplane *pix_mp)
+{
+	u32 sizeimage;
+	int ret;
+
+	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
+	memset(pix_mp->plane_fmt, 0, sizeof(pix_mp->plane_fmt));
+	pix_mp->flags = 0;
+
+	if (fmt->flags & V4L2_FMT_FLAG_COMPRESSED) {
+		pix_mp->width = width;
+		pix_mp->height = height;
+		pix_mp->pixelformat = fmt->fourcc;
+		pix_mp->num_planes = 1;
+		pix_mp->plane_fmt[0].bytesperline = 0;
+
+		/*
+		 * Use one byte per pixel as the default compressed sizeimage,
+		 * with a minimum of one page, aligned to a page boundary.
+		 */
+		if (check_mul_overflow(width, height, &sizeimage))
+			return -EOVERFLOW;
+
+		sizeimage = max_t(u32, PAGE_SIZE, sizeimage);
+
+		if (sizeimage > U32_MAX - (PAGE_SIZE - 1))
+			return -EOVERFLOW;
+
+		pix_mp->plane_fmt[0].sizeimage = PAGE_ALIGN(sizeimage);
+
+	} else {
+		ret = v4l2_fill_pixfmt_mp(pix_mp, fmt->fourcc, width, height);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h
index 13031809fdb4d..5703142b93b46 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h
@@ -7,6 +7,9 @@
 #define __MALI_VPU_FORMATS_H__
 
 #include <linux/types.h>
+#include <linux/videodev2.h>
+
+struct mali_vpu_session;
 
 enum mali_vpu_codec_fmt {
 	MALI_VPU_FORMAT_CODEC_H264,
@@ -24,4 +27,11 @@ struct mali_vpu_format_list {
 	u32 num_fmts;
 };
 
+const struct mali_vpu_format_desc *mali_vpu_find_format(struct mali_vpu_session *sess,
+							u32 pixfmt,
+							enum v4l2_buf_type type);
+int mali_vpu_fill_pixmp_fmt(const struct mali_vpu_format_desc *fmt,
+			    u32 width, u32 height,
+			    struct v4l2_pix_format_mplane *pix_mp);
+
 #endif /* __MALI_VPU_FORMATS_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
index 95050296f9904..6867f51287f48 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
@@ -5,14 +5,12 @@
 
 #include <linux/err.h>
 #include <linux/errno.h>
-#include <linux/minmax.h>
-#include <linux/mm.h>
 #include <linux/string.h>
-#include <media/v4l2-common.h>
 #include <media/v4l2-mem2mem.h>
 
 #include "mali-vpu-session.h"
 #include "mali-vpu-dec.h"
+#include "mali-vpu-formats.h"
 #include "mali-vpu-variant.h"
 #include "mali-vpu-vb2.h"
 
@@ -32,23 +30,9 @@ static int mali_vpu_set_port_fmt(struct mali_vpu_port *port,
 	memset(&port->curr_fmt, 0, sizeof(port->curr_fmt));
 	port->curr_fmt.type = type;
 
-	if (fmt_default->flags & V4L2_FMT_FLAG_COMPRESSED) {
-		pix_mp->pixelformat = fmt_default->fourcc;
-		pix_mp->num_planes = 1;
-		pix_mp->width = width;
-		pix_mp->height = height;
-		pix_mp->plane_fmt[0].bytesperline = 0;
-
-		/*
-		 * Use one byte per pixel as the default compressed sizeimage,
-		 * with a minimum of one page, aligned to a page boundary.
-		 */
-		pix_mp->plane_fmt[0].sizeimage = PAGE_ALIGN(max_t(u32, PAGE_SIZE, width * height));
-	} else {
-		ret = v4l2_fill_pixfmt_mp(pix_mp, fmt_default->fourcc, width, height);
-		if (ret)
-			return ret;
-	}
+	ret = mali_vpu_fill_pixmp_fmt(fmt_default, width, height, pix_mp);
+	if (ret)
+		return ret;
 
 	pix_mp->field = V4L2_FIELD_NONE;
 
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
index b993255b8c817..dd142527a1a0c 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <media/v4l2-common.h>
 #include <media/v4l2-dev.h>
 #include <media/v4l2-fh.h>
 #include <media/v4l2-ioctl.h>
@@ -168,32 +169,119 @@ static int mali_vpu_g_fmt(struct file *filp, void *fh, struct v4l2_format *fmt)
 	return ret;
 }
 
-static const struct mali_vpu_format_desc *mali_vpu_find_format(struct mali_vpu_session *sess,
-							       u32 pixfmt, u32 type)
+static int mali_vpu_try_format_common(struct mali_vpu_session *sess, struct v4l2_format *fmt)
 {
-	const struct mali_vpu_format_desc *fmt_list;
-	u32 num_fmts;
-	u32 i;
+	const struct mali_vpu_framesize_caps *fmsz = &sess->vpu_dev->variant->frmsz_caps;
+	struct v4l2_pix_format_mplane *pix_mp = &fmt->fmt.pix_mp;
+	const struct mali_vpu_format_desc *vpu_fmt;
+	const struct v4l2_format *port_fmt, *port_fmt_dec;
+	struct vb2_queue *src_q;
+	u32 w, h;
+	int ret = 0;
 
-	switch (type) {
-	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		fmt_list = sess->port_src.supported_fmts.fmts;
-		num_fmts = sess->port_src.supported_fmts.num_fmts;
-		break;
-	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		fmt_list = sess->port_dst.supported_fmts.fmts;
-		num_fmts = sess->port_dst.supported_fmts.num_fmts;
-		break;
-	default:
-		return NULL;
+	vpu_fmt = mali_vpu_find_format(sess, pix_mp->pixelformat, fmt->type);
+	if (!vpu_fmt) {
+		port_fmt = mali_vpu_get_port_fmt(sess, fmt->type);
+		if (!port_fmt)
+			return -EINVAL;
+
+		*pix_mp = port_fmt->fmt.pix_mp;
+		return 0;
+	}
+
+	/* Requested format found, validate other fields */
+	w = pix_mp->width ? pix_mp->width : fmsz->width_default;
+	h = pix_mp->height ? pix_mp->height : fmsz->height_default;
+
+	v4l2_apply_frmsize_constraints(&w, &h, &fmsz->stepwise);
+
+	/* Decode CAPTURE queue: lock geometry to input if streaming */
+	if (sess->role == MALI_VPU_DECODER && fmt->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		src_q = v4l2_m2m_get_src_vq(sess->m2m_ctx);
+		if (vb2_is_streaming(src_q)) {
+			port_fmt_dec = &sess->port_src.curr_fmt;
+			w = port_fmt_dec->fmt.pix_mp.width;
+			h = port_fmt_dec->fmt.pix_mp.height;
+		}
+	}
+
+	ret = mali_vpu_fill_pixmp_fmt(vpu_fmt, w, h, pix_mp);
+	if (ret)
+		return ret;
+
+	if (pix_mp->field == V4L2_FIELD_ANY)
+		pix_mp->field = V4L2_FIELD_NONE;
+
+	return 0;
+}
+
+static int mali_vpu_try_fmt(struct file *filp, void *fh, struct v4l2_format *fmt)
+{
+	struct mali_vpu_session *sess = mali_vpu_get_session(filp);
+	int ret;
+
+	mutex_lock(&sess->vq_lock);
+
+	ret = mali_vpu_try_format_common(sess, fmt);
+
+	mutex_unlock(&sess->vq_lock);
+	return ret;
+}
+
+static int mali_vpu_s_fmt(struct file *filp, void *fh, struct v4l2_format *fmt)
+{
+	struct mali_vpu_session *sess = mali_vpu_get_session(filp);
+	struct vb2_queue *vq;
+	struct v4l2_pix_format_mplane *pixmp_src = &sess->port_src.curr_fmt.fmt.pix_mp;
+	struct v4l2_pix_format_mplane *pixmp_dst = &sess->port_dst.curr_fmt.fmt.pix_mp;
+	int ret = 0;
+
+	mutex_lock(&sess->vq_lock);
+
+	vq = v4l2_m2m_get_vq(sess->m2m_ctx, fmt->type);
+	if (vb2_is_busy(vq)) {
+		ret = -EBUSY;
+		goto mutex_unlock_return;
 	}
 
-	for (i = 0; i < num_fmts; i++) {
-		if (fmt_list[i].fourcc == pixfmt)
-			return &fmt_list[i];
+	ret = mali_vpu_try_format_common(sess, fmt);
+	if (ret)
+		goto mutex_unlock_return;
+
+	/* OUTPUT provides initial CAPTURE geometry */
+	if (V4L2_TYPE_IS_OUTPUT(fmt->type)) {
+		const struct mali_vpu_format_desc *cap_fmt;
+		struct v4l2_pix_format_mplane *cap;
+		struct v4l2_pix_format_mplane *fmt_mp = &fmt->fmt.pix_mp;
+
+		cap = &sess->port_dst.curr_fmt.fmt.pix_mp;
+		cap_fmt = mali_vpu_find_format(sess, cap->pixelformat,
+					       V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+		if (!cap_fmt) {
+			ret = -EINVAL;
+			goto mutex_unlock_return;
+		}
+
+		ret = mali_vpu_fill_pixmp_fmt(cap_fmt, fmt_mp->width, fmt_mp->height, cap);
+		if (ret)
+			goto mutex_unlock_return;
 	}
 
-	return NULL;
+	if (V4L2_TYPE_IS_OUTPUT(fmt->type))
+		sess->port_src.curr_fmt = *fmt;
+	else
+		sess->port_dst.curr_fmt = *fmt;
+
+	/* Keep peer queue colorimetry aligned with input */
+	if (V4L2_TYPE_IS_OUTPUT(fmt->type)) {
+		pixmp_dst->colorspace	= pixmp_src->colorspace;
+		pixmp_dst->ycbcr_enc	= pixmp_src->ycbcr_enc;
+		pixmp_dst->quantization = pixmp_src->quantization;
+		pixmp_dst->xfer_func	= pixmp_src->xfer_func;
+	}
+mutex_unlock_return:
+	mutex_unlock(&sess->vq_lock);
+	return ret;
 }
 
 static int mali_vpu_validate_format(struct mali_vpu_session *sess, u32 pixfmt)
@@ -236,6 +324,10 @@ const struct v4l2_ioctl_ops mali_vpu_ioctl_ops_dec = {
 	.vidioc_enum_fmt_vid_cap	= mali_vpu_enum_fmt,
 	.vidioc_g_fmt_vid_out_mplane	= mali_vpu_g_fmt,
 	.vidioc_g_fmt_vid_cap_mplane	= mali_vpu_g_fmt,
+	.vidioc_s_fmt_vid_out_mplane	= mali_vpu_s_fmt,
+	.vidioc_s_fmt_vid_cap_mplane	= mali_vpu_s_fmt,
+	.vidioc_try_fmt_vid_out_mplane	= mali_vpu_try_fmt,
+	.vidioc_try_fmt_vid_cap_mplane	= mali_vpu_try_fmt,
 	.vidioc_reqbufs			= v4l2_m2m_ioctl_reqbufs,
 	.vidioc_querybuf		= v4l2_m2m_ioctl_querybuf,
 	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
-- 
2.43.0

