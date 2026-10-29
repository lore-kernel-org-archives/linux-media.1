Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283528;
	b=wp01/IZ8qnD3SwAzdDiun7ahzuGd34ib3kYuPqvqx7Z19//bCKpZYO6UnF0qKMLz4ptp
	 5RznkvD1d+S1GJR60vP/zkKfg1TBssjF/E6uGZ9RBaliNr0sq69KtwC1e6535lxLiWbDB
	 hpbdocMDb9wtDGbDMdbe+/cHzq6dgbL0fBv89zXHe9PSbrXqotfZ9qDsBQ4ngr9Dzg2Wl
	 KcXLTORvuXC/jnOy9hQFncP8RmDtqyh43F0QzJJcMFUSQAy2DFURQJI7+3dSRYCN+fgeY
	 w/q1H3S9C1hej+65s1of4gKYHfUKdov3idMbTCG8bBeKS6c8v7cvfNy3yTFb8I3LCHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8ukfyerQ0BNQwVLXMA6bWcXy9Z460lzQtyxZ+Xp8q7Y=;
	b=gqsQc/nTnHxOx+Hw3qgJyXZFLWT4cN/1A1qjG0YN2wCmdBFe4KsR5PiSo88sd8PFKcYu
	 4dEGRoLqUo4kKnG4D62CnJK9r4wwN0krfpdq2JLtOJRfMhjT+ka5UPB901lt5CYSL4kXZ
	 OM95RfnN7Vu2Jersxcl1K5rU1lrAWG4gFuaZUkD7JTu5F/fNjQ/yWZwPTZ5Wu5I1+VS5I
	 qIsloMheSyWv9QYYYf4nGKykNKJ+1p9tRxoP3Kndn3JGhmz8Oq3RMBNIKr5NI/Rnr0G3M
	 F/rL69/umSmEHIqy+sL99O/5M9PETXp7Qp836KJYAh1glaadtkvgLKJur71XUPqA+WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=erYCAd+Y;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B9B60A3824
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 14:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2B9B60A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=erYCAd+Y
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so26293665e9.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 07:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283526; x=1793888326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ukfyerQ0BNQwVLXMA6bWcXy9Z460lzQtyxZ+Xp8q7Y=;
        b=erYCAd+YzEWa9UGAOz3SXnve57b/PfEiNXFDorTVJd9u/DmTRd0cbA6tqR2bF4MOSU
         9NT9ZYVcOv8Xhuh/STL1V5VcOTlpe7yWe0hZov3//bPJIBIFgqmTz7UoJWlanqMLg8vG
         gc9lVwOMxCzCl2/igOCi9oUHT0G8ViVIarprTVY88OPPlCnolpWVspD9SUTz+hhrLdHE
         LNXY6kP7jDv4hJaFbpIYdzwccd2sbGi/JW/NLqTAbodSxlxIV5WoIsxdOICh5qqviXw5
         wx/YLRkUEVushHX3GHwz0wrk8qlDeLgTvA5J9v0fnEf9P4Kpm6TK26/VRRx4oAFT7Uee
         A2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283526; x=1793888326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ukfyerQ0BNQwVLXMA6bWcXy9Z460lzQtyxZ+Xp8q7Y=;
        b=mhU1KOhoxGaMVQSMkuCDVUs0IMSqT1Eobt0hWtFVbKKiS/dHEJi2QK4mkRczdnqNtK
         jytKXLvOeASpHKTa8ICVJW1+ej7PkhEqhVEs1IZtMB+kDjMF2bUkpeLM0oP4xrTnQbm7
         4G6ICERQrB1I0cJV6HMO/aQBboDgEs2IvPMLy6BWwERm3jHV7D+culzkbyscwL7kk41n
         VQlJzMME1Y8kYzKF6AL1IP8X0LP/k+/4Y0EAYHZy01qNuZGg10TvvK4EZwP1hqxr7j1w
         lb78KTBzwBWZIxDTZj4fWKa0N0+dzoS2XBQpc6uwTPABEMYxTTIFlQsrksrIu4yFH2UD
         RpZQ==
