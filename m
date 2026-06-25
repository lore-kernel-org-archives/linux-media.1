Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E57D3B42DB
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 16:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782403368; cv=none; b=gwVjGsmHyOCqbzNGJ9QFYsaNdbImuE6o63qX9GdaFYagGHt1czvOW9pWS9kCWCTy2eYu/yfT/zT271e869wNb+OQLT7MH02t/Jxz9eKIzOgSL3AJC+cX6W6OuXmWTo6BirjaXkNs4ah6oqbfGDb2a2RkKs8uiHc0KQ9r9MUSJaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782403368; c=relaxed/simple;
	bh=JAd+cR8sgstyy12UKF09HY7WWm4Idsqycue8Bj1EjmE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q1C4Nx2Hteqf/SxATvqQ6s4o2AIzXO8/OBMOtDMFKXvLhhckunK8i3BcCfKKNthZN7MsOGA7LPp6LBl7kgFXrhyLYjma6TkXOucGO4zZ2CXe+puVpjnf8ot3ZiiLuTZytNaENDWZFsIIRsdrcv2pKvDfEcoEfVCJ/Ek/xS9wpZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GOPbF4TN; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOPbF4TN"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c6c57c5bcfso1096315ad.1
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 09:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782403367; x=1783008167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iTdXuJRwQWuWhpRTPjq4OadQQRtkoHUaafxDWZmt37Q=;
        b=GOPbF4TN6vKXsG9z9CfL2/ruA834gFxWwqsG0O5d1wZy99pGUPrAD39tLaG5PbW/VB
         S6Y1qFvO1ZUaREsH628JRaPBewGCpUpMD69bPkv6O6LZKCH0FV3kM0nd+84AaOmCPqRY
         K/o4mL4KRbohBGw8ewObKg3UnXYQRrrfssl8HX0CEAu54EuirKKX2RrAy/fIDsvesyWk
         6IzCgmwCMduHKNiG+ciDmbjRNPpFB0+2ZoiCdyDHk9NNYmy+33Gb0sKS6oe6skAo/IAu
         8997Ddhzh/6d3c9esMgdVbrGUDIHSpWOfQAQNovLIc05XECjJ2bUyl0bMzz446pHdGot
         8FgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782403367; x=1783008167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTdXuJRwQWuWhpRTPjq4OadQQRtkoHUaafxDWZmt37Q=;
        b=U/l0Pxy4mH6my6xa1BhUMVWAq71pVyosTYCePKZi28jAXFR6t1XU7hpWlT0/E9v3wG
         rb5k618nLTINevjauV7MXbymTcyyNpgJgKA5NipjbCpR/bHzbLWvIC5nRqy2McWDDjN0
         wIzWYuNeUmbzm6dxtgZp4LakHxwPIIhd2okZYBAG834XfSCr2+E7VwxE5LdPG60VQbud
         zQhKYST7oPk7RgNuRynqHlg/H32zE3FZ1OlO0AEfyAcAGCHOitej5uhGQO8/Dfk2v/hc
         X+cdv2h4s8Cv/4F9DtFO334C5wyrgzIzMXvTL9k+Iv7FZ0DIITEBXuf64WrG5M2Uc/QZ
         4JJQ==
X-Gm-Message-State: AOJu0YxIXLnz0Qm8NPVaw4Ww09wr0VRGx589Pts7imez/fQXmCkyy1vJ
	Ar5yd8E/uuGdJx5PrXJZU0XPsuxX187PY8c6dNXnvQ7BXTxSWvYqEK6u
X-Gm-Gg: AfdE7clTxhxrxyCLMJ4roKI1EBd4YzI7pnDZUDibAhSmme0SXaRwrcfcsvx3LZiuwAq
	H48r3P4/w6ge2vmUVpaNMb9Oekdej5rKzQtHFEIlP6AFgvQfDmmO/wHGCdDYwEomxLz59DfJhM4
	FXcc983h1PQSSbTQ8f1lA39hSHfOLnlEbCr1qqhazqKbnarwHnIksaEYwxBh79TcbIxaqS1Pwj1
	2NeRRHrqjwDAKP/Wyp/TB3xWtXjeEtjB2QaC4Uyn2gZz5bzeuFAiPBKm0sh2hLkvGlqcLj2tO3x
	y1s7nlJqwijCDtF43P9MEcEHZmoskmA/DG/DpKlI5eh/BGR6UPTQNT7CKMwUFrxIcfErzsTmzYW
	PeCQem5n0zTTG0cIWbvEEoO8wA8pBtikkevL7+VBrojdmZTOAtzmwFTbZI5UQMnf6zQnwuJ1sEm
	Xe2D0q+mSn9ZyJGLYt2Bt+6fAzJlJM5PtlPgpgxA==
