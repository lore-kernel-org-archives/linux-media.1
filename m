Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237984A262E
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359030; cv=none; b=SJJvK0j8O9fGkLSASVGe0yO3v3xjhjdRO0zdv+JBdbYSNWnujqTcslL9501WpHTfWGO7/50WSbIlt6cldZ2PB5wVelAjDWmabfOm6vuS/8B/H+S4xJ/9vjA5hTtcasBYaFtyJLmFmpECLMtny2vhniiD3WTk5pFnk9Va2sK33WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359030; c=relaxed/simple;
	bh=7Mf6k0qVkozT4YeFG9EjJGBACApFcUwcZixfGal0Bpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GRYJr+a5DtEn5wVj2CGszF6VMt05LsBUHELmvpzr0/jwPfW+DIYQNSkfYl/ZaayV1B/XbhiHFeNfv/sBrQFCWfDQWg/0y1eE96sNLxbxXY4i35+ceH06y2mWLsLW1fiucXGrBR3BpI/AdEtRzi+GlxzAXhJ4Lj4nO29EoF6rXh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Js3cO1uN; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Js3cO1uN"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4843f205a5bso814642f8f.1
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 07:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788359027; x=1788963827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SM52+0dlyaiG6ccFqkc22ArwQiXLj4h7/RuQ4lLTioI=;
        b=Js3cO1uNRz11TcLZK+JXrkluXlYQq1MTrFceGOyIY9kGlhiHYascXCXu18wWiph+of
         h7tMOLy7Misuz5z83fDyds27/r97ylz9FO3GXRSVkGYl/qAIrRNUVWr2hQA9jzvDurBj
         5SdwA4xuOFe/fQoxuNFYx5O7J6z2Bss/hnIjySXEXo0IYk5z98pSyDMnJvoQCHYptEZE
         fZAi76f+ES8u8oVYbX8y2Um2+nuPmfeKN/5LC/q+xh8scMEaEN66Il16vcw/uzbvObrC
         j+GJkCu/b1RRP6j8QbxZt/qTHo0IuZVqw8GlBOS4Uik2KaCMpGdvfciJE/gBKIVYzcRA
         IuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359027; x=1788963827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SM52+0dlyaiG6ccFqkc22ArwQiXLj4h7/RuQ4lLTioI=;
        b=Yh6KNLsSBWbKZUDDtnHZ1xwODltU21vc3GxlgoL7RgN8yZ8+kTZbljKfQ6Jhx6O6oP
         J6a0tz0DvELR71ZNHwAPkQ7yJBou2kSSJuOE3sAFzY0w6CbcWhIqd6sHOnb8Fb0RThZW
         uuL7kTySs23Y60OoNRpHfSdWOBq+nEDoKVz1K/S4YB+MiFa8+YfpiVnc29Aq0VoYfjQK
         8X39dZvdKAiXQ81qo8EORyrioneGQWnlEoYAcWJtf8o5IyfLZwfaS//zfEK1Bi5hffxg
         h4cV3xvs4L2JQKVJJVXi3MEBvytybloqRBOEH9vKv/vbSi9HHzmTYQrxromCiZqBNfr+
         e9tQ==
X-Gm-Message-State: AFuF++mmrIdEiold//rzwKDB2Kkc4gLAKgwBSfBKQNmMIYx+Fp7c2jKS
	gEHMXtcbbJfSg20EeOEFnyKvy8IrjywZG3Dtmx391mqySyt0fUeMSwujUOpQSQ==
X-Gm-Gg: AR+sD10YToQ6S6NCKKOCOJznYfcS5nvV1IeYD+uqLBYt7UUu4VxZtAF9KBJXg0ndMwh
	mlqRO4mEgFNvVIGB8O6wKysfWV3cFpJpUI2RX4+UieoDWy4C9RnCBK7mDmaQuz750QG4cbTtET0
	QFY/YO3OlVxX2GM+C1dxwwdrX/lBRrnsoJ3QLzInrhmtHBfNJdtBG64W77gGfE36/ES+dMbHFua
	iSsFuiIjyj9U26SczcaIlQ/Hh2/PU9WY7LIq2VETlRJe9yDQH1lQE8P4yc7VY9RYKUeSuszH+DM
	X9EjK6uXJAgTmej3OwgdDfnwvwkiiJUMfXEPUEbtfd7zhWxbTfeHJL/pCLHB/HaVcnf0RKlFHPO
	OYLICyCB8Sb8Vfpo2mFAMlQOIWPbOe6DOjljZ7yEGMcUCDeg9MAdRaVvDzndxCOHi4oFMMNm6HY
	VldEQchf/vsrnWM88ThxYjGOo5BHsEDUwzFbMHTHKAUhYw5GTCZc/Uxxf1Ucah6oJKEXawh+NsF
	+Wn75zk/Qf+QRrz3UxVO8nN0Rf5XfFXP1oslHXiFaQ1dkF7qvF0tzvvNFT8
X-Received: by 2002:a05:600c:1c27:b0:49c:dcec:bd27 with SMTP id 5b1f17b1804b1-49ce57fd7bamr86987885e9.8.1788359027030;
        Wed, 02 Sep 2026 07:23:47 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net (mob-83-225-30-215.net.vodafone.it. [83.225.30.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm58999265e9.1.2026.09.02.07.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:23:46 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	dan.scally@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v5 1/7] media: i2c: ov5693: Add OVTI5693 ACPI HID
Date: Wed,  2 Sep 2026 16:23:15 +0200
Message-ID: <20260902142322.73523-2-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902142322.73523-1-fernandorimoli11@gmail.com>
References: <20260831181858.325109-1-fernandorimoli11@gmail.com>
 <20260902142322.73523-1-fernandorimoli11@gmail.com>
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

