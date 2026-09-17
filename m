Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD184DBD8B
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645192; cv=none; b=vDlS9oUeFtZY2h3kqLe5Pkf8e/UO45uKb///4wpKDBZx1jiyC0oWVYcJcqyzUMvucKr4KFAptRGohJXb7yaKLji4f2F6p0MO1lhEUWG+uOSUxBV5IJqI+rvLZiZrtq0Sg6JXdfXvgs3PH55bae71w70aQtJ0rrHl9Z1M1OZvDF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645192; c=relaxed/simple;
	bh=33WGpf2gDG6egxmwsEXrZz09C4R28E9IQSCcn332u/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fa9LQI+qYk7i0GAgRO+sr6jpQPYk+QJLHdsDdPBMQPK1eQJGSU/RVDv1Hbta0LDW+By+fNnUsi5f3xlwHMezVKqeqQu67/UOAQz9zSzEskWO7KW5amplsO5ljt6W9frqzBh4DZwBCbyRJoWt9/2+e5b+evTxWMjKOqw5emjJjFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEetRYNM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEetRYNM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789645188; x=1821181188;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=33WGpf2gDG6egxmwsEXrZz09C4R28E9IQSCcn332u/E=;
  b=jEetRYNMlkG1Jyt5FpCY6vtmdww4uGM0mWGRlBD3A1Qv3lSOS2g2kCst
   9FZVEHW/J4N5IXylf5A0CHdG22yyM9m7HCAaufFERRPSJeZcYCTDu2R4d
   5ubkNhZtlF/0BIQLddTAtv5i8F6a/ct5a/A362HF7aw5jpiugWUVdNx7T
   X7Ku1RNmKTbPQbmxn9ZmGIZNbnB6oJHA8v0fhmzMiRN6wetpU198XvJ1p
   dw1V6vQ8rFfmqlqNTXq5xwojKc9HsK5CMC2RLUwscsF4lBuAXDVMni69F
   /e1P2Hz5W+7eO2B3d60FGqoUIcEU0wENJloWOpwJO7ZPC4/NeVoUR3tUZ
   Q==;
X-CSE-ConnectionGUID: WjoV3NmCShWpgOIudaMJNA==
X-CSE-MsgGUID: xQX6PPooSk+pxeWUdVauww==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77622395"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77622395"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:41 -0700
X-CSE-ConnectionGUID: yGcS2Qk8QKCvNOhoNfEX9A==
X-CSE-MsgGUID: nGcRHYEYRI+8Nd34UI4jnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271097391"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:39 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 05414121C91;
	Thu, 17 Sep 2026 14:39:25 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x7ASa-00000000FNm-0mDg;
	Thu, 17 Sep 2026 14:39:24 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH v2 16/21] media: ipu6: Bridge the gap between streams in V4L2 and IPU6 firmware
Date: Thu, 17 Sep 2026 14:39:18 +0300
Message-ID: <20260917113923.59004-17-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917113923.59004-1-sakari.ailus@linux.intel.com>
References: <20260917113923.59004-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The stream concept of the IPU6 firmware is aligned with that of the CSI-2,
effectively meaning that a stream equals to a CSI-2 virtual channel. Only
start streaming once all streams on a given virtual channel have been
started, and stop streaming once first one of them has been stopped.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   |  63 ++-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 174 ++++----
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   6 +-
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  43 +-
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 376 ++++++++----------
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  38 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |  29 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |   8 +-
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c   |  48 ++-
 9 files changed, 325 insertions(+), 460 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
index 2c71bf27a91d..5e1b57ef650f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -562,7 +562,8 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
 		goto leave;
 	}
 
-	stream = ipu6_isys_query_stream_by_handle(isys, resp->stream_handle);
+	stream = resp->stream_handle < IPU6_ISYS_MAX_STREAMS ?
+		isys->streams_by_handle[resp->stream_handle] : NULL;
 	if (!stream) {
 		dev_err(&adev->auxdev.dev, "stream of stream_handle %u is unused\n",
 			resp->stream_handle);
@@ -599,7 +600,7 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
 		if (!resp->buf_id) {
 			dev_warn(&adev->auxdev.dev, "%d: Invalid buf ID\n",
 				 resp->stream_handle);
-			goto leave_put_stream;
+			goto leave;
 		}
 
 		isys_fw_msg = container_of((void *)(uintptr_t)resp->buf_id,
@@ -650,8 +651,6 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
 		break;
 	}
 
-leave_put_stream:
-	ipu6_isys_put_stream(stream);
 leave:
 	ipu6_fw_isys_put_resp(isys);
 	return 0;
@@ -662,7 +661,6 @@ static void ipu6_isys_csi2_isr(struct ipu6_isys_csi2 *csi2)
 	struct ipu6_isys_stream *stream;
 	unsigned int i;
 	u32 status;
-	int source;
 
 	ipu6_isys_register_errors(csi2);
 
@@ -672,24 +670,17 @@ static void ipu6_isys_csi2_isr(struct ipu6_isys_csi2 *csi2)
 	writel(status, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
 	       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
 
-	source = csi2->asd.source;
 	for (i = 0; i < NR_OF_CSI2_VC; i++) {
 		if (status & IPU_CSI_RX_IRQ_FS_VC(i)) {
-			stream = ipu6_isys_query_stream_by_source(csi2->isys,
-								  source, i);
-			if (stream) {
+			stream = csi2->streams_by_vc[i];
+			if (stream)
 				ipu6_isys_csi2_sof_event_by_stream(stream);
-				ipu6_isys_put_stream(stream);
-			}
 		}
 
 		if (status & IPU_CSI_RX_IRQ_FE_VC(i)) {
-			stream = ipu6_isys_query_stream_by_source(csi2->isys,
-								  source, i);
-			if (stream) {
+			stream = csi2->streams_by_vc[i];
+			if (stream)
 				ipu6_isys_csi2_eof_event_by_stream(stream);
-				ipu6_isys_put_stream(stream);
-			}
 		}
 	}
 }
@@ -756,16 +747,18 @@ irqreturn_t ipu6_isys_isr(struct ipu6_bus_device *adev)
 }
 
 static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
-				struct ipu6_fw_isys_stream_cfg_data_abi *cfg)
+				struct ipu6_isys_stream *stream,
+				struct media_pad *src_pad,
+				struct v4l2_mbus_frame_desc_entry *entry,
+				void *__cfg)
 {
-	struct media_pad *src_pad = media_pad_remote_pad_first(&av->pad);
 	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(src_pad->entity);
 	struct v4l2_subdev_state *state = v4l2_subdev_get_locked_active_state(sd);
+	struct ipu6_fw_isys_stream_cfg_data_abi *cfg = __cfg;
 	struct ipu6_fw_isys_input_pin_info_abi *input_pin;
 	struct ipu6_fw_isys_output_pin_info_abi *output_pin;
-	struct ipu6_isys_stream *stream = av->stream;
 	struct ipu6_isys_queue *aq = &av->aq;
-	struct v4l2_mbus_framefmt fmt;
+	struct v4l2_mbus_framefmt *fmt;
 	const struct ipu6_isys_pixelformat *pfmt =
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
 	struct v4l2_rect v4l2_crop;
@@ -775,13 +768,13 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 	u32 src_stream;
 
 	src_stream = __ipu6_isys_get_src_stream_by_src_pad(state, src_pad->index);
-	fmt = *v4l2_subdev_state_get_format(state, src_pad->index, src_stream);
+	fmt = v4l2_subdev_state_get_format(state, src_pad->index, src_stream);
 	v4l2_crop = *v4l2_subdev_state_get_crop(state, src_pad->index, src_stream);
 
 	input_pin = &cfg->input_pins[input_pins];
-	input_pin->input_res.width = fmt.width;
-	input_pin->input_res.height = fmt.height;
-	input_pin->dt = av->dt;
+	input_pin->input_res.width = fmt->width;
+	input_pin->input_res.height = fmt->height;
+	input_pin->dt = entry->bus.csi2.dt;
 	input_pin->bits_per_pix = pfmt->bpp_packed;
 	input_pin->mapped_dt = 0x40; /* invalid mipi data type */
 	input_pin->mipi_decompression = 0;
@@ -822,28 +815,24 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 	return 0;
 }
 
