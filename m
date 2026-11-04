Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751565;
	b=O1mApH0rqMflCMI+Sk5KUyQJ+GWlGeSQnnoDEUL7GprueWLE69TeS+lQ0WBhye9gwqNc
	 irBCm3sC/5KaFYZHO0HmiUaYUuDoR6zMLHXl95EKakN/tmTBAlFcku/ZRM6QhyJzkIOKD
	 +me51QLt4WFNY6feloE6n7IB5Fpe6i72+ab/4x8OFOEcdJikW6wJes2IIUU/yFN2XjtUW
	 UNmccbAZfej7d80yjzHjXKm5/ayNDLEmafqDwSqpFIZhklFsiK8AFaPEvUXw2MqssjW26
	 z88VMA2Hf8iiHaGwrgYrD7PcIfDR0YfPRNMnahjC5WqABkHjHRNXV10XMMC9qRBcnmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XVYAkQiJxcRVRCy/m307F8zyGYSwmQhGdJmr4iFyUcg=;
	b=3AY1EzgH5qkmJTxmAexpBpySfnUCWv4IVII/xxc/LIu67o6e5GcQ+qxEaxHhPZTI1tN1
	 d+I+PqXYO+PSWCaZTJKlTl3N6reRRFshgLRdHXDdnpyA2qUPdwRZMcADiehp5MwfW9iHM
	 /y8RxZHxYY6VdoMdx2Kq0ufuWUqaIitGYJoZOpoADzXWoVzb0FB7fcyh16p7e+FdlGRd6
	 KInisHw4mWxQFPnV5mV5iNwFQMZNI//Fix9ePDIcdSdKZN0O0VS2RmtcOJ+nHygxnYaEf
	 09U613QJs1HI14GGJiHbybj96YF0qF7QdoKjBtv5j3nIRnowwl3HLsO2P1SO7xVK5yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ubHDxxZj;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48E0606A31B
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 00:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C48E0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ubHDxxZj
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso106091f8f.2
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 16:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793751563; x=1794356363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XVYAkQiJxcRVRCy/m307F8zyGYSwmQhGdJmr4iFyUcg=;
        b=ubHDxxZj7rU5XinezEEZWcKP0nRzW3AwNFt5hy58vHf3T1o4Qx1PHGZgNPVDniG8gJ
         cYrsILGN1FBWy75lXmZUSYF3+AN1Svm3edvlRj2Sxu5EvSyHtoggU6vLH51eJDpSrK5T
         10IoJBC2S484EOwmf/KQCB6+54VFFbrgZ/QOXvI6pNj6dVEo+8UhDLxVI0YHlToXNxFO
         5cHnvS/z+1Nc7tzErbZvOKmbxwNteSUlofkVUMWJClgZQsUpoO59CNT/sTHvpf33zI6e
         ysaZEPYfcdyEJZ5k1dWEusf3nj78SP6JNirFZ7APQYBR6SUmK9u9klK1nv8jERrTOeux
         A3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793751563; x=1794356363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XVYAkQiJxcRVRCy/m307F8zyGYSwmQhGdJmr4iFyUcg=;
        b=jnO8nDJNEc+VyUJGXi5aQeWiPOtSzowuoYDwiFY8l+ev6LHICQITgxs7TQWsReSYBj
         SvuCZ5yyObsTMukTnNMgWcmZ2j3NnwQ6xY5696BCiMv1J9XNqUQ6lkZEtrmGNKEQ3Iw5
         7kYN//+F2CeN6OJzn0ZoRITgDjsBHVIaU+oQTGwqY3JZgzYNhmsvwBods0rn7Ro5ph0W
         NfaHaXSQYVVf/IDVYO7oBil31wkyia2y4z4xAWYjJQH1AixvmPcC413wmSbZFp+31SpI
         eGQlNojQ2Xdymy1EWEPME9dgGM9uAdJFuci+RPqSnS2ZkM1OXpxu1bI6xuMNhPGMyMUa
         72Lg==
X-Forwarded-Encrypted: i=1; AKwUvByQttIcS56C28uNGVdo4aoph52uTNoKfv0UBAUIHBXcE8Q9T3E+pK/ROCUkq3Cc124JnmUyXHdNsDIXmQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z80WnzjSH85KK5zFQA9jJs6av3ntBzGJHB5iVcGJTHonyHmlEUF
	Obu+2tA/S7bL/foms+XN0Qu5PVYo2RyuiXPJw66cidY2HlIJMxgowaKa
