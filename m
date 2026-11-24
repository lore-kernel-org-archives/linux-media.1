Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540152;
	b=NzMZzF1rWZRxq/7Vj86z4M8CtFDC0t6/lLOeKVWS8zBBmyxDX/XO9Tv4ofPaTMJk8MV1
	 lSlLGGr09Wm/CX/RS7tb1/rgLHiF5jZolVs7WcvzMwWE+zBlPHvB+qpadqF03NCwk8EvY
	 /brZpNgusw2Qfw0x5g+D3691Z6R1GTx4ChITfRXlZiK4S0IPSvbK7gHR+YZZhu/jMDA7v
	 k5Qkjq7ZH16Lx5T7qT2LnhIu0L4YmopVxAeILvCGd8Tj3HfVAQf4xhJ0XAqq2x+iAS3z8
	 8OZYvK92cB1L4AV+2/OWsM+04Xe/wlOMMeYl1AtuSnd9jS9hXIqHJCfm0wkk2fr+16Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540152;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=khVfp7llgHAAlcEv4npH6x07pfWLvAkot6l8BEJdylQ=;
	b=wQ4qX5wSwfQx6u4qu59QwOPCPaCHCKa7z+AftVblVMHofEhk5dQwFf/S04vyDFF4yRo+
	 2QzQab7urAXVjfzXKs7ncAVCsatFCZ5H3t4d0sjrtpZpe4CdO1ZwZ+CPP7S7eNQNBNigR
	 JisiEHastqwUFvka/B4i+hvz6I5+m/+me8J1UbzsAMCSPqsrtKno0d35oQ27y8D3xpomf
	 GuXRqBPJ/ahDYCo4VO/nmeaup+sa1Ev8ml0I7NEDrrNqkRrYaGw343df/qLCoF4/UNFJ8
	 +OHMGKmzHqSNZw2AXnjnJKzKq8MqEqJT0G+jQDg4pHdnYdkIeZzI1LQT5tILRg4Zd4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vvIRafzC;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A64606A6AC;
	Tue, 24 Nov 2026 17:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6A64606A6AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vvIRafzC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C25C1C00;
	Tue, 24 Nov 2026 09:09:07 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 915993F763;
	Tue, 24 Nov 2026 09:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540150; bh=Y6uttXkQVZa2IkSveHLjz88dq4sah9TbNYhjhaZnqWY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vvIRafzCLsbautK8l3EWqCpapqUjBO2QNxS7TABLwtm8jedu1CLt55R6H7ChGzZGH
	 Uwd+vzkpd9oR+9Wd2R7Y/ayZim1+qGaIeGXzMm97fUiGxlPVFo7HPIifof6EwiZ5xf
	 TN67EYD6DXfr/ZlZ+bM9PzgZwltnNGWJ95LJh3ro=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:50 +0000
Subject: [PATCH 22/24] media: mali-c720: Add parameters video node
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
Message-Id: <20261124-b4-initial-upstream-candidate-v1-22-0cb9bde1bd30@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540079; l=64231;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=DLJUIQPHaJfjpZM4+1cGU86Fk8I0h+E/NvID/NJ5lIQ=;
 b=7Nmh5zc/G4iZ0IAiomQ1LSfxh4nlRjOeuM6+Q/BeZ6FnO7uq2XyFPZcoDm52GMQ91s0pJOWpa
 5zPSTZv2qH0Dn48gnxvNzBH3swjN56T4vB77Yk8rhr53n6koiEoKApy
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=

From: Anthony McGivern <Anthony.McGivern@arm.com>

Add a metadata output node for userspace to configure ISP processing.

Validate and copy queued parameter data before applying it to the
context register image. The ISP's configuration DMA engine (CDMA)
loads these settings before processing the frame.

Initial support includes statistics configuration, digital gain,
white balance, black level correction, square/square-root
transformations and input decompanding. Available parameter blocks
are reported through a read-only capability control.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 drivers/media/platform/arm/mali-c720/Makefile      |    1 +
 .../platform/arm/mali-c720/mali-c720-common.h      |   49 +
 .../media/platform/arm/mali-c720/mali-c720-core.c  |   25 +-
 .../platform/arm/mali-c720/mali-c720-ctx-mgr.c     |    1 +
 .../media/platform/arm/mali-c720/mali-c720-isp.c   |   27 +-
 .../platform/arm/mali-c720/mali-c720-params.c      | 1450 ++++++++++++++++++++
 6 files changed, 1549 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c720/Makefile b/drivers/media/platform/arm/mali-c720/Makefile
index c48d54dac23a94d429349d90eaf96c19bc017468..d0372f1f6f0d990215a66cba5d506b7c68f5edc7 100644
--- a/drivers/media/platform/arm/mali-c720/Makefile
+++ b/drivers/media/platform/arm/mali-c720/Makefile
@@ -10,6 +10,7 @@ mali-c720-y := mali-c720-capture.o \
 	      mali-c720-input.o \
 	      mali-c720-interrupts.o \
 	      mali-c720-isp.o \
+	      mali-c720-params.o \
 	      mali-c720-register-access.o \
 	      mali-c720-registers.o \
 	      mali-c720-registers-top.o \
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-common.h b/drivers/media/platform/arm/mali-c720/mali-c720-common.h
index 7a137de2e020d9de18df9918fe54519fab111a38..825f2603338ae83ce2b83e05013e21a0afc76639 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-common.h
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-common.h
@@ -111,6 +111,7 @@ enum mali_c720_isp_pads {
 	MALI_C720_ISP_PAD_SINK_VIDEO,
 	MALI_C720_ISP_PAD_SOURCE_HV,
 	MALI_C720_ISP_PAD_SOURCE_STATS,
+	MALI_C720_ISP_PAD_SINK_PARAMS,
 	MALI_C720_ISP_NUM_PADS,
 };
 
@@ -219,6 +220,17 @@ struct mali_c720_stats_buf {
 	dma_addr_t addr;
 };
 
+struct mali_c720_params_buf {
+	struct vb2_v4l2_buffer vb;
+	struct list_head queue;
+	struct v4l2_isp_params_buffer *config;
+};
+
+struct mali_c720_param_target {
+	bool present;
+	u32 base;
+};
+
 struct mali_c720_stats_target {
 	struct mali_c720_cdma_sg_cfg desc[2];
 	u8 num_desc;
@@ -249,6 +261,29 @@ struct mali_c720_stats {
 	} ctrls;
 };
 
+struct mali_c720_params {
+	struct mali_c720 *mali_c720;
+	struct video_device vdev;
+	struct vb2_queue queue;
+	struct media_pad pad;
+	/* Mutex to provide to vb2 */
+	struct mutex lock;
+
+	struct {
+		/* Spinlock to guard buffer queue */
+		spinlock_t lock;
+		struct list_head input;
+		struct list_head processing;
+	} buffers;
+
+	unsigned int num_targets;
+	struct mali_c720_param_target targets[MALI_C720_PARAM_BLOCK_MAX];
+	struct {
+		struct v4l2_ctrl_handler handler;
+		struct v4l2_ctrl *param_capabilities;
+	} ctrls;
+};
+
 struct mali_c720_request {
 	struct media_request req;
 	unsigned int queue_sequence;
@@ -323,6 +358,7 @@ struct mali_c720 {
 	struct mali_c720_fr_pipe fr_pipe;
 	struct mali_c720_cap_dev cap_devs[MALI_C720_MAX_NUM_CAP_DEVS];
 	struct mali_c720_stats stats;
+	struct mali_c720_params params;
 
 	unsigned int num_async_endpoints;
 
@@ -374,6 +410,10 @@ int mali_c720_register_stats(struct mali_c720 *mali_c720);
 void mali_c720_unregister_stats(struct mali_c720 *mali_c720);
 void mali_c720_cleanup_stats(struct mali_c720 *mali_c720);
 
+int mali_c720_register_params(struct mali_c720 *mali_c720);
+void mali_c720_unregister_params(struct mali_c720 *mali_c720);
+void mali_c720_cleanup_params(struct mali_c720 *mali_c720);
+
 void mali_c720_fr_pipe_apply_resizer_config(struct mali_c720_fr_pipe *pipe);
 
 bool mali_c720_cap_dev_uses_requests(struct mali_c720_cap_dev *cap_dev);
@@ -391,6 +431,15 @@ void mali_c720_stats_set_next_buffer(struct mali_c720_stats *stats,
 				     struct media_request *req);
 void mali_c720_stats_buffer_done(struct mali_c720_stats *stats, bool success);
 
+bool mali_c720_params_uses_requests(struct mali_c720_params *params);
+struct media_request *mali_c720_params_get_request(struct mali_c720_params *params);
+struct mali_c720_params_buf *
+mali_c720_params_get_next_buffer(struct mali_c720_params *params,
+				 struct media_request *req);
+void mali_c720_params_apply_config(struct mali_c720 *mali_c720,
+				   struct mali_c720_params_buf *buf);
+void mali_c720_params_buffer_done(struct mali_c720_params *params, bool success);
+
 void mali_c720_isp_queue_event_sof(struct mali_c720 *mali_c720, u32 sequence);
 
 int mali_c720_pipeline_ready(struct mali_c720 *mali_c720);
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-core.c b/drivers/media/platform/arm/mali-c720/mali-c720-core.c
index ad768b0a2e03a0a6f38b72603ccdedaeeee42f0a..722778c6a31cbbd423e6be37933cb0db522d4cdc 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-core.c
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-core.c
@@ -47,6 +47,7 @@ static void mali_c720_remove_links(struct mali_c720 *mali_c720)
 		media_entity_remove_links(&mali_c720->cap_devs[i].vdev.entity);
 
 	media_entity_remove_links(&mali_c720->stats.vdev.entity);
+	media_entity_remove_links(&mali_c720->params.vdev.entity);
 }
 
 static int mali_c720_create_tpg_links(struct mali_c720 *mali_c720,
@@ -159,6 +160,13 @@ static int mali_c720_create_3a_links(struct mali_c720 *mali_c720)
 		return ret;
 	}
 
+	ret = media_create_pad_link(&mali_c720->params.vdev.entity, 0,
+				    &isp_sd->entity,
+				    MALI_C720_ISP_PAD_SINK_PARAMS,
+				    0);
+	if (ret)
+		dev_err(mali_c720->dev, "Failed to link 3A params node and ISP\n");
+
 	return ret;
 }
 
