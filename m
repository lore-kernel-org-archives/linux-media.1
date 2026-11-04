Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818778;
	b=jNFTNkbxJ1yM2QBu+s/2draLuaNUU6PrinzDaJ+DcKapbOEADCOWrJgYZho78oVWO6iq
	 dm9xntheAT7roLh3W7nC1Vw8FB1ZzfydYdg0CCqmaSTjI3Q9vaDysobwccnssRMuIq2sx
	 uQG1Esc30FSrZy9nP+BBvldX5LCY/LgLrQGNW22s+2nRxvc8oIx7Sxn7H1z4caKSqRE+1
	 NZOB+LFT6XJysKEUBuJZuT9x2Ntjam5+YddYP6CEaDZA39vJiVs55mxt0ZJHBeJoMnhd8
	 95ioFSclNUtW0VjEx2G0AEIJ313g4qYWVlSzD6YcFkUzGWvE7KuQ9PbGfeB0e5B1yIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=R3r6XsLge/zZ3OKpgQUjrLyEgNz14EMMNXZOviFfiAM=;
	b=W3Rnks/3at2yYINYC0f8ILXxpqvHBlGz3/uCvgb5sCPrerBqaASk/ronBKFsmHkWsVzi
	 DyBGoOjHafIirEuLT/oLkk0wYe08GHvXp7hwlMAht9fZuzqo43Qweu5dzb2ggJ1ObHZp8
	 I+FOvDI1o0MSUjzad6XJ9IVYj+TQW4oo3s1SM3w2Jqg7owj3IeFJpWZ0/sJnYtjVEoM+M
	 gCTL68NaZ0MdyVghINiiLgt+jTUg++Mbl8kzjRY6BT7feyTNdzsuoxpQotMD/ELtghk5j
	 JpylOd6XJzzc8fGDDPXBPNuLlVBmTzUXFV1PUtFrKJr+S4QhOef6iCMCIETzYZnWFwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lr/ELXGO";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E962606D822
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 18:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E962606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lr/ELXGO
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso7271565e9.2
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 10:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818776; x=1794423576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R3r6XsLge/zZ3OKpgQUjrLyEgNz14EMMNXZOviFfiAM=;
        b=lr/ELXGOAjrtNQ2piNiebm448JLxZFs3NW41gkD+9o25m/qDzbazqA1e33FD+d4Bdo
         Hzf/vDuocch2IoFrUfuWpYmoju7yM4HntqnzQ2h7WurL8TVUqMIdRk+tLS1ctQW9YpB3
         qq8MbaH9dOos9MNq76/4mBI+XJ0f7xCSjfa4UG/k+9szR09e3FoSYHeOdnnxA8MhcZew
         x0x5JoM/OYIDsk3+pluU+HmDAL+PJNqKi5t6UFuWN0yBLoK6GBEaYPMEHrZYnyyPVd0q
         MEYBzjn4JBA38t6KzASwMV2Uv5VQR7+/PV1HIMOVdTCdoMZtDXrNNdd1xtAWWMV+qjbJ
         8Tbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818776; x=1794423576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3r6XsLge/zZ3OKpgQUjrLyEgNz14EMMNXZOviFfiAM=;
        b=EcSkjSumDnE9QGbv3cehysuf8ikACkMyOelZyCED+trRt3SmsbRTIhvHX/nSUFqqey
         BI6N1lRGwWXDx1M0yQI9109IH4Z2zcXeT9DVMot40AyZt8zORWUPPyzvXVjGVzvMWZbg
         E1qyQyx4sX/C1yEqSooHrxG1aK4QLZHsZRLDuT0ixsGdESuEvSuILM8gtwfDDFLouiVf
         VCNluBO5NzoOdFAG96VzdjWI0UCWsoll1FLn/ZMTNTv3pIJ1fePC2ZZQMcKN2Kecbhmo
         dyVLCXvvk1Pr+fw7qWx5JdVRP28Y/wFB0ju+c80cs05gpATa6fJeGJCcl02wjZGjzIRQ
         iA8w==
