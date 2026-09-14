Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654E1448384
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 11:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386123; cv=none; b=S7wEqpvlnZu9IK+jjLAZrxY1fI7rX9foNXngLLTK+xEJRLpinrUl6V4iju55I6DkMST+fMh828SnszgImsZ+6ocsqNnDmP+JGQJ8DvDYr/0GenZ769Yw30EIjoZeGSkcpPl+xVmLzS0zkVhpfWbaoudJ7NCI6QXjlhZOVePSvwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386123; c=relaxed/simple;
	bh=ArZ6Gps2Ydi73+YcN+sUaSwRyvVHIoyG8P33VIT4A30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AwppYE5qIu2pZBrBz4Wh1yiukwWAEpODIrRwsYhpymSUBZ/aEw+Kx1FOB2/yiDrHrb5HrUzkKI8ihn/LwfWnxvh0+JEvmrjpxkTHYkr1pdIDlMfvxEOE2PlBHYPtGprmjElWL+uSheHbosGIeUQq5vDBmV34C+5P3ziBf5rPZcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8cokPOB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8cokPOB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789386121; x=1820922121;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ArZ6Gps2Ydi73+YcN+sUaSwRyvVHIoyG8P33VIT4A30=;
  b=A8cokPOBWmYAUrSxNn9jdlnW6W+lAqsbXajaJb5vEg0EiWHr3Q8oP/7B
   syH0HqTxgm1Jjny5zMU8g9UkSI31Q/Rv01SbP8IgZXdPS6xWYLPDfcj7B
   n6lpppFcv+cHN6OsUJob8H7Auu5JkefKl8TwCkWpzjOVgcbgheFn9hjNv
   p/nEaeupxkcFI/YlAugRnFtF3ZpMPg8M2RB4jrv7Viyb3YvCXVSmq6KxW
   VDqagBFWJAuAgIsvkQvOSer8mKACETe/zncUL4BXVPkJ+FI9SpRCe+JSJ
   5L34kjiNLHG0Z3j1S0h/olv3dMWWyBLViCudhBPydvDO0k3xGFy9lULLd
   g==;
X-CSE-ConnectionGUID: KT9X4au/SoilHKdBYhnK3g==
X-CSE-MsgGUID: x5qdggTbR1OeJLp6TjxrwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93431901"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="93431901"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:41:58 -0700
X-CSE-ConnectionGUID: GRBu3gfATwaLMxsyz7Sx/Q==
X-CSE-MsgGUID: SxKnlsdES/Ga08wcEFxfRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="270812720"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.61])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 04:41:51 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AB5AB121BB9;
	Mon, 14 Sep 2026 14:41:56 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x654D-00000002PXf-0fBu;
	Mon, 14 Sep 2026 14:41:45 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>
Subject: [PATCH v8 04/13] media: imx219: The horizontal blanking step is 8
Date: Mon, 14 Sep 2026 14:41:35 +0300
Message-ID: <20260914114145.574791-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914114145.574791-1-sakari.ailus@linux.intel.com>
References: <20260914114145.574791-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The step for the LINE_LENGTH_A register on imx219 is 8. Take this into
account in creating and modifying the horizontal blanking control. The
minimum line length in pixels as well as the horizontal blanking values
are already divisible by 8.

Fixes: cd5e2fd89923 ("media: i2c: imx219: make HBLANK r/w to allow longer exposures")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index b1f29037af74..05717b1e3224 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -78,6 +78,7 @@
 #define IMX219_LLP_MIN			0x0d78
 #define IMX219_BINNED_LLP_MIN		0x0de8
 #define IMX219_LLP_MAX			0x7ff0
+#define IMX219_LLP_STEP			8
 
 #define IMX219_REG_X_ADD_STA_A		CCI_REG16(0x0164)
 #define IMX219_REG_X_ADD_END_A		CCI_REG16(0x0166)
@@ -593,7 +594,8 @@ static int imx219_init_controls(struct imx219 *imx219)
 	imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
 					   V4L2_CID_HBLANK,
 					   IMX219_LLP_MIN - mode->width,
-					   IMX219_LLP_MAX - mode->width, 1,
+					   IMX219_LLP_MAX - mode->width,
+					   IMX219_LLP_STEP,
 					   IMX219_LLP_MIN - mode->width);
 	exposure_max = mode->fll_def - IMX219_EXPOSURE_OFFSET;
 	exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
@@ -935,7 +937,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 				  IMX219_BINNED_LLP_MIN : IMX219_LLP_MIN;
 		ret = __v4l2_ctrl_modify_range(imx219->hblank,
 					       llp_min - mode->width,
-					       IMX219_LLP_MAX - mode->width, 1,
+					       IMX219_LLP_MAX - mode->width,
+					       IMX219_LLP_STEP,
 					       llp_min - mode->width);
 		if (ret)
 			return ret;
-- 
2.47.3

