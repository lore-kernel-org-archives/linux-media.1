Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC44A47ECF7
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 21:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785274214; cv=none; b=q1u+sEr5waf6MhowUgSUJlyPtXX2cVdkaNEywyPGFOP375y26yPTriaugV2B2Z03LJOyDhdtuL1Q9rPYMuTQr9ePJZMrBphCXpRtG4LgTvadN/XX8QC3hMHpJbTPt8IMlYouwWMtGQaqWddKR1eJBrsyebmvSYPvBiqNB29EVwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785274214; c=relaxed/simple;
	bh=bt1fjQx57j1sUPSIKU54YXB3emwAGpiLG3SIBERbcvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MM4ijPhRnebatPBLvT2EwWZSRp/LUlnoHMIqFnQBfAZkaxbSIVBejUVIj08/LsHN8QK/0rLFRLswb92LuV8kQlHJxxL5mGVarUA8ZHrlMAG+ALHNJK4mlJ+ZmrbXgQiOh2YDoDxwpYjQEz37gfDyQPkHq0YsxX5XqbWRuhlfsIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3I3XC6d; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3I3XC6d"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso259709f8f.3
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 14:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785274210; x=1785879010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mhCvEG3xgv0esCi48jrWlXZeUf+lVK0keP2zUsWb1Q8=;
        b=D3I3XC6dQ/oOKK2O/2ofvHmwDqjhElP2Cr/usPPiueWfnxSn291o1UoHCTlZeOOIVL
         4D0hz6PHOvhptiOnA2XMfGCTho/jrTmMeHMeaiKcW9CXsuQqojpwhUvNpCaMoyyAh7il
         T3/CXl9KoCt22vkEBKM9GTdSMrEIiT9rxrEfM4phZpjjKShmuR8flxyCxHxCWuoyylrJ
         jNJsleztVMOIFqxHPMpw2oqJ43P4msMjLX4W5xT0180dH0o09UsQDoUmJywdzP/RE8uF
         zDmVjFxxGG8kn34gn5KiBCq6veaRLjHl0rFSQu1Nou8MfP9W+dfpVN+PP4dZdFQ2guM6
         c0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785274210; x=1785879010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mhCvEG3xgv0esCi48jrWlXZeUf+lVK0keP2zUsWb1Q8=;
        b=nsqDZfvgepbek7U18aFD+QNCywX6YU+vyuUzRdxyBQWTqTdskutrnrFHOzMKaivoP1
         EiauyOjLUPivHTLveds1+rxjTj1DiFS0TwrsDiMBhMkrRAd/bSsFcl+2hStb+fjgkFqN
         9NDx40qhbdAxmb8TaZSkNmqTG0JHC9+YSsTAYVEE/RJC+zpkhOCJ55oXl3YASeRuwMF7
         f95kouRCx3CbSlxqwanFot+hdDfVnXADoJAJ3KaU6HIzrf4v51qkpCuTKCHvg8jyqHlf
         /eg+Sac3Nlw4Kf7DNkL+pf3okrAAiMIQ+CAoEkf0KYH9ZWeXfSX+C6bPbqPo/dP5VjFy
         wiyA==
X-Forwarded-Encrypted: i=1; AHgh+RrN1BP8FgenqYKW9R/7USPn4NtDlTw0rZRbgOXLY+CwmRmraiYI4yPV2WJoNBVAXOWJAMtvmZ8UEipmpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm9zt2vYGg7oV3wwcce1hju6UlMKgkD91Hef+UzwSwdI3/3mz3
	0gcz5nhJMvYFs1bPIcjftfMNLECFIB0HGGbeMXySYOzf47TAlXMF1DEb
X-Gm-Gg: AR+sD13NPvMg37liffItUGwWgeNNacBv6xYTgT4cEuL9dpbONYiJj8WWoDQ+ol5LWW8
	nqHkH0cjzSgtlVFcdVaVBfzmGEwv6ydLVWSx2oyhvWhBx54evMfbGqFqSmwaKMov4Brokfv7a/C
	pYYtGtSpDpnGExI3dYhKkBKvy2+DkEBcDmGVeyn0Evu3um5mmwoGNZEltl0WEyJRsQZYaEhcrx4
	7i8E030nundmIkvLgFQ88W2qYEg/HkE7QdK9z8UmFsAQuV1Z/yC3IDkNnvxdPOItFgNfCHT5GUK
	Dyj02Z/49dFihczG0Kdo0rfVGxK7EzaGrGT2OShNde5GE5PLZJFE3aDuErGR6nPfkA619I5RYK6
	qspIC4stoIWqcRWLKa3F/KgowhcxcPu4Te567yFw2rCsqrlwm1/3ezM0OBNa9mZSFvFnG9nQZRe
	E5230z/LjtjL+5Z3mJGfl7popeBrHuOL64Ug54FzkzZbl1U3cFbG9XMFPqwmHPzdwXw9rg++NEg
	Q9+H/CE
