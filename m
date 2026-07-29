Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A753B71BB
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 06:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785305253; cv=none; b=srSnYrECL6p0xVG3cQdyQPBEll3d3bYmKUU44poJtWOKzRGJK1iHbY9uJtIs63Triabr7K8e5Iy4eIMP/c9BANcVj885iE/eQXoG7CZS9BCG5gaRsihw96HmWSsuzoZ2CbZd3Rp76imP2rSXKlIdtryyDz6JxVwnlYV2GmJDyGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785305253; c=relaxed/simple;
	bh=BPHiLpsWld1Ew5XUZl5sR5LEspPsATRgJZe6tzn6vfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hAjG4q528cHXE65dBpWhMeU9pn8X8sjjQ0EZd7ATvjbh3vch7mGo74peU7aesNjZlz+QCp7GWsVBZ2ryzUGmkmB4tKKfJFENPlfZxEOSAo6lrPAbKXI23YrFNSqAf2cbMFNgJvxe2KCUzgT5t+TaXDSV8VNQsBXBxHdQyR9zgF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D358vBhU; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D358vBhU"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84861fc51f5so287852b3a.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 23:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785305252; x=1785910052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hu86WNjJ+kA/XeSuM7zN7dq8Faj07B8lKH5Il6BqR+4=;
        b=D358vBhUFIM+9QiLHc8VLy6bNQy2CokbiEPbYM2zGsqlBcIeD/JzaMu/MDmdrlS2E+
         WGR7L0IM0r5ORf+iwW21oemHM5p+HBLptTkDYisebxlq75D8vprqTG85qcbWOgpq3ABg
         PkxRDmW9MKJAhGgvuV2tjvj7pj/YBCjlQvJrS/+TuumaVgpJxWo9rVmD+gSYbJGVYMVF
         fxPqC90Ei8ViC0VMrY9j304+Q8w1wivqwutUCWYbxQMd7sx1VrLrw/NChM7TvdI3MyB3
         pSl+JTiHm6mzgQCN9jzxcf4G/efH9TgfmyCyJfzDE6uanPfJ9SR9tiKSqamARWOPYmHF
         e/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785305252; x=1785910052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hu86WNjJ+kA/XeSuM7zN7dq8Faj07B8lKH5Il6BqR+4=;
        b=m5Y9xa2W1StZShUh7OCc2vqp+YZF4KrfSgGoxfbWGPyBB6eP7ZfnfAe3Kij+uPZRMs
         12fj+GhgIj4rX3chGqvtlvQxpSvgILZrM0hBHjlxjTdIoCd60FfMt4zmNjzwO+ksRdT+
         2FTrHmGByz7MGFh4JCsIAqBCt2u165yw6EYJ3i55EI8gWWJKfMPbakaImwtTSK9E8QaE
         H1s27Z1DB/bZFRGe+nEwuG1ybDwuTKeRhkkIRfGhh5jd1dyfFPIunHxpajIFBMthSlpI
         IugX3l78uTvy3h/8a5F6g7RzFfPywWzwEV7TavLG98rle7ySFgh4jrA0HSw1ijNRdXk4
         XPkw==
X-Forwarded-Encrypted: i=1; AHgh+RpBzlkwoG481vEzNXbRjNjbPAIC4plQteCOFbUUxTXvIdIn3jcUV9GR+ziQ9MH8TYa6KvzM/j6umPhXVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKmUomZBWHlvv1V/7vyjJWMpTWzRb/qvhP0AS7ARTlP12cgYUr
	X9VlyktgboWlEYViM/4qlxXm6gwyNmLzm46tNfu2gabunnq1IGfIPxNo
X-Gm-Gg: AR+sD11iiVaP8O/mIm1gR78cJGBDYIBYKVcV3PKlkLfzO8EWsia8Ytf2dqi4Esfas9K
	EImK7tM3CJkNLIVZdO/aTXEpwy+NTX4r/dwDh+K1de9PWy7IWmEAU2ZdtOzEYYqiIGDZlAcyPlx
	rSDFAJDBcZoWFyPo1StL153ZxH8KCJcUWt2iOppVMIAIkqEVC00BD2Tndi62cSEOovrwCrrM3Es
	hCXQyBhpjKKFsivBYKZDzLjgF7VbqbQVy/oXzkXDEVZVCg5D14KSliLgggC4BWqVJ8JBNkdHVSL
	fKu0o8FFGAqHcc1XE0hlqQS2TDba+32mAMOk6hTjjW3OKqrQt0XPBzOPQ655iA/Us6d6Z0BDCxV
	SGIzVXIthHy63EeSD5IO0s1gaNK9kkjHczFNMuc5QIRQLOKrISkoJ57pqx248ScB9H+gihvcqos
	Qj/Wa4or2KR+8Be1CGpCKlToO78fsZVRNqQBfVot+P3z1BKSqWHjw5gWAcBiD20vOGsD1h/r8YI
	TMScPruyYPhy2QVOGZsOvh90fZ4cLzkCcajeNu2nDkKDJq0AZ8=
