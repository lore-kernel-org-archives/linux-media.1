Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794368348;
	b=3W63kqyZtpQodO8FQtaYhGzRUeCMOR8ijB2nS80A5lgZMBm59UyXwI/vBTxrhiE2VnZO
	 Y7n5vJwmAnXJrW5DWPMYfhN0lPEd+P9TGkv0fGySL2tHoH0x/9a0KyWBSgplnCX71jeGM
	 VZvFUZtlr42EAsU44q4vYuTlOdTafnt75LRJ+ZTKLnCOMSU6tAAx0qev6Go/cHoN23kys
	 SGgeKFZhrv4mrBQOFMWKngjP7GlNQh7wJZCsZlPgd/mFBeKXqelzGPRaARNNI2+Tt1sbW
	 AcJb0l44rb0Owgr+K+gQAZQAYfZvMJAUjXNdT80IIYEQdyE+Isi5hyI8U7iaByii3eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=944jZchMGaAJnE6np79N0A63n9fUURmPIWG/mmHOwWY=;
	b=h9CZFQVq7HEtFATYtuljjARVAauabtHb0qGGDbBJVtPs3II76TAjOGQri6ss6qVY/LQD
	 RmSbeCZ940wtKmSJkvKHCHtJk5zrh8pi/iHkZ4zSMPzz043VUD4tvrfad6WA1ZJ/sNDEH
	 G1op8tOvHw6kdgfivaAl2n5EG5NkM5LMj3BpzqGUdww2TE7o3OpGo3hEF/TqLCmETDtkg
	 pCGMeFNhFWeKVLumPJY0fgKNOt2/dBUpK3snBHI99Me57WB8JqmMqT1afo0jImSiF16mx
	 R/YVQqWdiv0w2S0mdJ6l7zbEHKjaUC6INQsBehsh1rQdeKvJ9NUU73uddSJUqpBQw7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hYzmvM9j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155A4606A31C
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 03:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 155A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hYzmvM9j
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-833e671ee9fso2717853a34.0
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 19:39:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794368347; cv=none;
        d=google.com; s=arc-20260327;
        b=dHEvu//zk0UugNbDjX2q6+JGexNbqHAdnJrsYj5tfw1NkL6+YdbscKwAUH9PMJNmAX
         N5EuhleHru2GZmFc9hJeuVwuQxDfxZfFvRxDJy660/mF9QhGgVQV3Vu+8fVvZa+vCy+V
         fr3Orn2PHeVvWBW9PZy41RhcmhyFu05EX9p7aXUcj1wchyHQA2qgb5GPdcz2LVURNlZO
         YDXU9QKnCxxwvmJpoEimBpPWpP6Kqw8csgcVVo+P6rlQTymB26owfe27dsDPi4EsLNxZ
         uuwRSpukBRmSb7hDTYmrsHZQWCJlSfggDOCwXdWX6l/jmX92kBqIz5Kpt3GA2G6BPKth
         7xdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=944jZchMGaAJnE6np79N0A63n9fUURmPIWG/mmHOwWY=;
        fh=qCe65ggUPHSaxFMeEwaPslRggM+x508OBC7MFi2eeaI=;
        b=hQdnPOKyY3JATw/MPktzNSc6arTZrVREG9fDAtmSMlc6Or6B1CP663h0HdX1AaouVX
         RajM1oZMYPRVE3xj615Q9B0zAHCJgh+AL5HkHe1ekbWgioXQR3UjDBe5QA/RGKxFyfyF
         tpXaqXfQ2p9qzrfGzVpunkex8XXaDq1L+eSa6+YaM5DCu0i7CCZ+fQwozd1cHfzvBXyg
         xgKwpcpQ61gXa1gdunEHMkgyzzGiUea2J3sHFrkR/WGSHA29RmE3acYvvnFSTuOHFOtr
         SFtai6r77WIBrtm7kNnl80zfj0PYWr7FqOGVbW4AC4bOkT5UFMuGM0X7qOyP0mo4ed8A
         Dl6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794368347; x=1794973147; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=944jZchMGaAJnE6np79N0A63n9fUURmPIWG/mmHOwWY=;
        b=hYzmvM9jOAk/SArTMgT2lQ3hERs84ATtOossiESfik7gN8SdNvnuPh04BZnxR828aN
         Qdy4ztLkRMMIzhUKU7bIUbJt+tuNAlDKQk/94urVd/xTPqoxCNSipwsWLzno9d88cCIk
         Tqkd2kzc9dZQRofwB2aI6k9j2WP2BcYZ2EPkFz4zfuyOrVV53aKf20kfbpQR8ubRxlKh
         z3bTGGF2/9hH3+WSfi0tUXfLuLkOCbG8sEqz3bIBHp53aO+oJqQW8hFIBmkHgnpI6joZ
         35fDjgj0jqu107fdQMJv/yUClNxQnKLeBKdR7pTf53B9pmXzY5yzLuPUlWF4pRg4rn6K
         wcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368347; x=1794973147;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=944jZchMGaAJnE6np79N0A63n9fUURmPIWG/mmHOwWY=;
        b=oynejr3IqltsgQhMbljxKmNKI9uufF8ctmLJm3Lc96J8aKIiuMUTWWimiunqrmT0Uz
         +7/OpuIpXFAfdkGI2Vs2fGHRmsqEfimCcM3jQsy/u8Xr6haRZ7dZ/XAtSVGlcFkSaQfe
         +S4J1VUt3JSoB/JAH4xnu3QKziaQZdhz3f3B5P+PcdTApVt0tdd85n1tD7GLNFBBV+9g
         fRM80q/ELtu0vlsGwukHlB0DzVUWddLsoWBllqARjqP2UceitFRLgHvAH6Jr2Nk3+s7a
         tgUmsIRrCq5Kv+KO2qWGcDLxnGqCSOOACMr5IbHKSxDGxFNL+8bSXWB4ijjKRCjQZ3o+
         9/zA==
