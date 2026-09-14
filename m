Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B47442FBE
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 20:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419242; cv=none; b=qjh8S2qWe7sTnEEmZj9jmDjKOg3qhDnT4zaEghUtfwkxPPa/2YikVpj/8WGMuEdcg9P8j2N5SAm4M4UaCtmbW1yUWRIIWSdshdxYdA8Pbc2XUKRQhLIjmjxq7jH/2j7l49nr36cRIB2QMdXp/fZLF3R2D7YkR4/j3cRqfBd7GmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419242; c=relaxed/simple;
	bh=4qah/FkQGw3xyuWIDAIFSWnoJXHFQsmU7t7OGOWopzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L98YwSq/kZAoTdIWnT8oxKFUQmMM4dLoU5trnlYtRxnz+zR3RtKh1NmAQWPIIN6C0mOiVcztlFEBXl2iHcFGhbk4jqVL/dLX1d3zavPfNHur6dra18r1DZrsKUf6iJTtsTy/ecov1TY74AZIC/0N//jwmMrA3QVV0IJBiIqkQ18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0vi0C97; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0vi0C97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789419241; x=1820955241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4qah/FkQGw3xyuWIDAIFSWnoJXHFQsmU7t7OGOWopzM=;
  b=E0vi0C97UrbDITGtU66UY4RTdyUbqod04IZS44jsqZoQVer1lTNymEAU
   Cy7fqdRlGz6pcBrjZDENklWGZSLSLE2GeHfEE/Lq7/oHP5HVHRjpHj9HI
   dAVshVuTlRyI/hJVPgXWQy5ri6UPiUGRoPwg19B/O71uFy3i+zLoFDHCA
   vMRFSJI/RWIgIlKE2Rha1uOz9LhrWD2wq2dq/hD9/LthL1pjfipFUh3T+
   AId/iP//+awKmaHmLcCpsBDt7LbItuFJxTskBd6Z/w3Pqw/qv3VN7Rxm4
   0eoF6H5BspXaGpBN4sHScPMMfCJP58y0EA9GFJhBymXjaaXI6foV8RLl8
   g==;
X-CSE-ConnectionGUID: S+AVMLIiQ66aL7Bi3vh27A==
X-CSE-MsgGUID: I4ssAp+oQtu1i4o54tLeDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89984117"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89984117"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:55 -0700
X-CSE-ConnectionGUID: oBbONQfFQoSkbicHmwbPxA==
X-CSE-MsgGUID: GUxDeSIwSYeJJCQfGxzxBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297760697"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.173])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:53 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 452AA121BB8;
	Mon, 14 Sep 2026 23:53:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x6Dgc-000000035Il-35WG;
	Mon, 14 Sep 2026 23:53:58 +0300
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
Subject: [PATCH 02/21] media: ipu6: Move streaming control to CSI-2 receiver driver
Date: Mon, 14 Sep 2026 23:53:39 +0300
Message-ID: <20260914205358.735307-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914205358.735307-1-sakari.ailus@linux.intel.com>
References: <20260914205358.735307-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the streaming control out of the video nodes to the CSI-2 receiver
driver which is better positioned to consider stream configuration and so
when to actually start and stop streaming.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   |  2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 54 +++++++++++++++----
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 42 ++++++---------
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |  2 +
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 22 +++++---
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |  2 +
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 48 +++++------------
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  7 ++-
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c   |  2 +-
 9 files changed, 99 insertions(+), 82 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
index 3cad7d8f9ca9..9fc42c591dc3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -774,7 +774,7 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 	int output_pins;
 	u32 src_stream;
 
-	src_stream = ipu6_isys_get_src_stream_by_src_pad(sd, src_pad->index);
+	src_stream = __ipu6_isys_get_src_stream_by_src_pad(state, src_pad->index);
 	fmt = *v4l2_subdev_state_get_format(state, src_pad->index, src_stream);
 	v4l2_crop = *v4l2_subdev_state_get_crop(state, src_pad->index, src_stream);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index c0e5afd76f6a..0fd4171b50ac 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -23,6 +23,7 @@
 #include "ipu6-isys.h"
 #include "ipu6-isys-csi2.h"
 #include "ipu6-isys-subdev.h"
