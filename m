Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639014;
	b=BnQ03aI9mraiRWpSzVqoBn82Fg89vDCYlk3O0dePQubRb7dRzxDuRcHjWzPyOlCObMmb
	 e2/YeGKh7Sbqqq04okbRU9NpN0NYiyrufmWqR4TywgRuHhUKb9l8LFsbSLrdi2uoX76FT
	 ND6IxLEAzuwTpSpHUAhk9YexHCjW8VP7QOYpV7SmkjGSGhsP95WddLuf8g2DT398pWmbz
	 iOng+gyXe4hHzfZuMSlDtufWpyYFK9YzSW7k0IJUbROnTt+EiNuR6AgG80K5kI8XgiNOf
	 KTNzMjFnl69cgjcXeB97KIOKRkby5nKdSaLQjzX0OM/JNMXltpSSY6Vk/OzWNLeNDuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1JZu6J7aylRQ5JJVlZ6UGCYBdNV4VlQcY/+pJe4FsfQ=;
	b=tk4STmapg7ill+gxXVHxIGkE3rjLEXfOcxf+X72A7R6TdeQnP05+c+gRXtCYXu9ULnqx
	 +uIalX8Ixc3I3wi93ARh5+rownPiMGUAHCd73O38MnC5pV0pbZEekOB0AQpljC6IvY2vo
	 1lBlkFu2ixC6jO2iDicFP56yuMXNhGCwFA0HG84jJetZsnJaequ7xYzIXBQH9YBIIHdAx
	 0Kr7EX4Ph7LnZz3LC7jxxr0SbewaaY1ooyj0nq2/9WemGvRpMSPRToBjQMkQa01MS4FTr
	 y8Wn4L7ULkVW2Nd9a2DELb2em3OoOsGWB5m+1Ty3a5L4UC/mp4kQx42D3cuHmbBlBwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cPzYbA4t;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8804260AED1F
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 17:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8804260AED1F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cPzYbA4t
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso27050825e9.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 09:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639013; x=1794243813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JZu6J7aylRQ5JJVlZ6UGCYBdNV4VlQcY/+pJe4FsfQ=;
        b=cPzYbA4tnnwJzMaz1ubRBRd7H8YYSihTifsG5AM1MHPzmk1SdV2HZTZh1j+el3V+5p
         FU+6ggd5R1Y+0x+9JP2r0SeugCKOVeYt3KooX0p8t7WfCJHP4gXIwhpBN++R6nnzK8YE
         tHVqFY0ZVd2qBi3zyyUAbjE3e0BXSHmqpCGvZbmOMq2rrNr/GDmvmaVeTTjYFzPiDg8B
         qWxViOqzwMU1bnzfMyhp3kQLMKUROU38rL4WTzUsCxVVQwb9HxiyTjEBueysFWCD27ik
         S8KC7hSePNpEQNNTQOlGz5ejaUCb68XK6WA5Zw/YMbcc9rCg0c+c0E0pf1we/qEpOBo4
         6GwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639013; x=1794243813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1JZu6J7aylRQ5JJVlZ6UGCYBdNV4VlQcY/+pJe4FsfQ=;
        b=Au56k6qMNe4dl621Ut2qM7wu29o+0rnJYpnfHwQKsqxT2PpXpLKqd0YqEMcRAuaus0
         qvTl+gPEhIZUeyR7rA/w9sPWz+a7V+TnwWGsmJKHQBxSuHDbzOfWfGPUG4Th1HYOzW3X
         aOxXjKx5ns8OxSlChUdfv/7PC74rBt+FPbrYlqkf312sfejQvnECQ0Zm3nnkhR5Iue6S
         QjFkF/AOXoC92pOTK9CLSbNU7U0RMo+iac6xsswD6B4dyYuP7ow2nGpWkekRXuJe1GTL
         31lKIh+GSfx0aGIfQaT4gjkw1aaK0wUin9/d18UB7gZfoUi2bHOdGzj/+NrOs8xsdC4u
         HaAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaDIZ+gfontotgUHwD9qMqhTk5JWa6U7Eqpvhcpb6T/fqTr+ULm7jBx2gQ281UGp0G9NdZGdMwBYaEug==@vger.kernel.org
X-Gm-Message-State: AFq9FYLAO/mZYJo+SQLHOqCHbKraOhj557ccuEGH3voSxMrTZg+O7ouN
	ipcqJIuO4nJDvILCFYAwbj1tVfULtSj2Ip0xiGaRZzl8zh4zt86IrdAI
