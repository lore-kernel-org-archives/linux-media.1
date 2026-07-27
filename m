Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF3941686D;
	Mon, 27 Jul 2026 13:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158367; cv=none; b=jtglhVOm8731rGcbaljUlmzJRYYNqI+a0I1TgGsSGwzr2uJLWHLjC4q/Yx1K5Ds2BUella00K/yAMjxlU45BomrEzyNnqF7Lm8tODpkCsr1FqMYCSnRsaSZQcCkEXYHBjBW3Lr3OYu91vwMyWVJRo2T5MZAUppFoP7tIcMHABpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158367; c=relaxed/simple;
	bh=2mip1P0r8sYINdnoikFp1mFhqhp+me9ZSLnkjSyycY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HsMWiKYnpXHSUh3oSR+SvtEAidtL+bB/c1Dz0IGtJlHbeg/LVPE6b1mLUjsrqMW8v/GL6vNQyIbRqXaGeXzgUfIuQ89UZ9+ky9heb+D5K0nJ3FxVJyuE99giFxvc6q9B7g8wnQAbJGFPQU8y7Mg4Z76M3yIrDNIB9+BYM6Wwoi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=rBdy5oh8; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=RsfNQZvE; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="rBdy5oh8";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="RsfNQZvE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785158360; bh=2mip1P0r8sYINdnoikFp1mFhqhp+me9ZSLnkjSyycY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rBdy5oh8lmEGFt8zi2I5zgOqroCYoHe5rjLhp8PCanO1JSjVdbTAEIpoSH5uHBFu5
	 DcAHgd2CaxyThshpz9t+fkuTiEM9MULyfqOA9+mGQGX6beuUiLj9QJcL38SSQ6clih
	 LjnxUPh/qVwykcgABgUr26mtqTi5v8ASR/Dv8snqlQaXRyVp/LI7AFC6E0+v6/3raB
	 527jlqg5XZly5JCSJ4fztJbiWHbP4i+njMJu7nEeAC6PpPkcWo1dJ23dqmYNbqe11c
	 6tZdFltQ3kSvZIlxxoDNCS+poT1/GNl9OjmRX/H8JWKtpvbA4Ti8aLtQJhj3qIDccm
	 uWm69pmG8PPuQ==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 85EAE4254C; Mon, 27 Jul 2026 14:19:20 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785158359; bh=2mip1P0r8sYINdnoikFp1mFhqhp+me9ZSLnkjSyycY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RsfNQZvEl1gikSCrcxbDu0syfqM/D3XNjjTjalN1TO0xyyry1OwhOwtpkhyPWqoea
	 HgkaMzSi9SiVLNc13bDFOKaT6cZtRyJ6Sg8DIBUhyh+rGNG3x5Rb1+eC3A1gU1v3gi
	 HQb25ZFDNBae8QwkdlZh9WhlxUOvP3AhFrDdXePa7lho5POpeFD+pJkW+m2HUeB8kH
	 ETblb212mGWrTGeQpvNUvf+VHo4sBCIePShZiMtLZfi71NQYNzRBaMr/65U8Ju07XO
	 nMl14XDpzhfGHwzHYJLJ5x10cxgs6WrvaaurYfutwy8HZJvBUNwojEZ2+uV/G0FWB3
	 Ibc29Ly3iytww==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 752CE4256E;
	Mon, 27 Jul 2026 14:19:19 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sean Young <sean@mess.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 13/15] media: cx88: Specify rc type at rc_allocate_type()
Date: Mon, 27 Jul 2026 14:18:56 +0100
Message-ID: <18d87a995296d9f8c972acc760619de0c41c5b0a.1785158244.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785158244.git.sean@mess.org>
References: <cover.1785158244.git.sean@mess.org>
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

