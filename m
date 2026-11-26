Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795712466;
	b=44qIIy4SplYmKyFUtUcqJplFVI2jpz+Egk63Lo51AZKpWdQd8dkzS7N8Qu9T16eH0eui
	 sumPBOVKx8rmdt/KkLNpHwwbjTDFHMlTHB1aV8gbIsiUzEGoLCZ5OaowvB2kxC6NtWV4Y
	 +jkQoeZ0ljTMBBwj2tWzAVtDfUGfSRUL4jx+ZoAXhSohkPrEiktbcBuNOcJsUuAG96jJt
	 1X0l588hMQhyvCSbpadEj+1KvpQsRha2eINaRvfQESIm0c7Z3AAUES0oTalKcyhOhg3uB
	 0Y5QTnFBm7huGUPMrcftyLsOx8L9qM7ylUY9OtPMc5uH5brmXNq6zAgEdcYiyeonhSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712466;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hbkau+Lk5dpxesTjMuO6qlJZUIP3DJh+aDfaxG+Hca4=;
	b=ysvPP/eMvcgJSiQ04COAXHltP6CGL9Sc+h1gU1QQc95+3CTvCnN/Mwsb7t0btPo5dPc1
	 XqjXUpg+36nvWOj/FUWJPbTIDyZ6zBb8hhUg3UYLKifoga82T7pBCyOyuWJPz9Vx5Rfq+
	 /em6wDfIh1D/HSIDatSd/UFUb+xzuPi8L70BrcHSqdoc8s99AsH9olpvaBBnk9IKjwBmp
	 3nhYJMclKF0lMZCMY8NdPVblKz69wNme4PVITd3Ty+iwPIoKgcvNkw/fpNAwbDwGV5xSk
	 CGg9KvhMOD7Oe0oLu9MuCg1Qda8c+p1IS3ZDHX8EDS3ucqo49xQBZ8s7J1u8qc13YeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Axr6ng/e";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B9A606A33E;
	Thu, 26 Nov 2026 17:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Axr6ng/e
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795712466;
	b=BEKoULBeRPnlcgeBsKzQWZwOc0IJNdN3re5HZyMGSvzMp/MwOIYxNg8aWmkQnZI6nbRT
	 Dnapml6czHJD6xLtr12/mYUCqgUzY+DmlS/63ms+CdzGpYVCoO0631wqjWwhvbJDExjpt
	 AFx5ccQQq7+mO9bfRMsygUE1xck+PeZleZlQ91DNlXyA/i1g7XdLKViRTXP8h16jHnq2E
	 auJw2GlRJ7QOGUAYiTWQcobSRR0Ll/9F4qFcLmeO79sbVZmcJAIU/CBWbCQKFQOyKINoz
	 t/fQ9Z/EtJM94/0wVll2PwxiNNpHRYluW0KEaFD7rvdWY847gjWXSY2vx3crf25MxVA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795712466;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hbkau+Lk5dpxesTjMuO6qlJZUIP3DJh+aDfaxG+Hca4=;
	b=nWVF/qPFqG5Sk4zddcrkLVLW3doLmTd1Abh7ogBZqDjZ3cN6G8aR2aLgzw6GjU+DeXYM
	 jByyJo/8vtI1/oiCw7JJNSCt1inaIkju2xZ4Q12xmg/MP6gv7vTD1uUUKnyDZjE3uTFKE
	 qNf2jO92zQbQ8ROdDNavT01fjmRuyoRNtdzGOyG1LWo6nNzegv1lU826YORKGcbCqp+Tf
	 uIOnRVFxnFd5KoNZTI19D5CjE6b5FZwVaj296k3m3wVZhSJFFqL/5IdVW6pHPSTuh28Ze
	 qm9IkR1mUE9rKRPj6njEtE0flAI7KRalnXchAFRPcMgnLNmvd2dd/miMvRUTN05oVcQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 45C0C1F000CF;
	Thu, 26 Nov 2026 17:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795712466;
	bh=hbkau+Lk5dpxesTjMuO6qlJZUIP3DJh+aDfaxG+Hca4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Axr6ng/eWRNqH7IxrFL+kqLLOZahqP4dmwYX5zsUBfbT4oDnZDiA284n4XsV8xf2W
	 5U3ahDC1CUSY511OgxvbrKSWb1EnlU4zHhEimQdh01ViM7GYB89s9Y40MzYlYsiw9v
	 8q/KlAJLAOrmd0BdbqTV6rjxc9L38+xGUPECL1ZxKZAeh8TT5aunkz3sf93n6a2FF9
	 lHMvr2C86S3jNml5r6soosUjZUzynbIt8YtyIGWuSlHz96nhFbjuOgYOkKfTmHSzvM
	 jYlkqWdubPXjYB4mSxo/+OLvRWlSMiaUfhcSdRNY+TpQ6NIEvvtgy8bF//tl4oZy+6
	 Ej2WhQCNyEEDg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C1ACA4D757;
	Thu, 26 Nov 2026 17:00:53 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 17:00:56 +0000
