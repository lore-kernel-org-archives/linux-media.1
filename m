Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8074195DA
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573699; cv=none; b=HiRIrmLX98JKQ1LcFkSpx8y7M1Ss0WmPqDHCkvSiR3+VUmg/aOGi++xYKz/XZcWXfjazAQ3UKy3NMjfEIrwTDo8f0XgVy3ylx8CggIcoToYRAMS+VGGG/V7E3zbfrJyxAo0DD6dWCg++5ZErpPUQ7slz8+fYlJ06THFuK0MlEKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573699; c=relaxed/simple;
	bh=MdI9afDHcbtUL/z1q3eqRA5hCpy0rlrMdoF2kAJuk6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KC4aVqbEs7V7/ha2edNYOSJzQ0yWhoEoGwdc7w1d4OZ1J7WDZqDmAX8sA0Qd6tnapM1E26jQGlv88x8mW9ebLddlHHS8ZLuxlK+ccWsvyJw5x9aUiQREB2uzB0nWWrpPCEKrqHd0C3RmrBXAytHQi9Dew/Go3dYf20xLhOSYhvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHknBb7z; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHknBb7z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573697; x=1819109697;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MdI9afDHcbtUL/z1q3eqRA5hCpy0rlrMdoF2kAJuk6k=;
  b=dHknBb7zZqEoIGxPgU1OjKLXNeoCeCSlwVya+nQc1Bwqh3qJJUpNFdO3
   RQWO2V81XlRHODkuOCYt5otP9p0qN7Qe5aP4Pf+/Uk9LDrDkmTOGxSLnP
   BxbrS+kv+tfaB7nQGzmDLuY/apGN9PCEe5z1/Xt05EpJta4j9plclnn3C
   Aee3qLM9GQHQzIApryaW5bvUhBJUQ73WgfiY14Xw/PhtWDYICnsWJ0LbC
   +MTt7mHJ/e6wF7OP38vh/igbNtQRpESs0y2JVqI7BvlPgjtzfbZfMfhWG
   SKbyj2bVaNZbXT9JyAOYGXna2Rxszts/WcEq2bYpCTedWFLm8ZnZywFqG
   w==;
X-CSE-ConnectionGUID: q/k/tEBpS+axbh2NmtHVtQ==
X-CSE-MsgGUID: v7iEcRqPQpSZ72tXvLLrng==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036587"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036587"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:52 -0700
X-CSE-ConnectionGUID: H5S6DcOvSI+iLvabIccA5w==
X-CSE-MsgGUID: sJmQ2cM1Ty6YzqsSRGN0Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787672"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:50 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A4E59122A41;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E3Ad-3OaD;
	Mon, 24 Aug 2026 15:14:51 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: [PATCH v3 27/29] media: cdns-csi2rc: Use v4l2_subdev_get_frame_desc()
Date: Mon, 24 Aug 2026 15:14:49 +0300
Message-ID: <20260824121451.3348583-28-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
preferred over calling the get_frame_desc() pad operation directly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 24 ++++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index e31cdcd9ce8e..a1f4bf5fbc93 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -230,19 +230,20 @@ static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
 	return NULL;
 }
 
-static int csi2rx_get_frame_desc_from_source(struct csi2rx_priv *csi2rx,
-					     struct v4l2_mbus_frame_desc *fd)
+static struct v4l2_mbus_frame_desc *
+csi2rx_get_frame_desc_from_source(struct csi2rx_priv *csi2rx)
 {
 	struct media_pad *remote_pad;
 
 	remote_pad = media_entity_remote_source_pad_unique(&csi2rx->subdev.entity);
 	if (IS_ERR(remote_pad)) {
 		dev_err(csi2rx->dev, "No remote pad found for sink\n");
-		return PTR_ERR(remote_pad);
+		return ERR_CAST(remote_pad);
 	}
 
-	return v4l2_subdev_call(csi2rx->source_subdev, pad, get_frame_desc,
-				remote_pad->index, fd);
+	return v4l2_subdev_get_frame_desc(csi2rx->source_subdev,
+					  remote_pad->index,
+					  V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
 }
 
 static inline
@@ -459,13 +460,12 @@ static int csi2rx_log_status(struct v4l2_subdev *sd)
 static void csi2rx_update_vc_select(struct csi2rx_priv *csi2rx,
 				    struct v4l2_subdev_state *state)
 {
-	struct v4l2_mbus_frame_desc fd = {0};
 	struct v4l2_subdev_route *route;
 	unsigned int i;
-	int ret;
 
-	ret = csi2rx_get_frame_desc_from_source(csi2rx, &fd);
-	if (ret || fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+	struct v4l2_mbus_frame_desc __free(v4l2_subdev_free_frame_desc) *fd =
+		csi2rx_get_frame_desc_from_source(csi2rx);
+	if (IS_ERR(fd) || fd->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
 		dev_dbg(csi2rx->dev,
 			"Failed to get source frame desc, allowing only VC=0\n");
 		for (i = 0; i < CSI2RX_STREAMS_MAX; i++)
@@ -479,12 +479,12 @@ static void csi2rx_update_vc_select(struct csi2rx_priv *csi2rx,
 	for_each_active_route(&state->routing, route) {
 		u32 cdns_stream = route->source_pad - CSI2RX_PAD_SOURCE_STREAM0;
 
-		for (i = 0; i < fd.num_entries; i++) {
-			if (fd.entry[i].stream != route->sink_stream)
+		for (i = 0; i < fd->num_entries; i++) {
+			if (fd->entry[i].stream != route->sink_stream)
 				continue;
 
 			csi2rx->vc_select[cdns_stream] |=
-				CSI2RX_STREAM_DATA_CFG_VC_SELECT(fd.entry[i].bus.csi2.vc);
+				CSI2RX_STREAM_DATA_CFG_VC_SELECT(fd->entry[i].bus.csi2.vc);
 		}
 	}
 }
-- 
2.47.3

