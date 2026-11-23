Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427955;
	b=hbZRhyGg2UhVmwvJn9qJdU9qTJ83YfzEDQiqqKoUJLYrElpkekUC1D1NkVk9HF2V01VO
	 FNThCiQKpzt2T/YN/FBp5CEjhMozSyG7cOoP0pUPGWaNqIW/KbLMkCeKDtwJ1RF8hXqo/
	 w/3UPx7Uq7xar/rmwXpbasLa/7Cko1Je8anMkQXPOZt5JDvnIe9qeXfm5ruBoHN6L94m1
	 UmkraZrij1c02n1+gx8m0nsxD5dNnmyKzlyDWKN+2JioHWuYryPvcdxCWeJEintc4kKOT
	 s/ZWH8b+p7xt2fqFYq9gJWPuilrKNF0oOCUhTFMl1eIkQ2d7I/9zNP6j/gOXm+Ff61A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427955;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KCwhfzYD7z4lAJ3KA/9P/qqke9Y/qAZBdkGPIM59FXU=;
	b=GjOp3kQ59FcOnK+XCIBbYiV0nX2YuA8Gn4nKaLaTJs6+ZUP5zzDR5FBZxug+YD4wI5jx
	 oGESA/WkWpsorV5a8/+BDOLoEhaOlvCquJCRug/2D+08GrNQjkAubyb72zb3KYTX6aoe7
	 OINolpUa1eKjhWtuWa6pnLdb9l4iT2de/Ils34sFvhpSl6/TMX+vqclO5FXE7BZKMo+4Y
	 c0bZBGdaNBno3wfp5zwas4R0X/O9HT4Ea0tV03qBV7dVGfigXP6kCbB2rKf3reg8lNkzL
	 8UsducnRNq3FM7leojSVN7asQkG3FyVr+WPi0+OQeN0vfzLFXz+d9iz0XYDOe2IWODw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=DSuYsXFo;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC42E606A33A;
	Mon, 23 Nov 2026 09:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC42E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=DSuYsXFo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795427953;
	bh=yrh/jm7FbncyrbGG/W70xKf2SqOJYAZGqJKC5tZlRwc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DSuYsXFottJCzZRvxZJxaM5fiysfY64tgz0IrVqK2bbBOLxfjK3fZbAk01fsT58ed
	 bUPwbgbp5p1Sac9IbcDD8vpZFmlwShLrQTTvpIbZhofhK/0M/fzz82r/vGH9u5K8OT
	 4eNCaHLwsncK+iTupM1fyz3jbopvM0cEuc4x4+CcEywiaZDxM8xbhoYcgC94WR0go2
	 50vKVOfqWvegzly4UKsctDfFjkhXYc4nE+FTppYg3bkxWZk7aLYuucXfrveT4aSIr1
	 hjraNPKuv9/kdqFwnVxGNOgxkYl4eulJDUkej0C1y9OOyjPMBXXTN0z0Qw14Nxlsuq
	 SdyglyE+D1DCA==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F135217E0F76;
	Mon, 23 Nov 2026 10:59:12 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 6/7] media: verisilicon: vp9: Use alloc/free helpers for auxiliary buffers
Date: Mon, 23 Nov 2026 10:59:04 +0100
Message-ID: <20261123095905.60622-7-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123095905.60622-1-benjamin.gaignard@collabora.com>
References: <20261123095905.60622-1-benjamin.gaignard@collabora.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify and clean up the code by using the helpers.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
changes in v3:
- As suggested by Philipp do not mask hantro_allocate_aux_buf() returned
  value.

 .../media/platform/verisilicon/hantro_vp9.c   | 42 +++++++------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_vp9.c b/drivers/media/platform/verisilicon/hantro_vp9.c
