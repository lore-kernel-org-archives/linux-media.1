Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653286;
	b=hR9zpOSzOBIQiAS3uRm2e2lbxD4VYeIk5qeiHUzHEvUKbSVvd0Isfld846Dmt6i02/LR
	 SuDJXiP/zJsy+En4+5Ja1MHnToYRcnznm5SqcV6n+QBR3MImaziI2MLMF2IvWobBwFdg5
	 UEXOXztXNin4+K6GTUU0KvsZRa7r3gbENzzYH2V6dxw1zdr7/jTI5GjbqHZoh1ZgOe+uu
	 QDY3hPDKTufbzE4eAvOA4KiaNRIo9HQ+s8jPsTTttAJHhneJ5PyG101eN0r3Pg9lYNfiB
	 dnpFdbJWpZ0xL0HmgOO/v1W2oMLJOb24RWo1iJeq1tscFTLGRqpU4qAx5No0rI32+NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rbQd37yNdLoEoUUb1uI07DktRFDbgbFgP3dMH/u8vgc=;
	b=N14yJRtmim31lESpF/qxuDL08uRQztGhZSZHus8K+yZYnshIaRC/u7SeadwwI6Th4EZL
	 vzKY1MMxVqJB/a2obQ0968KvgJBdd6oXau+m7oK6tiu4lGvobyZVtk8pUItkkqqHkyFMb
	 z/v7JKSjwe0cLEF13jRrYUQO2pmaWDW7DatQaOPQK5ggc2ITUuDwen3UEHtTonh+dUMmO
	 dY/VCOSGXg/GyClj1LYxU7ESpNGh7WWRYFM72mZt5KEW2G6Rmnd/pT/fDJQkZWUDR1Cj4
	 sKGko7KwfPJgskkMWB8F1EPnEQDkqM/koJJxR+SXraAhSoarzG2MkhkwuJKz2dxX4Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BFZUQwc0;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F1A606A328
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 07:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21F1A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BFZUQwc0
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33fb4680717so3808563eec.1
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 00:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792653285; x=1793258085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbQd37yNdLoEoUUb1uI07DktRFDbgbFgP3dMH/u8vgc=;
        b=BFZUQwc0glnGG0PC89J6I5yzkEC2MR9OBVnxAlTWSNJ8PjQOGdEdTojkyZ000fkN7e
         /dLlw/5WtvHT5jU1Yxb+WnqLDWSfzrof6bbJL5BZmrl46WtCGkJg1OKvHcF6eU990bAV
         QkHS0G/s1TMlcc/SSQtVmAUmBSr7R0IzoGXCX5PvLjuokmEWSK3+cL7NJtu2hTzoBPQw
         GG0wDpoO3cgyMe2DJJPE3vuBX0vjYr5isphipLLx2VirrFABjVhrX9oCuv1HUbrkPgMw
         PJJ41YcltJaXXf0As8L62f7a0Q+dPDQjyiJoOoXy2zqV4PouQ59trMIUpagKBt8KDJSM
         FKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653285; x=1793258085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rbQd37yNdLoEoUUb1uI07DktRFDbgbFgP3dMH/u8vgc=;
        b=uNUsQUUMejhAPIj44dpC8iVRoEWQ1HzXzJg7U7zJK7dY8QTtVugWcs+KCh4OS/e7No
         8bwV6W858IoXShoz8mZkDEVteKAbyK3GYx0jJsn3i99ShCYA+YB5HPfDCTwrmoM+LQT/
         /rPjfrIBIsCurD+g3WWqyjILEklUQxZq3krJnCYRcB1BM0EZw9pjzT3csbxFIhG8GV4V
         vdFUfp8sHxiwS0AHRPRg88hw+so13QZ5RiuaUq9coqn9kuEWxelqIBr5M8MZgkqeOKVf
         E7KBiaan6S3j7BOYgtcW2LgsJ9LYpRYrth6obk2InDqfy6vbSzBmw4UBbLVQ1C7REHFt
         JLcA==
X-Forwarded-Encrypted: i=1; AKwUvBynpOqp4v0/3w18oedNPwG3yhSt/aYKlThPIYWif8ZqPyoUu0PMh6Il5GCrKtc+rTVINYAWAUttXAPH/w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIjl9AhwRcacunmPNZUImDHk3+NwrboYlsZThenKpy9Y2FPoQcJ
	kIv/aOsYCTdBw4ne494unRmmTZwOWjQJUtcDjfaLS9GOaL8018MCZKfA
