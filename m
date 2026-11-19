Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102718;
	b=TWL6mEKDfPrS3QT1rM6l6MPcRcJF7F2L9V9wqXGmV0ztp48M4bCEew+IBIssOkhKuyrk
	 wVpA/UNX5QoBQ5ePGCdvtdYlF+zfcR8liUI5hWSvFBiHs8HCCbNvbtkNAllAz5uMIuvNl
	 r43axsQ6BWrpruiH4BJ9Vko+xEmulnXtg4KIOSe5+C8mC8END3Fu888wPjAhm9SLLExJY
	 JuNm3v8tyq9fprwEP/+rrFV+blyTpDhU45cd2c5H/tsnPXoJ8vQF+u1P5liPWbZdh5foa
	 BPMlPROTAmflWcgoP/v66AZRrxbWb9JK2zYMCfV1FTKyIqfpS2kNMaEjqYNnq6HVR6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102718;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/H6kA7cbramnH+4HLdM3bCQzdWlNVbYjYnYAOO4jEb8=;
	b=wZFg+qbgbGyY76skZ/jB1u0gRDYVx5jCU0t8NqAxRP4SObLdGL36vp+DCOs2Wt/qW+rb
	 vtnGg7PGW34Kfoo0aFPUa7/K31dRKBA0pssjDBi1tQ4WAecKHF13xxLwC/wHSH1VJDRFF
	 ILww0R0jK0ipuQYF4Y1swDN/kkU71ZpkL58DLZ0KWms7uHVH99kH0ZpNkNM8k+qeT1z/f
	 69Mntkior12EXpsvSMZflwt21gTxNWqKvN2sAIsUFT/9BrAUN1kqzh3RTuvAHocH1jMqV
	 nHLIIIqSr7exfIH2G67il9b0DZaiVyVvMcCCjgpM8IdQoBZAPytXo29XKkRAkb6FKkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BQKiYBup;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB0660A5BC3;
	Thu, 19 Nov 2026 15:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECB0660A5BC3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BQKiYBup
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8869D1C0A;
	Thu, 19 Nov 2026 07:38:33 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F33763F882;
	Thu, 19 Nov 2026 07:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102716; bh=GkVbuafZUOi+o/aZy6TQs+XlVd9ge0s7JkRPTxc0FvU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BQKiYBup0Xcm/hg3Cm5tdBIRmRHycXHu/yMOL7umoZrOWNvgtAWqti/ekOaAZTt29
	 LMyjPaPQYc6xITe2GdA/W/by4W7TWv9ReilSdzQao+2QoyEiRspOvpWLMJwAOyeguP
	 8iMVPsw9UwhTc1fyMwRxa1B23nnJXRNZ3snj+6nQ=
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
Subject: [RFC PATCH 05/28] media: mali-vpu: add V4L2 mem2mem and VB2 queue support
Date: Thu, 19 Nov 2026 15:37:35 +0000
Message-ID: <20261119153758.1426673-6-charvi.mehta@arm.com>
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

Initialize the V4L2 mem2mem device and create a mem2mem context for each
session.

Add VB2 operations for queue setup, buffer initialization, validation,
preparation and queueing using the DMA scatter-gather allocator. Wire
up the standard mem2mem buffer ioctls together with mmap and poll support.

Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 drivers/media/platform/arm/mali-vpu/Kconfig   |  2 +
 drivers/media/platform/arm/mali-vpu/Makefile  |  4 +-
 .../platform/arm/mali-vpu/mali-vpu-buffer.c   | 51 ++++++++++
 .../platform/arm/mali-vpu/mali-vpu-buffer.h   | 21 ++++
 .../platform/arm/mali-vpu/mali-vpu-device.h   |  3 +
 .../platform/arm/mali-vpu/mali-vpu-probe.c    | 12 ++-
 .../platform/arm/mali-vpu/mali-vpu-session.c  | 37 ++++++-
 .../platform/arm/mali-vpu/mali-vpu-session.h  |  8 ++
 .../platform/arm/mali-vpu/mali-vpu-vb2.c      | 99 +++++++++++++++++++
 .../platform/arm/mali-vpu/mali-vpu-vb2.h      | 13 +++
 .../platform/arm/mali-vpu/mali-vpu-vidioc.c   | 35 ++++++-
 .../platform/arm/mali-vpu/mali-vpu-vidioc.h   |  2 +
 12 files changed, 281 insertions(+), 6 deletions(-)
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.h

