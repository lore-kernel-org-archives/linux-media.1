Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAE94AA03A
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645184; cv=none; b=R+cy+SMD29QogRgvZqgHfP+Iy4isCHRpMZ86ohYApe+tdSn+qYG/DliobsS1vQ51enPf4TBiVqeKXSQtAn8VsFFXf3GmY8ZYW+oclUvdIDn5IANaKY595pRDmg4cWMLZPJ9aP5ifv0DJYKZqKlFHYpaFat0AFXoHMvF/e57EAsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645184; c=relaxed/simple;
	bh=osBeTDQcu0IkO3MwINsRAZzTLr8NPsW+9qo70Iyke+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lmAFus7S1UbKdbfhcwfktuevj1C5GQXzHrP+nCUeuexKvCmPrCxS/g2GxbSyORBeojOfVYSVtY6nIib6lGVa2KwyWo6VAzTulBnBQPhzsh7/ZD3eH7bMB71JlMv48T/zWv7Qc53Xm1xTF1JPy83qlgkb72NWY+A767/k+RExlb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S2ibPbXP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S2ibPbXP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789645183; x=1821181183;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=osBeTDQcu0IkO3MwINsRAZzTLr8NPsW+9qo70Iyke+Q=;
  b=S2ibPbXPe3WRTzef2SAN4/YExoek4t7daIW3BH4gi3F2uVuRSjXpQcSH
   1O1/6aXQwRzDWTmJjRvehhgrqEx3l+/hNGsJaLkf0EXsm9Z5mWZyM8jfk
   igTCG3ec9E1lk4ngaijGYdpKpKcsoiz1KdpXywr1/cmXDrae1JKGgA1/h
   o7fW/PpEcv0Bep/J31AMsh580ZyM+28Dol5fIF2q+m3nkRye7ry7Cs1o+
   FtX2uiZfwgUGEOSO1VY+BjOJQvKPhlFl7vn+WfgMfT/DmG/OJK72ifC7Q
   lsxngzdcnVE/KrALEvb9ECvfNaqw5FeyB0nEBvkN7ITJnJvcFqlZdux2E
   w==;
X-CSE-ConnectionGUID: LK8NBSkTQfmanBOryzwqVQ==
X-CSE-MsgGUID: WpS2svVeSOq0VGSq9M4jVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77622379"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77622379"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:35 -0700
X-CSE-ConnectionGUID: 1Yrg/+oGQFqVoUVJXetpOg==
X-CSE-MsgGUID: 4oRp5i7dSlqp6atv6iks6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271097352"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:33 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E8067121C80;
	Thu, 17 Sep 2026 14:39:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x7ASa-00000000FNL-0TBc;
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
Subject: [PATCH v2 11/21] media: ipu6: Remove nr_queues and nr_streaming fields in ipu6_isys_stream
Date: Thu, 17 Sep 2026 14:39:13 +0300
Message-ID: <20260917113923.59004-12-sakari.ailus@linux.intel.com>
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

nr_queues and nr_streaming fields were being used to determine whether
streaming was to be started in the upstream sub-device. As we store the
streaming state in the CSI-2 sub-device, there's no longer need for that.
Drop these fields.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 24 +++++++++----------
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 20 +++++-----------
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  7 ++----
 3 files changed, 20 insertions(+), 31 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 5eb6f17bf45b..327ce16bdeca 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -250,6 +250,9 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av)
 	if (ret)
 		return ret;
 
