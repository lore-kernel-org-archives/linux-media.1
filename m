Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2486370D7C
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 09:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144729; cv=none; b=TpEKheU6Sj6Fh++b67TTYjK3yd+Xrv/BwMu0IG0nj7W5RJDf8Dbe3uUBKgIO1Pm2irv9m/nhd6wsS6yIAa9/DBiehH81C/r1lou0I3KSnyoHP2ijpEOBI+RzkewJl8eTLjnIgaiz50RLRHSAtNrTpnJz+blDiFzdfJatPbvV2ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144729; c=relaxed/simple;
	bh=NOzo9UtrfXrBxeXN6L/zMybYdAYQiBOS8ivGdbg0DuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2g8v4eyQ3wnnc3rOO7EdMU5PvoENl2rIoZv4WQ9xx48maA7+3JSJ4hDh1fn68mxvzHFoQtI5u9BDAONLH4LOa6LeJBz9oSvnzQurZnFgEEeLm/z2Y2wn8zAIgVY2tMciOk+S/+RAJt+8cCUuq2fqqghkJigcXwAEWAYVXNWaOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSEGkZyu; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSEGkZyu"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df4f540ebso988623f8f.3
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 02:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792144726; x=1792749526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LD2knUg3bwI53NAkb4XKjLA3TEnvxqdDcA9IYxZn/Mo=;
        b=TSEGkZyuJjDVgmXZBn+b3n8hq2O1ah2mTSsMXXWTsBH6VCAFjUopMU5E6Nm2FGDrBD
         57jLmjPTy5lYKFIv4x3TP+Z4W8WMSDBFojq+7VPoaIqpF8qcBMS0/rzUWNTsZcqIabwN
         3binmxN807VMzpPgxBRQ91oZ5wQyGfP3pR7UB16007WFT/GteIiRCxS7mjXPNQ5d76VT
         wCWAyhTAa1EIdwKuInnS4n297hwpepYz6c0LTmJuuZ67FpvsrquKtQwE0/pGtlMKMNb7
         fSVKTdj4qRIIbHXeMfjRNRbI3xNBdUZEFdl8xYvGL3bKmiau2sw3gw8uZADV4026tciu
         UFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144726; x=1792749526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LD2knUg3bwI53NAkb4XKjLA3TEnvxqdDcA9IYxZn/Mo=;
        b=0Dlmnbl4tiT9T3GeL+akAflLc88rSVBjyXGdpfVa5VUFsgQTz9t0jVADiggnlcHMO+
         yebvTIq5C7t5TEwmcrLrAhh21VgxUABCKD4qMznkKaifVmCmsLUoizhg8AirzEfccjeW
         TW5lAjQkHbw4ih/5FqJ+taVRutROhdUq9pCkahSsD2uLAwlA0KQo3RrTB/TW6E82QFac
         LO/ZB1HOG6bIkEcZ8ofWVcfYixEWXwZpd8+Es6qLQFqLs82zN2UTZJtWh5i0yB1shiUJ
         Q60Ls7znMFPduKLFkRkYuVHwBwJGFz1KvO23POIiHkaVpg0+pXiMqNFzPXM6mp4rUsLa
         hkEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvIcBZZIhVHOjZuz0rwrd+FYSZjGV5Px64KtIglfYu6g2dMAP77YyE7ewvJd4aASkmOMAByrWj+kvHBw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL85hSUy7pJvpv/oDv0WiExPpXqvtNQ+ZjEu3Cqimm58EffoDxF
	k4d1QgKxX3L5S7MpBC53YFJc5qy0c0fE3oFe7gOw0BV23UCjoklH/KcK
X-Gm-Gg: AYBFou1bIyiRmpJZwwne1bwaeIVPeJywU5mKv4pbUS9DlEANUkahgxicwcP7GQLBjqo
	1258st59HIt7D2vx58DpYi9p9zQIu4eUfTnF9i/KtrvjGTCgAMaxlFk0YcM+eJX2EW0AXcYwCrJ
	7XzFP6T3gMFtvU0Y4Ps5Y29Mzv3PP/RxO0e7xmm5JVVMkHLfjL1W72JnnokENgeKrPNioL74sG6
	DVLxkdDVEwqioT6EoG5J1ELjvseI/RCynrav9seRHwz6+ULiJHGW5jpEtE5wFe/VB1wLZhSvtQ7
	Teb/W02nYiuDenp/x2U5QacvjNooE0Zojys9nCSUONP9dRbVQ8YqQKqmgzyxmBshrmMzB2GAU4a
	n1MOXujoETbEEoRKIJ5DkEfO3xoeDwWfFtiF3FoO0onYQAKVeYVWdfEt5nJa5bxztz9BL2BZSuH
	HeoRi/HhTEKVBZ/UQa1xNcgjNbbMl/h0jFo/Gt7hNgMwDWmsW+brpkBr03XYSGO6uzVQ6qiuxRv
	MZw4MeYb6nkgSZRVIF91lAwKSOrGECcHc4nNneshDFo5KTTJpIkJfMRYbjC6EoIlewz9uW0u7Fo
X-Received: by 2002:a05:6000:29c3:b0:48d:c15c:94a5 with SMTP id ffacd0b85a97d-48dc15c964amr29582852f8f.14.1792144726031;
        Fri, 16 Oct 2026 02:58:46 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm4133033f8f.45.2026.10.16.02.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:58:45 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	Jens Axboe <axboe@kernel.dk>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 2/2] dma-buf-io: document dma_buf_io_init_map
Date: Fri, 16 Oct 2026 10:58:31 +0100
Message-ID: <a9fdfbe6e447ac583f4d3a3f981b203141a624c4.1792144609.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1792144609.git.asml.silence@gmail.com>
References: <cover.1792144609.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a kerneldoc for dma_buf_io_init_map().

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/dma-buf/dma-buf-io.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/dma-buf/dma-buf-io.c b/drivers/dma-buf/dma-buf-io.c
index e432194a5dfc..8440151de860 100644
--- a/drivers/dma-buf/dma-buf-io.c
+++ b/drivers/dma-buf/dma-buf-io.c
@@ -43,6 +43,18 @@ static void dma_buf_io_kill_map(struct dma_buf_io_ctx *ctx)
 	dma_buf_io_map_release(map);
 }
 
+/**
+ * dma_buf_io_init_map - Initialise the map.
+ * @ctx:	[in]	dma-buf I/O context the map is created for
+ * @map:	[in]	dma-buf I/O map
+ * @sgt:	[in]	the backing scatter-gather table
+ *
+ * Importer's helper that initialises @map for the provided I/O context
+ * and scatter-gather table. The importer should call it once for each map
+ * on creation.
+ *
+ * Return: 0 on success, or a negative errno code otherwise.
+ */
 int dma_buf_io_init_map(struct dma_buf_io_ctx *ctx, struct dma_buf_io_map *map,
 			struct sg_table *sgt)
 {
-- 
2.54.0

