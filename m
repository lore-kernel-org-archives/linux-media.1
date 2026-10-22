Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690488;
	b=gZpBl2ChdnbgDD8o1gCzCFlu/t4kvaimO5GGGXzOT367HcFV6SudUKEjSg5WNPsDlwv6
	 V+K7wsHe7wVy5YIEyexxGv3lhfrLnDoZE1Kp7PutJ8aDbKqF7Nw18pjAOhwzUwfLj67dp
	 URJSlz6kp8XOu7WHGd2N8BjDUy5A/huchaHY4bPtzU6v4eAhv5FeaTvfuzDPQ8nx1Ubfy
	 LjeEwEv+YF2BjQ2Jm8B9lLQd5HKf6nWO6q+KId9rWsMtopZp8SL8vW/93fm0p0rrOYzRe
	 LivSaXoAt28IAC3pttfkLx7ey3njf++RueWIVLgNK0TpYCD44wQqd52qTMC59ftopHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ajMUqmJq5v1qiltV0uRwoZmJBJ8faJK2wIDhzU7JGaY=;
	b=Quotf8EHm1EfvDVGUqbY6ETiXixbT9i5VPohiwviiA1m4wZmxMkSkWHryxBHz1JpNJ9B
	 P+7VBamlPZoyMqozIUM/X4rzOe4I5P5tsDc6otbYceGYuvJBAOgLWDkKC3EyniNGN5jcA
	 eUn9yUetdX1M26A6Wlq/d1oYgUFI2Rm7q2k0kSOEOBv5uf3A7XYeK5dSPRJgzEM6O1xUe
	 d0I2fJ9Ic+Q/GxxxvbLCP8BpY69rwi2HU7wW6Zrg9b6Y8QLH/9r1gMRJSQCwkGH0KaGbc
	 CpkyGxjvr5a7wM/vL0AJ1xK/yjrXIvAxm1nJf+RjKlKppE6sLdJy2gXM+4DnQRm/grg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=Ag101UhO;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4558560A382B
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 17:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4558560A382B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=Ag101UhO
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dee593f18so37956f8f.3
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 10:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690481; x=1793295281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ajMUqmJq5v1qiltV0uRwoZmJBJ8faJK2wIDhzU7JGaY=;
        b=Ag101UhOrWR83C3JPNWDAFiHpZR7rGI0618ydvvhCOPZMLntIBFNsadWBQEf/pzPCo
         hK7+5ZUTdiaeRjApOmBnyTxFj/Xj1meVZEJ7zFNLBUw+F3zVe0OzT+cO2eZFHlb+66CY
         DF3Gc1riLWLQ4p7JgcYzZ8CMy7bWCLORnUItLKYEyY6MTb67WIo9QSpBqz5IiAGSEiex
         RiSYvDc7/g+h2oHrvmrNvOIEj+HZ92AewLBGcmxK3LcrZGzHUAZ2LJep7pd4UsaQJSIO
         9UoJ5xj6b9wbXli7Bn2WCKkfbNbT4+n3vSxTcXZFeoOA2othN8+B1ZCZHOk1koWhn1xy
         Awfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690481; x=1793295281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajMUqmJq5v1qiltV0uRwoZmJBJ8faJK2wIDhzU7JGaY=;
        b=OK03k08ku/SnZpBqFuQnt4plSYAGe8oge9hF4H3tqZV06iNiX+H62MiFzxUEVTn3gs
         0Cj0T9oI9+7Dpd2UgJZPPdv5YcjLN21FhBGeXJCrihFmwW1LI1Zcd24v9XrpGKDSX/aA
         Go5Hg6PHhNUsvDSDE9SqFNOBQUpTZhAxzrOIuH/EcrwakkpcsJ82ElALtgsnKq8KcLsD
         OHfS5QADMLBA7fS1lfmfoVdDIcVN0bnzFAkfkj/ORB4bioEYQ8YQYTjTKDlBELxAhkGS
         OeFnuMy80omKdpjYeuUaKy8DaREO8tZZRNTzwhnUdfysofiQJsg06Sxk0p/0UbIPLByv
         Dzmg==
