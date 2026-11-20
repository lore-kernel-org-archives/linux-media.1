Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187636;
	b=veeyr+/OjYwBVX1y50PO4cMuf1Tp5b1KT6Bh5I6gSpDDIFP2U8rvTOwKoSMJ4UeGHHhU
	 rVEKpGzDTCYucBjkVN/A7caMi6o4Oy9ZMc2CBNTwbNXZNMW5GZTlIVr7eviluIbL99UP0
	 JJoewtZY5TssR/GiO4AQfSiUZdiLHnRKIeYp1ZioCC8vm+ofqGCez99bQ4a1VpiQoGnXK
	 06oIeK8bjZH7pjZXCiSm9GSE5eOUE2ZrJUXfC04hU7ddTnhbyxRO0vJn48CSMRUdqBDpU
	 i6m41IXq1UouUsQpH5QqXjTnClf5bwftCpwbIQuWABeJhuSDQoHubFzr/J5wtnxuStQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187636;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bY0/gZDMMyEM81fjCjWUZyK8s2jWJMcglFxbroDzTbA=;
	b=Q/Fzo3EvQSWBUFU5oK1VWr3TzxAPMAr9RqkOW4NQYLQutT1PJCRj6+YclTt5rMY/4Ypc
	 omZknSyhii1F7GznHAcCHYagC/uzLruqqjMVtJgpY059HQGhQ4md/XpMOHxqYy9C+m2iA
	 hT/VKOiTw6uLM7jFRoxqn+KSHMUJaihiNRdVGwk76FOTwOUR7PlpJHFLkj7Y9SkBOFRpI
	 NbWPVoESMoj5V+WMJbx/6yKnvjPRlfkQkluKOitat+AG3C+XXph96sCuCGupgMvsDhEsf
	 ORZyO1s9dVbLUbuD4YlKx9tufLUem0qPGYHA/D0qn5uLEmMZ8LmbGcxOint7L42BttQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=guTG6gPO;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DA160A2611;
	Fri, 20 Nov 2026 15:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01DA160A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=guTG6gPO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795187633;
	bh=jRz07Mds3fldJ4UvvVJs9bQOv2otc9dZOS7B7+fjNTg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=guTG6gPOhjPeJKUEJF8quPnWpGXDX+Qb3S803TpybGJq4Ie4fAY+OpvlPmNI4PY9T
	 P1kcciXNcK/S/aPyShyuHHgLjdJ0aPIZd79e//RqoMe+jKZKeLFM3OUGCV3EsbNett
	 3OuqtVnblz2D6Hb1K1kSPraFgfWLnT/kgSiQ6vZr5eQenrtTtNqiB56G0a9DDJHOBo
	 dooH6fP+3+duuHSq9FIVlFtNwBGoNmfN2UQIwKCCG1b74sjTIfyrOKNBp/mJCH7BXE
	 TLKtapsohIq/8kLCqOdTh/2u5v5FhTSgTv6Vstz5xOkJF58CsnBPjjCWlucWyQuvyA
	 TYiMxfvK1AxrA==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4ABAB17E0BCD;
	Fri, 20 Nov 2026 16:13:53 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 7/7] media: verisilicon: mpeg4: Use alloc/free helpers for auxiliary buffers
Date: Fri, 20 Nov 2026 16:13:45 +0100
Message-ID: <20261120151345.88802-8-benjamin.gaignard@collabora.com>
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
changes in v2:
- fix commit message

 .../media/platform/verisilicon/hantro_mpeg2.c   | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_mpeg2.c b/drivers/media/platform/verisilicon/hantro_mpeg2.c
index 04e545eb0a83..f21115e6bdbe 100644
--- a/drivers/media/platform/verisilicon/hantro_mpeg2.c
+++ b/drivers/media/platform/verisilicon/hantro_mpeg2.c
@@ -37,25 +37,12 @@ void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
 
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
+	if (hantro_allocate_aux_buf(ctx, &ctx->mpeg2_dec.qtable, ARRAY_SIZE(zigzag) * 4))
 		return -ENOMEM;
 	return 0;
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

