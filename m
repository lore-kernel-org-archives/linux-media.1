Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186540;
	b=TMgoPKbAI0e9ssu7FT0NVp+VkzLdVAunKG65kVBy3aefGKDZWpBUKXoSmalOEAyl4bGE
	 Wum5axQPYHRejXo3gAj5PFUYPxjo6zmLrjmJdRkevodXiMwJ5UnQExqECZd+Ry4VUfePX
	 nYt66erXl9r8Kr0mKYkn482+FBMsA2r9ThVM7kfz56eyDHEFjzJbog44u78YjWQ+owgnQ
	 E0RlshE4GRE9EYXZiQe9TcTrdU/OdPVQkUWD89kATuXrJTd1n6p/hH54NjGC+R9AyCWUg
	 LTXN//TaJsFtozRAupxJN10O2gmFwHIxxM/r2vZXt0xGEM9DCv4ccKF6Jru2B6vrIEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OLyWFyCgu7t4ByHDaTSSabBvSfvT9CHVlsCVomXFHGI=;
	b=e4F+hox9pxpJh/QqmqEH5B9jvNWuzOp0xwHbvkRzaaTdWLbugZMgSM+lkd+ktFHsBxPb
	 XhNPcQNCyVEvGde7b1mnyzYnoSbYo5DMbJHcVx9q/1Q4nHpMpU7VVHsLngYyTSIgpiLmB
	 H8qM3qf/jcVx05iGifpSPai/fmlpe6yujnvM3CABg8Gr3FZEmA9x7Idz9D4PyMLSM/OcM
	 P1uBnBqr4FgBjps7mHgDfhegfpsPbSUPCQ2qsCk3OxvMDjJzTQKDYWZx4j2O9DkFMa7Vy
	 3BzoHKRIl37sC7drumgL0RSom1MrRA9O9sRo8R4uUHVCUpE9foVwDHl9Aj0DdGKx5/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bmhb6Got;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B7C606A33A
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 11:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4B7C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bmhb6Got
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e83d2cc8a2so2022495ad.0
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 04:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186539; x=1793791339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLyWFyCgu7t4ByHDaTSSabBvSfvT9CHVlsCVomXFHGI=;
        b=Bmhb6GotV3ZT83S6xNZs7LvLoMgg8ohxnow2Jw8CFHuuwB/k4hJyIObcJjNX9A9vaQ
         Sf06RiEPZwHHO2mAT8MaUhh4X955KNk7OqWoXICe7PAklIttGJurswawZAAYH4GxVXuO
         qjDFxysFLijr12oAXyNkopUKWjexas7ToN4sEYgsRSJKD23csddW76c226EhkCt+8PG8
         s1oGaCK0A1cdSq8h+4QFduI9Dp4Smrg3F33eRjUzt+LAelew9+/IwPawydPPNCCe1lbA
         k+FY7j0sZv+7bSeelUcbpcnKDeFjw2Txpyqb6ZxVNBxm093R6Es7n6rH3iOGiNx2CaBW
         hI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186539; x=1793791339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLyWFyCgu7t4ByHDaTSSabBvSfvT9CHVlsCVomXFHGI=;
        b=wZmlcM0i3AzLZk0kXyIEDLpmrR31HWhKKzJB42Fj4oA/DlHMM/Gr2bvNP0VSgxqdG2
         eIapo3SNWNRq2+O+rsv+MovCfUHtPdi+Ipu4WqgsV0l5hvmWGEQUNxvw3tfTKhPXv/7F
         SVRfuw/cPWN0iC9lAUoc/ubfA1xRr8ckQS/RarGoJDsO9AFht80Olvf+Ju7u0qITIgWZ
         BqZQYp1d+Sz/ee7YZTJ5XosdhkJEJfpkkauJKizwTj3tTWhqgHGDJ9MbFJTAFS0yoP9F
         TgZV3/ErJ2z8+svbdudlD+c3pK9FVzqCP0YMh0DxDJfk4+mpfSiALUc6jthgUg7aBxCn
         YHAg==
X-Gm-Message-State: AFq9FYKitmoM/PoGwMf2QN5dvYBxYgo+egVX9VVcc3jLqCOatYlJnVGG
	9n5RhlMK+qQl5JOXhTBy900oGZIyOv1JxTA/8hCaPMtWytsb2lGzOaIKooCnjxwVOHQ=
