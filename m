Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540111;
	b=oMMT6B+p0uuVJhdJOnWUDkT76r/y2a98Ia32byT/r0Xo+LsWlaFuQ2GLzPLduYdGyo5q
	 dPA8pVniSUBi7Nu1BHltuyYHXsolUoSBT4U2JikcQubO5yCk1pbim/pqL6utdAkBAmFiV
	 G+mlVMomfoUwhj+pDxU7+8VYFXAUm9PSGrDok1x4T414U6n9GX54dxhTM7Rotf0Kcgun8
	 c+ce/cmYle4B24jx+pRlwZvAZAAxRTIJ0/rdZK1ma4OdJ8wOeRKqNZJkdnuS+kTM3QPZv
	 78cZ13ZsgIcBC+sBd6VgGiMWMjzDs2dDbuTdPtO5tVnypYoV2V8J78ho7pgjeAOyktQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540111;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=tB8UPYpS0AWq6MASaQ/UDNOpnZlTX7ZWOg26TuC2bgc=;
	b=H8oGFepoN06hQPc9cKhfVdSriKyfz1qZ6Gqj17eC/VX8pbC4W8daKBJ8eO5du7XbtqsH
	 ZQmJuqZ14ryQy0PabXdS9uvxOGC6AearH37hSro131yG3M9ePETiwqSjOj9x9w6mBj7On
	 Bo4QefAht0tGZiGjtqNQRAG/SveXy2P/ZVlIJ8pHienjsrPysRwur9fZBX6U1osG7TRiK
	 NF81gWML6bCtOd4RxOU5VN3nJTP5mFJNWAwxLWPWdGMwT/xMjZVSnoFtu0fbcHba2vF6G
	 AAzADCejEqQMEnnaONP0uo0LDQScZlmfuhthOD6sFaXbpO9FBjcfvia95lKdKz0GROA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BDeNVquq;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB20606A321;
	Tue, 24 Nov 2026 17:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FB20606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BDeNVquq
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 970301A25;
	Tue, 24 Nov 2026 09:08:27 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC2253F763;
	Tue, 24 Nov 2026 09:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540110; bh=xVhbJmebUJi6iYSaq8O3fQYpqLCc16D+JXU1pZO1BJk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BDeNVquqt/GsZhF6pFw/hAp8GJnL+zoGhKxQS0jaSLMyt5qyC9WEU2GC4OwzKexpU
	 3EvRH6pn/TD6RKV2lBqVKp9TbDEb31p6Mxnt1q4KxWOJu6kbsWcJyXSjjTVMwdtfPc
	 wWV7w28PBVRYHzKArCu8dmg0idBx+f8fTkBNo5Jw=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:37 +0000
Subject: [PATCH 09/24] media: mali-c720: Add input frontend subdevice
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
Message-Id: <20261124-b4-initial-upstream-candidate-v1-9-0cb9bde1bd30@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540078; l=20950;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=OpXQ+M7qczFeC9Zk+oPv17BstGe5WlsvgrYAoceVU5Q=;
 b=jjttJ5N3DGhtxuc0yQfLsgnDxWMz13suDv4Rf/52702aKD68EKyOTZQfoTd2RgWhzKObClP31
 EKKHC8yLFWnBDnfJGQIsntj3UZvXhi8uJkpdmXDtqS1bg6D7X7IpSiJ
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=

From: Anthony McGivern <Anthony.McGivern@arm.com>

Add the subdevice connecting parallel input port 0 to a single context
input through a fixed route. Support for the remaining inputs is planned
when userspace routing ioctls are enabled.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 .../platform/arm/mali-c720/mali-c720-common.h      |  49 ++
 .../media/platform/arm/mali-c720/mali-c720-input.c | 598 +++++++++++++++++++++
 2 files changed, 647 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-common.h b/drivers/media/platform/arm/mali-c720/mali-c720-common.h
index 1808fdef149f8035394af122b348232be1ff51dd..6f5ddb94398d76888edb992000a4d6012e960675 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-common.h
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-common.h
@@ -15,6 +15,9 @@
 #include <linux/spinlock.h>
 #include <linux/videodev2.h>
 
+#include <media/v4l2-device.h>
+#include <media/v4l2-subdev.h>
+
 #include "mali-c720-ctx-mgr.h"
 #include "mali-c720-discovery.h"
 #include "mali-c720-formats.h"
