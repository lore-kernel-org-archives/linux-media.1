Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8A334AB19
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 02:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785033895; cv=none; b=VzdYWiTn8w1CGWvZbT1osFW/JgRyekwA+NVb0+CBW7PAnLcn+Kf6cIXKd/mB+iSNy/a6NBET5oUsZI7J6glRgO8y6ZGDYmKKhgLDDlnlw2J1VuSZYJsqD//uAO4Czw/fKM2TI08agiJluv25uDOqlQ41Mgipsu77g3DG35Dj6NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785033895; c=relaxed/simple;
	bh=mj4QRLy6AlDjgG1gzMlOklv38cpyYdU2OC5vCFwIohc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGQ0Zc3EWOHBRUl41KtQ0S2nd0BTQzAhDHjmtPR6hB2yhKVJeHpwJTQp7pvbQ/lm3EyQk8rK7+X0GS7TEYydTugdsF+bTZ+yyF1SUycY0fb3qc/N4ted09AZnKx/SqPwSQiUKLXHkxSyQnUOwYy2iN0MgPqLtiknQ7B1lIrmCtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKheBMt2; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKheBMt2"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cab973140bso22891345ad.3
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 19:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785033893; x=1785638693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZueuOu0bsjbmfoZW5fI6EGD7PRQKcFNbXmi39LsZknI=;
        b=ZKheBMt2JMLpe07GovGNxk5VeACIaAJmTsSNUiRMXqrW1dbtoS1DPyHVwBx4J4vzNC
         PjS+fdvR1mn9bQDxXwRRwKOlOcLLnrCRC5GsCSu1jVriWC10e1sfaP7o2u0o/1QVxY24
         vpUUdRGdJtrLqgAx5nTwM0+LADxAARCblD65vzlqdgUse8SG3zo293bWukILZhsIvuiR
         TQ++yommkK3GjsYfSkUEzipBZjjz7QlWYzLjODSCovcjIR7JekRZFiVicPvwDC/dfB5l
         sg7n1k2FuNoHJVoL7OwueQ1nSyUEQm7CaSDSGsCQL9kIfo1ug1zCgrcxubx5/oT73103
         5Z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785033893; x=1785638693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZueuOu0bsjbmfoZW5fI6EGD7PRQKcFNbXmi39LsZknI=;
        b=SYvY+0zKV5+K22NaBWwCfTQsbKC+jXIWLaoRrA/3xKU6xjpE1BO1PvxJ+ZGPgU0+Ga
         aOue1gZf0dVUU718rEKPO+F0xo2iXkGTtK2W4I26dh3uYNvxlEyYEzmJHlpOZHq/3jWH
         y84VbnPWxrqGh0/bxZOBKsJZXI1pef3uVFV+nBGCbru6koCJ2P2qBWPyTcWTKrs7n/Zk
         QQ8zstdFddUTtuFqcFHGgnPj+toSR/3gf1LcFPRJKmngLjCk7KGkKi83w1XR1tnP8Sgs
         /kWqW212A6KvULDBi1IeLoSwfdwrIPoujNAJrW9O6hloRf24J6+dL6luo+VNcSWy6ylI
         VAQQ==
X-Forwarded-Encrypted: i=1; AHgh+RoA7EuMMlK9v1Dt2uSdUldqteN531j+PMPZQKV1KENkUPA7/raj3wVDQZC5w6RjitoFut26wyydg2xaQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFDietyIWtreOMgigPaE+uQF4CbI0qIBbz/Keu6ZoVkDJ4yG6r
	58nZFhV//PG0lOgU0bUBsn2EqYqD7R7zjRpH7N/kCjjWaXwxQJWyyhmVkiLB5g==