@@ -206,6 +214,7 @@ static void mali_c720_unregister_video_devices(struct mali_c720 *mali_c720)
 
 	mali_c720_unregister_capture_devs(mali_c720);
 	mali_c720_unregister_stats(mali_c720);
+	mali_c720_unregister_params(mali_c720);
 }
 
 static void mali_c720_unregister_entities(struct mali_c720 *mali_c720)
@@ -250,6 +259,10 @@ static int mali_c720_register_entities(struct mali_c720 *mali_c720)
 	if (ret)
 		goto err_unregister_entities;
 
+	ret = mali_c720_register_params(mali_c720);
+	if (ret)
+		goto err_unregister_entities;
+
 	ret = mali_c720_create_links(mali_c720);
 	if (ret)
 		goto err_unregister_entities;
@@ -371,6 +384,7 @@ static void mali_c720_release(struct v4l2_device *v4l2_dev)
 
 	mali_c720_cleanup_capture_devs(mali_c720);
 	mali_c720_cleanup_stats(mali_c720);
+	mali_c720_cleanup_params(mali_c720);
 	mali_c720_cleanup_fr_pipe(mali_c720);
 	mali_c720_cleanup_vision_pipe(mali_c720);
 	mali_c720_cleanup_isp(mali_c720);
@@ -608,6 +622,9 @@ static struct media_request *mali_c720_find_request(struct mali_c720 *mali_c720)
 	candidate = mali_c720_stats_get_request(&mali_c720->stats);
 	req = mali_c720_oldest_request(NULL, candidate);
 
