Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795137042;
	b=mv0OYt4k9axxUGVIFD34+WfnDN/FLgp3xk0RLD7gdGBnqQVRCLNirAzHZwRiNNNipFpC
	 VDuwh5stCXswj9dcjKgj1MFvXk695sWVrA5LhQ5o/JoGgPUdapSotqcUKIo6ACWmnQA++
	 33R3jdTPSDq1pGAbz6BkbalVE/YArMOyeV+mpoHi3SsnnM8YCLQLYKr4MUaFxNYa7lZPS
	 o8jaQM6LiMABlzPm/RBowpT5xer8S0leHe3fzLUp2qhyC7i36oXS3nFu2sfZwvf21ahgm
	 1BvKA+YNU9gh/VYLqqaRJu+4SK+7HEiLqZOboFaE0MLQcg6jxqz9nco3kUfsFXJzWyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795137042;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7duCnWH8krM8z9+VrW7onyigZ+9oryd9rni6Jfwyl9w=;
	b=Cm38NOJL8Qgl5xNU4tBQ4LfsLIigtwzQqQYuEUOdLGa1ETQF9Z9s+IA/jhjOrFr+EWIw
	 SvZbox7ELbf5sdOf061Z1JRliH7OpdPoTgJhAB6LZd8WmeRuCaddQ4sKmxG8D95WphrRA
	 FquGG/ihF3OCR9//U7DgZ0kgZWSIXRrUdHAUTe3hk9vKoSSR8qklkwfEbwwOHlo1awDnh
	 IcbN/kFHnkITnqx2i+5+GRWoLLvZILmesslOjSNwVVAwkji5CEX6liw++tgwnvKTolZwX
	 A9AAEsdkHE7F33j1UeeFIXmVdzNZ3svjNffVHuowqlKVG0wn5CP5AH2omrEb/rxA2Og==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SOs7uVy1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1719606A5C0;
	Fri, 20 Nov 2026 01:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SOs7uVy1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795137041;
	b=kLRAsry49vnT9xr2/QCCfZu/oUOuOkpUAyuD4s/HP8JVFMDfSLXdquGF2BO+hcId4diZ
	 yxOlO21RIKAzY3ic3FlDmgmYbcgCeTQrCuULPe19KAY2lAfsyQjwVnl0Enud2qHBs4NBq
	 9bgn68Byr+rb4ktox5yZaXTp6ENOeLnEMsXF2I6SWsKVK9blcnMQffgh7vI1x7uJ1om0z
	 I9JV84sZ5ygCfJzoZ1IN0G74jnAwoweOx+P7fGhC+S3282bgFRH/Sqw5El8QxMx0gZ5VI
	 b+wRONJXY+nGTlURPeR7BJl12QvcBy5oAuLJDVGo0P5iiDNTyAiSG+LV8BaJMcO1xRA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795137041;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7duCnWH8krM8z9+VrW7onyigZ+9oryd9rni6Jfwyl9w=;
	b=Tlo2Kxf5YNHjcD7kukl3amsRCVaB3ZOzC29zAVZxG80yQdUrbQyrDS/VYv8Gmkib6PtT
	 LODaD1lyQkhFnWKHTED1rcEkxfOh/rmjMtYR/vfmLERecpyjJ8sqUECzxbvs2szqdjTsG
	 /PGC7ssW7UCZ2ifXCBjzoyuaZkPzK/xZ2XGbfgFbxyXsIZvhJMtFzp/Er1aaP4scVfoYV
	 f2fC5egVWqSfSwE397icpS5QvBPF28+gdDn6bHJtBvjM064wJSnKiJ8kCIerCAvS2xghR
	 u7P7xO4ZyC0BE4amwT44P3M5lH1q54KtYV7+ebPJwbutJiQ8m5undrpH5XCmH9guqug==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 707111F000D0;
	Fri, 20 Nov 2026 01:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795137041;
	bh=7duCnWH8krM8z9+VrW7onyigZ+9oryd9rni6Jfwyl9w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SOs7uVy1kyWSzfXRFke+sxBjFeI01b7JTq5+M9JKrH4clSEcLBrImX5rt2465xtep
	 6oc/HZnNhHLZAyVsC0E4tgX+MZxaCWaNgA6xO1DAKKDEnR7T2vgNiIDnDac/loRkEG
	 IL1+ZZGN309TU6wIwD0f8SAeyXhczoBz1yvkDjacBQGZGeuVn91yvaCQQEqc2ftEDe
	 8TbMqydyBAo6GmfP/vXJRhbNC6CrzbGB8j7fOt7YR4nfriR9tgMvHruFLx9/fscgTf
	 x+8hG4WKatasEHpvKvqqqm08L7QRzVruOCR7nLQ0+S42mQJfG1O3GcgJ1rEnq0Oj5C
	 6FEYQ07JIMM2A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F29D742607;
	Fri, 20 Nov 2026 01:10:38 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 01:10:40 +0000