X-Gm-Gg: AYBFou1cX1/ckvl+GemiTN4aHmivLlLfPPzq/WTo3hLj/fsuZhZZqV9emJz3Dl3JrXJ
	NbrcIl9UuLjrL5j6kiRMEZoVEI0ccOG1OQRu39EkdFt+CGF4tMri11Vh0I6jopInCRHAwUIFc1A
	BMzfUvcuABy45DrFWFk9Y3qsAN31LJZcPZyPhTLI6TSf6yc8mC+rQSRQTPMUQJq4j7cHU0v3ad9
	1n66FAZgKaRTcfSIR2EM517my2aKO5iixWNPHudOVc574Su5YN2PPs95kfSPH6Ill7T0O69Iwk/
	/xGtmg14XOgcbx2mj96RhqLIEFuCc89JBzvQKm+mGIrdv3TvBBgEtpGgZlJhIMRQIbeAXCRV6bO
	ywm862gpL11Mjw/uCRwOer+rOjqkLZhpn5LwuVtzTq7R4MMV98dsnqV9aHVYupKe4yFNOEWYBb9
	cvjn/3F73xR6LcWd7LB29j/WMbfPDGethVuXseBL/F7D6d1NSciAvc/rbIkOfq/CGDmejUSxWl1
	TdrylXv2WC34kwDu1rdafC5mg6jO0ZVMgArwCP+sSX7Ehz3q+RCMD+6eTRaU/jpHUp3sSIgfmt/
	X7Z1KiLQrJVi9aapIY6bBCvCCkwvQu42o1THmxT0spvUkoyepUwtOIb6sReZGDos+2LpUD/QpAw
	tmYPtnUKyMwx0q3Ib5X6dhcqkYLfOk9E=
X-Received: by 2002:a5d:59c4:0:b0:48e:3085:425f with SMTP id ffacd0b85a97d-48e6e2dbbdamr34641010f8f.2.1793751563267;
        Tue, 03 Nov 2026 16:19:23 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1fb0esm676676f8f.49.2026.11.03.16.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:19:21 -0800 (PST)
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
Subject: [PATCH 3/5] io_uring: add data to dma-buf convertion helpers
Date: Wed,  4 Nov 2026 00:18:59 +0000
Message-ID: <e9e74cb1d6e46f62e29b0934fa9c1e7f2d2c1e3b.1793751001.git.asml.silence@gmail.com>
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

struct io_buf_dma is stored as void * in registered buffers, and it's
casted in multiple places. It's inconvenient as void* casts can't be
type checked, so wrap all of them into helpers and keep casting
centralised. No functional changes.

Fixes: 62e4bf5b25d44 ("io_uring/rsrc: add dmabuf backed registered buffers")
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/dma-buf.c |  2 +-
 io_uring/dma-buf.h | 14 ++++++++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/io_uring/dma-buf.c b/io_uring/dma-buf.c
index 132e3d0d7023..6f1d21c0f558 100644
--- a/io_uring/dma-buf.c
+++ b/io_uring/dma-buf.c
@@ -2,7 +2,7 @@
 
 static inline void io_release_dmabuf(void *priv)
 {
-	struct io_buf_dma *bd = priv;
+	struct io_buf_dma *bd = io_priv_to_dmabuf(priv);
 
 	fput(bd->target_file);
 	dma_buf_io_ctx_release(bd->ctx);
diff --git a/io_uring/dma-buf.h b/io_uring/dma-buf.h
index 534c06b6879f..a97412ebbb3f 100644
--- a/io_uring/dma-buf.h
+++ b/io_uring/dma-buf.h
@@ -12,6 +12,16 @@ struct io_buf_dma {
 	struct file			*target_file;
 };
 
+static inline struct io_buf_dma *io_priv_to_dmabuf(void *data)
+{
+	return data;
+}
+
+static inline struct io_buf_dma *io_buf_to_dmabuf(struct io_mapped_ubuf *imu)
+{
+	return io_priv_to_dmabuf(imu->priv);
+}
+
 int __io_register_dmabuf(struct io_ring_ctx *ctx,
 			struct io_uring_regbuf_desc *desc,
 			struct io_mapped_ubuf *imu);
@@ -39,7 +49,7 @@ static inline int io_attach_dmabuf_map(struct io_kiocb *req,
 	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
 		return -EOPNOTSUPP;
 
-	bd = req->buf_node->buf->priv;
+	bd = io_buf_to_dmabuf(req->buf_node->buf);
 	map = dma_buf_io_get_map(bd->ctx, nowait);
 	if (unlikely(IS_ERR(map)))
 		return PTR_ERR(map);
@@ -53,7 +63,7 @@ static inline int io_import_dmabuf_map(struct io_kiocb *req,
 				struct io_mapped_ubuf *imu,
 				size_t len, size_t offset)
 {
-	struct io_buf_dma *bd = imu->priv;
+	struct io_buf_dma *bd = io_buf_to_dmabuf(imu);
 
 	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER))
 		return -EOPNOTSUPP;
-- 
2.54.0