X-Gm-Gg: AYBFou3BSA9n+1tQTHom/lDEnh44iZRSWKC/GqU10BCCWi6lcKWQGLlGvh1OP1FGDuI
	wo01HTHOn2gn1wSXptZXr3IZWPdoMNNe8zXY5ezyfWEpf8Mht6MsMwRfzawx345LAIcR3gRlgSF
	4hK/UxFVPl43KYEmRtMgCu8wqq3MSvcWqLphTjS3SeAUmzM+R/d9i47b4Q2SqO1bU36IcSek+cs
	k4koYcaD9urd7qxjAiWmSWbxAfuRjDrblK/5Wv1xUWJmB8gIEXOVK0K1xzL66XYsM+uSfDaRSsY
	aQn0NQw2HYkhuIiqIXbacvALSWVJ58sR49gY9hIoVIw2K1ayOFzL9D034eyfuiXtdCGA/G8ypRi
	a3d9eWKcMLqDtFDz2DqyPFBBce7KrjMZKzaFCZVab1sXlV9qvlEvTzWCSMsfDjLauMo/Ch28Yrb
	1WgbZFMRIhFW6l32Qn3CSnV8re5pPhPK3+PXax3B+JP9wFyiQ8JgdKtSMiHqT115TUBvmB36it4
	uENOXEUIo8qYDksV8Gl71OTycBKxTDlwlUghPIYz5V8oV7pYDUEtY9khWYd08qy1vneuTmsfSQl
	C0o2GHS/qd43wJcYJpbnecfdm5QacMKmpa27jnMSLij46tqlHjMlvoFyQrGwE/DoPTIG5WUUSQJ
	lazQTL9mGTI0jFXIZ36KNyZ+jjTdtAUbFNVzaFKGk/3nkfRQ59iJr2QabbrfZchbUepWAHup0QO
	aq+Ar0aoVqnRl9KhUCI0ruZS4/yazHfzMIxr9vJIuQ
X-Received: by 2002:a17:903:1af0:b0:2e9:5c29:9955 with SMTP id d9443c01a7336-2eb003e9998mr30356015ad.4.1793186538927;
        Wed, 28 Oct 2026 04:22:18 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eafcdb52e6sm10157945ad.74.2026.10.28.04.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:22:18 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/9] media: i2c: ov7251: Move the strobe registers out of the mode tables
Date: Wed, 28 Oct 2026 20:21:52 +0900
Message-ID: <20261028112154.855185-8-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112154.855185-1-antoine.pichot@gmail.com>
References: <20261028112154.855185-1-antoine.pichot@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The three mode tables write the same values to the STROBE pad output
enable bit (0x3005) and to the strobe control block (0x3b80-0x3b96).
Move these writes to a separate register array written right after the
mode table at stream start, and name the registers a following patch
needs: SC_REG5 (0x3005, whose bit 3 enables the STROBE pad output), the
strobe frame pattern (0x3b81) and the 32-bit strobe frame span (0x3b8c).

The values written are unchanged, only the order of the writes within
the stream start sequence changes. No functional change intended.

Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
Tested-by: D. Manresa <dmanresa@gmail.com> # Surface Pro 7+, IPU6 (8086:9a19)
---
 drivers/media/i2c/ov7251.c | 93 ++++++++++++++------------------------
 1 file changed, 33 insertions(+), 60 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index d591b9169de8..d08bd373b3f3 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -55,6 +55,9 @@
 #define OV7251_PLL2_DIVIDER_REG		0x309d
 #define OV7251_PLL2_SYS_DIV_REG		0x309a
 #define OV7251_PLL2_ADC_DIV_REG		0x309b
+#define OV7251_SC_REG5			0x3005
+#define OV7251_STROBE_FRAME_PATTERN	0x3b81
+#define OV7251_STROBE_FRAME_SPAN	0x3b8c
 
 #define OV7251_NATIVE_WIDTH		656
 #define OV7251_NATIVE_HEIGHT		496
@@ -239,8 +242,31 @@ static const struct reg_value ov7251_global_init_setting[] = {
 	{ 0x303b, 0x02 },
 };
 
