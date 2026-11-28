Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795887366;
	b=5Jhr1t+PIsGdBtA1qjro3aQrM2KXhJvC/+nHFBfMRhKhtGIdAkk+bM6loP1HzQKnWirb
	 P3O84CPG2uMLGBFOp2Gc4pzQXNklbLolVbkeOAbVIoG8FnYkv3MnZ+NaXLq9VfSVLYjyy
	 Q6AWKhB4Z+S9yuy/L7sE6atWU0VArNtjo05oprhJOwGtU8nd+mkMS+Y8y0h0A/jbfJkft
	 88SNGOZrkjqAkNL+o/fdoNk35yVPD+vW5tHqGFmz2arNDM2RDq+9fDnhB5RkpoTdmbzIN
	 8SzX+fckbGf6BQ7D8NfmWo1DwDdzcZ7augOgHqXZuSVvSJGm3AQXknYQCytbAEWdkug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795887366;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fHfc3YvkhS7yl7zz2uqEmuGOXvhYSIj9e8VlLfqofRY=;
	b=OkeVD0kOA/6FtJ1G66+0abcBpkCR87ypUPmzAwj1lLYLVDPLzZTemkmBKs+saHq+S2G7
	 35XXdyBzbnxfoMqGeWDp0HgMSxx8r86IjYEb2rf6aL1dNMXFEGmKBkd33hPLuIHZFm3WC
	 q+Q5raprS8D7WnYHSfUrxRbh1GIuOXxzJOz1lF64tzflhwIoQqz9COXT5d5wuTdcAHP+C
	 VuMEsnsdGD6xhdcOFeTBl6SUB90NOncjv/VDyQKcnJ8DU5yXnNXOSmddIPiy+QwyoZsAn
	 ts0F1Dfmc+oYqQXtzo9VIcZPw2sI3BBt+SL1WuEEZhL50hFvkGsvQhQTSkFMtoeZAzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="c6+/epOR";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1CE606A689;
	Sat, 28 Nov 2026 17:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c6+/epOR
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795887365;
	b=AcY3hppY8lNQANpzifW2gY54ttMleRQbN89fOoKZvflmIWwqN+qub4Zry6IufPXOIqo/
	 luUYeq6Fj0qD1ZtAQYQ/XM8CBFnQhE04LFJRy38LmVl8Hop5NFROi5WEv3UZB/GRzY0lw
	 TBOFxJ9QHQEwx0uPvY66E6OkU9gXOvkth0YyxjYvwqcSNd0++PA4NLPj8vZjW6xq9fQZF
	 fcq3UCH1wsj1U+Jcom6vb5dzNP8qmikaPe+gu96EiXeY8oqE4kSqAiGgLQv0XsbcqPE3k
	 OPkuGtiHkn05Y1+vJvnRF0fXn+oF6lRLLUOBbOzRupLDkduIrNx3lQ6SsmFjkuthYFQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795887365;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fHfc3YvkhS7yl7zz2uqEmuGOXvhYSIj9e8VlLfqofRY=;
	b=ysrgTH7PPjRG5BFuCv/fAlsFAkV1qoDuVPyS3+TZDKN3sG7ob5kDuh74bcf9frBOci3K
	 g2KBGGtjXivzSIfkvWFafbOvq+9PrBuaTpFiX7gY+HAMQhMCXDI2TZ7OphebBvvqltHMk
	 1SZF8UEpQArbD4pnN36TuGDttbaZAnsfJiuH6VpmON7dEEC4ego4ptkQBbisN0USifAXo
	 ji8iyj4SGlTiDViiXjvtb8dsEQeEDyLzSzw2aO3Fcpfevzd56Ha2OwLrgrzW1NwvSQHfj
	 yHcEInY4j5uVmKgo5u1WUpRWcslebEXzVrL7MSinLhZRYVOziBCW/HBlyDmOyk4sa/Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0ACBA1F00923;
	Sat, 28 Nov 2026 17:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795887365;
	bh=fHfc3YvkhS7yl7zz2uqEmuGOXvhYSIj9e8VlLfqofRY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=c6+/epORJWpFvvDJtf/E6E5HwL7YvvznXzVotIT/r5pnvYJTW+nWDhPvASRVaczIR
	 BMnO49x7QDf09TV9+5LXLga9NrGNpIQdl9+acqu4cFDcJxxxGzcOvaofa6xDAK+7qx
	 BmzlhB3+HZMagtd5Np+89/Ovg+/6lbVUHxbK9n+Qdnn8cnuBuXdjcRzEKoQVOCFDUS
	 STUJEA6SYTzX/6xD1LrmY8WjmJieKnPBYY0UoaOZ44DOx4pN4wEIzkwF5P5H1EI1q6
	 YDzPUnHqFQcZtreXCSIhOqqjWrKzZigm3bFB4cXl1k2rBHsOM0Moo+ZsbJi/o5heaU
	 d00lGIsDUhfcw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 88D414E16F;
	Sat, 28 Nov 2026 17:35:52 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:35:52 +0000
Subject: [PATCH v2 1/2] media: cedrus: fail buffer allocations that do not
 fit with -ENOMEM
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261128-b4-cedrus-generic-fixes-v2-1-af8472be660b@gmail.com>
References: <20261128-b4-cedrus-generic-fixes-v2-0-af8472be660b@gmail.com>
In-Reply-To: <20261128-b4-cedrus-generic-fixes-v2-0-af8472be660b@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795887352; l=1307;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=GKc4myzCoKXcSVUjdfaxlMm9I9Iejl8cgwb8m6lxa2g=;
 b=HDrLG0HP1UVKFvL84PbBf2CZVHd6CCYBbjQnJgLfZ84ypLJbzlKz5EjdsiWqzOcKrltiMozKQ
 SDuf+7RxpmADaBjCR6V2quKey31b0BjGgkMsGyWKaAQqLrkkCw/TkJJ
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Behind an IOMMU, vb2-dma-contig builds buffers from GFP_KERNEL pages,
so a buffer pool that does not fit in memory invokes the OOM killer.
CMA allocations fail directly and are not affected.

Set __GFP_RETRY_MAYFAIL on both queues: the request then returns fewer
buffers or -ENOMEM.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index ad4ec3490775..9b2d24e77fdb 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -602,6 +602,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->dev = ctx->dev->dev;
 	src_vq->supports_requests = true;
 	src_vq->requires_requests = true;
+	src_vq->gfp_flags = __GFP_RETRY_MAYFAIL;
 
 	ret = vb2_queue_init(src_vq);
 	if (ret)
@@ -616,6 +617,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock = &ctx->dev->dev_mutex;
 	dst_vq->dev = ctx->dev->dev;
+	dst_vq->gfp_flags = __GFP_RETRY_MAYFAIL;
 
 	return vb2_queue_init(dst_vq);
 }

-- 
2.55.0


