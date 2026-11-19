Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102753;
	b=xEvXZr8R24DsMw4x4kw29owoK866o+Y26bNaEwIea7lFm7vu2Y01gq56yNSowYc0GcZ2
	 WEbFqjevHw6TZlR3LvauwLCojZ3BWMM1iNNAWTVwyaL05QRZthC1B9Pn71mco3jokfU+1
	 Cf2HZau4qmGfKkj4a+Kadrb9FqYRnj1kr0AK7PqV9lAFdIkC+I4lxZXKw4jMaoulsTBDF
	 odP/FfqGpN+Ht8Lvvr0JnCLyQ11UCvVoD52e/ENWC3EwDkkMplQERkD8Pz3yiKb1YslaD
	 SY3xVNfyhZaX3cmlLSbRS4PrlHPhKqWt5HOyelyWeWSh4BoSzkV3Cnd3zgxIQHP8PNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102753;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZMejqRABToKwp74nTpc5+xMufbzY5vU/AAzEWOXvIs0=;
	b=h7IJfW9TFAiZNg7PeIGDOW1ExO/q/YhcrxEnLV/6U3RuPlSfDAI3f9U8+e0p5oGP+o7j
	 yMSOqCkkkoApdljQa23tkieffZfXRsB2EGMS9lVDOFlnIvLkoPLfsBcDAU1mcp/aXPr2q
	 jy0GDLW0XPvW8tlzXzr1mkUkI0MNlm9p0/Vk1n2Zbuql5DTeVWTH7/0mfSYe8EvX7nOkZ
	 NpEzDvXobAdTMk3TOSANlHtkObPdS+B4GhbnNZ1OWSiDsRveClJHWl6noVOdmXLFVxlhB
	 UvhZ3t8OSBINrZtTVQYlDEZSwPrzn9gUhHpais4nghDG+e5u2+kxn3YnFWJHfT3V++g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Gil7LSC+;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26F5606D6D3;
	Thu, 19 Nov 2026 15:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E26F5606D6D3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Gil7LSC+
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B22141575;
	Thu, 19 Nov 2026 07:39:07 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 271173F882;
	Thu, 19 Nov 2026 07:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102750; bh=6p0T195Gy3m6wS+fA0fjiFvztR3pMYSOLf+UsOnprSA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gil7LSC+niO7IVwjAX8DOwwHEnNmaYCie1TBxg2ket8rUMACjizOsqICJu/vLIRPn
	 vnvPP9Q3uxiTVOenvXLuySG71GvgLL98lsl++T4lgoDmEosrDi3L6FhCqGLMC1VLAj
	 aQ5rso+6973bH0KJ2k5MKWEpM4jyjb1qIdLllZSE=
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
Subject: [RFC PATCH 24/28] media: mali-vpu: add decoder EOS and DRC handling
Date: Thu, 19 Nov 2026 15:37:54 +0000
Message-ID: <20261119153758.1426673-25-charvi.mehta@arm.com>
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

Add decoder START/STOP command support and propagate EOS through the
firmware protocol. Handle sequence and allocation parameters, queue
flush responses, dynamic resolution changes, and V4L2 EOS/
source-change events.
Track capture reconfiguration state and prevent stale pre-DRC buffers
from being submitted back to firmware.

Signed-off-by: Shobhit Pandey <shobhit.pandey@arm.com>
---
 .../platform/arm/mali-vpu/mali-vpu-dec.c      |  29 ++++
 .../platform/arm/mali-vpu/mali-vpu-dec.h      |   4 +
 .../platform/arm/mali-vpu/mali-vpu-firmware.c | 102 ++++++++++-
 .../platform/arm/mali-vpu/mali-vpu-firmware.h |  38 +++++
 .../arm/mali-vpu/mali-vpu-protocol-def-v3.h   |  64 +++++++
 .../platform/arm/mali-vpu/mali-vpu-session.c  | 158 +++++++++++++++++-
 .../platform/arm/mali-vpu/mali-vpu-session.h  |   3 +
 .../platform/arm/mali-vpu/mali-vpu-vidioc.c   |   3 +
 8 files changed, 390 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
index 51d509abb9dd1..7e34c24ae050f 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
@@ -23,6 +23,7 @@ void mali_vpu_session_init_dec(struct mali_vpu_session *sess)
 	sess->num_ctrls_caps	= variant_ctrls->num_dec_ctrls;
 
 	sess->min_buffers_required = 3;	/* For CAPTURE/dst queue */
