Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795271125;
	b=Q4TAGDriz99+sittZ+6unLhpk1iZlYrdU3hYuca/0K2ryZwZT4+lsKGEmoVYbhmfACel
	 FrB6jltAk+olOkGb/l/c3ojP/9FzmYZGina4lwdfigQhkCPWGfsFZOwbiO3w3wENaindi
	 aikptEtZ0GlP1PnXJ4oNpJxVV5NCuIxBKKIt0rHBFnMqlYJwKMtVGnOmoNAfI4yx4pTpH
	 WtJrIH7s3i7AX5X7KI7yOLAMu3GKEhJa3UIh4FP78eYdrjFLkF8LyX9ir2r8dZXhLKcc7
	 sCDnwn7AevezwgsEucx/H6R8uOSZYfaFHBLCnKSurprqUShGnbtP9bCH6pYnCn1citA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795271125;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7duCnWH8krM8z9+VrW7onyigZ+9oryd9rni6Jfwyl9w=;
	b=wVJI4NdVcuLasNvDcslruAw0ywST5f3lXRj3s3eMpMWiTLXBke6hmAnVANyteHHVh4Or
	 YT6LVz48MHIYrgu/fVKqHt7eQldiSXyO215EtunLHQy7iAGn8bvICLnrHmZRmkhW6sOYZ
	 TQrDQ2bP3wnD3iRnb2gH7H36ozXJIu+CO1XfXSGRVl1DXGvbDlkfelU2RXyweRegjpZs6
	 KwkJMQWri0kVrHbmjGO7WWvZituU7dezgaLPKMbWeeL7/aaZYAViAliEl//cJ+8jnEICH
	 vLJGDnlWsd/FRdE2RmTOlceE4QdeBem8EhOCB2oWkcVmTa1uY/U1Kczu5XhReQMwnxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KmXW6l6A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88E0606A320;
	Sat, 21 Nov 2026 14:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KmXW6l6A
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795271124;
	b=N00K9jTEZrK3Y9J4SNruasc/O216RxsQwDeNiK6+kSaiU9zxH38G4rqydxFZ1ceaq12h
	 pXlEOdx8vckT3r1f+vlD4Ejcu4/lx+PVF25Xos8WrpLmbEYwpZBxA8HWWY/61/IVSbigM
	 Vp6avnKEjE+ZpQKOX9jIVYMFnnzngOlIXfgzvleFX4rI10xXNk/G9ftzUs7dDvKKh+SU1
	 uM7UqujCvAj+BOApRd3LO8qs/DvpnmigAM4l1mTX17QyzzLIOlwJNY3ej1z+HPuGnALNY
	 pG1hZztV8koPoMUVcfIHqNvFLt2Po8comhg03Q6wS9L9NUdwdXMtLAv9EYBUFh36qPQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795271124;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7duCnWH8krM8z9+VrW7onyigZ+9oryd9rni6Jfwyl9w=;
	b=uumBqPQKmIII03ItC8G5qU5tU6voNFBalwDhOLtE0I++Je+M0DYh2BtggAWfTOCHtOs8
	 rn+qgj1Bt0HVBvZ+H4ueE7i7k7BNmzqVmP4oU1sDHjXTPCQhScV97Q92aO4NiBktqn2RO
	 IMFm5NzbswiRfE6P3QXKgtsTdR0EmOLFm3e+nOry5erF5k8TQI1PU6MHpvYaIEP1T91hi
	 KQ8EZ9Assp2NURkNhIYHqGzwggB6eYwMkYooeyR5LtdCBD6py5/TQzjAGwjRa8QE5zdwy
	 IlsTIePmyKwsgCuk5mBJ8JLYh4hq6bbXw+YuzCbxafXEsbtKlSubYb1QSzSdUlclJ6Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E9ACC1F000C6;
	Sat, 21 Nov 2026 14:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795271124;
	bh=7duCnWH8krM8z9+VrW7onyigZ+9oryd9rni6Jfwyl9w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KmXW6l6ARR7wlKOMauv6eMYu8eabXfqx2nJL3ep+8xmXjCDACTGE8hmX6Tx/cvhzU
	 MefQfUZkzKJi+rp+jl85WKeNpM0RHXjRaCNnI0EsGZFs7BUy8dJe7+H/pJU5+SB5N9
	 ThipPGQUhIB9n1YeN4TRPQy+tJtPRiod8/tpSZVblCvQwoFTaA1vsOOVG63IN+6GLo
	 KeAnYzgJhF1r1wq6rj3izOnU1gzmbEVV8sBedgLtPSZhljSGQNdntCZcLd87iCGCiQ
	 UUmWjU6d9sQ2pnefXyrklBTR94iqkphhYzqx9A+1+tPxoFAbIjw59eU/21hR182/Z1
	 +hnJg/xJq7YHA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 750174BCAB;
	Sat, 21 Nov 2026 14:25:23 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 14:25:24 +0000
Subject: [PATCH v2 2/2] media: rkvdec: Decode monochrome H.264 to GREY
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
Message-Id: <20261121-b4-h264-monochrome-grey-v2-2-ffe7f2383cbe@gmail.com>
References: <20261121-b4-h264-monochrome-grey-v2-0-ffe7f2383cbe@gmail.com>
In-Reply-To: <20261121-b4-h264-monochrome-grey-v2-0-ffe7f2383cbe@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795271122; l=2530;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=PaUrtuP231glBes9RSGbgqUD4OET3z2k5Uwhdrm6JOc=;
 b=y/1yCxtIXKH7PSSDwSz4e9oAw7VMWTHsbk5cgfs2stAayL7ItyV+UH/eYU8x3y14IicrWk2X6
 2wYgLxw2liUA5D3NqRvGnifFVnOWiFAaOe/mMmno+877gjvhS13jL+V
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


