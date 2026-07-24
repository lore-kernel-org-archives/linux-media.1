Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D574036308E
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 04:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784866466; cv=none; b=Tmdm2u5iSHEYU2VvTdFmaJ27FbbugTVIFgZt4amP6IuUe6H1FpU0iYuAPbGkkbMUYLcXOwmnc1stiy/Sf1MGuc/Yf3ElPpSfeisIZdvxiBaM7YUUFEqEXZWspI+kKNf+v7+S33URjKlic5bDvZOyIWAWIofdQ7gJXzf5gv6k0ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784866466; c=relaxed/simple;
	bh=tb7LJRwhFKQIMZEc6WXlcZXKcn0QsC3CujOv4fzGNQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IZJeKgzWVXngcrA4iWx88pkkJCYzg7DD6336Xatx4bR8QKOQLgwE9X512FN5QVenevrnCIZGSA/VWJPC7bWazf1BJAeA4viyFvgfUrf2RZP2+4rIlv1aikGEM7btAboL6/tndiFszpWAe+hES78oQ/nF+TN7MdJR+CSUQpnp25c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7YHoCGx; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7YHoCGx"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4956869750eso5255e9.2
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 21:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784866460; x=1785471260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+CMdfBeyqiMFs/ZMRXbCFt3Qfbb+CwGIeVxKI3ayU34=;
        b=a7YHoCGxJF0wYTNZJiSn2sjehSZGWDD4/FPPIrn5RjO2IsER/GTZ9CJPwCaOPas0+A
         jHO3i/jE/nSEkqTrarLLLDXvD/7otZxZ0B+XT4vPpoCp6sHpkqOa+0gFP2twk/sf/Fxz
         YyXG4UFCoEw6MM1m7exg+QQS6386jmeZ+Eu24fYxTcLtviprbMFgQW9kAsEr02KX0KuB
         edVQwCHwA8NcrkEQwd7E6cZ7JPokfWciibcT5JeCHrXjCwoYlzNw9luBr6/OISAqJdg7
         QhbyRPyHleQHGjGc/2zQ7Emvf9P6+n5tHgtdIYghXAOi7ddXH4L6hAA2uz8YVdT/PRDZ
         cTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784866460; x=1785471260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CMdfBeyqiMFs/ZMRXbCFt3Qfbb+CwGIeVxKI3ayU34=;
        b=TEEUxvGZUWU9b5fH5jTKtyI1tee/vrlgCUKr/iqZu/Mnd5tbF2zpzqVou5Y/9Hlyss
         Ux3ACzcvTnzgZmRkK+2AgwZ+AIp21MbQwPE+ijgMIhjzO/X4qMZp7XvxoY4UkPHhHw8P
         VKjFGMPbBB4Bgit5sUl9uB0SOLvrvOsLfKAlL/DtCQN6/0/dlB66faQtWURVIAMKifSo
         DnFO331sV231M/kyhqU2O5WBYplcHJR9cAnOJt0lxnNbmtAVYNtFU3+f4ha8ilpzZkja
         WAPTd44QfgAl4kcK6SaT0mJKDd648hU8EsLuvgrAoEj15FCGF7Yo5olvdeKnBvB7pgYu
         bXAw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4IrSZdPF6jiZHGm946SHCn51LorS0r6uC40xMEfv5NbP7I8iJCiVCEshJLszGPH4JcFrRniKFVHdvlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCUT3+ML+S6cxGG+6ysvE9382GzEejZyg439Yd6MafOCZfm5J8
	14nbY4LJe8mz0fEWNPHAedSnpmjumhQZ7UUdzpwH7qj/VTXLvaLgBJY5
X-Gm-Gg: AR+sD11dOnPCJBalstoHuSpwudq2Vwam3GtBBJpQrCfPq++7FzmwY4feim2P6cs5Dii
	EfRUK8FktKoLy8n8DWCkOjxJKzTBfE+n+eKprtMRXWT8+xewTO7Rt27CieusTZxRsTBmr/GfSG8
	eTXrAbgw1KHXlJyLB7TtMKfF9ckzUAWTIBp17SemcmDG3jqqeTTSzToNUeBXF1YgTX+1PgkILSg
	+e9G9gtolcvO9tkworklABTBItnca9k5CXsMFEJ2erZv94CDWXs0vCZs8eUvemFss9MgTMO/KRL
	O15nI6MHKvobqYAqs4v3tW/xm0z1G9uemwJSBQh8g2Lf7ptk3h9U8ZoHB2KX6L2Xh9YQw5AXHZ7
	GGF06q2OaqeoYAOa3oY49639r5og0KdclW6zKlU7EkKpF6EOfEhzowovvSxP2WAkL3YK6waZh1x
	EF+nPuQlKz3YLOznNUtEO5hDyss1Gxdb+2ATqr06RnFqXVnJtkjAZoG3g7aAWb4/G2WmGgeEqH
X-Received: by 2002:a05:600c:4687:b0:495:5dcc:52ae with SMTP id 5b1f17b1804b1-49573cc2eb8mr66808285e9.3.1784866459843;
        Thu, 23 Jul 2026 21:14:19 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af6adbbsm38761435e9.6.2026.07.23.21.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 21:14:19 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: hpa@redhat.com
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	tarang.raval@siliconsignals.io,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: i2c: imx471: Fix uninitialized error value in imx471_set_ctrl()
Date: Fri, 24 Jul 2026 05:14:16 +0100
Message-ID: <20260724041417.9921-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The exposure control write passes the address of the local ret variable
to cci_write() as its error pointer while ret is still uninitialized.
cci_write() returns early without touching the hardware when the error
value it is handed is already non-zero, so a non-zero garbage value on
the stack silently skips programming the exposure register and makes the
control write return a bogus, possibly positive, status.

This path runs on every stream start and on every exposure update from
userspace. Initialize ret to zero so the exposure register is always
written and a correct status is returned.

Fixes: be1589e567ae ("media: i2c: imx471: Add Sony IMX471 image sensor driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/i2c/imx471.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
index 6d358b11e96d..5aca5f2355d6 100644
--- a/drivers/media/i2c/imx471.c
+++ b/drivers/media/i2c/imx471.c
@@ -306,7 +306,7 @@ static int imx471_set_ctrl(struct v4l2_ctrl *ctrl)
 			v4l2_subdev_get_locked_active_state(&sensor->sd);
 	const struct v4l2_mbus_framefmt *format =
 			v4l2_subdev_state_get_format(state, 0);
-	int ret;
+	int ret = 0;
 
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		s64 exposure_max = format->height + ctrl->val -
-- 
2.53.0

