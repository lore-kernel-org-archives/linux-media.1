Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102757;
	b=r2aIWU+ve1qIWXN8VSLjkO9Xu0zSxkaP7N0nR242vowt2fOh+Sfk+LcCIkBQdFPiEqtB
	 8crINFAaWkXthDHpY2PIQ1BkilCt9N3s9A0ccQIM04G9womxW5FxMMP207FBNeLfzAYaa
	 XTuKlvdCwqmeC3U25JYd0cEYr+auwlwrRzjfxGDChUpHaZSozU41lET8GFYbnFGLZtc3b
	 oYfGdHUNMMla1WUK/6kiX+a5+IohVlnhvB3arHmdf6avvIxM6BUUajLs8A0TzbAkbdbDk
	 ohgYuP1uSj+LoH1n87mDfPoz5VLqJGI3Jdj4qjy47Dn4cQkirbKMXen2xd8aR6xAHNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102757;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=txS/ajN3QhD7o0TTiQCauSNpoO6m2ptH407gb/zqxSA=;
	b=V/2bM1cOse3eCQLac7bqwJEx18lJXmnj3T7fZbFWfuuSSGStgDcoC02leAyrWZw1T+cJ
	 0B+hoar0eSC6wY7Jfjb5MRIQGDkSHcZl4Qx3u5wirgbM/A7U5ENfjHXFG3YH7X9U5tSIK
	 fnYa1l1IhTg8byz0RQFsEIYAVRi16lmr+IV5vqKErB4VfdxxznDdBqW85L3XPYShG9Xqb
	 pDylmKM3SfGfDNKIzcUXAouOlt1JL43X3p5YBBhgL6xbpfY2CKc8m49nYpxyij8k4tsd9
	 IlC7gfmGJs1X+ymPNyubj9MYqWEOvnpurOzBI8ejex5UeC4S6ggNxN1X7wsP7dT3LCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GsiiseG2;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6D760A5BC9;
	Thu, 19 Nov 2026 15:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B6D760A5BC9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GsiiseG2
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C6EA1C00;
	Thu, 19 Nov 2026 07:39:11 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B56093F882;
	Thu, 19 Nov 2026 07:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102754; bh=jOApOakW3PEUtU+F7w+CjVpKV6FyDdpXz0lJK9NGUoo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GsiiseG2ObD4l8iYRzFv6E3Z2OWxNkl178Jjm+zcM6pat36Akcg/IfVOcPNGhwEXs
	 cY6B2XB0QHoErirxehLpg6f2W5znTqMaZ3rtHJIsoisAEJ/7YH0TQiS6JivirXfcdO
	 aL5tA0LPWq5JS8V4hC6cZIMmNEQIxBvitc9z3An4=
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
Subject: [RFC PATCH 26/28] media: mali-vpu: handle firmware event responses
Date: Thu, 19 Nov 2026 15:37:56 +0000
Message-ID: <20261119153758.1426673-27-charvi.mehta@arm.com>
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

Add protocol definitions needed to parse firmware event responses.
Report corrupt and unsupported streams, and propagate unsupported-stream
events to the session as -EOPNOTSUPP. Ignore informational events that
require no session action.

Also retain sequence bit-depth and interlace information, and reject
interlaced or non-8-bit streams that aren't supported by the driver yet.

Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 .../platform/arm/mali-vpu/mali-vpu-firmware.c | 44 ++++++++++
 .../platform/arm/mali-vpu/mali-vpu-firmware.h | 13 +++
 .../arm/mali-vpu/mali-vpu-protocol-def-v3.h   | 87 +++++++++++++++++++
 .../platform/arm/mali-vpu/mali-vpu-session.c  | 19 ++++
 4 files changed, 163 insertions(+)

diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
index 34d57b288a682..99d191b194bfe 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
@@ -1036,6 +1036,7 @@ int mali_vpu_fw_parse_msg(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *msg)
 		struct mve_response_frame_alloc_parameters alloc_params;
 		struct mve_response_sequence_parameters seq_params;
 		struct mve_buffer_param buffer_param;