X-Gm-Gg: AYBFou35/ceU1SeJcAIgvTPdju5koOjI2fj5VMSMJ5qp5l4su+3BoLnmabMVQ9j5TNs
	Z9BITth8mkDExcTf84xbBQAHmG/uZDU+s3K22Ituh3wL7VynzDY8yHN+2z6RigccDCW/ID1C1rh
	5tHUaWiYS1G7XIATvZaoIiIfEIes7YOdiVbn3/je/90i59/PvRXInuxy1CHR5zhZMqYqbG5zUaZ
	/TlgTPXG9kYiRrHg48wKOsdPFdi+O27fx039+m3KMUDMxZ4H8qW/WJcvWNbA9n8OPFHtUdDe/yh
	8b1viui0y2hvgAmfXo0Tb/YNblpgJsRsd8AbdLXVqBRYnJo5AgGK8btkUa74UdGLSwqVcqrnX7y
	DbWETgw804J0otUmuJ7GgDf8WL8XYgZJlMd0ODBnd3VXU5ZFatvC488GHhosAaNoItYmFclM/RY
	XyqHGMtFbWiXPzn87LyfcUq1PDm5cL9D5HnWofs4VijBTp/nLFCG3qjcUa3QHE/5uJIDAgZCbTC
	8OwX7ZCS+fxMA369R5fmvXPc6WB8dZMc4YrkZMgCH0Q//+ftpQbaf6DAJ0k7yAkNQyR6DV1xY4x
	Fpk7siJnPD+nt3lR+YC2bUFrKjFba9DCr9A77+fX67rIMBJOtQuO8H+P4FSJqnRDp+l8RDtK4yO
	1X9De7ngLQhEBT3d4eU9xOmX4tMqmgjDZ+GKJSvozXUhq+i4kzU+cfGzutjA0t8YuLfkcsKDf26
	DXckfc24mVA9HJttL5csSKzzz6JrydXI7Nwq3J/LZ3meuX8sd77sYa6R0EaW0YWRrY4fapp6X/R
	ieDczhBRReH17u/YzLmRkhCkzib2r5xTEeDqcSvyd1zsy4kzg==
X-Received: by 2002:a05:600c:a012:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4ac1793fb0fmr244438125e9.17.1793639012878;
        Mon, 02 Nov 2026 09:03:32 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:32 -0800 (PST)
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
Subject: [PATCH 10/10] staging: media: cedrus: vp8: support frames wider than 2048 pixels
Date: Mon,  2 Nov 2026 18:03:03 +0100
Message-ID: <20261102170303.1973892-11-jernej.skrabec@gmail.com>
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

Above 2048 pixels, the deblocking and intra prediction row buffers don't
fit into the internal SRAM anymore. Put them into DRAM like H.264 does.
The vendor library sizes the deblocking buffer as 24 bytes per column.

Tested on H616 with 2560x1440 and 3840x2160 libvpx streams, which are
bit-exact with the FFmpeg software decoder.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  7 ++
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 64 +++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index d28fe91562d1..ca4efa9302fc 100644
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
index 6b00efa77c22..954c0ceb98ed 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -666,6 +666,20 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
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
@@ -849,7 +863,44 @@ static int cedrus_vp8_start(struct cedrus_ctx *ctx)
 	memcpy(&ctx->codec.vp8.entropy_probs_buf[2048],
 	       prob_table_init, sizeof(prob_table_init));
 
+	/*
+	 * Above 2048 pixels the deblocking and intra prediction row buffers
+	 * no longer fit into the internal SRAM. The vendor library sizes the
+	 * deblocking buffer as 24 bytes per (32 aligned) column.
+	 */
+	if (ctx->src_fmt.width > 2048) {
+		ctx->codec.vp8.deblk_buf_size =
+			ALIGN(ctx->src_fmt.width, 32) * 24;
+		ctx->codec.vp8.deblk_buf =
+			dma_alloc_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
+					&ctx->codec.vp8.deblk_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+		if (!ctx->codec.vp8.deblk_buf)
+			goto err_probs;
+
+		ctx->codec.vp8.intra_pred_buf_size =
+			ALIGN(ctx->src_fmt.width, 64) * 5 * 2;
+		ctx->codec.vp8.intra_pred_buf =
+			dma_alloc_attrs(dev->dev,
+					ctx->codec.vp8.intra_pred_buf_size,
+					&ctx->codec.vp8.intra_pred_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
+		if (!ctx->codec.vp8.intra_pred_buf)
+			goto err_deblk;
+	}
+
 	return 0;
+
+err_deblk:
+	dma_free_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
+		       ctx->codec.vp8.deblk_buf, ctx->codec.vp8.deblk_buf_dma,
+		       DMA_ATTR_NO_KERNEL_MAPPING);
+	ctx->codec.vp8.deblk_buf_size = 0;
+err_probs:
+	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
+			  ctx->codec.vp8.entropy_probs_buf,
+			  ctx->codec.vp8.entropy_probs_buf_dma);
+	return -ENOMEM;
 }
 
 static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
@@ -861,6 +912,19 @@ static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
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

