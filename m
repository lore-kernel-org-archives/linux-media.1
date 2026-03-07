Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6127579DA
	for <linux-media@vger.kernel.org>; Sat,  7 Mar 2026 21:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772917454; cv=none; b=Z3cBbpTyrdZlVfFSwfGptbrjM4krDJHJaQJVcwVmf+PqywaBugmRhTu5uWMZBn3aK4D3VGSWwcMBlIzcv9OlqgBFbpUcYyhOpvqkQzRPGZz5xupsKvbESXZZnjlWrCL9p+GBQzshpN0gd9dyRxNUPL3b3N5813RXuMVlYw8p0H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772917454; c=relaxed/simple;
	bh=9Exg2USVLa4xlv4w7Vw8HDXr3p6qjKZogGGviGgbgOI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jx4A8my0hJxvshoKEzufmMj6GINPHV9Fo2pzI+WFV7AgZCMxPtPjzIdr2c2HkvM++pV80ZxwnF3MQhf9JSyHi+gktnhiQjvxXXFik3km5EazUxRKk+PsNiyeXQrZvcdNqovfLt/k5shZtIhbq58kDQYj9F6zEoEEsZvrLaHIWOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtsuS63a; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtsuS63a"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8299f1ca894so1072848b3a.2
        for <linux-media@vger.kernel.org>; Sat, 07 Mar 2026 13:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772917452; x=1773522252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SGXhq2UxUJDL3aAv90iI2xuTf9Opn9T2dvuqIOW5Q3g=;
        b=AtsuS63aGNjiGEMVLx7voRmYFI/PLWixO+Fj0B4/BOXsbd0JA/yTWk40ER2fV5wxYd
         O444hkjAycvJ4eZPjU9NpdB/q7cjohmmrZyEPro0D9jBGmjdF9kqaV/jhjRWh208V82J
         VlpHZrjaqd/NwdDW8qBm25y8r1aioDvD9n8kTCSMCrgDabRyVgSaGtboHt/9Jq8QtFua
         4X3gcRHvgwpXatZ6vUal50VOKJ68MiyxZOPpvrcC1ZVft2EWVed/byEgVHusBbGnVpxR
         Mn0XQrUf/dVOINX3FFmux30kwWR2945lbjdJS1nFgzduh2MmOxT25hdRI29QOjEgQBu7
         b53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772917452; x=1773522252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGXhq2UxUJDL3aAv90iI2xuTf9Opn9T2dvuqIOW5Q3g=;
        b=FFvYnsiv6wZgNLJC4YZDAzV87qU9kX21630MNcVMXDtRazHrNOUd8bSGMVYWeavq7n
         IdGdLVgXqDzuU7v60UJT1sEf7aTcac6LliLxe7PCdrPe3UJ7c3dmK049+HWbkspexSzd
         lGN20sJZRsLOm2TWXPq6MMAhguNnqdXEZpPuUshFyZ3RN9yUcNgyhoNbHxr4QWMI3BFn
         vrNVqfet8o3DJ2ay4V/jFwuxatChETeBk0q4ik5PLfJDd072n5YmqsYuNX72mNBOhscE
         Qwwh53suid73azemSdNvYjDDvPtAMUFK/pu7fEleR/+DRQLWIUmDynuDcO2VcdhxfkgQ
         zD0A==
X-Forwarded-Encrypted: i=1; AJvYcCXv1P4BcVHVl+xSr4klh9hCqMthqaYO48Iz5tlW8W4EL+FcrJmiSvaIhxF2EWh9c4kuiIHUUWMwSe9yXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc4tfwSExxpGdtUi3kY9IKvZ3xnYRJpAidWwv8Wr20++IrDrp7
	BWc1xWhD8wHZHXQpBnmvr/I8TclYyno+3ZxsTK7foMqxI3gb8VIetRSq
X-Gm-Gg: ATEYQzyILgt3bi2Z9/q975y+el5toyy8Gb3N9qlZZ3xrSh3Aj2svy7jcJ6NrNasnmKV
	m4K+CK4LbBYEosflcoWrzY2vlT5YYd+vXgM99v6+dKKQAK80LG1gN0OkYl/Zimv3DaXgukcAXO2
	3VbOheViCkmsHxLsq8xeSaYloge/eP+yUFkDIbYd47hSokzeUpiCTwKK88A3bgg7J33ZgOgQSuf
	u4KnG/3Z55cE36O3CrYs+zC3H9boNXkU9MvAwGoTruibzMR+T248sQgMbhf4yRWkxTVy/LulDuo
	M8yaG5MN/2kEwwLn6fGTuO2CZiIPQqeuO5x26VMUgC25JwtYdDPYjVV68/R+dexRc6KkFD8lO/R
	U4Dr/EfdBPQrgYRRrFYQlE5mpa/uJ/zpWR89aHMW5Fp8nwvlocXRTcffpFcvUFzZEEEmwdaAP+s
	r7MVMFoQ7qoJ0t9tBjtcQ5Hz7EsNrINsAk8Qh2tC2dGhARqY5HmN9R+r1g+Gg=
X-Received: by 2002:a05:6a21:9cc9:b0:341:5935:e212 with SMTP id adf61e73a8af0-39858fd5915mr6251896637.18.1772917451630;
        Sat, 07 Mar 2026 13:04:11 -0800 (PST)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e182d72sm4840124a12.25.2026.03.07.13.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 13:04:11 -0800 (PST)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: mirela.rabulea@nxp.com,
	mchehab@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH] media: imx-jpeg: convert kzalloc() to devm_kzalloc()
Date: Sun,  8 Mar 2026 02:34:04 +0530
Message-Id: <20260307210404.1428894-1-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

The driver allcoates memory using kzalloc() and frees it in the relase
path. since the allocated memory is tied to the lifetime of the device,
devm_kzalloc() can be used instead.

Using device-managed allocation simplifies the error handling paths and
remove the need for manual cleanup.

No functional change intended.

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index b558700d1d96..bd4b5f08a85c 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2200,14 +2200,12 @@ static int mxc_jpeg_open(struct file *file)
 	struct mxc_jpeg_ctx *ctx;
 	int ret = 0;
 
-	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
-	if (mutex_lock_interruptible(&mxc_jpeg->lock)) {
-		ret = -ERESTARTSYS;
-		goto free;
-	}
+	if (mutex_lock_interruptible(&mxc_jpeg->lock))
+		return -ERESTARTSYS;
 
 	v4l2_fh_init(&ctx->fh, mxc_vfd);
 	v4l2_fh_add(&ctx->fh, file);
@@ -2246,8 +2244,6 @@ static int mxc_jpeg_open(struct file *file)
 	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
 	mutex_unlock(&mxc_jpeg->lock);
-free:
-	kfree(ctx);
 	return ret;
 }
 
@@ -2754,7 +2750,6 @@ static int mxc_jpeg_release(struct file *file)
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	v4l2_fh_del(&ctx->fh, file);
 	v4l2_fh_exit(&ctx->fh);
-	kfree(ctx);
 	mutex_unlock(&mxc_jpeg->lock);
 
 	return 0;
-- 
2.34.1

