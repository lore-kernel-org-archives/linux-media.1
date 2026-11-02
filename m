Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639005;
	b=vax1ywnF3ckubazck2G1qnY0Zu27Y6yZp9VZUUTDtuBC9dpxgqFvsB5W+8YAWmBngLcA
	 koONO+3dTkY7ZwwXKE2j8Vv9R9CzjphWAz2/WKYQC84mwEYjYpdEwtjSgUK6dWWk9HbRQ
	 pU8E+84vA+Y8zjIPKFlvcnXiyFX0XRAFTQcUD4+CxeE54Q8Dw2ysMUj3kDn40rKZR3yWu
	 yDLSjfa6E3/99JECBQV4BsQv7s3fdLwhIdF7y4gw24WwHnH/T8geOOejA9PE3dukf4WXw
	 M2oKpYpLu2qzyzGlTmjozO6JwxIrAimiGzHMYmfvlEFvdFhOX+zdkUGbFx1cfF7VzGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oPt8R0+cuix+okhoURqDdR+wxsOn/VMcHvI3baeHJW8=;
	b=QHhqcyjWK4bMWsd4s1cce+fAWuRmZbtp6E53+X2aOzfyHOAhoQ+v4iaqkc1IMo5YiG/x
	 PCxNNa5YtTBdPhkrpC6gA2wnHnKvmXEnsMWhEg0jtzWb2zyAa1MPKyrjDe4d8+eA3Rco8
	 HWfQDP6S+T7479N3ljB5ByoclZ5Crq91VExitOMV2KKIz+pkLV3ihWH0JQMpsGcHLoTl6
	 v9W+TJ51yfU5J3qj42R8y5kbcPYWoYfgCkwd6rqliCQNyILzOBfe72l4VtU4QD2xg1Hq2
	 KxVTvqGy7xcFl50/CD4d6/kQcU0NEDL/EoPulI2g/XsXUqF6BIIdkjOmFO3AYbwtDYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PHD5DiNN;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC14606C57D
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 17:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDC14606C57D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PHD5DiNN
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso14888195e9.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 09:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639003; x=1794243803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPt8R0+cuix+okhoURqDdR+wxsOn/VMcHvI3baeHJW8=;
        b=PHD5DiNN9OyBHDVUDQq2mIiaIN+DFmKlv6retY//5yQQuurl7OKoeKlXzPsyzkWg+9
         thhAV8W+yoH5X7GX53NOfyiM6Q2pNLKj/2OVMFqVgMUjy0npgwyzKTJOuyT5+bhTvxdv
         4Nbw40DpldE+m8upOAOQIPPUOZZOm++4b/bHx03656wukTB4GUzzrj+WHt5rNG1qqPhr
         Fb3MjhHfTEhE1yv8xQm3X1qEssG8gR9CfvyxmebnVhEd4FV4UGFhfTplf8zlAd/bKInK
         7tQ7lc40Cixfbv+VkOgmR4fHz6O+3JxwRJdOcL8uSYhWlf87L0ROR2Iy6dgtjsQLTN/x
         TdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639003; x=1794243803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPt8R0+cuix+okhoURqDdR+wxsOn/VMcHvI3baeHJW8=;
        b=m4Uj3XhTtUkfRxI86W3UP2tmkljhJJQ/RDAcZ/DkD4aoyao3t8Sk42oOzLgEsejv6/
         o6jfao0LdDjIvYX+GsxiSRwBoeZPVcKyA8MDLb45xUQSJRpiGxDg+/Iknn69msExARbg
         4KCj7muhuZPzjaHaDD7hlZ+eYFlYjYmJhhc/7rnSbQieijdHLFKMk+Y59rNL2JZBYsBG
         5+8dzQgn+PZSfRPRuzhPtuhao0zDyKFakUfU/QRhiz7HVvCRECzrnY08atDUvoFtueOY
         F+l+J3EcxTgrpIn+FNxE/yffNtLd83JWL0ieZ6tDT23ReB6uIlEcMFCMQ3ru9cgmVz2v
         9jOg==
