Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4286C412C1A
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573697; cv=none; b=QuqWO7Eh2X8AoEWYWbRTG3PGaZBKmmTprDIF3BlofAGA+bVDD5FKk3wDnsudMJlJdrE9DpSaeHB1J9GSJVzzIAVDgZV/etAuvcfgt0ByhA0l/cp2TH3vpupglNW/zMxTqy8Kt/48GxR/GmAYOrP5DWrtY2hXhniq4IPM2c0tHXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573697; c=relaxed/simple;
	bh=v7w70+MpHWQdvK3UqgOg8FD+ZRbuehYVKDcXgjwIXwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K1g6lD8XvA34k7Uem+gCpoe2SN7iya73skCwdvx6DtTK+Ilwmp8VQNzD0SNkvKa1KpwMYcdgrvDlTrjKO+R7NZaEu0PrYFuCdtt3mSbNFZEjwzHqNICn4Hl9is48Pga4LBCaDzY4vBI4R3C/LdzmZC4xTuBj2NUshDXLXR6gg5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uuyonnm+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uuyonnm+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787573696; x=1819109696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v7w70+MpHWQdvK3UqgOg8FD+ZRbuehYVKDcXgjwIXwk=;
  b=Uuyonnm+0++F3NrzKTjghPa1xR2b/mqLWFQPGbYY7RToyKvsj5bLPbhz
   +VFJQeIHYDL7faoTXdj3amkYx7MjGCa8EL6A4Ld/JK3VjDbmkkl0098ry
   STxNDScP3Ep8JJ3GlloC9Q07R9Lnw3GRq5mTrhjyUh2xSm6fCAmorm0zH
   FhpTTyH/BcAoEqRSI1TaRuvRtSKNPzrKQ+7QolRL/MUtrhIG1uYSPZh00
   H2/U8EOZh2DE1P+ZKsQ9CBwR690wEJFaJofs1rwimom1Bl/X811FZ8V1O
   xj5kjRjVqA3Xp2m4e9LiL5AyrYgIUrYEbxA9gj2mEk8GcJh9UJr1TxzDR
   Q==;
X-CSE-ConnectionGUID: GicbuWeuTsGhbGXmQw8ZWg==
X-CSE-MsgGUID: FIl+/zYvSXCZBbrG5CFMJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88036562"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88036562"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:51 -0700
X-CSE-ConnectionGUID: pAb9nhw/QayCCgf1VaqovQ==
X-CSE-MsgGUID: KAHtfIA4S9aPuL8FI/vo9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270787663"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:14:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 88988122304;
	Mon, 24 Aug 2026 15:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wyTZj-0000000E39v-2teK;
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
Subject: [PATCH v3 18/29] media: bcm2835-unicam: Remove frame descriptor workaround
Date: Mon, 24 Aug 2026 15:14:40 +0300
Message-ID: <20260824121451.3348583-19-sakari.ailus@linux.intel.com>
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

As the v4l2_subdev_get_frame_desc() either returns a frame descriptor or
returns an error, remove the workaround for drivers that didn't implement
the get_frame_desc() pad op. Also handle v4l2_subdev_get_frame_desc()
errors.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/platform/broadcom/bcm2835-unicam.c  | 26 +++++++++----------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 2322d3df3915..ba613966c333 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -918,8 +918,8 @@ static int unicam_get_image_vc_dt(struct unicam_device *unicam,
 	return -EINVAL;
 }
 
-static void unicam_start_rx(struct unicam_device *unicam,
-			    struct v4l2_subdev_state *state)
+static int unicam_start_rx(struct unicam_device *unicam,
+			   struct v4l2_subdev_state *state)
 {
 	struct unicam_node *node = &unicam->node[UNICAM_IMAGE_NODE];
 	const struct unicam_format_info *fmtinfo;
@@ -933,7 +933,11 @@ static void unicam_start_rx(struct unicam_device *unicam,
 	fmtinfo = unicam_find_format_by_code(fmt->code,
 					     UNICAM_SD_PAD_SOURCE_IMAGE);
 	if (WARN_ON(!fmtinfo))
-		return;
+		return -EINVAL;
+
+	ret = unicam_get_image_vc_dt(unicam, state, &vc, &dt);
+	if (ret)
+		return ret;
 
 	/*
 	 * Enable lane clocks. The register is structured as follows:
@@ -1090,16 +1094,6 @@ static void unicam_start_rx(struct unicam_device *unicam,
 	unicam_wr_dma_addr(node, node->cur_frm);
 	unicam_set_packing_config(unicam, fmtinfo);
 
-	ret = unicam_get_image_vc_dt(unicam, state, &vc, &dt);
-	if (ret) {
-		/*
-		 * If the source doesn't support frame descriptors, default to
-		 * VC 0 and use the DT corresponding to the format.
-		 */
-		vc = 0;
-		dt = fmtinfo->csi_dt;
-	}
-
 	unicam_cfg_image_id(unicam, vc, dt);
 
 	val = unicam_reg_read(unicam, UNICAM_MISC);
@@ -1118,6 +1112,8 @@ static void unicam_start_rx(struct unicam_device *unicam,
 	 * sync correctly to the FS from the source.
 	 */
 	unicam_reg_write_field(unicam, UNICAM_ICTL, 1, UNICAM_TFC);
+
+	return 0;
 }
 
 static void unicam_start_metadata(struct unicam_device *unicam)
@@ -1427,7 +1423,9 @@ static int unicam_sd_enable_streams(struct v4l2_subdev *sd,
 			unicam_start_metadata(unicam);
 
 		unicam->frame_started = false;
-		unicam_start_rx(unicam, state);
+		ret = unicam_start_rx(unicam, state);
+		if (ret)
+			return ret;
 	}
 
 	ret = v4l2_subdev_routing_find_opposite_end(&state->routing, pad, 0,
-- 
2.47.3

