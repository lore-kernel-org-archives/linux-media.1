Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751571;
	b=efeXy5ox5c9bGuXnu+Yhp+KhCTdKvQSP3lUNn+espwuTgDtqPOMWVxRXqPb+16yiTyEo
	 45w7v+g1lySlqxQl5NaI0Y2k1IwwgFrIWUO93+dgrnbBNOgpAvW21rcnDBv36Az+Y5/Q5
	 EaHiaWAkW6YkqQvNqM26NcOaracDRc7ASd3IC9z3WXCJlXLqZXb56LBqn8rsRSD2tHDGa
	 lFSYTGciMs6A8lk2QbqXNDNQSIm0fIzDRTl5jhSrFaeHjJlCWlLbCqIP2U6SOs7T2oSQg
	 Lt3Hv4Pgy02PDyPPOx5qFD1hT2hRw+PI3IcUTn6SQmUkCFDWECu3fBzqSNEzMUUCgXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dhpcS3Pos6bUyhlWGcG9OokPKtscuwoJw0ESCtzmpvM=;
	b=P9b08shmN61O0vu3l1TJI4M1pp+WdDntJLZ8oBelJMZD7I1M5eV+Htj5VrOouvEhz8N9
	 bADTu/Z4x0k0Gwxs3mlkHr47lcd2GNqPPfjEE9/DU+k6Ra/PiSYqYYJkjNAghKvl1/CXu
	 rAwxFuShrhIM7k98uhzjhBzQ5Y5LiJk8l2id5Y2I/XbqtVZ/M3Xhc7+rGebYoJT5ifWcc
	 ptULu+wbWsbd8qfWeeiT9r3DTc8izQQIaasZJtG/v2KoV0bNVK+cibncCjsZlhAe2HArQ
	 T+nz1ys1kZpneEcu1okbHHxoSmS6volG/Z/YperzjlZV2HK2LFcFftC4LHYYkkPIHbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6Nzpwyg;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149F7606A333
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 00:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 149F7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6Nzpwyg
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b042c0759so60680f8f.2
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 16:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793751569; x=1794356369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dhpcS3Pos6bUyhlWGcG9OokPKtscuwoJw0ESCtzmpvM=;
        b=Q6NzpwygdE433wwbbo5N2lVV1nDLaE4ey6+emdzBu6O3wovWkCqFPmJ6dfDoAoJF/b
         5LyNOdE3QbbljfJQEI06XAAOfwb9rAsSh+UgxMGAtbC0M9YgIXbr3Hslq8ckS55H80U2
         +jccSBX1o4TC3CnzkFJHJJx5YHTfhoH2w8fGybU0UFBUV2V/biDRg/PcJP/Ex+N5yQ0f
         BS6vR9AA2nDBgqP7bgurufhFz4WV1aN3N8dy2DlkeWHBaZcvSmJEBgsqzw+8a87fBuzG
         /042ZlJ5EJfTxVOtwxpazkhc13m2TajmP1OFtXEPbxdPyKQqijJISNCb1gvu1eiB8hRN
         4sMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793751569; x=1794356369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dhpcS3Pos6bUyhlWGcG9OokPKtscuwoJw0ESCtzmpvM=;
        b=kiTQbJuuD3OQgdQKmSIoKcUY/ro2QcKGgsVZUhb9wg97ErSgR0m/RACxcbHCwh2QXM
         CwAT1umyPFefB0UZ1NB6//2lyqy2L1lmfBQSZYeXbNV5hDrZLK6flUu/0GGWHk6E9jBo
         /kuFpfXpsI1Ap/HDqX5+2TIJMz6Muebq+zaowbkeDdxaT1Bi3F/Ggb+eLl4e4EyKxQOe
         WkSsfy1pz25SABxGF+5x4k5EzuynXj/qjNJRtUaobsCGvjGpBQg+tBkibUHgb9Z7FtbS
         c89ARV7yCXf47B5ZohA8CcGN0PCL5ba6AvESzcHAeWpEjWP3Do8hCa+XFkoTU5/y7zFa
         6SLA==