-static int ipu6_fw_isys_prepare_stream_cfg(struct ipu6_isys_video *av,
+static int ipu6_fw_isys_prepare_stream_cfg(struct ipu6_isys_stream *stream,
+					   struct v4l2_mbus_frame_desc *desc,
 					   struct isys_fw_msgs *msg)
 {
 	struct ipu6_fw_isys_stream_cfg_data_abi *stream_cfg;
-	struct device *dev = &av->isys->adev->auxdev.dev;
-	struct ipu6_isys_stream *stream = av->stream;
-	struct ipu6_isys_queue *aq;
+	struct device *dev = &stream->isys->adev->auxdev.dev;
+	int ret;
 
 	stream_cfg = &msg->ipu6.stream;
-	stream_cfg->src = stream->stream_source;
+	stream_cfg->src = stream->asd->source;
 	stream_cfg->vc = stream->vc;
 	stream_cfg->isl_use = 0;
 	stream_cfg->sensor_type = IPU6_FW_ISYS_SENSOR_MODE_NORMAL;
 
-	list_for_each_entry(aq, &stream->queues, node) {
-		struct ipu6_isys_video *__av = ipu6_isys_queue_to_video(aq);
-		int ret;
-
-		ret = ipu6_isys_fw_pin_cfg(__av, stream_cfg);
-		if (ret < 0)
-			return ret;
-	}
+	ret = ipu6_isys_fw_pins_prepare(stream, desc, ipu6_isys_fw_pin_cfg,
+					stream_cfg);
+	if (ret)
+		return ret;
 
 	ipu6_fw_isys_dump_stream_cfg(dev, msg);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 2bd1392569ff..5dc2596766f4 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -511,13 +511,13 @@ static int ipu7_isys_csi2_stream_enable(struct ipu6_isys_csi2 *csi2)
 
 static bool ipu6_isys_csi2_streaming_change(struct ipu6_isys_subdev *asd,
 					    struct v4l2_subdev_state *state,
-					    u32 pad, u8 *vc, bool enable)
+					    u32 pad,
+					    struct v4l2_mbus_frame_desc *desc,
+					    u8 *vc, bool enable)
 {
 	u32 streams_enabled = 0, nodes_streaming = 0;
 	struct v4l2_subdev_route *route, *this_route = NULL;
-	struct v4l2_mbus_frame_desc desc = { 0 };
 	struct v4l2_mbus_frame_desc_entry *this_entry = NULL;
-	int ret;
 
 	for_each_active_route(&state->routing, this_route)
 		if (pad == this_route->source_pad)
@@ -527,18 +527,9 @@ static bool ipu6_isys_csi2_streaming_change(struct ipu6_isys_subdev *asd,
 		return false;
 	}
 
-	struct media_pad *remote_pad =
-		media_pad_remote_pad_unique(&asd->sd.entity.pads[this_route->sink_pad]);
-	struct v4l2_subdev *remote_sd =
-		media_entity_to_v4l2_subdev(remote_pad->entity);
-	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc,
-			       remote_pad->index, &desc);
-	if (ret)
-		return ret;
-
-	for (unsigned int i = 0; i < desc.num_entries; i++) {
-		if (desc.entry[i].stream == this_route->sink_stream) {
-			this_entry = &desc.entry[i];
+	for (unsigned int i = 0; i < desc->num_entries; i++) {
+		if (desc->entry[i].stream == this_route->sink_stream) {
+			this_entry = &desc->entry[i];
 			break;
 		}
 	}
@@ -552,9 +543,9 @@ static bool ipu6_isys_csi2_streaming_change(struct ipu6_isys_subdev *asd,
 	for_each_active_route(&state->routing, route) {
 		struct v4l2_mbus_frame_desc_entry *entry = NULL;
 
-		for (unsigned int i = 0; i < desc.num_entries; i++) {
-			if (desc.entry[i].stream == this_entry->stream) {
-				entry = &desc.entry[i];
+		for (unsigned int i = 0; i < desc->num_entries; i++) {
+			if (desc->entry[i].stream == this_entry->stream) {
+				entry = &desc->entry[i];
 				break;
 			}
 		}
@@ -580,12 +571,13 @@ static bool ipu6_isys_csi2_streaming_change(struct ipu6_isys_subdev *asd,
 			nodes_streaming++;
 	}
 
-	*vc = this_entry->bus.csi2.vc;
+	if (vc)
+		*vc = this_entry->bus.csi2.vc;
 
 	if (streams_enabled == nodes_streaming) {
 		dev_dbg(asd->sd.dev,
-			"changing streaming state to %s on \"%s\":%u\n",
-			str_enabled_disabled(enable), asd->sd.entity.name, pad);
+			"changing streaming state to %s on \"%s\"\n",
+			str_enabled_disabled(enable), asd->sd.entity.name);
 		return true;
 	}
 
@@ -603,11 +595,15 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
 	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
 	struct ipu6_device *isp = asd->isys->adev->isp;
-	struct v4l2_subdev *remote_sd;
-	struct media_pad *remote_pad,
+	struct media_pad *remote_pad =
+		media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]),
 		*vdev_pad = media_pad_remote_pad_unique(&sd->entity.pads[pad]);
 	struct ipu6_isys_video *av =
 		container_of_const(vdev_pad, struct ipu6_isys_video, pad);
+	struct v4l2_subdev *remote_sd =
+		media_entity_to_v4l2_subdev(remote_pad->entity);
+	struct v4l2_mbus_frame_desc desc = { 0 };
+	struct ipu6_isys_stream *stream;
 	struct ipu6_isys_buffer_list bl;
 	u64 sink_streams;
 	int ret;
@@ -615,11 +611,10 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 
 	lockdep_assert_held(&csi2->isys->stream_mutex);
 
-	ret = ipu6_isys_buffer_list_get(av->stream, &bl);
-	if (ret < 0) {
-		dev_warn(sd->dev, "no buffer available, DRIVER BUG?\n");
+	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc,
+			       remote_pad->index, &desc);
+	if (ret)
 		return ret;
-	}
 
 	list_add(&av->csi2_entry, &csi2->av_head);
 
@@ -628,20 +623,28 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 						&streams_mask);
 	csi2->stream_ids |= sink_streams;
 
-	if (!ipu6_isys_csi2_streaming_change(asd, state, pad, &vc, true))
+	if (!ipu6_isys_csi2_streaming_change(asd, state, pad, &desc, &vc, true))
 		return 0;
 
-	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
-	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
-
 	ipu6_isys_csi2_setup_watermark(csi2, state, remote_sd);
 
-	ret = ipu6_isys_start_stream_firmware(av, &bl);
-	if (ret) {
-		dev_err(sd->dev, "start stream of firmware failed\n");
-		goto err_return_buffers;
+	stream = ipu6_isys_alloc_stream_firmware(csi2, state, &desc, vc);
+	if (IS_ERR(stream)) {
+		ret = PTR_ERR(stream);
+		dev_err(sd->dev, "allocating firmware stream failed\n");
+		goto err_clear_watermark;
+	}
+
+	ret = ipu6_isys_buffer_list_get(stream, &bl);
+	if (ret < 0) {
+		dev_warn(sd->dev, "no buffer available, DRIVER BUG?\n");
+		goto err_free_stream_firmware;
 	}
 
+	ret = ipu6_isys_start_stream_firmware(stream, &bl, &desc);
+	if (ret)
+		goto err_requeue_buffers;
+
 	if (!csi2->streaming_vc) {
 		ret = IS_IPU7(isp) ? ipu7_isys_csi2_stream_enable(csi2) :
 				     ipu6_isys_csi2_stream_enable(csi2);
@@ -664,15 +667,21 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	else
 		ipu6_isys_csi2_stream_disable(csi2);
 
+err_requeue_buffers:
+	ipu6_isys_buffer_list_queue(&bl, IPU6_ISYS_BUFFER_LIST_FL_INCOMING, 0);
+
 err_stop_stream_firmware:
-	ipu6_isys_stop_streaming_firmware(av);
-	ipu6_isys_close_streaming_firmware(av);
+	ipu6_isys_stop_stream_firmware(stream);
+	ipu6_isys_close_stream_firmware(stream);
+
+err_free_stream_firmware:
+	ipu6_isys_free_stream_firmware(stream);
 
-err_return_buffers:
+err_clear_watermark:
 	ipu6_isys_csi2_clear_watermark(csi2);
+	ipu6_isys_csi2_streaming_change(asd, state, pad, &desc, NULL, false);
 	csi2->stream_ids &= ~sink_streams;
 	list_del(&av->csi2_entry);
-	ipu6_isys_buffer_list_queue(&bl, IPU6_ISYS_BUFFER_LIST_FL_INCOMING, 0);
 
 	return ret;
 }
@@ -681,32 +690,42 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 					  struct v4l2_subdev_state *state,
 					  u32 pad, u64 streams_mask)
 {
-	struct media_pad *remote_pad,
+	struct media_pad *remote_pad =
+		media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]),
 		*vdev_pad = media_pad_remote_pad_unique(&sd->entity.pads[pad]);
 	struct ipu6_isys_video *av =
 		container_of_const(vdev_pad, struct ipu6_isys_video, pad);
+	struct v4l2_subdev *remote_sd =
+		media_entity_to_v4l2_subdev(remote_pad->entity);
 	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
 	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
 	struct ipu6_device *isp = asd->isys->adev->isp;
-	struct v4l2_subdev *remote_sd;
+	struct v4l2_mbus_frame_desc desc = { 0 };
 	u64 sink_streams;
+	int ret;
 	u8 vc;
 
 	lockdep_assert_held(&csi2->isys->stream_mutex);
 
-	if (!ipu6_isys_csi2_streaming_change(asd, state, pad, &vc, false))
-		goto out_del_csi2_entry;
-
-	csi2->streaming_vc &= ~BIT(vc);
+	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc,
+			       remote_pad->index, &desc);
+	if (ret)
+		return ret;
 
 	sink_streams =
 		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
 						&streams_mask);
 
