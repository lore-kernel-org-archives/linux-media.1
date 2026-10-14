Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463BB569F17
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 17:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000480; cv=none; b=HOuVa/gJJ04ewTnneRZzz4g952jIvtcdzLqW2C56B2ISv0QHT7mXjq0bvJiHhb0CEhQFnhjaa4Ei3iUftO+MMxlFI53oGmfQgXnogJTrIDKnM+iOm8hg8UVS04kUSXF44QhG3M1xbRqwGchWQnG6acBfnn7N0tFgQQ/8pw7GW/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000480; c=relaxed/simple;
	bh=UTEcywKoFZD90m+SBWAiEojtxQjD/HhlRH5a5/aZPb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JDcUE5Q5HCBI7y5iKF1rYozSyCsLJqSlTqybsrQoD4v6W8RUQclkATtoY8X+5IztsGWTALHkkaq98Odwf5zJDng42dLUB14ng48sda166BDQkgvQhrt+O2wG3K7Hxnr6G3lF1bhYbhTF9NVz2zGYz5ghvC3DzqupyJt/nOCoFnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=lvrC2qT+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="lvrC2qT+"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso33752265e9.0
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 10:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792000476; x=1792605276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGoIpVElJWVjTezAvTp64hzKh5QoyZgdDO1ru90XKus=;
        b=lvrC2qT+8RmBO4KHcEB5Y0mZJYuC+JTDnplYoAQW0jMaL4ly3s3dNqhH8yi9OR0yXp
         9CdbSO85kIne+TQYIfQVj0T8RdH15GMfopyY8CnagGotx7wSUFUhCmJuFwf51HdUpAwj
         mwN5Y/lR6XlYkQt7XvSLmhaAUgtUboXv3q4ycjwvROSo7wAQKFo56CFDWbCB33+PKqJX
         +ts/MNPOAo/sRwyXxdBXxrqI56z0b8tgxMqw/ZqxngkDWV56YygcG2dXsSPJaZH5j3Vq
         Kb+myaCd/VMqxqpAnItXFa4W/Nw1vj1hYpRgKF9sRfk08y4DpBHMUdSBUdpcuBx6smW4
         rCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000476; x=1792605276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGoIpVElJWVjTezAvTp64hzKh5QoyZgdDO1ru90XKus=;
        b=kjV/zZxWhm1970hq0fdkqeP2KD6IOKAYIggU2q+6wAe6kcf0O6O6wSFrZdmlvyc5HK
         QFhXyQf8A2yeoOPOdBlYDRUuA85JYrScdJZwYfATtLLCyFJUJC5pRL5w7sQhtwPg/x89
         C0Z43clDL8IStp0cWYe5RnIT3a27NCdiGa3Q2U/LL+T6gqVX2SohHCIM36dExBFY+ssn
         hbgj/BkkmJHOJe0Pf7B7O1OadXAt3xhXZ6QGcmqEboCmxI5UZGkYC3RGN81/7EchrNe2
         bkR+sh3XJ0Nz9mnAkXp/9JU1pqUqiROiKJHN/KMPKlG2pHExrn4nYmdLZwDS17G3QLTB
         ZcxA==
X-Forwarded-Encrypted: i=1; AKwUvBx7UQpKNjA4wjQlZ1M9SLrefKUYuirHmYmBzaI2ouDX14l3beCU6W4xzgFMiV5gpbpL/LN5M/MVTckJWQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLB2+1Vw43mWXDDrwJzShNPCf3giQgEEVgkeKnA8/C+jF45wTKD
	QAWF0HpGP/G6O6cGFyMqn7Ja/guXAY3aQgaK6YWnFRZUAMzSMhAns7iRu/V3F6udODo=
X-Gm-Gg: AYBFou0TSwATiK24UzglxwW9om7PBK4SBwdc8G5hen41qu3Wa0vV7/41GAuCnlQbmg4
	8hrDJPNQEhjytPZ5orZVaZCiltkyz3ZDx5nni0KUhBfpj0a3nZZ4sGG2uky/HQReFN7wR/xfFKH
	FYipg9pVXHeHVgOk8rzIU0mxYD6WPaUjRPb5Qx/JH+kyKQXi1FOtc1fDd7FL1W3psBe4gC6ebHi
	tH/pbtvvlqtKk5qyD4kppY8wFW3njGNx/UNefBF3jtkJ56CcSClymGRki9V960jiqWah8/TRHFC
	ME/BxWcepCxbv4LYiuLxr9nwL7foENInPADtqgDVX8pSnPd5eDp9qVuLJ6yY0FcCWealxs2WI9b
	9tGxYzC8RzyazVrFs4xGp8GHxGWGreaeAVZDDWwA8Ek23pMhseYhLimZ+19mbqaywqDaT6DhzZe
	MKus9XakUd4/BTaE1b9IwHJfTVcjyD8+7gQn+nuGNdxZgAehVZw8TTEcmZ0QN5fmPnuBj2+tFOL
	eDjfDY0CoRJkznc9J/iM7aXUE2knRCi0935zD7izhHQ8dmyAA==
X-Received: by 2002:a05:600c:5254:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a18e4aa11dmr338035925e9.16.1792000476408;
        Wed, 14 Oct 2026 10:54:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd986095sm8188395e9.7.2026.10.14.10.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:54:35 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 18:54:28 +0100
Subject: [PATCH v3 07/14] media: sony-starvis2: Correct the exposure range
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-media-starvis2-v3-7-c958362b5d06@raspberrypi.com>
References: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
In-Reply-To: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The software reference for imx678 lists register SHR0 setting
the shutter sweep time with a valid range of 4 to (Number of
lines per frame - 1), and then gives the example of all-pixel
scan mode with VMAX=2250 and SHR0=2249 giving an integration
time of "1H + Toffset" (further defining Toffset as 0).

The driver defining STARVIS2_EXPOSURE_MIN as 2 would therefore
be contradictory, and doubles the minimum exposure achievable.
The maximum exposure is derived from STARVIS2_SHR_MIN which
is defined as 8, when the actual minimum for that register is
4.

Correct STARVIS2_EXPOSURE_MIN and STARVIS2_SHR_MIN.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 72fb037d7dbe..4fade8671bb5 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -61,10 +61,10 @@
 
 /* SHR internal */
 #define STARVIS2_REG_SHR                  CCI_REG24_LE(0x3050)
-#define STARVIS2_SHR_MIN                  8
+#define STARVIS2_SHR_MIN                  4
 
 /* Exposure control */
-#define STARVIS2_EXPOSURE_MIN             2
+#define STARVIS2_EXPOSURE_MIN             1
 #define STARVIS2_EXPOSURE_STEP            1
 #define STARVIS2_EXPOSURE_DEFAULT         1000
 

-- 
2.34.1

