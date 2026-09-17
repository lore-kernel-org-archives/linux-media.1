Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B5E4D956A
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645177; cv=none; b=o+kNx3cqnjjQ+oOI8WSPPy0fiKsGvg8FFzLDd+Qyea2z5DjgLy6HAplknUrtOSNo975eGv8VZnji3EjupRgO4tXAJbNk82qjo8GbMy2r5r0KT/05corM0gzs+jWrtlrB4xuix3lo1lulIuh97K6qtS7PYVY3PzVLRN98ksXWoqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645177; c=relaxed/simple;
	bh=1plP7Sxi4h04BfJsdjGl3xjqnoAU7c9owoylXbrZVBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YqtPMeZfB28yJI3Sfv/8/+f8jS+CxT3HPqIHzn9X2F0jK8y1ltSywWySvBbMSile4qRiSi/6/W1ojwbSpljstosh1IabebHOkF98qAyp59ITFzorv1m1ecNQvfsrs6lH8IojZWX/h9pwTPj9Yu9Fdl+GyGO4wA7FbSd2Sy6tXLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHef19ki; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHef19ki"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789645175; x=1821181175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1plP7Sxi4h04BfJsdjGl3xjqnoAU7c9owoylXbrZVBs=;
  b=GHef19kil/DXF3blycB8jM39T/lhZA7iA/rzCIljQmLFfioleViMHNqu
   Bt6zouZGdxIqvaB2t75BL4bQCsBWbTIHfKlLDa1ji0nim4Sv8ww6Do9do
   NmVowabBaddigzfBeX5Hkl8QbAx4ZFHjBO0kigRZtNFt62a7PoUoA5R8w
   JguzRYW/Rfa6auN6zLYsHNIoa4lYKxZ4Kwpr4+tpGnMXrmu7cJ4BJnEet
   zCDOFAHbe1Hq0DqFJW1bVLV8ZWWksJUVIj1NxW7fHSmlk4WOjai7Kh2Mr
   cXMPtB9JBV+AaT0+N92HSY7MBrYjZlQQQKPkR+zphO3RSbXFVpeWRCRM7
   Q==;
X-CSE-ConnectionGUID: tsp+pxklRVCB6cTXj15/zw==
X-CSE-MsgGUID: VW1Iue2zTNWvQZZlHJlVlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77622373"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77622373"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:35 -0700
X-CSE-ConnectionGUID: /wVN+4GSRNG13btTtB+F8w==
X-CSE-MsgGUID: XeI1N7wmSAGuzoVi0j52mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271097339"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:39:33 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EB08C121C86;
	Thu, 17 Sep 2026 14:39:24 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x7ASa-00000000FNR-0X3D;
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
Subject: [PATCH v2 12/21] media: ipu6: Collect enabled stream IDs
Date: Thu, 17 Sep 2026 14:39:14 +0300
Message-ID: <20260917113923.59004-13-sakari.ailus@linux.intel.com>
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

Collect enable stream IDs as streaming is enabled on video nodes. These
values will be needed once streaming actually starts. This is required for
multiple streams from a single source.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 25 ++++++++++++-------
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |  1 +
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 431b770cc8e2..dded92cf006b 100644
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

