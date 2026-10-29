Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283540;
	b=a4SPvPJLv22aUIxZvrnRr+Auvk64wAV9QQwSH8jWp7eZCmVZnLF5V/5SCOA2JGsQyE+O
	 4CRRkBS7YFqKffz5dzbOmIhVDBmNVUgBORVEoQwDBMOUaK6DBP9S9seoH0w49RVhn8L62
	 kcHtY8P6k1fdRUx46ZovAZFEfbAXINjLLZ4RtYVAjGVGpd26wNPqvbB/AAWNyI6cieJV+
	 Cb2LM7Fe/85dFEzfxvscKblm8s78R7tJPinxU4o/62yjeO4uLc/WxILlADY8Yk5Miy82v
	 m2uhMWVekQxhJ/Lz0P0HeETUAs+pQCfj4QL2JGMTmBEcKqSkUdRQbbd8ihuyiMF+b4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SpPolyfzJYMmE5VU9BMzMFqCxVbYb3ZUGO3YoElucf4=;
	b=FDaoW7K1VoLZpfEec+u+9l8XKkcQRzu8SIww03DjihIgKEohj0flWdB6zCagtAEtyeF8
	 ddf0iQWlGMhufcCoGQxJSODL/U/xeJ5sVVho2UXXm+QlH5eK6cKsWxsZ4N2KmH6732svX
	 8TTmVqOJcVwpqg3Id+QMDqU4OkhDj1fbSvH8l9WfUn5pEkv5dlAxsOmJb25PIWVGq13UH
	 7m3ofPc4oiliOjL9b9lAPp/aJNDdAeYDqDLe2PaN7+PIsGkkePDt7E9VzMuHG/q1P0EJc
	 vfE0rkvbN2zTJXPupfdEa9MQkcUlp2nCEQMauGm7/nm+h+Z6vja57mJtU9dLgU15njA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=PP9Z8JXM;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4DD606A92A
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 14:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A4DD606A92A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=PP9Z8JXM
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a210470b49so18125825e9.2
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 07:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283533; x=1793888333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpPolyfzJYMmE5VU9BMzMFqCxVbYb3ZUGO3YoElucf4=;
        b=PP9Z8JXMRv12NVbJJTOH7JX2pGH4rPkfQJ790zn8qn/xt4NThA5QhaU578TKkngdBd
         d/Mo2u325P7PiYJhXa2q3ypw/NVixIXHOVxF33dqzc37c9kM3hjxyaPEvKPmq80+2BTj
         pJBHDNHDIvZMsEZdWeXNg4etLlw6xxQ9Sgy1NWLHSuHQBXiyzuDhekpcGa0h2U0i35xB
         H95+w/KTWsBaNLYAklqzySMs526DwFBCjfHxV1nYaJwU8r3X9Bo8biui1B+997e8wGZt
         BG92KZ6XG3y7CE5l3C5bJMaBs1OKUzZt6QdQFmzZ2aLxvQJ9YiQ2WADFr0KspjgbyFja
         Fyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283533; x=1793888333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SpPolyfzJYMmE5VU9BMzMFqCxVbYb3ZUGO3YoElucf4=;
        b=c2YN0o8AWBAfTg1uyqhJQzeWQ6IP7JAq7d6PsSPeILmS38zZF89F7cB+iSJ/oElcl7
         S/VZvhRhqFSYSWEjsO3KV+RwDgR4TjWIE0zhuFpB+dqHpDq/Tc9xhx56QMq87gH4m9ZV
         +lk9eFrfVS0X52JzsSx4cyUMdKtzujMjjQMsNXOAxwokDYvvOSAaNs35lhEh9dUKBoXm
         DZbgeCE7nW5WoJaqkAy7n5afQ8aclsFtIlqeieyMJr0GBKHMRWsUE2KJMWUwcNUndsNt
         5de60kpePMtFOOcoPxJMRi4c6GZeMZl8BMIIHIpDvbOuyMJ2mD8b20z2ugmBqkpzBC24
         m8DQ==
X-Forwarded-Encrypted: i=1; AKwUvBxk8rLB+k/plHTcHU5JCjmqOAr9S+3LYzz+EhT7OaCjzdrzNCRTvcBx07NBA9uiEfS0nDMoc1rW38pzYw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK7Q6/FVoBlNVzNOOxI7KMMoBolOPiOyhnc7jLt35hWdOqODPbU
	YixbGkC+mdI/a6sB2WKmdMqJMRNO66NYEPr3sjQPGVU5tI6Q60W7LaLvvfeqmergPGc=
X-Gm-Gg: AYBFou1DxV7lqXrNYqL33kihQiqnvHtY9Ya9jpuwNp8Pwv2U0RNT31W7nvrfgLVy0AA
	BXyYYm7VYHL7NJ5md36m2gvBwsVcyZ2ZFCSie7AAFc4b1iNSl8y8GZ4qfV/05o8cgKyYtW9feAv
	PcF79etkwYVdyEfwzmFl1rVAhnpLrvnvK0bgH26Im28dCDBiua1GJfUMiavvgRlEWAsFB6Qur/Z
	PvLcYMHspqAesR7AwbT6mqV4xAxr693+A4FManOxvkU1NTNwszndiYAYcF3YGokpNqMRV9WyD/9
	4eVefDZvKQP3iPt9uCcA2TYelpZntkgJ+aQKgsQ9HC/28a2py+yWBF8/7VkSFLpVT8qX25JdjU7
	N4un/szCXjhRysUIUTOzBWUcvqxKh8kL40RvQbjFt/fzqSmv+XxsYjgBknkFTIIZSkc7cJnLPLB
	KqVUHSwohJ6xdQK6gKCoYypYHFpii9p51Zl0fD4K88wL5ZDZmkS3GccZejS4mY33ffiYBh+LSuN
	MyiBy+R2j3iUhBnv7jhSpiP6Dp10LV7czZij2a0nv84gWF2FbmhoG6iwy9NIg/Jj4LMpY1LnP0z
	LFN5wRHSaXALHDKMRLP0cnG79Lzqa9+LSZkUT8a4ZXu1SRDnkbyQa0mHmZPIjoPquv+ZV9pPV7y
	kXI1V
X-Received: by 2002:a05:600c:474f:b0:4a1:cd83:b23e with SMTP id 5b1f17b1804b1-4a97452869cmr128475975e9.0.1793283533370;
        Thu, 29 Oct 2026 07:18:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:52 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:37 +0000
Subject: [PATCH v7 16/18] media: sony-starvis2: Parameterise the mono ID
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
Message-Id: <20261029-media-starvis2-v7-16-b33a1332fdfc@raspberrypi.com>
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