-	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
-	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+	csi2->stream_ids &= ~sink_streams;
 
-	ipu6_isys_stop_streaming_firmware(av);
+	if (!ipu6_isys_csi2_streaming_change(asd, state, pad, &desc, &vc, false))
+		goto out_del_csi2_entry;
+
+	csi2->streaming_vc &= ~BIT(vc);
+
+	struct ipu6_isys_stream *stream =
+		ipu6_isys_find_stream_firmware(csi2, vc);
+	ipu6_isys_stop_stream_firmware(stream);
 
 	if IS_IPU7(isp)
 		ipu7_isys_csi2_stream_disable(csi2);
@@ -714,9 +733,10 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 		ipu6_isys_csi2_stream_disable(csi2);
 
 	v4l2_subdev_disable_streams(remote_sd, remote_pad->index,
-				    csi2->stream_ids);
+				    csi2->stream_ids | sink_streams);
 
-	ipu6_isys_close_streaming_firmware(av);
+	ipu6_isys_close_stream_firmware(stream);
+	ipu6_isys_free_stream_firmware(stream);
 
 	ipu6_isys_csi2_clear_watermark(csi2);
 
@@ -869,6 +889,7 @@ int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2,
 		goto fail;
 
 	INIT_LIST_HEAD(&csi2->av_head);
+	INIT_LIST_HEAD(&csi2->streams);
 	csi2->asd.source = IPU6_FW_ISYS_STREAM_SRC_CSI2_PORT0 + index;
 	csi2->asd.supported_codes = csi2_supported_codes;
 	snprintf(csi2->asd.sd.name, sizeof(csi2->asd.sd.name),
@@ -919,56 +940,3 @@ void ipu6_isys_csi2_eof_event_by_stream(struct ipu6_isys_stream *stream)
 	dev_dbg(dev, "eof_event::csi2-%i sequence: %i\n",
 		csi2->port, frame_sequence);
 }
