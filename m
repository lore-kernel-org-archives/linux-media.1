Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1D84D0CE0
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 13:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602390; cv=none; b=t2rovvsINiefa9OanERTHx5vBZasRs6IbCJyAtVxg5w2jrXPUUmHiy4GDsVpsTNzzJXP0nTEmrcs6tvj7IhAGQ5nZoUbRJiANU8Kzct683ASb9RiNX3N0Mbh/b0bkzndpquDO4389wC9ZpPrgQkcwWSC/Xk7VeT7z/Bj8yE4R04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602390; c=relaxed/simple;
	bh=dp8A9m21F4Z6vnwVaB36/IYEFqc7xZs52MFL03Y1vS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQ6fdJirUk8fzIYKcDc9284D3e4Uikp7oSoy0qdlOK/8s59fGHQtLXRAqE+1OyaVmZ99ilFi9eHV7UVGwUzpKhpfnESPol7JRCMUQrRi2Y6nuvyZHC9MWgkFvmv5WuJ1lmcV5vVOFIZUF90YMVn8H6b4BSidveys79U/Y8EldAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n0Vea775; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n0Vea775"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so18796895e9.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 06:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790602382; x=1791207182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=raEDt673oWsC7HjzDuokLb4yrdGb5LOQuk6WNjaexbY=;
        b=n0Vea775koJUlSUtF5+MNAJGT1aIZ2lp/MSZJl83hA2FW9hBK4FWdZHONhBVtNhryr
         j63EZ2n7a7ro0iSl7+VsBVaiLUwPniO15bfIH7dhdUd8pHcLQViQh3xyM5n+KMsTVAgZ
         MUjIUrThxu6h5r/3C0RvK4lr/TP/WwXPCJM7pc+8SXbjDAV5JL83DOXh0DmyVJRExuUl
         0+gVrhXT4/xfoanMnKt7zpikee0YYBJrAot+UKHgG3vGVGsplXPPHBFyV8x8Fv/VCY6H
         TzDfRVOU7HyRc9NbZsQ/TU9+/E1QT4d4YNlVmI1ce1q0q/vKSLbzf2KWIAt26nDT6pq3
         CJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790602382; x=1791207182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=raEDt673oWsC7HjzDuokLb4yrdGb5LOQuk6WNjaexbY=;
        b=VNt0LkBrLZklHN38k8i88bZ33OHqP+XO6tMjv5XZKeTt/MxT/A2FRqYOilU0WrgV68
         57KwoDXiEqImyhQnGyl9V5VBMAgEIr4JWTmqSgs2Ucqq5n7mVqnwn4KUrfb9k0heUS8s
         kHgeImjemwUWIAZsZs07o2q457OW7EJalkznRW2ihhO1DkiNlC1KwLuOrb50vQ4488Nq
         8+ifqHQCRDEidH0E2WqyARtmr/MQ4RiI59x4It1qtNUwfR1BSippugR1bTY7KUhHF3QD
         mollkfUII8k9v1+SxvaNGhTs2RwWzI8vECULDJDd+/LsX6PC+sNAm9kEqZozzTMn3tlz
         O0Dg==
X-Forwarded-Encrypted: i=1; AKwUvBy9A7PJnn6ojoqfuJCwpjT8OqsDrhkCNLK5AyXAeyUDZaiV+jUQoMwjMw+62FWsT2MLRjseoXLLe2N1PQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mFw5aKIkPm3/FoxbcO+OEpVkbRnlg8LP5qf++66xbxquVLESYB
	LjDzNMMEmaNoMUbN7QFhhqGNzNwquDa754UGU6ublAfJpnSbymyCs0WX
X-Gm-Gg: AYBFou0TPwq/o9idvKQSwPX6jRI1IQbuzSQFsGbjRA+3Calldk0+a0/xqlTCeIlFF+e
	jVJpZcOe6vGvoidvhWc6ADTLjlmpwFOPPpldTw6pqytxKWQHYl41w+qHVEKJ0PSHH48epDDpfOp
	uxoJt5SlwdI6aXd6KfCp/Dy1WIth9a8EP88qSDyo/f2lSoqzI4Lqe4BReeh9OWSSIYW/ToeNw03
	tbPw9TuU3Gd8bycaiZGKbDFkBqeeRn4P+EIDGyAk6E/74B93uxy6SmKDqIwzcNw7hkdetc9kjXg
	mIb5Kn+PAa3td4thc5AAsehaH6S8sHxl+U+7zjaM/xNGZAEfWkPFkk9MVm14M4aoWkaw64ZVZBg
	z2y3eugc5aF6D+u2zzttf9cRa4VF8cjea4k3boDvlCsk1GgYHw4njYy3rJSPdUrZiYaX3GfH0ud
	pj46A+4Jreo+UwDzy4tXZlCe9Ti9VFiX4/O2X1ayR4mmjndbZ3OZO6KlXaPXW4ozoi1z4kqMMav
	ifay9OV0KDmtSYbcCKxk1YjxdmzJL5pB6wBRfY6pCl+kbymJ4WcQ4yUux89n0e4d1bgbQCtpKLM
X-Received: by 2002:a05:600c:c3cb:20b0:49f:fc13:189d with SMTP id 5b1f17b1804b1-49ffc131a3bmr73381205e9.1.1790602381298;
        Mon, 28 Sep 2026 06:33:01 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm28090164f8f.12.2026.09.28.06.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:33:00 -0700 (PDT)
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
Subject: [PATCH v7 11/13] io_uring/rsrc: add uncloneable regbuf flag
Date: Mon, 28 Sep 2026 14:32:27 +0100
Message-ID: <6bb81fd0941222a30477dc849684d47333d1e4ce.1790602223.git.asml.silence@gmail.com>
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

It's hard to implement cloning if the internal structure needs to be
mutable and/or relies on other ring resources. In preparation to such
buffer types, add a flag indicating that the buffer can't be cloned. It
might be possible to add cloning in the future for them, but that would
likely need reallocating the structure and reacquiring resources in case
by case manner.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/rsrc.c | 5 +++++
 io_uring/rsrc.h | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 83a7ad9f5bc7..65d6cf7201ce 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1434,6 +1434,11 @@ static int io_clone_buffers(struct io_ring_ctx *ctx, struct io_ring_ctx *src_ctx
 		if (!src_node) {
 			dst_node = NULL;
 		} else {
+			if (src_node->buf->flags & IO_REGBUF_F_UNCLONEABLE) {
+				io_rsrc_data_free(ctx, &data);
+				return -EOPNOTSUPP;
+			}
+
 			dst_node = io_rsrc_node_alloc(ctx, IORING_RSRC_BUFFER);
 			if (!dst_node) {
 				io_rsrc_data_free(ctx, &data);
diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
index 9ef88383b363..73d7b1ebf0b6 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -26,7 +26,8 @@ struct io_rsrc_node {
 };
 
 enum {
-	IO_REGBUF_F_KBUF		= 1,
+	IO_REGBUF_F_KBUF		= 1 << 0,
+	IO_REGBUF_F_UNCLONEABLE		= 1 << 1,
 };
 
 struct io_mapped_ubuf {
-- 
2.54.0

