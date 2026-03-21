Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D102D97BB
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 19:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774119752; cv=none; b=BsJEqI5plYqC6vNec1ScVc9y/mRVcWPGP3QIFv6fYsvmCJshaDhzftnaaJte6oBTkBOU8Q4qbzCjEWeShR3+q6zfrzhBuv7rFmCYlJgLNEkz1qeHS/XkwhPV6IJiECZvFtb8QVfhrvc5cE6/nxkKHZDLwDAqQMaxAZyTGxCN9H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774119752; c=relaxed/simple;
	bh=Qsyiq9WykiVnpKymITSMP4jjqdFGUhX5M24TWtY/Dbk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A/4LAtTCyIVpEOWSoDUrS6YgaPhRi4aQRZ8oSkQnO3XHiX1s4GXTf2DkI+d5QcvAWvd2sCW8+XMwyO3+rk9K3wfH2ROV3APB/j7p/6E447B0gd8ZSc9zFW5BtxNQk7NZQel5dXKWLxZovNVUzlncZEQcQGjnjvuyZGXH/XcL70Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from wasted (213.87.139.102) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Sat, 21 Mar
 2026 22:02:22 +0300
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, <linux-media@vger.kernel.org>
CC: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Subject: [PATCH 1/5] media: lgdt3306a: drop useless assignments
Date: Sat, 21 Mar 2026 22:01:38 +0300
Message-ID: <20260321190143.21123-2-s.shtylyov@auroraos.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321190143.21123-1-s.shtylyov@auroraos.dev>
References: <20260321190143.21123-1-s.shtylyov@auroraos.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)

The driver assigns the result of lgdt3306a_write_reg() (and some other
functions) to the local variable ret but then often completely ignores
its value. Drop such useless assignments...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
---
 drivers/media/dvb-frontends/lgdt3306a.c | 102 ++++++++++++------------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/drivers/media/dvb-frontends/lgdt3306a.c b/drivers/media/dvb-frontends/lgdt3306a.c
index 03e598d73d9f..cde9f3edae63 100644
--- a/drivers/media/dvb-frontends/lgdt3306a.c
+++ b/drivers/media/dvb-frontends/lgdt3306a.c
@@ -436,24 +436,24 @@ static int lgdt3306a_set_vsb(struct lgdt3306a_state *state)
 		goto fail;
 
 	/* AICCFIXFREQ0 NT N-1(Video rejection) */
-	ret = lgdt3306a_write_reg(state, 0x002e, 0x00);
-	ret = lgdt3306a_write_reg(state, 0x002f, 0x00);
-	ret = lgdt3306a_write_reg(state, 0x0030, 0x00);
+	lgdt3306a_write_reg(state, 0x002e, 0x00);
+	lgdt3306a_write_reg(state, 0x002f, 0x00);
+	lgdt3306a_write_reg(state, 0x0030, 0x00);
 
 	/* AICCFIXFREQ1 NT N-1(Audio rejection) */
-	ret = lgdt3306a_write_reg(state, 0x002b, 0x00);
-	ret = lgdt3306a_write_reg(state, 0x002c, 0x00);
-	ret = lgdt3306a_write_reg(state, 0x002d, 0x00);
+	lgdt3306a_write_reg(state, 0x002b, 0x00);
+	lgdt3306a_write_reg(state, 0x002c, 0x00);
+	lgdt3306a_write_reg(state, 0x002d, 0x00);
 
 	/* AICCFIXFREQ2 NT Co-Channel(Video rejection) */
-	ret = lgdt3306a_write_reg(state, 0x0028, 0x00);
-	ret = lgdt3306a_write_reg(state, 0x0029, 0x00);
-	ret = lgdt3306a_write_reg(state, 0x002a, 0x00);
+	lgdt3306a_write_reg(state, 0x0028, 0x00);
+	lgdt3306a_write_reg(state, 0x0029, 0x00);
+	lgdt3306a_write_reg(state, 0x002a, 0x00);
 
 	/* AICCFIXFREQ3 NT Co-Channel(Audio rejection) */
-	ret = lgdt3306a_write_reg(state, 0x0025, 0x00);
-	ret = lgdt3306a_write_reg(state, 0x0026, 0x00);
-	ret = lgdt3306a_write_reg(state, 0x0027, 0x00);
+	lgdt3306a_write_reg(state, 0x0025, 0x00);
+	lgdt3306a_write_reg(state, 0x0026, 0x00);
+	lgdt3306a_write_reg(state, 0x0027, 0x00);
 
 #else
 	/* FGR - this works well for HVR-1955,1975 */
@@ -464,24 +464,24 @@ static int lgdt3306a_set_vsb(struct lgdt3306a_state *state)
 		goto fail;
 
 	/* AICCFIXFREQ0 NT N-1(Video rejection) */
