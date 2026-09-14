Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077E049EC78
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 20:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419248; cv=none; b=KylHRRPpOACvGw5iR0nGWQQ96AOgUtHaBgrCzSUTBkqyh/M8ORefEgI/h3ObJl48R/wK0gYlQbi7ji80VXv93SRkfBki+8gXNFNkHQ2em1VkKgHeQ0ZllDJxJefxH6RppNpXdxPykMLMnnB4OOqJDFci4VbtI2EN/EJ14mHnCow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419248; c=relaxed/simple;
	bh=KYt68SJYQqqp3aYQ3QPoW16Ib4HPuIuCpf0YCXoT7Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J2sdsOSG4llGCkokHoT26atyKZF3m6sSmaputu8VoDzSLl4sBIXbSbhjj8eVyjHB6HIkFwCJva811TymmrZNF9V5Dd3suKSBp+B9DYCxWMxXSO3CXSMxA1Fk/npGt/RC1op48w+xXGy7ObOjF7VLpgCZ6bBkVRDDhvuQQA90oTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPLagMEu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPLagMEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789419246; x=1820955246;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KYt68SJYQqqp3aYQ3QPoW16Ib4HPuIuCpf0YCXoT7Zc=;
  b=PPLagMEuNVfHThz+duipNC4LVX4I06wgaZxZORAWkUHKOgVF5dLfCc/5
   qZoa/ABJ8u8/1ZO3qdSME19MhfBdJIYUu6mcZCNLMXaFxqlryAdd76Wur
   Le3qSDtoURAXzycjUSzkR9qX02DJLyc7One3ew/XgQPAtD/+NxkcKpcWo
   EsYBzo0HQW8+UjG1Gdmx0SLFy4T+yy7M49cx15lIg9iX1bQtIAm5vdsKZ
   tvjVsDl3ZkjhkG9JBnq64hfKqkA37AT9zC3UCkqmO6OwoGq5XoAEcS28x
   ED5N5HHoX5pyVKWyl2ws3MNj+Hreh6oI0ibclsdFIt+6DntjZgb09XvPe
   Q==;
X-CSE-ConnectionGUID: NIJeKYF4TXK2kVOYkRSriQ==
X-CSE-MsgGUID: J0X6OuAORZ26VCBCSqgmcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89984127"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89984127"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:59 -0700
X-CSE-ConnectionGUID: o0yPEdMOTz2tVE+Qu9QvDg==
X-CSE-MsgGUID: QF7u0uVkQCyfBIfm0EARdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297760735"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.173])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:57 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 677C3121BC6;
	Mon, 14 Sep 2026 23:53:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x6Dgc-000000035Jh-3mwK;
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
Subject: [PATCH 14/21] media: ipu6: Rework watermark calculation
Date: Mon, 14 Sep 2026 23:53:51 +0300
Message-ID: <20260914205358.735307-15-sakari.ailus@linux.intel.com>
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

Move watermark calculation to ipu6-isys-csi2.c and do the whole thing
as streaming is about to start. There's no need to store all the
information so that it is bound to video nodes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 84 ++++++++++++++++-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |  4 +
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  5 -
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 94 -------------------
 .../media/pci/intel/ipu6/ipu6-isys-video.h    | 15 ---
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 42 ++++-----
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  2 +-
 7 files changed, 103 insertions(+), 143 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 3b02ca4b7e40..17a17f566f1a 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -231,6 +231,79 @@ void ipu6_isys_csi2_error(struct ipu6_isys_csi2 *csi2)
 	}
 }
 