+	if (!(BIT(stream->vc) & av->csi2->streaming_vc))
+		return 0;
+
 	do {
 		ret = ipu6_isys_buffer_list_get(stream, &bl);
 		if (ret < 0)
@@ -294,6 +297,7 @@ static void buf_queue(struct vb2_buffer *vb)
 	struct ipu6_isys_buffer *ib = &ivb->ib;
 	struct device *dev = &adev->auxdev.dev;
 	struct ipu6_isys_stream *stream = av->stream;
+	struct ipu6_isys_csi2 *csi2;
 	struct ipu6_isys_buffer_list bl;
 	struct isys_fw_msgs *msg;
 	unsigned long flags;
@@ -317,7 +321,8 @@ static void buf_queue(struct vb2_buffer *vb)
 
 	mutex_lock(&stream->mutex);
 
-	if (stream->nr_streaming != stream->nr_queues) {
+	csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
+	if (!(BIT(stream->vc) & csi2->streaming_vc)) {
 		dev_dbg(dev, "not streaming yet, adding to incoming\n");
 		goto out;
 	}
@@ -478,7 +483,8 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
 	struct ipu6_isys_stream *stream;
 	struct media_pad *source_pad, *remote_pad;
-	int nr_queues, ret;
+	bool first;
+	int ret;
 
 	dev_dbg(dev, "stream: %s: width %u, height %u, css pixelformat %u\n",
 		av->vdev.name, ipu6_isys_get_frame_width(av),
@@ -498,11 +504,12 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 		goto out_return_buffers;
 	}
 
-	ret = ipu6_isys_setup_video(av, remote_pad, source_pad, &nr_queues);
+	ret = ipu6_isys_setup_video(av, remote_pad, source_pad);
 	if (ret < 0) {
 		dev_dbg(dev, "failed to setup video\n");
 		goto out_return_buffers;
 	}
+	first = ret;
 
 	ret = ipu6_isys_link_fmt_validate(aq);
 	if (ret) {
@@ -518,17 +525,12 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 
 	stream = av->stream;
 	mutex_lock(&stream->mutex);
-	if (!stream->nr_streaming) {
-		ret = ipu6_isys_video_prepare_stream(av, source_pad->entity,
-						     nr_queues);
+	if (first) {
+		ret = ipu6_isys_video_prepare_stream(av, source_pad->entity);
 		if (ret)
 			goto out_fw_close;
 	}
 
-	stream->nr_streaming++;
-	dev_dbg(dev, "queue %u of %u\n", stream->nr_streaming,
-		stream->nr_queues);
-
 	list_add(&aq->node, &stream->queues);
 	ipu6_isys_configure_stream_watermark(av, source_pad->entity);
 	ipu6_isys_update_stream_watermark(av, true);
@@ -544,7 +546,6 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 out_stream_start:
 	ipu6_isys_update_stream_watermark(av, false);
 	list_del(&aq->node);
-	stream->nr_streaming--;
 
 out_fw_close:
 	mutex_unlock(&stream->mutex);
@@ -574,7 +575,6 @@ static void stop_streaming(struct vb2_queue *q)
 	list_del(&aq->node);
 	mutex_unlock(&av->isys->stream_mutex);
 
-	stream->nr_streaming--;
 	mutex_unlock(&stream->mutex);
 
 	ipu6_isys_stream_cleanup(av);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index b3cbd4266da1..5c00c98869d9 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -611,16 +611,11 @@ void ipu6_isys_close_streaming_firmware(struct ipu6_isys_video *av)
 }
 
 int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
-				   struct media_entity *source_entity,
-				   int nr_queues)
+				   struct media_entity *source_entity)
 {
 	struct ipu6_isys_stream *stream = av->stream;
 	struct ipu6_isys_csi2 *csi2;
 
-	if (WARN_ON(stream->nr_streaming))
-		return -EINVAL;
-
-	stream->nr_queues = nr_queues;
 	atomic_set(&stream->sequence, 0);
 	atomic_set(&stream->buf_id, 0);
 
@@ -1000,7 +995,7 @@ void ipu6_isys_fw_close(struct ipu6_isys *isys)
 
 int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 			  struct media_pad *remote_pad,
-			  struct media_pad *source_pad, int *nr_queues)
+			  struct media_pad *source_pad)
 {
 	const struct ipu6_isys_pixelformat *pfmt =
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
@@ -1012,18 +1007,14 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 	struct v4l2_subdev *remote_sd =
 		media_entity_to_v4l2_subdev(remote_pad->entity);
 	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(remote_sd);
+	struct media_pipeline *pipeline;
 	int ret = -EINVAL;
 
-	*nr_queues = 0;
-
 	/* Find the root */
 	state = v4l2_subdev_lock_and_get_active_state(remote_sd);
-	for_each_active_route(&state->routing, r) {
-		(*nr_queues)++;
-
+	for_each_active_route(&state->routing, r)
 		if (r->source_pad == remote_pad->index)
 			route = r;
-	}
 
 	if (!route) {
 		v4l2_subdev_unlock_state(state);
@@ -1051,6 +1042,7 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 		return ret;
 	}
 
+	pipeline = video_device_pipeline(&av->vdev);
 	ret = video_device_pipeline_alloc_start(&av->vdev);
 	if (ret < 0) {
 		dev_dbg(dev, "media pipeline start failed\n");
@@ -1064,7 +1056,7 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 		return -EINVAL;
 	}
 
-	return 0;
+	return !pipeline;
 }
 
 /*
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index cb4b45f0dae2..a78aaad63303 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -52,8 +52,6 @@ struct ipu6_isys_stream {
 	unsigned int nr_output_pins;
 	struct ipu6_isys_subdev *asd;
 
-	int nr_queues;	/* Number of capture queues */
-	int nr_streaming;
 	struct list_head queues;
 	struct completion stream_open_completion;
 	struct completion stream_close_completion;
@@ -108,14 +106,13 @@ int ipu6_isys_start_stream_firmware(struct ipu6_isys_video *av,
 void ipu6_isys_stop_streaming_firmware(struct ipu6_isys_video *av);
 void ipu6_isys_close_streaming_firmware(struct ipu6_isys_video *av);
 int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
-				   struct media_entity *source_entity,
-				   int nr_queues);
+				   struct media_entity *source_entity);
 int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state);
 int ipu6_isys_fw_open(struct ipu6_isys *isys);
 void ipu6_isys_fw_close(struct ipu6_isys *isys);
 int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 			  struct media_pad *remote_pad,
-			  struct media_pad *source_pad, int *nr_queues);
+			  struct media_pad *source_pad);
 int ipu6_isys_video_init(struct ipu6_isys_video *av);
 void ipu6_isys_video_cleanup(struct ipu6_isys_video *av);
 void ipu6_isys_put_stream(struct ipu6_isys_stream *stream);
-- 
2.47.3

