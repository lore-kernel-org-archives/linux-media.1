Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102724;
	b=wy8eFrLAoekTmgd2hNb8ToBLYOkF4h8we5LlOEyprSoxdL7GZLdZmhddIeXm5I5ONiwM
	 JSBH/Lz3JIMomC8plCSRvZNEnPftnpsjMCL5tl2opPhplnVWBqHaLGJXo/TKuHJTdAnM6
	 Nhq4Xl0104y3kQc497CQ8Mv8csvTSruJsuy7QNRXyQAQWehFfKa0tX9i1yOTe/sosSPRx
	 4gblI+7i4O8xEAOK4kbisIH7POtzrVG59RjMu8aHgav7SX8FBB7w2i+LkCDiEzlOd8HYs
	 r57ZFTP9HY7JIdZa/FZNPFrdWfN3UpY0DUKkfLQze0jfkCdjd3pOiU1x/7PhfiIeHZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102724;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DuSGSuNYHChP7yZXuxkMpEIFyIL38ed1I/EdpuALIvU=;
	b=vJ3jlDy8e4vlR8SBnmk2gKn9LFO7K9n1aRVzLDzL+gyA/tvMa7adNGHnU1fT7R74QvNu
	 03Nfr+bkvM8+CY3fygq8QAR6CqaE5wiLxKaTZo1tPragcZwz2o3xyxJxQ5Qoh84yMy9jy
	 aSZv2vhWGy2dxLAcduv6p6wg/WeqGNKGX3tfdC3LCopCN0X+u6fXrM7FxK4Qru5OQc4by
	 Ezug1SqWm++79HVn+OXRKDvbXBrn2k+Qkgyh/2C0rXEcbxQWGNmtiiW4xXPmvwY/yRcwg
	 2ebNs3GcksJl3ZGUz/rt6uH3A1OU9sCZ3MRj+mpAqGrt9yvEizw2mlNr8oVIakfTskQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hjMF53jc;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9073B60A263D;
	Thu, 19 Nov 2026 15:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9073B60A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hjMF53jc
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 094811C0A;
	Thu, 19 Nov 2026 07:38:39 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B21B3F882;
	Thu, 19 Nov 2026 07:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102722; bh=4WX5JL4Keo2Zxb5/WOxRUXFStJ2vpfzY20F3jDaUl1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hjMF53jchAzClv/MsTZCQaOvb43lUraf46jsD/zmVdJqbp893KIx2F8OI5o/L7/Wf
	 BnmZBwwFfyWwI3ychtQaplbEzsGNT2DqmUfmDDMNFUPvUcfzhjLn5/ct/CwYJAsNh+
	 P0Vn6s9lHkqTOvzGfrFqS1pN/2wG2TfrR5bJFTJI=
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
Subject: [RFC PATCH 08/28] media: mali-vpu: register V76 decoder controls and introduce UAPI controls
Date: Thu, 19 Nov 2026 15:37:38 +0000
Message-ID: <20261119153758.1426673-9-charvi.mehta@arm.com>
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

Register a V4L2 control handler for each decoder session and attach it to
the session file handle. Describe the controls supported by V76 in the
variant data and maintain their values in per-session state.

Add Mali VPU userspace controls for NALU layout, stream escaping,
intermediate buffer size, stream-header handling, frame reordering and
firmware debug output. Also expose the standard read-only
V4L2_CID_MIN_BUFFERS_FOR_CAPTURE control.

Stage control values set before the firmware is ready and reject changes to
non-dynamic controls while the OUTPUT queue is streaming. Allow userspace
to subscribe to control events.

Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 drivers/media/platform/arm/mali-vpu/Makefile  |   3 +-
 .../platform/arm/mali-vpu/mali-vpu-controls.c | 339 ++++++++++++++++++
 .../platform/arm/mali-vpu/mali-vpu-controls.h |  71 ++++
 .../platform/arm/mali-vpu/mali-vpu-dec.c      |  44 +++
 .../platform/arm/mali-vpu/mali-vpu-dec.h      |   6 +
 .../platform/arm/mali-vpu/mali-vpu-session.c  |  15 +
 .../platform/arm/mali-vpu/mali-vpu-session.h  |  14 +
 .../arm/mali-vpu/mali-vpu-variant-v76.c       |  99 +++++
 .../platform/arm/mali-vpu/mali-vpu-variant.h  |  13 +
 .../platform/arm/mali-vpu/mali-vpu-vidioc.c   |  19 +
 .../uapi/linux/media/arm/mali-vpu-config.h    |  47 +++
 include/uapi/linux/v4l2-controls.h            |   6 +
 12 files changed, 675 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-controls.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-controls.h
 create mode 100644 include/uapi/linux/media/arm/mali-vpu-config.h

