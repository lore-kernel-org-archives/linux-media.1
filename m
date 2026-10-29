Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283527;
	b=of0a2Z6G+T8/pJc23hRIDxvQ/zdcd4UPiA8HRRV4feg/HurZNUZTd/tELfkiHFBOialn
	 /ShFCkGUQiu5Zsd26e72c9gr0y3GYyJdR7ceFbZ2IV9V2MFdZc7h+I6OUXZ1YQTNoQ71R
	 6kljn7JlThAvv1xiPRUXb4jAvR9qm8xBHzooSuia1b+Yf96ryEiTDPicvBEZHFhoZdJpb
	 xgxp/JxtVSfPyWdvE3caUaAmksHOa9cTZ/Xdr+BdrHoII9T9cckgqt0BfOOcbwaL3Zbvv
	 +BbjdyfsP7uniSljVf+YqGcZdKcqQFKx+nGnnYiw1KxNoTOlaCLaMFOmdM6kUrdcxeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tHlWMfT2Vn1jhxwuk47U/QSe3Sx/Rh/6scTTXAvnAJ4=;
	b=gdzye/DkyLtcjCrwua0WqwG7uGDQmFowIOwBb2dehOLxzGIq2cKEN9R2dE9uP4kJYyWg
	 ReUpnENq/r4XQt+7HNnCHUVI644zFdqVf2/QfTsHThImBm7gTlI2ICt9lX3r4GKcWyOCt
	 M2/rbBOlHV9SMRMd/UwZ4xHMBvCRbMGdx/QpEZoAwcy0V/pQNt8Swsypv7Gg36vp/x5FJ
	 SC9HIMDG4i7ohYvKbhsG++eAxuMAo22UDH3ZFMhcOuPSvHpqB7Ho04h+GZ2gu+aFnS8bw
	 1bhAoLKJA9+wc4XVb2p5vZW/ZBGj6AUdnt8qYea9xJIV3YrfL6peRRipgZ64zgcOAQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=bWm0dQkz;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA61606A33C
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 14:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EA61606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=bWm0dQkz
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so20760875e9.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 07:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283525; x=1793888325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHlWMfT2Vn1jhxwuk47U/QSe3Sx/Rh/6scTTXAvnAJ4=;
        b=bWm0dQkztkYizwWCP34VIfP1DON5PvhHEyCQatuotCAcG+azmFpZdBMZTGIYQ5fc7P
         0iEx18wENBbiDwBfY/zYvdy8/Wa4Tvkkse0kL71/K4HC1cmUysHdMIXtczIh/pmaLub2
         nWIVHUwMKFVmEV0+NClbfKESCXh/4kFQOOtU7gj3gs6xUK+GL/Mc8WfOq9Ness1cWRIH
         jVPGpGEuCAY/7gc5hTvZq/2YwccMq+noBCbfmtWmavp/hmZYyrv0Lc23mmIIeEWAeYHY
         ELNX5An6absThM2aEiXDXCzCqmDqtaHlzeprqmqHTyeywocs76/WICTqCyPTk60rxI3w
         8xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283525; x=1793888325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHlWMfT2Vn1jhxwuk47U/QSe3Sx/Rh/6scTTXAvnAJ4=;
        b=maL63/Xww67RwIuMa3X/SDo2JMSo2JRNOUdJODCcvGC18sKZ3thDL0xh6+sOraDexv
         Urm4yVnjlm5CExq9TMBPj5d7uSBzC3TmmFwT03BqdsOH+oBjpGJl2avoj+k67m+HRnjW
         L9yxMR19dquevCA9SBR0jGmdZk7/FYoH7h2IRJu00hJVbrlNEGPGc6VIZ2giLEzwAAph
         NAM5h60tVlzm60dDmKeSFwVt54QqRfSDuhEXIQ2QDrrUF/JJ+eTCLTNAbNJGzJfWb3pJ
         olG8D8CJfHWnDpIYEGXYAdFNlBrAmB8hC1EsU1t+TjLHeQtPtJF3ALv2ZS9iNGuQV5TK
         oZSw==
X-Forwarded-Encrypted: i=1; AKwUvBzB/jOvpORJPYBjiM6C88d4lUqmeARUqtrwjyc1TsC/46F390yOFo8U75lUJmIYIstLakvejIImBbIOWQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLG1tmYzeOv6qdPIf7D/KX/OXJazaZehdE20KlNSwbb09cocja0
	XXNKg7p5GSygwd0ByANKCeF6lPk+TS8RnKmLiS+WANrBNNKEp7OLHHYtnLsNttfHa4A=
X-Gm-Gg: AYBFou08jBDgONoUaC0U08yKYShdmRiwnKLI2kkLjIpBoUu05xGpdZ1TI3ePApDGpeY
	VE4Z3nuXdtp2FPgZQIIt2fC3scVL9USgP/f1sI+1aJ7CTcHtGgGGNeFprwXXT+sb28hQnnjrKCR
	XS0qRutMODkeGsybyWeEOFKJdnxmWXe0M80PHNr+COFpSVMbJLOwS41KKNWjnBOIzb1w0TTcHjY
	cD5RJbzClJzG4eq6S9tdJDictvinmO7VjAb/RUbP5M0W/ZY9ZCN5bMDxsKdBxG9pI0Qk4MfQW7d
	U7LQIWBFybMbjcBe8oo3XPtfgfcPHN3BSFRAZ2pDKUvAMCMMUIOapuWUNd0EeilFn4QZffavJbn
	hYxe+sIN7BFZpRXHPEuiGsW8zTo6cnYX7p82zZLbLe1OR/Pnv2VgYKGZblUZkhl58fk6JQ9y3h5
	iGqNMKDJOyAhri9vpRyoW6wTvAtVmIFopvfyEbqKQiKjYkzp9igtzItYA1FnHNrvmqbRko00LoX
	Pt/7C8lwFdCWgqXhSRvir2vNSowhyhANkGrMMyf11wGQY2umz9Kk4u1ahE2GYfr35uGexzkqtFy
	wSGkM8iF4wYPaUpf24ALYAgMrOI+smRdeZk+R8g37iPgxgcvJIo7wL5mNZLP8t8NAAbPRLQBPFa
	1CbzL
X-Received: by 2002:a05:600c:810c:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4a967e8d6e2mr126926415e9.28.1793283525362;
        Thu, 29 Oct 2026 07:18:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:44 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:28 +0000
Subject: [PATCH v7 07/18] media: sony-starvis2: Correct the exposure range
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
Message-Id: <20261029-media-starvis2-v7-7-b33a1332fdfc@raspberrypi.com>
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
In-Reply-To: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
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

