Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013050;
	b=TeP29uEYisoDME1feRGC8WgAujZhV2+6jci5dwwZfHW5PgVvysK1z+UE3lovDWmCBxcJ
	 FMkswqWYvKvmVGKMwPCwgNqsJAMpa5dSIcT0cPUWM52J5s0SsCk233ZSgqZcR+1YW/On+
	 sr/DDsOTtghqtvTG4QRehVVp5XPaU+hGfGQMaePFyp08MayFnOa2uB6UpZGlwmN66AYr1
	 WLJ15bbbMKnBjNhJK7Bgjw20YwA+UUIqmZs0ztW/b6VlgYtGbomWnLesD4OPUrKoAHczY
	 OfmJ64k6vvxjAiQ45P229EKMbZWLdSUz/8hA0sPFu5HVwMe7qoSAEAL70iL8YfUvv1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2TxMuQ75/NjYgtprUNdDWHCMvhUE9oPezRuuBDy6i/k=;
	b=071KbmqvcMAxkmE2rwTl5hGTwh+iVFchv01e6EwoYLYmBBY6/UK4raW9/+TNEBkKc2OL
	 YjwZhmbdIxAtqdcNdRcDDhqKu/pRTLMBT9ccw9HX1F1ofSCSclqAafu346veh/aEX9lX+
	 O5WaNy0p8abdxKOKKH29fOJdSpNIYx80nRcjgk446I8atdYodR/K00F0vgTOuUUxY+ACu
	 7TusIj5Kppt8W4uAs1s6ULp+nCwDPU2s/krk7V316DS0bMn/MB4UjIaYoMPG4Y+boakyq
	 FtBF2O0Xo+mJ2pJC+EnncAxePvMG6ntUqC4GxkuAJjZQJKI/gStapOofDGIbaEtJevQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lSDSLeAs;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF8360A260D
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 11:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AF8360A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lSDSLeAs
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac7a053626so333085a91.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 04:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013050; x=1793617850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2TxMuQ75/NjYgtprUNdDWHCMvhUE9oPezRuuBDy6i/k=;
        b=lSDSLeAscLWajmfZhEXKnWhtk6m6NV5chlPrzAINikms6GgoI1Y2rCFyeMU0QJHuQe
         Dy4y/CaAMu/aIJ5gu0E8YQY8rW3SaHDsbPBNF2YiXuiy8BRiLzqxIsOZn+V9C0gCszpu
         /F0YkAh9LMygqkHO2XoByZZ+vEkEFFPUSYyuOclrlYBZx8lhmgZshYDO+XLDeUHNpAhd
         DAQ//Dfb7E/dQhhzpWlcmKXp2D/dVFK77E2G/TUlcoHCjBWSOa2l6msqq5UPbEy1qSFh
         N90/gSQqEZcUiifEkU5gHDyaHDkpbVKnjsNNa1voDh7CNc338eshKDxFtE7nPziq7bna
         sJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013050; x=1793617850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2TxMuQ75/NjYgtprUNdDWHCMvhUE9oPezRuuBDy6i/k=;
        b=HeazBjEoc6zN03yJTTfciKSTcioQBSk1N1GaLfItNZ4gAZI1Gc8ZcE3IBulE4zxJcY
         LlO5pZvNqnjI4HMvED3/sDmUDpKKSKFksHS373rvtcR03m8jVRL2kLhBWB7g+jdx7i/P
         7c+yHmoeuwRydTAG25C7mW26rfdxxeJg3wND+JM2eoQLLl+adjjsiCNsLBBsQ2zqCYee
         2dXpfMYZctNXli9TeicflwgnEYzz7Sx9F974uWI71ITSywpfkXT+MUJD71shxKD5Jhe5
         uWOpFhkw5rbGwTgB2quhdEx+5/lskkPOJ+RirkiaN5fqTtm0yR9//pocopuweecBO1VC
         IIuw==
X-Gm-Message-State: AFq9FYI7kDEhqkVQ0+zpJ9RX9u4qLgjpjAr1G1pWbmpBrCe2gdyqbpOX
	hN51OwgLmjqGGiyezafz6pdOF13ocQ63uchKAKz0JbKIfyYQC4dKn20nLUHnPykzKGM=
