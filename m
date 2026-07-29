Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515A14D90D5;
	Wed, 29 Jul 2026 15:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338601; cv=none; b=qBShHl9hnTEoTVjZ8wOoOOIZhclX9ciT7nJh0s4qCEZYXsgdpyeVdcDhA0/qr0M1tIO8a9BJdGg+nF91ou1Ml+oJ1m16hOwhNTSzR5nS/+c3bMSBzUlg1V3lI1hLwYri7cAMtiD0VPZtp5gN+MLJWpdjNNW/fC18mkicTkCdfmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338601; c=relaxed/simple;
	bh=2mip1P0r8sYINdnoikFp1mFhqhp+me9ZSLnkjSyycY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SxN+sfJjd1Hz70ilL2CBxhvJRdrX/MX8DJdgA1QJy3DeowKzSzAgNm4QdmO8//ox3vCfZoH8fjl0ydFrx0RuYuzWY+fhdKrGPJu/rwM3qAzX0lyiSOCRBRIl8Fbza0RgmCRFWdt029+frF540covWeAL8SZSe2hXHB5WWTc+EV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=h4L23KmJ; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=knStOjPZ; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="h4L23KmJ";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="knStOjPZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785338597; bh=2mip1P0r8sYINdnoikFp1mFhqhp+me9ZSLnkjSyycY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h4L23KmJ/9hLZ7m+beK6n2lg/sbtcgjvy61weKpQYAbO/NU9zr8XtURH8XtGDjha9
	 i/d1ag8MOs6PKd8hfw4vgeY/bveMUg7BqSFkOP6L1AtRRyEeffqdG+qqoTfU46upRq
	 R6nUQ6b7JQMa3Nyb4JfdADBfnd2y10D8tUGYgLSb66cTT0pSQmekY5p58ysyqBC0xs
	 yh3xlSSAk9umG2vrYD8NPnRzWGUiHY76+krYuXM6ffm6j3lQ9FKLXe7hs2lcxYVB6K
	 wJLM9xpQlIyKOZ1PJwEjptvO4FnYbuJAnj0ykGAEtTtP0HMd9/oXBH8VappISxLu+0
	 fRDHckt5de7/A==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id C40074254E; Wed, 29 Jul 2026 16:23:17 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785338595; bh=2mip1P0r8sYINdnoikFp1mFhqhp+me9ZSLnkjSyycY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=knStOjPZ+NvgcilR7WvHZ4K0JwJAwhjdC7Fju4//ANopN02CmjmgZqnPIDvf9/q8H
	 d11/BOvfKq9auVfz+othEQ1yGjOvvwPEH5cb04puoSJEN1u2DEvu4uJycp2bm78kW3
	 C/Um8DS+UL7DgO/ogOGdBclA2eyU/cBZZPwe8XbAebRTqCn5QhNCMCU2NfiKm7sfVC
	 FtHrjkUkX1gm8QJpRuDGCR3c/yNn9Yed5mOrdsdda2Az4uiOMex/2SEGlHLjS41fdG
	 UkRAkewrbusSqZ/JjNKnfEqryPyJSWrSkMQSPYXuwyaJcLstBK4w4qzE6NE47Jpv1D
	 QE6+a2xD6DHwg==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id ABFEE42550;
	Wed, 29 Jul 2026 16:23:15 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sean Young <sean@mess.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 11/15] media: cx88: Specify rc type at rc_allocate_type()
Date: Wed, 29 Jul 2026 16:22:49 +0100
Message-ID: <97a10d5555d6b9a40500ca085b1b35aee290cc53.1785338381.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785338381.git.sean@mess.org>
References: <cover.1785338381.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changing the type of the rc device after allocation is ugly and
this will also break in a future commit. Ensure that the allocation
happens with the correct type in the first place.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/pci/cx88/cx88-input.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/cx88/cx88-input.c b/drivers/media/pci/cx88/cx88-input.c
index 5d9ce4f9af01..c96d289e5ab7 100644
--- a/drivers/media/pci/cx88/cx88-input.c
+++ b/drivers/media/pci/cx88/cx88-input.c
@@ -259,7 +259,7 @@ static void cx88_ir_close(struct rc_dev *rc)
 int cx88_ir_init(struct cx88_core *core, struct pci_dev *pci)
 {
 	struct cx88_IR *ir;
-	struct rc_dev *dev;
+	struct rc_dev *dev = NULL;
 	char *ir_codes = NULL;
 	u64 rc_proto = RC_PROTO_BIT_OTHER;
 	int err = -ENOMEM;
@@ -268,11 +268,8 @@ int cx88_ir_init(struct cx88_core *core, struct pci_dev *pci)
 				 */
 
 	ir = kzalloc_obj(*ir);
-	dev = rc_allocate_device(RC_DRIVER_IR_RAW);
-	if (!ir || !dev)
-		goto err_out_free;
-
-	ir->dev = dev;
+	if (!ir)
+		return -ENOMEM;
 
 	/* detect & configure */
 	switch (core->boardnr) {
@@ -439,6 +436,13 @@ int cx88_ir_init(struct cx88_core *core, struct pci_dev *pci)
 		goto err_out_free;
 	}
 
+	dev = rc_allocate_device(ir->sampling ?
+				 RC_DRIVER_IR_RAW : RC_DRIVER_SCANCODE);
+	if (!dev)
+		goto err_out_free;
+
+	ir->dev = dev;
+
 	/*
 	 * The usage of mask_keycode were very convenient, due to several
 	 * reasons. Among others, the scancode tables were using the scancode
@@ -477,12 +481,10 @@ int cx88_ir_init(struct cx88_core *core, struct pci_dev *pci)
 	dev->close = cx88_ir_close;
 	dev->scancode_mask = hardware_mask;
 
-	if (ir->sampling) {
+	if (ir->sampling)
 		dev->timeout = MS_TO_US(10); /* 10 ms */
-	} else {
-		dev->driver_type = RC_DRIVER_SCANCODE;
+	else
 		dev->allowed_protocols = rc_proto;
-	}
 
 	ir->core = core;
 	core->ir = ir;
-- 
2.55.0

