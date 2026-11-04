Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751557;
	b=V6/Ye9iuapI6P+eFgk37EZn1MxFsQBN3T09KFabZpkR767jR60oI8HT3TtRGJzVXip8t
	 jwq6bfGRiDVp4Ic2v3rFjZ9G7wMPKdvq7sYeLBJMhrnDQQ6JnrUq5NTpG1+lrv13tJ1vZ
	 xh6taxjVnw67c/D2QvcbOaXThx5A1o8Mt0VBLG5HVSeOnMUJ0WzMIrni24gky8OsGVsCV
	 KZd3tcW58aOSOmIX6YmSDPnGyFOAbrhOtrQB666tsPm6wW9fHdcHkwQtHyVxlm67OjRyI
	 oMC4Nkdi/uHTdSqphJiYwMG/CZ1IXjTLc9iB+VvrW6Uiz/vgS55UngqOMqt0elWPbCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hxI6oNEf2EvFWjGeDFQYrrcpmAnzoeBTieQsEmlXNt0=;
	b=IDoFltXGWzGMmySg77DkUdwS1Q94S86sO/pCY5QGnGCZsQsB9sQaflWO9AnfDbIHcUc6
	 43xAHm4gfIyuAI3I9EQShnb2IQzIyilOKZCnYZDFNwDKXunFvNQYKFAs5mcZyJgvhbN18
	 u97jiKE3517qgo9TlLm8tSVi3ruGfLAnxlapiha4ZyMJlhG3WUEtpIGgHtvKo5DkgiwAX
	 LsMuekPImmoiyJIfPfFFXjl141t48iVgQW19ZS9jiEMAbIL131TwgYNwj9X5hvJI/BkIB
	 ggjhkjPyimjbTpeDQQ+WmBQ1bKiVDsGRCx5y5R9Mk//g9oyTu1M0r1zBWp8q0yx/elw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tRuoCViD;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD21E606A32C
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 00:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD21E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tRuoCViD
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso106026f8f.2
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 16:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793751555; x=1794356355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hxI6oNEf2EvFWjGeDFQYrrcpmAnzoeBTieQsEmlXNt0=;
        b=tRuoCViDiz1iXYAGfLXl4R7y+RpayZrjfUA/EIamwmY7fg2tTWVGnvqmEJ6GzuXb0n
         L9q8v7usrCBqH5nyZDGX3z5SVn8+UF5iEWXHYkpiDZZkH6OMnjwQ1ejQfNwV7dFEy5jR
         DSP46baP6aBJKObk8ZJZHOyfFAhX8L5VsVcCNcqNk/mFdWI5qCvSP6bBvypVKaDv4xi/
         8c6dTf5zVxiHwLo6vGHS2EpUHkAVNBNV783B22uCwCuIUaqIQOFbFClcmBQ+gvX4CByQ
         U8Cb/QdTzUTQVtsrQ+rA+9i1ftqGQQFxCenLkBm5DlCh+HED1O+6CcYoZVfCg0pv/4IE
         DN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793751555; x=1794356355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hxI6oNEf2EvFWjGeDFQYrrcpmAnzoeBTieQsEmlXNt0=;
        b=j/HeAHYUBQzDArHX/VCco49HBRPldFnC4gQXiFOimjBv+SeBq2s62KxXksNrXd6NRI
         NcMArtZ1OmY3fSXMwvtqe26Q96/Mn8lYS0HW8EnOEZvSuQKywgNWLX5ems5oS7SukOvt
         kmrZYHOrFAHNn4BqRAaIhSXInoQWzqTDN8xLaVYaSzflpCfi5DES7aEvjvUpTx4TG34A
         etm5jpBfo44HD3BfwsoLILqcrJG0IH8yH/v5GpKSoJ/4iyKlpWR22xQuIReQKXDiO2XY
         KvXUeiJIgjGPaqgWwMZgTmJhXl45q01nlCYu/yDbfiEOKiFdIvFxAxdYt0vUy3z81Qlo
         Q5cg==
X-Forwarded-Encrypted: i=1; AKwUvBxs1JSTNoL2qEcAJqrS63x1C4Ss0A+PJxf9DXR6yGMdAGF0Qd/eO+6noGuwg450u6zxTON+E6oGQeOscQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z89j+k14uRr8f14Hvcs1ZffRCfPRSA8RutzihzFKGnBsGgU9mjc
	k71q32XAXVCv207BiAiL/Hq3iVDNKDrybOVgEBJ3FVFoFcuChgKtXoUF
X-Gm-Gg: AYBFou1oY/o3qbaMjr5dlHWmpqD7aJH0lpkJG7kVP+q+x15Fh9MVeARwRwoNNuD5AYY
	P5mDTj4eaC5KYLRdu1E0JPeLSNy4sgrx147nXTV6iijMYFc2YGuJTzGtE7tmOLlzfXrT0XRwt4H
	8CINoKoTc0Z7zFxAHWDwZin5ONEju4LBPhDdnzPWReOX0QeuU3L8TpvGB5Zi88o4KX9cziv3JF/
	Ryd43uu0blmv53Aq3fTOl0Y8Z98ial6obJPECzeVs2+Z4jZ3BR2q0V6JIBzgdbGmty4FrOQtyn/
	q7mOch7XEOjgKgczszhnThEiTxREQfzK53GuPG5ixDYk80ONJ5cOybB4Fq1YSNay1Ioe70P8Bk/
	0X/TKTL/rEgX6nS58z5TGwg+6sBoAMyNP/ZpzMFZO3RqJ9RpKc7D0FskmHcb54fIfNV5MMX8d6y
	kmGFqItBHrxQNqsfTSyMMxO3WX0xZ4WKk0/9zKIHP6L/fgf2XaQ0gLUbXTGTL+hzAd/eJWLaBbU
	BlAMvJUqdjqAMAZLdz01FeW4pPeVrV2ict88Tziu1FGz2m5beKn1xsSxZrM/1hWPNZc9ZfSaT2h
	r1qA7ZNImyp8ANPxw2snYWbfVZ2z1Pp3qLqvOQSVwhqLl6Ypst54td7bk//7DeIsnFGAaCs4CkU
	8u+2N6P4nO5YesVy7VpsvMxnd3G6K0oM=
