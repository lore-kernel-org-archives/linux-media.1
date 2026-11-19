Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102717;
	b=rNNpcBFXzNts5R48rXvCqol5nDciVwTryEAmlbB62pwqkossAUzuC5aNSe3RBjsqLnzk
	 eFgi+kO+alQ/FoqNt+P9zzhJ7V4t0E7ts9LFED1A2U5DJrvaVQEF+klL0R3c28GkQGTTb
	 UksCPu4rQRvqMzHoOvZ4HP0w4iJH88aur+w0gVVHQFtHICLrR8oPLVIA8PDgEN8LQdYXq
	 0Hx22VWGb8wBvatLlnrFZdU9QctbTVQRln0GM4kbFMqjpaP6wO49lA6jghQb6V0UfvFgc
	 R/f42ejgAP6Zr+Yinp8gftqKSzSqwlnaBYvE7axXELk1CDOno+wvtDeXFMvJBKpauJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102717;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ciG5pdhPTTyigZJiOFS5Jo7Pw6H1PU8Z9Bz0VMugX+U=;
	b=jc+Nlv1SHFlefq05YY5doT15HZ20BZjP+XD9ta2sFE2IqkPC0T0Y5CSYN0nOqrnAE3Hf
	 W6EFgtzf6oOtMLCd0RIXghK4mq+UJbWZDiYYVcbBT3QQ0SDeESWSo40ahoZBxEg6HqM0U
	 22GxrVlXQYzTS3Hhxss1Sry8wF5jUbpGiMdvbldgIgLLBH1ictXg6uLqFAawt61eD42eQ
	 F4M2iGNDHHKLuOj8ZqyMNUfDjHeD3G5rwzjIq1MFarkpcpQLSL3sGQzcnUP4qxw9jGELi
	 liiL7UTCV1VAy5pmjzadFTCoKhoRPzCigXqrQ18UniFlMNmXK01BWQ45A7a9z1wgsfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vYIIGqTF;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF0660A3836;
	Thu, 19 Nov 2026 15:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FF0660A3836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vYIIGqTF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB3A71C14;
	Thu, 19 Nov 2026 07:38:31 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 320033F882;
	Thu, 19 Nov 2026 07:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102714; bh=SbY/oUJvdoEsHFLKn0oS3oB4xAwJ03v3fPm4ArrdLMU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vYIIGqTFJWR2ka8okl5aD8zHDJj7SxNGk6DUwLnHzLrxAubTrDOc7UuzY7t7mmIl9
	 jE1lRIa/PezgWSbQpPiKghsmZoma7h6gXskPzN5JcjdUEAirQL1R7hDCivxsgaqqlc
	 EaJrK/Oervx/skCUwOZxQksj0Odx4bJJO7VNtDAI=
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
Subject: [RFC PATCH 04/28] media: mali-vpu: initialize decoder format state
Date: Thu, 19 Nov 2026 15:37:34 +0000
Message-ID: <20261119153758.1426673-5-charvi.mehta@arm.com>
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

Describe the H.264 OUTPUT format and YUV420M, NV12M and NV21M CAPTURE
formats supported by Mali-V76, together with its frame-size limits.

Add source and destination format state to each decoder session and
initialize both ports from variant defaults. Add the MVE format identifiers
required by the format descriptors.

Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 drivers/media/platform/arm/mali-vpu/Makefile  |  4 +-
 .../platform/arm/mali-vpu/mali-vpu-dec.c      | 16 ++++
 .../platform/arm/mali-vpu/mali-vpu-dec.h      | 13 +++
 .../platform/arm/mali-vpu/mali-vpu-formats.h  | 27 ++++++
 .../arm/mali-vpu/mali-vpu-protocol-def-v3.h   | 51 ++++++++++++
 .../platform/arm/mali-vpu/mali-vpu-session.c  | 83 +++++++++++++++++++
 .../platform/arm/mali-vpu/mali-vpu-session.h  | 18 ++++
 .../arm/mali-vpu/mali-vpu-variant-v76.c       | 63 ++++++++++++++
 .../platform/arm/mali-vpu/mali-vpu-variant.h  | 30 +++++++
 .../platform/arm/mali-vpu/mali-vpu-vidioc.c   |  7 ++
 10 files changed, 311 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-session.c

