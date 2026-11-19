Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102762;
	b=VjlxgPLzhRj1uNQm8BO4LeQ8f/q7bGiPRAv5Q1rB2CrtCoLY0iK742xerBtKx+RoNUe0
	 zd3RD9tbE1cFTCDqOmPE/PVPuMgjPU+/vpbnCuwa4vk1P2Xt8PmqFVWr9gNP63diZXio9
	 u9Vnm3fLN0pm5bxOAP0zRFHDMAv0Lutov0Q/aq8U/JRZXe/dzwL63J1ceylBVEr0MDNBn
	 lWf9zXCrI+muYniAMxcBv+yykGogmM1T6Pv47mzp/Ezyz0K/oBCpWdykuU1ffdFKhf6mO
	 24u9CoZe/5/Rs0gwvei0U6ASo5W9pJPQ5YrS6cB4U29taAhZrZgO788pGQbKJVT+0Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102762;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/rWc7f1kz9h4SsHc8CPjNEoZ5x/svy/yT2C/OPC9X2E=;
	b=cvCg2wyyLAsKCtQq6oDcQD2J0AGWXUTShhC/oZJdL9mALpflzx2ZHzORjNd/ga6HZWDS
	 CCi2CpjSznUfmBNUYTRqhhcX8i936cW79giB8e7ghDGd0+T6s4ZamAVfhzrvBdu62ZpIV
	 iE/aNNKPRT6c0FV+CJLWsh0ka0Wk+0w007ytCvPjTjugU95C58CW3HeEbzmi9w4XAkLoR
	 5BlMRrNTfIBOO6QgXjygq1gcsn1ADTj3YKeNIuF85YyHQdA2Cp6+XjE7r9N7DluVaYYfq
	 o+5U1wk9Zbt6WseRPYAaZlYTL5awuUdYsJ1xRzWRyMaQcmr8doNtt4HO4CjXwR3f7YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HhQy5R2+;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35CC606D6C6;
	Thu, 19 Nov 2026 15:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F35CC606D6C6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HhQy5R2+
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F7E51C25;
	Thu, 19 Nov 2026 07:39:09 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E85DD3F882;
	Thu, 19 Nov 2026 07:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102752; bh=HJ+yJa6z9YGWow0T4s0FefQx5R9lsyg9EJsfPRyqA1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HhQy5R2+eBTFCHOMsB/T1fyt5R8zgOKLOdrGxGg1gvxAr28FCD5EqiTQmU5jaI/Yf
	 KLWPqlcBCDwzAN00nwu725QnjI3Au9jG70EPsI0YyNctPb+WC1P1HqBpMqhXwRgy1F
	 h3Fu4ppscVETuyEpv2LniKkmPGxUxAqkPXgUz9AM=
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
Subject: [RFC PATCH 25/28] media: mali-vpu: handle firmware buffer parameters
Date: Thu, 19 Nov 2026 15:37:55 +0000
Message-ID: <20261119153758.1426673-26-charvi.mehta@arm.com>
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

Add protocol definitions and parsing for firmware buffer-parameter
messages. Recognize colour-description and DPB-held-frame
notifications, log and ignore them when no session action is required.

Signed-off-by: Shobhit Pandey <shobhit.pandey@arm.com>
Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 .../platform/arm/mali-vpu/mali-vpu-firmware.c | 32 +++++++++++++++++++
 .../platform/arm/mali-vpu/mali-vpu-firmware.h |  5 +++
 .../arm/mali-vpu/mali-vpu-protocol-def-v3.h   | 19 +++++++++++
 .../platform/arm/mali-vpu/mali-vpu-session.c  |  9 ++++++
 4 files changed, 65 insertions(+)

diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
index 55bad502cae0b..34d57b288a682 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/sizes.h>
+#include <linux/stddef.h>
 #include <linux/string.h>
 
 #include "mali-vpu-firmware.h"
@@ -950,6 +951,33 @@ mali_vpu_convert_buffer_bitstream(struct mali_vpu_fw *fw,
 	return 0;
 }
 
+static int mali_vpu_convert_buffer_param(struct mali_vpu_fw_msg *msg,
+					 struct mve_buffer_param *p,
+					 size_t size)
+{
+	if (size < sizeof(p->type))
+		return -EPROTO;
+
+	switch (p->type) {
+	case MVE_BUFFER_PARAM_TYPE_COLOUR_DESCRIPTION:
+		/* The colour-description payload is currently ignored. */
+		msg->code = MALI_VPU_FW_CODE_COLOR_DESC;
+		break;
+	case MVE_BUFFER_PARAM_TYPE_DPB_HELD_FRAMES:
+		if (size < offsetofend(struct mve_buffer_param, data.arg))
+			return -EPROTO;
+
+		msg->code = MALI_VPU_FW_CODE_DPB_HELD_FRAMES;
+		msg->data.dpb_held_frames = p->data.arg;
+		break;
+	default:
+		msg->code = MALI_VPU_FW_CODE_UNKNOWN;
+		break;
+	}
+
+	return 1;
+}
+
 static int mali_vpu_fw_get_buffer(struct mali_vpu_fw *fw,
 				  struct mali_vpu_fw_proto_page *buf_host_page,
 				  struct mali_vpu_fw_proto_page *buf_mve_page,
@@ -1007,6 +1035,7 @@ int mali_vpu_fw_parse_msg(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *msg)
 		struct mve_response_state_change state_change;
 		struct mve_response_frame_alloc_parameters alloc_params;
 		struct mve_response_sequence_parameters seq_params;
+		struct mve_buffer_param buffer_param;
 		struct mve_response_error error;
 	} fw_msg = {};
 	size_t size = sizeof(fw_msg);
