Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793580495;
	b=cxNhZBVhEMVfKj8lfrqBU4v0gjpy+9q6rRf8lx2mGktA88MYTi7ddl+SMb+D6y7+mXO1
	 X63T0ubKcFEWgR9vmGHizsN6FgCLmbH1Ti3/vC4Dy5b2ecjntPS08Ss5HE6VA6Vq7c2sc
	 qo3DTcdpDg1JzNrOjMo+3TihqHNeCbdZlHjWjn+Q5oAyvD9mdNjaTbi5cS71oHiKV5hKe
	 QB7s25vXxO0O1CiycF4vfaieKvmPndOr+Cr7+COhZcFkjuT+f9ysGG5rwmMpzdy2SxTEH
	 6ycTeZZ4D+FW+ybgdx1NhX0RzFxu0fQ+e+4cjafwypgMdQa02vCyT3UdX8MkTzeshug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793580495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=TFa0EQ/jMEbb9GS9xvK0BNyEEOcr4PcUqGB5uPGngVc=;
	b=i4xsyk5DeI1tDyDz2qBm5nvYHTZGHYLWw5xW4dmxmMIgBikeVrsxWfroIYh3Tr6lcrjg
	 ZpJHgMLlwPkkgY1cA58eRGmjTKkGOHUSSAG6EGBFnw+MO69nG8DWWymgPGSYge6Lr7Kz7
	 eUyCvWB0FNV7e2xtM8WqonW9ffMsrucC22bWV/0zQr6Feb/cIW0XE9v+Sh7tne7vuvmRh
	 l/xT7dv3nwMdOwEkqZr9EMQovQNUJJOE7Qc0V0oBTFa7g0Oc3wGCaNRKGRhz1rl5p5PKW
	 CrMt0DF3owc3mbC1lvN9nvVQMiJbHT9AKWqOD1xtJWCcP6n36S0vB2A6VpW+SS3021g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aXOils/j";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5A1606A324
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 00:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E5A1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXOils/j
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2006421f8f.1
        for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 16:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793580494; x=1794185294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TFa0EQ/jMEbb9GS9xvK0BNyEEOcr4PcUqGB5uPGngVc=;
        b=aXOils/j+4x3fUKEo0TecqozQsVhSl5mIeLQN/yziPDeJvwpvN6tdnbtR6GfFtoFZq
         yuVF1tYhasngJGwMCyS0PpLrL35thT0fMM56XgAYaOenmmWK0VgUPDhtUg/p7voStALj
         ++0BlaUVk2xPEnB2BwF+iyHPJDAFjXUCkeqP1iRSEbKTmH/+E+SC1CsttMNPEXjuO5dC
         5uNqRGsiWtC6ScSM9MgqPR7rfUF8vDYBLGTmfWkbaD4vJ4fy6TvVj32V2F6uik2yPRG4
         /6RkVxV1Qaj4RuSiglsAutj6qsSJWzbSVHputFauzizdimhleeksR/ms9oVxws3fOKqg
         5Hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793580494; x=1794185294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFa0EQ/jMEbb9GS9xvK0BNyEEOcr4PcUqGB5uPGngVc=;
        b=XVBgpJFgO4hv2Z1dYXj0H0ne3nwchxBbfMmfiWO8HxhlU4Mmv/vNVfZnPZ/MLB9PT9
         //nR+/Xm7xUnZryfoY0nojWvBzY7c6YGO+sHP98DH+ozULbLBoGI4TxsYEqVTV9Ykjxi
         fwH4GTX8pTLo0Qqqf/L1VMBzZyDlELt4FHjTOv54t5hUkCl2RW87XXlMEGScYQTvaDco
         8GxaME1Tzzpc3EuMk2ZyoPAJ4USk7bfbE7mu+WYcLbTTioJW/0xt4cAHiRYZTnl1gGJO
         MQdE19MOoCj4hLdLhUblbFGBS6FJPoyBaS5OUDsC3o31nj2SmS/wEmMYa+CR6nd3XprW
         lnFg==
X-Gm-Message-State: APuU4Z9V5nETeBpdt1ySP4eZZMPcVZRp+MGRDWLUoJlZ+0OO5WtryrT+
	FFZuu7I2k9+93e8f/7GNTZwUBPYpMJAW5vmBYDHp5YQbp0COKr7pzrY=
