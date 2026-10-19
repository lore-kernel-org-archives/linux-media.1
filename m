Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24B0572EB3
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 14:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420116; cv=none; b=t5vYFwttE1VOAB1cnIrOKn34hkjkY5r2h+0zOmBDoYGHn+Fhiol2Ylim5whFqoYnNYgGE+4r1/Wuf6Xe5Xd2THczHJwJpLj76saf1HtGjmp0mKl85T511/fXf/8F7PNMSYtibtp4IXOp2fsCEaso5GfSWxbh/5aGbhCipfp9ywY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420116; c=relaxed/simple;
	bh=QrUTULrAzmLGnxNb3WOiSw1gB5Q7qbOJEVQG/tEUjDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pDo0so5a/OmthzpWABfn2QVOH9X95rIrbrwFS82VzN2jLZ3cRmnDwqCwkPUv+Mk+Nh4JMeHQ/viVklTCpTbCq26QxT7t4uOExg56aaHQUvObQbss/LgTRnNhV8uio3VECrLJ+pogQE+G4Cr9oAw5z8sT48SgPSroqseJB+6aSus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=qzlYK/wi; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="qzlYK/wi"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1e3b87ac5so11183875e9.1
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 07:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420112; x=1793024912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kul4vFEXVE06RfU7X7+iYlSBqPrNkIOuPBTEB3ZLc2M=;
        b=qzlYK/wirqDyEf5/bvh+XcNZTJHNa5KDU4/nMcSa0U3nQLojXu3A6qi/dmRLND/7fo
         nUXrJNdT1sBUD/f2saGJEeYgSJEbNEwDf60J7xZJ35qacnvwq65Ko3TE6Nj8a0c7wrDE
         +whq8D6C9vWVNQmNlSA1aZTTFZWFWO5sGiQAB3b8zETKbY4WXODkOQtBMEIsFD2puHWa
         RMJk38WA2AFZli9dmVjl0FIXNv3/Pe4wEr2bDuASTJV/6Fnb9o5z8vqxmfFntZEBF8zj
         tFwcfSYizAez0CNkjAX/+OiUku6wBhj6yBkIzX3bwJrPdus9TxcDEhbihs6zYAhZD2GR
         yInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420112; x=1793024912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kul4vFEXVE06RfU7X7+iYlSBqPrNkIOuPBTEB3ZLc2M=;
        b=Hwz9REAuQ5WgV8unJRZQL+FK0n764dwzddgAVWY7sZV/H2LZuP7/wg9WrkTHZcvbg/
         6Upwaed6YfUFs4JeYT2BHrW+rUjZENs21w8FCgJ+Gd7vjEfzqpMnHbmCxbd+B4wY5RGc
         UUjLqsToj8ctqUe2RtLYGCM4hWxBrcU/myVUoAVtTSbHbVMdG5S1tCYePBr8o+eF3fFE
         Zo2eYee93RTx6Ee3fKqqoXDpH0c0fq3CSvjJ4qIIN8Rs3pKMwvZrmaM0+ZsITGF7rtc3
         9XZ0aT5akq36asnVWI2cP8sSfzWJbY2jePQAaa4xuYtHBKl5lqVuQ03UnT7kO4+EzJEV
         1vSw==
X-Forwarded-Encrypted: i=1; AKwUvByaV425FtXEZmSMVmuqaHLx/WtnA4XRUwqSGs870B+Ds/EA5WKV+LlpA9bVDIenVpZAmYHRVsFHgqx4vA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJDo3/FzQ0kGfB2eLIg4ZNjvH1lzCJ0XOm9n8rvDm8/HNLfQ8KT
	Bs+P1smgPEFLjyHY7Xdp0U+20MeMu6QYdCaYj77M16yxPrFHLb0J60ME1hASMqYD4PA=
X-Gm-Gg: AYBFou1qz0akKzOjplaN2dqgrllNVc1dUW2zAq0vwhre0tZtEuHZ0IpHzl+jwUvVHK4
	TgGSxUE1PTxiIOg6J7sW1hr7E3ka1c0/3ClvSZpFg6Yexu8YaLjSvVBwaS4JseE2i0FP8L8TJfy
	hJq96/W3iwUitjAyowhnppGxHoXrB/uaz5Jvl5y4cPWkls+Aih+XGR769zQW1JpjZdqEIvy6M5M
	HyV0msGpfpTCLVB+Snl+LzoiX6rOExLWKwnIU3AeoZrbHslNWVVaX+WJ0A0uDlROXlWNCp4NtP7
	nbAbaRvDBKBicuW3ra9Oj7BwLoAn71XMmOzA65nXhFP4gGX4Tr51UQPehVFQFZJ83adZNosQSjd
	3GJlExzDEbxa5t9UoAUSESfMTOpg7GmO2JxuZ/GbWkeajU+4F/VzPLZlYP3UMbVf0dJXSPi/ksO
	fl+s7es8sZowRhgyKZUrqGdfNaDKDsjrScuooSZEJk9YUpDP8gNfupUGq52F/sStsNBcJq5MXX3
	gZGDPTKKYHOqieTBFo/q3DQnLyIMNpY+tZDEdFb5I7kaNlELQ==
X-Received: by 2002:a05:600c:1394:b0:4a1:d492:1604 with SMTP id 5b1f17b1804b1-4a1d75f2524mr173737685e9.11.1792420111387;
        Mon, 19 Oct 2026 07:28:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:30 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:28:14 +0100
Subject: [PATCH v5 07/16] media: sony-starvis2: Correct the exposure range
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-media-starvis2-v5-7-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
In-Reply-To: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
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
index 56fa2d5ea3fe..1c3dcae5e0a4 100644
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