X-Forwarded-Encrypted: i=1; AKwUvBzaZXp83dmMicCU0Q6tizOQFyNRBbw9vHRt4UNlo+PZ5uyLHQ81ShxhgIkzs909Aor93bAp6TSOxiIcdw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ltxc51Py/4DsG9+tKThbh8OzMNFsHZ3xgbX9KezCdUYLHCVaU
	kixdhKwPOYmA9EZAn8o5QXq5YEAil/wiQrmjTUDqrt5e+b3wRzrFBW5p
X-Gm-Gg: AYBFou1ZMV9RnYnp5OQIIzYOCL/9Leag7jXV8gS5aHITiaByB8B529naZi24gsUXQGB
	CkPJOaCnfPQ7zljagrRyAsAtRrheOyrUkKQtwJM28tJ78ABziS1ZOvlRJJOQ1TqGeLw9P4hyiV/
	TzP0Nv2TyGXSwUDBhBD276DrC9TrCDqRMM2lmz9zglgHEw1cglNNJZL6Azz1EoejLOmKpwxNGJR
	xQH2NlKIdpVNu5ZD5s0DZnKvwpU+3FFxCQp9SwAnOJonzOMW4ljiT/oWvL1GiKO19YTxb2IDK29
	M1nrgQsCCzn6ooS/zMB/StNimhsXunoksqC0N5SfqhALH8FgDUkISHJzBc1eRyRV29FR1zzJdK9
	8IdT7JE2cOSfMmWb43SkXzYk4zrQQFxvekrSgA8gd2oHv38cCfq6RQ6FJEJ3Fa7pu3MoH0/LHMN
	wVRI/DFuH4VKpthwKrj+XOCJt8n31MK46JxdenC41u/j8nUKIFuVpwvcdI+GKEzw9Q5dOubXlqg
	3CV0JwfHKayrC9Mk/Sh/kjMGF1H+U9CrB4sOBpb73Kx0630hmUujYiv4R9LNy1Ntg7D1gdPvuGH
	pa/d9yuCkq3qr0z/VJg7t47phprur9sN0CA688pr2frykMyQOYfmAXEkVcCp3OLNKvhd/ER9luO
	G9cTwNCLZv1Uxyxp288Y/oB0EbR/Uqilz
X-Received: by 2002:a05:6000:616:b0:48f:bdb6:ca0 with SMTP id ffacd0b85a97d-48fbdb60d3dmr3036265f8f.23.1793751569507;
        Tue, 03 Nov 2026 16:19:29 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1fb0esm676676f8f.49.2026.11.03.16.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:19:27 -0800 (PST)
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
Subject: [PATCH 5/5] io_uring/dma-buf: get rid of struct io_buf_dma
Date: Wed,  4 Nov 2026 00:19:01 +0000
Message-ID: <883cf9fcd8e46569ec237e9e36baf6e2f26db8de.1793751001.git.asml.silence@gmail.com>
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

Now struct io_buf_dma only stores dma_buf_io_ctx, and we can use the
latter directly.

Fixes: 62e4bf5b25d44 ("io_uring/rsrc: add dmabuf backed registered buffers")
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/dma-buf.c | 16 ++++------------
 io_uring/dma-buf.h | 16 ++++++----------
 2 files changed, 10 insertions(+), 22 deletions(-)

