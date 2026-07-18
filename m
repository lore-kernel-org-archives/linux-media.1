Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724D72459E5
	for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 11:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784373905; cv=none; b=eAgcgscq1dOlAbiG36gqID5PIdiAuc4TjBJEquoJidX8OKEj69H3rk3Kc2/+QOVtS2qOUuFZzo7rQ+a5J2qjPQA1HprfqYeK1aibeookOFzmtmR9q4Du7X07vER4dS79fG3NsOX/+L48MzAyTCk7e2XFPAjOIbEq7fLHO6KxJBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784373905; c=relaxed/simple;
	bh=Slr0+wXjugalMMZtf4ccjUTtKqoNlEvA8xrFZXUL+U0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FTdV1WOUwCEvMyboKl9GRjI3agy2yyFfljhvQmvxjRVEU5RnLc5RD+ZwoTHvgA7mQ9BALlDqSu4zaNwEK5pQXgQ1f2V6hPeUoVKMbnTHsFDOVrP8fJyOEvvPmHhpHoOeqUi83radIwwQt2jiW9W0AEA8gzi2iP6AzSob9/+Vr9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBqVwXf/; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBqVwXf/"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8487214ad2bso7410631b3a.1
        for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 04:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784373903; x=1784978703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KS2pWiQ23rjin5V97dhap/FGn+0uPlh0nCgHK2nY5mo=;
        b=TBqVwXf/PA9j/PzvX2h4xKTNq0DzNHziE72Rsgbfw+NCwPk8e1PPQih7zDSydvCnSk
         FYoVg0qTHndRlxWSZ8FHTfU4zP0hdaZk85l/lhw00U2oZP+ezFgN3ZPnwFWJbRgzji3+
         GZDblOsWTW4JjeQ9e0I90wf5Y+0J0NQzKwxRHjz6sggpJcf0YB85YLKTQf/yKDhTXj0g
         XmAsCOXcqJc79US+43ype/4zpg4WawNPlizvUU0ZXYfR1BeEyTN86EZQnLyyn6zfMHHE
         WhASeToBAnOvLL55RM5sQgTPDtPOKF0J7ZtR/SNFGLBDThEYTIyOjKylDVpb5CfoTmUk
         cSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784373903; x=1784978703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KS2pWiQ23rjin5V97dhap/FGn+0uPlh0nCgHK2nY5mo=;
        b=GrWdLT0FMV2OYqnZQ2NshV+ZO9JNyvOj7ypIGPP5r+wEreqS8P8BD0ZQEY1aIJd7Oz
         3QPf2KtXJTWbuF7sNTFELLNNNxeP8Y8NeT8Bdx1KBNFOKNdIQLpxivxNE+89/ePIldpo
         6oranv1hSsSINIiMeOgf3Xf+JkmLNiRCpBe6euLWyz2WAJ1j5GizNvZL1XsXH/dDnzI6
         FrBp9lMlZa/0kFUaAINH7LomYMcRJdAiKAZakJwz/q2QNbQYvUA/RM1B7sdtYuzTXvBs
         mbSjS7by2g7kOHQiZ7D8z2CdyrHWQr3YpbgMudlcmtd2/R8tTtxNnIwT3XhgStWgRuJF
         agCw==
X-Forwarded-Encrypted: i=1; AHgh+Rqj6kx0kQK8ymwSfQFr4wtU7V/jelEsLSXFOcx6g3hUCJml3JUkGPyUPaselOA15gVARWmXOsd+4rwfvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcdRxKtWf9tJpqveDOW4hsk5tW+QFV+srQJPp2GCaEfSHUXOKl
	3HKCGLd7V02Udnkc44eYuqow07P74hRN6Pqa3dqaH713/vJcPUTyjmid
