Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102737;
	b=aqUdd+3kWm/9RzP50X43fm/vm2q7q8bhK264GvC+4uWKBIFBacs8hjR7MzOiKSlAn7/T
	 9KzbmiKkfC7l2kmDjXTlKLiffH26Iot4LB8wFwh3OWoHmgKFTXdbqaoMrZpdA9Y8/q/YE
	 Tw3Gt523ZlaHqrtM+6G9Ke48S44vC0FDuPda8XY81Z6ECVWf8MUpUEiLzNZaECxIXRLV4
	 XcYXFdTERQiFiC1bWJCtD37jacimlCokvevhkso2gCtczj5nc7paDmpOvGN0bDKM0sSKF
	 nZREYpB0LAlczqb8iPKdiTykRhlAKaQMNMFy1UvppLrxPDVsZ+wm0dDYofqEvVSbgnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102737;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BOepguIUkYanmYedtnD6jw2GYH1CRp4uJRcOpQns4Dg=;
	b=ME7PqOSlaPaFfK2po8B0glkVHpkDkGf1Nnwq0h9QLLBz2yXmNJJGjiZDNQK4uzW5Uwy4
	 qZ6P7uqyDAk/4uXMMdZ7W0k14XQGcIToFaypAgohoym7dtHUpdwaa/k/w/eeyvhB8CHro
	 XNHiau6/ra6IzEq1p3iODBnHEu9LTPR5yJg/1sScvWg6FSbcggbj/mtVbIhnf+TYsYhmZ
	 GP3X/+DEN/0S2wwhdEYQFMYYuboon311Y42LGScjoXqoo2B5l/a5qvVR6UAKVAtyXoKTV
	 Z3HQk5iOxx0p9OixwsgSx+fGfzUbY3HhvK/21ALnremYPpP2tgOhOtm9xkT8rcbC8Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="GvL/Pxtk";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F86260A2627;
	Thu, 19 Nov 2026 15:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F86260A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GvL/Pxtk
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C50971C0A;
	Thu, 19 Nov 2026 07:38:49 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3AA893F882;
	Thu, 19 Nov 2026 07:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102732; bh=fZ87tdAfH6a6lm5zcc5p7yLrK860BW7RCsvVaWsgGe4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GvL/PxtkAZw8xCoqvoZY7P1cFL41mcOxB7AWUw6CDnYxMnqn953QxjBFQ2WfG+1Fb
	 1JLT+f8Cc3qmE5Zz0ONyD5XBnHsPlnoRWcNFSBxCdVUb36fzjRVQoJGd3b/AKIfegC
	 wciftgFyj5N7BpPK2Pk7SLK256mJmuSge7lYPr0Y=
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
Subject: [RFC PATCH 14/28] media: mali-vpu: route decoder controls to firmware
Date: Thu, 19 Nov 2026 15:37:44 +0000
Message-ID: <20261119153758.1426673-15-charvi.mehta@arm.com>
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

Translate decoder controls to firmware SET_OPTION requests and add
parsing for option confirmation and failures. Validate message payload
sizes and distinguish rejected options from successful requests.

Track outstanding requests awaiting a firmware response.

Use the firmware binary state as the single source of firmware readiness
and remove the redundant readiness boolean.

Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 .../platform/arm/mali-vpu/mali-vpu-controls.c |  40 +++--
 .../platform/arm/mali-vpu/mali-vpu-dec.c      |  18 +-
 .../platform/arm/mali-vpu/mali-vpu-firmware.c | 159 +++++++++++++++++-
 .../platform/arm/mali-vpu/mali-vpu-firmware.h |  66 +++++++-
 .../arm/mali-vpu/mali-vpu-protocol-def-v3.h   |  68 +++++++-
 .../platform/arm/mali-vpu/mali-vpu-session.c  |   7 +-
 .../platform/arm/mali-vpu/mali-vpu-session.h  |   4 +-
 7 files changed, 328 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-controls.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-controls.c
