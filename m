Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102754;
	b=JKB6qkZTXDlyFdWEBayLuBtHeFMAc5WYaUm5MP6ZZ/XeUTGaabZE9Xb8sWvCCHpQ6y7Q
	 5WS0r7zQDV5yBOZXlzFmL0s3BhQZ/Kc2Xfiwdgk31jipNXGPeJInshMxVwQtTdZQqG4fS
	 PIdXDvMTUFEIBmYvbMzsfLM74pH8buFWRintLgb+ebIFxR2qSNhtquMGwbRIu0IBz1CmY
	 eYSIm6W2PLMdGL2oeje3/LH1DyFRxV+WdbelwnhFVpy/ZJ4ghNZUy93EJsMN5FdKIjQU4
	 wZnjpuCgHsheXYcIjFrfmvV401c7knjkmJlQKIq0Lbavzv5ivh1xj6ntrSDQSpjAxQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102754;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s/tby5SKQTmy8yju0gR5vM0Q6ZNzmL1ks59W3JcYSo0=;
	b=VlS834FRXkQOzlZ2mwdgT7ICS4Qqac6qOLn/LoqcByB/d9IembPD+CHgMeRapFmuCRHP
	 xfcEi+D28n0dsejbWIualiMu+1JRwU4UK5YUKycGbajpfGf8zc6vRoqcXC7HvBrMMk8BD
	 TUK4I364DCClY4hbHOqG3e/sfFeBrCzmnAKYCzY1MsadIT7vRYNwlUfqJJTwUpo3OLvj0
	 hH0TTE0f54q0zvoNwsTH5wZ/qMu6oCtJsDdQ+T43qTCsTLjYQiDl337bMO/PQQc7efiFl
	 K3U/QLhkXBuhSAHc1nsdIPZ982PYsUSWXPyA5fEWIFtIdKhufshZN52yuaDKCo8KNKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vGbjzanZ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F60B606C4A5;
	Thu, 19 Nov 2026 15:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F60B606C4A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vGbjzanZ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4B3D1C01;
	Thu, 19 Nov 2026 07:39:05 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59E1A3F882;
	Thu, 19 Nov 2026 07:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102748; bh=3YTDMBwlcvx1BjSzesmxb50QmZi3cEAumYkVH4gz3Gs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vGbjzanZUk/fct0fnjh5IAYgAftlhbozXQ6zd0tEih+pVW0IR9pY2ia3k6U+nCEYq
	 a+tN4tx3HEov7GxPo8hxuNC6wewcjXD1oyx2D/cjVaAx1lYLathjD2Ok6aduQsbRxe
	 43A5zHdhArTj5sngcfL/4bECdJYpxw8+pabIRzlE=
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
Subject: [RFC PATCH 23/28] media: mali-vpu: propagate buffer metadata
Date: Thu, 19 Nov 2026 15:37:53 +0000
Message-ID: <20261119153758.1426673-24-charvi.mehta@arm.com>
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

Firmware may return compressed buffers before producing their
corresponding decoded frames and may reorder decoded output. Preserve
timestamp-associated flags and timecodes across firmware processing and
restore them on the matching CAPTURE buffers.

Report the negotiated field on CAPTURE buffers and maintain independent
sequence counters for the OUTPUT and CAPTURE queues.

Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 .../platform/arm/mali-vpu/mali-vpu-session.c  | 74 +++++++++++++++++++
 .../platform/arm/mali-vpu/mali-vpu-session.h  | 21 ++++++
 .../platform/arm/mali-vpu/mali-vpu-vb2.c      |  3 +
 3 files changed, 98 insertions(+)

diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
index 9cbd116124109..ea80aacd930d8 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2026 ARM Limited.
  */
 
+#include <linux/array_size.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
@@ -19,6 +20,9 @@
 #include "mali-vpu-variant.h"
 #include "mali-vpu-vb2.h"
 
+#define MALI_VPU_TS_METADATA_FLAGS \
+	(V4L2_BUF_FLAG_TIMECODE | V4L2_BUF_FLAG_TSTAMP_SRC_MASK)
+
 static const unsigned int mali_vpu_fw_response_timeout_ms = 10000;
 static const unsigned int mali_vpu_fw_load_timeout_ms     = 10000;
 