Subject: [PATCH v3 4/5] media: verisilicon: Restore the encoder raw format
 when its reset fails
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
Message-Id: <20261126-hantro-jpeg-enc-fixes-v3-4-07357d84a64b@gmail.com>
References: <20261126-hantro-jpeg-enc-fixes-v3-0-07357d84a64b@gmail.com>
In-Reply-To: <20261126-hantro-jpeg-enc-fixes-v3-0-07357d84a64b@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Sergei Khomenkov <shomenkow@gmail.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795712452; l=1799;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=T4JxJzrpJHZ7bcC2wFn6o1S3mEh6CI2vghqlDg9OD7U=;
 b=ryypf3/xIzVrNPoN9rN4vu2bdfqVXd85Gr/I4tuCQaAXlLpV/0aPDjaYFtCEM9drV8h8hlwra
 BGr2IFX8va8AYYWgYws9LjNpF5bptF6PSpeZy7D0EOagqZ5fytNFpJb
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

hantro_reset_raw_fmt() sets ctx->vpu_src_fmt to the default raw format
before hantro_set_fmt_out(), which fails while OUTPUT buffers exist. A
CAPTURE S_FMT then leaves NM12 in ctx->src_fmt and YM12 in
ctx->vpu_src_fmt, and the next job reads the third plane from IOVA 0
(v4l2-ctl --stream-mmap). Restore ctx->vpu_src_fmt on failure.

Fixes: 14b4bd01f8e5 ("media: verisilicon: Additional fix for the crash when opening the driver")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index b91c0ef9b6a3..69e1ef985bff 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -455,7 +455,7 @@ hantro_reset_encoded_fmt(struct hantro_ctx *ctx)
 int
 hantro_reset_raw_fmt(struct hantro_ctx *ctx, int bit_depth, bool need_postproc)
 {
-	const struct hantro_fmt *raw_vpu_fmt;
+	const struct hantro_fmt *raw_vpu_fmt, *old_vpu_src_fmt = NULL;
 	struct v4l2_pix_format_mplane raw_fmt, *encoded_fmt;
 	int ret;
 
@@ -465,6 +465,7 @@ hantro_reset_raw_fmt(struct hantro_ctx *ctx, int bit_depth, bool need_postproc)
 
 	if (ctx->is_encoder) {
 		encoded_fmt = &ctx->dst_fmt;
+		old_vpu_src_fmt = ctx->vpu_src_fmt;
 		ctx->vpu_src_fmt = raw_vpu_fmt;
 	} else {
 		encoded_fmt = &ctx->src_fmt;
@@ -481,6 +482,8 @@ hantro_reset_raw_fmt(struct hantro_ctx *ctx, int bit_depth, bool need_postproc)
 	if (!ret) {
 		ctx->bit_depth = bit_depth;
 		ctx->need_postproc = need_postproc;
+	} else if (ctx->is_encoder) {
+		ctx->vpu_src_fmt = old_vpu_src_fmt;
 	}
 
 	return ret;

-- 
2.55.0


