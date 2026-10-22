Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690483;
	b=jIVadKKn95K0AybnTfRiavv+RWZpYJdNLG1CzQLLwEcwmgMJrV/AYdmUeHUI8TVDuTjv
	 aWg8gUvN8Wv6+yD3cwXq5v3u/+O5Rwl67FOEVpbwH1NHJcu0zEV7ByTcBYm/OETTcyVY7
	 wRJL6YGel+ClrPm0BfrkwnLi4Rp5XZ1O9y9vuJpzldtoCVdF1kZ80Ek6CiL8iK3rpraIF
	 gasgWCDD7vN6tEWiTWDENy7Yefe9/Yd6mtBh8h8m+LDMQBE0f1E0s0UbRvQ70NjqK4B6y
	 D6UWmM2tf4r0sXCiMDIbnIotfareUTSn0hRelVZCAv/dOQkQbwwvpWAPvJ0mgz4xyTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=VSv5iuwo2+u6yZ/vu9IKOx8gXurrCzY9e0DhNAIbsQ0=;
	b=ytMHaeU4yMP8Wo/tC3Gdfd00X7k6AJ9zLfOGO2JIvdy2i8H6K4Ni9q/FQglzwvmnEIsL
	 2qLrR+jB1kGZCb8JO4SOxAhWM3EvGjzbUJyoAhw7gP4iTz6NikD6o10Nj2evk0p8SIKlr
	 6QVuj7dCVQc0JKrbKfrZfLnXUovPygqEsM+CCixcRr7ay5bVlfu7RqqtF8wKoQgkshV7f
	 6a7Dtsfp10jaJVajhXs+HnEAJyCWD/dh/NEwTBxT4sTDDnhzyJHVfflS7g7pRbpB+AZ6h
	 4KPYpNWix3si8EtwKELHvWmwjRFKIA+YZdoBi6eJU7Zfl9wpeBymgfbcx+kU0YORexw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=SXT6bHxo;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8057F60A5BC3
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 17:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8057F60A5BC3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=SXT6bHxo
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e09aa5264so18852f8f.2
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 10:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690482; x=1793295282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSv5iuwo2+u6yZ/vu9IKOx8gXurrCzY9e0DhNAIbsQ0=;
        b=SXT6bHxogpOGZuiuWTqC6NQPjc06joj+n99rqzbJqp/SAh9mHvNdib63POOcm7/Qlp
         OHvGZXonF7hfeaoW9JGos1XoWTJYLlqgwGoWbEr8ilIgPVJrh13dR13mGtCVXLJ3z3qu
         9HLhr4ZE+aQn2bchTKXDNI7C7Zk9V4MLuJ+p/iXgpUbK11yqPZ4GUTDNvDabtVDatk4R
         E881cXVjbRPy8mSgsA8OfkyO1cJCn/WDBs3t4l6maaCY36dtY7WtlNhZrfXHjMTbZ3+E
         6Xjl624ElMihvvidAHNhydCJZkWcnq38t9jWHvJp8il+o77qPrFnWRBQqEuh7YYwGEqA
         0JJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690482; x=1793295282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSv5iuwo2+u6yZ/vu9IKOx8gXurrCzY9e0DhNAIbsQ0=;
        b=mVi/3aftUWNx1+2mPPlZIlzaccDfG884Tf4noBgRkcglYOvjmYTuRXnKOy4L2B8nuS
         DWVr08O1DhKFfFQ40AJ3wVSaV5IA7GBiNjTInrO0/C1p0iJlSzRA2JRCJt07xpo8L9Gi
         vh0ror7U2zzwL/+gxipFdqE7zHLwItfZHPIy1wmrWAcghhdm2xmgUuQmTiAtBawfioLR
         rKPRaA9AJRdsuOWjHJAEBnAXjrzqwKGXo7NTAwdZkMkZMTC7MsgSknBxuMcsI84NXejg
         gXQlvMy0YLHzJlBdrUI8vK8eSHos5Tbz8IWz3VLhfR8drToQNTKRL0ET84F6rWz4D0V6
         lQ3w==
X-Forwarded-Encrypted: i=1; AKwUvByKbBVZ3yE250wuinABcpigyt8Srh0hCe8QvteIAaL3Uj7/hQg5GM/8K0vfNYL1X6U83ttqgTDiqKYgtw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLCfvuTVj90n+tf+thsDjucofFodqi/doPSdP9tqCtB5nVKk4On
	sw9X5QBppwhB+M49wJG3Mzr8YOo4SR/wzsRrBHSNafCHqbSmNrPhdlhXr5sd3/kGMMU=
