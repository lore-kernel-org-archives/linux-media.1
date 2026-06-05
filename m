Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72553D3CF4
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697331; cv=none; b=PeKcMghaGldg79N2fc2cqeoqUaLjFHIkKJu9S8qqtX+Ugk4GSrmiiY/GYhpofBiukZiHpl2A02QpKiUrp1JTC7/roUiMUwRQsDiBEucjYyjbpOdj5sXKI/bbyidguXAY2dPC3OKWiqBMFt+UOVFWUCelvVaI5ygTpj3B+X91Ix0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697331; c=relaxed/simple;
	bh=MeB+Hhj4GHnZw4qwxj05LAHj8PlUYMFLq2BrXqIRPXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=omzNXN7gYKm8Cydp3r4K2TcF0vahiSgclWi8dzWrRojTcCYmNr70SFmB7iwFzvpGMeQtIJpc7aXUDRfLqvFN2dM8FRzrBD3WryEWY4pqkhmsS0MI0Nan+ZCuUnWXOtIEvTbrVmOdQ+wlnc+2vvSG3S5UYmPFLIwm4eKt7ERmlmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVci5-0000LW-3d; Sat, 06 Jun 2026 00:08:13 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:06:52 +0200
Subject: [PATCH 06/17] media: rockchip: rga: move power handling to
 device_run
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-6-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
In-Reply-To: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Move the power handling to the device_run function in preparation for
enabling multiple cores. This allows to power the only the necessary cores
instead of powering all available cores.

As the decision on which core the given job is executed will be done in
device_run, we can only power to correct core there.

To avoid unpowering the core in a streaming state switch to autosuspend.
This avoids powering down the core when the next frame is scheduled in
the next 50ms. The timeout maps to a framerate of 20fps, which should be
pretty uncommon in a normal video stream.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 12 ------------
 drivers/media/platform/rockchip/rga/rga.c     | 11 +++++++++++
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index c0ea6003336bf..3f7c3c68e0cb8 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -242,14 +242,6 @@ static int rga_buf_prepare_streaming(struct vb2_queue *q)
 static int rga_buf_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct rga_ctx *ctx = vb2_get_drv_priv(q);
-	struct rockchip_rga *rga = ctx->rga;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(rga->dev);
-	if (ret < 0) {
-		rga_buf_return_buffers(q, VB2_BUF_STATE_QUEUED);
-		return ret;
-	}
 
 	if (V4L2_TYPE_IS_OUTPUT(q->type))
 		ctx->osequence = 0;
@@ -261,11 +253,7 @@ static int rga_buf_start_streaming(struct vb2_queue *q, unsigned int count)
 
 static void rga_buf_stop_streaming(struct vb2_queue *q)
 {
-	struct rga_ctx *ctx = vb2_get_drv_priv(q);
-	struct rockchip_rga *rga = ctx->rga;
-
 	rga_buf_return_buffers(q, VB2_BUF_STATE_ERROR);
-	pm_runtime_put(rga->dev);
 }
 
 const struct vb2_ops rga_qops = {
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 8c03422d669cf..0eff558d7f133 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -37,6 +37,14 @@ static void device_run(void *prv)
 	struct rockchip_rga *rga = ctx->rga;
 	struct vb2_v4l2_buffer *src, *dst;
 	unsigned long flags;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(rga->dev);
+	if (ret < 0) {
+		v4l2_m2m_buf_done_and_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx,
+						 VB2_BUF_STATE_ERROR);
+		return;
+	}
 
 	spin_lock_irqsave(&rga->ctrl_lock, flags);
 	if (ctx->cmdbuf_dirty) {
@@ -81,6 +89,8 @@ static irqreturn_t rga_isr(int irq, void *prv)
 		v4l2_m2m_buf_done(src, VB2_BUF_STATE_DONE);
 		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_DONE);
 		v4l2_m2m_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx);
+
+		pm_runtime_put_autosuspend(rga->dev);
 	}
 
 	return IRQ_HANDLED;
@@ -797,6 +807,7 @@ static int rga_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Unable to parse OF data\n");
 
+	pm_runtime_set_autosuspend_delay(rga->dev, 50);
 	pm_runtime_enable(rga->dev);
 
 	rga->regs = devm_platform_ioremap_resource(pdev, 0);

-- 
2.54.0

