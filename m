Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751573;
	b=ki9b6qMQ3/tqYMlr8IxuGr+vls9qiT2kD4+HskbxZOGdkA0IH9GwuQhT9CK5VSdZUkfU
	 mThWIHHtQIXevK+bYnGcdzdEY1kuWUsAHLDiMCuUzasGLZWqMxJs4MNmRMYQQPRd+0us6
	 pgswJVlDVjMFEjWYNuyYUEdVWPb15sL7gIiBILbJ77KPV6in/Q+q5eT/y/FmiyzezcYjO
	 rQhlQMqJ4m4uYiAbRBWMtSkpgLrduiX5FnP40u6W5zPMTWOebr/siNsmmLI2ShHAxiqai
	 7VbYqOM0S3/uHttEIp9MJx0PSWx6Y6XqlQa61ShGAGtBtt+z+4P0WwSH5I2hkDx1sog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GGAHJoXoaHYDS7ZVcS4Ysy1Ws2W94TVdrbuzvKnZ5Q4=;
	b=FClTeiLD+2qKXCTFPlrzBfHq/I2RBnerQM8N3LcakmrLix0RTmZQwhY15/j4B2qTFP8L
	 ZnGtMv30w9DxQubIpsfcQwDgnSM9irNjA1CHJPdRzKVqq7nxcIUu9553PxngSBF/+TUSy
	 4OEP51/uEAla5pooIgBwgNaLCeNu0mB5vqjIIbIRc2fVZcWhnvdXOX6JLcxvcEDZKiqJT
	 AgyWVluXgKaVAY5r20VqIblogNHmCWuzt4VQb3ocQrW3hiEQKVdLwMyD7Pz4RXpbsrv8G
	 67WNdZEc+2UsPYTafPkSlidLmTGvxJc4DfAixYtp5ZMP65D0lMemFjAopCQjowLzLWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aqcmbjj/";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD66E606A324
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 00:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD66E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aqcmbjj/
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dee593f18so85483f8f.3
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 16:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793751566; x=1794356366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGAHJoXoaHYDS7ZVcS4Ysy1Ws2W94TVdrbuzvKnZ5Q4=;
        b=aqcmbjj/IWzOkhPn945GltKgVAuWp1ceWZ4PcwlLjSUgP3pgLCeRJUSh0ZCERqiyBX
         BRUEwzA5Z8xgKIav5x8qMnG0g6orgm0+fafeQJR5uALlpITJemgYZ0F1WH87wHcFvnBU
         iOXxLrnLQwkdRO6nlEteWgXYV4Cv8LIP1HVaxL/mqH5vQt8+NxjuAL3gDJaGtaeRBNWb
         e8y0Zv3LmzgJgaHpG2wmrWPuYxkySs/xPswkQ12biHoWXbmGl6Os11AgxGOZb6W563OH
         dl/j7z99E03O0iXUVwWY/60ifcs1WdhHNDnyeOd7gotcaX3uexLytaLZamiZsZMwyWoK
         20SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793751566; x=1794356366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GGAHJoXoaHYDS7ZVcS4Ysy1Ws2W94TVdrbuzvKnZ5Q4=;
        b=HBgg1mNgFDnfuFFVo1uaLmVnVUIfAlf3JWW4UsqQIlkYPd0ef1AXPaL6JCVCq82qM6
         HdWna3XFzyrsxYf45GrNH/aQrQJbBW/XC9B42I/chyZrg1wjrWtalj/nx9yTO72osojI
         wJ9zqOxYpyloP+kqPRrOI//VdK5Sjw8pkGQQQmgFommku9A+Kp5CXLoBHcp5pegtzzTH
         RIXYPpN2YSKxSDewbvj8XSebDcVxrZfH/deKGQlDkKnmmUWONPVNnxzSaEjk5pQHqrne
         9/JxbkF0OMa9FBLtg0KeOFIE9ktb4r2pBwuzgDnclFD/Ug41eixXNA8lA40TeqDk3MHk
         d0Vg==
X-Forwarded-Encrypted: i=1; AKwUvBzosuJZZC1AUrCi3qwFUYCpLBNjVfYuh/KTwV3LwihMv2X4doy28LydO5f87RWsOP/VCz9GUWh9W7DbdA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q6Xghc8/iN9VV18o4JSPKCLw9nFsqlQCSKq6wK6SjaKnsKX6E
	VnmCNdR1zKspAbh/imIEdgqf1/wcL36x65f4DzC5FMJXNGmPiimPpTM4