diff --git a/io_uring/dma-buf.c b/io_uring/dma-buf.c
index f25749f7da22..a1fc34c0c044 100644
--- a/io_uring/dma-buf.c
+++ b/io_uring/dma-buf.c
@@ -2,17 +2,14 @@
 
 static inline void io_release_dmabuf(void *priv)
 {
-	struct io_buf_dma *bd = io_priv_to_dmabuf(priv);
-
-	dma_buf_io_ctx_release(bd->ctx);
-	kfree(bd);
+	dma_buf_io_ctx_release(io_priv_to_dmabuf(priv));
 }
 
 int __io_register_dmabuf(struct io_ring_ctx *ctx,
 			struct io_uring_regbuf_desc *desc,
 			struct io_mapped_ubuf *imu)
 {
-	struct io_buf_dma *bd = NULL;
+	struct dma_buf_io_ctx *dmabuf_ctx;
 	struct file *target_file = NULL;
 	struct dma_buf *dmabuf = NULL;
 	int ret;
@@ -27,10 +24,6 @@ int __io_register_dmabuf(struct io_ring_ctx *ctx,
 	if (desc->uaddr || desc->size)
 		return -EINVAL;
 
-	bd = kzalloc(sizeof(*bd), GFP_KERNEL);
-	if (!bd)
-		return -ENOMEM;
-
 	target_file = fget(desc->target_fd);
 	if (!target_file) {
 		ret = -EBADF;
@@ -47,20 +40,19 @@ int __io_register_dmabuf(struct io_ring_ctx *ctx,
 		goto err;
 
 	ret = dma_buf_io_ctx_create(target_file, dmabuf, DMA_BIDIRECTIONAL,
-				    &bd->ctx);
+				    &dmabuf_ctx);
 	if (ret)
 		goto err;
 
 	imu->len = dmabuf->size;
 	imu->release = io_release_dmabuf;
-	imu->priv = bd;
+	imu->priv = dmabuf_ctx;
 	imu->flags = IO_REGBUF_F_DMABUF;
 	imu->dir = IO_BUF_DEST | IO_BUF_SOURCE;
 	dma_buf_put(dmabuf);
 	fput(target_file);
 	return 0;
 err:
-	kfree(bd);
 	if (target_file)
 		fput(target_file);
 	if (dmabuf)
diff --git a/io_uring/dma-buf.h b/io_uring/dma-buf.h
index 9bd7c8c64397..c622347fbd76 100644
--- a/io_uring/dma-buf.h
+++ b/io_uring/dma-buf.h
@@ -7,16 +7,12 @@
 
 #include "rsrc.h"
 
-struct io_buf_dma {
-	struct dma_buf_io_ctx		*ctx;
-};
-
-static inline struct io_buf_dma *io_priv_to_dmabuf(void *data)
+static inline struct dma_buf_io_ctx *io_priv_to_dmabuf(void *data)
 {
 	return data;
 }
 
-static inline struct io_buf_dma *io_buf_to_dmabuf(struct io_mapped_ubuf *imu)
+static inline struct dma_buf_io_ctx *io_buf_to_dmabuf(struct io_mapped_ubuf *imu)
 {
 	return io_priv_to_dmabuf(imu->priv);
 }
@@ -40,16 +36,16 @@ static inline int io_attach_dmabuf_map(struct io_kiocb *req,
 					unsigned issue_flags)
 {
 	bool nowait = issue_flags & IO_URING_F_NONBLOCK;
+	struct io_mapped_ubuf *imu;
 	struct dma_buf_io_map *map;
-	struct io_buf_dma *bd;
 
 	if (!(req->flags & REQ_F_DMABUF))
 		return 0;
 	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
 		return -EOPNOTSUPP;
 
-	bd = io_buf_to_dmabuf(req->buf_node->buf);
-	map = dma_buf_io_get_map(bd->ctx, nowait);
+	imu = req->buf_node->buf;
+	map = dma_buf_io_get_map(io_buf_to_dmabuf(imu), nowait);
 	if (unlikely(IS_ERR(map)))
 		return PTR_ERR(map);
 	req->dmabuf_map = map;
@@ -64,7 +60,7 @@ static inline int io_import_dmabuf_map(struct io_kiocb *req,
 {
 	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
 		return -EOPNOTSUPP;
-	if (unlikely(!dma_buf_io_file_compatible(io_buf_to_dmabuf(imu)->ctx,
+	if (unlikely(!dma_buf_io_file_compatible(io_buf_to_dmabuf(imu),
 						 req->file)))
 		return -EBADF;
 	req->flags |= REQ_F_DMABUF;
-- 
2.54.0