+/* Strobe output settings, the same for all modes */
+static const struct reg_value ov7251_strobe_regs[] = {
+	{ OV7251_SC_REG5, 0x00 },
+	{ 0x3b80, 0x00 },
+	{ OV7251_STROBE_FRAME_PATTERN, 0xa5 },
+	{ 0x3b82, 0x10 },
+	{ 0x3b83, 0x00 },
+	{ 0x3b84, 0x08 },
+	{ 0x3b85, 0x00 },
+	{ 0x3b86, 0x01 },
+	{ 0x3b87, 0x00 },
+	{ 0x3b88, 0x00 },
+	{ 0x3b89, 0x00 },
+	{ 0x3b8a, 0x00 },
+	{ 0x3b8b, 0x05 },
+	{ OV7251_STROBE_FRAME_SPAN, 0x00 },
+	{ 0x3b8d, 0x00 },
+	{ 0x3b8e, 0x00 },
+	{ 0x3b8f, 0x1a },
+	{ 0x3b94, 0x05 },
+	{ 0x3b95, 0xf2 },
+	{ 0x3b96, 0x40 },
+};
+
 static const struct reg_value ov7251_setting_vga_30fps[] = {
-	{ 0x3005, 0x00 },
 	{ 0x3012, 0xc0 },
 	{ 0x3013, 0xd2 },
 	{ 0x3014, 0x04 },
@@ -313,25 +339,6 @@ static const struct reg_value ov7251_setting_vga_30fps[] = {
 	{ 0x3834, 0x00 },
 	{ 0x3835, 0x0c },
 	{ 0x3837, 0x00 },
-	{ 0x3b80, 0x00 },
-	{ 0x3b81, 0xa5 },
-	{ 0x3b82, 0x10 },
-	{ 0x3b83, 0x00 },
-	{ 0x3b84, 0x08 },
-	{ 0x3b85, 0x00 },
-	{ 0x3b86, 0x01 },
-	{ 0x3b87, 0x00 },
-	{ 0x3b88, 0x00 },
-	{ 0x3b89, 0x00 },
-	{ 0x3b8a, 0x00 },
-	{ 0x3b8b, 0x05 },
-	{ 0x3b8c, 0x00 },
-	{ 0x3b8d, 0x00 },
-	{ 0x3b8e, 0x00 },
-	{ 0x3b8f, 0x1a },
-	{ 0x3b94, 0x05 },
-	{ 0x3b95, 0xf2 },
-	{ 0x3b96, 0x40 },
 	{ 0x3c00, 0x89 },
 	{ 0x3c01, 0x63 },
 	{ 0x3c02, 0x01 },
@@ -368,7 +375,6 @@ static const struct reg_value ov7251_setting_vga_30fps[] = {
 };
 
 static const struct reg_value ov7251_setting_vga_60fps[] = {
-	{ 0x3005, 0x00 },
 	{ 0x3012, 0xc0 },
 	{ 0x3013, 0xd2 },
 	{ 0x3014, 0x04 },
@@ -441,25 +447,6 @@ static const struct reg_value ov7251_setting_vga_60fps[] = {
 	{ 0x3834, 0x00 },
 	{ 0x3835, 0x0c },
 	{ 0x3837, 0x00 },
-	{ 0x3b80, 0x00 },
-	{ 0x3b81, 0xa5 },
-	{ 0x3b82, 0x10 },
-	{ 0x3b83, 0x00 },
-	{ 0x3b84, 0x08 },
-	{ 0x3b85, 0x00 },
-	{ 0x3b86, 0x01 },
-	{ 0x3b87, 0x00 },
-	{ 0x3b88, 0x00 },
-	{ 0x3b89, 0x00 },
-	{ 0x3b8a, 0x00 },
-	{ 0x3b8b, 0x05 },
-	{ 0x3b8c, 0x00 },
-	{ 0x3b8d, 0x00 },
-	{ 0x3b8e, 0x00 },
-	{ 0x3b8f, 0x1a },
-	{ 0x3b94, 0x05 },
-	{ 0x3b95, 0xf2 },
-	{ 0x3b96, 0x40 },
 	{ 0x3c00, 0x89 },
 	{ 0x3c01, 0x63 },
 	{ 0x3c02, 0x01 },
@@ -496,7 +483,6 @@ static const struct reg_value ov7251_setting_vga_60fps[] = {
 };
 
 static const struct reg_value ov7251_setting_vga_90fps[] = {
-	{ 0x3005, 0x00 },
 	{ 0x3012, 0xc0 },
 	{ 0x3013, 0xd2 },
 	{ 0x3014, 0x04 },
@@ -569,25 +555,6 @@ static const struct reg_value ov7251_setting_vga_90fps[] = {
 	{ 0x3834, 0x00 },
 	{ 0x3835, 0x0c },
 	{ 0x3837, 0x00 },
-	{ 0x3b80, 0x00 },
-	{ 0x3b81, 0xa5 },
-	{ 0x3b82, 0x10 },
-	{ 0x3b83, 0x00 },
-	{ 0x3b84, 0x08 },
-	{ 0x3b85, 0x00 },
-	{ 0x3b86, 0x01 },
-	{ 0x3b87, 0x00 },
-	{ 0x3b88, 0x00 },
-	{ 0x3b89, 0x00 },
-	{ 0x3b8a, 0x00 },
-	{ 0x3b8b, 0x05 },
-	{ 0x3b8c, 0x00 },
-	{ 0x3b8d, 0x00 },
-	{ 0x3b8e, 0x00 },
-	{ 0x3b8f, 0x1a },
-	{ 0x3b94, 0x05 },
-	{ 0x3b95, 0xf2 },
-	{ 0x3b96, 0x40 },
 	{ 0x3c00, 0x89 },
 	{ 0x3c01, 0x63 },
 	{ 0x3c02, 0x01 },
@@ -1301,6 +1268,12 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
 				ov7251->current_mode->height);
 			goto err_power_down;
 		}
+		ret = ov7251_set_register_array(ov7251, ov7251_strobe_regs,
+						ARRAY_SIZE(ov7251_strobe_regs));
+		if (ret < 0) {
+			dev_err(ov7251->dev, "could not set strobe defaults\n");
+			goto err_power_down;
+		}
 		ret = __v4l2_ctrl_handler_setup(&ov7251->ctrls);
 		if (ret < 0) {
 			dev_err(ov7251->dev, "could not sync v4l2 controls\n");
-- 
2.56.0

