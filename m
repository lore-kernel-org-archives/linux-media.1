Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADB23E0234
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 09:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143287; cv=none; b=uAavt5fm+knSX78ULnhMG2352Tczu1QJd1TWYfNLiDOMdL3xZ2MiUgu/t+VWf/wkZ8+TQR9GhdbVQ4L8uDDqgvYUAe95d4BWdJYuE3JZLOeLJOe6oHZo2diRFK8G3StLsViECR2NZc+3VmzjNTuvOWY3S2BKs+Vm77xoJyGQwbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143287; c=relaxed/simple;
	bh=PxsauXHv21NaWp1pmCSC0GXy3wHjuorZp5IT1pL8Et4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oa4SAWDoyXiHR/BljZyjWEopiUGFnovEMpeciHUUzqM6mln+pf2SqpGsCpbi/yWC2bXYHyReWbuRjUDYAJb2VGdbsgfB2hZlzgFi9HGEERTa9EZVR9MI3YkJKkueJ342GPzrZAtTPcVpkXx9Ua3yqPKEfCJIY1dDc99+5iWxKag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WY+y07dB; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WY+y07dB"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfdd431dcso270140f8f.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 02:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143283; x=1792748083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WnamvmIuzRF0GlRelCYU72kM6iXFvvQVbcyQHF1dM/M=;
        b=WY+y07dBe9BhiC7FIw+4FXAaTSs34IXjfjF+FAj+o4r7eCmEgmKEXSyo2gWTlVVboo
         qb1ie7Ik8nJFl5HFoflagCR5FvsQHyP1azSAcnyERbL60QIgRTlpN3ULVpD1SNSsnqEc
         4kO2W4vA4WOLrTtm7Y9ljd4+6s3eZmJ92g/5xXVxkYEeCNeqVkGcRA2au9lxRUHeob8U
         EwX7J4IfA/CXmVbSBV1pYfrypyF9DOdT9sQWAhBlIXII/IJaYqTMpgTMHcz8pU7r4K81
         4wLYFdIXj/5c/RigooUS/r0r5JCq0euQrcCJpdGi6Vw3Mo7FELNvsiWvwX2D/W+FV6tK
         9mCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143283; x=1792748083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WnamvmIuzRF0GlRelCYU72kM6iXFvvQVbcyQHF1dM/M=;
        b=EcYDFKbI4EyDwHDMHRL+kS04F3wILyKOQqPljzMAV3HBmq1NUiD8oZSdJBu2E+H2aF
         2gxYFDFQY/XF/pqIvOc4HHhH7QK2vFwYmgti/gLRcstfEvHMQ7Pudmek3KHHMFX2uAy1
         yl8A1vc3QAyXgJS42ci/28xqfmPGp8Qg7fy3GfDOcc9rkAj8XtwxE9vQU17Fo8qKXXj2
         zHhzlm7oPWj2iuG1sFXA9QyZNCecG95KJZtKJWVNM/XT64n0H7YRkQEHFWZ2QfYhEQd5
         fupa+At15suzjNXSZpaeDEOc1mYixDP6ZzDVZKsEpaPIYtOSfFXf9ccyTcatolWM++6E
         Yk9w==
X-Forwarded-Encrypted: i=1; AKwUvByklEyO223i/KA1U59hxTxJFFydf/dRhr8mkQ2LKfoEI4/PCk7I0cYyVFNLph71nRtDDeOjkFK5nRbHvg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLdIU9rrAgvUizFWChowWb7NMCoPPC33rrAYY5BVc657PDS7Ake
	UPWfV97Q5buSrWketZRe61Fh7VugYc+tJTfjjOc5fMrH+nuYSUswWfy3
X-Gm-Gg: AYBFou0O0NJGHZmpdIxO6LZS7iT3ZHsoDJS/LiWUKUF8aNZ9zyd1qBn3rbpqPCpubci
	aseHTYU9oJ3A+LBb6Ej6Llpora2avYO8N9XTiNmeAiOOpvln8nIrfcmr/Z/HjWHSkzp/UJPVcSJ
	FhDVaGJZYFxvHvmt2J3d9F7tizuLYI0i4oRRW49abXEkemDiZ5R+HckUT2jNLGv3g/Q3J2HThzV
	MGALZRuvWMbtijDl1MSDKN9uUP+DmR6cpmzMYjAzn7Drjoy+MYNUE4ksKHWRDoMFADgymNn+292
	qaRKP/47BREkez9LU53Vo73foiMllNnwFaO1WHLHSbe788rGcECr6pYdabiuni0nPr3FeacI4E/
	tGSs37Wen5ni836ymFMk7Byh0t/8TNQwaoaTGdMbUDPtbkiLr5I1qPC1aqV+L6zPDnQZAMSUGcz
	1lCm/ce6JfW05N+Wfguy85fCnw8xhD/iKCUy7im/OBBYBgYR1Qvaeo12eoR1UoLq6Hhhk4EuRLV
	DeCi+k1SZHfY9BpPuu4L+ZnK5GkVh9pEF60N6Q914pPcUuSuOrVA2g7m0IwNKYqR1mV8bhrASQK
	/w==
X-Received: by 2002:a05:600c:840d:b0:4a1:6d2d:d8bb with SMTP id 5b1f17b1804b1-4a1c6675030mr59959525e9.12.1792143282959;
        Fri, 16 Oct 2026 02:34:42 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ad6252sm63570615e9.5.2026.10.16.02.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:34:42 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	Jens Axboe <axboe@kernel.dk>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/2] dma-buf-io: fix typos in kernel docs
Date: Fri, 16 Oct 2026 10:34:36 +0100
Message-ID: <f328e279c3995cd36458ba2684c91d1bf24f057d.1792142927.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1792142927.git.asml.silence@gmail.com>
References: <cover.1792142927.git.asml.silence@gmail.com>
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