X-Gm-Gg: AYBFou1Iy9M1hx6ApV8qL7ESfYHKSfF73OzaOLb7V4R70wuzlVVWNRLteEQfPHTULKs
	SGXzA7fiYSO/uu7USPzy6GLapp4cIYMcDBMQW1B0NALslHf3WOhuKZfCNzZ/eajipgW05ANwb6X
	t1OV8js6CqJa7WLhqFjW0c7KplRUo6UmBEVwVrtCNHXLjMefrWGSZFVjwh8NMiy/KmdHqFAVa2X
	m5GDYcrtOX3ec6guOgsyXVj69h+TpYEOgtnK7nktyoouboV6HocmYILIGq52JwloY8xBeyS0V+8
	vpRgYKKJoPRws6HFzDPbN+eSgkZhW9a9F6YDWGlNukT5mZsVCmlJCHVeYColx9Cs15XNrcAyqEm
	jeNEkSn/gP55gsJ3DLry7t+uxG0ArOpgq45hfj2PmNGOXe0C8/e4+amNdPEQCyFWzIjeonRRjXt
	IWspNIvOz4/NgcExFLP8Gl4utxnGTco3cPMDBoT0K12KTnpumc27sNdxaOJFItabdJqof5Y8c/1
	Q9hG1Wr+BnIsrYNKqsGti4eWKt+WMl/o0+6EGbzSV5UVcatv6IAKATTiXyZGxgky3+tAh1HPg5v
	S2PPOXr/OGHHwygY8aQMNvN5vzQzNcI=
X-Received: by 2002:adf:edcd:0:b0:488:5852:6ee3 with SMTP id ffacd0b85a97d-48e264f18f8mr10242795f8f.34.1792690481792;
        Thu, 22 Oct 2026 10:34:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:41 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:06 +0100
Subject: [PATCH v6 13/18] media: sony-starvis2: Add support for IMX832
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
Message-Id: <20261022-media-starvis2-v6-13-374343f55fd3@raspberrypi.com>
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

IMX832 is replacing IMX662, and it follows the same pattern as all the
Starvis2 sensors.

Add the sensor specific configuration for it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 118 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index a4815a142c9d..645417cc08fb 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -12,6 +12,8 @@
  *         pixels.
  * IMX675: Diagonal 6.53mm (Type 1/2.8) CMOS image sensor with 5.12 M effective
  *         pixels.
+ * IMX832: Diagonal 6.45mm (Type 1/2.8) CMOS image sensor with 2.12 M effective
+ *         pixels.
  *
  * Copyright (C) 2026 Ideas On Board Oy.
  * Copyright (C) 2026 Raspberry Pi
@@ -984,6 +986,99 @@ static const struct starvis2_variant imx675_variant_def = {
 	.hmax_min_pixel_array = 528,
 };
 
