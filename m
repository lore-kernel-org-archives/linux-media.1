Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690477;
	b=RXJccK1vxVi2MIySJfoR1M2iNr0I2h/2/yOuAT0C8bE25WTbMP7kZqoSVOIaUYefZ83h
	 GztUWfl0Qj0T8Jdpy6/0k0QnLS/NmG2yppCkZxgY6kuH98xLo0wu2qagiXn24KXGquP7/
	 8SWv7fNdyKwz0FBotbLnToj8WOL+5Dc2KAN6C1lxErpqHkAzQzGfp1f9GzDWG3C11aqSw
	 gB45oiMd7eAv911KOfjsQzOaB5Q6MQOrPw7xLhqg6er1DoLf/2zdRvODkgsSKizW5q4hY
	 dtRjbmJMuhLl47MKTf2SEQLqqb89BcBa6YPJxxqYgG6DVP22wGvNmx1dk4KF0UZEFVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tHlWMfT2Vn1jhxwuk47U/QSe3Sx/Rh/6scTTXAvnAJ4=;
	b=TzRL+OCmDVzOzgdYISGYa1Z3IMmzdKJlnJ8tCw/cSbEVMkXZ5518SDoF7d27f+HASOyH
	 YMPoMugotOR34xvitApFGHwB611dOg4Wre2dWF6NGC8bEaFWGvYP2/eVRWUqDHSZOojWe
	 mj6q9OPQiLRkqXWJE3Le7YjRsb1vTDi2kE7q7Q2X+CnOJ16oe4yEBpte1IfMpZiwe2g35
	 ejW3JIwmM1pYpA+NozHe3Cmz5snuHhGmPDYik17YFHCifHObxNB5Mu3/KAqBvVVcys9bN
	 eIAzvKreQY9AeA4lwmVhro6G38HcdyoehLBJXOjXm78OmwF3E7h7u2H5hRVG+ir2iuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=Hz8jK3d+;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2A760A2624
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 17:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF2A760A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=Hz8jK3d+
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1f403aca0so523455e9.3
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 10:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690475; x=1793295275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHlWMfT2Vn1jhxwuk47U/QSe3Sx/Rh/6scTTXAvnAJ4=;
        b=Hz8jK3d+/7oEwRtXqRZMtdhfq7MFY8o/ekyuqOcEE7muK94sJhmnUcxBQ9dqOPU+kw
         lPKv5D53LnTlvPmLXFiFsew4Hl0ljGdeGGbMx/TNOpkDTVmG6646/pNjjfcR5grueRKR
         fZRfj71/1PdrbVJyKenanHLh2JbKLWIOIOQQs0ADAdXsgkUGG1hQ+KW5J++cFTAWziVr
         5DXgKELTQY7RKM5EX7Wrw/bj6Y47fkcFTd1TWYBM15JIkYoEoCQS6PaPwvFIgq4FnysS
         y2GErTSI37mqIeqF2j2TS2Vq4k6aA+SxBdZtKLrxde/ujHMkkMoIsaoNwZedrraMGDHq
         9rgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690475; x=1793295275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHlWMfT2Vn1jhxwuk47U/QSe3Sx/Rh/6scTTXAvnAJ4=;
        b=hu5qXIHnJiqq8A5Ub/J/PEOPKJPIPaFvlOLr8wBCelk6aMlNGvnZx5A9Da8liwq4uI
         jVGrfGeynjBapM4hPdaYkj95aDit1FogLUveE6x0uTlWVNx6gy6CfhqDo0FWSarXJHE3
         HdRTD99lVJTJxIoypaRaT6M9zEemmqx9gUs6LjpZiN2ruqCkxjlekJ+tTadLA44CHv9m
         WgD4HVNccVmTyuaKApNmPy8mFj3kizrcs1K/wATCnHewuWpCNdsRBRRON6qZ5kPA008+
         m9Rz44fgSqZkYBYYdHrsFnztPiUrlnCjLticsEp68MQVmzuiAj90hr3B7aIFOJZXdXuR
         14TQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+gFpuYtxlpwSVxL8G7mJv+37pomCH6DfJBruBeKEy8aRkbVdByz9N3UBuaHrVFIqp6zBLYWDRSoy2ng==@vger.kernel.org
X-Gm-Message-State: AFq9FYL/PNwxfE1Xz33PRxXa9SCJuRrklSvhjrB+rTXXxqsI8UDY/BEP
	q/1NMHgiKD9o5noiNFRBG/KDIGJ/lLU2VmdNLmdq53HOJ7Z2uw3vXKVMSCfZwCl80SA=
X-Gm-Gg: AYBFou2sMw+HFW1oAEDqU1Q8oMYNPHFNuuF+n7uFi9ybXcrJqqFkAOshX7rN6WFQOod
	+2gNHHA1DNSu0W6gJwEvmyPCyMm+q8uLnf6gHUicOmMY7BP5+9Inm6pH7xh5ZxOGdFY6S9M0E/U
	+8uhkNo6F7bdf/PdvUNQDHILxq1IaDXJzFlfAgk+YTwoCnky5vtmbK8RYs++0NMaoPGkJviJ+JM
	vgkH1hLbA6YHM07hDqrY+Jl9AwEvj7TH6+uoiv++hQCFiDKh05xPIGNeEhDkcU4Q+HcvkI0Y7EE
	EYSRiHArK5Eejcz9GD2oXxTEAPCk6/D8xigOp6HyqkD7EAzs+6Iytyg0+Zwomg9ODkl7UO7aC5t
	+w7exBWGoFQbMw5lHA3uozqMKckwH4+AJvWdSKLqgDAiOkKTb1z/cVJ8k0DS/JpDAhtAwrYdGco
	v/i3RQbaDm/HHGmGERMv2LDCZdDH+a/qmYrRKyTw1c4yMtFOnBmDz8/kmoJzU4RFPZn4z9j3kuj
	Iedo5nCZsQYUZrG4ieyBx9wcPYp8PApBz1VpWGb532JOO6ZKU7anxdZ1Nmlpi+h1gTxIjrnh/ZB
	JnA3v70zhPwkdeIaR5PNriBOkt4n0PQ=
X-Received: by 2002:a05:600c:c094:b0:4a1:faa1:3813 with SMTP id 5b1f17b1804b1-4a1fdd26e79mr104625315e9.27.1792690475189;
        Thu, 22 Oct 2026 10:34:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:34 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:00 +0100
Subject: [PATCH v6 07/18] media: sony-starvis2: Correct the exposure range
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-media-starvis2-v6-7-374343f55fd3@raspberrypi.com>
References: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
In-Reply-To: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
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
index 340f2ff0ef87..84f3978e1eda 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -62,10 +62,10 @@
 
 /* SHR internal */
 #define STARVIS2_REG_SHR		CCI_REG24_LE(0x3050)
-#define STARVIS2_SHR_MIN		8
+#define STARVIS2_SHR_MIN		4
 
 /* Exposure control */
-#define STARVIS2_EXPOSURE_MIN		2
+#define STARVIS2_EXPOSURE_MIN		1
 #define STARVIS2_EXPOSURE_STEP		1
 #define STARVIS2_EXPOSURE_DEFAULT	1000
 

-- 
2.34.1

