Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B7846D0AA
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 11:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805550; cv=none; b=ipaIsbq6maRBgfXrpEZd1P+EvKOSKc9yL2Cmp6hdD288zNsNyWH2lfNg2rXRxDdb/3e6piVNvGXFFutppAk82xVYBoZedWigWid3hBbZohujZ2LDozh5iU7XKLpim0oCPzDVCBsM11IX3IbEVDlulyiF45X+JsNPUfhbmEPrG4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805550; c=relaxed/simple;
	bh=LK0iEV45yFUvXf0Dnz/jAQCJLp7g8UHiQQm+xl5sxRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vGZgxWqEFNZbqrNabFJHTnzSTAmGD4s9Xw5UcxstW5ldU6TtWBhtY5uZ6I6gx2HnjTI74L3w5OpOhnGEb2K6dgNj+9nZKly75rORfjwSkZA23WXJMQSX1s/Kg2rLUW07IxWh4buXru39mJxMNbHGhWGq/PhylrMtwDqqdc4elco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WZ5FFiX0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WZ5FFiX0"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50FBB1C37;
	Thu, 23 Jul 2026 13:18:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784805484;
	bh=LK0iEV45yFUvXf0Dnz/jAQCJLp7g8UHiQQm+xl5sxRE=;
	h=From:To:Cc:Subject:Date:From;
	b=WZ5FFiX0vQL6V6RRxoS4PLe1JddhdP9q0e4d/4rHoVNaJJk3QtXIIzEVIB//GcVc5
	 q7Yjf51pXmFoiHr0w2NdVtD2j6roLj1/A4J642h+SfLWOggyoFZFWAH/8lhZayo1Be
	 Kbk7AXhtvqxo0rFUcDco5Nj/o/SMySyZyz0AAuhk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>
Subject: [RFC PATCH] media: ti: cal: Deprecate non-MC API usage
Date: Thu, 23 Jul 2026 14:19:03 +0300
Message-ID: <20260723111903.742283-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MC API was introduced in the CAL driver more than five years ago in
commit 38e89e790fe2 ("media: ti-vpe: cal: Implement media controller
centric API") as a disabled by default option. Five years later, it's
time to give users another nudge to move to the MC API. Deprecate non-MC
API usage by printing a warning at probe time, and defaulting to the MC
API. The legacy API can still be selected through the mc_api module
parameter.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti/Kconfig   | 11 -----------
 drivers/media/platform/ti/cal/cal.c | 10 +++-------
 2 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform/ti/Kconfig
index 1a020b2bbb4f..03df5617e99d 100644
--- a/drivers/media/platform/ti/Kconfig
+++ b/drivers/media/platform/ti/Kconfig
@@ -30,17 +30,6 @@ config VIDEO_TI_CAL
 	  In TI Technical Reference Manual this module is referred as
 	  Camera Interface Subsystem (CAMSS).
 
-config VIDEO_TI_CAL_MC
-	bool "Media Controller centric mode by default"
-	depends on VIDEO_TI_CAL
-	default n
-	help
-	  Enables Media Controller centric mode by default.
-
-	  If set, CAL driver will start in Media Controller mode by
-	  default. Note that this behavior can be overridden via
-	  module parameter 'mc_api'.
-
 config VIDEO_TI_VIP
         tristate "TI Video Input Port"
         depends on VIDEO_DEV
diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index b7e77b6b8950..5c82378d1eee 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -43,13 +43,7 @@ unsigned int cal_debug;
 module_param_named(debug, cal_debug, uint, 0644);
 MODULE_PARM_DESC(debug, "activates debug info");
 
-#ifdef CONFIG_VIDEO_TI_CAL_MC
-#define CAL_MC_API_DEFAULT 1
-#else
-#define CAL_MC_API_DEFAULT 0
-#endif
-
-bool cal_mc_api = CAL_MC_API_DEFAULT;
+bool cal_mc_api = 1;
 module_param_named(mc_api, cal_mc_api, bool, 0444);
 MODULE_PARM_DESC(mc_api, "activates the MC API");
 
@@ -1228,6 +1222,8 @@ static int cal_probe(struct platform_device *pdev)
 
 	/* Create contexts. */
 	if (!cal_mc_api) {
+		dev_warn(cal->dev, "The legacy non-MC API is deprecated\n");
+
 		for (i = 0; i < cal->data->num_csi2_phy; ++i) {
 			struct cal_ctx *ctx;
 

base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
-- 
Regards,

Laurent Pinchart

