Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F13410D3B
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697315; cv=none; b=TI3W7Cm+0ibylvJ5T3W9vkOmsewXUMYvK0P73Qnwx4cGRwDCDJX4Zi+QG5U/2bj+AJzyz5xvPF3rXecgFwdPQ+qVcXpiAdl2SIuzD8VcUxfKHZPeCIqM97dzdhvw1jw6wvTcgvLJGtju6eGZdMT5t9/bY5ntWRxyHNYsXPpWLRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697315; c=relaxed/simple;
	bh=gBIn6at9O3Wt35zYuxm/cCdj3/DyWLNMazznsspcUNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TgA7u65mHJVh3uPr0O0f7bevYW6HwzhJ2OnCaH+nC5r6Jj3yEwktIhPT1qaJkelKNdX4/lURa+35l2+rbwXQAAl9KaLj/sB28RDdHCDGWBP2gdu+2M9PSgG9kLdihm+k9J3zNgzegy0QXYBLRb/TUXOq6b5OkUmqRhY0uCyY6gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVchz-0000LW-W1; Sat, 06 Jun 2026 00:08:08 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:06:47 +0200
Subject: [PATCH 01/17] media: rockchip: rga: zero cmdbuf in shared code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-1-3ec2b15675f7@pengutronix.de>
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

Zero the command buffer (cmdbuf) in the shared code instead of the
individual RGA2/RGA3 implementations. Besides centralizing the memset
operation this also uses the cmdbuf_size member for the memset size,
which is also used as the size for the actual allocation.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c  | 2 --
 drivers/media/platform/rockchip/rga/rga.c     | 1 +
 drivers/media/platform/rockchip/rga/rga.h     | 3 +++
 drivers/media/platform/rockchip/rga/rga3-hw.c | 2 --
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index be1bc8ddbd03b..4d7b0a03820a1 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -443,8 +443,6 @@ static void rga_cmd_set(struct rga_ctx *ctx,
 
 static void rga_hw_setup_cmdbuf(struct rga_ctx *ctx)
 {
-	memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);
-
 	rga_cmd_set_mode(ctx);
 	rga_cmd_set_trans_info(ctx);
 }
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index b3cb6bf8eb863..bd0afd33affe4 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -41,6 +41,7 @@ static void device_run(void *prv)
 	spin_lock_irqsave(&rga->ctrl_lock, flags);
 	if (ctx->cmdbuf_dirty) {
 		ctx->cmdbuf_dirty = false;
+		memset(ctx->cmdbuf_virt, 0, rga->hw->cmdbuf_size);
 		rga->hw->setup_cmdbuf(ctx);
 	}
 	spin_unlock_irqrestore(&rga->ctrl_lock, flags);
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index bd431534d0d39..2b4f5694375a4 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -152,6 +152,9 @@ struct rga_hw {
 	u8 stride_alignment;
 	u8 features;
 
+	/*
+	 * Requires that the cmdbuf is already zeroed.
+	 */
 	void (*setup_cmdbuf)(struct rga_ctx *ctx);
 	void (*start)(struct rockchip_rga *rga,
 		      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.c b/drivers/media/platform/rockchip/rga/rga3-hw.c
index ca1c268303dd4..72741e1faccff 100644
--- a/drivers/media/platform/rockchip/rga/rga3-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga3-hw.c
@@ -261,8 +261,6 @@ static void rga3_cmd_set_wr_format(struct rga_ctx *ctx)
 
 static void rga3_hw_setup_cmdbuf(struct rga_ctx *ctx)
 {
-	memset(ctx->cmdbuf_virt, 0, RGA3_CMDBUF_SIZE);
-
 	rga3_cmd_set_win0_format(ctx);
 	rga3_cmd_set_trans_info(ctx);
 	rga3_cmd_set_wr_format(ctx);

-- 
2.54.0