+		struct mve_response_event event;
 		struct mve_response_error error;
 	} fw_msg = {};
 	size_t size = sizeof(fw_msg);
@@ -1149,6 +1150,9 @@ int mali_vpu_fw_parse_msg(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *msg)
 
 		msg->code = MALI_VPU_FW_CODE_SEQUENCE_PARAMS;
 		msg->data.seq_params.planar.buffers_min = fw_msg.seq_params.num_buffers_planar;
+		msg->data.seq_params.bitdepth.luma = fw_msg.seq_params.bitdepth_luma;
+		msg->data.seq_params.bitdepth.chroma = fw_msg.seq_params.bitdepth_chroma;
+		msg->data.seq_params.interlaced = fw_msg.seq_params.interlace;
 		break;
 	case MVE_RESPONSE_CODE_INPUT_FLUSHED:
 		msg->code = MALI_VPU_FW_CODE_INPUT_FLUSH;
@@ -1169,6 +1173,46 @@ int mali_vpu_fw_parse_msg(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *msg)
 	case MVE_BUFFER_CODE_PARAM:
 		ret =  mali_vpu_convert_buffer_param(msg, &fw_msg.buffer_param, size);
 		break;
+	case MVE_RESPONSE_CODE_EVENT: {
+		size_t message_offset = offsetof(struct mve_response_event, event_data.message);
+		size_t message_size;
+
+		msg->code = MALI_VPU_FW_CODE_EVENT;
+
+		if (size < sizeof(fw_msg.event.event_code))
+			return -EPROTO;
+
+		switch (fw_msg.event.event_code) {
+		case MVE_EVENT_ERROR_STREAM_CORRUPT:
+			if (size <= message_offset)
+				return -EPROTO;
+
+			message_size = min(size - message_offset,
+					   sizeof(fw_msg.event.event_data.message));
+
+			dev_warn_ratelimited(fw->dev,
+					     "firmware reports corrupt stream: %.*s\n",
+					     (int)message_size,
+					     fw_msg.event.event_data.message);
+
+			break;
+		case MVE_EVENT_ERROR_STREAM_NOT_SUPPORTED:
+			if (size <= message_offset)
+				return -EPROTO;
+
+			message_size = min(size - message_offset,
+					   sizeof(fw_msg.event.event_data.message));
+			dev_warn_ratelimited(fw->dev,
+					     "firmware reports unsupported stream: %.*s\n",
+					     (int)message_size,
+					     fw_msg.event.event_data.message);
+			msg->code = MALI_VPU_FW_CODE_STREAM_NOT_SUPPORTED;
+			break;
+		default:
+			break;
+		}
+		break;
+	}
 	case MVE_RESPONSE_CODE_ERROR: {
 		size_t message_offset = offsetof(struct mve_response_error, message);
 		size_t message_size;
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
index 6c46f23ac8638..d3928fdc9133f 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
@@ -86,13 +86,22 @@ struct mali_vpu_fw_set_option {
 
 /**
  * struct mali_vpu_fw_seq_param - Sequence parameters.
+ * @interlaced: Whether the decoded sequence is interlaced.
  * @planar: Planar output-buffer requirements.
  * @planar.buffers_min:	Minimum number of planar buffers required.
+ * @bitdepth: Decoded luma and chroma bitdepths.
+ * @bitdepth.luma: Decoded luma bitdepth.
+ * @bitdepth.chroma: Decoded chroma bitdepth.
  */
 struct mali_vpu_fw_seq_param {
+	bool interlaced;
 	struct {
 		u32 buffers_min;
 	} planar;
+	struct mali_vpu_fw_bitdepth {
+		u32 chroma;
+		u32 luma;
+	} bitdepth;
 };
 
 /**
@@ -146,6 +155,8 @@ struct mali_vpu_fw_error {
  * @MALI_VPU_FW_CODE_ALLOC_PARAM: Firmware reported new frame allocation parameters.
  * @MALI_VPU_FW_CODE_COLOR_DESC: Firmware reported colour-description metadata.
  * @MALI_VPU_FW_CODE_DPB_HELD_FRAMES: Firmware reported the number of frames held in the DPB.
+ * @MALI_VPU_FW_CODE_STREAM_NOT_SUPPORTED: Firmware rejected the coded stream.
+ * @MALI_VPU_FW_CODE_EVENT: Firmware reported an informational event.
  * @MALI_VPU_FW_CODE_UNKNOWN: Unrecognized firmware message.
  * @MALI_VPU_FW_CODE_MAX: Sentinel marking the end of the message-code enum.
  */
@@ -168,6 +179,8 @@ enum mali_vpu_fw_code {
 	MALI_VPU_FW_CODE_ALLOC_PARAM,        /* Driver <- Firmware. */
 	MALI_VPU_FW_CODE_COLOR_DESC,         /* Driver <- Firmware. */
 	MALI_VPU_FW_CODE_DPB_HELD_FRAMES,    /* Driver <- Firmware. */
+	MALI_VPU_FW_CODE_STREAM_NOT_SUPPORTED, /* Driver <- Firmware. */
+	MALI_VPU_FW_CODE_EVENT,              /* Driver <- Firmware. */
 	MALI_VPU_FW_CODE_UNKNOWN,            /* Driver <- Firmware. */
 	MALI_VPU_FW_CODE_MAX
 };
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
index 76dc7bf076c8f..3fe572b180d72 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
@@ -259,6 +259,8 @@ struct mve_msg_header {
 		#define MVE_RESPONSE_CODE_FRAME_ALLOC_PARAM   (2014)
 		/* struct mve_response_sequence_parameters */
 		#define MVE_RESPONSE_CODE_SEQUENCE_PARAMETERS (2015)
+		/* struct mve_response_event (variable size) */
+		#define MVE_RESPONSE_CODE_EVENT               (2016)
 		/* struct mve_response_set_option_fail */
 		#define MVE_RESPONSE_CODE_SET_OPTION_FAIL     (2017)
 
@@ -440,6 +442,91 @@ struct mve_response_error {
 	char message[MVE_MAX_ERROR_MESSAGE_SIZE];
 };
 
+/*
+ * Per-frame processing statistics emitted when firmware profiling is
+ * enabled.
+ */
+struct mve_event_processed {
+	u8 pic_format;
+	u8 qp;
+	u8 pad0;
+	u8 pad1;
+	u32 parse_start_time;	/* Timestamp, absolute time */
+	u32 parse_end_time;	/* Timestamp, absolute time */
+	u32 parse_idle_time;	/* Waiting for in/out buffers or available RAM */
+	u32 pipe_start_time;	/* Timestamp */
+	u32 pipe_end_time;	/* Timestamp, end-start = process time. Idle time while in a frame
+				 * is not measured.
+				 */
+	u32 pipe_idle_time;	/* Always 0 in decode, */
+	u32 parser_coreid;	/* Core used to parse this frame */
+	u32 pipe_coreid;	/* Core used to pipe this frame */
+	u32 bitstream_bits;	/* Number of bitstream bits used for this frame. */
+	u32 intermediate_buffer_size;	/* Size of intermediate (mbinfo/residuals) buffer after this
+					 * frame was parsed.
+					 */
+	u32 total_memory_allocated;	/* after the frame was parsed. Including reference frames */
+	u32 bus_read_bytes;		/* bus read bytes */
+	u32 bus_write_bytes;		/* bus written bytes */
+	u32 afbc_bytes;
+	u32 slice0_end_time;		/* Timestamp, absolute time */
+	u32 stream_start_time;		/* Timestamp, absolute stream start time */
+	u32 stream_open_time;		/* Timestamp, absolute stream open time */
+};
+
+/*
+ * Encoder reference-frame metadata emitted when reference-frame exposure
+ * is enabled.
+ */
+struct mve_event_ref_frame {
+	u32 ref_width;		/* Width of display area in luma pixels */
+	u32 ref_height;		/* Height of display area in luma pixels */
+	u32 ref_mb_width;	/* Width in macroblocks */
+	u32 ref_mb_height;	/* Height in macroblocks */
+	u32 ref_left_crop;	/* Left crop in luma pixels */
+	u32 ref_top_crop;	/* Top crop in luma pixels */
+	u32 ref_frame_size;
+	u32 ref_display_order;
+	u32 ref_addr;
+	u16 bit_width;		/* bit width of the YUV either 8 or 10 */
+	u16 tiled_headers;
+};
+
+/*
+ * Trace-buffer allocations emitted by firmware build with event tracing
+ * enabled.
+ */
+struct mve_event_trace_buffers {
+	u16 reserved;
+	u8 num_cores;
+	u8 rasc_mask;
+		#define MVE_MAX_TRACE_BUFFERS 40
+	/* this array will contain one buffer per rasc in rasc_mask per num_core */
+	struct {
+		u32 rasc_addr;	/* rasc address of the buffer */
+		u32 size;	/* size of the buffer in bytes */
+	} buffers[MVE_MAX_TRACE_BUFFERS];
+};
+
+/*
+ * Firmware event response. Profiling and tracing events are informational,
+ * while stream-error events may require host action.
+ */
+struct mve_response_event {
+	u32 event_code;
+		#define MVE_EVENT_ERROR_STREAM_CORRUPT		(1) /* message, text string */
+		#define MVE_EVENT_ERROR_STREAM_NOT_SUPPORTED	(2) /* message, text string */
+		#define MVE_EVENT_PROCESSED			(3) /* struct mve_event_processed */
+		#define MVE_EVENT_REF_FRAME			(4) /* struct mve_event_ref_frame */
+		#define MVE_EVENT_TRACE_BUFFERS			(5)
+	union {
+		struct mve_event_processed event_processed;
+		struct mve_event_ref_frame event_ref_frame;
+		struct mve_event_trace_buffers event_trace_buffers;
+		char message[MVE_MAX_ERROR_MESSAGE_SIZE];
+	} event_data;
+};
+
 /*
  * When a set-option succeeds, a confirmation message is
  * sent, including the index-code for that particular option.
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
index 411421e175e71..500d80788d0eb 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
@@ -584,6 +584,20 @@ static int mali_vpu_session_handle_fw_msg(struct mali_vpu_session *sess,
 		struct vb2_queue *dst_q;
 		u32 buffers_min;
 
+		if (fw_msg->data.seq_params.interlaced) {
+			dev_err(sess->vpu_dev->dev, "interlaced streams are not supported\n");
+			return -EOPNOTSUPP;
+		}
+
+		if (fw_msg->data.seq_params.bitdepth.luma != 8 ||
+		    fw_msg->data.seq_params.bitdepth.chroma != 8) {
+			dev_err(sess->vpu_dev->dev,
+				"bitdepth luma=%u chroma=%u is not supported\n",
+				fw_msg->data.seq_params.bitdepth.luma,
+				fw_msg->data.seq_params.bitdepth.chroma);
+			return -EOPNOTSUPP;
+		}
+
 		buffers_min = fw_msg->data.seq_params.planar.buffers_min;
 		dst_q = v4l2_m2m_get_dst_vq(sess->m2m_ctx);
 
@@ -599,6 +613,11 @@ static int mali_vpu_session_handle_fw_msg(struct mali_vpu_session *sess,
 
 		return mali_vpu_session_fw_send_flush(sess, false);
 	}
+	case MALI_VPU_FW_CODE_STREAM_NOT_SUPPORTED:
+		return -EOPNOTSUPP;
+	case MALI_VPU_FW_CODE_EVENT:
+		/* No session action is required for informational events. */
+		return 0;
 	case MALI_VPU_FW_CODE_UNKNOWN:
 	case MALI_VPU_FW_CODE_MAX:
 	default:
-- 
2.43.0

