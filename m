Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD58B21A453
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 05:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785214893; cv=none; b=Dzuz6GZaDC+lL+R16m9SSa8VzeGSuqNtKIlOQNejrCFHc44ORpGJgsw5dcaflulashvWl83qqaOs5JKKwhjhAsCI6QZCUmw/XjdwaqwflM4Zs+R8BvSTzb4uI0X6+V/0YiajntrfCKnMtBSmVJvWIIMdk+E1PX6dRHZZOxdB4C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785214893; c=relaxed/simple;
	bh=UszfcBBQcICw94NLNTlnVjjLoit0BS8QpSab6plFqVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XNZvgASaFV6aDnX0ztcLErMnIl2N9yBhJ63o3rF9GnLAo/mNHQbBhb0ZQfxqU0AZGSV55akCUM+ewtCnOMKZuAzSOPoK4YOac2a70fIWIEpxWdDJEDNGQKqL46IRmzucR72hyRfyHLMu9kUi1S0mY1OvwD+YApUhWJ71N143Rbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzsLlwxx; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzsLlwxx"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceb096e675so41706695ad.0
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 22:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785214891; x=1785819691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXLw2qYAX9E/FJ2MopzGW6N4TvWUucHeTTJeGbPG6U4=;
        b=YzsLlwxxdsxGXiCpfoQFrmBZUtIFSshL9+fVBk7K+Vx7vSLlYdQH235HCExjvCF0jD
         1F9OwDpxT5vEwJyd2ByRUp/DApVqWiGAhtHvEZc9FIfwr4ATGmV4zZDo05oAvgTOSQwA
         chRNzBygPWd5OhkJjyqiQUjFcKcX8Qdo9x1rSu+rEfEOg5gmKOuoJfqx9YwI4WRtoqmm
         LzLknb7rZWl3yK9BzoI7fOw3qTb2gw/RJBcHT1iFZInyvfNJhs38n1QM+viSch02VSmM
         OzkBFFhGWZxj4Fi7/3i6Vorut6o+SHW/x/Mvwtd3cVPhAKCeHq1cOMtRJcitaRDYAf7/
         lSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785214891; x=1785819691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXLw2qYAX9E/FJ2MopzGW6N4TvWUucHeTTJeGbPG6U4=;
        b=dgDxocN5m5Eh1zthlHxE10Sv3Akb2iY5O9pvfMqx24ay9BW1rr6bixDcF1xiQQv8FZ
         Goz2ebeshB5qbl5uWIBsHu9PfPpWxTRWjq1JeCV0EUNrP+Mf81LASu6Qg5MHXD86c4CL
         ACtdl36LdXyX5sH7LEjkPUAGuZiQ/2a3XQZ2wVdwc/XCFfejdChzHrrfrEM/QH4SeU2H
         2drTv379tIaUfKq6bpypq1fybIueNgAJ2MytJhllc73/FvezzP6f+mq2HUR0nY9W1ubA
         1rwmbDwaMwPagwT8Ckha6iy2Vf3bV4WySoUxnUVLfCr5Est6KXmhnDQCPPf1Lk4imT+Q
         a2rA==
X-Forwarded-Encrypted: i=1; AHgh+RpN/Jbw7IdJzkBc6iXqE1X3XhTamornEfOVzkHeDKvyAlR+OAyLCEiNEyqxXhELrfXPtBhq3wyQeOeaaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK9ew9f5EeszEW+o5ciqNGMVcOBY73xdRYggDjRWhQW0Fb14Q7
	FQAiaUBu+78+yiDXeEXF6G1gtcl1AC/jLyrSIH6ls09eu7EvYGBlqd5aPKIkJlQU
X-Gm-Gg: AR+sD1129MsGHB6SnlEgyW2gJdNw6diAG9I+556FyWixQQYCZWGIiMZAjBOTlS3rWFz
	06fzRirQOIbFTxKV40nE0UciG7O6stJOQy72hvIwi8fUcNBrHXR4ZVHd2atB80QWVEFQ78ymaFp
	FpLWDzD8QB5Tv8kkmv8IK4gF2rsCZFy4ThB6JxRsny9MO13bTZtklDdAd88FSeMVenG+GSuzo2E
	1P3U8sbKJTzRPQplCnsxwh5CvtWHyJROSVSS68vmbYknFQgigbg7UAJVV4OMyW9DU1QyR3Wu+Xj
	dkjvsVye0kpWCWXWywL1mwPlQEa8h+4LfxIDv+Vr46UxmFgmHfJfSAkDq65uKsDDNSmdgNyBKla
	HyHI/Y76u6t6PoDjR6aSfb3Z1GMrFFV2mdM4/wR05XjFYo7q+FGOHsc4NL6ure9X82ytkdeAm1b
	lwLmnmJ1kVNfWelnPgyRnFqley75ZPPmVwg5QxCWS4c0XQd1IdY3f3+0THe0mVVzYN
X-Received: by 2002:a17:902:fda5:b0:2ca:20b1:3e0a with SMTP id d9443c01a7336-2d015c8fbcemr11383945ad.3.1785214890986;
        Mon, 27 Jul 2026 22:01:30 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([2405:9800:b670:b64b:1c6e:95da:41c0:e7b6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bc57asm44882835ad.45.2026.07.27.22.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 22:01:30 -0700 (PDT)
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
Subject: [PATCH v4] media: hantro: release runtime resources when device_run fails
Date: Tue, 28 Jul 2026 04:59:21 +0000
Message-ID: <20260728045921.4761-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260726024243.730-1-tharitt97@gmail.com>
References: <20260726024243.730-1-tharitt97@gmail.com>
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
Changes in v4:
- Keep CONFIG_PM guard to avoid possible build error, as suggested by Frank Li.

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

