Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690490;
	b=pLV0LYwTdVjvS3+ffhcfJvPbe0lMGaqS1C7/ofhQycp9dmj3Ldt0SmFyTv42pA0UsHL9
	 gtc7jZjxdq0O9PTIdarcMTCE3c0jo7fRlkBEi8WHGWo5oEbMb4l/tqH7wDrsvnbbgHU+z
	 UA7mNG4LrRC6kuIWEmQ4JpLVMnhEDjjKvXi59UGf2vBUPsPYbcYUzWE1DMl7om0vmnKmB
	 OhrTSNKU1nEz7FfbS5ittaQVDWMA/mFo6gfCSyz3qqIWF87W1C6w7OfoD/F2Vnwutx3DN
	 NZuJ2TU6JIKBhywidhYcb/FlYyT5zDzhMsiY/4NwUTBgncdsup2jM7rZbf8a8k77MAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+PLa8/BTSYSpY5O/iBWQgejv9mgsV4q9dlKuDq8W1LA=;
	b=ftTOaWcnzrb5PiIeLQJNtxgT9U0J1i/5nj6KLW64z5wBPwJkdLguZkJFWQtGyN+DqAYd
	 4eQfypD0O9YaGPhsyrBrtKO63RZ1GacFRKPVa3MtzvEP7C1ijoM011LzgabqcAV2ri+AK
	 hx9UGKW7tGcGCrYJ785NL8AlPOpLFVImEgy4iqKvoXET0xaAk8pzgn/FyrmPdutaeEE5F
	 7gliyFR8z/vrdruXyB9pbnqHcKRWZDf9Hj2PEPbOkDwjttlgVC97lmcze6957khoLenKU
	 rZ6y5ugnmHlGsHGIChwv0BhtITfOkVJYnOHBXH2hg7pARw8Mfkmepc+J8dCeBBTROiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=Sut1OsTF;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB9760A6F70
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 17:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDB9760A6F70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=Sut1OsTF
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e011d370dso56207f8f.0
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 10:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690488; x=1793295288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+PLa8/BTSYSpY5O/iBWQgejv9mgsV4q9dlKuDq8W1LA=;
        b=Sut1OsTFVy0BCOnpRe/o3z0bVqVrXAeK6nIHESfGluE7rdS3k/u41OAGxpLMmGErna
         dhkVDLzVYzeuN+JAwrYPcbm9YSjfMVrZtyi4dBa3zXAeS78GXxN1x2Z19P9TF1h5w4Hn
         cgjzy87H5WO0TX1S9EdPgYhKM/3QNREr02ieYWwPDRaEw0qW/ayEldGzm/fPhPh/Tkwy
         qfrl2GxEuNDzaatioN3o7AicJRKoqx1KaOhA8o/50OuSNBXcQWslMy0vWsvIZDR2JGd6
         yHR+w0kWRER5xYLkBQwo45fi5pf7Zp51aOlF73l9gfHu0qmpNR3KU5M40qpZyrcvLYLg
         Mnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690488; x=1793295288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+PLa8/BTSYSpY5O/iBWQgejv9mgsV4q9dlKuDq8W1LA=;
        b=0kTSTEoeq/+CBG8RVw+WV1+5DktEHOrnXI4N5YvCz2uncOS/n030eEsTudeLc3UBoz
         /aszbqt9mtmG5jfoAfIHfd1WQh5rz4EvMuWDCYjQVHpck1TIMn852hX8vtSd9hxdRCqJ
         pYUccBE8Fczsmo7KdEEOWguIiNymCDjlwjI73l0473tdtrQNftxFMD9n/wNGm1Sp1zVq
         M7tudmgJY3e2JCRT4IJaYwCxihHWWyeSrpfFcwAGtSADhbWP+Sqai6/TnzHggRLqPp6b
         SNNr1rN7u+IkTwDj1MhcRf1Kd+dLt2fTxMzkZL1+4WhX5KQR3INQzgFFEu7/hNtFq9Wz
         pKTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSqW8xycFpjJJCiDGVuDnthE1YU5dTLFphHiTmrHTT0tanauhslv6mx3a4FqFLKzFfcZp6ByF2jyGoeA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIfq2I4ZxyyKwtUf2okRi6j2bZpolQKEBGBIY9yexYu8re0UPj3
	4SMINT7psFJsy1skZvgZo08KV/TKVS6X6OyjOhEvpv1We1t54IZ8+tO9Oe/C5JSjfGQ=
