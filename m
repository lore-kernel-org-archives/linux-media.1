Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7B64DAFAA
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645186; cv=none; b=XJVg9PYoMkstVLbnDkT/AcQXJYVrbSoayM/gAD0e+eVhHH3LM7PFS0xJvHb0sTdRYBF9EveHG45Nds/bqgPEICWONGB+BCn1HxnaU1mbTeEk7ew5VhdRPxYpwiAGYn58luflAwC2r9sgaY/wYZgX6Ru3ED2ZKYQfWwowdke0YAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645186; c=relaxed/simple;
	bh=xlnFwYS8C1rC2KpmNJ7reAcIz/koEefhr32noc2Qo6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QWeKGM4nadJQ1gQ7TbNDqS7RV3LKNNjTVkaTUHSdKt2moXGGQNEFqZmRNxR0QZ59jvvr+cevBN1QBEYve3rjr/99CxO43e2EN0v2mgDg1WgmOU0dVHZXj4xyru392Ns5mk4CJ5jQGJ31gJSxJDxC3xsezcMc37Y4SxFJjM3YNg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nS8EhMHX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nS8EhMHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789645184; x=1821181184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xlnFwYS8C1rC2KpmNJ7reAcIz/koEefhr32noc2Qo6Y=;
  b=nS8EhMHXxIzQCGR0WcdjrhvTCPeP1j9r4SmKNOCOakCz7NVDVSk6qqP+
   1fsCtmDUzA+ZCvx196xoZMX0oXT+QhG6S/bSqNtmljbbx+5WJTQEoJfIw
   ES6iEunJlnvZ4aIChZUeLhT+gXFjYWMu2J8vwpDInApHMozcq0euLrjWS
   8w5LpoU3toCNK0Zo9uhoDm/r98QkhkKCSFibTycV6Fo2g39Tz45uRjSIi
   xFVWSSv3IA3UfpbZ4AJ5jZAwTZpxPSUi/SzwIAOrAC6mk6Dbak0z4JTmW
   dRPSfeSkdFOJIsqIf8JTNP4hPL5m295Ox06Zi6WJyEWt9X1yabWEJMSby
   g==;
X-CSE-ConnectionGUID: u+bEovpHSuSR3kKtbQ00hg==
X-CSE-MsgGUID: FqTcqItYRCqYSI+3ivrICg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77622381"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77622381"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:35 -0700
X-CSE-ConnectionGUID: c8XIe6rGTP+evMwOSHfhSQ==
X-CSE-MsgGUID: w5NcKQJZT0Gf+sZFzdCniQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271097356"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:33 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E1C6C121C7D;
	Thu, 17 Sep 2026 14:39:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x7ASa-00000000FNC-0Mem;
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
Subject: [PATCH v2 09/21] media: ipu6: Start streaming once all streams have started, stop when not
Date: Thu, 17 Sep 2026 14:39:11 +0300
Message-ID: <20260917113923.59004-10-sakari.ailus@linux.intel.com>
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

For each virtual channel, start streaming once all buffer queues connected
via enabled routes have been set streaming, similarly stop when the first
queue is stopped.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 107 +++++++++++++++++-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   1 +
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |   7 +-
 3 files changed, 105 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index f92577054d89..aa07fabb2afc 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/minmax.h>
 #include <linux/sprintf.h>
+#include <linux/string_choices.h>
 
 #include <media/media-entity.h>
 #include <media/v4l2-ctrls.h>
@@ -435,6 +436,89 @@ static int ipu7_isys_csi2_stream_enable(struct ipu6_isys_csi2 *csi2)
 	return 0;
 }
 
