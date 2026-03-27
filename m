Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F743FCB10;
	Fri, 27 Mar 2026 17:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631462; cv=none; b=UAMVW35rKYdBzodm89dBeXn1Y9LQttrnXF9pvPQsKlWWZ8V3UPjfnLsWYJfJGPeX9V6feZHWYk3QtmP2xy5KYHV25U5G5YCk8fWQmOHtqQ4pw+vn9ydfZfHoEb6iRQCCedgSmsodmf6WXEdXq/lI4kIR0fFNZSskZ02Z+tGAFwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631462; c=relaxed/simple;
	bh=4o5zJI28AsNHv2VmUBkAcTfvZzbIhJhaMp4vF1yGmb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lECklFugywDTcvzVqDJqpcLm9owXn2UR0+O67vpquoYflFYk3ZPzfSygohK4bSfmi2gkxAlMMxq/vA47EfCAtwBMwuaBJWuEaWgYAdX68/2ZCUFneNzVsC/XTsY+kFcDjI6RIshwn0bYCDB439f42KjCl+4aWBczj68wahpMoX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U5QHUnQ6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U5QHUnQ6"
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CCE9931A7;
	Fri, 27 Mar 2026 18:09:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774631365;
	bh=4o5zJI28AsNHv2VmUBkAcTfvZzbIhJhaMp4vF1yGmb4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U5QHUnQ6XLLYMseDt4CJxJ8B2Yi88A+/fqmke4G9+MqwQ+y0U24LKxgQNvILeyNPF
	 oM9Fxvi1T9dq6jXhJ4vVMby+sHYqMmsjLH8JTVTRYMvyOahlW+ToXNhkr9phW7c1oZ
	 +goL1UbmtYWt5NRRQNqFKdcld4oFRFf571xci/hE=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 27 Mar 2026 18:10:19 +0100
Subject: [PATCH 14/14] media: rzg2l-cru: Simplify irq return value handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-cru-rework-v1-14-3b7d0430f538@ideasonboard.com>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=cyK9WQN1mHuE/llxrzRplL9jBJgVhDooTev1uqVgSUs=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpxroLLWtALRsYqxz6cV/B4pS/NJAaiFxXZyOQX
 pxAWEkzFvSJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaca6CwAKCRByNAaPFqFW
 PCcmD/9gtNkRQav3WFqlx9SVwvyNFLcJMhz9Jvm+F1W+qri7g+kOp6WnltrLEjJQjdpfvjNtZEJ
 hfdp1n9G5KSs1m90Ay9Br4x1Wb5nIbiTxrH2ZIGgKeNYY7Q+YZPwWItgMYKgU8FAtX4JD7hZLO2
 WTRIJM++Xon2LjXR49c1hKE1dxYF1ZX9wMoP5uEgaWypC7i7TrpOwzrYLZZupgh1FboOVBQvNcs
 eU5UkSBLSk9T0lGF1oH9DINRoB5eQiPr3ponihjRoSdWogWIZURAnItSbNt1q+AlwuCXKFbw1ya
 Y/tVs7QP0dwarw1C7qXkbf1nJD2MvjvNh0ax+LT0s6xmFUY7jO+cRFNGBzKO8GMQfTZ6L0TDWss
 vMIHl46pPUwc/l4X9Zj9VKg0R/O1d+o8sDFN2+x/qP40G8iYx/lq6voNBK9yc/LyFMlytKR24WK
 7AYsBbuX6jnTQzg9n4j9Pb765rJt7FANAuyNYyqK2gMQTgWIrS+4AjhoBD1PPhuEYJ6c50Q2Rzd
 3Ouh77+e8YAoNKL5/nuEgOcHdWK5jXzLvFQZiEdOkiDGsPIwNTzd2D/m1SsjMdEs2h7s7Zx8UW0
 3DtVuhqIUZpEjyljGhLi8+8pDUqmP6yMdfIC9NRNh7EdGvwDe1ZFJN3ID2VrT47NosaC7ppqgm/
 5ZCl2ec5kmk7cTg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

The rzg2l_cru_irq() irq handler uses a local variable to store the
handler return value.

Simplify it by using IRQ_NONE and IRQ_HANDLED.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 30424e2b6cc0..e81573d0a84c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -592,16 +592,13 @@ static void rzg2l_cru_stop_streaming(struct rzg2l_cru_dev *cru)
 irqreturn_t rzg2l_cru_irq(int irq, void *data)
 {
 	struct rzg2l_cru_dev *cru = data;
-	unsigned int handled = 0;
 	u32 irq_status;
 	u32 amnmbs;
 	int slot;
 
 	irq_status = rzg2l_cru_read(cru, CRUnINTS);
 	if (!irq_status)
-		return IRQ_RETVAL(handled);
-
-	handled = 1;
+		return IRQ_NONE;
 
 	rzg2l_cru_write(cru, CRUnINTS, rzg2l_cru_read(cru, CRUnINTS));
 
@@ -638,7 +635,7 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 	/* Prepare for next frame */
 	rzg2l_cru_fill_hw_slot(cru, slot);
 
-	return IRQ_RETVAL(handled);
+	return IRQ_HANDLED;
 }
 
 irqreturn_t rzg3e_cru_irq(int irq, void *data)

-- 
2.53.0

