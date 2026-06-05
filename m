Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1363D4132
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697309; cv=none; b=as8r5fzSc2cg7ek7H6QNdDptIxnrbPJSxUa/sPjD0cWFskluaVzFaG3SYPp3jIio2oPT65u6vU7Rpkk7uaqTZnYpMXqQvBbfT4jsLLfhWXOg8fJnsaqy8z0NbG39EW2R2vTiu3KN577FOAcHnBTw2n4hJ4UWofTSLJKyZ6IY6ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697309; c=relaxed/simple;
	bh=gJA/HNE8SboWhVfvAKSjBG7JCLIGhqPaqgZuymsJ7Ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pTdym4jJ9YTLQ9Lg4yFBPMkXknRumRumIRq1B1iLsSm6GU3yt4xkCxRHViEjRqLex/1ua1uTZ25zOuZbFJ0kLS8636CnCURuxHm53+gjFCCaoVcZkz/S1MGWxORdd1szAeRWBOq7EDWQwmi3EvMixeqvjioGDW96M56qpA/xcRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVciC-0000LW-G9; Sat, 06 Jun 2026 00:08:20 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:06:59 +0200
Subject: [PATCH 13/17] media: rockchip: rga: bind all cores to the master
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-13-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
In-Reply-To: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Bind all core components to the master component. Previously only the
first core has been added to the master device to avoid creating
multiple video devices. As the video device creation has been moved to
the master component, it allows us to bind all cores without creating
additional video devices.

We expect that all cores to report the same version number, as we only
add cores with the same compatible value. This is important, as  we
setup the command buffer before actually scheduling the work to a
specific core. Therefore adjusting command buffers depending on the
version register only works when all cores have the same value.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 22 +++++++++++-----------
 drivers/media/platform/rockchip/rga/rga.h |  1 +
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 0413b8518dfc8..6add6c510c127 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -742,6 +742,7 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 {
 	struct rockchip_rga *rga = data;
 	struct rga_core *core = dev_get_drvdata(dev);
+	struct rockchip_rga_version version;
 	int ret = 0;
 
 	core->rga = rga;
@@ -750,14 +751,21 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 	if (ret < 0)
 		return ret;
 
-	rga->version = rga->hw->get_version(core);
+	version = rga->hw->get_version(core);
 
 	v4l2_info(&rga->v4l2_dev, "HW Version: 0x%02x.%02x\n",
-		  rga->version.major, rga->version.minor);
+		  version.major, version.minor);
+
+	if (rga->num_cores) {
+		/* we are not the first core, expect that we have the same version */
+		if (rga->version.major != version.major || rga->version.minor != version.minor)
+			v4l2_warn(&rga->v4l2_dev, "Detected multi-core setup with different core versions!\n");
+	} else
+		rga->version = version;
 
 	pm_runtime_put(core->dev);
 
-	rga->cores[0] = core;
+	rga->cores[rga->num_cores++] = core;
 
 	return 0;
 }
@@ -983,14 +991,6 @@ static int rga_probe(struct platform_device *pdev)
 		component_match_add_release(dev, &match, component_release_of,
 					    component_compare_of, core_node);
 		num_cores++;
-
-		/*
-		 * As multi core is not implemented yet,
-		 * break out of the loop to only have one core per rockchip_rga struct.
-		 * Also put the node, which otherwise would've been done by the loop iteration.
-		 */
-		of_node_put(core_node);
-		break;
 	}
 
 	if (!match)
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index fcf1ef7d2029f..6237436b984eb 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -88,6 +88,7 @@ struct rockchip_rga {
 
 	const struct rga_hw *hw;
 
+	u8 num_cores;
 	struct rga_core *cores[];
 };
 

-- 
2.54.0

