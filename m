Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF588411A1B
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 20:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419240; cv=none; b=lipwQf3oWigbitNzQFwSmo9fFfHIoqZ/MV9mBCj+J3sOB2hEuhaKPsNQ8wI5kZ5KMNksCsy8GOIq+2NLGDsqu9v0eHeBKNI4cdXGYMzYDIS7I2F1DuiJm3YJBJfe9ASaQFwPIycp4vi5jvXcytlp/yBKpawA3N88eefiLNqQiDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419240; c=relaxed/simple;
	bh=5ZJGT+sSoLuOScNqMW67SdV0W4j7Nf479cMKpscHax0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dAa1VDNa2mtsC3Nkv5qCz9M8hhJNG1NGQ3XzivEP5KvF9GjPQMhuK99aZAKHGdHg8JzkZIiEaWhnJVA1Ch92aru6jKR1J/S6Tw2Tdjh7t8j5qh4u0tkTjhq/jAdZDf2yMiZgo3zo/7EORk1AYcJ1fG7WFc7ZWj6zYfn/edAM1WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YsjLwoFF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YsjLwoFF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789419239; x=1820955239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5ZJGT+sSoLuOScNqMW67SdV0W4j7Nf479cMKpscHax0=;
  b=YsjLwoFFkA3c/Rf4AUvhZqQ7Y5gFOhgiE4zhU5WQ5Jwt4NKGxrs+JPuf
   m54T1Q2XrNG3KFXM8tcpLGBw6bwnAvYVXBmsMr3J0ST0UsFyJoVuXBVKm
   RTnvfyy715co9mL2cy4lc582DFpl0/y2bcaTk+Bd2zVFgpREMGMchqHZi
   ad9zGMayeUnPJzaZoSq3TVOs95g2TZkeQ2X97+tvZP5+41w2oDZ8heDRy
   fa4fbZWd1jnFZagjf5AKqnXI7on3oGrxGCzO0qbv/gkHS8f7FLv2jQPtF
   GdoOEN+wFfr6ORhwtx9/duanVz3qy9zNTNXchqCxnnIEDFrNNWHjwUAMG
   Q==;
X-CSE-ConnectionGUID: iSGGb4aKSBmjz34bpcIW7Q==
X-CSE-MsgGUID: F4hVT2ZjQeSQorj1DjGL3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89984115"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89984115"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:55 -0700
X-CSE-ConnectionGUID: 6nuUpGDATmikraZ1/NLC0Q==
X-CSE-MsgGUID: tSjWums9SfW/RAo6XPT+pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297760693"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.173])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:52 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 45449121BB9;
	Mon, 14 Sep 2026 23:53:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x6Dgc-000000035Ip-3947;
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
Subject: [PATCH 03/21] media: ipu6: Stream number on CSI-2 receiver source pads is always 0
Date: Mon, 14 Sep 2026 23:53:40 +0300
Message-ID: <20260914205358.735307-4-sakari.ailus@linux.intel.com>
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

The stream number on the video nodes' single pad is always 0, thus the
stream number of the CSI-2 receivers' source pads is also 0. Remove the
complexity that is there to come up with 0.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 49 ++-----------------
 1 file changed, 5 insertions(+), 44 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index b63fb9673604..b15c24b1b710 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -867,66 +867,27 @@ ipu6_isys_query_stream_by_source(struct ipu6_isys *isys, int source, u8 vc)
 	return stream;
 }
 
-static u64 get_stream_mask_by_pipeline(struct ipu6_isys_video *__av)
-{
-	struct media_pipeline *pipeline =
-		media_entity_pipeline(&__av->vdev.entity);
-	unsigned int i;
-	u64 stream_mask = 0;
-
-	for (i = 0; i < NR_OF_CSI2_SRC_PADS; i++) {
-		struct ipu6_isys_video *av = &__av->csi2->av[i];
-
-		if (pipeline == media_entity_pipeline(&av->vdev.entity))
-			stream_mask |= BIT_ULL(av->source_stream);
-	}
-
-	return stream_mask;
-}
-
 int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state)
 {
-	struct v4l2_subdev_krouting *routing;
-	struct ipu6_isys_stream *stream = av->stream;
-	struct v4l2_subdev_state *subdev_state;
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	struct v4l2_subdev *sd;
 	struct media_pad *r_pad;
-	u32 sink_pad, sink_stream;
-	u64 r_stream;
-	u64 stream_mask = 0;
 	int ret = 0;
 
-	dev_dbg(dev, "set stream: %d\n", state);
-
-	sd = &stream->asd->sd;
+	sd = &av->stream->asd->sd;
 	r_pad = media_pad_remote_pad_first(&av->pad);
-	r_stream = ipu6_isys_get_src_stream_by_src_pad(sd, r_pad->index);
-
-	subdev_state = v4l2_subdev_lock_and_get_active_state(sd);
-	routing = &subdev_state->routing;
-	ret = v4l2_subdev_routing_find_opposite_end(routing, r_pad->index,
-						    r_stream, &sink_pad,
-						    &sink_stream);
-	v4l2_subdev_unlock_state(subdev_state);
-	if (ret)
-		return ret;
 
-	stream_mask = get_stream_mask_by_pipeline(av);
 	if (!state) {
 		/* stop sub-device which connects with video */
-		dev_dbg(dev, "stream off entity %s pad:%d mask:0x%llx\n",
-			sd->name, r_pad->index, stream_mask);
-		ret = v4l2_subdev_disable_streams(sd, r_pad->index,
-						  stream_mask);
+		dev_dbg(dev, "stream off %s pad:%d\n", sd->name, r_pad->index);
+		ret = v4l2_subdev_disable_streams(sd, r_pad->index, 1);
 		if (ret)
 			dev_err(dev, "stream off %s failed with %d\n", sd->name,
 				ret);
 	} else {
 		/* start sub-device which connects with video */
-		dev_dbg(dev, "stream on %s pad %d mask 0x%llx\n", sd->name,
-			r_pad->index, stream_mask);
-		ret = v4l2_subdev_enable_streams(sd, r_pad->index, stream_mask);
+		dev_dbg(dev, "stream on %s pad %d\n", sd->name, r_pad->index);
+		ret = v4l2_subdev_enable_streams(sd, r_pad->index, 1);
 		if (ret)
 			dev_err(dev, "stream on %s failed with %d\n", sd->name,
 				ret);
-- 
2.47.3