@@ -288,12 +292,65 @@ static int mali_vpu_session_sched_activate(struct mali_vpu_session *sess)
 	return mali_vpu_sched_switch_in(&sess->sched_sess, &sess->vpu_dev->sched);
 }
 
+static void mali_vpu_session_store_ts_metadata(struct mali_vpu_session *sess,
+					       const struct vb2_v4l2_buffer *vbuf)
+{
+	struct mali_vpu_ts_metadata *metadata;
+
+	if (sess->ts_metadata_idx >= ARRAY_SIZE(sess->ts_metadata))
+		sess->ts_metadata_idx = 0;
+
+	metadata = &sess->ts_metadata[sess->ts_metadata_idx++];
+	metadata->timestamp = vbuf->vb2_buf.timestamp;
+	metadata->flags = vbuf->flags & MALI_VPU_TS_METADATA_FLAGS;
+	metadata->valid = true;
+	metadata->timecode = vbuf->timecode;
+}
+
+static void mali_vpu_session_restore_ts_metadata(struct mali_vpu_session *sess,
+						 struct vb2_v4l2_buffer *vbuf)
+{
+	u64 timestamp = vbuf->vb2_buf.timestamp;
+	u32 i;
+
+	/*
+	 * Matching the auxiliary metadata by timestamp is ambiguous when
+	 * OUTPUT buffers have duplicate timestamps: timecode and timestamp-
+	 * source flags may be restored from a different OUTPUT buffer.
+	 *
+	 * The timestamp itself is returned independently through firmware.
+	 * Unique association tags require reliable metadata lifetime tracking.
+	 */
+
+	vbuf->flags &= ~MALI_VPU_TS_METADATA_FLAGS;
+
+	for (i = 0; i < ARRAY_SIZE(sess->ts_metadata); i++) {
+		struct mali_vpu_ts_metadata *metadata = &sess->ts_metadata[i];
+
+		if (!metadata->valid || metadata->timestamp != timestamp)
+			continue;
+
+		vbuf->flags |= metadata->flags;
+		if (metadata->flags & V4L2_BUF_FLAG_TIMECODE)
+			vbuf->timecode = metadata->timecode;
+
+		return;
+	}
+}
+
+void mali_vpu_session_reset_ts_metadata(struct mali_vpu_session *sess)
+{
+	memset(sess->ts_metadata, 0, sizeof(sess->ts_metadata));
+	sess->ts_metadata_idx = 0;
+}
+
 static void mali_vpu_session_buffer_done(struct mali_vpu_session *sess,
 					 struct mali_vpu_buffer *vpu_buf,
 					 enum vb2_buffer_state state)
 {
 	struct vb2_v4l2_buffer *vbuf = &vpu_buf->m2m_buf.vb;
 	struct vb2_buffer *vb2_buf = &vbuf->vb2_buf;
+	struct mali_vpu_port *port;
 
 	if (vb2_buf->state != VB2_BUF_STATE_ACTIVE) {
 		dev_dbg(sess->vpu_dev->dev,
@@ -302,6 +359,14 @@ static void mali_vpu_session_buffer_done(struct mali_vpu_session *sess,
 		return;
 	}
 
+	port = V4L2_TYPE_IS_OUTPUT(vpu_buf->type) ? &sess->port_src : &sess->port_dst;
+
+	vbuf->sequence = port->sequence++;
+	if (V4L2_TYPE_IS_CAPTURE(vpu_buf->type)) {
+		vbuf->field = port->curr_fmt.fmt.pix_mp.field;
+		mali_vpu_session_restore_ts_metadata(sess, vbuf);
+	}
+
 	if (V4L2_TYPE_IS_OUTPUT(vpu_buf->type))
 		v4l2_m2m_src_buf_remove_by_buf(sess->m2m_ctx, vbuf);
 	else
@@ -607,6 +672,10 @@ int mali_vpu_session_qbuf(struct mali_vpu_session *sess, struct vb2_buffer *vb2_
 	    !mali_vpu_session_can_stream(sess) ||
 	    sess->fw_state != MALI_VPU_FW_STATE_RUNNING) {
 		vpu_buf->attr = MALI_VPU_BUF_ATTR_DEFERRED;
+
+		if (V4L2_TYPE_IS_OUTPUT(vb2_buf->type))
+			mali_vpu_session_store_ts_metadata(sess, v4l2_buf);
+
 		return 0;
 	}
 
@@ -616,6 +685,9 @@ int mali_vpu_session_qbuf(struct mali_vpu_session *sess, struct vb2_buffer *vb2_
 
 	vpu_buf->attr = MALI_VPU_BUF_ATTR_QUEUED;
 
+	if (V4L2_TYPE_IS_OUTPUT(vb2_buf->type))
+		mali_vpu_session_store_ts_metadata(sess, v4l2_buf);
+
 	mali_vpu_sched_send_irq(&sess->sched_sess, &sess->vpu_dev->sched);
 
 	return 0;
@@ -733,6 +805,8 @@ int mali_vpu_session_prepare_streaming(struct mali_vpu_session *sess,
 		}
 	}
 
+	port->sequence = 0;
+
 	return 0;
 
 err_rollback:
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
index c6e1add34a8f1..7565a680397a8 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
@@ -29,11 +29,27 @@ struct mali_vpu_sched_session;
  * @supported_fmts: List of format descriptors supported by the queue.
  * @stream_requested: Port/Queue is being prepared for streaming or has
  *                    successfully completed preparation. Protected by vq_lock.
+ * @sequence: Sequence number assigned to the next completed buffer.
  */
 struct mali_vpu_port {
 	struct v4l2_format		curr_fmt;
 	struct mali_vpu_format_list	supported_fmts;
 	bool				stream_requested;
+	u32				sequence;
+};
+
+/**
+ * struct mali_vpu_ts_metadata - OUTPUT metadata propagated to CAPTURE.
+ * @timestamp: Timestamp used as the firmware association tag.
+ * @flags: Timestamp-source and timecode-presence flags.
+ * @valid: Whether this cache entry has been populated.
+ * @timecode: Timecode associated with @timestamp.
+ */
+struct mali_vpu_ts_metadata {
+	u64 timestamp;
+	u32 flags;
+	bool valid;
+	struct v4l2_timecode timecode;
 };
 
 /*
@@ -80,6 +96,8 @@ enum mali_vpu_session_fw_bin_state {
  * @mmu: MMU handle for this session
  * @vq_lock: Mutex lock to serialise per-session queue related ioctls.
  * @min_buffers_required: Driver-reported minimum buffers for role-specific queue.
+ * @ts_metadata: OUTPUT metadata indexed by timestamp for CAPTURE propagation.
+ * @ts_metadata_idx: Next timestamp metadata slot to use.
  * @ctrls_caps: Variant-provided immutable control capability table.
  * @num_ctrls_caps: Number of entries in @ctrls_caps.
  * @ctrls_state: Per-session control cache and staging state.
@@ -106,6 +124,8 @@ struct mali_vpu_session {
 	struct mali_vpu_mmu		mmu;
 	struct mutex			vq_lock; /* lock to serialise per-session ioctls */
 	u32				min_buffers_required;
+	struct mali_vpu_ts_metadata	ts_metadata[VIDEO_MAX_FRAME];
+	u32				ts_metadata_idx;
 
 	const struct mali_vpu_ctrl_desc *ctrls_caps;
 	u32				num_ctrls_caps;
@@ -139,6 +159,7 @@ int mali_vpu_session_prepare_streaming(struct mali_vpu_session *sess,
 int mali_vpu_session_streamoff(struct mali_vpu_session *sess, enum v4l2_buf_type type);
 void mali_vpu_session_irq(struct mali_vpu_session *sess);
 int mali_vpu_session_qbuf(struct mali_vpu_session *sess, struct vb2_buffer *vb2_buf);
+void mali_vpu_session_reset_ts_metadata(struct mali_vpu_session *sess);
 
 static inline struct mali_vpu_session *mali_vpu_get_session(struct file *filp)
 {
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c
index 41158bf4e0ecb..81a447ceeb755 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c
@@ -137,6 +137,9 @@ static void mali_vpu_vb2_unprepare_streaming(struct vb2_queue *q)
 
 	if (!vb2_start_streaming_called(q))
 		v4l2_m2m_update_stop_streaming_state(sess->m2m_ctx, q);
+
+	if (!sess->port_src.stream_requested && !sess->port_dst.stream_requested)
+		mali_vpu_session_reset_ts_metadata(sess);
 }
 
 static const struct vb2_ops mali_vpu_vb2_ops = {
-- 
2.43.0

