Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2FB416855
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573693; cv=none; b=s1eXCNkrlZ0LS3BGVroGsAUZs53plkF90Pj4EEjFaUrrFv3gpGvlC84VEgC0HjDX4p4j1HbN7w/RoXlj4RUZ51KAKAHVc4mAhYGMLx+g2TGAoE+odloVVkQxVtJK954g1TmTB8ikcu58d8vvhWDdS4hVnol5KE8a29FfRnBit8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573693; c=relaxed/simple;
	bh=QXcitpLo2gfq3jq/AfR15417F2pjEqTF2dG+ldn75B0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=asAtPN8Pdk2NreewG1eVxLNkulNxq0EQT1asknuB2Oy3IxGKyPzmD3ZUEXXs0EzI95MR8yYpgZpEajKjQE+vMXfa13TMd5vXudyWFiMUm6CVbieEwp4FyOBGj8lhJOAahCHAge+E2szQrjcJbS8cHySLllFEvMmEjnCx1N4rtaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aCZg8/XD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCZg8/XD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573692; x=1819109692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QXcitpLo2gfq3jq/AfR15417F2pjEqTF2dG+ldn75B0=;
  b=aCZg8/XDNU8aT7i/PwRR5Wn3sovadlPEam4PVoEVoxUnpmhKlCWHucjL
   +sVZadpDJdNTYGViaZGxfFx0pkrXyle6TBqKdihkxju5QPiQD7ehwYXol
   tVvzVOD5gN5/0YbNXtbe1jK2x3aFkyfR3VmnjXHmeE5w8e0uQ8aAmwGTi
   fxD4qbnoytK3HOyB1RWaXGFBUI8uJvVG3DKxP/bl+NjjQvUPzAcmuS7Sy
   qHVXtpolTaAtCAy9Q3LofvMOnV2Ze7z+VvAh6I1j/c+XoAlvESmolIPBY
   7dA1K5LVkYzcDenR7nU3q9NFOEwFmJTN4Pb8I5TU+qft+MQ9XJSVCIvgt
   Q==;
X-CSE-ConnectionGUID: x0M3Xc8/QliLQKFFE0GN2A==
X-CSE-MsgGUID: VrXWZtVmRoqxvqsyiX6A+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036523"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036523"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:47 -0700
X-CSE-ConnectionGUID: 5FrLdkeETpOHGmluKxDIfA==
X-CSE-MsgGUID: U5t9flmHTWuX1z0gj9D77g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787655"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 73756121E7E;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E39R-2YDQ;
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
Subject: [PATCH v3 12/29] media: dw-mipi-csi2rx: Use v4l2_subdev_get_frame_desc_passthrough_csi2()
Date: Mon, 24 Aug 2026 15:14:34 +0300
Message-ID: <20260824121451.3348583-13-sakari.ailus@linux.intel.com>
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

Switch to v4l2_subdev_get_frame_desc_passthrough_csi2() in order to set
the frame descriptor type in the get_frame_desc() callback.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/platform/synopsys/dw-mipi-csi2rx.c  | 22 +------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 41e48365167e..9e3c97f9cad5 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -630,31 +630,11 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
 	return ret;
 }
 
-static int
-dw_mipi_csi2rx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
-			      struct v4l2_mbus_frame_desc *fd)
-{
-	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
-	struct v4l2_subdev *remote_sd;
-	struct media_pad *remote_pad;
-
-	remote_pad = media_pad_remote_pad_unique(&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
-	if (IS_ERR(remote_pad)) {
-		dev_err(csi2->dev, "can't get remote source pad\n");
-		return PTR_ERR(remote_pad);
-	}
-
-	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
-
-	return v4l2_subdev_call(remote_sd, pad, get_frame_desc,
-				remote_pad->index, fd);
-}
-
 static const struct v4l2_subdev_pad_ops dw_mipi_csi2rx_pad_ops = {
 	.enum_mbus_code = dw_mipi_csi2rx_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = dw_mipi_csi2rx_set_fmt,
-	.get_frame_desc = dw_mipi_csi2rx_get_frame_desc,
+	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough_csi2,
 	.set_routing = dw_mipi_csi2rx_set_routing,
 	.enable_streams = dw_mipi_csi2rx_enable_streams,
 	.disable_streams = dw_mipi_csi2rx_disable_streams,
-- 
2.47.3

