Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609720;
	b=JeWiwHsBglYlGJVXNUwNWgK5NY45Ezs0tp8C6NbHGIYMOJ/1SSLLRqZCsOX4xZttTC1d
	 hDi9qeTKE4mHy2SztUulS2L503/V1vMcoeD19tX9bHtvzp/CzF4+ViOx37M74M2lj4z3r
	 IAG9CWa0LAzEpKmbl+12Ez6SSUg+S9XeEn9vNXjLWIE9VdUSAFTb4k1ohW7GnZE8/E3u0
	 T78x6cWF3sjl6A+XE9+dAA46K1Z0S0vJhax3r2r/WpSAT9GbNPNaDR7zGrjRyjnZFthdV
	 igu8+dqSJjx8k1sMqHht7IWg9kwzSSZU2a7MB5UvqhOyoinqJ+3FXRVLu4v+Myi1fwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609720;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PQRMYI9tnhaBvI/6kmFgrOXV3yQe8Sw/Kuz6pgX98xY=;
	b=sTNjfA+SJ1nPCi2reNqcI718rjmrEurOC7nd+byeHlSSCrDfMDNUhGMBeQrGRzBiELZ4
	 4Rp1O2aBl/6IFqAzwYgqCoCYHwADSpfBiZWZSwWjna03qL16FTJ4X/kqTTz7DjpDKVv2A
	 bRKafdcsglNznCnG6djX/5arJeQp1OqaoHrudIa5QWFh0v/yJrMQUe2S9k4hqhZcNBKS1
	 wApIUq496oacBskwpD4BRtGS8JHNu3zDnfbh+tEVzCVp4zlA7SSwAtnvcy7BeIMyBxuZ7
	 OlqIVpjxIDmJcufKZuNUIl+Mh1omTKacbdj0b6+Kl3jyKi7XXEhMbKeV6HkRscLXZOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HZSCIy+9;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A271606A323;
	Wed, 25 Nov 2026 12:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A271606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HZSCIy+9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795609711;
	bh=hTf3zxsVBwsVNKc4ojFf+pNyJt/ggID91ntX83wBxus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HZSCIy+9zIPs6+qNw+nYBuF38ApHD1crxEQo2k7ZfUXsbfoGCQjADwHakL90OpIKv
	 hTGdlSopRcZBd5/r1KRlEejt2jx5R3chv++qy3KxV+d4/51pRfUh7ZyRAa+zhuAVMO
	 YWiPiGsTXYxeMFhThyd0UgsvFvJ+FC4y3VpcBjUPnNpPXwjGGZrXQVKCPl0NH5EjKZ
	 B93e45Z36Ccj/aYOxtGCOcXMuOVSAhX1O5Ylq+YJJ/8naLZgo1uyBtmjHteSBGwvV0
	 wUWSnKAgGM35VlHzgI1bh5vnwAN9Pi2v893byb89PE0wpfjYzBPQ5wLrNHnbqPHTQZ
	 eMSm3twpR9T2A==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6995F17E0311;
	Wed, 25 Nov 2026 13:28:31 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	heiko@sntech.de,
	hverkuil@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v9 2/4] media: verisilicon: Use V4L2_AV1_PRIMARY_REF_NONE and V4L2_AV1_REF_FRAME_INVALID
Date: Wed, 25 Nov 2026 13:28:23 +0100
Message-ID: <20261125122825.236422-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125122825.236422-1-benjamin.gaignard@collabora.com>
References: <20261125122825.236422-1-benjamin.gaignard@collabora.com>
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

Use V4L2_AV1_PRIMARY_REF_NONE and V4L2_AV1_REF_FRAME_INVALID instead
of local definition.
Since ref_frame_idx[] values have been checked inside v4l2-ctrl-core.c
remove the useless duplicate check.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in v9:
- Split core changes and drivers changes
- Use V4L2_AV1_REF_FRAME_INVALID

 .../verisilicon/rockchip_vpu981_hw_av1_dec.c       | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index 2a145433e6d1..087a944b3394 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -18,9 +18,7 @@
 #define AV1_TILE_INFO_SIZE	(AV1_MAX_TILES * 16)
 #define AV1DEC_MAX_PIC_BUFFERS	24
 #define AV1_REF_SCALE_SHIFT	14
-#define AV1_INVALID_IDX		-1
 #define MAX_FRAME_DISTANCE	31
-#define AV1_PRIMARY_REF_NONE	7
 #define AV1_TILE_SIZE		ALIGN(32 * 128, 4096)
 /*
  * These 3 values aren't defined enum v4l2_av1_segment_feature because
@@ -123,8 +121,8 @@ static int rockchip_vpu981_get_frame_index(struct hantro_ctx *ctx, int ref)
 	u64 timestamp;
 	int i, idx = frame->ref_frame_idx[ref];
 
-	if (idx >= V4L2_AV1_TOTAL_REFS_PER_FRAME || idx < 0)
-		return AV1_INVALID_IDX;
+	if (idx < 0)
+		return V4L2_AV1_REF_FRAME_INVALID;
 
 	timestamp = frame->reference_frame_ts[idx];
 	for (i = 0; i < AV1_MAX_FRAME_BUF_COUNT; i++) {
@@ -134,7 +132,7 @@ static int rockchip_vpu981_get_frame_index(struct hantro_ctx *ctx, int ref)
 			return i;
 	}
 
-	return AV1_INVALID_IDX;
+	return V4L2_AV1_REF_FRAME_INVALID;
 }
 
 static int rockchip_vpu981_get_order_hint(struct hantro_ctx *ctx, int ref)
@@ -142,7 +140,7 @@ static int rockchip_vpu981_get_order_hint(struct hantro_ctx *ctx, int ref)
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
 	int idx = rockchip_vpu981_get_frame_index(ctx, ref);
 
-	if (idx != AV1_INVALID_IDX)
+	if (idx != V4L2_AV1_REF_FRAME_INVALID)
 		return av1_dec->frame_refs[idx].order_hint;
 
 	return 0;
@@ -179,7 +177,7 @@ static int rockchip_vpu981_av1_dec_frame_ref(struct hantro_ctx *ctx,
 		return i;
 	}
 
-	return AV1_INVALID_IDX;
+	return V4L2_AV1_REF_FRAME_INVALID;
 }
 
 static void rockchip_vpu981_av1_dec_frame_unref(struct hantro_ctx *ctx, int idx)
@@ -1256,7 +1254,7 @@ static void rockchip_vpu981_av1_dec_set_prob(struct hantro_ctx *ctx)
 	bool frame_is_intra = IS_INTRA(frame->frame_type);
 
 	if (error_resilient_mode || frame_is_intra ||
-	    frame->primary_ref_frame == AV1_PRIMARY_REF_NONE) {
+	    frame->primary_ref_frame == V4L2_AV1_PRIMARY_REF_NONE) {
 		av1_dec->cdfs = &av1_dec->default_cdfs;
 		av1_dec->cdfs_ndvc = &av1_dec->default_cdfs_ndvc;
 		rockchip_av1_default_coeff_probs(quantization->base_q_idx,
-- 
2.53.0

