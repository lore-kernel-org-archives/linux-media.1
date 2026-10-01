Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEE431F996
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 07:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839918; cv=none; b=B6xeyU4LKJ3IT4F7zqSd/daDRUdmLwRhuBjazpvcS7xhlFBCE2SzC+aWgXZPnJCLw46PFAnSnpsXDuBrrYrvIx/OjFTSESrP5ctaZIpQwJT1qSNif37NOZuAU60Xzg4Gi0nD1J/Cw9d3DI27MDvrhmTo8p2oGBPQfbg8b+OwKhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839918; c=relaxed/simple;
	bh=eM35wvO57lRNVdKU0aoe0jtWLAjaI6e4CljO5aVfw68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BEs8R21R44y1Ok4AL0QkqKXXLWWVCtW6fsYiwuCUgIkkxuuf1ImutqEw3r5WNOryjOTUiYMtyDFG+yZapl+A9SWOV3/W6ax9q72yxSFbOWc9cQVcEKfgdseyaqpLzbeMFgL1grR4EesNpae31qOadTGNcJlOUjQCK+JPnXmhR3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OgoTEddV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OgoTEddV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790839917; x=1822375917;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eM35wvO57lRNVdKU0aoe0jtWLAjaI6e4CljO5aVfw68=;
  b=OgoTEddV+tUSUviBK9P9negnZ0/EIxs7GZ5x4COrXoAGc/0jftZw0+i3
   T1lhOSntU5SPtImIkflmP4ityQx1LElZyQwVMBKBnbyQNnMFBWasMasfw
   ADkR+/gx5ThZvWyx6ikaB4jiW6tlp3Oaao++XF6X/MMYV6/OcGTFW2j66
   9OwAiDbEYFBnTkqAX39dR0bfMxXOAArlVOii8OJTSWUX+jOV1lkxq8l5y
   hAPVHIR9z9sq40Eg/ONc7YknD/VKZSsI7rK0BBYAnmcbb8lRXtBiwmFdB
   JOU7nkG6u7OTQBkm4hT9RBVrYURg396MrJXp2FlI1gm+PzP75lvLHV7Qs
   g==;
X-CSE-ConnectionGUID: wx/lzW3oRF+PIhiR5F3d+A==
X-CSE-MsgGUID: sePW9BWuTI6D6F/uH5yM7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="79150765"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="79150765"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:31:50 -0700
X-CSE-ConnectionGUID: FgBq+DGeR7Sh2jZQVRGg5A==
X-CSE-MsgGUID: Piixvy7cSa+E+z5nhS9P7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="279215611"
Received: from vtg-bdc-vm10.iil.intel.com ([143.185.124.149])
  by orviesa004.jf.intel.com with ESMTP; 01 Oct 2026 00:31:49 -0700
From: Divyamani Tripathi <divyamani.tripathi@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com,
	manik.bajpai@intel.com,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH v2 3/7] media: ipu6: add IPU8 InSys ABI 1.0.14 support
Date: Thu,  1 Oct 2026 10:31:30 +0300
Message-ID: <20261001073134.4031143-4-divyamani.tripathi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001073134.4031143-1-divyamani.tripathi@intel.com>
References: <20261001073134.4031143-1-divyamani.tripathi@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware ABI 1.0.14 diverges from IPU7's InSys message layout (uPipe
config, CFA dimension, binning factor, wider output cropping) and
expects boot-message major version 2 instead of IPU7's 1; without the
version fix the IPU8 firmware rejects the boot handshake with
IA_GOFO_FW_BOOT_STATE_CRIT_MSG_VERSION (0xdead0301), confirmed on real
hardware.

Add the IPU8 layout as additional '_ipu8' structs and convert to it at
send time when running on IPU8, keeping the existing IPU7 layout as
the shared driver-internal representation used by the common isys
queue/video code.

