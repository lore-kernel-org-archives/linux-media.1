Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246682;
	b=Et89wtalyYEI4rTFcmdSrF1s39eODiHX+JenZ/jaf40RCcAbrRQ0uKkYR0F3/awvY/6t
	 +gUrp/aS0KmI+NOObV3/el6MvVjKbtbspTDW4ptPPh5nhbEY6FIVpUFPGdAia8fLg3k6V
	 5yMfGjk3CXNrgwDLFkXh2PdqLq0dKejxudQGaeAL+5Nz4BItPE5/tXyWw0DZu5qvh4nsQ
	 mDK2RlNzZclJPTyZ120TUYPhOaG6Ujyqurs2/0JkfhKED1cVlOJTzshUSVs/hXP6BiFDU
	 bqvIdLIeTzgKUWF1wkl1y99YsNdte18s0OcAAABZ5YeB4Vx9GgM6CJwUjP0m42Qh+1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i+XCxxAzlvX4gdjOWVlK9Z6T5fYWDEYFJTp9nSjumow=;
	b=t0+FIq1nEf4eWSkSIQe+PGOI7NmSUpatLVhzA8jJO+CeZvDBbeRIQs6AHfgi9DBB48fd
	 zp0GYpRWrSW6xHYz03qCHNWBBpH4KH9FCGKJb6Ggug5AXnojSZbLWxh2oesbMbzKlnYht
	 NBKpLLxDCcQjWUxwJcgp1w78CAkT0oXWusH9XAO6CsV4FNkr3P6Z26KjQV2TifFusl92F
	 4olhA8bWRmRNsCCU56r4UKkfov+N5mm4cIx6j9ki36pqLla7Ysm/dm4gX++1m1K2KEs3v
	 6iWjOzZxQslztU6WpREld+tCe9WMOvfxFrulJjC1losZsblp6wn4bjPfG8/JV0REDFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MIR7x9js;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2663606A8DC
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 17:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2663606A8DC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MIR7x9js
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491971ac844so1146610f8f.2
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 09:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246680; x=1794851480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+XCxxAzlvX4gdjOWVlK9Z6T5fYWDEYFJTp9nSjumow=;
        b=MIR7x9jsZbvSKHoqQfKVnSWZ3C0kE+PpJzOdDAnp5J7fSXjZB1hgmXU9bX8kRV76dW
         sxy9Qbv2Y8JJM0gZsw1+oenbYOv+fw8jnDe4Z2BWp3BWFc+ea4azmzevH5vm9X0qEx9m
         gFMW46Lna+i6s01Ht6AkxXBoAUtQom8BHfuv46Hl/dSgv3iErhtC57wuSxYskpHZfvkq
         XGBXmnHnI8hbjCZgpCeaH5C4NANI2esmMrHSvW27zQyqp+wr1V7mlgYe8F523/YaIv0c
         AzWEyk4osCG65QBag+Gx2B90v6vxN1mpMzXMxi4fImmV6b1JG3OsmpExjPr3GQrK9Q2Y
         FAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246680; x=1794851480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+XCxxAzlvX4gdjOWVlK9Z6T5fYWDEYFJTp9nSjumow=;
        b=qzyOgZzUXwhYFZkLi7R1nxN/I9oBqR6CFXBG8SLd0eiTUpapsTDNWVOwCTwaUrTrgD
         gYiTqnHT/TnVup/lCvQXkcXnU3dD3/nKfNdlYdk2qLybQG44w0PqgTLbEwS8fGUcyWjZ
         7ZdLgi2rifwjXsrOoK9UzT6YneFxF3W83KhM7oHFAc9xowzTiH3D1tf+uItffSmAWbmQ
         GaWESguOoyqANxPAdqaPChgE987/cE8Oc/pplu6dsChRbMEvxHzR4Jj3eUhHUDpnqojX
         Wq50tXb041Dxz5a9C/Am3ZcvHM2Q3OcLPGW+pjsJaZQ67gn36vqYOQEVP3YQj5z9nHKr
         4Crg==
