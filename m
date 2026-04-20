Received: from mail.amicon.ru (unknown [77.108.111.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AD032F751;
	Mon, 20 Apr 2026 15:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.108.111.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776699654; cv=none; b=t+6XCTlmw569psdmKPiZvNQ42TnO0LwRjGLn/hZrxFEsKRAZNfQjw503HIBNz8AjJY5iKYwotLPdjta9DHg/VkNVFuho9CvQ5bGK7i5I9RkDNQDMFKZAWi9TcyTlN1qtEFv7e4n01+6Ipgwb4ilUmfUkp8F5QCtsyvc+MpONzKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776699654; c=relaxed/simple;
	bh=1gkTR3gB+a4SdoGrBrcwloE+TVNF3ZBxERSmEULk7Sk=;
	h=Content-Type:From:To:CC:Subject:Date:Message-ID:MIME-Version; b=Pwuo3MGwEBvahdk87uJGgs2neUfz+BXVkzflV+67HmH95OQT1qN+Ky4xfYUwlRdibPz26ABSeL4mRPVw0sRSssCRQjSywJjS4u9McKBJEq/61jhg+IGzYCb9TtmNqCd/ySF24JJNvccdrM9EPVnUNPGeKImTONMmfUGe7/z8HSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amicon.ru; spf=pass smtp.mailfrom=amicon.ru; dkim=pass (2048-bit key) header.d=amicon.ru header.i=@amicon.ru header.b=Ff6HJMtJ; arc=none smtp.client-ip=77.108.111.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amicon.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amicon.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amicon.ru header.i=@amicon.ru header.b="Ff6HJMtJ"
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; d=amicon.ru; s=mail; c=simple/simple;
	t=1776699650; h=from:subject:to:date:message-id;
	bh=1gkTR3gB+a4SdoGrBrcwloE+TVNF3ZBxERSmEULk7Sk=;
	b=Ff6HJMtJXvtVqZqQ+Ft7hEHoyuyVgT0kxVUtr88SJeAE/Ayz+abvsHn8yr89pF2TqGS0Tdo1gd8
	amNCQill/r5h5lvP2ws+HvaiMsrPNnA9+ufO2SiMxRDFOhDvniXERxorEiq9cBMGPK5CNpg+iq4yW
	b5Nk3obX+2rbSo5ygy0r2hzVNmDhPvQvv1qx4fLqPGM4m1UqzL6Eq/NOPrj6h29bsu8u/facFxTJx
	B/dK2VhT7pdHwO0GnsQqBfs6hrfXby4HiLU089IqFDPyHyHw3lqqVgBWdhWPOCmVDezpxAHODny0N
	kEzl4cWhetK7K+/g4tnkKqo2N3zPQkJaIzOQ==
Received: from example.com (172.16.2.46) by mail.amicon.lan (192.168.0.59)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.27; Mon, 20 Apr
 2026 18:40:50 +0300
From: Agalakov Daniil <ade@amicon.ru>
To: Steve Longerbeam <slongerbeam@gmail.com>
CC: Agalakov Daniil <ade@amicon.ru>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>, Roman Razov <rrv@amicon.ru>
Subject: [PATCH] media: i2c: ov5640: Fix potential integer overflow in sysclk calculation
Date: Mon, 20 Apr 2026 18:39:50 +0300
Message-ID: <20260420154007.2877949-1-ade@amicon.ru>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: mail.amicon.lan (192.168.0.59) To mail.amicon.lan
 (192.168.0.59)

The calculation of sysclk uses 32-bit arithmetic because
sensor->xclk_freq is a 32-bit integer. The intermediate multiplication
result can overflow 32 bits sysclk variable.

For example, with pll_prediv fixed at 3 (OV5640_PLL_PREDIV), xclk_freq
set to its maximum of 54MHz (OV5640_XCLK_MAX) and a pll_mult value above
238 (the maximum value for pll_mult is 252, defined as
OV5640_PLL_MULT_MAX), the result exceeds the 32-bit limit.

This overflow causes the 1GHz safety check to fail, as the truncated
value fits within the 1GHz limit. Consequently, the function returns an
incorrect frequency, leading to misconfiguration of the sensor.

Explicitly cast the first operand to u64 to ensure the entire expression
is evaluated in 64-bit precision.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: aa2882481cad ("media: ov5640: Adjust the clock based on the expected rate")
Signed-off-by: Agalakov Daniil <ade@amicon.ru>
---
 drivers/media/i2c/ov5640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 85ecc23b3587..04e5a683976a 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -1377,7 +1377,7 @@ static unsigned long ov5640_compute_sys_clk(struct ov5640_dev *sensor,
 					    u8 pll_prediv, u8 pll_mult,
 					    u8 sysdiv)
 {
-	unsigned long sysclk = sensor->xclk_freq / pll_prediv * pll_mult;
+	u64 sysclk = (u64)sensor->xclk_freq / pll_prediv * pll_mult;
 
 	/* PLL1 output cannot exceed 1GHz. */
 	if (sysclk / 1000000 > 1000)
-- 
2.51.0

