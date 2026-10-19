Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B9E48380C
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 06:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792390137; cv=none; b=iqNPDTOZZksOLhPFx+PZq7Q/zYOlDnVfwytL1wYmQPsx8n4rSyD6OYoSAtphRpAzRQTacTDBSYr+cVEnXZnv+kG/pdH0g4FhRC6OoKvwzB79LH8pNvvI7KvlB4sC6NZNxaWOwmJOcud7h/M+nTA4WO4/qNw+wtu0ltM2kRY63gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792390137; c=relaxed/simple;
	bh=oy/jw4j0/c5/N6Jp7Y+inwVqND7vkFYM3hBF40EEzQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JvJPg7QoUOeA5Wtz4T5WTi0D7GE0tgvUjJxE2s1Eoyp1ba/+fPPjtF6iqwYpmNhWtdaf8UL0mRbSOMh8TjUE8wMprcWCy5XpNpnCgeaKD5n1nSWk3DAke43m8RK2plxzVVP3ovpDc3GBItjaaoUMcElg9p7kErRsUBAD5dC2rLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AzWl2B0h; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AzWl2B0h"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15943c9c005so999748c88.1
        for <linux-media@vger.kernel.org>; Sun, 18 Oct 2026 23:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792390135; x=1792994935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KhnH2Fl7Ngxx8M1a91ckV8yYy0vtR+vF5EQHpmiM6YM=;
        b=AzWl2B0hVzVy/uuwKdu63Zpym2+2uDH8KRTnEQhdI5nB/xNaSphr9CqaUM4Zxu7a1r
         Zz7VfAcKD+U/23wLrG42+7xlOTt0vEbI2/Wnzsfwq3R3qeIVU3faRo1NGgdMwYzr3b19
         Xu1+9WiMTjXlKxADONF0j38+mNP8gQgHBObTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390135; x=1792994935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KhnH2Fl7Ngxx8M1a91ckV8yYy0vtR+vF5EQHpmiM6YM=;
        b=J5C4Oa0ZaBANnLkUnaDIrdnY98/TsfzvRiq7duGkNQhybCNa1FriRVjebwCeXn6eMh
         YJUbUGw/3GLqPYiRWHDcN4iJBY1V9UVb+Cplz5YwSKr2pEyRAifV6Ly639Dbz76ROgNS
         raUZLojXDAETAd8IVFcmYNnD95F0h7ynOpq+Y5l1X/7OBzSvOjxUQVHoz0JAsum/Qbqs
         I2ITm6bt62FOunwHDeAszRmcWH5W4KXNGg2JhcXOiwIlcE6Psi4YMz58Q7MnoCwFevoe
         O9NhhKV8usgvYXhRasVrUqmmFdKhLw+BUso39PZSO5JnLXJvSU9JulV5ueXd3Wq2oy+5
         e+sg==
X-Forwarded-Encrypted: i=1; AKwUvBymige5VUb5Q13OfUW2f+mc2Z/qHkEJYu+WYb6c4RMWdtNpPQmruOE7d5z6xsWMc3qTf6aI3JzBF8wa2Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJczVcBbuke5Ic+MAst4p+rHAHtnZhNVX5xEu+DmMt/YumCU/Tg
	BCVMCCRiGENg5InVFUEaiWIehS8F4AkLatqIfWLQ0QEYyjn/TNtx1RRj2RG6si44mg==
