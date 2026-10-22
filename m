Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690486;
	b=D/leUOmXKL1kG7Y18zER1HUjjVYmFyilPtGTkrQ5HaToMF9TcUZtRgHOSxYVcBJxObci
	 cvxueQVX1LRF+gA6xZvwLPv32phoCA9OCEJE+wZuhKC6GOp4nByV9ADVRvRDNjAvII0dQ
	 C8vB1Ql4EKTH6JH/Us5lUUJeY3E1T8GihFpTIu6RiNMfHGwYKDqH2kOiOSHPx8dTjUnJL
	 40mA5Xlacm7qEJJCEIG721gqieO39pgY4EFycW2O7ehegm4Sf4thoedTzzhYgYjXuxZIS
	 +2FyrDZ7trPNIqekLSgTAGOUMLJsP1PCJNmBmqQtjxUIes6sunEU2iod4lOuJxQtM2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SpPolyfzJYMmE5VU9BMzMFqCxVbYb3ZUGO3YoElucf4=;
	b=v+AFE4boeFVwXX6Ux9lvRBFHIOIEcNCZ9VR3xD3LRNIRHGsnSNqx89zxnanfF3liuCY3
	 gnQ1ZOSfJYKk3pOttVH+MSWFr0QzBW5XVoEJ8s9clzDNHZaMCJGRKDIqhZP9B8/I78HFg
	 J6RLns8hb5J+bmaZ+ZvNQIrhe+EVBpnEAUIpWuLV1g+6VIXJk+KaGflB/KyUganwoHvVL
	 ni/ZIuYfAaUy/68ajxsuIQBsrmJyc6cexkd3Y0QBRYv3P+VkCrxw1lPMctLcrfFQV/HaH
	 Kx7z51rNEnC48gwTmiJdTtUqw/1cmHUD1u1po3bZ9ipDQ9uGnMC/Xdn7QzK1NqQBb/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=ccXMW09i;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8957F606A319
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 17:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8957F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=ccXMW09i
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso299025e9.2
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 10:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690485; x=1793295285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpPolyfzJYMmE5VU9BMzMFqCxVbYb3ZUGO3YoElucf4=;
        b=ccXMW09isYUy4ucoPunTFXnFO/iXlPSy6aXP4EVOxAe+qe0fateYkqiy6N1AUhgjC/
         Ks1/d2sr0e/kjoLoKqnFgKGZsed1bFfxVMFHkGE6mfaXS7uEqQlJqUWvQhkIRxAV0B0h
         +SCyFrIIG+wt5OUh+ROZbCwgRxxFE64TDlaEjXE4UJP8+vHnCR+zoRDw1XqYr2FbeHew
         /4d+BBdixZykwXTHrz8PoUCVgVa7rMit/zHcJYXonnjWFKO0e59cnT2Q2rgchmGGmPvU
         9TnG0BFxQdg5lIwKYEXKiTRCR20UWIvipDKIaHASNfKeu+xX+ae4/J44eYqskzbDOfzL
         j5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690485; x=1793295285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SpPolyfzJYMmE5VU9BMzMFqCxVbYb3ZUGO3YoElucf4=;
        b=JNtxZ4Vj0gFQV2EK6Xhr51tlru14oMDWkj0PBInhL49sFE3tXKnG/SnA/d1eWaFmAQ
         TUEYE+ceefY0ZNaw6duoRtednViM+FCq1Je2J4J0EzWKt9rOR6A1SfI2ssuFYmaM6EpC
         Tu0EUYIQIzA+C7WbiJ8dK4XyrWcRFgoM788qpD0BYNe7uO4vnQk6xII0r3triVh20BkF
         rnyRtrvi1zi4R/r39NwK61WMLTIDT5Di0vFLbSyBiVmPG5IaR4Nl8zmzZonXyIRRJT4H
         fFzRFxW7REXIcS4ACszAAfUtFzKSQOmcYgomNttVtXm8J9XstAfdrG0hZDhTHdU5rSjp
         CaRA==
X-Forwarded-Encrypted: i=1; AKwUvBzh9c77CdO2B5jilLXh+qBz/f7rEbDKcdgZN9rYa1pdY7qNANwEoIB5bcFjGjOMVhyueo1n+kxflLxUYA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIs5sEIc/E3+Fx2+9g+ifEhMevTU8reI0rPrs/cdo8Py9cSk1EE
	uAm2vpLlzbhONCoj7Q0lOdICy2f4qtwJoU+CR95tBo7LNXrOHupEIr9hxB4PopAtIHs=