X-Gm-Message-State: APuU4Z9nHSKoEQcaoZgJ/HukE3UYbYF6SepZ9QoHI9Ll0OxVdDbKBiZd
	k3PO7svaI/9+u92mdaxEkF7FveBGMrW3Wlu0yFTEiMj3TFAJUgemaoddnG5+trkSENjf4kSTk73
	o4Wt5N7WZCt5T/KRQ2ZoGjJC6LypSXbX33A==
X-Gm-Gg: AYBFou0cel5Oa3yHfLsQfkG1/+/Ers1Aidhxj39Hxpt4AxqYoTxUxDnu/9vJ0iR5k0r
	NBiapqrOEcYfkUMmEidzk6yqMz2p/zRCuD1XHoGg2GOq7nGsqSck6q8NBihx46VA9uSu5lK1mof
	cxEEWi+OhUaQW+9rgku3LRy7a0y11CfsbKL0wEnFMqSzmhp5qhhB9Utb6p75mGN1UlTMJFhsU6V
	5/PM79XYULNiUHzjlPw0Apn2VAivjDW5evuljnDtg7YRbo0GvLEDx+iHIyJ/ddFNdl0CD4Bgp8h
	nFFg1rIkzZFi63Lf0vUX09yWIizMIS4gtgIG4kfKA/hAvb6X2rtlCqtOU3Z9l3VYJ/2WhAqxubz
	9MO8pwvD8CmcDDVoMJEPlQWKiyTtEfawC13+W81URuS1MNNVknAb6onDb4wbBhKV4s3SeLwrL9T
	mfcyJUziAMhxI=
X-Received: by 2002:a05:6808:11cb:b0:4b5:5bfb:f25d with SMTP id
 5614622812f47-56b968c6cfamr1072165b6e.20.1794368346890; Tue, 10 Nov 2026
 19:39:06 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 11 Nov 2026 04:39:06 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: getfeus@gmail.com
Date: Wed, 11 Nov 2026 04:39:06 +0100
X-Gm-Features: AclHuK_nBfLd4AwlFZDeXlHPJK6CbTuIvbFXdfuEBye_wtDsEX-osUjZ1YebQoM
Message-ID: <CA+m4KrCAtrxGcy74ieBOibgsGwWW=+gQzUUJVcdY0H2xcqGMvg@mail.gmail.com>
Subject: [RFC PATCH] media: mediatek: mdp: Keep component suppliers powered
 while streaming