+#include "ipu6-isys-video.h"
 #include "ipu6-platform-isys-csi2-reg.h"
 #include "ipu7-isys-csi2-regs.h"
 
@@ -442,10 +443,26 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
 	struct ipu6_device *isp = asd->isys->adev->isp;
 	struct v4l2_subdev *remote_sd;
-	struct media_pad *remote_pad;
+	struct media_pad *remote_pad,
+		*vdev_pad = media_pad_remote_pad_unique(&sd->entity.pads[pad]);
+	struct ipu6_isys_video *av =
+		container_of_const(vdev_pad, struct ipu6_isys_video, pad);
+	struct ipu6_isys_buffer_list bl;
 	u64 sink_streams;
 	int ret;
 
+	ret = ipu6_isys_buffer_list_get(av->stream, &bl);
+	if (ret < 0) {
+		dev_warn(sd->dev, "no buffer available, DRIVER BUG?\n");
+		return ret;
+	}
+
+	ret = ipu6_isys_start_stream_firmware(av, &bl);
+	if (ret) {
+		dev_err(sd->dev, "start stream of firmware failed\n");
+		goto err_return_buffers;
+	}
+
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
@@ -456,30 +473,43 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	ret = IS_IPU7(isp) ? ipu7_isys_csi2_stream_enable(csi2) :
 			     ipu6_isys_csi2_stream_enable(csi2);
 	if (ret)
-		return ret;
+		goto err_stop_stream_firmware;
 
 	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index,
 					 sink_streams);
-	if (ret) {
-		if IS_IPU7(isp)
-			ipu7_isys_csi2_stream_disable(csi2);
-		else
-			ipu6_isys_csi2_stream_disable(csi2);
-		return ret;
-	}
+	if (ret)
+		goto err_stop_stream_csi2;
 
 	return 0;
+
+err_stop_stream_csi2:
+	if (IS_IPU7(isp))
+		ipu7_isys_csi2_stream_disable(csi2);
+	else
+		ipu6_isys_csi2_stream_disable(csi2);
+
+err_stop_stream_firmware:
+	ipu6_isys_stop_streaming_firmware(av);
+	ipu6_isys_close_streaming_firmware(av);
+
+err_return_buffers:
+	ipu6_isys_buffer_list_queue(&bl, IPU6_ISYS_BUFFER_LIST_FL_INCOMING, 0);
+
+	return ret;
 }
 
 static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 					  struct v4l2_subdev_state *state,
 					  u32 pad, u64 streams_mask)
 {
+	struct media_pad *remote_pad,
+		*vdev_pad = media_pad_remote_pad_unique(&sd->entity.pads[pad]);
+	struct ipu6_isys_video *av =
+		container_of_const(vdev_pad, struct ipu6_isys_video, pad);
 	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
 	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
 	struct ipu6_device *isp = asd->isys->adev->isp;
 	struct v4l2_subdev *remote_sd;
-	struct media_pad *remote_pad;
 	u64 sink_streams;
 
 	sink_streams =
@@ -489,6 +519,8 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
+	ipu6_isys_stop_streaming_firmware(av);
+
 	if IS_IPU7(isp)
 		ipu7_isys_csi2_stream_disable(csi2);
 	else
@@ -496,6 +528,8 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 
 	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, sink_streams);
 
+	ipu6_isys_close_streaming_firmware(av);
+
 	return 0;
 }
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 4d862f14c765..91043b531821 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -21,6 +21,7 @@
 #include "ipu6-dma.h"
 #include "ipu6-fw-isys.h"
 #include "ipu6-isys.h"
+#include "ipu6-isys-queue.h"
 #include "ipu6-isys-video.h"
 
 static int ipu6_isys_buf_init(struct vb2_buffer *vb)
@@ -191,8 +192,8 @@ static void flush_firmware_streamon_fail(struct ipu6_isys_stream *stream)
  * that contains one entry from each video buffer queue. If a buffer can't be
  * obtained from every queue, the buffers are returned back to the queue.
  */