index 566cd376c097..6f7995076610 100644
--- a/drivers/media/platform/verisilicon/hantro_vp9.c
+++ b/drivers/media/platform/verisilicon/hantro_vp9.c
@@ -164,6 +164,7 @@ int hantro_vp9_dec_init(struct hantro_ctx *ctx)
 	struct hantro_aux_buf *segment_map = &vp9_dec->segment_map;
 	struct hantro_aux_buf *misc = &vp9_dec->misc;
 	u32 i, max_width, max_height, size;
+	int ret;
 
 	if (variant->num_dec_fmts < 1)
 		return -EINVAL;
@@ -181,23 +182,18 @@ int hantro_vp9_dec_init(struct hantro_ctx *ctx)
 	size = hantro_vp9_tile_filter_size(max_height);
 	vp9_dec->bsd_ctrl_offset = size;
 	size += hantro_vp9_bsd_control_size(max_height);
-
-	tile_edge->cpu = dma_alloc_coherent(vpu->dev, size, &tile_edge->dma, GFP_KERNEL);
-	if (!tile_edge->cpu)
+	if (hantro_allocate_aux_buf(ctx, tile_edge, size))
 		return -ENOMEM;
 
-	tile_edge->size = size;
 	memset(tile_edge->cpu, 0, size);
 
 	size = hantro_vp9_segment_map_size(max_width, max_height);
 	vp9_dec->segment_map_size = size;
 	size *= 2; /* we need two areas of this size, used alternately */
+	ret = hantro_allocate_aux_buf(ctx, segment_map, size);
+	if (ret)
+		goto error;
 
-	segment_map->cpu = dma_alloc_coherent(vpu->dev, size, &segment_map->dma, GFP_KERNEL);
-	if (!segment_map->cpu)
-		goto err_segment_map;
-
-	segment_map->size = size;
 	memset(segment_map->cpu, 0, size);
 
 	size = hantro_vp9_prob_tab_size();
@@ -205,36 +201,28 @@ int hantro_vp9_dec_init(struct hantro_ctx *ctx)
 	size += hantro_vp9_count_tab_size();
 	vp9_dec->tile_info_offset = size;
 	size += hantro_vp9_tile_info_size();
+	ret = hantro_allocate_aux_buf(ctx, misc, size);
+	if (ret)
+		goto error;
 
-	misc->cpu = dma_alloc_coherent(vpu->dev, size, &misc->dma, GFP_KERNEL);
-	if (!misc->cpu)
-		goto err_misc;
-
-	misc->size = size;
 	memset(misc->cpu, 0, size);
 
 	init_v4l2_vp9_count_tbl(ctx);
 
 	return 0;
 
-err_misc:
-	dma_free_coherent(vpu->dev, segment_map->size, segment_map->cpu, segment_map->dma);
-
-err_segment_map:
-	dma_free_coherent(vpu->dev, tile_edge->size, tile_edge->cpu, tile_edge->dma);
+error:
+	hantro_free_aux_buf(ctx, segment_map);
+	hantro_free_aux_buf(ctx, tile_edge);
 
-	return -ENOMEM;
+	return ret;
 }
 
 void hantro_vp9_dec_exit(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_vp9_dec_hw_ctx *vp9_dec = &ctx->vp9_dec;
-	struct hantro_aux_buf *tile_edge = &vp9_dec->tile_edge;
-	struct hantro_aux_buf *segment_map = &vp9_dec->segment_map;
-	struct hantro_aux_buf *misc = &vp9_dec->misc;
 
-	dma_free_coherent(vpu->dev, misc->size, misc->cpu, misc->dma);
-	dma_free_coherent(vpu->dev, segment_map->size, segment_map->cpu, segment_map->dma);
-	dma_free_coherent(vpu->dev, tile_edge->size, tile_edge->cpu, tile_edge->dma);
+	hantro_free_aux_buf(ctx, &vp9_dec->tile_edge);
+	hantro_free_aux_buf(ctx, &vp9_dec->segment_map);
+	hantro_free_aux_buf(ctx, &vp9_dec->misc);
 }
-- 
2.53.0