X-Gm-Gg: AfdE7clifJrzIg5RE8KfatQ/wF+QhjdrxTVzH5aG1Ph/Xrr+hbsds03mK5X0n8zolrI
	szyiNr7N3eqrzyOCVKLl8ZZHGMhvNxp/7WBgyMjW1zANtA/B37ZcHV8Hqag68StzcgnDfmznpqP
	8iJ3SXkWsJXkpzSi8XORf8T/KvSkOcVGIypl2iT6AjsA3wKdcLuuiZTG9ST4NyIqrFqXq0P1lf7
	57p8JeOU7nfOjVyrgv4AoDHlKWx9SsBljee4OqOWRFaN4KAaxKyxpa0QgLqd/R4560EjG/sg1YW
	62gPcSpaZnyhGrCiH51+W/C6MAU6AgAqn0IY8PmvQ15IPjW2pqNj0qchk8Hb5tPbhpRQ5HBOEi0
	3G4cNXQeTQsSSw8uImvyLWMApkvsR3qlE8DYuBIO2E7NWWvx1QjD0EBPmnSbOxA16Xh6m
X-Received: by 2002:a05:6a00:1385:b0:848:80ec:5d2 with SMTP id d2e1a72fcca58-84c294fc343mr6613679b3a.51.1784373902792;
        Sat, 18 Jul 2026 04:25:02 -0700 (PDT)
Received: from lgs.. ([101.36.109.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af30bd6sm2639355b3a.39.2026.07.18.04.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 04:25:02 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Fan Wu <fanwu01@zju.edu.cn>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH v2] media: mtk-jpeg: drain hardware completion before freeing context
Date: Sat, 18 Jul 2026 19:24:48 +0800
Message-ID: <20260718112448.3289122-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The change referenced by the Fixes tag cancels ctx->jpeg_work before
freeing the JPEG context.

That prevents the worker itself from accessing the context after it has
been freed. However, the multi-core workers return after programming a
hardware instance. The IRQ handler or the per-hardware timeout work can
then continue to access the context through hw_param.curr_ctx after the
worker has completed.

If userspace closes the file while a hardware job is still pending,
cancel_work_sync() can return and mtk_jpeg_release() can free the
context before the IRQ or timeout path has finished using it.

Track the number of in-flight hardware jobs for each context and wait
for them to complete in mtk_jpeg_release().

Use a per-hardware active flag to ensure that only the IRQ handler or
the timeout work completes each job. Clear hw_param.curr_ctx and drop
the in-flight count only after the completion path has finished all
accesses to the context.

Fixes: 34c519feef3e ("media: mtk-jpeg: fix use-after-free in release path due to uncancelled work")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Replace the undefined mtk_jpeg_release_hw() call with per-context
    in-flight hardware job tracking.
  - Ensure that only the IRQ or timeout path completes each hardware job.
  - Clear hw_param.curr_ctx after the completion path stops using the
    context.
  - Keep hardware instances busy until the timeout path has finished
    accessing their saved context and buffers.

 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 12 ++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    | 14 +++++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 25 +++++++++++++------
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 25 +++++++++++++------
 4 files changed, 61 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index d147ec483081..d41c0e0516b9 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1161,6 +1161,8 @@ static int mtk_jpeg_open(struct file *file)
 	}
 
 	INIT_WORK(&ctx->jpeg_work, jpeg->variant->jpeg_worker);
+	atomic_set(&ctx->hw_jobs, 0);
+	init_waitqueue_head(&ctx->hw_jobs_wq);
 	INIT_LIST_HEAD(&ctx->dst_done_queue);
 	spin_lock_init(&ctx->done_queue_lock);
 	v4l2_fh_init(&ctx->fh, vfd);
@@ -1202,8 +1204,12 @@ static int mtk_jpeg_release(struct file *file)
 	struct mtk_jpeg_dev *jpeg = video_drvdata(file);
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 
-	if (jpeg->variant->jpeg_worker)
+	if (jpeg->variant->jpeg_worker) {
 		cancel_work_sync(&ctx->jpeg_work);
+		wait_event(ctx->hw_jobs_wq,
+			   atomic_read(&ctx->hw_jobs) == 0);
+	}
+
 	mutex_lock(&jpeg->lock);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
@@ -1640,6 +1646,8 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 
+	atomic_inc(&ctx->hw_jobs);
+	atomic_set_release(&comp_jpeg[hw_id]->hw_param.job_active, 1);
 	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
 			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
 
@@ -1759,6 +1767,8 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 		goto setdst_end;
 	}
 
