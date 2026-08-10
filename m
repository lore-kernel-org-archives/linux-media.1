Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D8F41F5F5;
	Mon, 10 Aug 2026 15:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375354; cv=none; b=UK6rXvZsHWjIdheFaWSVfabYxeyLICFweOtku1rEsMtk9ap9HqiBRw5Khyhg31R+bICCw108KZyn9R3VyF2M02Dv7IDi52GhqYqzSxpYwKrfAfaQ+GycWNU6icHyRA/bmjbbW6wNDEUL53SEYunMAlr7L6REGpOEL3AXSi0JYUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375354; c=relaxed/simple;
	bh=cszoaVjwiWPkOJRXCl88yPw8VTJ9RaZ3SgXce/rSJ/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oiOTbG4GAiaFULbkC2al261ouQZuBDmA+WoNL7mfHGEClrzHX3qMHYjqw3+9lxVwwOyoE3F9vAFp61wGTXNWIg3ZJ/lTwAh94ipu73J9lRD5GK6HUHEwnJXv0kQA66YFGOSfYu3C4cauMmhk1Rq7hEm7jvZsfjFBEsKOJtai4is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VDETZCyP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VDETZCyP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786375350;
	bh=cszoaVjwiWPkOJRXCl88yPw8VTJ9RaZ3SgXce/rSJ/U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VDETZCyPHbe8B2zGlsAUwHlEVp9+Cey/AYndat5DsIXDeSvraiDQBSa7IUZaSKAAJ
	 6nS/kCx+ur9ReBTEHMhdQlVA84aV8n+/0fHmezIN7l+MnJxeL9XOxGxvM4N+OUBt9o
	 StRItddDPYSSuRlAZw+EXSq2HpI/MmOVgjmo6vn9TyZTUr3ID/j15dTZM22aXHp/wG
	 uyIJzyS3kszuC0/Dr0t+pYuIe/f2o34QXNzbF2S5RPSi4jQD5ial7EGdg3OHiAdhJ1
	 lqGrzK9gb2DMmvqJgOHN6zm4q1SeaeezPBcNK8SxPXRaimWoT+/72y1//G/W+ynRcw
	 qb5ks62V6jf1g==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1A5ED17E0E64;
	Mon, 10 Aug 2026 17:22:28 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Mon, 10 Aug 2026 11:22:15 -0400
Subject: [PATCH v2 5/5] media: rkvdec: Add multicore support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-rkvdec-multicore-v2-5-986f89d22cdc@collabora.com>
References: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
In-Reply-To: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2

Rockchip SoCs like the RK3588 have multiple independent decoder cores
defined in the device tree as separate nodes sharing the same
compatible.
Extend the component-based driver to actually drive all of them from the
same v4l2 device.

It uses the v4l2_m2m_set_max_parallel_jobs() function to set the number
of available cores, making sure that only 1 job per m2m context is
running at a given time.
This is crucial for a stateless decoder as each job may depend on the
completion of previous jobs.
This avoids adding a complex scheduler that iwould have to ensure that
all needed reference frames are fully decoded before decoding a frame.
Instead, cores will work in parallel on different streams.

As each core has its own IOMMU core, buffers must be mapped in each
core's IOMMU so that any run() call can use any core without having to
remap everything.

To do that, we use rockchip iommu domain's iommu devices list.
With that, one IOMMU domain can be mapped on multiple devices, meaning
that each call to iommu_map() will flush the new mapping on all devices
in the list.
The IOMMU domain that will have all devices in its list is the first
core's default domain.

Another domain cannot be used because VB2 allocates buffers through the
DMA engine, which uses iommu_get_dma_domain() to find the domain to map
buffers through.

The IOMMU restore function can still work as before, but needs to be more
explicit in what domain to attach the device to.
That is because detaching the empty domain will reattach the core's default
domain, which is wrong (except for the first "main" core).

The RCB temporary buffers are allocated in a dedicated SRAM, and each
core has its own SRAM, so the mapping for each core's SRAM is added in the
global domain.

Everything else is mapped through the first core's default domain, making
the driver write the mappings on both IOMMU cores.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    |  12 +--
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 104 +++++++++++++++++++--
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |   8 ++
 3 files changed, 107 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
index 44df5b6df80c..977e37cf209b 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
@@ -76,9 +76,8 @@ void rkvdec_free_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_core *core)
 		case RKVDEC_ALLOC_SRAM:
 			virt_addr = (unsigned long)cfg->rcb_bufs[i].cpu;
 
-			if (iommu_get_domain_for_dev(core->dev))
-				iommu_unmap(iommu_get_domain_for_dev(core->dev),
-					    virt_addr, rcb_size);
+			if (rkvdec->iommu_global_domain)
+				iommu_unmap(rkvdec->iommu_global_domain, virt_addr, rcb_size);
 			gen_pool_free(core->sram_pool, virt_addr, rcb_size);
 			break;
 		case RKVDEC_ALLOC_DMA:
@@ -134,7 +133,7 @@ int rkvdec_allocate_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_core *core,
 
 		/* Try allocating an SRAM buffer */
 		if (core->sram_pool) {
-			if (iommu_get_domain_for_dev(core->dev))
+			if (rkvdec->iommu_global_domain)
 				rcb_size = ALIGN(rcb_size, SZ_4K);
 
 			cpu = gen_pool_dma_zalloc_align(core->sram_pool,
@@ -144,12 +143,11 @@ int rkvdec_allocate_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_core *core,
 		}
 
 		/* If an IOMMU is used, map the SRAM address through it */
-		if (cpu && iommu_get_domain_for_dev(core->dev)) {
+		if (cpu && rkvdec->iommu_global_domain) {
 			unsigned long virt_addr = (unsigned long)cpu;
 			phys_addr_t phys_addr = dma;
 
-			ret = iommu_map(iommu_get_domain_for_dev(core->dev),
-					virt_addr, phys_addr,
+			ret = iommu_map(rkvdec->iommu_global_domain, virt_addr, phys_addr,
 					rcb_size, IOMMU_READ | IOMMU_WRITE, 0);
 			if (ret) {
 				gen_pool_free(core->sram_pool,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index d3b13132b751..35850231922e 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1058,6 +1058,37 @@ static const struct media_device_ops rkvdec_media_ops = {
 	.req_queue = v4l2_m2m_request_queue,
 };
 
+/**
+ * Return a core that is available for decoding or null if no core is found.
+ * The caller should make sure to call release_core() when the core is no longer needed.
+ */
+static struct rkvdec_core *acquire_core(struct rkvdec_dev *rkvdec, struct rkvdec_ctx *ctx)
+{
+	struct rkvdec_core *core = NULL;
+
+	guard(spinlock_irqsave)(&rkvdec->cores_lock);
+
+	if (rkvdec->available_core_count) {
+		core = rkvdec->available_cores[--rkvdec->available_core_count];
+
+		// Set the current core's ctx to this ctx
+		core->curr_ctx = ctx;
+	}
+
+	return core;
+}
+
+/**
+ * Release the core to make it available for a next job.
+ */
+static void release_core(struct rkvdec_dev *rkvdec, struct rkvdec_core *core)
+{
+	guard(spinlock_irqsave)(&rkvdec->cores_lock);
+
+	core->curr_ctx = NULL;
+	rkvdec->available_cores[rkvdec->available_core_count++] = core;
+}
+
 static void rkvdec_job_finish_no_pm(struct rkvdec_ctx *ctx,
 				  enum vb2_buffer_state result)
 {
@@ -1072,6 +1103,11 @@ static void rkvdec_job_finish_no_pm(struct rkvdec_ctx *ctx,
 		ctx->coded_fmt_desc->ops->done(ctx, src_buf, dst_buf, result);
 	}
 
+	if (ctx->core) {
+		release_core(ctx->dev, ctx->core);
+		ctx->core = NULL;
+	}
+
 	v4l2_m2m_buf_done_and_job_finish(m2m_dev, m2m_ctx, result);
 }
 
@@ -1153,8 +1189,9 @@ static void rkvdec_device_run(void *priv)
 	if (WARN_ON(!desc))
 		return;
 
-	ctx->core = ctx->dev->main_core;
-	ctx->core->curr_ctx = ctx;
+	ctx->core = acquire_core(ctx->dev, ctx);
+	if (WARN_ON(!ctx->core))
+		return;
 
 	ret = pm_runtime_resume_and_get(ctx->core->dev);
 	if (ret < 0) {
@@ -1424,6 +1461,7 @@ static void rkvdec_v4l2_cleanup(struct rkvdec_dev *rkvdec)
 
 static void rkvdec_iommu_restore(struct rkvdec_core *core)
 {
+	int ret;
 	if (core->empty_domain) {
 		/*
 		 * To rewrite mapping into the attached IOMMU core, attach a new empty domain that
@@ -1432,8 +1470,14 @@ static void rkvdec_iommu_restore(struct rkvdec_core *core)
 		 * This is safely done in this interrupt handler to make sure no memory get mapped
 		 * through the IOMMU while the empty domain is attached.
 		 */
-		iommu_attach_device(core->empty_domain, core->dev);
+		iommu_detach_device(core->curr_ctx->dev->iommu_global_domain, core->dev);
+		ret = iommu_attach_device(core->empty_domain, core->dev);
+		if (ret)
+			dev_warn(core->dev, "Cannot attach empty domain: %d\n", ret);
 		iommu_detach_device(core->empty_domain, core->dev);
+		ret = iommu_attach_device(core->curr_ctx->dev->iommu_global_domain, core->dev);
+		if (ret)
+			dev_warn(core->dev, "Cannot attach global domain: %d\n", ret);
 	}
 }
 
@@ -1724,14 +1768,35 @@ static int rkvdec_core_bind(struct device *dev, struct device *master, void *dat
 	struct platform_device *pdev = to_platform_device(dev);
 	struct rkvdec_core *core = platform_get_drvdata(pdev);
 	struct rkvdec_dev *rkvdec = data;
+	int id, ret;
+
+	id = rkvdec->core_count;
+	core->id = id;
+	rkvdec->cores[id] = core;
+
+	if (id == 0)
+		rkvdec->main_core = core;
+
+	if (iommu_get_domain_for_dev(dev)) {
+		if (!rkvdec->iommu_global_domain) {
+			rkvdec->iommu_global_domain = iommu_get_domain_for_dev(dev);
+			if (IS_ERR(rkvdec->iommu_global_domain)) {
+				rkvdec->iommu_global_domain = NULL;
+				dev_warn_once(dev, "cannot get global domain\n");
+			}
+		}
 
-	if (rkvdec->main_core)
-		return dev_err_probe(dev, -EBUSY,
-				     "rkvdec already has a bound core\n");
+		if (rkvdec->iommu_global_domain) {
+			ret = iommu_attach_device(rkvdec->iommu_global_domain, dev);
+			if (ret)
+				dev_warn(dev, "cannot attach global domain to core %d\n", id);
+		}
+	}
 
-	rkvdec->main_core = core;
+	release_core(rkvdec, core);
+	rkvdec->core_count++;
 
-	dev_info(dev, "Registered core\n");
+	dev_info(dev, "Registered core %d\n", id);
 
 	return 0;
 }
@@ -1900,6 +1965,8 @@ static int rkvdec_bind(struct device *dev)
 	if (ret)
 		goto err_unbind;
 
+	v4l2_m2m_set_max_parallel_jobs(rkvdec->m2m_dev, rkvdec->core_count);
+
 	return 0;
 
 err_unbind:
@@ -1910,12 +1977,15 @@ static int rkvdec_bind(struct device *dev)
 static void rkvdec_unbind(struct device *dev)
 {
 	struct rkvdec_dev *rkvdec = dev_get_drvdata(dev);
+	int i;
 
-	cancel_delayed_work_sync(&rkvdec->main_core->watchdog_work);
+	for (i = 0; i < rkvdec->core_count; i++)
+		cancel_delayed_work_sync(&rkvdec->cores[i]->watchdog_work);
 
 	rkvdec_v4l2_cleanup(rkvdec);
 
-	rkvdec_free_rcb(rkvdec, rkvdec->main_core);
+	for (i = 0; i < rkvdec->core_count; i++)
+		rkvdec_free_rcb(rkvdec, rkvdec->cores[i]);
 
 	component_unbind_all(dev, NULL);
 }
@@ -1932,6 +2002,7 @@ static int rkvdec_probe(struct platform_device *pdev)
 	struct component_match *match = NULL;
 	struct device_node *core_node;
 	struct rkvdec_dev *rkvdec;
+	unsigned int num_cores = 0;
 
 	if (!match_desc)
 		return dev_err_probe(dev, -ENODEV, "missing platform data\n");
@@ -1943,6 +2014,7 @@ static int rkvdec_probe(struct platform_device *pdev)
 		of_node_get(core_node);
 		component_match_add_release(dev, &match, component_release_of,
 					    component_compare_of, core_node);
+		num_cores++;
 	}
 
 	if (!match)
@@ -1953,11 +2025,23 @@ static int rkvdec_probe(struct platform_device *pdev)
 	if (!rkvdec)
 		return -ENOMEM;
 
+	rkvdec->cores = devm_kcalloc(dev, num_cores, sizeof(*rkvdec->cores),
+				     GFP_KERNEL);
+	if (!rkvdec->cores)
+		return -ENOMEM;
+
+	rkvdec->available_cores = devm_kcalloc(dev, num_cores,
+					       sizeof(*rkvdec->available_cores),
+					       GFP_KERNEL);
+	if (!rkvdec->available_cores)
+		return -ENOMEM;
+
 	rkvdec->variant = match_desc->data;
 	if (!rkvdec->variant)
 		return dev_err_probe(dev, -ENODEV, "failed to get match data\n");
 
 	mutex_init(&rkvdec->vdev_lock);
+	spin_lock_init(&rkvdec->cores_lock);
 
 	dev_set_drvdata(dev, rkvdec);
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index 36eadcfcabdb..d5977cef6df7 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -15,6 +15,7 @@
 #include <linux/videodev2.h>
 #include <linux/wait.h>
 #include <linux/clk.h>
+#include <linux/spinlock.h>
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -137,6 +138,7 @@ struct rkvdec_core {
 	struct iommu_domain *empty_domain;
 	struct rkvdec_rcb_config *rcb_config;
 	struct rkvdec_ctx *curr_ctx;
+	int id;
 };
 
 struct rkvdec_dev {
@@ -146,7 +148,13 @@ struct rkvdec_dev {
 	struct v4l2_m2m_dev *m2m_dev;
 	struct mutex vdev_lock; /* serializes ioctls */
 	const struct rkvdec_variant *variant;
+	struct rkvdec_core **cores;
+	int core_count;
+	struct rkvdec_core **available_cores;
+	unsigned int available_core_count;
+	spinlock_t cores_lock; /* serializes core list access */
 	struct rkvdec_core *main_core;
+	struct iommu_domain *iommu_global_domain;
 };
 
 struct rkvdec_ctx {

-- 
2.55.0