diff --git a/drivers/media/platform/arm/mali-vpu/Makefile b/drivers/media/platform/arm/mali-vpu/Makefile
index e659101bd0eac..0a42c53ae5088 100644
--- a/drivers/media/platform/arm/mali-vpu/Makefile
+++ b/drivers/media/platform/arm/mali-vpu/Makefile
@@ -2,6 +2,8 @@
 
 mali-vpu-objs := mali-vpu-probe.o \
 		mali-vpu-variant-v76.o \
-		mali-vpu-vidioc.o
+		mali-vpu-vidioc.o \
+		mali-vpu-session.o \
+		mali-vpu-dec.o
 
 obj-$(CONFIG_VIDEO_MALI_VPU) += mali-vpu.o
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
new file mode 100644
index 0000000000000..cb6eeee2f04df
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#include "mali-vpu-dec.h"
+#include "mali-vpu-session.h"
+#include "mali-vpu-variant.h"
+
+void mali_vpu_session_init_dec(struct mali_vpu_session *sess)
+{
+	const struct mali_vpu_format_caps *variant_fmts = &sess->vpu_dev->variant->fmt_caps;
+
+	sess->port_src.supported_fmts = variant_fmts->dec_src;
+	sess->port_dst.supported_fmts = variant_fmts->dec_dst;
+}
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h
new file mode 100644
index 0000000000000..2514c897587c4
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#ifndef __MALI_VPU_DEC_H__
+#define __MALI_VPU_DEC_H__
+
+struct mali_vpu_session;
+
+void mali_vpu_session_init_dec(struct mali_vpu_session *sess);
+
+#endif /* __MALI_VPU_DEC_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h
new file mode 100644
index 0000000000000..13031809fdb4d
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#ifndef __MALI_VPU_FORMATS_H__
+#define __MALI_VPU_FORMATS_H__
+
+#include <linux/types.h>
+
+enum mali_vpu_codec_fmt {
+	MALI_VPU_FORMAT_CODEC_H264,
+};
+
+struct mali_vpu_format_desc {
+	u32 fourcc;
+	u16 mve_frame_fmt;
+	u16 codec_fmt;
+	u32 flags;
+};
+
+struct mali_vpu_format_list {
+	const struct mali_vpu_format_desc *fmts;
+	u32 num_fmts;
+};
+
+#endif /* __MALI_VPU_FORMATS_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
new file mode 100644
index 0000000000000..aed51eec6ca9c
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#ifndef __MALI_VPU_PROTOCOL_DEF_V3_H__
+#define __MALI_VPU_PROTOCOL_DEF_V3_H__
+
+/*****************************************************************************
+ *
+ * Communication protocol between the host/driver and the MVE firmware,
+ * the 'host interface'.
+ *
+ * MVE == MALI Video Engine
+ *
+ * Protocol version 3.1
+ *
+ * Note: Message structs may be expanded in the future; the host should
+ * use the 'size' of the message to determine how many bytes to
+ * read from the message queue, rather than a sizeof(struct).
+ *
+ * All multibyte integer fields in the shared-memory interface are little-endian.
+ * The driver supports only little-endian kernels and therefore accesses these
+ * fields in native byte order.
+ *
+ ****************************************************************************/
+
+ #define MVE_CHROMA_FORMAT_420 (0x1)
+
+/* format bitfield: */
+#define MVE_FORMAT_BF_C  (0) /* 3 bits, chroma subsampling   */
+#define MVE_FORMAT_BF_B  (4) /* 4 bits, max bitdepth minus 8 */
+#define MVE_FORMAT_BF_N  (8) /* 2 bits, number of planes     */
+#define MVE_FORMAT_BF_V (12) /* 2 bits, format variant       */
+/* formats: */
+#define MVE_FORMAT_YUV420_I420	((MVE_CHROMA_FORMAT_420  << MVE_FORMAT_BF_C) | \
+				((8 - 8) << MVE_FORMAT_BF_B) | \
+				(3 << MVE_FORMAT_BF_N) | \
+				(0 << MVE_FORMAT_BF_V))
+
+#define MVE_FORMAT_YUV420_NV12	((MVE_CHROMA_FORMAT_420  << MVE_FORMAT_BF_C) | \
+				((8 - 8) << MVE_FORMAT_BF_B) | \
+				(2 << MVE_FORMAT_BF_N) | \
+				(0 << MVE_FORMAT_BF_V))
+
+#define MVE_FORMAT_YUV420_NV21	((MVE_CHROMA_FORMAT_420  << MVE_FORMAT_BF_C) | \
+				((8 - 8) << MVE_FORMAT_BF_B) | \
+				(2 << MVE_FORMAT_BF_N) | \
+				(1 << MVE_FORMAT_BF_V))
+
+#endif /* __MALI_VPU_PROTOCOL_DEF_V3_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
new file mode 100644
index 0000000000000..9bcb3a73a582e
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#include <linux/errno.h>
+#include <linux/minmax.h>
+#include <linux/mm.h>
+#include <linux/string.h>
+#include <media/v4l2-common.h>
+
+#include "mali-vpu-session.h"
+#include "mali-vpu-dec.h"
+#include "mali-vpu-variant.h"
+
+static int mali_vpu_set_port_fmt(struct mali_vpu_port *port,
+				 enum v4l2_buf_type type,
+				 u32 width, u32 height)
+{
+	struct v4l2_pix_format_mplane *pix_mp = &port->curr_fmt.fmt.pix_mp;
+	const struct mali_vpu_format_desc *fmt_default;
+	int ret;
+
+	if (!port->supported_fmts.fmts || !port->supported_fmts.num_fmts)
+		return -EINVAL;
+
+	fmt_default = &port->supported_fmts.fmts[0];
+
+	memset(&port->curr_fmt, 0, sizeof(port->curr_fmt));
+	port->curr_fmt.type = type;
+
+	if (fmt_default->flags & V4L2_FMT_FLAG_COMPRESSED) {
+		pix_mp->pixelformat = fmt_default->fourcc;
+		pix_mp->num_planes = 1;
+		pix_mp->width = width;
+		pix_mp->height = height;
+		pix_mp->plane_fmt[0].bytesperline = 0;
+
+		/*
+		 * Use one byte per pixel as the default compressed sizeimage,
+		 * with a minimum of one page, aligned to a page boundary.
+		 */
+		pix_mp->plane_fmt[0].sizeimage = PAGE_ALIGN(max_t(u32, PAGE_SIZE, width * height));
+	} else {
+		ret = v4l2_fill_pixfmt_mp(pix_mp, fmt_default->fourcc, width, height);
+		if (ret)
+			return ret;
+	}
+
+	pix_mp->field = V4L2_FIELD_NONE;
+
+	return 0;
+}
+
+static int mali_vpu_set_port_defaults(struct mali_vpu_session *sess)
+{
+	const struct mali_vpu_framesize_caps *fmsz = &sess->vpu_dev->variant->frmsz_caps;
+	int ret;
+
+	ret = mali_vpu_set_port_fmt(&sess->port_src, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+				    fmsz->width_default, fmsz->height_default);
+	if (ret)
+		return ret;
+
+	return mali_vpu_set_port_fmt(&sess->port_dst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+				    fmsz->width_default, fmsz->height_default);
+}
+
+int mali_vpu_session_init(struct mali_vpu_session *sess)
+{
+	int ret;
+
+	if (sess->role != MALI_VPU_DECODER)
+		return -EINVAL;
+
+	mali_vpu_session_init_dec(sess);
+
+	ret = mali_vpu_set_port_defaults(sess);
+	if (ret)
+		return ret;
+
+	return 0;
+}
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
index 7166c53236f1a..a2778ca496381 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
@@ -6,21 +6,39 @@
 #ifndef __MALI_VPU_SESSION_H__
 #define __MALI_VPU_SESSION_H__
 