+	sess->drc_pending	= false;
 }
 
 int mali_vpu_ctrl_set_ignore_stream_headers(struct mali_vpu_session *sess,
@@ -64,3 +65,31 @@ int mali_vpu_ctrl_set_frame_reordering(struct mali_vpu_session *sess, u32 cid,
 
 	return mali_vpu_session_fw_send_set_option(sess, &option);
 }
+
+int mali_vpu_decoder_cmd(struct file *filp, void *priv, struct v4l2_decoder_cmd *cmd)
+{
+	struct mali_vpu_session *sess = mali_vpu_get_session(filp);
+	int ret;
+
+	ret = v4l2_m2m_ioctl_try_decoder_cmd(filp, priv, cmd);
+	if (ret)
+		return ret;
+
+	mutex_lock(&sess->vq_lock);
+
+	switch (cmd->cmd) {
+	case V4L2_DEC_CMD_STOP:
+		ret = mali_vpu_session_fw_send_eos(sess);
+		break;
+	case V4L2_DEC_CMD_START:
+		vb2_clear_last_buffer_dequeued(v4l2_m2m_get_dst_vq(sess->m2m_ctx));
+		ret = 0;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	mutex_unlock(&sess->vq_lock);
+	return ret;
+}
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h
index e323b38475c81..a108aaaa4a959 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.h
@@ -8,7 +8,9 @@
 
 #include <linux/types.h>
 
+struct file;
 struct mali_vpu_session;
+struct v4l2_decoder_cmd;
 
 void mali_vpu_session_init_dec(struct mali_vpu_session *sess);
 
@@ -16,4 +18,6 @@ void mali_vpu_session_init_dec(struct mali_vpu_session *sess);
 int mali_vpu_ctrl_set_ignore_stream_headers(struct mali_vpu_session *sess, u32 cid, s64 value);
 int mali_vpu_ctrl_set_frame_reordering(struct mali_vpu_session *sess, u32 cid, s64 value);
 
+int mali_vpu_decoder_cmd(struct file *filp, void *priv, struct v4l2_decoder_cmd *cmd);
+
 #endif /* __MALI_VPU_DEC_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
index 4e3eaecb8ebee..55bad502cae0b 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
@@ -800,6 +800,43 @@ int mali_vpu_fw_send_set_option(struct mali_vpu_fw *fw,
 	return ret;
 }
 
+int mali_vpu_fw_send_flush_src(struct mali_vpu_fw *fw)
+{
+	int ret;
+
+	ret = mali_vpu_fw_write_msg(fw, &fw->msg_host, &fw->msg_mve, MVE_REQUEST_CODE_INPUT_FLUSH,
+				    NULL, 0);
+	if (!ret)
+		fw->pending_response_count++;
+
+	return ret;
+}
+
+int mali_vpu_fw_send_flush_dst(struct mali_vpu_fw *fw)
+{
+	int ret;
+
+	ret = mali_vpu_fw_write_msg(fw, &fw->msg_host, &fw->msg_mve, MVE_REQUEST_CODE_OUTPUT_FLUSH,
+				    NULL, 0);
+	if (!ret)
+		fw->pending_response_count++;
+
+	return ret;
+}
+
+int mali_vpu_fw_send_eos(struct mali_vpu_fw *fw)
+{
+	struct mve_buffer_bitstream bs_buffer = {
+		.host_handle        = 0,
+		.bitstream_buf_addr = MVE_MEM_REGION_PROTECTED_ADDR_BEGIN,
+		.bitstream_flags    = MVE_BUFFER_BITSTREAM_FLAG_EOS,
+	};
+
+	return mali_vpu_fw_write_msg(fw, &fw->buf_in_host, &fw->buf_in_mve,
+				     MVE_BUFFER_CODE_BITSTREAM, &bs_buffer,
+				     sizeof(bs_buffer));
+}
+
 static struct mali_vpu_buffer *
 mali_vpu_fw_resolve_returned_buffer(struct mali_vpu_fw *fw,
 				    u64 host_handle,
@@ -831,15 +868,21 @@ mali_vpu_fw_resolve_returned_buffer(struct mali_vpu_fw *fw,
 	return vpu_buf;
 }
 
-static int
-mali_vpu_convert_buffer_frame(struct mali_vpu_fw *fw,
-			      struct mali_vpu_fw_msg *msg,
-			      u32 buf_type,
-			      struct mve_buffer_frame *mve_frame_buf)
+static int mali_vpu_convert_buffer_frame(struct mali_vpu_fw *fw,
+					 struct mali_vpu_fw_msg *msg,
+					 u32 buf_type,
+					 struct mve_buffer_frame *mve_frame_buf)
 {
 	struct mali_vpu_buffer *vpu_buf;
 	unsigned int i;
 
+	/* NULL host handle with the EOS flag denotes a firmware-generated EOS marker. */
+	if (!mve_frame_buf->host_handle &&
+	    mve_frame_buf->frame_flags & MVE_BUFFER_FRAME_FLAG_EOS) {
+		msg->code = MALI_VPU_FW_CODE_EOS;
+		return 0;
+	}
+
 	vpu_buf = mali_vpu_fw_resolve_returned_buffer(fw,
 						      mve_frame_buf->host_handle,
 						      buf_type);
@@ -880,10 +923,18 @@ mali_vpu_convert_buffer_bitstream(struct mali_vpu_fw *fw,
 				  u32 buf_type,
 				  struct mve_buffer_bitstream *mve_stream_buf)
 {
-	struct mali_vpu_buffer *vpu_buf =
-		mali_vpu_fw_resolve_returned_buffer(fw,
-						    mve_stream_buf->host_handle,
-						    buf_type);
+	struct mali_vpu_buffer *vpu_buf;
+
+	/* NULL host handle with the EOS flag denotes a firmware-generated EOS marker. */
+	if (!mve_stream_buf->host_handle &&
+	    mve_stream_buf->bitstream_flags & MVE_BUFFER_BITSTREAM_FLAG_EOS) {
+		msg->code = MALI_VPU_FW_CODE_EOS;
+		return 0;
+	}
+
+	vpu_buf = mali_vpu_fw_resolve_returned_buffer(fw,
+						      mve_stream_buf->host_handle,
+						      buf_type);
 	if (IS_ERR(vpu_buf))
 		return PTR_ERR(vpu_buf);
 
@@ -954,6 +1005,8 @@ int mali_vpu_fw_parse_msg(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *msg)
 		struct mve_response_set_option_confirm set_option_confirm;
 		struct mve_response_set_option_fail set_option_fail;
 		struct mve_response_state_change state_change;
+		struct mve_response_frame_alloc_parameters alloc_params;
+		struct mve_response_sequence_parameters seq_params;
 		struct mve_response_error error;
 	} fw_msg = {};
 	size_t size = sizeof(fw_msg);
@@ -1053,6 +1106,37 @@ int mali_vpu_fw_parse_msg(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *msg)
 		ret = mali_vpu_fw_get_buffer(fw, buf_host_page, buf_mve_page, msg,
 					     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 		break;
+	case MVE_RESPONSE_CODE_FRAME_ALLOC_PARAM:
+		if (size != sizeof(fw_msg.alloc_params))
+			return -EPROTO;
+
+		msg->code = MALI_VPU_FW_CODE_ALLOC_PARAM;
+		msg->data.alloc_params.width = fw_msg.alloc_params.planar_alloc_frame_width;
+		msg->data.alloc_params.height = fw_msg.alloc_params.planar_alloc_frame_height;
+		break;
+	case MVE_RESPONSE_CODE_SEQUENCE_PARAMETERS:
+		if (size != sizeof(fw_msg.seq_params))
+			return -EPROTO;
+
+		msg->code = MALI_VPU_FW_CODE_SEQUENCE_PARAMS;
+		msg->data.seq_params.planar.buffers_min = fw_msg.seq_params.num_buffers_planar;
+		break;
+	case MVE_RESPONSE_CODE_INPUT_FLUSHED:
+		msg->code = MALI_VPU_FW_CODE_INPUT_FLUSH;
+
+		if (fw->pending_response_count == 0)
+			return -EPROTO;
+
+		fw->pending_response_count--;
+		break;
+	case MVE_RESPONSE_CODE_OUTPUT_FLUSHED:
+		msg->code = MALI_VPU_FW_CODE_OUTPUT_FLUSH;
+
+		if (fw->pending_response_count == 0)
+			return -EPROTO;
+
+		fw->pending_response_count--;
+		break;
 	case MVE_RESPONSE_CODE_ERROR: {
 		size_t message_offset = offsetof(struct mve_response_error, message);
 		size_t message_size;
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
index c936730698837..ca90cc71ac64e 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
@@ -84,6 +84,29 @@ struct mali_vpu_fw_set_option {
 	};
 };
 
+/**
+ * struct mali_vpu_fw_seq_param - Sequence parameters.
+ * @planar: Planar output-buffer requirements.
+ * @planar.buffers_min:	Minimum number of planar buffers required.
+ */
+struct mali_vpu_fw_seq_param {
+	struct {
+		u32 buffers_min;
+	} planar;
+};
+
+/**
+ * struct mali_vpu_fw_alloc_param - Allocation parameters
+ * @height: in pixels
+ * @width: in pixels
+ *
+ * Dimensions of the decoded frame buffer
+ */
+struct mali_vpu_fw_alloc_param {
+	u32 height;
+	u32 width;
+};
+
 /**
  * struct mali_vpu_fw_error - Firmware error message.
  * @error_code: What kind of error that was reported.
@@ -116,6 +139,11 @@ struct mali_vpu_fw_error {
  * @MALI_VPU_FW_CODE_STATE_CHANGE: Firmware state-change request or response.
  * @MALI_VPU_FW_CODE_SWITCH_IN: Firmware was booted on a Core in a session.
  * @MALI_VPU_FW_CODE_SWITCH_OUT: The last core in a session was switched out.
+ * @MALI_VPU_FW_CODE_EOS: Firmware returned an end-of-stream marker.
+ * @MALI_VPU_FW_CODE_INPUT_FLUSH: Firmware successfully completed a OUTPUT queue flush.
+ * @MALI_VPU_FW_CODE_OUTPUT_FLUSH: Firmware successfully completed a CAPTURE queue flush.
+ * @MALI_VPU_FW_CODE_SEQUENCE_PARAMS: Firmware reported new sequence parameters.
+ * @MALI_VPU_FW_CODE_ALLOC_PARAM: Firmware reported new frame allocation parameters.
  * @MALI_VPU_FW_CODE_UNKNOWN: Unrecognized firmware message.
  * @MALI_VPU_FW_CODE_MAX: Sentinel marking the end of the message-code enum.
  */
@@ -131,6 +159,11 @@ enum mali_vpu_fw_code {
 	MALI_VPU_FW_CODE_STATE_CHANGE,       /* Driver <-> Firmware. */
 	MALI_VPU_FW_CODE_SWITCH_IN,          /* Driver <- Firmware. */
 	MALI_VPU_FW_CODE_SWITCH_OUT,         /* Driver <-> Firmware. */
+	MALI_VPU_FW_CODE_EOS,                /* Driver <- Firmware. */
+	MALI_VPU_FW_CODE_INPUT_FLUSH,        /* Driver <- Firmware. */
+	MALI_VPU_FW_CODE_OUTPUT_FLUSH,       /* Driver <- Firmware. */
+	MALI_VPU_FW_CODE_SEQUENCE_PARAMS,    /* Driver <- Firmware. */
+	MALI_VPU_FW_CODE_ALLOC_PARAM,        /* Driver <- Firmware. */
 	MALI_VPU_FW_CODE_UNKNOWN,            /* Driver <- Firmware. */
 	MALI_VPU_FW_CODE_MAX
 };
@@ -147,6 +180,8 @@ struct mali_vpu_fw_msg {
 		struct mali_vpu_fw_job job;
 		struct mali_vpu_fw_error error;
 		struct mali_vpu_buffer *vpu_buf;
+		struct mali_vpu_fw_alloc_param alloc_params;
+		struct mali_vpu_fw_seq_param seq_params;
 	} data;
 };
 
@@ -260,6 +295,9 @@ int mali_vpu_fw_send_buffer(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *fw_m
 int mali_vpu_fw_send_ping(struct mali_vpu_fw *fw);
 int mali_vpu_fw_send_state_change(struct mali_vpu_fw *fw, enum mali_vpu_fw_state state);
 int mali_vpu_fw_send_set_option(struct mali_vpu_fw *fw, struct mali_vpu_fw_set_option *option);
+int mali_vpu_fw_send_eos(struct mali_vpu_fw *fw);
+int mali_vpu_fw_send_flush_src(struct mali_vpu_fw *fw);
+int mali_vpu_fw_send_flush_dst(struct mali_vpu_fw *fw);
 int mali_vpu_fw_parse_msg(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *msg);
 int mali_vpu_fw_get_region(enum mali_vpu_fw_region region, mali_vpu_mmu_va *begin,
 			   mali_vpu_mmu_va *end);
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
index 7f3a13ec744b9..cb4533a367957 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
@@ -224,6 +224,8 @@ struct mve_msg_header {
 		 */
 		#define MVE_REQUEST_CODE_GO                   (1001) /* no extra data */
 		#define MVE_REQUEST_CODE_STOP                 (1002) /* no extra data */
+		#define MVE_REQUEST_CODE_INPUT_FLUSH          (1003) /* no extra data */
+		#define MVE_REQUEST_CODE_OUTPUT_FLUSH         (1004) /* no extra data */
 		#define MVE_REQUEST_CODE_PING                 (1006) /* no extra data */
 		#define MVE_REQUEST_CODE_JOB                  (1009) /* struct mve_request_job */
 		#define MVE_REQUEST_CODE_SET_OPTION           (1010) /* struct
@@ -245,12 +247,18 @@ struct mve_msg_header {
 		#define MVE_RESPONSE_CODE_INPUT               (2005)
 		/* no extra data, but buffer placed in buffer queue */
 		#define MVE_RESPONSE_CODE_OUTPUT              (2006)
+		#define MVE_RESPONSE_CODE_INPUT_FLUSHED       (2007)
+		#define MVE_RESPONSE_CODE_OUTPUT_FLUSHED      (2008)
 		#define MVE_RESPONSE_CODE_PONG                (2009)
 		/* struct mve_response_error */
 		#define MVE_RESPONSE_CODE_ERROR               (2010)
 		/* struct mve_response_state_change */
 		#define MVE_RESPONSE_CODE_STATE_CHANGE        (2011)
 		#define MVE_RESPONSE_CODE_IDLE                (2013)
+		/* struct mve_response_frame_alloc_parameters */
+		#define MVE_RESPONSE_CODE_FRAME_ALLOC_PARAM   (2014)
+		/* struct mve_response_sequence_parameters */
+		#define MVE_RESPONSE_CODE_SEQUENCE_PARAMETERS (2015)
 		/* struct mve_response_set_option_fail */
 		#define MVE_RESPONSE_CODE_SET_OPTION_FAIL     (2017)
 
@@ -356,6 +364,62 @@ struct mve_response_job_dequeued {
 	u32 valid_job;
 };
 
+/* Decode only: This message is sent from MVE to the host so that it can
+ * allocate large enough output buffers. Output buffers that are to small
+ * will be returned to the host marked as 'rejected'.
+ */
+struct mve_response_frame_alloc_parameters {
+	/* Please note that the below information is a hint
+	 * for what buffers to allocate, it does not say
+	 * what actual resolution an output picture has.
+	 */
+
+	/* To use if allocating PLANAR YUV output buffers: */
+	u16 planar_alloc_frame_width;
+	u16 planar_alloc_frame_height;
+	u32 afbc_alloc_bytes;
+	u32 afbc_alloc_bytes_downscaled;
+	u16 afbc_width_in_superblocks;
+	u16 afbc_width_in_superblocks_downscaled;
+
+	/* For PLANAR YUV output, every plane's address need to be adjusted to get
+	 * optimal AXI bursts when the pixel data is written, the values below may
+	 * be used to calculate address offsets.
+	 */
+	u16 cropx;
+	u16 cropy;
+
+	u32 mbinfo_alloc_bytes; /* Only for debugging */
+};
+
+/* Decode only: This message is sent from MVE to the host so that it can
+ * allocate suitable output buffers. The needed size of the buffer is sent
+ * in a separate message (above).
+ * When MVE sends the message below, it enters a waiting-state and will not
+ * make any progress until the host sends an output-flush command, upon
+ * which MVE will return all output buffers, followed by a message saying
+ * that the output has been flushed. Only then should the host start
+ * enqueueing new output buffers.
+ */
+struct mve_response_sequence_parameters {
+	/* Other stream parameters affecting buffer allocation,
+	 * any change in these values will trigger a flush.
+	 */
+	u8 interlace;              /* 0 or 1 */
+	u8 chroma_format;
+		#define MVE_CHROMA_FORMAT_MONO (0x0)
+		#define MVE_CHROMA_FORMAT_420  (0x1)
+		#define MVE_CHROMA_FORMAT_422  (0x2)
+		#define MVE_CHROMA_FORMAT_440  (0x3)
+		#define MVE_CHROMA_FORMAT_ARGB (0x4)
+	u8 bitdepth_luma;          /* 8, 9 or 10 */
+	u8 bitdepth_chroma;        /* 8, 9 or 10 */
+	u8 num_buffers_planar;     /* number of planar buffers needed */
+	u8 num_buffers_afbc;
+	u8 range_mapping_enabled;
+	u8 reserved0;
+};
+
 /*
  * Fatal error message from firmware, if sent then no further
  * operation is possible.
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
index ea80aacd930d8..fcfad581223be 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
@@ -9,6 +9,7 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
 #include "mali-vpu-session.h"
@@ -71,6 +72,14 @@ static int mali_vpu_set_port_defaults(struct mali_vpu_session *sess)
 				    fmsz->width_default, fmsz->height_default);
 }
 
+static bool mali_vpu_both_queues_streaming(const struct mali_vpu_session *sess)
+{
+	struct vb2_queue *src_q = v4l2_m2m_get_src_vq(sess->m2m_ctx);
+	struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(sess->m2m_ctx);
+
+	return vb2_is_streaming(src_q) && vb2_is_streaming(dst_q);
+}
+
 static bool
 mali_vpu_both_ports_unrequested(struct mali_vpu_session *sess)
 {
@@ -157,6 +166,67 @@ int mali_vpu_session_fw_send_set_option(struct mali_vpu_session *sess,
 	return 0;
 }
 
+int mali_vpu_session_fw_send_eos(struct mali_vpu_session *sess)
+{
+	int ret;
+
+	if (sess->error)
+		return sess->error;
+
+	if (!mali_vpu_both_queues_streaming(sess))
+		return 0;
+
+	ret = mali_vpu_fw_send_eos(&sess->fw);
+	if (ret)
+		return ret;
+
+	mali_vpu_sched_send_irq(&sess->sched_sess, &sess->vpu_dev->sched);
+	return 0;
+}
+
+static int mali_vpu_session_fw_send_flush(struct mali_vpu_session *sess, bool to_src)
+{
+	int ret;
+
+	if (to_src)
+		ret = mali_vpu_fw_send_flush_src(&sess->fw);
+	else
+		ret = mali_vpu_fw_send_flush_dst(&sess->fw);
+
+	if (ret)
+		return ret;
+
+	mali_vpu_sched_send_irq(&sess->sched_sess, &sess->vpu_dev->sched);
+	return 0;
+}
+
+static int mali_vpu_session_send_drc_event(struct mali_vpu_session *sess)
+{
+	const struct v4l2_event event = {
+		.type                 = V4L2_EVENT_SOURCE_CHANGE,
+		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION
+	};
+
+	v4l2_event_queue_fh(&sess->fh, &event);
+	return 0;
+}
+
+static int
+mali_vpu_session_update_capture_format(struct mali_vpu_session *sess,
+				       const struct mali_vpu_fw_alloc_param alloc_params)
+{
+	struct v4l2_pix_format_mplane *src = &sess->port_src.curr_fmt.fmt.pix_mp;
+	struct v4l2_pix_format_mplane *dst = &sess->port_dst.curr_fmt.fmt.pix_mp;
+	int ret = 0;
+
+	src->width = alloc_params.width;
+	src->height = alloc_params.height;
+
+	ret = v4l2_fill_pixfmt_mp(dst, dst->pixelformat, alloc_params.width,
+				  alloc_params.height);
+	return ret;
+}
+
 static int mali_vpu_buffer_map_fw_region(struct mali_vpu_session *sess,
 					 struct mali_vpu_buffer *vpu_buf)
 {
@@ -350,6 +420,7 @@ static void mali_vpu_session_buffer_done(struct mali_vpu_session *sess,
 {
 	struct vb2_v4l2_buffer *vbuf = &vpu_buf->m2m_buf.vb;
 	struct vb2_buffer *vb2_buf = &vbuf->vb2_buf;
+	struct vb2_queue *q = v4l2_m2m_get_vq(sess->m2m_ctx, vb2_buf->type);
 	struct mali_vpu_port *port;
 
 	if (vb2_buf->state != VB2_BUF_STATE_ACTIVE) {
@@ -373,6 +444,17 @@ static void mali_vpu_session_buffer_done(struct mali_vpu_session *sess,
 		v4l2_m2m_dst_buf_remove_by_buf(sess->m2m_ctx, vbuf);
 
 	v4l2_m2m_buf_done(vbuf, state);
+
+	if (V4L2_TYPE_IS_CAPTURE(vpu_buf->type) &&
+	    !q->last_buffer_dequeued &&
+	    (vbuf->flags & V4L2_BUF_FLAG_LAST) &&
+	    !sess->drc_pending) {
+		const struct v4l2_event event = {
+			.type = V4L2_EVENT_EOS,
+		};
+
+		v4l2_event_queue_fh(&sess->fh, &event);
+	}
 }
 
 static void mali_vpu_session_set_error(struct mali_vpu_session *sess, int error)
@@ -403,6 +485,7 @@ static void mali_vpu_session_set_error(struct mali_vpu_session *sess, int error)
 static int mali_vpu_session_handle_fw_msg(struct mali_vpu_session *sess,
 					  const struct mali_vpu_fw_msg *fw_msg)
 {
+	int ret = 0;
 	switch (fw_msg->code) {
 	case MALI_VPU_FW_CODE_ERROR:
 		dev_warn(sess->vpu_dev->dev, "firmware rsp: Error. code=%u, message=%s\n",
@@ -464,6 +547,49 @@ static int mali_vpu_session_handle_fw_msg(struct mali_vpu_session *sess,
 	case MALI_VPU_FW_CODE_IDLE:
 		dev_dbg(sess->vpu_dev->dev, "fw entered Idle/sleeping state.\n");
 		return 0;
+	case MALI_VPU_FW_CODE_EOS:
+		/*
+		 * This is driver generated dummy EOS buffer response no action
+		 * required as EOS is handled via buffer flags.
+		 */
+		return 0;
+	case MALI_VPU_FW_CODE_INPUT_FLUSH:
+		/*
+		 * Acknowledge completion of the input flush. No additional session
+		 * state update is required.
+		 */
+		return 0;
+	case MALI_VPU_FW_CODE_OUTPUT_FLUSH:
+		dev_dbg(sess->vpu_dev->dev, "fw rsp: Dst queue flushed\n");
+		if (sess->role == MALI_VPU_DECODER && sess->drc_pending)
+			return mali_vpu_session_send_drc_event(sess);
+
+		return 0;
+	case MALI_VPU_FW_CODE_ALLOC_PARAM:
+		ret = mali_vpu_session_update_capture_format(sess, fw_msg->data.alloc_params);
+		if (!ret)
+			sess->drc_pending = true;
+
+		return ret;
+	case MALI_VPU_FW_CODE_SEQUENCE_PARAMS: {
+		struct vb2_queue *dst_q;
+		u32 buffers_min;
+
+		buffers_min = fw_msg->data.seq_params.planar.buffers_min;
+		dst_q = v4l2_m2m_get_dst_vq(sess->m2m_ctx);
+
+		if (!buffers_min || buffers_min > dst_q->max_num_buffers) {
+			dev_err(sess->vpu_dev->dev,
+				"invalid minimum buffer count %u, max is %u\n",
+				buffers_min, dst_q->max_num_buffers);
+			return -EPROTO;
+		}
+
+		sess->min_buffers_required = buffers_min;
+		dst_q->min_reqbufs_allocation = sess->min_buffers_required;
+
+		return mali_vpu_session_fw_send_flush(sess, false);
+	}
 	case MALI_VPU_FW_CODE_UNKNOWN:
 	case MALI_VPU_FW_CODE_MAX:
 	default:
@@ -668,6 +794,22 @@ int mali_vpu_session_qbuf(struct mali_vpu_session *sess, struct vb2_buffer *vb2_
 	if (sess->error)
 		return sess->error;
 
+	/*
+	 * After SEQUENCE_PARAMS and DRC fw has flushed the destination queue,
+	 * but userspace can briefly requeue one of the returned buffer before
+	 * it tears down the old destination buffer allocation with REQBUF(0).
+	 * Do not give the requeued buffer back to fw as it belongs to pre DRC
+	 * allocation which will be unmapped immediately afterwards.
+	 */
+	if (sess->drc_pending && sess->role == MALI_VPU_DECODER &&
+	    mali_vpu_is_raw_q(sess, vb2_buf->type) &&
+	    port->stream_requested) {
+		v4l2_buf->flags |= V4L2_BUF_FLAG_LAST;
+		mali_vpu_session_buffer_done(sess, vpu_buf, VB2_BUF_STATE_DONE);
+
+		return 0;
+	}
+
 	if (!port->stream_requested ||
 	    !mali_vpu_session_can_stream(sess) ||
 	    sess->fw_state != MALI_VPU_FW_STATE_RUNNING) {
@@ -805,6 +947,9 @@ int mali_vpu_session_prepare_streaming(struct mali_vpu_session *sess,
 		}
 	}
 
+	if (sess->role == MALI_VPU_DECODER && mali_vpu_is_raw_q(sess, type))
+		sess->drc_pending = false;
+
 	port->sequence = 0;
 
 	return 0;
@@ -834,7 +979,8 @@ int mali_vpu_session_streamoff(struct mali_vpu_session *sess, enum v4l2_buf_type
 	    !sess->sched_sess.lsid)
 		return 0;
 
-	if (mali_vpu_is_raw_q(sess, type)) {
+	if (sess->drc_pending && sess->role == MALI_VPU_DECODER &&
+	    mali_vpu_is_raw_q(sess, type)) {
 		ret = mali_vpu_session_wait_pending(sess);
 		if (ret)
 			goto err_session;
@@ -846,7 +992,15 @@ int mali_vpu_session_streamoff(struct mali_vpu_session *sess, enum v4l2_buf_type
 	if (ret)
 		goto err_session;
 
-	return mali_vpu_session_wait_pending(sess);
+	ret = mali_vpu_session_fw_send_flush(sess, V4L2_TYPE_IS_OUTPUT(type));
+	if (ret)
+		goto err_session;
+
+	ret = mali_vpu_session_wait_pending(sess);
+	if (ret)
+		goto err_session;
+
+	return 0;
 
 err_session:
 	mali_vpu_session_set_error(sess, ret);
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
index 7565a680397a8..45d0b6710aced 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
@@ -115,6 +115,7 @@ enum mali_vpu_session_fw_bin_state {
  * @sched_sess: Scheduler state used to map this session to an LSID.
  * @ncores: Number of cores assigned to this session by scheduler.
  * @error: Fatal session error code.
+ * @drc_pending: Dynamic resolution change is waiting for CAPTURE reconfigure.
  */
 struct mali_vpu_session {
 	struct mali_vpu_dev		*vpu_dev;
@@ -147,6 +148,7 @@ struct mali_vpu_session {
 	struct mali_vpu_sched_session	sched_sess;
 	u32				ncores;
 	int				error;
+	bool				drc_pending;
 };
 
 int mali_vpu_session_init(struct mali_vpu_session *sess);
@@ -160,6 +162,7 @@ int mali_vpu_session_streamoff(struct mali_vpu_session *sess, enum v4l2_buf_type
 void mali_vpu_session_irq(struct mali_vpu_session *sess);
 int mali_vpu_session_qbuf(struct mali_vpu_session *sess, struct vb2_buffer *vb2_buf);
 void mali_vpu_session_reset_ts_metadata(struct mali_vpu_session *sess);
+int mali_vpu_session_fw_send_eos(struct mali_vpu_session *sess);
 
 static inline struct mali_vpu_session *mali_vpu_get_session(struct file *filp)
 {
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
index 0fcd3835e52d3..f8d93c849a34f 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
@@ -15,6 +15,7 @@
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mem2mem.h>
 
+#include "mali-vpu-dec.h"
 #include "mali-vpu-formats.h"
 #include "mali-vpu-session.h"
 #include "mali-vpu-variant.h"
@@ -359,4 +360,6 @@ const struct v4l2_ioctl_ops mali_vpu_ioctl_ops_dec = {
 	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
 	.vidioc_streamon		= v4l2_m2m_ioctl_streamon,
 	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
+	.vidioc_decoder_cmd		= mali_vpu_decoder_cmd,
+	.vidioc_try_decoder_cmd		= v4l2_m2m_ioctl_try_decoder_cmd,
 };
-- 
2.43.0

