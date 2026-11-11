Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794390238;
	b=SzHTHL2HDW9Drw8stn3769xM7roz0zdIQxJb5AJy1WIsBni2Kr1KnT0PLiYlv9sIuiWd
	 9WJvhEXdrWTK0K2U5PJLAELlmB6PDMscwAhQxRGFqAITCCfWhVdN8vcD7x+B4dKjlgnhU
	 VUsm4RZRhZ0gztxnQvs699umiPIBGaF4SMSSTc6PMl59Rhz1Qb3vS2PtEj1ylSgvAmPqt
	 QOnHhHlfz3Hlyys76p/b8igwHwDi5uy+eSuzYVXvo32uVcwlUlbkz/O/nYMk9RaqrDCg+
	 V+POZiMGLcekS2t/e2vuJBBpIIIwx1j20xP8stLSMExAAbnOObWQV37N74//iJa4POw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390238;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:In-Reply-To:
	 References:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=/cy7cSZ32EHns+IuTbgYDHDLBcw9XfhnENy1DHo5Ltw=;
	b=4UcmTx1LykUaPdPS4K3h1Wt0vg4rACBE11VsYxP74n9AaUUQCtOq/U8TMGLGUpQs0wZk
	 3PFOMKRyXHV/jGIjVcpcPfpyWmE78e7x4W/6Ovrqoqm9RkjU48q+i2pQKH7Hh2sn7Jd+N
	 an6hS2azU63RLAE4UWI9nZ8q3EDkDattHlEAtU1EXkB82UcQO/gSlO9H3yPBY1BTjywL+
	 2CNBcWSb4NC5sC0Elu2hObpDYcCp6aklOPnscRGXGbG225KyuVV02KYSXAXDp8tVnVIbQ
	 EyeiPN5qqqMZqaIw8H7Bqx9kb/ru8t3AtKOHvE/w+1fs1ANA87oBeALTcO8OCh0pzQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CovMnqkK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84684606A330
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 09:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CovMnqkK
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794390238;
	b=jiYZ4OwZZv2/q3Veu/FsgjLQvl9delPea3ngfvnuNMVPGZkOs8eG/INbVzMXgjQzrLbL
	 KAyDZbQ/T/z+JN45aJ3yHSNcGu9VZMtwpy1X8V8ivi/5As/hQeLINZrR3P0nn1IckdNZ0
	 dhZ2cYNj1wFNix1NbSu8xEipnRjQ6aKKFNHkdfBX8Ph4vysTmyGa71vrZuDHaTqR0oeHd
	 0If9Tlu39qAM26bWPs6Aicb4MrtMCLhVlCy+dUdwA7GVhFH6N8obJTihX/fTFnX5THYhA
	 /XseySfd6CQrevBKcM+NddT9r7Rg1ReBUpC4Yze4RyTXaJ0wCfDC3aU3NAzoM+HRehQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794390238;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:In-Reply-To:References:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/cy7cSZ32EHns+IuTbgYDHDLBcw9XfhnENy1DHo5Ltw=;
	b=PzKQtNqOlsNydZsQmMXbIy+mHzw5rmOwTTOaKKhTMeEP3SisiouxippxhmhVQKtK36N1
	 iEiT1E+yNrDE9Am8A9iwICylirsjcekOZCScsCmJnLKd4PKHku/yax4I59BiF8NaN8+Dh
	 VPpUnZwa5kYO8gNZ+eLktq5MS0mNd1dfHs7ao31vB4Y3jPqb10rF3Jt0mL4P7NbOH5RYD
	 dwmwKr+9OE9O3twgfvvfXoM5brLP4sSJQZc1T4vD/p0bFHUrPM2m3mAuKXUWTpYXzFeZY
	 eNo0lXMP3XmHH2rkE/UOVunXX+NQ3yyU2MqXMVCuuRHwKOgyIlSmmx/OkvQ6oWzPekA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30B371F00A06;
	Wed, 11 Nov 2026 09:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794390238;
	bh=/cy7cSZ32EHns+IuTbgYDHDLBcw9XfhnENy1DHo5Ltw=;
	h=From:Date:Subject:In-Reply-To:References:To:Cc:Reply-To;
	b=CovMnqkKmf4BRGPhiAmD21+87euAB8hsUMk4MlEiIjotRPuq6PMcuSXAuQdZ8SUfK
	 Ob9EY+mSEk5qkcd4WPo+0iYklxfGspKCwrF9FHFX6uJ/nTQQ6n5OzshEImxrh23VLo
	 iOPVCRUnj8CfchbOLFCC6CAaNujZwrc2I43ulf32E79tgCt/W6Gff7i4aTnG+yv/pX
	 q6U6OOi6LnAbW3yC9ip0ub/t1xTiyTwsYdxvVBh7kHxc/2C8hSOZ8fLMHfDzi+NfpV
	 yUAjrv6ATBN6Jburdt+Q979tUgxpYoVVf1tPClPySeUuYq/zmuWtPXvH6lSmUbEFFO
	 CuIHUy057JKCg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A72FC48F15;
	Wed, 11 Nov 2026 09:43:56 +0000 (UTC)
