Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35AE27E05E
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 19:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781812400; cv=none; b=SP/2qfzLh61CT086BueaEXpRY9JlJX90AOs0myo0PpSr37Aq3Z+LZK6pPs+e7cL6pGWcH1UrR446CyCD0UMdVTb/V0DuzBC1/l8iwCU/fXEs6TTdQFO97rjYg0PcGoJkqOFMA+xfjI6vx5kLSFHHALaLesDRrQSh/nR7vobW16g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781812400; c=relaxed/simple;
	bh=3qqsyfjpM9/WRyC3/l/UxcDv8AfMx+TXJz4tBulEa8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dh2aAVS0huiMI6n0djjlpbTsyxaLbpOI6y7Nu7iMMXn35sLJXHsmuWo3fTs12xqica/wYwrNoBN0xHrSa6EObwOO+rmKrF58EGGGkJf3jW9e1QzoE3OZ13bACTNW6UEsCqAh3yKmF094c9kaoKuf+LYVJBIjizAcue12YmehYK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgTf9jMP; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgTf9jMP"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4602e2a0372so1097956f8f.3
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 12:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781812397; x=1782417197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o29q2K6kb6pkDLTzz1pOhi24t9YwzsE4xSo339SCl4A=;
        b=PgTf9jMPOXf98+euj6zr4ePCk6+EyYtuI8DxeEwZOAVnW3wjIGNNDdcA40DtbWC7Uc
         LDMKXMrnhftBvFw91zjs/BdhAenvIlhEWZr0KpCALMMFkV/pZ8UUQJ3ShsaO/LQbU6I2
         GUmM8Iml4k3YqyF0eKXzWbParN+tU8F/75n6x78wp/TsiHG1z7U7NVCZeeWqfpXXd8ZS
         9JNBnbUzYzPZZstzl5eGyW9CDseEx39Zb88lCOMlPXWMfXOSh4mB/+qV12HqZEX4rSbk
         QYC8kEcUCGFnJwy0dFyCo6Nkm/fNE5S2g47CSM1Pam/5DLGdT6k1avTDd82WbQvokup8
         uBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781812397; x=1782417197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o29q2K6kb6pkDLTzz1pOhi24t9YwzsE4xSo339SCl4A=;
        b=WwMR7VKxxLz1jw0+g3NhoR3M/X4WMg2slvDYd+Wpd42kQSGiGTO4Oc9sX8d4Ty5G0Z
         Dp+QRmSJuIeVMyIZxzmgtY3/iI46ICgyX5GrZT5MU41+4M0U4cFi8MZfM7l3kOFgGKkS
         FacDc1GjkUXVIoVgtA7mmbS+Kty+uQImezvlNIUGqPWBNdmBzglBtnukG40P3gHGRSBp
         z7dLw5nt+DbVaw0BtnIVblKv48iWOUegj6CdIicPHdrUiB3IICxG7Ix1uHwhlUgYOSom
         ohdZuvy/PdjDf9l2OHiO4DdYyooy/HJLjEL/nR3JGkWZX+FtCgvjtFfQdYrFo6kzrzQ7
         1ACg==
X-Forwarded-Encrypted: i=1; AFNElJ/7SJX/yDBdV2qst0hL7Anpsm18+kxloGkphsYo7NzRqObUbq4fDyFwZjlTSHiUYC8e6x5pI0mqEaC86A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjO0jZu0FU0wDqOXhjHE1j4BCHieaHrIYDQuga2CcyFm7gMfYt
	WM2i7S03LRV2kJuU140JqTiMSQo/AexwZPGf+GutYBx53+dyOD1dlDZA
X-Gm-Gg: AfdE7clhK2j43GoKH2OpZcBrLx422avhDIpfByEua5tP4e4lmkQ0SN+hq+w3dtk8EkN
	/6t4D5MufweVWbfWGacLVV7g2WdNHamHs+a/FWL/Wft/CCE3gg/WXE6v05eKrMIf6DNb+IdGKF0
	ji2hivG5IGu6h6d7X4thxIsckgkVjtzwntFs29kFK0EDPeayqVaWgcyNAhn5dS8SYhIGYnpV45E
	j7szl9e7A0RQTw3kvhMv26HJdVF55aOU6flYL9lWbYZY39SbwLgvXSg89UwvklEHXQ268V6iwE9
	hywSjrAew1l8CTz8GUMSGUYZy12xIvUKFoXQEK9616sI2nT00pQvTVJW5Jp6Dydrz+c/y8ZO3HK
	IBQ6yuqX0F8uNyT/Ou/RhUZ1TlKsvVINgC0WPWFOWZnOiLX+OA502Oepdnnm7FE2UdoUdy39ckG
	0vzt8H0/+4FjuVNpiPRZ/iJLHvINc88XYbxWhofTqXz/2T+KzOmiuHeStu9qf95HpsUuIoYawU
X-Received: by 2002:a05:6000:18a3:b0:45e:ec27:b4b0 with SMTP id ffacd0b85a97d-4650043991amr1665603f8f.18.1781812396929;
        Thu, 18 Jun 2026 12:53:16 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc41d01sm1288198f8f.25.2026.06.18.12.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 12:53:16 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: mali-c55: Fix scaler factor overflow for large crop sizes
Date: Thu, 18 Jun 2026 20:52:54 +0100
Message-ID: <20260618195254.139712-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The horizontal and vertical scaling factors multiply the crop dimensions
by MALI_C55_RSZ_SCALER_FACTOR, a Q4.20 factor of (1 << 20). Both operands
are 32-bit, so the multiplication wraps before the result is stored in
the u64 scale variables. For any crop dimension of 4096 or more (the
maximum is 8192) the value overflows; an 8192 to 4096 downscale yields a
TINC of zero, so the scaler never advances and the output is corrupted.

Define MALI_C55_RSZ_SCALER_FACTOR as a 64-bit constant so the
multiplication is performed in 64-bit.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---

Notes:
    v2: Define the macro as a 64-bit constant (BIT_ULL) instead of casting
        each multiplication, per Dan's review.

 drivers/media/platform/arm/mali-c55/mali-c55-resizer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
index c4f46651d..6706939b4 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
@@ -15,7 +15,7 @@
 #include "mali-c55-registers.h"
 
 /* Scaling factor in Q4.20 format. */
-#define MALI_C55_RSZ_SCALER_FACTOR	(1U << 20)
+#define MALI_C55_RSZ_SCALER_FACTOR	BIT_ULL(20)
 
 #define MALI_C55_RSZ_COEFS_BANKS	8
 #define MALI_C55_RSZ_COEFS_ENTRIES	64
-- 
2.53.0

