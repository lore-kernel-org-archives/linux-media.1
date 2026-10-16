Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9F1471CE4
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143287; cv=none; b=P7pU3qIhYq6KDGHwUwyE15LKEKeiTdSH6UU4LhfrCHDs1Lw7eR75YvMfa4ScNrOKXPHE8TD6qyhuhKXWG9Xg02qdtsafBBYzB0AwnWoYVGoEPcT87j+9l8eIFfbK3sEgce/anO+oIQcw3hP8R1tFcYLwWOJ98sIy4dBMgLFjD5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143287; c=relaxed/simple;
	bh=kJBNDbqbA2ZO/XSS1Xme384gSmj0uq+UZoWOGgjqMgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQmUEg9yzcYDIqqKZpjQy7jR1z4fHfPe/TLQ94XgqazLh9iaprUPSX+hZbrroun3sch0MdW0DAl1TxywWz0WjfN7kwiHlARVduTBLtMhMDw9Bf6T/pxu3nOxfjq8tq2+4BW0zjK5cKxKaRCZ9zyHZlbg5Q4cVI/QTBtNWj8kD8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fG6H+8xm; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fG6H+8xm"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dd33a7bd4so1738290f8f.3
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 02:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143284; x=1792748084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpFhCIr9XErf0TQgN9GVHVagrPdev/HktwQkCtq1cFs=;
        b=fG6H+8xm7R2bRkAAGW9QFZObmv8MHvXZvlVBqMfma6ciqEuIV5IxKJpFsxNfip+Fw9
         KIk4Ra8peQzKYelaQeNjVED2iE9WNCr0QTn0HdV1Yc9nY6Lfqwv5APQrvGCgDy6hHJAw
         VGxlw3Ix1448W0VW0g0AdzfMdQoKtSZ+Jrwbl6DMW3+2SKuR3mJ9rNqMBGsrygBO9eze
         /K0c5jWaU760vNQ/TcQOGUBv6iBPALUl5jKGIeJJaVMTwOqO49mCLLl1CZVP+zEF8hS8
         QLxdkCk3oKiDpDjL0mELGv0nA0Tg2e3Ub6T610YOsSgxlFYC0fa/ykxjgzXq9aALjnP5
         O0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143284; x=1792748084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SpFhCIr9XErf0TQgN9GVHVagrPdev/HktwQkCtq1cFs=;
        b=zrSlCGtq9VN7D+1xp4GioqXZp0xLRtAu16Z8ZG/STiJWoUnp4jrtG5R8msaz9ocXLY
         F5wxNv5aPW3BuBVOmHKS7RuCdj9sMzKhm4m0LocjZTUXsbCsESsiMBxoOzn1qSemQ+0s
         nE2ypJrBeFkuGMRZUjOOLcMEadxXtsYR7s3dV7gsGsoFSNnAQjYmH7eRhhjPIaPvrlR/
         GYxe7fs1JdKtS/1uRvudiQU/Dcamm/3tBSQsiwi5aBJPiXRUpN/RaYKAJCuFCYdFd7r2
         tBfcxqHHvAFXnX6lGX/pjzpPpksXWK8MSIzwsvlOikkGXoWqTujn76D6akzv7R9FmzH/
         Rfsg==
X-Forwarded-Encrypted: i=1; AKwUvBx1YGqy5OcRoyuxEhZQr8S1AQ81b3koLzU1IWRmQpakWq9hcEKvkX/djMLKc9Y5R2hZZyL8iHm26oYOvQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKg1UGCaGQ6HPKQbwZua6Y1eB3EjTKkwHBymr5HOlHwiO2z1M6j
	FBcqS4cRWmeNUEdmXmL2pPE+n7JDqdV+pqp1w6JPFC1miSpFPjGkhpwOfEl/zw==
X-Gm-Gg: AYBFou0o4HZ6EN2xrxX/++KI+nYcs7PUVWxd+zfd9HsQJfxpr29QAVmiZScihmSrEmS
	+CEwxlR7KeG7/n7L/ij9jnQ72hUz5+folM55NpMzFPFmlM1EL0MtM6M+HJhVKEcM5opgUx29Hcs
	LxV2gAB7KeR55t8ChIHRa58FHulteQoNCZocb7DLRRCc+/0TPto8sU7dRl/lnOXdQllyoK84cTH
	nMx9SM1kG0cw0aJ1UJ2PCf3/mimGUu0lyDa/wz1EtC+h8YN+WOibK02coWHc1FcNzg6OAZrOQa3
	m7xedFayFxORJ5CJW6cywkX5mIe2n0ze2pJU0KaqYnfNpY5vEH88ZbYdBFFTVqikfWQfRvXTgG0
	J9LSb5TE1+owV197E51h0gULDMV7ln+OB+dZAu/cKwzh1is1BdagX55mSXbGG7vsOEZXiemKbNJ
	mnOUxVrUzCSjI30ibRnNnYW98Cw/Df5fYqq/G8d/0Olj/PKUz3P0qseEwKkOPWZVhF4Rntra6K1
	teEGxZ9D7IriHNM094VwmT7crzvcmnRAMoJLyimBqleqmQhHriopa1Agxl+qTqcvyagLKnkCjz7
X-Received: by 2002:a05:600c:1553:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a18e443ea6mr421070445e9.4.1792143283846;
        Fri, 16 Oct 2026 02:34:43 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ad6252sm63570615e9.5.2026.10.16.02.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:34:43 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	Jens Axboe <axboe@kernel.dk>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/2] dma-buf-io: document dma_buf_io_init_map
Date: Fri, 16 Oct 2026 10:34:37 +0100
Message-ID: <79e1cc681326365d2105203b318d8a27ed7e90d7.1792142927.git.asml.silence@gmail.com>
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

Add a kerneldoc for dma_buf_io_init_map().

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/dma-buf/dma-buf-io.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/dma-buf/dma-buf-io.c b/drivers/dma-buf/dma-buf-io.c
index e432194a5dfc..f724936e223b 100644
--- a/drivers/dma-buf/dma-buf-io.c
+++ b/drivers/dma-buf/dma-buf-io.c
@@ -43,6 +43,18 @@ static void dma_buf_io_kill_map(struct dma_buf_io_ctx *ctx)
 	dma_buf_io_map_release(map);
 }
 
+/**
+ * dma_buf_io_init_map - Initialise the map.
+ * @ctx:	[in]	dma-buf I/O context the map is created for
+ * @map:	[in]	dma-buf I/O map
+ * @sgt:	[in]	the backing scatter-gather table
+ *
+ * Importer's helper that initialises @map for the provided I/O context
+ * and scatter-gather table. The importer should call it once for each map
+ * on creation.
+ *
+ * Returns a map on success, or a negative errno code otherwise.
+ */
 int dma_buf_io_init_map(struct dma_buf_io_ctx *ctx, struct dma_buf_io_map *map,
 			struct sg_table *sgt)
 {
-- 
2.54.0

