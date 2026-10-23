Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742218;
	b=jlZFWoP/yvIvNWT73zd+96mv3tqfN1kgjyn9aV4QHQnRIi4Xyhj7N82abomsGJNZknhL
	 e04Lw8SFjByGkbKAGQe4dCPdpw9jbUgui3UQEeefuh0bV/2oDKhNA83ROVM1VSoF5LoZN
	 wgo0Dg9T5SwAnYkU1iWdVd+GyhG0546vs7vhLd2rj5WWYJcx5nQ+GFdslW7wu56L906a+
	 xDGRWLkwX3hcRenm1/wj1mSVIMLZCTovVjOQEsuzaBv7YOnl+1+V0eMz0ALJPjLKSN6m4
	 Dilw2F1lSGAuuRh5J8FifRC3s2eHmGcpzctXityCQEcS/djXGwaiVJWXuLwbQSwzKjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RX5QqI3n5ogrFRt3m2MadlsumYyF5inLL/iD7U/ArZw=;
	b=AdtS+DIQxWyX6FQY2KFW8e9383boZ8A8adiTxjRFHFlSWkNebrFKLW4QR2T52qeryxrK
	 tvdwmu5p6FtkyWgkdouJxIT2VHE/x3oRziUguWueCJOCSgImIOmSEkxXAw+QRaKpb6iqV
	 PQR9VG+8ql+5IyrX2I8t/qjDFjQdh1iIvyd7LZ53cb8/JWs8drIKaQ5BzjKPo9AhyPdhJ
	 jnkFNqnvl9kxFvCGQsS/nYQ+lok5GIU9ZElQPQZma8s07MyPuymbHk0vDskD1cONOPdYg
	 O2cX4S+TJjpt3YYfIg8voL+LMz2vV6qxQEc+aafG7Q8MoPWHY0P1KAWBk91E8FQ+yxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jGnnObPY;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B74606A326
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 07:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19B74606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jGnnObPY
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e9f6a16aedso3043425ad.2
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 00:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792742217; x=1793347017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RX5QqI3n5ogrFRt3m2MadlsumYyF5inLL/iD7U/ArZw=;
        b=jGnnObPYA2oLEKIe6zozk3DBXy91jTUskWtKKiHbJCBwJYhpmAkV5XvFqcA3Xbi876
         IkzN6UCHc9ZtgCiQH1ZQrApz3B23d2tzTRBn8WVQnqRRjjvlhjumUnLJANsper8pz9CO
         ZhrtvksFHQNNUShXfZqUgd9k9fEYgiblvrGFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742217; x=1793347017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RX5QqI3n5ogrFRt3m2MadlsumYyF5inLL/iD7U/ArZw=;
        b=0q2mbZi/Vbq+ziAOdgIVfwRWOBrwhjYs7s2F9bGjsUj4kfJSWpOCsm2wqGRPnaTU27
         AuWCQIEGp1BtWTVD3E/ry1ZvqD8GM7jVm5YGYC51alukJVV1gyDvwea6hW9Z8zepdl6J
         VklVKRaty6fyf4GSlbBcBuef1l0MhSWjje4vU0e1Hx7NzSNsfpupk59LLcwTUbJTJiYm
         szxZ4cTLvX8AQM5/fi/Dzg+lecyFLt10xuTsQFasFIOqdNLIEgNg4KywVJQ8GFek4sck
         H8bxIRjwvcueRu3lBjSiTMYSvKl/hcBI2TS3bDJqvRWqIaXBuN5IhgDL7h/+KwKfQnVd
         Xi3A==
X-Forwarded-Encrypted: i=1; AKwUvBwA08dD1LhdRV4EOPpCXZoQykS5j/stDRFKtMPxm2JJH1cCqNTWqBHPURLfcxsws2mHHZ+Ah2m3ds3Dcw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJaUf77mUf+N3k3B5TPPtwVYnA54nygLufokNcx8yiQQ7/DGE8A
	tkX4NDbYOf0ehpDFakPnXxpS3X4uMXpCaZjJsoXME3aALlnoy79V25ZgH8k5dJsKRiYzC0dDxxM
	diIM=
X-Gm-Gg: AYBFou2LkBUSQ9dYwoDvdbkvx08ecjE9f/ofsTRZcs12ZgPaOd/6qEruP3OOOW70XuJ
	uGYS4Tl/spHpee4EXvl8T6meLHzGU+6gPDDCegNU3CVd8+HcPAq97fzyI7g1RdTJuLC3ze7ohR2
	8i718RcmUWQWSkXICttpiPkaMMbdoCnUBfSek5lY43zqU6LbmAm0GQEVtid8eVyI06TCxXPULq0
	gpn9TiUA/vRXkKg3I3TYsvjItT5GOy/seGMtn8l7kWOZaMDj0uajJIGmFxd0fvEgI74/6WQTEfr
	2jw1YoRFjNAyfkKYj1uUJCsLWyP62F5QzlbCPqCqbzhEMMsFFpbl09HAYD9rRcvyZ5ktwSmYtVs
	XMPGuXk49H2nKdjeoNKY+MyKTVgqf80od++CjF7U9YZd4FeXyyLwD+VUZLMxv5+XWyzGJOzjJj8
	pNRqOoapMmNK9J217cVX/eFw4ZDCt05VO1SoGOooEPq7YlV4aoNUjUVX4Ow5RlGGTyn/f4yrauM
	XaM+U44HQB0s03oNO29wBwn26Kh1ufrhsDjeJQx2xRtmIV1hZifHhNFSxDZfq9PxGQHYbK05iT5
	+Tb02cc0dLCyYyWfr0u6XjM4ACpQ9R98/GvuSXENtI7B9bgsHApI52c8u2V/
X-Received: by 2002:a17:90b:3143:b0:3ac:a7ee:6772 with SMTP id 98e67ed59e1d1-3adce135020mr1195926a91.63.1792742217327;
        Fri, 23 Oct 2026 00:56:57 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:2210:4aae:b72d:9083])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca08e785sm2483537a91.0.2026.10.23.00.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:56:57 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] media: mediatek: vcodec: Return source buffer on NULL va in stateful decoder
Date: Fri, 23 Oct 2026 15:55:19 +0800
Message-ID: <20261023075642.3671805-2-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
In-Reply-To: <20261023075642.3671805-1-fshao@chromium.org>
References: <20261023075642.3671805-1-fshao@chromium.org>
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

mtk_vdec_worker() peeks the source buffer with v4l2_m2m_next_src_buf().
If vb2_plane_vaddr() returns NULL because the buffer has no kernel
mapping, the worker finishes the m2m job with the buffer still at the
head of the ready list. v4l2_m2m_job_finish() then schedules the same
job again, which fails the same way, so the decoder never makes
progress.

Remove the buffer from the ready list so that the job is not scheduled
again, and return it with VB2_BUF_STATE_ERROR so that userspace gets it
back. Print the error before that, as the buffer must not be touched
once it is returned.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Signed-off-by: Fei Shao <fshao@chromium.org>

---

(no changes since v1)

 .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index aa9bdee7a96c..a4cbb7c76998 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -348,9 +348,11 @@ static void mtk_vdec_worker(struct work_struct *work)
 	buf.dma_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
 	buf.size = (size_t)src_buf->vb2_buf.planes[0].bytesused;
 	if (!buf.va) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		mtk_v4l2_vdec_err(ctx, "[%d] id=%d src_addr is NULL!!", ctx->id,
 				  src_buf->vb2_buf.index);
+		v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		return;
 	}
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
-- 
2.56.0.257.gf7497c7d27-goog

