Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0908F33D4E8
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 04:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789705193; cv=none; b=auSrebZV+NLH2Z4HSVVDgfYC5ZWdaTFmYfdsjEEP+tvG3JwC7EBaMgcRclEJwURoh7KC0zEJa1ZITCwTulFmU0Ic0rWC4zWQSJXh60Uqpilt57TI9riVIZZbm2M8KRmPhWi2Ygil/TFLFTWv/kFe9TEZR25z95d+Yj9u5Ycqx8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789705193; c=relaxed/simple;
	bh=N1AlwRqDfstBxsbeWuqXTAcyfuLI5FIG8EWxX9iXMT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=olhrJsfjnSHYzVyvnlxzGxkZtzXjhlLocLx9TOGvr9ofUNSVkWfSvtl9lT8ECIo+M/nTtzDFkupI5ectQY6k77yQop5RCUN5LIJZwP3URxeatIm89VcM7gw6usJDM1x23mXW5i6waaCCKCXnCeGn4DXXLAUFealD5ZBaplZ3s7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X86iOfTZ; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X86iOfTZ"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-39569e136f9so289203a91.0
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 21:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789705191; x=1790309991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNTXIROgieptOy0szd4N/ZNSXaXFaSCCYk0se+ZjeNI=;
        b=X86iOfTZJ8g+wVOfWiaTLum0KxGPSNtTjkQjcwaHeTbOD8i8rjJ67puaXbmAZmCUmF
         cR/qqgepQG5NqzkveCAm91Jm0OOOj6fyrW2Quo+jl5YgbKb/ZjwMdDrKlt5/+sg4Iz2S
         Rsm/QvdsLRSxJc35m0VNl0HL8sJultV+jif3sj7C8tLZC5Gu/0u3P1x+vXdNp1YS1NBt
         pH3KFdLC1kDriT9j4ngojB5/jDYtdYtJy4uUiX1d+WO5jTCj99/E+hQnzUpDYCQteNiY
         8dRRAO/AhsmTNg3sv9d+42O/8OAHqg8rpGZDZULbm0fVxq9xqW5kpm4oD3mGHmT3MaFd
         X6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789705191; x=1790309991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNTXIROgieptOy0szd4N/ZNSXaXFaSCCYk0se+ZjeNI=;
        b=RzfaugHnqG/VS/xlU+PZtC+mRm+hZbzqoh+XHLPH/AHW4TkkE2Vsi5PpCrCo7vn+1r
         5fiYUKPZ0y8mGvQWEcrwyhjsCpwcTWbqmlkFtDR7Zjaooo2jXlaVy/D3UIR+ZbPJJmka
         ng7gpA/YUnNcksJyKr2EQDIJ/vQm0WTmpq7/hVrAZGmNbPmL+Q0bhGehSuoBsG2O08xV
         UXWq6L7LjlPUuyyIiHD0QxvUyCkVLpFw42Yb4TAMvr52eldwiLXGvwrQvcHRuaxbaQqd
         EVZVrNEnd7qpL1AqXyZPv3Vi9CgCeNOvKzjKghBqQ5xAPZyMLR8Zzt09SsXbTSML7ZGc
         P/DA==
X-Gm-Message-State: AFuF++mOANYJtjt/203Kdx5KV8Kxeqh4QxkgL9eL5wYjPMY4ftRPWT4y
	knZu47xn6bw9EIU57GOexMCZ596vUkJ2YOrBVn1MPxfWvGHxrxyp1bnREfHIPpmx3xs=
X-Gm-Gg: AYBFou1wN6I2xB5ouKhFNpF/DujC4mLvsulQmpHpjy/sQXc/1JbctRpCXikuunORyQy
	0RtHvTGVDxxKgqTm35F+sm8wFZ8FlA0nVe8rP0GnFS3xj6AofnpIrBoWdGDKV1kT2MfNS8dbcqX
	DQEBf8aqs+6idZFJsnIGLX61ztbS4xwQDC8AOwlcQe/cF4ZReRVkCoujOAZw7NAY20vA0BpVTb/
	JM4HJUDcrVZI/qvpSyWRdA+BbJ4vZVtcRpiPVls7waUcIN4Eh+/26QyIScknVIa8UW0S8eovJwb
	XvbRJCvwHcS24vu556XgC+LGGtpp49pNgNvFMbcp+4L+pGEugorinzicv6hHzgfWXP0SfKCZ0zz
	pGSFWOJoR4axL/FjUMcdNopZ3csfbV4WXd1aQ9aaM8xcVLol6LB1KOKFY2h9OFXrBgifIGLZSkX
	Yba/lKP/j0bd+S4IPuXKF2lII4k7vccwDBNoBB5BD8Xl4fvxMY0zqCD6cLi3kv3wDCmdNNog05T
	uAhX4nniwthqTFqsUC6xtsnNZijICt/wKyxfOApor3NWUrnIDXwB4LKTEAmwPVfSlfZgdWd352w
	PqZ5hoMLJ9yI1jR+t3vR20CXK3k9YbCITuenUct5smXeqmmV2xs2j5p/QBC8arMnjUU=
X-Received: by 2002:a17:90b:2d47:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-39e54c9c7b7mr2992472a91.19.1789705191134;
        Thu, 17 Sep 2026 21:19:51 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144cddb4ca1sm1190170c88.2.2026.09.17.21.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:19:50 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-media@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: davinci: vpif: replace GPL headers with SPDX-License-Identifier
Date: Thu, 17 Sep 2026 21:19:46 -0700
Message-ID: <20260918041947.620701-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VPIF code uses slightly nonstandard phrasing for its GPL headers,
which caused them to be missed by previous SPDX-License-Identifier
conversions. Replace these headers with SPDX-License-Identifier.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/media/platform/ti/davinci/vpif.c         | 10 +---------
 drivers/media/platform/ti/davinci/vpif_display.c | 10 +---------
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/ti/davinci/vpif.c b/drivers/media/platform/ti/davinci/vpif.c
index cc0b0b8cdb89..f28d20e587d0 100644
--- a/drivers/media/platform/ti/davinci/vpif.c
+++ b/drivers/media/platform/ti/davinci/vpif.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * vpif - Video Port Interface driver
  * VPIF is a receiver and transmitter for video data. It has two channels(0, 1)
@@ -6,15 +7,6 @@
  * Currently, the driver supports NTSC and PAL standards.
  *
  * Copyright (C) 2009 Texas Instruments Incorporated - https://www.ti.com/
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation version 2.
- *
- * This program is distributed .as is. WITHOUT ANY WARRANTY of any
- * kind, whether express or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/err.h>
diff --git a/drivers/media/platform/ti/davinci/vpif_display.c b/drivers/media/platform/ti/davinci/vpif_display.c
index 08877ae1513a..e588625c96e2 100644
--- a/drivers/media/platform/ti/davinci/vpif_display.c
+++ b/drivers/media/platform/ti/davinci/vpif_display.c
@@ -1,18 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * vpif-display - VPIF display driver
  * Display driver for TI DaVinci VPIF
  *
  * Copyright (C) 2009 Texas Instruments Incorporated - https://www.ti.com/
  * Copyright (C) 2014 Lad, Prabhakar <prabhakar.csengg@gmail.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation version 2.
- *
- * This program is distributed .as is. WITHOUT ANY WARRANTY of any
- * kind, whether express or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/interrupt.h>
-- 
2.43.0