X-Gm-Gg: AYBFou14HDi+jDi/QXmTMPJjTWqPUJWVhXR5bSo6XNqwv6sDlfCV5w3hUk28Qniugyi
	xPSQ49EWhZ/s+JWbdR/xMCP+D/vhJqgwbDleaGFHEAdMS5ugq0HVk0bjLucrAQH48eaaZXRVWFm
	nFv5LfVIGeytSC/3wMontn0KGeO5NumU8kw+dyuyqf2WKek5+SG9O1e7LxyL2t/ZBywoZkY2eV8
	T0K0+9CcqUaD9zUn//8t+g9ZokwFbBoe0BJUVWpV/H0mhzXbGijCK3dg+BxqtiL+YSaYFPqpNZe
	IIpOXXGjaEtrylIu9crMDgHcJqthLQwL3mbSQJ912gdH6eoVvnokgWr0M9hbnc1wvjyrskRjinq
	WVUfIKGxTQrbgzAf+E9qwg2ztVoXQrzAO2nb1jrMceK90/5z1QBSRUlwJ2pCdtlU/VRBuH422aL
	3Zg8gjbNTFpGaL50PxN3reG+Ig4PCpoBVuXw6UOqtP8cLdmfIfxODtFvM2DPqKyMU8ORfj1Rr8G
	6O7jgokznF9MUNny0G14GNccfmJ9GYLuDvrftTkO+lMHZ40V+/amkrVFb3nih+sguRTcUprM6Rf
	oDi1kLQ9a3htgoDsHZ8bNRhUgREnvQ0=
X-Received: by 2002:a05:6000:310c:b0:48d:f730:bda8 with SMTP id ffacd0b85a97d-48e264b1fb9mr12767924f8f.50.1792690488217;
        Thu, 22 Oct 2026 10:34:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:47 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:11 +0100
Subject: [PATCH v6 18/18] media: sony-starvis2: Add support for IMX676
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
Message-Id: <20261022-media-starvis2-v6-18-374343f55fd3@raspberrypi.com>
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

From: Jai Luthra <jai.luthra@ideasonboard.com>

The IMX676 is a 12.63MPix Starvis 2 sensor, so add support for it.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 196 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 196 insertions(+)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 5c407211edc8..8e574a9e920f 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -1380,6 +1380,179 @@ static const struct starvis2_variant imx585_variant_def = {
 	.shr_min = 8,
 };
 
