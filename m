Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337F355408F
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 20:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924923; cv=none; b=gGHPdWIb+HmXFY83JzNiv77cEpzpaEjlcKNC4W70BfdieA+NDto9Ci4MlO/4+AaHherZlIT3z/4hFk1UDPAWWeXirsguf7/5gE0ZUfwI6ic2bdS9BNfLmzeoJabs1W9maReExNiey2hkiZL3PYS8kpNJdRacJTvWQIL/viA6b4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924923; c=relaxed/simple;
	bh=r0p2adqwMj/5lT7C+TYVmZHcVYZ+gdU2HSJ4o7+sSAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ll2gNPAuuZzwiG5QXMIoqIuOvF62d28qRbw1zFbz29gSwuDGsa4r2TctcbXIOjsC0AI/YeWjcgAzS7Aog/Cw9GcDpV86NCRutImzOROYFna/yUt0xk8fgRsJxuq3bBrO46C6hPzkisCmiei6fdFCdtTq2YF5DI6iZhvpWxSmRIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAFmD8ob; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAFmD8ob"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso24691275e9.3
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 13:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791924916; x=1792529716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u2SC7dcI1Y+PPMkABrALMaBjWk253olXayI/6F0cq90=;
        b=WAFmD8ob6aOFNADV6rTYDAa0jwRaH0S3/AactAry1PJhfzwb5XeJU/3idIDhjPur8u
         6Uu59M0Dc0QwVxOw5GOSQIGyQFwxmx7CXQD9Kp5fzavojXDzVNUhNNxlcdIrr1fGP8f4
         9Emu/9PKvOATPPRKiG/NGPRGYcZqTz0KD3xYuAW3adW55a2mrXQtA7ayThJBPyPIsEvH
         sT4RoBTknYSJCtEiRyvuoc4b1Mhbzy5q92sZi448XLVMecza5m/EuaQwYyFZfNHDK7hQ
         R0ZZdFg0d2L+yz256eH+0bK2pszpxQD+CdGodTRzaaEKaA9E0mzqai79IAWBFl/fa9/X
         tORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924916; x=1792529716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u2SC7dcI1Y+PPMkABrALMaBjWk253olXayI/6F0cq90=;
        b=umx0D/MUynV+WD4loA2SnkJt+L7GDgbOYE0tGR6f6ZcELyBv4f0vxgR/d65ILHj5wy
         se6R9zxn6A2XZjZacKO8E15hFAIMlsE8Aco5uCFWzIAtoyUnUZyf9opbYpHxauZe5Qg9
         7Eb7LkKje4wr5Z0eiBa+pHwLK1IieG1OZNVE5bHMxP5f16cc3pajXV5l6Z45t7tNBvJS
         W5vser1iw4mujB+mo423FMbDYoVu5eKdYkoFhdNmhEZ7zXxezGExoa4v3jvIeaeq0Gt4
         a+w5AF9vXeF3IgjwCYYoBcm+kZyvSs8Ldmm0JY/GzC1dW9lXEbb0PPM/Gg7JCbdjTGI7
         yCCg==
X-Forwarded-Encrypted: i=1; AKwUvBxkbzk3SvnLneVzu0PtIngqVtDahIlrxSXibJzAQrZUg+7J+UubAy8rGLngttw/7xJ/O30zK/MODayE8w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIrjdI2KmxMZrxVrI+E61bVt+BlyR5rKR2gLE9swczbnSh0NM89
	P771mCTazEiLtC0A48W4bkJTes6iWYK/3rEqKEBvjcd5uuxgG34NCo8P
X-Gm-Gg: AYBFou18KjAje+NEwhnDa2lQGzMewJgQdX74hMRjm1tDlgZgNWXnyX3PsFS+ptumUoG
	rcLQQ0apTN+vrvTcFav1Q06AI/0ChwRy9Xsm+d/kj2AAGu2BlfeMLc7yN/D6RjRM8X9cDcgJc6K
	OQBeFTddOZ4hsgaBjxQY3TLyLVG55LbvAZaa+v9ycM7AP8quw49/fkeLD5KmvXz92BOZywvBVYO
	7E+BTTSlCrtrE6zKLYFvv6ic3cLPBHapKnN+O6/Q+P2yj9dFd7EMgFV05Fun2jGGjNoRPf3xsc+
	+/VIDjCmUG3WeMReTaIeNz38sZkZjmJiqPUWDYXql4yhAdyOU2vSjPBDdUYR2ra6LHx5Fvfv+4G
	k8kxznYYccGB/toCaeEj6ljgHdDK1sPh1jV22zjHUe2HRMgK/zMPW2XwoaQ6fjDqoY56bQRfGpw
	GbzNNO47CobmUnOIEuQnJJMjbYnvQI2qfveoWTK1MwX3dOVNaoDS8uAHFm3XJ9AwAprhPZO/etN
	mMikmNkCpvt2lJOwx6PbEkn2o30kUlBV9dcxoA5lF0YNGNF6Caanai/JpfVuv4pyN2I59v6awhv