X-Gm-Gg: AYBFou1JbZPlc2fO2E0n7+XzSYS2G2onyK8AwsO/4EE20n0ZfjbWuF2ck2SxPEZbwWJ
	HHtkyN+5ZyVwuBnsgThFM9wioxB86Nd2QjhsXoHo970H30zdBHoDnX4uNGKn+Q6U1PGOw97iD7j
	ytkrxH8X/Pa8jkzfXqcDr+9CvSVruCRbdRaZGDKIH4Kra6dhLXpjhCrxde2AxsCCFSFro6BfJML
	3gwNK+wCm7M6lnNh5Dt2Ij/9ur9uSXipxhvsDl8jYGVmDLuOjQYdlSziykAO8JSmHmnwVZHS5bc
	GxwlQCE+WF25eH1SyWRtCnxLSnLXlHTuRMRB1xo9Vx4UZtJNYsFX4WOIr9FioQqCWWkKZOoQ8u/
	um90RwMe5dCSdGhH/rbL6utAZv52HoBC3UgST18AKcH0t3a8MEYIb8IKpK3T9jUveOoDgRxNFTm
	pj7iXRtvSTSyeurZyLO+Q9Sml3+a7VHEtxkRBnuEvkJNhTXv8Z4eq2bdpKeUmVLIRWsRFuo1wae
	pgH+sp+66+rMHz7Avrd3PD7qbqm6ioZpJ14qu+MJUy+wkL9SQZJP2XlwVEqwpSUAFoHi4kivH9V
	IGNyy4jRz/OHi75QIEdL9177fLHUlegMZ6UYNcrgU/1czOMQV6N0OoBQt+0LfKy3Ws54E1qDooH
	zrVpd4ERZzx8xheaobVexus0Hg4/ouSA=
X-Received: by 2002:a05:6000:4a13:b0:48b:9d2:1a6a with SMTP id ffacd0b85a97d-48e6e2b9ce9mr32274342f8f.1.1793751566267;
        Tue, 03 Nov 2026 16:19:26 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1fb0esm676676f8f.49.2026.11.03.16.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:19:24 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org,
	io-uring@vger.kernel.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Pavel Begunkov <asml.silence@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>
Subject: [PATCH 4/5] io_uring/dma-buf: switch to tag file filtering
Date: Wed,  4 Nov 2026 00:19:00 +0000
Message-ID: <7165ab453cc680276b88f47f9ae89bc4967543cd.1793751001.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1793751001.git.asml.silence@gmail.com>
References: <cover.1793751001.git.asml.silence@gmail.com>
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

Instead of enforcing that a dma-buf-io ctx is used only with the
registered file, allow sharing using tags.

Fixes: 62e4bf5b25d44 ("io_uring/rsrc: add dmabuf backed registered buffers")
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/dma-buf.c | 3 +--
 io_uring/dma-buf.h | 6 ++----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/io_uring/dma-buf.c b/io_uring/dma-buf.c
index 6f1d21c0f558..f25749f7da22 100644
--- a/io_uring/dma-buf.c
+++ b/io_uring/dma-buf.c
@@ -4,7 +4,6 @@ static inline void io_release_dmabuf(void *priv)
 {
 	struct io_buf_dma *bd = io_priv_to_dmabuf(priv);
 
-	fput(bd->target_file);
 	dma_buf_io_ctx_release(bd->ctx);
 	kfree(bd);
 }
@@ -52,13 +51,13 @@ int __io_register_dmabuf(struct io_ring_ctx *ctx,
 	if (ret)
 		goto err;
 
-	bd->target_file = target_file;
 	imu->len = dmabuf->size;
 	imu->release = io_release_dmabuf;
 	imu->priv = bd;
 	imu->flags = IO_REGBUF_F_DMABUF;
 	imu->dir = IO_BUF_DEST | IO_BUF_SOURCE;
 	dma_buf_put(dmabuf);
+	fput(target_file);
 	return 0;
 err:
 	kfree(bd);
diff --git a/io_uring/dma-buf.h b/io_uring/dma-buf.h
index a97412ebbb3f..9bd7c8c64397 100644
--- a/io_uring/dma-buf.h
+++ b/io_uring/dma-buf.h
@@ -9,7 +9,6 @@
 
 struct io_buf_dma {
 	struct dma_buf_io_ctx		*ctx;
-	struct file			*target_file;
 };
 
 static inline struct io_buf_dma *io_priv_to_dmabuf(void *data)
@@ -63,11 +62,10 @@ static inline int io_import_dmabuf_map(struct io_kiocb *req,
 				struct io_mapped_ubuf *imu,
 				size_t len, size_t offset)
 {
-	struct io_buf_dma *bd = io_buf_to_dmabuf(imu);
-
 	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
 		return -EOPNOTSUPP;
-	if (req->file != bd->target_file)
+	if (unlikely(!dma_buf_io_file_compatible(io_buf_to_dmabuf(imu)->ctx,
+						 req->file)))
 		return -EBADF;
 	req->flags |= REQ_F_DMABUF;
 	iov_iter_dmabuf_map(iter, ddir, NULL, offset, len);
-- 
2.54.0