X-Forwarded-Encrypted: i=1; AKwUvBwYKDQ6rPnwwoZTH+lPo8YOhiq58kKrwbEe4NPC/LvgzNjXB/IWEIXYdWoCtox9HC/IuEHE/UV2yBsVRQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJyb2owi8iLaQsJVR5GYwMd/H8cJJSSxy2tOFGMoCQwy8M7Rs7I
	QQCEk7QfCJybGpgOyDSG0pJbW5b07bdkCcQxLaA2R2JOnrlcXDfoigRa6Bk0cN3i55M=
X-Gm-Gg: AYBFou2VolvrIieQr2IvrLI84Ao+mWUamYyy0CNzB2Tr3pEQ4u2w38YH84HuxC366P+
	cuo/Bnm2bIQr+4/yW+2Wqg8T5kS0CZeMR0uWjV0qUTDynczT4d5ywBmo+EdkGvKPoKblvmmet6p
	/JsKmxf/bZjqQI1XR0iWtvaKAQ/Qeu8eyoqRHr+PjLfR9oVpUHi+8GBb1Hxs9yqHTihcfQPd8R/
	UszThjK5fZK04n+D0tcjqtX1HpU3uddHSf9xHB0cQoS4J4n6xd7bHO7yV9v0Q1K9BcjlAqfAlM9
	Jf4An1QKo4eorgYLxgDyl0ihQzQiL+CXvxjHGYsLVGHnYno2k76Mpf+sQEuMFZ0mr1TUBj2xgdY
	GwZDFyA7aU2II0w9aRk1s0Nkk4udexVeLG8+FSdrkcIQy8Iu8CWB5nfzCM9pmC2KptcMpkyQwc3
	u0I0gIXWdGucjARKmClQI1LH/4RmFrx7mDQVwBocbxFfNbwLQATn2HhSwwmlQKN+ihMYbtGTJ0x
	ESvvNGXxvU1v8zHuLdE8snsARzDQYlIVv7EvlxNcoqt4Foi4tn3ZbUDFtb8cDosehXt8fCXx0Ca
	fm/oCmGB1utPRGAHlikOIBDVjE1G40Ln
X-Received: by 2002:a5d:64e4:0:b0:48b:118e:7454 with SMTP id ffacd0b85a97d-48e264bd971mr12892930f8f.31.1792690480559;
        Thu, 22 Oct 2026 10:34:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:39 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:05 +0100
Subject: [PATCH v6 12/18] media: sony-starvis2: Add support for IMX675
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
Message-Id: <20261022-media-starvis2-v6-12-374343f55fd3@raspberrypi.com>
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

The IMX675 is a 5MPix Starvis2 sensor that follows the same
programming pattern as IMX678 and IMX662, so add it into the
driver.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 212 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 212 insertions(+)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 2db9ac28308a..a4815a142c9d 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -10,6 +10,8 @@
  *         pixels.
  * IMX662: Diagonal 6.45mm (Type 1/2.8) CMOS image sensor with 2.12 M effective
  *         pixels.
+ * IMX675: Diagonal 6.53mm (Type 1/2.8) CMOS image sensor with 5.12 M effective
+ *         pixels.
  *
  * Copyright (C) 2026 Ideas On Board Oy.
  * Copyright (C) 2026 Raspberry Pi
@@ -795,6 +797,193 @@ static const struct starvis2_variant imx662_variant_def = {
 	.hmax_min_pixel_array = 990,
 };
 