+	atomic_inc(&ctx->hw_jobs);
+	atomic_set_release(&comp_jpeg[hw_id]->hw_param.job_active, 1);
 	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
 			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 02ed0ed5b736..be8ada60782a 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -103,6 +103,7 @@ struct mtk_jpeg_hw_param {
 	struct vb2_v4l2_buffer *src_buffer;
 	struct vb2_v4l2_buffer *dst_buffer;
 	struct mtk_jpeg_ctx *curr_ctx;
+	atomic_t job_active;
 };
 
 enum mtk_jpegenc_hw_id {
@@ -282,6 +283,8 @@ struct mtk_jpeg_q_data {
  * @restart_interval:		jpeg encoder restart interval
  * @ctrl_hdl:			controls handler
  * @jpeg_work:			jpeg encoder workqueue
+ * @hw_jobs:			number of hardware jobs still referencing this context
+ * @hw_jobs_wq:			wait queue for hardware job completion
  * @total_frame_num:		encoded frame number
  * @dst_done_queue:		encoded frame buffer queue
  * @done_queue_lock:		encoded frame operation spinlock
@@ -299,6 +302,8 @@ struct mtk_jpeg_ctx {
 	struct v4l2_ctrl_handler ctrl_hdl;
 
 	struct work_struct jpeg_work;
+	atomic_t hw_jobs;
+	wait_queue_head_t hw_jobs_wq;
 	u32 total_frame_num;
 	struct list_head dst_done_queue;
 	/* spinlock protecting the encode done buffer */
@@ -306,4 +311,13 @@ struct mtk_jpeg_ctx {
 	u32 last_done_frame_num;
 };
 
+static inline void
+mtk_jpeg_hw_job_done(struct mtk_jpeg_hw_param *hw_param,
+		     struct mtk_jpeg_ctx *ctx)
+{
+	WRITE_ONCE(hw_param->curr_ctx, NULL);
+	if (atomic_dec_and_test(&ctx->hw_jobs))
+		wake_up(&ctx->hw_jobs_wq);
+}
+
 #endif /* _MTK_JPEG_CORE_H */
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 32372781daf5..c2d40653891a 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -527,7 +527,12 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
 			     job_timeout_work.work);
 	struct mtk_jpeg_dev *master_jpeg = cjpeg->master_dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct mtk_jpeg_ctx *ctx;
+
+	if (atomic_cmpxchg(&cjpeg->hw_param.job_active, 1, 0) != 1)
+		return;
 
+	ctx = cjpeg->hw_param.curr_ctx;
 	src_buf = cjpeg->hw_param.src_buffer;
 	dst_buf = cjpeg->hw_param.dst_buffer;
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
@@ -535,11 +540,13 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
 	mtk_jpeg_dec_reset(cjpeg->reg_base);
 	clk_disable_unprepare(cjpeg->jdec_clk.clks->clk);
 	pm_runtime_put(cjpeg->dev);
+	v4l2_m2m_buf_done(src_buf, buf_state);
+	mtk_jpegdec_put_buf(cjpeg);
+	mtk_jpeg_hw_job_done(&cjpeg->hw_param, ctx);
+
 	cjpeg->hw_state = MTK_JPEG_HW_IDLE;
 	atomic_inc(&master_jpeg->hw_rdy);
 	wake_up(&master_jpeg->hw_wq);
-	v4l2_m2m_buf_done(src_buf, buf_state);
-	mtk_jpegdec_put_buf(cjpeg);
 }
 
 static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
@@ -555,12 +562,10 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	struct mtk_jpegdec_comp_dev *jpeg = priv;
 	struct mtk_jpeg_dev *master_jpeg = jpeg->master_dev;
 
-	cancel_delayed_work(&jpeg->job_timeout_work);
+	if (atomic_cmpxchg(&jpeg->hw_param.job_active, 1, 0) != 1)
+		return IRQ_HANDLED;
 
-	ctx = jpeg->hw_param.curr_ctx;
-	src_buf = jpeg->hw_param.src_buffer;
-	dst_buf = jpeg->hw_param.dst_buffer;
-	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
+	cancel_delayed_work(&jpeg->job_timeout_work);
 
 	irq_status = mtk_jpeg_dec_get_int_status(jpeg->reg_base);
 	dec_irq_ret = mtk_jpeg_dec_enum_result(irq_status);
@@ -570,6 +575,11 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	if (dec_irq_ret != MTK_JPEG_DEC_RESULT_EOF_DONE)
 		dev_warn(jpeg->dev, "Jpg Dec occurs unknown Err.");
 
+	ctx = jpeg->hw_param.curr_ctx;
+	src_buf = jpeg->hw_param.src_buffer;
+	dst_buf = jpeg->hw_param.dst_buffer;
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
+
 	jpeg_src_buf =
 		container_of(src_buf, struct mtk_jpeg_src_buf, b);
 
@@ -582,6 +592,7 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	mtk_jpegdec_put_buf(jpeg);
 	pm_runtime_put(ctx->jpeg->dev);
 	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
+	mtk_jpeg_hw_job_done(&jpeg->hw_param, ctx);
 
 	jpeg->hw_state = MTK_JPEG_HW_IDLE;
 	wake_up(&master_jpeg->hw_wq);
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index b312a15d707b..b08f94845613 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -257,7 +257,12 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
 	struct mtk_jpeg_dev *master_jpeg = cjpeg->master_dev;
 	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct mtk_jpeg_ctx *ctx;
+
+	if (atomic_cmpxchg(&cjpeg->hw_param.job_active, 1, 0) != 1)
+		return;
 
+	ctx = cjpeg->hw_param.curr_ctx;
 	src_buf = cjpeg->hw_param.src_buffer;
 	dst_buf = cjpeg->hw_param.dst_buffer;
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
@@ -265,11 +270,13 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
 	mtk_jpeg_enc_reset(cjpeg->reg_base);
 	clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
 	pm_runtime_put(cjpeg->dev);
+	v4l2_m2m_buf_done(src_buf, buf_state);
+	mtk_jpegenc_put_buf(cjpeg);
+	mtk_jpeg_hw_job_done(&cjpeg->hw_param, ctx);
+
 	cjpeg->hw_state = MTK_JPEG_HW_IDLE;
 	atomic_inc(&master_jpeg->hw_rdy);
 	wake_up(&master_jpeg->hw_wq);
-	v4l2_m2m_buf_done(src_buf, buf_state);
-	mtk_jpegenc_put_buf(cjpeg);
 }
 
 static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
