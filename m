Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690478;
	b=xdng6/nasNs4EimQdNmbWNXItn94hm/Pms+f5hc/KhT0VVIFLopPNtMjvCW6RSqzUJdZ
	 5mkjBITcnZkmZMgBxyeMIOJmOVWBiN/lOpcR86rESulLN1eI5CEy8c9f3Hzj10x20CR9+
	 1wJXkBA0MChaEIVN3qZVWY7s80vSsMR+EryFAtdkHCIBRBbQiZsr74mhwJTuZOABoUP7L
	 BEDfI78Kg3G8E0P+noQYf26dVT28DdxRPQMjGPb1NYQVg1fZ7qJFTjLCsivXyzdIQ53kz
	 uBBcCZKTzB+XP3IJB+dfjkiNMu8r5Sqvws4fDkgXPbf7UjyLz5RNEYyb1/jyXPzV/ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8ukfyerQ0BNQwVLXMA6bWcXy9Z460lzQtyxZ+Xp8q7Y=;
	b=zkY1G8uR5ynrwqhbEAAjKEKlA7T9mTtXz3sQDC1yGyWfmstPnV6KQxP6JdWka7A2c+jS
	 3Vhx+MVKx7jNNV8X4yo1r46z+Nfzk0F53GlfX87/H/rDm2d+6YDgJge2nnzaUMUV+dU9v
	 VVgk1IxnN2LIIu3yrx15Z0hAzgpoXIMw5rjM+kVxcHkBrGdAUC8m0X4MxLV4PeTrugZ/I
	 N8WAjL5dQuxEXhNo+mob4dYsHbG0FQ9RRXNenZODBclZcVnLZpn/hF784W+Eh/kH+OeM+
	 ryHAHzkKsnI+S3SBxwedxgN99LCw27fjr97KkaFQ7vA0rm7x0DOO66HtktoLeXJ4ApA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=GuSzEIZy;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAD160A2606
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 17:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDAD160A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=GuSzEIZy
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so629195e9.1
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 10:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690476; x=1793295276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ukfyerQ0BNQwVLXMA6bWcXy9Z460lzQtyxZ+Xp8q7Y=;
        b=GuSzEIZyN7jOQxTJ65Rk9qi0lbnn8bP/ve+H7SjgcOlVqiBy1i6cOhzLImlATHmmZS
         B1YWxP1QHNsIzv0uYQtYUZ62IeIUtdlKvmCQBVtqH4qKRujPFt860Jemstx0U39zWEWW
         aMPQ10bQpsgLub8+5dtEwNCMljs5IaMW+yB0HXR90DbwqXy+K2z/7ggG+A5wZIPxW9gt
         kFbMqmd1ru8FFYo+lDq1W1+CQZBDSMfC23uGDRCe0t2iNZATbjI+QNj74EsdexkMEeaZ
         kriBCRQxXskyoIGUXnY+/vY0nJ5QrydHSDx4NGDWx/BB7FtoQbDP349bg7ZyHeRtfyt4
         ttUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690476; x=1793295276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ukfyerQ0BNQwVLXMA6bWcXy9Z460lzQtyxZ+Xp8q7Y=;
        b=ibOHP38GFtTyY0v9vm/X5YpW//f0xY/M69zWTuaUkRC905LIkD+Ze2QMEPHMNAq3Fr
         8mErONcBrpgsC4X6ryjhiRKfXiyLNM9sGyllkASc+IIkLfm/yv7JwBDjQJ6C3pYsAtWf
         7E2W7rRmwlKYoeEvxnY4ArDrIoFk9NF3rWxrjEprvNL5bBNXkrvLdK3eIVr/RAPszMy6
         5Zc4pWMasw34T6HaZGefyReJOi0OwNdRN5JSkDihbhsNY0Ayh7DcAOV2nJi/+BdZK1hO
         GjGrmMg0dFPei5GcQkZ/I5BlL6l8CrO1kMGOdn6JXD2GZFuZ99DymLu8bG21IO2k+I+/
         e1NQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+GY7mERn8Ui0KOh7FsmvzYNyz/CLPHQVG4OxIal+cxUVHw+jT9S2fmxzWjh+S/cKUDBHDC9CYNzNOSw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLs2bSDwR3GneWyott6/g+u9hTd56LV1omXNu0hjTY8MTknlr0N
	NLM8j+Gzgk1s4/Uq7tRd1zplusCUKmaGBFZKiN/+DyFx1SjID+cAXa6TaV5sNFb23P4=
X-Gm-Gg: AYBFou0XgAXXHT4R+qtB+MOYP9gfY/eh6tdNbHT4RjD/Oh+rDV+FY8IPl9j3DZXIP8f
	OM9SeZq42G9rEJZv4H8Bhm9FuJkmiBgmOx8iXxzyua0KU+hSM2qhzVORV4LINbtgmCRVav8fubf
	N1Oc3DGnzvyRw0vYr3Tgflsf7ts/YDI++c3uy2JdFzwZJS4fBHvDoziu/RCjAh2IxITE3No3VGc
	qeR4AN5oS+ZwMxqTb64AxyzSi5xEI9iDMrdKzJ6oddU3N0Ka6ywDNTmWQi46KdKZVu+g8db6odA
	kucix+cuiq8q1qzcN3Kx1tg4NsVw8NUPuuRz04LSuI4SLRw47IXJteTM1KEjDBY0EgeVT9TiBzK
	bvXX+Nct0NzmznHQ009glXDQ9L3w7bAO/vSK7mqrirK2h8xRJqKAD00bSXF2VU5Q+ikNAqAE7q8
	fqlvfdwLQhW2cVJolMX/yGyAkNDYGLRJlaAkQQ/kScA2mNviJaxj8e2hPoJ2i3XsUYOaLasdu9j
	ecgyzAvG2IVswVEpe4dRRc3+/dML0YepkixyBREi5wYw1Z8Yv8zTgoVvsBUL2hV4NycuwHyW5c7
	Z0sa2PRenBcPZ8vUwsQyPH5RlVFiZ7I=
X-Received: by 2002:a05:600c:13d6:b0:4a1:d2e5:aa35 with SMTP id 5b1f17b1804b1-4a1fdd2344emr84423855e9.19.1792690476284;
        Thu, 22 Oct 2026 10:34:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:35 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:01 +0100
Subject: [PATCH v6 08/18] media: sony-starvis2: Put module into standby
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
Message-Id: <20261022-media-starvis2-v6-8-374343f55fd3@raspberrypi.com>
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

