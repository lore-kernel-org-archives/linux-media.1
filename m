Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D845442FBE
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 20:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419244; cv=none; b=s92NCEvsDBZyXHiz+YYihbMuGwY3f//yMihYJTZKEkK36n0D9ZYsd3buUvOMhSY83BMxZMtuCscK1ExdCRADsdR9ZR63LxkI+zeXUZTQ4YDT8YWFB8ykMcgM1x3h/SGz0/DklV0k4fj3XRSGX3WuU3GM23sqjHwi5r70q631XCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419244; c=relaxed/simple;
	bh=23/uWu8PHS4GTYmh69YfYhpXVqnEOE/xKf/9GchjHro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XPSYVowZ7c8LYPMyKwAIR3iOxYABFJAGUAs8DdhoMzi8HfglJlTxe7K5+hoqZ//SGK6DDo+Bmzib7carn2b5ydZyTaoaKK4gzbXo5yGxAJLwiX31uukxyrpgqS9Xqm/eHnTnS9TELcjkLTc5iIa6Nw/eLOYd6FKtKWYvuix5/78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mtMpL2Ai; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mtMpL2Ai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789419244; x=1820955244;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=23/uWu8PHS4GTYmh69YfYhpXVqnEOE/xKf/9GchjHro=;
  b=mtMpL2Ai9q+a2hDfZDkwukuzWgUtFZOoxpCruuiLoUfNF92wtbM0Z5S3
   XrFanSqFD15hkZu030wjuuf/6p4/1TplgvmGq9alx+4XC1sYCKK0hHFPQ
   v9pllbLUcAXOjNAza9D7AUjLIo32xaWO93QaV1KLBXBUdZbUSZ5YhGssf
   XCVDNXrqWzwOD0yy+B9tAtdbH160OmBMG1iEX3LVFU027GOZ6JtTzC8lG
   ahohgv5Sh6GU8XHtYOBNMCcoJ+c2YckeEsM39/7zAPbClZ0BADxApCQAv
   Gbn8Rt11D5DIn23/Dn2vXQgiJnJiEAwnNmxyVltvxb7RAxIIcXbHq1rcD
   A==;
X-CSE-ConnectionGUID: hYnoW/4NQ760Fn+lnHzEXw==
X-CSE-MsgGUID: GjQ8UqcaTemOmfWl5p735g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89984123"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89984123"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:59 -0700
X-CSE-ConnectionGUID: LwyxLNmGTCeZKjmbTlTmPg==
X-CSE-MsgGUID: hXZFiNC3QBSICsfKp+C6Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297760727"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.173])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:53:56 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 63248121BC2;
	Mon, 14 Sep 2026 23:53:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x6Dgc-000000035JX-3g5x;
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
Subject: [PATCH 12/21] media: ipu6: Collect enabled stream IDs
Date: Mon, 14 Sep 2026 23:53:49 +0300
Message-ID: <20260914205358.735307-13-sakari.ailus@linux.intel.com>
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

Collect enable stream IDs as streaming is enabled on video nodes. These
values will be needed once streaming actually starts. This is required for
multiple streams from a single source.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 25 ++++++++++++-------
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |  1 +
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 70b48d02c0c0..3b02ca4b7e40 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -516,6 +516,10 @@ static bool ipu6_isys_csi2_streaming_change(struct ipu6_isys_subdev *asd,
 		return true;
 	}
 
+	dev_dbg(asd->sd.dev, "not setting streaming %s %s (%u/%u)\n",
+		str_enabled_disabled(enable), enable ? "yet" : "anymore",
+		nodes_streaming, streams_enabled);
+
 	return false;
 }
 
@@ -546,6 +550,11 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 
 	list_add(&av->csi2_entry, &csi2->av_head);
 
+	sink_streams =
+		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
+						&streams_mask);
+	csi2->stream_ids |= sink_streams;
+
 	if (!ipu6_isys_csi2_streaming_change(asd, state, pad, &vc, true))
 		return 0;
 
@@ -555,13 +564,6 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 		goto err_return_buffers;
 	}
 
-	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
-	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
-
-	sink_streams =
-		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
-						&streams_mask);
-
 	if (!csi2->streaming_vc) {
 		ret = IS_IPU7(isp) ? ipu7_isys_csi2_stream_enable(csi2) :
 				     ipu6_isys_csi2_stream_enable(csi2);
@@ -569,8 +571,11 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 			goto err_stop_stream_firmware;
 	}
 
+	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
 	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index,
-					 sink_streams);
+					 csi2->stream_ids);
 	if (ret)
 		goto err_stop_stream_csi2;
 
@@ -589,6 +594,7 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	ipu6_isys_close_streaming_firmware(av);
 
 err_return_buffers:
+	csi2->stream_ids &= ~sink_streams;
 	list_del(&av->csi2_entry);
 	ipu6_isys_buffer_list_queue(&bl, IPU6_ISYS_BUFFER_LIST_FL_INCOMING, 0);
 
@@ -631,7 +637,8 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 	else
 		ipu6_isys_csi2_stream_disable(csi2);
 
-	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, sink_streams);
+	v4l2_subdev_disable_streams(remote_sd, remote_pad->index,
+				    csi2->stream_ids);
 
 	ipu6_isys_close_streaming_firmware(av);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
index a98a60e443c6..4d84899fde4c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -50,6 +50,7 @@ struct ipu6_isys_csi2 {
 	u32 legacy_irq_mask;
 	unsigned int phy_mode;
 	u32 streaming_vc;
+	u64 stream_ids;
 };
 
 struct ipu6_isys_csi2_timing {
-- 
2.47.3

