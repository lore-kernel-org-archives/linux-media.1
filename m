Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690493;
	b=uSDEswR7TBPuM2KCobr81V04dS3pxJPVu7aX+1ps5jVs0sW/OR6IqacmyXNJcbRPCoDu
	 tm3qD3WBFq97ZATRp65p3OBdNwB2zdx1cHz5WiUHS1ch7Y6WVVoFIbbrybf3X2uP8xaUq
	 Ne2+P1eISXmcGWF4WMqYklSy8eAUhDsZeGTiPffjK+o8/r6/HUjOb0GdPfgbz3Qq8OWDd
	 vy52SKgsTPr8kJH0U/2igS7HzDNPLS1N/neB58qZVpPjuvH6WFrmDgxXVBHVJR8HMyoix
	 qXTLRYuBlnNHTzXZmqFv5CiGIgH6zeMqs1EvfnDiGdtK5pO7xBjI5KxJUnfWiZJVOMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9mhEjzlz7Jj16x4izypj1+gLbuZfUyq1nl602Q0+1VM=;
	b=5hhWieTOtP6c42wiT940nBPDuzAEHMvoSrr6oZ3mHSCZkI8y2AEY7kHjuC/eJIHBlEsT
	 9spFZkTHWdzeYNwI/62RQI3nBV6yV3cDoH/7ouWjmiheMjifNQlqdySU71r98atBbB2PQ
	 xbSpcG5K7PeVbxQ9RtgfaXVMSBEerJjnFg9D+7wwKPCW6OQPW0RIiqYytPjmCQKl1eIMn
	 2oVDNpf2lkK+AelkkAdrqk1SyBhCMQrPYV4qMRCUsU10LOP2EcwxYXp2NRvwjGyE9362t
	 VtfsntFftFXlfSU6z4C24qdq5NDEMAzBwfOZ3Iy8qbpPQHgP7oBvJIChUrWVyVVu0jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=mGUd1+4c;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A0B60A380F
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 17:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08A0B60A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=mGUd1+4c
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so506135e9.3
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 10:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690477; x=1793295277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mhEjzlz7Jj16x4izypj1+gLbuZfUyq1nl602Q0+1VM=;
        b=mGUd1+4cfXktWsyBYNjeYK+/XNNw5ptG4mkEeyVNHplldJVcnfS7V1k7FwPVTelFtS
         NfdmKEquC3VhjCJ2XsyWQOYIxgam7Z6MeSbLuWn5T4yJptEdxmE/RM7owSIg1ynA1FcY
         DPxaX81GlTdZ8GF9IWL/MQ18HQoolQoOv+OeHiNvV8aWaO9Kj4W+IfIH5kgAQHH5uaVf
         vagzqS7tHTLRTIc0Xkeh1qOiWEmLkG9FM8UQdlIEEf/X0jEzWlpxIqVRITZEKhAtO8SW
         nsSLmYtbaCOeEMVUIrhlsq8d+Hr37oFaXfXGmwrt1Aq3KdMBanGQgJuv746K94x5jX3/
         fmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690477; x=1793295277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mhEjzlz7Jj16x4izypj1+gLbuZfUyq1nl602Q0+1VM=;
        b=t4EERsOcjF58L+hhzccwZLojECIdqy+XNTHqMf2EmtosJcgADe8l24UESd3Ek/qe3k
         kPzd8LHW1/syCrO9MMeLbdwuqJNUjuLbiLI7/tC2aazEeI649OjpcnTiuKLtbxOwsTj6
         XZind9mQag3JE0ia6bOTrRFLRzQAVJZLt3T33DBl4FqPhN01wLjcwmZLxoSyb/D5lICi
         5bNB/9Awii/znDOm+LhHw3lIPr3XG4zdDrFaR7gGF/JYjtass+fPhviC12EdTudjFCNn
         XzMrqUintNw7kPL1TDJKBsCg2iFxiGpDjcvlSTzCrVuLzCrCxedk/ENsCNomJ63vvR6T
         BfSw==
