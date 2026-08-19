Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7ED37FF41;
	Wed, 19 Aug 2026 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787137527; cv=none; b=HJ+B2T0LJ1U1ey0kNUzM/+9eapoZMtqxL4xj8rJBj7UYPoR9X3g5ATE+53aCRnYOvwagdFYP1nNkj3z9N1qFmdl+QbMisBoHeNqwhbyBSABX2UKAGLBaZHfR9Ul5ZpStytL3O3klt0fXY1Y+MI7sYG7n2MNN9N+ZqQS0OGSVp3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787137527; c=relaxed/simple;
	bh=rQrc2uDZjwmMeA6Y1hc+C7ZALK4CyliPA28jr9nanks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o3mtIi5qbnTSwmZIfNytgvOZ1ssgY2IaONa7Rs+XWGLJE+EVXd2e5IUBji5MoxJpF4q6ZGw/1HQvVFSnyarakIJU1U7p4jJFudfRwCt9epyiCiVyhW2pM2qogJc3Ba0ZUx8sOZUsBl4CZyIL34W7nhvjCBbULjpMQpGJa5T/mBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 141EC20240F;
	Wed, 19 Aug 2026 13:05:18 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wwe6f-002HRi-33;
	Wed, 19 Aug 2026 13:05:17 +0200
Received: from [::1] (helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wwe6f-00000004K0O-2drC;
	Wed, 19 Aug 2026 13:05:17 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 19 Aug 2026 12:37:34 +0200
Subject: [PATCH 5/7] media: verisilicon: Add Rockchip VPU720 JPEG decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260819-rk3588-jpegdec-v1-5-33d74cdf369c@pengutronix.de>
References: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
In-Reply-To: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lucas Sinn <lucas.sinn@wolfvision.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787137517; l=61900;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=uSCC5jI1bQaIoW3AzaWUqB2S2PLyqOmiY0ED9Hv4TSw=;
 b=EEpZWz8+F5yr4Gr5BuG2l2GO5bIE7EJoXYOx3I255tuJ6b5aeegb1VGQMgp4v3UPolzqe5SrP
 NPeqgEKKGJCD5hwVqz1hFTuuEtPxaY7RtXGfTqzHpLw1ZVa+lyy2DQe
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

From: Lucas Sinn <lucas.sinn@wolfvision.net>

Add support for the Rockchip VPU720 JPEG hardware decoder on RK3588
to the verisilicon hantro driver.

Hardware requirements:
- CPU-side JPEG header parsing via v4l2_jpeg_parse_header()
- DMA side buffer with Q-tables (zigzag->raster), Huffman mincode
  and value tables
- VPU720-specific two-phase IRQ clear sequence
- 16-byte stream alignment with start-byte offset
- MCU-aligned PIC_H (e.g. 1080p YUV420 needs 1088, not 1080)
- FILL_DOWN_E on every NV12 conversion, the output chroma is vertically
  subsampled so the hardware completes the bottom of the picture
- DRI (restart interval) support when present

Implementation adds:
- HANTRO_JPEG_DECODER codec and HANTRO_MODE_JPEG_DEC mode
- struct hantro_jpeg_dec_hw_ctx holding the Q/H table side buffer,
  which is rebuilt from the frame header on every run
- src_needs_kmap and dst_needs_kmap flags for vb2_plane_vaddr() without
  DMA_ATTR_NO_KERNEL_MAPPING
- a neutral chroma plane written by the driver for a grayscale frame.
  The output format converter has no YUV400 path, so the hardware writes
  the luma plane and leaves the chroma alone, which comes out green
- rockchip_vpu720_jpeg_dec_run() for parse/fill/program/kick
- rejection of a frame that carries no EOI marker, which is what a
  source buffer too small for the frame looks like
- rejection of a frame larger than the negotiated capture format,
  whose dimensions would otherwise be programmed against strides
  taken from that format
- IRQ handler with detailed error diagnostics (REG32/33:
  MCU position, error flags) and soft-reset
- AXI perf counter setup (REG30)

Exposes one V4L2 M2M device: JPEG input -> NV12 output.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Lucas Sinn <lucas.sinn@wolfvision.net>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/media/platform/verisilicon/Makefile        |   1 +
 drivers/media/platform/verisilicon/hantro.h        |  17 +
 drivers/media/platform/verisilicon/hantro_drv.c    |  17 +-
 drivers/media/platform/verisilicon/hantro_hw.h     |  17 +
 drivers/media/platform/verisilicon/hantro_v4l2.c   |  38 +-
 .../verisilicon/rockchip_vpu720_hw_jpeg_dec.c      | 962 +++++++++++++++++++++
 .../platform/verisilicon/rockchip_vpu720_regs.h    | 261 ++++++
 .../media/platform/verisilicon/rockchip_vpu_hw.c   |  80 ++
 8 files changed, 1385 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/verisilicon/Makefile b/drivers/media/platform/verisilicon/Makefile
index f6f019d04ff00..5442692cce44b 100644
--- a/drivers/media/platform/verisilicon/Makefile
+++ b/drivers/media/platform/verisilicon/Makefile
@@ -33,6 +33,7 @@ hantro-vpu-$(CONFIG_VIDEO_HANTRO_ROCKCHIP) += \
 		rockchip_vpu2_hw_mpeg2_dec.o \
 		rockchip_vpu2_hw_vp8_dec.o \
 		rockchip_vpu981_hw_av1_dec.o \
+		rockchip_vpu720_hw_jpeg_dec.o \
 		rockchip_av1_filmgrain.o \
 		rockchip_av1_entropymode.o \
 		rockchip_vpu_hw.o
diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 0353de154a1ec..00e0f5981cca3 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -39,6 +39,7 @@ struct hantro_postproc_ops;
 #define HANTRO_HEVC_DECODER	BIT(19)
 #define HANTRO_VP9_DECODER	BIT(20)
 #define HANTRO_AV1_DECODER	BIT(21)
+#define HANTRO_JPEG_DECODER	BIT(22)
 #define HANTRO_DECODERS		0xffff0000
 
 /**
@@ -102,6 +103,19 @@ struct hantro_variant {
 	unsigned int double_buffer : 1;
 	unsigned int legacy_regs : 1;
 	unsigned int late_postproc : 1;
+	/*
+	 * src_needs_kmap: when set, the source queue will be allocated with
+	 * a kernel virtual address so the driver can CPU-parse the bitstream
+	 * (e.g. for JPEG header parsing).
+	 */
+	unsigned int src_needs_kmap : 1;
+	/*
+	 * dst_needs_kmap: when set, the capture queue will be allocated with
+	 * a kernel virtual address so the driver can write the parts of a
+	 * frame the hardware does not produce (e.g. the chroma plane of a
+	 * grayscale JPEG).
+	 */
+	unsigned int dst_needs_kmap : 1;
 	const struct of_device_id *shared_devices;
 };
 
