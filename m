Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794379305;
	b=Qei0Eo1k8rXW4m5pobvceS6FWaVkm9hfJKbhVABWZUb6Z5IQNfdzGspXuyPfYBbOnkFK
	 ICbhxZMyHWInD8NHNI55+JMMOAFGUAuroEXiucKh52Zldjlui4m5O52t6z3vrccbpleaj
	 upymHxCS62MwUWfj+bbGDj73J9e384QMTonZ7VxLs31fwaqsRYpMI8dHf7pebs7W8Ydv6
	 VYSWZV99a1g3uDAKNuRoe3zQBHkWImv+tt4IRGQAPUHZSyS+dUvYAtYgMd5QOtBDWIXI/
	 +VesyIpkaSXJShsAOdze1l4CU4LlAG27eEFjvhPwPwQqKFvWG3y3v4yMkPMBmqZTbrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379305;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:In-Reply-To:
	 References:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=GCzd4pkqf9qNrfLh6SvmrgzLO4l76wGqI6eEmCr+tWQ=;
	b=zFT1n7zA8vSvwv4QEFjAiZlP+W8DRB0iakCrHMANINHA0DZffKIgLoeVClHjLUgAaqwS
	 tw/kgNHbMX35oJAtydkqclzCicKRZPn8ueo8SGI5Bjh/+SJlWKAloumeovsI9P98qDg86
	 mzLvEL/iHJTnBskj48WJHv93GRl7laiOS3a9uQi+rffLtvfExQ8CQKaXvWYpTgXhIpJsP
	 PyXlQATCGLpeYkmictG50qW/R/CzNrEivWvY4kWD84s/BnLW/yK86CRrzz+ppE2QxNoFg
	 iI+S0GhGeTTjKIHOPFWV9TomEPCirNGCvJu8scxcSmA1v1FcjGuYt9relJxRMFYvlKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q5vPTCuk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9517606A31C
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 06:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q5vPTCuk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794379305;
	b=Lc3Z+n/0EM/Xd/tOMeqM5RBMr6yLnmYped58/D4jQcgE6DtsNiqyKTzTrt7PIhFkPMIc
	 dVJfSKFgvJs6eNEfOxqmKN9kzXQuIYtwkWwcIgqrDlY7CLC5rBMc4Pisn0so9eT6AfGA0
	 6jKDZwSKQsSUwE/hoKGyrZHp8A/NUjB1crulT3wjXbC50/mc1RnkkR6L1WOAKPMqsEYst
	 J9UUa7Y3hadt1ww1NyRe3vTboIik2rlsVFbvsRDW2VRiqB07DpxkI1hdWeWjumATRbEJZ
	 2bka0vvkZSuAT71YLa0BY1hXMw9TskKei9FSEE+F0rXQOTuIiMQs2f/1x4SYbwEsmGQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794379305;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:In-Reply-To:References:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GCzd4pkqf9qNrfLh6SvmrgzLO4l76wGqI6eEmCr+tWQ=;
	b=2QiqCcheAaoepLimhFzNMVwva8aWeo9rzZC8HoOoqbs4fubCpZdwv1mgH/z8j3amA0VD
	 xP9xkYVsotgsAv96lrG4PZIF7nT03Hv2x61BJviwhe/jF/8szjI9OLo2wyDNiFdX5UEJj
	 RPlOAz1uZ0/Fn5sCBQRcfRz2wG25jbMcGpu9M1GCUVnqDxVl/bsnYZoZJkNzBPvuTAidE
	 j5csnEW7yBvLyW0p/C5eiutzB0Wvz2B/y6B3DfvLuwBtRuBmivHDc+Ub7TMdNTIYsg/KP
	 0j3LYneP6V5lo33shuS48Sw+uckQ9wCUtWLbpkHlC57Hmss3wh2FD4UoIBspsrlqZIQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A844E1F00A05;
	Wed, 11 Nov 2026 06:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794379305;
	bh=GCzd4pkqf9qNrfLh6SvmrgzLO4l76wGqI6eEmCr+tWQ=;
	h=From:Date:Subject:In-Reply-To:References:To:Cc:Reply-To;
	b=Q5vPTCukdUNgVqwd2FYmg/Cv3qv8I+BASQTIvz7DcYtQNGQMAGcT4aLxKKGoLzSq2
	 yzM5T8ijq8xJ/mIDMU3NgtRSTfDXF1ztMNW1MupOlipHWuTMuII65V8jv8wmQ8c4JF
	 7k+XFZ0Yk/ZFZZ3dek2ypsNvs1DMECvyyAFtDQ47er+7U6M2oZxotu+1tV0s3PCtbR
	 EHbpiotYysTySprvSTfk+3++1AdfFaFHhfw2BPet1Ns0x2/iC1mNStbBU1Q3K/HfIp
	 yN8nMlCLKFFayMIBnYluXbtA+8HqL3t4ZFxIDz8efyDdbp9I1GeP3bmgOXE+l7/pzT
	 XST0EUdD37NHQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 266CE48E16;
	Wed, 11 Nov 2026 06:41:44 +0000 (UTC)
