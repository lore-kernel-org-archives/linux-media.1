Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B463A2550;
	Thu,  9 Apr 2026 13:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742699; cv=none; b=URY7Z/WKALWb+NOM1D6V9M1BS/eZGU9fEGlXCeKCyVQ/RYI9tu0dZ7iV9aviyQsPxx8ySbd8x6ad+XWZ9NBHaKLBG6Lff2/gtoWk6wl4wJbbk9X2Gmvp+pHBqfTVNeiTsu0dA3h0PcinB2q4SVbFujs/0k+buC0QD3yXkAauxis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742699; c=relaxed/simple;
	bh=KyzQwUnfDm1fztBC6M2uhc6YYJnSNz50uKom2fCwuZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b7U8dBdjh4DRrYErltsb/9gg6JkROQ1JJIYyv2573TOuX1YgS/WuBn+hr0PivObXxMmOQNS8+gZMf0drZkxLty0lh4Ph78sCeadUTsZDr3hQSmMQvOdyR/F2Ohv+lOppTQnhA5LjFgt6HK2j9ZfkIfA6nvCw5HdgLoZJ20KoaAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=l4XS61sD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="l4XS61sD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775742696;
	bh=KyzQwUnfDm1fztBC6M2uhc6YYJnSNz50uKom2fCwuZQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l4XS61sDtun10RvRrmAQdt2YKZsc3mBoeRg457cBWGGTuDs9yhOa93DjK/eKkcis/
	 I2jBM8k7jCXzYrakt2XSG/SUk+l3jYS0EN9pPNVJb45KOl9scpyPpxGFWTIw7QC0gQ
	 jOjaQDiSsKbnF1N7LAFSnfWJZ3zee3/v9sIi+a4DHcQ+Vmm1dq8Q82wEr7pUTLkUj6
	 LykLGfPf9suuSmY/syNld4fwOqDt+pJ6tlgud/jlwlMDKpO/Bj1hzOY7/BOvP58UIW
	 +3bNDUZyohkpOSW3EJvvvn70SBDrd6CIwaJga2/V6QSTkv3EST0WAPHSTi6mCuUwOg
	 Pu3/rB7H6f5DQ==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AAE7917E1340;
	Thu,  9 Apr 2026 15:51:34 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 09 Apr 2026 09:50:39 -0400
Subject: [PATCH 4/7] media: rkvdec: Remove unused need_reset
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-rkvdec-multicore-v1-4-62b316abf0f7@collabora.com>
References: <20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com>
In-Reply-To: <20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.1

A left-over from the iommu restore mecanism was forgotten.
As need_reset is never set to true, the if has no use.

The actual restore function is called above it vase the IRQ isn't in a
success status.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 31ddfcc58894..db2731af06cf 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1462,7 +1462,6 @@ static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
 {
 	struct rkvdec_dev *rkvdec = ctx->dev;
 	enum vb2_buffer_state state;
-	bool need_reset = 0;
 	u32 status;
 
 	status = readl(rkvdec->regs + VDPU381_REG_STA_INT);
@@ -1478,9 +1477,6 @@ static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
 			rkvdec_iommu_restore(rkvdec);
 	}
 
-	if (need_reset)
-		rkvdec_iommu_restore(rkvdec);
-
 	if (cancel_delayed_work(&rkvdec->watchdog_work))
 		rkvdec_job_finish(ctx, state);
 
@@ -1491,7 +1487,6 @@ static irqreturn_t vdpu383_irq_handler(struct rkvdec_ctx *ctx)
 {
 	struct rkvdec_dev *rkvdec = ctx->dev;
 	enum vb2_buffer_state state;
-	bool need_reset = 0;
 	u32 status;
 
 	status = readl(rkvdec->link + VDPU383_LINK_STA_INT);
@@ -1507,9 +1502,6 @@ static irqreturn_t vdpu383_irq_handler(struct rkvdec_ctx *ctx)
 		rkvdec_iommu_restore(rkvdec);
 	}
 
-	if (need_reset)
-		rkvdec_iommu_restore(rkvdec);
-
 	if (cancel_delayed_work(&rkvdec->watchdog_work))
 		rkvdec_job_finish(ctx, state);
 

-- 
2.53.0