From: Youngjoon Lee via B4 Relay <devnull+getfeus.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 09:43:55 +0000
Subject: [PATCH RFC v3] media: mediatek: mdp: Keep component suppliers
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
Message-Id: <20261111-rfc-v2-generated-v3-1-e49697d20806@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WPW0sDMRCF/0rJa41209iLILQuuKKIWKiliA+5z
 GZH3Kwma9xa9r+bjS++OA8D58zMx5kj8eAQPLkYHYmDgB4bG8X0ZERUJawBijpqwiZslsWirlQ
 0MGrAghMtaKo1h3NVwkJOJYln7w5K7BLymWyuc/Lya/pP+QqqHWDDmhQeqHTCqmqwGocG7ZmFr
 h2mFfq2cYcUK2QJla/HNb9z+bp1XaEOc45w9YDS+OJrt7scm8fv7fb2Sen95IZ16qO4D2ZVC3w
 7Namrpk5JAku0//+JIqMzxjMlM76Ui/nqD6Dv+x/Fn61mMwEAAA==
X-Change-ID: 20261111-rfc-v2-generated-dd4e5cfe8b3b
In-Reply-To: <20261111-rfc-v2-generated-v2-1-6241cb149b87@gmail.com>
References: <20261111-rfc-v2-generated-v2-1-6241cb149b87@gmail.com>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Xiandong Wang <Xiandong.Wang@mediatek.com>, linux-media@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Youngjoon Lee <getfeus@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794390235; l=13442;
 i=getfeus@gmail.com; s=elm-mdp-20261111; h=from:subject:message-id;
 bh=iK9tkXQ3Bb5A9Vb9Ve36Ob4nzgAfSPnbksKC0uRkcA0=;
 b=8IvPWteLQB65kWjN85CeyX0RNT1SqO411ykptmyKuv57e5Dq7g+//QeflCLE9hWC5IjesvzbU
 eg6VOxXr+qtDUexfTQ+ynE4xLL+O5HSIkspBE0xWQfIxHQ9KfyA3tAC
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

Handle match allocation errors before registering the master.
Release the unconsumed node reference and reject empty match lists.

Suggested-by: Xiandong Wang <Xiandong.Wang@mediatek.com>
Signed-off-by: Youngjoon Lee <getfeus@gmail.com>
---
Hi Xiandong,

Thanks for catching both error paths. I added the IS_ERR(match) check immediately after each component_match_add_release() call, release the unconsumed match-node reference and the loop reference on failure, and propagate PTR_ERR(match) through err_comp. I also reject an empty sibling match list with -ENODEV before creating the workqueues or registering the master.

I tested the revised code on Elm. A separate test-only module injected ERR_PTR(-ENOMEM) at each of the seven sibling match-add call positions. All seven cases returned -ENOMEM, cleaned every registered component, and restored the actual kref counts of all eight MDP OF nodes to their pre-probe values. The framework released the previously accepted match entries; the failed entry and loop references were released by the new error path.

Two more probe tests omitted the sibling matches, and then all matching blocks. Both returned -ENODEV before master registration and left no M2M node. The same eight OF-node reference counts were unchanged after cleanup.

These were deterministic API-boundary error-pointer injections in an isolated test module. CONFIG_FAULT_INJECTION is disabled in this kernel, so they were not failslab or real system-wide OOM tests. None of the injection hooks are in the submitted patch.

Normal regression with the revised diagnostic module also passed: three NV12M 640x360 copies were byte-exact, one saved MT21C 640x384 to YUV420M 640x360 conversion matched every visible software-reference Y/U/V sample, and one STREAMON-without-buffers check returned the expected EINVAL. No IOMMU faults were observed. LARB4 remained on auto, woke during streaming, and suspended afterward.

Clean and diagnostic module builds passed without compiler warnings or errors. The review-only incremental patch passed strict checkpatch. System suspend/resume, other boards and real legacy child-node DT hardware remain untested.

Changes in v3:
- Handle component-match allocation errors and release both outstanding node references.
- Reject an empty match list when sibling components are required.
- Add Suggested-by credit for Xiandong Wang.
- Test all seven match-add failure positions, two empty-list cases, and the normal conversion path.

The runtime-PM supplier-link approach and engine clock ownership are otherwise unchanged. I used the media next baseline (bf6c63ecc20a), as in v2.

Thanks,
Youngjoon Lee
---
 drivers/media/platform/mediatek/mdp/Makefile       |   1 +
 drivers/media/platform/mediatek/mdp/mtk_mdp_comp.h |   1 +
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 106 ++++++++++++++++++---
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.h |   2 +
 drivers/media/platform/mediatek/mdp/mtk_mdp_pm.c   |  81 ++++++++++++++++
 5 files changed, 180 insertions(+), 11 deletions(-)

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
index 8432833..8a8632d 100644
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
@@ -163,6 +204,26 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 		}
 
 		mtk_mdp_register_component(mdp, comp);
+		if (mdp->use_components && node != dev->of_node) {
+			struct device_node *match_node = of_node_get(node);
+
+			component_match_add_release(dev, &match,
+						    mtk_mdp_release_component,
+						    mtk_mdp_compare_component,
+						    match_node);
+			if (IS_ERR(match)) {
+				ret = PTR_ERR(match);
+				/* The failed entry did not consume this reference. */
+				of_node_put(match_node);
+				of_node_put(node);
+				goto err_comp;
+			}
+		}
+	}
+
+	if (mdp->use_components && !match) {
+		ret = -ENODEV;
+		goto err_comp;
 	}
 
 	mdp->job_wq = create_singlethread_workqueue(MTK_MDP_MODULE_NAME);
@@ -187,12 +248,6 @@ static int mtk_mdp_probe(struct platform_device *pdev)
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
@@ -216,17 +271,25 @@ static int mtk_mdp_probe(struct platform_device *pdev)
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
@@ -252,10 +315,13 @@ static void mtk_mdp_remove(struct platform_device *pdev)
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
@@ -319,7 +385,25 @@ static struct platform_driver mtk_mdp_driver = {
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


