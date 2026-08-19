Received: from mikheit.ratatoskr.org (mikheit.ratatoskr.org [151.244.244.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3852D3C10AD
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 08:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=151.244.244.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787127340; cv=none; b=rsgNLRRZwZM+mr1cNVrSuEZEGtddNazRGaUwOkcR35d3FxYVYMeVHGyZPwXzSWFg9K1hl7qVZvOWZl3mxE1+f4omH7pV+VA0VikL7iyQF7PPLCmAjfYdcZ/mxnCJ3XIUrCWB7q5kUGMVOBBxWz6q5YSe0fOXMOQoeoeCWK0UFk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787127340; c=relaxed/simple;
	bh=ZIjn9kOub1y/9kUlEjvz0QYq5pQEte5s9T+6R5jD26Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dc5/pod1lRxJw5CcJmnUKKcBeLdvKpNrFc0ociZAcdVHOeeb0EHaSFqRoNicNLKDmj6cqq1/dfhXSNFnuMSLxm58hZFOQ3JU0lJxK9N4Rl2HbBMICfaLAzIowtviqFZQsm9ve/VSHOaSegDmaFXbtNK3yOaaaPEIf6kz+LDBVa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asgard-electronics.com; spf=pass smtp.mailfrom=asgard-electronics.com; dkim=fail (0-bit key) header.d=asgard-electronics.com header.i=@asgard-electronics.com header.b=DxeyN2RG reason="key not found in DNS"; dkim=pass (2048-bit key) header.d=asgard-electronics.com header.i=@asgard-electronics.com header.b=eycG+alw; arc=none smtp.client-ip=151.244.244.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asgard-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asgard-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=asgard-electronics.com header.i=@asgard-electronics.com header.b="DxeyN2RG";
	dkim=pass (2048-bit key) header.d=asgard-electronics.com header.i=@asgard-electronics.com header.b="eycG+alw"
Received: from mikheit.ratatoskr.org (localhost.localdomain [127.0.0.1])
	by mikheit.ratatoskr.org (Proxmox) with ESMTP id 06F1420D9F
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 17:09:41 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	asgard-electronics.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:from:from:message-id
	:mime-version:reply-to:subject:subject:to:to; s=mikheit; bh=7XZK
	2yJXTQzqhY3+OdIJke6ks9K6DWSSLebudSIyQ14=; b=DxeyN2RGzXBKsUxRfj4w
	qZeXWF/f0KC039ful3Nky8oNAb5Ab5ww7y61f0xTQqhnqftOXTiKehlyIaKF5TSR
	WT+ensY+Iq1O8eAHqtYHupZXbhseRRXBmz0DQyhdqWTimQ4GpZZ8vXn+XSqZCfed
	mXSuIppO0wTAYa7j/8jmSZaKGEgySQVP5bKdWrW+0059FJ4AbId3/TxZxdFvqnpq
	rj8k/yfWYG0FbbFoIIVw3NItKzoyiiLw2YGVUeWQOnBg8EAzAPC6/K0Y/Jy6Qw9w
	duQhptrVjBBrRJeO1iyMUGInZ9Yi+gkJ8i9gYduWid5G3Qd9uXiOFCQH9yc4tB3m
	XQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asgard-electronics.com;
	s=dkim; t=1787126978;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=7XZK2yJXTQzqhY3+OdIJke6ks9K6DWSSLebudSIyQ14=;
	b=eycG+alw10qFblT5eCwYtYeBxVBe4vMZUt++g0AFEqdsdsxuHKzEERycCLhuDr6fS5Ws16
	dljZTxWilHsQd/bVgd0VFYC9Zy9bPZOzSw5FlQFyBNzhPn5C1E/vFh9dYuesHUlehFGeQ7
	Sr1B0Y8ybT2NF77TjMzGNkOUDZKphf8Y8bO3ATbWDxmc8pZ5LrNcWNlqQrW9eaCaaGkwQ2
	2BWWIxli+lIG01M8GrRiKEDJ4B8oAaGcOoRkqCWTOaMrDw6D8uKd8BGZDqM0GDN6rmX8Gq
	Dt3PeDeNt+//4oEd5WCIVY3keOU91Mljc/41y/VewAievpVYApCp5RHuusQIFg==
From: Elliot Baldwin Woodman <4fe9ac17+elliot.b.woodman@asgard-electronics.com>
Date: Wed, 19 Aug 2026 17:09:29 +0900
Subject: [PATCH dtv-scan-tables] dvb-t/hk-HongKong: update Hong Kong
 digital terrestrial TV scan table
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-update-hk-hongkong-frequencies-v1-1-9ac19e69c8c3@asgard-electronics.com>
X-B4-Tracking: v=1; b=H4sIALhkhWoC/yWNzQrCMBCEX6Xs2YW0UjW+inhINtsmVtKanyKUv
 rurHubwDcM3G2ROgTNcmw0SryGHOQq0hwbImzgyBicMnepO6tJqrIszhdFP6Oc4ThIcEr8qRxI
 Pqp7Ox15bpRWBSJbEQ3j/Dm7gyoqZTMRi7FO6+3+Qq30wle8N7PsHAcQHFZMAAAA=
X-Change-ID: 20260819-update-hk-hongkong-frequencies-05c7359b090c
To: linux-media@vger.kernel.org
Cc: Elliot Baldwin Woodman <4fe9ac17+elliot.b.woodman@asgard-electronics.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4287;
 i=4fe9ac17+elliot.b.woodman@asgard-electronics.com;
 h=from:subject:message-id; bh=ZIjn9kOub1y/9kUlEjvz0QYq5pQEte5s9T+6R5jD26Y=;
 b=owGbwMvMwCW23WQzn1+U1gzG02pJDFmtKQdDZizQXM8XeC1v+Xrxt2sX3D8aX8uzUGXhn5obQ
 voaazlNO0pZGMS4GGTFFFkqv+yYdn/bx8KrYa5LYOawMoEMYeDiFICJWHAxMnT+qf6c0qe2bHe8
 yo9YM1Zl95V5uZtcd0dwyb9I0zq+vJiRoXuH64fj3Pn/HgYdcvn+ot9uk8Gbt9FlU6s8XZsWJRo
 IMAAA
X-Developer-Key: i=4fe9ac17+elliot.b.woodman@asgard-electronics.com;
 a=openpgp; fpr=79F4B896DFB6F171D55645A4B734B30E4E5A2A98
X-Last-TLS-Session-Version: TLSv1.3

Bring the Hong Kong scan table up to date with the published digital
terrestrial frequency table.

Signed-off-by: Elliot Baldwin Woodman <4fe9ac17+elliot.b.woodman@asgard-electronics.com>
---
The Hong Kong scan table contains outdated UHF mux frequencies and
broadcaster-specific entries for long-defunct services (e.g., ATV).

Update dvb-t/hk-HongKong to match the latest official frequency
table published by the Office of the Communications Authority (Hong Kong):
  https://www.ofca.gov.hk/filemanager/ofca/en/content_1087/tv_frequency_digital_en.pdf
---
 dvb-t/hk-HongKong | 91 +++++++++++++++++++++++++++++--------------------------
 1 file changed, 48 insertions(+), 43 deletions(-)

diff --git a/dvb-t/hk-HongKong b/dvb-t/hk-HongKong
index 1e2d136d..cf0b2c25 100644
--- a/dvb-t/hk-HongKong
+++ b/dvb-t/hk-HongKong
@@ -1,34 +1,28 @@
-# Hong Kong (DMB-TH)
+# Hong Kong (DTMB)
+#
+# References:
+# - https://www.ofca.gov.hk/filemanager/ofca/en/content_1087/tv_frequency_digital_en.pdf
+# - https://www.ofca.gov.hk/filemanager/ofca/tc/content_1087/tv_frequency_digital_tc.pdf
+# - https://www.ofca.gov.hk/filemanager/ofca/sc/content_1087/tv_frequency_digital_sc.pdf
+#
+# Note:
+# Frequencies listed here reflect the "Frequency Table for Digital
+# Terrestrial Television Broadcasting Services in Hong Kong" released by
+# the Hong Kong Office of the Communications Authority.
+#
+# Hong Kong digital terrestrial television broadcasting services use a territory-wide
+# single frequency network (SFN), so the same frequencies apply for over-the-air
+# reception across the entire territory.
+#
+# When using a communal antenna / SMATV distribution system, channels may be
+# remapped, so the frequencies listed below may not match what is received on
+# the in-building network.
 
-# TVB (band 35)
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 586000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/64
-	TRANSMISSION_MODE = 8K
-	GUARD_INTERVAL = 1/32
-	HIERARCHY = NONE
-	INVERSION = AUTO
-
-# ATV (band 37)
-[CHANNEL]
-	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 602000000
-	BANDWIDTH_HZ = 8000000
-	CODE_RATE_HP = AUTO
-	CODE_RATE_LP = NONE
-	MODULATION = QAM/64
-	TRANSMISSION_MODE = 8K
-	GUARD_INTERVAL = 1/32
-	HIERARCHY = NONE
-	INVERSION = AUTO
-
-
-# Simulcast (band 22)
-[CHANNEL]
+# UHF Channel 22 (482 MHz)
+# 76. HOY International Business Channel
+# 77. HOY TV
+# 78. HOY Infotainment Channel
+[CH22]
 	DELIVERY_SYSTEM = DVBT
 	FREQUENCY = 482000000
 	BANDWIDTH_HZ = 8000000
@@ -40,10 +34,14 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-# Simulcast (band 30)
-[CHANNEL]
+# UHF Channel 27 (522 MHz)
+# 31. RTHK TV 31
+# 32. RTHK TV 32
+# 33. RTHK TV 33
+# 34. RTHK TV 34
+[CH27]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 546000000
+	FREQUENCY = 522000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = AUTO
 	CODE_RATE_LP = NONE
@@ -53,10 +51,11 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-# Simulcast (band 32)
-[CHANNEL]
+# UHF Channel 29 (538 MHz)
+# 35. RTHK TV 35
+[CH29]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 562000000
+	FREQUENCY = 538000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = AUTO
 	CODE_RATE_LP = NONE
@@ -66,10 +65,14 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-# Simulcast (band 40)
-[CHANNEL]
+# UHF Channel 35 (586 MHz)
+# 82. TVB Plus
+# 83. TVB News
+# 84. Pearl
+# 85. Phoenix Hong Kong Channel
+[CH35]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 628000000
+	FREQUENCY = 586000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = AUTO
 	CODE_RATE_LP = NONE
@@ -79,10 +82,13 @@
 	HIERARCHY = NONE
 	INVERSION = AUTO
 
-# Simulcast (band 43)
-[CHANNEL]
+# UHF Channel 37 (602 MHz)
+# 81. Jade
+# 96. ViuTVsix
+# 99. ViuTV
+[CH37]
 	DELIVERY_SYSTEM = DVBT
-	FREQUENCY = 650000000
+	FREQUENCY = 602000000
 	BANDWIDTH_HZ = 8000000
 	CODE_RATE_HP = AUTO
 	CODE_RATE_LP = NONE
@@ -91,4 +97,3 @@
 	GUARD_INTERVAL = 1/32
 	HIERARCHY = NONE
 	INVERSION = AUTO
-

---
base-commit: 9d31c27b30b8a485afb3949bd9053c0c3a112525
change-id: 20260819-update-hk-hongkong-frequencies-05c7359b090c

Best regards,
--  
Elliot Baldwin Woodman <4fe9ac17+elliot.b.woodman@asgard-electronics.com>