+static const struct cci_reg_sequence imx675_common_regs[] = {
+	{ STARVIS2_REG_THIN_V_EN, 0x00 },
+	{ STARVIS2_REG_VCMODE, 0x01 },
+
+	{ CCI_REG8(0x3081), 0x00 },
+	{ STARVIS2_REG_XXS_OUTSEL, 0xaa },
+	{ STARVIS2_REG_XXS_DRV, 0x0f },
+	{ CCI_REG8(0x30cc), 0x00 },
+	{ CCI_REG8(0x30cd), 0x00 },
+	{ CCI_REG8(0x30ce), 0x02 },
+	{ CCI_REG8(0x3400), 0x01 },
+
+	{ CCI_REG8(0x3460), 0x22 },
+	{ CCI_REG8(0x347b), 0x02 },
+	{ CCI_REG8(0x3492), 0x08 },
+	{ CCI_REG8(0x3b1d), 0x17 },
+	{ CCI_REG8(0x3b44), 0x3f },
+	{ CCI_REG8(0x3b60), 0x03 },
+	{ CCI_REG8(0x3c03), 0x04 },
+	{ CCI_REG8(0x3c04), 0x04 },
+	{ CCI_REG8(0x3c0a), 0x1f },
+	{ CCI_REG8(0x3c0b), 0x1f },
+	{ CCI_REG8(0x3c0c), 0x1f },
+	{ CCI_REG8(0x3c0d), 0x1f },
+	{ CCI_REG8(0x3c0e), 0x1f },
+	{ CCI_REG8(0x3c0f), 0x1f },
+	{ CCI_REG8(0x3c30), 0x73 },
+	{ CCI_REG8(0x3c3c), 0x20 },
+	{ CCI_REG8(0x3c44), 0x06 },
+	{ CCI_REG8(0x3c7c), 0xb9 },
+	{ CCI_REG8(0x3c7d), 0x01 },
+	{ CCI_REG8(0x3c7e), 0xb7 },
+	{ CCI_REG8(0x3c7f), 0x01 },
+	{ CCI_REG8(0x3cb0), 0x00 },
+	{ CCI_REG8(0x3cb2), 0xff },
+	{ CCI_REG8(0x3cb3), 0x03 },
+	{ CCI_REG8(0x3cb4), 0xff },
+	{ CCI_REG8(0x3cb5), 0x03 },
+	{ CCI_REG8(0x3cba), 0xff },
+	{ CCI_REG8(0x3cbb), 0x03 },
+	{ CCI_REG8(0x3cc0), 0xff },
+	{ CCI_REG8(0x3cc1), 0x03 },
+	{ CCI_REG8(0x3cc2), 0x00 },
+	{ CCI_REG8(0x3cc6), 0xff },
+	{ CCI_REG8(0x3cc7), 0x03 },
+	{ CCI_REG8(0x3cc8), 0xff },
+	{ CCI_REG8(0x3cc9), 0x03 },
+	{ CCI_REG8(0x3e00), 0x1e },
+	{ CCI_REG8(0x3e02), 0x04 },
+	{ CCI_REG8(0x3e03), 0x00 },
+	{ CCI_REG8(0x3e20), 0x04 },
+	{ CCI_REG8(0x3e21), 0x00 },
+	{ CCI_REG8(0x3e22), 0x1e },
+	{ CCI_REG8(0x3e24), 0xba },
+	{ CCI_REG8(0x3e72), 0x85 },
+	{ CCI_REG8(0x3e76), 0x0c },
+	{ CCI_REG8(0x3e77), 0x01 },
+	{ CCI_REG8(0x3e7a), 0x85 },
+	{ CCI_REG8(0x3e7e), 0x1f },
+	{ CCI_REG8(0x3e82), 0xa6 },
+	{ CCI_REG8(0x3e86), 0x2d },
+	{ CCI_REG8(0x3ee2), 0x33 },
+	{ CCI_REG8(0x3ee3), 0x03 },
+	{ CCI_REG8(0x4490), 0x07 },
+	{ CCI_REG8(0x4494), 0x19 },
+	{ CCI_REG8(0x4495), 0x00 },
+	{ CCI_REG8(0x4496), 0xbb },
+	{ CCI_REG8(0x4497), 0x00 },
+	{ CCI_REG8(0x4498), 0x55 },
+	{ CCI_REG8(0x449a), 0x50 },
+	{ CCI_REG8(0x449c), 0x50 },
+	{ CCI_REG8(0x449e), 0x50 },
+	{ CCI_REG8(0x44a0), 0x3c },
+	{ CCI_REG8(0x44a2), 0x19 },
+	{ CCI_REG8(0x44a4), 0x19 },
+	{ CCI_REG8(0x44a6), 0x19 },
+	{ CCI_REG8(0x44a8), 0x4b },
+	{ CCI_REG8(0x44aa), 0x4b },
+	{ CCI_REG8(0x44ac), 0x4b },
+	{ CCI_REG8(0x44ae), 0x4b },
+	{ CCI_REG8(0x44b0), 0x3c },
+	{ CCI_REG8(0x44b2), 0x19 },
+	{ CCI_REG8(0x44b4), 0x19 },
+	{ CCI_REG8(0x44b6), 0x19 },
+	{ CCI_REG8(0x44b8), 0x4b },
+	{ CCI_REG8(0x44ba), 0x4b },
+	{ CCI_REG8(0x44bc), 0x4b },
+	{ CCI_REG8(0x44be), 0x4b },
+	{ CCI_REG8(0x44c0), 0x3c },
+	{ CCI_REG8(0x44c2), 0x19 },
+	{ CCI_REG8(0x44c4), 0x19 },
+	{ CCI_REG8(0x44c6), 0x19 },
+	{ CCI_REG8(0x44c8), 0xf0 },
+	{ CCI_REG8(0x44ca), 0xeb },
+	{ CCI_REG8(0x44cc), 0xeb },
+	{ CCI_REG8(0x44ce), 0xe6 },
+	{ CCI_REG8(0x44d0), 0xe6 },
+	{ CCI_REG8(0x44d2), 0xbb },
+	{ CCI_REG8(0x44d4), 0xbb },
+	{ CCI_REG8(0x44d6), 0xbb },
+	{ CCI_REG8(0x44d8), 0xe6 },
+	{ CCI_REG8(0x44da), 0xe6 },
+	{ CCI_REG8(0x44dc), 0xe6 },
+	{ CCI_REG8(0x44de), 0xe6 },
+	{ CCI_REG8(0x44e0), 0xe6 },
+	{ CCI_REG8(0x44e2), 0xbb },
+	{ CCI_REG8(0x44e4), 0xbb },
+	{ CCI_REG8(0x44e6), 0xbb },
+	{ CCI_REG8(0x44e8), 0xe6 },
+	{ CCI_REG8(0x44ea), 0xe6 },
+	{ CCI_REG8(0x44ec), 0xe6 },
+	{ CCI_REG8(0x44ee), 0xe6 },
+	{ CCI_REG8(0x44f0), 0xe6 },
+	{ CCI_REG8(0x44f2), 0xbb },
+	{ CCI_REG8(0x44f4), 0xbb },
+	{ CCI_REG8(0x44f6), 0xbb },
+	{ CCI_REG8(0x4538), 0x15 },
+	{ CCI_REG8(0x4539), 0x15 },
+	{ CCI_REG8(0x453a), 0x15 },
+	{ CCI_REG8(0x4544), 0x15 },
+	{ CCI_REG8(0x4545), 0x15 },
+	{ CCI_REG8(0x4546), 0x15 },
+	{ CCI_REG8(0x4550), 0x10 },
+	{ CCI_REG8(0x4551), 0x10 },
+	{ CCI_REG8(0x4552), 0x10 },
+	{ CCI_REG8(0x4553), 0x10 },
+	{ CCI_REG8(0x4554), 0x10 },
+	{ CCI_REG8(0x4555), 0x10 },
+	{ CCI_REG8(0x4556), 0x10 },
+	{ CCI_REG8(0x4557), 0x10 },
+	{ CCI_REG8(0x4558), 0x10 },
+	{ CCI_REG8(0x455c), 0x10 },
+	{ CCI_REG8(0x455d), 0x10 },
+	{ CCI_REG8(0x455e), 0x10 },
+	{ CCI_REG8(0x455f), 0x10 },
+	{ CCI_REG8(0x4560), 0x10 },
+	{ CCI_REG8(0x4561), 0x10 },
+	{ CCI_REG8(0x4562), 0x10 },
+	{ CCI_REG8(0x4563), 0x10 },
+	{ CCI_REG8(0x4564), 0x10 },
+	{ CCI_REG8(0x4569), 0x01 },
+	{ CCI_REG8(0x456a), 0x01 },
+	{ CCI_REG8(0x456b), 0x06 },
+	{ CCI_REG8(0x456c), 0x06 },
+	{ CCI_REG8(0x456d), 0x06 },
+	{ CCI_REG8(0x456e), 0x06 },
+	{ CCI_REG8(0x456f), 0x06 },
+	{ CCI_REG8(0x4570), 0x06 },
+};
+
+static const u16 imx675_min_hmax_2lane[] = {
+	[STARVIS2_LINK_FREQ_297MHZ] = 2044,
+	[STARVIS2_LINK_FREQ_360MHZ] = 1692,
+	[STARVIS2_LINK_FREQ_445MHZ] = 1376,
+	[STARVIS2_LINK_FREQ_594MHZ] = 1064,
+	[STARVIS2_LINK_FREQ_720MHZ] = 840,
+	[STARVIS2_LINK_FREQ_891MHZ] = 684,
+	[STARVIS2_LINK_FREQ_1039MHZ] = 592,
+	[STARVIS2_LINK_FREQ_1188MHZ] = 528,
+};
+
+static const struct starvis2_variant imx675_variant_def = {
+	.name = "imx675",
+	.id_reg = CCI_REG16_LE(0x4d12),
+	.id_mask = 0xfff,
+	.id_value = 0x576,
+	.native_area = {
+		.top = 0,
+		.left = 0,
+		.width = 2609,
+		.height = 1984,
+	},
+	.active_area = {
+		.top = 0,
+		.left = 0,
+		.width = 2608,
+		.height = 1984,
+	},
+	.pixel_rate = 594000000,
+	.pix_per_clk = 8,
+	.common_regs = imx675_common_regs,
+	.num_common_regs = ARRAY_SIZE(imx675_common_regs),
+	.vmax_default = 2024,
+	.hmax_min_link_freq = imx675_min_hmax_2lane,
+	.hmax_min_pixel_array = 528,
+};
+
 struct starvis2_model_info {
 	enum starvis2_type type;
 	const u32 *codes;
@@ -845,6 +1034,26 @@ static const struct starvis2_model_info imx662_autodetect_info = {
 	.auto_detect_mono = &imx662_aamr_info,
 };
 
+static const struct starvis2_model_info imx675_aaqr_info = {
+	.type = STARVIS2_COLOR,
+	.codes = codes_bayer,
+	.num_codes = ARRAY_SIZE(codes_bayer),
+	.variant = &imx675_variant_def,
+};
+
+static const struct starvis2_model_info imx675_aamr_info = {
+	.type = STARVIS2_MONOCHROME,
+	.codes = codes_monochrome,
+	.num_codes = ARRAY_SIZE(codes_monochrome),
+	.variant = &imx675_variant_def,
+};
+
+static const struct starvis2_model_info imx675_autodetect_info = {
+	.variant = &imx675_variant_def,
+	.auto_detect_colour = &imx675_aaqr_info,
+	.auto_detect_mono = &imx675_aamr_info,
+};
+
 static const char * const starvis2_supply_name[] = {
 	"avdd",  /* Analog (3.3V) supply */
 	"dvdd",  /* Digital Core (1.1V) supply */
@@ -1682,10 +1891,13 @@ static const struct dev_pm_ops starvis2_pm_ops = {
 static const struct of_device_id starvis2_of_match[] = {
 	{ .compatible = "sony,imx662-aamr", .data = &imx662_aamr_info },
 	{ .compatible = "sony,imx662-aaqr", .data = &imx662_aaqr_info },
+	{ .compatible = "sony,imx675-aamr", .data = &imx675_aamr_info },
+	{ .compatible = "sony,imx675-aaqr", .data = &imx675_aaqr_info },
 	{ .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
 	{ .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
 	/* for non-conforming DTs that rely on runtime check */
 	{ .compatible = "sony,imx662", .data = &imx662_autodetect_info },
+	{ .compatible = "sony,imx675", .data = &imx675_autodetect_info },
 	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },
 	{ /* sentinel */ }
 };

-- 
2.34.1

