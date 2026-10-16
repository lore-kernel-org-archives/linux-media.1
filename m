Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3A4459AEE
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144728; cv=none; b=XOZV5XzGcBGWJ5XeA1++3btm9qsu9ziO0lV2OcYqkbHbD8g0Lnmk3FsUg47lSnxEhJdEArbgpJGBpyW81299M6/rZXWytzs0PvLn4R5fe+8vqC3APoHa2LYkDuYtoOxoUpN0qQcELcV3BwDyhqEzepjz+PkD/TDD0gWEOy2EmRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144728; c=relaxed/simple;
	bh=PxsauXHv21NaWp1pmCSC0GXy3wHjuorZp5IT1pL8Et4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fn+4TM7FVTt78h8L8mpoKt52L7glAbLVWjqEwChSSjC4ppLu4DfsB0afhDZ0WNsYGPZEqt4qiQfJi54qinL4N1md08u6d7H0lO0fTbF4nXdTYl3BSBbWM14+pKLrs+uFRkcUoWfN047c+l9JK7yDh1me/n52+fOLX/8aNN1D0pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=juczrnFt; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juczrnFt"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so581246f8f.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 02:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792144725; x=1792749525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WnamvmIuzRF0GlRelCYU72kM6iXFvvQVbcyQHF1dM/M=;
        b=juczrnFtzhYAvAyP1AbOUgF1x5thBGcyxMpRwqEEIxgM/PH2BSo68N11N6nA5qfrUe
         h73m3ZNqHRlyw0kgBNH4BEtLHxglMs5CEut/Kohh5ZBIoJF6LmoBuAzjmInIX/9sVO6M
         ntE40eRP7mkQdrGYqYhcPr3rVbKdag6ZKrbLluWXODFHwbW393HUE0GmGey/ztuQQhas
         xVFPBR12EMYb9WIvFS1z7A4A8+z+1ZSGpMmibXDpimQ9RNHGLIinsavqZJy2+GOcljrh
         2d4tu94irSM7eEVBJ51/eqmHIm/EaYCi0viyD9/FrxVsG+pDyq2ZiWpGJhl+IZ7UI22U
         YjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144725; x=1792749525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WnamvmIuzRF0GlRelCYU72kM6iXFvvQVbcyQHF1dM/M=;
        b=xYq6BMl3Bg92b+1FywhbxekEytlGZaCgguFjujGnN4+rM99JlJYUhYgUP7jO+6Fx0Z
         Emx+yqm+pfmaKZifVHTj0v6rcs1Swu64kdeOtS7DcInbKmtua2efm832eczv2/ngQIrA
         67Ii9F8IZ4pnuItGXk5fC3EL0DnnG2GWdkre3wFMT6VB2cet8sBV6WgMytKW1SPqOzvi
         DNPvyCmSzZK9SUw5bTEZaz3DEhlHs/hOUpTIrQ/KZsFaBSQWDRsyiwF7TP5p6Ec0DyuK
         EtW30azMkPiUDT1vtmbRcNIPQHzvD9DDYbUAQht07evO0laQ1McosiI7doE8F6y7hV1g
         8pBQ==
X-Forwarded-Encrypted: i=1; AKwUvBya8IZliO05kR2io1oeMDr0YYRnmfY3kEAQi9AMwbN4cFOcU0EQ6Reo2Izj2EmnoEEnXP32yM4wuvdGQA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKFyKIyZ2+zWnZGuB16aVrtwbqslWVq2klfobXsYJg2SsAtTRLQ
	BK4kCcWrX0pIfST7b8fcx1Kg/WlOmV+7cPcpUmM4s/O4KdoJP4gOs5eV