From: Youngjoon Lee via B4 Relay <devnull+getfeus.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 06:41:43 +0000
Subject: [PATCH RFC v2] media: mediatek: mdp: Keep component suppliers
 powered while streaming
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-rfc-v2-generated-v2-1-6241cb149b87@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWO3UrDQBCFX6XMbV1t1/iDIFgDRhQRhVpEerE7O
 9mMmI3OrjG15N1N4lwcOGfOfMweIglThIvZHoRajtyEweiDGWBlgifFbvCgF/p0OYySElWrlad
 AYhI55VxGJ1jSuT22MJx9CpXcTcg3eL7JYfsfxm/7TphG2FizJpKyYgJWY9QIew5Hgbo0biuOq
 ZHd9Fa7nFD5al5n95KvknQF7s4yputHtj4WP5vN5dw//a7Xdy/oXhe3usOv4qH1V7Xhj0M/KTY
 1bPu+/wP/eXHr8gAAAA==
X-Change-ID: 20261111-rfc-v2-generated-dd4e5cfe8b3b
In-Reply-To: <CA+m4KrCAtrxGcy74ieBOibgsGwWW=+gQzUUJVcdY0H2xcqGMvg@mail.gmail.com>
References: <CA+m4KrCAtrxGcy74ieBOibgsGwWW=+gQzUUJVcdY0H2xcqGMvg@mail.gmail.com>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Youngjoon Lee <getfeus@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794379303; l=12733;
 i=getfeus@gmail.com; s=elm-mdp-20261111; h=from:subject:message-id;
 bh=HVVk9XrFq+ZMeMAHrhWKn2W/A3R+w3xsLcv/eXIBCG8=;
 b=6NoeZ9LTJSPKNt5dbu1FQ0LqTF+FWl9L/o5+l7I29Mhuz4SQ2B3l2lorY8mxJVui97eKtr1F6
 /IhEW49X9VQAbGiSrPyJj9wn+kmmrGr48ubmnfM1KefbsuqvOuSw/ib
X-Developer-Key: i=getfeus@gmail.com; a=ed25519;
 pk=iwmFJiP4Cnab7RsbW72VEvnNztIotoa8+gIMROvIMfk=
X-Endpoint-Received: by B4 Relay for getfeus@gmail.com/elm-mdp-20261111
 with auth_id=1487
X-Original-From: Youngjoon Lee <getfeus@gmail.com>
Reply-To: getfeus@gmail.com
Content-Transfer-Encoding: 7bit

From: Youngjoon Lee <getfeus@gmail.com>

Sibling clocks are enabled without keeping their PM suppliers active.

On MT8173 Elm, LARB4 stays suspended and CAPTURE memory is unchanged.
The firmware reports success despite the unchanged CAPTURE buffers.

Bind sibling blocks and add runtime-PM links from the RDMA0 master.
Retain master clock handling and the legacy child-node DT fallback.

Signed-off-by: Youngjoon Lee <getfeus@gmail.com>
---
Hi,

