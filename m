Received: from mail.amicon.ru (unknown [77.108.111.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B109449B2D;
	Mon, 17 Aug 2026 16:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.108.111.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786982978; cv=none; b=KjW794JOt3BaHG6hmRwhmtFpManWXdGPko8IlrR6yKRZaKc1vOXWVJkDmzpA+kSfbMOYD1EnlSNy6aFbhxtKKkLTtBOTfz/9XxSZ8QMA3LEw5xZEnyITcRSAP9P9QXvr/A2GBarLYWQoSJwqIiRTBc1qfE1XQxIXZIrjlVaCDUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786982978; c=relaxed/simple;
	bh=U0DxjJ60lrDiSwBgNUFbdEYuAeWQWITXaKsHEtXIeVQ=;
	h=Content-Type:From:To:CC:Subject:Date:Message-ID:MIME-Version; b=KrEeHdojJCjBrS2YxNdTRC+hTiFrib8oKwj4EfF40/UF9C08DM1wmzAyoyiVu5vSyCZ9agQfay9RNl03f2RrBz1YuJ8+I3hMszK3NSHCWV8WTnu5KXwuZhvKptXQysYEBP98aePj2Zpd9b2dK6RhjcBmvOWCXkC+vs/AQEKT14g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amicon.ru; spf=pass smtp.mailfrom=amicon.ru; dkim=pass (2048-bit key) header.d=amicon.ru header.i=@amicon.ru header.b=WfGP0Izi; arc=none smtp.client-ip=77.108.111.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amicon.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amicon.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amicon.ru header.i=@amicon.ru header.b="WfGP0Izi"
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; d=amicon.ru; s=mail; c=simple/simple;
	t=1786982970; h=from:subject:to:date:message-id;
	bh=U0DxjJ60lrDiSwBgNUFbdEYuAeWQWITXaKsHEtXIeVQ=;
	b=WfGP0IziQhidLXGebgAUkxsHqlAOlirPaTo6yPs0HP0CTXyaRQ3PshUbeOh/CvPWF8t1DNthNRj
	++bkV33D2AB0MRPbaNRLNFHmeZNZyz9gam50fC8j8JIfK53lE4j7r2CheK9/3x897Yjt2G3fMu0LV
	dpMoUgpFbh1YJMn39LyvYz+i4twBMnBT0PLRMQAH8ybwgMllnQ4jEmotOBL2A4S9TiXK7neQy5pdc
	jNoKucHmLrWkxV4anraa7CpZUZ8GBmC4uQSpJspD0GFMTr4V8v+OawSF9Ad4ojqvngzK8KbfDN+9K
	s1uqNUzgkH8VAUr09QA+5z4AAaKmcjve4G7Q==
Received: from dish.amicon.lan (172.16.30.10) by mail.amicon.lan
 (192.168.0.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.27; Mon, 17 Aug
 2026 19:09:29 +0300
From: Daniil Iskhakov <dish@amicon.ru>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Daniil Iskhakov <dish@amicon.ru>, Steve Longerbeam
	<slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Jacopo
 Mondi" <jacopo+renesas@jmondi.org>, Maxime Ripard <mripard@kernel.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Agalakov
 Daniil" <ade@amicon.ru>, Roman Razov <rrv@amicon.ru>
Subject: [PATCH v2] media: i2c: ov5640: Fix potential integer overflow in sysclk calculation
Date: Mon, 17 Aug 2026 19:11:13 +0300
Message-ID: <20260817161115.2530827-1-dish@amicon.ru>
X-Mailer: git-send-email 2.43.0
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

The expression sysclk / 1000000 > 1000 now also cannot be compiled on
nios2.

Cast the result of the naturally 32-bit xclk_freq / pll_prediv division
to u64 instead. This keeps the pre-divider operation 32-bit while the
potentially overflowing multiplication is performed with 64-bit
precision. Once the 1GHz safety check has passed, sysclk is guaranteed
to fit in an unsigned long even on 32-bit systems. Cast it back before
dividing by sysdiv to avoid another variable 64-bit division. Avoid
64-bit division in test.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: aa2882481cad ("media: ov5640: Adjust the clock based on the expected rate")
Co-developed-by: Agalakov Daniil <ade@amicon.ru>
Signed-off-by: Agalakov Daniil <ade@amicon.ru>
Signed-off-by: Daniil Iskhakov <dish@amicon.ru>
---
v2: The patch is adapted for nios2 thanks to automated tests and a tip from
David Laight <david.laight.linux@gmail.com>. The first version cast
sensor->xclk_freq to u64, making the division by pll_prediv a 64-bit operation.
Keeping sysclk as u64 also made the final division by sysdiv a 64-bit operation.
The kernel test robot reported that nios2 GCC emitted unresolved references to
__udivdi3 and __divdi3. These libgcc helpers are not provided by the kernel,
causing modpost to fail.

 drivers/media/i2c/ov5640.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 92d2d6cd4ba4..dbe767afefd5 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -1377,13 +1377,13 @@ static unsigned long ov5640_compute_sys_clk(struct ov5640_dev *sensor,
 					    u8 pll_prediv, u8 pll_mult,
 					    u8 sysdiv)
 {
-	unsigned long sysclk = sensor->xclk_freq / pll_prediv * pll_mult;
+	u64 sysclk = (u64)(sensor->xclk_freq / pll_prediv) * pll_mult;
 
 	/* PLL1 output cannot exceed 1GHz. */
-	if (sysclk / 1000000 > 1000)
+	if (sysclk > 1000000000)
 		return 0;
 
-	return sysclk / sysdiv;
+	return (unsigned long)sysclk / sysdiv;
 }
 
 static unsigned long ov5640_calc_sys_clk(struct ov5640_dev *sensor,
-- 
2.53.0