-	ret = lgdt3306a_write_reg(state, 0x002e, 0x5A);
-	ret = lgdt3306a_write_reg(state, 0x002f, 0x00);
-	ret = lgdt3306a_write_reg(state, 0x0030, 0x00);
+	lgdt3306a_write_reg(state, 0x002e, 0x5A);
+	lgdt3306a_write_reg(state, 0x002f, 0x00);
+	lgdt3306a_write_reg(state, 0x0030, 0x00);
 
 	/* AICCFIXFREQ1 NT N-1(Audio rejection) */
-	ret = lgdt3306a_write_reg(state, 0x002b, 0x36);
-	ret = lgdt3306a_write_reg(state, 0x002c, 0x00);
-	ret = lgdt3306a_write_reg(state, 0x002d, 0x00);
+	lgdt3306a_write_reg(state, 0x002b, 0x36);
+	lgdt3306a_write_reg(state, 0x002c, 0x00);
+	lgdt3306a_write_reg(state, 0x002d, 0x00);
 
 	/* AICCFIXFREQ2 NT Co-Channel(Video rejection) */
-	ret = lgdt3306a_write_reg(state, 0x0028, 0x2A);
-	ret = lgdt3306a_write_reg(state, 0x0029, 0x00);
-	ret = lgdt3306a_write_reg(state, 0x002a, 0x00);
+	lgdt3306a_write_reg(state, 0x0028, 0x2A);
+	lgdt3306a_write_reg(state, 0x0029, 0x00);
+	lgdt3306a_write_reg(state, 0x002a, 0x00);
 
 	/* AICCFIXFREQ3 NT Co-Channel(Audio rejection) */
-	ret = lgdt3306a_write_reg(state, 0x0025, 0x06);
-	ret = lgdt3306a_write_reg(state, 0x0026, 0x00);
-	ret = lgdt3306a_write_reg(state, 0x0027, 0x00);
+	lgdt3306a_write_reg(state, 0x0025, 0x06);
+	lgdt3306a_write_reg(state, 0x0026, 0x00);
+	lgdt3306a_write_reg(state, 0x0027, 0x00);
 #endif
 
 	ret = lgdt3306a_read_reg(state, 0x001e, &val);
@@ -489,72 +489,72 @@ static int lgdt3306a_set_vsb(struct lgdt3306a_state *state)
 		goto fail;
 	val &= 0x0f;
 	val |= 0xa0;
-	ret = lgdt3306a_write_reg(state, 0x001e, val);
+	lgdt3306a_write_reg(state, 0x001e, val);
 
-	ret = lgdt3306a_write_reg(state, 0x0022, 0x08);
+	lgdt3306a_write_reg(state, 0x0022, 0x08);
 
-	ret = lgdt3306a_write_reg(state, 0x0023, 0xFF);
+	lgdt3306a_write_reg(state, 0x0023, 0xFF);
 
 	ret = lgdt3306a_read_reg(state, 0x211f, &val);
 	if (lg_chkerr(ret))
 		goto fail;
 	val &= 0xef;
-	ret = lgdt3306a_write_reg(state, 0x211f, val);
+	lgdt3306a_write_reg(state, 0x211f, val);
 
-	ret = lgdt3306a_write_reg(state, 0x2173, 0x01);
+	lgdt3306a_write_reg(state, 0x2173, 0x01);
 
 	ret = lgdt3306a_read_reg(state, 0x1061, &val);
 	if (lg_chkerr(ret))
 		goto fail;
 	val &= 0xf8;
 	val |= 0x04;
-	ret = lgdt3306a_write_reg(state, 0x1061, val);
+	lgdt3306a_write_reg(state, 0x1061, val);
 
 	ret = lgdt3306a_read_reg(state, 0x103d, &val);
 	if (lg_chkerr(ret))
 		goto fail;
 	val &= 0xcf;
-	ret = lgdt3306a_write_reg(state, 0x103d, val);
+	lgdt3306a_write_reg(state, 0x103d, val);
 
-	ret = lgdt3306a_write_reg(state, 0x2122, 0x40);
+	lgdt3306a_write_reg(state, 0x2122, 0x40);
 
 	ret = lgdt3306a_read_reg(state, 0x2141, &val);
 	if (lg_chkerr(ret))
 		goto fail;
 	val &= 0x3f;
-	ret = lgdt3306a_write_reg(state, 0x2141, val);
+	lgdt3306a_write_reg(state, 0x2141, val);
 
 	ret = lgdt3306a_read_reg(state, 0x2135, &val);
 	if (lg_chkerr(ret))
 		goto fail;
 	val &= 0x0f;
 	val |= 0x70;
-	ret = lgdt3306a_write_reg(state, 0x2135, val);
+	lgdt3306a_write_reg(state, 0x2135, val);
 
 	ret = lgdt3306a_read_reg(state, 0x0003, &val);
 	if (lg_chkerr(ret))
 		goto fail;
 	val &= 0xf7;
-	ret = lgdt3306a_write_reg(state, 0x0003, val);
+	lgdt3306a_write_reg(state, 0x0003, val);
 
 	ret = lgdt3306a_read_reg(state, 0x001c, &val);
 	if (lg_chkerr(ret))
 		goto fail;
 	val &= 0x7f;
