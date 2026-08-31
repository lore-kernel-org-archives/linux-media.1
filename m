Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A684A1DFA
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 18:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200354; cv=none; b=lN9BhIWxSevvjAPAMfILiaa9vLrK5p8AhDVj8hoype7VoTBCI9NAxXS+6WAzVpbb/YImLpeHZnEzV1AjbLNvMNH667gg4iOiRzj/X3E6tThLExkE/sQ2bwOmXLiEFlG+Wd0O8Q6tfKlygNzmWH6wMlo9ysp2wuLbmzfuFkEOo1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200354; c=relaxed/simple;
	bh=7Mf6k0qVkozT4YeFG9EjJGBACApFcUwcZixfGal0Bpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GSH6x118sqcrT2/Jwgyd1grnh1gEYpJ38e0/ln0lKXMFE8S1FJt6+WiVL4hw/PGsYoOUuqzK72g/CJbsHflMnRYesJqG+wInRToYfmSVlZzq8KV5Cdmhq7qNTIIMOE7UHal5wjbyI+98YXeH3hHBw60/tCDM+Ug67s/O4C19H84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=by6AYrJ7; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="by6AYrJ7"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4843e9c5960so53359f8f.0
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 11:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788200351; x=1788805151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SM52+0dlyaiG6ccFqkc22ArwQiXLj4h7/RuQ4lLTioI=;
        b=by6AYrJ7WlEs3sQO0NeCK3zLL5B+bsrro/R7H4K2pDPD0TDuMHvoQHlmRR01kfYKb/
         rTd09bX1COsRZ3yqoU3ggSoFSEp504z6OzuiDUljS0qL6CQ/Pz5Y2mvNizSNET8uyjzd
         CqAxzqfTEWdLxMQDHr1jAKOejIPV5vAhiDYJSRnMq5Hrg7Hf3aqtL3yyvVBHpHa37iCx
         JTixCVeW8Y1UUv1rWsRvesuRUVx0E5yLyta3EGBe/JDwMT+By13bK8gNS9UhhLDsX07w
         51mH4R4eMXrfT2fjbh73KeCGtiAYt7W4LlsMG6QQvU0PkHHh0bC3P6NQ7hPt/jUF7Uf1
         Ux1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200351; x=1788805151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SM52+0dlyaiG6ccFqkc22ArwQiXLj4h7/RuQ4lLTioI=;
        b=BmlYxqN986MEUu6kJXO0R/8xLvDU4zWoo1HjEQA9+7JVUxdcQv7MhRs9ASy85RrnGY
         hJCnPblecLD1suMBwtXR8GUu1nFGybHP+xhwkewzc45hNlJPDTaHyHpxPeW++8v33Cv6
         EiZAZqqqiWuXDKFYIGWQKi/O5fG7lYLZrMN6G0b9wJ3VPG+MsVeVsUr3egXKLBKOx7Kg
         /ijoOs7UJAw5eKM/itr24LbxkMv6+7DVitX4QoV4dJFU21tQ8mO+5ehseyw8q86TS4rr
         GHKtd+qcgQR/ssRpsU/jlvI2sVv4MDRObveFFSebP2YqEWWWg4VVJwZh4zJ3HrrjaqeQ
         rNqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZjGEiARTZ+av3lfJh2/zUq5eXZbdQedsglWdRzaQ9hHhq3bkMeDIErXGj0SQzVM6V4akdjNpiVASwsQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mNgb6pZPA6VQ4GeZpSzITyhLRsNQ0QJfN5SiuR9qT9DJBOx8n+
	mBN+6l6mzSEJa9J4rzNw/kb0GD5YCm3zVpi+j4FZGjjszzJkbYaPQB64
X-Gm-Gg: AR+sD12m/YtlGxCKcRR3kn/eFMxfWJh7pbV9ynZGvT8fxdEBM5bDr2yjKP4b5f8LMqX
	DB/kPGvG0CLpgxz/fzORMTy1F2eW0oFmUqJtM7Z7kzQq7fE8iRAgngpYPmsAjOrzVtMIn1sX7MQ
	DjQb1aDtbqIkvTt1lpWb9OIzU8WcSD6Gm8ik9VAxnrNx8QS4fTS9U9zz73pUwyZqKBz0Mv4BaXW
	3JcpV98aVicGF0eVSp7ip+Aq23ldBAzS8XdY6tTczAkWJcXwbnIQbDCSG0x8QRDnoUCNRqwPbdv
	YEq9RliXtzKMv64pNGlNZPdwHljsHLHMX3/IKen5QxI+9VRoHklYs8tE8xVXDGpASSfYczBcvpo
	P29veNh3J8G7dWCiL8oOCVz9CLHLT2j3bjYRYOKWozsTwytWVJrXeBI/y0+fT0qBCvTkk933JuP
	cBJapu+2ZpI9PCtGStWkts/I5LxuP4snLcFESdVuRZh4QEh33vcyEgdPz3LPYzQ41c+gqdc/+rE
	5JAb7VBwF1WcA==
X-Received: by 2002:a05:600c:a106:b0:49b:92df:87be with SMTP id 5b1f17b1804b1-49b92df8833mr356747355e9.4.1788200350661;
        Mon, 31 Aug 2026 11:19:10 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:a74b:bc2a:bdfb:30ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e4e7sm9041965e9.9.2026.08.31.11.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:19:10 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: [PATCH v4 1/6] media: i2c: ov5693: Add OVTI5693 ACPI HID
Date: Mon, 31 Aug 2026 20:18:53 +0200
Message-ID: <20260831181858.325109-2-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831181858.325109-1-fernandorimoli11@gmail.com>
References: <20260720163819.104130-1-fernandorimoli11@gmail.com>
 <20260831181858.325109-1-fernandorimoli11@gmail.com>
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

