Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187635;
	b=Gk+uE8HZ8a2EZiVPFGVW5Amq9+sJr6cQ7aGtjF2Zg4iiVjCYmC2L1wYkinArdEL+XwSz
	 U+wNpDujBTC9iGdr061LDpUQDnMZjfnxqVsafjjzaKjQY6sLBPeP19+TjLrP3OQQGHuem
	 h3TKhIdUm+WzXfUpkZ9FmoGgVe/YQsbehKIaHQUY4anO8hJfJ1HJUW2ZCZrB6LR4Sd8bO
	 NGg0gTyqYtijdPBxnLJUkzNoWsDvq0YXRl6Lm3Cx7a0+YXcpBQ8xajf7EgyK1YIkEzRKl
	 FB2STNUDLNogpNGZyPvMT16eYRtjJSBp8XGzKsIvq5xY0kZ2HtgBBQ8UMsQPPYqudgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187635;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kW8b6I0Jw+TLQlemtr8w6+YUZJACiEB6UARqBZN8r6c=;
	b=mkDF7qwS935ZilZrMc9O5xOkNQL6xQBhDmmOf3jnibPtY2oCP4L9TxiAh7PaiYCj+G1r
	 QhFUoDPOW0lb6z7fdT/MpCRdmrXo5N0CbOvMOmqfwlc/qnuMPSka4euvggqdo7Ks1wXJb
	 1SzLlnLgxsi7IMu//FkjKtBd6PSTJ9Q8TJvXug3UFBruKJmPoYztG5o638RRoTrGinNhy
	 GspFtdWfI5ygxP0uwczQh764K19GNwsla5p8W9ZyeL9GHmhup0XKkngY/oqCkhG/44c9F
	 7bGWhdDzcHjw107CcwNH7H3ExspIsTrNkJSgn0Z/vMbjACTUkpwj554nJ9wTm6aaA2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=LTFMRyJ2;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DBF60A2622;
	Fri, 20 Nov 2026 15:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01DBF60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=LTFMRyJ2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795187633;
	bh=IpqVS3PeiLlM2dIe4A+1Y+XYcJbnk4aslHBahnjkxKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LTFMRyJ2nh0JwWQzPJ0GAxrxBvDwUumabmuBBHYFONp2rxixiSytFUmPCCNMquRIJ
	 XcwzEB+G3F46GIfTo5nZBuWCkHbl/Q2uO/ZjsquTW6wVWAHMXgMsYarseOhKRVna7S
	 llfmk9my+veKEimp/Nsz1WtWaRE6N15YjyuDgvpe9Rx1wzyW3jAP9+DZ2RdPek1JNr
	 QTWKdZvjEPc5WAtFkdfb6aBWooRkUDlLH1kr255o4TLGNnP3su7lF7Ny9+NYhi2FmP
	 SwNDAFP2ZaxbodNA0wLo2rAE74lFVXjHnT/xITIf/kTBb1bc+IvD9FLUClmg+S1jYy
	 VYVHzP83oEfZg==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E8EEE17E0B1E;
	Fri, 20 Nov 2026 16:13:52 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 6/7] media: verisilicon: vp9: Use alloc/free helpers for auxiliary buffers
Date: Fri, 20 Nov 2026 16:13:44 +0100
Message-ID: <20261120151345.88802-7-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120151345.88802-1-benjamin.gaignard@collabora.com>
References: <20261120151345.88802-1-benjamin.gaignard@collabora.com>
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
 .../media/platform/verisilicon/hantro_vp9.c   | 37 ++++++-------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_vp9.c b/drivers/media/platform/verisilicon/hantro_vp9.c
index 566cd376c097..7a46a4767254 100644
--- a/drivers/media/platform/verisilicon/hantro_vp9.c
+++ b/drivers/media/platform/verisilicon/hantro_vp9.c
@@ -181,23 +181,17 @@ int hantro_vp9_dec_init(struct hantro_ctx *ctx)
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
+	if (hantro_allocate_aux_buf(ctx, segment_map, size))
+		goto error;
 
-	segment_map->cpu = dma_alloc_coherent(vpu->dev, size, &segment_map->dma, GFP_KERNEL);
-	if (!segment_map->cpu)
-		goto err_segment_map;
-
-	segment_map->size = size;
 	memset(segment_map->cpu, 0, size);
 
 	size = hantro_vp9_prob_tab_size();
@@ -205,36 +199,27 @@ int hantro_vp9_dec_init(struct hantro_ctx *ctx)
 	size += hantro_vp9_count_tab_size();
 	vp9_dec->tile_info_offset = size;
 	size += hantro_vp9_tile_info_size();
+	if (hantro_allocate_aux_buf(ctx, misc, size))
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
 
 	return -ENOMEM;
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

