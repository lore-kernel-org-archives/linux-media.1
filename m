Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCDF416864;
	Mon, 27 Jul 2026 13:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158366; cv=none; b=m6N5NdiQ3c+YX+owWSa8h5T5R7aBl6YwZcx07nvcUZ9Ek7ccNKQSIsUhaROqAyJzwiZBP5oKGzoqDOpl1sa3MNFKdQSs3+3q5hPLDUDEtN0Y6KKPoNI4LgtLZ4dOgv20BSCC6wNThREHkSSHKSch87oETcGDIlPX42/MmSIeBIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158366; c=relaxed/simple;
	bh=hsK6PcxD/Plxn1nArmrOyr62vcJA1eTNM2haW3ehWdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X2iWA8K+E4F0evsQpgQcbfSLKazB6axYtS0MI+g2+wY+Vn24NFpTC45BaoItNwj9ZzVU2P+Utdc2gVWcYaBrWMGEpG3bRhtj4RWAqUQjXfoimJUDjOFk/nnKetq5t8RW7CW1WubUI1IMmfNcd/qRmpRKzS1tJpEsAfisWHyd9Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=KeHZ/H2J; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=KeHZ/H2J; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="KeHZ/H2J";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="KeHZ/H2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785158360; bh=hsK6PcxD/Plxn1nArmrOyr62vcJA1eTNM2haW3ehWdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KeHZ/H2JBuiRqS7g6z8hsG114pogJdtsqok2OFQvrViklMwG+bXmKA3nSowo5nzxR
	 HTkdH9R4Q5BnPlNXNRa+JqsLfQftXBXUvJxNT6VFSwDArj8E9yWzOq72Fye+bS/mHp
	 ybnXdIQK4GLMi9p6NjIHCBKNWZwqz6b1s2Hw/C47rNzeGrQykw0ucy9JaCiUzdorDF
	 Fhk4IUVurgNQA7GQcJiQhI6uvQTJcygvqybdSOC8kfjcP5yfell6LvKDf9ivEFC/qB
	 O17NNd/FpwEuQ7mezml26jNVK2LG+wIZTdWeMXcucCRPax1uU8e+DRtHR6MxliLbWI
	 UaWXfMJclIFsg==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id A3B504256F; Mon, 27 Jul 2026 14:19:20 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785158360; bh=hsK6PcxD/Plxn1nArmrOyr62vcJA1eTNM2haW3ehWdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KeHZ/H2JBuiRqS7g6z8hsG114pogJdtsqok2OFQvrViklMwG+bXmKA3nSowo5nzxR
	 HTkdH9R4Q5BnPlNXNRa+JqsLfQftXBXUvJxNT6VFSwDArj8E9yWzOq72Fye+bS/mHp
	 ybnXdIQK4GLMi9p6NjIHCBKNWZwqz6b1s2Hw/C47rNzeGrQykw0ucy9JaCiUzdorDF
	 Fhk4IUVurgNQA7GQcJiQhI6uvQTJcygvqybdSOC8kfjcP5yfell6LvKDf9ivEFC/qB
	 O17NNd/FpwEuQ7mezml26jNVK2LG+wIZTdWeMXcucCRPax1uU8e+DRtHR6MxliLbWI
	 UaWXfMJclIFsg==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 0234F42562;
	Mon, 27 Jul 2026 14:19:19 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sean Young <sean@mess.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 14/15] media: saa7134: Specify rc type at rc_allocate_type()
Date: Mon, 27 Jul 2026 14:18:57 +0100
Message-ID: <4375dc95f711088b8ca0dde76d0381b453e6688e.1785158244.git.sean@mess.org>
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
 drivers/media/pci/saa7134/saa7134-input.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-input.c b/drivers/media/pci/saa7134/saa7134-input.c
index 7f6680de3156..81620e629449 100644
--- a/drivers/media/pci/saa7134/saa7134-input.c
+++ b/drivers/media/pci/saa7134/saa7134-input.c
@@ -769,7 +769,8 @@ int saa7134_input_init1(struct saa7134_dev *dev)
 	}
 
 	ir = kzalloc_obj(*ir);
-	rc = rc_allocate_device(RC_DRIVER_SCANCODE);
+	rc = rc_allocate_device(raw_decode ?
+				RC_DRIVER_IR_RAW : RC_DRIVER_SCANCODE);
 	if (!ir || !rc) {
 		err = -ENOMEM;
 		goto err_out_free;
@@ -792,11 +793,6 @@ int saa7134_input_init1(struct saa7134_dev *dev)
 	rc->priv = dev;
 	rc->open = saa7134_ir_open;
 	rc->close = saa7134_ir_close;
-	if (raw_decode) {
-		rc->driver_type = RC_DRIVER_IR_RAW;
-		rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
-	}
-
 	rc->device_name = saa7134_boards[dev->board].name;
 	rc->input_phys = ir->phys;
 	rc->input_id.bustype = BUS_PCI;
-- 
2.55.0