index d4921eddf0fcf..100f9185dbec1 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-controls.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-controls.c
@@ -56,7 +56,7 @@ static int mali_vpu_apply_or_stage_ctrl(struct mali_vpu_session *sess,
 	bool staged;
 	int ret;
 
-	staged = !sess->is_fw_ready;
+	staged = sess->fw_bin_state != MALI_VPU_SESSION_FW_BIN_READY;
 
 	if (!staged) {
 		ret = desc->set(sess, state->cid, value);
@@ -267,7 +267,7 @@ int mali_vpu_apply_staged_controls(struct mali_vpu_session *sess)
 	u32 i;
 	int ret;
 
-	if (!sess->is_fw_ready)
+	if (sess->fw_bin_state != MALI_VPU_SESSION_FW_BIN_READY)
 		return -EINVAL;
 
 	for (i = 0; i < sess->num_ctrls_caps; i++) {
@@ -288,28 +288,36 @@ int mali_vpu_apply_staged_controls(struct mali_vpu_session *sess)
 int mali_vpu_ctrl_set_nalu_format(struct mali_vpu_session *sess, u32 cid,
 				  s64 value)
 {
+	struct mali_vpu_fw_set_option option;
+
 	if (cid != V4L2_CID_MALI_VPU_NALU_FORMAT)
 		return -EINVAL;
 
-	(void)sess;
-	(void)value;
-	return 0;
+	option.code = MALI_VPU_FW_SET_NALU_FORMAT;
+	option.nalu_format = value;
+
+	return mali_vpu_session_fw_send_set_option(sess, &option);
 }
 
 int mali_vpu_ctrl_set_intbuf_size(struct mali_vpu_session *sess, u32 cid,
 				  s64 value)
 {
+	struct mali_vpu_fw_set_option option;
+
 	if (cid != V4L2_CID_MALI_VPU_INTBUF_SIZE || value < 0 || value > INT_MAX)
 		return -EINVAL;
 
-	(void)sess;
-	(void)value;
-	return 0;
+	option.code = MALI_VPU_FW_SET_INTBUF_SIZE;
+	option.intbuf_size = value;
+
+	return mali_vpu_session_fw_send_set_option(sess, &option);
 }
 
 int mali_vpu_ctrl_set_stream_escaping(struct mali_vpu_session *sess, u32 cid,
 				      s64 value)
 {
+	struct mali_vpu_fw_set_option option;
+
 	if (cid != V4L2_CID_MALI_VPU_STREAM_ESCAPING)
 		return -EINVAL;
 
@@ -319,21 +327,25 @@ int mali_vpu_ctrl_set_stream_escaping(struct mali_vpu_session *sess, u32 cid,
 	if (value != 0 && value != 1)
 		return -EINVAL;
 
-	(void)sess;
-	(void)value;
-	return 0;
+	option.code = MALI_VPU_FW_SET_STREAM_ESCAPING;
+	option.stream_escaping = value;
+
+	return mali_vpu_session_fw_send_set_option(sess, &option);
 }
 
 int mali_vpu_ctrl_set_host_print_enable(struct mali_vpu_session *sess, u32 cid,
 					s64 value)
 {
+	struct mali_vpu_fw_set_option option;
+
 	if (cid != V4L2_CID_MALI_VPU_HOST_PRINT_ENABLE)
 		return -EINVAL;
 
 	if (value != 0 && value != 1)
 		return -EINVAL;
 
-	(void)sess;
-	(void)value;
-	return 0;
+	option.code = MALI_VPU_FW_SET_HOST_PROTOCOL_PRINTS;
+	option.host_protocol_prints = value;
+
+	return mali_vpu_session_fw_send_set_option(sess, &option);
 }
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
index 7e78c475a4ff3..51d509abb9dd1 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-dec.c
@@ -28,6 +28,8 @@ void mali_vpu_session_init_dec(struct mali_vpu_session *sess)
 int mali_vpu_ctrl_set_ignore_stream_headers(struct mali_vpu_session *sess,
 					    u32 cid, s64 value)
 {
+	struct mali_vpu_fw_set_option option;
+
 	if (cid != V4L2_CID_MALI_VPU_IGNORE_STREAM_HEADERS)
 		return -EINVAL;
 
@@ -37,14 +39,17 @@ int mali_vpu_ctrl_set_ignore_stream_headers(struct mali_vpu_session *sess,
 	if (value != 0 && value != 1)
 		return -EINVAL;
 
-	(void)sess;
-	(void)value;
-	return 0;
+	option.code = MALI_VPU_FW_SET_IGNORE_STREAM_HEADERS;
+	option.ignore_stream_headers = value;
+
+	return mali_vpu_session_fw_send_set_option(sess, &option);
 }
 
 int mali_vpu_ctrl_set_frame_reordering(struct mali_vpu_session *sess, u32 cid,
 				       s64 value)
 {
+	struct mali_vpu_fw_set_option option;
+
 	if (cid != V4L2_CID_MALI_VPU_FRAME_REORDERING)
 		return -EINVAL;
 
@@ -54,7 +59,8 @@ int mali_vpu_ctrl_set_frame_reordering(struct mali_vpu_session *sess, u32 cid,
 	if (value != 0 && value != 1)
 		return -EINVAL;
 
-	(void)sess;
-	(void)value;
-	return 0;
+	option.code = MALI_VPU_FW_SET_FRAME_REORDERING;
+	option.frame_reordering = value;
+
+	return mali_vpu_session_fw_send_set_option(sess, &option);
 }
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
index 4aead9a062260..91a989c098cbc 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
@@ -624,6 +624,7 @@ int mali_vpu_fw_send_ping(struct mali_vpu_fw *fw)
 int mali_vpu_fw_send_state_change(struct mali_vpu_fw *fw, enum mali_vpu_fw_state state)
 {
 	u16 code;
+	int ret;
 
 	switch (state) {
 	case MALI_VPU_FW_STATE_STOPPED:
@@ -636,13 +637,135 @@ int mali_vpu_fw_send_state_change(struct mali_vpu_fw *fw, enum mali_vpu_fw_state
 		return -EINVAL;
 	}
 
-	return mali_vpu_fw_write_msg(fw, &fw->msg_host, &fw->msg_mve, code, NULL, 0);
+	ret = mali_vpu_fw_write_msg(fw, &fw->msg_host, &fw->msg_mve, code, NULL, 0);
+	if (!ret)
+		fw->pending_response_count++;
+
+	return ret;
+}
+
+static int mali_vpu_to_mve_nalu_format(s64 nalu_format, u32 *mve_nalu_format)
+{
+	switch (nalu_format) {
+	case MALI_VPU_NALU_FORMAT_START_CODES:
+		*mve_nalu_format = MVE_OPT_NALU_FORMAT_START_CODES;
+		break;
+	case MALI_VPU_NALU_FORMAT_ONE_NALU_PER_BUFFER:
+		*mve_nalu_format = MVE_OPT_NALU_FORMAT_ONE_NALU_PER_BUFFER;
+		break;
+	case MALI_VPU_NALU_FORMAT_ONE_BYTE_LENGTH_FIELD:
+		*mve_nalu_format = MVE_OPT_NALU_FORMAT_ONE_BYTE_LENGTH_FIELD;
+		break;
+	case MALI_VPU_NALU_FORMAT_TWO_BYTE_LENGTH_FIELD:
+		*mve_nalu_format = MVE_OPT_NALU_FORMAT_TWO_BYTE_LENGTH_FIELD;
+		break;
+	case MALI_VPU_NALU_FORMAT_FOUR_BYTE_LENGTH_FIELD:
+		*mve_nalu_format = MVE_OPT_NALU_FORMAT_FOUR_BYTE_LENGTH_FIELD;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mali_vpu_fw_send_option(struct mali_vpu_fw *fw,
+				   struct mve_request_set_option *mve_opt,
+				   size_t size)
+{
+	int ret;
+
+	ret = mali_vpu_fw_write_msg(fw, &fw->msg_host, &fw->msg_mve,
+				    MVE_REQUEST_CODE_SET_OPTION, mve_opt,
+				    offsetof(typeof(*mve_opt), data) + size);
+	if (!ret)
+		fw->pending_response_count++;
+
+	return ret;
+}
+
+int mali_vpu_fw_send_set_option(struct mali_vpu_fw *fw,
+				struct mali_vpu_fw_set_option *option)
+{
+	int ret;
+
+	switch (option->code) {
+	case MALI_VPU_FW_SET_NALU_FORMAT: {
+		struct mve_request_set_option mve_opt;
+
+		mve_opt.index = MVE_SET_OPT_INDEX_NALU_FORMAT;
+
+		ret = mali_vpu_to_mve_nalu_format(option->nalu_format,
+						  &mve_opt.data.arg);
+		if (!ret)
+			ret = mali_vpu_fw_send_option(fw, &mve_opt,
+						      sizeof(mve_opt.data.arg));
+
+		break;
+	}
+	case MALI_VPU_FW_SET_STREAM_ESCAPING: {
+		struct mve_request_set_option mve_opt;
+
+		mve_opt.index = MVE_SET_OPT_INDEX_STREAM_ESCAPING;
+		mve_opt.data.arg = option->stream_escaping ? 1 : 0;
+
+		ret = mali_vpu_fw_send_option(fw, &mve_opt,
+					      sizeof(mve_opt.data.arg));
+		break;
+	}
+	case MALI_VPU_FW_SET_HOST_PROTOCOL_PRINTS: {
+		struct mve_request_set_option mve_opt;
+
+		mve_opt.index = MVE_SET_OPT_INDEX_HOST_PROTOCOL_PRINTS;
+		mve_opt.data.arg = option->host_protocol_prints ? 1 : 0;
+
+		ret = mali_vpu_fw_send_option(fw, &mve_opt,
+					      sizeof(mve_opt.data.arg));
+		break;
+	}
+	case MALI_VPU_FW_SET_IGNORE_STREAM_HEADERS: {
+		struct mve_request_set_option mve_opt;
+
+		mve_opt.index = MVE_SET_OPT_INDEX_IGNORE_STREAM_HEADERS;
+		mve_opt.data.arg = option->ignore_stream_headers ? 1 : 0;
+
+		ret = mali_vpu_fw_send_option(fw, &mve_opt,
+					      sizeof(mve_opt.data.arg));
+		break;
+	}
+	case MALI_VPU_FW_SET_FRAME_REORDERING: {
+		struct mve_request_set_option mve_opt;
+
+		mve_opt.index = MVE_SET_OPT_INDEX_FRAME_REORDERING;
+		mve_opt.data.arg = option->frame_reordering ? 1 : 0;
+
+		ret = mali_vpu_fw_send_option(fw, &mve_opt,
+					      sizeof(mve_opt.data.arg));
+		break;
+	}
+	case MALI_VPU_FW_SET_INTBUF_SIZE: {
+		struct mve_request_set_option mve_opt;
+
+		mve_opt.index = MVE_SET_OPT_INDEX_INTBUF_SIZE;
+		mve_opt.data.arg = option->intbuf_size;
+
+		ret = mali_vpu_fw_send_option(fw, &mve_opt,
+					      sizeof(mve_opt.data.arg));
+		break;
+	}
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
 }
 
 int mali_vpu_fw_parse_msg(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *msg)
 {
 	u16 code;
 	union {
+		struct mve_response_set_option_confirm set_option_confirm;
+		struct mve_response_set_option_fail set_option_fail;
 		struct mve_response_state_change state_change;
 		struct mve_response_error error;
 	} fw_msg = {};
@@ -691,6 +814,40 @@ int mali_vpu_fw_parse_msg(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *msg)
 		default:
 			return -EPROTO;
 		}
+
+		if (fw->pending_response_count == 0)
+			return -EPROTO;
+
+		fw->pending_response_count--;
+		break;
+	}
+	case MVE_RESPONSE_CODE_SET_OPTION_CONFIRM:
+		if (size != sizeof(fw_msg.set_option_confirm))
+			return -EPROTO;
+
+		msg->code = MALI_VPU_FW_CODE_SET_OPTION;
+
+		if (fw->pending_response_count == 0)
+			return -EPROTO;
+
+		fw->pending_response_count--;
+		break;
+	case MVE_RESPONSE_CODE_SET_OPTION_FAIL: {
+		if (size != sizeof(fw_msg.set_option_fail))
+			return -EPROTO;
+
+		dev_err(fw->dev,
+			"firmware set option failed. index=%u, msg=%.*s.\n",
+			fw_msg.set_option_fail.index,
+			(int)sizeof(fw_msg.set_option_fail.message),
+			fw_msg.set_option_fail.message);
+
+		msg->code = MALI_VPU_FW_CODE_SET_OPTION_FAIL;
+
+		if (fw->pending_response_count == 0)
+			return -EPROTO;
+
+		fw->pending_response_count--;
 		break;
 	}
 	case MVE_RESPONSE_CODE_ERROR: {
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
index f26fd78101661..e5dd67ce3397a 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
@@ -6,6 +6,7 @@
 #ifndef __MALI_VPU_FIRMWARE_H__
 #define __MALI_VPU_FIRMWARE_H__
 
+#include <linux/media/arm/mali-vpu-config.h>
 #include <linux/types.h>
 
 #define MALI_VPU_FW_TEXT_BASE_ADDR 0x1000u
@@ -35,6 +36,46 @@ struct mali_vpu_fw_job {
 	unsigned int frames;
 };
 
+/**
+ * enum mali_vpu_fw_set_option_code - Firmware option selectors
+ * @MALI_VPU_FW_SET_NALU_FORMAT: Set the NAL-unit format.
+ * @MALI_VPU_FW_SET_STREAM_ESCAPING: Configure stream escaping.
+ * @MALI_VPU_FW_SET_HOST_PROTOCOL_PRINTS: Configure firmware logging.
+ * @MALI_VPU_FW_SET_IGNORE_STREAM_HEADERS: Configure stream-header handling.
+ * @MALI_VPU_FW_SET_FRAME_REORDERING: Configure frame reordering.
+ * @MALI_VPU_FW_SET_INTBUF_SIZE: Set the suggested intermediate-buffer size.
+ */
+enum mali_vpu_fw_set_option_code {
+	MALI_VPU_FW_SET_NALU_FORMAT,
+	MALI_VPU_FW_SET_STREAM_ESCAPING,
+	MALI_VPU_FW_SET_HOST_PROTOCOL_PRINTS,
+	MALI_VPU_FW_SET_IGNORE_STREAM_HEADERS,
+	MALI_VPU_FW_SET_FRAME_REORDERING,
+	MALI_VPU_FW_SET_INTBUF_SIZE,
+};
+
+/**
+ * struct mali_vpu_fw_set_option - Set firmware options.
+ * @code: Code for the option to set.
+ * @nalu_format: NAL-unit encapsulation format.
+ * @stream_escaping: Whether stream escaping is enabled.
+ * @host_protocol_prints: Whether firmware protocol logging is enabled.
+ * @ignore_stream_headers: Whether firmware ignores stream headers.
+ * @frame_reordering: Whether frame reordering is enabled.
+ * @intbuf_size: Suggested intermediate-buffer size.
+ */
+struct mali_vpu_fw_set_option {
+	enum mali_vpu_fw_set_option_code code;
+	union {
+		enum mali_vpu_nalu_format nalu_format;
+		bool stream_escaping;
+		bool host_protocol_prints;
+		bool ignore_stream_headers;
+		bool frame_reordering;
+		u32 intbuf_size;
+	};
+};
+
 /**
  * struct mali_vpu_fw_error - Firmware error message.
  * @error_code: What kind of error that was reported.
@@ -61,6 +102,8 @@ struct mali_vpu_fw_error {
  * @MALI_VPU_FW_CODE_PING: Ping request sent to firmware.
  * @MALI_VPU_FW_CODE_PONG: Firmware responded to a ping request.
  * @MALI_VPU_FW_CODE_IDLE: Firmware informs the driver that it's idle.
+ * @MALI_VPU_FW_CODE_SET_OPTION: Firmware set option request or success response.
+ * @MALI_VPU_FW_CODE_SET_OPTION_FAIL: Firmware set option failure response.
  * @MALI_VPU_FW_CODE_STATE_CHANGE: Firmware state-change request or response.
  * @MALI_VPU_FW_CODE_SWITCH_IN: Firmware was booted on a Core in a session.
  * @MALI_VPU_FW_CODE_SWITCH_OUT: The last core in a session was switched out.
@@ -68,15 +111,17 @@ struct mali_vpu_fw_error {
  * @MALI_VPU_FW_CODE_MAX: Sentinel marking the end of the message-code enum.
  */
 enum mali_vpu_fw_code {
-	MALI_VPU_FW_CODE_ERROR,        /* Driver <- Firmware. */
-	MALI_VPU_FW_CODE_JOB,          /* Driver -> Firmware. */
-	MALI_VPU_FW_CODE_PING,         /* Driver -> Firmware. */
-	MALI_VPU_FW_CODE_PONG,         /* Driver <- Firmware. */
-	MALI_VPU_FW_CODE_IDLE,         /* Driver <- Firmware. */
-	MALI_VPU_FW_CODE_STATE_CHANGE, /* Driver <-> Firmware. */
-	MALI_VPU_FW_CODE_SWITCH_IN,    /* Driver <- Firmware. */
-	MALI_VPU_FW_CODE_SWITCH_OUT,   /* Driver <-> Firmware. */
-	MALI_VPU_FW_CODE_UNKNOWN,      /* Driver <- Firmware. */
+	MALI_VPU_FW_CODE_ERROR,              /* Driver <- Firmware. */
+	MALI_VPU_FW_CODE_JOB,                /* Driver -> Firmware. */
+	MALI_VPU_FW_CODE_PING,               /* Driver -> Firmware. */
+	MALI_VPU_FW_CODE_PONG,               /* Driver <- Firmware. */
+	MALI_VPU_FW_CODE_IDLE,               /* Driver <- Firmware. */
+	MALI_VPU_FW_CODE_SET_OPTION,         /* Driver <-> Firmware. */
+	MALI_VPU_FW_CODE_SET_OPTION_FAIL,    /* Driver <- Firmware. */
+	MALI_VPU_FW_CODE_STATE_CHANGE,       /* Driver <-> Firmware. */
+	MALI_VPU_FW_CODE_SWITCH_IN,          /* Driver <- Firmware. */
+	MALI_VPU_FW_CODE_SWITCH_OUT,         /* Driver <-> Firmware. */
+	MALI_VPU_FW_CODE_UNKNOWN,            /* Driver <- Firmware. */
 	MALI_VPU_FW_CODE_MAX
 };
 
@@ -161,6 +206,7 @@ struct mali_vpu_fw_proto_page {
  * @bss_pages: Private BSS pages allocated separately for each core instance.
  * @shared_bss_pages: Shared BSS pages mapped into every core instance.
  * @ncores: Number of firmware core-instance regions constructed.
+ * @pending_response_count: Number of requests awaiting a firmware response.
  */
 struct mali_vpu_fw {
 	struct device *dev;
@@ -178,6 +224,7 @@ struct mali_vpu_fw {
 	struct mali_vpu_mmu_pages *bss_pages;
 	struct mali_vpu_mmu_pages *shared_bss_pages;
 	u32 ncores;
+	u32 pending_response_count;
 };
 
 int mali_vpu_fw_construct(struct mali_vpu_fw *fw, const struct mali_vpu_fw_bin *fw_bin,
@@ -186,6 +233,7 @@ void mali_vpu_fw_cleanup(struct mali_vpu_fw *fw);
 int mali_vpu_fw_send_job(struct mali_vpu_fw *fw, u16 cores, u16 frames);
 int mali_vpu_fw_send_ping(struct mali_vpu_fw *fw);
 int mali_vpu_fw_send_state_change(struct mali_vpu_fw *fw, enum mali_vpu_fw_state state);
+int mali_vpu_fw_send_set_option(struct mali_vpu_fw *fw, struct mali_vpu_fw_set_option *option);
 int mali_vpu_fw_parse_msg(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *msg);
 
 #endif /* __MALI_VPU_FIRMWARE_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
index 3523ac3e49f1d..c7c18bd4e1551 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
@@ -173,7 +173,10 @@ struct mve_msg_header {
 		#define MVE_REQUEST_CODE_STOP                 (1002) /* no extra data */
 		#define MVE_REQUEST_CODE_PING                 (1006) /* no extra data */
 		#define MVE_REQUEST_CODE_JOB                  (1009) /* struct mve_request_job */
-
+		#define MVE_REQUEST_CODE_SET_OPTION           (1010) /* struct
+								      * mve_request_set_option
+								      * (variable size)
+								      */
 		/*
 		 * RESPONSEs are messages from
 		 * the firmware to the host:
@@ -182,6 +185,7 @@ struct mve_msg_header {
 		#define MVE_RESPONSE_CODE_SWITCHED_IN         (2001)
 		/* struct mve_response_switched_out */
 		#define MVE_RESPONSE_CODE_SWITCHED_OUT        (2002)
+		#define MVE_RESPONSE_CODE_SET_OPTION_CONFIRM  (2003)
 		/* struct mve_response_job_dequeued */
 		#define MVE_RESPONSE_CODE_JOB_DEQUEUED        (2004)
 		#define MVE_RESPONSE_CODE_PONG                (2009)
@@ -190,6 +194,8 @@ struct mve_msg_header {
 		/* struct mve_response_state_change */
 		#define MVE_RESPONSE_CODE_STATE_CHANGE        (2011)
 		#define MVE_RESPONSE_CODE_IDLE                (2013)
+		/* struct mve_response_set_option_fail */
+		#define MVE_RESPONSE_CODE_SET_OPTION_FAIL     (2017)
 
 	u16 size; /* size in bytes of trailing data, 0 if none */
 };
@@ -210,6 +216,42 @@ struct mve_request_job {
 		#define MVE_JOB_FLAG_DISABLE_BNDMGR (0x01)
 };
 
+struct mve_request_set_option {
+	u32 index;
+		#define MVE_SET_OPT_INDEX_NALU_FORMAT              (1)  /* see arg,
+									 * MVE_OPT_NALU_FORMAT_
+									 */
+		#define MVE_SET_OPT_INDEX_STREAM_ESCAPING          (2)  /* arg=1 to enable (def),
+									 * arg=0 to disable
+									 */
+		#define MVE_SET_OPT_INDEX_HOST_PROTOCOL_PRINTS     (4)  /* arg=1 to enable,
+									 * arg=0 to disable (def)
+									 */
+		#define MVE_SET_OPT_INDEX_IGNORE_STREAM_HEADERS    (7)  /* decode, arg=1 to enable,
+									 * arg=0 to disable (def)
+									 */
+		#define MVE_SET_OPT_INDEX_FRAME_REORDERING         (8)  /* decode arg=1 enable(def),
+									 * arg=0 to disable
+									 */
+		#define MVE_SET_OPT_INDEX_INTBUF_SIZE              (9)  /* decode, arg = suggested
+									 * limit of intermediate
+									 * buffer allocation
+									 */
+	union {
+		u32 arg; /* Most options only need a u32 as argument */
+		/*
+		 * For option MVE_SET_OPT_INDEX_NALU_FORMAT, arg should
+		 * be one of these:
+		 */
+		#define MVE_OPT_NALU_FORMAT_START_CODES             (1)
+		#define MVE_OPT_NALU_FORMAT_ONE_NALU_PER_BUFFER     (2)
+		#define MVE_OPT_NALU_FORMAT_ONE_BYTE_LENGTH_FIELD   (4)
+		#define MVE_OPT_NALU_FORMAT_TWO_BYTE_LENGTH_FIELD   (8)
+		#define MVE_OPT_NALU_FORMAT_FOUR_BYTE_LENGTH_FIELD  (16)
+		#define MVE_OPT_NALU_FORMAT_MBINFO                  (32) /* debugging only */
+	} data;
+};
+
 /*********************************************************************
  *
  *   RESPONSEs are messages from the firmware to the host
@@ -267,6 +309,30 @@ struct mve_response_error {
 	char message[MVE_MAX_ERROR_MESSAGE_SIZE];
 };
 
+/*
+ * When a set-option succeeds, a confirmation message is
+ * sent, including the index-code for that particular option.
+ */
+struct mve_response_set_option_confirm {
+	u32 index; /* Same as 'index' in struct mve_request_set_option */
+};
+
+/*
+ * If a set-option request fails, this message is returned.
+ * This is not a fatal error. The set-option had no effect,
+ * and the session is still alive.
+ * For example, trying to set an option with a too large
+ * or small parameter would result in this message.
+ * The included text string is meant for development and
+ * debugging purposes only.
+ * (When a set-option succeeds the set-option-confirm
+ * message code is sent instead.)
+ */
+struct mve_response_set_option_fail {
+	u32 index; /* Same as 'index' in struct mve_request_set_option */
+	char message[MVE_MAX_ERROR_MESSAGE_SIZE];
+};
+
  #define MVE_CHROMA_FORMAT_420 (0x1)
 
 /* format bitfield: */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
index c9a2c683b8dab..36197e82461be 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
@@ -68,6 +68,12 @@ mali_vpu_both_ports_unrequested(struct mali_vpu_session *sess)
 	       !sess->port_dst.stream_requested;
 }
 
+int mali_vpu_session_fw_send_set_option(struct mali_vpu_session *sess,
+					struct mali_vpu_fw_set_option *opt)
+{
+	return mali_vpu_fw_send_set_option(&sess->fw, opt);
+}
+
 int mali_vpu_session_init(struct mali_vpu_session *sess)
 {
 	int ret;
@@ -91,7 +97,6 @@ int mali_vpu_session_init(struct mali_vpu_session *sess)
 		goto err_mutex_destroy;
 	}
 
-	sess->is_fw_ready = false;
 	sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_UNINITIALIZED;
 
 	ret = mali_vpu_ctrls_init(sess);
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
index ecd048e3e5c01..f0aa98005e92a 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
@@ -65,7 +65,6 @@ enum mali_vpu_session_fw_bin_state {
  * @port_dst: Destination (CAPTURE) port for this session.
  * @mmu: MMU handle for this session
  * @vq_lock: Mutex lock to serialise per-session queue related ioctls.
- * @is_fw_ready: True if the firmware is loaded and ready to accept commands.
  * @min_buffers_required: Driver-reported minimum buffers for role-specific queue.
  * @ctrls_caps: Variant-provided immutable control capability table.
  * @num_ctrls_caps: Number of entries in @ctrls_caps.
@@ -86,7 +85,6 @@ struct mali_vpu_session {
 	struct mali_vpu_port		port_dst;
 	struct mali_vpu_mmu		mmu;
 	struct mutex			vq_lock; /* lock to serialise per-session ioctls */
-	bool				is_fw_ready;
 	u32				min_buffers_required;
 
 	const struct mali_vpu_ctrl_desc *ctrls_caps;
@@ -107,6 +105,8 @@ struct mali_vpu_session {
 int mali_vpu_session_init(struct mali_vpu_session *sess);
 int mali_vpu_session_cleanup(struct mali_vpu_session *sess);
 int mali_vpu_session_request_fw_load(struct mali_vpu_session *sess);
+int mali_vpu_session_fw_send_set_option(struct mali_vpu_session *sess,
+					struct mali_vpu_fw_set_option *opt);
 
 static inline struct mali_vpu_session *mali_vpu_get_session(struct file *filp)
 {
-- 
2.43.0