-static int buffer_list_get(struct ipu6_isys_stream *stream,
-			   struct ipu6_isys_buffer_list *bl)
+int ipu6_isys_buffer_list_get(struct ipu6_isys_stream *stream,
+			      struct ipu6_isys_buffer_list *bl)
 {
 	struct device *dev = &stream->isys->adev->auxdev.dev;
 	struct ipu6_isys_queue *aq;
@@ -234,28 +235,25 @@ static int buffer_list_get(struct ipu6_isys_stream *stream,
 }
 
 /* Start streaming for real. The buffer list must be available. */
-static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
-				  struct ipu6_isys_buffer_list *bl)
+static int ipu6_isys_stream_start(struct ipu6_isys_video *av)
 {
 	struct ipu6_bus_device *adev = av->isys->adev;
 	const struct ipu6_fw_isys_ops *fw_ops = adev->auxdrv_data->fw_ops;
 	struct ipu6_isys_stream *stream = av->stream;
 	struct device *dev = &adev->auxdev.dev;
-	struct ipu6_isys_buffer_list __bl;
+	struct ipu6_isys_buffer_list bl;
 	struct isys_fw_msgs *msg;
 	int ret;
 
 	guard(mutex)(&stream->isys->stream_mutex);
-	ret = ipu6_isys_video_set_streaming(av, 1, bl);
+	ret = ipu6_isys_video_set_streaming(av, 1);
 	if (ret)
-		goto out_requeue;
+		return ret;
 
 	stream->streaming = 1;
 
-	bl = &__bl;
-
 	do {
-		ret = buffer_list_get(stream, bl);
+		ret = ipu6_isys_buffer_list_get(stream, &bl);
 		if (ret < 0)
 			return 0;
 
@@ -263,10 +261,10 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 		if (WARN_ON(!msg))
 			goto out_requeue;
 
-		fw_ops->prepare_buf_set(msg, stream, bl);
+		fw_ops->prepare_buf_set(msg, stream, &bl);
 		fw_ops->dump_frame_buf_set(dev, msg, stream->nr_output_pins);
-		ipu6_isys_buffer_list_queue(bl, IPU6_ISYS_BUFFER_LIST_FL_ACTIVE,
-					    0);
+		ipu6_isys_buffer_list_queue(&bl,
+					    IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
 		ret = fw_ops->stream_capture(stream->isys,
 					     stream->stream_handle, msg);
 		if (WARN_ON(ret))
@@ -277,8 +275,8 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 	ipu6_put_fw_msg_buf(stream->isys, msg);
 
 out_requeue:
-	if (bl && bl->nbufs)
-		ipu6_isys_buffer_list_queue(bl,
+	if (bl.nbufs)
+		ipu6_isys_buffer_list_queue(&bl,
 					    IPU6_ISYS_BUFFER_LIST_FL_INCOMING,
 					    VB2_BUF_STATE_QUEUED);
 	flush_firmware_streamon_fail(stream);
@@ -331,7 +329,7 @@ static void buf_queue(struct vb2_buffer *vb)
 	 * (above). Let's see whether all queues in the pipeline would
 	 * have a buffer.
 	 */
-	ret = buffer_list_get(stream, &bl);
+	ret = ipu6_isys_buffer_list_get(stream, &bl);
 	if (ret < 0) {
 		dev_dbg(dev, "No buffers available\n");
 		goto out;
@@ -480,7 +478,6 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	const struct ipu6_isys_pixelformat *pfmt =
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
-	struct ipu6_isys_buffer_list __bl, *bl = NULL;
 	struct ipu6_isys_stream *stream;
 	struct media_pad *source_pad, *remote_pad;
 	int nr_queues, ret;
@@ -541,14 +538,7 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	if (stream->nr_streaming != stream->nr_queues)
 		goto out;
 
-	bl = &__bl;
-	ret = buffer_list_get(stream, bl);
-	if (ret < 0) {
-		dev_warn(dev, "no buffer available, DRIVER BUG?\n");
-		goto out;
-	}
-
-	ret = ipu6_isys_stream_start(av, bl);
+	ret = ipu6_isys_stream_start(av);
 	if (ret)
 		goto out_stream_start;
 
@@ -587,7 +577,7 @@ static void stop_streaming(struct vb2_queue *q)
 
 	mutex_lock(&av->isys->stream_mutex);
 	if (stream->nr_streaming == stream->nr_queues && stream->streaming)
-		ipu6_isys_video_set_streaming(av, 0, NULL);
+		ipu6_isys_video_set_streaming(av, 0);
 	list_del(&aq->node);
 	mutex_unlock(&av->isys->stream_mutex);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
index 5df47be0c181..0e0886f59150 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
@@ -60,6 +60,8 @@ struct ipu6_isys_buffer_list {
 void ipu6_isys_buffer_list_queue(struct ipu6_isys_buffer_list *bl,
 				 unsigned long op_flags,
 				 enum vb2_buffer_state state);
+int ipu6_isys_buffer_list_get(struct ipu6_isys_stream *stream,
+			      struct ipu6_isys_buffer_list *bl);
 void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
 			       struct ipu6_fw_isys_resp_info_abi *info);
 int ipu6_isys_queue_init(struct ipu6_isys_queue *aq);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
index ab04b5b0ad08..60070842ee68 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -266,17 +266,13 @@ static int subdev_set_routing(struct v4l2_subdev *sd,
 	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
 }
 
-u32 ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad)
+u32 __ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev_state *state,
+					  u32 pad)
 {
-	struct v4l2_subdev_state *state;
 	struct v4l2_subdev_route *routes;
 	unsigned int i;
 	u32 source_stream = 0;
 
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-	if (!state)
-		return 0;
-
 	routes = state->routing.routes;
 	for (i = 0; i < state->routing.num_routes; i++) {
 		if (routes[i].source_pad == pad) {
@@ -285,6 +281,20 @@ u32 ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad)
 		}
 	}
 
+	return source_stream;
+}
+
+u32 ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad)
+{
+	struct v4l2_subdev_state *state;
+	u32 source_stream = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	if (!state)
+		return 0;
+
+	source_stream = __ipu6_isys_get_src_stream_by_src_pad(state, pad);
+
 	v4l2_subdev_unlock_state(state);
 
 	return source_stream;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
index d4f76d513dc6..b892d96992af 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
@@ -38,6 +38,8 @@ int ipu6_isys_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_mbus_code_enum
 				    *code);
+u32 __ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev_state *state,
+					  u32 pad);
 u32 ipu6_isys_get_src_stream_by_src_pad(struct v4l2_subdev *sd, u32 pad);
 int ipu6_isys_subdev_set_routing(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *state,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 9634b4f232bd..b63fb9673604 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -450,8 +450,8 @@ static void put_stream_opened(struct ipu6_isys_video *av)
 	spin_unlock_irqrestore(&av->isys->streams_lock, flags);
 }
 
