Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821107;
	b=rSWBrXkEEx4E7qpnuga3LjoC7q9+4EgrovPS0ql1jKqyahe5c96xBIjAfEVfzWlOSo3b
	 HIaV82t5KGaUvdHjbC6Pr22fPYGhtzzAMMr5gcZw3m6PuNbyqaq2nPf6P7islOK2G3HNh
	 O1z+pVoCME+tRzSf46ERJ/po2TdIhkK7SMd4zHxud1+bezLXN8z7QAWwucgG6bTb8Rw4W
	 jxW6fJfTAYMug36kNzb9722SYWXwe3eVhEvLly1IyLBtmyICQgtCWXuqhMpeKSiGd49j0
	 viL07mJ+cc05QlKhJcP83aS+r+4coevLUUSRC5rysP80oDyWf6g7+4RMoRgeK9bPz/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Z0wILNP9hoOfw+GbXJHt9+6UVsSArRdVuADea6BgNfo=;
	b=2XFIpGlritGRh9Cv2u5m8jSy/LJjGjae/X810eDt8o3tmpzuX0WnHJ8RNbQ8HRT+YkiF
	 nMxgSPoq21NH4JC/v9ZjxWsfLR7Ifp/gqtp6zdqm782VfC9d1nrPuraoTYIFsw9m7RPWN
	 Y3qvdTBoYC/ijWVGpK3l+RSz2SSXc5nd4r+GCEzBwsBVsT9HiyOl5OpQ+8rv3mv6imxCY
	 d6NQ5QwIPOsO31Mfh/HUv2CDUkxqhMnD1ezwGonZgmwHTHUHNy7sohttLnF4Wd/+be84T
	 tSeTEy/Rgwqh52Zwy53wvO6EibqUBrglPAX3QtVhOBh1OvskuGT7ilLDI/VEYvWrRsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HT7ef+26;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34570606A333
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 23:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34570606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HT7ef+26
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so109805805e9.1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 15:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795821105; x=1796425905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0wILNP9hoOfw+GbXJHt9+6UVsSArRdVuADea6BgNfo=;
        b=HT7ef+26UjClzJSrUofvkSh4OkWdoMwuHjThZr7Rqd/HPQ2x0mmMn6Yn/mIzKvo09j
         Vy8mK+/+mtiK3B+w6/YXlqsZkdg785zz97hE//tW95pBR7nW0q/E32Pf7H8PBQ+sB2jD
         vwvdA3AKJR1ym7Pfx+/PSTeVvVA7ELoUAxVwXJO3UZp6Z2WHdFYJActsTVG1HZCIWzzO
         1A0SjFKD4wPzs9xLpOIapMDjgzqCCf0SMu87C1xnca1Yl1UlwSPstJoQU8rEbHYa/yB5
         pQosRrozN88LkGCxsgK2P1AN66Xk23OF4M06P1/yIOkBjeLBVCpTIsJN93fgPK73FeSx
         i5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795821105; x=1796425905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z0wILNP9hoOfw+GbXJHt9+6UVsSArRdVuADea6BgNfo=;
        b=C7r4AW3UMlq8r0iNSzs6jsEW8gn08+mD7AWWDVrZhUBAj2cSVFuWogDoIJPNPCeRmu
         PDSxCVlX5zXTHJGxLiXbl/c5p13bZPDY7j0SwP76/Z/RpuROivIywGGM6vv7TW8RtTid
         RcErdo0OtuSjWFh8Hn3gYwKVT1mEfkxLqGrAvfAJUCy4mC+HJas9cQRvUydA83P+g+kk
         ntiFw+qiz15E9fYMwbj1nGij4D9VbPevPO8HwcIRUKncLzdJdRuyzPB/YnZWfGMdJeK1
         qog6XiComUQrfCHaZPoMjVMjIqCK5dCrMcwarDgH5UclD0Sag8S6O3OFU0t0pqvGQ8+p
         ComA==
X-Gm-Message-State: APuU4Z8XH9xLQLawkHie07EYJIgod7E75QrReO0hlPm7Ngu3BDZmz9Js
	6fDYxem1Zo1M/bVrSBh9RX9tSCZGaAyneBxEICwEkFVKI/KkvkCwup/1
