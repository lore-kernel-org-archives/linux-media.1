Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540114;
	b=uiFc2oWbeI1vqf+bCmD8NVAewgqRNjEajOrsmEYtsiaT04meNtkhUtet1bOe1suZ2UAw
	 qOFS/TBz7bfVnOvMA+evl1RzqThmm454/JTnyH/pEp90HPkQ/MkcWJueAbl1Yt098oz3d
	 Nh/z58m8Go3mWD3mZYHb9SeOGywOz3njMx7JNyqpMb/OM1g6u9PtBOYopglX0z8ISQonV
	 WR6YVhfDQdYKS/W0A4NIhnz/txmO5mbFvhAJQjGlc+mpuXRDboR2/UtdnUoWm400MwTDB
	 cc26RhtM/D7iW3Ikr9pIF66nlRvLg+Csx3ITKP3R3eFPwCEwAOhOD5y0Sx9rFEG67Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540114;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=bqCsxpb9AOjJ89DCD1+55gHWPpPBHcycrxGUtg+ct4o=;
	b=fo5hWXctWfI9XmkQR7F+CZzQVSZJ3D5jXR+n4uoMRbmmlGpDBXnntYAimuBkvVAvq7Rr
	 nKMwnLm6fXdkgZShR71AqLjlh872aYXaMxCv0I55zp+1NdRq4RwZ4jc/AoJA3zqPmapYo
	 YEmTnTHcyOuojDITMNXiJJYmHqmpDeoxv9iP7Dc6M67n3titDnhqPgYQrjZLdm/bIVYL6
	 nnpje7jAHaZxYBjguV86Zi9d1ykVOhyt4OHSlomrsQUW+6IHzVNl0xDBu9/LO+NcNd5j6
	 9EaNlxs95JZELTn3h8kiraS5WZ2L5Uv9frfe/MbPfVwxgCSLwDgwlwmrEBSsmGlSyHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="Ko/kYJz4";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31885606A326;
	Tue, 24 Nov 2026 17:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31885606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ko/kYJz4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A43351A32;
	Tue, 24 Nov 2026 09:08:30 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA0253F763;
	Tue, 24 Nov 2026 09:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540113; bh=FxpCbqCwEz6X/f+YstyH5HipzhY2VI3gDs2LYrz1Zg0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ko/kYJz4Ov3viqsFqmat3Ub4/Sc9QDUMOg8uwkFi/kdBx2guT/75K72upqF+766RP
	 LAUMLj1DCCUlh4p8nJ1XttdIVikdyjAjOUDy+uDMX4C9/bmuue4tFMc4+N/VD1jS34
	 tVEpStL9Pgt5Bf9a/2g2dK1iIxNN6VCjOcjrFwPQ=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:38 +0000
Subject: [PATCH 10/24] media: mali-c720: Add ISP and human vision
 subdevices
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
Message-Id: <20261124-b4-initial-upstream-candidate-v1-10-0cb9bde1bd30@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540078; l=25049;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=t6otEmx+UfFjeWyr3rxyizm8bh5H4F9fgUz8dHQBSUI=;
 b=M4EOPZqJlKO9LRJOkJjuAe3JgH1BYP3eufwmhFZ5xkRbxTK/fo5G13ar2Uxxm2SgfkCIymjkd
 6ZhtUiKx4eHAf5mtwO+i0pflNst66zHFAdC6+M3BQtZ9gxedVas+2QO
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=

From: Anthony McGivern <Anthony.McGivern@arm.com>

Add subdevices for the ISP input pipeline and human vision (HV)
pipeline. HV processes images intended for human viewing, while the
computer vision (CV) pipeline targets machine-processing applications.
This initial driver supports only the HV path.

Expose frame-start events for sensor control timing.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 .../platform/arm/mali-c720/mali-c720-common.h      |  38 ++
 .../platform/arm/mali-c720/mali-c720-interrupts.c  |   2 +
 .../media/platform/arm/mali-c720/mali-c720-isp.c   | 422 +++++++++++++++++++++
 .../platform/arm/mali-c720/mali-c720-vision-pipe.c | 260 +++++++++++++
 4 files changed, 722 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-common.h b/drivers/media/platform/arm/mali-c720/mali-c720-common.h
