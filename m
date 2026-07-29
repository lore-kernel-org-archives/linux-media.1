Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA7F4DB567;
	Wed, 29 Jul 2026 15:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338601; cv=none; b=Ih30GNoSMwgYx1vXtfIIMiRR1660iD1w8tAQHQqQpNYV1yWMCjyWrW8OE+zY6WoEOt2t83tP84shJeteoIyEpNvdTNUy6Zkjqwf5Azifd/DP0zIh+f8Z6EEFyqy9IGUbQ+39dlv7SHobOmlYAyawVtyYiI1/37f89A0vl3k7D+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338601; c=relaxed/simple;
	bh=Fcv1mOkK7njxhimc7p03RvOYu0OEpxa9pQhJdYabWeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zbw7bQ+FJhSjxZ9HaX3sljC15MuUcpz/bT0w2N4OmmFRgshH+T6WFzPtxu+W26ASZsHy1kpzc4/zwdrbFIAZVp+1PQOpMKMGVhR0XTIlvIBm93pAzMknpuNHZCo02TLZJy68f3TVW4kvziFyq0hjnS1Z6ZYdw6KvPZdaRPtEF1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=EKXv9FQW; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=FVg6sCOC; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="EKXv9FQW";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="FVg6sCOC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785338598; bh=Fcv1mOkK7njxhimc7p03RvOYu0OEpxa9pQhJdYabWeg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EKXv9FQWbPxvie2zmP4VWQNG43+aUqPcL2UPhMhK25NmJ8iH20ARrlkC3f/wrG+uc
	 /lA04DmIKKzxjLLcph5czgphDuUa6YKZs5uUO1foCi4UUi33M13r/ZmwEpQ+Z9l3rx
	 Iy/sYPRWfmlxS+26H1y8LHYRJsFNryp+DzHU8uypaimPDJBYcPQSc/LqoGSEML9ySF
	 yMgLvybr9IMM//n7RyM83aefsdkJB0bDAMo0iO/oI7nOXv+83Ps+QahHGAOZpzjA3b
	 SCLnf/IMu0HtiFCJLUE7Hjwq+QcGhwDP/3xZvsDcBnGA+fgKUDhsYxXpbz39ctwtNq
	 DKro2NTTFOi6Q==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 01A094017A; Wed, 29 Jul 2026 16:23:17 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785338596; bh=Fcv1mOkK7njxhimc7p03RvOYu0OEpxa9pQhJdYabWeg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FVg6sCOCUIMnApD7+dwMPvcvooid4pjQae6gHqfdNKVGK1EoPoXWdopWgrSo1K0H8
	 S8PpXuxrhtRAAo4/ogvG2MRWUK9sNaTIqzQpT7MuFKqGmr9FMpz4KVo+YiAs3Cc2DA
	 QcequPS7l7npUHT1KKKhFGZKgGuJsxP6WdJ1OLhDj1mt5eEygclBtF1jjcMhfxwK9h
	 K3JZqlTDpL/s/0tKCd1dko7qd996X4vvnIXn1Sju9g09cFtNAB62w3i6eIDInXqwDT
	 S/uf4s/riAo40ygd9jcCN8yY2rsVuXqmcmttYfidzS1k11n0EJpTTfNwZ7HR68NTSC
	 r8VE88EDpjhNg==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 286A542552;
	Wed, 29 Jul 2026 16:23:16 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sean Young <sean@mess.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 12/15] media: saa7134: Specify rc type at rc_allocate_type()
Date: Wed, 29 Jul 2026 16:22:50 +0100
Message-ID: <6f3fd69e7953c4c8bdf6bf82d3a7d60c7037fbe8.1785338381.git.sean@mess.org>
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
 drivers/media/pci/saa7134/saa7134-input.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-input.c b/drivers/media/pci/saa7134/saa7134-input.c
index 7f6680de3156..b2a2372d149a 100644
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
@@ -792,10 +793,8 @@ int saa7134_input_init1(struct saa7134_dev *dev)
 	rc->priv = dev;
 	rc->open = saa7134_ir_open;
 	rc->close = saa7134_ir_close;
-	if (raw_decode) {
-		rc->driver_type = RC_DRIVER_IR_RAW;
+	if (raw_decode)
 		rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
-	}
 
 	rc->device_name = saa7134_boards[dev->board].name;
 	rc->input_phys = ir->phys;
-- 
2.55.0