-static int start_stream_firmware(struct ipu6_isys_video *av,
-				 struct ipu6_isys_buffer_list *bl)
+int ipu6_isys_start_stream_firmware(struct ipu6_isys_video *av,
+				    struct ipu6_isys_buffer_list *bl)
 {
 	struct ipu6_bus_device *adev = av->isys->adev;
 	const struct ipu6_fw_isys_ops *fw_ops = adev->auxdrv_data->fw_ops;
@@ -499,23 +499,18 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 	}
 	dev_dbg(dev, "start stream: open complete\n");
 
-	if (bl) {
-		msg = ipu6_get_fw_msg_buf(stream);
-		if (!msg) {
-			ret = -ENOMEM;
-			goto out_put_stream_opened;
-		}
-
-		fw_ops->prepare_buf_set(msg, stream, bl);
-		ipu6_isys_buffer_list_queue(bl,
-					    IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
+	msg = ipu6_get_fw_msg_buf(stream);
+	if (!msg) {
+		ret = -ENOMEM;
+		goto out_put_stream_opened;
 	}
+	fw_ops->prepare_buf_set(msg, stream, bl);
+	ipu6_isys_buffer_list_queue(bl, IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
 
 	reinit_completion(&stream->stream_start_completion);
 
 	ret = fw_ops->stream_start(av->isys, stream->stream_handle, msg,
 				   capture);
-
 	if (ret < 0) {
 		dev_err(dev, "can't start streaming (%d)\n", ret);
 		goto out_stream_close;
@@ -561,7 +556,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 	return ret;
 }
 
-static void stop_streaming_firmware(struct ipu6_isys_video *av)
+void ipu6_isys_stop_streaming_firmware(struct ipu6_isys_video *av)
 {
 	struct ipu6_bus_device *adev = av->isys->adev;
 	const struct ipu6_fw_isys_ops *fw_ops = adev->auxdrv_data->fw_ops;
@@ -587,7 +582,7 @@ static void stop_streaming_firmware(struct ipu6_isys_video *av)
 		dev_dbg(dev, "stop stream: complete\n");
 }
 
-static void close_streaming_firmware(struct ipu6_isys_video *av)
+void ipu6_isys_close_streaming_firmware(struct ipu6_isys_video *av)
 {
 	struct ipu6_bus_device *adev = av->isys->adev;
 	const struct ipu6_fw_isys_ops *fw_ops = adev->auxdrv_data->fw_ops;
@@ -889,8 +884,7 @@ static u64 get_stream_mask_by_pipeline(struct ipu6_isys_video *__av)
 	return stream_mask;
 }
 
-int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
-				  struct ipu6_isys_buffer_list *bl)
+int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state)
 {
 	struct v4l2_subdev_krouting *routing;
 	struct ipu6_isys_stream *stream = av->stream;
@@ -920,8 +914,6 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 
 	stream_mask = get_stream_mask_by_pipeline(av);
 	if (!state) {
-		stop_streaming_firmware(av);
-
 		/* stop sub-device which connects with video */
 		dev_dbg(dev, "stream off entity %s pad:%d mask:0x%llx\n",
 			sd->name, r_pad->index, stream_mask);
@@ -930,34 +922,18 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 		if (ret)
 			dev_err(dev, "stream off %s failed with %d\n", sd->name,
 				ret);
-
-		close_streaming_firmware(av);
 	} else {
-		ret = start_stream_firmware(av, bl);
-		if (ret) {
-			dev_err(dev, "start stream of firmware failed\n");
-			return ret;
-		}
-
 		/* start sub-device which connects with video */
 		dev_dbg(dev, "stream on %s pad %d mask 0x%llx\n", sd->name,
 			r_pad->index, stream_mask);
 		ret = v4l2_subdev_enable_streams(sd, r_pad->index, stream_mask);
-		if (ret) {
+		if (ret)
 			dev_err(dev, "stream on %s failed with %d\n", sd->name,
 				ret);
-			goto out_media_entity_stop_streaming_firmware;
-		}
 	}
 
 	av->streaming = state;
 
-	return 0;
-
-out_media_entity_stop_streaming_firmware:
-	stop_streaming_firmware(av);
-	close_streaming_firmware(av);
-
 	return ret;
 }
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index a7157646d563..5e0ce7979cfd 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -105,11 +105,14 @@ extern const struct ipu6_isys_pixelformat ipu6_isys_pfmts_packed[];
 
 const struct ipu6_isys_pixelformat *
 ipu6_isys_get_isys_format(u32 pixelformat, u32 code);
+int ipu6_isys_start_stream_firmware(struct ipu6_isys_video *av,
+				    struct ipu6_isys_buffer_list *bl);
+void ipu6_isys_stop_streaming_firmware(struct ipu6_isys_video *av);
+void ipu6_isys_close_streaming_firmware(struct ipu6_isys_video *av);
 int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
 				   struct media_entity *source_entity,
 				   int nr_queues);
-int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
-				  struct ipu6_isys_buffer_list *bl);
+int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state);
 int ipu6_isys_fw_open(struct ipu6_isys *isys);
 void ipu6_isys_fw_close(struct ipu6_isys *isys);
 int ipu6_isys_setup_video(struct ipu6_isys_video *av,
diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
index aee9227fd66c..e75ae5f5f939 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
@@ -173,7 +173,7 @@ static int ipu7_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 	int output_pins;
 	u32 src_stream;
 
-	src_stream = ipu6_isys_get_src_stream_by_src_pad(sd, src_pad->index);
+	src_stream = __ipu6_isys_get_src_stream_by_src_pad(state, src_pad->index);
 	fmt = *v4l2_subdev_state_get_format(state, src_pad->index, src_stream);
 
 	input_pin = &cfg->input_pins[input_pins];
-- 
2.47.3