X-Gm-Gg: AYBFou03Zj4RuutdQ4Hx8/zjHUZjvnLIQuxG1bKvx7dh+RGIHeYFQzoiH5lj6V3Mb3O
	van3cHGH76IAMUOo9wblyMv6AF9S8GiT7ZnQTQszmmCVReXTaAlp20Q7guJmmVT3iLavao25Xc0
	+qZ65SvUhyVSAzCqSA01eiR5rjjDxkT9zprgKotMTJzLvhkakmaQGOjQqh0tf1rzER84t3ZqooH
	SuPy9/3mQfEFQ4a4OAfs7+9DjuHKuiIePE3dITWFudE0CHBqsscF1sfAwtBlqX/wglY1pBERjpe
	g1aTjQO6Q768P3Cz/RWEB5T0hAxc0jH14liCWvHuso80xcDUot9ekZXbOM5uXWXM1UKlZ/GAV1j
	xCJmcfFk5svVEzaufdvniQ6axQgzRaAw7UzPGZ9S+DxhPzceIzirm2XQcFVpsc0NUOVxjM88mv5
	0fCK78YSDJNzdz4nyojXf7L1nwtUXLvFLeB0LiuCJ/o2JcFGorxeGCfx2FXFoVeiqmmJjVeHeNj
	Dl/qN6w1eBsKnr3DXubbZAbswXWp5iEr5yyILUdqG3mwKB+PYbt8OnhijcbbVyGrl0QMJhSvObM
	mwQx8KbddQHrpv1sQcefjotqsc7VkF9JNwDFj0vhbgZK/Oe+TBXnI4k+TKsOLo4bO5Qz3v8DK3r
	Y5xVRlVKqhTB9AuHLyEOZvmsc1uO8uNyAsBSWJ7xBMPLAeg==
X-Received: by 2002:a17:90b:1809:b0:3a0:c162:51af with SMTP id 98e67ed59e1d1-3ade9481ef8mr9647515a91.0.1793013049850;
        Mon, 26 Oct 2026 04:10:49 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm8023593a91.8.2026.10.26.04.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:49 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Antoine Pichot <antoine.pichot@gmail.com>
Subject: [PATCH 5/7] media: i2c: ov7251: Move the strobe registers out of the mode tables
Date: Mon, 26 Oct 2026 20:10:30 +0900
Message-ID: <20261026111032.88355-6-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026111032.88355-1-antoine.pichot@gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
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
---
 drivers/media/i2c/ov7251.c | 93 ++++++++++++++------------------------
 1 file changed, 33 insertions(+), 60 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index b6579a56a5..ad66422d9e 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -53,6 +53,9 @@
 #define OV7251_PLL2_DIVIDER_REG		0x309d
 #define OV7251_PLL2_SYS_DIV_REG		0x309a
 #define OV7251_PLL2_ADC_DIV_REG		0x309b
+#define OV7251_SC_REG5			0x3005
+#define OV7251_STROBE_FRAME_PATTERN	0x3b81
+#define OV7251_STROBE_FRAME_SPAN	0x3b8c
 
 #define OV7251_NATIVE_WIDTH		656
 #define OV7251_NATIVE_HEIGHT		496
@@ -240,8 +243,31 @@ static const struct reg_value ov7251_global_init_setting[] = {
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
@@ -314,25 +340,6 @@ static const struct reg_value ov7251_setting_vga_30fps[] = {
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
@@ -369,7 +376,6 @@ static const struct reg_value ov7251_setting_vga_30fps[] = {
 };
 
 static const struct reg_value ov7251_setting_vga_60fps[] = {
-	{ 0x3005, 0x00 },
 	{ 0x3012, 0xc0 },
 	{ 0x3013, 0xd2 },
 	{ 0x3014, 0x04 },
@@ -442,25 +448,6 @@ static const struct reg_value ov7251_setting_vga_60fps[] = {
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
@@ -497,7 +484,6 @@ static const struct reg_value ov7251_setting_vga_60fps[] = {
 };
 
 static const struct reg_value ov7251_setting_vga_90fps[] = {
-	{ 0x3005, 0x00 },
 	{ 0x3012, 0xc0 },
 	{ 0x3013, 0xd2 },
 	{ 0x3014, 0x04 },
@@ -570,25 +556,6 @@ static const struct reg_value ov7251_setting_vga_90fps[] = {
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
@@ -1369,6 +1336,12 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
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
2.53.0

