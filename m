Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C243426B2CE;
	Mon, 13 Jul 2026 21:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783978293; cv=none; b=nAWEAv8AYDGu7zMVeLFQFHYJLgJ4+TYjrkRMHKHMWcePe06XHtFiNzLvf1nuIalKBj4T/enCC1ukpnLhZSk/Al/JmewWF44rHn5fiFLPplmUJcppwK3Veu8OS3GSJRXtKaJq2rYwCUQbWazTZAeLR/MQhPJeoLgzZ7MLk1hoXio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783978293; c=relaxed/simple;
	bh=jom5Sfj2r2NA+T+rZSarTiq+DJb0dHfs+u328K9p5yY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cUDnJlAN0DY4djTutRGOyCNOkoELrSTrgBr9h3ccdke/XLsqCW43xIT9zIQaJ9EcKSChvzYNJZC0c0prKaHSsC414SHLsRcO6fTXMPahiBMkmIdYzqspFmr4e6z+fw4Gr1KFia6nlUOqFm1EgVdxSA1Fuxy7PdQupTh/MLObFqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=A3d1pQdm; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=A3d1pQdm; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="A3d1pQdm";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="A3d1pQdm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978283; bh=jom5Sfj2r2NA+T+rZSarTiq+DJb0dHfs+u328K9p5yY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A3d1pQdmwAFZ2JdWYYWWLCYzmT3HomNMyxoiDR7Puk3FnFPbagIEDxRb7WzuIZ3uh
	 TCtTaeGi7LhGjTYUjTNLQRk91CeDamR6rYDffO3DvHZh0ErnydiQf5lMGO9RopLHYq
	 v+1iib0+fKG+8xD8Q/neEOklIzk6UmUAO4TLQ/g/J2o0sG6gisa4yowmvntv53eNqr
	 x8McQJYGYxjUDmQS15JNgLKQBWUAbobEks/iFWUDc55KWrT5C+lpvSZEMfBAb537CN
	 UXy5+6GT983SfatZnJJgwsBFttabTMe/F9gYUCGIt5bbmKtKtQE58VXYQr4KGsh8EL
	 Qd8UcssY0uxNw==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id A9B8040A4B; Mon, 13 Jul 2026 22:31:23 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978283; bh=jom5Sfj2r2NA+T+rZSarTiq+DJb0dHfs+u328K9p5yY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A3d1pQdmwAFZ2JdWYYWWLCYzmT3HomNMyxoiDR7Puk3FnFPbagIEDxRb7WzuIZ3uh
	 TCtTaeGi7LhGjTYUjTNLQRk91CeDamR6rYDffO3DvHZh0ErnydiQf5lMGO9RopLHYq
	 v+1iib0+fKG+8xD8Q/neEOklIzk6UmUAO4TLQ/g/J2o0sG6gisa4yowmvntv53eNqr
	 x8McQJYGYxjUDmQS15JNgLKQBWUAbobEks/iFWUDc55KWrT5C+lpvSZEMfBAb537CN
	 UXy5+6GT983SfatZnJJgwsBFttabTMe/F9gYUCGIt5bbmKtKtQE58VXYQr4KGsh8EL
	 Qd8UcssY0uxNw==
Received: from maru.home (host86-148-148-68.range86-148.btcentralplus.com [86.148.148.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 64A2340A3B;
	Mon, 13 Jul 2026 22:31:23 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/11] media: redrat3: Error path leaves device in transmitting state
Date: Mon, 13 Jul 2026 22:30:59 +0100
Message-ID: <d8be8047def26d35726666fee2f3ca309da200ef.1783977550.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783977550.git.sean@mess.org>
References: <cover.1783977550.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the allocation fails, transmitting is left as true and the transmitter
cannot be used any more.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/redrat3.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index 468907d6c3a8..b64c6440b062 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -781,9 +781,6 @@ static int redrat3_transmit_ir(struct rc_dev *rcdev, unsigned *txbuf,
 	if (count > RR3_MAX_SIG_SIZE - RR3_TX_TRAILER_LEN)
 		return -EINVAL;
 
-	/* rr3 will disable rc detector on transmit */
-	rr3->transmitting = true;
-
 	sample_lens = kzalloc_objs(*sample_lens, RR3_DRIVER_MAXLENS);
 	if (!sample_lens)
 		return -ENOMEM;
@@ -794,6 +791,9 @@ static int redrat3_transmit_ir(struct rc_dev *rcdev, unsigned *txbuf,
 		goto out;
 	}
 
+	/* rr3 will disable rc detector on transmit */
+	rr3->transmitting = true;
+
 	for (i = 0; i < count; i++) {
 		cur_sample_len = redrat3_us_to_len(txbuf[i]);
 		if (cur_sample_len > 0xffff) {
-- 
2.55.0

