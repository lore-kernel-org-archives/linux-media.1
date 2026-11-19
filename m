Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102759;
	b=KzIhKO7dM6IogXYaiTthebuHtACQklV6ybWD+AnM8RVW1dEBM4EvSbbjr6frVJf4yqcr
	 WAWHv5JaCL3utLF4knqbMJYwAcC70UqyVKJ58pZ30O6B0woJlaPVK8nxHJUwQ9PpbIef8
	 MmNEztR/UTMgENr8iBZN4tEZC30106qIvXaijKP0nMbfHk89exLZhEkixdLlMbl1Nyeuq
	 7B1prrrrcNTgLysRsXSWVqETbfqkOK/fpSWeRN9JhmR3L8BeYVG9U8p/t0ut276g/lzR9
	 Hv6bSCEDWutx7FNOA7QKkj0OwaMzqldeD2yJVU0l7xOxe9aV3CCsA98YxPzPTeX7Nlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102759;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f3yhApWmNNz6QfJD96mHMO0Nq5glzss2T9Rht5Z3lCQ=;
	b=4WfhO47+2Eay+FsDu8EG/GOsfFz3vxDWC/BUyEjzGPMoFiPeWLgrrA163nmxMi2B3oRV
	 yWu56kACTqRBA9w2c6UG2AabhQZUGXjjgzhLpijMkLKdTqVTu+3YqiagKx6SxthhDufQm
	 YB9Gob4+LkyMOOlpthO7shrW03qcYlHg8gOgUJRThUIrF5RLfdVwLSsqULP/qKDPAiTML
	 BA9cnjzhotSYqIM4+sxPplIO0D3asVRsWOgLxPuuSamv65+Y5+01uOdBnndZvACOjH5s9
	 zEVa2pEN2G9zXPgAJagQA4TuzNnnzw5pHAJ+0mAFAUxE0i1CjrIyaHz6z+MRg6UXjJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SBiMhUUX;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EAA260A5BC8;
	Thu, 19 Nov 2026 15:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EAA260A5BC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SBiMhUUX
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 182CA1575;
	Thu, 19 Nov 2026 07:39:13 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82CAD3F882;
	Thu, 19 Nov 2026 07:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102756; bh=dJc7TEJbJuMLau6YCuAxAupuiZZ/bbRvYqtgKH41+Ok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SBiMhUUXsre7cJ8PhBIwXxDPaUuN8SEsiVU2ha1hpQVe7aqXlYL5uiSPQVZbISakn
	 Wmq4654K1t/vNVuUOnEDGu717t18xiHv4SzOK/ElMpBMBfFgM/iOMX2cObVhmBXva/
	 vBSS5wPthRAIzW7Koo5Xj38T8ywdUTXXzO1belrA=
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
Subject: [RFC PATCH 27/28] media: mali-vpu: add stateful decoder state machine
Date: Thu, 19 Nov 2026 15:37:57 +0000
Message-ID: <20261119153758.1426673-28-charvi.mehta@arm.com>
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

From: Shobhit Pandey <shobhit.pandey@arm.com>

Replace the decoder drc_pending flag with explicit session-state
tracking during FW SOURCE CHANGE and STREAMON/STREAMOFF.
Validate decoder state transitions and update the state during queue
STREAMON/STREAMOFF, decoder START/STOP commands, EOS handling and
firmware responses.
Distinguish initial picture-size discovery from runtime resolution
changes, and delay the source-change event until the firmware has
completed the CAPTURE queue flush. Track draining until the final
CAPTURE buffer is returned with EOS.

Signed-off-by: Shobhit Pandey <shobhit.pandey@arm.com>
---
 .../platform/arm/mali-vpu/mali-vpu-dec.c      | 139 +++++++++++++++++-
 .../platform/arm/mali-vpu/mali-vpu-dec.h      |   4 +
 .../platform/arm/mali-vpu/mali-vpu-session.c  |  67 +++++++--
 .../platform/arm/mali-vpu/mali-vpu-session.h  |   6 +-
 .../platform/arm/mali-vpu/mali-vpu-state.h    | 136 +++++++++++++++++
 5 files changed, 331 insertions(+), 21 deletions(-)
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-state.h

diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
index 7e34c24ae050f..6ce61de22a802 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
@@ -9,6 +9,7 @@
 #include "mali-vpu-dec.h"
 #include "mali-vpu-session.h"
 #include "mali-vpu-variant.h"
+#include "mali-vpu-state.h"
 
 void mali_vpu_session_init_dec(struct mali_vpu_session *sess)
 {
@@ -23,7 +24,7 @@ void mali_vpu_session_init_dec(struct mali_vpu_session *sess)
 	sess->num_ctrls_caps	= variant_ctrls->num_dec_ctrls;
 
 	sess->min_buffers_required = 3;	/* For CAPTURE/dst queue */
-	sess->drc_pending	= false;
+	sess->sess_state	= MALI_VPU_STATE_INITIALIZATION;
 }
 
 int mali_vpu_ctrl_set_ignore_stream_headers(struct mali_vpu_session *sess,
@@ -69,6 +70,7 @@ int mali_vpu_ctrl_set_frame_reordering(struct mali_vpu_session *sess, u32 cid,
 int mali_vpu_decoder_cmd(struct file *filp, void *priv, struct v4l2_decoder_cmd *cmd)
 {
 	struct mali_vpu_session *sess = mali_vpu_get_session(filp);
+	struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(sess->m2m_ctx);
 	int ret;
 
 	ret = v4l2_m2m_ioctl_try_decoder_cmd(filp, priv, cmd);
@@ -79,11 +81,31 @@ int mali_vpu_decoder_cmd(struct file *filp, void *priv, struct v4l2_decoder_cmd
 
 	switch (cmd->cmd) {
 	case V4L2_DEC_CMD_STOP:
-		ret = mali_vpu_session_fw_send_eos(sess);
+		if (sess->sess_state == MALI_VPU_STATE_DRAIN) {
+			ret = -EBUSY;
+			break;
+		} else if (sess->sess_state == MALI_VPU_STATE_STREAMING) {
+			ret = mali_vpu_session_fw_send_eos(sess);
+			if (!ret)
+				ret = mali_vpu_dec_update_state(sess, MALI_VPU_STATE_DRAIN);
+		}
 		break;
 	case V4L2_DEC_CMD_START:
-		vb2_clear_last_buffer_dequeued(v4l2_m2m_get_dst_vq(sess->m2m_ctx));
-		ret = 0;
+		if (sess->sess_state == MALI_VPU_STATE_DRAIN &&
+		    !dst_q->last_buffer_dequeued) {
+			ret = -EBUSY;
+			break;
+		}
+
+		ret = mali_vpu_submit_deferred_bufs(sess);
+		if (ret)
+			break;
+
+		ret = mali_vpu_dec_update_state(sess, MALI_VPU_STATE_STREAMING);
+		if (ret)
+			break;
+
+		vb2_clear_last_buffer_dequeued(dst_q);
 		break;
 	default:
 		ret = -EINVAL;
@@ -93,3 +115,112 @@ int mali_vpu_decoder_cmd(struct file *filp, void *priv, struct v4l2_decoder_cmd
 	mutex_unlock(&sess->vq_lock);
 	return ret;
 }
+
+static bool mali_vpu_dec_allow_state_change(struct mali_vpu_session *sess,
+					    enum mali_vpu_sess_state new_state)
+{
+	switch (sess->sess_state) {
+	case MALI_VPU_STATE_INITIALIZATION:
+		return (new_state == MALI_VPU_STATE_RESET ||
+			new_state == MALI_VPU_STATE_STOPPED);
+	case MALI_VPU_STATE_STREAMING:
+		return (new_state == MALI_VPU_STATE_RESET ||
+			new_state == MALI_VPU_DEC_STATE_DYNAMIC_RESOLUTION_CHANGE ||
+			new_state == MALI_VPU_STATE_DRAIN);
+	case MALI_VPU_STATE_RESET:
+		return (new_state == MALI_VPU_STATE_INITIALIZATION ||
+			new_state == MALI_VPU_STATE_STREAMING);
+	case MALI_VPU_STATE_DRAIN:
+		return (new_state == MALI_VPU_STATE_STOPPED ||
+			new_state == MALI_VPU_STATE_RESET);
+	case MALI_VPU_STATE_STOPPED:
+		return (new_state == MALI_VPU_STATE_INITIALIZATION ||
+			new_state == MALI_VPU_DEC_STATE_FIRST_SOURCE_CHANGE ||
+			new_state == MALI_VPU_STATE_STREAMING ||
+			new_state == MALI_VPU_STATE_RESET);
+	case MALI_VPU_DEC_STATE_DYNAMIC_RESOLUTION_CHANGE:
+		return new_state == MALI_VPU_STATE_STOPPED;
+	case MALI_VPU_DEC_STATE_FIRST_SOURCE_CHANGE:
+		return new_state == MALI_VPU_STATE_STREAMING;
+	default:
+		return false;
+	}
+}
+
+int mali_vpu_dec_update_state(struct mali_vpu_session *sess, u32 new_state)
+{
+	if (sess->role != MALI_VPU_DECODER)
+		return -EINVAL;
+
+	if (sess->sess_state == new_state)
+		return 0;
+
+	if (!mali_vpu_dec_allow_state_change(sess, new_state))
+		return -EINVAL;
+
+	sess->sess_state = new_state;
+	return 0;
+}
+
+int mali_vpu_dec_state_change_streamon(struct mali_vpu_session *sess, enum v4l2_buf_type type)
+{
+	enum mali_vpu_sess_state new_state;
+
+	switch (sess->sess_state) {
+	case MALI_VPU_STATE_INITIALIZATION:
+		new_state = V4L2_TYPE_IS_OUTPUT(type) ?
+			MALI_VPU_STATE_STOPPED : MALI_VPU_STATE_RESET;
+		break;
+	case MALI_VPU_STATE_STOPPED:
+	case MALI_VPU_DEC_STATE_FIRST_SOURCE_CHANGE:
+		if (V4L2_TYPE_IS_OUTPUT(type))
+			return 0;
+		new_state = MALI_VPU_STATE_STREAMING;
+		break;
+	case MALI_VPU_STATE_RESET:
+		if (!V4L2_TYPE_IS_OUTPUT(type))
+			return 0;
+		new_state = MALI_VPU_STATE_STREAMING;
+		break;
+	default:
+		return 0;
+	}
+
+	return mali_vpu_dec_update_state(sess, new_state);
+}
+
+int mali_vpu_dec_state_change_streamoff(struct mali_vpu_session *sess, enum v4l2_buf_type type)
+{
+	enum mali_vpu_sess_state new_state;
+
+	if (V4L2_TYPE_IS_OUTPUT(type)) {
+		switch (sess->sess_state) {
+		case MALI_VPU_STATE_STOPPED:
+			new_state = MALI_VPU_STATE_INITIALIZATION;
+			break;
+		case MALI_VPU_STATE_STREAMING:
+		case MALI_VPU_STATE_DRAIN:
+			new_state = MALI_VPU_STATE_RESET;
+			break;
+		default:
+			return 0;
+		}
+	} else {
+		switch (sess->sess_state) {
+		case MALI_VPU_STATE_RESET:
+			new_state = MALI_VPU_STATE_INITIALIZATION;
+			break;
+		case MALI_VPU_STATE_STREAMING:
+		case MALI_VPU_STATE_DRAIN:
+			new_state = MALI_VPU_STATE_STOPPED;
+			break;
+		case MALI_VPU_DEC_STATE_DYNAMIC_RESOLUTION_CHANGE:
+			new_state = MALI_VPU_STATE_STOPPED;
+			break;
+		default:
+			return 0;
+		}
+	}
+
+	return mali_vpu_dec_update_state(sess, new_state);
+}
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h
index a108aaaa4a959..fccda5b3d5b2e 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h
@@ -7,6 +7,7 @@
 #define __MALI_VPU_DEC_H__
 
 #include <linux/types.h>
+#include <linux/videodev2.h>
 
 struct file;
 struct mali_vpu_session;
@@ -19,5 +20,8 @@ int mali_vpu_ctrl_set_ignore_stream_headers(struct mali_vpu_session *sess, u32 c
 int mali_vpu_ctrl_set_frame_reordering(struct mali_vpu_session *sess, u32 cid, s64 value);
 
 int mali_vpu_decoder_cmd(struct file *filp, void *priv, struct v4l2_decoder_cmd *cmd);
+int mali_vpu_dec_update_state(struct mali_vpu_session *sess, u32 new_state);
+int mali_vpu_dec_state_change_streamon(struct mali_vpu_session *sess, enum v4l2_buf_type type);
+int mali_vpu_dec_state_change_streamoff(struct mali_vpu_session *sess, enum v4l2_buf_type type);
 
 #endif /* __MALI_VPU_DEC_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
index 500d80788d0eb..3ff4635e682eb 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
@@ -329,7 +329,7 @@ static int mali_vpu_submit_deferred_bufs_for_queue(struct mali_vpu_session *sess
 	return 0;
 }
 
-static int mali_vpu_submit_deferred_bufs(struct mali_vpu_session *sess)
+int mali_vpu_submit_deferred_bufs(struct mali_vpu_session *sess)
 {
 	int ret;
 
@@ -448,7 +448,7 @@ static void mali_vpu_session_buffer_done(struct mali_vpu_session *sess,
 	if (V4L2_TYPE_IS_CAPTURE(vpu_buf->type) &&
 	    !q->last_buffer_dequeued &&
 	    (vbuf->flags & V4L2_BUF_FLAG_LAST) &&
-	    !sess->drc_pending) {
+	    sess->sess_state != MALI_VPU_DEC_STATE_DYNAMIC_RESOLUTION_CHANGE) {
 		const struct v4l2_event event = {
 			.type = V4L2_EVENT_EOS,
 		};
@@ -513,7 +513,14 @@ static int mali_vpu_session_handle_fw_msg(struct mali_vpu_session *sess,
 		state = mali_vpu_buffer_update_info_to_v4l2(vpu_buf);
 
 		mali_vpu_session_buffer_done(sess, vpu_buf, state);
-
+		if (vpu_buf->flags & MALI_VPU_BUFFER_EOS) {
+			if (V4L2_TYPE_IS_OUTPUT(vpu_buf->type) &&
+			    sess->sess_state == MALI_VPU_STATE_STREAMING) {
+				ret = mali_vpu_dec_update_state(sess, MALI_VPU_STATE_DRAIN);
+				if (ret)
+					return ret;
+			}
+		}
 		return 0;
 	}
 	case MALI_VPU_FW_CODE_PONG:
@@ -569,17 +576,31 @@ static int mali_vpu_session_handle_fw_msg(struct mali_vpu_session *sess,
 			fw_msg->data.dpb_held_frames);
 		return 0;
 	case MALI_VPU_FW_CODE_OUTPUT_FLUSH:
-		dev_dbg(sess->vpu_dev->dev, "fw rsp: Dst queue flushed\n");
-		if (sess->role == MALI_VPU_DECODER && sess->drc_pending)
+		if (sess->sess_state == MALI_VPU_DEC_STATE_DYNAMIC_RESOLUTION_CHANGE ||
+		    sess->sess_state == MALI_VPU_DEC_STATE_FIRST_SOURCE_CHANGE) {
 			return mali_vpu_session_send_drc_event(sess);
+		}
 
 		return 0;
 	case MALI_VPU_FW_CODE_ALLOC_PARAM:
 		ret = mali_vpu_session_update_capture_format(sess, fw_msg->data.alloc_params);
-		if (!ret)
-			sess->drc_pending = true;
+		if (ret)
+			return ret;
 
-		return ret;
+		if (sess->sess_state == MALI_VPU_STATE_STREAMING) {
+			ret =
+			mali_vpu_dec_update_state(sess,
+						  MALI_VPU_DEC_STATE_DYNAMIC_RESOLUTION_CHANGE);
+			if (ret)
+				return ret;
+		} else if (sess->sess_state == MALI_VPU_STATE_STOPPED) {
+			ret = mali_vpu_dec_update_state(sess,
+							MALI_VPU_DEC_STATE_FIRST_SOURCE_CHANGE);
+			if (ret)
+				return ret;
+		}
+
+		return 0;
 	case MALI_VPU_FW_CODE_SEQUENCE_PARAMS: {
 		struct vb2_queue *dst_q;
 		u32 buffers_min;
@@ -829,7 +850,7 @@ int mali_vpu_session_qbuf(struct mali_vpu_session *sess, struct vb2_buffer *vb2_
 	 * Do not give the requeued buffer back to fw as it belongs to pre DRC
 	 * allocation which will be unmapped immediately afterwards.
 	 */
-	if (sess->drc_pending && sess->role == MALI_VPU_DECODER &&
+	if (sess->sess_state == MALI_VPU_DEC_STATE_DYNAMIC_RESOLUTION_CHANGE &&
 	    mali_vpu_is_raw_q(sess, vb2_buf->type) &&
 	    port->stream_requested) {
 		v4l2_buf->flags |= V4L2_BUF_FLAG_LAST;
@@ -840,7 +861,9 @@ int mali_vpu_session_qbuf(struct mali_vpu_session *sess, struct vb2_buffer *vb2_
 
 	if (!port->stream_requested ||
 	    !mali_vpu_session_can_stream(sess) ||
-	    sess->fw_state != MALI_VPU_FW_STATE_RUNNING) {
+	    sess->fw_state != MALI_VPU_FW_STATE_RUNNING ||
+	    (V4L2_TYPE_IS_OUTPUT(vb2_buf->type) &&
+	    sess->sess_state == MALI_VPU_STATE_DRAIN)) {
 		vpu_buf->attr = MALI_VPU_BUF_ATTR_DEFERRED;
 
 		if (V4L2_TYPE_IS_OUTPUT(vb2_buf->type))
@@ -949,6 +972,7 @@ int mali_vpu_session_prepare_streaming(struct mali_vpu_session *sess,
 				       enum v4l2_buf_type type)
 {
 	struct mali_vpu_port *port = mali_vpu_session_get_port(sess, type);
+	enum mali_vpu_sess_state old_state;
 	int ret;
 
 	lockdep_assert_held(&sess->vq_lock);
@@ -964,6 +988,12 @@ int mali_vpu_session_prepare_streaming(struct mali_vpu_session *sess,
 	    sess->fw_requested_state != MALI_VPU_FW_STATE_RUNNING)
 		return -EBUSY;
 
+	old_state = sess->sess_state;
+
+	ret = mali_vpu_dec_state_change_streamon(sess, type);
+	if (ret)
+		return ret;
+
 	port->stream_requested = true;
 
 	if (sess->fw_bin_state == MALI_VPU_SESSION_FW_BIN_READY &&
@@ -975,15 +1005,14 @@ int mali_vpu_session_prepare_streaming(struct mali_vpu_session *sess,
 		}
 	}
 
-	if (sess->role == MALI_VPU_DECODER && mali_vpu_is_raw_q(sess, type))
-		sess->drc_pending = false;
-
 	port->sequence = 0;
 
 	return 0;
 
 err_rollback:
+
 	port->stream_requested = false;
+	sess->sess_state = old_state;
 
 	return ret;
 }
@@ -991,6 +1020,7 @@ int mali_vpu_session_prepare_streaming(struct mali_vpu_session *sess,
 int mali_vpu_session_streamoff(struct mali_vpu_session *sess, enum v4l2_buf_type type)
 {
 	struct mali_vpu_port *port = mali_vpu_session_get_port(sess, type);
+	bool drc_capture;
 	int ret;
 
 	lockdep_assert_held(&sess->vq_lock);
@@ -1003,12 +1033,19 @@ int mali_vpu_session_streamoff(struct mali_vpu_session *sess, enum v4l2_buf_type
 	if (sess->error)
 		return 0;
 
+	drc_capture =
+		sess->sess_state == MALI_VPU_DEC_STATE_DYNAMIC_RESOLUTION_CHANGE &&
+		mali_vpu_is_raw_q(sess, type);
+
+	ret = mali_vpu_dec_state_change_streamoff(sess, type);
+	if (ret)
+		goto err_session;
+
 	if (sess->fw_bin_state != MALI_VPU_SESSION_FW_BIN_READY ||
 	    !sess->sched_sess.lsid)
 		return 0;
 
-	if (sess->drc_pending && sess->role == MALI_VPU_DECODER &&
-	    mali_vpu_is_raw_q(sess, type)) {
+	if (drc_capture) {
 		ret = mali_vpu_session_wait_pending(sess);
 		if (ret)
 			goto err_session;
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
index 45d0b6710aced..b37ed569ffb7a 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
@@ -17,6 +17,7 @@
 #include "mali-vpu-firmware.h"
 #include "mali-vpu-formats.h"
 #include "mali-vpu-mmu.h"
+#include "mali-vpu-state.h"
 
 struct v4l2_m2m_ctx;
 struct mali_vpu_fw_bin;
@@ -115,7 +116,7 @@ enum mali_vpu_session_fw_bin_state {
  * @sched_sess: Scheduler state used to map this session to an LSID.
  * @ncores: Number of cores assigned to this session by scheduler.
  * @error: Fatal session error code.
- * @drc_pending: Dynamic resolution change is waiting for CAPTURE reconfigure.
+ * @sess_state: Session main state.
  */
 struct mali_vpu_session {
 	struct mali_vpu_dev		*vpu_dev;
@@ -148,7 +149,7 @@ struct mali_vpu_session {
 	struct mali_vpu_sched_session	sched_sess;
 	u32				ncores;
 	int				error;
-	bool				drc_pending;
+	enum mali_vpu_sess_state	sess_state;
 };
 
 int mali_vpu_session_init(struct mali_vpu_session *sess);
@@ -163,6 +164,7 @@ void mali_vpu_session_irq(struct mali_vpu_session *sess);
 int mali_vpu_session_qbuf(struct mali_vpu_session *sess, struct vb2_buffer *vb2_buf);
 void mali_vpu_session_reset_ts_metadata(struct mali_vpu_session *sess);
 int mali_vpu_session_fw_send_eos(struct mali_vpu_session *sess);
+int mali_vpu_submit_deferred_bufs(struct mali_vpu_session *sess);
 
 static inline struct mali_vpu_session *mali_vpu_get_session(struct file *filp)
 {
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-state.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-state.h
new file mode 100644
index 0000000000000..4602c468a079d
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-state.h
@@ -0,0 +1,136 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#ifndef __MALI_VPU_STATE_H__
+#define __MALI_VPU_STATE_H__
+
+/*
+ * Decoder session state machine
+ *
+ *            open
+ *              |
+ *              |
+ *              v
+ *      +----------------+   ->  ->   ->   StreamOff(Output)    ->   ->   ->      +------------+
+ *      | INITIALIZATION |<------------------------------------------------------>| RESET/SEEK |
+ *      +----------------+  <-  <-   StreamOff(Capture)/REQBUF(OUTPUT, 0) <-  <-  +------------+
+ *              ^                                                                          ^
+ *              | capture format                                                           |
+ *              |  established                                            StreamOff(Output)|
+ *              |                                                                          |
+ *              |                      +---------------+                                   |
+ *              +--------------------->|               |-----------------------------------+
+ * +---------------------------------->| CAPTURE_SETUP/|                                   |
+ * |                                   |    STOPPED    |                                   |
+ * |            +--------------------->|               |                                   |
+ * |            |capture format        +---------------+                                   |
+ * |            | established            |           ^                                     |
+ * |  +-------------------+              |           |                                     |
+ * |  | RESOLUTION_CHANGE |              |           |                                     |
+ * |  +-------------------+              |           |                                     |
+ * |            ^                        |           |   StreamOff(Capture)  +-------+     |
+ * |            |                        |           +-----------------------| DRAIN |     |
+ * |            |                        |                                   +-------+     |
+ * |            |                        |                                      ^          |
+ * |            |                        |START_CMD/                            |          |
+ * |            |                        |StreamOn                              |          |
+ * |            |                        |(Capture)                             |          |
+ * |            |  Stream                |                                      |          |
+ * |            |Resolution              |                                      |          |
+ * |            |  Change                |                                      |          |
+ * |            |                        |                                      |          |
+ * |            |                        |                                      |          |
+ * |            |                        |                                      |STOP_CMD/ |
+ * |            |                        |                                      |EOS Mark  |
+ * |            |                        |                                      |          |
+ * |            |                        v                                      |          |
+ * |            |                      +---------------+                        |          |
+ * |            +----------------------|   STREAMING   |------------------------+          |
+ * |                                   +---------------+                                   |
+ * |                                      ^     ^                                          |
+ * |                                      |     |  ->  ->    StreamOff(Output)   ->   ->   |
+ * +--------------------------------------+     +------------------------------------------+
+ *                                                  <-  <-   StreamOn(Output)   <-  <-
+ */
+
+/*
+ * INITIALIZATION -> STOPPED			OUTPUT STREAMON happens first. Firmware may parse
+ *						source headers while CAPTURE is not configured.
+ *
+ * STOPPED -> INITIALIZATION			OUTPUT STREAMOFF while CAPTURE is stopped.
+ *						Now neither queue is streaming.
+ *
+ * INITIALIZATION -> RESET			CAPTURE STREAMON happens first, as exercised by the
+ *						compliance blocking test. Firmware should not start
+ *						decoding yet.
+ *
+ * RESET -> INITIALIZATION			CAPTURE STREAMOFF while OUTPUT is already stopped.
+ *						Now neither queue is streaming.
+ *
+ * RESET -> STREAMING				OUTPUT STREAMON after CAPTURE was started first.
+ *						Both queues are now streaming.
+ *
+ * STREAMING -> RESET				OUTPUT STREAMOFF first; CAPTURE remains streaming.
+ *
+ * STREAMING -> DYNAMIC_RESOLUTION_CHANGE	Firmware reports changed stream parameters while
+ *						actively decoding. The driver flushes CAPTURE and
+ *						sends V4L2_EVENT_SOURCE_CHANGE.
+ *
+ * DYNAMIC_RESOLUTION_CHANGE -> STOPPED		Userspace performs CAPTURE STREAMOFF following the
+ *						source-change event. OUTPUT remains streaming.
+ *
+ * STREAMING -> DRAIN				V4L2_DEC_CMD_STOP is received or implicit EOS is
+ *						detected on OUTPUT/source.
+ *
+ * DRAIN -> STOPPED				Firmware returns the final CAPTURE buffer with
+ *						LAST/EOS, completing the drain.
+ *
+ * DRAIN -> RESET				OUTPUT STREAMOFF occurs during draining;
+ *						CAPTURE remains streaming.
+ *
+ * STOPPED -> STREAMING				Userspace sends V4L2_DEC_CMD_START to continue
+ *						decoding while both queues remain streaming./
+ *						CAPTURE STREAMON after OUTPUT was started first.
+ *						Both queues are now streaming.
+ *
+ * STOPPED -> FIRST_SOURCE_CHANGE		Firmware reports first RESOLUTION CHANGE in sequence
+ *						occurs during before CAPTURE is configured; it is
+ *						not runtime DRC. The driver flushes CAPTURE and
+ *						sends V4L2_EVENT_SOURCE_CHANGE.
+ *
+ * FIRST_SOURCE_CHANGE -> STREAMING		Userspace on receiving V4L2_EVENT_SOURCE_CHANGE for
+ *						FIRST_SOURCE_CHANGE will allocate CAPTURE BUFFERS
+ *						and call streamOn which will move the state to
+ *						STREAMING as both queues are now streaming.
+ *
+ * STOPPED -> RESET				OUTPUT STREAMOFF after drain completion; CAPTURE
+ *						remains streaming. TO BE VERIFIED
+ */
+
+/**
+ * enum mali_vpu_sess_state - VPU session streaming states
+ *
+ * @MALI_VPU_STATE_INITIALIZATION: Session is initialized with no queues streaming.
+ * @MALI_VPU_STATE_STREAMING: Session both queues streaming.
+ * @MALI_VPU_STATE_STOPPED: For decoder session CAPTURE is not streaming.
+ * @MALI_VPU_STATE_DRAIN: For decoder session all CAPTURE buffers returned
+ * @MALI_VPU_STATE_RESET: For decoder session OUTPUT is not streaming.
+ * @MALI_VPU_DEC_STATE_DYNAMIC_RESOLUTION_CHANGE: Decoder only for mid stream resolution change
+ * @MALI_VPU_DEC_STATE_FIRST_SOURCE_CHANGE: Decoder only for first source change when CAPTURE
+ * not streaming.
+ */
+enum mali_vpu_sess_state {
+	/* Common states for encoder and decoder */
+	MALI_VPU_STATE_INITIALIZATION = 0,
+	MALI_VPU_STATE_STREAMING,
+	MALI_VPU_STATE_STOPPED,
+	MALI_VPU_STATE_DRAIN,
+	MALI_VPU_STATE_RESET,
+	/* Decoder only states */
+	MALI_VPU_DEC_STATE_DYNAMIC_RESOLUTION_CHANGE,
+	MALI_VPU_DEC_STATE_FIRST_SOURCE_CHANGE,
+};
+
+#endif /* __MALI_VPU_STATE_H__ */
-- 
2.43.0