X-Gm-Gg: AYBFou1vaRVyL+G9d3vyqnXX+u2QA1RXycd49qm5OHsuYh763n+qllrlClv5qnVQDTO
	LkRRjGSjSMcOk6troWiJeMSgD527OUeIqwunn++f3IHtT6mkFEenwspzU2M4byQb+ctm04Kxqc9
	nQL1Qlkw8NNpeFU+I5f6PNpPxvHEoDxtg1i0yFaqxVHNxS0UFOKVBkEQwGXXUVjJSt25/xYk1Rm
	QR7c5T0ZloFqDBd1WtVy0B404+7mr7ylTeVRlQzCr91hLkHLl9FyTYYaUVvBnvAygs0KEKSdcrL
	LTw1ElhXFgW1ZYK8Wtlu4P2qlkQRFpKSrdLJVJVNA7vFRlcAg/9J2mZMdZJuG/DoXVSMv2I+IjE
	+z9Cavu0DKQ0ws5QzW+E50MwzT2VhfS5o5eLJ3rwAFArCnag1zPwx+MLqx7WtqhR1ddltHkz42S
	BUaARJijx6GnVe4BU9XneH/0yBPQa6iXJiRg9YGubymSEALDd4cPbYAqX4ao7fGiAtOxYhnwXlb
	RD8YdyQgM2rjd8XrjtspPNn9cmiJF5eFQ7bUYA6eP9QoC71MzVuIG2sx5RRiZEASiAwhaNYRDyn
	vlqkrDDG/90IkPhLApGkQ2sUZTRgfHAWlViMGLPWU7sGA7mp/H8h
X-Received: by 2002:adf:d00e:0:b0:48c:7083:be67 with SMTP id ffacd0b85a97d-48e264cf195mr9675789f8f.42.1792690484990;
        Thu, 22 Oct 2026 10:34:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:44 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:09 +0100
Subject: [PATCH v6 16/18] media: sony-starvis2: Parameterise the mono ID
 register
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
Message-Id: <20261022-media-starvis2-v6-16-374343f55fd3@raspberrypi.com>
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

All sensors to this point have used register 0x4d18[0]
to signal whether it is a mono or colour module.
IMX585 uses a different register (0x5a18[0]), so parameterise
which register to use.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 15d5a066a556..b526ea3ce2e4 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -97,7 +97,6 @@
 #define STARVIS2_REG_WINMODEV		CCI_REG8(0x3021)
 
 /* Sensor Identification */
-#define STARVIS2_REG_MONOCHROME		CCI_REG8(0x4d18)
 #define STARVIS2_TYPE			BIT(0)
 #define STARVIS2_MODULE_ID_DELAY	80000
 
@@ -629,6 +628,7 @@ struct starvis2_variant {
 	u32 id_mask;
 	u32 id_value;
 	u32 interface_sel_reg;
+	u32 mono_id_reg;
 	struct v4l2_rect native_area;
 	struct v4l2_rect active_area;
 	u64 pixel_rate;
@@ -649,6 +649,7 @@ static const struct starvis2_variant imx678_variant_def = {
 	.id_mask = 0x3ff,
 	.id_value = 0x2a6,
 	.interface_sel_reg = CCI_REG8(0x4e3c),
+	.mono_id_reg = CCI_REG8(0x4d18),
 	.native_area = {
 		.top = 0,
 		.left = 0,
@@ -782,6 +783,7 @@ static const struct starvis2_variant imx662_variant_def = {
 	.id_reg = CCI_REG16_LE(0x4d1c),
 	.id_mask = 0x3ff,
 	.id_value = 0x296,
+	.mono_id_reg = CCI_REG8(0x4d18),
 	.native_area = {
 		.top = 0,
 		.left = 0,
@@ -972,6 +974,7 @@ static const struct starvis2_variant imx675_variant_def = {
 	.id_reg = CCI_REG16_LE(0x4d12),
 	.id_mask = 0xfff,
 	.id_value = 0x576,
+	.mono_id_reg = CCI_REG8(0x4d18),
 	.native_area = {
 		.top = 0,
 		.left = 0,
@@ -1068,6 +1071,7 @@ static const struct starvis2_variant imx832_variant_def = {
 	.id_reg = CCI_REG16_LE(0x4d1c),
 	.id_mask = 0x3ff,
 	.id_value = 0x340,
+	.mono_id_reg = CCI_REG8(0x4d18),
 	.native_area = {
 		.top = 0,
 		.left = 0,
@@ -1675,7 +1679,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 		goto err_standby;
 	}
 
-	cci_read(starvis2->cci, STARVIS2_REG_MONOCHROME, &val, &ret);
+	cci_read(starvis2->cci, variant->mono_id_reg, &val, &ret);
 
 	if (ret) {
 		dev_err(&client->dev,

-- 
2.34.1

