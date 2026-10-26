Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013040;
	b=X7E9F1Ze0yqvCEX1Ohsw0lfFR0W/TtvzSJE1SdNYNt0wcPKb1yFIg7ok6abtIfua8rzp
	 QklEm3MJQEOhtrRprUg6aCUoFVT+8lqByg87qG6kqPSeKkA7VvzN8ZZzdQyWL3XuyxO8H
	 jX7LZ7ppSlgagUekZGdQTV/ZG2Jh28SXR832NvhyPFUXcCXLq9F365n9UpemF+r/E1Dh1
	 t1HFlZcgwnOfrfvZ/HFRpFy08VU6xCpBJmAKCDuHTImjFuxdom8PtFJmETNvkX/xHkbd9
	 gI8cM6s92V6GFpzHvDc/dinlIu94cYkkhh0Pe+X//0zPuB1gssbYUH1zQginECzWqCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nPvZd6ipcHhyyKgSYRp44a/mOJGJPLjA8+pqMRT1rUc=;
	b=q8TXvTUj/RiKdo7QTIrMwZ/ZBrjBfxiYRVh3851oR7Y50U7IUpNPgX485NQ7HjRVms+R
	 pFdWgR7ac7XEE9mKZjSOah+dkoND+yGwBZkaGi5347+GTdjdy9rmhvA3IO7u/EnE0QXZA
	 yAP+Olfa+cdJcNeeWkxNW4R4Uo7HH7lbpth6zJ7PgiZ89fln1m8NiuIQqjuKVP08LDdq2
	 QRvsazoHauOK1tJctUXW3P1+iYwTeZlBPRme8DbS9lFApfE8/O76PlFaDnZ0K6MPySiLP
	 OtqqXJxLK2+Cb97b79vSutMJdtLkJ8Y+xcnfhO8l2ZPGfh2OvBQENk70EXrT0q9ebcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NFrt4eiV;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D75060A5BFC
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 11:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D75060A5BFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NFrt4eiV
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-870e8b21121so129927b3a.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 04:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013040; x=1793617840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nPvZd6ipcHhyyKgSYRp44a/mOJGJPLjA8+pqMRT1rUc=;
        b=NFrt4eiVbq4Mp8B0y4o25ojFp+FFa+4f66uMwJtHoVi/woM9GOFpLAcZWlD8iPQMSV
         s4eoGDF/diHSBsKR/tsnpoY7RrRmG20QTZe5kqKT7s2fYLf301xS5hunbFVxI9gR9T4A
         CjFVGigZlaPXSYWVSZ64dZMArV19RYkeO02mm6MWuMvpRbxdFqXuDTrloQPz8eXMtyZ4
         5+tz5yEDhOTfPLYDXvKgvClHmd/AoBm5hig71DxXYHskC02+iPVBWKVJTS6EJAXsSx4c
         lZFEg+Bf4wA1B0szWc/6Zmx0DNhbtRiN8q+GMGbsYOIJe8+xVAAy6354QW73xycIxW9t
         edPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013040; x=1793617840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nPvZd6ipcHhyyKgSYRp44a/mOJGJPLjA8+pqMRT1rUc=;
        b=Tswk9dGcvPn4kp9KDhGqSWlBqvZGnqH6ywx0CafhGfh8o4QTlH+vJt2oyTEGLO4/xb
         vmrcfDBg396IOHgH3s5sknlCvS1Evfly8F+RCdgtJo87S0ytHiDYw3NgS6NZaKdvRV/5
         T5L5xGENWtRFYSoCygVczlhYK4ER8mL/6aKgl1WV2lwajSsTQfxgx8oVa5scIp2ZiEIC
         gFuMMMhU5dr4Xo5iYPi+dhiIHENlhQ7CKPiGYfFtN7YRZKXS5XnjivJfcBOXYK0Ljhm/
         xC8Lq146kt+DKRJJDPq6YgvHOU+/KHyjwEsN5ke5yMA+6oI5OCAkQ71+qOWplzpKAHVb
         2QIQ==
X-Gm-Message-State: AFq9FYJ843xtbYyzyhxQ1VAZ7qgLoo+U2QmXQUVjFv5GIvx4DdBIMrjo
	I5oATRRoMk77VC+xM0XQ4FwPKxt92yCcAsRLjSJFhm89k2R4mAvUZCfybhW/ikg32uA=
X-Gm-Gg: AYBFou0Pvoo6rIcVwfGKMySYHPq1DBOAJKP6elH9rdhfpSPwAvGh4q8nhGvrtM9wf5+
	tSRiyvhXllXJWvD/lZzdsBhZ6Y6nGZsl4D/e6nduguPHQ1vbqHhbA5xltHTeo9d37rWFqJc1w9l
	zF6XQ3NjLKgUIe0jAY17RYow6Ud2dQvs2/Z7vCTOVP7wfswIDt20R1V8khAmsSKJja3lh+X8hTT
	9+3vPKxNjNJDwO66iTg+vREhIp2ymLitTNzifDUXsA1ulL6ZT4xPgLg3D6YBOduh0yn2cabS9ML
	DjWEvcNQBu3RksdvASeJPdnuPn0mrY5HYUOaj3zN7fB4LMnlcmMmGNiS4iY6ImrEhBNXeEvmz57
	ur7fbiq+xow1zhSGXTrEefN3wdaQD+sKs7wvcXWn5f5HQv+aOpu7Z8Oj/oEsl/Qth8e9xgR1rhs
	ee0Ii/syJK6FDaK/62aOkgo6lh5wPNAsVxQlQK8B2mdradmc2FwAybaTflti8HPLRWZtxWQs5NW
	N/KQwJNq+Rf7VO3/jzQ89tqg7bKV9uRZDdk56O5w4hO1ODLyJPZku1WCIUiJrQSQk6d8lpFwW2r
	4elHV82qlVZSG7bqPatknZFJdI8IIvKs2CdrQwt1RUQIbeb7ekTaI6lRj530X8BSxuG2EBFFVNz
	zOuV0glnjmc66guw0EJ+NcTvYDc3cIKwweXndQvP5FH/qeQ==
X-Received: by 2002:a17:90b:524d:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3adeafddb1bmr8922396a91.4.1793013039674;
        Mon, 26 Oct 2026 04:10:39 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm8023593a91.8.2026.10.26.04.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:39 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Antoine Pichot <antoine.pichot@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/7] media: i2c: ov7251: Fix link frequency index
Date: Mon, 26 Oct 2026 20:10:26 +0900
Message-ID: <20261026111032.88355-2-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026111032.88355-1-antoine.pichot@gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov7251_check_hwcfg() stores i, the index into the firmware's
link_frequencies array, in link_freq_idx, which the driver then uses to
index its own link_freq[], pixel_rates[] and pll1[] tables. The matching
driver entry is j. Store j.

Observed on a Surface Book 2, where ipu-bridge lists one link frequency,
319.2 MHz, which is link_freq[1]: V4L2_CID_LINK_FREQ reads 240000000,
and the pixel rate and PLL registers are off the same way.

Fixes: cc125aaa5a78 ("media: i2c: Provide ov7251_check_hwcfg()")
Cc: stable@vger.kernel.org
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index fce6344b51..1413f1856e 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1523,7 +1523,7 @@ static int ov7251_check_hwcfg(struct ov7251 *ov7251)
 		goto out_free_bus_cfg;
 	}
 
-	ov7251->link_freq_idx = i;
+	ov7251->link_freq_idx = j;
 
 out_free_bus_cfg:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
-- 
2.53.0