X-Gm-Message-State: APuU4Z/FdubX+zluNmPbFB/bvaBbIPQZP6zuu0ojaAY+6Ye54UFKSUMb
	eND1Jg3Zq3aMNleLnIWw4isXIIxBIoIz03znnphcUTLXTmL+pm7vIpet
X-Gm-Gg: AYBFou2RS6hmpZOsEtFKqjHYe+srgHTBVKwg0F7zsPExiZ/OIvb5DWqDrZIh99yGi5P
	bcldTy9gBDbtXfRPqtKEdnw0b2mE9ov4Zqq4C5v8ALV/wQzq100+g6zO0flnI01wln8Zwcz7y9K
	7V4FdWvy+otEZgQMlgixL6wbw9GrUZ+Z4F70mXSYXmYGpL2AW8EdhoR6mGenHA1ZRJJVOvk22Ll
	hsXKwv3+klJv6Hy3BSU9GMdXHWsnu6kaHywurYiLgqCVW14STkCMkwk5uXKPz4TYUSJcrdhaSzr
	qYwN97C4RsPicnVVKKLCjOZlgnueDVseKJhMLJTW5pz4YR/6CnLU4j2mclALiuO2b8rmbOCgDI3
	IONS+qFU7YwOr8GFMdgDmnA1QzqwVZa1J3HqMhsOTtZA09XMeCHIQ35KiKNUmQ2bsCpdAsWJirA
	upCRWjrrwhIkp2mJbu1peQ+ATKVo3uyGy4byxXq/YpsTY3EDrvf5ULldJ5t34THFzc/aQA8Cc5p
	BBAJ25I8b75DbyWvbFCXIYJskUnWEwtiZ3RqdmaY+Mr/SniYv8cdg+L2+xLLix/8dHW3NDiv96b
	G5zXFoFmahJDthDvU36CCu5QSZkBHaf94gZblIwKJeSZoGJy+dYaeSJ2brzr6Y6z8K9IKWzB8FQ
	zdIiTcE5IsT/OBdYl95AABrVUGU4jmdxkBRtAQwgxC3ntg7HdBlRZP6cloy073awmy/LexzWSM6
	O6SFyV8hMAsNshcTnLFSYsvbUx0u0as3ji+zSwtvyg4oeF0WXcO54ptwG0kxCZlBFnPVxkgYHtR
	PCfXM3xthbLEDQ/8+5D2mu9e5VvCOyY52utVtK5Uh1q
X-Received: by 2002:a05:600c:a00b:b0:4a7:b304:253e with SMTP id 5b1f17b1804b1-4ac1765d8abmr383629925e9.22.1793818776367;
        Wed, 04 Nov 2026 10:59:36 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572bba207sm3598795e9.10.2026.11.04.10.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:59:35 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] media: sun8i-di: Don't sleep while waiting for coefficient access
Date: Wed,  4 Nov 2026 19:59:30 +0100
Message-ID: <20261104185930.885203-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
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

deinterlace_irq() calls deinterlace_device_run() to start processing
the second field, so it runs in hard interrupt context. However,
deinterlace_device_run() waits for coefficient access with
readl_poll_timeout(), which may sleep.

Use readl_poll_timeout_atomic() instead.

Fixes: a4260ea49547 ("media: sun4i: Add H3 deinterlace driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index 65bc426e5aac..bb90e0efa4d1 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -163,8 +163,8 @@ static void deinterlace_device_run(void *priv)
 	/* neutral filter coefficients */
 	deinterlace_set_bits(dev, DEINTERLACE_FRM_CTRL,
 			     DEINTERLACE_FRM_CTRL_COEF_ACCESS);
-	readl_poll_timeout(dev->base + DEINTERLACE_STATUS, val,
-			   val & DEINTERLACE_STATUS_COEF_STATUS, 2, 40);
+	readl_poll_timeout_atomic(dev->base + DEINTERLACE_STATUS, val,
+				  val & DEINTERLACE_STATUS_COEF_STATUS, 2, 40);
 
 	for (i = 0; i < 32; i++) {
 		deinterlace_write(dev, DEINTERLACE_CH0_HORZ_COEF0 + i * 4,

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