X-Gm-Gg: AYBFou1dh3WPHW5lSlOMuWyMi2OFByzg46nS53GV65rcUjjnKdoHtIlbF38UaHeK3Na
	PwKlPg+miKnYmkSrHQoJ3KAk5fdlucNMSCOounI1nluOajHS1X3qGyx/VVyyf3JJbgzKwONJGIZ
	k8v7ntXstCxoFrl6DVsExhrsq0LrvQ1nPKzzmOU/LkC7E7kegGmowC7IwFqbVVmGuXaLdl16IMk
	d5Ir8TfqEK7phF9ZKkpO5ojGQszq3xbQ9n47rbe7YF734IFFU84L/+wZ4aSv/klWWttolKdxYMW
	wigwO2uSlEf+4cJs+OFt3xORJR80Tvo7sp8gu3okL5fjh5lKKif9Cib4/fIUiCy4amp+pzg7SMf
	pjsRitzzLlGzHgcakuRPVdBtLEdAT72JS1U63SpH2uZyv6g6WttGC03i/9sOckv6t9bdcB3HCgG
	t/A8ezkmwc20SH4T6+FPHhgIB6Y2l5nMeMdOl8/LOvP7ddO04TWa2ue7o+4wYsyyrqf7DVxWBQ1
	RKRsKyArHD3+sv5hNsNSy85lcjQfdi2qAP4Lv9s+iNjuyAggMVRjl9UlU32TjnIQc+6F39rGPAD
X-Received: by 2002:a05:6000:3108:b0:486:f856:1975 with SMTP id ffacd0b85a97d-48dbaae5c02mr41334703f8f.22.1792144724678;
        Fri, 16 Oct 2026 02:58:44 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm4133033f8f.45.2026.10.16.02.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:58:43 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	Jens Axboe <axboe@kernel.dk>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 1/2] dma-buf-io: fix typos in kernel docs