+#include <linux/videodev2.h>
 #include <media/v4l2-fh.h>
 
 #include "mali-vpu-device.h"
+#include "mali-vpu-formats.h"
+
+/**
+ * struct mali_vpu_port - format state of a src/dst queue in a session.
+ * @curr_fmt: V4L2 format currently configured for the port
+ * @supported_fmts: List of format descriptors supported by the queue.
+ */
+struct mali_vpu_port {
+	struct v4l2_format		curr_fmt;
+	struct mali_vpu_format_list	supported_fmts;
+};
 
 /**
  * struct mali_vpu_session - holds per session state and resources.
  * @vpu_dev: Reference to the parent device structure.
  * @role: Role of this session.
+ * @port_src: Source (OUTPUT) port for this session.
+ * @port_dst: Destination (CAPTURE) port for this session.
  * @fh: V4L2 file handle for this session.
  */
 struct mali_vpu_session {
 	struct mali_vpu_dev		*vpu_dev;
 	enum mali_vpu_session_role	role;
+	struct mali_vpu_port		port_src;
+	struct mali_vpu_port		port_dst;
 
 	struct v4l2_fh		fh;
 };
 
+int mali_vpu_session_init(struct mali_vpu_session *sess);
+
 #endif /* __MALI_VPU_SESSION_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