+static void ipu6_isys_csi2_setup_watermark(struct ipu6_isys_csi2 *csi2,
+					   struct v4l2_subdev_state *csi2_state,
+					   struct v4l2_subdev *remote_sd)
+{
+	struct device *dev = &csi2->isys->adev->auxdev.dev;
+	struct v4l2_control hb = { .id = V4L2_CID_HBLANK, .value = 0 };
+	struct v4l2_subdev_route *route;
+	u32 max_stream_data_rate = 0, hblank = 0;
+	s64 link_freq;
+	int ret;
+
+	if (IS_IPU7(csi2->asd.isys->adev->isp))
+		return;
+
+	ret = v4l2_g_ctrl(remote_sd->ctrl_handler, &hb);
+	if (!ret)
+		hblank = max(0, hb.value);
+
+	link_freq = ipu6_isys_csi2_get_link_freq(csi2);
+	if (link_freq <= 0) {
+		csi2->watermark.force_iwake_disable = true;
+		dev_warn(dev, "unexpected link_freq %lld (source %s)\n",
+			 link_freq, remote_sd->entity.name);
+		ipu6_isys_update_watermark_setting(csi2->isys);
+		return;
+	}
+
+	for_each_active_route(&csi2_state->routing, route) {
+		struct v4l2_mbus_framefmt *fmt;
+
+		fmt = v4l2_subdev_state_get_format(csi2_state, CSI2_PAD_SINK,
+						   route->sink_stream);
+		if (WARN_ON(!fmt))
+			continue;
+
+		u32 bpp = ipu6_isys_mbus_code_to_bpp(fmt->code);
+		u64 pixel_rate = mul_u64_u32_div(link_freq, csi2->nlanes * 2,
+						 bpp);
+		u32 pixels_per_line = fmt->width + hblank;
+		u64 line_time_ns = div_u64(pixels_per_line * NSEC_PER_SEC,
+					   pixel_rate);
+		u32 bytes_per_line = fmt->width * bpp / 8;
+		u32 pages_per_line =
+			DIV_ROUND_UP(bytes_per_line,
+				     csi2->isys->pdata->ipdata->sram_gran_size);
+		u32 pb_bytes_per_line =
+			pages_per_line << csi2->isys->pdata->ipdata->sram_gran_shift;
+		u64 stream_data_rate =
+			div64_u64(pb_bytes_per_line * 1000, line_time_ns);
+
+		dev_dbg(dev, "stream %u:%u -> %u:%u data rate %lld\n",
+			route->sink_pad, route->sink_stream, route->source_pad,
+			route->source_stream, stream_data_rate);
+
+		max_stream_data_rate = max(max_stream_data_rate,
+					   stream_data_rate);
+	}
+
+	csi2->watermark.stream_data_rate = max_stream_data_rate;
+
+	ipu6_isys_update_watermark_setting(csi2->isys);
+}
+
+static void ipu6_isys_csi2_clear_watermark(struct ipu6_isys_csi2 *csi2)
+{
+	if (IS_IPU7(csi2->asd.isys->adev->isp))
+		return;
+
+	csi2->watermark.force_iwake_disable = false;
+	csi2->watermark.stream_data_rate = 0;
+	ipu6_isys_update_watermark_setting(csi2->isys);
+}
+
 static void ipu6_isys_csi2_stream_disable(struct ipu6_isys_csi2 *csi2)
 {
 	struct ipu6_isys *isys = csi2->isys;
@@ -558,6 +631,11 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	if (!ipu6_isys_csi2_streaming_change(asd, state, pad, &vc, true))
 		return 0;
 
+	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	ipu6_isys_csi2_setup_watermark(csi2, state, remote_sd);
+
 	ret = ipu6_isys_start_stream_firmware(av, &bl);
 	if (ret) {
 		dev_err(sd->dev, "start stream of firmware failed\n");
@@ -571,9 +649,6 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 			goto err_stop_stream_firmware;
 	}
 
-	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
-	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
-
 	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index,
 					 csi2->stream_ids);
 	if (ret)
@@ -594,6 +669,7 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	ipu6_isys_close_streaming_firmware(av);
 
 err_return_buffers:
+	ipu6_isys_csi2_clear_watermark(csi2);
 	csi2->stream_ids &= ~sink_streams;
 	list_del(&av->csi2_entry);
 	ipu6_isys_buffer_list_queue(&bl, IPU6_ISYS_BUFFER_LIST_FL_INCOMING, 0);
@@ -642,6 +718,8 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 
 	ipu6_isys_close_streaming_firmware(av);
 
+	ipu6_isys_csi2_clear_watermark(csi2);
+
 out_del_csi2_entry:
 	list_del(&av->csi2_entry);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
