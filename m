Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972A9502576
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 11:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975773; cv=none; b=FRonhH7UYzMNkmuaYjzl0wqBbMb4yAEDoe/unySCNJIOcjl2GmkhOHhkdbKOvWGxes8cetaHUVXwHetg8YDyR5kwvHcIL8XpmyKbS2HF58cKWbPOWJml11B/q6wsjPbI7hgPb+JfOUw1DKOGu/LyorXkt3N0QKFmFNvGBfafkqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975773; c=relaxed/simple;
	bh=r60ha7f86tSXOy7awDRSeceZcMhT0AOlgJWaxT3jtGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S+IUUnoUXxX1ee7oCpM5T1Efx5WeB09n7ueoZRe7+JF9f10Seig0toUn0hXPBruCVDMUtCpEeRkWU/NMM5bjk1+F7aPofb8FWyYrjUrgbhoy7cnpsX5k4YF6R2vFR3mBguwPdJsvp61q7678+Ndr0XMeCkTH7UDkVARN9r/CvVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ec2J/9XW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ec2J/9XW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a01933b584so34775195e9.0
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 04:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791975762; x=1792580562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ays4SVba18pfRPB/Hpqu6QDaxGmpKJaoA/2lD097Khk=;
        b=ec2J/9XWQns9tj6FMC0xey6hE+ChJX7QMWPnnNC7ck9YAiDfM4dCYfGC6PGN7ASton
         nGvx8FSUjPxR0wkhYfPj0/Dsbdedi0x0PmmFkimO9rEEA3FoIph8o+wg3EGhp1ImbFz4
         Bhlqj6cUD9Ra0r+nlzXuM0ofwOuKMVJMycpHCtyNDKF6HPylhF8jl9c812YN1970grG8
         REu40iu1vOL7XzqQto+JHM1Xc6laDsEY0vfM/QX3uELyezwGFtN0e3Vg8aoagLyEsVVj
         TOpRkqKEB0cisgogZoA77w2SUi8berzjTITZmgHXbkVsEZRWfLXIhkjjJ1rRkbR8qMWv
         oipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975762; x=1792580562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ays4SVba18pfRPB/Hpqu6QDaxGmpKJaoA/2lD097Khk=;
        b=EHkIYMzZLx33UNN9B8VPEfWTjlcBNZO3QsISFmQhjDgEJD8hnujoK7gDgZAgrbdsNS
         mnrfZJgZtATTfiClpmZhOmbjBmXxtxLEroLuuOIEl6Okm79DN4LU/fI41HhHVyY1Omb8
         te7wkhMO38kQ2i21gMdRt5hOh8HNKid9svnLfbzh7pS2FC8dLyHVb3wmyc+xrfxAJ8jG
         /a7C4Vyyve4hNG+Qtw2N64RMIyiQ6DV66G9yXPgPWVV+iPRm/StXcojXg6Wn0BKkMTqi
         4eV5V39XmCKEbN7swVRho6R4oIxoi9+NdKaynsXV3rNHoxaYENphhn2/ZUToNk+oPAa/
         rRsw==
X-Forwarded-Encrypted: i=1; AKwUvBw5kPh6zhngidJQiWq6bHWHbbuhShaqprGP36ypiA2LvPQIplq239gzV3FS1ZWdjAtS0xxR60k9zXFxIA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLEfmMKil+Xd0MIFFAcB1ceRkAsp4FtmCgyeRUJClxe8MJpZTNz
	fxDZgZ6NEs+/by3TvdN/H8YUa37CBwspcGLbkNIyMptuBQEctFeUYBrJ
X-Gm-Gg: AYBFou29vNaO5AhHSwXzE2t1hRjVNI/I8sUWNce8dFTY8JXeab/zm1qXl570IJtqDnW
	o77XfB1N84Zd/3jXppmqywhAytI4fhKFSnj4JYjlSo0d4tWRhYY1WeWSwpiUE2T9tX8a4ve/ZDe
	b0DDwIANZkbjrRf0T5CztNSHP4PBfDSWAfnEPGxYkku2MEM225UpyI+wsXGVK4e8VHuqG6htE2/
	DOJVN56mW+Bb18L4RI48YgtYC1atBw3u5liFVX64UN2jBjPlIjx/UoxToAUZUV+EpoJNwfLzsJo
	M6CoBju0qxMFiXTVkNs08J9TVU6WhpFZAO7+HOl7GRUc/Km6gT5/v9MQRZAdpNkVaHWEH5p0zJb
	yWINfstbYq65ibsELmLvT5FyZa4e7TZYmwjPe/Np8uZwp2eGI1pxkwq6/md9hYUb0EGdWXT9aXO
	O38NjSWQpN/THjl5ZnzUBuhZPAOC3rspJNA6aeYlRyRJfSMcyynyWmAbmN5zutgrO45X3wSKEmw
	FCiFx5fWiqzbKFskYXnTivU9xhcHgm7bA9DduC7gCvllgTLqpmujisR2khFoR+IjIlAxwZpJRYD
X-Received: by 2002:a05:600c:154c:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a18e4a9159mr329602185e9.19.1791975762395;
        Wed, 14 Oct 2026 04:02:42 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b45eb78csm38078845e9.2.2026.10.14.04.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:02:39 -0700 (PDT)
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
Subject: [PATCH v11 12/13] io_uring/rsrc: add regbuf import flags
Date: Wed, 14 Oct 2026 12:02:10 +0100
Message-ID: <eb798e045bc245ebb7b0b42ba09a34b92f8b216f.1791975048.git.asml.silence@gmail.com>
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
index 532866a1e9b9..f42d201738cd 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1317,9 +1317,9 @@ inline struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
 	return NULL;
 }
 
-int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
+int __io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
 			u64 buf_addr, size_t len, int ddir,
-			unsigned issue_flags)
+			unsigned issue_flags, unsigned import_flags)
 {
 	struct io_rsrc_node *node;
 
@@ -1733,9 +1733,9 @@ static int io_kern_bvec_size(struct iovec *iov, unsigned nr_iovs,
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