index 36509d6a1c5d5..7b04b51eeedc2 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
@@ -4,18 +4,81 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/videodev2.h>
 
+#include "mali-vpu-formats.h"
+#include "mali-vpu-protocol-def-v3.h"
 #include "mali-vpu-variant.h"
 
 #define MALI_VPU_HW_PID_V76 0x56627
 
+#define MALI_V76_MAX_FRAME_WIDTH 8192
+#define MALI_V76_MAX_FRAME_HEIGHT 8192
+#define MALI_V76_MIN_FRAME_WIDTH 2
+#define MALI_V76_MIN_FRAME_HEIGHT 2
+#define MALI_V76_DEFAULT_FRAME_WIDTH 640
+#define MALI_V76_DEFAULT_FRAME_HEIGHT 480
+
 static const char * const mali_v76_rst_names[] = {
 	"warm",
 };
 
+static const struct mali_vpu_format_desc mali_v76_dec_src_fmts[] = {
+	{
+		.fourcc		= V4L2_PIX_FMT_H264,
+		.mve_frame_fmt	= 0,
+		.codec_fmt	= MALI_VPU_FORMAT_CODEC_H264,
+		.flags		= V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_DYN_RESOLUTION,
+	},
+};
+
+static const struct mali_vpu_format_desc mali_v76_dec_dst_fmts[] = {
+	{
+		.fourcc		= V4L2_PIX_FMT_YUV420M,
+		.mve_frame_fmt	= MVE_FORMAT_YUV420_I420,
+		.codec_fmt	= 0,
+		.flags		= 0,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_NV12M,
+		.mve_frame_fmt	= MVE_FORMAT_YUV420_NV12,
+		.codec_fmt	= 0,
+		.flags		= 0,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_NV21M,
+		.mve_frame_fmt	= MVE_FORMAT_YUV420_NV21,
+		.codec_fmt	= 0,
+		.flags		= 0,
+	},
+};
+
 const struct mali_vpu_variant mali_vpu_v76_variant = {
 	.expected_hw_pid = MALI_VPU_HW_PID_V76,
 
 	.rst_names = mali_v76_rst_names,
 	.num_rsts = ARRAY_SIZE(mali_v76_rst_names),
+
+	.fmt_caps = {
+		.dec_src = {
+			.fmts = mali_v76_dec_src_fmts,
+			.num_fmts = ARRAY_SIZE(mali_v76_dec_src_fmts),
+		},
+		.dec_dst = {
+			.fmts = mali_v76_dec_dst_fmts,
+			.num_fmts = ARRAY_SIZE(mali_v76_dec_dst_fmts),
+		},
+	},
+	.frmsz_caps = {
+		.stepwise = {
+			.min_width = MALI_V76_MIN_FRAME_WIDTH,
+			.max_width = MALI_V76_MAX_FRAME_WIDTH,
+			.step_width = 2,
+			.min_height = MALI_V76_MIN_FRAME_HEIGHT,
+			.max_height = MALI_V76_MAX_FRAME_HEIGHT,
+			.step_height = 2,
+		},
+		.width_default = MALI_V76_DEFAULT_FRAME_WIDTH,
+		.height_default = MALI_V76_DEFAULT_FRAME_HEIGHT,
+	},
 };
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
index dadfd686275db..a46c25a94f18b 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
@@ -7,17 +7,47 @@
 #define __MALI_VPU_VARIANT_H__
 
 #include <linux/types.h>
