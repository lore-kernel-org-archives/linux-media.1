Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A263F8231
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697313; cv=none; b=nqYEOOMHvHZotS+7Ksg3Q3bEb8U+YYLzqYyI41P34sBJbg9bz5OedhNX1Zoz+Vlf6qdeuDIzYIKCMteS2BaulKT7WoQ354x6AZyWcq2GsryA0HVT1Lk7rhyqzyltMa/wA2kLvMyFT5iAvyhuoT/L6WKXJAvLvnZZECwSYNzlCIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697313; c=relaxed/simple;
	bh=SIEys4+eownKsgBmW53TpZ11fhPms2+OoEtZzVfVLKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AUYfkqnxD+dUbzxi+R4VHVcbUzcbW/1WYx+GoHG2UhlmNxMyxtT6cxGCd9psuxEW/H7CYOE4E5KrEQk4MSJFWy0iRiecTJ+3f8xobeLe4dt0Q3dErcUFzDKGNXfq9OpZQ0ngNiMyaoVhaF+oz3q/z3K4knuvEQpiN6ZIAY2hT9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVci8-0000LW-Ed; Sat, 06 Jun 2026 00:08:16 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:06:55 +0200
Subject: [PATCH 09/17] media: rockchip: rga: use components to manage
 multiple cores
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-9-3ec2b15675f7@pengutronix.de>
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

Use component helpers to manage multiple cores and aggregate them into a
central master device. This gives us a dedicated master device and
ensures that all cores (components) are properly set up before creating
the video device.

This commit only sets up a basic component device. Instead of the
rga_disable_multicore function only the first core is added to the
master device. To avoid the secondary core creating an additional video
device the whole core probe implementation is moved to the bind method,
which is only called when the core is bound to a master device.

The implementation is based on the etnaviv gpu driver, which also groups
multiple gpu cores under a single etnaviv master device.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 256 +++++++++++++++++++++++-------
 1 file changed, 202 insertions(+), 54 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 15d095a1d1973..178f45b8da940 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/component.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/fs.h>
@@ -737,51 +738,9 @@ static int rga_parse_dt(struct rga_core *core)
 	return 0;
 }
 
