Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943EF4C6F04
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 13:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602377; cv=none; b=JF4saIygCH4+1+Yw9L5GDE2qOA93o0l81NVqxZscaGZ6tfdSW6ImPThhKbF8p++MyNm7B4giqwmo35xGRbXLHJ9hTOAN/Pc81iNbPC0MEFlMyL2USzUHsmem3Hvt89VZpN7bCVsNhesdna3raGmjBJz748u2XuT8YrYys/1FBmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602377; c=relaxed/simple;
	bh=s/pMlWhML39X7WPnWJGpXvJM/zWMeJLTmEHcD+dWxB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RRNxE3c0XzbdA12OtSrEECFXrgGo9MJMrY2mmN3lj17ascXm8KMbqDYL266DJP5uTZURf5tFdZ1D+3kDKbrPr8ZfIp8/rW5Y1A4zvPfUJv5baWW2VxAt0vga0PW6X+gn8MlfhQu5lr3PyLllhX8oFajon3yREw8AhOqqS80nlJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfkaR0Pm; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfkaR0Pm"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dc83so2575362f8f.1
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 06:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790602372; x=1791207172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNN8LK2yF6e2Er4Otjr5e2ZaUKzvWbebPH7D4oJybmc=;
        b=RfkaR0PmmRqpWxFhMtgRZdKnj7xeumGmGfDTxzfQ6oWWJsLbke7bhO4MBPzg+BSoLo
         4hggbNPW70ddSMca21lxO/l0oyAi2RycEF0NAV5bQm80Z3aBiU7Vb8WA0ccxK5dE8Z6L
         ZXjzu6TBl38tpDGG0EQy5wyV/7F+kmOce+ZVUtW/gl5o+ZsDXVzrTSk2hNKcDR9jDeG+
         HwgOkSN3yzuJ956pHO9pqRl7KZ77zPaGcoNzWgtpX6FZ+oiyCqVBYWn1mmGyUKi4bKr4
         U5O3ppeWrwrCB2Z+3wRCBpCsGZTy4Mk1L1AiK4C8w4XRdpi4avlhnDngcWkm3ypM3gJR
         JFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790602372; x=1791207172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNN8LK2yF6e2Er4Otjr5e2ZaUKzvWbebPH7D4oJybmc=;
        b=fmDRBLC8i+zQgolfk91RpDfEFt7NnLv3tE9gto/Xs1uUoYk9gnamrXNSGlNWHFttg7
         pQ/GpzaSbsNtq4pV0RWzgzfTMRN4f6+dZMTz6c2YeJ4x2xGXVqLQj7topSi/PDFD2Df6
         UUzCmYxZNLaLvHTL6Ucr8KguLasSC4W3nRCK6CYu4wfTOtREzCMfIKSlgRdXzNGj0drR
         ZRAk70kqIhgde1wGCaWQwAiRuwSVtHcAx2uKe9BwX5tfhA09nngWOHvfmYx95TC7b5YM
         dYEmSEOELGPJuzIBGF767QiFTP69HnGwF1U4QSdkLAzvrtxo94vQyolb4XzMl+C2vhJW
         IcXA==
X-Forwarded-Encrypted: i=1; AKwUvByOrSxCzuMvTjiVFdeIFZWI4gEGF2NpygbUYFk76X905Q30UuXWJZiwf7bFyatMqq09u2ioWTYsILY4pw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKEZZ2SZt1U+RHFzKQerqikbjzCSqnNHCUAXKcLRmQI3rv1n7Ua
	oUwSO2KOj9tay+/rrDMp3LcUMs8GCSuMt1X2NvMdP7GCnFoZnvAlBnhB
X-Gm-Gg: AYBFou2mjCbO/WV57UKPzVNrvDBS0mmXSXGloF9/kmAhPx+M9MiKU9NvUeBVVIS2Xrb
	ymgQ8vfe7yX9Ez0LdEl/CwwNRMhvxjp73dCn2mRrdQGmJO3jPCOi0CAN5L9NTHgSO16oJdTuuQq
	90WcjY+NL4JRTtq4DS8MB9mkAvAqr+hWH7NRv1hOfbE3vdzNouK5oukTRJyX4Nay3HC/RzYAKgH
	KSI4NLtUwX8hypruh22kJONRVYf/GrMzK6+PC2ILGaL3vdXqA2eD2UZWoYuH6mEv/n0xTMSo1Ol
	PrSPW+Eo1sIN8j2yGqLjMsRSNU98SZA5kpMe4fHhXrBcBiemXywasSvxN8qrlitBJTatIDBwhFn
	bi2mPwxl4KlgGDUagQ4uwIGkJQIf0zZl77Y3OjUbXpfIgiK1jAhMJBrpwclGZDDlY77ELpuk/tR
	wvEVsJXhxo7Z7z31OWcMYaJbe9aIcnW41xkMiIn1nX91x2Q4pCH2zL7nhAd7nc0rjd0YYcFLY1P
	LRjdPVBNIH50SVzzSdT6KVGMNqprUy97qNz7p1c45dZdwdIo2D3pQ5L8B7HPUbRdcCfYkJzGePO