X-Received: by 2002:a05:6000:26c1:b0:476:8a:5 with SMTP id ffacd0b85a97d-47fb1f12d18mr4496873f8f.34.1785274210211;
        Tue, 28 Jul 2026 14:30:10 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6ac44bcsm2245329f8f.11.2026.07.28.14.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 14:30:09 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	io-uring@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Cc: asml.silence@gmail.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>,
	Tushar Gohad <tushar.gohad@intel.com>,
	William Power <william.power@intel.com>,
	Phil Cayton <phil.cayton@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	David Sterba <dsterba@suse.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	dm-devel@lists.linux.dev,
	nvdimm@lists.linux.dev,
	linux-btrfs@vger.kernel.org,
	ceph-devel@vger.kernel.org
Subject: [PATCH v4 13/14] io_uring/rsrc: add regbuf import flags
Date: Tue, 28 Jul 2026 22:29:25 +0100
Message-ID: <9eac63cb6aae06f591e6d0c67505ea2c16dd99e6.1785274111.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785274111.git.asml.silence@gmail.com>
References: <cover.1785274111.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We'll have special registered buffer types that can't be used with all
opcodes and need special handling. Add separate flags to control
registered buffer import, which will be used to specify what kind of
buffers the caller can handle.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/rsrc.c |  8 ++++----
 io_uring/rsrc.h | 24 ++++++++++++++++++++----
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index d57e8a0380b5..05877b4c0ee5 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1245,9 +1245,9 @@ inline struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
 	return NULL;
 }
 
-int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
+int __io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
 			u64 buf_addr, size_t len, int ddir,
-			unsigned issue_flags)
+			unsigned issue_flags, unsigned import_flags)
 {
 	struct io_rsrc_node *node;
 
@@ -1656,9 +1656,9 @@ static int io_kern_bvec_size(struct iovec *iov, unsigned nr_iovs,
 	return 0;
 }
 
-int io_import_reg_vec(int ddir, struct iov_iter *iter,
+int __io_import_reg_vec(int ddir, struct iov_iter *iter,
 			struct io_kiocb *req, struct iou_vec *vec,
-			unsigned nr_iovs, unsigned issue_flags)
+			unsigned nr_iovs, unsigned issue_flags, unsigned import_flags)
 {
 	struct io_rsrc_node *node;
 	struct io_mapped_ubuf *imu;
diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
index 83aa86e6f320..f12abaf63270 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -65,12 +65,28 @@ int io_rsrc_data_alloc(struct io_rsrc_data *data, unsigned nr);
 
 struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
 				      unsigned issue_flags);
-int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
+int __io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
 			u64 buf_addr, size_t len, int ddir,
-			unsigned issue_flags);
-int io_import_reg_vec(int ddir, struct iov_iter *iter,
+			unsigned issue_flags, unsigned import_flags);
+int __io_import_reg_vec(int ddir, struct iov_iter *iter,
 			struct io_kiocb *req, struct iou_vec *vec,
-			unsigned nr_iovs, unsigned issue_flags);
+			unsigned nr_iovs, unsigned issue_flags,
+			unsigned import_flags);
+
+static inline int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
+				    u64 buf_addr, size_t len, int ddir,
+				    unsigned issue_flags)
+{
+	return __io_import_reg_buf(req, iter, buf_addr, len, ddir, issue_flags, 0);
+}
+
+static inline int io_import_reg_vec(int ddir, struct iov_iter *iter,
+				    struct io_kiocb *req, struct iou_vec *vec,
+				    unsigned nr_iovs, unsigned issue_flags)
+{
+	return __io_import_reg_vec(ddir, iter, req, vec, nr_iovs, issue_flags, 0);
+}
+
 int io_prep_reg_iovec(struct io_kiocb *req, struct iou_vec *iv,
 			const struct iovec __user *uvec, size_t uvec_segs);
 
-- 
2.54.0

