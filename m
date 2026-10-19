Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD88572EBD
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 14:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420116; cv=none; b=eDGlpV496i4GUH393812mOzw+vO+kpLJrbMvNnVxnKcr05Z2CW8lfvStYefrbVoZnqNROW6/21ZzCK1cgzz5s5/aHq0Jh1SmnCx8fNdL3OoWltZ5wwfzskQw3l08YKvJCclLz8frQhE0LbW5x3tbxSzCrp7iJOPPtTM8Bt9WASc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420116; c=relaxed/simple;
	bh=FnajhbKE6uIgk2tXwZaCDaumFhbm5Q7VnLpjSW4gkug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TZHueXvUsavKSSwMd5wF3NBXTfgks9Xb6G6sxJgMDeCOcBgPmELANyL0Cqz0iqiUvBWhkvRxJdGGMPT+x3bJ0XqqVGZmVJ4tzCdglbAlKf6DaeUAoYBa9rOvbmDmODbgXLI4ojlNpq/du1Jx3bDVNgWwY5d5CBAZwnBmxKY3KcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=A3U7Eu+4; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="A3U7Eu+4"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1802459f8f.0
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 07:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420112; x=1793024912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=83lhQTeMzqlLq3XpFtcjV4guibaKsArXiKHi9ZNUpeo=;
        b=A3U7Eu+4RqY9dE3Gt4S3GrHueeBVuM4kcfI+cxCeahNNECMZ8E+FJs9xyhtpH5q/7+
         MG5WFzWIG1AD+pZvMZN9gYXX0JJj5v2o2/N+HCFQiYIS1w2iXuD37ifz4F11DAhSbJlC
         bNPtIwhPXY7KaruJaYdTxIJP4KKnzup4a6qFg0vdyNE91S7UIAddd4z2NlKcx7nTCuFe
         o7XHqv40PlEnrxzfVgBNNJVuVcjv3e9bkWn+23E4a0gQssA+0OFTLfnkN3NaJA/Wy6Vt
         7S75dGXag5CHr7BFxlj8HQK6uWtzNogeORMtwjieDg7xwE6HU4xp8keMTuhyA+LH3DCT
         JmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420112; x=1793024912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=83lhQTeMzqlLq3XpFtcjV4guibaKsArXiKHi9ZNUpeo=;
        b=MQPKjQ4lcsyTW/JHXowT4quvWqKT0RMKSNebCJmTrAAbxW3tD7qE537j6v1UebKITt
         h7nwgJ68njG9yGnd+VOuz+9fOQQxbDGGKPEJZhCo4arJCpO8ruwKGhXQcjVGBSEyWuDz
         EbqiLa0qTs8hs8s26Dw5bHvtdO0qqoUL2p22CU1oR+YSsK4d8I9GTYioE6vPto5deLaQ
         qrHaLYHH53lJeajDsogsDZ7rcqzgGcs6lcF192IjI8sGBdj3hnSIznRNL+JTgfz9TMnC
         tq75ap7Zk3RnH8R8HmomQrAMmlMGd7W1C8cguGxSFhGx71Dhqyf8d4n2Tk7z2kDCKmIa
         NVBA==
X-Forwarded-Encrypted: i=1; AKwUvByYQDV9byx4619vuaws8NILKHC0wrSpmjCOdndjzSQgYS/QTrqvGBuDOLbC3h2oGebSumO+XHb471QxxQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLcv0NrsStvTAxhNYhLiu70tF22nZ+CYznpgQtvfy/tqVpk0nLE
	A+WrZZZm0Zcyk4V1xQLTRy/tGCD1GRFgsvROIJl3oa1DFTgPlwkOwOrvjH7fxu1FeH8=
X-Gm-Gg: AYBFou1Rguw5KHGiNcn8Pi/D1m+UM5UQm2gKtRPutD8OEfgD3hRDlSb92NJx1w+SEcN
	0ifTw/0ApPtxPplkJKNP0nwr31t05YAHdT5qg+ebl/M2N4OMhSn+R20EH5dOUBpAM/FBfLvibAN
	mzrdFieuDsmjW4kYbcanBIMLyNzjO2APdthQnhAngsOiOUoC9BOM8RaFgjBF9aPRqEFB9ia5rJ7
	Cb1QIW7uiM1QzYUpkyB+idenZhzg2uXMjgq5h94ASHRxB3wjerpLje6J/QurDd9gk8iuySuGvfs
	U3XUokdmEDta05hBOGNaU6VdPIEWCsC7kBpA+zhmq5fE6bYDMEHxWpm+dSL7lVVKNZ+kYEbyzk/
	3Bes2GnO7uSPfstoVII3uK/pJSroZZH48Q19jFUaQg+YaPutvrKgpDw70kmKq5gNYtimyUJuruC
	FDrcpy5+3fLXG9/GcfHitFP55TFGoz3+212tI+tEwL/bmCrSqDUhLZNwr8mnytDgZOcdBJ8TN7i
	ktC5S46fkJ9eUdKG0T9pbXrmhkH1Ws4odzJfZvRi+1HOOTg3w==
X-Received: by 2002:a05:6000:1865:b0:48d:f7ef:cd1d with SMTP id ffacd0b85a97d-48e07bb2cc8mr18998224f8f.9.1792420112284;
        Mon, 19 Oct 2026 07:28:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:31 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:28:15 +0100
Subject: [PATCH v5 08/16] media: sony-starvis2: Put module into standby
 after identify
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-media-starvis2-v5-8-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
In-Reply-To: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
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

The module has to be brought out of standby in order to read
some of the identification registers. Whilst it would be
powered down via pm_runtime, should that be disabled it would
be left in streaming mode.

Restore standby mode after identify.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 1c3dcae5e0a4..2388105b6a30 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -1160,7 +1160,8 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	 * This sensor's ID registers become accessible 80ms after coming out
 	 * of STANDBY mode.
 	 */
-	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT, 0, &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT,
+		  STARVIS2_MODE_STREAMING, &ret);
 	fsleep(STARVIS2_MODULE_ID_DELAY);
 
 	cci_read(starvis2->cci, variant->id_reg, &val, &ret);
@@ -1168,14 +1169,15 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	if (ret) {
 		dev_err(&client->dev,
 			"I2C transaction failed ret = %d\n", ret);
-		return ret;
+		goto err_standby;
 	}
 
 	val &= variant->id_mask;
 	if (val != variant->id_value) {
 		dev_err(&client->dev, "Chip ID mismatch: %x!=%llx\n",
 			variant->id_value, val);
-		return -ENXIO;
+		ret = -ENXIO;
+		goto err_standby;
 	}
 
 	cci_read(starvis2->cci, STARVIS2_REG_MONOCHROME, &val, &ret);
@@ -1183,7 +1185,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	if (ret) {
 		dev_err(&client->dev,
 			"I2C transaction failed ret = %d\n", ret);
-		return ret;
+		goto err_standby;
 	}
 
 	detected = val & STARVIS2_TYPE;
@@ -1205,7 +1207,10 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	}
 	starvis2->variant = starvis2->info->variant;
 
-	return 0;
+err_standby:
+	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT,
+		  STARVIS2_MODE_STANDBY, NULL);
+	return ret;
 }
 
 static const struct v4l2_subdev_video_ops starvis2_video_ops = {

-- 
2.34.1