-	ret = lgdt3306a_write_reg(state, 0x001c, val);
+	lgdt3306a_write_reg(state, 0x001c, val);
 
 	/* 6. EQ step size */
 	ret = lgdt3306a_read_reg(state, 0x2179, &val);
 	if (lg_chkerr(ret))
 		goto fail;
 	val &= 0xf8;
-	ret = lgdt3306a_write_reg(state, 0x2179, val);
+	lgdt3306a_write_reg(state, 0x2179, val);
 
 	ret = lgdt3306a_read_reg(state, 0x217a, &val);
 	if (lg_chkerr(ret))
 		goto fail;
 	val &= 0xf8;
-	ret = lgdt3306a_write_reg(state, 0x217a, val);
+	lgdt3306a_write_reg(state, 0x217a, val);
 
 	/* 7. Reset */
 	ret = lgdt3306a_soft_reset(state);
@@ -959,16 +959,16 @@ static int lgdt3306a_init(struct dvb_frontend *fe)
 		pr_err("Bad xtalMHz=%d\n", state->cfg->xtalMHz);
 	}
 #if 0
-	ret = lgdt3306a_write_reg(state, 0x000e, 0x00);
-	ret = lgdt3306a_write_reg(state, 0x000f, 0x00);
+	lgdt3306a_write_reg(state, 0x000e, 0x00);
+	lgdt3306a_write_reg(state, 0x000f, 0x00);
 #endif
 
 	/* 9. Center frequency of input signal of ADC */
-	ret = lgdt3306a_write_reg(state, 0x0010, 0x34); /* 3.25MHz */
-	ret = lgdt3306a_write_reg(state, 0x0011, 0x00);
+	lgdt3306a_write_reg(state, 0x0010, 0x34); /* 3.25MHz */
+	lgdt3306a_write_reg(state, 0x0011, 0x00);
 
 	/* 10. Fixed gain error value */
-	ret = lgdt3306a_write_reg(state, 0x0014, 0); /* gain error=0 */
+	lgdt3306a_write_reg(state, 0x0014, 0); /* gain error=0 */
 
 	/* 10a. VSB TR BW gear shift initial step */
 	ret = lgdt3306a_read_reg(state, 0x103c, &val);
@@ -976,7 +976,7 @@ static int lgdt3306a_init(struct dvb_frontend *fe)
 		goto fail;
 	val &= 0x0f;
 	val |= 0x20; /* SAMGSAUTOSTL_V[3:0] = 2 */
-	ret = lgdt3306a_write_reg(state, 0x103c, val);
+	lgdt3306a_write_reg(state, 0x103c, val);
 
 	/* 10b. Timing offset calibration in low temperature for VSB */
 	ret = lgdt3306a_read_reg(state, 0x103d, &val);
@@ -984,7 +984,7 @@ static int lgdt3306a_init(struct dvb_frontend *fe)
 		goto fail;
 	val &= 0xfc;
 	val |= 0x03;
-	ret = lgdt3306a_write_reg(state, 0x103d, val);
+	lgdt3306a_write_reg(state, 0x103d, val);
 
 	/* 10c. Timing offset calibration in low temperature for QAM */
 	ret = lgdt3306a_read_reg(state, 0x1036, &val);
@@ -992,30 +992,30 @@ static int lgdt3306a_init(struct dvb_frontend *fe)
 		goto fail;
 	val &= 0xf0;
 	val |= 0x0c;
-	ret = lgdt3306a_write_reg(state, 0x1036, val);
+	lgdt3306a_write_reg(state, 0x1036, val);
 
 	/* 11. Using the imaginary part of CIR in CIR loading */
 	ret = lgdt3306a_read_reg(state, 0x211f, &val);
 	if (lg_chkerr(ret))
 		goto fail;
 	val &= 0xef; /* do not use imaginary of CIR */
-	ret = lgdt3306a_write_reg(state, 0x211f, val);
+	lgdt3306a_write_reg(state, 0x211f, val);
 
 	/* 12. Control of no signal detector function */
 	ret = lgdt3306a_read_reg(state, 0x2849, &val);
 	if (lg_chkerr(ret))
 		goto fail;
 	val &= 0xef; /* NOUSENOSIGDET=0, enable no signal detector */
-	ret = lgdt3306a_write_reg(state, 0x2849, val);
+	lgdt3306a_write_reg(state, 0x2849, val);
 
 	/* FGR - put demod in some known mode */
-	ret = lgdt3306a_set_vsb(state);
+	lgdt3306a_set_vsb(state);
 
 	/* 13. TP stream format */
-	ret = lgdt3306a_mpeg_mode(state, state->cfg->mpeg_mode);
+	lgdt3306a_mpeg_mode(state, state->cfg->mpeg_mode);
 
 	/* 14. disable output buses */
-	ret = lgdt3306a_mpeg_tristate(state, 1);
+	lgdt3306a_mpeg_tristate(state, 1);
 
 	/* 15. Sleep (in reset) */
 	ret = lgdt3306a_sleep(state);
-- 
2.53.0