X-Gm-Gg: AYBFou1QdvBVI+Zdz4L4VH8LzwkybpBSQCl5H6bHz+SvN8osx/c+PaSrKEYD6YIWIwq
	XzTjMKM3YPjAB/4wUv0XSJ4RLUKKwOgY5+jepvYXCpvjjUw0xiCzr7JOKLSguM/dJhL3t5HOWVL
	NzQabyCISqF2g7LaTJI9xpZBVW0OZsMQvrzhqsOtOBEubs7YKq/H2l5jCSllfk0X/wF8xwi6Yy3
	HMTdEXDfyB9nwpnRXC2jQq63QEBS57Wclf7nYkj/AJvxxqdtwtA3vL6U/cBD3SmxQccfpiy+Atc
	98Kfoq9iDu9U3Zg1WCoJM5zo/PNGEAnjWORME3EyekxwxcELJTH1ldUixyQQrpQL+oWbAfc/DUJ
	aNwZzgbOPX68WLsFJiwDVlHEkrsr2lpkjW8c05bETTY3og41fWsy9zLZwoT5HnvWDsQaC0YZsip
	PRprAv3rHwUlWglwWGoLLJyMvIPMGREbXFysbGchBe8w4r8X7n8s3kaLjQl2dGRszpPaisumjw8
	DH6pnfrdWGn/dMRhrtzGqys8kEjWBvRM+ZYCDSjPuWTwX03ZSwSRlb6iw==
X-Received: by 2002:a05:7022:28a:b0:150:6c0e:2ce2 with SMTP id a92af1059eb24-185139aa4d9mr10544613c88.31.1792390135205;
        Sun, 18 Oct 2026 23:08:55 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:b024:9aa2:76e6:57d4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm23281190c88.8.2026.10.18.23.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:08:54 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] media: mediatek: vcodec: Complete request on NULL va in stateless decoder
Date: Mon, 19 Oct 2026 14:06:20 +0800
Message-ID: <20261019060825.4163770-3-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261019060825.4163770-1-fshao@chromium.org>
References: <20261019060825.4163770-1-fshao@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If vb2_plane_vaddr() returns NULL for the source buffer because it has
no kernel mapping, mtk_vdec_worker() finishes the m2m job without
returning any buffer or completing the media request, so userspace
waiting on the request never gets a result. The source buffer was only
peeked and stays at the head of the ready list, so
v4l2_m2m_job_finish() also schedules the same job again, which fails
the same way.

Handle it like a decode error, which takes three steps:

- Complete the request controls. The request cannot complete while its
  control object is still pending.
- Remove the source buffer from the ready list and return it with an
  error, so that the job is not scheduled again.
- Call mtk_vdec_stateless_cap_to_disp(). It returns the capture buffer
  and drops the driver's reference to the request, which completes the
  request under manual completion.

The media request is now looked up before the address check because
this path needs it, and the error is printed first because the buffer
must not be touched once it is returned.

Fixes: 7b182b8d9c85 ("media: mediatek: vcodec: Refactor get and put capture buffer flow")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index ab1894fba0d9..c97835f50ca1 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -342,23 +342,29 @@ static void mtk_vdec_worker(struct work_struct *work)
 	bs_src->va = vb2_plane_vaddr(vb2_src, 0);
 	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
 	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
-	if (!bs_src->va) {
+
+	mreq = vb2_src->req_obj.req;
+	if (WARN_ON(!mreq)) {
 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
+		return;
+	}
+
+	if (!bs_src->va) {
 		mtk_v4l2_vdec_err(ctx, "[%d] id=%d source buffer is NULL", ctx->id,
 				  vb2_src->index);
+		v4l2_ctrl_request_complete(mreq, &ctx->ctrl_hdl);
+		v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		v4l2_m2m_buf_done(vb2_v4l2_src, VB2_BUF_STATE_ERROR);
+		mtk_vdec_stateless_cap_to_disp(ctx, -EFAULT, mreq);
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		return;
 	}
 
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
 			  ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);
-	/* Apply request controls. */
-	mreq = vb2_src->req_obj.req;
-	if (WARN_ON(!mreq)) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
-		return;
-	}
 
+	/* Apply request controls. */
 	v4l2_ctrl_request_setup(mreq, &ctx->ctrl_hdl);
 
 	/* Keep a reference so that if the processing completes before this function
-- 
2.56.0.176.g3575e65682-goog

