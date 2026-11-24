Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526306;
	b=TGaCcnbbl7oHlXOeT1rkgOSYBPvmu2VE0t9c1QyP87nOsUhv/KtrntEKRJwlPSW1AO9O
	 TGNWTpcE5L8mNtdSYzNAfErAS2Iq1N5lxHDUTNj9CBMSpUWyk7TQJ5cYMDmjtumhyBHT0
	 cKpRRsD/z0qzLiFnnxEOrd1sBMTltySQGA3K9RK6hUUWAY8F6H1BkURt4XjGRby5wIu/o
	 PWcBdb/8hWEW8DIp/knKiEKaDIraoGj3B7WIPrydibncg0vbomgyVClzyb61Z2BqKtxdI
	 AAozH8mtY95SI8+N7MhHfEJDfBqXmNraZQ6vN1dFkzr+n9pkFOD6Cxv2TKJZxenMAuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526306;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fX568TPs8kUQKshLGJog/+ffqrba/CyBoJwfCKQyvrA=;
	b=czc6biZ8Roz64F2fDlH3M1/5+VhEQ1jf0ay4bJcZuTXILbaC8mn2GvzspLoBEX1KKS5y
	 PjPmWufuhp4QTBECzAxv1ztPFf4QdX99JLdnEaDrZHMjInNJTE6HB+e+If1hQMwQXblRN
	 +djMO288GPYPOBObolhgetEfMbnakhVyWK1bi74nxwFpvJkjYu02wdT1efyT5q9kTDwRJ
	 rCP8RSun7d94GiOj7twrKcmxwSaF0OSWLM3vLH6wCeAlyOXxdX9uyvG0EWNWvJQc7W1Qv
	 46RCJLRm/xdqtph5F0OpgTjrkGxk96tIVc9NP9Zpi1Fc+bU6JJVFd5AhPF6V273CR5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VRSi1uR4;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A11606A321;
	Tue, 24 Nov 2026 13:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62A11606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VRSi1uR4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795526304;
	bh=6ENyECno82An4Ck9+sSE8OK/4a0UVg9XeBvynkWIlPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VRSi1uR48b79xZq7LJecZtYkn4eis9B+qFfOcpAYGq5SB7a1X5YZrQ+pOxpWKgeuG
	 5Z4s7OHMBCrJ8Jj0ZDTKe2vwDyiv7aZSBByd8UFuTnJ+l7jue7LG3wV3OCXPSBNYKF
	 EednPNaj3N+00+iNH59fko2ZHdUbRioSKkeormq0pwsoHRLYk0l6ZSNFsU00wtOgH9
	 RV2vJBa9GZx+/tzxXMbCb62xHnZ+AucBOVStYvl8mlf8o5Qz/8/D8pb5qbGAZUThBr
	 TDocy+5AIfyaBa6Y6m752iD0hTWbc6zGHHLoui1ONPya0aUEaICYzF9OqepmObCMae
	 WTgHSZfQCbG2w==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A91AB17E0BCD;
	Tue, 24 Nov 2026 14:18:23 +0100 (CET)
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
Subject: [PATCH v8 1/3] media: v4l2-ctrls: validate AV1 reference frame index
Date: Tue, 24 Nov 2026 14:18:14 +0100
Message-ID: <20261124131816.115131-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124131816.115131-1-benjamin.gaignard@collabora.com>
References: <20261124131816.115131-1-benjamin.gaignard@collabora.com>
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

The stateless AV1 decoders use primary_ref_frame and ref_frame_idx[] to
to find the matching reference frames.
V4L2_AV1_PRIMARY_REF_NONE is the value of primary_ref_frame indicating
that there is no primary reference frame.
Reject invalid indexes to avoid issues in the drivers while validate other
frame parameters.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
changes in v8
- check reference frame index when validating the frame before
  calling the driver.

 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  3 +--
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 20 +++++++++++++++++++
 include/uapi/linux/v4l2-controls.h            |  1 +
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index 2a145433e6d1..bbfca34688eb 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -20,7 +20,6 @@
 #define AV1_REF_SCALE_SHIFT	14
 #define AV1_INVALID_IDX		-1
 #define MAX_FRAME_DISTANCE	31
-#define AV1_PRIMARY_REF_NONE	7
 #define AV1_TILE_SIZE		ALIGN(32 * 128, 4096)
 /*
  * These 3 values aren't defined enum v4l2_av1_segment_feature because
@@ -1256,7 +1255,7 @@ static void rockchip_vpu981_av1_dec_set_prob(struct hantro_ctx *ctx)
 	bool frame_is_intra = IS_INTRA(frame->frame_type);
 
 	if (error_resilient_mode || frame_is_intra ||
-	    frame->primary_ref_frame == AV1_PRIMARY_REF_NONE) {
+	    frame->primary_ref_frame == V4L2_AV1_PRIMARY_REF_NONE) {
 		av1_dec->cdfs = &av1_dec->default_cdfs;
 		av1_dec->cdfs_ndvc = &av1_dec->default_cdfs_ndvc;
 		rockchip_av1_default_coeff_probs(quantization->base_q_idx,
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 6e751a043a21..f4c2a04fb721 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -817,10 +817,30 @@ static int validate_av1_tile_info(struct v4l2_av1_tile_info *t)
 	return 0;
 }
 
+static int validate_av1_reference_index(struct v4l2_ctrl_av1_frame *f)
+{
+	int idx;
+
+	if (f->primary_ref_frame > V4L2_AV1_PRIMARY_REF_NONE)
+		return -EINVAL;
+
+	if (f->primary_ref_frame == V4L2_AV1_PRIMARY_REF_NONE)
+		return 0;
+
+	idx = f->ref_frame_idx[f->primary_ref_frame];
+	if (idx < 0 || idx >= V4L2_AV1_TOTAL_REFS_PER_FRAME)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
 {
 	int ret = 0;
 
+	ret = validate_av1_reference_index(f);
+	if (ret)
+		return ret;
 	ret = validate_av1_tile_info(&f->tile_info);
 	if (ret)
 		return ret;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2e..82023fbffd6a 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -2940,6 +2940,7 @@ struct v4l2_ctrl_vp9_compressed_hdr {
 #define V4L2_AV1_MAX_TILE_COLS		64
 #define V4L2_AV1_MAX_TILE_ROWS		64
 #define V4L2_AV1_MAX_TILE_COUNT		512
+#define V4L2_AV1_PRIMARY_REF_NONE	7
 
 #define V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE		  0x00000001
 #define V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK	  0x00000002
-- 
2.53.0

