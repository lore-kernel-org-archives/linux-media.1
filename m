Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742221;
	b=EFUgjPtsmAC39c0i7Rf1PDSHgKhJIJhkMjDYi8FPozjkQB40AoiAWmHiCotDKX0vpNof
	 bzD5P+HlDGzVMMlhBCq4ieK+9yNfGxmAI8NBcOCBoRCCPQ/FNxAeZJHq3olBskHBGMGS0
	 SHB5mtZyDPSLP0OneUTT8yMZkt2AQY+kNUVBD0eUWgkHEQe1MVC+caOnAZWIkP1o0FMEe
	 Xt3enpKnWRhcnJ01Oz50Te+/JoOGlUSmo0IsIHQX2djM8ioIHsa24Wc3W21l1W/tvtGhM
	 laMtiqNui6/n7MSov5vA0EXDlJR0JtB5Hk/Y5K9dIYK/5zP+rNEGXdglTR+Sgx+JHiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lcSfZoh2GdSZxoMIwbjzTgmOBV7Hx3Y2JlLufTmLUeY=;
	b=KYNv/6zOG0AZmqE1CFSTV4+4at1U6L7bxStH1CfiJ12SrOEaoUa7Lr/Lgu6h1QMmpvL9
	 inuU+Bf0AMINXZ26ZVv+o0i3rvQnfNq4NXf7r4+3bJo6m316u0jCm12QDpVeAEMBHr09z
	 GwOypTE+u7nJFcE/2h/Vxtzstr2IQfRYYs8Br/LWUMtA0b5ArHGjnntxhmK0/NIc7x7BN
	 afDcHHpI7W3DPuZF1Jm7OXPBlRyRiDvllEBPuZNy1C7p4QMf4bQu8Jj7kCLFusOGTfUwh
	 lEODRPnMTnq7CxwHT8svWTw6Q+7jBBjV7uLorIW8F2INcBbHipflmuYew4tJ5GsFrRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H4mB6t58;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B315F606A321
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 07:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B315F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H4mB6t58
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc751eddf25so307307a12.3
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 00:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792742220; x=1793347020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcSfZoh2GdSZxoMIwbjzTgmOBV7Hx3Y2JlLufTmLUeY=;
        b=H4mB6t58pxgfP+ppNNFRv3pZRW4mTFBNw9XqK66C7GI+AimbnSEdss2FJOj0jcGELq
         XkuuKogcFKzR7GpXPz1gA+Sp93E187AIR4+mJwkBbrHOacSsQ/wxRoPKaCOJcQi2bHNT
         AMIj6PoXZuUKRj8KnjzbztOOvBNz5Kwo9DkC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742220; x=1793347020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lcSfZoh2GdSZxoMIwbjzTgmOBV7Hx3Y2JlLufTmLUeY=;
        b=Eo/suHXG+GafP9HEXEipog6/lMe023driAW2jRGXEb0oXV9G97exQKpiXF8S0LJErp
         3J0K0DzkR1r6KluABNI9gjiNBcQq2qmL67zdg6H1M7dMgBJ48BRJZ3Ui6v5isczA3TcR
         siVkVIijRcfJ5s2jHnBuWA59Ev7uOlTUOVbbJ4ySbSeRyknJiZR2OrgL6NL4oDtJcEut
         K/GBmFhw9RknzU4iJzgRX6UOGY2aAJE8bDQND+E01EbvTQUVZohjyhZKGPloIV4OSNE/
         1sZnt7bmSJ41kTge4mthmv3wlIuHzGZWbr2ATB2qEqYYWgAQDjUS6MI9/YNGvs2lPTDZ
         Hwjg==
X-Forwarded-Encrypted: i=1; AKwUvByOZzT85fm250wb1t4ykw8rvseE6zvEYKgWL3xHNGx86lOsO2V4+HmuWSVOBX5yJuiE65e0z/b/hpkXsw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIBOnmm6RXSkH5eJ0RFjSwF24ddnuz/9H8Y4/+1djvO/DEtvnui
	SG7TJ+zT8nIeAnmP8OoZ7/dSjJYfg31Z1U1hUgQe4zvDYrm01E6w32NWBOTAs7Ni2A==
X-Gm-Gg: AYBFou1/GtRlOpA0tsJ/ZPNQWL697wH4/Rj2B5n6jD6DJ/r3pUAlgH4LQ98mTXQBWDi
	XCi5rZRskqePXc8CRuMMIsdVxFSQ+kgE0B4gQ4G5/vSN1XGV5tP4wzyzUxyITh7FH7C4z72lNwT
	Sv2Sl0MIZw++KRNoa9t+u6yQNev49UjM7WLOKj7VGnyHRfnO4KknVIiaBh1QfuRe7GBhjOBLbVK
	C6RJw67tgTai+EPWn6hzHAO3QEXwhi1xY+n+zfVfWIpCvVHE/Cs5XLWCkAYxARZdV9AAqJ9PfSL
	S2MYXgnv/kTRwIrwxO/9RSIJNN/3WwkX/NAAy2YJcugitm12QrgC5EpjiEEiN1106qMeNdyEois
	6Ue/uCHGcouDYVfbT6Bj/SbEJhJej70gruWV+/ViCoZJe8L4f2R25cULgVibRZ7xyFHwfiD6w2z
	LbeAxynLMHS0SV9re2QZy08JF/8CnOjNyf+a+XLk+/dK/nnHEkLMppWlpvKNJ5yyeGPfV8MXziD
	yu4KXUMlYJqv0tYHHx6Zz5NNA6hEWdizk5YQ9OFkw66ieFwZmr9dbs5uQzxdSefSO7GW4kCVmbR
	jkMyxOe3xlJGXD1x8e8aKAEa9lfmuAl19Bp76VA=
X-Received: by 2002:a17:90b:4a92:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3adce7a6682mr1200815a91.22.1792742220188;
        Fri, 23 Oct 2026 00:57:00 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:2210:4aae:b72d:9083])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca08e785sm2483537a91.0.2026.10.23.00.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:56:59 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] media: mediatek: vcodec: Complete request on NULL va in stateless decoder
Date: Fri, 23 Oct 2026 15:55:20 +0800
Message-ID: <20261023075642.3671805-3-fshao@chromium.org>
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

If vb2_plane_vaddr() returns NULL for the source buffer because it has
no kernel mapping, mtk_vdec_worker() finishes the m2m job without
returning any buffer or completing the media request, so userspace
waiting on the request never gets a result. The source buffer was only
peeked and stays at the head of the ready list, so
v4l2_m2m_job_finish() also schedules the same job again, which fails
the same way.

Remove the source buffer from the ready list and return it with
VB2_BUF_STATE_ERROR, complete the request controls, and manually
complete the media request before finishing the job. Look up the
request before the address check and log the error before returning
the buffer.

Fixes: 7b182b8d9c85 ("media: mediatek: vcodec: Refactor get and put capture buffer flow")
Signed-off-by: Fei Shao <fshao@chromium.org>

---

Changes in v2:
- Call media_request_manual_complete() instead of
  mtk_vdec_stateless_cap_to_disp() to avoid dequeuing a capture buffer
  that may be in use by the core workqueue on MediaTek LAT platforms.

 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index ab1894fba0d9..402d20572f2d 100644
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
+		media_request_manual_complete(mreq);
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
2.56.0.257.gf7497c7d27-goog