X-Forwarded-Encrypted: i=1; AKwUvBy04bCWdtNCd4Szc3UH6vuvvFMdE0z14pqy7e1rc3v1IZprh3BXjnYlOptmpqKRc7hol/YMilqBAIz+Zw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKh4WtUhdufcAWflvbIlrEJSX25Fqqpy8/MdKmWR3kF173uVYEu
	PAagj7EnVTmeNtWC6tfLnjGD+UTKupQWpoKPZ7JESfMIzV1QgR+sd3xMf3oCflvDehc=
X-Gm-Gg: AYBFou0DdV0Vs2I2knrVPDaLJu2C7id3zwqVZrnB/oxVkLa2+KwMx94hmLxSERP34HB
	MuariPZ/nRXbAuIZ1wtbWaRD2rgFNNEFejSdn3Q7e8uaRCrhOdioJVvSKMrlnMedV5d8+H8epFk
	uTY9lHXimGx+UwfQ9o7pWf+DCIl8IszepE3uqPysl84Ylva53VpqgQAweAu3v65bQ2agwrt6rDp
	6XdFTJmbunGY7AsyUaPYup7Q1nSlrXhbbCd+4H64QDrRKlF8G2da4o3q5EZFcRgsY4ZmWaKD6eD
	SgXgop96Bbe18+ZX7loUpGZIlaam91TZkZkKgi/ZFcIzRwjetQqC3gdz7RkMYITiOc9b6u8tabN
	xRLg/FX3h2fV13R/QG+CqR8KtQv5RjA2GVhcGJSWm8Z98EnL/u1C+dYJRpYFcDYDcob3S7utW1z
	hGHaUVlc1J2syT1GxN66ZLhl0B5qGRd9kt1ryKbK8ga/vgY4cVKtREgEC5yNGcYet29Okagxx5m
	jK2Smno0wBP8Dcv8oMqCu5LKFuOyRt8+oUiAYRcEBtfM7Pbqnvwt03sDPlToxfw27KBbt6n2JjM
	hTUhg9AFm48pZH9SiUdJTJi9zj08Ypo=
X-Received: by 2002:a05:600c:4fc8:b0:4a1:bd69:526f with SMTP id 5b1f17b1804b1-4a1fd8a7d9dmr129819385e9.4.1792690477435;
        Thu, 22 Oct 2026 10:34:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:36 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:02 +0100
Subject: [PATCH v6 09/18] media: sony-starvis2: Use pm_runtime_autosuspend
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
Message-Id: <20261022-media-starvis2-v6-9-374343f55fd3@raspberrypi.com>
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

In order to reduce the time in stopping and restarting
streaming, use pm_runtime_autosuspend so the sensor
isn't powered down.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 95da8a9e671e..27357cc293be 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -858,7 +858,7 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1049,7 +1049,7 @@ static int starvis2_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1072,7 +1072,7 @@ static int starvis2_disable_streams(struct v4l2_subdev *sd,
 
 	__v4l2_ctrl_grab(starvis2->link_freq, false);
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1447,7 +1447,10 @@ static int starvis2_probe(struct i2c_client *client)
 				 NULL);
 
 	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
 	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
 
 	ret = starvis2_init_controls(starvis2);
 	if (ret)
@@ -1479,7 +1482,7 @@ static int starvis2_probe(struct i2c_client *client)
 		goto error_subdev_cleanup;
 	}
 
-	pm_runtime_idle(dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
@@ -1494,7 +1497,8 @@ static int starvis2_probe(struct i2c_client *client)
 
 error_pm_runtime:
 	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_put_noidle(dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 
 error_power_off:
 	starvis2_power_off(&client->dev);
@@ -1516,6 +1520,7 @@ static void starvis2_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev))
 		starvis2_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 }
 
 static const struct dev_pm_ops starvis2_pm_ops = {

-- 
2.34.1

