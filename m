Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540124;
	b=YEQLu5IuRX31OhcTyUogML+09S5qr/CkNwXWxeP4VlA4mzCtIbaRavCo0eJdv2WtpRVI
	 j3k+nCtRXT3Hwj+HpMYzYjBzM771ZWbUNeFOmsa/riTGh4EnFC4DxEMt13ZzzFACfExu2
	 uGuVwlJ5xYhh5VkQpbyr9gPxkNMc6o2YTJuc/XAbKQcBVcOgiprwvyAB1xLHn2ybDSaeY
	 +5HcYlxrcZcgqiWEEw09U/26CDopjzyUoOYafJtOPNGrKTQad6n86Fo/8MvmFGxDGhcxm
	 eHWwqIf1vDs86lUSKLv+h/SGtS26lLd8I3EWury3ufpE+6NTGL2NeSxdWsuokwypcwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540124;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=jlverBuY2iif4Xffr5kTsF1ELuS5zZg/T+DBlpTNKiY=;
	b=bdV6YhiQOipcZewAhk5IVAlwQ6/URz7xv5TpV4LrfdwoHjuL0883cRYowhyv7cJ6vJCK
	 B77sWAp2k6BGvpw+wpp8Gyjud24+E3m1wQbpXkFXeQHNSlLZUbCTi4c3Mw3ougyk95dy1
	 Ty5qi4U6xH9ZpraUlR60dHgaIxDo1qw+vwAY1g2aZ/FgpBgF2v/RZFYIEEYY9/SuGAYLq
	 RtphiabpEXUwggCNG4o2sc5Ghtgn1xN9i0WmqcrTC8zgWalo9O9eGEEh6Cnos0bfLSkk0
	 L4kCkPm4lkPd/fqvKLe+5smdzM/WXiflhmlefs5rnhoRdzzemY/NUTemo7P1q3CkGFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O5Tm30FD;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACB0606A6B8;
	Tue, 24 Nov 2026 17:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ACB0606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O5Tm30FD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED8A31BA8;
	Tue, 24 Nov 2026 09:08:39 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1CE43F763;
	Tue, 24 Nov 2026 09:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540122; bh=mkh5Z/kRM7Is2R6cKjQOSJme/zvf9xRdc/CqEgsVwwA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O5Tm30FDBkxyurKinZfdm2oQeNvJfvetLukEjUkKZvEbYvhm8xPZ4P53UjQPGBpnI
	 QtNviZcxdRBNSUWBwhFs0hr6EkKltkOz5JDy39UI/8fEmJd8wxmJCGakICica58W0b
	 K+z6adAlKZjkBTuKCiknYWcMcA8CIYgdoGHlCMHE=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:41 +0000
Subject: [PATCH 13/24] media: mali-c720: Add Mali-C720 ISP driver
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-b4-initial-upstream-candidate-v1-13-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Anthony McGivern <anthony.mcgivern@arm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <nayden.kanchev@arm.com>, 
 Konstantin Babin <konstantin.babin@arm.com>, 
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com, 
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Anthony McGivern <Anthony.McGivern@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540078; l=34407;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=3BAnMaAyI2W1d5Q2wQ/ZhPCQSrEiBcEzwc7dRZlvSvo=;
 b=r2vY1kwe7o/8JJA18YHnpk7eShglgR4pi89CJyIsJ2IjfYwbqH5/oxD4oVd8FHfeH0sQjONRQ
 6NfciVPUswsA+YimFUOTAk+4PpnSaqJ1VeCMEEDGtHOqEEsx5eDg//N
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=

From: Anthony McGivern <Anthony.McGivern@arm.com>

Integrate hardware identification, capability discovery, context
management and the V4L2 subdevices into a functional Mali-C720 ISP
driver. Add device probing, power management, media graph registration
and frame scheduling.

Add Kconfig and Makefile integration to build the driver. The preceding
commits introduce its components but do not build them.

Initial support covers the human vision (HV) pipeline with one
full-resolution output pipeline providing RGB and YUV capture nodes.
Support for computer vision (CV) and additional output pipelines will
be added in the future.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 drivers/media/platform/arm/Kconfig                 |   1 +
 drivers/media/platform/arm/Makefile                |   1 +
 drivers/media/platform/arm/mali-c720/Kconfig       |  17 +
 drivers/media/platform/arm/mali-c720/Makefile      |  20 +
 .../platform/arm/mali-c720/mali-c720-capture.c     |  30 +-
 .../platform/arm/mali-c720/mali-c720-common.h      |  26 +
 .../media/platform/arm/mali-c720/mali-c720-core.c  | 873 +++++++++++++++++++++
 .../platform/arm/mali-c720/mali-c720-interrupts.c  |   2 +
 8 files changed, 969 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/arm/Kconfig b/drivers/media/platform/arm/Kconfig
index 4f0764c329c745e01456958cdbcc65bd888dce4f..90b7818cb95bf360f8ee4ddd9815badeb1c7020e 100644
--- a/drivers/media/platform/arm/Kconfig
+++ b/drivers/media/platform/arm/Kconfig
@@ -3,3 +3,4 @@
 comment "ARM media platform drivers"
 
 source "drivers/media/platform/arm/mali-c55/Kconfig"
