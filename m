Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C09326928
	for <linux-media@vger.kernel.org>; Sat,  1 Aug 2026 15:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785599532; cv=none; b=PGQU4GlvTk4dBsE39nSbs1/7B9HwLNClMxIC2PO100CJwCQNN8O7OUvbDBjxx5L88CLdGexylMQ9S5J/TbWs67ZtGYUPTqxbaNyc1qNRdmk+siyi8oK4svLk9AenU5RiRJii7drTBlDKfygJksR/comj4xHOvvVGbIOH8gGwXus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785599532; c=relaxed/simple;
	bh=7qlj+n0xMTYMM8wbxh5YbBlihhCnKaVVIBe7eTfypEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sDuBiL4H2+KK5xlgdEMlBWMFu/AuJLbun3PDlF9WFEwSrwTCsKwm8npeGTQQpBB1AH9ZKDc57EyZDSWWmFom6oBgLMw9mzartWjTZ4rBr9a+j0G3iMHEVh09otym5l+nxXlAQ49S4zQ3sg9J9SxJqJqwjB/RVefAIySCJfQO6Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3I/+/QG; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3I/+/QG"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cedda2ce6fso16520295ad.1
        for <linux-media@vger.kernel.org>; Sat, 01 Aug 2026 08:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785599530; x=1786204330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4DE9iwPHyfteVjhRD5r56Chvjj2EVxXiQr3A0KjARNc=;
        b=Y3I/+/QGz8AWLgiulI6sUP9MyxA5O8wTFT0Aqgz4KW0m6qhl6x+ZLnO71suTdlTGdL
         30EuWjpibEb2nl9zRLU4yq3gzjepyvdUEaTbQvlPp802+I+wvljk97/Vrw/PmKgUe4A/
         /V9jOTpHfI1LzbzXk46hMvnO2z9Lktfnp14lpg+52yW/qg5HkRQcfCJpcdnmbQXDjgyd
         pSeaK26w50qa5Py2luzzQvkhjCwe1d6oXA2nIW2SSAuk8qu9Lc9BJup38LOQzfvZX5SP
         4dD/sJGrHPjCyq53HOohqHToRnY9hYKQd5Wruu+3oPcPw/wPJOa698VNHJ7zTCjE2Qiz
         nlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785599530; x=1786204330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4DE9iwPHyfteVjhRD5r56Chvjj2EVxXiQr3A0KjARNc=;
        b=hrIVnyLqEmXhVXnU6tgBw17K88TMWRFvz5uqQkB19ZnulFbqqg4FoqOuR+iRd4n+Do
         nJIMMJuE22vEqzcz4uLyHVB8ki4z2MOmBJOnuLPYzqQRxAcLWOtb3wiG7C/cLTnmBm+j
         fooZeM0zm7TRQ7oT1YmbdXsw33PBYdeFavo32coDxtA9Uc8ih8/HeqjZnr/CZeq5NZew
         DRk9KX5fBtp+eI98wXs5+ZxoStDEXwSleIMIOEveTL1AT7uXJEoArGApmCRdUL0QQAyB
         8tsaiuEseKNsA42pVAAymm1uKXVpoVxoiRBRyhd12XhPQUsZkAwpHSGEI5It3L6WvJD+
         0f1g==
X-Forwarded-Encrypted: i=1; AHgh+RrJvGFHURy39cwe/j8sHRv7C6kinKwwHPPHa7sgUyBLvv+b30Y28nqNVJcB7GeDpHZ8+lbMr5qm2LA24A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuDh0zGoWQOwWlHS4Vt07+yTFM8NKVMD04ovsmLr9NUmmwTBmN
	egNOzkVyv5gxx1y20lERHam7fMTD5iJKmd8djPCWS9BKlr0e8qrXjQfh
X-Gm-Gg: AR+sD11SVxzpih39ilpPMZmCRrOYX2pRN0mRQXQK/YpqtMfuEFqfa4e9HoqrVx4fxwr
	ivR68+PQLEvDCXIMPQ4lBQbZJyl/yKJT7Y/RTiKFlpwCHo/l4Rk5+vqv0cDuMN1NnCwcQ1vDpZF
	uO08i222G7tv0Rz87d02SaYiPIKowJ6k0GMpZeU8u4AhtAu+qCOjTQmAphvJ6rmmeFqzUOnd+2U
	R76PANEhzs35PU1M2Ugmy/XMVlkeq8HZsJDFKBCksieS4gIMVUJjAUiI5MuWDQcxeGR3ydkVLWz
	uTBtQfGtrf+tyMlv1GXYzbi3LOye/OvzlpsbBkhOGhzs1qa1h10UhzJ+6xTQzSioMFTQwqi1afT
	P6jhIyWD47FxyX/pApr5DFEUQnwWtWVAQt7BT9GWXLT75dPAJEc+woZ97WNmufsTru35EPWnwKI
	5JhkjVnqvQAsQBTg1XsmidRlLXZi4ZtNWkmdGBGhLTkG18RXKnScn1LXbr3JxnNCoOROywLwsBi
	+skmEjOLVaDH6BlRit5qf1Q0XkeNxlpeDBAmiqoZ5TrNMQ=
X-Received: by 2002:a17:903:1aa6:b0:2cf:32bc:9722 with SMTP id d9443c01a7336-2d0524671d5mr36849685ad.34.1785599529680;
        Sat, 01 Aug 2026 08:52:09 -0700 (PDT)
Received: from 127.net ([2620:10d:c092:600::1:61d0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b12202bsm18287605ad.66.2026.08.01.08.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 08:52:09 -0700 (PDT)
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
Subject: [PATCH v5 15/16] io_uring/rsrc: add regbuf import flags
Date: Sat,  1 Aug 2026 16:46:27 +0100
Message-ID: <ddd0458a78fd1666fb109993668afb01d35bd155.1785596451.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785596451.git.asml.silence@gmail.com>
References: <cover.1785596451.git.asml.silence@gmail.com>
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
index f041b0db77af..fcdc4edd2858 100644
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