X-Gm-Gg: AYBFou2kC/YBE3aMqlSrd6VF0wEcMpU/RRxJ/6ezj6FeFQkraDvajMC0iRTSEsRPpI+
	BIA+KUFFCq4HxhrhpL/EzXmXKkhyWktaMHDYwcxUsxZH+MCrlHebQl7yZ0IuQiuETmR2WLkXQB2
	OfC04KhZsr22Qv6zKRHFk1ZD5zPO0Dz9NS54wnnb3tt7ROLyQXbnzVEB9y5kHyIDIw5/dyBQObb
	DOaK+ivBH2ZMxd0vqnRLHDvxVw5+08Le0VhBpOJAsYMjBsFYRF1LhDNTXQ/och1qp63vCoPSbPg
	KhKcgDuFXu3agaCHU1FM+/iGTDYay2QDq+JNzLoJNiRIaP8zTKuXhhlX9c5jdX/PCse5/fknBWA
	3Brp9Beh04x3wZVyF5VTxG+8ZprgOdQeiXnQ6EmYPFDxMgBAyF9QACcKGbzDxm/+Wrama5/a467
	0C57CIQsBU77mt/3Eq0t8MALqLQsZtHVwWO5zY5atSQJe3Ln4GPziByyDHqta7b4imL3HpzCW19
	G7jJhf5OHLsKGYH83EuhrkVG/0+H6uhOSfkSKdLNhfpREsXlLvCzGLtM89Cbyn4cyYplSBvApvl
	wYltL9o51vtdzSb3PC2yifQNKHwERMHWggTY
X-Received: by 2002:a05:6000:22c2:b0:48e:21d:7265 with SMTP id ffacd0b85a97d-48e6e50d69emr21050311f8f.34.1793580493996;
        Sun, 01 Nov 2026 16:48:13 -0800 (PST)
Received: from sasha-User.lan ([185.159.163.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7246fsm17044531f8f.19.2026.11.01.16.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 16:48:12 -0800 (PST)
From: Asdlerto Korry <korryasdlerto@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Asdlerto Korry <korryasdlerto@gmail.com>
Subject: [PATCH] media: i2c: imx258: Add support for the reset GPIO
Date: Mon,  2 Nov 2026 02:47:24 +0200
Message-Id: <20261102004724.346475-1-korryasdlerto@gmail.com>
X-Mailer: git-send-email 2.25.1
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

The binding documents an optional reset-gpios property for the XCLR pin,
but the driver never requests it. On boards that wire XCLR to a GPIO the
sensor then stays in reset (or is released at an undefined time before
its supplies and clock are up) and does not answer on I2C.

Request the GPIO as optional, keep the sensor in reset while it is
powered off, and release XCLR after the supplies and INCK are enabled,
followed by a delay before the first I2C access.

Found on a Samsung Galaxy M52 5G (SM7325), where the ultra-wide rear
camera (IMX258) has XCLR on a GPIO; with this change the sensor is
detected and streams.

Signed-off-by: Asdlerto Korry <korryasdlerto@gmail.com>
---
 drivers/media/i2c/imx258.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 065c33380f60..899dca4be650 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -4,6 +4,7 @@
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
@@ -681,6 +682,7 @@ struct imx258 {
 
 	struct clk *clk;
 	struct regulator_bulk_data supplies[IMX258_NUM_SUPPLIES];
+	struct gpio_desc *reset_gpio;
 };
 
 static inline struct imx258 *to_imx258(struct v4l2_subdev *_sd)
@@ -1130,9 +1132,18 @@ static int imx258_power_on(struct device *dev)
 	if (ret) {
 		dev_err(dev, "failed to enable clock\n");
 		regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
+		return ret;
 	}
 
-	return ret;
+	if (imx258->reset_gpio) {
+		/* Release XCLR once the supplies and INCK are stable */
+		usleep_range(2000, 3000);
+		gpiod_set_value_cansleep(imx258->reset_gpio, 0);
+		/* Give the sensor time to boot before the first I2C access */
+		usleep_range(12000, 13000);
+	}
+
+	return 0;
 }
 
 static int imx258_power_off(struct device *dev)
@@ -1140,6 +1151,7 @@ static int imx258_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx258 *imx258 = to_imx258(sd);
 
+	gpiod_set_value_cansleep(imx258->reset_gpio, 1);
 	clk_disable_unprepare(imx258->clk);
 	regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
 
@@ -1389,6 +1401,12 @@ static int imx258_probe(struct i2c_client *client)
 		return dev_err_probe(imx258->dev, ret,
 				     "failed to get regulators\n");
 
+	imx258->reset_gpio = devm_gpiod_get_optional(imx258->dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(imx258->reset_gpio))
+		return dev_err_probe(imx258->dev, PTR_ERR(imx258->reset_gpio),
+				     "failed to get reset gpio\n");
+
 	imx258->clk = devm_v4l2_sensor_clk_get_legacy(imx258->dev, NULL, false,
 						      0);
 	if (IS_ERR(imx258->clk))
-- 
2.25.1

