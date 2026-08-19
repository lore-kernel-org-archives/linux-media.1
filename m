Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9EC43784F
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 09:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787131700; cv=none; b=sDAgIievnaw7yw0PjShlpQxeh3fLgtHKiOoFFUNx5v73q6ExGWcigtFXtOdJV+Wu4u1NrcPHZhrD6c0RwC1885JyjVDbmkVWfAW20DrM0QBbq4Y6/H4S8jlvZQqJFtnf5vnuyWbUjKiQeitDpqjdaI33+twjDotFDyz+Set93CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787131700; c=relaxed/simple;
	bh=udiv7e1glRacJK1FJPTs/4tpTfifkvPttdPGoYF4WEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ptp1bq19YKSpogJByljtm8eLxcj+bQq6p5EvgR2oRNC4r1PT2SXEEUgXB8nNZgUC6vtFUpuC0tPkFp3j2xEUaJIXCL9+gCpyAckGxOOfGNKkMh7T0u2EYdHxnCUer5B4ThiPEV63hfDCOQkwswU9C3N+FbfHi4qofvBFW4lbubM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDY/qQBj; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDY/qQBj"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so7037775e9.1
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 02:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787131693; x=1787736493; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjJqO5Tkx7QkqQKX+O7z966c27TyW/hoTQBkhU3dCmM=;
        b=ZDY/qQBjSelLdEDfx/F22MP8SubcfDuCcQs5OUbkNS7GpBpVV2wLDfVBe4Tfbqp/na
         3Uvp9sYwENtUomXl7nmDueFLhqofZtWehTd5J89CfPBPraCpqusqiQDVq6xlKwkrAaFi
         kDxo/oXGBp5gT0q0ZeE7TUAprDcaKZc8OKLWJClje9myvjpqZhvb94xvgzEpdTDnnBEe
         DT11OvdR4uFKlQjeD2WJlGFJCRHZzuiCryriXBxPepQ0+v2bNc1rdd00XOU5YEsvKSJy
         fywikDYXVRviE7UjgRQcVbQzJ+NjBDaBXfm3fs+xb4D5TOdHWxThitlz8XwTsJGsGYgm
         qmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787131693; x=1787736493;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjJqO5Tkx7QkqQKX+O7z966c27TyW/hoTQBkhU3dCmM=;
        b=XCuzRYc+PpgkJUugt0dMkDTycmriBGmsYKrQKZLDLeOUuKoFEAJGf6UtR8nGsBiY6f
         DkIXL74MwLase1Wc7m7YQlykTvi5Fx0S572eVnRkJfBAtPp2wevW45VwrpOiBPFDyE1r
         DpLRkavfj3IFyuVS5RKwTGiLjbYH/ybixHd7mC4E2Ae06hs80JPUHU3xuggY63+CG2D4
         CIr1qqkxvjUXs7tTbs8hTuhZGTS260pJXArIeFJaCF5yfWIPIbWNbvvMDZJboZjQMVhM
         BE3yu/f6Sw9wEDwwBT/Mi2dftuRB0BGs7vFPzd9jHV5WziUtdma47T1c0dgGX0UMjgid
         ipbw==
X-Gm-Message-State: AOJu0Yx08eYufZ0Kwp0ajWVMJY+Av238PW+yWnm/z0wVFgflcNw5hKgt
	8OhxsKbNQJtHT97ojEbey8F1cwiokFQA9jGx8QO3ScXYS4hwX+IAWcC+
X-Gm-Gg: AR+sD11WV8A4FF3z6fvfoznf8C1sKGF4pKyfeATvpJwEdYVLfy488MZz3kjMJkrp8og
	b8/xqag1LYrCPoMvjJOdrNCMRPuTZi7vfz/EklKqshg7ZvLSIgc8rXaAAtYJ7THqbApUYICIDGl
	HahrIv7dgW0LbUU1lbbU02MvE14Cvcd5ASYXpQQdbEKxzwyJumg5WMEb6O0Q+9Z54W4YVpQ1ehq
	ScaC4MjfZqRmwNa3ZK94iBrPy4UoFPq8XWm5W53dYBR+gsszDYM5yQ/qtRk511RtRKZOlzmpGVY
	M0T+dT+T+nbZue6Rw07gMeR6EQdV3GbdHLVW14LMMkOVzR6DMWoVUnuBo5FdgDnG94mW1mbOcO+
	Hflua36TwRNpRoXi5duFj8KH+ACc2W5T6lK9Vhgq6n5KuAEGalE1bGhblqe+miKdbs2QZho4IQz
	kbrTP/+uY3blNEVJkULJRA4GK0ft/rRkqNFSOv7maP1ofWiH8DyUBMUx2l2ugbdnviBktO1RCxg
	qMQAsugGWjc3ShBaC9pGedMvg==
X-Received: by 2002:a05:600c:8b65:b0:499:a5fc:2087 with SMTP id 5b1f17b1804b1-499aa1722f5mr58865455e9.6.1787131693443;
        Wed, 19 Aug 2026 02:28:13 -0700 (PDT)