X-Received: by 2002:a17:902:fc46:b0:2c6:dab1:6690 with SMTP id d9443c01a7336-2c7fc70a348mr32734355ad.4.1782403366320;
        Thu, 25 Jun 2026 09:02:46 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:dc20:2c07:f8e5:16cd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63b287esm22998445ad.51.2026.06.25.09.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 09:02:45 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH] media: imx219: fix test pattern ordering and add patterns
Date: Thu, 25 Jun 2026 23:02:28 +0700
Message-ID: <20260625160228.59672-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test pattern menu currently maps 0 to color bars and 1 to a solid
color, whereas the imx219 datasheet specifies the reverse layout. fix
the ordering to align with the hardware specification.

Additionally, add 5 missing test patterns to complete the available
hardware test patterns.

The changes were validated on a raspberry pi 5 with an imx219 sensor
using v4l2-ctl and rpicam-still.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 drivers/media/i2c/imx219.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 223d3753c..8f0c04afd 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -110,11 +110,16 @@
 
 /* Test Pattern Control */
 #define IMX219_REG_TEST_PATTERN		CCI_REG16(0x0600)
-#define IMX219_TEST_PATTERN_DISABLE	0
-#define IMX219_TEST_PATTERN_SOLID_COLOR	1
-#define IMX219_TEST_PATTERN_COLOR_BARS	2
-#define IMX219_TEST_PATTERN_GREY_COLOR	3
-#define IMX219_TEST_PATTERN_PN9		4
+#define IMX219_TEST_PATTERN_DISABLE			0
+#define IMX219_TEST_PATTERN_SOLID_COLOR			1
+#define IMX219_TEST_PATTERN_COLOR_BARS			2
+#define IMX219_TEST_PATTERN_GREY_COLOR			3
+#define IMX219_TEST_PATTERN_PN9				4
+#define IMX219_TEST_PATTERN_16SPLIT_COLOR_BARS		5
+#define IMX219_TEST_PATTERN_16SPLIT_INV_COLOR_BARS	6
+#define IMX219_TEST_PATTERN_COLUMN_COUNTER		7
+#define IMX219_TEST_PATTERN_INV_COLUMN_COUNTER		8
+#define IMX219_TEST_PATTERN_PN31			9
 
 /* Test pattern colour components */
 #define IMX219_REG_TESTP_RED		CCI_REG16(0x0602)
@@ -235,18 +240,28 @@ static const s64 imx219_link_freq_4lane_menu[] = {
 
 static const char * const imx219_test_pattern_menu[] = {
 	"Disabled",
-	"Color Bars",
 	"Solid Color",
+	"Color Bars",
 	"Grey Color Bars",
-	"PN9"
+	"PN9",
+	"16 Split Color Bars",
+	"16 Split Inverted Color Bars",
+	"Column Counter",
+	"Inverted Column Counter",
+	"PN31"
 };
 
 static const int imx219_test_pattern_val[] = {
 	IMX219_TEST_PATTERN_DISABLE,
-	IMX219_TEST_PATTERN_COLOR_BARS,
 	IMX219_TEST_PATTERN_SOLID_COLOR,
+	IMX219_TEST_PATTERN_COLOR_BARS,
 	IMX219_TEST_PATTERN_GREY_COLOR,
 	IMX219_TEST_PATTERN_PN9,
+	IMX219_TEST_PATTERN_16SPLIT_COLOR_BARS,
+	IMX219_TEST_PATTERN_16SPLIT_INV_COLOR_BARS,
+	IMX219_TEST_PATTERN_COLUMN_COUNTER,
+	IMX219_TEST_PATTERN_INV_COLUMN_COUNTER,
+	IMX219_TEST_PATTERN_PN31
 };
 
 /* regulator supplies */

base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
-- 
2.53.0

