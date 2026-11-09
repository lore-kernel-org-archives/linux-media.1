Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246675;
	b=rknJBoN1H0GlFEp8Xz1BrCMoEBgYvEJ5lCZtfa+oLBJpozegSiiE2hz4ifYH8zuNGpAB
	 tZMmFoWQtPACz6qnRKW2TRPJYk170R8qFhQrKM/n0mYON3UATtWB0XrBkTf4DfS13/jRb
	 Th13LSIyzcBrQO/xhh2OROqkl1hoRnqrvEFH57uHVGcHLftM+Gk+1XLXih/wbOiLwBWU9
	 tDbwPqIvh6XkxjKmHt1o/9Zz+M4x1E0PZahixrOMnG+iMgkYL5iQYfJh2EiWYwhln0xl+
	 PJAPqaI4/bVHu+bmL8tLjZ9xb5+GgFUfkZ0SGkTbZDJhd133UItNZSr6DO7ynQedGhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FShHtA5huvecuLISmJ2FgG/a5CACMUaXA0BmdO97r3U=;
	b=NY3oyzksJhc3YnUrKZZf2IEwCUbe7xDkdeWSmDf1WK6tml4udDyTupisP0kdcE/e0oGj
	 dfy7Xu6LMyYsXyIc4u7TNJ7L79JWsnE0YYi9/tHFIlfW7cim86eZpBHQJkGZy/fOBdzUr
	 33nn1eXenYuTSMCstnN3Xyhik3NR/sQoq4Mw33HSny9iWZbgoIx1S8asR2vYYu8SdOHQl
	 m6Cx04j/ZqI3TRkMq9K/V3npQx58YD5I3Ih4i+VdKiHfOGk+AxkTG1rAFbM1+Cq1ixrsU
	 yyCyHpZkt1Go+HM/uQvuyzX1YbwIfA92NVqh0diuqzTP8Wj0u3M7ZPsdduCM+tbn7DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UNwFi5bv;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27881606A33C
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 17:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27881606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UNwFi5bv
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4918c2d727fso610185f8f.3
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 09:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246673; x=1794851473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FShHtA5huvecuLISmJ2FgG/a5CACMUaXA0BmdO97r3U=;
        b=UNwFi5bvqg8g0A7o/oMros+kexO1RF8OHo7g/3U4dUv9E+x4kQX/Qbu2m62JqX7bOx
         CHW02LA+DN+Iy5DWJY51d8yxHqfxsBKnQ76vE5anT+0fOghiD7zCn7XOTmChmQf3f3cR
         iukuxPzMC/yHFdxMVdbpA53spr9PKot6wWQYrKFGNeW8wnK0DO5HOM6zaGq6dbprndL9
         C9gQE6DYOsF0/pHY45Hmgtzdw2aGdowG5LsC0y/oaHE/ten9PB4cT3i6ijQOutkSWYga
         vCacieylPS6M+IqcL+Pj1uaUDfFae5qkW0upI6pR1hs01o0e/+u2InhsbWhytYntasVl
         zY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246673; x=1794851473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FShHtA5huvecuLISmJ2FgG/a5CACMUaXA0BmdO97r3U=;
        b=f+GW7hqAEzSFWxswlgK2prYDzFk4yWjbVcmuLgc03xuTsFwUUsdWeX2tv5NWgl2g0o
         9e8gLX1Em4M22koAimnzRQeEpJ8rcfpIP7z6RpbB9vjB12bpQSujGs64RwWKOZvqgYdn
         DZfOSgvTUjF8Ap81rY0wP6EJ7/UFyTH6GlHe+4kAc7XnpIUMwfByruNFpIGkT2UCgMtw
         UFzaC2AQmZn+jyS9197bigGfqdXjHjeXjMtImmtRPAI9HQZp1Lb+wTLINS/nXlzde03C
         wfpS6syRJ4BcIfpppAWIzODNbanTtHXRQavVmpiyjalOsmeHLvE5QvtIOC+lAWN52SAQ
         j9Mg==
X-Forwarded-Encrypted: i=1; AL+hErGkZK9DFwE+cG3Cjab+fKFw/he7gIBt05dCGLU3Nk9Ywh2gEBdvDG6EAR3ioZUzM+1mtxQO3JeNwZNZoQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/BbY3LSIbrFOl9oy1OTd1KvZrUux5hDxJlwsBPIb4rhyAQ8eAU
	55lXwnWgluinPH/LemdnO3oqcwRjAz4qM1z6bMForXNbHRhFlQXX9ziv
