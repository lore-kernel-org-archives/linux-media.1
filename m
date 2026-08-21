Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41D73112DA
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 04:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787287678; cv=none; b=ivcOwTwL6lwcZxhHPSLVs5tpVwzGCiL+VBBUfWSI+ZSlUiG7ekyGRAIuItSUUcWsh5qK462gKWR8pDjSusLz+TG9Ex2ymlVAcVTmneywYKBxu5rCksDC08q0eSUnkcjPSuY0+7svpiZ6SXIP2x5L26/HMvPwJktrC3VGfYUlIlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787287678; c=relaxed/simple;
	bh=DC/aueJmRr0NLlvt3Vt7fzld0AodYmyRw6f7dpH8bY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZzxIY1+WQYrMwoZvNdz4mP4/rBircu9MFPPZ1FNuJmuH+VzZ9927fVb4+b6H4Y2EpbVlXNrhFqW0KT3fElxMDuzN0FawsZUfx7cZiZRE9fI5PVclimxYwY3EQd7pQnShtpVJy6Er/AZBGBdO5kGKdHRbjsPHjYk0ykiwO0eR/Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfk2tLFz; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfk2tLFz"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso381527a91.3
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 21:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787287676; x=1787892476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wjrMn4EthzUGfYuREqZXoUvo5K+IiJfJhPbB+HjfVzQ=;
        b=dfk2tLFz4JWKTFWfUtKiwRSMBX0SjjdWecqZOlibr5QACihJltVneG6bIwdeSP0t62
         ypJ8xPVezNFBp1ugIH8w1YIE/za8NRsmqTZ0PUuTq7hbyANvpQ/l6ucdhdsH0OYuZYVZ
         dzjRlqlu93SwjLSZqaSlLGkKB1TiKAzsyYjuw+LzMbAGvZpHvirpmb6qh/K04n2RdmL6
         g6WTH5YB9I+ADA0YDEGMeVS7P/sRd4lRZLTRgcJXMuBcp3ZBMbNavgwXPYxnqGsx4GmS
         NNTmO5KCUNbnkDkxgqvsbYGDAznE78kKsiQbRulQTT4tRFuzPc8jjsy0LyG2IJ1AabM3
         fjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787287676; x=1787892476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wjrMn4EthzUGfYuREqZXoUvo5K+IiJfJhPbB+HjfVzQ=;
        b=gSj9i4yVwsBsupsvsRNRhlJcCI0rw6W2buLGMpHACwAqnX4DVfo8tOP9TyE+Z8yAAy
         /ffs421bK6zJy8lQQBVJIsdoW/Bsh0lRJXBj+0avQNiQ1XMDKhKIpXFlNa++EH6bdGUm
         HFjt0y6fyrTryHbPYyYxZsJ0piLkAjJOdKxKwDF+bvoQFCesSxSR8HPrMr8qg2IaQMNt
         bbOmeEAbFypf/OdP7MVYsFn78uMULMMWSJYCOxHnWA+xKcuqKWEb+F3ojbASajxya4a4
         jS5RrpGJCnUlPZG7F13wN0ky+cV2gvuSaLSKQnK3dchWV+jIvjxG0+FXuu8Yo+Dk6YO2
         RMLg==
X-Forwarded-Encrypted: i=1; AHgh+RplB9iW47clhh7WeJliTY1iT0Q2tgGKMS9YiURUfvG415f1lRvwrVMKthNgyKg2S+Lcdm+SEbGbXulXPA==@vger.kernel.org
X-Gm-Message-State: AFuF++mngrnkRACzUPKvpYkdZ8vVgGRgwN79S1/xT+wJhNyoIzYjjBwV
	SabBafD7PmSGvCWUQbLWjvQg4NtWosC8q48Y6LcQGSOGLbh897bl2FY=
X-Gm-Gg: AR+sD13IfMlI0aH7x1W1wZIV6Nj5oi3FSlvE5vZgqKD8zMFbOwK+Gf3lcUoZu1C/O/V
	Xc5KByYZYeO4H4+XN07ORbkkSF7aC4qehCW/xha37SppKuybIDck7cQhyDvQvcUSvBFSA+qLA58
	9/vdVewgq4lFNrI9G3LD7TU8fr3kyeTV6Rp19WGmeDu6QlBFHS3uei5t7DCdZAG/UHRMaO7beb1
	n0eMR6zECwOERpUZd7kliWiQMtbyeNTIeG13gCSpEgQE0EAmhdN7BScJZzgOasYRRtLTm3OWYUE
	Ugiz4xwv7ooGNksmu5lFo7FH89gDqc8Ehvjd+uoXaRGVVQtSYkkyfQXTYs5yF/t1FPvvr8l6/Mh
	hne3WtS0bfD7T1z30FHXKxr+O19mtg1KAceJR7MQeI95MjWTdym0UCZRn95ThJ5qmeqw51PzY1T
	xer5Yk6xZitOoaa/XYGNLPiG0DH5Av3/fl79kbIYdgJNIG1BaimnGdxOMxu7LXzt/BowEJM1ep9
	g==
X-Received: by 2002:a17:90b:3ec4:b0:381:528a:808c with SMTP id 98e67ed59e1d1-395c397c6ccmr5823109a91.12.1787287676025;
        Thu, 20 Aug 2026 21:47:56 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4c12c2fsm1563336a91.13.2026.08.20.21.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:47:55 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: pavel@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] [media] ad5820: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 11:47:51 +0700
Message-ID: <20260821044751.128948-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the deprecated SIMPLE_DEV_PM_OPS
to DEFINE_SIMPLE_DEV_PM_OPS
and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations
from its suspend and resume callbacks,
also reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Fixes: 37f0644f3a56 ("[media] ad5820: use __maybe_unused for PM functions")
Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/media/i2c/ad5820.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ad5820.c b/drivers/media/i2c/ad5820.c
index fcce2857b69e..7418ae227636 100644
--- a/drivers/media/i2c/ad5820.c
+++ b/drivers/media/i2c/ad5820.c
@@ -268,7 +268,7 @@ static const struct v4l2_subdev_internal_ops ad5820_internal_ops = {
 /*
  * I2C driver
  */
-static int __maybe_unused ad5820_suspend(struct device *dev)
+static int ad5820_suspend(struct device *dev)
 {
 	struct v4l2_subdev *subdev = dev_get_drvdata(dev);
 	struct ad5820_device *coil = to_ad5820_device(subdev);
@@ -279,7 +279,7 @@ static int __maybe_unused ad5820_suspend(struct device *dev)
 	return ad5820_power_off(coil, false);
 }
 
-static int __maybe_unused ad5820_resume(struct device *dev)
+static int ad5820_resume(struct device *dev)
 {
 	struct v4l2_subdev *subdev = dev_get_drvdata(dev);
 	struct ad5820_device *coil = to_ad5820_device(subdev);
@@ -360,12 +360,12 @@ static const struct of_device_id ad5820_of_table[] = {
 };
 MODULE_DEVICE_TABLE(of, ad5820_of_table);
 
-static SIMPLE_DEV_PM_OPS(ad5820_pm, ad5820_suspend, ad5820_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ad5820_pm, ad5820_suspend, ad5820_resume);
 
 static struct i2c_driver ad5820_i2c_driver = {
 	.driver		= {
 		.name	= "ad5820",
-		.pm	= &ad5820_pm,
+		.pm	= pm_sleep_ptr(&ad5820_pm),
 		.of_match_table = ad5820_of_table,
 	},
 	.probe		= ad5820_probe,
-- 
2.53.0