+#include <linux/videodev2.h>
+
+#include "mali-vpu-formats.h"
+
+/**
+ * struct mali_vpu_framesize_caps - Variant-specific frame size capability.
+ * @stepwise: Stepwise frame size limits and increments supported by the hardware.
+ * @width_default: Default width used when userspace does not request one.
+ * @height_default: Default height used when userspace does not request one.
+ */
+struct mali_vpu_framesize_caps {
+	struct v4l2_frmsize_stepwise stepwise;
+	u32 width_default;
+	u32 height_default;
+};
+
+/**
+ * struct mali_vpu_format_caps - Pixel/coded format capability tables.
+ * @dec_src: List of formats supported on decoder OUTPUT queue (compressed bitstream in).
+ * @dec_dst: List of formats supported on decoder CAPTURE queue (decoded raw frames).
+ */
+struct mali_vpu_format_caps {
+	const struct mali_vpu_format_list dec_src;
+	const struct mali_vpu_format_list dec_dst;
+};
 
 /**
  * struct mali_vpu_variant - Variant-specific hardware capability descriptor.
  * @rst_names: Array of reset control names for this variant.
  * @num_rsts: Number of reset controls for this variant.
  * @expected_hw_pid: Expected hardware product ID read from the version register.
+ * @fmt_caps: Format capability tables for encode/decode paths.
+ * @frmsz_caps: Frame dimension limits and defaults.
  */
 struct mali_vpu_variant {
 	const char * const *rst_names;
 	unsigned int num_rsts;
 	u32 expected_hw_pid;
+
+	struct mali_vpu_format_caps	fmt_caps;
+	struct mali_vpu_framesize_caps	frmsz_caps;
 };
 
 extern const struct mali_vpu_variant mali_vpu_v76_variant;
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
index 7a169b7b14bf3..13468c6baba76 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
@@ -37,8 +37,15 @@ static int mali_vpu_open(struct file *filp)
 	v4l2_fh_init(&sess->fh, vdev);
 	v4l2_fh_add(&sess->fh, filp);
 
+	ret = mali_vpu_session_init(sess);
+	if (ret)
+		goto err_v4l2_fh_deinit;
+
 	return 0;
 
+err_v4l2_fh_deinit:
+	v4l2_fh_del(&sess->fh, filp);
+	v4l2_fh_exit(&sess->fh);
 err_free_sess:
 	kfree(sess);
 	return ret;
-- 
2.43.0

