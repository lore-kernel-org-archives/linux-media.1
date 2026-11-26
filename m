Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795712466;
	b=GUXPShqGqmdP8PnvRy7Wj+HA1eAVqu2duTjQeYm6O5GiSVJRPyo8mzCvVwLp9aZAUmln
	 5QS6iclpN59AG/vM/5dU2jTA7NwLHN5ghqOmyAPsVXzpwVQsHhuQQGIEuun4QCcxFyyDG
	 fG6PBCXIyIiHyMSoxpzmGPwtt/oHD77n6I0Kr5VlA5mv6xw7nPPR+9TpkY62CrRF+5gbG
	 14AbFcBJqof7ye/ni6GuER6Ib5PE6ZMv61uq0FgQlSogjS7Nw4s1WMixpKCJAhhewRn6J
	 vZZ4IOqUXGXDUhmZgDKouBa3r3du87hkflIr3EVlYFRk44LnVGYcw3BqMAQinniSqdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712466;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ihZQ5p8dWmSnrX+zlAWQt/Oqd+bBwdl3OovemPu4ORI=;
	b=f6emCM5bP5v3mA16qAoYold+AXsQxJtmaZOpX2IYkHBx+HAW+YbqbCISBjE6Fkr1lULv
	 xnjUba6H57SFCkB6EwwLT/kRzVIYfEcz8I7W21SlEB50gX9roh5ar1KqBD+Su4/NNPJ3q
	 /BJtoOqUJePXLSmIbsMi88/DJpqIeU141QTERkYWxYtgBMJK/wLSNPDcUwPsd0wegE2S3
	 LaNG6CAXMDH6wP7nXFKH+UeBnIQ44+KYJJ0yUJtm06ptiBmlwByEp3VwHhBr1Uxg7qFfF
	 gz6bZYo8e/rOqqK7KtKdLxF2XiWYVn4A/h3p4JQW2I3YkX7ew2TMxSzJ8I1/Ce6aCPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UcTugY3x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B04606A32D;
	Thu, 26 Nov 2026 17:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UcTugY3x
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795712465;
	b=bj5kZFxx78KtBPMo2UHV00RSeMDw9ubGzFdq9kR0KcXIil9qZhXOiLF+jSOrW1Fugbs/
	 dQw0cAfNCzt+9iQZU4dol1RGIMCh8kebcriRCFXNPDAMqevxR0MnLNalu8/8Inm4xOu5E
	 3HJH7U1+zN+DADl4Un0KO/g0Y9Nz3ku05MBMmhMrWTGZWA0cwPHUgyJ7S/5jc9Z4yCAQl
	 KN3fUcYJHR2emggCtvRMYci/bXBJo9AlxKT6rCVGRAJClI1mxsHAszS3wG8ZXC8GCGxZj
	 /u1BqN/LzWdffHGFBug7zXOLErjauhTYteSzfmXkfIjFsM/SpzNQL9zONtRHmDJb74Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795712465;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ihZQ5p8dWmSnrX+zlAWQt/Oqd+bBwdl3OovemPu4ORI=;
	b=fhdxZIgEliyN9jf7hU+ZOhxIB6GRoVoMt4cUCBv/hEdimkwUpXSNU2ttEqB9hm0Oq7eD
	 W/I2pg7Bc6rfeXCF4/uiQRHqFJ2GRFQkT2d+bCCfASIVztOQjSqUKjAgF1GFcQ/484KYL
	 v/JD7RAKlJg2pPVjJOxgbqQ1RF5BHCAj9Z0t/B7qHVv1lcZ6xDZbT4PJ4b9Z357sCOxDS
	 4gGjyQai/kQUlQ8m1kH2yTxksKtAoccSI+XaznRzdK4AnuIVqQszqtPU7xD+DxQjtEcKP
	 62+IshMmVyc/hKl7nLwi8NTapNYAcNX/RX51R7pbiPImoQLB28gcUvXb14oxFy53Oxg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 05D541F000C6;
	Thu, 26 Nov 2026 17:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795712465;
	bh=ihZQ5p8dWmSnrX+zlAWQt/Oqd+bBwdl3OovemPu4ORI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=UcTugY3xdOmwOnykSNtSk4RUuK1BVHFmyqeaZAWsmRD3Hy9hrBNArbn3ilS2Ejk/V
	 iQgJgVqMFCY/+sWoy2YJUkE0lXDmZHI8VVoRcGsEdRoqF2Xo3aeB0bSGnYoSHFqYwX
	 sCY+Z4NZAKDS1nXA5yepcHMyXtPGdVQh9E9rovWdqv6csrVDiQKZMaB8g/Q4FQlsO2
	 b3uZHSj8mPgB4I6GvUlJ1SiluQpLOcDiioGcPlc6+IXHH0DUowPRAmWTxbI90nsq+L
	 2OA1KymtQmWDlrKFgE5kyOYVpjOJWz8DpJXU1s71y8yGf+jlY7xJPPDFrQL63/AClJ
	 8tvhbyRQX+eAw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 81DCC4D74F;
	Thu, 26 Nov 2026 17:00:53 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 17:00:54 +0000
Subject: [PATCH v3 2/5] media: verisilicon: Keep the encoder coded size in
 sync with OUTPUT
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
Message-Id: <20261126-hantro-jpeg-enc-fixes-v3-2-07357d84a64b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795712452; l=1236;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=n5bwyJSG49jkdtemL0KSh1+eA5aydhtKJOe/+pE2GYE=;
 b=NfLRhF66l70a82f9aVI0jgytzYgmcM0cedvnN1BdyhvfiTZZ8enGBRSy6G0WOqkP2S1ted/Id
 tIE6TxLkzHHClI43MKvJMIcHhEwyNhWcJuE8NM7clN1leLm4Bk4py6m
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Setting the OUTPUT format leaves the coded size at the 96x32 default,
so the JPEG header does not match the encoded frame. The OUTPUT S_FMT
resets the crop to the full frame: copy its size to the coded format.

Fixes: 953aaa1492c5 ("media: rockchip/vpu: Prepare things to support decoders")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 0d6d4f36d012..88b1cf66b713 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -561,6 +561,12 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
 	ctx->vpu_src_fmt = hantro_find_format(ctx, pix_mp->pixelformat);
 	ctx->src_fmt = *pix_mp;
 
+	/* Setting the OUTPUT format resets the encoder crop to the full frame. */
+	if (ctx->is_encoder) {
+		ctx->dst_fmt.width = pix_mp->width;
+		ctx->dst_fmt.height = pix_mp->height;
+	}
+
 	/*
 	 * Current raw format might have become invalid with newly
 	 * selected codec, so reset it to default just to be safe and

-- 
2.55.0