X-Received: by 2002:a05:6a00:b91:b0:82f:38df:681c with SMTP id d2e1a72fcca58-84e931ec99amr5885268b3a.6.1785305251710;
        Tue, 28 Jul 2026 23:07:31 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([2405:9800:b670:b64b:1c6e:95da:41c0:e7b6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02f8473sm805504b3a.31.2026.07.28.23.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:07:31 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Frank.li@oss.nxp.com,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v5 1/2] media: hantro: release runtime resources when device_run fails
Date: Wed, 29 Jul 2026 06:04:39 +0000
Message-ID: <20260729060440.2092-2-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729060440.2092-1-tharitt97@gmail.com>
References: <20260729060440.2092-1-tharitt97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

device_run() acquires a runtime PM reference and enables the VPU clocks
before invoking the codec-specific run callback.

If clk_bulk_enable() fails, the runtime PM reference is left held. If
the codec-specific run callback fails, both the enabled clocks and the
runtime PM reference are left held.

Make the clocks part of the device's runtime PM state by enabling them
from the runtime-resume callback and disabling them from the
runtime-suspend callback.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 .../media/platform/verisilicon/hantro_drv.c   | 66 +++++++++++--------
 1 file changed, 39 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..d6fcd4f7f9da 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -59,8 +59,7 @@ static const struct v4l2_event hantro_eos_event = {
 	.type = V4L2_EVENT_EOS
 };
 
-static void hantro_job_finish_no_pm(struct hantro_dev *vpu,
-				    struct hantro_ctx *ctx,
+static void hantro_job_finish_no_pm(struct hantro_ctx *ctx,
 				    enum vb2_buffer_state result)
 {
 	struct vb2_v4l2_buffer *src, *dst;
@@ -86,15 +85,13 @@ static void hantro_job_finish_no_pm(struct hantro_dev *vpu,
 					 result);
 }
 
-static void hantro_job_finish(struct hantro_dev *vpu,
-			      struct hantro_ctx *ctx,
+static void hantro_job_finish(struct hantro_ctx *ctx,
 			      enum vb2_buffer_state result)
 {
-	pm_runtime_put_autosuspend(vpu->dev);
-
-	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
+	struct hantro_dev *vpu = ctx->dev;
 
-	hantro_job_finish_no_pm(vpu, ctx, result);
+	pm_runtime_put_autosuspend(vpu->dev);
+	hantro_job_finish_no_pm(ctx, result);
 }
 
 void hantro_irq_done(struct hantro_dev *vpu,
@@ -111,7 +108,7 @@ void hantro_irq_done(struct hantro_dev *vpu,
 	if (cancel_delayed_work(&vpu->watchdog_work)) {
 		if (result == VB2_BUF_STATE_DONE && ctx->codec_ops->done)
 			ctx->codec_ops->done(ctx);
-		hantro_job_finish(vpu, ctx, result);
+		hantro_job_finish(ctx, result);
 	}
 }
 
@@ -127,7 +124,7 @@ void hantro_watchdog(struct work_struct *work)
 		vpu_err("frame processing timed out!\n");
 		if (ctx->codec_ops->reset)
 			ctx->codec_ops->reset(ctx);
-		hantro_job_finish(vpu, ctx, VB2_BUF_STATE_ERROR);
+		hantro_job_finish(ctx, VB2_BUF_STATE_ERROR);
 	}
 }
 
@@ -170,29 +167,24 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
 static void device_run(void *priv)
 {
 	struct hantro_ctx *ctx = priv;
+	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src, *dst;
 	int ret;
 
 	src = hantro_get_src_buf(ctx);
 	dst = hantro_get_dst_buf(ctx);
 
-	ret = pm_runtime_resume_and_get(ctx->dev->dev);
-	if (ret < 0)
-		goto err_cancel_job;
-
-	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
-	if (ret)
-		goto err_cancel_job;
+	ret = pm_runtime_resume_and_get(vpu->dev);
+	if (ret < 0) {
+		hantro_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
+		return;
+	}
 
 	v4l2_m2m_buf_copy_metadata(src, dst);
 
-	if (ctx->codec_ops->run(ctx))
-		goto err_cancel_job;
-
-	return;
-
-err_cancel_job:
-	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
+	ret = ctx->codec_ops->run(ctx);
+	if (ret)
+		hantro_job_finish(ctx, VB2_BUF_STATE_ERROR);
 }
 
 static const struct v4l2_m2m_ops vpu_m2m_ops = {
@@ -1296,10 +1288,30 @@ static void hantro_remove(struct platform_device *pdev)
 static int hantro_runtime_resume(struct device *dev)
 {
 	struct hantro_dev *vpu = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_bulk_enable(vpu->variant->num_clocks, vpu->clocks);
+	if (ret)
+		return ret;
+
+	if (vpu->variant->runtime_resume) {
+		ret = vpu->variant->runtime_resume(vpu);
+		if (ret)
+			goto err_disable_clocks;
+	}
+
+	return 0;
 
-	if (vpu->variant->runtime_resume)
-		return vpu->variant->runtime_resume(vpu);
+err_disable_clocks:
+	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
+	return ret;
+}
 
+static int hantro_runtime_suspend(struct device *dev)
+{
+	struct hantro_dev *vpu = dev_get_drvdata(dev);
+
+	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
 	return 0;
 }
 #endif
@@ -1307,7 +1319,7 @@ static int hantro_runtime_resume(struct device *dev)
 static const struct dev_pm_ops hantro_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(NULL, hantro_runtime_resume, NULL)
+	SET_RUNTIME_PM_OPS(hantro_runtime_suspend, hantro_runtime_resume, NULL)
 };
 
 static struct platform_driver hantro_driver = {
-- 
2.47.3