index 4d84899fde4c..49d01e938dc8 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -49,6 +49,10 @@ struct ipu6_isys_csi2 {
 	unsigned int port;
 	u32 legacy_irq_mask;
 	unsigned int phy_mode;
+	struct {
+		u32 stream_data_rate;
+		bool force_iwake_disable;
+	} watermark;
 	u32 streaming_vc;
 	u64 stream_ids;
 };
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 327ce16bdeca..725c3603d9e1 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -532,8 +532,6 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	}
 
 	list_add(&aq->node, &stream->queues);
-	ipu6_isys_configure_stream_watermark(av, source_pad->entity);
-	ipu6_isys_update_stream_watermark(av, true);
 
 	ret = ipu6_isys_stream_start(av);
 	if (ret)
@@ -544,7 +542,6 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	return 0;
 
 out_stream_start:
-	ipu6_isys_update_stream_watermark(av, false);
 	list_del(&aq->node);
 
 out_fw_close:
@@ -568,8 +565,6 @@ static void stop_streaming(struct vb2_queue *q)
 
 	mutex_lock(&stream->mutex);
 
-	ipu6_isys_update_stream_watermark(av, false);
-
 	mutex_lock(&av->isys->stream_mutex);
 	ipu6_isys_video_set_streaming(av, 0);
 	list_del(&aq->node);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 66f1a28a444e..4037a3c80dc6 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -636,100 +636,6 @@ int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
 	return 0;
 }
 