X-Gm-Gg: AZFdTZf57QCUrTGTcL21aRLNeCm/ZosTuCzYefIPGoXeP8rM4XVG37qP0brvKrQECWe
	glZyNo25BXCs6Q8DcZpqURmeIcxhNuUNLeNxNEyRCTIOCUog1QLc5jx1GzRLLr/6LDX194eYGHx
	RPBpyIruQKicNzb9w9TS01yN13auyjr+B3HwzvDvxnMMnDi+F44HcJqQdME4xSdR8PBVgGraIpF
	fF9sx9RrCqzbDNidruoiufHfrjtXPDMIN06Frj1W1pH/I1zAJsKGYKOYU/YGg78tjJakTD182zI
	kMRawB0aWkhpM6utZvU48/rSjsEzVmFE4xMoE8po1dTN5wp50M6o65xMIQrKwIndCs/VOstx/lj
	UkXvaYc29/gLHECGm/y5E9H6xpYuJvAlHCMHFqf0fsuQIgA4PZYmVfU3wEvYCKw6uPU6fTBepim
	l8bT1ywf7z1MduOF3f91pJhsryNwSQh56L21Uvut5FEwKDV9DCfDcVA5VdOZyA1+Xl6JibV2E4W
	6j0Joj02bYXuXJdK4BUF8Ln38PJI00VZH0YdGY3rJiey1GRvfizI3LIwWRw5S+TYBYNbVEfKQBB
	+l7ZfNzVQRhMCmBklUmJE8CnJ0SUNK6Ivq7ONejhfvIG/OaNA5T2W/aixFh/0iQsyB+WR3HkCmW
	AKkFHsarGY4YNdrwvsVNPGRu03Tsut6hrkBEt/MOJRJQkSCHNiulgPKvdSVQ8htfkCQ==
X-Received: by 2002:a05:600c:6749:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb8881099cmr507696605e9.12.1795821105387;
        Fri, 27 Nov 2026 15:11:45 -0800 (PST)
Received: from PC-Marco.local ([151.59.46.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm600062645e9.9.2026.11.27.15.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 15:11:45 -0800 (PST)
From: Marco Ziliani <rylos78@gmail.com>
Date: Sat, 28 Nov 2026 00:11:33 +0100
Subject: [PATCH v3 1/4] media: i2c: ov5693: Keep driver-managed registers
 out of the global list
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
Message-Id: <20261128-ov5693-fixes-v3-1-bcdd169958b6@gmail.com>
References: <20261128-ov5693-fixes-v3-0-bcdd169958b6@gmail.com>
In-Reply-To: <20261128-ov5693-fixes-v3-0-bcdd169958b6@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, 
 Tony Garcia <tony@loafecho.com>, Simon Kruse <simon0x+git@proton.me>, 
 "D. Manresa" <dmanresa@gmail.com>, linux-kernel@vger.kernel.org, 
 Marco Ziliani <rylos78@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795821102; l=4149;
 i=rylos78@gmail.com; s=20261027; h=from:subject:message-id;
 bh=uKTPZc5LykjN/BHRtAH+4in7YQgYje3/o3IBc5SugOk=;
 b=aSSDF3Ximl1kISTdMsBinyKk3fH53RzgnjtxHdaSY0zU/FYQQ36p236hDMAFHU+/t2WUT+sjZ
 8irRX5cF1VKDnIf06m1tRt8yekVmUISH5PGCDZA7mT7fg80e46VUyPa
X-Developer-Key: i=rylos78@gmail.com; a=ed25519;
 pk=nXCfiK5yExPZCMp+lfKif3gdXkfjkUK2qk7bDW+ixMo=

ov5693_global_regs writes three registers that the driver also programs:
0x350b, the low byte of the analogue gain set by the gain control, and
FORMAT1/FORMAT2 (0x3820/0x3821), whose binning and flip bits follow the
format and the flip controls. The values from the list are overwritten
anyway, so the overlap only hides which code owns those registers.

Drop the three entries. Program the FORMAT registers in full from
ov5693_mode_configure() instead, except for the flip bits, which stay
with the flip controls. That keeps the values the list used to write:
0x00 for FORMAT1, and bits 4:3 of FORMAT2, which the vendor sequence
sets and whose purpose isn't documented.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Marco Ziliani <rylos78@gmail.com>
---
 drivers/media/i2c/ov5693.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 56599f9ca..d221f7951 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -94,11 +94,17 @@
 #define OV5693_FORMAT1_FLIP_VERT_ISP_EN		BIT(6)
 #define OV5693_FORMAT1_FLIP_VERT_SENSOR_EN	BIT(1)
 #define OV5693_FORMAT1_VBIN_EN			BIT(0)
+#define OV5693_FORMAT1_FLIP_VERT_MASK		(OV5693_FORMAT1_FLIP_VERT_ISP_EN | \
+						 OV5693_FORMAT1_FLIP_VERT_SENSOR_EN)
 #define OV5693_FORMAT2_REG			CCI_REG8(0x3821)
 #define OV5693_FORMAT2_HDR_EN			BIT(7)
 #define OV5693_FORMAT2_FLIP_HORZ_ISP_EN		BIT(2)
 #define OV5693_FORMAT2_FLIP_HORZ_SENSOR_EN	BIT(1)
 #define OV5693_FORMAT2_HBIN_EN			BIT(0)
+#define OV5693_FORMAT2_FLIP_HORZ_MASK		(OV5693_FORMAT2_FLIP_HORZ_ISP_EN | \
+						 OV5693_FORMAT2_FLIP_HORZ_SENSOR_EN)
+/* Set by the vendor initialisation sequence, purpose undocumented */
+#define OV5693_FORMAT2_VENDOR_BITS		GENMASK(4, 3)
 
 #define OV5693_ISP_CTRL2_REG			CCI_REG8(0x5002)
 #define OV5693_ISP_SCALE_ENABLE			BIT(7)