@@ -115,6 +129,7 @@ struct hantro_variant {
  * @HANTRO_MODE_HEVC_DEC: HEVC decoder.
  * @HANTRO_MODE_VP9_DEC: VP9 decoder.
  * @HANTRO_MODE_AV1_DEC: AV1 decoder
+ * @HANTRO_MODE_JPEG_DEC: VPU720 JPEG decoder
  */
 enum hantro_codec_mode {
 	HANTRO_MODE_NONE = -1,
@@ -125,6 +140,7 @@ enum hantro_codec_mode {
 	HANTRO_MODE_HEVC_DEC,
 	HANTRO_MODE_VP9_DEC,
 	HANTRO_MODE_AV1_DEC,
+	HANTRO_MODE_JPEG_DEC,
 };
 
 /*
@@ -276,6 +292,7 @@ struct hantro_ctx {
 		struct hantro_hevc_dec_hw_ctx hevc_dec;
 		struct hantro_vp9_dec_hw_ctx vp9_dec;
 		struct hantro_av1_dec_hw_ctx av1_dec;
+		struct hantro_jpeg_dec_hw_ctx jpeg_dec;
 	};
 };
 
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index d9936f6979d2c..e0e01c1b7563c 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -237,11 +237,13 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 
 	/*
 	 * Driver does mostly sequential access, so sacrifice TLB efficiency
-	 * for faster allocation. Also, no CPU access on the source queue,
-	 * so no kernel mapping needed.
+	 * for faster allocation.  Omit DMA_ATTR_NO_KERNEL_MAPPING when the
+	 * hardware variant needs to CPU-parse the source bitstream (e.g. the
+	 * VPU720 JPEG decoder reads Q/H tables from the JPEG header).
 	 */
-	src_vq->dma_attrs = DMA_ATTR_ALLOC_SINGLE_PAGES |
-			    DMA_ATTR_NO_KERNEL_MAPPING;
+	src_vq->dma_attrs = DMA_ATTR_ALLOC_SINGLE_PAGES;
+	if (!ctx->dev->variant->src_needs_kmap)
+		src_vq->dma_attrs |= DMA_ATTR_NO_KERNEL_MAPPING;
 	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->lock = &ctx->dev->vpu_mutex;
@@ -257,10 +259,12 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	dst_vq->dma_attrs = DMA_ATTR_ALLOC_SINGLE_PAGES;
 	/*
 	 * The Kernel needs access to the JPEG destination buffer for the
-	 * JPEG encoder to fill in the JPEG headers.
+	 * JPEG encoder to fill in the JPEG headers, and for a decoder whose
+	 * hardware variant leaves part of the frame to the driver.
 	 */
 	if (!ctx->is_encoder) {
-		dst_vq->dma_attrs |= DMA_ATTR_NO_KERNEL_MAPPING;
+		if (!ctx->dev->variant->dst_needs_kmap)
+			dst_vq->dma_attrs |= DMA_ATTR_NO_KERNEL_MAPPING;
 		dst_vq->max_num_buffers = MAX_POSTPROC_BUFFERS;
 	}
 
@@ -746,6 +750,7 @@ static const struct of_device_id of_hantro_match[] = {
 	{ .compatible = "rockchip,rk3568-vpu", .data = &rk3568_vpu_variant, },
 	{ .compatible = "rockchip,rk3588-vepu121", .data = &rk3568_vepu_variant, },
 	{ .compatible = "rockchip,rk3588-av1-vpu", .data = &rk3588_vpu981_variant, },
+	{ .compatible = "rockchip,rk3588-vpu720", .data = &rk3588_vpu720_variant, },
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_IMX8M
 	{ .compatible = "nxp,imx8mm-vpu-g1", .data = &imx8mm_vpu_g1_variant, },
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index 9754672a3306b..51c35d4d0c5fd 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -341,6 +341,16 @@ struct hantro_av1_dec_hw_ctx {
 	struct mvcdfs  cdfs_last_ndvc[NUM_REF_FRAMES];
 	int current_frame_index;
 };
+
+/**
+ * struct hantro_jpeg_dec_hw_ctx
+ *
+ * @table_base:		Q-table and Huffman table side buffer.
+ */
+struct hantro_jpeg_dec_hw_ctx {
+	struct hantro_aux_buf table_base;
+};
+
 /**
  * struct hantro_postproc_ctx
  *
@@ -415,6 +425,7 @@ extern const struct hantro_variant rk3399_vpu_variant;
 extern const struct hantro_variant rk3568_vepu_variant;
 extern const struct hantro_variant rk3568_vpu_variant;
 extern const struct hantro_variant rk3588_vpu981_variant;
+extern const struct hantro_variant rk3588_vpu720_variant;
 extern const struct hantro_variant sama5d4_vdec_variant;
 extern const struct hantro_variant sunxi_vpu_variant;
 extern const struct hantro_variant stm32mp25_vdec_variant;
@@ -463,6 +474,12 @@ void rockchip_vpu981_av1_dec_exit(struct hantro_ctx *ctx);
 int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx);
 void rockchip_vpu981_av1_dec_done(struct hantro_ctx *ctx);
 
+int rockchip_vpu720_jpeg_dec_init(struct hantro_ctx *ctx);
+void rockchip_vpu720_jpeg_dec_exit(struct hantro_ctx *ctx);
+int rockchip_vpu720_jpeg_dec_run(struct hantro_ctx *ctx);
+void rockchip_vpu720_reset(struct hantro_ctx *ctx);
+irqreturn_t rockchip_vpu720_irq(int irq, void *dev_id);
+
 static inline unsigned short hantro_vp9_num_sbs(unsigned short dimension)
 {
 	return (dimension + 63) / 64;
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 9e19daffe0075..b9b1848e43b30 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -765,6 +765,40 @@ static int vidioc_encoder_cmd(struct file *file, void *priv,
 	return 0;
 }
 
+/*
+ * The stateless codecs take a slice or frame per buffer described by the
+ * per frame controls and only accept V4L2_DEC_CMD_FLUSH.  The JPEG decoder
+ * has no controls and decodes a whole frame per buffer, so applications
+ * drive it like a stateful decoder and expect V4L2_DEC_CMD_STOP to work
+ * for draining.  The two sets of commands are disjoint, so dispatch to the
+ * helper matching the codec rather than picking one for everybody.
+ *
+ * The coded format of the context decides, not the set of codecs the device
+ * implements, so a variant offering both kinds answers per file handle.
+ */
+static bool hantro_is_stateful_dec(struct hantro_ctx *ctx)
+{
+	return ctx->vpu_src_fmt->codec_mode == HANTRO_MODE_JPEG_DEC;
+}
+
+static int hantro_try_decoder_cmd(struct file *file, void *priv,
+				  struct v4l2_decoder_cmd *dc)
+{
+	if (hantro_is_stateful_dec(file_to_ctx(file)))
+		return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, dc);
+
+	return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, dc);
+}
+
+static int hantro_decoder_cmd(struct file *file, void *priv,
+			      struct v4l2_decoder_cmd *dc)
+{
+	if (hantro_is_stateful_dec(file_to_ctx(file)))
+		return v4l2_m2m_ioctl_decoder_cmd(file, priv, dc);
+
+	return v4l2_m2m_ioctl_stateless_decoder_cmd(file, priv, dc);
+}
+
 static int hantro_subscribe_event(struct v4l2_fh *fh,
 				  const struct v4l2_event_subscription *sub)
 {
@@ -807,8 +841,8 @@ const struct v4l2_ioctl_ops hantro_ioctl_ops = {
 	.vidioc_g_selection = vidioc_g_selection,
 	.vidioc_s_selection = vidioc_s_selection,
 
-	.vidioc_decoder_cmd = v4l2_m2m_ioctl_stateless_decoder_cmd,
-	.vidioc_try_decoder_cmd = v4l2_m2m_ioctl_stateless_try_decoder_cmd,
+	.vidioc_decoder_cmd = hantro_decoder_cmd,
+	.vidioc_try_decoder_cmd = hantro_try_decoder_cmd,
 
 	.vidioc_try_encoder_cmd = v4l2_m2m_ioctl_try_encoder_cmd,
 	.vidioc_encoder_cmd = vidioc_encoder_cmd,
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu720_hw_jpeg_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu720_hw_jpeg_dec.c
new file mode 100644
index 0000000000000..81fd79911d694
--- /dev/null
+++ b/drivers/media/platform/verisilicon/rockchip_vpu720_hw_jpeg_dec.c
@@ -0,0 +1,962 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip VPU720 JPEG decoder driver
+ *
+ * Ported from the Rockchip MPP HAL (hal_jpegd_rkv.c /
+ * hal_jpegd_vpu7xx_com.c) and the downstream mpp_jpgdec.c kernel driver.
+ *
+ * Copyright (C) 2020 Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2026 WolfVision GmbH
+ *   Author: <lucas.sinn@wolfvision.net>
+ */
+
+#include <linux/align.h>
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/iopoll.h>
+#include <media/v4l2-jpeg.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "hantro.h"
+#include "hantro_hw.h"
+#include "rockchip_vpu720_regs.h"
+
+static inline struct hantro_jpeg_dec_hw_ctx *
+jpeg_dec_ctx(struct hantro_ctx *ctx)
+{
+	return &ctx->jpeg_dec;
+}
+
+/*
+ * vdpu720_jpeg_mode - map V4L2 JPEG sampling to hardware JPEG mode.
+ *
+ * The sampling factor tuple is determined by the luma channel's factors
+ * relative to the maximum in the frame.  Standard JFIF layouts only,
+ * anything else returns -EINVAL: the mode also picks the MCU height and
+ * therefore PIC_H, so guessing one would decode into a wrong image.
+ */
+static int vdpu720_jpeg_mode(const struct v4l2_jpeg_frame_header *frame)
+{
+	u8 h0, v0;
+
+	if (frame->num_components == 1)
+		return VDPU720_JPEG_MODE_YUV400;
+
+	/* Component 0 always carries luma in JFIF */
+	h0 = frame->component[0].horizontal_sampling_factor;
+	v0 = frame->component[0].vertical_sampling_factor;
+
+	if (h0 == 1 && v0 == 1)
+		return VDPU720_JPEG_MODE_YUV444;
+	if (h0 == 2 && v0 == 1)
+		return VDPU720_JPEG_MODE_YUV422;
+	if (h0 == 2 && v0 == 2)
+		return VDPU720_JPEG_MODE_YUV420;
+	if (h0 == 4 && v0 == 1)
+		return VDPU720_JPEG_MODE_YUV411;
+	if (h0 == 1 && v0 == 2)
+		return VDPU720_JPEG_MODE_YUV440;
+
+	return -EINVAL;
+}
+
+/*
+ * vdpu720_nb_htbl_sets - number of Huffman table sets the hardware reads.
+ *
+ * One for a grayscale frame, two for a colour one.  vdpu720_write_htbl()
+ * fills that many sets and vdpu720_fill_regs() sizes HTBL_SEL and the length
+ * registers from the same number, so the two cannot drift apart.
+ */
+static unsigned int vdpu720_nb_htbl_sets(unsigned int num_components)
+{
+	return num_components == 1 ? 1 : VDPU720_NB_HTBL_SETS;
+}
+
+/*
+ * vdpu720_write_qtbl - write all Q-tables into the DMA side buffer.
+ *
+ * Tables are stored sequentially, one per component in component order.
+ * Each entry is widened to u16 and reordered from JPEG zig-zag scan to
+ * natural raster-scan order, matching the hardware expectation.
+ */
+static int vdpu720_write_qtbl(struct hantro_ctx *ctx,
+			      const struct v4l2_jpeg_header *hdr)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_jpeg_dec_hw_ctx *jpeg_ctx = jpeg_dec_ctx(ctx);
+	u16 *base = jpeg_ctx->table_base.cpu;
+	unsigned int k, i;
+
+	for (k = 0; k < hdr->frame.num_components; k++) {
+		u8 tq_id = hdr->frame.component[k].quantization_table_selector;
+		u8 qtbl[VDPU720_QTBL_ENTRIES];
+		u16 *dst;
+
+		/*
+		 * v4l2_jpeg_parse_header() filled quantization_tables[] by
+		 * destination selector (packed DQT segments handled); .start
+		 * points at the 64 Qk values, already past the Pq|Tq byte.
+		 */
+		if (tq_id > 3 || !hdr->quantization_tables[tq_id].start) {
+			dev_err(vpu->dev,
+				"Q-table %u not found for component %u\n",
+				tq_id, k);
+			return -EINVAL;
+		}
+
+		/*
+		 * Bulk-copy the Q-table out of the uncached source buffer once;
+		 * the per-element zigzag reads below would otherwise each be a
+		 * separate uncached bus transaction.
+		 */
+		memcpy(qtbl, hdr->quantization_tables[tq_id].start, sizeof(qtbl));
+		dst = base + k * VDPU720_QTBL_ENTRIES;
+
+		/*
+		 * Reorder zigzag → raster scan.
+		 * v4l2_jpeg_zigzag_scan_index[z] = raster position of zigzag
+		 * element z.  JPEG Q-tables are stored in zigzag order; the
+		 * hardware expects them in natural raster (row-major) order.
+		 */
+		for (i = 0; i < VDPU720_QTBL_ENTRIES; i++)
+			dst[v4l2_jpeg_zigzag_scan_index[i]] = (u16)qtbl[i];
+	}
+
+	return 0;
+}
+
+/*
+ * vdpu720_compute_mincode - compute the minimum Huffman code arrays for
+ * one Huffman table (DC or AC) from the 16-byte BITS array.
+ *
+ * @bits:      BITS[16] – number of codes of each length 1..16
+ * @min_code:  output: minimum code value per length (16 entries)
+ * @acc_addr:  output: accumulated symbol-table address per length (16 entries)
+ *
+ * Algorithm ported verbatim from jpegd_vpu7xx_write_htbl().
+ */
+static void vdpu720_compute_mincode(const u8 *bits,
+				    u16 *min_code, u16 *acc_addr)
+{
+	u16 code = 0, addr = 0;
+	unsigned int j;
+
+	for (j = 0; j < 16; j++) {
+		u16 len = bits[j];
+
+		if (len == 0 && j > 0) {
+			if (code > ((u16)(min_code[j - 1]) << 1))
+				min_code[j] = code;
+			else
+				min_code[j] = (u16)(min_code[j - 1]) << 1;
+		} else {
+			min_code[j] = code;
+		}
+
+		code  += len;
+		addr  += len;
+		acc_addr[j] = addr;
+		code <<= 1;
+	}
+
+	/* Sentinel: set min_code[0] to the last valid code + count */
+	if (bits[15])
+		min_code[0] = min_code[15] + bits[15] - 1;
+	else
+		min_code[0] = min_code[15];
+}
+
+/*
+ * vdpu720_write_htbl - fill the Huffman mincode and value sub-buffers.
+ *
+ * One set is written per vdpu720_nb_htbl_sets(), fed by the scan component
+ * that uses it: the first by the luma component and the second by the first
+ * chroma one.  The hardware has no room for a third set and no per component
+ * selector register, so a frame whose two chroma components disagree on their
+ * tables cannot be described to it and is refused rather than decoded with
+ * the wrong table for the last component.
+ *
+ * Per-set layout in the mincode buffer:
+ *   16 x u16  DC min-codes
+ *    8 x u16  DC accumulated addresses (packed pairs)
+ *   16 x u16  AC min-codes
+ *    8 x u16  AC accumulated addresses (packed pairs)
+ *
+ * Per-set layout in the value buffer (192 bytes):
+ *   16 bytes  DC code values
+ *  176 bytes  AC code values
+ */
+static int vdpu720_write_htbl(struct hantro_ctx *ctx,
+			      const struct v4l2_jpeg_header *hdr)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_jpeg_dec_hw_ctx *jpeg_ctx = jpeg_dec_ctx(ctx);
+	const struct v4l2_jpeg_scan_header *scan = hdr->scan;
+	u8  *tbl_base  = jpeg_ctx->table_base.cpu;
+	u16 *p_mincode = (u16 *)(tbl_base + VDPU720_HMINCODE_OFF);
+	u8  *p_value   = tbl_base + VDPU720_HVALUE_OFF;
+	unsigned int nb_sets = vdpu720_nb_htbl_sets(scan->num_components);
+	unsigned int k, i;
+
+	/* The last set is shared by every remaining component */
+	for (k = nb_sets; k < scan->num_components; k++) {
+		if (scan->component[k].dc_entropy_coding_table_selector !=
+		    scan->component[nb_sets - 1].dc_entropy_coding_table_selector ||
+		    scan->component[k].ac_entropy_coding_table_selector !=
+		    scan->component[nb_sets - 1].ac_entropy_coding_table_selector) {
+			dev_err_ratelimited(vpu->dev,
+					    "JPEG component %u uses other Huffman tables than component %u\n",
+					    k, nb_sets - 1);
+			return -EINVAL;
+		}
+	}
+
+	for (k = 0; k < nb_sets; k++) {
+		u8 dc_sel = scan->component[k].dc_entropy_coding_table_selector;
+		u8 ac_sel = scan->component[k].ac_entropy_coding_table_selector;
+		u8 dc_bits[16], ac_bits[16];
+		const u8 *dc_src, *ac_src, *dc_vals, *ac_vals;
+		unsigned int dc_huffval_len, ac_huffval_len;
+		u16 min_dc[16], acc_dc[16];
+		u16 min_ac[16], acc_ac[16];
+
+		/*
+		 * v4l2_jpeg_parse_header() filled huffman_tables[] indexed by
+		 * (Tc << 1) | Th - Tc=0/1 (DC/AC) class, Th=0/1 (luma/chroma)
+		 * id (packed DHT segments handled).  .start points at BITS[16],
+		 * already past the Tc|Th byte.
+		 */
+		if (dc_sel > 1 || ac_sel > 1 ||
+		    !hdr->huffman_tables[dc_sel].start ||
+		    !hdr->huffman_tables[2 | ac_sel].start) {
+			dev_err(vpu->dev,
+				"H-table not found for component %u (dc=%u ac=%u)\n",
+				k, dc_sel, ac_sel);
+			return -EINVAL;
+		}
+
+		/*
+		 * Layout at .start: [BITS 16B] [HUFFVAL sum(BITS)B].  Derive the
+		 * HUFFVAL length from BITS (a packed segment's length would
+		 * over-count when several tables share it).
+		 */
+		dc_src = hdr->huffman_tables[dc_sel].start;
+		ac_src = hdr->huffman_tables[2 | ac_sel].start;
+
+		/*
+		 * Bulk-copy the two BITS arrays out of the uncached source; they
+		 * are otherwise walked byte-by-byte twice (the length sum here and
+		 * again in vdpu720_compute_mincode()).  The HUFFVAL blocks stay in
+		 * the source and are copied out in one memcpy() further down.
+		 */
+		memcpy(dc_bits, dc_src, sizeof(dc_bits));
+		memcpy(ac_bits, ac_src, sizeof(ac_bits));
+		dc_vals = dc_src + 16;
+		ac_vals = ac_src + 16;
+
+		dc_huffval_len = 0;
+		for (i = 0; i < 16; i++)
+			dc_huffval_len += dc_bits[i];
+		ac_huffval_len = 0;
+		for (i = 0; i < 16; i++)
+			ac_huffval_len += ac_bits[i];
+
+		/*
+		 * The value block holds VDPU720_DC_VALUES_MAX DC and
+		 * VDPU720_AC_VALUES_MAX AC symbols, and the accumulated
+		 * addresses below are packed two per u16, so they have to stay
+		 * within a byte as well.  A table the hardware cannot hold
+		 * would otherwise be truncated into it silently and decode to
+		 * a wrong image.  Both limits are covered by this check, the
+		 * value block is the tighter of the two.
+		 */
+		if (dc_huffval_len > VDPU720_DC_VALUES_MAX ||
+		    ac_huffval_len > VDPU720_AC_VALUES_MAX) {
+			dev_err_ratelimited(vpu->dev,
+					    "JPEG Huffman table too large for component %u (dc=%u ac=%u)\n",
+					    k, dc_huffval_len, ac_huffval_len);
+			return -EINVAL;
+		}
+
+		vdpu720_compute_mincode(dc_bits, min_dc, acc_dc);
+		vdpu720_compute_mincode(ac_bits, min_ac, acc_ac);
+
+		for (i = 0; i < 16; i++)
+			*p_mincode++ = min_dc[i];
+		for (i = 0; i < 8; i++)
+			*p_mincode++ = (u16)acc_dc[2 * i] |
+				       ((u16)acc_dc[2 * i + 1] << 8);
+		for (i = 0; i < 16; i++)
+			*p_mincode++ = min_ac[i];
+		for (i = 0; i < 8; i++)
+			*p_mincode++ = (u16)acc_ac[2 * i] |
+				       ((u16)acc_ac[2 * i + 1] << 8);
+
+		/* Zero-pad the value block, then fill DC then AC values. */
+		memset(p_value, 0, VDPU720_HVALUE_SET_SIZE);
+		memcpy(p_value, dc_vals, dc_huffval_len);
+		memcpy(p_value + VDPU720_DC_VALUES_MAX, ac_vals, ac_huffval_len);
+		p_value += VDPU720_HVALUE_SET_SIZE;
+	}
+
+	return 0;
+}
+
+/*
+ * vdpu720_fill_regs - program the 42 VPU720 decoder registers.
+ *
+ * Called with already-parsed header and DMA addresses of the source
+ * bitstream and the destination NV12 buffer.
+ */
+static int vdpu720_fill_regs(struct hantro_ctx *ctx,
+			     const struct v4l2_jpeg_header *hdr,
+			     dma_addr_t tbl_dma,
+			     dma_addr_t strm_dma, u32 strm_start_byte,
+			     u32 strm_len_blks,
+			     dma_addr_t out_dma)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	/*
+	 * Use negotiated buffer dimensions for stride/vstride so the NV12 UV
+	 * plane lands at the correct offset in the allocated buffer.
+	 *
+	 * For PIC_SIZE, use the MCU-boundary-aligned height rather than the
+	 * raw JPEG header height.  The VPU720 computes its vertical MCU count
+	 * as floor(PIC_H / mcu_height).  For YUV420/YUV440 (mcu_height=16),
+	 * a 1080-pixel-high image yields floor(1080/16)=67 MCUs, but the JPEG
+	 * encoder always writes ceil(1080/16)=68 complete MCUs (1088 rows of
+	 * entropy data).  Using PIC_H=1080 therefore causes the hardware to
+	 * stop after row 1072, leaving the bottom 8 rows unwritten and
+	 * potentially triggering decode errors from unread bitstream bytes.
+	 *
+	 * Using ALIGN(jpeg_height, mcu_height) is always safe: the encoder
+	 * writes exactly ceil(height/mcu_height) MCUs, so the aligned height
+	 * matches the actual entropy data in the bitstream.  For modes where
+	 * jpeg_height is already on an MCU boundary (all 8-pixel-MCU modes at
+	 * standard resolutions), ALIGN() is a no-op.
+	 */
+	u32 jpeg_width  = hdr->frame.width;
+	u32 jpeg_height = hdr->frame.height;
+	u32 buf_width   = ctx->dst_fmt.width;
+	u32 buf_height  = ctx->dst_fmt.height;
+	u32 w_align     = ALIGN(buf_width, 16);
+	u32 y_stride    = w_align >> 4;		  /* units of 16 pixels */
+	u32 y_vstride   = y_stride * buf_height; /* stride-units for Y plane, sets UV offset */
+	u32 nb_comp   = hdr->frame.num_components;
+	/*
+	 * qtbl_sel = number of Q-table entries written to the side buffer,
+	 * one per component.  Using hdr->num_dqt (segment count) is wrong
+	 * when a camera packs all Q-tables into a single DQT segment
+	 * (num_dqt=1) while there are 3 components - the hardware would
+	 * only read 1 Q-table, leaving Cb/Cr with garbage → corrupted
+	 * chroma and the "80% height cut" visual artifact.
+	 */
+	u32 qtbl_sel  = nb_comp;
+	/*
+	 * H-table sets: one for grayscale (luma only), two for colour (luma +
+	 * chroma).  The three table lengths below are computed from these two
+	 * counts and the side buffer layout, so what is programmed is what
+	 * vdpu720_write_qtbl() and vdpu720_write_htbl() actually wrote.
+	 */
+	u32 htbl_sel  = vdpu720_nb_htbl_sets(nb_comp);
+	u32 mcu_width, mcu_height, jpeg_height_aligned;
+	u32 qtbl_len, hmin_len, hval_len;
+	int jpeg_mode;
+	u32 reg;
+
+	jpeg_mode = vdpu720_jpeg_mode(&hdr->frame);
+	if (jpeg_mode < 0) {
+		dev_err_ratelimited(vpu->dev,
+				    "unsupported JPEG sampling factors %ux%u\n",
+				    hdr->frame.component[0].horizontal_sampling_factor,
+				    hdr->frame.component[0].vertical_sampling_factor);
+		return jpeg_mode;
+	}
+
+	/*
+	 * MCU size follows the luma sampling factors, MCU_W = h0 * 8 and
+	 * MCU_H = v0 * 8.  YUV420 and YUV440 subsample the luma vertically by
+	 * 2, giving MCU_H = 16; YUV420 and YUV422 subsample it horizontally
+	 * by 2 and YUV411 by 4, giving MCU_W = 16 and 32.  The rest is 8.
+	 */
+	mcu_height = (jpeg_mode == VDPU720_JPEG_MODE_YUV420 ||
+		      jpeg_mode == VDPU720_JPEG_MODE_YUV440) ? 16 : 8;
+	mcu_width  = (jpeg_mode == VDPU720_JPEG_MODE_YUV411) ? 32 :
+		     (jpeg_mode == VDPU720_JPEG_MODE_YUV420 ||
+		      jpeg_mode == VDPU720_JPEG_MODE_YUV422) ? 16 : 8;
+	jpeg_height_aligned = ALIGN(jpeg_height, mcu_height);
+
+	/*
+	 * The picture dimensions below are taken from the bitstream while the
+	 * strides are taken from the negotiated capture format. A frame that
+	 * is larger than what was negotiated would make the decoder write
+	 * beyond the capture buffer, so refuse it rather than program the
+	 * hardware with the two sets of numbers mixed.
+	 */
+	if (jpeg_width > buf_width || jpeg_height_aligned > buf_height) {
+		dev_err_ratelimited(vpu->dev,
+				    "JPEG %ux%u does not fit the negotiated %ux%u\n",
+				    jpeg_width, jpeg_height_aligned, buf_width, buf_height);
+		return -EINVAL;
+	}
+
+	/*
+	 * REG2: system config – always output NV12.
+	 *
+	 * FILL_DOWN_E belongs to the NV12 conversion rather than to a
+	 * particular pair of heights: the output chroma is vertically
+	 * subsampled, so the hardware has to complete the bottom of the
+	 * picture.  Two cases need it:
+	 *
+	 *  a) jpeg_height is not on an MCU boundary (e.g. YUV420 1080p:
+	 *     jpeg_height=1080, jpeg_height_aligned=1088, buf_height=1088).
+	 *     The VPU720 needs FILL_DOWN_E to complete the last MCU row's
+	 *     chroma reconstruction.  Without it the bottom rows are corrupt
+	 *     even though PIC_H is already set to the MCU-aligned height.
+	 *
+	 *  b) MCU-aligned height < buf_height (e.g. YUV422 1080p: mcu_h=8,
+	 *     jpeg_height_aligned=1080, buf_height=1088).  The hardware fills
+	 *     rows 1080..1087 by repeating the last valid row.
+	 *
+	 * A height that is a multiple of 16 leaves nothing to fill, but the
+	 * bit is set there as well: the reference driver enables it for every
+	 * NV12 conversion, whatever the picture and buffer heights are.
+	 *
+	 * FILL_RIGHT_E does the same for the right hand edge, but there it
+	 * depends on the mode.  The decoder writes whole MCUs, so the last
+	 * MCU column ends at ALIGN(jpeg_width, mcu_width) while the buffer is
+	 * 16 pixel aligned.  Only the 8 pixel MCU widths can stop short of
+	 * that and need the columns in between filled; a 16 or 32 pixel MCU
+	 * already reaches at least as far.  The reference driver arrives at
+	 * the same set through a per mode test on (width & 0xf) <= 8.
+	 */
+	reg = FIELD_PREP(VDPU720_YUV_OUT_FMT, VDPU720_YUV_OUT_FMT_NV12) |
+	      VDPU720_FILL_DOWN_E;
+	if (ALIGN(jpeg_width, mcu_width) < ALIGN(jpeg_width, 16))
+		reg |= VDPU720_FILL_RIGHT_E;
+	vdpu_write_relaxed(vpu, reg, VDPU720_REG_SYS);
+
+	/*
+	 * --- REG3: picture dimensions ---
+	 *
+	 * PIC_W stays at the raw header width while PIC_H is rounded up to
+	 * the MCU boundary.  Rounding the width up the same way is not safe:
+	 * mcu_width reaches 32 for YUV411, so ALIGN(jpeg_width, mcu_width)
+	 * can land beyond the 16 pixel aligned buffer width and point the
+	 * decoder past the end of a row.  FILL_RIGHT_E above covers the cases
+	 * where the MCU column stops short instead.  The reference driver
+	 * programs the raw width here too.
+	 */
+	vdpu_write_relaxed(vpu,
+			   FIELD_PREP(VDPU720_PIC_W_M1, jpeg_width - 1) |
+			   FIELD_PREP(VDPU720_PIC_H_M1, jpeg_height_aligned - 1),
+			   VDPU720_REG_PIC_SIZE);
+
+	/* --- REG4: JPEG format, Q/H table counts, restart interval --- */
+	qtbl_len = VDPU720_TBL_LEN(qtbl_sel * VDPU720_QTBL_COMP_SIZE);
+	hmin_len = VDPU720_TBL_LEN(htbl_sel * VDPU720_HMINCODE_SET_SIZE);
+	hval_len = VDPU720_TBL_LEN(htbl_sel * VDPU720_HVALUE_SET_SIZE);
+
+	reg = FIELD_PREP(VDPU720_JPEG_MODE, jpeg_mode) |
+	      FIELD_PREP(VDPU720_PIX_DEPTH, VDPU720_PIX_DEPTH_8) |
+	      FIELD_PREP(VDPU720_QTBL_SEL, qtbl_sel) |
+	      FIELD_PREP(VDPU720_HTBL_SEL, htbl_sel);
+	if (hdr->restart_interval) {
+		reg |= VDPU720_DRI_E;
+		reg |= FIELD_PREP(VDPU720_DRI_MCU_M1,
+				  hdr->restart_interval - 1);
+	}
+	vdpu_write_relaxed(vpu, reg, VDPU720_REG_PIC_FMT);
+
+	/* --- REG5: horizontal virtual strides --- */
+	vdpu_write_relaxed(vpu,
+			   FIELD_PREP(VDPU720_Y_HOR_STRIDE, y_stride) |
+			   FIELD_PREP(VDPU720_UV_HOR_STRIDE, y_stride),
+			   VDPU720_REG_HOR_STRIDE);
+
+	/* --- REG6: total Y-plane size (stride-units * height) --- */
+	vdpu_write_relaxed(vpu, FIELD_PREP(VDPU720_Y_VSTRIDE, y_vstride),
+			   VDPU720_REG_Y_VSTRIDE);
+
+	/* --- REG7: table lengths + high stride bit --- */
+	reg = FIELD_PREP(VDPU720_QTBL_LEN, qtbl_len) |
+	      FIELD_PREP(VDPU720_HTBL_MINCODE_LEN, hmin_len) |
+	      FIELD_PREP(VDPU720_HTBL_VALUE_LEN, hval_len) |
+	      FIELD_PREP(VDPU720_Y_HOR_STRIDE_H, y_stride >> 16);
+	vdpu_write_relaxed(vpu, reg, VDPU720_REG_TBL_LEN);
+
+	/* --- REG8: stream length and start byte --- */
+	vdpu_write_relaxed(vpu,
+			   FIELD_PREP(VDPU720_STRM_START_BYTE, strm_start_byte) |
+			   FIELD_PREP(VDPU720_STRM_LEN, strm_len_blks),
+			   VDPU720_REG_STRM_LEN);
+
+	/* --- REG9-REG11: Q/H table DMA addresses (side buffer) --- */
+	hantro_write_addr(vpu, VDPU720_REG_QTBL_BASE,   tbl_dma + 0);
+	hantro_write_addr(vpu, VDPU720_REG_HTBL_MINCODE,
+			  tbl_dma + VDPU720_HMINCODE_OFF);
+	hantro_write_addr(vpu, VDPU720_REG_HTBL_VALUE,
+			  tbl_dma + VDPU720_HVALUE_OFF);
+
+	/* --- REG12: stream base (16-byte aligned) --- */
+	hantro_write_addr(vpu, VDPU720_REG_STRM_BASE, strm_dma);
+
+	/* --- REG13: NV12 output buffer --- */
+	hantro_write_addr(vpu, VDPU720_REG_OUT_BASE, out_dma);
+
+	/* --- REG14: stream error handling defaults --- */
+	vdpu_write_relaxed(vpu, VDPU720_STRM_ERR_DFLT, VDPU720_REG_STRM_ERR);
+
+	/* --- REG16: enable all internal clock gates --- */
+	vdpu_write_relaxed(vpu, VDPU720_CLK_GATE_ALL, VDPU720_REG_CLK_GATE);
+
+	/* --- REG30: AXI performance counter --- */
+	vdpu_write_relaxed(vpu,
+			   VDPU720_PERF_WORK_E | VDPU720_PERF_CLR_E |
+			   VDPU720_PERF_CNT_TYPE |
+			   FIELD_PREP(VDPU720_PERF_RD_LAT_ID, 0xa),
+			   VDPU720_REG_PERF_CTRL);
+
+	return 0;
+}
+
+/*
+ * vdpu720_fill_chroma - write neutral chroma for a grayscale frame.
+ *
+ * The output format converter has no YUV400 path: VDPU720_YUV_OUT_FMT_NV12
+ * only covers the subsampled colour modes, and for a single component frame
+ * the hardware writes the luma plane and leaves the chroma plane untouched.
+ *
+ * Fill the plane here, before the hardware is started: once the decode is
+ * running the interrupt can complete the job and hand the buffer to
+ * userspace at any time.
+ */
+static int vdpu720_fill_chroma(struct hantro_ctx *ctx,
+			       struct vb2_v4l2_buffer *dst_buf)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	u32 y_size = ctx->dst_fmt.plane_fmt[0].bytesperline *
+		     ctx->dst_fmt.height;
+	u32 size = ctx->dst_fmt.plane_fmt[0].sizeimage;
+	void *dst_cpu;
+
+	/* Available because variant->dst_needs_kmap */
+	dst_cpu = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
+	if (!dst_cpu) {
+		dev_err(vpu->dev,
+			"JPEG capture buffer has no kernel mapping\n");
+		return -EINVAL;
+	}
+
+	memset(dst_cpu + y_size, 0x80, size - y_size);
+
+	return 0;
+}
+
+/**
+ * rockchip_vpu720_jpeg_dec_init() - allocate the per-context DMA side buffer
+ * @ctx:	context to allocate the Q/Huffman table buffer for
+ *
+ * Return: 0 on success, -ENOMEM if the buffer could not be allocated.
+ */
+int rockchip_vpu720_jpeg_dec_init(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_jpeg_dec_hw_ctx *jpeg_ctx = jpeg_dec_ctx(ctx);
+
+	jpeg_ctx->table_base.size = VDPU720_TABLE_BUF_SIZE;
+	jpeg_ctx->table_base.cpu  =
+		dma_alloc_noncoherent(vpu->dev,
+				      jpeg_ctx->table_base.size,
+				      &jpeg_ctx->table_base.dma,
+				      DMA_TO_DEVICE, GFP_KERNEL);
+	if (!jpeg_ctx->table_base.cpu)
+		return -ENOMEM;
+
+	return 0;
+}
+
+/**
+ * rockchip_vpu720_jpeg_dec_exit() - free the per-context DMA side buffer
+ * @ctx:	context the buffer belongs to
+ */
+void rockchip_vpu720_jpeg_dec_exit(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_jpeg_dec_hw_ctx *jpeg_ctx = jpeg_dec_ctx(ctx);
+
+	if (jpeg_ctx->table_base.cpu) {
+		dma_free_noncoherent(vpu->dev,
+				     jpeg_ctx->table_base.size,
+				     jpeg_ctx->table_base.cpu,
+				     jpeg_ctx->table_base.dma,
+				     DMA_TO_DEVICE);
+		jpeg_ctx->table_base.cpu = NULL;
+	}
+}
+
+/**
+ * rockchip_vpu720_jpeg_dec_run() - parse the header, fill the side buffer,
+ *				    program the registers and start the hardware
+ * @ctx:	context holding the queues and the side buffer
+ *
+ * The source queue carries the JPEG bitstream; the destination queue
+ * carries the NV12 output buffer.  Both addresses are in IOVA space
+ * managed by the device's IOMMU.
+ *
+ * Return: 0 with the hardware started, or a negative errno for a frame that
+ * cannot be decoded, in which case device_run() finishes the job.
+ */
+int rockchip_vpu720_jpeg_dec_run(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_jpeg_dec_hw_ctx *jpeg_ctx = jpeg_dec_ctx(ctx);
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct v4l2_jpeg_scan_header scan_header;
+	struct v4l2_jpeg_reference quantization_tables[4] = { };
+	struct v4l2_jpeg_reference huffman_tables[4] = { };
+	struct v4l2_jpeg_header hdr = {
+		.scan = &scan_header,
+		.quantization_tables = quantization_tables,
+		.huffman_tables = huffman_tables,
+	};
+	void *src_cpu;
+	dma_addr_t src_dma, dst_dma;
+	u8 tail[64];
+	u32 tail_len, i;
+	u32 src_len;
+	u32 hw_strm_off, scan_start, strm_start_byte, strm_len_blks, data_off;
+	u32 strm_off, strm_end;
+	int ret;
+
+	hantro_start_prepare_run(ctx);
+
+	src_buf = hantro_get_src_buf(ctx);
+	dst_buf = hantro_get_dst_buf(ctx);
+
+	src_cpu = vb2_plane_vaddr(&src_buf->vb2_buf, 0);
+	src_len = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
+	src_dma = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
+	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
+
+	if (!src_cpu) {
+		dev_err(vpu->dev, "JPEG source buffer has no kernel mapping\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	data_off = src_buf->vb2_buf.planes[0].data_offset;
+
+	src_cpu += data_off;
+	src_len -= data_off;
+
+	if (src_len < 4) {
+		vpu_debug(1, "VPU720: skipping short JPEG buffer (src_len=%u)\n",
+			  src_len);
+		ret = -EINVAL;
+		goto err;
+	}
+
+	/*
+	 * Parse the JPEG header directly from the source buffer to support
+	 * JFIF 1.02 with embedded thumbnails (up to ~60KB in APP0 segment).
+	 * The downstream reference and hardware manual specify parsing the
+	 * full stream header before writing tables to external memory.
+	 */
+	ret = v4l2_jpeg_parse_header(src_cpu, src_len, &hdr);
+	if (ret < 0) {
+		/*
+		 * Log first 8 bytes of the buffer for diagnostics: empty buffer
+		 * (0x00...), wrong start (not 0xFF 0xD8), or malformed JPEG.
+		 */
+		dev_warn_ratelimited(vpu->dev,
+				     "failed to parse JPEG header: %d (src_len=%u first_bytes=%*ph)\n",
+				     ret, src_len, min_t(int, src_len, 8), src_cpu);
+		goto err;
+	}
+
+	/*
+	 * v4l2_jpeg_parse_header() returns as soon as it reaches the SOS
+	 * marker and never looks at the entropy coded data behind it, so a
+	 * JPEG that got truncated because it did not fit into the source
+	 * buffer parses without an error. The hardware would decode as many
+	 * MCUs as it finds and hand out a half filled frame, which is not
+	 * distinguishable from a good one.
+	 *
+	 * Look for the EOI marker near the end of the payload. It cannot
+	 * appear within the entropy coded data itself as 0xff bytes are
+	 * stuffed there, so finding it means the frame is complete.
+	 *
+	 * Only the last few bytes are searched, which covers a frame size
+	 * padded up to a 64 byte boundary and any short trailer behind the
+	 * image. Looking further back is not worth it: the source buffer is
+	 * uncached, so a walk over the whole payload would cost one bus
+	 * transaction per byte, and a payload ending far behind its EOI is
+	 * one whose bytesused was never set - in which case videobuf2
+	 * substitutes the full plane length and a recycled buffer holds the
+	 * previous frame's bytes back there anyway. The tail is copied out
+	 * in one memcpy() for the same reason.
+	 */
+	tail_len = min_t(u32, src_len, sizeof(tail));
+	memcpy(tail, src_cpu + src_len - tail_len, tail_len);
+
+	for (i = 0; i + 1 < tail_len; i++)
+		if (tail[i] == 0xff && tail[i + 1] == 0xd9)
+			break;
+
+	if (i + 1 >= tail_len) {
+		dev_err_ratelimited(vpu->dev,
+				    "truncated JPEG, no EOI at the end of the %u byte payload (buffer too small?)\n",
+				    src_len);
+		ret = -EINVAL;
+		goto err;
+	}
+
+	/*
+	 * v4l2_jpeg_parse_header() accepts twelve bit samples for SOF1, but
+	 * vdpu720_fill_regs() always programs VDPU720_PIX_DEPTH_8.
+	 */
+	if (hdr.frame.precision != 8) {
+		dev_err_ratelimited(vpu->dev,
+				    "unsupported JPEG sample precision %u\n",
+				    hdr.frame.precision);
+		ret = -EINVAL;
+		goto err;
+	}
+
+	/*
+	 * Only a single component frame and the three component layouts
+	 * vdpu720_jpeg_mode() maps are decodable.  It derives the mode from
+	 * the luma sampling factors alone, so a two component frame would
+	 * come back as one of the three component modes and the hardware
+	 * would go looking for a chroma plane that is not in the bitstream.
+	 * The table lengths in vdpu720_fill_regs() assume the same two cases.
+	 */
+	if (hdr.frame.num_components != 1 &&
+	    hdr.frame.num_components != VDPU720_NB_COMPONENTS) {
+		dev_err_ratelimited(vpu->dev,
+				    "unsupported JPEG component count %u\n",
+				    hdr.frame.num_components);
+		ret = -EINVAL;
+		goto err;
+	}
+
+	/*
+	 * The decoder runs the whole frame in one go and vdpu720_fill_regs()
+	 * sizes the table registers from the frame, while vdpu720_write_htbl()
+	 * fills the side buffer from the scan.  A non interleaved frame, whose
+	 * first scan carries a single component, would leave the rest of the
+	 * side buffer zeroed.
+	 */
+	if (scan_header.num_components != hdr.frame.num_components) {
+		dev_err_ratelimited(vpu->dev,
+				    "JPEG scan covers %u of %u components, non interleaved scans are not supported\n",
+				    scan_header.num_components, hdr.frame.num_components);
+		ret = -EINVAL;
+		goto err;
+	}
+
+	scan_start = hdr.ecs_offset;
+	if (scan_start >= src_len) {
+		dev_err(vpu->dev, "JPEG ECS offset beyond buffer bounds\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	/*
+	 * Rebuild the Q/H-table side buffer every frame.  table_base is a cached
+	 * (dma_alloc_noncoherent) buffer and write_qtbl()/write_htbl() stage the
+	 * source tables through cached stack buffers, so the build stays on
+	 * cached memory (~15us); dma_sync_single_for_device() then flushes it to
+	 * DRAM before the hardware reads it.
+	 */
+	memset(jpeg_ctx->table_base.cpu, 0, jpeg_ctx->table_base.size);
+
+	ret = vdpu720_write_qtbl(ctx, &hdr);
+	if (ret)
+		goto err;
+
+	ret = vdpu720_write_htbl(ctx, &hdr);
+	if (ret)
+		goto err;
+
+	dma_sync_single_for_device(vpu->dev, jpeg_ctx->table_base.dma,
+				   jpeg_ctx->table_base.size, DMA_TO_DEVICE);
+
+	/*
+	 * The stream register must be 16-byte aligned.  Round down to the
+	 * nearest 16-byte boundary and record the sub-block start byte.
+	 *
+	 * Both are taken from the start of the plane rather than from
+	 * src_cpu.  data_offset is set by userspace in VIDIOC_QBUF and
+	 * videobuf2 only rejects it when it is not smaller than bytesused,
+	 * so it carries arbitrary low bits.  Splitting a src_dma that
+	 * already includes it would leave STRM_BASE unaligned by those bits
+	 * with no way to encode them, and the hardware would start reading
+	 * from the wrong offset.
+	 */
+	strm_off         = data_off + scan_start;
+	strm_end         = data_off + src_len;
+	hw_strm_off      = strm_off & ~0xfU;
+	strm_start_byte  = strm_off & 0xfU;
+	strm_len_blks    = (ALIGN(strm_end - hw_strm_off, 16) - 1) >> 4;
+
+	ret = vdpu720_fill_regs(ctx, &hdr,
+				jpeg_ctx->table_base.dma,
+				src_dma + hw_strm_off, strm_start_byte,
+				strm_len_blks,
+				dst_dma);
+	if (ret)
+		goto err;
+
+	if (hdr.frame.num_components == 1) {
+		ret = vdpu720_fill_chroma(ctx, dst_buf);
+		if (ret)
+			goto err;
+	}
+
+	hantro_end_prepare_run(ctx, 0);
+
+	vdpu_write(vpu,
+		   VDPU720_DEC_E | VDPU720_TIMEOUT_E,
+		   VDPU720_REG_INT);
+
+	return 0;
+
+err:
+	hantro_end_prepare_run(ctx, ret);
+
+	return ret;
+}
+
+static int vdpu720_soft_reset(struct hantro_dev *vpu)
+{
+	u32 status;
+	int ret;
+
+	/*
+	 * If the decoder is idle (DEC_E=0), set FORCE_SOFTRESET_VALID
+	 * before triggering the soft reset, per downstream BSP behaviour.
+	 */
+	status = vdpu_read(vpu, VDPU720_REG_INT);
+	if (!(status & VDPU720_DEC_E))
+		vdpu_write(vpu, VDPU720_FORCE_SOFTRST, VDPU720_REG_SYS);
+
+	vdpu_write(vpu, status | VDPU720_SOFT_RST_EN, VDPU720_REG_INT);
+
+	ret = readl_relaxed_poll_timeout(vpu->dec_base + VDPU720_REG_INT,
+					 status,
+					 status & VDPU720_SOFT_RST_RDY,
+					 5, 10000);
+	if (ret)
+		dev_warn(vpu->dev, "VPU720 soft reset timed out\n");
+
+	return ret;
+}
+
+/*
+ * vdpu720_hard_reset - pulse the block's reset lines.
+ *
+ * reset_control_reset() is not usable here.  The lines come from the RK3588
+ * CRU, and rockchip_softrst_ops in drivers/clk/rockchip/softrst.c implements
+ * only .assert and .deassert, so reset_control_reset() returns -ENOTSUPP
+ * without touching the hardware.  Drive the pulse by hand instead.
+ *
+ * Only reached from hantro_watchdog(), which runs from a workqueue, so
+ * sleeping between the two halves is fine.
+ */
+static int vdpu720_hard_reset(struct hantro_dev *vpu)
+{
+	int ret;
+
+	ret = reset_control_assert(vpu->resets);
+	if (ret)
+		return ret;
+
+	usleep_range(10, 20);
+
+	return reset_control_deassert(vpu->resets);
+}
+
+/**
+ * rockchip_vpu720_reset() - error recovery reset called by the watchdog
+ * @ctx:	context whose job timed out
+ *
+ * Try a soft reset first; fall back to a full hardware reset (assert +
+ * deassert all resets) if the soft reset does not complete.
+ */
+void rockchip_vpu720_reset(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	int ret;
+
+	ret = vdpu720_soft_reset(vpu);
+	if (ret) {
+		dev_warn(vpu->dev,
+			 "VPU720 falling back to hard reset\n");
+
+		ret = vdpu720_hard_reset(vpu);
+		if (ret)
+			dev_err(vpu->dev,
+				"VPU720 hard reset failed: %d\n", ret);
+	}
+
+	vdpu_write(vpu, 0, VDPU720_REG_INT);
+}
+
+irqreturn_t rockchip_vpu720_irq(int irq, void *dev_id)
+{
+	struct hantro_dev *vpu = dev_id;
+	enum vb2_buffer_state state;
+	u32 status, clr_mask;
+
+	status = vdpu_read(vpu, VDPU720_REG_INT);
+
+	/*
+	 * VPU720-specific two-phase IRQ clear.
+	 * Write back a masked subset of status bits before checking
+	 * IRQ_RAW, as required by the VPU720 hardware.
+	 */
+	clr_mask = (~(VDPU720_IRQ_CLR_COND & status)) &
+		    (VDPU720_IRQ_CLR_KEEP & status);
+	vdpu_write(vpu, clr_mask, VDPU720_REG_INT);
+
+	if (!(status & VDPU720_IRQ_RAW))
+		return IRQ_NONE;
+
+	/* Fully clear IRQ */
+	vdpu_write(vpu, 0, VDPU720_REG_INT);
+
+	state = (status & VDPU720_ERR_MASK) ?
+		VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
+
+	if (status & VDPU720_DEC_ERR) {
+		u32 mcu_pos  = vdpu_read(vpu, VDPU720_REG_DBG_MCU_POS);
+		u32 err_info = vdpu_read(vpu, VDPU720_REG_DBG_ERROR);
+
+		dev_warn_ratelimited(vpu->dev,
+				     "VPU720 decode error: MCU pos=(%u,%u) flags=0x%04x [%s%s%s%s%s%s%s%s%s%s] first_idx=%u\n",
+				     (u32)FIELD_GET(VDPU720_DBG_MCU_POS_X, mcu_pos),
+				     (u32)FIELD_GET(VDPU720_DBG_MCU_POS_Y, mcu_pos),
+				     (u32)FIELD_GET(VDPU720_DERR_FLAGS, err_info),
+				     (err_info & VDPU720_DERR_DRI_SEQ)    ? "dri_seq "    : "",
+				     (err_info & VDPU720_DERR_STREAM_FFFF) ? "ffff "       : "",
+				     (err_info & VDPU720_DERR_OTHER_MARK)  ? "bad_mark "   : "",
+				     (err_info & VDPU720_DERR_MCU_CNT_L)   ? "dri_early "  : "",
+				     (err_info & VDPU720_DERR_MCU_CNT_M)   ? "dri_late "   : "",
+				     (err_info & VDPU720_DERR_EOI_NO_END)  ? "eoi_early "  : "",
+				     (err_info & VDPU720_DERR_END_NO_EOI)  ? "no_eoi "     : "",
+				     (err_info & VDPU720_DERR_OVERFLOW)    ? "overflow "   : "",
+				     (err_info & VDPU720_DERR_HUFF_EMPTY)  ? "huff_empty " : "",
+				     (err_info & (VDPU720_DERR_STREAM_R0 |
+						  VDPU720_DERR_STREAM_R1)) ? "stream_mark " : "",
+				     (u32)FIELD_GET(VDPU720_DERR_FIRST_IDX, err_info));
+
+		/* Clear the sticky error flags so they don't bleed into the next frame */
+		vdpu_write(vpu, err_info, VDPU720_REG_DBG_ERROR);
+	}
+
+	hantro_irq_done(vpu, state);
+
+	return IRQ_HANDLED;
+}
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu720_regs.h b/drivers/media/platform/verisilicon/rockchip_vpu720_regs.h
new file mode 100644
index 0000000000000..cae9052126be1
--- /dev/null
+++ b/drivers/media/platform/verisilicon/rockchip_vpu720_regs.h
@@ -0,0 +1,261 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Rockchip VPU720 JPEG decoder register definitions
+ *
+ * Derived from downstream Rockchip MPP HAL (hal_jpegd_rkv_reg.h).
+ * Copyright (C) 2020 Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2026 WolfVision GmbH
+ */
+#ifndef ROCKCHIP_VPU720_REGS_H_
+#define ROCKCHIP_VPU720_REGS_H_
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/align.h>
+#include <linux/types.h>
+
+/* ------------------------------------------------------------------ */
+/* Register byte offsets from dec_base                                 */
+/* ------------------------------------------------------------------ */
+
+/* REG0: IP version / product ID */
+#define VDPU720_REG_VERSION		0x000
+#define VDPU720_PROD_NUM		GENMASK(31, 16)
+#define VDPU720_BIT_DEPTH		BIT(8)
+
+/* REG1: Interrupt control and status */
+#define VDPU720_REG_INT			0x004
+#define VDPU720_DEC_E			BIT(0)
+#define VDPU720_IRQ_DIS			BIT(1)
+#define VDPU720_TIMEOUT_E		BIT(2)
+#define VDPU720_BUF_EMPTY_E		BIT(3)
+#define VDPU720_BUF_EMPTY_RELOAD	BIT(4)
+#define VDPU720_SOFT_RST_EN		BIT(5)
+#define VDPU720_IRQ_RAW			BIT(6)
+#define VDPU720_WAIT_RESET_E		BIT(7)
+#define VDPU720_IRQ			BIT(8)
+#define VDPU720_DEC_RDY			BIT(9)
+#define VDPU720_BUS_ERR			BIT(10)
+#define VDPU720_DEC_ERR			BIT(11)
+#define VDPU720_TIMEOUT			BIT(12)
+#define VDPU720_BUF_EMPTY		BIT(13)
+#define VDPU720_SOFT_RST_RDY		BIT(14)
+
+/* Error status bits used to decide whether a hardware reset is needed */
+#define VDPU720_ERR_MASK		(VDPU720_BUS_ERR | VDPU720_DEC_ERR | \
+					 VDPU720_TIMEOUT | VDPU720_BUF_EMPTY)
+
+/*
+ * VPU720-specific IRQ clear mask.
+ *
+ * The VPU720 requires a two-step IRQ acknowledgment before checking
+ * VDPU720_IRQ_RAW.  Compute the masked value and write it back, then
+ * write 0 to fully clear.  The downstream BSP uses:
+ *
+ *   clr = (~(0x00fe7f40 & status)) & (0xff0180bf & status)
+ *
+ * Preserve "status" bits from 0xff0180bf while clearing only those
+ * bits NOT already set in 0x00fe7f40.
+ */
+#define VDPU720_IRQ_CLR_KEEP		0xff0180bf
+#define VDPU720_IRQ_CLR_COND		0x00fe7f40
+
+/* REG2: System configuration */
+#define VDPU720_REG_SYS			0x008
+#define VDPU720_FORCE_SOFTRST		BIT(17)	/* set when dec_e=0 before soft-reset */
+#define VDPU720_FILL_DOWN_E		BIT(24)	/* fill bottom padding rows */
+#define VDPU720_FILL_RIGHT_E		BIT(25)
+#define VDPU720_OUT_SEQ			BIT(26)	/* 0=raster, 1=tile */
+#define VDPU720_YUV_OUT_FMT		GENMASK(29, 27)
+#define VDPU720_YUV_OUT_FMT_NATIVE	0	/* no format conversion */
+#define VDPU720_YUV_OUT_FMT_NV12	3	/* output as NV12 */
+
+/* REG3: Picture dimensions (width/height in pixels, minus 1) */
+#define VDPU720_REG_PIC_SIZE		0x00c
+#define VDPU720_PIC_W_M1		GENMASK(15, 0)
+#define VDPU720_PIC_H_M1		GENMASK(31, 16)
+
+/* REG4: JPEG picture format */
+#define VDPU720_REG_PIC_FMT		0x010
+#define VDPU720_JPEG_MODE		GENMASK(2, 0)
+#define VDPU720_JPEG_MODE_YUV400	0
+#define VDPU720_JPEG_MODE_YUV411	1
+#define VDPU720_JPEG_MODE_YUV420	2
+#define VDPU720_JPEG_MODE_YUV422	3
+#define VDPU720_JPEG_MODE_YUV440	4
+#define VDPU720_JPEG_MODE_YUV444	5
+#define VDPU720_PIX_DEPTH		GENMASK(6, 4)
+#define VDPU720_PIX_DEPTH_8		0
+#define VDPU720_PIX_DEPTH_12		1
+/* qtables_sel: number of Q-table sets (0..3) */
+#define VDPU720_QTBL_SEL		GENMASK(9, 8)
+/* htables_sel: number of H-table sets (0..3) */
+#define VDPU720_HTBL_SEL		GENMASK(13, 12)
+/* dri_e: restart interval enable */
+#define VDPU720_DRI_E			BIT(15)
+/* dri_mcu_num_m1: restart interval MCU count minus 1 */
+#define VDPU720_DRI_MCU_M1		GENMASK(31, 16)
+
+/* REG5: Horizontal virtual stride */
+#define VDPU720_REG_HOR_STRIDE		0x014
+#define VDPU720_Y_HOR_STRIDE		GENMASK(15, 0)
+#define VDPU720_UV_HOR_STRIDE		GENMASK(31, 16)
+
+/* REG6: Vertical virtual stride (Y plane total) */
+#define VDPU720_REG_Y_VSTRIDE		0x018
+#define VDPU720_Y_VSTRIDE		GENMASK(31, 4)
+
+/* REG7: Table and stride lengths */
+#define VDPU720_REG_TBL_LEN		0x01c
+#define VDPU720_QTBL_LEN		GENMASK(4, 0)
+#define VDPU720_HTBL_MINCODE_LEN	GENMASK(12, 8)
+#define VDPU720_HTBL_VALUE_LEN		GENMASK(21, 16)
+/* bit 16 of the Y horizontal stride, low 16 bits live in REG5 */
+#define VDPU720_Y_HOR_STRIDE_H		BIT(24)
+
+/* REG8: Stream length and start byte */
+#define VDPU720_REG_STRM_LEN		0x020
+#define VDPU720_STRM_START_BYTE		GENMASK(3, 0)
+#define VDPU720_STRM_LEN		GENMASK(31, 4)
+
+/* REG9-REG13: DMA buffer base addresses (all word-sized, in IOVA units) */
+#define VDPU720_REG_QTBL_BASE		0x024	/* Q-table side buffer,   64-byte aligned */
+#define VDPU720_REG_HTBL_MINCODE	0x028	/* H-mincode table,       64-byte aligned */
+#define VDPU720_REG_HTBL_VALUE		0x02c	/* H-value table,         64-byte aligned */
+#define VDPU720_REG_STRM_BASE		0x030	/* JPEG entropy stream,   16-byte aligned */
+#define VDPU720_REG_OUT_BASE		0x034	/* NV12 output buffer,    64-byte aligned */
+
+/* REG14: Stream error handling */
+#define VDPU720_REG_STRM_ERR		0x038
+#define VDPU720_ERROR_PRC_MODE		BIT(0)
+#define VDPU720_STRM_FFFF_ERR_MODE	GENMASK(6, 5)
+#define VDPU720_STRM_OTHER_MODE		GENMASK(8, 7)
+/* Recommended default: accept errors, skip 0xFFFF, skip unknown markers */
+#define VDPU720_STRM_ERR_DFLT		(VDPU720_ERROR_PRC_MODE | \
+					 FIELD_PREP_CONST(VDPU720_STRM_FFFF_ERR_MODE, 2) | \
+					 FIELD_PREP_CONST(VDPU720_STRM_OTHER_MODE, 2))
+
+/* REG16: Clock gate (write 0xff to enable all internal clocks) */
+#define VDPU720_REG_CLK_GATE		0x040
+#define VDPU720_CLK_GATE_ALL		0xff
+
+/* REG30: AXI performance counter control */
+#define VDPU720_REG_PERF_CTRL		0x078
+#define VDPU720_PERF_WORK_E		BIT(0)
+#define VDPU720_PERF_CLR_E		BIT(1)
+#define VDPU720_PERF_CNT_TYPE		BIT(3)
+#define VDPU720_PERF_RD_LAT_ID		GENMASK(7, 4)
+
+/*
+ * REG31: performance-counter channel select.
+ *
+ * sw_ar/aw_count_id select which AXI channel the performance counters track.
+ * The driver leaves this register alone, as does the reference driver.
+ */
+#define VDPU720_REG_AXI_CFG		0x07c
+#define VDPU720_ADDR_ALIGN_TYPE		GENMASK(1, 0)
+#define VDPU720_AR_CNT_ID_TYPE		BIT(2)	/* 1 = count sw_ar_count_id only */
+#define VDPU720_AW_CNT_ID_TYPE		BIT(3)	/* 1 = count sw_aw_count_id only */
+#define VDPU720_AR_COUNT_ID		GENMASK(7, 4)
+#define VDPU720_AW_COUNT_ID		GENMASK(11, 8)
+#define VDPU720_RD_TOTAL_BYTES_MODE	BIT(12)	/* 1 = count sw_ar_count_id bytes only */
+
+/* REG32: MCU position when first decode error occurred (read-only) */
+#define VDPU720_REG_DBG_MCU_POS		0x080
+#define VDPU720_DBG_MCU_POS_X		GENMASK(15, 0)	/* column in MCU units */
+#define VDPU720_DBG_MCU_POS_Y		GENMASK(31, 16)	/* row in MCU units */
+
+/*
+ * REG33: Detailed JPEG decode error flags.
+ *
+ * All bits are RW (write-to-clear); read them in the IRQ handler when
+ * VDPU720_DEC_ERR is set to identify exactly what went wrong.
+ */
+#define VDPU720_REG_DBG_ERROR		0x084
+#define VDPU720_DERR_DRI_SEQ		BIT(0)	/* DRI not at expected sequence */
+#define VDPU720_DERR_STREAM_R0		BIT(1)	/* special marker 0 detected */
+#define VDPU720_DERR_STREAM_R1		BIT(2)	/* special marker 1 detected */
+#define VDPU720_DERR_STREAM_FFFF	BIT(3)	/* 0xFFFF sequence in stream */
+#define VDPU720_DERR_OTHER_MARK		BIT(4)	/* unknown JPEG marker */
+#define VDPU720_DERR_MCU_CNT_L		BIT(8)	/* restart mark arrived too early */
+#define VDPU720_DERR_MCU_CNT_M		BIT(9)	/* restart mark arrived too late */
+#define VDPU720_DERR_EOI_NO_END		BIT(10)	/* EOI before frame complete */
+#define VDPU720_DERR_END_NO_EOI		BIT(11)	/* frame complete without EOI */
+#define VDPU720_DERR_OVERFLOW		BIT(12)	/* Huffman coefficient overflow */
+#define VDPU720_DERR_HUFF_EMPTY		BIT(13)	/* bitstream empty before EOI */
+#define VDPU720_DERR_FLAGS		GENMASK(13, 0)	/* all of the above */
+#define VDPU720_DERR_FIRST_IDX		GENMASK(19, 16)	/* index of first error */
+
+/*
+ * REG34-REG38: AXI bus performance counters.
+ *
+ * Read after decode completes (in the IRQ handler) to measure actual
+ * memory bandwidth consumed per frame.  Counters are reset each frame
+ * by VDPU720_PERF_CLR_E in REG30.  All registers are 32-bit read-only.
+ */
+#define VDPU720_REG_PERF_RD_MAX_LAT	0x088	/* peak read latency (clock cycles) */
+#define VDPU720_REG_PERF_RD_LAT_SAMP	0x08c	/* read transactions above lat threshold */
+#define VDPU720_REG_PERF_RD_LAT_ACC	0x090	/* accumulated read latency sum */
+#define VDPU720_REG_PERF_RD_BYTES	0x094	/* total AXI read bytes this frame */
+#define VDPU720_REG_PERF_WR_BYTES	0x098	/* total AXI write bytes this frame */
+
+/* REG39: Hardware working cycle counter (counts clock cycles HW was active) */
+#define VDPU720_REG_PERF_CYCLES		0x09c
+
+/* ------------------------------------------------------------------ */
+/* Side-buffer layout for Q-tables and Huffman tables                  */
+/*                                                                     */
+/* The VPU720 JPEG decoder reads quantisation tables and Huffman       */
+/* tables from a contiguous DMA buffer with the following layout:      */
+/*                                                                     */
+/*   [0,         QTBL_SIZE):    Q-table data (u16, raster-scan order) */
+/*   [HMINCODE_OFF, +HMIN_SZ):  Huffman mincode table                 */
+/*   [HVALUE_OFF,  +HVAL_SZ):   Huffman value table                   */
+/* ------------------------------------------------------------------ */
+/* The Q-tables are per component, one entry each */
+#define VDPU720_NB_COMPONENTS		3
+#define VDPU720_QTBL_ENTRIES		64	/* 64 coefficients per table */
+#define VDPU720_QTBL_COMP_SIZE		(VDPU720_QTBL_ENTRIES * sizeof(u16))
+#define VDPU720_QTBL_SIZE		(VDPU720_QTBL_COMP_SIZE * VDPU720_NB_COMPONENTS)
+
+/*
+ * The Huffman tables are not per component.  The hardware holds two sets and
+ * has no per component selector register, so the mapping is fixed: the first
+ * set is used for the luma component and the second one for both chroma
+ * components.  A grayscale frame only needs the first.
+ */
+#define VDPU720_NB_HTBL_SETS		2
+
+/*
+ * Per-set mincode layout: 16 DC mincodes + 8 DC accaddr pairs +
+ * 16 AC mincodes + 8 AC accaddr pairs = 48 u16 = 96 bytes
+ */
+#define VDPU720_HMINCODE_SET_SIZE	(48 * sizeof(u16))
+#define VDPU720_HMINCODE_SIZE		(VDPU720_HMINCODE_SET_SIZE * VDPU720_NB_HTBL_SETS)
+#define VDPU720_HMINCODE_OFF		VDPU720_QTBL_SIZE
+
+/* Per-set value layout: 16 DC values + 176 AC values = 192 bytes */
+#define VDPU720_HVALUE_SET_SIZE		192
+#define VDPU720_HVALUE_SIZE		(VDPU720_HVALUE_SET_SIZE * VDPU720_NB_HTBL_SETS)
+#define VDPU720_HVALUE_OFF		(VDPU720_HMINCODE_OFF + \
+					 ALIGN(VDPU720_HMINCODE_SIZE, 64))
+
+#define VDPU720_TABLE_BUF_SIZE		(VDPU720_HVALUE_OFF + VDPU720_HVALUE_SIZE)
+
+/*
+ * The three table length registers count 16 byte units, minus one.  Derive
+ * them from the sizes above so that what is programmed always matches what
+ * the driver writes into the side buffer.
+ */
+#define VDPU720_TBL_LEN_UNIT		16
+#define VDPU720_TBL_LEN(bytes)		((bytes) / VDPU720_TBL_LEN_UNIT - 1)
+
+/*
+ * Huffman value sub-layout per set (192 bytes total):
+ *   bytes [0..15]:   DC code values (up to 12 valid entries)
+ *   bytes [16..191]: AC code values (up to 162 valid entries)
+ */
+#define VDPU720_DC_VALUES_MAX		16
+#define VDPU720_AC_VALUES_MAX		176	/* 12*16 - 16 */
+
+#endif /* ROCKCHIP_VPU720_REGS_H_ */
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 02673be9878e1..47197c60412c3 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -20,6 +20,21 @@
 
 #define ROCKCHIP_VPU981_MIN_SIZE 64
 
+/*
+ * VPU720 JPEG decoder limits.  The reference manual gives min 48x48 and
+ * max 65536x65536 with a step of 8 pixels, but the upper end of that range
+ * is not usable: a JPEG frame header cannot describe more than 65535
+ * pixels, the Y_VSTRIDE register field runs out at roughly 46340 square,
+ * and hantro_try_fmt() computes sizeimage as width * height * max_depth in
+ * 32 bits, which wraps beyond the same point.  Cap the advertised size
+ * well below all three, still four times 4K in each direction.
+ *
+ * NV12 output uses MB_DIM (16) step for hardware alignment; the decode path
+ * rounds up height to the next MB boundary (FILL_DOWN) before writing.
+ */
+#define VPU720_JPEGD_MAX_SIZE 16384
+#define VPU720_JPEGD_STEP 8
+
 /*
  * Supported formats.
  */
@@ -816,3 +831,68 @@ const struct hantro_variant rk3588_vpu981_variant = {
 	.clk_names = rk3588_vpu981_vpu_clk_names,
 	.num_clocks = ARRAY_SIZE(rk3588_vpu981_vpu_clk_names)
 };
+
+/* ------------------------------------------------------------------ */
+/* RK3588 VPU720 JPEG decoder                                          */
+/* ------------------------------------------------------------------ */
+
+/*
+ * Capture format: NV12.  The JPEG codec entry is listed last.
+ */
+static const struct hantro_fmt rk3588_vpu720_dec_fmts[] = {
+	{
+		.fourcc    = V4L2_PIX_FMT_NV12,
+		.codec_mode = HANTRO_MODE_NONE,
+		.frmsize   = {
+			.min_width  = FMT_MIN_WIDTH,
+			.max_width  = VPU720_JPEGD_MAX_SIZE,
+			.step_width = MB_DIM,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = VPU720_JPEGD_MAX_SIZE,
+			.step_height = MB_DIM,
+		},
+	},
+	{
+		.fourcc    = V4L2_PIX_FMT_JPEG,
+		.codec_mode = HANTRO_MODE_JPEG_DEC,
+		.max_depth  = 2,
+		.frmsize   = {
+			.min_width  = FMT_MIN_WIDTH,
+			.max_width  = VPU720_JPEGD_MAX_SIZE,
+			.step_width = VPU720_JPEGD_STEP,
+			.min_height = FMT_MIN_HEIGHT,
+			.max_height = VPU720_JPEGD_MAX_SIZE,
+			.step_height = VPU720_JPEGD_STEP,
+		},
+	},
+};
+
+static const struct hantro_codec_ops rk3588_vpu720_codec_ops[] = {
+	[HANTRO_MODE_JPEG_DEC] = {
+		.run   = rockchip_vpu720_jpeg_dec_run,
+		.reset = rockchip_vpu720_reset,
+		.init  = rockchip_vpu720_jpeg_dec_init,
+		.exit  = rockchip_vpu720_jpeg_dec_exit,
+	},
+};
+
+static const struct hantro_irq rk3588_vpu720_irqs[] = {
+	{ "vdpu", rockchip_vpu720_irq },
+};
+
+static const char * const rk3588_vpu720_clk_names[] = {
+	"aclk", "hclk",
+};
+
+const struct hantro_variant rk3588_vpu720_variant = {
+	.dec_fmts     = rk3588_vpu720_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(rk3588_vpu720_dec_fmts),
+	.codec        = HANTRO_JPEG_DECODER,
+	.codec_ops    = rk3588_vpu720_codec_ops,
+	.irqs         = rk3588_vpu720_irqs,
+	.num_irqs     = ARRAY_SIZE(rk3588_vpu720_irqs),
+	.clk_names    = rk3588_vpu720_clk_names,
+	.num_clocks   = ARRAY_SIZE(rk3588_vpu720_clk_names),
+	.src_needs_kmap = 1,
+	.dst_needs_kmap = 1,
+};

-- 
2.47.3

