Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010840;
	b=L7UPsisvOT3ZZJtipkldU0yVq+sBHAf9TS9eBfeZxvHBcTCXXrjD2XpvBw2fwrI238nn
	 eBHh3Iv+jS3UcBHovjvikU8y9eKOX2Kgo4ZzbazfcIzdn3UzDLDoLDUtVQuvwxC1MwvXe
	 W/aJPgdPZedP0qpjtlETTb5dkkDWCtvEPLtHe6hUcJ1wjSF0bMfVmRpPhHFhx9QF6B0Rt
	 SpnZ18i2Mg/UIW4Q4mLOV/6s1+PnrKyzgs0w+YKybqPE2BCER9PXCwjwpLZ7R2htsnheC
	 0MW41RJ+uw3lyD0XwMfghlYSBNWu/ZJVQRVP719GtmSnZ3pa4CT81temZrXgmBkxHyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Me7dOspGCpu1/X2qDoQUhpEKqrI6db9h8USBSJXvxuk=;
	b=yk8qXMlv/TPlwj3wzcLDS76dyotS2YaXD4T5QcktctCG0CoYeMPuPqM8N2IiMC+c5JIk
	 63FXWR2D7Vu/f9lw7sF4T/23kMum+oa220eBJzT2WdcpboMmE4XxhqmzAZhcUWSxf1Z3m
	 1QqXXFvbSvDniV+X4bMvF7gcvrdJ0pKMHSJgRcMkt7GPqv0jj4t6hMHxrBVHLwjqYxcBp
	 LJac6g/63XRWAagmcTknLTcwl6e3/3dzcNhKeyelprbA0Rtteyj25W5+ytrY183zSde+q
	 JC5qO/fr5t3ubLgQc74J2Rb0DQ1ftP7rGmsCYJnKi4HDYTwZmGTeT1guxYlopmTZO9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jZxPKmLa;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9743E606A31A
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9743E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jZxPKmLa
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be4c78e8caso419004e87.1
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 03:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010838; x=1793615638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Me7dOspGCpu1/X2qDoQUhpEKqrI6db9h8USBSJXvxuk=;
        b=jZxPKmLa9ydol9iF5wUFFeH9f7lzCts+hAAWOyDfYikLAD8LdTNrpT8fFNQ7Iskyc+
         mxlcFqXEcRBVbb8N8klbPNoAyJiHL5BfjqdzmcUOIkdogu3MQc/MLgKFHfs0fyf82vli
         G8yF/0HO6p2iBqkv5eLUZRlR91OrxplCGMoFS/10SiizG3wgMfT1y2045KJNyfBZFAc8
         aUmkjYvrMZCqF8besLjDWHPFBj033roG/WAJIbSZaumwfPXPXrBzC2mntyLHp8D3v3Ht
         Pg4LtdUw2hRXiusidGxDXpvne/u3ECJt60fv+jNsH+Dqujy89sK4BG5Tvu93KGuI+7Ba
         G0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010838; x=1793615638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Me7dOspGCpu1/X2qDoQUhpEKqrI6db9h8USBSJXvxuk=;
        b=YSxwhE1ZVBFSUW19athXQ9IaIHtKCtcTJzDDHSwXdarIolaVucVX5AGGfcpnAEv5T2
         6TaTnf+RTK6EuPdWEmpxnN3lCNPWF0sfCwKK5bsEuNfdaVgBaxy6Abl/CQQvAy9C8gdb
         UflDKKT02h49yhY98hE2dl/gXqlS3OTVr986j4WNXqqyLsKuBEQP2dzdtZksNVqZmSGP
         kE1FID9L4PSWKa8CwRQMr7sHrchN1VkXPaDV3Fp9CrAWKdPCo16qsLelnBoOaksbD+fi
         td5NPMVbHLsIndgvXzDBdmVz8LsT2cssc5MgNwmEMtRRavmfL2PBtWDH3jUHNfxBCCYf
         Q7pw==
X-Forwarded-Encrypted: i=1; AKwUvBwNT0gXqtrP0hgkDsFA5fxf9dLOAeulerOjUJe5EwKokoUH8EWWymZwe4G1Ev6fuKFXw6vz4ZFsE6nCKw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ67tsGQTvkkSqUHTmQ1zqpnriB8RvvusYX1M7lwXxcwazwOWnN
	fb3ZwkQeRA+f8+m4pcMEUN1z73rSgzPx243CG4DK2P3AZwftFBwGmhW8
X-Gm-Gg: AYBFou0Fy9pKqHeaG7shEtaPnDTnDiaRhRHnhd0eP+TAauGfTStWLB59rRdWYl+kF1b
	9ad2X5jeRISAZ2FJSx9NgY/gRrfcoJStTEnMxykpKXdnUIcrSi+E795Nn8f1IwFKcHlZ4bFImH9
	MHqyiGKYnvAAaTIEzOGC+vvYR8zRUv/U2eVwjzsnmNtUHiK35Lr9U247lCLKGMWKKHazqdR7Xlp
	PA9qvK8OsnyRcwAu5ipZAaiWjZExAiU+YLARPGk4kRJPK4nvVeLSqAFti1Ga9tIJz0ARXkR8mjw
	lRXXnxtTbj10ayrcsxNRQLIrQuRg50Ee5lT+WGv37ODUW2Hyesd6hyhQMy2Zf2kBOLgM/XqlG+4
	DuFjIwHeiWawpCYMtCZPmhdUg9/ftTwFQU3PbxKUByg+6NHWEZigGEswXzRY+0VBYopU3S9+lvy
	LHoG+STegrjyM4Vy04zNMuwmdkiT7laZJqGNKh1YzZDCmXbjHPCF5S9eKb1ywd1ZIK0GalFoxnw
	mZiz5aG78AFk59esgjMTyLERCqWcfyppT/c9J4MgXThyuPpFsAd70PpUaw5F4wJBN5gzOXTMdw4
	PMGMRpTZzkk=
X-Received: by 2002:a05:6512:2310:b0:5bf:b603:365d with SMTP id 2adb3069b0e04-5bfb71bbf25mr2220575e87.10.1793010837405;
        Mon, 26 Oct 2026 03:33:57 -0700 (PDT)
Received: from HachikujiMayoi.amicon.wifi ([83.237.12.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfbb469262sm875906e87.9.2026.10.26.03.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:33:56 -0700 (PDT)
From: Daniil Iskhakov <shkiper325@gmail.com>
To: Steve Longerbeam <slongerbeam@gmail.com>
Cc: Daniil Iskhakov <shkiper325@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Agalakov Daniil <empt1nesss@proton.me>,
	Roman Razov <bonenooo@gmail.com>
Subject: [PATCH v2] media: i2c: ov5640: Fix potential integer overflow in sysclk calculation
Date: Mon, 26 Oct 2026 13:32:44 +0300
Message-ID: <20261026103245.9879-1-shkiper325@gmail.com>
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