X-Gm-Gg: AR+sD12Dmbrc32b7hEm2NAt3r7kX8MZd1wHCL+d3QVowcMmdivKdI0jxXwhqWY6UFZE
	HxAeB81myG1/+Yo4w1ZSLcfvwp4Q+2VsXknB8b6S3WXvdrNTSTL9KqxpZwMp3uBJG/WENbqgBlV
	FHWl0rtUTvpcsQePke9yh0AX9SVp4tgdxLEHmJfD281l0Aw5AYUi0sqDd9HBeAomcdFndspkypA
	nq4LFT1T939qZeaFqGoqUAGQEF+drvDruE2p6sav7DfAKiDD3PkZWDHw9rDpkQ7OjDAT0qr9hGK
	06AWndm2x7dJkYyOMD2a+fDU6M5tGF8bvYR5wlxhgcC+vZO9qLggdTK180Rs0hlYppEcl6Qxb5r
	6DtYDLeDdLwyE7itsssXJRanUp1Rnb4euOVReWXnOVaUOY0ADMl4rPAokhBfg0R7crck5C7h/Sh
	54MJNAGnsTAjn3mQ8SbX7ybZ5K8WWaayl93IZQri/uTknU+ckC8++LTfhijGLs1ZpQyNpW3oeW0
	3Q=
X-Received: by 2002:a05:6a20:914e:b0:3c0:e552:f2d with SMTP id adf61e73a8af0-3c67dac0acemr3275871637.34.1785033892904;
        Sat, 25 Jul 2026 19:44:52 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([2405:9800:b670:b64b:14e4:adb4:cabd:de50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc413766sm16313406eec.8.2026.07.25.19.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 19:44:52 -0700 (PDT)
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
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Frank.li@oss.nxp.com,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v3] media: hantro: release runtime resources when device_run fails
Date: Sun, 26 Jul 2026 02:42:43 +0000
Message-ID: <20260726024243.730-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260724131208.2315-1-tharitt97@gmail.com>
References: <20260724131208.2315-1-tharitt97@gmail.com>
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
Changes in v3:
- Move clock enable and disable operations into the runtime PM
  callbacks, as suggested by Frank Li.
- Remove vpu from argument in hantro_job_finish() and 
  hantro_job_finish_no_pm(). It is accessible by ctx.

Changes in v2:
- Fix the codec run failure path to disable the clocks before dropping
  the runtime PM reference.
- Use a local vpu variable in device_run().

Tested on a ROCK 5B (RK3588) using the Hantro G1 decoder and Fluster:

  H.264 (JVT-AVC_V1):          129/135, unchanged
  MPEG-2 (MPEG2_VIDEO-MAIN):    23/43, unchanged
  VP8 (VP8-TEST-VECTORS):       61/61, unchanged

 .../media/platform/verisilicon/hantro_drv.c   | 68 +++++++++++--------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..7978bb72569e 100644
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
@@ -1292,22 +1284,40 @@ static void hantro_remove(struct platform_device *pdev)
 	pm_runtime_disable(vpu->dev);
 }
 
-#ifdef CONFIG_PM
 static int hantro_runtime_resume(struct device *dev)
 {
 	struct hantro_dev *vpu = dev_get_drvdata(dev);
+	int ret;
 
-	if (vpu->variant->runtime_resume)
-		return vpu->variant->runtime_resume(vpu);
+	ret = clk_bulk_enable(vpu->variant->num_clocks, vpu->clocks);
+	if (ret)
+		return ret;
+
+	if (vpu->variant->runtime_resume) {
+		ret = vpu->variant->runtime_resume(vpu);
+		if (ret)
+			goto err_disable_clocks;
+	}
 
 	return 0;
+
+err_disable_clocks:
+	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
+	return ret;
+}
+
+static int hantro_runtime_suspend(struct device *dev)
+{
+	struct hantro_dev *vpu = dev_get_drvdata(dev);
+
+	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
+	return 0;
 }
-#endif
 
 static const struct dev_pm_ops hantro_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(NULL, hantro_runtime_resume, NULL)
+	SET_RUNTIME_PM_OPS(hantro_runtime_suspend, hantro_runtime_resume, NULL)
 };
 
 static struct platform_driver hantro_driver = {
-- 
2.47.3

