Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3475D24336D
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 11:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857465; cv=none; b=Xc1eqZ567WBE64dovkSALWMa1IzNbx3UYSsgiwZoyDPrPg8o/cg6UnFxNqJ5+ViT5LQuJG/YwDEr8RrETI4915Gl/+imHDO4dL8zRa8WLRziE9SrIXe1bElptcfbl4sFmLukn1+JBAvMEe3OYBmm/RYxVCNY1krnwsbMjhqCfZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857465; c=relaxed/simple;
	bh=2Fbe+51I+NHaqoJEm/Ia1P/RkOrsQ8sOHQ84+D4jX5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RB6Kk/Dp8p1UNEL5VrWecLzCK8c4k6ylq1xCDkMLFoLM5R6MEYmEBv7VoOzFdz7vwP5E/qH7sQBrgI8ikhDWOKzSQKZxPxRBhisaXFJh7BMcXrl2wJWPYKxoQuDLNibH1bsxzs1NW4KDaSYNHw9cUED5TqqqscIUJzS/h9i+4N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLQ0j13c; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLQ0j13c"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cc61541f8cso39217575ad.0
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 04:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857464; x=1784462264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=XLQ0j13c0R+jdNm4NO/LnDAfNglcABMmxxSHgseCeSlGcJZGlL5qrQasaMvJcEOzcO
         M3HLrhkQDj4wXgfii32SioOJVK5gCQG27gIQkjL4j90K/lfSzIcs1iSgWVzCcUWsDOF1
         xzNBqnnF2fphATHB04/xLaYT7M9/xtaLmQsK8OKcIYGimljSJdfdyeqFyUm9Q/ZQ7zXR
         jPtDcBYSxyEv9UvGeU/C/iuyX2OW5d6p5lQ/+zHLXqmDqQH0WuHJwCWROpuCdRbT9MbJ
         gkLShUE+DVsV9fY6k7/zOEsQKWq557P1kOvVxMoCNmtwl6Lt7LD175DFutzylmXdR+kZ
         6+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857464; x=1784462264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=CeCnxeIsgJxpi+kgIQQickcP1ssCf2jW39kibSz80Wp28uKkqgtqnghn8zZyeCjx7L
         SvBdUvDfSN518oWcAazypzf6dlmFoB9Cn4U7jX1Z4byma8XN0SNclTARR0xcrw3yg9Mm
         D4CGiBbsaMbUdIQ5g+9ZG5+bMShBOeJ9anH4/X7U6Pylvm6F1ucHN54013snDai9kAzD
         pfDdzEtmQ/gI3ZESCWbaBAm9bGB5ljzlPKsWgDuOUxvQRba6VCQwK9SYPc52/KXtiynC
         Wd5O8QmrIBUQAm52yOwRk+dQ54KccTY/qbUJJkVtq0eYEzXC0Z4ngWBqxY4YszLZOgSM
         fPCg==
X-Forwarded-Encrypted: i=1; AHgh+RpcKJbpTyUckspB85hI2pGH9Cl88CopS/bOe2yIL1ExO8xCt3HjQgMAMw0z3WLorhTLyeFBcNfdodg6yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNjPA+mW3z9MofuPFwN6WoCb0xkJyAxjvD2GdZZuvckss5kN7n
	Kppl+LTWW0JNowPLrIc0rvNmVNJRqic/yJqDyWj0j78XvPYqIWaGXU7P
X-Gm-Gg: AfdE7clyrRPc0zd3/lpmBrtnBfYK8PSjGNZiDL1k44vBuE36TWDFnwFktPRsxMcKVsj
	DMOOT2uoUuzIHdKa5+s9oeSxXtI8PbOdXz15XmD9ErkTeLtAAE2uv5UTvK2e9v50lSmuELjkV+J
	y5LeEi7Z5C2mmVdUpqqxn55oREs7F9v3M21/d9sdTNAr3P5xxYR0SnktQdMgdB+xPJo4Uj4125w
	qEsPFuBmkT1jYgprWEYGxF0aH7P1JbWNoYK0iG/s/LwGURrnoo6SgSFT6kXZJnYX3xeMqJNfaln
	XxHOCwq+ql67SmVNvK4hPc/hgaJficJIkV+02p/Uf2ZdEZlIPwz52VvtsF3E4jeK+njnfRXdd7I
	shHxe0lt4AvFGU8gZIUcZ4BPtfYnNGdK1a9FfCONeGDh6+w07dLM3craTdk8CJEmYFkb5uvEGv+
	Q+qZJ2jkhKPs9yBG4CIUWmw5iRumzGg6sDRuIp622bnfHVD+9k+gRQwoB09ArS3swb
X-Received: by 2002:a17:90b:4f81:b0:38d:e397:9053 with SMTP id 98e67ed59e1d1-38de39790c8mr1551196a91.19.1783857457791;
        Sun, 12 Jul 2026 04:57:37 -0700 (PDT)
Received: from nuvole ([2408:8456:3a01:5d1c:f8f6:b057:1d4c:1d59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a57dc5820sm4833781a91.10.2026.07.12.04.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:57:37 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: mitltlatltl@gmail.com,
	Frank.Li@nxp.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	festevam@gmail.com,
	hverkuil@kernel.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	krzk+dt@kernel.org,
	martink@posteo.de,
	mchehab@kernel.org,
	robh@kernel.org,
	s.hauer@pengutronix.de,
	sakari.ailus@linux.intel.com,
	sebastian.krzyszkowiak@puri.sm
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v5 1/5] media: hi846: Fix hi846_write_reg_16 handling
Date: Sun, 12 Jul 2026 19:55:53 +0800
Message-ID: <20260712115553.92564-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260712115012.91600-1-mitltlatltl@gmail.com>
References: <20260712115012.91600-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hi846_write_reg_16() does not clear a positive *err value on success.
pm_runtime_get_if_in_use() returns a positive value when the device
is already in use. When hi846_set_ctrl() passes &ret holding this
positive value) to hi846_write_reg_16(), the function returns with ret
as is, the positive value propagates back as a return code, which
callers interpret as an error.

Fix this by resetting *err to 0 only when it is positive.

Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..7f069aca0fce 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1271,6 +1271,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
 	if (*err < 0)
 		return;
 
+	*err = 0;
+
 	put_unaligned_be16(reg, buf);
 	put_unaligned_be16(val, buf + 2);
 	ret = i2c_master_send(client, buf, sizeof(buf));
-- 
2.54.0