-
-int ipu6_isys_csi2_get_remote_desc(u32 source_stream,
-				   struct ipu6_isys_csi2 *csi2,
-				   struct media_entity *source_entity,
-				   struct v4l2_mbus_frame_desc_entry *entry)
-{
-	struct v4l2_mbus_frame_desc_entry *desc_entry = NULL;
-	struct device *dev = &csi2->isys->adev->auxdev.dev;
-	struct v4l2_mbus_frame_desc desc;
-	struct v4l2_subdev *source;
-	struct media_pad *pad;
-	unsigned int i;
-	int ret;
-
-	source = media_entity_to_v4l2_subdev(source_entity);
-	if (!source)
-		return -EPIPE;
-
-	pad = media_pad_remote_pad_first(&csi2->asd.pad[CSI2_PAD_SINK]);
-	if (!pad)
-		return -EPIPE;
-
-	ret = v4l2_subdev_call(source, pad, get_frame_desc, pad->index, &desc);
-	if (ret)
-		return ret;
-
-	if (desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
-		dev_err(dev, "Unsupported frame descriptor type\n");
-		return -EINVAL;
-	}
-
-	for (i = 0; i < desc.num_entries; i++) {
-		if (source_stream == desc.entry[i].stream) {
-			desc_entry = &desc.entry[i];
-			break;
-		}
-	}
-
-	if (!desc_entry) {
-		dev_err(dev, "Failed to find stream %u from remote subdev\n",
-			source_stream);
-		return -EINVAL;
-	}
-
-	if (desc_entry->bus.csi2.vc >= NR_OF_CSI2_VC) {
-		dev_err(dev, "invalid vc %d\n", desc_entry->bus.csi2.vc);
-		return -EINVAL;
-	}
-
-	*entry = *desc_entry;
-
-	return 0;
-}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
index 49d01e938dc8..1620ac16f90d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -42,6 +42,8 @@ struct ipu6_isys_csi2 {
 	struct ipu6_isys *isys;
 	struct ipu6_isys_video av[NR_OF_CSI2_SRC_PADS];
 	struct list_head av_head;
+	struct list_head streams;
+	struct ipu6_isys_stream *streams_by_vc[NR_OF_CSI2_VC];
 
 	void __iomem *base;
 	u32 receiver_errors;
@@ -82,9 +84,5 @@ void ipu6_isys_csi2_sof_event_by_stream(struct ipu6_isys_stream *stream);
 void ipu6_isys_csi2_eof_event_by_stream(struct ipu6_isys_stream *stream);
 void ipu6_isys_register_errors(struct ipu6_isys_csi2 *csi2);
 void ipu6_isys_csi2_error(struct ipu6_isys_csi2 *csi2);
-int ipu6_isys_csi2_get_remote_desc(u32 source_stream,
-				   struct ipu6_isys_csi2 *csi2,
-				   struct media_entity *source_entity,
-				   struct v4l2_mbus_frame_desc_entry *entry);
 
 #endif /* IPU6_ISYS_CSI2_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 725c3603d9e1..fd2c55a5e781 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -239,20 +239,23 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av)
 {
 	struct ipu6_bus_device *adev = av->isys->adev;
 	const struct ipu6_fw_isys_ops *fw_ops = adev->auxdrv_data->fw_ops;
-	struct ipu6_isys_stream *stream = av->stream;
 	struct device *dev = &adev->auxdev.dev;
 	struct ipu6_isys_buffer_list bl;
 	struct isys_fw_msgs *msg;
 	int ret;
 
-	guard(mutex)(&stream->isys->stream_mutex);
+	guard(mutex)(&av->isys->stream_mutex);
 	ret = ipu6_isys_video_set_streaming(av, 1);
 	if (ret)
 		return ret;
 
-	if (!(BIT(stream->vc) & av->csi2->streaming_vc))
+	if (!av->stream || !(BIT(av->stream->vc) & av->csi2->streaming_vc))
 		return 0;
 
+	struct ipu6_isys_stream *stream = av->stream;
+
+	guard(mutex)(&stream->mutex);
+
 	do {
 		ret = ipu6_isys_buffer_list_get(stream, &bl);
 		if (ret < 0)
@@ -470,7 +473,6 @@ static void return_buffers(struct ipu6_isys_queue *aq,
 static void ipu6_isys_stream_cleanup(struct ipu6_isys_video *av)
 {
 	video_device_pipeline_stop(&av->vdev);
-	ipu6_isys_put_stream(av->stream);
 	av->stream = NULL;
 }
 
@@ -481,9 +483,7 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	const struct ipu6_isys_pixelformat *pfmt =
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
-	struct ipu6_isys_stream *stream;
 	struct media_pad *source_pad, *remote_pad;
-	bool first;
 	int ret;
 
 	dev_dbg(dev, "stream: %s: width %u, height %u, css pixelformat %u\n",
@@ -504,12 +504,9 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 		goto out_return_buffers;
 	}
 
-	ret = ipu6_isys_setup_video(av, remote_pad, source_pad);
-	if (ret < 0) {
-		dev_dbg(dev, "failed to setup video\n");
+	ret = video_device_pipeline_alloc_start(&av->vdev);
+	if (ret < 0)
 		goto out_return_buffers;
-	}
-	first = ret;
 
 	ret = ipu6_isys_link_fmt_validate(aq);
 	if (ret) {
@@ -523,29 +520,13 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ret)
 		goto out_pipeline_stop;
 
-	stream = av->stream;
-	mutex_lock(&stream->mutex);
-	if (first) {
-		ret = ipu6_isys_video_prepare_stream(av, source_pad->entity);
-		if (ret)
-			goto out_fw_close;
-	}
-
-	list_add(&aq->node, &stream->queues);
-
 	ret = ipu6_isys_stream_start(av);
 	if (ret)
-		goto out_stream_start;
-
-	mutex_unlock(&stream->mutex);
+		goto out_fw_close;
 
 	return 0;
 
-out_stream_start:
-	list_del(&aq->node);
-
 out_fw_close:
-	mutex_unlock(&stream->mutex);
 	ipu6_isys_fw_close(av->isys);
 
 out_pipeline_stop:
@@ -561,17 +542,11 @@ static void stop_streaming(struct vb2_queue *q)
 {
 	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(q);
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
-	struct ipu6_isys_stream *stream = av->stream;
-
-	mutex_lock(&stream->mutex);
 
 	mutex_lock(&av->isys->stream_mutex);
 	ipu6_isys_video_set_streaming(av, 0);
-	list_del(&aq->node);
 	mutex_unlock(&av->isys->stream_mutex);
 
-	mutex_unlock(&stream->mutex);
-
 	ipu6_isys_stream_cleanup(av);
 
 	return_buffers(aq, VB2_BUF_STATE_ERROR);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 4037a3c80dc6..1bb91627c7db 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -432,30 +432,77 @@ static int link_validate(struct media_link *link)
 	return ret;
 }
 
-static void get_stream_opened(struct ipu6_isys_video *av)
+static void get_stream_opened(struct ipu6_isys *isys)
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&av->isys->streams_lock, flags);
-	av->isys->stream_opened++;
-	spin_unlock_irqrestore(&av->isys->streams_lock, flags);
+	spin_lock_irqsave(&isys->streams_lock, flags);
+	isys->stream_opened++;
+	spin_unlock_irqrestore(&isys->streams_lock, flags);
 }
 
-static void put_stream_opened(struct ipu6_isys_video *av)
+static void put_stream_opened(struct ipu6_isys *isys)
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&av->isys->streams_lock, flags);
-	av->isys->stream_opened--;
-	spin_unlock_irqrestore(&av->isys->streams_lock, flags);
+	spin_lock_irqsave(&isys->streams_lock, flags);
+	isys->stream_opened--;
+	spin_unlock_irqrestore(&isys->streams_lock, flags);
 }
 
