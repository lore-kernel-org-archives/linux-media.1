Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0D64C9014;
	Wed, 22 Jul 2026 10:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715822; cv=none; b=WFe7zF6E3O0k1hIXJ+dt27hDhLWZIJcWwlDRgYU5v+4eBDVa9o0YdgjCD9JFq45b86/ZTfcDG7zF6EJ6jBuvGYkpYDfsdCUbyp7GegVzEo3eJ8uoqJT3Ghwx105gcVj3Hunsj02PMAPcMLHlWgOvIUMAf5IG4EQAdCaO09YQ9HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715822; c=relaxed/simple;
	bh=1vHYBrD9pgeIvn3MdFlYfySCTl2p9Y9bYO0HxlVEOE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ThPgt/sG5DER295iZyB0jc14rMVSJDA+bXSggf/bQ8xel+l81NcBfNiNKvlKysXx7zGLXqPvUwqcYe3z+FbW6ptGeYXr6q6l6etvfuE7SWzYSvmeT/pebN9wPAHnuPy4BgFd05S7DA28sycZaIPxXiRj503C+zZTVhv7j5PvKJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=T5RmVRUp; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=T5RmVRUp; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="T5RmVRUp";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="T5RmVRUp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715818; bh=1vHYBrD9pgeIvn3MdFlYfySCTl2p9Y9bYO0HxlVEOE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T5RmVRUpcF3vCBMD+pb9stsQ2VdiqE5WDjDKZ8g/jxwl0i7RNFYviLppwZFNCt7Uz
	 uTjqqS8g6EwVMhHRXVRfBGmMPPusp/SMNGtlREFMiP8dq8RwQB6mniwsY+/CvQ2v2x
	 2IyFn7LFwSTqeXow96YpmqEoaGzYirNKt+HVt+wXnSmIEE1DJFjRXRduGjlwu3QDlw
	 VwaWzJIRFwps+2Ai/fuOnBJFptQLTOM2UIOsURnsycf1Cv30eZxx0n5Sg48HKcp6XU
	 MXHL6Ew6wLzONng0vdPJ+zcuIuwNnALCq2D+NPYuzWMeQsXEfMuISEbjp0pnRLOWvM
	 wcGx01kfKhYvw==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 59EAE4253E; Wed, 22 Jul 2026 11:23:38 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1784715818; bh=1vHYBrD9pgeIvn3MdFlYfySCTl2p9Y9bYO0HxlVEOE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T5RmVRUpcF3vCBMD+pb9stsQ2VdiqE5WDjDKZ8g/jxwl0i7RNFYviLppwZFNCt7Uz
	 uTjqqS8g6EwVMhHRXVRfBGmMPPusp/SMNGtlREFMiP8dq8RwQB6mniwsY+/CvQ2v2x
	 2IyFn7LFwSTqeXow96YpmqEoaGzYirNKt+HVt+wXnSmIEE1DJFjRXRduGjlwu3QDlw
	 VwaWzJIRFwps+2Ai/fuOnBJFptQLTOM2UIOsURnsycf1Cv30eZxx0n5Sg48HKcp6XU
	 MXHL6Ew6wLzONng0vdPJ+zcuIuwNnALCq2D+NPYuzWMeQsXEfMuISEbjp0pnRLOWvM
	 wcGx01kfKhYvw==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id E9D354253C;
	Wed, 22 Jul 2026 11:23:37 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/13] media: redrat3: Error path leaves device in transmitting state
Date: Wed, 22 Jul 2026 11:23:17 +0100
Message-ID: <5bc71c74d296a6f09dfc51fb84279834ab2b7786.1784715737.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1784715737.git.sean@mess.org>
References: <cover.1784715737.git.sean@mess.org>
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
index 994d4864520c..bc75f68ca535 100644
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