+source "drivers/media/platform/arm/mali-c720/Kconfig"
diff --git a/drivers/media/platform/arm/Makefile b/drivers/media/platform/arm/Makefile
index 8cc4918725efae5d998d9397ac60297b1d734506..09732f2ec8f1dcf1351af123bd85cb007b3ee378 100644
--- a/drivers/media/platform/arm/Makefile
+++ b/drivers/media/platform/arm/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += mali-c55/
+obj-y += mali-c720/
diff --git a/drivers/media/platform/arm/mali-c720/Kconfig b/drivers/media/platform/arm/mali-c720/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..576b619fe06c9b96115eeb825f5e8130d9f67395
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_MALI_C720
+	tristate "ARM Mali-C720 Image Signal Processor driver"
+	depends on V4L_PLATFORM_DRIVERS
+	depends on VIDEO_DEV && OF
+	select CRC_CCITT
+	select CRC_ITU_T
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_VMALLOC
+	help
+	  Enable this to support Arm's Mali-C720 Image Signal Processor.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called mali-c720.
diff --git a/drivers/media/platform/arm/mali-c720/Makefile b/drivers/media/platform/arm/mali-c720/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..31f91d2a0f747bebda2f5584282f8923d4816160
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/Makefile
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+mali-c720-y := mali-c720-capture.o \
+	      mali-c720-core.o \
+	      mali-c720-ctx-mgr.o \
+	      mali-c720-discovery.o \
+	      mali-c720-formats.o \
+	      mali-c720-fr-pipe.o \
+	      mali-c720-id.o \
+	      mali-c720-input.o \
+	      mali-c720-interrupts.o \
+	      mali-c720-isp.o \
+	      mali-c720-register-access.o \
+	      mali-c720-registers.o \
+	      mali-c720-registers-top.o \
+	      mali-c720-registers-ctx-mgr.o \
+	      mali-c720-registers-modules.o \
+	      mali-c720-vision-pipe.o \
+
+obj-$(CONFIG_VIDEO_MALI_C720) += mali-c720.o
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-capture.c b/drivers/media/platform/arm/mali-c720/mali-c720-capture.c
index 78e9f5aba97d58c6e6aad5451262a34889e25624..ef69901730b4ec2669ed0f6c73f72eddb33390b3 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-capture.c
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-capture.c
@@ -101,6 +101,8 @@ static int mali_c720_vb2_queue_setup(struct vb2_queue *q, unsigned int *num_buff
 static void mali_c720_buf_queue(struct vb2_buffer *vb)
 {
 	struct mali_c720_cap_dev *cap_dev = vb2_get_drv_priv(vb->vb2_queue);
+	struct mali_c720 *mali_c720 = cap_dev->mali_c720;
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct mali_c720_cap_buffer *buf = container_of(vbuf,
 						   struct mali_c720_cap_buffer, vb);
@@ -116,6 +118,9 @@ static void mali_c720_buf_queue(struct vb2_buffer *vb)
 
 	scoped_guard(spinlock, &cap_dev->buffers.lock)
 		list_add_tail(&buf->queue, &cap_dev->buffers.input);
+
+	if (!mali_c720_cap_dev_uses_requests(cap_dev))
+		mali_c720_try_schedule_frame(ctx);
 }
 
 static int mali_c720_buf_init(struct vb2_buffer *vb)
@@ -289,6 +294,7 @@ static int mali_c720_vb2_start_streaming(struct vb2_queue *q, unsigned int count
 	struct mali_c720_cap_dev *cap_dev = q->drv_priv;
 	struct mali_c720 *mali_c720 = cap_dev->mali_c720;
 	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+	struct v4l2_subdev *isp_sd = &mali_c720->isp.mdev.sd;
 	int ret;
 
 	guard(mutex)(&mali_c720->device_lock);
@@ -328,8 +334,30 @@ static int mali_c720_vb2_start_streaming(struct vb2_queue *q, unsigned int count
 		goto err_release_buffer_pool;
 	}
 
+	/*
+	 * All ISP source pads use the same start process, so the HV pad can
+	 * represent the ISP when starting the pipeline.
+	 */
+	ret = mali_c720_pipeline_ready(mali_c720);
+	if (ret && ret != -EAGAIN)
+		goto err_disable_src;
+
+	if (!ret) {
+		ret = v4l2_subdev_enable_streams(isp_sd,
+						 MALI_C720_ISP_PAD_SOURCE_HV,
+						 BIT(0));
+		if (ret) {
+			dev_err(mali_c720->dev, "%s failed to start ISP subdevice\n",
+				cap_dev->vdev.name);
+			goto err_disable_src;
+		}
+	}
+
 	return 0;
 
+err_disable_src:
+	v4l2_subdev_disable_streams(cap_dev->src_sd, cap_dev->src_pad,
+				    BIT(0));
 err_release_buffer_pool:
 	mali_c720_cap_dev_release_buffer_pool(cap_dev);
 err_free_context:
@@ -574,7 +602,7 @@ static const struct v4l2_ioctl_ops mali_c720_v4l2_ioctl_ops = {
 	.vidioc_expbuf = vb2_ioctl_expbuf,
 	.vidioc_dqbuf = vb2_ioctl_dqbuf,
 	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
-	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamon = mali_c720_streamon,
 	.vidioc_streamoff = vb2_ioctl_streamoff,
 	.vidioc_try_fmt_vid_cap_mplane = mali_c720_try_fmt_vid_cap_mplane,
 	.vidioc_s_fmt_vid_cap_mplane = mali_c720_s_fmt_vid_cap_mplane,
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-common.h b/drivers/media/platform/arm/mali-c720/mali-c720-common.h
index 30aae3d8bed8c9e80b417941e8dce5c6e7275d7d..0f0ad7d9dcccfce13f673f3602f79d5162eb04ad 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-common.h
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-common.h
@@ -8,15 +8,18 @@
 #ifndef MALI_C720_COMMON_H
 #define MALI_C720_COMMON_H
 
+#include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/kfifo.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/refcount.h>
+#include <linux/reset.h>
 #include <linux/spinlock.h>
 #include <linux/videodev2.h>
 
 #include <media/media-device.h>
+#include <media/v4l2-async.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
@@ -186,6 +189,18 @@ struct mali_c720_cap_dev {
 	} buffers;
 };
 
+struct mali_c720_request {
+	struct media_request req;
+	unsigned int queue_sequence;
+	bool submitted;
+};
+
+static inline struct mali_c720_request *
+to_mali_c720_request(struct media_request *req)
+{
+	return container_of(req, struct mali_c720_request, req);
+}
+
 struct mali_c720_context_regs {
 	dma_addr_t dma_handle;
 	u8 *base;
@@ -233,9 +248,12 @@ struct mali_c720 {
 	u8 __iomem *base;
 	resource_size_t mmio_size;
 	u32 top_base;
+	struct clk *clk;
+	struct reset_control *reset;
 
 	struct media_device media_dev;
 	struct v4l2_device v4l2_dev;
+	struct v4l2_async_notifier notifier;
 	struct media_pipeline pipe;
 
 	struct mali_c720_input input;
@@ -244,6 +262,8 @@ struct mali_c720 {
 	struct mali_c720_fr_pipe fr_pipe;
 	struct mali_c720_cap_dev cap_devs[MALI_C720_MAX_NUM_CAP_DEVS];
 
+	unsigned int num_async_endpoints;
+
 	struct mali_c720_registers registers;
 	u8 *default_regs;
 
@@ -296,4 +316,10 @@ void mali_c720_cap_dev_buffer_done(struct mali_c720_cap_dev *cap_dev,
 
 void mali_c720_isp_queue_event_sof(struct mali_c720 *mali_c720, u32 sequence);
 
+int mali_c720_pipeline_ready(struct mali_c720 *mali_c720);
+
+int mali_c720_streamon(struct file *file, void *priv, enum v4l2_buf_type type);
+
+void mali_c720_try_schedule_frame(struct mali_c720_context *ctx);
+
 #endif /* MALI_C720_COMMON_H */
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-core.c b/drivers/media/platform/arm/mali-c720/mali-c720-core.c
new file mode 100644
index 0000000000000000000000000000000000000000..2a46e7b348910303d9284a8ce6214953993a7f81
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-core.c
@@ -0,0 +1,873 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include <media/media-devnode.h>
+#include <media/media-entity.h>
+#include <media/v4l2-mc.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "mali-c720-common.h"
+
+static void mali_c720_remove_links(struct mali_c720 *mali_c720)
+{
+	struct v4l2_subdev *input_sd = &mali_c720->input.mdev.sd;
+	struct v4l2_subdev *isp_sd = &mali_c720->isp.mdev.sd;
+	struct v4l2_subdev *hv_sd = &mali_c720->vision_pipe.mdev.sd;
+	struct v4l2_subdev *fr_sd = &mali_c720->fr_pipe.mdev.sd;
+	unsigned int i;
+
+	media_entity_remove_links(&input_sd->entity);
+	media_entity_remove_links(&isp_sd->entity);
+	media_entity_remove_links(&hv_sd->entity);
+	media_entity_remove_links(&fr_sd->entity);
+
+	for (i = 0; i < MALI_C720_MAX_NUM_CAP_DEVS; i++)
+		media_entity_remove_links(&mali_c720->cap_devs[i].vdev.entity);
+}
+
+static int mali_c720_create_isp_input_links(struct mali_c720 *mali_c720)
+{
+	struct v4l2_subdev *input_sd = &mali_c720->input.mdev.sd;
+	struct v4l2_subdev *isp_sd = &mali_c720->isp.mdev.sd;
+	int ret;
+
+	ret = media_create_pad_link(&input_sd->entity,
+				    MALI_C720_INPUT_PAD_SOURCE_SLOT_INPUT,
+				    &isp_sd->entity,
+				    MALI_C720_ISP_PAD_SINK_VIDEO,
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret)
+		dev_err(mali_c720->dev, "failed to link input and ISP sink\n");
+
+	return ret;
+}
+
+static int mali_c720_create_vision_pipe_links(struct mali_c720 *mali_c720)
+{
+	struct v4l2_subdev *isp_sd = &mali_c720->isp.mdev.sd;
+	struct v4l2_subdev *hv_sd = &mali_c720->vision_pipe.mdev.sd;
+	int ret;
+
+	ret = media_create_pad_link(&isp_sd->entity,
+				    MALI_C720_ISP_PAD_SOURCE_HV,
+				    &hv_sd->entity,
+				    MALI_C720_VISION_PIPE_PAD_SINK_VIDEO,
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret)
+		dev_err(mali_c720->dev, "failed to link ISP and HV pipe\n");
+
+	return ret;
+}
+
+static int mali_c720_create_fr_pipe_links(struct mali_c720 *mali_c720)
+{
+	struct v4l2_subdev *hv_sd = &mali_c720->vision_pipe.mdev.sd;
+	struct v4l2_subdev *fr_sd = &mali_c720->fr_pipe.mdev.sd;
+	int ret;
+
+	ret = media_create_pad_link(&hv_sd->entity, MALI_C720_VISION_PIPE_PAD_SOURCE_RGB,
+				    &fr_sd->entity, MALI_C720_FR_PIPE_PAD_SINK_VIDEO,
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret) {
+		dev_err(mali_c720->dev, "failed to link HV and FR pipe\n");
+		return ret;
+	}
+
+	ret = media_create_pad_link(&fr_sd->entity,
+				    MALI_C720_FR_PIPE_PAD_SOURCE_RGB,
+				    &mali_c720->cap_devs[MALI_C720_CAP_DEV_FR0_RGB].vdev.entity,
+				    0, MEDIA_LNK_FL_ENABLED);
+	if (ret) {
+		dev_err(mali_c720->dev,
+			"failed to link FR RGB and video device\n");
+		return ret;
+	}
+
+	ret = media_create_pad_link(&fr_sd->entity,
+				    MALI_C720_FR_PIPE_PAD_SOURCE_YUV,
+				    &mali_c720->cap_devs[MALI_C720_CAP_DEV_FR0_YUV].vdev.entity,
+				    0, 0);
+	if (ret)
+		dev_err(mali_c720->dev,
+			"failed to link FR YUV and video device\n");
+
+	return ret;
+}
+
+static int mali_c720_create_links(struct mali_c720 *mali_c720)
+{
+	int ret;
+
+	ret = mali_c720_create_isp_input_links(mali_c720);
+	if (ret)
+		goto err_remove_links;
+
+	ret = mali_c720_create_vision_pipe_links(mali_c720);
+	if (ret)
+		goto err_remove_links;
+
+	ret = mali_c720_create_fr_pipe_links(mali_c720);
+	if (ret)
+		goto err_remove_links;
+
+	return 0;
+
+err_remove_links:
+	mali_c720_remove_links(mali_c720);
+	return ret;
+}
+
+static void mali_c720_unregister_video_devices(struct mali_c720 *mali_c720)
+{
+	/* Prevent request queueing from racing with video device unregistration. */
+	guard(mutex)(&mali_c720->media_dev.req_queue_mutex);
+
+	mali_c720_unregister_capture_devs(mali_c720);
+}
+
+static void mali_c720_unregister_entities(struct mali_c720 *mali_c720)
+{
+	mali_c720_remove_links(mali_c720);
+	mali_c720_unregister_fr_pipe(mali_c720);
+	mali_c720_unregister_vision_pipe(mali_c720);
+	mali_c720_unregister_isp(mali_c720);
+	mali_c720_unregister_input(mali_c720);
+}
+
+static int mali_c720_register_entities(struct mali_c720 *mali_c720)
+{
+	int ret;
+
+	ret = mali_c720_register_input(mali_c720);
+	if (ret)
+		goto err_unregister_entities;
+
+	ret = mali_c720_register_isp(mali_c720);
+	if (ret)
+		goto err_unregister_entities;
+
+	ret = mali_c720_register_vision_pipe(mali_c720);
+	if (ret)
+		goto err_unregister_entities;
+
+	ret = mali_c720_register_fr_pipe(mali_c720);
+	if (ret)
+		goto err_unregister_entities;
+
+	ret = mali_c720_register_capture_devs(mali_c720);
+	if (ret)
+		goto err_unregister_entities;
+
+	ret = mali_c720_create_links(mali_c720);
+	if (ret)
+		goto err_unregister_entities;
+
+	return 0;
+
+err_unregister_entities:
+	mali_c720_unregister_video_devices(mali_c720);
+	mali_c720_unregister_entities(mali_c720);
+
+	return ret;
+}
+
+static int mali_c720_register_media_nodes(struct mali_c720 *mali_c720)
+{
+	int ret;
+
+	/* Keep STREAMON out until media device registration completes. */
+	guard(mutex)(&mali_c720->device_lock);
+
+	ret = v4l2_device_register_subdev_nodes(&mali_c720->v4l2_dev);
+	if (ret)
+		return ret;
+
+	/* The notifier may complete again after an external subdevice rebinds. */
+	if (media_devnode_is_registered(mali_c720->media_dev.devnode))
+		return 0;
+
+	return media_device_register(&mali_c720->media_dev);
+}
+
+static int mali_c720_notifier_bound(struct v4l2_async_notifier *notifier,
+				    struct v4l2_subdev *subdev,
+				    struct v4l2_async_connection *asc)
+{
+	struct mali_c720 *mali_c720 = container_of(notifier,
+						struct mali_c720, notifier);
+
+	return v4l2_create_fwnode_links(subdev, &mali_c720->input.mdev.sd);
+}
+
+static int mali_c720_notifier_complete(struct v4l2_async_notifier *notifier)
+{
+	struct mali_c720 *mali_c720 = container_of(notifier,
+						struct mali_c720, notifier);
+
+	return mali_c720_register_media_nodes(mali_c720);
+}
+
+static const struct v4l2_async_notifier_operations mali_c720_notifier_ops = {
+	.bound = mali_c720_notifier_bound,
+	.complete = mali_c720_notifier_complete,
+};
+
+static int mali_c720_parse_endpoint(struct mali_c720 *mali_c720)
+{
+	struct v4l2_async_notifier *ntf = &mali_c720->notifier;
+	struct fwnode_handle *fwnode = dev_fwnode(mali_c720->dev);
+	struct fwnode_handle *ep;
+	unsigned int index = 0;
+	int ret = 0;
+
+	fwnode_graph_for_each_endpoint(fwnode, ep) {
+		struct v4l2_async_connection *asc;
+		struct fwnode_handle *port;
+		u32 input_id = 0;
+
+		port = fwnode_get_parent(ep);
+		fwnode_property_read_u32(port, "reg", &input_id);
+		fwnode_handle_put(port);
+
+		if (input_id != 0) {
+			dev_err(mali_c720->dev,
+				"endpoint %pfw has invalid input port %u\n",
+				ep, input_id);
+			ret = -EINVAL;
+			break;
+		}
+
+		asc = v4l2_async_nf_add_fwnode_remote(ntf, ep,
+						      struct v4l2_async_connection);
+		ret = PTR_ERR_OR_ZERO(asc);
+		if (ret) {
+			dev_err(mali_c720->dev,
+				"failed to add remote endpoint for %pfw\n",
+				ep);
+			break;
+		}
+
+		index++;
+	}
+
+	mali_c720->num_async_endpoints = index;
+
+	if (ret) {
+		fwnode_handle_put(ep);
+		return ret;
+	}
+
+	if (!index)
+		dev_dbg(mali_c720->dev, "no remote subdevice found\n");
+
+	return 0;
+}
+
+static void mali_c720_free(struct mali_c720 *mali_c720)
+{
+	kvfree(mali_c720->default_regs);
+	if (mali_c720->context.mali_c720)
+		mutex_destroy(&mali_c720->context.regs.allocation_lock);
+	mutex_destroy(&mali_c720->device_lock);
+	put_device(mali_c720->dev);
+	kvfree(mali_c720);
+}
+
+static void mali_c720_release(struct v4l2_device *v4l2_dev)
+{
+	struct mali_c720 *mali_c720 = container_of(v4l2_dev, struct mali_c720, v4l2_dev);
+
+	mali_c720_cleanup_capture_devs(mali_c720);
+	mali_c720_cleanup_fr_pipe(mali_c720);
+	mali_c720_cleanup_vision_pipe(mali_c720);
+	mali_c720_cleanup_isp(mali_c720);
+	mali_c720_cleanup_input(mali_c720);
+	media_device_cleanup(&mali_c720->media_dev);
+	mali_c720_free(mali_c720);
+}
+
+/*
+ * Initialize the media frameworks and register the entities and links. Publish
+ * the media device once all external subdevices have bound.
+ */
+static int mali_c720_media_frameworks_init(struct mali_c720 *mali_c720)
+{
+	int ret;
+
+	strscpy(mali_c720->media_dev.model, "ARM Mali-C720 ISP",
+		sizeof(mali_c720->media_dev.model));
+
+	media_device_init(&mali_c720->media_dev);
+
+	mali_c720->v4l2_dev.mdev = &mali_c720->media_dev;
+	ret = v4l2_device_register(mali_c720->dev, &mali_c720->v4l2_dev);
+	if (ret) {
+		dev_err(mali_c720->dev, "Failed to register V4L2 device\n");
+		media_device_cleanup(&mali_c720->media_dev);
+		return ret;
+	}
+	mali_c720->v4l2_dev.release = mali_c720_release;
+
+	mali_c720->notifier.ops = &mali_c720_notifier_ops;
+	v4l2_async_nf_init(&mali_c720->notifier, &mali_c720->v4l2_dev);
+
+	ret = mali_c720_register_entities(mali_c720);
+	if (ret) {
+		dev_err(mali_c720->dev, "failed to register entities\n");
+		goto err_cleanup_nf;
+	}
+
+	ret = mali_c720_parse_endpoint(mali_c720);
+	if (ret)
+		goto err_unregister_entities;
+
+	if (mali_c720->num_async_endpoints) {
+		ret = v4l2_async_nf_register(&mali_c720->notifier);
+		if (ret) {
+			dev_err(mali_c720->dev, "failed to register notifier\n");
+			goto err_unregister_entities;
+		}
+	} else {
+		ret = mali_c720_register_media_nodes(mali_c720);
+		if (ret) {
+			dev_err(mali_c720->dev, "failed to register media nodes\n");
+			goto err_unregister_entities;
+		}
+	}
+
+	return 0;
+
+err_unregister_entities:
+	mali_c720_unregister_video_devices(mali_c720);
+	mali_c720_unregister_entities(mali_c720);
+err_cleanup_nf:
+	v4l2_async_nf_cleanup(&mali_c720->notifier);
+	v4l2_device_unregister(&mali_c720->v4l2_dev);
+
+	return ret;
+}
+
+static void mali_c720_media_frameworks_deinit(struct mali_c720 *mali_c720)
+{
+	/*
+	 * We unregister video devices first to ensure streaming is stopped
+	 * before subdevices are unregistered. The async notifier comes next
+	 * since the .bound() callback creates media links to our subdevices.
+	 */
+
+	mali_c720_unregister_video_devices(mali_c720);
+	v4l2_async_nf_unregister(&mali_c720->notifier);
+	mali_c720_unregister_entities(mali_c720);
+	v4l2_async_nf_cleanup(&mali_c720->notifier);
+	v4l2_device_unregister(&mali_c720->v4l2_dev);
+	media_device_unregister(&mali_c720->media_dev);
+}
+
+static struct media_request *mali_c720_req_alloc(struct media_device *mdev)
+{
+	struct mali_c720_request *mreq;
+
+	mreq = kzalloc_obj(*mreq, GFP_KERNEL);
+	if (!mreq)
+		return NULL;
+
+	return &mreq->req;
+}
+
+static void mali_c720_req_free(struct media_request *req)
+{
+	kfree(to_mali_c720_request(req));
+}
+
+static int mali_c720_req_validate(struct media_request *req)
+{
+	struct media_request_object *obj;
+
+	/* Request-associated controls are not supported. */
+	list_for_each_entry(obj, &req->objects, list) {
+		if (!vb2_request_object_is_buffer(obj))
+			return -EINVAL;
+	}
+
+	return vb2_request_validate(req);
+}
+
+static void mali_c720_req_queue(struct media_request *req)
+{
+	struct mali_c720 *mali_c720 = container_of(req->mdev, struct mali_c720, media_dev);
+	struct mali_c720_context *ctx = &mali_c720->context;
+	struct mali_c720_request *mreq = to_mali_c720_request(req);
+
+	scoped_guard(spinlock, &ctx->req_lock) {
+		mreq->submitted = false;
+		mreq->queue_sequence = ctx->request_sequence++;
+	}
+
+	vb2_request_queue(req);
+
+	scoped_guard(spinlock, &ctx->req_lock) {
+		mreq->submitted = true;
+	}
+
+	mali_c720_try_schedule_frame(ctx);
+}
+
+static const struct media_device_ops mali_c720_media_device_ops = {
+	.req_alloc = mali_c720_req_alloc,
+	.req_free = mali_c720_req_free,
+	.req_validate = mali_c720_req_validate,
+	.req_queue = mali_c720_req_queue,
+};
+
+int mali_c720_pipeline_ready(struct mali_c720 *mali_c720)
+{
+	struct media_pipeline_entity_iter iter;
+	struct media_entity *entity;
+	int n_video_devices = 0;
+	int ret;
+
+	ret = media_pipeline_entity_iter_init(&mali_c720->pipe, &iter);
+	if (ret)
+		return ret;
+
+	media_pipeline_for_each_entity(&mali_c720->pipe, &iter, entity) {
+		if (entity->obj_type == MEDIA_ENTITY_TYPE_VIDEO_DEVICE)
+			n_video_devices++;
+	}
+
+	media_pipeline_entity_iter_cleanup(&iter);
+
+	return n_video_devices == mali_c720->pipe.start_count ? 0 : -EAGAIN;
+}
+
+int mali_c720_streamon(struct file *file, void *priv, enum v4l2_buf_type type)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct mali_c720 *mali_c720 = container_of(vdev->v4l2_dev, struct mali_c720, v4l2_dev);
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+	int ret;
+
+	ret = vb2_ioctl_streamon(file, priv, type);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&mali_c720->device_lock);
+
+	/*
+	 * The final STREAMON prepares the context and starts its inputs. Wait
+	 * until VB2 marks that queue streaming before starting the context
+	 * and allowing scheduling to take place.
+	 */
+	scoped_guard(spinlock, &ctx->state_lock) {
+		if (ctx->state != MALI_C720_SLOT_STATE_PREPARED)
+			return 0;
+
+		mali_c720_ctx_mgr_start_context(ctx);
+	}
+
+	mali_c720_try_schedule_frame(ctx);
+
+	return 0;
+}
+
+static bool mali_c720_has_ready_output(struct mali_c720 *mali_c720)
+{
+	unsigned int i;
+
+	for (i = 0; i < MALI_C720_MAX_NUM_CAP_DEVS; i++) {
+		if (!mali_c720_cap_dev_is_ready(&mali_c720->cap_devs[i]))
+			return true;
+	}
+
+	return false;
+}
+
+static struct media_request *
+mali_c720_oldest_request(struct media_request *oldest, struct media_request *candidate)
+{
+	struct mali_c720_request *mreq;
+
+	if (!candidate)
+		return oldest;
+
+	mreq = to_mali_c720_request(candidate);
+
+	/* Ignore partially submitted requests */
+	if (!mreq->submitted)
+		return oldest;
+
+	if (!oldest ||
+	    (int)(mreq->queue_sequence - to_mali_c720_request(oldest)->queue_sequence) < 0)
+		return candidate;
+
+	return oldest;
+}
+
+static struct media_request *mali_c720_find_request(struct mali_c720 *mali_c720)
+{
+	struct media_request *candidate, *req = NULL;
+	unsigned int i;
+
+	for (i = 0; i < MALI_C720_MAX_NUM_CAP_DEVS; i++) {
+		candidate = mali_c720_cap_dev_get_request(&mali_c720->cap_devs[i]);
+		req = mali_c720_oldest_request(req, candidate);
+	}
+
+	return req;
+}
+
+static bool mali_c720_uses_requests(struct mali_c720 *mali_c720)
+{
+	unsigned int i;
+
+	for (i = 0; i < MALI_C720_MAX_NUM_CAP_DEVS; i++) {
+		if (mali_c720_cap_dev_uses_requests(&mali_c720->cap_devs[i]))
+			return true;
+	}
+
+	return false;
+}
+
+static bool mali_c720_can_schedule(struct mali_c720_context *ctx)
+{
+	struct mali_c720 *mali_c720 = ctx->mali_c720;
+
+	/* Ensure the first free-running frame has at least one ready output. */
+	if (ctx->state == MALI_C720_SLOT_STATE_STARTING &&
+	    !mali_c720_has_ready_output(mali_c720))
+		return false;
+
+	return true;
+}
+
+static struct media_request *mali_c720_can_schedule_request(struct mali_c720_context *ctx)
+{
+	return mali_c720_find_request(ctx->mali_c720);
+}
+
+void mali_c720_try_schedule_frame(struct mali_c720_context *ctx)
+{
+	struct mali_c720 *mali_c720 = ctx->mali_c720;
+	struct media_request *req = NULL;
+	unsigned int i;
+
+	guard(spinlock)(&ctx->state_lock);
+
+	if ((ctx->state != MALI_C720_SLOT_STATE_STARTING &&
+	     ctx->state != MALI_C720_SLOT_STATE_STARTED) || ctx->pipeline_busy)
+		return;
+
+	scoped_guard(spinlock, &ctx->req_lock) {
+		if (mali_c720_uses_requests(mali_c720)) {
+			req = mali_c720_can_schedule_request(ctx);
+			if (!req)
+				return;
+		} else if (!mali_c720_can_schedule(ctx)) {
+			return;
+		}
+
+		for (i = 0; i < MALI_C720_MAX_NUM_CAP_DEVS; i++)
+			mali_c720_cap_dev_set_next_buffer(&mali_c720->cap_devs[i], req);
+	}
+
+	ctx->pipeline_busy = true;
+	mali_c720_ctx_mgr_prepare_frame(ctx);
+
+	/* Resizer configurations should be synchronised with CDMA */
+	mali_c720_fr_pipe_apply_resizer_config(&mali_c720->fr_pipe);
+
+	mali_c720_ctx_mgr_handle_sw_ready(ctx);
+}
+
+static int mali_c720_power_on(struct mali_c720 *mali_c720)
+{
+	int ret;
+
+	ret = clk_prepare_enable(mali_c720->clk);
+	if (ret) {
+		dev_err(mali_c720->dev, "failed to enable clocks\n");
+		return ret;
+	}
+
+	ret = reset_control_deassert(mali_c720->reset);
+	if (ret) {
+		dev_err(mali_c720->dev, "failed to deassert resets\n");
+		goto err_disable_clk;
+	}
+
+	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(mali_c720->clk);
+	return ret;
+}
+
+static void mali_c720_power_off(struct mali_c720 *mali_c720)
+{
+	reset_control_assert(mali_c720->reset);
+	clk_disable_unprepare(mali_c720->clk);
+}
+
+static int __maybe_unused mali_c720_runtime_resume(struct device *dev)
+{
+	struct mali_c720 *mali_c720 = dev_get_drvdata(dev);
+
+	return mali_c720_power_on(mali_c720);
+}
+
+static int __maybe_unused mali_c720_runtime_suspend(struct device *dev)
+{
+	struct mali_c720 *mali_c720 = dev_get_drvdata(dev);
+
+	mali_c720_power_off(mali_c720);
+	return 0;
+}
+
+static int __maybe_unused mali_c720_suspend(struct device *dev)
+{
+	struct mali_c720 *mali_c720 = dev_get_drvdata(dev);
+
+	guard(mutex)(&mali_c720->device_lock);
+
+	/* Active pipelines cannot survive the hardware reset during suspend. */
+	if (media_entity_is_streaming(&mali_c720->isp.mdev.sd.entity))
+		return -EBUSY;
+
+	return pm_runtime_force_suspend(dev);
+}
+
+static const struct dev_pm_ops mali_c720_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mali_c720_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(mali_c720_runtime_suspend, mali_c720_runtime_resume,
+			   NULL)
+};
+
+static int mali_c720_probe(struct platform_device *pdev)
+{
+	const struct mali_c720_discovery_target top = {
+		.module_id = MALI_C720_DISC_MODULE_ID_PIPELINE_GLOBAL_CONTROL,
+		.pipeline_id = MALI_C720_DISC_PIPE_GLOBAL,
+	};
+	struct device *dev = &pdev->dev;
+	struct mali_c720 *mali_c720;
+	struct resource *res;
+	unsigned int irq;
+	int ret;
+
+	mali_c720 = kvzalloc_obj(*mali_c720, GFP_KERNEL);
+	if (!mali_c720)
+		return -ENOMEM;
+
+	mali_c720->dev = get_device(dev);
+	platform_set_drvdata(pdev, mali_c720);
+
+	mutex_init(&mali_c720->device_lock);
+
+	mali_c720->base = devm_platform_get_and_ioremap_resource(pdev, 0,
+								 &res);
+	ret = PTR_ERR_OR_ZERO(mali_c720->base);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to map IO memory\n");
+		goto err_free;
+	}
+
+	mali_c720->mmio_size = resource_size(res);
+
+	if (resource_size(res) < MALI_C720_ID_SIZE) {
+		ret = dev_err_probe(dev, -EINVAL,
+				    "IO memory resource %pR is too small (minimum %#x bytes)\n",
+				    res, MALI_C720_ID_SIZE);
+		goto err_free;
+	}
+
+	mali_c720->clk = devm_clk_get(dev, "vclk");
+	ret = PTR_ERR_OR_ZERO(mali_c720->clk);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to acquire clock\n");
+		goto err_free;
+	}
+
+	mali_c720->reset = devm_reset_control_get_optional_shared(dev, "reset");
+	ret = PTR_ERR_OR_ZERO(mali_c720->reset);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to acquire reset\n");
+		goto err_free;
+	}
+
+	ret = of_reserved_mem_device_init(dev);
+	if (ret && ret != -ENODEV) {
+		dev_err_probe(dev, ret, "failed to initialize reserved memory\n");
+		goto err_free;
+	}
+
+	ret = vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
+	if (ret)
+		goto err_release_mem;
+
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(48));
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to set DMA mask\n");
+		goto err_release_mem;
+	}
+
+	ret = mali_c720_power_on(mali_c720);
+	if (ret) {
+		dev_err(dev, "failed to power on: %d\n", ret);
+		goto err_release_mem;
+	}
+
+	mali_c720->registers.id = mali_c720_get_id_regs();
+	ret = mali_c720_identify_hw(mali_c720);
+	if (ret)
+		goto err_power_off;
+
+	ret = mali_c720_get_registers(mali_c720->hw_version->id, &mali_c720->registers);
+	if (ret) {
+		dev_err_probe(dev, ret, "unsupported register layout\n");
+		goto err_power_off;
+	}
+
+	if (resource_size(res) < mali_c720->registers.context_size) {
+		ret = dev_err_probe(dev, -EINVAL,
+				    "IO memory resource %pR is too small (minimum %#x bytes)\n",
+				    res, mali_c720->registers.context_size);
+		goto err_power_off;
+	}
+
+	ret = mali_c720_discovery_init(mali_c720, resource_size(res));
+	if (ret) {
+		dev_err(dev, "failed to parse capability discovery data\n");
+		goto err_power_off;
+	}
+
+	ret = mali_c720_discovery_get_module_base(mali_c720, &top, &mali_c720->top_base);
+	if (ret) {
+		dev_err(dev, "failed to get top base address from discovery data\n");
+		goto err_power_off;
+	}
+
+	ret = mali_c720_init_contexts(mali_c720);
+	if (ret)
+		goto err_power_off;
+
+	ret = mali_c720_init_ctx_mgr(mali_c720);
+	if (ret)
+		goto err_power_off;
+
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	ret = platform_get_irq_byname(pdev, "isp");
+	if (ret < 0) {
+		dev_err(dev, "Failed to get interrupt\n");
+		goto err_pm_runtime_disable;
+	}
+	irq = (unsigned int)ret;
+
+	spin_lock_init(&mali_c720->irq_lock);
+	INIT_KFIFO(mali_c720->irq_fifo);
+	ret = devm_request_threaded_irq(&pdev->dev, irq,
+					mali_c720_isr_top, mali_c720_isr,
+					0,
+					dev_driver_string(&pdev->dev),
+					&pdev->dev);
+	if (ret) {
+		dev_err(dev, "Failed to request threaded IRQ\n");
+		goto err_pm_runtime_disable;
+	}
+	mali_c720->irq = irq;
+
+	mali_c720->media_dev.dev = dev;
+	mali_c720->media_dev.ops = &mali_c720_media_device_ops;
+	ret = mali_c720_media_frameworks_init(mali_c720);
+	if (ret)
+		goto err_free_irq;
+
+	pm_runtime_idle(&pdev->dev);
+
+	dev_info(&pdev->dev, "Media frameworks and entities registered successfully\n");
+
+	return 0;
+
+err_free_irq:
+	devm_free_irq(dev, mali_c720->irq, dev);
+err_pm_runtime_disable:
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+err_power_off:
+	mali_c720_power_off(mali_c720);
+err_release_mem:
+	of_reserved_mem_device_release(dev);
+err_free:
+	platform_set_drvdata(pdev, NULL);
+	if (mali_c720->v4l2_dev.release)
+		v4l2_device_put(&mali_c720->v4l2_dev);
+	else
+		mali_c720_free(mali_c720);
+
+	return ret;
+}
+
+static void mali_c720_remove(struct platform_device *pdev)
+{
+	struct mali_c720 *mali_c720 = platform_get_drvdata(pdev);
+
+	/* Keep the current power state until queues and IRQs have been drained. */
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_barrier(&pdev->dev);
+
+	mali_c720_media_frameworks_deinit(mali_c720);
+	devm_free_irq(&pdev->dev, mali_c720->irq, &pdev->dev);
+
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		mali_c720_power_off(mali_c720);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
+
+	of_reserved_mem_device_release(&pdev->dev);
+	platform_set_drvdata(pdev, NULL);
+	v4l2_device_put(&mali_c720->v4l2_dev);
+}
+
+static const struct of_device_id mali_c720_of_match[] = {
+	{ .compatible = "arm,mali-c720" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, mali_c720_of_match);
+
+static struct platform_driver mali_c720_driver = {
+	.driver		= {
+		.name		= "mali-c720",
+		.of_match_table	= mali_c720_of_match,
+		.pm = &mali_c720_pm_ops,
+	},
+	.probe		= mali_c720_probe,
+	.remove		= mali_c720_remove,
+};
+
+module_platform_driver(mali_c720_driver);
+
+MODULE_DESCRIPTION("Mali C720 Core driver");
+MODULE_AUTHOR("Anthony McGivern <Anthony.McGivern@arm.com>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("DMA_BUF");
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-interrupts.c b/drivers/media/platform/arm/mali-c720/mali-c720-interrupts.c
index bd1e5189b276e59a33cda63f40ceffa3b7a2520c..43c9edc7f372a95e5e0c6256ef27f3958590891e 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-interrupts.c
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-interrupts.c
@@ -202,6 +202,8 @@ static void mali_c720_handle_frame_end(struct mali_c720 *mali_c720,
 
 		ctx->pipeline_busy = false;
 	}
+
+	mali_c720_try_schedule_frame(ctx);
 }
 
 irqreturn_t mali_c720_isr(int irq, void *dev_id)

-- 
2.55.0

