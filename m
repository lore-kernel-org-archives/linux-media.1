Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A32560AC4
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 20:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924952; cv=none; b=Qay/aVrEBwTAxvEHSw/Zs91Tf3yIL98p7PU1S/LF8OC0V3MNIozGKLpBU59B+LyuNMhA0mzTht42GDau8VfeSwJsNIwS2Uh0YruE2kK3LVb8LdjogqUiOhk6758SCD2svHtzDFBiv2nMLUA7mVeKjZ+LNZDlYGVWWZKwITuSW4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924952; c=relaxed/simple;
	bh=r60ha7f86tSXOy7awDRSeceZcMhT0AOlgJWaxT3jtGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n8fEweDW0lPD+Y2dACNLftS0EIvtsSveFoc1WfgeabJ96ia2A3dHLmbaA7OR+v0UskPISBUadCPeOnakcx1idgohYz5wiNwiJb4urmSeQSSptwObsz/pqlJIeiLgvEO80GahxrnF4qqIu4jqpJGqHSpFEC2nqISQ1JI1xQvWu/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxZZIuOx; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxZZIuOx"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4be28b82so3340032f8f.2
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 13:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791924945; x=1792529745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ays4SVba18pfRPB/Hpqu6QDaxGmpKJaoA/2lD097Khk=;
        b=LxZZIuOxbxtAdJEFuNKtznhoBBpEf3ufoFq8v4kzTbqgOqUFJe9dhejArkyc+vYakg
         gA82Qb4w+2eaopT9BqTesVEw0igg1/U5EQYOgXmKQZ+GFAM9mPkf740crYic2xoOr666
         bEK6oWvBuK1Ob4o/Jy0TZYoXTSAGDutRsS8HyREoYGGVR4WRppv1WzteJN8abdPeTftd
         UeG0JyYR9+pa4mf5P7/nuFz9by7Zjf/RX2Th4uYYGMDXdZz6oXHcq/hHPDdSqMVMCRWb
         zDKQ5xki635PLGpoMCHY4SxYCAxVVAJxQwD6gQGdv92GWjFj/PaVwMeRBm/VNv/LfSR9
         IO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924945; x=1792529745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ays4SVba18pfRPB/Hpqu6QDaxGmpKJaoA/2lD097Khk=;
        b=hJuiU322pk/G87or8elZh140JZeZLyJ8NpVHlDfw/OqtVW4JeKKC2kSa2uC87FKoQK
         N7/AuTBq0kpwT/Yoj6cwtXk0E/Dso1xPVRPTEV16Rghd4U1wP1FQd4sEP38q4iJxFxoO
         O2RDVUPfci5YYmpgGr7HJE3aqNaKT1zJBjuZXtbWtEQPOL8qtDVdAWAdkdP4F/QzLKDG
         x/iupaFrHenwtpBR0jXtaPIUdeo5zbZQ+nkJYtJoKqDZ8Z8wMdC/h940Wk8XrSVPxt8S
         Z73S8DKmCgYM3lPqaw2m/dTJ/6mKIsf2ye7VaykMLK66pLQqyNQqmo6Jb7jM6MD45/LG
         oCBA==
X-Forwarded-Encrypted: i=1; AKwUvBxjW14O1/ZslYonl0KmDDQiFErY7gQNnKQR+YsLeDvmghO80wUnExpDl+1qVm1XAvw7Cfqn30rG2YY8ZA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLxuGEXjIMFJDgEceF4pDx8sDwSiWgEjePWe3FmB6IOtI/VEK8m
	DWAbiqbO8TAf919gOvK33QGXpWQWjKTa0Qrqak5pBqPcMBi8ocztaDqS
X-Gm-Gg: AYBFou2sU0+DlCP+2QHA15Fh4ZjnL8Hx2+Uu/anpeYa8MuQcyqdOCq770/GrpjugThT
	1N9hqbTIIT152/cD9OLvDPEfVUxvmOCwYm1V3GhGrtXN26swXfZSrGfIRHrmHiSNVW877oNrdCE
	06NKP5YOChjCBrG31Ur0eawW08XoMV2nacNlix3h+OlsWROI4Xmo8MBDTBNpsCqZTUaFttJ73O4
	bQ+0djW/AUuciU5nFX3ntauyWN3e2J2lhxsWNpQe9wgnBM0W1fJgIGNbsl/3e86LbbtBtglHr47
	9DM+j5NaMc7H3siQ9aeBnnD5dY/bY7+rxBrt0n1/chKnrR/JxXWFBToHFBGJ75fhYNjidSIWUi0
	EkAVuXKZhnSJLvMPMjNA9geyVvqP+MrkOC0haP84LznN2Z14/wDeldve9Krg0+L0Z5tEKH47FHM
	MKSeHaWf89q1Rl9FMQ88E1+AbUVlYg03hxmVQASifjGjvs0hRDUFcCoDc8iVTN9VlJ7t9b39Rby
	36gC07Hy6mMHoj03WhbvYriA2eu+h0WktuXWHz+qEjQMc97vlgz5OfSr2rPAG1f2PwKBpib952x
	/HmQEZj0G9M=
X-Received: by 2002:a05:6000:27c6:b0:487:27f9:82b with SMTP id ffacd0b85a97d-48dbaae34e3mr16754768f8f.32.1791924944821;
        Tue, 13 Oct 2026 13:55:44 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm2380730f8f.29.2026.10.13.13.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:55:42 -0700 (PDT)
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
Subject: [PATCH v10 12/13] io_uring/rsrc: add regbuf import flags
Date: Tue, 13 Oct 2026 21:54:56 +0100
Message-ID: <4b7c13d9860640499460862c8cd4a13602ca174b.1791924581.git.asml.silence@gmail.com>
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