X-Gm-Gg: AYBFou2MgS4cKroFLRJA4DBZf9zpMRMx8RGCPYV4aOAbKWhpLUkJ3jsNDCK9GVN7X2P
	T/7OJ0WZLa8z5jZ74OoimCABuw7nxTrdcMz/cgMo/HsIOTpgdk18UCIYAnW6SSRAWuUGEBlqJpn
	aXeOKHpieeKEHlqryYJ8A5QFIa6JuueUafVukT4jpHl+mXuqMmPRjM7PodukTIaA7/fkyO5H+6T
	ldeMxNytjY5j2pTz4x0rAcJ3ZhPpNWU6GzVczfm4dWxJBADVeV5XhjpkIrypuMcbZ7u8/1f1fet
	gwzHLOQaBznBVChSIo4yw25g0oV3mnfiUDdm9I+rzvrGuuPPR7ojLvpYH2+mwGvD3mxGJYgkQNA
	g8ZOZj2N3aw/fLDYstVPPJsqYZtDeHIy21q7ARJqafEFz3K0Ea/X4qcCXEV2ftxA5+pp3cDWoTB
	bzilgTJ6HwzIrctxk2SGgi73ZjrVuZ3MwKPZ9wwriUdNnJPRc2z/JcXjCPV5GL9ODvUWzoQCSt9
	WCDq9vqb1VnBB6m4dlyBMwY2fmQUKM77PF62WbStdBqq/co9JLAs9190Dc2ZQ4hF4XlIqdkRuU=
X-Received: by 2002:a05:7022:c43:b0:194:3a84:e67a with SMTP id a92af1059eb24-1943a84eaabmr325046c88.41.1792653285121;
        Thu, 22 Oct 2026 00:14:45 -0700 (PDT)
Received: from fedora-x1e ([210.89.35.119])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bd6b7ccsm11112321c88.13.2026.10.22.00.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:14:44 -0700 (PDT)
From: Saikiran <bjsaikiran@gmail.com>
To: loic.poulain@oss.qualcomm.com
Cc: rfoss@kernel.org,
	andi.shyti@kernel.org,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	bod@kernel.org,
	mchehab@kernel.org,
	vladimir.zapolskiy@linaro.org,
	jishnu.prakash@oss.qualcomm.com,
	birk.skyum@pm.me,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 2/2] media: ov02c10: Fix sensor power sequencing
Date: Thu, 22 Oct 2026 12:44:18 +0530
Message-ID: <20261022071418.26895-3-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022071418.26895-1-bjsaikiran@gmail.com>
References: <20261022071418.26895-1-bjsaikiran@gmail.com>
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

The OV02C10 driver enables MCLK before the sensor supplies and disables it
after the supplies. This can back-power the sensor through MCLK while its
supplies are off and contributes to camera brownouts on the Lenovo Yoga
Slim 7x.

Follow the power sequence used by the firmware on this platform: enable the
supplies before MCLK and disable MCLK before the supplies. Hold reset for
at least 1 ms before disabling MCLK on power-off, and wait at least 10 ms
after releasing reset on power-on to allow the sensor to start up.

Update the power-on error path to disable the supplies if enabling MCLK
fails.

Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 221cb93126ec..42aa43ea0a22 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -661,12 +661,13 @@ static int ov02c10_power_off(struct device *dev)
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 
 	gpiod_set_value_cansleep(ov02c10->reset, 1);
+	usleep_range(1000, 1100);
+
+	clk_disable_unprepare(ov02c10->img_clk);
 
 	regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
 			       ov02c10->supplies);
 
-	clk_disable_unprepare(ov02c10->img_clk);
-
 	return 0;
 }
 
@@ -682,23 +683,24 @@ static int ov02c10_power_on(struct device *dev)
 		usleep_range(5000, 6000);
 	}
 
-	ret = clk_prepare_enable(ov02c10->img_clk);
+	ret = regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
+				    ov02c10->supplies);
 	if (ret < 0) {
-		dev_err(dev, "failed to enable imaging clock: %d", ret);
+		dev_err(dev, "failed to enable regulators: %d", ret);
 		return ret;
 	}
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
-				    ov02c10->supplies);
+	ret = clk_prepare_enable(ov02c10->img_clk);
 	if (ret < 0) {
-		dev_err(dev, "failed to enable regulators: %d", ret);
-		clk_disable_unprepare(ov02c10->img_clk);
+		dev_err(dev, "failed to enable imaging clock: %d", ret);
+		regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
+				       ov02c10->supplies);
 		return ret;
 	}
 
 	if (ov02c10->reset) {
 		gpiod_set_value_cansleep(ov02c10->reset, 0);
-		usleep_range(5000, 5500);
+		usleep_range(10000, 11000);
 	}
 
 	return 0;
-- 
2.56.0

