Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C364A0912
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 20:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419247; cv=none; b=cXBkg7RlzO7msNTDNVjEhojeQWyggoRNOPqm82lLvWsgREdyRGUods0D2v0o/uMVp/o5xfZPXGo1oQBXY5LJcEoFTFYD/oJy+DdzNqveJwZ0sLwDmsnWhR0QTkrRmsgwvTbdst3t0HXbRUt8eOeYM4YeUzUu2KJogaq/Xdzr2Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419247; c=relaxed/simple;
	bh=OKJSR8Mk9qvE+4ZCUVpl4dNuTkVWEu64ZpkBdW+AsYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M5JLa68t+0a3HjJq1e2xB1q59G5Z9rsRH/p3XbfJl0lpEjtvLqHIqgPW1IfC2ZSnNTMxhQzgHJTueDOf5hwsxwa1J7XZH//N5OqmZ4ZXNzVjWHW9paFwW8MA/6k1OoyMeZbxRbzb/S53xvInvc6m/Jxw0yl+GZDwCGHV/4w3EXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QKqJeVXx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QKqJeVXx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789419247; x=1820955247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OKJSR8Mk9qvE+4ZCUVpl4dNuTkVWEu64ZpkBdW+AsYA=;
  b=QKqJeVXxIpdcE36gOCgUYzBTtWXoIoqIAIpnuKrDaqLEg+R6pbo2AYAH
   TDaTH3+O7zK9NynPbU9DL/7ke3Bn62ke9LW/n/IpDDDuKBJTilkXFHTOJ
   957zrYHbReT9NOXN/nSn1uvE3O/ABQDKyFhYlv5uY0nRYbKPwZqQzDmbN
   RQzip2QiWAykfJZSgGMg+TRVGXKDr1QnAvVpb6kYUCOYxAP6X4EsTSjrT
   dcnqpnXsZLAArMmgOqfOwLxoaD0RQgW7Gcm1GlL4JG7xZjJqMXmsJKfxC
   dD90Pffuj+Bst5ZddtE2jk7keSPow/hlKgh7+ABNXH4Nix52fz337pWRM
   A==;
X-CSE-ConnectionGUID: Muppvu3eRQyJDiiY3weE8Q==
X-CSE-MsgGUID: sS4uMwYSRZSzZ6mDcWbA4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89984132"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89984132"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:54:03 -0700
X-CSE-ConnectionGUID: kqK7DdO1QMaHki1AQgMgTw==
X-CSE-MsgGUID: M+YxlPBDQtSOWatvNx1ebg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297760753"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.173])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 13:54:00 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 82A44121BEA;
	Mon, 14 Sep 2026 23:53:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x6Dgd-000000035KH-007q;
	Mon, 14 Sep 2026 23:53:59 +0300
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
Subject: [PATCH 21/21] media: ipu6: Support upstream sub-devices without get_frame_desc()
Date: Mon, 14 Sep 2026 23:53:58 +0300
Message-ID: <20260914205358.735307-22-sakari.ailus@linux.intel.com>
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

Provide compatibility support for upstream sub-device drivers that do not
implement get_frame_desc() pad op.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 780ac3c4d4e4..bf70482029dd 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -16,6 +16,7 @@
 #include <linux/string_choices.h>
 
 #include <media/media-entity.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -589,6 +590,29 @@ static bool ipu6_isys_csi2_streaming_change(struct ipu6_isys_subdev *asd,
 	return false;
 }
 
+static int ipu6_isys_get_frame_desc(struct v4l2_subdev *remote_sd,
+				    unsigned int pad,
+				    struct v4l2_mbus_frame_desc *desc)
+{
+	struct v4l2_subdev_format fmt = { .which = V4L2_SUBDEV_FORMAT_ACTIVE };
+	int ret;
+
+	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc, pad, desc);
+	if (!ret || ret != -ENOIOCTLCMD)
+		return ret;
+
+	ret = v4l2_subdev_call_state_active(remote_sd, pad, get_fmt, &fmt);
+	if (ret)
+		return ret;
+
+	desc->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	desc->num_entries = 1;
+	desc->entry[0].pixelcode = fmt.format.code;
+	desc->entry[0].bus.csi2.dt = ipu6_isys_mbus_code_to_mipi(fmt.format.code);
+
+	return 0;
+}
+
 static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 					 struct v4l2_subdev_state *state,
 					 u32 pad, u64 streams_mask)
@@ -612,8 +636,7 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 
 	lockdep_assert_held(&csi2->isys->stream_mutex);
 
-	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc,
-			       remote_pad->index, &desc);
+	ret = ipu6_isys_get_frame_desc(remote_sd, remote_pad->index, &desc);
 	if (ret)
 		return ret;
 
@@ -715,8 +738,7 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 
 	lockdep_assert_held(&csi2->isys->stream_mutex);
 
-	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc,
-			       remote_pad->index, &desc);
+	ret = ipu6_isys_get_frame_desc(remote_sd, remote_pad->index, &desc);
 	if (ret)
 		return ret;
 
-- 
2.47.3