@@ -283,12 +290,10 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	struct mtk_jpegenc_comp_dev *jpeg = priv;
 	struct mtk_jpeg_dev *master_jpeg = jpeg->master_dev;
 
-	cancel_delayed_work(&jpeg->job_timeout_work);
+	if (atomic_cmpxchg(&jpeg->hw_param.job_active, 1, 0) != 1)
+		return IRQ_HANDLED;
 
-	ctx = jpeg->hw_param.curr_ctx;
-	src_buf = jpeg->hw_param.src_buffer;
-	dst_buf = jpeg->hw_param.dst_buffer;
-	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
+	cancel_delayed_work(&jpeg->job_timeout_work);
 
 	irq_status = readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
 		JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
@@ -297,6 +302,11 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	if (!(irq_status & JPEG_ENC_INT_STATUS_DONE))
 		dev_warn(jpeg->dev, "Jpg Enc occurs unknown Err.");
 
+	ctx = jpeg->hw_param.curr_ctx;
+	src_buf = jpeg->hw_param.src_buffer;
+	dst_buf = jpeg->hw_param.dst_buffer;
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
+
 	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base,
 						 ctx->jpeg->variant->support_34bit);
 	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
@@ -305,6 +315,7 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	mtk_jpegenc_put_buf(jpeg);
 	pm_runtime_put(ctx->jpeg->dev);
 	clk_disable_unprepare(jpeg->venc_clk.clks->clk);
+	mtk_jpeg_hw_job_done(&jpeg->hw_param, ctx);
 
 	jpeg->hw_state = MTK_JPEG_HW_IDLE;
 	wake_up(&master_jpeg->hw_wq);
-- 
2.43.0