Subject: [PATCH 2/2] media: rkvdec: Decode monochrome H.264 to GREY
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-b4-h264-monochrome-grey-v1-2-887102a688fd@gmail.com>
References: <20261120-b4-h264-monochrome-grey-v1-0-887102a688fd@gmail.com>
In-Reply-To: <20261120-b4-h264-monochrome-grey-v1-0-887102a688fd@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795137038; l=2530;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=PaUrtuP231glBes9RSGbgqUD4OET3z2k5Uwhdrm6JOc=;
 b=ziqFhy0u+TcXxphBaKndOpcw060D4mWES5y6K3+Q8++wHVqYdqkdxbv075+tUd/TcQEdUHgXW
 bAsn9WYaHQLC8/BMFlgDI6p46QTkdHZA8gcNCvItWxKy6W3ODncr0yu
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The decoder writes only the luma plane of a 4:0:0 H.264 picture, but
the driver offers NV12, so userspace gets a chroma plane the decoder
never wrote (green or stale pictures). JVT-FR-EXT HPCAMOLQ_BRCM_B and
HPCVMOLQ_BRCM_B fail although their luma is bit-exact.

Offer GREY for 8-bit 4:0:0 streams. There is no V4L2 format for the
packed 10-bit luma that 10-bit 4:0:0 would need, so those keep NV15.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c | 4 +++-
 drivers/media/platform/rockchip/rkvdec/rkvdec.c             | 4 ++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.h             | 1 +
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c
index 54639512e456..8ad41c4e56c8 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c
@@ -146,7 +146,9 @@ enum rkvdec_image_fmt rkvdec_h264_get_image_fmt(struct rkvdec_ctx *ctx,
 		return RKVDEC_IMG_FMT_ANY;
 
 	if (sps->bit_depth_luma_minus8 == 0) {
-		if (sps->chroma_format_idc == 2)
+		if (sps->chroma_format_idc == 0)
+			return RKVDEC_IMG_FMT_400_8BIT;
+		else if (sps->chroma_format_idc == 2)
 			return RKVDEC_IMG_FMT_422_8BIT;
 		else
 			return RKVDEC_IMG_FMT_420_8BIT;
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index fbcd0f175ad3..548659d23bc2 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -414,6 +414,10 @@ static const struct rkvdec_decoded_fmt_desc rkvdec_h264_decoded_fmts[] = {
 		.fourcc = V4L2_PIX_FMT_NV20,
 		.image_fmt = RKVDEC_IMG_FMT_422_10BIT,
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.image_fmt = RKVDEC_IMG_FMT_400_8BIT,
+	},
 };
 
 static const struct rkvdec_ctrl_desc rkvdec_vp9_ctrl_descs[] = {
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index a24be6638b6b..58c53a1f58b3 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -108,6 +108,7 @@ enum rkvdec_image_fmt {
 	RKVDEC_IMG_FMT_420_10BIT,
 	RKVDEC_IMG_FMT_422_8BIT,
 	RKVDEC_IMG_FMT_422_10BIT,
+	RKVDEC_IMG_FMT_400_8BIT,
 };
 
 struct rkvdec_decoded_fmt_desc {

-- 
2.55.0


