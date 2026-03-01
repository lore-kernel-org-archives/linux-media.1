Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7965F2BEC2C;
	Sun,  1 Mar 2026 01:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328658; cv=none; b=XEzXwTZVJs3dltHHSGmE+9cO17yObXv2o71iJWVUm8cB3BX+Gncm6QfcSCojlJBOhcoq6y/VtAger9VFik6gKR/eHb8EoLg2MbfnUookdKK6szuODrTv6cZgnasO3DO8TVlhs5iPHNjz6oVZTAbkWscnKCfiIf2nnNO2fWaXYUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328658; c=relaxed/simple;
	bh=BxNeqP8cU8tj8jwijO1wKYNCYi0T3XxDYn9+O1aDONE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bB6XjVhaC7z87f4XCn1k6vZYky5lhn1sgj/ZI0ROjEZYw+aVEa0KqbxJ1eKU5cQ9MHAs8Lk/Gpc80s0yrZTVftd+rkNHl4nQgNfyD4FF0hArZjY225tv4qepJG0reiRfyNiDO4Ew/SHgIIWuvKZg9T9SYeklt1BWlrqzC+wXfHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q6mK4hM+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q6mK4hM+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48724C19421;
	Sun,  1 Mar 2026 01:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328658;
	bh=BxNeqP8cU8tj8jwijO1wKYNCYi0T3XxDYn9+O1aDONE=;
	h=From:To:Cc:Subject:Date:From;
	b=q6mK4hM+RA3jlvp5Yn0DDQ9bcIRbujisDTxJhjUGYttoNMqkEdrTQ8QYlby6/AUrN
	 Zo0QrReqcJ3yDi6/voqTXwdfynILbI4qn+yIAZo/cIqsdmYFK+Te3nG0nMM4ifzdgq
	 to2Mg80Roi5s+9hfUn/tSCzPAeLqzXU2Qn7F6GJFWD9KWMxEDpTlDw7OI42HX+HeLl
	 9VwVnkdVCJUkID71Cxk9mDS8/2ywLpyybc1Bh79MG7J7miWsUdgfq6oZGR9OkfmoKJ
	 iqMPq2edwm9bf6YnlcW7GBGRLQvPok2/3XpFaeN8ppmEPdEBhIokHHkGbVENSJI9HQ
	 TVvLeil8xcMrA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	irui.wang@mediatek.com
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: FAILED: Patch "media: mediatek: encoder: Fix uninitialized scalar variable issue" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:30:55 -0500
Message-ID: <20260301013056.1689285-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 88e935de7cf8795d7a6a51385db87ecb361a7050 Mon Sep 17 00:00:00 2001
From: Irui Wang <irui.wang@mediatek.com>
Date: Sun, 7 Sep 2025 17:35:56 +0800
Subject: [PATCH] media: mediatek: encoder: Fix uninitialized scalar variable
 issue

UNINIT checker finds some instances of variables that are used
without being initialized, for example using the uninitialized
value enc_result.is_key_frm can result in unpredictable behavior,
so initialize these variables after declaring.

Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Irui Wang <irui.wang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index 6faf3f659e751..b3a0a1d8b7a8e 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -850,7 +850,7 @@ static void vb2ops_venc_buf_queue(struct vb2_buffer *vb)
 static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct mtk_vcodec_enc_ctx *ctx = vb2_get_drv_priv(q);
-	struct venc_enc_param param;
+	struct venc_enc_param param = { };
 	int ret;
 	int i;
 
@@ -1004,7 +1004,7 @@ static int mtk_venc_encode_header(void *priv)
 	int ret;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct mtk_vcodec_mem bs_buf;
-	struct venc_done_result enc_result;
+	struct venc_done_result enc_result = { };
 
 	dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
 	if (!dst_buf) {
@@ -1125,7 +1125,7 @@ static void mtk_venc_worker(struct work_struct *work)
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct venc_frm_buf frm_buf;
 	struct mtk_vcodec_mem bs_buf;
-	struct venc_done_result enc_result;
+	struct venc_done_result enc_result = { };
 	int ret, i;
 
 	/* check dst_buf, dst_buf may be removed in device_run
-- 
2.51.0