-int ipu6_isys_start_stream_firmware(struct ipu6_isys_video *av,
-				    struct ipu6_isys_buffer_list *bl)
+int ipu6_isys_fw_pins_prepare(struct ipu6_isys_stream *stream,
+			      struct v4l2_mbus_frame_desc *desc,
+			      int (*fw_pin_cfg)(struct ipu6_isys_video *av,
+						struct ipu6_isys_stream *stream,
+						struct media_pad *src_pad,
+						struct v4l2_mbus_frame_desc_entry *entry,
+						void *__cfg), void *stream_cfg)
 {
-	struct ipu6_bus_device *adev = av->isys->adev;
+	struct v4l2_subdev_state *csi2_state =
+		v4l2_subdev_get_locked_active_state(&stream->asd->sd);
+	struct device *dev = &stream->isys->adev->auxdev.dev;
+	struct ipu6_isys_queue *aq;
+
+	list_for_each_entry(aq, &stream->queues, node) {
+		struct ipu6_isys_video *__av = ipu6_isys_queue_to_video(aq);
+		struct media_pad *remote_pad =
+			media_pad_remote_pad_first(&__av->pad);
+		u64 source_streams = 1;
+		unsigned int sink_stream =
+			__ffs(v4l2_subdev_state_xlate_streams(csi2_state,
+							      remote_pad->index,
+							      CSI2_PAD_SINK,
+							      &source_streams));
+		struct v4l2_mbus_frame_desc_entry *entry = NULL;
+		int ret;
+
+		for (unsigned int i = 0; i < desc->num_entries; i++) {
+			if (desc->entry[i].stream == sink_stream) {
+				entry = &desc->entry[i];
+				break;
+			}
+		}
+
+		if (!entry) {
+			dev_err(dev, "cannot find frame desc entry for sink stream %u\n",
+				sink_stream);
+			return -EINVAL;
+		}
+
+		ret = fw_pin_cfg(__av, stream, remote_pad, entry, stream_cfg);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+int ipu6_isys_start_stream_firmware(struct ipu6_isys_stream *stream,
+				    struct ipu6_isys_buffer_list *bl,
+				    struct v4l2_mbus_frame_desc *desc)
+{
+	struct ipu6_bus_device *adev = stream->asd->isys->adev;
 	const struct ipu6_fw_isys_ops *fw_ops = adev->auxdrv_data->fw_ops;
-	struct ipu6_isys_stream *stream = av->stream;
 	struct device *dev = &adev->auxdev.dev;
 	struct isys_fw_msgs *msg = NULL;
 	int ret, retout, tout;
@@ -465,27 +512,27 @@ int ipu6_isys_start_stream_firmware(struct ipu6_isys_video *av,
 	if (!msg)
 		return -ENOMEM;
 
-	ret = fw_ops->prepare_stream_cfg(av, msg);
+	ret = fw_ops->prepare_stream_cfg(stream, desc, msg);
 	if (ret < 0) {
-		ipu6_put_fw_msg_buf(av->isys, msg);
+		ipu6_put_fw_msg_buf(stream->isys, msg);
 		return ret;
 	}
 
 	reinit_completion(&stream->stream_open_completion);
 
-	ret = fw_ops->stream_open(av->isys, stream->stream_handle, msg);
+	ret = fw_ops->stream_open(stream->isys, stream->stream_handle, msg);
 	if (ret < 0) {
 		dev_err(dev, "can't open stream (%d)\n", ret);
-		ipu6_put_fw_msg_buf(av->isys, msg);
+		ipu6_put_fw_msg_buf(stream->isys, msg);
 		return ret;
 	}
 
-	get_stream_opened(av);
+	get_stream_opened(stream->isys);
 
 	tout = wait_for_completion_timeout(&stream->stream_open_completion,
 					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
 
-	ipu6_put_fw_msg_buf(av->isys, msg);
+	ipu6_put_fw_msg_buf(stream->isys, msg);
 
 	if (!tout) {
 		dev_err(dev, "stream open time out\n");
@@ -509,7 +556,7 @@ int ipu6_isys_start_stream_firmware(struct ipu6_isys_video *av,
 
 	reinit_completion(&stream->stream_start_completion);
 
-	ret = fw_ops->stream_start(av->isys, stream->stream_handle, msg,
+	ret = fw_ops->stream_start(stream->isys, stream->stream_handle, msg,
 				   capture);
 	if (ret < 0) {
 		dev_err(dev, "can't start streaming (%d)\n", ret);
@@ -535,7 +582,7 @@ int ipu6_isys_start_stream_firmware(struct ipu6_isys_video *av,
 out_stream_close:
 	reinit_completion(&stream->stream_close_completion);
 
-	retout = fw_ops->stream_close(av->isys, stream->stream_handle);
+	retout = fw_ops->stream_close(stream->isys, stream->stream_handle);
 	if (retout < 0) {
 		dev_dbg(dev, "can't close stream (%d)\n", retout);
 		goto out_put_stream_opened;
@@ -551,22 +598,21 @@ int ipu6_isys_start_stream_firmware(struct ipu6_isys_video *av,
 		dev_dbg(dev, "stream close complete\n");
 
 out_put_stream_opened:
-	put_stream_opened(av);
+	put_stream_opened(stream->isys);
 
 	return ret;
 }
 
-void ipu6_isys_stop_streaming_firmware(struct ipu6_isys_video *av)
+void ipu6_isys_stop_stream_firmware(struct ipu6_isys_stream *stream)
 {
-	struct ipu6_bus_device *adev = av->isys->adev;
+	struct ipu6_bus_device *adev = stream->asd->isys->adev;
 	const struct ipu6_fw_isys_ops *fw_ops = adev->auxdrv_data->fw_ops;
 	struct device *dev = &adev->auxdev.dev;
-	struct ipu6_isys_stream *stream = av->stream;
 	int ret, tout;
 
 	reinit_completion(&stream->stream_stop_completion);
 
-	ret = fw_ops->stream_flush(av->isys, stream->stream_handle);
+	ret = fw_ops->stream_flush(stream->isys, stream->stream_handle);
 	if (ret < 0) {
 		dev_err(dev, "can't stop stream (%d)\n", ret);
 		return;
@@ -582,17 +628,17 @@ void ipu6_isys_stop_streaming_firmware(struct ipu6_isys_video *av)
 		dev_dbg(dev, "stop stream: complete\n");
 }
 
-void ipu6_isys_close_streaming_firmware(struct ipu6_isys_video *av)
+void ipu6_isys_close_stream_firmware(struct ipu6_isys_stream *stream)
 {
-	struct ipu6_bus_device *adev = av->isys->adev;
+	struct ipu6_bus_device *adev = stream->asd->isys->adev;
 	const struct ipu6_fw_isys_ops *fw_ops = adev->auxdrv_data->fw_ops;
-	struct ipu6_isys_stream *stream = av->stream;
 	struct device *dev = &adev->auxdev.dev;
+	struct ipu6_isys_csi2 *csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
 	int ret, tout;
 
 	reinit_completion(&stream->stream_close_completion);
 
-	ret = fw_ops->stream_close(av->isys, stream->stream_handle);
+	ret = fw_ops->stream_close(stream->isys, stream->stream_handle);
 	if (ret < 0) {
 		dev_err(dev, "can't close stream (%d)\n", ret);
 		return;
@@ -607,156 +653,126 @@ void ipu6_isys_close_streaming_firmware(struct ipu6_isys_video *av)
 	else
 		dev_dbg(dev, "close stream: complete\n");
 
-	put_stream_opened(av);
+	put_stream_opened(stream->isys);
+
+	scoped_guard(spinlock_irqsave, &stream->isys->power_lock) {
+		stream->isys->streams_by_handle[stream->stream_handle] = NULL;
+		csi2->streams_by_vc[stream->vc] = NULL;
+	}
 }
 
-int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
-				   struct media_entity *source_entity)
+struct ipu6_isys_stream *
+ipu6_isys_find_stream_firmware(struct ipu6_isys_csi2 *csi2, u8 vc)
 {
-	struct ipu6_isys_stream *stream = av->stream;
-	struct ipu6_isys_csi2 *csi2;
+	struct ipu6_isys_stream *stream;
 
-	atomic_set(&stream->sequence, 0);
-	atomic_set(&stream->buf_id, 0);
+	list_for_each_entry(stream, &csi2->streams, csi2_entry)
+		if (stream->vc == vc)
+			return stream;
 
-	stream->seq_index = 0;
-	memset(stream->seq, 0, sizeof(stream->seq));
+	return NULL;
+}
 
-	if (WARN_ON(!list_empty(&stream->queues)))
-		return -EINVAL;
+void ipu6_isys_free_stream_firmware(struct ipu6_isys_stream *stream)
+{
+	struct ipu6_isys_csi2 *csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
+	struct ipu6_isys_queue *aq, *aq_safe;
 
-	stream->stream_source = stream->asd->source;
-	csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
-	csi2->receiver_errors = 0;
+	list_for_each_entry_safe(aq, aq_safe, &stream->queues, node) {
+		struct ipu6_isys_video *av =
+			container_of_const(aq, struct ipu6_isys_video, aq);
 
-	dev_dbg(&av->isys->adev->auxdev.dev,
-		"prepare stream: external entity %s\n",
-		source_entity->name);
+		list_del(&aq->node);
+		av->stream = NULL;
+	}
 
-	return 0;
+	list_del(&stream->csi2_entry);
+	ida_free(&csi2->isys->streams, stream->stream_handle);
+	kfree(stream);
 }
 
-void ipu6_isys_put_stream(struct ipu6_isys_stream *stream)
+struct ipu6_isys_stream *
+ipu6_isys_alloc_stream_firmware(struct ipu6_isys_csi2 *csi2,
+				struct v4l2_subdev_state *csi2_state,
+				struct v4l2_mbus_frame_desc *desc,
+				u8 vc)
 {
-	struct device *dev;
-	unsigned int i;
-	unsigned long flags;
-
-	if (!stream) {
-		pr_err("ipu6-isys: no available stream\n");
-		return;
-	}
-
-	dev = &stream->isys->adev->auxdev.dev;
+	struct device *dev = &csi2->isys->adev->auxdev.dev;
+	struct ipu6_isys_stream *stream;
+	struct v4l2_subdev_route *route;
+	int ret;
 
-	spin_lock_irqsave(&stream->isys->streams_lock, flags);
-	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
-		if (&stream->isys->streams[i] == stream) {
-			if (stream->isys->streams_ref_count[i] > 0)
-				stream->isys->streams_ref_count[i]--;
-			else
-				dev_warn(dev, "invalid stream %d\n", i);
+	stream = kzalloc_obj(*stream);
+	if (!stream)
+		return ERR_PTR(-ENOMEM);
 
-			break;
-		}
+	ret = ida_alloc_max(&csi2->isys->streams, IPU6_ISYS_MAX_STREAMS - 1,
+			    GFP_KERNEL);
+	if (ret < 0)
+		goto err_free_stream;
+
+	stream->stream_handle = ret;
+	mutex_init(&stream->mutex);
+	init_completion(&stream->stream_open_completion);
+	init_completion(&stream->stream_close_completion);
+	init_completion(&stream->stream_start_completion);
+	init_completion(&stream->stream_stop_completion);
+	INIT_LIST_HEAD(&stream->queues);
+	stream->isys = csi2->asd.isys;
+	stream->asd = &csi2->asd;
+	stream->vc = vc;
+
+	scoped_guard(spinlock_irqsave, &stream->isys->power_lock) {
+		stream->isys->streams_by_handle[stream->stream_handle] =
+			stream;
+		csi2->streams_by_vc[stream->vc] = stream;
 	}
-	spin_unlock_irqrestore(&stream->isys->streams_lock, flags);
-}
 
-static struct ipu6_isys_stream *
-ipu6_isys_get_stream(struct ipu6_isys_video *av, struct ipu6_isys_subdev *asd)
-{
-	struct ipu6_isys_stream *stream = NULL;
-	struct ipu6_isys *isys = av->isys;
-	unsigned long flags;
-	unsigned int i;
-	u8 vc = av->vc;
+	list_add(&stream->csi2_entry, &csi2->streams);
 
-	if (!isys)
-		return NULL;
+	for_each_active_route(&csi2_state->routing, route) {
+		struct media_pad *vdev_pad =
+			media_pad_remote_pad_first(&csi2->asd.pad[route->source_pad]);
+		struct v4l2_mbus_frame_desc_entry *entry = NULL;
 
-	spin_lock_irqsave(&isys->streams_lock, flags);
-	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
-		if (isys->streams_ref_count[i] && isys->streams[i].vc == vc &&
-		    isys->streams[i].asd == asd) {
-			isys->streams_ref_count[i]++;
-			stream = &isys->streams[i];
+		for (unsigned int i = 0; i < desc->num_entries; i++) {
+			if (desc->entry[i].stream != route->sink_stream)
+				continue;
+
+			entry = &desc->entry[i];
 			break;
 		}
-	}
 
-	if (!stream) {
-		for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
-			if (!isys->streams_ref_count[i]) {
-				isys->streams_ref_count[i]++;
-				stream = &isys->streams[i];
-				stream->vc = vc;
-				stream->asd = asd;
-				break;
-			}
+		if (!entry) {
+			dev_dbg(dev, "cannot find stream %u in frame desc\n",
+				route->sink_stream);
+			ret = -EINVAL;
+			goto err_ida_free;
 		}
-	}
-	spin_unlock_irqrestore(&isys->streams_lock, flags);
-
-	return stream;
-}
 
-struct ipu6_isys_stream *
-ipu6_isys_query_stream_by_handle(struct ipu6_isys *isys, u8 stream_handle)
-{
-	unsigned long flags;
-	struct ipu6_isys_stream *stream = NULL;
+		if (entry->bus.csi2.vc != vc)
+			continue;
 
-	if (!isys)
-		return NULL;
+		struct ipu6_isys_video *av =
+			container_of_const(vdev_pad, struct ipu6_isys_video,
+					   pad);
 
-	if (stream_handle >= IPU6_ISYS_MAX_STREAMS) {
-		dev_err(&isys->adev->auxdev.dev,
-			"stream_handle %d is invalid\n", stream_handle);
-		return NULL;
-	}
+		list_add(&av->aq.node, &stream->queues);
 
-	spin_lock_irqsave(&isys->streams_lock, flags);
-	if (isys->streams_ref_count[stream_handle] > 0) {
-		isys->streams_ref_count[stream_handle]++;
-		stream = &isys->streams[stream_handle];
+		stream->nr_output_pins++;
+		av->stream = stream;
 	}
-	spin_unlock_irqrestore(&isys->streams_lock, flags);
 
 	return stream;
-}
 
-struct ipu6_isys_stream *
-ipu6_isys_query_stream_by_source(struct ipu6_isys *isys, int source, u8 vc)
-{
-	struct ipu6_isys_stream *stream = NULL;
-	unsigned long flags;
-	unsigned int i;
+err_ida_free:
+	list_del(&stream->csi2_entry);
+	ida_free(&csi2->isys->streams, stream->stream_handle);
 
-	if (!isys)
-		return NULL;
+err_free_stream:
+	kfree(stream);
 
-	if (source < 0) {
-		dev_err(&isys->adev->auxdev.dev,
-			"query stream with invalid port number\n");
-		return NULL;
-	}
-
-	spin_lock_irqsave(&isys->streams_lock, flags);
-	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
-		if (!isys->streams_ref_count[i])
-			continue;
-
-		if (isys->streams[i].stream_source == source &&
-		    isys->streams[i].vc == vc) {
-			stream = &isys->streams[i];
-			isys->streams_ref_count[i]++;
-			break;
-		}
-	}
-	spin_unlock_irqrestore(&isys->streams_lock, flags);
-
-	return stream;
+	return ERR_PTR(ret);
 }
 
 int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state)
@@ -899,72 +915,6 @@ void ipu6_isys_fw_close(struct ipu6_isys *isys)
 		pm_runtime_put(&isys->adev->auxdev.dev);
 }
 
-int ipu6_isys_setup_video(struct ipu6_isys_video *av,
-			  struct media_pad *remote_pad,
-			  struct media_pad *source_pad)
-{
-	const struct ipu6_isys_pixelformat *pfmt =
-		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
-	struct device *dev = &av->isys->adev->auxdev.dev;
-	struct v4l2_mbus_frame_desc_entry entry;
-	struct v4l2_subdev_route *route = NULL;
-	struct v4l2_subdev_route *r;
-	struct v4l2_subdev_state *state;
-	struct v4l2_subdev *remote_sd =
-		media_entity_to_v4l2_subdev(remote_pad->entity);
-	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(remote_sd);
-	struct media_pipeline *pipeline;
-	int ret = -EINVAL;
-
-	/* Find the root */
-	state = v4l2_subdev_lock_and_get_active_state(remote_sd);
-	for_each_active_route(&state->routing, r)
-		if (r->source_pad == remote_pad->index)
-			route = r;
-
-	if (!route) {
-		v4l2_subdev_unlock_state(state);
-		dev_dbg(dev, "Failed to find route\n");
-		return -ENODEV;
-	}
-	av->source_stream = route->sink_stream;
-	v4l2_subdev_unlock_state(state);
-
-	ret = ipu6_isys_csi2_get_remote_desc(av->source_stream,
-					     to_ipu6_isys_csi2(asd),
-					     source_pad->entity, &entry);
-	if (ret == -ENOIOCTLCMD) {
-		av->vc = 0;
-		av->dt = ipu6_isys_mbus_code_to_mipi(pfmt->code);
-	} else if (!ret) {
-		dev_dbg(dev, "Framedesc: stream %u, len %u, vc %u, dt %#x\n",
-			entry.stream, entry.length, entry.bus.csi2.vc,
-			entry.bus.csi2.dt);
-
-		av->vc = entry.bus.csi2.vc;
-		av->dt = entry.bus.csi2.dt;
-	} else {
-		dev_err(dev, "failed to get remote frame desc\n");
-		return ret;
-	}
-
-	pipeline = video_device_pipeline(&av->vdev);
-	ret = video_device_pipeline_alloc_start(&av->vdev);
-	if (ret < 0) {
-		dev_dbg(dev, "media pipeline start failed\n");
-		return ret;
-	}
-
-	av->stream = ipu6_isys_get_stream(av, asd);
-	if (!av->stream) {
-		video_device_pipeline_stop(&av->vdev);
-		dev_err(dev, "no available stream for firmware\n");
-		return -EINVAL;
-	}
-
-	return !pipeline;
-}
-
 /*
  * Do everything that's needed to initialise things related to video
  * buffer queue, video node, and the related media entity. The caller
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index f5b773e16d62..2821b9b1b943 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -22,6 +22,7 @@ struct file;
 struct ipu6_isys;
 struct ipu6_isys_csi2;
 struct ipu6_isys_subdev;
+struct v4l2_mbus_frame_desc;
 
 struct ipu6_isys_pixelformat {
 	u32 pixelformat;
@@ -47,12 +48,12 @@ struct ipu6_isys_stream {
 	atomic_t buf_id;
 	unsigned int seq_index;
 	struct sequence_info seq[IPU6_ISYS_MAX_PARALLEL_SOF];
-	int stream_source;
 	int stream_handle;
 	unsigned int nr_output_pins;
 	struct ipu6_isys_subdev *asd;
-
 	struct list_head queues;
+	struct list_head csi2_entry;
+
 	struct completion stream_open_completion;
 	struct completion stream_close_completion;
 	struct completion stream_start_completion;
@@ -78,8 +79,6 @@ struct ipu6_isys_video {
 	struct ipu6_isys_stream *stream;
 	unsigned int streaming;
 	u32 source_stream;
-	u8 vc;
-	u8 dt;
 };
 
 #define ipu6_isys_queue_to_video(__aq) \
@@ -90,12 +89,26 @@ extern const struct ipu6_isys_pixelformat ipu6_isys_pfmts_packed[];
 
 const struct ipu6_isys_pixelformat *
 ipu6_isys_get_isys_format(u32 pixelformat, u32 code);
-int ipu6_isys_start_stream_firmware(struct ipu6_isys_video *av,
-				    struct ipu6_isys_buffer_list *bl);
-void ipu6_isys_stop_streaming_firmware(struct ipu6_isys_video *av);
-void ipu6_isys_close_streaming_firmware(struct ipu6_isys_video *av);
-int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
-				   struct media_entity *source_entity);
+int ipu6_isys_fw_pins_prepare(struct ipu6_isys_stream *stream,
+			      struct v4l2_mbus_frame_desc *desc,
+			      int (*fw_pin_cfg)(struct ipu6_isys_video *av,
+						struct ipu6_isys_stream *stream,
+						struct media_pad *src_pad,
+						struct v4l2_mbus_frame_desc_entry *entry,
+						void *__cfg), void *stream_cfg);
+int ipu6_isys_start_stream_firmware(struct ipu6_isys_stream *stream,
+				    struct ipu6_isys_buffer_list *bl,
+				    struct v4l2_mbus_frame_desc *desc);
+void ipu6_isys_stop_stream_firmware(struct ipu6_isys_stream *stream);
+void ipu6_isys_close_stream_firmware(struct ipu6_isys_stream *stream);
+struct ipu6_isys_stream *
+ipu6_isys_find_stream_firmware(struct ipu6_isys_csi2 *csi2, u8 vc);
+void ipu6_isys_free_stream_firmware(struct ipu6_isys_stream *stream);
+struct ipu6_isys_stream *
+ipu6_isys_alloc_stream_firmware(struct ipu6_isys_csi2 *csi2,
+				struct v4l2_subdev_state *state,
+				struct v4l2_mbus_frame_desc *desc,
+				u8 vc);
 int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state);
 int ipu6_isys_fw_open(struct ipu6_isys *isys);
 void ipu6_isys_fw_close(struct ipu6_isys *isys);
@@ -104,11 +117,6 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 			  struct media_pad *source_pad);
 int ipu6_isys_video_init(struct ipu6_isys_video *av);
 void ipu6_isys_video_cleanup(struct ipu6_isys_video *av);
-void ipu6_isys_put_stream(struct ipu6_isys_stream *stream);
-struct ipu6_isys_stream *
-ipu6_isys_query_stream_by_handle(struct ipu6_isys *isys, u8 stream_handle);
-struct ipu6_isys_stream *
-ipu6_isys_query_stream_by_source(struct ipu6_isys *isys, int source, u8 vc);
 
 u32 ipu6_isys_get_format(struct ipu6_isys_video *av);
 u32 ipu6_isys_get_data_size(struct ipu6_isys_video *av);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 0933fb617d3b..d7a1f89ab56c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -166,23 +166,6 @@ isys_complete_ext_device_registration(struct ipu6_isys *isys,
 	return ret;
 }
 
-static void isys_stream_init(struct ipu6_isys *isys)
-{
-	u32 i;
-
-	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
-		mutex_init(&isys->streams[i].mutex);
-		init_completion(&isys->streams[i].stream_open_completion);
-		init_completion(&isys->streams[i].stream_close_completion);
-		init_completion(&isys->streams[i].stream_start_completion);
-		init_completion(&isys->streams[i].stream_stop_completion);
-		INIT_LIST_HEAD(&isys->streams[i].queues);
-		isys->streams[i].isys = isys;
-		isys->streams[i].stream_handle = i;
-		isys->streams[i].vc = INVALID_VC_ID;
-	}
-}
-
 static void isys_csi2_unregister_subdevices(struct ipu6_isys *isys)
 {
 	const struct ipu6_isys_internal_csi2_pdata *csi2 =
@@ -965,7 +948,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	struct ipu6_bus_device *adev = auxdev_to_adev(auxdev);
 	struct ipu6_device *isp = adev->isp;
 	struct ipu6_isys *isys;
-	unsigned int i;
 	int ret;
 
 	if (!isp->bus_ready_to_probe)
@@ -1006,7 +988,7 @@ static int isys_probe(struct auxiliary_device *auxdev,
 
 	dev_set_drvdata(&auxdev->dev, isys);
 
-	isys_stream_init(isys);
+	ida_init(&isys->streams);
 
 	cpu_latency_qos_add_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
 
@@ -1034,9 +1016,6 @@ static int isys_probe(struct auxiliary_device *auxdev,
 out_remove_pkg_dir_shared_buffer:
 	cpu_latency_qos_remove_request(&isys->pm_qos);
 
-	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++)
-		mutex_destroy(&isys->streams[i].mutex);
-
 	mutex_destroy(&isys->mutex);
 	mutex_destroy(&isys->stream_mutex);
 
@@ -1046,7 +1025,8 @@ static int isys_probe(struct auxiliary_device *auxdev,
 static void isys_remove(struct auxiliary_device *auxdev)
 {
 	struct ipu6_isys *isys = dev_get_drvdata(&auxdev->dev);
-	unsigned int i;
+
+	ida_destroy(&isys->streams);
 
 	free_fw_msg_bufs(isys);
 
@@ -1055,9 +1035,6 @@ static void isys_remove(struct auxiliary_device *auxdev)
 
 	cpu_latency_qos_remove_request(&isys->pm_qos);
 
-	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++)
-		mutex_destroy(&isys->streams[i].mutex);
-
 	mutex_destroy(&isys->stream_mutex);
 	mutex_destroy(&isys->mutex);
 }
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index b9239791dd5e..8a618ded1ef9 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -4,6 +4,7 @@
 #ifndef IPU6_ISYS_H
 #define IPU6_ISYS_H
 
+#include <linux/idr.h>
 #include <linux/irqreturn.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -104,8 +105,7 @@ struct ipu6_isys {
 	u32 isr_csi2_bits;
 	u32 csi2_rx_ctrl_cached;
 	spinlock_t streams_lock;
-	struct ipu6_isys_stream streams[IPU6_ISYS_MAX_STREAMS];
-	int streams_ref_count[IPU6_ISYS_MAX_STREAMS];
+	struct ipu6_isys_stream *streams_by_handle[IPU6_ISYS_MAX_STREAMS];
 	void *fwctx;
 	u32 phy_termcal_val;
 	u32 phy_rext_cal;
@@ -134,6 +134,7 @@ struct ipu6_isys {
 	struct list_head framebuflist;
 	struct list_head framebuflist_fw;
 	struct v4l2_async_notifier notifier;
+	struct ida streams;
 };
 
 struct isys_fw_msgs {
@@ -161,7 +162,8 @@ struct ipu6_fw_isys_ops {
 			dma_addr_t dma_mapped_buf,
 			size_t size, u16 send_type);
 	void (*cleanup)(struct ipu6_isys *isys);
-	int (*prepare_stream_cfg)(struct ipu6_isys_video *av,
+	int (*prepare_stream_cfg)(struct ipu6_isys_stream *stream,
+				  struct v4l2_mbus_frame_desc *desc,
 				  struct isys_fw_msgs *msg);
 	void (*prepare_buf_set)(struct isys_fw_msgs *msg,
 				struct ipu6_isys_stream *stream,
diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
index e75ae5f5f939..1cfd7b8ee2b3 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
@@ -157,16 +157,18 @@ static void ipu7_fw_isys_put_resp(struct ipu6_isys *isys)
 }
 
 static int ipu7_isys_fw_pin_cfg(struct ipu6_isys_video *av,
-				struct ipu7_fw_isys_stream_cfg *cfg)
+				struct ipu6_isys_stream *stream,
+				struct media_pad *src_pad,
+				struct v4l2_mbus_frame_desc_entry *entry,
+				void *__cfg)
 {
-	struct media_pad *src_pad = media_pad_remote_pad_first(&av->pad);
 	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(src_pad->entity);
 	struct v4l2_subdev_state *state = v4l2_subdev_get_locked_active_state(sd);
+	struct ipu7_fw_isys_stream_cfg *cfg = __cfg;
 	struct ipu7_fw_isys_input_pin *input_pin;
 	struct ipu7_fw_isys_output_pin *output_pin;
-	struct ipu6_isys_stream *stream = av->stream;
 	struct ipu6_isys_queue *aq = &av->aq;
-	struct v4l2_mbus_framefmt fmt;
+	struct v4l2_mbus_framefmt *fmt;
 	const struct ipu6_isys_pixelformat *pfmt =
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
 	int input_pins = cfg->nof_input_pins++;
@@ -174,12 +176,12 @@ static int ipu7_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 	u32 src_stream;
 
 	src_stream = __ipu6_isys_get_src_stream_by_src_pad(state, src_pad->index);
-	fmt = *v4l2_subdev_state_get_format(state, src_pad->index, src_stream);
+	fmt = v4l2_subdev_state_get_format(state, src_pad->index, src_stream);
 
 	input_pin = &cfg->input_pins[input_pins];
-	input_pin->input_res.width = fmt.width;
-	input_pin->input_res.height = fmt.height;
-	input_pin->dt = av->dt;
+	input_pin->input_res.width = fmt->width;
+	input_pin->input_res.height = fmt->height;
+	input_pin->dt = entry->bus.csi2.dt;
 	input_pin->disable_mipi_unpacking = 0;
 	if (pfmt->bpp == pfmt->bpp_packed && pfmt->bpp % BITS_PER_BYTE)
 		input_pin->disable_mipi_unpacking = 1;
@@ -193,7 +195,7 @@ static int ipu7_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 
 	output_pins = cfg->nof_output_pins++;
 	aq->fw_output = output_pins;
-	stream->output_pins_queue[output_pins] = aq;
+	av->stream->output_pins_queue[output_pins] = aq;
 
 	output_pin = &cfg->output_pins[output_pins];
 	memset(output_pin, 0, sizeof(*output_pin));
@@ -343,27 +345,24 @@ static void ipu7_fw_isys_dump_frame_buf_set(struct device *dev,
 	dev_dbg(dev, "---------------------------\n");
 }
 
-static int ipu7_fw_isys_prepare_stream_cfg(struct ipu6_isys_video *av,
+static int ipu7_fw_isys_prepare_stream_cfg(struct ipu6_isys_stream *stream,
+					   struct v4l2_mbus_frame_desc *desc,
 					   struct isys_fw_msgs *msg)
 {
 	struct ipu7_fw_isys_stream_cfg *cfg = &msg->ipu7.stream;
-	struct device *dev = &av->isys->adev->auxdev.dev;
-	struct ipu6_isys_stream *stream = av->stream;
-	struct ipu6_isys_queue *aq;
+	struct device *dev = &stream->isys->adev->auxdev.dev;
+	int ret;
 
 	memset(cfg, 0, sizeof(*cfg));
-	cfg->port_id = stream->stream_source;
+	cfg->port_id = stream->asd->source;
 	cfg->vc = stream->vc;
 	cfg->stream_msg_map = IPU7_INSYS_STREAM_ENABLE_MSG_SEND_RESP |
 			      IPU7_INSYS_STREAM_ENABLE_MSG_SEND_IRQ;
 
-	list_for_each_entry(aq, &stream->queues, node) {
-		struct ipu6_isys_video *__av = ipu6_isys_queue_to_video(aq);
-		int ret = ipu7_isys_fw_pin_cfg(__av, cfg);
-
-		if (ret < 0)
-			return ret;
-	}
+	ret = ipu6_isys_fw_pins_prepare(stream, desc, ipu7_isys_fw_pin_cfg,
+					cfg);
+	if (ret)
+		return ret;
 
 	stream->nr_output_pins = cfg->nof_output_pins;
 
@@ -600,7 +599,8 @@ static int ipu7_isys_isr_one(struct ipu6_bus_device *adev)
 		goto leave;
 	}
 
-	stream = ipu6_isys_query_stream_by_handle(isys, resp->stream_id);
+	stream = resp->stream_id < IPU6_ISYS_MAX_STREAMS ?
+		isys->streams_by_handle[resp->stream_id] : NULL;
 	if (!stream) {
 		dev_err(dev, "stream of stream_handle %u is unused\n",
 			resp->stream_id);
@@ -680,7 +680,6 @@ static int ipu7_isys_isr_one(struct ipu6_bus_device *adev)
 		break;
 	}
 
-	ipu6_isys_put_stream(stream);
 leave:
 	ipu7_fw_isys_put_resp(isys);
 
@@ -711,8 +710,7 @@ static void ipu7_isys_csi2_isr(struct ipu6_isys_csi2 *csi2)
 	}
 
 	for (vc = 0; vc < IPU7_NR_OF_CSI2_VC && (sync || fe); vc++) {
-		s = ipu6_isys_query_stream_by_source(csi2->isys,
-						     csi2->asd.source, vc);
+		s = csi2->streams_by_vc[vc];
 		if (!s)
 			continue;
 
-- 
2.47.3

