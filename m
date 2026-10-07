Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBB837A836
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 01:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791336758; cv=none; b=WzDA+E+DJDxR2Bo2l7X9xfy3o6Q9Rsd4dRFcj/zGpBqB7ObndfJ3YobzPuBRS5Z1Tt4xQtCDaQ23MYaRkHzkZlFG0eKaKs4olLILXgSDkxLn3Xyj8XKK2PqDp6oUExbtkPmBUWuJFloZGPHaH2d8nGqk04NAod2tkw4RFhtrVCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791336758; c=relaxed/simple;
	bh=zkmmP/s3oaEnM5CZp4fq/TPO4woTgg6h/01Z24jsq/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHHDhg/Ua9vO5UEvKLaaR9BUyewqexEGu/v1K4j+raKrBLFzDsXq1e5n9vpymkc84kf0dlLuAWFVmb0RuhKgAo32cpLmT5LAyxz9tu9Ax2ClmAjGSnuZcbuMgiBdiX9veBw7vvdQZc5c9KACmA/wGXXgkJlsposM+a/zy9rG9cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRlH75US; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRlH75US"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso9129445e9.3
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 18:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791336754; x=1791941554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vy1zLQ9YKYGfqugQgTKt/AfV3rhwVDXY3KU8gp6bN10=;
        b=CRlH75US8oKos3okZ/GQ+5N6xYnevgjyVe5DtiWbW4oF9Ry/Gq21dOFvVgKVsrH/rz
         PwzGinq1WiPIJvHiImryW9+/xVNZPuUWh+B2XhiNH5ZKbC6OJfPYfBCtf02Fnx4UP8gm
         Uxy6nwhailq1lTMmJTj80B3F/elx7keV2nLPs1J1RMPNwhkGkGi3UCQCXoawqabt63YK
         eDT18cJlpKGeqkAo97KfI58vjg+Sw8NY4nRYhWx9Q/c9OP5MPpkNnZ6J5+FbKWLRKWiJ
         72BRXbEKTchEkkghRuEFcFF/mynBzvHWFf0G+XO4CWEo3JHjTeCYZch2RbfkwGTSgjDZ
         eoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791336754; x=1791941554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vy1zLQ9YKYGfqugQgTKt/AfV3rhwVDXY3KU8gp6bN10=;
        b=WLK+fJXgB6va9qqIuQBcbOHbp9owxlTVoPt+38L7ZNUF/QKdqzXjWKsIIZb5Clnpy8
         sPvT4tehLmbMwOmL4dG0fmSQui/S3mAF3ZAex7Ardtef3suHEVmmXrpNV1iLuh//ru2Y
         XWq4ZyIpgIAoP1rnSoVQS7m0WActw/a+oYkiALoTbLeJLyYTgk256MUAv7DhfdxTlmjl
         7g4U/FhfGGvi78kQX0whpLBCjY4/6ReMm30zxUww4ESiwIw0lxb5hU3hCBIZuZzbVACS
         NNdDUsmyffBf69wPAMKaPEI1rCcEZMkBlr7rChxI8JZP2h5B/+x1fi7n1+pb8zmp+83h
         rEcw==
X-Forwarded-Encrypted: i=1; AKwUvBwhFLrD35I53XekHmGjn4zxGfdc4Dpmvm0uNB1K6L3S2wTfHKgwdz/bfEWcpTIwpryg9KU/r6xRk8keUQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lgDns5SQ2boyKdsXkp33p/jysdMBAszNSxsdi3SekhjxTwn46u
	69ND3ipxCzsJikg2HAO+RXIHNL5lEm1l0qo38ohVivFWrR1YGOkSPEoS
X-Gm-Gg: AYBFou0qbVtrlVHuJYe1RK2U8M3aULgJ+TCptuWJg1mbj5kgB+cgQWoLvLhDzP720ly
	eaIDR2z3Ub2k2tAfb5npyAujjsq9NY0eKGu48kqw/nIstqnzIKghke/g35/z6rIkUYVlOjRp+M3
	zwr4R4/UPcf8ToK8hh4N2fSLAx89Eur05hjA/lLTtA1qP6r3+E6u9bjcHzsN2qeLPXhO7H8itfr
	7X7shDIvwR30bmUOkbQI4XBi4YrpBUQ2LouG2B+VNRjz6lMrhdi0yJrMihnzqPIWUJ9cxO0QALE
	JGxz2BZgzNQynGiVOD6/toUmB1gRvlCs/Bn6vYXqKOpdbrxJ7maatUDnvlulI293oazQlfbMrLc
	2w0uzAmpVRv8l8FHbxCUyleKWYGj/k3D04UQMQuwLx0kYe9sKkgA3JBN/e99JycI0POCaPptoYS
	PEWeDUzxYky8XaHgy2oN5luHbCFzNpGPu99H7NIcHErg3ZwHNy4I4UM0KAaiMpeOTPsW1XpXssm
	h9mUHSQFrjDw0aiBcNbxgJzbq8pUScuQyhOCC7mgxd6wlnhe7fsat5c1NJTeKlFXkiHFl6210uZ
X-Received: by 2002:a05:600c:3b99:b0:4a0:1c10:1372 with SMTP id 5b1f17b1804b1-4a1806501eamr8969125e9.27.1791336754109;
        Tue, 06 Oct 2026 18:32:34 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f6538b7sm21183615e9.13.2026.10.06.18.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:32:33 -0700 (PDT)
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
Subject: [PATCH v8 12/13] io_uring/rsrc: add regbuf import flags
Date: Wed,  7 Oct 2026 02:31:55 +0100
Message-ID: <4a4bfd9b4e444ecf9025e85b5cf0f864aa45c139.1791336002.git.asml.silence@gmail.com>
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
index 6930a6897b41..6e4fe70b316f 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1315,9 +1315,9 @@ inline struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
 	return NULL;
 }
 
-int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
+int __io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
 			u64 buf_addr, size_t len, int ddir,
-			unsigned issue_flags)
+			unsigned issue_flags, unsigned import_flags)
 {
 	struct io_rsrc_node *node;
 
@@ -1731,9 +1731,9 @@ static int io_kern_bvec_size(struct iovec *iov, unsigned nr_iovs,
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
index 73d7b1ebf0b6..351995b61e68 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -62,12 +62,28 @@ int io_rsrc_data_alloc(struct io_rsrc_data *data, unsigned nr);
 
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