@@ -1137,6 +1166,9 @@ int mali_vpu_fw_parse_msg(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *msg)
 
 		fw->pending_response_count--;
 		break;
+	case MVE_BUFFER_CODE_PARAM:
+		ret =  mali_vpu_convert_buffer_param(msg, &fw_msg.buffer_param, size);
+		break;
 	case MVE_RESPONSE_CODE_ERROR: {
 		size_t message_offset = offsetof(struct mve_response_error, message);
 		size_t message_size;
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
index ca90cc71ac64e..6c46f23ac8638 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
@@ -144,6 +144,8 @@ struct mali_vpu_fw_error {
  * @MALI_VPU_FW_CODE_OUTPUT_FLUSH: Firmware successfully completed a CAPTURE queue flush.
  * @MALI_VPU_FW_CODE_SEQUENCE_PARAMS: Firmware reported new sequence parameters.
  * @MALI_VPU_FW_CODE_ALLOC_PARAM: Firmware reported new frame allocation parameters.
+ * @MALI_VPU_FW_CODE_COLOR_DESC: Firmware reported colour-description metadata.
+ * @MALI_VPU_FW_CODE_DPB_HELD_FRAMES: Firmware reported the number of frames held in the DPB.
  * @MALI_VPU_FW_CODE_UNKNOWN: Unrecognized firmware message.
  * @MALI_VPU_FW_CODE_MAX: Sentinel marking the end of the message-code enum.
  */
@@ -164,6 +166,8 @@ enum mali_vpu_fw_code {
 	MALI_VPU_FW_CODE_OUTPUT_FLUSH,       /* Driver <- Firmware. */
 	MALI_VPU_FW_CODE_SEQUENCE_PARAMS,    /* Driver <- Firmware. */
 	MALI_VPU_FW_CODE_ALLOC_PARAM,        /* Driver <- Firmware. */
+	MALI_VPU_FW_CODE_COLOR_DESC,         /* Driver <- Firmware. */
+	MALI_VPU_FW_CODE_DPB_HELD_FRAMES,    /* Driver <- Firmware. */
 	MALI_VPU_FW_CODE_UNKNOWN,            /* Driver <- Firmware. */
 	MALI_VPU_FW_CODE_MAX
 };
@@ -182,6 +186,7 @@ struct mali_vpu_fw_msg {
 		struct mali_vpu_buffer *vpu_buf;
 		struct mali_vpu_fw_alloc_param alloc_params;
 		struct mali_vpu_fw_seq_param seq_params;
+		u32 dpb_held_frames;
 	} data;
 };
 
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
index cb4533a367957..76dc7bf076c8f 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
@@ -269,6 +269,8 @@ struct mve_msg_header {
 		#define MVE_BUFFER_CODE_FRAME                 (3001)
 		/* struct mve_buffer_bitstream */
 		#define MVE_BUFFER_CODE_BITSTREAM             (3002)
+		/* struct mve_buffer_param */
+		#define MVE_BUFFER_CODE_PARAM                 (3003)
 
 	u16 size; /* size in bytes of trailing data, 0 if none */
 };
@@ -601,4 +603,21 @@ struct mve_buffer_bitstream {
 	u32 reserved;
 };
 
+/* Parameters that are sent in the same communication channels
+ * as the buffers. A parameter applies to all subsequent buffers.
+ * Some types are only valid for decode, and some only for encode.
+ */
+struct mve_buffer_param {
+	u32 type;                                                   /* Extra data: */
+		#define MVE_BUFFER_PARAM_TYPE_COLOUR_DESCRIPTION        (15)
+		/* arg, number of output buffers that are complete and held by firmware in the
+		 * DPB for reordering purposes. Valid after the next frame is output.
+		 */
+		#define MVE_BUFFER_PARAM_TYPE_DPB_HELD_FRAMES           (19)
+
+	union {
+		u32                                        arg;
+	} data;
+};
+
 #endif /* __MALI_VPU_PROTOCOL_DEF_V3_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
index fcfad581223be..411421e175e71 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
@@ -559,6 +559,15 @@ static int mali_vpu_session_handle_fw_msg(struct mali_vpu_session *sess,
 		 * state update is required.
 		 */
 		return 0;
+	case MALI_VPU_FW_CODE_COLOR_DESC:
+		/* Colour metadata is currently not consumed by the driver. */
+		return 0;
+	case MALI_VPU_FW_CODE_DPB_HELD_FRAMES:
+		/* DPB occupancy is informational. */
+		dev_dbg(sess->vpu_dev->dev,
+			"firmware holds %u frames in the DPB\n",
+			fw_msg->data.dpb_held_frames);
+		return 0;
 	case MALI_VPU_FW_CODE_OUTPUT_FLUSH:
 		dev_dbg(sess->vpu_dev->dev, "fw rsp: Dst queue flushed\n");
 		if (sess->role == MALI_VPU_DECODER && sess->drc_pending)
-- 
2.43.0