X-Forwarded-Encrypted: i=1; AL+hErErHRTcfVSARU4N9TI+yYEYRXI8j3N2gRx7R67IVljzDpH6XvhR//T2s/IosKBRAp9tNG9Q64puHihZqw==@vger.kernel.org
X-Gm-Message-State: APuU4Z95ShEM3nJEPIV9mhe1VpEBJAkSCUYZLAsf3GQU2yzbtwmrGYDE
	UYJ3miPt83lD1JHdAvo/igBxyc01/3h2KGSzsHF6LrrHWGd6YXSQqBbZ
X-Gm-Gg: AYBFou1Hm863epAXp8uvqxskJcpQ/25rJ8Gidqv4jRt1ifvl0Vfx6hg803GIImWagoQ
	P90/7XncL2oNDUX7Lri1bx51v/syzZefVH2T33Vddp41TRv62Yp1EM1YvzQ+9E4DefQ0FzGGIPo
	0PdVZlZOglCvR6SNjMa/HzHvOMvOeWOZ4o1inqQkadSVluTUMKttJsFh51OresJqPVOZq0YMnt1
	ULkKwBqoOlfCIFESDcGsMdTN5w60cdbm6RFCV/+Z7dEJkZwOSDVBy5UXmfwI3nDxxV2Q/YS272+
	mjV2fMlWgmsgFU3PEQy+XEM57vYe5Hq+xnQD1qe9CNkZ1atPzXFg9nVCF/mLwZEycHy4l86sUnc
	R/wdBzbP6iYn3irPQC3UkYtKto0/+V/1xjNUmqXEUF/2VH92MghmzaXaEUxho7m43DJzgG1hkkT
	65b1oj0GqeR+Mx1b1icNG4u0ztZnmsKn9Lq6pwGkp8hXkM77urE+yxryH85QIcCkw9/sj8pNYjt
	HT4OdgQrFetiantxZOSYP1C0Wn1jUYnNaFO963JF4XN71J94/pzf3gJppLyNW8+VAhrUSJWunXj
	HLdbAdHFzjwykhfLD7jh2PLM99aYSkrMh0WHAzPSBLwLMxllwiZbcRkrSNEfYW/FLSXxKP+6E1F
	gr093nNvUuoOwqSZqEBFEBw7tuwKg16WrW2Fa4CYzvILbcQXMz4iy/XMRd2IeFr5evua/bfAgRI
	tH2NTjcD5qM4apx6r5vxE5Jy1a1lPk4OPiAoENh//gwmSXjkWxx9b7C2cRpzvey/eLJVXMwp8TL
	pnpOsry+XjKVVo389doDILF9mK3YeSuwycCm4P2DqWDoSk1SM8=
X-Received: by 2002:a05:6000:469a:b0:48e:fdd:41d9 with SMTP id ffacd0b85a97d-4982f968989mr173933f8f.31.1794246680224;
        Mon, 09 Nov 2026 09:51:20 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:19 -0800 (PST)
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
Subject: [PATCH v2 11/11] staging: media: cedrus: vp8: support frames wider than 2048 pixels
Date: Mon,  9 Nov 2026 18:50:16 +0100
Message-ID: <20261109175016.42061-12-jernej.skrabec@gmail.com>
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

Above 2048 pixels, the deblocking and intra prediction row buffers don't
fit into the internal SRAM anymore. Put them into DRAM like H.264 does.
The vendor library sizes the deblocking buffer as 24 bytes per column.

The buffer sizes also tell whether the buffers are in use. Set them only
once both buffers are allocated, and clear them first, as the codec data
is shared with the other codecs.

Tested on H616 with 2560x1440 and 3840x2160 libvpx streams, which are
bit-exact with the FFmpeg software decoder.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  7 ++
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 67 +++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 78efd3938c77..e26bbbf2e55d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -156,6 +156,13 @@ struct cedrus_ctx {
 
 			u8		*entropy_probs_buf;
 			dma_addr_t	entropy_probs_buf_dma;
+
+			void		*deblk_buf;
+			dma_addr_t	deblk_buf_dma;
+			ssize_t		deblk_buf_size;
+			void		*intra_pred_buf;
+			dma_addr_t	intra_pred_buf_dma;
+			ssize_t		intra_pred_buf_size;
 		} vp8;
 	} codec;
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index 84bf18fd231d..bb32232d37ff 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -669,6 +669,20 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	cedrus_write(dev, VE_H264_CTRL, VE_H264_CTRL_VP8);
 
