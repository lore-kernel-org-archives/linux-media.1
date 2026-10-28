Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186523;
	b=f9ffs2UnDxdI3fPGlEg5NJrhCWn4DvDw++qpEafY8kMgeLCX77SK+4UMU7y9QSyyrupK
	 IOwzcEPI4U1NkV1EOeEM+bV4abMdjWzO8gD2MeiWjyvidbaWnaIjWqamwm3auZxDpGSp2
	 GCZ1zdy8tyCW+J370UHMbM4NyUYqFK4ii8+FZQkbL2m8rq7JH1Jx1omETwOb99scKLxA2
	 PjYEqLJ6hUPZkDdtE3uJO90JqX9P2rRJufQfcGlF3aPi+eCjm3zjHlAAzqUWXmktPp4jS
	 12DCy7w76JNB0jLWjsD1/Vm3Ndspbo8xMad8r31U7RkggHbFL69+/V44ZBup44x/LKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YZt3QP8+mi+VPf5GhbK5xfKxIiB6KJlPF+IJ1iRM9OU=;
	b=fbNZkkGFaM8WfsC3SWrLBUcrTbMQ3A/yliDdzeJsY0b9BUxG89fH4nyyzlxNCggI/HOL
	 h+2VdcIo2UN5w/Ls5+d7pS9PZpxfc2QIHgggg3fX2MO3Aigh0S3zcSnJgdWJJvoLAO4NZ
	 fR/Bt0emS/AWMY7A/+/DWMsXUB8UkvXZY7Oini7jNGDMlYEzVRsC6U64ZDORPxfaeEJ2l
	 jgeFJ22rpOH59rjfJ8WnLPk1NpprJfqPU58kodO54l/r0+yp3qAttY/iN06cDcMTL7hrg
	 mRzZR7qXDKVL6E/UMlQHo1rzATTNiTe1o1WKhNVBBhYJbA+1ei+1Xx0qSUJp3+HfW+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cr57bwch;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5201E606A332
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 11:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5201E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cr57bwch
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e9ae47b00cso1345365ad.3
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 04:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186522; x=1793791322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YZt3QP8+mi+VPf5GhbK5xfKxIiB6KJlPF+IJ1iRM9OU=;
        b=cr57bwchlryahrYxmNM2IoqPJ2Q1T9K1P+TYBPbvlnRmohF5Z7bJDwV9TpkzIlZwO2
         ZbUyZLrP9t6ilN2/MGN016dF5bOAlTAhs22bhG4OLIs4qcaHQ71fLB/OAvF4Kp0NyUdS
         34EveiuL6ccRDMdenmBrlRJxhoWjsiZv2uahLIUaIh6WNQRe3JuX+17uXOZss7g2joP+
         bv6Be6vCb6FvTV9yVA+FT+Llt4sgyA3LrJc/oNNEJgw390LqDVYQdnwqFAgySeXSpgw7
         GM+Zeo06Asi8oqJ0KmFm8Ge6gRuvZqRd4R4q6+93svq3JUtSQmEQlJi6Uil7JUxrCnGl
         ZVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186522; x=1793791322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZt3QP8+mi+VPf5GhbK5xfKxIiB6KJlPF+IJ1iRM9OU=;
        b=LpOBqef/pGrHCnPISoR2AuUKvkbkzJVwO4Wsh7DwnaixY7Uk6tYOweeQ/NqTWSmo7q
         cV3NZPioj6Z0gsxXB6nhDZowW1bwrBVI/9ml6ac2vpC3AyrQm7hAZjXZooyO1tGIiQix
         kVn57aDJTdrS2eCasPJImpsynFJwZCXRc/Eu/1MJkFna6GcJYKFNsBTGtclSk279K6xm
         FbpWRiu+wXCBeLMklmoZfuDrYDhlPC5TDs/wj77wDVHWuJqusoCc6g/CF059HEXTLL2L
         AY5daZ5nP3R+ofQCCoPBJZKpt6U0VA65mdSVOeny8Y33fugezFTCN1Or3sW16AkE9iSy
         mxHg==
X-Gm-Message-State: AFq9FYJ3Yp0Hd0LcC/wGyRPrKmDDrv0TaQ0ONJEsyJI4BQVzSXR1aLUz
	Y3y7GK7zjYZEL5WFlEmI/vo6vDV3Fn+6FEQ4gc3U2WWrD8TLoo8BVmoHApbCX3A8GDw=
