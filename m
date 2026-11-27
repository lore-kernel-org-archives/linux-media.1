Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799784;
	b=UgZ75itHnkXyclMuCqKEpiFUSX6qxUIo+wszNN8vnDNNAtzAsNJkFvQLT1RWD1gqFVlk
	 NIK43X8GRoH9a38Lxm8UphwqdkihbWqsk1ovM0Mn67aa0NUiX1pbEVtgDvgKPhilZH/wc
	 Kl9usZbb8vASASpjVAjOeMJ3e2CqEVLMheUCLEPVkayrEflYskwQ6kx7IYl70wfJU6mRE
	 gVaZ+48aL1ZvR+qbfDwBdG9lFTbicVucE26HERM4gkozKB6MWutw+9WUed1vYV0RvfM97
	 6DjJTNhd1r36/05+cEAM6ZX5Q1HoxIftn3WjjaStV9xgYOyrk2v/zTHLpZU6aDGJtsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799784;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=QaA61a5Ljaj5zpNYbTEDLRZbuFgDrcTIN7gKffSs/6c=;
	b=36wPCyRGptjmOyoR3eDP84CJfhhkxZGuVDRbt5wgECsWgnAtdBZRIrOpKjGmVEvljlWH
	 EUfyo9hSg39PYZhZwGRPYjfaZIogycSbb4lsOxXPFx4ladjTKxILVBp+3GQHM4ja71qta
	 iG6/AHXq86Yli39jvkW2O2X3+WX80h6Ph41bCZp64X9orvrgzg6taO1tbc0qF4GdnHcp+
	 vyX5hMt+i1yhWSFmRodw84ogZ1avY/8YertnIoFP1Ypbmdj8qhmshTmAXoEpFAMXa0E9n
	 D/mJ8k0UpCfujgErlx6TMa141EsNcHNVnFfVRijAgA2qn1JjKzMsXm1d6dudyuk6RHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=a9N5+ElG;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AB1606A68F;
	Fri, 27 Nov 2026 17:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6AB1606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=a9N5+ElG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795799782;
	bh=66hGCABbiQ3DeRYxQJtLOA1BolbPouQSk78SkAlID8I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a9N5+ElGOFzG/2CHrdixAYjz3V49C6fidL+wF3izkn4LJ4OY+9HmfQiNBOzaGzXiU
	 Mni7HlP8N7zxN7rD78WuoajQmc5rU+21VrbqIeZAckpcyYB3VJxvm9zhssUkWAY+8M
	 vQ8R+1UlxAQBEx7+Hf7DPQ7XAF4A7AnnxU2bJF9qsJQi9aA/F8m9hRAnqIftizcRP+
	 uJPzs7V7c36Z+qZU7CMdr3h6AnIba3KXbZw1+qsjugQsx9wiRa1w4mvZHjkYDYP7Wq
	 2VV4WQlW+u9XTa1bdJ4yjLIGplpUFmLckgC4DmmCSRMydNFF7aB1QGYUfZWsUmwdXs
	 dpDEGJnC8CWQw==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7311617E08C6;
	Fri, 27 Nov 2026 18:16:20 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Fri, 27 Nov 2026 12:16:13 -0500
Subject: [PATCH v2 4/4] media: rkvdec: Switch to tracked dma allocations
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-v4l2-add-mem-tracker-v2-4-73b0494260e7@collabora.com>
References: <20261127-v4l2-add-mem-tracker-v2-0-73b0494260e7@collabora.com>
In-Reply-To: <20261127-v4l2-add-mem-tracker-v2-0-73b0494260e7@collabora.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2

Use the newly introduced v4l2_dma_alloc_attrs and v4l2_dma_free_attrs
functions to track all dma allocations and have them exposed to
userspace for easier debug.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec-h264.c   | 14 ++++++---
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   | 14 ++++++---
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    | 21 ++++++++------
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c | 14 ++++++---
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c | 14 ++++++---
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c | 14 ++++++---
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c | 14 ++++++---
 .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    | 33 +++++++++++++++-------
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |  4 +++
 9 files changed, 100 insertions(+), 42 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
index ffa606038192..e2cf28d799eb 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
@@ -11,6 +11,7 @@
 
 #include <media/v4l2-h264.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
