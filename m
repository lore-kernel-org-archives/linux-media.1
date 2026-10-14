Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2344F85DB
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 11:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975758; cv=none; b=YLuKVw+F+s//BIdJz50vRZ1kef0FXgXyzx2Hof/laU9DQcxTEQtx256lyEriyhW4sCXyvzdt8cV5nFuxBpoocFk4UyHsH/DIi4m9YGng7qNx4CvD/AkkJXhNoLKrYDRRwUctxqfkWtnB+U2O7uctfaedxh3w3CBI9r9BfNerZb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975758; c=relaxed/simple;
	bh=poMU3IMk+s1i+OL6PspfjWv+5wjZjdnLVtCEDY3Hn+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LM78IAa/1LYpDQfZx+D2NdM8XuC1RNzNeeOceX1v8sv1Z3AJnrwIeJuWv4iTkB0lhGidCuFBujq0ceQ19k10NhN8yQa9mNU5bPUeQ9rDZ6gmgsm/s+CMsHI+kP3TuUpzhG93N4OC/O7Fy9LEyCnGq2MQgCLE+zp6JYHeVybdTYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgNO+bZQ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgNO+bZQ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so7320455e9.1
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791975748; x=1792580548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sjQY12JZJkEEoHUMGZ5pLsy3Pmh4yJs101KM8nm2S/U=;
        b=lgNO+bZQ/hnx2yCAL1IbW7Iij3HMfcE7QFPPFXXIrHszCMDgkl/yukvU2NsT0LuA8k
         XTYrAF3J7+KZ0mLr0dyTtvudv3W8K26zyQSPyCr+Gl0xk+zlTDr5MBDbiaFF48RmlAZz
         G6liAnDuYEL/AowlsBFYqbYiVjwVhPygUXqs/cVM22qW03HxCWxgizK6LJsvuuhl6iAh
         wfuzAaoNxC1STbH744wcuWm88gHQl91TjBIK3JCJQipocLiR/mh+CuAg8aw3+QxLDujS
         3Pkne/qKlxAPAsIfCOlBTxlVI9+VKvE9PhcJ4PziH9BhgLsbVjblTnzNLLkEySovYlse
         KAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975748; x=1792580548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sjQY12JZJkEEoHUMGZ5pLsy3Pmh4yJs101KM8nm2S/U=;
        b=k02RLBVE8QNxE0bj61KmHeMVLtgKyvOT73IkKVaZGYH/hD4uXElB/03JeXYiBmuRL6
         yGH0JDXDcCPc0l6xrdoDa9mMlrzmXsS+4hwC47rzIjZCqqD0blaeCNfQ6vG3DcpcxwDE
         76VRpeVV8SzZtX9eUcdwZqDe/XEyvuj36mNyP5oLWexfrEBOPEkEHySAs+ksmj0XWk5J
         lpm0TZ8PcwaCnXz2zK91OP2DprjFunWtfyk+ytrEMTw89Ntqdup6YvWLrSymNR19DOAk
         8CALPwuySth0/5CjKT4zwcGetjHuG8BS8Gv7kNciheqgF6tIrk8Tzgq4scCprMNdf23h
         7Luw==
X-Forwarded-Encrypted: i=1; AKwUvByFrCgxJVF/4OTVV/ZUFDYo22dAlS/y8DqnNrDDQ9pCxQV9+/RGxubQztxsk+bG0XOIXUPiO9UWsGM/Rg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKYT1+d3Cth5oIOLhQkciBBBD62UtGDU7ByZKywixk//la4umKM
	8SKLpHKmb3Ts3DlieZXNTBvhiuAoe4PpabP4NMyxqRJCvB3pX5/glyRXkMHgpw==
X-Gm-Gg: AYBFou3jpHX5YbIou6BTOKTz2Po1o3gX8eANKmVTmRlm20tMM6I6UlpEuQb9v0KhmAw
	CRPhe/FEi/ZlgKlEQ3axDlFMhjNQpagLUlToxijurdZvz41uOb8IkbYyVkeJSEXLUywap4CuLbt
	V0oXYgOQvlg2KoLe59plto09obCwKGEWFZXRlOKDExQS9m4S+2vjP8DTtILD/TCQP60GkgLTnLE
	wlbo9V6ISlvWB6qHghFhI6h7Bz2QcfZVTyAdoNWn1gzKaGdSBvIKTD0P5fTbVkG9JbF1DcI7kYW
	zEdKTkC44caLEheHqCRGnMxEwIuyUq9O4aOpYv6rYkRw6sQzyYXRL1x7TeL7QBl/bx6AHcT8QSX
	WLjdY2ocMSlZTrG0QAWzI6D+r+hz0e5IsraKOs4SrZiOFjWHizilhW0umtRPlILKMFOIHP9qyzJ
	pnpHaDJeUBridqswofrbULt20hai6T3t/uw0L9HNL8rb6xdDoP/s5mK9ipBDVhMM8M4plWP0hW5
	fm4gmXbShXGF6RayBrMd9JTzlPHJXFrDlLeKjDt5TyfyGHmDIyyIXfOylMi5R5AiUxm8kFEZjug
X-Received: by 2002:a05:600c:8716:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a18e44885dmr316691205e9.2.1791975747413;
        Wed, 14 Oct 2026 04:02:27 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b45eb78csm38078845e9.2.2026.10.14.04.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:02:26 -0700 (PDT)
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
Subject: [PATCH v11 05/13] block: add dma-buf support for raw bdev
Date: Wed, 14 Oct 2026 12:02:03 +0100
Message-ID: <c01c4709dc55a12fb0f2fe1ec847b5f1f0c92789.1791975048.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791975048.git.asml.silence@gmail.com>
References: <cover.1791975048.git.asml.silence@gmail.com>
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
 block/fops.c           | 24 ++++++++++++++++++++++++
 include/linux/blkdev.h |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/block/fops.c b/block/fops.c
index 827dc9eecba7..6c6700df943c 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -730,6 +730,9 @@ blkdev_direct_write(struct kiocb *iocb, struct iov_iter *from)
 
 static ssize_t blkdev_buffered_write(struct kiocb *iocb, struct iov_iter *from)
 {
+	if (unlikely(iov_iter_is_dmabuf_map(from)))
+		return -EOPNOTSUPP;
+
 	return iomap_file_buffered_write(iocb, from, &blkdev_iomap_ops, NULL,
 			NULL);
 }
@@ -855,6 +858,11 @@ static ssize_t blkdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
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
@@ -958,6 +966,21 @@ static int blkdev_mmap_prepare(struct vm_area_desc *desc)
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
+	if (bdev_has_integrity_csum(bdev))
+		return -EOPNOTSUPP;
+	return disk->fops->init_dma_buf_io_ctx(bdev, ctx);
+}
+
 const struct file_operations def_blk_fops = {
 	.open		= blkdev_open,
 	.release	= blkdev_release,
@@ -976,6 +999,7 @@ const struct file_operations def_blk_fops = {
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