X-Forwarded-Encrypted: i=1; AKwUvByP25p1P2PjVgFaJOTmbeAZgcMFU7uHaifF/z28n3hGzgtu9e3ciu5Lunqs1toeOTPBhxFdq8rd/u/NVw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI/l35/DyZT3pSpUY3axKyXOPSX7RRMw6yMCLy/yHRZNjScXcNg
	Uxy3ghH7il1CILJW8QK5K9jOSbA9+e3noynl+/IV2e62gFANDYFHDjYmTctAqVdeI5g=
X-Gm-Gg: AYBFou03OE3cXN4phW6HOQXfV57brgJXOOhZS9VyYfC7HoGHITxIQ+sTgeSzRWpMM1Q
	waYtPLW+8wmTV0RSHpIf5Ivd/7GOtS3gx0+cjUHGut0vIzIiPk1FMK7rbOci3wMwrQEwbCpTZo1
	vS06h0FqOK1vJfm1zZz3v0Tljs6Kds3rbBGmCWq6N5RVwdT/Tabg4UypIQGxc9ld0iVnZI0sbwC
	FJ1pqdviSQ+ULxWdqEsT+gmyN5nxsBvrvxc3Ij+j+DshxkgaXy7IwdwPJm7ISBVCI3Qt2vLfPRP
	djt2UuKmKg8qEAf6qyN7IuDM1XW1YP6LF8zPLWS4ySs+8umc0pweINqb/+/EK+LaU+ceM0fLkEz
	7v0y09cN8zr521XtCiTARx0eu+6YAUDYlv+elmV4MzNPfgvrV9+NMu9429uHt5X8oI7aQQyuQdh
	33j/1YDetLTb9U5rIjrNVJmYHZawZSlTd60uI1YFKt73MPKLkZMCFwQ2dYzkEe7aYo0MGmmGxyF
	z2H0YLNUnnRpIK9R+6RTrPsCKtC+Nz4hdpM0u8BlX6KH4w05An2gJxvPW6qxVOSofcexW9hN6yW
	UlDgMZn9hlBXJlBfe9IhSk3kZA3I4GwHWljRPbcJM3Y/W2ajFKhXCebTxFYkEcpSyVIaMgaBmv0
	56/ng
X-Received: by 2002:a05:600c:37c3:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4a96701830cmr125321535e9.25.1793283526321;
        Thu, 29 Oct 2026 07:18:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:45 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:29 +0000
Subject: [PATCH v7 08/18] media: sony-starvis2: Put module into standby
 after identify
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
Message-Id: <20261029-media-starvis2-v7-8-b33a1332fdfc@raspberrypi.com>
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

The module has to be brought out of standby in order to read
some of the identification registers. Whilst it would be
powered down via pm_runtime, should that be disabled it would
be left in streaming mode.

Restore standby mode after identify.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 84f3978e1eda..95da8a9e671e 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -1162,7 +1162,8 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	 * This sensor's ID registers become accessible 80ms after coming out
 	 * of STANDBY mode.
 	 */
-	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT, 0, &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT,
+		  STARVIS2_MODE_STREAMING, &ret);
 	fsleep(STARVIS2_MODULE_ID_DELAY);
 
 	cci_read(starvis2->cci, variant->id_reg, &val, &ret);
@@ -1170,14 +1171,15 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	if (ret) {
 		dev_err(&client->dev,
 			"I2C transaction failed ret = %d\n", ret);
-		return ret;
+		goto err_standby;
 	}
 
 	val &= variant->id_mask;
 	if (val != variant->id_value) {
 		dev_err(&client->dev, "Chip ID mismatch: %x!=%llx\n",
 			variant->id_value, val);
-		return -ENXIO;
+		ret = -ENXIO;
+		goto err_standby;
 	}
 
 	cci_read(starvis2->cci, STARVIS2_REG_MONOCHROME, &val, &ret);
@@ -1185,7 +1187,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	if (ret) {
 		dev_err(&client->dev,
 			"I2C transaction failed ret = %d\n", ret);
-		return ret;
+		goto err_standby;
 	}
 
 	detected = val & STARVIS2_TYPE;
@@ -1207,7 +1209,10 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	}
 	starvis2->variant = starvis2->info->variant;
 
-	return 0;
+err_standby:
+	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT,
+		  STARVIS2_MODE_STANDBY, NULL);
+	return ret;
 }
 
 static const struct v4l2_subdev_video_ops starvis2_video_ops = {

-- 
2.34.1

