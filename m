Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427955;
	b=my1cFWh0e3PMb1ZWR7dnjDjQfprOPGedSyvIuJSGuMPh+7yZqOYZgLzlLUchmd4v/3Ds
	 xDziIkZ4tgK8uc6d7yY6N3PI0IIEZ+2jnpBE5DidOKaLUge9gX7/ovRwB3cMZ69eZSqZ6
	 OpHB02Iw5KtnjomI4a/GcU7SZbMiYUodPUZBOocq1wMo5PUF5fGPDioMEGGRPcP/IM32k
	 ad8MIVSTUyhcrKC2wcR8DiHSPGsYSoJ+degopuWNJamhLQfQJLh69uT5SzDs+tmde1asZ
	 iEoKXllHlXOy9rwXlDFgg8eT/nzCd2d7YmDiVzNCH/wKdM0xSPlY5LxTN7fzRBjmAsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427955;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tM/rKujmshA0kD+rwdmyjwcYJWL/Yj7wl5btXo5knx4=;
	b=UrJPee9GnwSs8WM8EWGDSUALy1pDvMX9MUr7vOzoCZ/0TaEw9P1+qxbMsk3feXpl95Gs
	 HcAbUdypEjtVApg01+lhLjGqpeNKx9Z1emtzc7ItDFxMCgHvX9aHcfJElDAUaCYUzplx3
	 rFglFwkprdNIIQRWsOrqEyALz52eDPdOttAsZDRrrPPf1c2fRa7PAg4hMCPwrqSIjyq/w
	 oHtZT8S7d9/wr6UPr1HvCkfWgZrls9GhfC3N8ce5YsaF0GwKiHqdBNY1kGlv7wTsFumg+
	 v7WPKRiKnnThiknPmDNxCyUxa9hEk+u022Te5wvBn/UBzo6NbDHLMEIqJ4HDEbUygPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BZApqdMt;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE2D606A6B1;
	Mon, 23 Nov 2026 09:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCE2D606A6B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BZApqdMt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795427952;
	bh=WPrJ9JMoCQw+dkpde9WIg8I1X59FAJUitzpr7C1hYYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BZApqdMtYyHmUEBolSxeNo4C9NX96riFOuflYjbP9/NLLWh1W8rGPCXkpwRqmg9MP
	 Sj/QeM0qjYWGHUdjQxRHUerA+gpcTsCqcF7qaXmW2+pG8laL1nfYZHVWhYj8E8KHH2
	 9ABZU1I0JR1OISN0OwbQOjfPq+cDgaTTKkxN4l8yqZxQ8HEeBPajR85WghrRDGYPoa
	 ITrFEHuAyaRUX6GFjH2QlfHxChsWZ1dp7RSBzF9hx5juUu3DYXUTf6MSP1+7Fdm2cW
	 IWIAHgipsRR1aMS9cv45rexjxtbcQIEJ9ckoiKkLF+tv8ruMijuvCOwc21s3c1fhCx
	 kx7/yhDU0qp3w==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9CF4717E0EBF;
	Mon, 23 Nov 2026 10:59:12 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 5/7] media: verisilicon: vp8: Use alloc/free helpers for auxiliary buffers
Date: Mon, 23 Nov 2026 10:59:03 +0100
Message-ID: <20261123095905.60622-6-benjamin.gaignard@collabora.com>
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

 .../media/platform/verisilicon/hantro_vp8.c   | 36 ++++++-------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_vp8.c b/drivers/media/platform/verisilicon/hantro_vp8.c
index 381bc1d3bfda..65648c017e76 100644
--- a/drivers/media/platform/verisilicon/hantro_vp8.c
+++ b/drivers/media/platform/verisilicon/hantro_vp8.c
@@ -144,7 +144,6 @@ void hantro_vp8_prob_update(struct hantro_ctx *ctx,
 
 int hantro_vp8_dec_init(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_aux_buf *aux_buf;
 	unsigned int mb_width, mb_height;
 	size_t segment_map_size;
@@ -160,42 +159,29 @@ int hantro_vp8_dec_init(struct hantro_ctx *ctx)
 	 * And the data in segment map buffer must be set to all zero.
 	 */
 	aux_buf = &ctx->vp8_dec.segment_map;
-	aux_buf->size = segment_map_size;
-	aux_buf->cpu = dma_alloc_coherent(vpu->dev, aux_buf->size,
-					  &aux_buf->dma, GFP_KERNEL);
-	if (!aux_buf->cpu)
-		return -ENOMEM;
+	ret = hantro_allocate_aux_buf(ctx, aux_buf, segment_map_size);
+	if (ret)
+		goto error;
 
 	/*
 	 * Allocate probability table buffer,
 	 * total 1208 bytes, 4K page is far enough.
 	 */
 	aux_buf = &ctx->vp8_dec.prob_tbl;
-	aux_buf->size = sizeof(struct vp8_prob_tbl_packed);
-	aux_buf->cpu = dma_alloc_coherent(vpu->dev, aux_buf->size,
-					  &aux_buf->dma, GFP_KERNEL);
-	if (!aux_buf->cpu) {
-		ret = -ENOMEM;
-		goto err_free_seg_map;
-	}
+	ret = hantro_allocate_aux_buf(ctx, aux_buf, sizeof(struct vp8_prob_tbl_packed));
+	if (ret)
+		goto error;
 
 	return 0;
 
-err_free_seg_map:
-	dma_free_coherent(vpu->dev, ctx->vp8_dec.segment_map.size,
-			  ctx->vp8_dec.segment_map.cpu,
-			  ctx->vp8_dec.segment_map.dma);
-
+error:
+	hantro_free_aux_buf(ctx, &ctx->vp8_dec.segment_map);
+	hantro_free_aux_buf(ctx, &ctx->vp8_dec.prob_tbl);
 	return ret;
 }
 
 void hantro_vp8_dec_exit(struct hantro_ctx *ctx)
 {
-	struct hantro_vp8_dec_hw_ctx *vp8_dec = &ctx->vp8_dec;
-	struct hantro_dev *vpu = ctx->dev;
-
-	dma_free_coherent(vpu->dev, vp8_dec->segment_map.size,
-			  vp8_dec->segment_map.cpu, vp8_dec->segment_map.dma);
-	dma_free_coherent(vpu->dev, vp8_dec->prob_tbl.size,
-			  vp8_dec->prob_tbl.cpu, vp8_dec->prob_tbl.dma);
+	hantro_free_aux_buf(ctx, &ctx->vp8_dec.segment_map);
+	hantro_free_aux_buf(ctx, &ctx->vp8_dec.prob_tbl);
 }
-- 
2.53.0

