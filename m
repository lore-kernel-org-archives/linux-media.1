Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185109;
	b=0JmnUx7LKPy1X5F7f2Kt9z/L7zGtlJon/YX3NqNyy/7AE58rVS/buiI8mhsca73WHszc
	 ztpWV/yPh+byiBP8etRL0IYiZszajDxW9FLfM1CXTL+9PGAav1NbwNjcazQ2IIO7jNvWZ
	 OexR/MBqgusGmDthnA2gy5KcSNVa5xoSIdoY8kJyrHxohLq11l0CDXXsNp7jq5Kr6nzcO
	 An1eyzGxVeQi1MbGt1bea3i0rLdgLJ3SFazajSUh6emk+TYe7dH1dZeBk3zpHt/V2WXL8
	 1tbatbtbgfRlbO5LM02eU17bRPivBqjli94xFrY7UWd2YcXw8UoPzJW+hfPwXQa6p1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185109;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eTqndXSoVjv8prCPAM8vYvbnqbOARC3EPYXvVmzxF6o=;
	b=ykrlJRnFwfhwaywZWTwAzFN/DEYMI0V+m3uWZGnqnVR0Xnp/5nwcTYOdtTmqidruYPmB
	 fm+zDadBBOEQjKaJ/6H0FBM6NhnyblIciHT9so8aLP/FqfuzGvAohkuOzDXTCk4JNQwx2
	 KX51Pd7RMLckrC2RWrzr0I4qCAGrpE1r7DJuVpKDPDsQLdgehUmShzCxZYUta0drEZ+bd
	 BoZejOHzt2Z2NZ3e/gHIm1PzTMvqN/GgO/hWQyy5f/cljr7lF/bypy2RhI5mCiNrahG3B
	 mjlOLzzyIyJ/plgp2nFM1d81q2v/ygfltQc/W7Eu8jSRi2dv5HGTVog6qnBbrYZJMjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=D3U3CzEf;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDDB606A32A;
	Fri, 20 Nov 2026 14:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FDDB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=D3U3CzEf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795185101;
	bh=1ZPtzm7B2+TCZF2ySc+x5bmtJZBLwrSuv34z+pW3mqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D3U3CzEfU0Q9CCZYqO2LIecxvGVEvDk6+1OlgUlAUYo8maRf7vBpM41MgwdXXEBDC
	 YkVpk+39Ub9KMRgQ1erSS68JXrBxyRvJQ5aRwUPdaM/Fmbx5KlK1mGSWZYtEOptbnE
	 3ctFHwccMyuFyt8zGpuw+AMo8/SW0bAK0iotBGKUvRSLlM95tcCLmVBvojnySSoZRT
	 YLzrbKF4HuT9iXAvS3DJxLNzGd7wEjF8szi0+EFkqBQiS74YkU4z4qRsBehDFaXoIv
	 4H5S/mAnEFoAhT4jT5Fxp/4CsLt070lGE9U1XfJALzbFTg9wojoJWjo/xwsTkXT882
	 3I+e+x0dbR/2Q==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 51FB817E09F3;
	Fri, 20 Nov 2026 15:31:41 +0100 (CET)
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
Subject: [PATCH v7 2/3] media: verisilicon: AV1: Fix luma size
Date: Fri, 20 Nov 2026 15:31:34 +0100
Message-ID: <20261120143135.71134-3-benjamin.gaignard@collabora.com>
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

Use the values computed by v4l2 helpers to get luma size.
Unlile before this will also take care of padding.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
---
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index 5da59104a966..5e0cd5268f22 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -221,7 +221,7 @@ static void rockchip_vpu981_av1_dec_clean_refs(struct hantro_ctx *ctx)
 
 static size_t rockchip_vpu981_av1_dec_luma_size(struct hantro_ctx *ctx)
 {
-	return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 8;
+	return ctx->ref_fmt.plane_fmt[0].bytesperline * ctx->ref_fmt.height;
 }
 
 static size_t rockchip_vpu981_av1_dec_chroma_size(struct hantro_ctx *ctx)
-- 
2.53.0

