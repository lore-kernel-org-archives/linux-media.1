Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E56A34F279
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 01:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791336741; cv=none; b=GTrPXHKowbfULI7esEFYuUOTyIATH32NkqOHaU4hpu73bGkH2WBEhkFNHV1VPw3fI3OaN+smd9t7lcZ4RIM5Mq6/qEu0hMXA3i9zw/eHHeiSBZqvq1tgaLOjqVdM1HMw0mt6pja63sIZNt8CKnQKi7DdQSjY81Dwb8QpmbOwYoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791336741; c=relaxed/simple;
	bh=L6TVWpongEDpA7TiLe+SNULpjIEu9UzpPIkgkHUo5Rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cyoEJMUDZy1y4hTkbSZE+veKOtR8/9Z9DEZjN1fbHqB0VWoVz3wksm5e83e3P0WjDDFKOrMJlx+ngvyYQLhlgd2YrNngB4lD3COsfCU95yyaLKTVzN0D9BCaJvuVfXcbRMjwOvrOUcLJzQC63Z/Eo5h4xiD+Sv6QY0ARhiV0kko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=feCTuRIZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="feCTuRIZ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so10337945e9.2
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 18:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791336737; x=1791941537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nls4uSWUi3FtYOHw3kmfxrWIUNA1MBsyApDbzhyJZsE=;
        b=feCTuRIZvnkS8I7qUEPadWa0pd9z6YBurrvYRw7ylfWbbKjXjSFxIK73osVo9KK+Pu
         ph3Uz+rRgMFRsK3NqZ0Duj7DqQm50fyYOEoAkGFFuXu1JV+VPZ/XXbA2dSiCu33IzPJR
         ygzziZLiRBd4ST+D0YLJ/QsOxcqysJ1yLXABVqho4a3cEyN987n71/Ig2XDK3R0C5smc
         AQ7e4MZeEBwLHNLWmKdK+FsH//6a/EZoICZb1p3p7Emet9s9GH/A+wtWaeEzeEPTijxD
         uZVS7IpAnfxdy665TtbdURvuV9t3wWcoXb6LDPJLptY9612VqTiytqANhF0cpGjVyQQE
         8E4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791336737; x=1791941537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nls4uSWUi3FtYOHw3kmfxrWIUNA1MBsyApDbzhyJZsE=;
        b=A47sTJQ6G2SMnUU/m3E64BNI70LzrFECHf+HPYhC8zp9VPJAIvlcbbMivqUR6ngN6E
         DUyAHZ3NEfvecjuJYFrGH8ODLZjSfzV+5MobvO5qKnF74MA1K9GC32U4rSmTxDN3PXOJ
         k2zz9UW8BdYGzDGAuCWVY+92JLhpzW45ml/1QEYAOjy2djqmM03nqPd8Z+3gRMAXXTb9
         cWBMcuGG1rIrStIIjO/NbTNT5x7SlgUJRpY5K2BZIdQfRdJ3hbbYX+7Wx0+AaBIWmY0/
         Qc4TX2uoo8x8OJWFuDx6YngGx233hmmhCoIlGtbbh/IQmEVYitbN9Lpjvn3QhV4nUoym
         RuLw==
X-Forwarded-Encrypted: i=1; AKwUvBy4tCZRZpcJWXziw8WiSURgYFxga+fx/bLqfVYPaOOj7K+HYr4H35aSpveEDdDdeWcuJfFmhpgwPb7uog==@vger.kernel.org
X-Gm-Message-State: AFuF++mPtMqP9HGqK72UMjP6nfrapRfXPhciZucCAj4lyjTOoWIUKXNA
	I/IgAMe5ifJdcxgoG3G/QtW+53xH5dfReQQKk/Caw4PyI+xuDf6QfKqY
X-Gm-Gg: AYBFou3fLHRjwCyL+9yDUq7F0/4MRNAlx/OBSAuZZP6I0pzI4S56Uz49Mu5xgSeUBok
	ad9ZyoGKEHCGHkFo8OJY55n+e0BrJGaFU+yPQ7uql6rrAVsIAGT4qAc+RGqSE9N7iDsvBjPgOxV
	96VwRARI7ivoTa2kQxcA7WQjbbYhBoNOYue8zJNQOgH/KC0XMTvEGDlZigO1KKRP/Vdy3AppvDe
	6ovxJrv26PGcT7jTW/bxvL4UREWEg08oTVT7oWjLsVIHo1K1iCdb6Y/GdSaZihcLXtHHdB8zXpa
	JtjXc2G/jHyxFD6HKawGYaoaiidWCq6/hpZ59nSrUHtZBvLMVth2DUZnbYqO+Bs17o7jdZl/xF1
	QxC+TD/++6ZiUhujFScNxmi/Qy8dxyk8/rjg2OAqqcJoaCS5VTMxc2rG3GawRitknvLZNP7Slyo
	RkUNSC3+PeBo5Ji380ZuwZ6SXTbQtKwgNvmxlT6KdjnzVkwzrwJjmaE5AkioqAwhi5Ydei3pVtc
	gIYwrnm4tnl4XCSs7gZNeetNr8WhMRDkuPgufaJiNsnURP3TLwfDa/QICzeNCCW+6EZU0fWBcCf
X-Received: by 2002:a05:600c:820a:b0:49f:f9d1:e618 with SMTP id 5b1f17b1804b1-4a180311281mr8069355e9.17.1791336737511;
        Tue, 06 Oct 2026 18:32:17 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f6538b7sm21183615e9.13.2026.10.06.18.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:32:16 -0700 (PDT)
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
Subject: [PATCH v8 03/13] block: add dma-buf support for raw bdev
Date: Wed,  7 Oct 2026 02:31:46 +0100
Message-ID: <af2b48a490186edf38f1d4a5dfd9513574f7a350.1791336002.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791336002.git.asml.silence@gmail.com>
References: <cover.1791336002.git.asml.silence@gmail.com>
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
 block/fops.c           | 22 ++++++++++++++++++++++
 include/linux/blkdev.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/block/fops.c b/block/fops.c
index 827dc9eecba7..e9da48ab73be 100644
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
@@ -958,6 +966,19 @@ static int blkdev_mmap_prepare(struct vm_area_desc *desc)
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
@@ -976,6 +997,7 @@ const struct file_operations def_blk_fops = {
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

