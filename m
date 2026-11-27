Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757828;
	b=mlJbT2NtQ6AkQjCC91F2YfQ7x4PRGWkaR9Mtp0X7SlUCaU8TIldNCnIs4Of8zINRUm9p
	 /rOc+jd0EEXHBO3tZ5UWH8E2sWA8atxsOAupTblIi8/alrGMc+0axzsUlxAa84UFkr7KS
	 dVjn2bZA5S4mP9kYxDYiqZfljqJ4hF9VvhXGYD63u/X1GVFfKy4m5/cKcV/swNRhubEnK
	 JC/FcPzv1O0DJHF6oCLE/oCRorQE9BrO5NDgdKG6joDNdDURI2zmzHFCjBDbUeF1N1mz7
	 gkem/0vzcKA4R3Fmy/j3RYA6JzLY/rHduX7bGhpkPJJ9TV5AtTdgrIso5nGpICVW8NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=HcVK4QLyG35uHjO5ETCyA4fpt6MBDPBpxxzf/iYZMFY=;
	b=RRrcWhqVRgH9PdEdM92YSQJD554P3ngn+Z+joQxAL6W7/+3gfu9XT+i7LIT3/hdVliKP
	 wjLd+Gt+VzG1KBouEyFS25xzfZFVRkPcHmBi5lXlKBrLqFqPPx3Bn+xmchDa4yXO1v+xV
	 Dke/QVI9ztmFYvFXaDceQAfxLi2tYhLmt2mZxkcqg1LW4Ei1g7Fj5L7g6d9qdSezBIBm7
	 7LyzTXrqOjGowxh21tiDPohnG4vZOPV7T9/wI13paTSe0f9+4XhLBTPyGSNUz4jFV/eIH
	 xgd70MfInfe9tnnR3uzMjOLig6uPBk8uDDxwhn333ngPoz9xRe/DwAJod/w8JI/Z9xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cLIaIfRl;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767A6606A31C
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 05:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 767A6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cLIaIfRl
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386ab9ab619so10465958eec.1
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 21:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795757827; x=1796362627; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HcVK4QLyG35uHjO5ETCyA4fpt6MBDPBpxxzf/iYZMFY=;
        b=cLIaIfRl7yCH6R8qhN3YnKBdrqlyoUjPVSQzj5duPbQDhlBQu6+ZNA1RkH0z1xaYo7
         4vCMwBK/vgqvHUWcs+HKB+8EWydlQT69AMWsa63gbZUbnyhXa5vA7wIsoMU6c8e40gcQ
         cq+gQrer5qpxQRQ+aes9ygaKlLycAI34+LGtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757827; x=1796362627;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HcVK4QLyG35uHjO5ETCyA4fpt6MBDPBpxxzf/iYZMFY=;
        b=xwlpV6waygOlUaAgPYM7wzjc+7oWIv8yxSc5zZ9dSTDVL8bxa9YoQ85NV1bBODmDCR
         KBkgEekc59qXaPLsR2wXF17LI3rQRWC/JjiTdeYu3i5c6/3I0BN4YT8zdVALbj/ukEtx
         6xs8tOI+TPKHZZTmpD2tGBDeGBRO5OeKcBX1ONFP3zUDKiGsSObAPAZS7aUNVgRe6Nvy
         auomOKezfeI/xIrioubTNbL/bXrYNLO2oZhZyeSI5HiAJkqfPa5mXPs5MdYSpLwCqf0B
         by8nDDhqwIhOBEbMU8cPIn/RDoh99/dKYa5+vW6Dwoqz5dwXunXoNzaBSCOLPEyQ/ZFj
         pvIg==
X-Forwarded-Encrypted: i=1; AL+hErEDlK1fs9+xqk5SUnS+WAvoSoYl2MWhQTCAyx8RVhAUIAZqP31++7kmeY0GjM2zQQcofkVXl4OEqLyVvQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+/UwRFinZt4ZWgjuEzqlOjsHfEdkIV5W9KdiQhnUpaEVQ9KJ7K
	NR9jzuiY90aFQRUVNdn9D34K18Ttw8YyT2Op2DzwG1Jbg/h5hKadTjp+CxgMFvCNcw==
X-Gm-Gg: AZFdTZd9W/lnIvluUlTCL904AXpf7WsieTPM6kA4pWDSOBaqSOZDas/bF1uTcGpkZWd
	VIUz0+YnItOx3H6iAlQeB10K5c7wi68ZKaMNzl4/edg0o+YncW54ryqQRN4V+6kp3BszECyIvAg
	v13Z1nwfy9883dp5NXV09Kh/JsfAPt6A5+58E0fM0lqKINtAtXBP5muSkQJmegBCh0uhn5ywX1y
	dYOxDY11b7GwR8MUA9+3iQIuXHmd2OqWTRt/cl/ze6a9wqJ0me4StWcvisyM+C2usdOYZuXYYPJ
	fV53XLQizpBCeJUWe6SgCVL5avmMxEH6N5R8kvFFo1BZk1T3tKrnPqqHNREPvwXIQ3BOo2QMgyK
	eSplBcgeZ7qw7gfpos+VpHKd4Bl+kjlyKEpzcNZCM5noqEG/b7iafwy4z1UqJ7ThW7gxxVnNe4k
	Oc3Hwfsi6in2EwOyp9d8G9mSDL2pRRLnhAFIPqYgzJMScK6jNJ+7IFwQR7dlrn6b+1jiuWfvBUR
	B/tpQuDOLCZF7RGJmln/Gix5esPLknb6M3YJmPafpserrLlorwnbkmazAr82g1ng2AlwIjROBHR
	muDK80ljXwcLzKOBwhUp2hkEgyUGcyWVm28r1msT7fzFuRx2AH+8aHwgjhs4Yt0qX4r6Xocsum4
	JBkYy7yLCswiDzleD9j8O5w==
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr26792280eec.14.1795757827391;
        Thu, 26 Nov 2026 21:37:07 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm83106035eec.5.2026.11.26.21.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:37:06 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 13:37:00 +0800