diff --git a/drivers/media/platform/arm/mali-vpu/Makefile b/drivers/media/platform/arm/mali-vpu/Makefile
index 1dc62621d9dc0..95bad821eb466 100644
--- a/drivers/media/platform/arm/mali-vpu/Makefile
+++ b/drivers/media/platform/arm/mali-vpu/Makefile
@@ -7,6 +7,7 @@ mali-vpu-objs := mali-vpu-probe.o \
 		mali-vpu-dec.o \
 		mali-vpu-buffer.o \
 		mali-vpu-vb2.o \
-		mali-vpu-formats.o
+		mali-vpu-formats.o \
+		mali-vpu-controls.o
 
 obj-$(CONFIG_VIDEO_MALI_VPU) += mali-vpu.o
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-controls.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-controls.c
new file mode 100644
index 0000000000000..d4921eddf0fcf
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-controls.c
@@ -0,0 +1,339 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#include <linux/errno.h>
+#include <linux/limits.h>
+#include <linux/slab.h>
+#include <media/v4l2-mem2mem.h>
+
+#include <linux/media/arm/mali-vpu-config.h>
+
+#include "mali-vpu-controls.h"
+#include "mali-vpu-session.h"
+
+static int mali_vpu_ctrl_slot_from_cid(const struct mali_vpu_session *sess,
+				       u32 cid, u32 *slot)
+{
+	const struct mali_vpu_ctrl_state *ctrl_state = sess->ctrls_state;
+	u32 i;
+
+	for (i = 0; i < sess->num_ctrls_caps; i++) {
+		if (ctrl_state[i].cid == cid) {
+			*slot = i;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int mali_vpu_get_volatile_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct mali_vpu_session *sess = container_of(ctrl->handler,
+						     struct mali_vpu_session,
+						     ctrl_handler);
+
+	switch (ctrl->id) {
+	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
+		if (sess->role != MALI_VPU_DECODER)
+			return -EINVAL;
+		ctrl->val = sess->min_buffers_required;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mali_vpu_apply_or_stage_ctrl(struct mali_vpu_session *sess,
+					const struct mali_vpu_ctrl_desc *desc,
+					struct mali_vpu_ctrl_state *state,
+					s64 value)
+{
+	bool staged;
+	int ret;
+
+	staged = !sess->is_fw_ready;
+
+	if (!staged) {
+		ret = desc->set(sess, state->cid, value);
+		if (ret)
+			return ret;
+	}
+
+	state->value = value;
+	state->client_set = true;
+	state->is_staged = staged;
+
+	return 0;
+}
+
+static int mali_vpu_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct mali_vpu_session *sess = container_of(ctrl->handler,
+						     struct mali_vpu_session,
+						     ctrl_handler);
+	const struct mali_vpu_ctrl_desc *desc;
+	struct mali_vpu_ctrl_state *state;
+	struct vb2_queue *src_vq;
+	u32 slot;
+	int ret;
+
+	ret = mali_vpu_ctrl_slot_from_cid(sess, ctrl->id, &slot);
+	if (ret)
+		return ret;
+
+	desc = &sess->ctrls_caps[slot];
+	state = &sess->ctrls_state[slot];
+
+	src_vq = v4l2_m2m_get_src_vq(sess->m2m_ctx);
+	if (vb2_is_streaming(src_vq) &&
+	    !(desc->flags & MALI_VPU_CTRL_FLAG_DYNAMIC))
+		return -EBUSY;
+
+	return mali_vpu_apply_or_stage_ctrl(sess, desc, state, ctrl->val);
+}
+
+static const struct v4l2_ctrl_ops mali_vpu_ctrl_ops = {
+	.g_volatile_ctrl = mali_vpu_get_volatile_ctrl,
+	.s_ctrl          = mali_vpu_set_ctrl,
+};
+
+static int mali_vpu_register_control(struct mali_vpu_session *sess,
+				     const struct mali_vpu_ctrl_desc *d)
+{
+	struct v4l2_ctrl *ctrl;
+
+	if (d->is_custom) {
+		struct v4l2_ctrl_config cfg = {
+			.ops = &mali_vpu_ctrl_ops,
+			.id = d->cid,
+			.name = d->name,
+			.type = d->type,
+			.min = d->min_val,
+			.max = d->max_val,
+			.step = (d->type == V4L2_CTRL_TYPE_MENU) ? 0 : d->step_or_mask,
+			.def = d->default_val,
+			.menu_skip_mask = (d->type == V4L2_CTRL_TYPE_MENU) ? ~(d->step_or_mask) : 0,
+			.qmenu = d->qmenu,
+		};
+
+		ctrl = v4l2_ctrl_new_custom(&sess->ctrl_handler, &cfg, NULL);
+
+	} else if (d->type == V4L2_CTRL_TYPE_MENU) {
+		ctrl = v4l2_ctrl_new_std_menu(&sess->ctrl_handler,
+					      &mali_vpu_ctrl_ops,
+					      d->cid,
+					      d->max_val,
+					      ~(d->step_or_mask),
+					      d->default_val);
+	} else {
+		ctrl = v4l2_ctrl_new_std(&sess->ctrl_handler,
+					 &mali_vpu_ctrl_ops,
+					 d->cid,
+					 d->min_val,
+					 d->max_val,
+					 d->step_or_mask,
+					 d->default_val);
+	}
+
+	if (!ctrl || sess->ctrl_handler.error)
+		return sess->ctrl_handler.error ? sess->ctrl_handler.error : -EINVAL;
+
+	return 0;
+}
+
+static int mali_vpu_validate_ctrl_caps(const struct mali_vpu_session *sess)
+{
+	u32 i, j;
+
+	if (!sess->ctrls_caps || !sess->num_ctrls_caps) {
+		dev_err(sess->vpu_dev->dev, "invalid ctrl caps structure\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < sess->num_ctrls_caps; i++) {
+		const struct mali_vpu_ctrl_desc *d = &sess->ctrls_caps[i];
+
+		if (!d->cid || !d->set)
+			return -EINVAL;
+
+		if (d->min_val > d->max_val)
+			return -EINVAL;
+
+		if (d->default_val < d->min_val || d->default_val > d->max_val)
+			return -EINVAL;
+
+		if (d->is_custom && !d->name)
+			return -EINVAL;
+
+		if (d->is_custom && d->type == V4L2_CTRL_TYPE_MENU && !d->qmenu)
+			return -EINVAL;
+
+		/* Reject duplicate entries */
+		for (j = i + 1; j < sess->num_ctrls_caps; j++) {
+			if (d->cid == sess->ctrls_caps[j].cid)
+				return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+int mali_vpu_ctrls_init(struct mali_vpu_session *sess)
+{
+	const struct mali_vpu_ctrl_desc *ctrls_cap = sess->ctrls_caps;
+	struct mali_vpu_ctrl_state *ctrl_state;
+	struct v4l2_ctrl *volatile_ctrl;
+	u32 i;
+	int ret;
+
+	ret = mali_vpu_validate_ctrl_caps(sess);
+	if (ret)
+		return ret;
+
+	sess->ctrls_state = kcalloc(sess->num_ctrls_caps, sizeof(*sess->ctrls_state), GFP_KERNEL);
+	if (!sess->ctrls_state)
+		return -ENOMEM;
+
+	/*
+	 * Adding 1 to num_ctrls to include
+	 * V4L2_CID_MIN_BUFFERS_FOR_CAPTURE for decoder
+	 */
+	ret = v4l2_ctrl_handler_init(&sess->ctrl_handler, sess->num_ctrls_caps + 1);
+	if (ret)
+		goto err_free_state;
+
+	sess->ctrl_handler.lock = &sess->vq_lock;
+
+	ctrl_state = sess->ctrls_state;
+
+	for (i = 0; i < sess->num_ctrls_caps; i++) {
+		const struct mali_vpu_ctrl_desc *d = &ctrls_cap[i];
+
+		ctrl_state[i].cid = d->cid;
+		ctrl_state[i].value = d->default_val;
+		ctrl_state[i].client_set = false;
+		ctrl_state[i].is_staged = false;
+
+		ret = mali_vpu_register_control(sess, d);
+		if (ret)
+			goto err_free_handler;
+	}
+
+	if (sess->role == MALI_VPU_DECODER) {
+		volatile_ctrl = v4l2_ctrl_new_std(&sess->ctrl_handler,
+						  &mali_vpu_ctrl_ops,
+						  V4L2_CID_MIN_BUFFERS_FOR_CAPTURE,
+						  1, 32, 1, 1);
+	} else {
+		ret = -EINVAL;
+		goto err_free_handler;
+	}
+
+	if (!volatile_ctrl || sess->ctrl_handler.error) {
+		ret = sess->ctrl_handler.error ? sess->ctrl_handler.error : -EINVAL;
+		goto err_free_handler;
+	}
+
+	volatile_ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY;
+
+	sess->fh.ctrl_handler = &sess->ctrl_handler;
+
+	return 0;
+
+err_free_handler:
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
+
+err_free_state:
+	kfree(sess->ctrls_state);
+	sess->ctrls_state = NULL;
+	return ret;
+}
+
+void mali_vpu_ctrls_cleanup(struct mali_vpu_session *sess)
+{
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
+	kfree(sess->ctrls_state);
+	sess->ctrls_state = NULL;
+	sess->fh.ctrl_handler = NULL;
+}
+
+int mali_vpu_apply_staged_controls(struct mali_vpu_session *sess)
+{
+	u32 i;
+	int ret;
+
+	if (!sess->is_fw_ready)
+		return -EINVAL;
+
+	for (i = 0; i < sess->num_ctrls_caps; i++) {
+		const struct mali_vpu_ctrl_desc *d = &sess->ctrls_caps[i];
+		struct mali_vpu_ctrl_state *s = &sess->ctrls_state[i];
+
+		if (!s->client_set || !s->is_staged)
+			continue;
+
+		ret = mali_vpu_apply_or_stage_ctrl(sess, d, s, s->value);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+int mali_vpu_ctrl_set_nalu_format(struct mali_vpu_session *sess, u32 cid,
+				  s64 value)
+{
+	if (cid != V4L2_CID_MALI_VPU_NALU_FORMAT)
+		return -EINVAL;
+
+	(void)sess;
+	(void)value;
+	return 0;
+}
+
+int mali_vpu_ctrl_set_intbuf_size(struct mali_vpu_session *sess, u32 cid,
+				  s64 value)
+{
+	if (cid != V4L2_CID_MALI_VPU_INTBUF_SIZE || value < 0 || value > INT_MAX)
+		return -EINVAL;
+
+	(void)sess;
+	(void)value;
+	return 0;
+}
+
+int mali_vpu_ctrl_set_stream_escaping(struct mali_vpu_session *sess, u32 cid,
+				      s64 value)
+{
+	if (cid != V4L2_CID_MALI_VPU_STREAM_ESCAPING)
+		return -EINVAL;
+
+	if (value == -1)
+		return 0; /* tristate no-op */
+
+	if (value != 0 && value != 1)
+		return -EINVAL;
+
+	(void)sess;
+	(void)value;
+	return 0;
+}
+
+int mali_vpu_ctrl_set_host_print_enable(struct mali_vpu_session *sess, u32 cid,
+					s64 value)
+{
+	if (cid != V4L2_CID_MALI_VPU_HOST_PRINT_ENABLE)
+		return -EINVAL;
+
+	if (value != 0 && value != 1)
+		return -EINVAL;
+
+	(void)sess;
+	(void)value;
+	return 0;
+}
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-controls.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-controls.h
new file mode 100644
index 0000000000000..d7f5898963478
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-controls.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#ifndef __MALI_VPU_CONTROLS_H__
+#define __MALI_VPU_CONTROLS_H__
+
+#include <linux/bits.h>
+#include <linux/types.h>
+#include <media/v4l2-ctrls.h>
+
+struct mali_vpu_session;
+
+enum mali_vpu_ctrl_flags {
+	MALI_VPU_CTRL_FLAG_DYNAMIC	= BIT(0),
+};
+
+/**
+ * struct mali_vpu_ctrl_desc - static description of one driver control.
+ * @cid: V4L2 control ID.
+ * @type: V4L2 control type.
+ * @name: Control name used for custom registration. NULL for standard controls.
+ * @qmenu: Menu labels for V4L2_CTRL_TYPE_MENU custom controls.
+ * @min_val: Minimum allowed value for this control.
+ * @max_val: Maximum allowed value for this control.
+ * @default_val: Default value for this control at session init.
+ * @step_or_mask: Step for integer controls, or enabled-item mask for menu controls.
+ * @is_custom: Flag to indicate if a control is a custom Mali VPU control.
+ * @flags: Driver-specific behavior flags from enum mali_vpu_ctrl_flags.
+ * @set: Setter callback invoked on client control changes, to apply value to firmware.
+ */
+struct mali_vpu_ctrl_desc {
+	u32 cid;
+	enum v4l2_ctrl_type type;
+	const char *name;
+	const char * const *qmenu;
+	s64 min_val;
+	s64 max_val;
+	s64 default_val;
+	u64 step_or_mask;
+	bool is_custom;
+	enum mali_vpu_ctrl_flags flags;
+	int (*set)(struct mali_vpu_session *sess, u32 cid, s64 value);
+};
+
+/**
+ * struct mali_vpu_ctrl_state - per-session runtime state of one driver control.
+ * @cid: V4L2 control ID.
+ * @value: Last accepted value for the control (from userspace or default at init).
+ * @client_set: True if userspace explicitly set this control at least once.
+ * @is_staged: True if value is accepted but not yet sent to firmware.
+ */
+struct mali_vpu_ctrl_state {
+	u32 cid;
+	s64 value;
+	bool client_set;
+	bool is_staged;
+};
+
+int mali_vpu_ctrls_init(struct mali_vpu_session *sess);
+void mali_vpu_ctrls_cleanup(struct mali_vpu_session *sess);
+int mali_vpu_apply_staged_controls(struct mali_vpu_session *sess);
+
+/* Common controls setters */
+int mali_vpu_ctrl_set_nalu_format(struct mali_vpu_session *sess, u32 cid, s64 value);
+int mali_vpu_ctrl_set_intbuf_size(struct mali_vpu_session *sess, u32 cid, s64 value);
+int mali_vpu_ctrl_set_stream_escaping(struct mali_vpu_session *sess, u32 cid, s64 value);
+int mali_vpu_ctrl_set_host_print_enable(struct mali_vpu_session *sess, u32 cid, s64 value);
+
+#endif /* __MALI_VPU_CONTROLS_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
index cb6eeee2f04df..7e78c475a4ff3 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
@@ -3,6 +3,9 @@
  * Copyright (C) 2026 ARM Limited.
  */
 
+#include <linux/errno.h>
+#include <linux/media/arm/mali-vpu-config.h>
+
 #include "mali-vpu-dec.h"
 #include "mali-vpu-session.h"
 #include "mali-vpu-variant.h"
@@ -13,4 +16,45 @@ void mali_vpu_session_init_dec(struct mali_vpu_session *sess)
 
 	sess->port_src.supported_fmts = variant_fmts->dec_src;
 	sess->port_dst.supported_fmts = variant_fmts->dec_dst;
+
+	const struct mali_vpu_control_caps *variant_ctrls = &sess->vpu_dev->variant->ctrl_caps;
+
+	sess->ctrls_caps	= variant_ctrls->dec_ctrls;
+	sess->num_ctrls_caps	= variant_ctrls->num_dec_ctrls;
+
+	sess->min_buffers_required = 3;	/* For CAPTURE/dst queue */
+}
+
+int mali_vpu_ctrl_set_ignore_stream_headers(struct mali_vpu_session *sess,
+					    u32 cid, s64 value)
+{
+	if (cid != V4L2_CID_MALI_VPU_IGNORE_STREAM_HEADERS)
+		return -EINVAL;
+
+	if (value == -1)
+		return 0; /* tristate no-op */
+
+	if (value != 0 && value != 1)
+		return -EINVAL;
+
+	(void)sess;
+	(void)value;
+	return 0;
+}
+
+int mali_vpu_ctrl_set_frame_reordering(struct mali_vpu_session *sess, u32 cid,
+				       s64 value)
+{
+	if (cid != V4L2_CID_MALI_VPU_FRAME_REORDERING)
+		return -EINVAL;
+
+	if (value == -1)
+		return 0; /* tristate no-op */
+
+	if (value != 0 && value != 1)
+		return -EINVAL;
+
+	(void)sess;
+	(void)value;
+	return 0;
 }
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h
index 2514c897587c4..e323b38475c81 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h
@@ -6,8 +6,14 @@
 #ifndef __MALI_VPU_DEC_H__
 #define __MALI_VPU_DEC_H__
 
+#include <linux/types.h>
+
 struct mali_vpu_session;
 
 void mali_vpu_session_init_dec(struct mali_vpu_session *sess);
 
+/* Decoder controls setters */
+int mali_vpu_ctrl_set_ignore_stream_headers(struct mali_vpu_session *sess, u32 cid, s64 value);
+int mali_vpu_ctrl_set_frame_reordering(struct mali_vpu_session *sess, u32 cid, s64 value);
+
 #endif /* __MALI_VPU_DEC_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
index 6867f51287f48..d1e8680de5556 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
@@ -3,12 +3,14 @@
  * Copyright (C) 2026 ARM Limited.
  */
 
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/string.h>
 #include <media/v4l2-mem2mem.h>
 
 #include "mali-vpu-session.h"
+#include "mali-vpu-controls.h"
 #include "mali-vpu-dec.h"
 #include "mali-vpu-formats.h"
 #include "mali-vpu-variant.h"
@@ -76,8 +78,19 @@ int mali_vpu_session_init(struct mali_vpu_session *sess)
 		goto err_mutex_destroy;
 	}
 
+	sess->is_fw_ready = false;
+
+	ret = mali_vpu_ctrls_init(sess);
+	if (ret) {
+		dev_err(sess->vpu_dev->dev, "failed to initialise controls: %d\n", ret);
+		goto err_m2m_ctx_release;
+	}
+
 	return 0;
 
+err_m2m_ctx_release:
+	v4l2_m2m_ctx_release(sess->m2m_ctx);
+
 err_mutex_destroy:
 	mutex_destroy(&sess->vq_lock);
 	return ret;
@@ -94,5 +107,7 @@ void mali_vpu_session_cleanup(struct mali_vpu_session *sess)
 	}
 
 	mutex_unlock(&sess->vq_lock);
+
+	mali_vpu_ctrls_cleanup(sess);
 	mutex_destroy(&sess->vq_lock);
 }
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
index f8a602cb59006..766912aec0b8e 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/videodev2.h>
+#include <media/v4l2-ctrls.h>
 #include <media/v4l2-fh.h>
 
 #include "mali-vpu-device.h"
@@ -32,6 +33,12 @@ struct mali_vpu_port {
  * @port_src: Source (OUTPUT) port for this session.
  * @port_dst: Destination (CAPTURE) port for this session.
  * @vq_lock: Mutex lock to serialise per-session queue related ioctls.
+ * @is_fw_ready: True if the firmware is loaded and ready to accept commands.
+ * @min_buffers_required: Driver-reported minimum buffers for role-specific queue.
+ * @ctrls_caps: Variant-provided immutable control capability table.
+ * @num_ctrls_caps: Number of entries in @ctrls_caps.
+ * @ctrls_state: Per-session control cache and staging state.
+ * @ctrl_handler: V4L2 control handler bound to this session.
  * @fh: V4L2 file handle for this session.
  * @m2m_ctx: V4L2 mem2mem context for this session.
  */
@@ -41,6 +48,13 @@ struct mali_vpu_session {
 	struct mali_vpu_port		port_src;
 	struct mali_vpu_port		port_dst;
 	struct mutex			vq_lock; /* lock to serialise per-session ioctls */
+	bool				is_fw_ready;
+	u32				min_buffers_required;
+
+	const struct mali_vpu_ctrl_desc *ctrls_caps;
+	u32				num_ctrls_caps;
+	struct mali_vpu_ctrl_state	*ctrls_state;
+	struct v4l2_ctrl_handler	ctrl_handler;
 
 	struct v4l2_fh		fh;
 	struct v4l2_m2m_ctx	*m2m_ctx;
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
index 7b04b51eeedc2..b807f8d888222 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
@@ -4,8 +4,14 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/limits.h>
 #include <linux/videodev2.h>
 
+#include <linux/media/arm/mali-vpu-config.h>
+
+#include "mali-vpu-controls.h"
+#include "mali-vpu-dec.h"
 #include "mali-vpu-formats.h"
 #include "mali-vpu-protocol-def-v3.h"
 #include "mali-vpu-variant.h"
@@ -53,6 +59,95 @@ static const struct mali_vpu_format_desc mali_v76_dec_dst_fmts[] = {
 	},
 };
 
+static const char *const mali_v76_nalu_format_qmenu[] = {
+	"Start Codes",
+	"One NALU Per Buffer",
+	"One Byte Length Field",
+	"Two Byte Length Field",
+	"Four Byte Length Field",
+	NULL,
+};
+
+static const struct mali_vpu_ctrl_desc mali_v76_dec_ctrls[] = {
+	{
+		.cid = V4L2_CID_MALI_VPU_NALU_FORMAT,
+		.type = V4L2_CTRL_TYPE_MENU,
+		.name = "NALU format",
+		.qmenu = mali_v76_nalu_format_qmenu,
+		.min_val = MALI_VPU_NALU_FORMAT_START_CODES,
+		.max_val = MALI_VPU_NALU_FORMAT_FOUR_BYTE_LENGTH_FIELD,
+		.default_val = MALI_VPU_NALU_FORMAT_START_CODES,
+		.step_or_mask = BIT(MALI_VPU_NALU_FORMAT_START_CODES) |
+				BIT(MALI_VPU_NALU_FORMAT_ONE_NALU_PER_BUFFER) |
+				BIT(MALI_VPU_NALU_FORMAT_ONE_BYTE_LENGTH_FIELD) |
+				BIT(MALI_VPU_NALU_FORMAT_TWO_BYTE_LENGTH_FIELD) |
+				BIT(MALI_VPU_NALU_FORMAT_FOUR_BYTE_LENGTH_FIELD),
+		.is_custom = true,
+		.flags = 0,
+		.set = mali_vpu_ctrl_set_nalu_format,
+	},
+	{
+		.cid = V4L2_CID_MALI_VPU_INTBUF_SIZE,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Internal buffer size",
+		.min_val = 0,
+		.max_val = INT_MAX,
+		.default_val = 0,
+		.step_or_mask = 1,
+		.is_custom = true,
+		.flags = 0,
+		.set = mali_vpu_ctrl_set_intbuf_size,
+	},
+	{
+		.cid = V4L2_CID_MALI_VPU_STREAM_ESCAPING,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Stream Escaping",
+		.min_val = -1,
+		.max_val = 1,
+		.default_val = -1,
+		.step_or_mask = 1,
+		.is_custom = true,
+		.flags = 0,
+		.set = mali_vpu_ctrl_set_stream_escaping,
+	},
+	{
+		.cid = V4L2_CID_MALI_VPU_HOST_PRINT_ENABLE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.name = "Firmware debug prints",
+		.min_val = false,
+		.max_val = true,
+		.default_val = false,
+		.step_or_mask = 1,
+		.is_custom = true,
+		.flags = MALI_VPU_CTRL_FLAG_DYNAMIC,
+		.set = mali_vpu_ctrl_set_host_print_enable,
+	},
+	{
+		.cid = V4L2_CID_MALI_VPU_IGNORE_STREAM_HEADERS,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Ignore Stream Headers",
+		.min_val = -1,
+		.max_val = 1,
+		.default_val = -1,
+		.step_or_mask = 1,
+		.is_custom = true,
+		.flags = 0,
+		.set = mali_vpu_ctrl_set_ignore_stream_headers,
+	},
+	{
+		.cid = V4L2_CID_MALI_VPU_FRAME_REORDERING,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.name = "Frame Reordering",
+		.min_val = -1,
+		.max_val = 1,
+		.default_val = -1,
+		.step_or_mask = 1,
+		.is_custom = true,
+		.flags = 0,
+		.set = mali_vpu_ctrl_set_frame_reordering,
+	},
+};
+
 const struct mali_vpu_variant mali_vpu_v76_variant = {
 	.expected_hw_pid = MALI_VPU_HW_PID_V76,
 
@@ -81,4 +176,8 @@ const struct mali_vpu_variant mali_vpu_v76_variant = {
 		.width_default = MALI_V76_DEFAULT_FRAME_WIDTH,
 		.height_default = MALI_V76_DEFAULT_FRAME_HEIGHT,
 	},
+	.ctrl_caps = {
+		.dec_ctrls = mali_v76_dec_ctrls,
+		.num_dec_ctrls = ARRAY_SIZE(mali_v76_dec_ctrls),
+	},
 };
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
index a46c25a94f18b..ad20896c90b0f 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 #include <linux/videodev2.h>
 
+#include "mali-vpu-controls.h"
 #include "mali-vpu-formats.h"
 
 /**
@@ -33,6 +34,16 @@ struct mali_vpu_format_caps {
 	const struct mali_vpu_format_list dec_dst;
 };
 
+/**
+ * struct mali_vpu_control_caps - Control capability tables per role.
+ * @dec_ctrls: Array of controls supported by the decoder.
+ * @num_dec_ctrls: Number of entries in @dec_ctrls.
+ */
+struct mali_vpu_control_caps {
+	const struct mali_vpu_ctrl_desc *dec_ctrls;
+	u32 num_dec_ctrls;
+};
+
 /**
  * struct mali_vpu_variant - Variant-specific hardware capability descriptor.
  * @rst_names: Array of reset control names for this variant.
@@ -40,6 +51,7 @@ struct mali_vpu_format_caps {
  * @expected_hw_pid: Expected hardware product ID read from the version register.
  * @fmt_caps: Format capability tables for encode/decode paths.
  * @frmsz_caps: Frame dimension limits and defaults.
+ * @ctrl_caps:  Control capability tables for encode/decode paths.
  */
 struct mali_vpu_variant {
 	const char * const *rst_names;
@@ -48,6 +60,7 @@ struct mali_vpu_variant {
 
 	struct mali_vpu_format_caps	fmt_caps;
 	struct mali_vpu_framesize_caps	frmsz_caps;
+	struct mali_vpu_control_caps	ctrl_caps;
 };
 
 extern const struct mali_vpu_variant mali_vpu_v76_variant;
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
index dd142527a1a0c..88e706be6705e 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
@@ -8,7 +8,9 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <media/v4l2-common.h>
+#include <media/v4l2-ctrls.h>
 #include <media/v4l2-dev.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-fh.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mem2mem.h>
@@ -318,6 +320,21 @@ static int mali_vpu_enum_framesizes(struct file *filp, void *fh,
 	return 0;
 }
 
+static int mali_vpu_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subscribe_event(fh, sub);
+	case V4L2_EVENT_EOS:
+		return v4l2_event_subscribe(fh, sub, 2, NULL);
+	case V4L2_EVENT_SOURCE_CHANGE:
+		return v4l2_event_subscribe(fh, sub, 2, NULL);
+
+	default:
+		return -EINVAL;
+	}
+}
+
 const struct v4l2_ioctl_ops mali_vpu_ioctl_ops_dec = {
 	.vidioc_querycap		= mali_vpu_querycap,
 	.vidioc_enum_fmt_vid_out	= mali_vpu_enum_fmt,
@@ -337,4 +354,6 @@ const struct v4l2_ioctl_ops mali_vpu_ioctl_ops_dec = {
 	.vidioc_dqbuf			= v4l2_m2m_ioctl_dqbuf,
 	.vidioc_remove_bufs		= v4l2_m2m_ioctl_remove_bufs,
 	.vidioc_enum_framesizes		= mali_vpu_enum_framesizes,
+	.vidioc_subscribe_event		= mali_vpu_subscribe_event,
+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
 };
diff --git a/include/uapi/linux/media/arm/mali-vpu-config.h b/include/uapi/linux/media/arm/mali-vpu-config.h
new file mode 100644
index 0000000000000..a82fd69f16b75
--- /dev/null
+++ b/include/uapi/linux/media/arm/mali-vpu-config.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Arm Mali-VPU Driver - Userspace API
+ *
+ * (C) COPYRIGHT 2026 ARM Limited.
+ */
+
+#ifndef __UAPI_MALI_VPU_CONFIG_H__
+#define __UAPI_MALI_VPU_CONFIG_H__
+
+#include <linux/v4l2-controls.h>
+
+/* Mali VPU specific V4L2 driver controls */
+
+/* Encoded stream NALU encapsulation mode. */
+#define V4L2_CID_MALI_VPU_NALU_FORMAT		(V4L2_CID_USER_MALI_VPU_BASE + 0x00)
+
+/**
+ * enum mali_vpu_nalu_format - Encoded stream NALU OUTPUT format.
+ *
+ * @MALI_VPU_NALU_FORMAT_START_CODES: Each NAL unit is prefixed by an Annex B start code.
+ * @MALI_VPU_NALU_FORMAT_ONE_NALU_PER_BUFFER: Exactly one NALU in each output buffer.
+ * @MALI_VPU_NALU_FORMAT_ONE_BYTE_LENGTH_FIELD: Length-prefixed NALU with 1-byte size field.
+ * @MALI_VPU_NALU_FORMAT_TWO_BYTE_LENGTH_FIELD: Length-prefixed NALU with 2-byte size field.
+ * @MALI_VPU_NALU_FORMAT_FOUR_BYTE_LENGTH_FIELD: Length-prefixed NALU with 4-byte size field.
+ *
+ * Options for V4L2_CID_MALI_VPU_NALU_FORMAT control, which determines how the firmware
+ * encapsulates NALUs in the output stream buffers H.264.
+ */
+enum mali_vpu_nalu_format {
+	MALI_VPU_NALU_FORMAT_START_CODES		= 0,
+	MALI_VPU_NALU_FORMAT_ONE_NALU_PER_BUFFER	= 1,
+	MALI_VPU_NALU_FORMAT_ONE_BYTE_LENGTH_FIELD	= 2,
+	MALI_VPU_NALU_FORMAT_TWO_BYTE_LENGTH_FIELD	= 3,
+	MALI_VPU_NALU_FORMAT_FOUR_BYTE_LENGTH_FIELD	= 4,
+};
+
+#define V4L2_CID_MALI_VPU_STREAM_ESCAPING	(V4L2_CID_USER_MALI_VPU_BASE + 0x01)
+#define V4L2_CID_MALI_VPU_IGNORE_STREAM_HEADERS	(V4L2_CID_USER_MALI_VPU_BASE + 0x02)
+#define V4L2_CID_MALI_VPU_FRAME_REORDERING	(V4L2_CID_USER_MALI_VPU_BASE + 0x03)
+/* Suggested firmware intermediate buffer size limit. */
+#define V4L2_CID_MALI_VPU_INTBUF_SIZE		(V4L2_CID_USER_MALI_VPU_BASE + 0x04)
+
+/* Enable firmware protocol to send debug prints to host. */
+#define V4L2_CID_MALI_VPU_HOST_PRINT_ENABLE	(V4L2_CID_USER_MALI_VPU_BASE + 0x05)
+
+#endif /* __UAPI_MALI_VPU_CONFIG_H__ */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2ec..b9f7bc3aac1de 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -255,6 +255,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_IT6625_BASE		(V4L2_CID_USER_BASE + 0x1250)
 
+/*
+ * The base for Arm Mali-VPU driver controls.
+ * We reserve 64 controls for this driver.
+ */
+#define V4L2_CID_USER_MALI_VPU_BASE		(V4L2_CID_USER_BASE + 0x1260)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.43.0

