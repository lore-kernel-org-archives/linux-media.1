Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E663E43D503
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 16:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784565518; cv=none; b=GwxcInU75dKOPhqIE2ZUAF+vAl0iivbOwta7cGu70pHW0bDCOf8l4l14M/EhWzGlgEIPhXuGSxHwSZ4QAoOZCcrJx8hgxYivzE9oRtn08N9TeJniJ4F8s4u8fFvNe60OhGewBfgcyf1ffTtTbS/+EUn/SggzCgWSGL7JAU5qj1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784565518; c=relaxed/simple;
	bh=7Mf6k0qVkozT4YeFG9EjJGBACApFcUwcZixfGal0Bpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jkAQx3zWThgQLLjtTmx3/5c/6b/LMnBJcLG68xXfZJyvEc06pazYTcszdcoZhns5KmYEOZqeCGaKjqS0fX9e9INiQ1PVmINNuqW86Jc0ou9JdmLGu99XxtqMNlolvRTOnviuXe30w9Ta+Gfp5aEwr5CwD9YfLctqrdRX+zTnf6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQu4knwI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQu4knwI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49557167508so19163895e9.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 09:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784565513; x=1785170313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SM52+0dlyaiG6ccFqkc22ArwQiXLj4h7/RuQ4lLTioI=;
        b=YQu4knwIFM+4jfXjAXuRlRWeUSyN2Kw/GHWtvE17lH8khCa7g+Qk4GdChBt3d2CAtn
         MblEq5RTBVzIDsA9aIs+O3OBwRnmtldpcuW3cMerw19V2s6XI8sptqtVsybTY4XyaS+a
         T6rv2v+mxurz/IPNYOGxMjR3HiJgD6oOt6+ND8nyrn27nBCQEoJBoLKROJ+tABlkQoGO
         wCV4oPav1XYaQm8fFyVpjcEMvyCatWka5z6Xfvr9t+4Kh2ggfV2+v3JS8gBsIk46uzW3
         hWWH+TIlnYXRDJV6IqVd4qomKRVZ0+yRVsZgOMd5p9f+ZnR3nv4l6vC1QHgbwl8R2kdr
         v37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784565513; x=1785170313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SM52+0dlyaiG6ccFqkc22ArwQiXLj4h7/RuQ4lLTioI=;
        b=f+uI51WBk0oQsU1GIC/lcSFlvVc9QekrwfeAycvjKGLe8QQPfv+0T2AGc7lM43iD6c
         f055EBBHU1M3S04gUxC8mUn4hIvQKMEMC9jj7lCxpIZZmTy3jSprSdOU7LCbhDnj+8Nn
         Aks0j3IYghHS1hcWRNuW7h0uVoie+ZoaFccaCgXYwvj33trs22+6hr8DZ5mzz7zidDLC
         f8lBpOCRZxxdt0PleiUOUFdjEHVHDkq/tun/7KRxN9OYUTN+zPojuTgmLsfLbP8XuafA
         +Xo5A31HvkUof1O+GXnzFf88fng1Pm/E3wxvAJjg2eBR1VfJvie9L1DxKrN4JZHwfd/1
         4M9Q==
X-Forwarded-Encrypted: i=1; AHgh+RpoxMLBu06HqFTS/a9t4kr4R272/CtnuGo0SwF2nUyof56Enuu/dKQECzoApwUCWWyLAeZ/zIG0ZO7s4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaRsfjPeiLUus2582BpgGNFdaE5NCoJmFiIRuEuN94yl22FeuK
	Go8eUOR3Jz9ocP6Q+VPu4gYruol/xvL3kEz4kB4fmDVcIsvmj3pJAYtU
X-Gm-Gg: AfdE7cmzyi7Ib6R6yCNWNB0Rs0c9NU0gQoKsGPN+E5rH9TluR6KNxecf9+CFpUbTGJY
	Y5TvDdNXaJN6BibwDoVc+wO30um/IiZpusaiVQ0k91uqwDjsgOhG6N6nih0y/jpteer1/ijG35D
	Oo9ZsG3UqX58kEpL3RhYtpNwzLfJ/wj9btBn4GGqRPWQzFVLqMdooYJb/f8oWnsWf0xhiuyfugC
	r/wyae4rqoSy47Sxs9uS//3lSoou7rELUMhvNrZ90rNdmJyYp4YLoA124EgZM8LJANiLKfHlN2N
	cQgy1FuvGCIP8QF9XHv5zwkVLUNcOFpbA8BUCGiQyBXJNqICr5nz/4AlNmw4bl4Vl8TBb4s6zcx
	K+BZYAnCt+RX8mSVSFEpyhHGOzsDIuEiKrKfstEYlHFbMHMoebFEBkT3VrF2uLqmHMc7SuT/KXp
	h8SI65WJrOauMoNLmJcWwj8cM7xuhUKBRo7ALPUw==
X-Received: by 2002:a05:600c:1d15:b0:494:ca0e:880a with SMTP id 5b1f17b1804b1-4954a3e4855mr173992715e9.12.1784565513146;
        Mon, 20 Jul 2026 09:38:33 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:4352:bba7:6d7f:5f92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49565373608sm2105325e9.6.2026.07.20.09.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:38:32 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: [PATCH v3 1/4] media: i2c: ov5693: Add OVTI5693 ACPI HID
Date: Mon, 20 Jul 2026 18:38:16 +0200
Message-ID: <20260720163819.104130-2-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720163819.104130-1-fernandorimoli11@gmail.com>
References: <20260717132021.18034-1-fernandorimoli11@gmail.com>
 <20260720163819.104130-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ov5693 driver only matches the "INT33BE" ACPI HID. Some Intel IPU6
Surface devices (e.g. Microsoft Surface Pro 9) enumerate the OV5693
front camera with the ACPI HID "OVTI5693" instead, so the i2c core never
binds the driver.

Add "OVTI5693" to the ACPI match table. Devices that use "INT33BE"
(e.g. Surface Go 4) are unaffected.

Tested on Surface Pro 9 (IPU6): the sensor enumerates as OVTI5693:00
(ACPI path \_SB_.PC00.I2C3.CAMF) and binds with this change.

Link: https://github.com/linux-surface/linux-surface/pull/2171
Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/i2c/ov5693.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 4cc796bbe..02236f3db 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1396,6 +1396,7 @@ static const struct dev_pm_ops ov5693_pm_ops = {
 
 static const struct acpi_device_id ov5693_acpi_match[] = {
 	{"INT33BE"},
+	{"OVTI5693"},
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, ov5693_acpi_match);
-- 
2.43.0