index 6f5ddb94398d76888edb992000a4d6012e960675..1037949d45e4eb8520254cd9addcbfce45def92d 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-common.h
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-common.h
@@ -69,6 +69,30 @@ struct mali_c720_input {
 	struct mali_c720_slot_input slot_input;
 };
 
+enum mali_c720_isp_pads {
+	MALI_C720_ISP_PAD_SINK_VIDEO,
+	MALI_C720_ISP_PAD_SOURCE_HV,
+	MALI_C720_ISP_NUM_PADS,
+};
+
+struct mali_c720_isp {
+	struct mali_c720_subdev mdev;
+	struct media_pad pads[MALI_C720_ISP_NUM_PADS];
+	struct media_pad *remote_src;
+	bool enabled;
+};
+
+enum mali_c720_vision_pipe_pads {
+	MALI_C720_VISION_PIPE_PAD_SINK_VIDEO,
+	MALI_C720_VISION_PIPE_PAD_SOURCE_RGB,
+	MALI_C720_VISION_PIPE_NUM_PADS,
+};
+
+struct mali_c720_vision_pipe {
+	struct mali_c720_subdev mdev;
+	struct media_pad pads[MALI_C720_VISION_PIPE_NUM_PADS];
+};
+
 enum mali_c720_cap_devs {
 	MALI_C720_CAP_DEV_FR0_RGB,
 	MALI_C720_CAP_DEV_FR0_YUV,
@@ -126,6 +150,8 @@ struct mali_c720 {
 	struct v4l2_device v4l2_dev;
 
 	struct mali_c720_input input;
+	struct mali_c720_isp isp;
+	struct mali_c720_vision_pipe vision_pipe;
 
 	struct mali_c720_registers registers;
 	u8 *default_regs;
@@ -145,8 +171,20 @@ struct mali_c720 {
 	spinlock_t irq_lock;
 };
 
+/* ISP subdevice registration functions */
+
 int mali_c720_register_input(struct mali_c720 *mali_c720);
 void mali_c720_unregister_input(struct mali_c720 *mali_c720);
 void mali_c720_cleanup_input(struct mali_c720 *mali_c720);
 
+int mali_c720_register_isp(struct mali_c720 *mali_c720);
+void mali_c720_unregister_isp(struct mali_c720 *mali_c720);
+void mali_c720_cleanup_isp(struct mali_c720 *mali_c720);
+
+int mali_c720_register_vision_pipe(struct mali_c720 *mali_c720);
+void mali_c720_unregister_vision_pipe(struct mali_c720 *mali_c720);
+void mali_c720_cleanup_vision_pipe(struct mali_c720 *mali_c720);
+
+void mali_c720_isp_queue_event_sof(struct mali_c720 *mali_c720, u32 sequence);
+
 #endif /* MALI_C720_COMMON_H */
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-interrupts.c b/drivers/media/platform/arm/mali-c720/mali-c720-interrupts.c
index 63589989478650f65c3cc06bee0a48a53b92b051..bd1e5189b276e59a33cda63f40ceffa3b7a2520c 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-interrupts.c
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-interrupts.c
@@ -156,6 +156,8 @@ static void mali_c720_handle_input_frame_start(struct mali_c720 *mali_c720,
 	entry->sequence = sequence;
 	entry->timestamp = timestamp;
 	entry->valid = true;
+
+	mali_c720_isp_queue_event_sof(mali_c720, sequence);
 }
 
 static void mali_c720_update_frame_timestamp(struct mali_c720_context *ctx)
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-isp.c b/drivers/media/platform/arm/mali-c720/mali-c720-isp.c
new file mode 100644
index 0000000000000000000000000000000000000000..962a2215543b49a6f90159fcb75ac253727cf2b6
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-isp.c
@@ -0,0 +1,422 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#include <linux/bitops.h>
+#include <linux/string.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-event.h>
+
+#include "mali-c720-common.h"
+
+static int mali_c720_isp_enum_mbus_code(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					struct v4l2_subdev_mbus_code_enum *code)
+{
+	const struct mali_c720_mbus_format_info *cfg;
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct mali_c720_mbus_format_match match;
+
+	/* HV uses the sink Bayer order at the internal 16-bit precision. */
+	if (code->pad == MALI_C720_ISP_PAD_SOURCE_HV) {
+		if (code->index)
+			return -EINVAL;
+
+		sink_fmt = v4l2_subdev_state_get_format(state, MALI_C720_ISP_PAD_SINK_VIDEO);
+		if (!sink_fmt)
+			return -EINVAL;
+
+		cfg = mali_c720_get_mbus_config_by_code(sink_fmt->code);
+		if (!cfg)
+			return -EINVAL;
+
+		cfg = mali_c720_shift_mbus_format(cfg, MALI_C720_FORMAT_16BIT);
+		if (!cfg)
+			return -EINVAL;
+
+		code->code = cfg->code;
+	} else if (code->pad == MALI_C720_ISP_PAD_SINK_VIDEO) {
+		match.type_mask = MALI_C720_FORMAT_BAYER;
+		match.depth_mask = MALI_C720_FORMAT_24BIT;
+
+		cfg = mali_c720_get_mbus_config_by_matched_index(code->index, &match);
+		if (!cfg)
+			return -EINVAL;
+
+		code->code = cfg->code;
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mali_c720_isp_enum_frame_size(struct v4l2_subdev *sd,
+					 struct v4l2_subdev_state *state,
+					 struct v4l2_subdev_frame_size_enum *fse)
+{
+	const struct mali_c720_mbus_format_info *cfg;
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct mali_c720_mbus_format_match match;
+
+	if (fse->index)
+		return -EINVAL;
+
+	switch (fse->pad) {
+	case MALI_C720_ISP_PAD_SOURCE_HV:
+		sink_fmt = v4l2_subdev_state_get_format(state, MALI_C720_ISP_PAD_SINK_VIDEO);
+		if (!sink_fmt)
+			return -EINVAL;
+
+		cfg = mali_c720_get_mbus_config_by_code(sink_fmt->code);
+		if (!cfg)
+			return -EINVAL;
+
+		cfg = mali_c720_shift_mbus_format(cfg, MALI_C720_FORMAT_16BIT);
+		if (!cfg || fse->code != cfg->code)
+			return -EINVAL;
+		break;
+	case MALI_C720_ISP_PAD_SINK_VIDEO:
+		match.type_mask = MALI_C720_FORMAT_BAYER;
+		match.depth_mask = MALI_C720_FORMAT_24BIT;
+
+		cfg = mali_c720_get_mbus_config_by_code(fse->code);
+		if (!cfg || !mali_c720_validate_mbus_format_match(cfg, &match))
+			return -EINVAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	fse->min_width = MALI_C720_MIN_INPUT_WIDTH;
+	fse->min_height = MALI_C720_MIN_INPUT_HEIGHT;
+	fse->max_width = MALI_C720_MAX_WIDTH;
+	fse->max_height = MALI_C720_MAX_HEIGHT;
+
+	return 0;
+}
+
+static int mali_c720_isp_set_fmt(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt = &format->format;
+	struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
+	const struct mali_c720_mbus_format_info *cfg;
+	struct mali_c720_mbus_format_match match;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    media_entity_is_streaming(&sd->entity))
+		return -EBUSY;
+
+	/* Only the video sink pad format can be changed. */
+	if (format->pad != MALI_C720_ISP_PAD_SINK_VIDEO)
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	sink_fmt = v4l2_subdev_state_get_format(state, MALI_C720_ISP_PAD_SINK_VIDEO);
+	if (!sink_fmt)
+		return -EINVAL;
+
+	match.type_mask = MALI_C720_FORMAT_BAYER;
+	match.depth_mask = MALI_C720_FORMAT_24BIT;
+
+	cfg = mali_c720_get_mbus_config_by_code(fmt->code);
+	if (!cfg || !mali_c720_validate_mbus_format_match(cfg, &match))
+		cfg = mali_c720_get_mbus_config_by_code(MEDIA_BUS_FMT_SRGGB24_1X24);
+
+	sink_fmt->code = cfg->code;
+
+	sink_fmt->width = fmt->width;
+	sink_fmt->height = fmt->height;
+	v4l_bound_align_image(&sink_fmt->width, MALI_C720_MIN_INPUT_WIDTH,
+			      MALI_C720_MAX_WIDTH, 2,
+			      &sink_fmt->height, MALI_C720_MIN_INPUT_HEIGHT,
+			      MALI_C720_MAX_HEIGHT, 2, 0);
+
+	*fmt = *sink_fmt;
+
+	/* Propagate the input size and Bayer order to the HV output. */
+	src_fmt = v4l2_subdev_state_get_format(state, MALI_C720_ISP_PAD_SOURCE_HV);
+	src_fmt->width = sink_fmt->width;
+	src_fmt->height = sink_fmt->height;
+	src_fmt->code = mali_c720_shift_mbus_format(cfg, MALI_C720_FORMAT_16BIT)->code;
+
+	return 0;
+}
+
+static void mali_c720_isp_stop(struct mali_c720 *mali_c720)
+{
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+
+	mali_c720_ctx_mgr_stop_context(ctx);
+}
+
+static int mali_c720_isp_start(struct mali_c720_isp *isp,
+			       struct v4l2_subdev_state *state)
+{
+	struct mali_c720 *mali_c720 = isp->mdev.mali_c720;
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+	const struct mali_c720_mbus_format_info *cfg;
+	const struct v4l2_mbus_framefmt *fmt;
+	struct mali_c720_top_cfg top_cfg;
+	struct media_pad *sink_pad;
+	struct v4l2_subdev *src_sd;
+	int ret;
+
+	fmt = v4l2_subdev_state_get_format(state, MALI_C720_ISP_PAD_SINK_VIDEO);
+	cfg = mali_c720_get_mbus_config_by_code(fmt->code);
+	if (!cfg)
+		return -EINVAL;
+
+	top_cfg.width = fmt->width;
+	top_cfg.height = fmt->height;
+	top_cfg.rggb_start = (u32)__ffs(cfg->type);
+
+	mali_c720_ctx_mgr_configure_context(ctx, &top_cfg);
+
+	sink_pad = &isp->pads[MALI_C720_ISP_PAD_SINK_VIDEO];
+	isp->remote_src = media_pad_remote_pad_unique(sink_pad);
+	ret = PTR_ERR_OR_ZERO(isp->remote_src);
+	if (ret)
+		return ret;
+
+	src_sd = media_entity_to_v4l2_subdev(isp->remote_src->entity);
+	ret = v4l2_subdev_enable_streams(src_sd, isp->remote_src->index, BIT(0));
+	if (ret && ret != -EALREADY) {
+		dev_err(mali_c720->dev, "Failed to start ISP source\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mali_c720_isp_enable_streams(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state, u32 pad,
+					u64 streams_mask)
+{
+	struct mali_c720_subdev *mdev = v4l2_sd_to_mali_c720_sd(sd);
+	struct mali_c720_isp *isp = mali_c720_sd_to_sd(mdev, struct mali_c720_isp);
+	int ret;
+
+	/* Enable the stream but only start the ISP once. */
+	if (isp->enabled)
+		return 0;
+
+	ret = mali_c720_isp_start(isp, state);
+	if (ret)
+		return ret;
+
+	isp->enabled = true;
+
+	return 0;
+}
+
+static int mali_c720_isp_disable_streams(struct v4l2_subdev *sd,
+					 struct v4l2_subdev_state *state, u32 pad,
+					 u64 streams_mask)
+{
+	struct mali_c720_subdev *mdev = v4l2_sd_to_mali_c720_sd(sd);
+	struct mali_c720_isp *isp = mali_c720_sd_to_sd(mdev, struct mali_c720_isp);
+	struct mali_c720 *mali_c720 = mdev->mali_c720;
+	struct v4l2_subdev *src_sd;
+
+	if (!isp->enabled)
+		return 0;
+
+	mali_c720_isp_stop(mali_c720);
+
+	if (isp->remote_src) {
+		src_sd = media_entity_to_v4l2_subdev(isp->remote_src->entity);
+		v4l2_subdev_disable_streams(src_sd, isp->remote_src->index,
+					    BIT(0));
+	}
+	isp->remote_src = NULL;
+	isp->enabled = false;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops mali_c720_isp_pad_ops = {
+	.enum_mbus_code		= mali_c720_isp_enum_mbus_code,
+	.enum_frame_size	= mali_c720_isp_enum_frame_size,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= mali_c720_isp_set_fmt,
+	.link_validate		= v4l2_subdev_link_validate_default,
+	.enable_streams		= mali_c720_isp_enable_streams,
+	.disable_streams	= mali_c720_isp_disable_streams,
+};
+
+void mali_c720_isp_queue_event_sof(struct mali_c720 *mali_c720, u32 sequence)
+{
+	struct mali_c720_isp *isp = &mali_c720->isp;
+	struct mali_c720_subdev *mdev = &isp->mdev;
+
+	struct v4l2_event event = {
+		.type = V4L2_EVENT_FRAME_SYNC,
+	};
+
+	event.u.frame_sync.frame_sequence = sequence;
+	v4l2_event_queue(mdev->sd.devnode, &event);
+}
+
+static int
+mali_c720_isp_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
+			      struct v4l2_event_subscription *sub)
+{
+	if (sub->type != V4L2_EVENT_FRAME_SYNC)
+		return -EINVAL;
+
+	/* V4L2_EVENT_FRAME_SYNC doesn't require an id, so zero should be set */
+	if (sub->id != 0)
+		return -EINVAL;
+
+	return v4l2_event_subscribe(fh, sub, 0, NULL);
+}
+
+static const struct v4l2_subdev_core_ops mali_c720_isp_core_ops = {
+	.subscribe_event = mali_c720_isp_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_ops mali_c720_isp_ops = {
+	.pad	= &mali_c720_isp_pad_ops,
+	.core	= &mali_c720_isp_core_ops,
+};
+
+static int mali_c720_isp_init_state(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+
+	sink_fmt = v4l2_subdev_state_get_format(state, MALI_C720_ISP_PAD_SINK_VIDEO);
+	sink_fmt->width = MALI_C720_DEFAULT_WIDTH;
+	sink_fmt->height = MALI_C720_DEFAULT_HEIGHT;
+	sink_fmt->field = V4L2_FIELD_NONE;
+	sink_fmt->code = MEDIA_BUS_FMT_SRGGB24_1X24;
+	sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
+	sink_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colorspace);
+	sink_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colorspace);
+	sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+
+	src_fmt = v4l2_subdev_state_get_format(state, MALI_C720_ISP_PAD_SOURCE_HV);
+	*src_fmt = *sink_fmt;
+	src_fmt->code = MEDIA_BUS_FMT_SRGGB16_1X16;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops mali_c720_isp_internal_ops = {
+	.init_state = mali_c720_isp_init_state,
+};
+
+static int mali_c720_isp_subdev_link_setup(struct media_entity *entity,
+					   const struct media_pad *local,
+					   const struct media_pad *remote,
+					   u32 flags)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct mali_c720 *mali_c720 = v4l2_sd_to_mali_c720_sd(sd)->mali_c720;
+	struct media_pad *remote_src;
+
+	if (local->index != MALI_C720_ISP_PAD_SINK_VIDEO)
+		return 0;
+
+	if (flags & MEDIA_LNK_FL_ENABLED) {
+		remote_src = media_pad_remote_pad_unique(local);
+
+		/* No previous link connected */
+		if (IS_ERR(remote_src))
+			return 0;
+
+		if (remote_src != remote) {
+			dev_err(mali_c720->dev,
+				"ISP sink pad %u is already connected to another source\n",
+				local->index);
+			return -EBUSY;
+		}
+	}
+
+	return 0;
+}
+
+static const struct media_entity_operations mali_c720_isp_media_ops = {
+	.link_setup		= mali_c720_isp_subdev_link_setup,
+	.link_validate		= v4l2_subdev_link_validate,
+};
+
+int mali_c720_register_isp(struct mali_c720 *mali_c720)
+{
+	struct mali_c720_isp *isp = &mali_c720->isp;
+	struct mali_c720_subdev *mdev = &isp->mdev;
+	struct v4l2_subdev *sd = &mdev->sd;
+	int ret;
+
+	mdev->mali_c720 = mali_c720;
+
+	v4l2_subdev_init(sd, &mali_c720_isp_ops);
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+		     V4L2_SUBDEV_FL_HAS_EVENTS;
+	sd->entity.ops = &mali_c720_isp_media_ops;
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
+	sd->internal_ops = &mali_c720_isp_internal_ops;
+	strscpy(sd->name, "mali-c720 isp", sizeof(sd->name));
+
+	isp->pads[MALI_C720_ISP_PAD_SINK_VIDEO].flags = MEDIA_PAD_FL_SINK |
+							MEDIA_PAD_FL_MUST_CONNECT;
+	isp->pads[MALI_C720_ISP_PAD_SOURCE_HV].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity,
+				     MALI_C720_ISP_NUM_PADS,
+				     isp->pads);
+	if (ret)
+		goto err_clear_parent;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_cleanup_media_entity;
+
+	ret = v4l2_device_register_subdev(&mali_c720->v4l2_dev, sd);
+	if (ret)
+		goto err_cleanup_subdev;
+
+	return 0;
+
+err_cleanup_subdev:
+	v4l2_subdev_cleanup(sd);
+err_cleanup_media_entity:
+	media_entity_cleanup(&sd->entity);
+err_clear_parent:
+	mdev->mali_c720 = NULL;
+
+	return ret;
+}
+
+void mali_c720_unregister_isp(struct mali_c720 *mali_c720)
+{
+	struct mali_c720_isp *isp = &mali_c720->isp;
+	struct mali_c720_subdev *mdev = &isp->mdev;
+
+	if (!mdev->mali_c720)
+		return;
+
+	v4l2_device_unregister_subdev(&mdev->sd);
+}
+
+void mali_c720_cleanup_isp(struct mali_c720 *mali_c720)
+{
+	struct mali_c720_isp *isp = &mali_c720->isp;
+	struct mali_c720_subdev *mdev = &isp->mdev;
+
+	if (!mdev->mali_c720)
+		return;
+
+	v4l2_subdev_cleanup(&mdev->sd);
+	media_entity_cleanup(&mdev->sd.entity);
+	mdev->mali_c720 = NULL;
+}
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-vision-pipe.c b/drivers/media/platform/arm/mali-c720/mali-c720-vision-pipe.c
new file mode 100644
index 0000000000000000000000000000000000000000..1a0ff0486dca1637fc3112009894e719312cfc82
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-vision-pipe.c
@@ -0,0 +1,260 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#include <linux/string.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-common.h>
+
+#include "mali-c720-common.h"
+
+static int mali_c720_vision_pipe_enum_mbus_code(struct v4l2_subdev *sd,
+						struct v4l2_subdev_state *state,
+						struct v4l2_subdev_mbus_code_enum *code)
+{
+	const struct mali_c720_mbus_format_info *cfg;
+	struct mali_c720_mbus_format_match match;
+
+	switch (code->pad) {
+	case MALI_C720_VISION_PIPE_PAD_SOURCE_RGB:
+		if (code->index)
+			return -EINVAL;
+		code->code = MEDIA_BUS_FMT_RGB121212_1X36;
+		break;
+	case MALI_C720_VISION_PIPE_PAD_SINK_VIDEO:
+		match.type_mask = MALI_C720_FORMAT_BAYER;
+		match.depth_mask = MALI_C720_FORMAT_16BIT;
+
+		cfg = mali_c720_get_mbus_config_by_matched_index(code->index, &match);
+		if (!cfg)
+			return -EINVAL;
+		code->code = cfg->code;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mali_c720_vision_pipe_enum_frame_size(struct v4l2_subdev *sd,
+						 struct v4l2_subdev_state *state,
+						 struct v4l2_subdev_frame_size_enum *fse)
+{
+	const struct mali_c720_mbus_format_info *cfg;
+	struct mali_c720_mbus_format_match match;
+
+	if (fse->index)
+		return -EINVAL;
+
+	switch (fse->pad) {
+	case MALI_C720_VISION_PIPE_PAD_SOURCE_RGB:
+		if (fse->code != MEDIA_BUS_FMT_RGB121212_1X36)
+			return -EINVAL;
+		break;
+	case MALI_C720_VISION_PIPE_PAD_SINK_VIDEO:
+		match.type_mask = MALI_C720_FORMAT_BAYER;
+		match.depth_mask = MALI_C720_FORMAT_16BIT;
+
+		cfg = mali_c720_get_mbus_config_by_code(fse->code);
+		if (!cfg || !mali_c720_validate_mbus_format_match(cfg, &match))
+			return -EINVAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	fse->min_width = MALI_C720_MIN_INPUT_WIDTH;
+	fse->min_height = MALI_C720_MIN_INPUT_HEIGHT;
+	fse->max_width = MALI_C720_MAX_WIDTH;
+	fse->max_height = MALI_C720_MAX_HEIGHT;
+
+	return 0;
+}
+
+static int mali_c720_vision_pipe_set_fmt(struct v4l2_subdev *sd,
+					 const struct v4l2_subdev_client_info *ci,
+					 struct v4l2_subdev_state *state,
+					 struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt = &format->format;
+	struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
+	const struct mali_c720_mbus_format_info *cfg;
+	struct mali_c720_mbus_format_match match;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    media_entity_is_streaming(&sd->entity))
+		return -EBUSY;
+
+	/*
+	 * Disallow set_fmt on the source pad; size is derived from the sink
+	 * pad, while the RGB source format is fixed.
+	 */
+	if (format->pad != MALI_C720_VISION_PIPE_PAD_SINK_VIDEO)
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	sink_fmt = v4l2_subdev_state_get_format(state, MALI_C720_VISION_PIPE_PAD_SINK_VIDEO);
+
+	match.type_mask = MALI_C720_FORMAT_BAYER;
+	match.depth_mask = MALI_C720_FORMAT_16BIT;
+
+	cfg = mali_c720_get_mbus_config_by_code(fmt->code);
+	if (!cfg || !mali_c720_validate_mbus_format_match(cfg, &match))
+		cfg = mali_c720_get_mbus_config_by_code(MEDIA_BUS_FMT_SRGGB16_1X16);
+
+	sink_fmt->code = cfg->code;
+
+	sink_fmt->width = fmt->width;
+	sink_fmt->height = fmt->height;
+	v4l_bound_align_image(&sink_fmt->width, MALI_C720_MIN_INPUT_WIDTH,
+			      MALI_C720_MAX_WIDTH, 1,
+			      &sink_fmt->height, MALI_C720_MIN_INPUT_HEIGHT,
+			      MALI_C720_MAX_HEIGHT, 1, 0);
+
+	*fmt = *sink_fmt;
+
+	/* Propagate the input dimensions to the RGB output. */
+	src_fmt = v4l2_subdev_state_get_format(state,
+					       MALI_C720_VISION_PIPE_PAD_SOURCE_RGB);
+	src_fmt->width = sink_fmt->width;
+	src_fmt->height = sink_fmt->height;
+
+	return 0;
+}
+
+static int mali_c720_vision_pipe_enable_streams(struct v4l2_subdev *sd,
+						struct v4l2_subdev_state *state,
+						u32 pad, u64 streams_mask)
+{
+	return 0;
+}
+
+static int mali_c720_vision_pipe_disable_streams(struct v4l2_subdev *sd,
+						 struct v4l2_subdev_state *state,
+						 u32 pad, u64 streams_mask)
+{
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops mali_c720_vision_pipe_pad_ops = {
+	.enum_mbus_code		= mali_c720_vision_pipe_enum_mbus_code,
+	.enum_frame_size	= mali_c720_vision_pipe_enum_frame_size,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= mali_c720_vision_pipe_set_fmt,
+	.link_validate		= v4l2_subdev_link_validate_default,
+	.enable_streams		= mali_c720_vision_pipe_enable_streams,
+	.disable_streams	= mali_c720_vision_pipe_disable_streams,
+};
+
+static const struct v4l2_subdev_ops mali_c720_vision_pipe_ops = {
+	.pad = &mali_c720_vision_pipe_pad_ops,
+};
+
+static int mali_c720_vision_pipe_init_state(struct v4l2_subdev *sd,
+					    struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+
+	sink_fmt = v4l2_subdev_state_get_format(state, MALI_C720_VISION_PIPE_PAD_SINK_VIDEO);
+	sink_fmt->width = MALI_C720_DEFAULT_WIDTH;
+	sink_fmt->height = MALI_C720_DEFAULT_HEIGHT;
+	sink_fmt->field = V4L2_FIELD_NONE;
+	sink_fmt->code = MEDIA_BUS_FMT_SRGGB16_1X16;
+	sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
+	sink_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colorspace);
+	sink_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colorspace);
+	sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+
+	src_fmt = v4l2_subdev_state_get_format(state, MALI_C720_VISION_PIPE_PAD_SOURCE_RGB);
+	*src_fmt = *sink_fmt;
+	src_fmt->code = MEDIA_BUS_FMT_RGB121212_1X36;
+	src_fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	src_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(src_fmt->colorspace);
+	src_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(src_fmt->colorspace);
+	src_fmt->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(true, src_fmt->colorspace,
+					      src_fmt->ycbcr_enc);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops mali_c720_vision_pipe_internal_ops = {
+	.init_state = mali_c720_vision_pipe_init_state,
+};
+
+static const struct media_entity_operations mali_c720_vision_pipe_media_ops = {
+	.link_validate		= v4l2_subdev_link_validate,
+};
+
+int mali_c720_register_vision_pipe(struct mali_c720 *mali_c720)
+{
+	struct mali_c720_vision_pipe *pipe = &mali_c720->vision_pipe;
+	struct mali_c720_subdev *mdev = &pipe->mdev;
+	struct v4l2_subdev *sd = &mdev->sd;
+	int ret;
+
+	mdev->mali_c720 = mali_c720;
+
+	v4l2_subdev_init(sd, &mali_c720_vision_pipe_ops);
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->entity.ops = &mali_c720_vision_pipe_media_ops;
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
+	sd->internal_ops = &mali_c720_vision_pipe_internal_ops;
+	strscpy(sd->name, "mali-c720 hv pipe", sizeof(sd->name));
+
+	pipe->pads[MALI_C720_VISION_PIPE_PAD_SINK_VIDEO].flags = MEDIA_PAD_FL_SINK |
+								 MEDIA_PAD_FL_MUST_CONNECT;
+	pipe->pads[MALI_C720_VISION_PIPE_PAD_SOURCE_RGB].flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&sd->entity,
+				     MALI_C720_VISION_PIPE_NUM_PADS,
+				     pipe->pads);
+	if (ret)
+		goto err_clear_parent;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_cleanup_media_entity;
+
+	ret = v4l2_device_register_subdev(&mali_c720->v4l2_dev, sd);
+	if (ret)
+		goto err_cleanup_subdev;
+
+	return 0;
+
+err_cleanup_subdev:
+	v4l2_subdev_cleanup(sd);
+err_cleanup_media_entity:
+	media_entity_cleanup(&sd->entity);
+err_clear_parent:
+	mdev->mali_c720 = NULL;
+
+	return ret;
+}
+
+void mali_c720_unregister_vision_pipe(struct mali_c720 *mali_c720)
+{
+	struct mali_c720_vision_pipe *pipe = &mali_c720->vision_pipe;
+	struct mali_c720_subdev *mdev = &pipe->mdev;
+
+	if (!mdev->mali_c720)
+		return;
+
+	v4l2_device_unregister_subdev(&mdev->sd);
+}
+
+void mali_c720_cleanup_vision_pipe(struct mali_c720 *mali_c720)
+{
+	struct mali_c720_vision_pipe *pipe = &mali_c720->vision_pipe;
+	struct mali_c720_subdev *mdev = &pipe->mdev;
+
+	if (!mdev->mali_c720)
+		return;
+
+	v4l2_subdev_cleanup(&mdev->sd);
+	media_entity_cleanup(&mdev->sd.entity);
+	mdev->mali_c720 = NULL;
+}

-- 
2.55.0

