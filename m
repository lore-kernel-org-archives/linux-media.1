Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427955;
	b=aL3eedTxHfLTnvzbbR9pal+H/fnj76W/1od58ueHc+Oz/qczSgcS3vYTFfO8mqoQacbR
	 FmPqGeZNTebPHVhbUmjcPG1M62HdwhxWGKYf9X/ABHWJ8VBwAdu6Nm/qJlxWRn4b+Z4y4
	 w2q6TPev7hh1865TsA0LoAW0C234vCP0aHX2bk0BWoQpmYHdJYrDD226PNAg+nJtegZsB
	 g7gWATRmeqtdl8cWsGnppVNnTQ6HRh6H+tVzgKKBNDP4yz0lLIErOz8DSsmBhWsDS7IWI
	 uK3vUmIlmkVe8Alg1/CO869R241VN9TbQFhgoEVKv0btBUa/RVfPgbaPc05PvK0Ib9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427955;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Vup0nDUVc4PS4CIRQViYppejmd44gE1WsOa+3QOuHok=;
	b=p+Bqs38RhfZVv0GupOX5bO7YS+nnZJCCZGsPwuqB6x7ABrjuR7om7YHLHIDI9sioAyRS
	 l/7qoVIEqNft3PrMdnQi6G0sYA6WsdOVHj5zvT3bH6g188Q84k7ohI/MnZuHwIrfvpV5H
	 IvyAbUGC4MBDbRpv5xwR0ZHTng4Uj7Qwgz98hN+oIqYQ3a01OwpSRWvXOQeB/tubREn7L
	 Y+0rPMQT5ruXi0MCtaPEcKLB4uH8eh/Q4d5d7EvQqviz+e5JVPCAb/MWNLP9LtWF9anD/
	 1hwjX+eVuwiF6nOgtqr6xgVmrkrvoM87sudzS9CUrrojpaO9kqprWy9+XEYD+Z+Q88w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KGLX9BGk;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF22C606A6B8;
	Mon, 23 Nov 2026 09:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF22C606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=KGLX9BGk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795427953;
	bh=rXNw1d4USB5/kawtOh342Yw/bkDvJVwMdlr6Hcx6BPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KGLX9BGkj3B0THyrz1hoYznAf8T4NbJFC95FdrN5IGI1qxIezlBufEadNeSX2MfcK
	 ZdXWdAVI/8nlgWvuxYG4YAl7dvqUL9JFlQyyksvKpgpRfXUOCoGVuu6zB9Qn2o/z5C
	 E+8llySsvVTuHW4Hg2dtdOdrtdwx8m/FhYnBCo0ue07SR0FsCkFNo+OQrKbpxO2Jaf
	 rXyim1TH9X5kM+fPDLLmhFEFdylAUYIuEzOngYE6LQWy/JA51+WMf5uSBHEd9IKS0V
	 +lzwvG+PWnvfdWu3r6kVdJbV1afAgeEgIuqXoJ/83dUfnYaL8oWtdIr/vF0DFFllta
	 v9gq7OehREFzw==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5167617E0FB8;
	Mon, 23 Nov 2026 10:59:13 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 7/7] media: verisilicon: mpeg4: Use alloc/free helpers for auxiliary buffers
Date: Mon, 23 Nov 2026 10:59:05 +0100
Message-ID: <20261123095905.60622-8-benjamin.gaignard@collabora.com>
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

 .../media/platform/verisilicon/hantro_mpeg2.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_mpeg2.c b/drivers/media/platform/verisilicon/hantro_mpeg2.c
index 04e545eb0a83..7386cc50b11b 100644
--- a/drivers/media/platform/verisilicon/hantro_mpeg2.c
+++ b/drivers/media/platform/verisilicon/hantro_mpeg2.c
@@ -37,25 +37,10 @@ void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
 
 int hantro_mpeg2_dec_init(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
-
-	ctx->mpeg2_dec.qtable.size = ARRAY_SIZE(zigzag) * 4;
-	ctx->mpeg2_dec.qtable.cpu =
-		dma_alloc_coherent(vpu->dev,
-				   ctx->mpeg2_dec.qtable.size,
-				   &ctx->mpeg2_dec.qtable.dma,
-				   GFP_KERNEL);
-	if (!ctx->mpeg2_dec.qtable.cpu)
-		return -ENOMEM;
-	return 0;
+	return hantro_allocate_aux_buf(ctx, &ctx->mpeg2_dec.qtable, ARRAY_SIZE(zigzag) * 4);
 }
 
 void hantro_mpeg2_dec_exit(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
-
-	dma_free_coherent(vpu->dev,
-			  ctx->mpeg2_dec.qtable.size,
-			  ctx->mpeg2_dec.qtable.cpu,
-			  ctx->mpeg2_dec.qtable.dma);
+	hantro_free_aux_buf(ctx, &ctx->mpeg2_dec.qtable);
 }
-- 
2.53.0