Signed-off-by: Divyamani Tripathi <divyamani.tripathi@intel.com>
---
Changes since v1:
- Copy msg->ipu7.stream/frame into the local struct via plain
  assignment instead of memcpy(), the union still needs an explicit
  copy before isys_stream_cfg_to_ipu8()/isys_buffset_to_ipu8()
  overwrite it in place (Sakari Ailus).

 drivers/media/pci/intel/ipu6/ipu6-isys.h    |  3 +
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c | 85 +++++++++++++++++++--
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.h | 70 +++++++++++++++++
 3 files changed, 151 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index 2af20f56a965..c5c8ede8e64e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -139,6 +139,9 @@ struct isys_fw_msgs {
 		union {
 			struct ipu7_fw_isys_frame_buff_set frame;
 			struct ipu7_fw_isys_stream_cfg stream;
+			/* sizes the union for the larger IPU8 (ABI 1.0.14) layout */
+			struct ipu7_fw_isys_frame_buff_set_ipu8 frame_ipu8;
+			struct ipu7_fw_isys_stream_cfg_ipu8 stream_ipu8;
 		} ipu7;
 	};
 	struct list_head head;
diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
index 0876cc54faa7..04db04c4b9c8 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
@@ -133,8 +133,10 @@ static int ipu7_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
 
 	isys->fwctx = fwctx;
 
+	/* IPU8 firmware expects boot-message major version 2, not 1 */
 	ret = ipu6_ipu7_init_boot_config(adev, queue_configs, num_queues,
-					 freq, fw_config_dma_addr, 1U);
+					 freq, fw_config_dma_addr,
+					 IS_IPU8(adev->isp) ? 2U : 1U);
 	if (ret) {
 		ipu7_fw_isys_cleanup(isys);
 		return ret;
@@ -412,10 +414,60 @@ ipu7_fw_isys_prepare_buf_set(struct isys_fw_msgs *msg,
 		set->output_pins[0].addr, set->output_pins[0].user_token);
 }
 
+static void isys_stream_cfg_to_ipu8(struct ipu7_fw_isys_stream_cfg_ipu8 *dst,
+				    const struct ipu7_fw_isys_stream_cfg *src)
+{
+	memset(dst, 0, sizeof(*dst));
+	memcpy(dst->input_pins, src->input_pins, sizeof(dst->input_pins));
+	dst->stream_msg_map = src->stream_msg_map;
+	dst->port_id = src->port_id;
+	dst->vc = src->vc;
+	dst->nof_input_pins = src->nof_input_pins;
+	dst->nof_output_pins = src->nof_output_pins;
+	for (unsigned int i = 0; i < ARRAY_SIZE(src->output_pins); i++) {
+		dst->output_pins[i].link = src->output_pins[i].link;
+		dst->output_pins[i].crop.line_top =
+			src->output_pins[i].crop.line_top;
+		dst->output_pins[i].crop.line_bottom =
+			src->output_pins[i].crop.line_bottom;
+		dst->output_pins[i].dpcm = src->output_pins[i].dpcm;
+		dst->output_pins[i].stride = src->output_pins[i].stride;
+		dst->output_pins[i].ft = src->output_pins[i].ft;
+		dst->output_pins[i].send_irq = src->output_pins[i].send_irq;
+		dst->output_pins[i].input_pin_id =
+			src->output_pins[i].input_pin_id;
+		dst->output_pins[i].early_ack_en =
+			src->output_pins[i].early_ack_en;
+	}
+}
+
+static void isys_buffset_to_ipu8(struct ipu7_fw_isys_frame_buff_set_ipu8 *dst,
+				 const struct ipu7_fw_isys_frame_buff_set *src)
+{
+	memset(dst, 0, sizeof(*dst));
+	for (unsigned int i = 0; i < ARRAY_SIZE(src->output_pins); i++)
+		dst->output_pins[i].pin_payload = src->output_pins[i];
+	dst->capture_msg_map = src->capture_msg_map;
+	dst->frame_id = src->frame_id;
+	dst->skip_frame = src->skip_frame;
+}
+
 static int ipu7_fw_isys_stream_open(struct ipu6_isys *isys,
 				    const unsigned int stream_handle,
 				    struct isys_fw_msgs *msg)
 {
+	if (IS_IPU8(isys->adev->isp)) {
+		struct ipu7_fw_isys_stream_cfg cfg = msg->ipu7.stream;
+
+		isys_stream_cfg_to_ipu8(&msg->ipu7.stream_ipu8, &cfg);
+
+		return ipu7_fw_isys_send_cmd(isys, stream_handle,
+					     &msg->ipu7.stream_ipu8,
+					     msg->dma_addr,
+					     sizeof(msg->ipu7.stream_ipu8),
+					     IPU7_INSYS_SEND_TYPE_STREAM_OPEN);
+	}
+
 	return ipu7_fw_isys_send_cmd(isys, stream_handle, &msg->ipu7.stream,
 				     msg->dma_addr, sizeof(msg->ipu7.stream),
 				     IPU7_INSYS_SEND_TYPE_STREAM_OPEN);
@@ -435,22 +487,41 @@ static int ipu7_fw_isys_stream_flush(struct ipu6_isys *isys,
 				     IPU7_INSYS_SEND_TYPE_STREAM_FLUSH);
 }
 