+static const struct cci_reg_sequence imx676_common_regs[] = {
+	{ CCI_REG8(0x304e), 0x04 },
+	{ CCI_REG8(0x3148), 0x00 },
+	{ CCI_REG8(0x3460), 0x22 },
+	{ CCI_REG8(0x347b), 0x02 },
+	{ CCI_REG8(0x355a), 0x1c },
+	{ CCI_REG8(0x3a3c), 0x0f },
+	{ CCI_REG8(0x3a44), 0x0b },
+	{ CCI_REG8(0x3a76), 0xb5 },
+	{ CCI_REG8(0x3a77), 0x00 },
+	{ CCI_REG8(0x3a78), 0x03 },
+	{ CCI_REG8(0x3b22), 0x04 },
+	{ CCI_REG8(0x3b23), 0x44 },
+	{ CCI_REG8(0x3c03), 0x04 },
+	{ CCI_REG8(0x3c04), 0x04 },
+	{ CCI_REG8(0x3c0a), 0x03 },
+	{ CCI_REG8(0x3c0b), 0x03 },
+	{ CCI_REG8(0x3c0c), 0x03 },
+	{ CCI_REG8(0x3c0d), 0x03 },
+	{ CCI_REG8(0x3c0e), 0x03 },
+	{ CCI_REG8(0x3c0f), 0x03 },
+	{ CCI_REG8(0x3c30), 0x73 },
+	{ CCI_REG8(0x3c34), 0x6c },
+	{ CCI_REG8(0x3c3c), 0x20 },
+	{ CCI_REG8(0x3cb8), 0x00 },
+	{ CCI_REG8(0x3cba), 0xff },
+	{ CCI_REG8(0x3cbb), 0x03 },
+	{ CCI_REG8(0x3cbc), 0xff },
+	{ CCI_REG8(0x3cbd), 0x03 },
+	{ CCI_REG8(0x3cc2), 0xff },
+	{ CCI_REG8(0x3cc3), 0x03 },
+	{ CCI_REG8(0x3cc8), 0xff },
+	{ CCI_REG8(0x3cc9), 0x03 },
+	{ CCI_REG8(0x3cca), 0x00 },
+	{ CCI_REG8(0x3cce), 0xff },
+	{ CCI_REG8(0x3ccf), 0x03 },
+	{ CCI_REG8(0x3cd0), 0xff },
+	{ CCI_REG8(0x3cd1), 0x03 },
+	{ CCI_REG8(0x3e00), 0x1e },
+	{ CCI_REG8(0x3e02), 0x04 },
+	{ CCI_REG8(0x3e03), 0x00 },
+	{ CCI_REG8(0x3e20), 0x04 },
+	{ CCI_REG8(0x3e21), 0x00 },
+	{ CCI_REG8(0x3e22), 0x1e },
+	{ CCI_REG8(0x3e24), 0xb6 },
+	{ CCI_REG8(0x4490), 0x07 },
+	{ CCI_REG8(0x4494), 0x10 },
+	{ CCI_REG8(0x4495), 0x00 },
+	{ CCI_REG8(0x4496), 0xb2 },
+	{ CCI_REG8(0x4497), 0x00 },
+	{ CCI_REG8(0x4498), 0x4c },
+	{ CCI_REG8(0x449a), 0x4b },
+	{ CCI_REG8(0x449c), 0x4b },
+	{ CCI_REG8(0x449e), 0x49 },
+	{ CCI_REG8(0x44a0), 0x33 },
+	{ CCI_REG8(0x44a2), 0x10 },
+	{ CCI_REG8(0x44a4), 0x10 },
+	{ CCI_REG8(0x44a6), 0x10 },
+	{ CCI_REG8(0x44a8), 0x4b },
+	{ CCI_REG8(0x44aa), 0x4b },
+	{ CCI_REG8(0x44ac), 0x4b },
+	{ CCI_REG8(0x44ae), 0x46 },
+	{ CCI_REG8(0x44b0), 0x33 },
+	{ CCI_REG8(0x44b2), 0x10 },
+	{ CCI_REG8(0x44b4), 0x10 },
+	{ CCI_REG8(0x44b6), 0x10 },
+	{ CCI_REG8(0x44b8), 0x42 },
+	{ CCI_REG8(0x44ba), 0x42 },
+	{ CCI_REG8(0x44bc), 0x42 },
+	{ CCI_REG8(0x44be), 0x42 },
+	{ CCI_REG8(0x44c0), 0x33 },
+	{ CCI_REG8(0x44c2), 0x10 },
+	{ CCI_REG8(0x44c4), 0x10 },
+	{ CCI_REG8(0x44c6), 0x10 },
+	{ CCI_REG8(0x44c8), 0xe7 },
+	{ CCI_REG8(0x44ca), 0xe2 },
+	{ CCI_REG8(0x44cc), 0xe2 },
+	{ CCI_REG8(0x44ce), 0xdd },
+	{ CCI_REG8(0x44d0), 0xdd },
+	{ CCI_REG8(0x44d2), 0xb2 },
+	{ CCI_REG8(0x44d4), 0xb2 },
+	{ CCI_REG8(0x44d6), 0xb2 },
+	{ CCI_REG8(0x44d8), 0xe1 },
+	{ CCI_REG8(0x44da), 0xe1 },
+	{ CCI_REG8(0x44dc), 0xe1 },
+	{ CCI_REG8(0x44de), 0xdd },
+	{ CCI_REG8(0x44e0), 0xdd },
+	{ CCI_REG8(0x44e2), 0xb2 },
+	{ CCI_REG8(0x44e4), 0xb2 },
+	{ CCI_REG8(0x44e6), 0xb2 },
+	{ CCI_REG8(0x44e8), 0xdd },
+	{ CCI_REG8(0x44ea), 0xdd },
+	{ CCI_REG8(0x44ec), 0xdd },
+	{ CCI_REG8(0x44ee), 0xdd },
+	{ CCI_REG8(0x44f0), 0xdd },
+	{ CCI_REG8(0x44f2), 0xb2 },
+	{ CCI_REG8(0x44f4), 0xb2 },
+	{ CCI_REG8(0x44f6), 0xb2 },
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
+	{ CCI_REG8(0x4604), 0x04 },
+	{ CCI_REG8(0x4608), 0x22 },
+	{ CCI_REG8(0x479c), 0x04 },
+	{ CCI_REG8(0x47a0), 0x22 },
+	{ STARVIS2_REG_WDMODE, 0x00 },
+	{ STARVIS2_REG_MDBIT, 0x01 },
+	{ STARVIS2_REG_XXS_DRV, 0x00 },
+};
+
+static const u16 imx676_min_hmax_2lane[] = {
+	[STARVIS2_LINK_FREQ_297MHZ] = 2744,
+	[STARVIS2_LINK_FREQ_360MHZ] = 2277,
+	[STARVIS2_LINK_FREQ_445MHZ] = 1854,
+	[STARVIS2_LINK_FREQ_594MHZ] = 1410,
+	[STARVIS2_LINK_FREQ_720MHZ] = 1176,
+	[STARVIS2_LINK_FREQ_891MHZ] = 965,
+	[STARVIS2_LINK_FREQ_1039MHZ] = 838,
+	[STARVIS2_LINK_FREQ_1188MHZ] = 743,
+};
+
+const struct starvis2_variant imx676_variant_def = {
+	.name = "imx676",
+	.id_reg = CCI_REG16_LE(0x4d12),
+	.id_mask = 0xfff,
+	.id_value = 0x676,
+	.interface_sel_reg = CCI_REG8(0x4e3c),
+	.mono_id_reg = CCI_REG8(0x4d18),
+	.native_area = {
+		.top = 0,
+		.left = 0,
+		.width = 3553,
+		.height = 3577,
+	},
+	.active_area = {
+		.top = 24,
+		.left = 0,
+		.width = 3552,
+		.height = 3552,
+	},
+	.pixel_rate = 594000000,
+	.pix_per_clk = 8,
+	.common_regs = imx676_common_regs,
+	.num_common_regs = ARRAY_SIZE(imx676_common_regs),
+	.vmax_default = 3940,
+	.hmax_min_link_freq = imx676_min_hmax_2lane,
+	.hmax_min_pixel_array = 454,
+	.exposure_min = 2,
+	.exposure_step = 2,
+	.shr_min = 8,
+};
+
 struct starvis2_model_info {
 	enum starvis2_type type;
 	const u32 *codes;
@@ -1490,6 +1663,26 @@ static const struct starvis2_model_info imx585_autodetect_info = {
 	.auto_detect_mono = &imx585_aamj_info,
 };
 
+static const struct starvis2_model_info imx676_aacr_info = {
+	.type = STARVIS2_COLOR,
+	.codes = codes_bayer,
+	.num_codes = ARRAY_SIZE(codes_bayer),
+	.variant = &imx676_variant_def,
+};
+
+static const struct starvis2_model_info imx676_aamr_info = {
+	.type = STARVIS2_MONOCHROME,
+	.codes = codes_monochrome,
+	.num_codes = ARRAY_SIZE(codes_monochrome),
+	.variant = &imx676_variant_def,
+};
+
+static const struct starvis2_model_info imx676_autodetect_info = {
+	.variant = &imx676_variant_def,
+	.auto_detect_colour = &imx676_aacr_info,
+	.auto_detect_mono = &imx676_aamr_info,
+};
+
 static const char * const starvis2_supply_name[] = {
 	"avdd",  /* Analog (3.3V) supply */
 	"dvdd",  /* Digital Core (1.1V) supply */
@@ -2335,6 +2528,8 @@ static const struct of_device_id starvis2_of_match[] = {
 	{ .compatible = "sony,imx662-aaqr", .data = &imx662_aaqr_info },
 	{ .compatible = "sony,imx675-aamr", .data = &imx675_aamr_info },
 	{ .compatible = "sony,imx675-aaqr", .data = &imx675_aaqr_info },
+	{ .compatible = "sony,imx676-aamr", .data = &imx676_aamr_info },
+	{ .compatible = "sony,imx676-aacr", .data = &imx676_aacr_info },
 	{ .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
 	{ .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
 	{ .compatible = "sony,imx832-amr", .data = &imx832_amr_info },
@@ -2343,6 +2538,7 @@ static const struct of_device_id starvis2_of_match[] = {
 	{ .compatible = "sony,imx585", .data = &imx585_autodetect_info },
 	{ .compatible = "sony,imx662", .data = &imx662_autodetect_info },
 	{ .compatible = "sony,imx675", .data = &imx675_autodetect_info },
+	{ .compatible = "sony,imx676", .data = &imx676_autodetect_info },
 	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },
 	{ .compatible = "sony,imx832", .data = &imx832_autodetect_info },
 	{ /* sentinel */ }

-- 
2.34.1