@@ -26,8 +29,46 @@
 #include "mali-c720-registers-ctx-mgr.h"
 #include "mali-c720-registers-modules.h"
 
+#define MALI_C720_MIN_INPUT_WIDTH	256
+#define MALI_C720_MIN_INPUT_HEIGHT	256
+#define MALI_C720_MAX_WIDTH		8192
+#define MALI_C720_MAX_HEIGHT		4608
+#define MALI_C720_DEFAULT_WIDTH		1920
+#define MALI_C720_DEFAULT_HEIGHT	1080
+
 #define MALI_C720_FRAME_TIMESTAMP_COUNT	256
 
+struct mali_c720_subdev {
+	struct v4l2_subdev sd;
+	struct mali_c720 *mali_c720;
+};
+
+#define v4l2_sd_to_mali_c720_sd(_sd) \
+	container_of(_sd, struct mali_c720_subdev, sd)
+
+#define mali_c720_sd_to_sd(_mdev, type) \
+	container_of(_mdev, type, mdev)
+
+enum mali_c720_input_pads {
+	MALI_C720_INPUT_PAD_SOURCE_SLOT_INPUT,
+	MALI_C720_INPUT_PAD_SINK_INPUT0,
+	MALI_C720_INPUT_NUM_PADS,
+};
+
+struct mali_c720_slot_input {
+	struct mali_c720_buffer_pool raw_buffer_desc;
+	struct media_pad *sink_pad;
+	struct media_pad *src_pad;
+	u32 stream;
+	bool prepared;
+};
+
+struct mali_c720_input {
+	struct mali_c720_subdev mdev;
+	struct media_pad pads[MALI_C720_INPUT_NUM_PADS];
+	struct mali_c720_slot_input slot_input;
+};
+
 enum mali_c720_cap_devs {
 	MALI_C720_CAP_DEV_FR0_RGB,
 	MALI_C720_CAP_DEV_FR0_YUV,
@@ -82,6 +123,10 @@ struct mali_c720 {
 	resource_size_t mmio_size;
 	u32 top_base;
 
+	struct v4l2_device v4l2_dev;
+
+	struct mali_c720_input input;
+
 	struct mali_c720_registers registers;
 	u8 *default_regs;
 
@@ -100,4 +145,8 @@ struct mali_c720 {
 	spinlock_t irq_lock;
 };
 
+int mali_c720_register_input(struct mali_c720 *mali_c720);
+void mali_c720_unregister_input(struct mali_c720 *mali_c720);
+void mali_c720_cleanup_input(struct mali_c720 *mali_c720);
+
 #endif /* MALI_C720_COMMON_H */
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-input.c b/drivers/media/platform/arm/mali-c720/mali-c720-input.c
new file mode 100644
index 0000000000000000000000000000000000000000..b0b92e456d9b2b386c7d2c4473cb3ccdb4b819a9
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-input.c
@@ -0,0 +1,598 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#include <linux/bitops.h>
+#include <linux/dma-mapping.h>
+#include <linux/minmax.h>
+#include <linux/string.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-common.h>
+
+#include "mali-c720-common.h"
+
+/*
+ * Return the active route for the provided sink pad and stream, or NULL if
+ * there is none.
+ */
+static struct v4l2_subdev_route *
+mali_c720_input_get_active_route(struct v4l2_subdev_state *state,
+				 u32 sink_pad, u32 sink_stream)
+{
+	struct v4l2_subdev_krouting *routing = &state->routing;
+	struct v4l2_subdev_route *route;
+
+	for_each_active_route(routing, route) {
+		if (route->sink_pad == sink_pad &&
+		    route->sink_stream == sink_stream)
+			return route;
+	}
+
+	return NULL;
+}
+
+static int mali_c720_input_enum_mbus_code(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *state,
+					  struct v4l2_subdev_mbus_code_enum *code)
+{
+	const struct mali_c720_mbus_format_info *cfg;
+	struct mali_c720_mbus_format_match match;
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_subdev_route *route;
+	bool found = false;
+
+	/*
+	 * Sink pads support all bayer formats.
+	 * The source format is propagated from the sink pad, shifted to 24-bit.
+	 */
+	if (code->pad != MALI_C720_INPUT_PAD_SOURCE_SLOT_INPUT) {
+		match.type_mask = MALI_C720_FORMAT_BAYER;
+		match.depth_mask = MALI_C720_FORMAT_8BIT | MALI_C720_FORMAT_10BIT |
+				   MALI_C720_FORMAT_12BIT | MALI_C720_FORMAT_14BIT |
+				   MALI_C720_FORMAT_16BIT | MALI_C720_FORMAT_20BIT |
+				   MALI_C720_FORMAT_24BIT;
+
+		cfg = mali_c720_get_mbus_config_by_matched_index(code->index, &match);
+		if (!cfg)
+			return -EINVAL;
+
+		code->code = cfg->code;
+
+		return 0;
+	}
+
+	if (code->index)
+		return -EINVAL;
+
+	/*
+	 * All routes from a source pad use the same format, so the first active
+	 * route represents the source format.
+	 */
+	for_each_active_route(&state->routing, route) {
+		if (route->source_pad == code->pad) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found)
+		return -EINVAL;
+
+	sink_fmt = v4l2_subdev_state_get_format(state,
+						route->sink_pad,
+						route->sink_stream);
+	if (!sink_fmt)
+		return -EINVAL;
+
+	cfg = mali_c720_get_mbus_config_by_code(sink_fmt->code);
+	if (!cfg)
+		return -EINVAL;
+
+	cfg = mali_c720_shift_mbus_format(cfg, MALI_C720_FORMAT_24BIT);
+	if (!cfg)
+		return -EINVAL;
+
+	code->code = cfg->code;
+
+	return 0;
+}
+
+static int mali_c720_input_enum_frame_size(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *state,
+					   struct v4l2_subdev_frame_size_enum *fse)
+{
+	const struct mali_c720_mbus_format_info *cfg;
+	struct mali_c720_mbus_format_match match;
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_subdev_route *route;
+	bool found = false;
+
+	if (fse->index)
+		return -EINVAL;
+
+	if (fse->pad != MALI_C720_INPUT_PAD_SOURCE_SLOT_INPUT) {
+		match.type_mask = MALI_C720_FORMAT_BAYER;
+		match.depth_mask = MALI_C720_FORMAT_8BIT | MALI_C720_FORMAT_10BIT |
+				   MALI_C720_FORMAT_12BIT | MALI_C720_FORMAT_14BIT |
+				   MALI_C720_FORMAT_16BIT | MALI_C720_FORMAT_20BIT |
+				   MALI_C720_FORMAT_24BIT;
+
+		cfg = mali_c720_get_mbus_config_by_code(fse->code);
+		if (!cfg || !mali_c720_validate_mbus_format_match(cfg, &match))
+			return -EINVAL;
+
+		fse->min_width = MALI_C720_MIN_INPUT_WIDTH;
+		fse->min_height = MALI_C720_MIN_INPUT_HEIGHT;
+		fse->max_width = MALI_C720_MAX_WIDTH;
+		fse->max_height = MALI_C720_MAX_HEIGHT;
+
+		return 0;
+	}
+
+	for_each_active_route(&state->routing, route) {
+		if (route->source_pad == fse->pad) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found)
+		return -EINVAL;
+
+	sink_fmt = v4l2_subdev_state_get_format(state,
+						route->sink_pad,
+						route->sink_stream);
+	if (!sink_fmt)
+		return -EINVAL;
+
+	cfg = mali_c720_get_mbus_config_by_code(sink_fmt->code);
+	if (!cfg)
+		return -EINVAL;
+
+	cfg = mali_c720_shift_mbus_format(cfg, MALI_C720_FORMAT_24BIT);
+	if (!cfg || fse->code != cfg->code)
+		return -EINVAL;
+
+	fse->min_width = MALI_C720_MIN_INPUT_WIDTH;
+	fse->min_height = MALI_C720_MIN_INPUT_HEIGHT;
+	fse->max_width = MALI_C720_MAX_WIDTH;
+	fse->max_height = MALI_C720_MAX_HEIGHT;
+
+	return 0;
+}
+
+static int mali_c720_input_set_fmt(struct v4l2_subdev *sd,
+				   const struct v4l2_subdev_client_info *ci,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt = &format->format;
+	struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
+	const struct mali_c720_mbus_format_info *cfg;
+	struct mali_c720_mbus_format_match match;
+	struct v4l2_subdev_route *active_route;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    media_entity_is_streaming(&sd->entity))
+		return -EBUSY;
+
+	/*
+	 * Disallow set_fmt on the source pad; format is derived from the
+	 * sink pad format.
+	 */
+	if (format->pad == MALI_C720_INPUT_PAD_SOURCE_SLOT_INPUT)
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	sink_fmt = v4l2_subdev_state_get_format(state,
+						format->pad,
+						format->stream);
+	if (!sink_fmt)
+		return -EINVAL;
+
+	match.type_mask = MALI_C720_FORMAT_BAYER;
+	match.depth_mask = MALI_C720_FORMAT_8BIT | MALI_C720_FORMAT_10BIT |
+			   MALI_C720_FORMAT_12BIT | MALI_C720_FORMAT_14BIT |
+			   MALI_C720_FORMAT_16BIT | MALI_C720_FORMAT_20BIT |
+			   MALI_C720_FORMAT_24BIT;
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
+	/* The sink format should be propagated to the source pad
+	 * if there is an active route between them.
+	 * The data is shifted to 24-bits.
+	 */
+
+	active_route = mali_c720_input_get_active_route(state,
+							format->pad,
+							format->stream);
+	if (!active_route)
+		return 0;
+
+	src_fmt = v4l2_subdev_state_get_format(state, active_route->source_pad);
+	src_fmt->code = mali_c720_shift_mbus_format(cfg, MALI_C720_FORMAT_24BIT)->code;
+	src_fmt->width = sink_fmt->width;
+	src_fmt->height = sink_fmt->height;
+
+	return 0;
+}
+
+static void mali_c720_free_input_ports(struct mali_c720_input *input)
+{
+	struct mali_c720 *mali_c720 = input->mdev.mali_c720;
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+	struct mali_c720_slot_input *slot_input = &input->slot_input;
+	struct mali_c720_buffer_pool *pool = &slot_input->raw_buffer_desc;
+	unsigned int i;
+
+	if (slot_input->prepared) {
+		mali_c720_ctx_mgr_release_buffer_pool(ctx, pool);
+
+		for (i = 0; i < pool->num_buffers; i++) {
+			dma_free_coherent(mali_c720->dev,
+					  pool->buffer_size,
+					  pool->mem[i].base,
+					  pool->mem[i].addr);
+		}
+	}
+
+	slot_input->prepared = false;
+	slot_input->sink_pad = NULL;
+	slot_input->src_pad = NULL;
+	slot_input->stream = 0;
+}
+
+static int mali_c720_prepare_input_port(struct mali_c720_input *input,
+					struct v4l2_subdev_state *state,
+					struct mali_c720_slot_input *slot_input,
+					struct mali_c720_input_cfg *input_cfg)
+{
+	struct mali_c720 *mali_c720 = input->mdev.mali_c720;
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+	struct mali_c720_buffer_pool *pool = &slot_input->raw_buffer_desc;
+	const struct v4l2_mbus_framefmt *fmt;
+	const struct mali_c720_mbus_format_info *cfg;
+	struct mali_c720_buffer_request_info info;
+	u32 pad = slot_input->sink_pad->index;
+	u32 stream = slot_input->stream;
+	unsigned int i;
+	int ret;
+
+	fmt = v4l2_subdev_state_get_format(state, pad, stream);
+	if (!fmt) {
+		dev_err(mali_c720->dev,
+			"Failed to get format for pad %u stream %u\n",
+			pad, stream);
+		return -EINVAL;
+	}
+
+	cfg = mali_c720_get_mbus_config_by_code(fmt->code);
+	if (!cfg) {
+		dev_err(mali_c720->dev,
+			"Failed to get mbus config for pad %u stream %u\n",
+			pad, stream);
+		return -EINVAL;
+	}
+
+	memset(&info, 0, sizeof(info));
+	info.type = MALI_C720_BUF_TYPE_RAW;
+	info.sub_type = MALI_C720_RAW_BUF_SUBTYPE_NORMAL;
+	info.width = fmt->width;
+	info.height = fmt->height;
+	info.line_offset[0] = ALIGN((fmt->width * cfg->bit_depth) / 8, 32);
+	info.plane_size[0] = info.line_offset[0] * info.height;
+	info.num_raw_buffers = 2;
+	info.buffer_cfg = cfg->buffer_cfg;
+
+	ret = mali_c720_ctx_mgr_request_buffer_pool(ctx, &info, pool);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < pool->num_buffers; i++) {
+		pool->mem[i].base = dma_alloc_coherent(mali_c720->dev,
+						       pool->buffer_size,
+						       &pool->mem[i].addr,
+						       GFP_KERNEL);
+		if (!pool->mem[i].base) {
+			ret = -ENOMEM;
+			goto release_buf_pool;
+		}
+
+		mali_c720_ctx_mgr_update_buffer(ctx, pool, &pool->mem[i].addr, i);
+	}
+
+	input_cfg->id = 0;
+	input_cfg->bit_depth = cfg->bit_depth;
+	input_cfg->pool_id = pool->pool_id;
+
+	return 0;
+
+release_buf_pool:
+	mali_c720_ctx_mgr_release_buffer_pool(ctx, pool);
+
+	while (i--) {
+		dma_free_coherent(mali_c720->dev,
+				  pool->buffer_size,
+				  pool->mem[i].base,
+				  pool->mem[i].addr);
+	}
+
+	return ret;
+}
+
+static void mali_c720_stop_inputs(struct mali_c720_slot_input *slot_input)
+{
+	struct v4l2_subdev *src_sd = media_entity_to_v4l2_subdev(slot_input->src_pad->entity);
+
+	v4l2_subdev_disable_streams(src_sd, slot_input->src_pad->index,
+				    BIT(slot_input->stream));
+}
+
+static int mali_c720_input_enable_streams(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *state, u32 pad,
+					  u64 streams_mask)
+{
+	struct mali_c720_subdev *mdev = v4l2_sd_to_mali_c720_sd(sd);
+	struct mali_c720 *mali_c720 = mdev->mali_c720;
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+	struct mali_c720_input *input = mali_c720_sd_to_sd(mdev, struct mali_c720_input);
+	struct mali_c720_input_cfg input_cfg = {0};
+	struct mali_c720_slot_input *slot_input = &input->slot_input;
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev *src_sd;
+	int ret;
+
+	for_each_active_route(&state->routing, route) {
+		if (route->source_pad != pad)
+			continue;
+
+		slot_input->sink_pad = &input->pads[route->sink_pad];
+		slot_input->stream = route->sink_stream;
+		break;
+	}
+
+	if (!slot_input->sink_pad) {
+		dev_err(mali_c720->dev, "No active route for source pad %u\n", pad);
+		ret = -EINVAL;
+		goto err_free_input_ports;
+	}
+
+	slot_input->src_pad = media_pad_remote_pad_unique(slot_input->sink_pad);
+	ret = PTR_ERR_OR_ZERO(slot_input->src_pad);
+	if (ret) {
+		dev_err(mali_c720->dev, "Input pad %u not connected\n",
+			slot_input->sink_pad->index);
+		goto err_free_input_ports;
+	}
+
+	ret = mali_c720_prepare_input_port(input, state, slot_input, &input_cfg);
+	if (ret)
+		goto err_free_input_ports;
+
+	slot_input->prepared = true;
+	src_sd = media_entity_to_v4l2_subdev(slot_input->src_pad->entity);
+	ret = v4l2_subdev_enable_streams(src_sd, slot_input->src_pad->index,
+					 BIT(slot_input->stream));
+	if (ret && ret != -EALREADY) {
+		dev_err(mali_c720->dev, "Failed to start input source\n");
+		goto err_stop_sources;
+	}
+
+	mali_c720_ctx_mgr_prepare_context(ctx, &input_cfg);
+
+	ret = mali_c720_ctx_mgr_start_context_inputs(ctx);
+	if (ret)
+		goto err_stop_context;
+
+	return 0;
+
+err_stop_context:
+	mali_c720_ctx_mgr_stop_context(ctx);
+	mali_c720_ctx_mgr_stop_context_inputs(ctx);
+err_stop_sources:
+	mali_c720_stop_inputs(slot_input);
+err_free_input_ports:
+	mali_c720_free_input_ports(input);
+
+	return ret;
+}
+
+static int mali_c720_input_disable_streams(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *state, u32 pad,
+					   u64 streams_mask)
+{
+	struct mali_c720_subdev *mdev = v4l2_sd_to_mali_c720_sd(sd);
+	struct mali_c720_input *input = mali_c720_sd_to_sd(mdev, struct mali_c720_input);
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mdev->mali_c720);
+	struct mali_c720_slot_input *slot_input = &input->slot_input;
+
+	mali_c720_ctx_mgr_stop_context_inputs(ctx);
+	mali_c720_stop_inputs(slot_input);
+	mali_c720_free_input_ports(input);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops mali_c720_input_pad_ops = {
+	.enum_mbus_code		= mali_c720_input_enum_mbus_code,
+	.enum_frame_size	= mali_c720_input_enum_frame_size,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= mali_c720_input_set_fmt,
+	.link_validate		= v4l2_subdev_link_validate_default,
+	.enable_streams		= mali_c720_input_enable_streams,
+	.disable_streams	= mali_c720_input_disable_streams,
+};
+
+static const struct v4l2_subdev_ops mali_c720_input_ops = {
+	.pad	= &mali_c720_input_pad_ops,
+};
+
+static int mali_c720_input_init_state(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state)
+{
+	static const struct v4l2_mbus_framefmt format = {
+		.width = MALI_C720_DEFAULT_WIDTH,
+		.height = MALI_C720_DEFAULT_HEIGHT,
+		.field = V4L2_FIELD_NONE,
+		.code = MEDIA_BUS_FMT_SRGGB24_1X24,
+		.colorspace = V4L2_COLORSPACE_RAW,
+		.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_RAW),
+		.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_RAW),
+		.quantization = V4L2_QUANTIZATION_FULL_RANGE,
+	};
+	struct v4l2_subdev_route route = {
+		.sink_pad = MALI_C720_INPUT_PAD_SINK_INPUT0,
+		.sink_stream = 0,
+		.source_pad = MALI_C720_INPUT_PAD_SOURCE_SLOT_INPUT,
+		.source_stream = 0,
+		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+	};
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = 1,
+		.routes = &route,
+	};
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing, &format);
+}
+
+static const struct v4l2_subdev_internal_ops mali_c720_input_internal_ops = {
+	.init_state = mali_c720_input_init_state,
+};
+
+static int mali_c720_input_subdev_link_setup(struct media_entity *entity,
+					     const struct media_pad *local,
+					     const struct media_pad *remote,
+					     u32 flags)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct mali_c720 *mali_c720 = v4l2_sd_to_mali_c720_sd(sd)->mali_c720;
+	struct media_pad *remote_src;
+
+	/*
+	 * Sink and source pads support only one enabled connection.
+	 */
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
+				"Input pad %u is already connected to another pad\n",
+				local->index);
+			return -EBUSY;
+		}
+	}
+
+	return 0;
+}
+
+static int mali_c720_input_get_fwnode_pad(struct media_entity *entity,
+					  struct fwnode_endpoint *endpoint)
+{
+	int port;
+
+	port = v4l2_subdev_get_fwnode_pad_1_to_1(entity, endpoint);
+	if (port < 0)
+		return port;
+	if (port)
+		return -EINVAL;
+
+	return MALI_C720_INPUT_PAD_SINK_INPUT0;
+}
+
+static const struct media_entity_operations mali_c720_input_media_ops = {
+	.link_setup		= mali_c720_input_subdev_link_setup,
+	.link_validate		= v4l2_subdev_link_validate,
+	.get_fwnode_pad		= mali_c720_input_get_fwnode_pad,
+};
+
+int mali_c720_register_input(struct mali_c720 *mali_c720)
+{
+	struct mali_c720_input *input = &mali_c720->input;
+	struct mali_c720_subdev *mdev = &input->mdev;
+	struct v4l2_subdev *sd = &mdev->sd;
+	int ret;
+
+	mdev->mali_c720 = mali_c720;
+
+	v4l2_subdev_init(sd, &mali_c720_input_ops);
+	sd->dev = mali_c720->dev;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
+	sd->entity.ops = &mali_c720_input_media_ops;
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
+	sd->internal_ops = &mali_c720_input_internal_ops;
+	strscpy(sd->name, "mali-c720 input", sizeof(sd->name));
+
+	input->pads[MALI_C720_INPUT_PAD_SINK_INPUT0].flags =
+		MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
+	input->pads[MALI_C720_INPUT_PAD_SOURCE_SLOT_INPUT].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity,
+				     MALI_C720_INPUT_NUM_PADS,
+				     input->pads);
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
+void mali_c720_unregister_input(struct mali_c720 *mali_c720)
+{
+	struct mali_c720_input *input = &mali_c720->input;
+	struct mali_c720_subdev *mdev = &input->mdev;
+
+	if (!mdev->mali_c720)
+		return;
+
+	v4l2_device_unregister_subdev(&mdev->sd);
+}
+
+void mali_c720_cleanup_input(struct mali_c720 *mali_c720)
+{
+	struct mali_c720_input *input = &mali_c720->input;
+	struct mali_c720_subdev *mdev = &input->mdev;
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