+static bool ipu6_isys_csi2_streaming_change(struct ipu6_isys_subdev *asd,
+					    struct v4l2_subdev_state *state,
+					    u32 pad, u8 *vc, bool enable)
+{
+	u32 streams_enabled = 0, nodes_streaming = 0;
+	struct v4l2_subdev_route *route, *this_route = NULL;
+	struct v4l2_mbus_frame_desc desc = { 0 };
+	struct v4l2_mbus_frame_desc_entry *this_entry = NULL;
+	int ret;
+
+	for_each_active_route(&state->routing, this_route)
+		if (pad == this_route->source_pad)
+			break;
+	if (!this_route) {
+		dev_dbg(asd->sd.dev, "no route found for pad %u\n", pad);
+		return false;
+	}
+
+	struct media_pad *remote_pad =
+		media_pad_remote_pad_unique(&asd->sd.entity.pads[this_route->sink_pad]);
+	struct v4l2_subdev *remote_sd =
+		media_entity_to_v4l2_subdev(remote_pad->entity);
+	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc,
+			       remote_pad->index, &desc);
+	if (ret)
+		return ret;
+
+	for (unsigned int i = 0; i < desc.num_entries; i++) {
+		if (desc.entry[i].stream == this_route->sink_stream) {
+			this_entry = &desc.entry[i];
+			break;
+		}
+	}
+	if (!this_entry) {
+		dev_dbg(asd->sd.dev,
+			"no frame descriptor entry found for stream %u\n",
+			this_route->sink_stream);
+		return false;
+	}
+
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_frame_desc_entry *entry = NULL;
+
+		for (unsigned int i = 0; i < desc.num_entries; i++) {
+			if (desc.entry[i].stream == this_entry->stream) {
+				entry = &desc.entry[i];
+				break;
+			}
+		}
+
+		if (entry->bus.csi2.vc != this_entry->bus.csi2.vc)
+			continue;
+
+		struct media_pad *video_pad =
+			media_pad_remote_pad_unique(&asd->sd.entity.pads[route->source_pad]);
+		struct ipu6_isys_video *av = !video_pad ? NULL :
+			container_of_const(video_pad,
+					   struct ipu6_isys_video, pad);
+
+		if (!av) {
+			dev_dbg(asd->sd.dev,
+				"can't find source pad for \"%s\":%u\n",
+				asd->sd.entity.name, route->source_pad);
+			return false;
+		}
+
+		streams_enabled++;
+		if (av->streaming || (enable && pad == route->source_pad))
+			nodes_streaming++;
+	}
+
+	*vc = this_entry->bus.csi2.vc;
+
+	if (streams_enabled == nodes_streaming) {
+		dev_dbg(asd->sd.dev,
+			"changing streaming state to %s on \"%s\":%u\n",
+			str_enabled_disabled(enable), asd->sd.entity.name, pad);
+		return true;
+	}
+
+	return false;
+}
+
 static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 					 struct v4l2_subdev_state *state,
 					 u32 pad, u64 streams_mask)
@@ -450,6 +534,7 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	struct ipu6_isys_buffer_list bl;
 	u64 sink_streams;
 	int ret;
+	u8 vc;
 
 	ret = ipu6_isys_buffer_list_get(av->stream, &bl);
 	if (ret < 0) {
@@ -459,6 +544,9 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 
 	list_add(&av->csi2_entry, &csi2->av_head);
 
+	if (!ipu6_isys_csi2_streaming_change(asd, state, pad, &vc, true))
+		return 0;
+
 	ret = ipu6_isys_start_stream_firmware(av, &bl);
 	if (ret) {
 		dev_err(sd->dev, "start stream of firmware failed\n");
@@ -472,16 +560,20 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
 						&streams_mask);
 
-	ret = IS_IPU7(isp) ? ipu7_isys_csi2_stream_enable(csi2) :
-			     ipu6_isys_csi2_stream_enable(csi2);
-	if (ret)
-		goto err_stop_stream_firmware;
+	if (!csi2->streaming_vc) {
+		ret = IS_IPU7(isp) ? ipu7_isys_csi2_stream_enable(csi2) :
+				     ipu6_isys_csi2_stream_enable(csi2);
+		if (ret)
+			goto err_stop_stream_firmware;
+	}
 
 	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index,
 					 sink_streams);
 	if (ret)
 		goto err_stop_stream_csi2;
 
+	csi2->streaming_vc |= BIT(vc);
+
 	return 0;
 
 err_stop_stream_csi2:
@@ -514,6 +606,12 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 	struct ipu6_device *isp = asd->isys->adev->isp;
 	struct v4l2_subdev *remote_sd;
 	u64 sink_streams;
+	u8 vc;
+
+	if (!ipu6_isys_csi2_streaming_change(asd, state, pad, &vc, false))
+		goto out_del_csi2_entry;
+
+	csi2->streaming_vc &= ~BIT(vc);
 
 	sink_streams =
 		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
@@ -533,6 +631,7 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 
 	ipu6_isys_close_streaming_firmware(av);
 
+out_del_csi2_entry:
 	list_del(&av->csi2_entry);
 
 	return 0;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
index 7c936154691e..a98a60e443c6 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -49,6 +49,7 @@ struct ipu6_isys_csi2 {
 	unsigned int port;
 	u32 legacy_irq_mask;
 	unsigned int phy_mode;
+	u32 streaming_vc;
 };
 
 struct ipu6_isys_csi2_timing {
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 4754e95e4007..5eb6f17bf45b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -533,14 +533,10 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	ipu6_isys_configure_stream_watermark(av, source_pad->entity);
 	ipu6_isys_update_stream_watermark(av, true);
 
-	if (stream->nr_streaming != stream->nr_queues)
-		goto out;
-
 	ret = ipu6_isys_stream_start(av);
 	if (ret)
 		goto out_stream_start;
 
-out:
 	mutex_unlock(&stream->mutex);
 
 	return 0;
@@ -574,8 +570,7 @@ static void stop_streaming(struct vb2_queue *q)
 	ipu6_isys_update_stream_watermark(av, false);
 
 	mutex_lock(&av->isys->stream_mutex);
-	if (stream->nr_streaming == stream->nr_queues)
-		ipu6_isys_video_set_streaming(av, 0);
+	ipu6_isys_video_set_streaming(av, 0);
 	list_del(&aq->node);
 	mutex_unlock(&av->isys->stream_mutex);
 
-- 
2.47.3