+static int ipu7_fw_isys_send_frame_buff_set(struct ipu6_isys *isys,
+					    const unsigned int stream_handle,
+					    struct isys_fw_msgs *msg, u16 send_type)
+{
+	if (IS_IPU8(isys->adev->isp)) {
+		struct ipu7_fw_isys_frame_buff_set set = msg->ipu7.frame;
+
+		isys_buffset_to_ipu8(&msg->ipu7.frame_ipu8, &set);
+
+		return ipu7_fw_isys_send_cmd(isys, stream_handle,
+					     &msg->ipu7.frame_ipu8,
+					     msg->dma_addr,
+					     sizeof(msg->ipu7.frame_ipu8),
+					     send_type);
+	}
+
+	return ipu7_fw_isys_send_cmd(isys, stream_handle, &msg->ipu7.frame,
+				     msg->dma_addr, sizeof(msg->ipu7.frame),
+				     send_type);
+}
+
 static int ipu7_fw_isys_stream_start(struct ipu6_isys *isys,
 				     const unsigned int stream_handle,
 				     struct isys_fw_msgs *msg, bool capture)
 {
-	return ipu7_fw_isys_send_cmd(isys, stream_handle, &msg->ipu7.frame,
-				     msg->dma_addr, sizeof(msg->ipu7.frame),
-				     IPU7_INSYS_SEND_TYPE_STREAM_START_AND_CAPTURE);
+	return ipu7_fw_isys_send_frame_buff_set(isys, stream_handle, msg,
+						 IPU7_INSYS_SEND_TYPE_STREAM_START_AND_CAPTURE);
 }
 
 static int ipu7_fw_isys_stream_capture(struct ipu6_isys *isys,
 				       const unsigned int stream_handle,
 				       struct isys_fw_msgs *msg)
 {
-	return ipu7_fw_isys_send_cmd(isys, stream_handle, &msg->ipu7.frame,
-				     msg->dma_addr, sizeof(msg->ipu7.frame),
-				     IPU7_INSYS_SEND_TYPE_STREAM_CAPTURE);
+	return ipu7_fw_isys_send_frame_buff_set(isys, stream_handle, msg,
+						 IPU7_INSYS_SEND_TYPE_STREAM_CAPTURE);
 }
 
 const struct ipu6_fw_isys_ops ipu7_fw_isys_ops = {
diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.h b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.h
index 6b72560b0a15..30289d73be6c 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.h
@@ -235,6 +235,14 @@ struct ipu7_fw_isys_output_cropping {
 	u16 line_bottom;
 } __packed;
 
+/* IPU8 InSys firmware layout, ABI 1.0.14. */
+struct ipu7_fw_isys_output_cropping_ipu8 {
+	u16 line_top;
+	u16 line_bottom;
+	u16 column_left;
+	u16 column_right;
+} __packed;
+
 struct ipu7_fw_isys_output_dpcm {
 	u8 enable;
 	u8 type;
@@ -242,6 +250,25 @@ struct ipu7_fw_isys_output_dpcm {
 	u8 pad;
 } __packed;
 
+/* IPU8 (InSys ABI 1.0.14) only. */
+enum ipu7_insys_cfa_dim {
+	IPU7_INSYS_CFA_DIM_2X2 = 0,
+	IPU7_INSYS_CFA_DIM_4X4 = 1,
+	N_IPU7_INSYS_CFA_DIM
+};
+
+#define IPU7_INSYS_MAX_BINNING_FACTOR	4U
+
+/* IPU8 (InSys ABI 1.0.14) only. */
+struct ipu7_fw_isys_upipe_output_pin_ipu8 {
+	u32 opaque_pin_cfg;
+	u16 plane_offset_1;
+	u16 plane_offset_2;
+	u8 single_uob_fifo;
+	u8 shared_uob_fifo;
+	u8 pad[2];
+} __packed;
+
 struct ipu7_fw_isys_output_pin {
 	struct ipu7_fw_isys_output_link link;
 	struct ipu7_fw_isys_output_cropping crop;
@@ -254,6 +281,22 @@ struct ipu7_fw_isys_output_pin {
 	u8 pad[3];
 } __packed;
 
+/* IPU8 InSys firmware layout, ABI 1.0.14. */
+struct ipu7_fw_isys_output_pin_ipu8 {
+	struct ipu7_fw_isys_output_link link;
+	struct ipu7_fw_isys_output_cropping_ipu8 crop;
+	struct ipu7_fw_isys_output_dpcm dpcm;
+	struct ipu7_fw_isys_upipe_output_pin_ipu8 upipe_pin_cfg;
+	u32 stride;
+	u16 ft;
+	u8 upipe_enable;
+	u8 send_irq;
+	u8 input_pin_id;
+	u8 early_ack_en;
+	u8 cfa_dim;
+	u8 binning_factor;
+} __packed;
+
 struct ipu7_fw_isys_resolution {
 	u32 width;
 	u32 height;
@@ -280,12 +323,30 @@ struct ipu7_fw_isys_stream_cfg {
 	u8 pad[2];
 } __packed;
 
+/* IPU8 InSys firmware layout, ABI 1.0.14. */
+struct ipu7_fw_isys_stream_cfg_ipu8 {
+	struct ipu7_fw_isys_input_pin input_pins[IPU7_MAX_IPINS];
+	struct ipu7_fw_isys_output_pin_ipu8 output_pins[IPU7_MAX_OPINS];
+	u16 stream_msg_map;
+	u8 port_id;
+	u8 vc;
+	u8 nof_input_pins;
+	u8 nof_output_pins;
+	u8 pad[2];
+} __packed;
+
 struct ipu7_fw_isys_capture_output_pin {
 	u64 user_token;
 	u32 addr;
 	u8 pad[4];
 } __packed;
 
+/* IPU8 (InSys ABI 1.0.14) only. */
+struct ipu7_fw_isys_capture_output_pin_cfg_ipu8 {
+	struct ipu7_fw_isys_capture_output_pin pin_payload;
+	u32 upipe_capture_cfg;
+} __packed;
+
 struct ipu7_fw_isys_frame_buff_set {
 	struct ipu7_fw_isys_capture_output_pin output_pins[IPU7_MAX_OPINS];
 	u8 capture_msg_map;
@@ -294,6 +355,15 @@ struct ipu7_fw_isys_frame_buff_set {
 	u8 pad[5];
 } __packed;
 
+/* IPU8 InSys firmware layout, ABI 1.0.14. */
+struct ipu7_fw_isys_frame_buff_set_ipu8 {
+	struct ipu7_fw_isys_capture_output_pin_cfg_ipu8 output_pins[IPU7_MAX_OPINS];
+	u8 capture_msg_map;
+	u8 frame_id;
+	u8 skip_frame;
+	u8 pad[5];
+} __packed;
+
 struct ipu6_fw_isys_ops *ipu7_fw_isys_get_ops(void);
 irqreturn_t ipu7_isys_isr(struct ipu6_bus_device *adev);
 
-- 
2.43.0