This v2 is based on media-committers.git next (bf6c63ecc20a). The PM changes are unchanged from v1. The five resulting driver files are byte-for-byte identical to the clean candidate tested on Elm.

The archived v1 copy had reflowed diff headers, and its linux-next context also included two allocator-helper changes that are not yet in the media tree. This revision uses the media baseline and the b4 web submission endpoint. Local b4 shazam checks pass against both the bot's next and fixes commits.

The original failure returned successful firmware status and completed buffers while CAPTURE memory stayed unchanged. Binding the sibling components and linking their runtime PM to the master makes their IOMMU/LARB supplier dependencies follow streaming. Engine clock handling remains in the master.

While investigating, I also reproduced an RDMA1 IOMMU read fault associated with the previous job's unmapped input Y page, without a second PROCESS command. The patched tests below completed without IOMMU faults; I am not claiming to have observed the firmware's internal DMA completion timing.

Tested on Elm, next-20261105-based kernel, VPU firmware v1.2.0:
- Seven NV12M 640x360 copy jobs: byte-exact Y/UV output.
- Three saved MT21C 640x384 to YUV420M 640x360 jobs: every visible Y/U/V sample matched the software-decoded reference.
- Both temporary module loading and candidate loading during boot.
- LARB4 used the auto PM policy, woke during streaming, and suspended after streaming stopped.
- Three STREAMON-without-buffers checks: expected EINVAL, no extra PROCESS commands or observed PM cleanup failures.
- Clean module build without diagnostic hooks.

System suspend/resume, other boards, legacy child-node DTs, and probe/allocation failure injection remain untested.

Changes in v2:
- Rebase onto the media next tree; retain its allocator call context.
- Preserve diff formatting through the b4 submission path.
- Verify email extraction and application with b4 on both media branches.
- No PM logic changes.

I'd appreciate feedback on the runtime-PM device-link lifetime and component bind/unbind ordering. I have the reproducer, deterministic input, and ftrace logs available if useful.

Thanks,
Youngjoon Lee
---
 drivers/media/platform/mediatek/mdp/Makefile       |  1 +
 drivers/media/platform/mediatek/mdp/mtk_mdp_comp.h |  1 +
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 91 +++++++++++++++++++---
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.h |  2 +
 drivers/media/platform/mediatek/mdp/mtk_mdp_pm.c   | 81 +++++++++++++++++++
 5 files changed, 165 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/Makefile b/drivers/media/platform/mediatek/mdp/Makefile
index b7c16eb..c3f3a74 100644
--- a/drivers/media/platform/mediatek/mdp/Makefile
+++ b/drivers/media/platform/mediatek/mdp/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 mtk-mdp-y += mtk_mdp_core.o
+mtk-mdp-y += mtk_mdp_pm.o
 mtk-mdp-y += mtk_mdp_comp.o
 mtk-mdp-y += mtk_mdp_m2m.o
 mtk-mdp-y += mtk_mdp_regs.o
diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.h b/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.h
index ae41dd3..c9098d8 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.h
@@ -42,5 +42,6 @@ void mtk_mdp_comp_deinit(struct device *dev, struct mtk_mdp_comp *comp);
 void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp);
 void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp);
 
+extern struct platform_driver mtk_mdp_pm_component_driver;
 
 #endif /* __MTK_MDP_COMP_H__ */
diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index 8432833..7d68ee5 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/component.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/interrupt.h>
@@ -102,12 +103,50 @@ void mtk_mdp_unregister_component(struct mtk_mdp_dev *mdp,
 	list_del(&comp->node);
 }
 