+static const struct cci_reg_sequence imx832_common_regs[] = {
+	{ CCI_REG8(0x3460), 0x21 },
+	{ CCI_REG8(0x3a94), 0x75 },
+	{ CCI_REG8(0x3a96), 0x69 },
+	{ CCI_REG8(0x3a98), 0x1e },
+	{ CCI_REG8(0x3a9a), 0x1e },
+	{ CCI_REG8(0x3b58), 0xeb },
+	{ CCI_REG8(0x3b5c), 0xeb },
+	{ CCI_REG8(0x3b88), 0xeb },
+	{ CCI_REG8(0x3b8c), 0xeb },
+	{ CCI_REG8(0x3c40), 0x06 },
+	{ CCI_REG8(0x3cae), 0x79 },
+	{ CCI_REG8(0x3cbc), 0x7b },
+	{ CCI_REG8(0x4508), 0x00 },
+	{ CCI_REG8(0x4509), 0x02 },
+	{ CCI_REG8(0x450a), 0x41 },
+	{ CCI_REG8(0x450b), 0x03 },
+	{ CCI_REG8(0x4660), 0x12 },
+	{ CCI_REG8(0x4661), 0x00 },
+	{ CCI_REG8(0x4662), 0x29 },
+	{ CCI_REG8(0x4664), 0x12 },
+	{ CCI_REG8(0x4665), 0x00 },
+	{ CCI_REG8(0x4666), 0x25 },
+	{ CCI_REG8(0x4667), 0x03 },
+	{ CCI_REG8(0x46c0), 0x13 },
+	{ CCI_REG8(0x46c1), 0x00 },
+	{ CCI_REG8(0x46c2), 0x28 },
+	{ CCI_REG8(0x46c4), 0x13 },
+	{ CCI_REG8(0x46c5), 0x00 },
+	{ CCI_REG8(0x46c6), 0x24 },
+	{ CCI_REG8(0x46c7), 0x03 },
+	{ CCI_REG8(0x4720), 0x07 },
+	{ CCI_REG8(0x4721), 0x00 },
+	{ CCI_REG8(0x4722), 0x23 },
+	{ CCI_REG8(0x4723), 0x03 },
+	{ CCI_REG8(0x4724), 0x14 },
+	{ CCI_REG8(0x4725), 0x00 },
+	{ CCI_REG8(0x4726), 0x2a },
+	{ CCI_REG8(0x4750), 0x1e },
+	{ CCI_REG8(0x4752), 0x22 },
+	{ CCI_REG8(0x4753), 0x03 },
+	{ CCI_REG8(0x4754), 0x25 },
+	{ CCI_REG8(0x4755), 0x00 },
+	{ CCI_REG8(0x4756), 0x29 },
+	{ CCI_REG8(0x4780), 0x08 },
+	{ CCI_REG8(0x4781), 0x00 },
+	{ CCI_REG8(0x4782), 0x1d },
+	{ CCI_REG8(0x4783), 0x03 },
+	{ CCI_REG8(0x4784), 0x15 },
+	{ CCI_REG8(0x4785), 0x00 },
+	{ CCI_REG8(0x4786), 0x24 },
+	{ STARVIS2_REG_WDMODE, 0x00 },
+	{ STARVIS2_REG_MDBIT, 0x01 },
+	{ STARVIS2_REG_XXS_DRV, 0x00 },
+};
+
+static const u16 imx832_min_hmax_2lane[] = {
+	[STARVIS2_LINK_FREQ_297MHZ] = 1980,
+	[STARVIS2_LINK_FREQ_360MHZ] = 1980,
+	[STARVIS2_LINK_FREQ_445MHZ] = 1188,
+	[STARVIS2_LINK_FREQ_594MHZ] = 990,
+	[STARVIS2_LINK_FREQ_720MHZ] = 990,
+	[STARVIS2_LINK_FREQ_891MHZ] = 990,
+	[STARVIS2_LINK_FREQ_1039MHZ] = 990,
+	[STARVIS2_LINK_FREQ_1188MHZ] = 990,
+};
+
+static const struct starvis2_variant imx832_variant_def = {
+	.name = "imx832",
+	.id_reg = CCI_REG16_LE(0x4d1c),
+	.id_mask = 0x3ff,
+	.id_value = 0x340,
+	.native_area = {
+		.top = 0,
+		.left = 0,
+		.width = 1937,
+		.height = 1101,
+	},
+	.active_area = {
+		.top = 0,
+		.left = 0,
+		.width = 1936,
+		.height = 1096,
+	},
+	.pixel_rate = 222750000,
+	.pix_per_clk = 3,
+	.common_regs = imx832_common_regs,
+	.num_common_regs = ARRAY_SIZE(imx832_common_regs),
+	.vmax_default = 1136,
+	.hmax_min_link_freq = imx832_min_hmax_2lane,
+	.hmax_min_pixel_array = 990,
+};
+
 struct starvis2_model_info {
 	enum starvis2_type type;
 	const u32 *codes;
@@ -1054,6 +1149,26 @@ static const struct starvis2_model_info imx675_autodetect_info = {
 	.auto_detect_mono = &imx675_aamr_info,
 };
 
+static const struct starvis2_model_info imx832_aqr_info = {
+	.type = STARVIS2_COLOR,
+	.codes = codes_bayer,
+	.num_codes = ARRAY_SIZE(codes_bayer),
+	.variant = &imx832_variant_def,
+};
+
+static const struct starvis2_model_info imx832_amr_info = {
+	.type = STARVIS2_MONOCHROME,
+	.codes = codes_monochrome,
+	.num_codes = ARRAY_SIZE(codes_monochrome),
+	.variant = &imx832_variant_def,
+};
+
+static const struct starvis2_model_info imx832_autodetect_info = {
+	.variant = &imx832_variant_def,
+	.auto_detect_colour = &imx832_aqr_info,
+	.auto_detect_mono = &imx832_amr_info,
+};
+
 static const char * const starvis2_supply_name[] = {
 	"avdd",  /* Analog (3.3V) supply */
 	"dvdd",  /* Digital Core (1.1V) supply */
@@ -1895,10 +2010,13 @@ static const struct of_device_id starvis2_of_match[] = {
 	{ .compatible = "sony,imx675-aaqr", .data = &imx675_aaqr_info },
 	{ .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
 	{ .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
+	{ .compatible = "sony,imx832-amr", .data = &imx832_amr_info },
+	{ .compatible = "sony,imx832-aqr", .data = &imx832_aqr_info },
 	/* for non-conforming DTs that rely on runtime check */
 	{ .compatible = "sony,imx662", .data = &imx662_autodetect_info },
 	{ .compatible = "sony,imx675", .data = &imx675_autodetect_info },
 	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },
+	{ .compatible = "sony,imx832", .data = &imx832_autodetect_info },
 	{ /* sentinel */ }
 };
 

-- 
2.34.1