To: minghsiu.tsai@mediatek.com, houlong.wei@mediatek.com, 
	andrew-ct.chen@mediatek.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Following up on my earlier report ("MT8173 legacy MDP: PROCESS_ACK
status 0 but CAPTURE remains unchanged"), I dug into the runtime-PM
dependencies on an MT8173 Elm Chromebook.

The legacy MDP driver manages the clocks for its sibling blocks
directly from the RDMA0 master, but it does not establish runtime-PM
dependencies from the master to those devices. As a result, their
suppliers are not all kept active during processing. In particular,
LARB4 stays suspended.

In the failing case, the firmware reports success and both buffers
complete, yet the CAPTURE planes remain untouched, matching the
pre-queue canary. Keeping LARB4 active before the first job changes
the output to a byte-exact copy.

The proposed fix binds the sibling blocks as components and adds
runtime-PM device links from the master to them. Their existing
IOMMU/LARB supplier links then propagate the required PM references.
Engine clock handling stays in the master, and the M2M device is
registered only after all required components have bound. The existing
fallback path for legacy child-node DTs is retained.

I also reproduced an IOMMU read fault on LARB4 port 4 (MDP_RDMA1)
after closing a failed job and unmapping its buffers. Tracing
associated the reported fault page with that job's input Y allocation.
No second PROCESS command was submitted before the fault was reported
during the subsequent LARB4 reactivation sequence.

The patch fixes the missing PM dependencies. All ten conversion tests
passed with pixel-exact output and no IOMMU faults, without manually
forcing LARB4 on.

Tested on Elm (next-20261105-based kernel, VPU firmware v1.2.0):

- Seven NV12M 640x360 copy jobs produced byte-exact Y/UV output.
- Three saved MT21C 640x384 to YUV420M 640x360 conversions matched the
software-decoded reference across all visible Y/U/V samples.
- Testing covered both temporary module loading and loading the
candidate during boot.
- LARB4 remained under the "auto" PM policy, became active during
streaming, and suspended again after streaming stopped.
- Three STREAMON-without-buffers checks returned the expected EINVAL,
with no additional PROCESS commands or observed PM cleanup failures.
- The PM changes apply and build cleanly against next-20261105 without
the diagnostic instrumentation.

The diff below is based on current linux-next (793807ca13bf). Compared
with the tested next-20261105 files, the only intervening changes in
these files are two devm_kzalloc_obj() substitutions. Those upstream
changes are retained; the proposed PM changes are unchanged.

System suspend/resume, other boards, legacy child-node DTs, and
probe/allocation error-injection paths have not been tested.

Does this look like the right way to model the runtime-PM dependencies
for the legacy MDP components? I'd especially appreciate feedback on
the device-link lifetime and component bind/unbind ordering.

I have the userspace reproducer, deterministic test pattern generator,
and ftrace logs available if useful.

Thanks,
Youngjoon Lee

Signed-off-by: Youngjoon Lee <getfeus@gmail.com>
---
 drivers/media/platform/mediatek/mdp/Makefile       |  1 +
 drivers/media/platform/mediatek/mdp/mtk_mdp_comp.h |  1 +
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 91 +++++++++++++++++++---
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.h |  2 +
 drivers/media/platform/mediatek/mdp/mtk_mdp_pm.c   | 81 +++++++++++++++++++
 5 files changed, 165 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/Makefile
b/drivers/media/platform/mediatek/mdp/Makefile
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
diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.h
b/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.h
index ae41dd3..c9098d8 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_comp.h
@@ -42,5 +42,6 @@ void mtk_mdp_comp_deinit(struct device *dev, struct
mtk_mdp_comp *comp);
 void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp);
 void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp);

+extern struct platform_driver mtk_mdp_pm_component_driver;

 #endif /* __MTK_MDP_COMP_H__ */
diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index c065cde..23bcaa8 100644
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

 	mdp = devm_kzalloc_obj(dev, *mdp);
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
diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.h
b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.h
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
diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_pm.c
b/drivers/media/platform/mediatek/mdp/mtk_mdp_pm.c
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
+static int mtk_mdp_pm_bind(struct device *dev, struct device *master,
void *data)
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