+static int mtk_mdp_compare_component(struct device *dev, void *data)
+{
+	return dev->of_node == data;
+}
+
+static void mtk_mdp_release_component(struct device *dev, void *data)
+{
+	of_node_put(data);
+}
+
+static int mtk_mdp_master_bind(struct device *dev)
+{
+	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
+	int ret;
+
+	ret = component_bind_all(dev, mdp);
+	if (ret)
+		return ret;
+	ret = mtk_mdp_register_m2m_device(mdp);
+	if (ret)
+		component_unbind_all(dev, mdp);
+	return ret;
+}
+
+static void mtk_mdp_master_unbind(struct device *dev)
+{
+	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
+
+	mtk_mdp_unregister_m2m_device(mdp);
+	component_unbind_all(dev, mdp);
+}
+
+static const struct component_master_ops mtk_mdp_master_ops = {
+	.bind = mtk_mdp_master_bind,
+	.unbind = mtk_mdp_master_unbind,
+};
+
 static int mtk_mdp_probe(struct platform_device *pdev)
 {
 	struct mtk_mdp_dev *mdp;
 	struct device *dev = &pdev->dev;
 	struct device_node *node, *parent;
 	struct mtk_mdp_comp *comp, *comp_temp;
+	struct component_match *match = NULL;
 	int ret = 0;
 
 	mdp = devm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
@@ -132,6 +171,8 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 		parent = dev->of_node->parent;
 	}
 
+	mdp->use_components = parent != dev->of_node;
+
 	/* Iterate over sibling MDP function blocks */
 	for_each_child_of_node(parent, node) {
 		const struct of_device_id *of_id;
@@ -163,6 +204,11 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 		}
 
 		mtk_mdp_register_component(mdp, comp);
+		if (mdp->use_components && node != dev->of_node)
+			component_match_add_release(dev, &match,
+						    mtk_mdp_release_component,
+						    mtk_mdp_compare_component,
+						    of_node_get(node));
 	}
 
 	mdp->job_wq = create_singlethread_workqueue(MTK_MDP_MODULE_NAME);
@@ -187,12 +233,6 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 		goto err_dev_register;
 	}
 
-	ret = mtk_mdp_register_m2m_device(mdp);
-	if (ret) {
-		v4l2_err(&mdp->v4l2_dev, "Failed to init mem2mem device\n");
-		goto err_m2m_register;
-	}
-
 	mdp->vpu_dev = vpu_get_plat_device(pdev);
 	if (!mdp->vpu_dev) {
 		dev_err(&pdev->dev, "Failed to get vpu device\n");
@@ -216,17 +256,25 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	}
 
 	pm_runtime_enable(dev);
+	if (mdp->use_components)
+		ret = component_master_add_with_match(dev, &mtk_mdp_master_ops,
+						      match);
+	else
+		ret = mtk_mdp_register_m2m_device(mdp);
+	if (ret)
+		goto err_register_components;
 	dev_dbg(dev, "mdp-%d registered successfully\n", mdp->id);
 
 	return 0;
 
+err_register_components:
+	pm_runtime_disable(dev);
+	vb2_dma_contig_clear_max_seg_size(dev);
+
 err_reg_handler:
 	platform_device_put(mdp->vpu_dev);
 
 err_vpu_get_dev:
-	mtk_mdp_unregister_m2m_device(mdp);
-
-err_m2m_register:
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
 err_dev_register:
@@ -252,10 +300,13 @@ static void mtk_mdp_remove(struct platform_device *pdev)
 	struct mtk_mdp_dev *mdp = platform_get_drvdata(pdev);
 	struct mtk_mdp_comp *comp, *comp_temp;
 
+	if (mdp->use_components)
+		component_master_del(&pdev->dev, &mtk_mdp_master_ops);
+	else
+		mtk_mdp_unregister_m2m_device(mdp);
 	pm_runtime_disable(&pdev->dev);
 	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
 	platform_device_put(mdp->vpu_dev);
-	mtk_mdp_unregister_m2m_device(mdp);
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
 	destroy_workqueue(mdp->wdt_wq);
@@ -319,7 +370,25 @@ static struct platform_driver mtk_mdp_driver = {
 	}
 };
 
-module_platform_driver(mtk_mdp_driver);
+static struct platform_driver * const mtk_mdp_drivers[] = {
+	&mtk_mdp_pm_component_driver,
+	&mtk_mdp_driver,
+};
+
+static int __init mtk_mdp_init(void)
+{
+	return platform_register_drivers(mtk_mdp_drivers,
+					 ARRAY_SIZE(mtk_mdp_drivers));
+}
+
+static void __exit mtk_mdp_exit(void)
+{
+	platform_unregister_drivers(mtk_mdp_drivers,
+				    ARRAY_SIZE(mtk_mdp_drivers));
+}
+
+module_init(mtk_mdp_init);
+module_exit(mtk_mdp_exit);
 
 MODULE_AUTHOR("Houlong Wei <houlong.wei@mediatek.com>");
 MODULE_DESCRIPTION("Mediatek image processor driver");
diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.h b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.h
index a6e6dc3..c9004e4 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.h
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.h
@@ -133,6 +133,7 @@ struct mtk_mdp_variant {
  * struct mtk_mdp_dev - abstraction for image processor entity
  * @lock:	the mutex protecting this data structure
  * @vpulock:	the mutex protecting the communication with VPU
+ * @use_components: use sibling component PM supplier links
  * @pdev:	pointer to the image processor platform device
  * @variant:	the IP variant information
  * @id:		image processor device index (0..MTK_MDP_MAX_DEVS)
@@ -152,6 +153,7 @@ struct mtk_mdp_dev {
 	struct mutex			lock;
 	struct mutex			vpulock;
 	struct platform_device		*pdev;
+	bool				use_components;
 	struct mtk_mdp_variant		*variant;
 	u16				id;
 	struct list_head		comp_list;
diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_pm.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_pm.c
new file mode 100644
index 0000000..a984f23
--- /dev/null
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_pm.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Keep the DMA component suppliers powered for the master runtime lifetime. */
+#include <linux/component.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+
+struct mtk_mdp_pm_component {
+	struct device_link *link;
+};
+
+static int mtk_mdp_pm_bind(struct device *dev, struct device *master, void *data)
+{
+	struct mtk_mdp_pm_component *comp = dev_get_drvdata(dev);
+
+	/* The component already has its IOMMU/LARB runtime-PM supplier link. */
+	comp->link = device_link_add(master, dev,
+				     DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
+	return comp->link ? 0 : -ENOMEM;
+}
+
+static void mtk_mdp_pm_unbind(struct device *dev, struct device *master,
+			      void *data)
+{
+	struct mtk_mdp_pm_component *comp = dev_get_drvdata(dev);
+
+	device_link_del(comp->link);
+	comp->link = NULL;
+}
+
+static const struct component_ops mtk_mdp_pm_component_ops = {
+	.bind = mtk_mdp_pm_bind,
+	.unbind = mtk_mdp_pm_unbind,
+};
+
+static int mtk_mdp_pm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_mdp_pm_component *comp;
+	int ret;
+
+	/* RDMA0 is the master; it must not become its own supplier. */
+	if (of_property_present(dev->of_node, "mediatek,vpu"))
+		return -ENODEV;
+	comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
+	if (!comp)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, comp);
+	pm_runtime_enable(dev);
+	ret = component_add(dev, &mtk_mdp_pm_component_ops);
+	if (ret)
+		pm_runtime_disable(dev);
+	return ret;
+}
+
+static void mtk_mdp_pm_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_mdp_pm_component_ops);
+	pm_runtime_disable(&pdev->dev);
+}
+
+static const struct of_device_id mtk_mdp_pm_of_match[] = {
+	{ .compatible = "mediatek,mt8173-mdp-rdma" },
+	{ .compatible = "mediatek,mt8173-mdp-rsz" },
+	{ .compatible = "mediatek,mt8173-mdp-wdma" },
+	{ .compatible = "mediatek,mt8173-mdp-wrot" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mtk_mdp_pm_of_match);
+
+struct platform_driver mtk_mdp_pm_component_driver = {
+	.probe = mtk_mdp_pm_probe,
+	.remove = mtk_mdp_pm_remove,
+	.driver = {
+		.name = "mtk-mdp-pm-component",
+		.of_match_table = mtk_mdp_pm_of_match,
+	},
+};

---
base-commit: bf6c63ecc20a54aaac7a2fcbd6adaf6498388825
change-id: 20261111-rfc-v2-generated-dd4e5cfe8b3b

Best regards,
--  
Youngjoon Lee <getfeus@gmail.com>