+	if (ctx->codec.vp8.deblk_buf_size) {
+		cedrus_write(dev, VE_BUF_CTRL,
+			     VE_BUF_CTRL_INTRAPRED_MIXED_RAM |
+			     VE_BUF_CTRL_DBLK_MIXED_RAM);
+		cedrus_write(dev, VE_DBLK_DRAM_BUF_ADDR,
+			     ctx->codec.vp8.deblk_buf_dma);
+		cedrus_write(dev, VE_INTRAPRED_DRAM_BUF_ADDR,
+			     ctx->codec.vp8.intra_pred_buf_dma);
+	} else {
+		cedrus_write(dev, VE_BUF_CTRL,
+			     VE_BUF_CTRL_INTRAPRED_INT_SRAM |
+			     VE_BUF_CTRL_DBLK_INT_SRAM);
+	}
+
 	cedrus_vp8_update_probs(slice, ctx->codec.vp8.entropy_probs_buf);
 
 	reg = slice->first_part_size * 8;
@@ -837,6 +851,11 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 static int cedrus_vp8_start(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
+	unsigned int deblk_size, intra_pred_size;
+
+	/* The codec data is shared with the other codecs. */
+	ctx->codec.vp8.deblk_buf_size = 0;
+	ctx->codec.vp8.intra_pred_buf_size = 0;
 
 	ctx->codec.vp8.entropy_probs_buf =
 		dma_alloc_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
@@ -852,7 +871,42 @@ static int cedrus_vp8_start(struct cedrus_ctx *ctx)
 	memcpy(&ctx->codec.vp8.entropy_probs_buf[2048],
 	       prob_table_init, sizeof(prob_table_init));
 
+	/*
+	 * Above 2048 pixels the deblocking and intra prediction row buffers
+	 * no longer fit into the internal SRAM. The vendor library sizes the
+	 * deblocking buffer as 24 bytes per (32 aligned) column.
+	 */
+	if (ctx->src_fmt.width > 2048) {
+		deblk_size = ALIGN(ctx->src_fmt.width, 32) * 24;
+		ctx->codec.vp8.deblk_buf =
+			dma_alloc_attrs(dev->dev, deblk_size,
+					&ctx->codec.vp8.deblk_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+		if (!ctx->codec.vp8.deblk_buf)
+			goto err_probs;
+
+		intra_pred_size = ALIGN(ctx->src_fmt.width, 64) * 5 * 2;
+		ctx->codec.vp8.intra_pred_buf =
+			dma_alloc_attrs(dev->dev, intra_pred_size,
+					&ctx->codec.vp8.intra_pred_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+		if (!ctx->codec.vp8.intra_pred_buf)
+			goto err_deblk;
+
+		ctx->codec.vp8.deblk_buf_size = deblk_size;
+		ctx->codec.vp8.intra_pred_buf_size = intra_pred_size;
+	}
+
 	return 0;
+
+err_deblk:
+	dma_free_attrs(dev->dev, deblk_size, ctx->codec.vp8.deblk_buf,
+		       ctx->codec.vp8.deblk_buf_dma, DMA_ATTR_NO_KERNEL_MAPPING);
+err_probs:
+	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
+			  ctx->codec.vp8.entropy_probs_buf,
+			  ctx->codec.vp8.entropy_probs_buf_dma);
+	return -ENOMEM;
 }
 
 static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
@@ -864,6 +918,19 @@ static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
 	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
 			  ctx->codec.vp8.entropy_probs_buf,
 			  ctx->codec.vp8.entropy_probs_buf_dma);
+
+	if (ctx->codec.vp8.deblk_buf_size) {
+		dma_free_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
+			       ctx->codec.vp8.deblk_buf,
+			       ctx->codec.vp8.deblk_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+		dma_free_attrs(dev->dev, ctx->codec.vp8.intra_pred_buf_size,
+			       ctx->codec.vp8.intra_pred_buf,
+			       ctx->codec.vp8.intra_pred_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
+		ctx->codec.vp8.deblk_buf_size = 0;
+		ctx->codec.vp8.intra_pred_buf_size = 0;
+	}
 }
 
 static void cedrus_vp8_trigger(struct cedrus_ctx *ctx)
-- 
2.43.0

