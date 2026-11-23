Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427954;
	b=akTOkVC64eB/3dMp0tP8JH5UCWvpsZEWJfPzOpGOY44uy32aTIsQ3CRt5T3LiR/zNYSo
	 NArb5XzJDhPDrQVKsfJiaQAus0T4ZPoXeNj1g/l7b2ap8Cq2SjnQUpj2APjVODn1MI4mK
	 R8u0AlgZ1GCG6SeyT15yUnXbjshz00PHvBBn0UVl4YCcRLBd7U96z0VEPu4395aaupM59
	 QU5BCS0R+IJKIeuhknr/+d3Be5vwGt+EvV6x2i7zfczufdVgSxzrBD9uVj88m9LNyyzj9
	 JXb4I0QHSr81XsSg/ct6RrG+Y16PcrxF7m6ia8bleaLh7ngGnnTjpbUOuQtwH/BSU5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427954;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7pcP8FE0iKPfyb1IeATm9eImFnbXIF/2dtfFMKN7Osc=;
	b=0xrWEbg9j/NCFDzoNs0rcPfomCv89FYZk+8cR+HLnKAQh9H/8ZNU/ViJxYWz7iogs1pe
	 81x2BmcrNmMRijtwq3ZPoDYgrApRATYFsC/Yw3RTNy9O6skLY6v9htzLfePpOERw1Am1f
	 FXKNU1lEfq997eamt7vYcOoylWheEdky9EbjuXXOquoFdU9h5ZL7iYSSycPV3Gg5j93LU
	 SUe6nBPrvwfym/dcM/ci4DycI7/3dgEmoo5/sMJAAi1p4SjZfZCESQwKWOXzIOKAJZCrs
	 tVQ3/v5j2XXXVt1kqKkY0VcyCvq5QTS6fWFXrHPNKVmv9rJayqClzyB5G2jcvnbd+OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="W9TEWd/0";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B40606A33D;
	Mon, 23 Nov 2026 09:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B40606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=W9TEWd/0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795427952;
	bh=9yeBc+PxT30nkJI0UUsO3U6UqbH202+SJlELHbA1n04=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W9TEWd/0rkrYwuG4FDG5kyIHuFhVrfAifouMH1mR2AaZqZVwlRuHAS0kcfujJdu0F
	 ehWDB89Bg7m42XkWmmVe7zgmoPH+vY+BWAUyeCvrr4gwtHfGFntOjDjKVzwKj/Odzm
	 2IhcnupTdgx2uDSPqZst2MrI8lUTnuf+yF7q15iPvYWDJ09sHNX5A1W9VL6+fbEFmY
	 VFDCzReLxrMHCCnGMeV4Xuy5/2Oo/Cg1WxpE3xCWJEQyCTDHTiA2wZCAcfAhbhyhUz
	 /D2SmKE5DeJL2s8Y1P3z0AT5YxKmnaZUlYdXUP/8pMORE9mENaD3e71pOpo6eICGQq
	 vBdhzCDAGIy+g==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E7F6F17E0DE8;
	Mon, 23 Nov 2026 10:59:11 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 3/7] media: verisilicon: h264: Use alloc/free helpers for auxiliary buffers
Date: Mon, 23 Nov 2026 10:59:01 +0100
Message-ID: <20261123095905.60622-4-benjamin.gaignard@collabora.com>
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

 drivers/media/platform/verisilicon/hantro_h264.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_h264.c b/drivers/media/platform/verisilicon/hantro_h264.c
index 2414782f1eb6..3da3083182fb 100644
--- a/drivers/media/platform/verisilicon/hantro_h264.c
+++ b/drivers/media/platform/verisilicon/hantro_h264.c
@@ -494,26 +494,23 @@ int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx)
 
 void hantro_h264_dec_exit(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_h264_dec_hw_ctx *h264_dec = &ctx->h264_dec;
 	struct hantro_aux_buf *priv = &h264_dec->priv;
 
-	dma_free_coherent(vpu->dev, priv->size, priv->cpu, priv->dma);
+	hantro_free_aux_buf(ctx, priv);
 }
 
 int hantro_h264_dec_init(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_h264_dec_hw_ctx *h264_dec = &ctx->h264_dec;
 	struct hantro_aux_buf *priv = &h264_dec->priv;
 	struct hantro_h264_dec_priv_tbl *tbl;
+	int ret;
 
-	priv->cpu = dma_alloc_coherent(vpu->dev, sizeof(*tbl), &priv->dma,
-				       GFP_KERNEL);
-	if (!priv->cpu)
-		return -ENOMEM;
+	ret = hantro_allocate_aux_buf(ctx, priv, sizeof(*tbl));
+	if (ret)
+		return ret;
 
-	priv->size = sizeof(*tbl);
 	tbl = priv->cpu;
 	memcpy(tbl->cabac_table, h264_cabac_table, sizeof(tbl->cabac_table));
 
-- 
2.53.0