diff --git a/drivers/media/platform/arm/mali-vpu/Kconfig b/drivers/media/platform/arm/mali-vpu/Kconfig
index d98872f2b7ec0..2728830f11a4a 100644
--- a/drivers/media/platform/arm/mali-vpu/Kconfig
+++ b/drivers/media/platform/arm/mali-vpu/Kconfig
@@ -4,6 +4,8 @@ config VIDEO_MALI_VPU
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV
 	depends on !CPU_BIG_ENDIAN
+	select V4L2_MEM2MEM_DEV
+	select VIDEOBUF2_DMA_SG
 	help
 	  Enable this to support Arm's Mali Video hardware accelerator.
 	  This is a V4L2 driver.
diff --git a/drivers/media/platform/arm/mali-vpu/Makefile b/drivers/media/platform/arm/mali-vpu/Makefile
index 0a42c53ae5088..94ddde02fc528 100644
--- a/drivers/media/platform/arm/mali-vpu/Makefile
+++ b/drivers/media/platform/arm/mali-vpu/Makefile
@@ -4,6 +4,8 @@ mali-vpu-objs := mali-vpu-probe.o \
 		mali-vpu-variant-v76.o \
 		mali-vpu-vidioc.o \
 		mali-vpu-session.o \
-		mali-vpu-dec.o
+		mali-vpu-dec.o \
+		mali-vpu-buffer.o \
+		mali-vpu-vb2.o
 
 obj-$(CONFIG_VIDEO_MALI_VPU) += mali-vpu.o
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c
new file mode 100644
index 0000000000000..7ace0489996a8
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#include <linux/errno.h>
+
+#include "mali-vpu-buffer.h"
+#include "mali-vpu-session.h"
+
+int mali_vpu_vb2_buffer_init(struct vb2_buffer *vb2_buf)
+{
+	struct mali_vpu_session *sess = vb2_get_drv_priv(vb2_buf->vb2_queue);
+
+	if (vb2_buf->num_planes > MALI_VPU_BUFFER_MAX_PLANES) {
+		dev_err(sess->vpu_dev->dev,
+			"buffer has too many planes: %u\n",
+			vb2_buf->num_planes);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int mali_vpu_vb2_buffer_prepare(struct vb2_buffer *vb2_buf)
+{
+	struct mali_vpu_session *sess = vb2_get_drv_priv(vb2_buf->vb2_queue);
+	struct mali_vpu_port *port;
+	struct v4l2_pix_format_mplane *pix_mp;
+	u32 i;
+
+	port = V4L2_TYPE_IS_OUTPUT(vb2_buf->vb2_queue->type) ? &sess->port_src :
+							       &sess->port_dst;
+	pix_mp = &port->curr_fmt.fmt.pix_mp;
+
+	for (i = 0; i < pix_mp->num_planes; i++) {
+		if (vb2_plane_size(vb2_buf, i) < pix_mp->plane_fmt[i].sizeimage)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+int mali_vpu_vb2_buffer_out_validate(struct vb2_buffer *vb2_buf)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb2_buf);
+
+	v4l2_buf->field = V4L2_FIELD_NONE;
+
+	return 0;
+}
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.h
new file mode 100644
index 0000000000000..f5d67d48e5921
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#ifndef __MALI_VPU_BUFFER_H__
+#define __MALI_VPU_BUFFER_H__
+
+#include <media/v4l2-mem2mem.h>
+
+#define MALI_VPU_BUFFER_MAX_PLANES 3
+
+struct mali_vpu_buffer {
+	struct v4l2_m2m_buffer m2m_buf;
+};
+
+int mali_vpu_vb2_buffer_init(struct vb2_buffer *vb2_buf);
+int mali_vpu_vb2_buffer_prepare(struct vb2_buffer *vb2_buf);
+int mali_vpu_vb2_buffer_out_validate(struct vb2_buffer *vb2_buf);
+
+#endif /* __MALI_VPU_BUFFER_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
index d9b0801cbb520..26b2bf9e1588e 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
@@ -12,6 +12,7 @@
 #define MALI_VPU_DRV_NAME "mali-vpu"
 
 struct clk_bulk_data;
+struct v4l2_m2m_dev;
 struct mali_vpu_variant;
 struct reset_control_bulk_data;
 
@@ -35,6 +36,7 @@ enum mali_vpu_session_role {
  * @variant: Structure describing variant-specific features and capabilities.
  * @v4l2_dev: V4L2 device structure for mali vpu.
  * @vdev_dec: Video device structure for decoder.
+ * @m2m_dev: V4L2 mem2mem device structure for mali vpu.
  */
 struct mali_vpu_dev {
 	struct device			*dev;
@@ -48,6 +50,7 @@ struct mali_vpu_dev {
 	const struct mali_vpu_variant	*variant;
 	struct v4l2_device		v4l2_dev;
 	struct video_device		*vdev_dec;
+	struct v4l2_m2m_dev		*m2m_dev;
 };
 
 #endif /* __MALI_VPU_DEVICE_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
index 6d21cb731ee1d..36a25030d7324 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
@@ -18,6 +18,7 @@
 #include <linux/string.h>
 #include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-mem2mem.h>
 
 #include "mali-vpu-device.h"
 #include "mali-vpu-registers.h"
@@ -218,14 +219,22 @@ static int mali_vpu_probe(struct platform_device *pdev)
 		goto err_rst_clk;
 	}
 
+	vpu_dev->m2m_dev = v4l2_m2m_init(&mali_vpu_m2m_ops);
+	if (IS_ERR(vpu_dev->m2m_dev)) {
+		ret = PTR_ERR(vpu_dev->m2m_dev);
+		goto err_unreg_v4l2;
+	}
+
 	ret = mali_vpu_register_video_device(vpu_dev, MALI_VPU_DECODER);
 	if (ret)
-		goto err_unreg_v4l2;
+		goto err_release_m2m;
 
 	platform_set_drvdata(pdev, vpu_dev);
 
 	return 0;
 
+err_release_m2m:
+	v4l2_m2m_release(vpu_dev->m2m_dev);
 err_unreg_v4l2:
 	v4l2_device_unregister(&vpu_dev->v4l2_dev);
 err_rst_clk:
@@ -241,6 +250,7 @@ static void mali_vpu_remove(struct platform_device *pdev)
 	struct mali_vpu_dev *vpu_dev = platform_get_drvdata(pdev);
 
 	video_unregister_device(vpu_dev->vdev_dec);
+	v4l2_m2m_release(vpu_dev->m2m_dev);
 	v4l2_device_unregister(&vpu_dev->v4l2_dev);
 
 	mali_vpu_assert_reset(vpu_dev);
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
index 9bcb3a73a582e..95050296f9904 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
@@ -3,15 +3,18 @@
  * Copyright (C) 2026 ARM Limited.
  */
 
+#include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/minmax.h>
 #include <linux/mm.h>
 #include <linux/string.h>
 #include <media/v4l2-common.h>
+#include <media/v4l2-mem2mem.h>
 
 #include "mali-vpu-session.h"
 #include "mali-vpu-dec.h"
 #include "mali-vpu-variant.h"
+#include "mali-vpu-vb2.h"
 
 static int mali_vpu_set_port_fmt(struct mali_vpu_port *port,
 				 enum v4l2_buf_type type,
@@ -70,14 +73,42 @@ int mali_vpu_session_init(struct mali_vpu_session *sess)
 {
 	int ret;
 
-	if (sess->role != MALI_VPU_DECODER)
-		return -EINVAL;
+	mutex_init(&sess->vq_lock);
+
+	if (sess->role != MALI_VPU_DECODER) {
+		ret = -EINVAL;
+		goto err_mutex_destroy;
+	}
 
 	mali_vpu_session_init_dec(sess);
 
 	ret = mali_vpu_set_port_defaults(sess);
 	if (ret)
-		return ret;
+		goto err_mutex_destroy;
+
+	sess->m2m_ctx = v4l2_m2m_ctx_init(sess->vpu_dev->m2m_dev, sess, mali_vpu_queue_init);
+	if (IS_ERR(sess->m2m_ctx)) {
+		ret = PTR_ERR(sess->m2m_ctx);
+		goto err_mutex_destroy;
+	}
 
 	return 0;
+
+err_mutex_destroy:
+	mutex_destroy(&sess->vq_lock);
+	return ret;
+}
+
+void mali_vpu_session_cleanup(struct mali_vpu_session *sess)
+{
+	mutex_lock(&sess->vq_lock);
+
+	if (sess->m2m_ctx) {
+		v4l2_m2m_ctx_release(sess->m2m_ctx);
+		sess->m2m_ctx = NULL;
+		sess->fh.m2m_ctx = NULL;
+	}
+
+	mutex_unlock(&sess->vq_lock);
+	mutex_destroy(&sess->vq_lock);
 }
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
index a2778ca496381..dfd1833f884af 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
@@ -6,12 +6,15 @@
 #ifndef __MALI_VPU_SESSION_H__
 #define __MALI_VPU_SESSION_H__
 
+#include <linux/mutex.h>
 #include <linux/videodev2.h>
 #include <media/v4l2-fh.h>
 
 #include "mali-vpu-device.h"
 #include "mali-vpu-formats.h"
 
+struct v4l2_m2m_ctx;
+
 /**
  * struct mali_vpu_port - format state of a src/dst queue in a session.
  * @curr_fmt: V4L2 format currently configured for the port
@@ -28,17 +31,22 @@ struct mali_vpu_port {
  * @role: Role of this session.
  * @port_src: Source (OUTPUT) port for this session.
  * @port_dst: Destination (CAPTURE) port for this session.
+ * @vq_lock: Mutex lock to serialise per-session queue related ioctls.
  * @fh: V4L2 file handle for this session.
+ * @m2m_ctx: V4L2 mem2mem context for this session.
  */
 struct mali_vpu_session {
 	struct mali_vpu_dev		*vpu_dev;
 	enum mali_vpu_session_role	role;
 	struct mali_vpu_port		port_src;
 	struct mali_vpu_port		port_dst;
+	struct mutex			vq_lock; /* lock to serialise per-session ioctls */
 
 	struct v4l2_fh		fh;
+	struct v4l2_m2m_ctx	*m2m_ctx;
 };
 
 int mali_vpu_session_init(struct mali_vpu_session *sess);
+void mali_vpu_session_cleanup(struct mali_vpu_session *sess);
 
 #endif /* __MALI_VPU_SESSION_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c
new file mode 100644
index 0000000000000..acdbb06785f6b
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#include <linux/errno.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-dma-sg.h>
+
+#include "mali-vpu-buffer.h"
+#include "mali-vpu-session.h"
+#include "mali-vpu-vb2.h"
+
+#define MALI_VPU_MIN_BUFFERS 1
+
+static int mali_vpu_vb2_queue_setup(struct vb2_queue *q,
+				    unsigned int *num_buffers __always_unused,
+				    unsigned int *num_planes,
+				    unsigned int sizes[],
+				    struct device *alloc_devs[] __always_unused)
+{
+	struct mali_vpu_session *sess = vb2_get_drv_priv(q);
+	struct mali_vpu_port *port = V4L2_TYPE_IS_OUTPUT(q->type) ?
+					&sess->port_src :
+					&sess->port_dst;
+	struct v4l2_pix_format_mplane *pix_mp = &port->curr_fmt.fmt.pix_mp;
+	u32 i;
+
+	if (!pix_mp->num_planes || pix_mp->num_planes > MALI_VPU_BUFFER_MAX_PLANES)
+		return -EINVAL;
+
+	for (i = 0; i < pix_mp->num_planes; i++) {
+		if (!pix_mp->plane_fmt[i].sizeimage)
+			return -EINVAL;
+	}
+
+	if (*num_planes) {
+		if (*num_planes != pix_mp->num_planes)
+			return -EINVAL;
+
+		for (i = 0; i < pix_mp->num_planes; i++) {
+			if (sizes[i] < pix_mp->plane_fmt[i].sizeimage)
+				return -EINVAL;
+		}
+	} else {
+		*num_planes = pix_mp->num_planes;
+		for (i = 0; i < pix_mp->num_planes; i++)
+			sizes[i] = pix_mp->plane_fmt[i].sizeimage;
+	}
+
+	return 0;
+}
+
+static void mali_vpu_vb2_buffer_queue(struct vb2_buffer *vb2_buf)
+{
+	struct mali_vpu_session *sess = vb2_get_drv_priv(vb2_buf->vb2_queue);
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb2_buf);
+
+	v4l2_m2m_buf_queue(sess->m2m_ctx, v4l2_buf);
+}
+
+static const struct vb2_ops mali_vpu_vb2_ops = {
+	.queue_setup		= mali_vpu_vb2_queue_setup,
+	.buf_out_validate	= mali_vpu_vb2_buffer_out_validate,
+	.buf_init		= mali_vpu_vb2_buffer_init,
+	.buf_prepare		= mali_vpu_vb2_buffer_prepare,
+	.buf_queue		= mali_vpu_vb2_buffer_queue,
+};
+
+static void mali_vpu_queue_init_type(struct mali_vpu_session *sess,
+				     struct vb2_queue *vq,
+				     enum v4l2_buf_type type)
+{
+	vq->type = type;
+	vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	vq->dev = sess->vpu_dev->dev;
+	vq->lock = &sess->vq_lock;
+	vq->ops = &mali_vpu_vb2_ops;
+	vq->mem_ops = &vb2_dma_sg_memops;
+	vq->drv_priv = sess;
+	vq->buf_struct_size = sizeof(struct mali_vpu_buffer);
+	vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	vq->min_queued_buffers = MALI_VPU_MIN_BUFFERS;
+}
+
+int mali_vpu_queue_init(void *priv, struct vb2_queue *src_vq,
+			struct vb2_queue *dst_vq)
+{
+	struct mali_vpu_session *sess = priv;
+	int ret;
+
+	mali_vpu_queue_init_type(sess, src_vq, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	mali_vpu_queue_init_type(sess, dst_vq, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	return vb2_queue_init(dst_vq);
+}
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.h
new file mode 100644
index 0000000000000..4aa80d2136c2f
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#ifndef __MALI_VPU_VB2_H__
+#define __MALI_VPU_VB2_H__
+
+struct vb2_queue;
+
+int mali_vpu_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq);
+
+#endif /* __MALI_VPU_VB2_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
index 13468c6baba76..aaf604beff93a 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
@@ -10,6 +10,7 @@
 #include <media/v4l2-dev.h>
 #include <media/v4l2-fh.h>
 #include <media/v4l2-ioctl.h>
+#include <media/v4l2-mem2mem.h>
 
 #include "mali-vpu-session.h"
 #include "mali-vpu-vidioc.h"
@@ -41,6 +42,8 @@ static int mali_vpu_open(struct file *filp)
 	if (ret)
 		goto err_v4l2_fh_deinit;
 
+	sess->fh.m2m_ctx = sess->m2m_ctx;
+
 	return 0;
 
 err_v4l2_fh_deinit:
@@ -56,6 +59,7 @@ static int mali_vpu_release(struct file *filp)
 	struct mali_vpu_session *sess = container_of(file_to_v4l2_fh(filp),
 						     struct mali_vpu_session, fh);
 
+	mali_vpu_session_cleanup(sess);
 	v4l2_fh_del(&sess->fh, filp);
 	v4l2_fh_exit(&sess->fh);
 	kfree(sess);
@@ -67,6 +71,27 @@ const struct v4l2_file_operations mali_vpu_fops = {
 	.open		= mali_vpu_open,
 	.release	= mali_vpu_release,
 	.unlocked_ioctl = video_ioctl2,
+	.poll		= v4l2_m2m_fop_poll,
+	.mmap		= v4l2_m2m_fop_mmap,
+};
+
+static int mali_vpu_m2m_job_ready(void *priv)
+{
+	/*
+	 * The Mali scheduler/LSID path owns hardware dispatch.
+	 * v4l2-mem2mem is used only for vb2 queue bookkeeping.
+	 */
+	return 0;
+}
+
+static void mali_vpu_m2m_device_run(void *priv)
+{
+	WARN_ON_ONCE(1);
+}
+
+const struct v4l2_m2m_ops mali_vpu_m2m_ops = {
+	.job_ready = mali_vpu_m2m_job_ready,
+	.device_run = mali_vpu_m2m_device_run,
 };
 
 static int mali_vpu_querycap(struct file *filp, void *fh,
@@ -81,5 +106,13 @@ static int mali_vpu_querycap(struct file *filp, void *fh,
 }
 
 const struct v4l2_ioctl_ops mali_vpu_ioctl_ops_dec = {
-	.vidioc_querycap = mali_vpu_querycap,
+	.vidioc_querycap	= mali_vpu_querycap,
+	.vidioc_reqbufs		= v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf	= v4l2_m2m_ioctl_querybuf,
+	.vidioc_create_bufs	= v4l2_m2m_ioctl_create_bufs,
+	.vidioc_prepare_buf	= v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_expbuf		= v4l2_m2m_ioctl_expbuf,
+	.vidioc_qbuf		= v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf		= v4l2_m2m_ioctl_dqbuf,
+	.vidioc_remove_bufs	= v4l2_m2m_ioctl_remove_bufs,
 };
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.h
index e1aedea5bbcb6..e967cae8be137 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.h
@@ -8,8 +8,10 @@
 
 struct v4l2_file_operations;
 struct v4l2_ioctl_ops;
+struct v4l2_m2m_ops;
 
 extern const struct v4l2_file_operations mali_vpu_fops;
+extern const struct v4l2_m2m_ops mali_vpu_m2m_ops;
 extern const struct v4l2_ioctl_ops mali_vpu_ioctl_ops_dec;
 
 #endif /* __MALI_VPU_VIDIOC_H__ */
-- 
2.43.0