Subject: [PATCH v3] media: mediatek: vcodec: Validate source buffer vaddr
 in buf_prepare
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-vcodec-null-va-v3-1-e24521086062@chromium.org>
X-B4-Tracking: v=1; b=H4sIAPsWCWsC/5WOyw6CMBREf4V07SV9SEFX/odhUcuF1iA1LTQaw
 r/b4sK1y5PMnJmVBPQWAzkXK/EYbbBuSiAOBdFGTQOC7RITTrlkjNcQtetQw7SMI0QFuqOUNnj
 qmZAklZ4ee/vahdf2y2G53VHP2ZITvXcPmI1H9RNTLmhdySMvhaxZQytg0Aej3EWbFLfLo3R+y
 G1jw+z8e/8beV75y9Bu2/YBVy2uy/QAAAA=
X-Change-ID: 20261127-vcodec-null-va-cd0008e9f136
To: Nicolas Dufresne <nicolas@ndufresne.ca>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Fei Shao <fshao@chromium.org>
X-Mailer: b4 0.16.0

If an OUTPUT buffer has no kernel mapping, vb2_plane_vaddr() returns
NULL. Both the stateful and stateless decoder workers only peek the
source buffer and finish the m2m job without returning it, so the buffer
stays at the head of the ready list and the same job is scheduled again.
In the stateless decoder, the media request is also never completed; in
the stateful decoder, vb2ops_vdec_stateful_buf_queue() also passes the
source address to vdec_if_decode() without a NULL check.

Add a vb2_plane_vaddr() NULL check for OUTPUT buffers in the shared
vb2ops_vdec_buf_prepare() instead, then remove the late checks from both
workers. Unmappable buffers are rejected before entering the queue, and
userspace gets immediate feedback.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Fixes: 7b182b8d9c85 ("media: mediatek: vcodec: Refactor get and put capture buffer flow")
Signed-off-by: Fei Shao <fshao@chromium.org>
---
Changes in v3:
- Consolidate into a single patch.
  Validate OUTPUT buffer in shared vb2ops_vdec_buf_prepare() and drop
  the late checks from both workers per suggestion in v2.
- Link to v2: https://lore.kernel.org/all/20261023075642.3671805-1-fshao@chromium.org/

Changes in v2:
- Call media_request_manual_complete() instead of
  mtk_vdec_stateless_cap_to_disp() to avoid dequeuing a capture buffer
  that may be in use by the core workqueue on MediaTek LAT platforms.
- Link to v1: https://lore.kernel.org/all/20261019060825.4163770-1-fshao@chromium.org/
---
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c   | 8 +++++++-
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c    | 6 ------
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c   | 6 ------
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index d76e891f784b..a5c6b56be927 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -811,8 +811,14 @@ int vb2ops_vdec_buf_prepare(struct vb2_buffer *vb)
 					  i, vb2_plane_size(vb, i), q_data->sizeimage[i]);
 			return -EINVAL;
 		}
-		if (!V4L2_TYPE_IS_OUTPUT(vb->type))
+		if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
+			if (!vb2_plane_vaddr(vb, i)) {
+				mtk_v4l2_vdec_err(ctx, "failed to get vaddr for plane %d", i);
+				return -EFAULT;
+			}
+		} else {
 			vb2_set_plane_payload(vb, i, q_data->sizeimage[i]);
+		}
 	}
 
 	return 0;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index aa9bdee7a96c..fbd5791e78c1 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -347,12 +347,6 @@ static void mtk_vdec_worker(struct work_struct *work)
 	buf.va = vb2_plane_vaddr(&src_buf->vb2_buf, 0);
 	buf.dma_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
 	buf.size = (size_t)src_buf->vb2_buf.planes[0].bytesused;
-	if (!buf.va) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-		mtk_v4l2_vdec_err(ctx, "[%d] id=%d src_addr is NULL!!", ctx->id,
-				  src_buf->vb2_buf.index);
-		return;
-	}
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
 			  ctx->id, buf.va, &buf.dma_addr, buf.size, src_buf);
 	dst_buf->vb2_buf.timestamp = src_buf->vb2_buf.timestamp;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index ab1894fba0d9..3d5f9e11a49b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -342,12 +342,6 @@ static void mtk_vdec_worker(struct work_struct *work)
 	bs_src->va = vb2_plane_vaddr(vb2_src, 0);
 	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
 	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
-	if (!bs_src->va) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-		mtk_v4l2_vdec_err(ctx, "[%d] id=%d source buffer is NULL", ctx->id,
-				  vb2_src->index);
-		return;
-	}
 
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
 			  ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);

---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261127-vcodec-null-va-cd0008e9f136

