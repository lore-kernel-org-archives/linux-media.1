Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187634;
	b=j2S6ONbGrfA6MuiL/nD8PVvIAFDjnO54eW91ynCd5e7Rkrhfv7NJnfgyYyU5m8oVI4Zo
	 NM1HOPtkOr6zj8chjuHc+PPOUVYGXpbD7gIGn5QEDi55NWvjkBij5Si6Ci3DSUx4lgLsB
	 dnkIyHV/FOwk470uK/yhlh4fywj98cb8D8KcaXmwpYnhF1juEfA6e/JdP6TE0Hp8GD4cN
	 itIbTm3e+m5/7igR+7plgL8o1bbr17AXaAKcjvW/qKEImDk9HwG72L+onC1/T//OMBcxQ
	 c2ldN5C3pXMHQEBSVhdUlxFzASvmzWBZFd8JmIIJ0KFjwh1UORhBWi884sCcM7DnWNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187634;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hLJg7DeUbsn/QR4Ui41PvgLUL2EkXau5M7NU9/LyXzY=;
	b=0bOep2Nl9OzMWfNjyN+D7XMOFha/TC9R2YzzAx7vaedt8H8M5meyvxMPpeYN77YMCZX6
	 b3EwmIv6GwbwJ2SDLJBJfTz+4TWpE1vHwrntP9mSCvt/anLgS3xtJh1ztbo/yghsO13ST
	 QWEMpAfReip2nSpvLAUtNg3PvvgWuIwq2G3CZUp3WepXEO+w3fb7z0olWR/hFRrNawGGu
	 dxqexTp2ClNbd/d/eWZeE7P/PFM94GWLnAyW+ZzW/eJEfQpohX4yNAABFjo/MfqvMKGOn
	 h3llXVjiUIRaQGWEkwJ9SCXObYLDdjPglhL+CvIC3l5GBeL34ffyHmySsWiKML6a4AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=c2UlZNcR;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8955F606A332;
	Fri, 20 Nov 2026 15:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8955F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=c2UlZNcR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795187632;
	bh=eHvtUm9gXR5TOG/ySst4yE08/6fWAkVWOtUNBDRKhpw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c2UlZNcR05Zf7p+dQZxjjRZDmUi0gmut/GMR/A1euqPV8km0aLLn3KJ+vMhD/V987
	 7o8PUj0pTPHUFHeVwJDdln/WChS4eGIg5lgW6iguFsbfHHrDzIupEbWok/3RUtJqRh
	 RftreAbc3ODBexQxY4bQ0iYojumWwMZ1usdkTTS7sKicn8zZYBANL74EMVNlYNLzc/
	 ZB3U3bLK2bVlA89HHHhRMwsbRvpBUsHuZhRvuUCt++Vf7bAiMXzzUgpikao0FjaVeU
	 Z/hsIpsyR7lL8wgogYAJUybYFez8UtHPU2uQSBcV8K59briaUzTxMPvXDRr75c4VcC
	 OcW6uAEkkrTdg==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DFA9917E091F;
	Fri, 20 Nov 2026 16:13:51 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 3/7] media: verisilicon: h264: Use alloc/free helpers for auxiliary buffers
Date: Fri, 20 Nov 2026 16:13:41 +0100
Message-ID: <20261120151345.88802-4-benjamin.gaignard@collabora.com>
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
 drivers/media/platform/verisilicon/hantro_h264.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_h264.c b/drivers/media/platform/verisilicon/hantro_h264.c
index 2414782f1eb6..68dde1cd1ac2 100644
--- a/drivers/media/platform/verisilicon/hantro_h264.c
+++ b/drivers/media/platform/verisilicon/hantro_h264.c
@@ -494,26 +494,21 @@ int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx)
 
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
 
-	priv->cpu = dma_alloc_coherent(vpu->dev, sizeof(*tbl), &priv->dma,
-				       GFP_KERNEL);
-	if (!priv->cpu)
+	if (hantro_allocate_aux_buf(ctx, priv, sizeof(*tbl)))
 		return -ENOMEM;
 
-	priv->size = sizeof(*tbl);
 	tbl = priv->cpu;
 	memcpy(tbl->cabac_table, h264_cabac_table, sizeof(tbl->cabac_table));
 
-- 
2.53.0

