Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185109;
	b=Aq1UMmUe9zZZf9ZxLmoFfPLfn60Ar7iDI9yD1yGOVRDN4oFqNskoiFULSXoh4UpnboyK
	 9G4vIStiUCnTGcNbFzbGYGNeFHsQTAnms+uCUnQTeVQLAPtpn7MMZSLf9eM9m8H2t08tt
	 tTEALQPSaBCy0En1bOXm+9K9rlCbjC6YlfWBtspwZpV2lU0OAOjnkQDCxv06Wyo8hBRMl
	 PMlygysuy1UNSgNJxVc4FhmjmO+oMpFhIrRe0mK4tS1/P2Gq9RTFBEl//dZMi8Ef7htRQ
	 1/obCoM4LGuSJ2h6SnUW5ri7PIQVoapr7aTsPfAd92s0B3HNac5pRaLDZlNfUFDTD0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185109;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3EuKYU1V/nUAnDXv79PPh/iSTftFFLoG3EvfW9crCwI=;
	b=2qCD3IUw/CqfR3sxQmhld0NXGjIiIZjVIlnGei/DmIX2K5BHqgFpJo7eDAH8jzk+IOJi
	 db847RtCM8gQgKQowstpzvSA7pyDNNgBXtC36K8BYFE4gVSjWZhZIa2b4Noku+lmZeSj2
	 X2XOHadg6ExJw/3DHQvcb5ktoxdTNWoRm+rwJfOYT5fUCgHXWxMeBdJ8JtmMqmSfE6vNr
	 7yxTHQ3yF9snJdjrGdoDoWP1ygzQKNCeFpuXbJvjl3qMoLUa2yiwQgUlbk9ur7z72Qbov
	 7vlLJQ6J/9+LNGaBeoRHf9WV/XdgRJb4nHTFts+1DVNex9icQh4ZT2XN4+PdWnRqZyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GPMxLtZJ;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDB8606A320;
	Fri, 20 Nov 2026 14:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FDB8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GPMxLtZJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795185101;
	bh=YK/k1fZJBJ7Ho2aRUWs/6q2KowLDTaMyFWDZCUHSuK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GPMxLtZJeYIvB0K8CA/6DuwErAe+OJF1hU6+qnMKH9AfMzhtA1Efxpd0RUMEfbdrW
	 P1oI6zhsbNKSoHcDQsUSDPBJN26vd1cf+ghhan2vlYBrP5c1vBVS4U7joyIGwa2Zq0
	 yjSBVzDL4bL1yb1aoRFIC1iXfnoWym8z/a8sPB29pdVds5VyfVHdWAhe38G0TUi/TK
	 hJoJrOgfoSinTP4ihsPx1St0COTJEOt0YSA4UURE7HGcOaUVlganEfDCq3I7/DKtmM
	 Mng00isuAem7euYzS7Olpu78gJb5uynHNqnlzgOhZeljVEme5UlEX9d8/JvuPBp1b1
	 fS3FPlxmAcmiw==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E365E17E0883;
	Fri, 20 Nov 2026 15:31:40 +0100 (CET)
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
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v7 1/3] media: verisilicon: AV1: Check reference frame index
Date: Fri, 20 Nov 2026 15:31:33 +0100
Message-ID: <20261120143135.71134-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120143135.71134-1-benjamin.gaignard@collabora.com>
References: <20261120143135.71134-1-benjamin.gaignard@collabora.com>
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

Make sure that reference frame index is valid before using it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
---
 .../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index 2a145433e6d1..5da59104a966 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -121,7 +121,12 @@ static int rockchip_vpu981_get_frame_index(struct hantro_ctx *ctx, int ref)
 	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
 	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
 	u64 timestamp;
-	int i, idx = frame->ref_frame_idx[ref];
+	int i, idx;
+
+	if (ref < 0 || ref >= V4L2_AV1_REFS_PER_FRAME)
+		return AV1_INVALID_IDX;
+
+	idx = frame->ref_frame_idx[ref];
 
 	if (idx >= V4L2_AV1_TOTAL_REFS_PER_FRAME || idx < 0)
 		return AV1_INVALID_IDX;
@@ -1262,6 +1267,10 @@ static void rockchip_vpu981_av1_dec_set_prob(struct hantro_ctx *ctx)
 		rockchip_av1_default_coeff_probs(quantization->base_q_idx,
 						 av1_dec->cdfs);
 	} else {
+		if (frame->primary_ref_frame < 0 ||
+		    frame->primary_ref_frame >= V4L2_AV1_REFS_PER_FRAME)
+			return;
+
 		rockchip_av1_get_cdfs(ctx, frame->ref_frame_idx[frame->primary_ref_frame]);
 	}
 	rockchip_av1_store_cdfs(ctx, frame->refresh_frame_flags);
-- 
2.53.0