X-Gm-Gg: AYBFou20m74vt+iL9Bgp52djQ3t6nMhMPZnGEKV9POY8H58aBAFQXPfGa8HfQtXNpQc
	Bz8YUvXmGSfy05s2s+xJIb5PRFki/HgMLueK84Z3YJFqXEJE/DCf/TgaHV2se50eiMZkjBG8Ir/
	GlHi1uWgUcX0yFRDWcYqMJIv0FdrjfwXqrTQg6tJ/saqY7mIJF9GizaT2LglgyWKwvCCVL/Cnhn
	xEVwhToguaD/kegPGA/O6WimSlAPBT5w2tDQoFv6DRr4YVFiEKNQ9u/qHBeoU8aw4KKxpXPzn6l
	DRNhArna5cXofA6zyI+1JDXTDEpj8FxLxxurEhmkra0M6Y+YAKJEHthGLreCn+YorcZrDqZAiHw
	C03lkuDSIPEM7SPJIQHR00uxCSh4LveaxIu9mKmgtrbLm6exN4zC2/aWa7yAfNVb6vkWPLBHb2/
	iY9van/HJBDCQ2jT6YVrq92CgQbf35dbih/FzKxwq4GVIb+Q+sr/pGRyd0zVVRQpF8jb6PLk96O
	MyAU5JZF6F4fco1Bwzp/lzevkZqDH4jbWIKjMfXE1gtyLWnRa3Tdoi6Izyt0/w5SlHqlVEwtbzi
	+1Vmg436XZAKW6cUouQZ6ZNflDiT3TVsZh8QZ/8liQR1qOEnWspYjojhJXxoY53jrGza5eKaNW7
	aoN67IroALE4VjOCdCc5T2utL8XYO0Li6Hp1cyuY2Z9nq61LRH5amG3QAdS3z974SIMF5JmMx7G
	AqJqtpy/oD3PZHeiah1j3JHRZ9ueIcQL+TNfojRMohpj5zmmKPB9wXrmx8yabzR4R4ri4DeLErB
	z7H3WSUcfTGHoJn9LPQRYMXIn/kXvDOWB7/REuMdZM+KNXToslG+XMDBCfPHliuGKGinpp5
X-Received: by 2002:a05:6000:230b:b0:48d:fdd0:6ce8 with SMTP id ffacd0b85a97d-4982b28a797mr485950f8f.3.1794246673337;
        Mon, 09 Nov 2026 09:51:13 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:12 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 06/11] staging: media: cedrus: mpeg2: fix the references of field pictures
Date: Mon,  9 Nov 2026 18:50:11 +0100
Message-ID: <20261109175016.42061-7-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
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

The second field of an I or P frame can be predicted from the first
field of the same frame, which the hardware takes from the backward
reference. The driver programs the backward reference passed by
userspace instead, which doesn't point to the frame being decoded, so
the second field is predicted from the wrong picture.

Use the current frame as the backward reference of I and P pictures,
like the vendor library does. Also fall back to the current frame
instead of address 0 when a reference buffer is missing, so the
hardware never reads from an invalid address.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 315b0e5b3c88..9bd7f3ded83a 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -56,6 +56,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	dma_addr_t src_buf_addr, dst_luma_addr, dst_chroma_addr;
 	struct cedrus_dev *dev = ctx->dev;
 	struct vb2_queue *vq;
+	struct vb2_buffer *fwd, *bwd;
 	const u8 *matrix;
 	unsigned int i;
 	bool field, tff;
@@ -149,15 +150,29 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
 
-	/* Forward and backward prediction reference buffers. */
+	/*
+	 * Forward and backward prediction reference buffers. As the vendor
+	 * library does, I and P pictures use the current frame as backward
+	 * reference: the second field of a frame predicts from the first one.
+	 * Missing references also fall back to the current frame.
+	 */
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 
-	cedrus_write_ref_buf_addr(ctx, vq, pic->forward_ref_ts,
-				  VE_DEC_MPEG_FWD_REF_LUMA_ADDR,
-				  VE_DEC_MPEG_FWD_REF_CHROMA_ADDR);
-	cedrus_write_ref_buf_addr(ctx, vq, pic->backward_ref_ts,
-				  VE_DEC_MPEG_BWD_REF_LUMA_ADDR,
-				  VE_DEC_MPEG_BWD_REF_CHROMA_ADDR);
+	fwd = vb2_find_buffer(vq, pic->forward_ref_ts) ?: &run->dst->vb2_buf;
+	if (pic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_B)
+		bwd = vb2_find_buffer(vq, pic->backward_ref_ts) ?:
+		      &run->dst->vb2_buf;
+	else
+		bwd = &run->dst->vb2_buf;
+
+	cedrus_write(dev, VE_DEC_MPEG_FWD_REF_LUMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, fwd, 0));
+	cedrus_write(dev, VE_DEC_MPEG_FWD_REF_CHROMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, fwd, 1));
+	cedrus_write(dev, VE_DEC_MPEG_BWD_REF_LUMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, bwd, 0));
+	cedrus_write(dev, VE_DEC_MPEG_BWD_REF_CHROMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, bwd, 1));
 
 	/* Destination luma and chroma buffers. */
 
-- 
2.43.0