Date: Fri, 16 Oct 2026 10:58:30 +0100
Message-ID: <f328e279c3995cd36458ba2684c91d1bf24f057d.1792144609.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1792144609.git.asml.silence@gmail.com>
References: <cover.1792144609.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix some typos and inconsistencies in dma-buf-io kernel docs.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/dma-buf/dma-buf-io.c | 20 ++++++++++----------
 include/linux/dma-buf-io.h   |  7 ++++---
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/dma-buf/dma-buf-io.c b/drivers/dma-buf/dma-buf-io.c
index 21296bd3dde1..e432194a5dfc 100644
--- a/drivers/dma-buf/dma-buf-io.c
+++ b/drivers/dma-buf/dma-buf-io.c
@@ -106,7 +106,7 @@ static struct dma_buf_io_map *__dma_buf_io_create_map(struct dma_buf_io_ctx *ctx
  * @ctx:	[in]	dma-buf I/O context
  *
  * A slow path part of dma_buf_io_get_map() and shouldn't be used directly.
- * Behaves in the same way but allowed to block.
+ * Behaves in the same way but is allowed to block.
  *
  * Returns a map on success, or ERR_PTR encoded errno otherwise.
  */
@@ -133,16 +133,16 @@ static void dma_buf_io_ctx_shutdown(struct dma_buf_io_ctx *ctx)
 }
 
 /*
- * dma_buf_io_ctx_create - create a new dma-buf I/O context for the given file.
+ * dma_buf_io_ctx_create - Create a new dma-buf I/O context for the given file.
  * @file: 	[in]	file for which the context is created
  * @dmabuf:	[in]	buffer to create a context from
  * @dir:	[in]	direction of DMA transfers
- * @out_ctx	[out]	resulting ctx
+ * @out_ctx:	[out]	resulting ctx
  *
  * Create a new I/O context from the given DMA buffer for the given file.
  * It only works with files implementing ->init_dma_buf_io_ctx and fails
  * with -EOPNOTSUPP otherwise. Once created, the user can create a map
- * and use it to issue I/O like read / write requests to @file.
+ * and use it to issue I/O, such as read/write requests, to @file.
  */
 int dma_buf_io_ctx_create(struct file *file,
 			   struct dma_buf *dmabuf,
@@ -180,7 +180,7 @@ int dma_buf_io_ctx_create(struct file *file,
 }
 
 /**
- * dma_buf_io_ctx_release - destroy the I/O context
+ * dma_buf_io_ctx_release - Destroy the I/O context
  * @ctx:	[in]	dma-buf I/O context
  *
  * Destroy the context. It makes sure all maps are waited on and destroyed,
@@ -201,11 +201,11 @@ void dma_buf_io_ctx_release(struct dma_buf_io_ctx *ctx)
 }
 
 /**
- * dma_buf_io_invalidate_mappings - invalidate the current map
+ * dma_buf_io_invalidate_mappings - Invalidate the current map
  * @ctx: 	[in]	dma-buf I/O context
  *
  * Importer's helper for invalidating the current map. Waits for all I/O
- * using the map to complete and destroyes the map. Called with the
+ * using the map to complete and destroys the map. Called with the
  * dma-buf reservation lock held.
  */
 void dma_buf_io_invalidate_mappings(struct dma_buf_io_ctx *ctx)
@@ -215,11 +215,11 @@ void dma_buf_io_invalidate_mappings(struct dma_buf_io_ctx *ctx)
 EXPORT_SYMBOL_NS_GPL(dma_buf_io_invalidate_mappings, "DMA_BUF");
 
 /**
- * dma_buf_io_detach - detach the @ctx from the importer.
+ * dma_buf_io_detach - Detach the @ctx from the importer.
  * @ctx:	[in]	dma-buf I/O context
  *
- * Importer's helper for removing the I/O ctx. It kills all maps and
- * prevents creation of new ones. Upon return it's safe for the importer
+ * Importer's helper for removing the I/O context. It kills all maps and
+ * prevents creation of new ones. Upon return, it's safe for the importer
  * to release all its resources such as dma-buf attachments.
  */
 void dma_buf_io_detach(struct dma_buf_io_ctx *ctx)
diff --git a/include/linux/dma-buf-io.h b/include/linux/dma-buf-io.h
index b9bbeca1744f..d9f27650a851 100644
--- a/include/linux/dma-buf-io.h
+++ b/include/linux/dma-buf-io.h
@@ -60,6 +60,7 @@ void dma_buf_io_ctx_release(struct dma_buf_io_ctx *ctx);
 
 struct dma_buf_io_map *dma_buf_io_create_map(struct dma_buf_io_ctx *ctx);
 
+/* Internal helper, see dma_buf_io_get_map() */
 static inline struct dma_buf_io_map *
 __dma_buf_io_get_map(struct dma_buf_io_ctx *ctx)
 {
@@ -79,10 +80,10 @@ __dma_buf_io_get_map(struct dma_buf_io_ctx *ctx)
  * @ctx:	[in]	dma-buf I/O context
  * @nowait:	[in]	specifies whether it's allowed to block
  *
- * Create a new or acquire an existing map. When succeeds, it returns
+ * Create a new or acquire an existing map. On success, it returns
  * a referenced map, which should eventually be put down with
  * dma_buf_io_map_drop(). If @nowait is set and the function would block,
- * it return -EAGAIN, and the caller is expected to retry from a context
+ * it returns -EAGAIN, and the caller is expected to retry from a context
  * where blocking is allowed.
  *
  * Returns a map on success, or ERR_PTR encoded errno otherwise.
@@ -105,7 +106,7 @@ dma_buf_io_get_map(struct dma_buf_io_ctx *ctx, bool nowait)
  * dma_buf_io_map_drop - Drop the map.
  * @map:	[in]	dma-buf I/O map
  *
- * Put down a reference for the @map acquired via dma_buf_io_get_map().
+ * Put down a reference to the @map acquired via dma_buf_io_get_map().
  * Should be called as soon as I/O is completed.
  */
 static inline void dma_buf_io_map_drop(struct dma_buf_io_map *map)
-- 
2.54.0