X-Received: by 2002:a05:600c:1553:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a18e443ea6mr263806405e9.4.1791924916136;
        Tue, 13 Oct 2026 13:55:16 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm2380730f8f.29.2026.10.13.13.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:55:13 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org
Cc: asml.silence@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-nvme@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>,
	Tushar Gohad <tushar.gohad@intel.com>,
	William Power <william.power@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev
Subject: [PATCH v10 02/13] iov_iter: add iterator type for dmabuf maps
Date: Tue, 13 Oct 2026 21:54:46 +0100
Message-ID: <20b8e9c900c7656e43e039a0d97213a2a781ba4f.1791924581.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791924581.git.asml.silence@gmail.com>
References: <cover.1791924581.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new iterator type for dmabuf maps. The map in an opaque
object with internals and format specific to the subsystem / driver, and
only it can use that subsystem / driver for issuing IO. The task of the
middle layers is to pass the map / iterator further down, maybe doing
basic splitting and length checking. The iterator can only be used by
operations of the file the associated map was created for.

Suggested-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/linux/iov_iter.h |  2 ++
 include/linux/uio.h      | 11 +++++++++++
 lib/iov_iter.c           | 29 +++++++++++++++++++++++------
 3 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/include/linux/iov_iter.h b/include/linux/iov_iter.h
index f9a17fbbd398..2f91884d733b 100644
--- a/include/linux/iov_iter.h
+++ b/include/linux/iov_iter.h
@@ -310,6 +310,8 @@ size_t iterate_and_advance2(struct iov_iter *iter, size_t len, void *priv,
 		return iterate_folioq(iter, len, priv, priv2, step);
 	if (iov_iter_is_xarray(iter))
 		return iterate_xarray(iter, len, priv, priv2, step);
+	if (WARN_ON_ONCE(iov_iter_is_dmabuf_map(iter)))
+		return 0;
 	return iterate_discard(iter, len, priv, priv2, step);
 }
 
diff --git a/include/linux/uio.h b/include/linux/uio.h
index fe2e985d74d2..638c1116e912 100644
--- a/include/linux/uio.h
+++ b/include/linux/uio.h
@@ -12,6 +12,7 @@
 
 struct page;
 struct folio_queue;
+struct dma_buf_io_map;
 
 typedef unsigned int __bitwise iov_iter_extraction_t;
 
@@ -29,6 +30,7 @@ enum iter_type {
 	ITER_FOLIOQ,
 	ITER_XARRAY,
 	ITER_DISCARD,
+	ITER_DMABUF_MAP,
 };
 
 #define ITER_SOURCE	1	// == WRITE
@@ -71,6 +73,7 @@ struct iov_iter {
 				const struct folio_queue *folioq;
 				struct xarray *xarray;
 				void __user *ubuf;
+				struct dma_buf_io_map *dmabuf_map;
 			};
 			size_t count;
 		};
@@ -155,6 +158,11 @@ static inline bool iov_iter_is_xarray(const struct iov_iter *i)
 	return iov_iter_type(i) == ITER_XARRAY;
 }
 
