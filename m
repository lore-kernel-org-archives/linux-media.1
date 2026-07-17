Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B123FDBE5
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294446; cv=none; b=tizIV0YmyU0yBU5UJF68Aq7xgwVMUtaWA3EFIS2MiAK+VJOYqvlr/fYMqi63CVxr2LfGgK3G1yjDNVApcEoL0ZsCvss/TdIkuSe0mixCj0ErvFCKJPcNGc4mts5EIug0tVPbYSFtkE1yZvQSyGaqqlN1c4w7yD58eCAOtLHHtBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294446; c=relaxed/simple;
	bh=7Mf6k0qVkozT4YeFG9EjJGBACApFcUwcZixfGal0Bpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YEL/CWnfNy16IIJd0T2YG5xz2gshF2EXLlvedx4DYkuVsqhG+S9JJqSWIRQLhktxCKPR7ds+aoTODcsULVbGqzKh1UuX1irAf67pkB3/HV5wqKcpiqWYfRGD0B7HTIll6wJI+OUhzHwcg4OMRGeXYM09QXv0pNpaajMiQp/yT/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BO+4oX2e; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BO+4oX2e"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49548e01d02so3807945e9.0
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784294443; x=1784899243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SM52+0dlyaiG6ccFqkc22ArwQiXLj4h7/RuQ4lLTioI=;
        b=BO+4oX2e/KCOrJPjgUqUI31hZEPJBuvJgaXw1c7pdrhJGSQNAu6FG9F96mznVCZZkr
         0JfK3ptJOUvn/ekJFUv8/N/yCstcvLrrmSbiPQcF6oeQWk3aWBTNTUa6Bgt36Mz+QVjp
         1NeHRi8qEJe2IMTafE64IOu7nldSEz4qGQPiXBGadcL2LEPBxZiuG+n0NBLYCsOQaUR8
         uDPjRSezz0EnzfEWHD16U2LqsxEVYO59pSdMIpVx7zGKn2GskDq+2qc0tWoC3Mn+Lqqq
         gZgvSjpvnIeImPo7W1CkdcFGhEsNpbP8cI90Zp/eo54ifFtIHW1Jloy9xjOwswJ4EUVk
         Abxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784294443; x=1784899243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SM52+0dlyaiG6ccFqkc22ArwQiXLj4h7/RuQ4lLTioI=;
        b=RqtHfuaWuiPDQK3om9nC6sUwquEjenfcsQsbWnmCpVMSjm6sjf5HvWPr7tRfqLOAmW
         8kRXDjdMJvPaKsltiY3qhdw5RD+vH7/ZShrmNjk45NQ/YWqUdQsHxkSGyxPLFslePBQl
         xlBhjly9YjTzYN5LvX4yig2UiASkexNGUCovpZZ23WB6etSZQ9eB5Yir8fp9ThcHwQTx
         C0bZOi7Jj781u2aD4jy6dO+F0aqKCaUg9wOH8Gs49a6WKckdb8ZiqrkdbaVAgrqbqfjA
         YqQLgSG8sE81Quat7eS9HN5ZKwaxGE3ku66gc49JBRuPpgmp7uf+h0hS1A4bRk8W2g0f
         +CWQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPOuXKMsrqO47N5VlXhAOl8n1gfh+U8P10iXoqQ9rYSj3NHKdSjUn6jw9zK45yELR56XlgQfZXWCOeWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YymxrZGiQg/lxBjcDv+ncRSaDQiN+GQTAheZOJm0RPSfKrkQArh
	dluJwqo1t72n5IcIt0wVXB7ZEADdEtLrLIzdhjBl4FpNQBHa8dTVZYP3
X-Gm-Gg: AfdE7cnw4fYBKSiKUSkgdK7MrO5usGLOzg+rnp+d13J+wAFGFFkaJkRgjC26ETZxPaA
	MJBRilLPdbFvpfo8pFUqs7miNT9RTIrKPKAKJi0+BNAv13YtYlidl89XUm2w2NpWM8UsLkW5I/t
	k5eI2FDr2XlDj3EnKO9YDegZocQsrO4WZiGeRfVJuyeOX3gLJmxJC0vLqrPCmUiaBVXSsfXdSpo
	gNC1i+maldA1CRYF4QcevPwzMroIX2I3/8kzzuWrfXa7DmYERGOKVq2lLwEX9PDXELX7H/Al9Yc
	Gl+8E7G461eJjegtcEIvDFYQZVUF8rqJK2PncsqDbdgb3sVwVL9e3hsSzFem7d7ER1hl81eobSZ
	uHpTpkA25mKks1rW4aamEoghlJ4OeW91QQjJd98KW61KpIPdDa+ELGsRQS6aYUmpLIMknmRPPDe
	2jLx6f3mCmnACwRWl9CxdvWasZ4uc=
X-Received: by 2002:a05:600c:4512:b0:493:bc4a:fb56 with SMTP id 5b1f17b1804b1-4954a50e92bmr30412295e9.39.1784294442564;
        Fri, 17 Jul 2026 06:20:42 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:f8eb:f0df:1ea8:edb8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2eddb8sm98841705e9.14.2026.07.17.06.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:20:42 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: [PATCH v2 1/3] media: i2c: ov5693: Add OVTI5693 ACPI HID
Date: Fri, 17 Jul 2026 15:20:19 +0200
Message-ID: <20260717132021.18034-2-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717132021.18034-1-fernandorimoli11@gmail.com>
References: <20260708213633.18392-1-fernandorimoli11@gmail.com>
 <20260717132021.18034-1-fernandorimoli11@gmail.com>
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