X-Received: by 2002:a05:6000:4027:b0:48d:fbdd:4132 with SMTP id ffacd0b85a97d-48e6e4f540bmr31194343f8f.18.1793751555202;
        Tue, 03 Nov 2026 16:19:15 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1fb0esm676676f8f.49.2026.11.03.16.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:19:13 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org,
	io-uring@vger.kernel.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Pavel Begunkov <asml.silence@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>
Subject: [PATCH 1/5] dma-buf-io: add tags for sharing ctx b/w files
Date: Wed,  4 Nov 2026 00:18:57 +0000
Message-ID: <9fc301319428c6c47fa183ff90d60abcca8ea63b.1793751001.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1793751001.git.asml.silence@gmail.com>
References: <cover.1793751001.git.asml.silence@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, it's only allowed to pass a ctx to the file it was registered
with, which is enforced on the io_uring side. Going forward we want to
support filesystems and not just block device files, and it'd be too
limiting.

Add a dma-buf-io tag to all files. We're going to save a tag of the file
passed during registration and later use to reject files which tags
don't match. A tag should be set for a file by the importer subsystem
implementing ->init_dma_buf_io_ctx on creation and should be unique for
this instance of the subsystem. For simplicity, we're going to use
pointers for which we're going to use pointers, e.g. gendisk for block
files and superblock for filesystems.

This patch adds a new field in struct file to keep a tag, but it can be
then be switched to a new f_op method.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/dma-buf/dma-buf-io.c |  3 +++
 include/linux/dma-buf-io.h   | 22 ++++++++++++++++++++++
 include/linux/fs.h           |  6 ++++++
 3 files changed, 31 insertions(+)

diff --git a/drivers/dma-buf/dma-buf-io.c b/drivers/dma-buf/dma-buf-io.c
index 8440151de860..60dc58fc0c23 100644
--- a/drivers/dma-buf/dma-buf-io.c
+++ b/drivers/dma-buf/dma-buf-io.c
@@ -166,12 +166,15 @@ int dma_buf_io_ctx_create(struct file *file,
 
 	if (!file->f_op->init_dma_buf_io_ctx)
 		return -EOPNOTSUPP;
+	if (WARN_ON(!file->f_dma_io_tag))
+		return -EFAULT;
 
 	ctx = kzalloc_obj(*ctx);
 	if (!ctx)
 		return -ENOMEM;
 	ctx->dir = dir;
 	ctx->dmabuf = dmabuf;
+	ctx->importer_tag = file->f_dma_io_tag;
 	get_dma_buf(dmabuf);
 
 	ret = file->f_op->init_dma_buf_io_ctx(file, ctx);
diff --git a/include/linux/dma-buf-io.h b/include/linux/dma-buf-io.h
index d9f27650a851..299edf0baaf3 100644
--- a/include/linux/dma-buf-io.h
+++ b/include/linux/dma-buf-io.h
@@ -48,10 +48,32 @@ struct dma_buf_io_ctx {
 	enum dma_data_direction			dir;
 	bool					is_dead;
 
+	/*
+	 * Tags represent an instance of the subsystem the dma-buf I/O
+	 * context is bound to, the set of underlying devices and subsystem
+	 * specific map / context structure representations. Remember the
+	 * registration file's tag (see struct file::f_dma_io_tag) and use
+	 * it to filter out files that don't share it.
+	 */
+	unsigned long				importer_tag;
+
 	void					*dev_priv;
 	const struct dma_buf_io_ops		*dev_ops;
 };
 
+/**
+ * dma_buf_io_file_compatible - Check compatibility b/w context and file.
+ * @ctx:	[in]	dma-buf I/O context
+ * @file:	[in]	file
+ *
+ * Returns true if the context can be used to issue I/O to the given file.
+ */
+static inline bool dma_buf_io_file_compatible(const struct dma_buf_io_ctx *ctx,
+					      const struct file *file)
+{
+	return file->f_dma_io_tag == ctx->importer_tag;
+}
+
 int dma_buf_io_ctx_create(struct file *file,
 			   struct dma_buf *dmabuf,
 			   enum dma_data_direction dir,
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 99caef43ff3c..a9bb63cf6f9d 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1293,6 +1293,12 @@ struct file {
 		freeptr_t		f_freeptr;
 	};
 	file_ref_t			f_ref;
+
+	/*
+	 * A tag representing the underlying subsystem for dma-buf I/O.
+	 * See struct dma_buf_io_ctx::importer_tag.
+	 */
+	unsigned long			f_dma_io_tag;
 	/* --- cacheline 3 boundary (192 bytes) --- */
 } __randomize_layout
   __attribute__((aligned(4)));	/* lest something weird decides that 2 is OK */
-- 
2.54.0