Received: from michalis-linux (adsl-75.176.58.251.tellas.gr. [176.58.251.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa11fd3asm42234935e9.8.2026.08.19.02.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 02:28:13 -0700 (PDT)
Date: Wed, 19 Aug 2026 12:28:12 +0300
From: Michail Tatas <michail.tatas@gmail.com>
To: nicolas.dufresne@collabora.com, benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: verisilicon: rockchip: Fix leaks in init
Message-ID: <aoV3LLy5hSoKL4QP@michalis-linux>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

if one of the dma_alloc_coherent in the init fucntion fails then
the previously allocated ones leak.

Fix by freeing them in the error path.

Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
---
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 68 +++++++++++++++----
 1 file changed, 55 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index e4e21ad37323..fa77fd402412 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -369,6 +369,7 @@ void rockchip_vpu981_av1_dec_exit(struct hantro_ctx *ctx)
 
 int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
 {
+	int ret = 0;
 	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
 
@@ -377,39 +378,54 @@ int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
 	av1_dec->global_model.cpu = dma_alloc_coherent(vpu->dev, GLOBAL_MODEL_SIZE,
 						       &av1_dec->global_model.dma,
 						       GFP_KERNEL);
-	if (!av1_dec->global_model.cpu)
-		return -ENOMEM;
+	if (!av1_dec->global_model.cpu) {
+		ret = -ENOMEM;
+		goto global_model_cpu_err;
+	}
+
 	av1_dec->global_model.size = GLOBAL_MODEL_SIZE;
 
 	av1_dec->tile_info.cpu = dma_alloc_coherent(vpu->dev, AV1_TILE_INFO_SIZE,
 						    &av1_dec->tile_info.dma,
 						    GFP_KERNEL);
-	if (!av1_dec->tile_info.cpu)
-		return -ENOMEM;
+	if (!av1_dec->tile_info.cpu) {
+		ret = -ENOMEM;
+		goto tile_info_cpu_err;
+	}
+
 	av1_dec->tile_info.size = AV1_TILE_INFO_SIZE;
 
 	av1_dec->film_grain.cpu = dma_alloc_coherent(vpu->dev,
 						     ALIGN(sizeof(struct rockchip_av1_film_grain), 2048),
 						     &av1_dec->film_grain.dma,
 						     GFP_KERNEL);
-	if (!av1_dec->film_grain.cpu)
-		return -ENOMEM;
+	if (!av1_dec->film_grain.cpu) {
+		ret = -ENOMEM;
+		goto film_grain_cpu_err;
+	}
+
 	av1_dec->film_grain.size = ALIGN(sizeof(struct rockchip_av1_film_grain), 2048);
 
 	av1_dec->prob_tbl.cpu = dma_alloc_coherent(vpu->dev,
 						   ALIGN(sizeof(struct av1cdfs), 2048),
 						   &av1_dec->prob_tbl.dma,
 						   GFP_KERNEL);
-	if (!av1_dec->prob_tbl.cpu)
-		return -ENOMEM;
+	if (!av1_dec->prob_tbl.cpu) {
+		ret = -ENOMEM;
+		goto prob_tbl_cpu_err;
+	}
+
 	av1_dec->prob_tbl.size = ALIGN(sizeof(struct av1cdfs), 2048);
 
 	av1_dec->prob_tbl_out.cpu = dma_alloc_coherent(vpu->dev,
 						       ALIGN(sizeof(struct av1cdfs), 2048),
 						       &av1_dec->prob_tbl_out.dma,
 						       GFP_KERNEL);
-	if (!av1_dec->prob_tbl_out.cpu)
-		return -ENOMEM;
+	if (!av1_dec->prob_tbl_out.cpu) {
+		ret = -ENOMEM;
+		goto prob_tbl_out_cpu_err;
+	}
+
 	av1_dec->prob_tbl_out.size = ALIGN(sizeof(struct av1cdfs), 2048);
 	av1_dec->cdfs = &av1_dec->default_cdfs;
 	av1_dec->cdfs_ndvc = &av1_dec->default_cdfs_ndvc;
@@ -420,11 +436,37 @@ int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
 						   AV1_TILE_SIZE,
 						   &av1_dec->tile_buf.dma,
 						   GFP_KERNEL);
-	if (!av1_dec->tile_buf.cpu)
-		return -ENOMEM;
+	if (!av1_dec->tile_buf.cpu) {
+		ret = -ENOMEM;
+		goto tile_buf_cpu_err;
+	}
+
 	av1_dec->tile_buf.size = AV1_TILE_SIZE;
 
-	return 0;
+	return ret;
+
+tile_buf_cpu_err:
+	dma_free_coherent(vpu->dev, av1_dec->prob_tbl_out.size,
+			  av1_dec->prob_tbl_out.cpu,
+			  av1_dec->prob_tbl_out.dma);
+prob_tbl_out_cpu_err:
+	dma_free_coherent(vpu->dev, av1_dec->prob_tbl.size,
+			  av1_dec->prob_tbl.cpu,
+			  av1_dec->prob_tbl.dma);
+prob_tbl_cpu_err:
+	dma_free_coherent(vpu->dev, av1_dec->film_grain.size,
+			  av1_dec->film_grain.cpu,
+			  av1_dec->film_grain.dma);
+film_grain_cpu_err:
+	dma_free_coherent(vpu->dev, av1_dec->tile_info.size,
+			  av1_dec->tile_info.cpu,
+			  av1_dec->tile_info.dma);
+tile_info_cpu_err:
+	dma_free_coherent(vpu->dev, av1_dec->global_model.size,
+			  av1_dec->global_model.cpu,
+			  av1_dec->global_model.dma);
+global_model_cpu_err:
+	return ret;
 }
 
 static int rockchip_vpu981_av1_dec_prepare_run(struct hantro_ctx *ctx)
-- 
2.43.0