+	candidate = mali_c720_params_get_request(&mali_c720->params);
+	req = mali_c720_oldest_request(req, candidate);
+
 	for (i = 0; i < MALI_C720_MAX_NUM_CAP_DEVS; i++) {
 		candidate = mali_c720_cap_dev_get_request(&mali_c720->cap_devs[i]);
 		req = mali_c720_oldest_request(req, candidate);
@@ -620,7 +637,8 @@ static bool mali_c720_uses_requests(struct mali_c720 *mali_c720)
 {
 	unsigned int i;
 
-	if (mali_c720_stats_uses_requests(&mali_c720->stats))
+	if (mali_c720_stats_uses_requests(&mali_c720->stats) ||
+	    mali_c720_params_uses_requests(&mali_c720->params))
 		return true;
 
 	for (i = 0; i < MALI_C720_MAX_NUM_CAP_DEVS; i++) {
@@ -651,6 +669,7 @@ static struct media_request *mali_c720_can_schedule_request(struct mali_c720_con
 void mali_c720_try_schedule_frame(struct mali_c720_context *ctx)
 {
 	struct mali_c720 *mali_c720 = ctx->mali_c720;
+	struct mali_c720_params_buf *params_buf = NULL;
 	struct media_request *req = NULL;
 	unsigned int i;
 
@@ -673,6 +692,7 @@ void mali_c720_try_schedule_frame(struct mali_c720_context *ctx)
 			mali_c720_cap_dev_set_next_buffer(&mali_c720->cap_devs[i], req);
 
 		mali_c720_stats_set_next_buffer(&mali_c720->stats, req);
+		params_buf = mali_c720_params_get_next_buffer(&mali_c720->params, req);
 	}
 
 	ctx->pipeline_busy = true;
@@ -681,6 +701,9 @@ void mali_c720_try_schedule_frame(struct mali_c720_context *ctx)
 	/* Resizer configurations should be synchronised with CDMA */
 	mali_c720_fr_pipe_apply_resizer_config(&mali_c720->fr_pipe);
 
+	if (params_buf)
+		mali_c720_params_apply_config(mali_c720, params_buf);
+
 	mali_c720_ctx_mgr_handle_sw_ready(ctx);
 }
 
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-ctx-mgr.c b/drivers/media/platform/arm/mali-c720/mali-c720-ctx-mgr.c
index cd0cf046ac58a001ec821342b2e64e85755438f1..815ad8537312616a862ca702c6b80d0d721f22c7 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-ctx-mgr.c
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-ctx-mgr.c
@@ -1426,6 +1426,7 @@ void mali_c720_ctx_mgr_buffer_done(struct mali_c720_context *ctx, bool success)
 		mali_c720_cap_dev_buffer_done(&mali_c720->cap_devs[i], success);
 
 	mali_c720_stats_buffer_done(&mali_c720->stats, success);
+	mali_c720_params_buffer_done(&mali_c720->params, success);
 }
 
 void mali_c720_ctx_mgr_handle_sw_ready(struct mali_c720_context *ctx)
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-isp.c b/drivers/media/platform/arm/mali-c720/mali-c720-isp.c
index a6c4da686bde0b76302ee9ad4fb49a132fa82b7c..3e17917296ea89973fa8ba8b520d2db0b2577a4b 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-isp.c
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-isp.c
@@ -23,7 +23,8 @@ static int mali_c720_isp_enum_mbus_code(struct v4l2_subdev *sd,
 	struct mali_c720_mbus_format_match match;
 
 	/* HV uses the sink Bayer order at the internal 16-bit precision. */
-	if (code->pad == MALI_C720_ISP_PAD_SOURCE_STATS) {
+	if (code->pad == MALI_C720_ISP_PAD_SOURCE_STATS ||
+	    code->pad == MALI_C720_ISP_PAD_SINK_PARAMS) {
 		if (code->index)
 			return -EINVAL;
 		code->code = MEDIA_BUS_FMT_METADATA_FIXED;
@@ -94,6 +95,7 @@ static int mali_c720_isp_enum_frame_size(struct v4l2_subdev *sd,
 			return -EINVAL;
 		break;
 	case MALI_C720_ISP_PAD_SOURCE_STATS:
+	case MALI_C720_ISP_PAD_SINK_PARAMS:
 		return -ENOTTY;
 	default:
 		return -EINVAL;
@@ -298,7 +300,7 @@ static const struct v4l2_subdev_ops mali_c720_isp_ops = {
 static int mali_c720_isp_init_state(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *state)
 {
-	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt, *stats_fmt;
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt, *stats_fmt, *params_fmt;
 
 	sink_fmt = v4l2_subdev_state_get_format(state, MALI_C720_ISP_PAD_SINK_VIDEO);
 	sink_fmt->width = MALI_C720_DEFAULT_WIDTH;
@@ -320,6 +322,12 @@ static int mali_c720_isp_init_state(struct v4l2_subdev *sd,
 	stats_fmt->field = V4L2_FIELD_NONE;
 	stats_fmt->code = MEDIA_BUS_FMT_METADATA_FIXED;
 
+	params_fmt = v4l2_subdev_state_get_format(state, MALI_C720_ISP_PAD_SINK_PARAMS);
+	params_fmt->width = 0;
+	params_fmt->height = 0;
+	params_fmt->field = V4L2_FIELD_NONE;
+	params_fmt->code = MEDIA_BUS_FMT_METADATA_FIXED;
+
 	return 0;
 }
 
@@ -357,9 +365,21 @@ static int mali_c720_isp_subdev_link_setup(struct media_entity *entity,
 	return 0;
 }
 
+static int mali_c720_isp_subdev_link_validate(struct media_link *link)
+{
+	/*
+	 * Skip validation for the parameters sink pad, as the source is not
+	 * a subdevice.
+	 */
+	if (link->sink->index == MALI_C720_ISP_PAD_SINK_PARAMS)
+		return 0;
+
+	return v4l2_subdev_link_validate(link);
+}
+
 static const struct media_entity_operations mali_c720_isp_media_ops = {
 	.link_setup		= mali_c720_isp_subdev_link_setup,
-	.link_validate		= v4l2_subdev_link_validate,
+	.link_validate		= mali_c720_isp_subdev_link_validate,
 };
 
 int mali_c720_register_isp(struct mali_c720 *mali_c720)
@@ -383,6 +403,7 @@ int mali_c720_register_isp(struct mali_c720 *mali_c720)
 							MEDIA_PAD_FL_MUST_CONNECT;
 	isp->pads[MALI_C720_ISP_PAD_SOURCE_HV].flags = MEDIA_PAD_FL_SOURCE;
 	isp->pads[MALI_C720_ISP_PAD_SOURCE_STATS].flags = MEDIA_PAD_FL_SOURCE;
+	isp->pads[MALI_C720_ISP_PAD_SINK_PARAMS].flags = MEDIA_PAD_FL_SINK;
 
 	ret = media_entity_pads_init(&sd->entity,
 				     MALI_C720_ISP_NUM_PADS,
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-params.c b/drivers/media/platform/arm/mali-c720/mali-c720-params.c
new file mode 100644
index 0000000000000000000000000000000000000000..e6e0ca070f0ea16efbe2effd89d1fe3a92f8cb42
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-params.c
@@ -0,0 +1,1450 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/dma-buf.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include <asm/byteorder.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-isp.h>
+#include <media/videobuf2-vmalloc.h>
+
+#include "mali-c720-common.h"
+
+/**
+ * union mali_c720_params_block - Generalization of a parameter block
+ *
+ * This union allows the driver to treat a block as a generic pointer to this
+ * union and safely access the header and block-specific struct without having
+ * to resort to casting. The header member is accessed first, and the
+ * header->type field checked which allows the driver to determine which of
+ * other members should be used. The data member at the end allows a pointer to
+ * an address within the data member of :c:type:`v4l2_isp_params_buffer` to
+ * initialize a union variable.
+ *
+ * @header:		Pointer to the shared header struct embedded as the
+ *			first member of all the possible other members (except
+ *			@data). This member would be accessed first and the
+ *			header->type field checked to determine which of the other
+ *			members should be accessed.
+ * @digital_gain:	For header->type:
+ *			MALI_C720_PARAM_BLOCK_DIGITAL_GAIN_INP
+ * @awb_gains:		For header->type:
+ *			MALI_C720_PARAM_BLOCK_AWB_GAINS_HV
+ * @black_level:	For header->type:
+ *			MALI_C720_PARAM_BLOCK_BLACK_LEVEL_HV
+ * @square_root:	For header->type:
+ *			MALI_C720_PARAM_BLOCK_SQRT_INP
+ *			MALI_C720_PARAM_BLOCK_SQRT_HV
+ * @square:		For header->type:
+ *			MALI_C720_PARAM_BLOCK_SQUARE_A_HV
+ *			MALI_C720_PARAM_BLOCK_SQUARE_B_HV
+ * @decompander:	For header->type == MALI_C720_PARAM_BLOCK_DECOMPANDER_INP
+ * @color_stats:	For header->type:
+ *			MALI_C720_PARAM_BLOCK_COLOR_STATS_HV
+ * @histogram:		For header->type:
+ *			MALI_C720_PARAM_BLOCK_HISTOGRAM_INP
+ *			MALI_C720_PARAM_BLOCK_HISTOGRAM_HV
+ *			MALI_C720_PARAM_BLOCK_HISTOGRAM_HV_IRIDIX
+ * @data:		Allows easy initialization of a union variable with a
+ *			pointer into a __u8 array.
+ */
+union mali_c720_params_block {
+	struct v4l2_isp_block_header *header;
+	struct mali_c720_params_digital_gain *digital_gain;
+	struct mali_c720_params_awb_gains *awb_gains;
+	struct mali_c720_params_black_level *black_level;
+	struct mali_c720_params_sqrt *square_root;
+	struct mali_c720_params_square *square;
+	struct mali_c720_params_decompander *decompander;
+	struct mali_c720_params_color_stats *color_stats;
+	struct mali_c720_params_histogram *histogram;
+	__u8 *data;
+};
+
+typedef void (*mali_c720_params_handler)(struct mali_c720_context *ctx,
+					 const struct mali_c720_param_target *target,
+					 union mali_c720_params_block block, bool config);
+
+static const struct mali_c720_discovery_target
+mali_c720_params_discovery_targets[MALI_C720_PARAM_BLOCK_MAX] = {
+	[MALI_C720_PARAM_BLOCK_DIGITAL_GAIN_INP] = {
+		.module_id = MALI_C720_DISC_MODULE_ID_DIGITAL_GAIN, .module_instance = 0,
+		.pipeline_id = MALI_C720_DISC_PIPE_INPUT, .pipeline_instance = 0 },
+	[MALI_C720_PARAM_BLOCK_AWB_GAINS_HV] = {
+		.module_id = MALI_C720_DISC_MODULE_ID_WB_GAIN, .module_instance = 0,
+		.pipeline_id = MALI_C720_DISC_PIPE_HV, .pipeline_instance = 0 },
+	[MALI_C720_PARAM_BLOCK_BLACK_LEVEL_HV] = {
+		.module_id = MALI_C720_DISC_MODULE_ID_BLACK_LEVEL, .module_instance = 0,
+		.pipeline_id = MALI_C720_DISC_PIPE_HV, .pipeline_instance = 0 },
+	[MALI_C720_PARAM_BLOCK_SQRT_INP] = {
+		.module_id = MALI_C720_DISC_MODULE_ID_SQUARE_ROOT_RAW, .module_instance = 0,
+		.pipeline_id = MALI_C720_DISC_PIPE_INPUT, .pipeline_instance = 0 },
+	[MALI_C720_PARAM_BLOCK_SQRT_HV] = {
+		.module_id = MALI_C720_DISC_MODULE_ID_SQUARE_ROOT_RGB, .module_instance = 0,
+		.pipeline_id = MALI_C720_DISC_PIPE_HV, .pipeline_instance = 0 },
+	[MALI_C720_PARAM_BLOCK_SQUARE_A_HV] = {
+		.module_id = MALI_C720_DISC_MODULE_ID_SQUARE_RAW, .module_instance = 0,
+		.pipeline_id = MALI_C720_DISC_PIPE_HV, .pipeline_instance = 0 },
+	[MALI_C720_PARAM_BLOCK_SQUARE_B_HV] = {
+		.module_id = MALI_C720_DISC_MODULE_ID_SQUARE_RGB, .module_instance = 0,
+		.pipeline_id = MALI_C720_DISC_PIPE_HV, .pipeline_instance = 0 },
+	[MALI_C720_PARAM_BLOCK_DECOMPANDER_INP] = {
+		.module_id = MALI_C720_DISC_MODULE_ID_DECOMPANDER, .module_instance = 0,
+		.pipeline_id = MALI_C720_DISC_PIPE_INPUT, .pipeline_instance = 0 },
+	[MALI_C720_PARAM_BLOCK_COLOR_STATS_HV] = {
+		.module_id = MALI_C720_DISC_MODULE_ID_COLOR_STATS, .module_instance = 0,
+		.pipeline_id = MALI_C720_DISC_PIPE_STATS, .pipeline_instance = 0 },
+	[MALI_C720_PARAM_BLOCK_HISTOGRAM_INP] = {
+		.module_id = MALI_C720_DISC_MODULE_ID_HISTOGRAM_STATS, .module_instance = 0,
+		.pipeline_id = MALI_C720_DISC_PIPE_STATS, .pipeline_instance = 0 },
+	[MALI_C720_PARAM_BLOCK_HISTOGRAM_HV] = {
+		.module_id = MALI_C720_DISC_MODULE_ID_HISTOGRAM_STATS, .module_instance = 1,
+		.pipeline_id = MALI_C720_DISC_PIPE_STATS, .pipeline_instance = 0 },
+	[MALI_C720_PARAM_BLOCK_HISTOGRAM_HV_IRIDIX] = {
+		.module_id = MALI_C720_DISC_MODULE_ID_HISTOGRAM_STATS, .module_instance = 2,
+		.pipeline_id = MALI_C720_DISC_PIPE_STATS, .pipeline_instance = 0 },
+};
+
+static int
+mali_c720_params_fill_target(struct mali_c720 *mali_c720, unsigned int block_type,
+			     struct mali_c720_param_target *target)
+{
+	const struct mali_c720_discovery_target *discovery;
+	int ret;
+
+	discovery = &mali_c720_params_discovery_targets[block_type];
+
+	if (!mali_c720_discovery_module_present(mali_c720, discovery))
+		return -ENOENT;
+
+	ret = mali_c720_discovery_get_module_base(mali_c720, discovery,
+						  &target->base);
+	if (ret)
+		return ret;
+
+	target->present = true;
+	return 0;
+}
+
+static int mali_c720_params_build_target_cache(struct mali_c720 *mali_c720)
+{
+	struct mali_c720_params *params = &mali_c720->params;
+	unsigned int block_type;
+	int ret;
+
+	for (block_type = 0; block_type < MALI_C720_PARAM_BLOCK_MAX; block_type++) {
+		ret = mali_c720_params_fill_target(mali_c720, block_type,
+						   &params->targets[block_type]);
+		if (ret == -ENOENT)
+			continue;
+		if (ret)
+			return ret;
+
+		params->num_targets++;
+	}
+
+	if (!params->num_targets) {
+		dev_err(mali_c720->dev, "no configurable parameter targets discovered\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static const struct mali_c720_param_target *
+mali_c720_params_get_target(struct mali_c720_params *params, unsigned int block_type)
+{
+	if (block_type >= MALI_C720_PARAM_BLOCK_MAX || !params->targets[block_type].present)
+		return NULL;
+
+	return &params->targets[block_type];
+}
+
+static int mali_c720_params_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct mali_c720_params *params =
+		container_of(ctrl->handler, struct mali_c720_params, ctrls.handler);
+	u16 *ids = ctrl->p_new.p_u16;
+	unsigned int block_type;
+
+	if (ctrl->id != V4L2_CID_MALI_C720_PARAM_CAPABILITIES)
+		return -EINVAL;
+
+	for (block_type = 0; block_type < MALI_C720_PARAM_BLOCK_MAX; block_type++) {
+		if (params->targets[block_type].present)
+			*ids++ = (u16)block_type;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops mali_c720_params_ctrl_ops = {
+	.g_volatile_ctrl = mali_c720_params_g_volatile_ctrl,
+};
+
+static const struct v4l2_ctrl_config mali_c720_params_caps_ctrl = {
+	.ops = &mali_c720_params_ctrl_ops,
+	.id = V4L2_CID_MALI_C720_PARAM_CAPABILITIES,
+	.name = "Mali-C720 Parameter Capabilities",
+	.type = V4L2_CTRL_TYPE_U16,
+	.dims = { MALI_C720_PARAM_BLOCK_MAX },
+	.min = 0,
+	.max = U16_MAX,
+	.step = 1,
+	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_VOLATILE,
+};
+
+#define to_mali_c720_params_buf(vbuf) \
+	container_of(vbuf, struct mali_c720_params_buf, vb)
+
+static void mali_c720_params_u8_lut_write(struct mali_c720_context *ctx,
+					  u32 addr, u8 *lut, u32 size)
+{
+	unsigned int i, head_elems, tail_elems;
+	u32 data;
+
+	/*
+	 * Write an array of 8-bit LUT elements to 32-bit registers.
+	 * We first write 4 elements at a time until such point that doing so
+	 * would exceed the array size, and then write the remaining 1-3 elements.
+	 */
+
+	head_elems = size & 0xfffffffc;
+	tail_elems = size - head_elems;
+	for (i = 0; i < head_elems; i += 4, addr += 4) {
+		data = le32_to_cpup((const __le32 *)(lut + i));
+		mali_c720_ctx_write_raw(ctx, addr, data);
+	}
+
+	data = 0;
+	switch (tail_elems) {
+	case 3:
+		data |= (u32)lut[head_elems + 2] << 16;
+		fallthrough;
+	case 2:
+		data |= (u32)lut[head_elems + 1] << 8;
+		fallthrough;
+	case 1:
+		data |= lut[head_elems];
+		mali_c720_ctx_write_raw(ctx, addr, data);
+		break;
+	default:
+		break;
+	}
+}
+
+static void mali_c720_params_u32_lut_write(struct mali_c720_context *ctx,
+					   u32 addr, u32 *lut, u32 size)
+{
+	unsigned int i;
+
+	for (i = 0; i < size; i++, addr += 4)
+		mali_c720_ctx_write_raw(ctx, addr, lut[i]);
+}
+
+#define mali_c720_params_updated(params, flag) \
+	(!!((params)->updated_mask & BIT_ULL(flag)))
+
+#define mali_c720_ctx_group_write_updated(ctx, group, reg, val, flag)    \
+	do {                                                             \
+		if (mali_c720_params_updated(params, flag))              \
+			mali_c720_ctx_group_write(ctx, group, reg, val); \
+	} while (0)
+
+#define mali_c720_lut_u8_write_updated(ctx, addr, lut, size, flag) \
+	do { \
+		if (mali_c720_params_updated(params, flag)) { \
+			mali_c720_params_u8_lut_write(ctx, addr, lut, size); \
+		} \
+	} while (0)
+
+#define mali_c720_lut_u32_write_updated(ctx, addr, lut, size, flag) \
+	do { \
+		if (mali_c720_params_updated(params, flag)) { \
+			mali_c720_params_u32_lut_write(ctx, addr, lut, size); \
+		} \
+	} while (0)
+
+static void mali_c720_params_write_bypass(struct mali_c720_context *ctx, u32 base,
+					  const struct mali_c720_reg_field *field,
+					  const struct v4l2_isp_block_header *header)
+{
+	u16 flags = header->flags;
+
+	if (flags & (V4L2_ISP_PARAMS_FL_BLOCK_ENABLE | V4L2_ISP_PARAMS_FL_BLOCK_DISABLE))
+		mali_c720_ctx_group_write(ctx, base, field,
+					  !!(flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE));
+}
+
+static void mali_c720_params_input_digital_gain(struct mali_c720_context *ctx,
+						const struct mali_c720_param_target *target,
+						union mali_c720_params_block block, bool config)
+{
+	struct mali_c720 *mali_c720 = ctx->mali_c720;
+	const struct mali_c720_pipeline_regs *pipeline = mali_c720->registers.top->pipeline;
+	const struct mali_c720_digital_gain_regs *inp_dgain =
+		mali_c720->registers.modules->inp_dgain;
+	struct mali_c720_params_digital_gain *params = block.digital_gain;
+
+	mali_c720_params_write_bypass(ctx, mali_c720->top_base,
+				      &pipeline->bypass_inp_dgain, block.header);
+
+	if (!config || !params->updated_mask)
+		return;
+
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &inp_dgain->gain,
+					  params->gain,
+					  MALI_C720_PARAMS_DIGITAL_GAIN_MASK_GAIN);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &inp_dgain->offset,
+					  params->offset,
+					  MALI_C720_PARAMS_DIGITAL_GAIN_MASK_OFFSET);
+}
+
+static void mali_c720_params_awb_gains(struct mali_c720_context *ctx,
+				       const struct mali_c720_param_target *target,
+				       union mali_c720_params_block block, bool config)
+{
+	struct mali_c720 *mali_c720 = ctx->mali_c720;
+	const struct mali_c720_pipeline_regs *pipeline = mali_c720->registers.top->pipeline;
+	const struct mali_c720_wb_gain_regs *wb_gain = mali_c720->registers.modules->wb_gain;
+	struct mali_c720_params_awb_gains *params = block.awb_gains;
+
+	mali_c720_params_write_bypass(ctx, mali_c720->top_base,
+				      &pipeline->bypass_hv_wb_gain, block.header);
+
+	if (!config || !params->updated_mask)
+		return;
+
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &wb_gain->gain_00,
+					  params->gain00,
+					  MALI_C720_PARAMS_AWB_GAINS_MASK_GAIN00);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &wb_gain->gain_01,
+					  params->gain01,
+					  MALI_C720_PARAMS_AWB_GAINS_MASK_GAIN01);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &wb_gain->gain_10,
+					  params->gain10,
+					  MALI_C720_PARAMS_AWB_GAINS_MASK_GAIN10);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &wb_gain->gain_11,
+					  params->gain11,
+					  MALI_C720_PARAMS_AWB_GAINS_MASK_GAIN11);
+}
+
+static void mali_c720_params_black_level(struct mali_c720_context *ctx,
+					 const struct mali_c720_param_target *target,
+					 union mali_c720_params_block block, bool config)
+{
+	struct mali_c720 *mali_c720 = ctx->mali_c720;
+	const struct mali_c720_pipeline_regs *pipeline = mali_c720->registers.top->pipeline;
+	const struct mali_c720_black_level_regs *black_level =
+		mali_c720->registers.modules->black_level;
+	struct mali_c720_params_black_level *params = block.black_level;
+
+	mali_c720_params_write_bypass(ctx, mali_c720->top_base,
+				      &pipeline->bypass_hv_black_level, block.header);
+
+	if (!config || !params->updated_mask)
+		return;
+
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &black_level->black_00,
+					  params->chan00,
+					  MALI_C720_PARAMS_BLACK_LEVEL_MASK_CHAN00);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &black_level->black_01,
+					  params->chan01,
+					  MALI_C720_PARAMS_BLACK_LEVEL_MASK_CHAN01);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &black_level->black_10,
+					  params->chan10,
+					  MALI_C720_PARAMS_BLACK_LEVEL_MASK_CHAN10);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &black_level->black_11,
+					  params->chan11,
+					  MALI_C720_PARAMS_BLACK_LEVEL_MASK_CHAN11);
+}
+
+static void mali_c720_params_sqrt_a(struct mali_c720_context *ctx,
+				    const struct mali_c720_param_target *target,
+				    union mali_c720_params_block block, bool config)
+{
+	struct mali_c720 *mali_c720 = ctx->mali_c720;
+	const struct mali_c720_pipeline_regs *pipeline = mali_c720->registers.top->pipeline;
+	const struct mali_c720_square_root_regs *square_root_a =
+		mali_c720->registers.modules->square_root_a;
+	struct mali_c720_params_sqrt *params = block.square_root;
+
+	mali_c720_params_write_bypass(ctx, mali_c720->top_base,
+				      &pipeline->bypass_inp_square_root_a, block.header);
+
+	if (!config || !params->updated_mask)
+		return;
+
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &square_root_a->black_level_in,
+					  params->black_level_linear,
+					  MALI_C720_PARAMS_SQUARE_SQRT_MASK_BL_IN);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &square_root_a->black_level_out,
+					  params->black_level_sqrt,
+					  MALI_C720_PARAMS_SQUARE_SQRT_MASK_BL_OUT);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &square_root_a->normalization,
+					  params->normalization,
+					  MALI_C720_PARAMS_SQUARE_SQRT_MASK_NORMALIZATION);
+}
+
+static void mali_c720_params_sqrt_b(struct mali_c720_context *ctx,
+				    const struct mali_c720_param_target *target,
+				    union mali_c720_params_block block, bool config)
+{
+	struct mali_c720 *mali_c720 = ctx->mali_c720;
+	const struct mali_c720_pipeline_regs *pipeline = mali_c720->registers.top->pipeline;
+	const struct mali_c720_square_root_regs *square_root_b =
+		mali_c720->registers.modules->square_root_b;
+	struct mali_c720_params_sqrt *params = block.square_root;
+
+	mali_c720_params_write_bypass(ctx, mali_c720->top_base,
+				      &pipeline->bypass_hv_square_root_b, block.header);
+
+	if (!config || !params->updated_mask)
+		return;
+
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &square_root_b->black_level_in,
+					  params->black_level_linear,
+					  MALI_C720_PARAMS_SQUARE_SQRT_MASK_BL_IN);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &square_root_b->black_level_out,
+					  params->black_level_sqrt,
+					  MALI_C720_PARAMS_SQUARE_SQRT_MASK_BL_OUT);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &square_root_b->normalization,
+					  params->normalization,
+					  MALI_C720_PARAMS_SQUARE_SQRT_MASK_NORMALIZATION);
+}
+
+static void mali_c720_params_square_a(struct mali_c720_context *ctx,
+				      const struct mali_c720_param_target *target,
+				      union mali_c720_params_block block, bool config)
+{
+	struct mali_c720 *mali_c720 = ctx->mali_c720;
+	const struct mali_c720_pipeline_regs *pipeline = mali_c720->registers.top->pipeline;
+	const struct mali_c720_square_regs *square_a = mali_c720->registers.modules->square_a;
+	struct mali_c720_params_square *params = block.square;
+
+	mali_c720_params_write_bypass(ctx, mali_c720->top_base,
+				      &pipeline->bypass_hv_square_a, block.header);
+
+	if (!config || !params->updated_mask)
+		return;
+
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &square_a->black_level_in,
+					  params->black_level_sqrt,
+					  MALI_C720_PARAMS_SQUARE_SQRT_MASK_BL_IN);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &square_a->black_level_out,
+					  params->black_level_linear,
+					  MALI_C720_PARAMS_SQUARE_SQRT_MASK_BL_OUT);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &square_a->normalization,
+					  params->normalization,
+					  MALI_C720_PARAMS_SQUARE_SQRT_MASK_NORMALIZATION);
+}
+
+static void mali_c720_params_square_b(struct mali_c720_context *ctx,
+				      const struct mali_c720_param_target *target,
+				      union mali_c720_params_block block, bool config)
+{
+	struct mali_c720 *mali_c720 = ctx->mali_c720;
+	const struct mali_c720_pipeline_regs *pipeline = mali_c720->registers.top->pipeline;
+	const struct mali_c720_square_regs *square_b = mali_c720->registers.modules->square_b;
+	struct mali_c720_params_square *params = block.square;
+
+	mali_c720_params_write_bypass(ctx, mali_c720->top_base,
+				      &pipeline->bypass_hv_square_b, block.header);
+
+	if (!config || !params->updated_mask)
+		return;
+
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &square_b->black_level_in,
+					  params->black_level_sqrt,
+					  MALI_C720_PARAMS_SQUARE_SQRT_MASK_BL_IN);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &square_b->black_level_out,
+					  params->black_level_linear,
+					  MALI_C720_PARAMS_SQUARE_SQRT_MASK_BL_OUT);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &square_b->normalization,
+					  params->normalization,
+					  MALI_C720_PARAMS_SQUARE_SQRT_MASK_NORMALIZATION);
+}
+
+static int
+mali_c720_params_validate_decompander(struct device *dev,
+				      const struct v4l2_isp_block_header *block)
+{
+	const struct mali_c720 *mali_c720 = dev_get_drvdata(dev);
+	const struct mali_c720_decompander_regs *decompander =
+		mali_c720->registers.modules->decompander;
+	const struct mali_c720_params_decompander *params =
+		(const struct mali_c720_params_decompander *)block;
+	const u64 lut_mask = BIT_ULL(MALI_C720_PARAMS_DECOMPANDER_MASK_LUT_X) |
+			     BIT_ULL(MALI_C720_PARAMS_DECOMPANDER_MASK_LUT_Y);
+	u64 updated;
+	unsigned int i;
+
+	if (block->size == sizeof(*block))
+		return 0;
+
+	updated = params->updated_mask & lut_mask;
+	if (!updated)
+		return 0;
+
+	if (updated != lut_mask) {
+		dev_dbg(dev, "Decompander x/y LUTs must be updated together\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * Reject decreasing X coordinates.
+	 * Increasing X coordinates must differ by at least 8.
+	 * Equal X coordinates must have equal Y coordinates.
+	 */
+	for (i = 1; i < ARRAY_SIZE(params->lut_x); i++) {
+		u32 prev_x = params->lut_x[i - 1] & mali_c720_reg_mask(&decompander->lut_x);
+		u32 prev_y = params->lut_y[i - 1] & mali_c720_reg_mask(&decompander->lut_y);
+		u32 x = params->lut_x[i] & mali_c720_reg_mask(&decompander->lut_x);
+		u32 y = params->lut_y[i] & mali_c720_reg_mask(&decompander->lut_y);
+
+		if (x < prev_x || (x != prev_x && x - prev_x < 8) ||
+		    (x == prev_x && y != prev_y)) {
+			dev_dbg(dev, "Invalid decompander LUT interval at index %u\n", i);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static void mali_c720_params_decompander(struct mali_c720_context *ctx,
+					 const struct mali_c720_param_target *target,
+					 union mali_c720_params_block block, bool config)
+{
+	struct mali_c720 *mali_c720 = ctx->mali_c720;
+	const struct mali_c720_pipeline_regs *pipeline = mali_c720->registers.top->pipeline;
+	const struct mali_c720_decompander_regs *decompander =
+		mali_c720->registers.modules->decompander;
+	struct mali_c720_params_decompander *params = block.decompander;
+	u32 lut_addr;
+
+	mali_c720_params_write_bypass(ctx, mali_c720->top_base,
+				      &pipeline->bypass_inp_decompander, block.header);
+
+	if (!config || !params->updated_mask)
+		return;
+
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &decompander->enable,
+					  params->enable,
+					  MALI_C720_PARAMS_DECOMPANDER_MASK_ENABLE);
+
+	lut_addr = mali_c720_reg_addr(target->base, &decompander->lut_x);
+	mali_c720_lut_u32_write_updated(ctx, lut_addr,
+					params->lut_x,
+					ARRAY_SIZE(params->lut_x),
+					MALI_C720_PARAMS_DECOMPANDER_MASK_LUT_X);
+
+	lut_addr = mali_c720_reg_addr(target->base, &decompander->lut_y);
+	mali_c720_lut_u32_write_updated(ctx, lut_addr,
+					params->lut_y,
+					ARRAY_SIZE(params->lut_y),
+					MALI_C720_PARAMS_DECOMPANDER_MASK_LUT_Y);
+}
+
+static int
+mali_c720_params_validate_color_stats(struct device *dev,
+				      const struct v4l2_isp_block_header *block)
+{
+	const struct mali_c720_params_color_stats *params =
+		(const struct mali_c720_params_color_stats *)block;
+	const u64 zone_mask = BIT_ULL(MALI_C720_PARAMS_COLOR_STATS_MASK_NODES_USED_HORIZ) |
+			      BIT_ULL(MALI_C720_PARAMS_COLOR_STATS_MASK_NODES_USED_VERT);
+	u64 updated;
+
+	if (block->size == sizeof(*block))
+		return 0;
+
+	updated = params->updated_mask & zone_mask;
+	if (!updated)
+		return 0;
+
+	if (updated != zone_mask) {
+		dev_dbg(dev, "Color stats zone dimensions must be updated together\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * Horizontal zone count must be between 3 and 32.
+	 * Vertical zone count must be between 3 and 255.
+	 * The total number of zones must not exceed MALI_C720_MAX_ZONES.
+	 */
+	if (params->nodes_used_horiz < 3 || params->nodes_used_horiz > 32 ||
+	    params->nodes_used_vert < 3 ||
+	    params->nodes_used_horiz * params->nodes_used_vert > MALI_C720_MAX_ZONES) {
+		dev_dbg(dev, "Invalid color statistics zone dimensions\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void mali_c720_params_color_stats(struct mali_c720_context *ctx,
+					 const struct mali_c720_param_target *target,
+					 union mali_c720_params_block block, bool config)
+{
+	struct mali_c720 *mali_c720 = ctx->mali_c720;
+	const struct mali_c720_pipeline_regs *pipeline = mali_c720->registers.top->pipeline;
+	const struct mali_c720_stat_color_stats_regs *stat_color_stats =
+		mali_c720->registers.modules->stat_color_stats;
+	struct mali_c720_params_color_stats *params = block.color_stats;
+	u32 weight_addr;
+
+	mali_c720_params_write_bypass(ctx, mali_c720->top_base,
+				      &pipeline->color_stats_0_mux_sel, block.header);
+
+	if (!config || !params->updated_mask)
+		return;
+
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_color_stats->awb_nodes_used_horiz,
+					  params->nodes_used_horiz,
+					  MALI_C720_PARAMS_COLOR_STATS_MASK_NODES_USED_HORIZ);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_color_stats->awb_nodes_used_vert,
+					  params->nodes_used_vert,
+					  MALI_C720_PARAMS_COLOR_STATS_MASK_NODES_USED_VERT);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_color_stats->awb_stats_mode,
+					  params->awb_stats_mode,
+					  MALI_C720_PARAMS_COLOR_STATS_MASK_AWB_STATS_MODE);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_color_stats->white_level_awb,
+					  params->white_level_awb,
+					  MALI_C720_PARAMS_COLOR_STATS_MASK_WHITE_LEVEL_AWB);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_color_stats->black_level_awb,
+					  params->black_level_awb,
+					  MALI_C720_PARAMS_COLOR_STATS_MASK_BLACK_LEVEL_AWB);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_color_stats->cr_ref_max_awb,
+					  params->cr_ref_max_awb,
+					  MALI_C720_PARAMS_COLOR_STATS_MASK_CR_REF_MAX_AWB);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_color_stats->cr_ref_min_awb,
+					  params->cr_ref_min_awb,
+					  MALI_C720_PARAMS_COLOR_STATS_MASK_CR_REF_MIN_AWB);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_color_stats->cr_ref_high_awb,
+					  params->cr_ref_high_awb,
+					  MALI_C720_PARAMS_COLOR_STATS_MASK_CR_REF_HIGH_AWB);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_color_stats->cr_ref_low_awb,
+					  params->cr_ref_low_awb,
+					  MALI_C720_PARAMS_COLOR_STATS_MASK_CR_REF_LOW_AWB);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_color_stats->cb_ref_max_awb,
+					  params->cb_ref_max_awb,
+					  MALI_C720_PARAMS_COLOR_STATS_MASK_CB_REF_MAX_AWB);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_color_stats->cb_ref_min_awb,
+					  params->cb_ref_min_awb,
+					  MALI_C720_PARAMS_COLOR_STATS_MASK_CB_REF_MIN_AWB);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_color_stats->cb_ref_high_awb,
+					  params->cb_ref_high_awb,
+					  MALI_C720_PARAMS_COLOR_STATS_MASK_CB_REF_HIGH_AWB);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_color_stats->cb_ref_low_awb,
+					  params->cb_ref_low_awb,
+					  MALI_C720_PARAMS_COLOR_STATS_MASK_CB_REF_LOW_AWB);
+
+	weight_addr = mali_c720_reg_addr(target->base, &stat_color_stats->awb_weight);
+	mali_c720_lut_u8_write_updated(ctx, weight_addr,
+				       params->weights,
+				       ARRAY_SIZE(params->weights),
+				       MALI_C720_PARAMS_COLOR_STATS_MASK_WEIGHTS);
+}
+
+static int
+mali_c720_params_validate_histogram(struct device *dev,
+				    const struct v4l2_isp_block_header *block)
+{
+	const struct mali_c720_params_histogram *params =
+		(const struct mali_c720_params_histogram *)block;
+	const u64 zone_mask = BIT_ULL(MALI_C720_PARAMS_HISTOGRAM_MASK_NODES_USED_HORIZ) |
+			      BIT_ULL(MALI_C720_PARAMS_HISTOGRAM_MASK_NODES_USED_VERT);
+	u64 updated;
+
+	if (block->size == sizeof(*block))
+		return 0;
+
+	updated = params->updated_mask & zone_mask;
+	if (updated && updated != zone_mask) {
+		dev_dbg(dev, "Histogram zone dimensions must be updated together\n");
+		return -EINVAL;
+	}
+
+	if (updated && (!params->nodes_used_horiz || !params->nodes_used_vert ||
+			params->nodes_used_horiz * params->nodes_used_vert >
+			MALI_C720_MAX_ZONES)) {
+		dev_dbg(dev, "Invalid histogram zone dimensions\n");
+		return -EINVAL;
+	}
+
+	if (mali_c720_params_updated(params, MALI_C720_PARAMS_HISTOGRAM_MASK_SKIP_X) &&
+	    params->skip_x > MALI_C720_HISTOGRAM_SKIP_X_EVERY_9TH) {
+		dev_dbg(dev, "Invalid histogram horizontal skip selection\n");
+		return -EINVAL;
+	}
+
+	if (mali_c720_params_updated(params, MALI_C720_PARAMS_HISTOGRAM_MASK_SKIP_Y) &&
+	    params->skip_y > MALI_C720_HISTOGRAM_SKIP_Y_EVERY_9TH) {
+		dev_dbg(dev, "Invalid histogram vertical skip selection\n");
+		return -EINVAL;
+	}
+
+	if (mali_c720_params_updated(params, MALI_C720_PARAMS_HISTOGRAM_MASK_SCALE_BOTTOM) &&
+	    params->scale_bottom > MALI_C720_HISTOGRAM_SCALE_16X) {
+		dev_dbg(dev, "Invalid histogram bottom scale selection\n");
+		return -EINVAL;
+	}
+
+	if (mali_c720_params_updated(params, MALI_C720_PARAMS_HISTOGRAM_MASK_SCALE_TOP) &&
+	    params->scale_top > MALI_C720_HISTOGRAM_SCALE_16X) {
+		dev_dbg(dev, "Invalid histogram top scale selection\n");
+		return -EINVAL;
+	}
+
+	if (mali_c720_params_updated(params, MALI_C720_PARAMS_HISTOGRAM_MASK_PLANE_MODE) &&
+	    (params->plane_mode == 3 || params->plane_mode > MALI_C720_HISTOGRAM_FOCUS_11)) {
+		dev_dbg(dev, "Invalid histogram plane mode\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void mali_c720_params_histogram(struct mali_c720_context *ctx,
+				       const struct mali_c720_param_target *target,
+				       union mali_c720_params_block block, bool config)
+{
+	struct mali_c720 *mali_c720 = ctx->mali_c720;
+	const struct mali_c720_pipeline_regs *pipeline = mali_c720->registers.top->pipeline;
+	const struct mali_c720_stat_histogram_regs *stat_histogram =
+		mali_c720->registers.modules->stat_histogram;
+	struct mali_c720_params_histogram *params = block.histogram;
+	u32 weight_addr;
+
+	switch (block.header->type) {
+	case MALI_C720_PARAM_BLOCK_HISTOGRAM_INP:
+		mali_c720_params_write_bypass(ctx, mali_c720->top_base,
+					      &pipeline->histogram_0_mux_sel, block.header);
+		break;
+	case MALI_C720_PARAM_BLOCK_HISTOGRAM_HV:
+		mali_c720_params_write_bypass(ctx, mali_c720->top_base,
+					      &pipeline->histogram_1_mux_sel, block.header);
+		break;
+	case MALI_C720_PARAM_BLOCK_HISTOGRAM_HV_IRIDIX:
+		mali_c720_params_write_bypass(ctx, mali_c720->top_base,
+					      &pipeline->histogram_2_mux_sel, block.header);
+		break;
+	default:
+		return;
+	}
+
+	if (!config || !params->updated_mask)
+		return;
+
+	if (block.header->type == MALI_C720_PARAM_BLOCK_HISTOGRAM_HV) {
+		mali_c720_ctx_group_write_updated(ctx, mali_c720->top_base,
+						  &pipeline->histogram_1_stream_mux_sel,
+						  params->stream_mux_select,
+						  MALI_C720_PARAMS_HISTOGRAM_MASK_STREAM_MUX_SEL);
+	}
+
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_histogram->nodes_used_horiz,
+					  params->nodes_used_horiz,
+					  MALI_C720_PARAMS_HISTOGRAM_MASK_NODES_USED_HORIZ);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_histogram->nodes_used_vert,
+					  params->nodes_used_vert,
+					  MALI_C720_PARAMS_HISTOGRAM_MASK_NODES_USED_VERT);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_histogram->skip_x,
+					  params->skip_x,
+					  MALI_C720_PARAMS_HISTOGRAM_MASK_SKIP_X);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_histogram->skip_y,
+					  params->skip_y,
+					  MALI_C720_PARAMS_HISTOGRAM_MASK_SKIP_Y);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_histogram->offset_x,
+					  params->offset_x,
+					  MALI_C720_PARAMS_HISTOGRAM_MASK_OFFSET_X);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_histogram->offset_y,
+					  params->offset_y,
+					  MALI_C720_PARAMS_HISTOGRAM_MASK_OFFSET_Y);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_histogram->scale_bottom,
+					  params->scale_bottom,
+					  MALI_C720_PARAMS_HISTOGRAM_MASK_SCALE_BOTTOM);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_histogram->scale_top,
+					  params->scale_top,
+					  MALI_C720_PARAMS_HISTOGRAM_MASK_SCALE_TOP);
+	mali_c720_ctx_group_write_updated(ctx, target->base,
+					  &stat_histogram->plane_mode,
+					  params->plane_mode,
+					  MALI_C720_PARAMS_HISTOGRAM_MASK_PLANE_MODE);
+
+	weight_addr = mali_c720_reg_addr(target->base, &stat_histogram->weight);
+	mali_c720_lut_u8_write_updated(ctx, weight_addr,
+				       params->weights,
+				       ARRAY_SIZE(params->weights),
+				       MALI_C720_PARAMS_HISTOGRAM_MASK_WEIGHTS);
+}
+
+static const mali_c720_params_handler mali_c720_params_handlers[] = {
+	[MALI_C720_PARAM_BLOCK_DIGITAL_GAIN_INP] = &mali_c720_params_input_digital_gain,
+	[MALI_C720_PARAM_BLOCK_AWB_GAINS_HV] = &mali_c720_params_awb_gains,
+	[MALI_C720_PARAM_BLOCK_BLACK_LEVEL_HV] = &mali_c720_params_black_level,
+	[MALI_C720_PARAM_BLOCK_SQRT_INP] = &mali_c720_params_sqrt_a,
+	[MALI_C720_PARAM_BLOCK_SQRT_HV] = &mali_c720_params_sqrt_b,
+	[MALI_C720_PARAM_BLOCK_SQUARE_A_HV] = &mali_c720_params_square_a,
+	[MALI_C720_PARAM_BLOCK_SQUARE_B_HV] = &mali_c720_params_square_b,
+	[MALI_C720_PARAM_BLOCK_DECOMPANDER_INP] = &mali_c720_params_decompander,
+	[MALI_C720_PARAM_BLOCK_COLOR_STATS_HV] = &mali_c720_params_color_stats,
+	[MALI_C720_PARAM_BLOCK_HISTOGRAM_INP] = &mali_c720_params_histogram,
+	[MALI_C720_PARAM_BLOCK_HISTOGRAM_HV] = &mali_c720_params_histogram,
+	[MALI_C720_PARAM_BLOCK_HISTOGRAM_HV_IRIDIX] = &mali_c720_params_histogram,
+};
+
+static const struct v4l2_isp_params_block_type_info
+mali_c720_params_block_types_info[MALI_C720_PARAM_BLOCK_MAX] = {
+	[MALI_C720_PARAM_BLOCK_DIGITAL_GAIN_INP] = {
+		.size = sizeof(struct mali_c720_params_digital_gain),
+	},
+	[MALI_C720_PARAM_BLOCK_AWB_GAINS_HV] = {
+		.size = sizeof(struct mali_c720_params_awb_gains),
+	},
+	[MALI_C720_PARAM_BLOCK_BLACK_LEVEL_HV] = {
+		.size = sizeof(struct mali_c720_params_black_level),
+	},
+	[MALI_C720_PARAM_BLOCK_SQRT_INP] = {
+		.size = sizeof(struct mali_c720_params_sqrt),
+	},
+	[MALI_C720_PARAM_BLOCK_SQRT_HV] = {
+		.size = sizeof(struct mali_c720_params_sqrt),
+	},
+	[MALI_C720_PARAM_BLOCK_SQUARE_A_HV] = {
+		.size = sizeof(struct mali_c720_params_square),
+	},
+	[MALI_C720_PARAM_BLOCK_SQUARE_B_HV] = {
+		.size = sizeof(struct mali_c720_params_square),
+	},
+	[MALI_C720_PARAM_BLOCK_DECOMPANDER_INP] = {
+		.size = sizeof(struct mali_c720_params_decompander),
+		.block_validate = mali_c720_params_validate_decompander,
+	},
+	[MALI_C720_PARAM_BLOCK_COLOR_STATS_HV] = {
+		.size = sizeof(struct mali_c720_params_color_stats),
+		.block_validate = mali_c720_params_validate_color_stats,
+	},
+	[MALI_C720_PARAM_BLOCK_HISTOGRAM_INP] = {
+		.size = sizeof(struct mali_c720_params_histogram),
+		.block_validate = mali_c720_params_validate_histogram,
+	},
+	[MALI_C720_PARAM_BLOCK_HISTOGRAM_HV] = {
+		.size = sizeof(struct mali_c720_params_histogram),
+		.block_validate = mali_c720_params_validate_histogram,
+	},
+	[MALI_C720_PARAM_BLOCK_HISTOGRAM_HV_IRIDIX] = {
+		.size = sizeof(struct mali_c720_params_histogram),
+		.block_validate = mali_c720_params_validate_histogram,
+	},
+};
+
+static_assert(ARRAY_SIZE(mali_c720_params_handlers) ==
+	      ARRAY_SIZE(mali_c720_params_block_types_info));
+
+static int
+mali_c720_params_validate_block(struct mali_c720 *mali_c720,
+				union mali_c720_params_block block)
+{
+	const struct mali_c720_param_target *target;
+
+	target = mali_c720_params_get_target(&mali_c720->params, block.header->type);
+	if (!target) {
+		dev_dbg(mali_c720->dev,
+			"Parameters block targets unavailable module\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+void mali_c720_params_apply_config(struct mali_c720 *mali_c720,
+				   struct mali_c720_params_buf *buf)
+{
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+	struct mali_c720_params *params = &mali_c720->params;
+	struct v4l2_isp_params_buffer *buffer;
+	size_t block_offset = 0;
+	size_t max_offset;
+
+	buffer = buf->config;
+	max_offset = buffer->data_size;
+
+	/*
+	 * Walk the list of parameter blocks and process them. No validation is
+	 * done here, as the contents of the config buffer are already checked
+	 * in .buf_prepare().
+	 */
+	while (block_offset < max_offset) {
+		mali_c720_params_handler handler;
+		const struct mali_c720_param_target *target;
+		union mali_c720_params_block block = {
+			.data = &buffer->data[block_offset],
+		};
+		bool config = true;
+
+		target = mali_c720_params_get_target(params, block.header->type);
+
+		/* We checked the array index already in .buf_prepare() */
+		handler = mali_c720_params_handlers[block.header->type];
+		if (!target) {
+			dev_warn_once(mali_c720->dev,
+				      "params target unexpectedly unavailable during write\n");
+			block_offset += block.header->size;
+			continue;
+		}
+
+		if ((block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) &&
+		    block.header->size == sizeof(*block.header))
+			config = false;
+
+		handler(ctx, target, block, config);
+
+		block_offset += block.header->size;
+	}
+}
+
+static int mali_c720_params_enum_fmt_meta_out(struct file *file, void *fh,
+					      struct v4l2_fmtdesc *f)
+{
+	if (f->index)
+		return -EINVAL;
+
+	if (f->mbus_code && f->mbus_code != MEDIA_BUS_FMT_METADATA_FIXED)
+		return -EINVAL;
+
+	f->pixelformat = V4L2_META_FMT_MALI_C720_PARAMS;
+
+	return 0;
+}
+
+static int mali_c720_params_g_fmt_meta_out(struct file *file, void *fh,
+					   struct v4l2_format *f)
+{
+	static const struct v4l2_meta_format mfmt = {
+		.dataformat = V4L2_META_FMT_MALI_C720_PARAMS,
+		.buffersize = v4l2_isp_buffer_size(MALI_C720_PARAMS_MAX_SIZE),
+	};
+
+	f->fmt.meta = mfmt;
+
+	return 0;
+}
+
+static int mali_c720_params_querycap(struct file *file,
+				     void *priv, struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, MALI_C720_DRIVER_NAME, sizeof(cap->driver));
+	strscpy(cap->card, "ARM Mali-C720 ISP", sizeof(cap->card));
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops mali_c720_params_v4l2_ioctl_ops = {
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_streamon = mali_c720_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_enum_fmt_meta_out = mali_c720_params_enum_fmt_meta_out,
+	.vidioc_g_fmt_meta_out = mali_c720_params_g_fmt_meta_out,
+	.vidioc_s_fmt_meta_out = mali_c720_params_g_fmt_meta_out,
+	.vidioc_try_fmt_meta_out = mali_c720_params_g_fmt_meta_out,
+	.vidioc_querycap = mali_c720_params_querycap,
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static const struct v4l2_file_operations mali_c720_params_v4l2_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = video_ioctl2,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.poll = vb2_fop_poll,
+	.mmap = vb2_fop_mmap,
+};
+
+static int
+mali_c720_params_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
+			     unsigned int *num_planes, unsigned int sizes[],
+			     struct device *alloc_devs[])
+{
+	if (*num_planes && *num_planes > 1)
+		return -EINVAL;
+
+	if (sizes[0] && sizes[0] <
+	    v4l2_isp_buffer_size(MALI_C720_PARAMS_MAX_SIZE))
+		return -EINVAL;
+
+	*num_planes = 1;
+
+	if (!sizes[0])
+		sizes[0] = v4l2_isp_buffer_size(MALI_C720_PARAMS_MAX_SIZE);
+
+	return 0;
+}
+
+static int mali_c720_params_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct mali_c720_params_buf *buf = to_mali_c720_params_buf(vbuf);
+
+	buf->config = kvmalloc(v4l2_isp_buffer_size(MALI_C720_PARAMS_MAX_SIZE),
+			       GFP_KERNEL);
+	if (!buf->config)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void mali_c720_params_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct mali_c720_params_buf *buf = to_mali_c720_params_buf(vbuf);
+
+	kvfree(buf->config);
+	buf->config = NULL;
+}
+
+static int mali_c720_params_buf_prepare(struct vb2_buffer *vb)
+{
+	struct mali_c720_params *params = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct mali_c720_params_buf *buf = to_mali_c720_params_buf(vbuf);
+	struct mali_c720 *mali_c720 = params->mali_c720;
+	struct v4l2_isp_params_buffer *config = vb2_plane_vaddr(vb, 0);
+	struct dma_buf *dbuf = vb->planes[0].dbuf;
+	size_t block_offset = 0;
+	int ret;
+
+	ret = v4l2_isp_params_validate_buffer_size(mali_c720->dev,
+						   vb,
+						   v4l2_isp_buffer_size
+						   (MALI_C720_PARAMS_MAX_SIZE));
+	if (ret)
+		return ret;
+
+	if (dbuf) {
+		ret = dma_buf_begin_cpu_access(dbuf, DMA_FROM_DEVICE);
+		if (ret)
+			return ret;
+	}
+
+	/*
+	 * Copy the parameters buffer provided by userspace to the internal
+	 * scratch buffer. This protects against the chance of userspace making
+	 * changes to the buffer content whilst the driver processes it.
+	 */
+	memcpy(buf->config, config,
+	       v4l2_isp_buffer_size(MALI_C720_PARAMS_MAX_SIZE));
+
+	if (dbuf) {
+		ret = dma_buf_end_cpu_access(dbuf, DMA_FROM_DEVICE);
+		if (ret)
+			return ret;
+	}
+
+	ret = v4l2_isp_params_validate_buffer(mali_c720->dev, vb, buf->config,
+					      mali_c720_params_block_types_info,
+					      ARRAY_SIZE(mali_c720_params_block_types_info));
+	if (ret)
+		return ret;
+
+	while (block_offset < buf->config->data_size) {
+		union mali_c720_params_block block = {
+			.data = &buf->config->data[block_offset],
+		};
+
+		ret = mali_c720_params_validate_block(mali_c720, block);
+		if (ret)
+			return ret;
+
+		block_offset += block.header->size;
+	}
+
+	return 0;
+}
+
+static void mali_c720_params_buf_queue(struct vb2_buffer *vb)
+{
+	struct mali_c720_params *params = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct mali_c720_params_buf *buf = to_mali_c720_params_buf(vbuf);
+	struct mali_c720 *mali_c720 = params->mali_c720;
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+
+	scoped_guard(spinlock, &params->buffers.lock)
+		list_add_tail(&buf->queue, &params->buffers.input);
+
+	if (!mali_c720_params_uses_requests(params))
+		mali_c720_try_schedule_frame(ctx);
+}
+
+static void mali_c720_buf_request_complete(struct vb2_buffer *vb)
+{
+}
+
+bool mali_c720_params_uses_requests(struct mali_c720_params *params)
+{
+	return video_is_registered(&params->vdev) &&
+	       vb2_is_streaming(&params->queue) &&
+	       params->queue.uses_requests;
+}
+
+struct media_request *mali_c720_params_get_request(struct mali_c720_params *params)
+{
+	struct mali_c720_params_buf *buf;
+
+	if (!mali_c720_params_uses_requests(params))
+		return NULL;
+
+	guard(spinlock)(&params->buffers.lock);
+
+	buf = list_first_entry_or_null(&params->buffers.input,
+				       struct mali_c720_params_buf, queue);
+
+	return buf ? buf->vb.vb2_buf.request : NULL;
+}
+
+struct mali_c720_params_buf *
+mali_c720_params_get_next_buffer(struct mali_c720_params *params,
+				 struct media_request *req)
+{
+	struct mali_c720_params_buf *buf;
+
+	if (!video_is_registered(&params->vdev))
+		return NULL;
+
+	if (!vb2_is_streaming(&params->queue))
+		return NULL;
+
+	scoped_guard(spinlock, &params->buffers.lock) {
+		buf = list_first_entry_or_null(&params->buffers.input,
+					       struct mali_c720_params_buf, queue);
+		if (!buf || (buf->vb.vb2_buf.request &&
+			     buf->vb.vb2_buf.request != req))
+			return NULL;
+
+		list_move_tail(&buf->queue, &params->buffers.processing);
+	}
+
+	return buf;
+}
+
+void mali_c720_params_buffer_done(struct mali_c720_params *params, bool success)
+{
+	struct mali_c720 *mali_c720 = params->mali_c720;
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+	struct mali_c720_params_buf *buf;
+
+	if (!video_is_registered(&params->vdev))
+		return;
+
+	if (!vb2_is_streaming(&params->queue))
+		return;
+
+	scoped_guard(spinlock, &params->buffers.lock) {
+		buf = list_first_entry_or_null(&params->buffers.processing,
+					       struct mali_c720_params_buf, queue);
+		if (!buf)
+			return;
+
+		if (success) {
+			buf->vb.vb2_buf.timestamp = ctx->timestamp;
+			buf->vb.sequence = ctx->frame_sequence;
+		}
+
+		vb2_buffer_done(&buf->vb.vb2_buf,
+				success ? VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR);
+		list_del(&buf->queue);
+	}
+}
+
+static void mali_c720_params_return_buffers(struct mali_c720_params *params,
+					    enum vb2_buffer_state state)
+{
+	struct mali_c720_params_buf *buf, *tmp;
+
+	guard(spinlock) (&params->buffers.lock);
+
+	list_for_each_entry_safe(buf, tmp, &params->buffers.input, queue) {
+		list_del(&buf->queue);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+
+	list_for_each_entry_safe(buf, tmp, &params->buffers.processing, queue) {
+		list_del(&buf->queue);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+}
+
+static int mali_c720_params_start_streaming(struct vb2_queue *q,
+					    unsigned int count)
+{
+	struct mali_c720_params *params = vb2_get_drv_priv(q);
+	struct mali_c720 *mali_c720 = params->mali_c720;
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+	struct v4l2_subdev *isp_sd = &mali_c720->isp.mdev.sd;
+	int ret;
+
+	guard(mutex)(&mali_c720->device_lock);
+
+	if (!media_devnode_is_registered(mali_c720->media_dev.devnode)) {
+		ret = -ENODEV;
+		goto err_return_buffers;
+	}
+
+	ret = pm_runtime_resume_and_get(mali_c720->dev);
+	if (ret)
+		goto err_return_buffers;
+
+	ret = video_device_pipeline_start(&params->vdev, &mali_c720->pipe);
+	if (ret)
+		goto err_pm_put;
+
+	ret = mali_c720_alloc_context(ctx);
+	if (ret)
+		goto err_stop_video_pipeline;
+
+	ret = mali_c720_pipeline_ready(mali_c720);
+	if (ret && ret != -EAGAIN)
+		goto err_free_context;
+
+	if (!ret) {
+		ret = v4l2_subdev_enable_streams(isp_sd,
+						 MALI_C720_ISP_PAD_SOURCE_HV,
+						 BIT(0));
+		if (ret)
+			goto err_free_context;
+	}
+
+	return 0;
+
+err_free_context:
+	mali_c720_free_context(ctx);
+err_stop_video_pipeline:
+	video_device_pipeline_stop(&params->vdev);
+err_pm_put:
+	pm_runtime_put(mali_c720->dev);
+err_return_buffers:
+	mali_c720_params_return_buffers(params, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static void mali_c720_params_stop_streaming(struct vb2_queue *q)
+{
+	struct mali_c720_params *params = vb2_get_drv_priv(q);
+	struct mali_c720 *mali_c720 = params->mali_c720;
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+	struct mali_c720_isp *isp = &mali_c720->isp;
+	struct v4l2_subdev *isp_sd = &isp->mdev.sd;
+
+	guard(mutex)(&mali_c720->device_lock);
+
+	v4l2_subdev_disable_streams(isp_sd, MALI_C720_ISP_PAD_SOURCE_HV,
+				    BIT(0));
+	mali_c720_free_context(ctx);
+
+	video_device_pipeline_stop(&params->vdev);
+	mali_c720_params_return_buffers(params, VB2_BUF_STATE_ERROR);
+
+	pm_runtime_put_autosuspend(mali_c720->dev);
+}
+
+static const struct vb2_ops mali_c720_params_vb2_ops = {
+	.queue_setup = mali_c720_params_queue_setup,
+	.buf_init = mali_c720_params_buf_init,
+	.buf_cleanup = mali_c720_params_buf_cleanup,
+	.buf_prepare = mali_c720_params_buf_prepare,
+	.buf_queue = mali_c720_params_buf_queue,
+	.buf_request_complete = mali_c720_buf_request_complete,
+	.start_streaming = mali_c720_params_start_streaming,
+	.stop_streaming = mali_c720_params_stop_streaming,
+};
+
+void mali_c720_unregister_params(struct mali_c720 *mali_c720)
+{
+	struct mali_c720_params *params = &mali_c720->params;
+
+	if (!video_is_registered(&params->vdev))
+		return;
+
+	vb2_video_unregister_device(&params->vdev);
+}
+
+void mali_c720_cleanup_params(struct mali_c720 *mali_c720)
+{
+	struct mali_c720_params *params = &mali_c720->params;
+
+	if (!params->mali_c720)
+		return;
+
+	v4l2_ctrl_handler_free(&params->ctrls.handler);
+	media_entity_cleanup(&params->vdev.entity);
+	mutex_destroy(&params->lock);
+	params->mali_c720 = NULL;
+}
+
+int mali_c720_register_params(struct mali_c720 *mali_c720)
+{
+	struct mali_c720_params *params = &mali_c720->params;
+	struct video_device *vdev = &params->vdev;
+	struct vb2_queue *vb2q = &params->queue;
+	u32 dims[V4L2_CTRL_MAX_DIMS] = { 0 };
+	int ret;
+
+	params->mali_c720 = mali_c720;
+	mutex_init(&params->lock);
+	ret = mali_c720_params_build_target_cache(mali_c720);
+	if (ret) {
+		dev_err(mali_c720->dev,
+			"failed to build params target cache\n");
+		goto err_destroy_mutex;
+	}
+
+	INIT_LIST_HEAD(&params->buffers.input);
+	INIT_LIST_HEAD(&params->buffers.processing);
+	spin_lock_init(&params->buffers.lock);
+
+	ret = v4l2_ctrl_handler_init(&params->ctrls.handler, 1);
+	if (ret)
+		goto err_destroy_mutex;
+
+	params->ctrls.param_capabilities =
+		v4l2_ctrl_new_custom(&params->ctrls.handler,
+				     &mali_c720_params_caps_ctrl, NULL);
+	if (params->ctrls.param_capabilities) {
+		dims[0] = params->num_targets;
+		ret = v4l2_ctrl_modify_dimensions(params->ctrls.param_capabilities,
+						  dims);
+		if (ret)
+			goto err_free_ctrl_handler;
+	}
+
+	if (params->ctrls.handler.error) {
+		ret = params->ctrls.handler.error;
+		goto err_free_ctrl_handler;
+	}
+
+	params->pad.flags = MEDIA_PAD_FL_SOURCE | MEDIA_PAD_FL_MUST_CONNECT;
+	ret = media_entity_pads_init(&params->vdev.entity, 1, &params->pad);
+	if (ret)
+		goto err_free_ctrl_handler;
+
+	vb2q->type = V4L2_BUF_TYPE_META_OUTPUT;
+	vb2q->io_modes = VB2_MMAP | VB2_DMABUF;
+	vb2q->drv_priv = params;
+	vb2q->mem_ops = &vb2_vmalloc_memops;
+	vb2q->ops = &mali_c720_params_vb2_ops;
+	vb2q->buf_struct_size = sizeof(struct mali_c720_params_buf);
+	vb2q->min_queued_buffers = 0;
+	vb2q->supports_requests = 1;
+	vb2q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	vb2q->lock = &params->lock;
+	vb2q->dev = mali_c720->dev;
+
+	ret = vb2_queue_init(vb2q);
+	if (ret) {
+		dev_err(mali_c720->dev, "params vb2 queue init failed\n");
+		goto err_cleanup_entity;
+	}
+
+	strscpy(params->vdev.name, "mali-c720 3a params",
+		sizeof(params->vdev.name));
+	vdev->release = video_device_release_empty;
+	vdev->fops = &mali_c720_params_v4l2_fops;
+	vdev->ioctl_ops = &mali_c720_params_v4l2_ioctl_ops;
+	vdev->lock = &params->lock;
+	vdev->v4l2_dev = &mali_c720->v4l2_dev;
+	vdev->queue = &params->queue;
+	vdev->ctrl_handler = &params->ctrls.handler;
+	vdev->device_caps = V4L2_CAP_META_OUTPUT |
+			    V4L2_CAP_STREAMING |
+			    V4L2_CAP_IO_MC;
+	vdev->vfl_dir = VFL_DIR_TX;
+	video_set_drvdata(vdev, params);
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(mali_c720->dev,
+			"failed to register params video device\n");
+		goto err_release_vb2q;
+	}
+
+	return 0;
+
+err_release_vb2q:
+	vb2_queue_release(vb2q);
+err_cleanup_entity:
+	media_entity_cleanup(&params->vdev.entity);
+err_free_ctrl_handler:
+	v4l2_ctrl_handler_free(&params->ctrls.handler);
+err_destroy_mutex:
+	mutex_destroy(&params->lock);
+	params->mali_c720 = NULL;
+
+	return ret;
+}

-- 
2.55.0