@@ -358,8 +359,11 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 	if (!h264_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&h264_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"h264-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -383,8 +387,10 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
-			  h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    h264_ctx->priv_tbl.size,
+			    h264_ctx->priv_tbl.cpu,
+			    h264_ctx->priv_tbl.dma, 0);
 	kfree(h264_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
index 88e90c438eb9..fb8d6fcff09c 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
@@ -14,6 +14,7 @@
 
 #include <media/v4l2-hevc.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
@@ -514,8 +515,11 @@ static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
 	if (!hevc_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &hevc_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&hevc_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"hevc-priv-tbl");
 	if (!priv_tbl) {
 		kfree(hevc_ctx);
 		return -ENOMEM;
@@ -535,8 +539,10 @@ static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, hevc_ctx->priv_tbl.size,
-			  hevc_ctx->priv_tbl.cpu, hevc_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    hevc_ctx->priv_tbl.size,
+			    hevc_ctx->priv_tbl.cpu,
+			    hevc_ctx->priv_tbl.dma, 0);
 	kfree(hevc_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
index 3828e2a5c665..3ab83b1a2bbf 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
@@ -13,6 +13,7 @@
 #include <linux/genalloc.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
+#include <media/v4l2-allocator.h>
 
 struct rkvdec_rcb_config {
 	struct rkvdec_aux_buf *rcb_bufs;
@@ -65,10 +66,10 @@ void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
 			gen_pool_free(dev->sram_pool, virt_addr, rcb_size);
 			break;
 		case RKVDEC_ALLOC_DMA:
-			dma_free_coherent(dev->dev,
-					  rcb_size,
-					  cfg->rcb_bufs[i].cpu,
-					  cfg->rcb_bufs[i].dma);
+			v4l2_dma_free_attrs(&dev->v4l2_dev, dev->dev,
+					    rcb_size,
+					    cfg->rcb_bufs[i].cpu,
+					    cfg->rcb_bufs[i].dma, 0);
 			break;
 		}
 	}
@@ -150,10 +151,14 @@ int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
 ram_fallback:
 		/* Fallback to RAM */
 		if (!cpu) {
-			cpu = dma_alloc_coherent(ctx->dev->dev,
-						 rcb_size,
-						 &dma,
-						 GFP_KERNEL);
+			char name[32];
+
+			snprintf(name, sizeof(name), "rcb-%d", i);
+			cpu = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, ctx->dev->dev,
+						   rcb_size,
+						   &dma,
+						   GFP_KERNEL, 0, &ctx->fh,
+						   name);
 			alloc_type = RKVDEC_ALLOC_DMA;
 		}
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
index b961fddc8583..b0cb6963c8e0 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
@@ -8,6 +8,7 @@
 
 #include <media/v4l2-h264.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-cabac.h"