X-Received: by 2002:a05:6000:4911:b0:486:f99f:8236 with SMTP id ffacd0b85a97d-48872ac74e0mr24072487f8f.44.1790602371877;
        Mon, 28 Sep 2026 06:32:51 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm28090164f8f.12.2026.09.28.06.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:32:50 -0700 (PDT)
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
	Phil Cayton <phil.cayton@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev
Subject: [PATCH v7 05/13] block: add dma-buf support for raw bdev
Date: Mon, 28 Sep 2026 14:32:21 +0100
Message-ID: <a6b81e65b1f09b6ed1f71f294e5a94896ea1ead7.1790602223.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1790602223.git.asml.silence@gmail.com>
References: <cover.1790602223.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a simple proxy implementation of init_dma_buf_io_ctx() forwarding
the call to a new struct block_device_operations operation. Also reject
dma-buf backed iterators for buffered IO.

Reviewed-by: Christoph Hellwig <hch@lst.de>
[pavel: reject dma-buf without O_DIRECT]
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 block/fops.c           | 25 ++++++++++++++++++++++++-
 include/linux/blkdev.h |  2 ++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/block/fops.c b/block/fops.c
index 641621db700f..d05a78d0919a 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -783,7 +783,8 @@ static ssize_t blkdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
 
 	if (iocb->ki_flags & IOCB_DIRECT) {
 		ret = blkdev_direct_write(iocb, from);
-		if (ret >= 0 && iov_iter_count(from)) {
+		if (ret >= 0 && iov_iter_count(from) &&
+		    !iov_iter_is_dmabuf_map(from)) {
 			ret = direct_write_fallback(iocb, from, ret,
 					blkdev_buffered_write(iocb, from));
 			need_sync = true;
@@ -796,6 +797,9 @@ static ssize_t blkdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
 			need_sync = true;
 		}
 	} else {
+		if (unlikely(iov_iter_is_dmabuf_map(from)))
+			return -EOPNOTSUPP;
+
 		/*
 		 * Take i_rwsem and invalidate_lock to avoid racing with
 		 * set_blocksize changing i_blkbits/folio order and punching
@@ -851,6 +855,11 @@ static ssize_t blkdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		if (ret < 0 || !count)
 			goto reexpand;
 	}
+	if (unlikely(iov_iter_is_dmabuf_map(to))) {
+		if (!ret)
+			ret = -EOPNOTSUPP;
+		goto reexpand;
+	}
 
 	/*
 	 * Take i_rwsem and invalidate_lock to avoid racing with set_blocksize
@@ -954,6 +963,19 @@ static int blkdev_mmap_prepare(struct vm_area_desc *desc)
 	return generic_file_mmap_prepare(desc);
 }
 
+static int blkdev_init_dma_buf_io_ctx(struct file *file,
+				      struct dma_buf_io_ctx *ctx)
+{
+	struct block_device *bdev = file_bdev(file);
+	struct gendisk *disk = bdev->bd_disk;
+
+	if (!(file->f_flags & O_DIRECT))
+		return -EINVAL;
+	if (!disk->fops->init_dma_buf_io_ctx)
+		return -EOPNOTSUPP;
+	return disk->fops->init_dma_buf_io_ctx(bdev, ctx);
+}
+
 const struct file_operations def_blk_fops = {
 	.open		= blkdev_open,
 	.release	= blkdev_release,
@@ -972,6 +994,7 @@ const struct file_operations def_blk_fops = {
 	.fallocate	= blkdev_fallocate,
 	.uring_cmd	= blkdev_uring_cmd,
 	.fop_flags	= FOP_BUFFER_RASYNC | FOP_DONTCACHE,
+	.init_dma_buf_io_ctx = blkdev_init_dma_buf_io_ctx,
 };
 
 static __init int blkdev_init(void)
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index d003a9d2d1f6..2d5c30823aab 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1599,6 +1599,8 @@ struct block_device_operations {
 	/* returns the length of the identifier or a negative errno: */
 	int (*get_unique_id)(struct gendisk *disk, u8 id[16],
 			enum blk_unique_id id_type);
+	int (*init_dma_buf_io_ctx)(struct block_device *,
+				   struct dma_buf_io_ctx *);
 	struct module *owner;
 	const struct pr_ops *pr_ops;
 
-- 
2.54.0