+static inline bool iov_iter_is_dmabuf_map(const struct iov_iter *i)
+{
+	return iov_iter_type(i) == ITER_DMABUF_MAP;
+}
+
 static inline unsigned char iov_iter_rw(const struct iov_iter *i)
 {
 	return i->data_source ? WRITE : READ;
@@ -300,6 +308,9 @@ void iov_iter_folio_queue(struct iov_iter *i, unsigned int direction,
 			  unsigned int first_slot, unsigned int offset, size_t count);
 void iov_iter_xarray(struct iov_iter *i, unsigned int direction, struct xarray *xarray,
 		     loff_t start, size_t count);
+void iov_iter_dmabuf_map(struct iov_iter *i, unsigned int direction,
+			struct dma_buf_io_map *map,
+			loff_t off, size_t count);
 ssize_t iov_iter_get_pages2(struct iov_iter *i, struct page **pages,
 			size_t maxsize, unsigned maxpages, size_t *start);
 ssize_t iov_iter_get_pages_alloc2(struct iov_iter *i, struct page ***pages,
diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 2072c04e99d0..6831a5d9396e 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -575,7 +575,8 @@ void iov_iter_advance(struct iov_iter *i, size_t size)
 {
 	if (unlikely(i->count < size))
 		size = i->count;
-	if (likely(iter_is_ubuf(i)) || unlikely(iov_iter_is_xarray(i))) {
+	if (likely(iter_is_ubuf(i)) || unlikely(iov_iter_is_xarray(i)) ||
+	    unlikely(iov_iter_is_dmabuf_map(i))) {
 		i->iov_offset += size;
 		i->count -= size;
 	} else if (likely(iter_is_iovec(i) || iov_iter_is_kvec(i))) {
@@ -631,7 +632,8 @@ void iov_iter_revert(struct iov_iter *i, size_t unroll)
 		return;
 	}
 	unroll -= i->iov_offset;
-	if (iov_iter_is_xarray(i) || iter_is_ubuf(i)) {
+	if (iov_iter_is_xarray(i) || iter_is_ubuf(i) ||
+	    iov_iter_is_dmabuf_map(i)) {
 		BUG(); /* We should never go beyond the start of the specified
 			* range since we might then be straying into pages that
 			* aren't pinned.
@@ -775,6 +777,20 @@ void iov_iter_xarray(struct iov_iter *i, unsigned int direction,
 }
 EXPORT_SYMBOL(iov_iter_xarray);
 
+void iov_iter_dmabuf_map(struct iov_iter *i, unsigned int direction,
+			 struct dma_buf_io_map *map,
+			 loff_t off, size_t count)
+{
+	WARN_ON(direction & ~(READ | WRITE));
+	*i = (struct iov_iter){
+		.iter_type = ITER_DMABUF_MAP,
+		.data_source = direction,
+		.dmabuf_map = map,
+		.count = count,
+		.iov_offset = off,
+	};
+}
+
 /**
  * iov_iter_discard - Initialise an I/O iterator that discards data
  * @i: The iterator to initialise.
@@ -856,7 +872,7 @@ unsigned long iov_iter_alignment(const struct iov_iter *i)
 		return iov_iter_alignment_bvec(i);
 
 	/* With both xarray and folioq types, we're dealing with whole folios. */
-	if (iov_iter_is_folioq(i))
+	if (iov_iter_is_folioq(i) || iov_iter_is_dmabuf_map(i))
 		return i->iov_offset | i->count;
 	if (iov_iter_is_xarray(i))
 		return (i->xarray_start + i->iov_offset) | i->count;
@@ -872,7 +888,7 @@ unsigned long iov_iter_gap_alignment(const struct iov_iter *i)
 	size_t size = i->count;
 	unsigned k;
 
-	if (iter_is_ubuf(i))
+	if (iter_is_ubuf(i) || iov_iter_is_dmabuf_map(i))
 		return 0;
 
 	if (WARN_ON(!iter_is_iovec(i)))
@@ -1469,11 +1485,12 @@ EXPORT_SYMBOL_GPL(import_ubuf);
 void iov_iter_restore(struct iov_iter *i, struct iov_iter_state *state)
 {
 	if (WARN_ON_ONCE(!iov_iter_is_bvec(i) && !iter_is_iovec(i) &&
-			 !iter_is_ubuf(i)) && !iov_iter_is_kvec(i))
+			 !iter_is_ubuf(i) && !iov_iter_is_kvec(i) &&
+			 !iov_iter_is_dmabuf_map(i)))
 		return;
 	i->iov_offset = state->iov_offset;
 	i->count = state->count;
-	if (iter_is_ubuf(i))
+	if (iter_is_ubuf(i) || iov_iter_is_dmabuf_map(i))
 		return;
 	/*
 	 * For the *vec iters, nr_segs + iov is constant - if we increment
-- 
2.54.0