-/*
- * Some SoCs, like RK3588 have multiple identical RGA3 cores, but the
- * kernel is currently missing support for multi-core handling. Exposing
- * separate devices for each core to userspace is bad, since that does
- * not allow scheduling tasks properly (and creates ABI). With this workaround
- * the driver will only probe for the first core and early exit for the other
- * cores. Once the driver gains multi-core support, the same technique
- * for detecting the main core can be used to cluster all cores together.
- */
-static int rga_disable_multicore(struct device *dev)
-{
-	struct device_node *node = NULL;
-	const char *compatible;
-	bool is_main_core;
-	int ret;
-
-	/* Intentionally ignores the fallback strings */
-	ret = of_property_read_string(dev->of_node, "compatible", &compatible);
-	if (ret)
-		return ret;
-
-	/* The first compatible and available node found is considered the main core */
-	do {
-		node = of_find_compatible_node(node, NULL, compatible);
-		if (of_device_is_available(node))
-			break;
-	} while (node);
-
-	if (!node)
-		return -EINVAL;
-
-	is_main_core = (dev->of_node == node);
-
-	of_node_put(node);
-
-	if (!is_main_core) {
-		dev_info(dev, "missing multi-core support, ignoring this instance\n");
-		return -ENODEV;
-	}
-
-	return 0;
-}
-
-static int rga_probe(struct platform_device *pdev)
+static int rga_core_bind(struct device *dev, struct device *master, void *data)
 {
+	struct platform_device *pdev = to_platform_device(dev);
 	struct rockchip_rga *rga;
 	struct rga_core *core;
 	struct video_device *vfd;
@@ -791,10 +750,6 @@ static int rga_probe(struct platform_device *pdev)
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
-	ret = rga_disable_multicore(&pdev->dev);
-	if (ret)
-		return ret;
-
 	rga = devm_kzalloc(&pdev->dev, sizeof(*rga) + 1 * sizeof(*rga->cores), GFP_KERNEL);
 	if (!rga)
 		return -ENOMEM;
@@ -903,9 +858,10 @@ static int rga_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void rga_remove(struct platform_device *pdev)
+static void rga_core_unbind(struct device *dev, struct device *master,
+			    void *data)
 {
-	struct rga_core *core = platform_get_drvdata(pdev);
+	struct rga_core *core = dev_get_drvdata(dev);
 	struct rockchip_rga *rga = core->rga;
 
 	v4l2_info(&rga->v4l2_dev, "Removing\n");
@@ -917,6 +873,29 @@ static void rga_remove(struct platform_device *pdev)
 	pm_runtime_disable(core->dev);
 }
 
+static const struct component_ops rga_core_ops = {
+	.bind = rga_core_bind,
+	.unbind = rga_core_unbind,
+};
+
+static int rga_core_probe(struct platform_device *pdev)
+{
+	int ret = 0;
+
+	ret = component_add(&pdev->dev, &rga_core_ops);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to register component: %d", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void rga_core_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &rga_core_ops);
+}
+
 static int __maybe_unused rga_runtime_suspend(struct device *dev)
 {
 	struct rga_core *core = dev_get_drvdata(dev);
@@ -933,7 +912,7 @@ static int __maybe_unused rga_runtime_resume(struct device *dev)
 	return clk_bulk_prepare_enable(core->num_clks, core->clks);
 }
 
-static const struct dev_pm_ops rga_pm = {
+static const struct dev_pm_ops rga_core_pm = {
 	SET_RUNTIME_PM_OPS(rga_runtime_suspend,
 			   rga_runtime_resume, NULL)
 };
@@ -956,17 +935,186 @@ static const struct of_device_id rockchip_rga_match[] = {
 
 MODULE_DEVICE_TABLE(of, rockchip_rga_match);
 
+static struct platform_driver rga_core_pdrv = {
+	.probe = rga_core_probe,
+	.remove = rga_core_remove,
+	.driver = {
+		.name = RGA_NAME "-core",
+		.pm = &rga_core_pm,
+		.of_match_table = rockchip_rga_match,
+	},
+};
+
+static int rga_bind(struct device *dev)
+{
+	int ret;
+
+	ret = component_bind_all(dev, NULL);
+	if (ret) {
+		dev_err(dev, "component bind failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void rga_unbind(struct device *dev)
+{
+	component_unbind_all(dev, NULL);
+}
+
+struct component_master_ops rga_master_ops = {
+	.bind = rga_bind,
+	.unbind = rga_unbind,
+};
+
+static int rga_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *match_desc = pdev->dev.platform_data;
+	struct device *dev = &pdev->dev;
+	struct component_match *match = NULL;
+	struct device_node *core_node;
+
+	if (!match_desc)
+		return dev_err_probe(dev, -ENODEV, "missing platform data\n");
+
+	for_each_compatible_node(core_node, NULL, match_desc->compatible) {
+		if (!of_device_is_available(core_node))
+			continue;
+
+		of_node_get(core_node);
+		component_match_add_release(dev, &match, component_release_of,
+					    component_compare_of, core_node);
+
+		/*
+		 * As multi core is not implemented yet,
+		 * break out of the loop to only have one core per rockchip_rga struct.
+		 * Also put the node, which otherwise would've been done by the loop iteration.
+		 */
+		of_node_put(core_node);
+		break;
+	}
+
+	if (!match)
+		return dev_err_probe(
+			dev, -ENODEV,
+			"no matching available component devices found\n");
+
+	return component_master_add_with_match(dev, &rga_master_ops, match);
+}
+
+static void rga_remove(struct platform_device *pdev)
+{
+	component_master_del(&pdev->dev, &rga_master_ops);
+}
+
 static struct platform_driver rga_pdrv = {
 	.probe = rga_probe,
 	.remove = rga_remove,
 	.driver = {
 		.name = RGA_NAME,
-		.pm = &rga_pm,
-		.of_match_table = rockchip_rga_match,
 	},
 };
 
-module_platform_driver(rga_pdrv);
+static bool rga_of_has_available_node(const char *compat)
+{
+	struct device_node *node;
+
+	for_each_compatible_node(node, NULL, compat) {
+		if (of_device_is_available(node)) {
+			of_node_put(node);
+			return true;
+		}
+	}
+
+	return false;
+}
+
+static int rga_create_platform_device(struct platform_device **ppdev,
+				      const struct of_device_id *match)
+{
+	struct platform_device *pdev;
+	int ret;
+
+	pdev = platform_device_alloc(match->compatible, PLATFORM_DEVID_NONE);
+	if (!pdev)
+		return -ENOMEM;
+
+	ret = platform_device_add_data(pdev, match, sizeof(*match));
+	if (ret)
+		goto free_platform_device;
+
+	ret = platform_device_add(pdev);
+	if (ret)
+		goto free_platform_device;
+
+	ret = device_driver_attach(&rga_pdrv.driver, &pdev->dev);
+	if (ret)
+		goto del_platform_device;
+
+	*ppdev = pdev;
+
+	return 0;
+
+del_platform_device:
+	platform_device_del(pdev);
+free_platform_device:
+	platform_device_put(pdev);
+	return ret;
+}
+
+static struct platform_device *master_pdevs[ARRAY_SIZE(rockchip_rga_match) - 1];
+
+static int __init rga_init(void)
+{
+	int ret;
+	unsigned int i;
+
+	ret = platform_driver_register(&rga_core_pdrv);
+	if (ret != 0)
+		return ret;
+
+	ret = platform_driver_register(&rga_pdrv);
+	if (ret != 0)
+		goto unregister_core_driver;
+
+	for (i = 0; i < ARRAY_SIZE(master_pdevs); i++) {
+		if (!rga_of_has_available_node(
+			    rockchip_rga_match[i].compatible))
+			continue;
+
+		ret = rga_create_platform_device(&master_pdevs[i],
+						 &rockchip_rga_match[i]);
+		if (ret)
+			goto unregister_platform_devices;
+	}
+
+	return 0;
+
+unregister_platform_devices:
+	for (i = 0; i < ARRAY_SIZE(master_pdevs); i++) {
+		platform_device_unregister(master_pdevs[i]);
+		master_pdevs[i] = NULL;
+	}
+	platform_driver_unregister(&rga_pdrv);
+unregister_core_driver:
+	platform_driver_unregister(&rga_core_pdrv);
+	return ret;
+}
+module_init(rga_init);
+
+static void __exit rga_exit(void)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(master_pdevs); i++) {
+		platform_device_unregister(master_pdevs[i]);
+		master_pdevs[i] = NULL;
+	}
+	platform_driver_unregister(&rga_pdrv);
+	platform_driver_unregister(&rga_core_pdrv);
+}
+module_exit(rga_exit);
 
 MODULE_AUTHOR("Jacob Chen <jacob-chen@iotwrt.com>");
 MODULE_DESCRIPTION("Rockchip Raster 2d Graphic Acceleration Unit");

-- 
2.54.0

