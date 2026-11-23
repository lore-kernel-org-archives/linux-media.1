Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441315;
	b=MTFJsPgV5/CPWm/I7Y3/r2Ov+EmPLZH/y/IMLwgDP1lsBhxu5VLVmSAHMDfvv5Z5CfqE
	 Ws/3Mo6kNyGXsWlfb81u+eq5w3/pR+mET27NURNGnl/2XqhZzBvjf2dgyLSEOIcGvBDcr
	 E1KcPoZD5kHT1wYNpVsdVzsGxu0hVejhHhdvhaScr/QCGGdhIdqZF1VPtu7AbcVYpPCMC
	 93SxsFRuCJJRV+eWvXh1E8eve+GK9dGYgVlf2dej39oH2u78PKMef0QPWP9jq/bgL3Fkz
	 ncVdQPEiM5D3id62ot+xJI5OFGLSGwV0z2gg9bR8Cpp2RuHR7Wg6BHHd6GuYNY8eJCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0fwCy0JhhA2lRss9bSrLi2rmUykOiCxn4Yb5yOnWwD8=;
	b=P+8XqLGrZBsnKvqx2TeA2bS2mHar1MUPJRB/ciyMUuGXT+lqrNQak6lRqW0nz/dfLfJf
	 9iPH8x98ZzzS/LMUzOrjHwHxnyY+mGHlKmINOYmuQ7Aa1BV9rH78o8O78M3bM0woNGC4K
	 LLwownLGz5Ggqd8YRuHY9cthSFvTeHkVLmBp1rGkkTqUp5SLegBDnlkE/uoxXrkhw4Lig
	 H0T74JJ4dUI/ltA1RusglxbzVt5D/pscfh+KsFW3NRmdGrAqhh3cQ2ipfb/J4wP+X3qtC
	 6Ici6ul3koGzfaS/7FVu/LUzjjIRK80GgbVmP3GJP5YZBUaEkuvgQ9f/I6K19CokPrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eyvfIlCc;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABCF606C165
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 13:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AABCF606C165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eyvfIlCc
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso25874905e9.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 05:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795441313; x=1796046113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0fwCy0JhhA2lRss9bSrLi2rmUykOiCxn4Yb5yOnWwD8=;
        b=eyvfIlCcGTaSKz+XVlurAUDJb+If/4fbsS1OApjTLARCHcvgzUuPPEl00pB5nTTfZo
         L05lG+Tw1hSNssWCqBMSAAD1P/GmvHMGOGK87SWO/+LcdsSVFVDsCS4fCd4AMKwgs22f
         8tA/aLYtBosOMt+ND9jySQycEXKXTGKkRs08EDYO9IfTKHd5/zqQrozd3OnCvjN8iv2z
         7Ti+SDpPT2HBKpy2Q5YZ3+X5mdemSxtPiTKlOrlQAcpAfR9lNmjzB1ztyrcDs365PWsQ
         vxlBIoG6CANyTPV/yBqku78YmpVsJJOKqmdNgSv3U6LlmFjKXays3yeoYvsWJelBAmJ8
         Psaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441313; x=1796046113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0fwCy0JhhA2lRss9bSrLi2rmUykOiCxn4Yb5yOnWwD8=;
        b=RX7TdmbT0TYeitJtgpNJPr/ewK5VIB080hN+wD3QZkax3tKl1VEoP2h/oaOGWHPXe/
         ODGTvFxfi+h/NTnRnFTXzY3w+atuQwQkLm7ObD2TGg188ROGeYF3ezlr6jhXY2m6TrT0
         4xdMFhFzO72JPqb3Ewg2SFGiIk0GSomvnspBW35ZZ3vPWvrA6IHNTYjy5308qpMcEuiH
         8DIceWuV0QQAu63DAP58CpEd8uBFPOPbXEein0nZziq9W3lJsUQxOpOkCwnfz8Gv8ttQ
         aEqYrX2oBeKjlRtAmoohekoTK9EyhSurKxvDqig82ySGeGOfi1dXrNUUeMEf7FiAAuCY
         cg4w==
X-Forwarded-Encrypted: i=1; AL+hErG/YMtTHMTzehn/iIXYH6czgQTGKk2u5JB05D4tqIq9xEoua6fZYWzBaEn4rPVnNiqc/b4NSsP2JMEDQw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8evpN/j/v371frTIkjg3UEhbgs+1SLQuccnr9HQQqBwTDrLY/I
	eZDVgJSaaG6bChOjhW32aHwAS81GsqkzZXPPdeBHuLwleUWfj87l7I9hjW/4Ap0K/oE=
X-Gm-Gg: AZFdTZfS26473KYvc1kEFFQVeDckBXFvyseNw5t55BNWoyp0CfuXS+k107v8SywQT/z
	qRLKpnst7M7ZQiUoUIckTXEhQgN5mU3H80DT6Lzlsm4pBBGuFma3Zx2Pwac/jyQSNof+OPc5v6f
	VveRMyCUzUcBbpXuqiOtkRSNIFtFUpTLuCueVUrjoS5/MxCO4ezf1/yqUI0LKZMBl+bdjYUj0FH
	BDhphONT1APagvboWB2Aw3ynJYzCdQScuuP7sxJVnv9RKLEhEH7WCMhsIvbojgrSTdrXAWF6cnc
	RCeEgg3EGGRNRD+ptysphWeMzDPoaxedO49AJvLLZFz6BARiRTttUcClOk9V2nByZu1C1eNzpUq
	avHzlfkWdWSZ+OqgJ5b+vy97nb2penWAbR9F5G6VkuRT+MOvUvLmUmlcVE18xr7Rc9vrkWhNNTt
	yVva92FpPvgZ9Xkboeb6k5X5UOgXnsMEIyFqRVl5+ormj2j4C1NeW4LF7eJsaasiAHWQaiwnygG
	Ewg0R9NoQWEB0AGeR1pfm7yx5qjSvX7gUskZ7iJX1xtOWC6X97C24/aAW7mcwtaVnkBkehuR6TZ
	RixOjtigZOASWFG//EEzp1O2sB8tVhRjVc+TQME=
X-Received: by 2002:a05:600c:848d:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4bb88810b2dmr228475015e9.16.1795441312887;
        Mon, 23 Nov 2026 05:41:52 -0800 (PST)
Received: from HachikujiMayoi.amicon.wifi ([83.237.12.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm395444895e9.12.2026.11.23.05.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:52 -0800 (PST)
From: Daniil Iskhakov <shkiper325@gmail.com>
To: Steve Longerbeam <slongerbeam@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Agalakov Daniil <empt1nesss@proton.me>,
	Roman Razov <bonenooo@gmail.com>,
	Daniil Iskhakov <shkiper325@gmail.com>
Subject: [PATCH V2 RESEND] media: i2c: ov5640: Fix potential integer overflow in sysclk calculation
Date: Mon, 23 Nov 2026 16:41:03 +0300
Message-ID: <20261123134104.12152-1-shkiper325@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniil Iskhakov <shkiper325@gmail.com>

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
Co-developed-by: Agalakov Daniil <empt1nesss@proton.me>
Signed-off-by: Agalakov Daniil <empt1nesss@proton.me>
Signed-off-by: Daniil Iskhakov <shkiper325@gmail.com>
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