@@ -387,8 +388,11 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 	if (!h264_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&h264_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"vdpu381-h264-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -412,8 +416,10 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
-			  h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    h264_ctx->priv_tbl.size,
+			    h264_ctx->priv_tbl.cpu,
+			    h264_ctx->priv_tbl.dma, 0);
 	kfree(h264_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index e1936e87f45b..84a266240df5 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -7,6 +7,7 @@
  */
 
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-cabac.h"
@@ -557,8 +558,11 @@ static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
 	if (!hevc_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &hevc_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&hevc_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"vdpu381-hevc-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -582,8 +586,10 @@ static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, hevc_ctx->priv_tbl.size,
-			  hevc_ctx->priv_tbl.cpu, hevc_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    hevc_ctx->priv_tbl.size,
+			    hevc_ctx->priv_tbl.cpu,
+			    hevc_ctx->priv_tbl.dma, 0);
 	kfree(hevc_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
index 5ec755733916..00fe81749587 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c
@@ -8,6 +8,7 @@
 
 #include <media/v4l2-h264.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include <linux/iopoll.h>
 
@@ -380,8 +381,11 @@ static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 	if (!h264_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&h264_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"vdpu383-h264-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -406,8 +410,10 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, h264_ctx->priv_tbl.size,
-			  h264_ctx->priv_tbl.cpu, h264_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    h264_ctx->priv_tbl.size,
+			    h264_ctx->priv_tbl.cpu,
+			    h264_ctx->priv_tbl.dma, 0);
 	kfree(h264_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
index 3462d995d4cf..8139d50fb8af 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
@@ -7,6 +7,7 @@
  */
 
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-cabac.h"
@@ -505,8 +506,11 @@ static int rkvdec_hevc_start(struct rkvdec_ctx *ctx)
 	if (!hevc_ctx)
 		return -ENOMEM;
 
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &hevc_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&hevc_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"vdpu383-hevc-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -530,8 +534,10 @@ static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, hevc_ctx->priv_tbl.size,
-			  hevc_ctx->priv_tbl.cpu, hevc_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    hevc_ctx->priv_tbl.size,
+			    hevc_ctx->priv_tbl.cpu,
+			    hevc_ctx->priv_tbl.dma, 0);
 	kfree(hevc_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
index 2751f5396ee8..9f41f6ca82d1 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
@@ -20,6 +20,7 @@
 #include <linux/vmalloc.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/v4l2-vp9.h>
+#include <media/v4l2-allocator.h>
 
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
@@ -979,8 +980,11 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
 	ctx->priv = vp9_ctx;
 
 	BUILD_BUG_ON(sizeof(priv_tbl->probs) % 16); /* ensure probs size is 128-bit aligned */
-	priv_tbl = dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
-				      &vp9_ctx->priv_tbl.dma, GFP_KERNEL);
+	priv_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					sizeof(*priv_tbl),
+					&vp9_ctx->priv_tbl.dma,
+					GFP_KERNEL, 0, &ctx->fh,
+					"vp9-priv-tbl");
 	if (!priv_tbl) {
 		ret = -ENOMEM;
 		goto err_free_ctx;
@@ -989,8 +993,11 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
 	vp9_ctx->priv_tbl.size = sizeof(*priv_tbl);
 	vp9_ctx->priv_tbl.cpu = priv_tbl;
 
-	count_tbl = dma_alloc_coherent(rkvdec->dev, RKVDEC_VP9_COUNT_SIZE,
-				       &vp9_ctx->count_tbl.dma, GFP_KERNEL);
+	count_tbl = v4l2_dma_alloc_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+					 RKVDEC_VP9_COUNT_SIZE,
+					 &vp9_ctx->count_tbl.dma,
+					 GFP_KERNEL, 0, &ctx->fh,
+					 "vp9-count-tbl");
 	if (!count_tbl) {
 		ret = -ENOMEM;
 		goto err_free_priv_tbl;
@@ -1003,8 +1010,10 @@ static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
 	return 0;
 
 err_free_priv_tbl:
-	dma_free_coherent(rkvdec->dev, vp9_ctx->priv_tbl.size,
-			  vp9_ctx->priv_tbl.cpu, vp9_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    vp9_ctx->priv_tbl.size,
+			    vp9_ctx->priv_tbl.cpu,
+			    vp9_ctx->priv_tbl.dma, 0);
 
 err_free_ctx:
 	kfree(vp9_ctx);
@@ -1016,10 +1025,14 @@ static void rkvdec_vp9_stop(struct rkvdec_ctx *ctx)
 	struct rkvdec_vp9_ctx *vp9_ctx = ctx->priv;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	dma_free_coherent(rkvdec->dev, vp9_ctx->count_tbl.size,
-			  vp9_ctx->count_tbl.cpu, vp9_ctx->count_tbl.dma);
-	dma_free_coherent(rkvdec->dev, vp9_ctx->priv_tbl.size,
-			  vp9_ctx->priv_tbl.cpu, vp9_ctx->priv_tbl.dma);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    vp9_ctx->count_tbl.size,
+			    vp9_ctx->count_tbl.cpu,
+			    vp9_ctx->count_tbl.dma, 0);
+	v4l2_dma_free_attrs(&rkvdec->v4l2_dev, rkvdec->dev,
+			    vp9_ctx->priv_tbl.size,
+			    vp9_ctx->priv_tbl.cpu,
+			    vp9_ctx->priv_tbl.dma, 0);
 	kfree(vp9_ctx);
 }
 
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 5250dd59df2e..0dfc689386d4 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1208,6 +1208,8 @@ static int rkvdec_queue_init(void *priv,
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->lock = &rkvdec->vdev_lock;
 	src_vq->dev = rkvdec->v4l2_dev.dev;
+	src_vq->v4l2_dev = &rkvdec->v4l2_dev;
+	src_vq->v4l2_fh = &ctx->fh;
 	src_vq->supports_requests = true;
 	src_vq->requires_requests = true;
 
@@ -1227,6 +1229,8 @@ static int rkvdec_queue_init(void *priv,
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock = &rkvdec->vdev_lock;
 	dst_vq->dev = rkvdec->v4l2_dev.dev;
+	dst_vq->v4l2_dev = &rkvdec->v4l2_dev;
+	dst_vq->v4l2_fh = &ctx->fh;
 
 	return vb2_queue_init(dst_vq);
 }

-- 
2.56.1