@@ -203,7 +209,6 @@ static const struct cci_reg_sequence ov5693_global_regs[] = {
 	{CCI_REG8(0x3106), 0x00},
 	{CCI_REG8(0x3406), 0x01},
 	{CCI_REG8(0x3503), 0x07},
-	{CCI_REG8(0x350b), 0x40},
 	{CCI_REG8(0x3601), 0x0a},
 	{CCI_REG8(0x3602), 0x38},
 	{CCI_REG8(0x3612), 0x80},
@@ -322,8 +327,6 @@ static const struct cci_reg_sequence ov5693_global_regs[] = {
 	{CCI_REG8(0x5848), 0x01},
 	{CCI_REG8(0x5849), 0x0c},
 	{CCI_REG8(0x5e10), 0x0c},
-	{CCI_REG8(0x3820), 0x00},
-	{CCI_REG8(0x3821), 0x1e},
 	{CCI_REG8(0x5041), 0x14}
 };
 
@@ -364,8 +367,7 @@ static const u8 ov5693_test_pattern_bits[] = {
 static int ov5693_flip_vert_configure(struct ov5693_device *ov5693,
 				      bool enable)
 {
-	u8 bits = OV5693_FORMAT1_FLIP_VERT_ISP_EN |
-		  OV5693_FORMAT1_FLIP_VERT_SENSOR_EN;
+	u8 bits = OV5693_FORMAT1_FLIP_VERT_MASK;
 	int ret;
 
 	ret = cci_update_bits(ov5693->regmap, OV5693_FORMAT1_REG, bits,
@@ -379,8 +381,7 @@ static int ov5693_flip_vert_configure(struct ov5693_device *ov5693,
 static int ov5693_flip_horz_configure(struct ov5693_device *ov5693,
 				      bool enable)
 {
-	u8 bits = OV5693_FORMAT2_FLIP_HORZ_ISP_EN |
-		  OV5693_FORMAT2_FLIP_HORZ_SENSOR_EN;
+	u8 bits = OV5693_FORMAT2_FLIP_HORZ_MASK;
 	int ret;
 
 	ret = cci_update_bits(ov5693->regmap, OV5693_FORMAT2_REG, bits,
@@ -603,14 +604,18 @@ static int ov5693_mode_configure(struct ov5693_device *ov5693)
 	cci_write(ov5693->regmap, OV5693_SUB_INC_Y_REG,
 		  ((mode->inc_y_odd << 4) & 0xf0) | 0x01, &ret);
 
-	/* Binning */
+	/*
+	 * Binning. Program all the bits of the FORMAT registers except the
+	 * flips, which follow the flip controls.
+	 */
 	cci_update_bits(ov5693->regmap, OV5693_FORMAT1_REG,
-			OV5693_FORMAT1_VBIN_EN,
+			GENMASK(7, 0) & ~OV5693_FORMAT1_FLIP_VERT_MASK,
 			mode->binning_y ? OV5693_FORMAT1_VBIN_EN : 0, &ret);
 
 	cci_update_bits(ov5693->regmap, OV5693_FORMAT2_REG,
-			OV5693_FORMAT2_HBIN_EN,
-			mode->binning_x ? OV5693_FORMAT2_HBIN_EN : 0, &ret);
+			GENMASK(7, 0) & ~OV5693_FORMAT2_FLIP_HORZ_MASK,
+			OV5693_FORMAT2_VENDOR_BITS |
+			(mode->binning_x ? OV5693_FORMAT2_HBIN_EN : 0), &ret);
 
 	return ret;
 }

-- 
2.56.1