X-Forwarded-Encrypted: i=1; AKwUvBzIcxDXRHv2cO0Pr9/tV2haZ3h8Xqix8KiAWZZxJE6fZHLmIGXVMYWe3H84484amJAdXmy8gBSHxUUE0A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLvqk4O/ezYopEfPkyBP0kLl7tWmCw4DgQsOS3QOaWY/XSUS+GS
	knhAt+GlA+wGyvVgQi2w/Q++k8c1wG+Bid5yQZJPLlOLFt4Hjm3p8CWm
X-Gm-Gg: AYBFou3q9SYuAwWwlZvqevOZcSEvwaOkPl7iBy724YgCDj1jiv2Hk3qHe2AIH09iZEb
	kqCkv2uuEmg1XP1awg3fv4rWtC7uFPC7QTgUnNy6IEOzepNGogf5ToWNbni2CuLYcrm9zXuhNWq
	m3SRzvcEozh/zvO8YM+uz0Cf9K4r59ub0VXEKx9vrl2QXgKqeLYGU86rMdZgq8SGGmETpiuPwzM
	0+xrfg6j7Y4I94jKFasMe02pNeNfBHBI4F99qbIlEIlspGCduMbqSE3r3PxF85ydv09u5eDTXNK
	alyrbYrRuUtB1PVAdlFgCh3Yj1fOZtSal+w31CBcDnsgupnXTnnjwq2tdgwgmkS0bu4yMrLDZ53
	YmDDbgbcqiUNPK8j7cvM2ykDwYdDv7raTnIgbWsFp4mWx2qnn+S6YOiyWAI8rvHtp5waJJTbn3G
	oU6Z/pearjBnznYySGvPSJ23qd3QbeZv8xvoOka2iUKwn4gLAeYq2PC2xNYEh33gVh4YnOUr1sO
	PNqOAgwiOVY01H2UH243d0MCPcThLagtbipuVCcKaSCFIRXNISSzaPDYS/6Colabh3NZEmBrW/B
	S4kr4yvn+AvI0eL5h/7Z+CBYrXJdShkuTUY8yyGH6dCuGKNixBLbjmL4QM25iTxBHFU5KeF4zXO
	crDrCutmsl9bUcuwY+YsRILiR/afEW1fS1MVk5eQth6yysPb02MPxLCDLs002KnDiYMm27OYeNy
	4w4iqMhLtxFknWEnrKKzNkUaIalVDoA777viwNnQg2t8PmhKLta0wcZtxdmv75YfIwN7ty/pQad
	sFeWhIlZonFMkmOB1N59K/ynKn2wBU4j0jdBkJ8vQacdmQCzA==
X-Received: by 2002:a05:600c:a012:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4ac17b2ce18mr241875865e9.27.1793639003332;
        Mon, 02 Nov 2026 09:03:23 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:22 -0800 (PST)
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
Subject: [PATCH 04/10] staging: media: cedrus: mpeg2: use the field height for field pictures
Date: Mon,  2 Nov 2026 18:02:57 +0100
Message-ID: <20261102170303.1973892-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
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

A field picture covers only half of the macroblock rows of a frame, but
the driver programs the coded and the boundary size of the whole frame
for it, as for a frame picture.

Program the height of a field for field pictures, like the vendor
library does.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 10e98f08aafc..ca66a3c6b830 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -58,6 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	struct vb2_queue *vq;
 	const u8 *matrix;
 	unsigned int i;
+	bool field;
 	u32 reg;
 
 	seq = run->mpeg2.sequence;
@@ -108,13 +109,21 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	/* Set frame dimensions. */
 
+	/*
+	 * Field pictures cover half of the frame's macroblock rows; the
+	 * vendor library halves both the coded and the boundary height.
+	 */
+	field = pic->picture_structure != V4L2_MPEG2_PIC_FRAME;
+
 	reg = VE_DEC_MPEG_PICCODEDSIZE_WIDTH(seq->horizontal_size);
-	reg |= VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(seq->vertical_size);
+	reg |= VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(field ?
+			ALIGN(seq->vertical_size, 32) / 2 : seq->vertical_size);
 
 	cedrus_write(dev, VE_DEC_MPEG_PICCODEDSIZE, reg);
 
 	reg = VE_DEC_MPEG_PICBOUNDSIZE_WIDTH(ctx->src_fmt.width);
-	reg |= VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(ctx->src_fmt.height);
+	reg |= VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(field ? ctx->src_fmt.height / 2 :
+						   ctx->src_fmt.height);
 
 	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
 
-- 
2.43.0