X-Gm-Gg: AYBFou25pubXI3deAWh+EwuC5IQDV30lCezab6XGz+yTxM3f3Ltuo77kab7qMW3Y7iO
	c2BN22bkZVBqbQjNQpY0Q4VXCbBCghe3uGqzurJjb+Ma6GBHqPYwan9zKsEcjAKn33KaJ3gX/4p
	QNzKjtdoQoe8lbw4ZXhu6RBGorIdPuJGqPrv3mEasmAZHq0UKLzuxtvWPDqzVToUdBKF56dNfAI
	XQfqUjbyKNxGtxwWqpAwycADSg8ePTxqucBHdUhCD6snSeSNubDMxoiW8IZU23Ue3LObXf/gUu6
	KGUZi9JSoVc0lm47bhS9+pudRLwY7YCLWtbpNYizsLnI5y06tdvfibhtkzStdWvbuKijrnVybdz
	MGLXNsEedgqKk3mC2VWI4Yj45S1ethjQxSTIIcBr9RgegnYQBH3X6XKI/X0WN4k/IK9+pCq7ZvV
	Xb72ewlHgZ+BB896tCgsp0nz1QariUTljRpM9ig7n5ljSC+0l97LrRgfsXs3LoVxhsXzK7cat89
	TYUCfWXFfB+lKoKsmXK4qkFmttCtGnVlDa/cnpOTrHCIF6tjhrxojr7Ern3JLuU4mrXwvyMPsK8
	36DPzlPw7F1rj1hQGY8OirptvRFp9f7tprz8S5OjDoNw9bPd9AXq1SVjIZj4yBlIwlPdVZihrMO
	5/wvqCIPWS0CrpUjBDiOug2c8l6pYHBrXj5cFWFCf48w+6lr3pB+T5aSmIMfGRIAA4f405deaiP
	Q1jI0lGfbtpH4hmP6tjKM=
X-Received: by 2002:a17:903:46cd:b0:2e9:9263:a58 with SMTP id d9443c01a7336-2eb0008e281mr37278295ad.1.1793186521680;
        Wed, 28 Oct 2026 04:22:01 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eafcdb52e6sm10157945ad.74.2026.10.28.04.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:22:01 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/9] media: i2c: ov7251: Use in-range PLL1 dividers for the 319.2 MHz link
Date: Wed, 28 Oct 2026 20:21:46 +0900
Message-ID: <20261028112154.855185-2-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112154.855185-1-antoine.pichot@gmail.com>
References: <20261028112154.855185-1-antoine.pichot@gmail.com>
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

The 19.2 MHz PLL1 table for the 319.2 MHz link frequency puts a
pre-divider of 1 before the multiplier of 133 and a divider of 4 after
it, so the PLL1 multiplier output (the VCO) runs at 19.2 x 133 =
2553.6 MHz before being divided down to 638.4 MHz. The OV7750/OV7251
datasheet (rev 2.12, table 2-11) limits it to 300 to 800 MHz.

Use pre-divider 4 (register 0x30B4 = 0x04) and divider 1 (0x30B1 =
0x01). The multiplier output is then 4.8 x 133 = 638.4 MHz, inside the
range, and the MIPI clock stays 638.4 Mbps, so the link frequency does
not change. The Windows driver programs these values for the Surface
Book 2's Windows Hello mode.

On ACPI systems this table has been unreachable since it was added,
because ov7251_check_hwcfg() selects the wrong index. The next patch
fixes the index, so the two must go in together. With the index fix
alone, a Surface Pro 7+ (IPU6) had CSI-2 errors in 7 of 10 150-frame
runs, 3 of them stalls; with this change 0 of 13. A Surface Book 2
(IPU3) streams clean with either table. Dave Stevenson measured on a
24 MHz Raspberry Pi board that the out-of-range tables miss their
nominal frequency and proposed the same values. The 24 MHz tables are
left alone because nobody in the thread can test a change to them.

Fixes: ed9566ce1946 ("media: i2c: Add support for new frequencies to ov7251")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/linux-media/6ae0e944.b6db0abd.16b13d.d261@mx.google.com/
Link: https://lore.kernel.org/linux-media/CAPY8ntBFJJPg3y46gC=bNq_55QifC7mKmeq8+pAEDVN42fGUXw@mail.gmail.com/
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index fce6344b5120..f429de5f1f7c 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -174,9 +174,9 @@ static const struct ov7251_pll1_cfg ov7251_pll1_cfg_19_2_mhz_240_mhz = {
 };
 
 static const struct ov7251_pll1_cfg ov7251_pll1_cfg_19_2_mhz_319_2_mhz = {
-	.pre_div = 0x01,
+	.pre_div = 0x04,
 	.mult = 0x85,
-	.div = 0x04,
+	.div = 0x01,
 	.pix_div = 0x0a,
 	.mipi_div = 0x05,
 };
-- 
2.56.0