-void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
-					  struct media_entity *source)
-{
-	struct ipu6_isys *isys = av->isys;
-	struct ipu6_isys_csi2 *csi2 = NULL;
-	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
-	struct device *dev = &isys->adev->auxdev.dev;
-	struct v4l2_subdev *esd;
-	struct v4l2_control hb = { .id = V4L2_CID_HBLANK, .value = 0 };
-	s64 link_freq;
-	int ret;
-
-	esd = media_entity_to_v4l2_subdev(source);
-
-	av->watermark.width = ipu6_isys_get_frame_width(av);
-	av->watermark.height = ipu6_isys_get_frame_height(av);
-
-	ret = v4l2_g_ctrl(esd->ctrl_handler, &hb);
-	if (!ret && hb.value >= 0)
-		av->watermark.hblank = hb.value;
-	else
-		av->watermark.hblank = 0;
-
-	csi2 = ipu6_isys_subdev_to_csi2(av->stream->asd);
-	link_freq = ipu6_isys_csi2_get_link_freq(csi2);
-	if (link_freq <= 0) {
-		mutex_lock(&iwake_watermark->mutex);
-		iwake_watermark->force_iwake_disable = true;
-		mutex_unlock(&iwake_watermark->mutex);
-		dev_warn(dev, "unexpected link_freq from %s, disable iwake\n",
-			 source->name);
-		return;
-	}
-
-	struct v4l2_subdev_state *state;
-	struct v4l2_mbus_framefmt *format;
-	unsigned int bpp;
-
-	state = v4l2_subdev_lock_and_get_active_state(&csi2->asd.sd);
-	format = v4l2_subdev_state_get_format(state, 0, av->source_stream);
-	bpp = ipu6_isys_mbus_code_to_bpp(format->code);
-	v4l2_subdev_unlock_state(state);
-
-	av->watermark.pixel_rate = mul_u64_u32_div(link_freq, csi2->nlanes * 2,
-						   bpp);
-}
-
-static void calculate_stream_datarate(struct ipu6_isys_video *av)
-{
-	struct video_stream_watermark *watermark = &av->watermark;
-	const struct ipu6_isys_pixelformat *pfmt =
-		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
-	u32 pages_per_line, pb_bytes_per_line, pixels_per_line, bytes_per_line;
-	u64 line_time_ns, stream_data_rate;
-
-	pixels_per_line = watermark->width + watermark->hblank;
-	line_time_ns =  div_u64(pixels_per_line * NSEC_PER_SEC,
-				watermark->pixel_rate);
-	bytes_per_line = watermark->width * pfmt->bpp / 8;
-	pages_per_line = DIV_ROUND_UP(bytes_per_line,
-				      av->isys->pdata->ipdata->sram_gran_size);
-	pb_bytes_per_line =
-		pages_per_line << av->isys->pdata->ipdata->sram_gran_shift;
-	stream_data_rate = div64_u64(pb_bytes_per_line * 1000, line_time_ns);
-
-	watermark->stream_data_rate = stream_data_rate;
-}
-
-void ipu6_isys_update_stream_watermark(struct ipu6_isys_video *av, bool state)
-{
-	struct isys_iwake_watermark *iwake_watermark =
-		&av->isys->iwake_watermark;
-	struct ipu6_device *isp = av->isys->adev->isp;
-
-	if (IS_IPU7(isp) ||
-	    !av->watermark.pixel_rate)
-		return;
-
-	if (state) {
-		calculate_stream_datarate(av);
-		mutex_lock(&iwake_watermark->mutex);
-		list_add(&av->watermark.stream_node,
-			 &iwake_watermark->video_list);
-		mutex_unlock(&iwake_watermark->mutex);
-	} else {
-		av->watermark.stream_data_rate = 0;
-		mutex_lock(&iwake_watermark->mutex);
-		list_del(&av->watermark.stream_node);
-		mutex_unlock(&iwake_watermark->mutex);
-	}
-
-	update_watermark_setting(av->isys);
-}
-
 void ipu6_isys_put_stream(struct ipu6_isys_stream *stream)
 {
 	struct device *dev;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index a78aaad63303..f5b773e16d62 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -64,16 +64,6 @@ struct ipu6_isys_stream {
 	u8 vc;
 };
 
-struct video_stream_watermark {
-	u32 width;
-	u32 height;
-	u32 hblank;
-	u32 frame_rate;
-	u64 pixel_rate;
-	u64 stream_data_rate;
-	struct list_head stream_node;
-};
-
 struct ipu6_isys_video {
 	struct ipu6_isys_queue aq;
 	struct list_head csi2_entry;
@@ -87,7 +77,6 @@ struct ipu6_isys_video {
 	struct ipu6_isys_csi2 *csi2;
 	struct ipu6_isys_stream *stream;
 	unsigned int streaming;
-	struct video_stream_watermark watermark;
 	u32 source_stream;
 	u8 vc;
 	u8 dt;
@@ -121,10 +110,6 @@ ipu6_isys_query_stream_by_handle(struct ipu6_isys *isys, u8 stream_handle);
 struct ipu6_isys_stream *
 ipu6_isys_query_stream_by_source(struct ipu6_isys *isys, int source, u8 vc);
 
-void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
-					  struct media_entity *source);
-void ipu6_isys_update_stream_watermark(struct ipu6_isys_video *av, bool state);
-
 u32 ipu6_isys_get_format(struct ipu6_isys_video *av);
 u32 ipu6_isys_get_data_size(struct ipu6_isys_video *av);
 u32 ipu6_isys_get_bytes_per_line(struct ipu6_isys_video *av);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 08f29b678d1b..8e5f6bbf6265 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -473,52 +473,47 @@ static void enable_iwake(struct ipu6_isys *isys, bool enable)
 	mutex_unlock(&iwake_watermark->mutex);
 }
 
-void update_watermark_setting(struct ipu6_isys *isys)
+void ipu6_isys_update_watermark_setting(struct ipu6_isys *isys)
 {
-	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
 	u32 iwake_threshold, iwake_critical_threshold, page_num;
 	struct device *dev = &isys->adev->auxdev.dev;
 	u32 calc_fill_time_us = 0, ltr = 0, did = 0;
-	struct video_stream_watermark *p_watermark;
 	enum ltr_did_type ltr_did_type;
-	struct list_head *stream_node;
 	u64 isys_pb_datarate_mbs = 0;
 	u32 mem_open_threshold = 0;
 	struct ltr_did ltrdid;
 	u64 threshold_bytes;
 	u32 max_sram_size;
 	u32 shift;
+	bool force_iwake_disable = false;
+
+	lockdep_assert_held(&isys->stream_mutex);
 
 	shift = isys->pdata->ipdata->sram_gran_shift;
 	max_sram_size = isys->pdata->ipdata->max_sram_size;
 
-	mutex_lock(&iwake_watermark->mutex);
-	if (iwake_watermark->force_iwake_disable) {
+	for (unsigned int i = 0; i < isys->pdata->ipdata->csi2.nports; i++) {
+		isys_pb_datarate_mbs +=
+			isys->csi2[i].watermark.stream_data_rate;
+		force_iwake_disable |=
+			isys->csi2[i].watermark.force_iwake_disable;
+	}
+
+	if (force_iwake_disable) {
+		dev_dbg(dev, "watermark: forcing iwake disabled\n");
 		set_iwake_ltrdid(isys, 0, 0, LTR_IWAKE_OFF);
 		set_iwake_register(isys, GDA_IRQ_CRITICAL_THRESHOLD_INDEX,
 				   CRITICAL_THRESHOLD_IWAKE_DISABLE);
-		goto unlock_exit;
-	}
-
-	if (list_empty(&iwake_watermark->video_list)) {
-		isys_pb_datarate_mbs = 0;
-	} else {
-		list_for_each(stream_node, &iwake_watermark->video_list) {
-			p_watermark = list_entry(stream_node,
-						 struct video_stream_watermark,
-						 stream_node);
-			isys_pb_datarate_mbs += p_watermark->stream_data_rate;
-		}
+		return;
 	}
-	mutex_unlock(&iwake_watermark->mutex);
 
 	if (!isys_pb_datarate_mbs) {
+		dev_dbg(dev, "watermark: disabled iwake\n");
 		enable_iwake(isys, false);
 		set_iwake_ltrdid(isys, 0, 0, LTR_IWAKE_OFF);
-		mutex_lock(&iwake_watermark->mutex);
 		set_iwake_register(isys, GDA_IRQ_CRITICAL_THRESHOLD_INDEX,
 				   CRITICAL_THRESHOLD_IWAKE_DISABLE);
-		goto unlock_exit;
+		return;
 	}
 
 	enable_iwake(isys, true);
@@ -553,7 +548,6 @@ void update_watermark_setting(struct ipu6_isys *isys)
 	iwake_threshold = max_t(u32, 1, threshold_bytes >> shift);
 	iwake_threshold = min_t(u32, iwake_threshold, max_sram_size);
 
-	mutex_lock(&iwake_watermark->mutex);
 	if (isys->pdata->ipdata->enhanced_iwake) {
 		set_iwake_register(isys, GDA_IWAKE_THRESHOLD_INDEX,
 				   DEFAULT_IWAKE_THRESHOLD);
@@ -575,7 +569,7 @@ void update_watermark_setting(struct ipu6_isys *isys)
 	iwake_critical_threshold = iwake_threshold +
 		(IS_PIXEL_BUFFER_PAGES - iwake_threshold) / 2;
 
-	dev_dbg(dev, "threshold: %u critical: %u\n", iwake_threshold,
+	dev_dbg(dev, "watermark: threshold: %u critical: %u\n", iwake_threshold,
 		iwake_critical_threshold);
 
 	set_iwake_register(isys, GDA_IRQ_CRITICAL_THRESHOLD_INDEX,
@@ -585,8 +579,6 @@ void update_watermark_setting(struct ipu6_isys *isys)
 	       isys->adev->isp->base + REG_PKGC_PMON_CFG);
 	writel(VAL_PKGC_PMON_CFG_START,
 	       isys->adev->isp->base + REG_PKGC_PMON_CFG);
-unlock_exit:
-	mutex_unlock(&iwake_watermark->mutex);
 }
 
 static void isys_iwake_watermark_init(struct ipu6_isys *isys)
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index 8674c041b994..b85c216b3a46 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -222,7 +222,7 @@ void ipu6_cleanup_fw_msg_bufs(struct ipu6_isys *isys);
 
 extern const struct v4l2_ioctl_ops ipu6_isys_ioctl_ops;
 
-void update_watermark_setting(struct ipu6_isys *isys);
+void ipu6_isys_update_watermark_setting(struct ipu6_isys *isys);
 
 int ipu6_isys_mcd_phy_set_power(struct ipu6_isys *isys,
 				struct ipu6_isys_csi2_config *cfg,
-- 
2.47.3

