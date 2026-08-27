Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02B44CA28B
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 18:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854691; cv=none; b=ZdugOb9tl4jAZINX1VwnKAMsm2oV5NnOwaSQAsrIGwiX0qan4iafA3DSQbmMyaoxcxkGUahTCns93Ln08SKdqocZflbkRCLWQESirEdVJx0Z1XYkhCH4ws1VQWulhqEA/M3Z5xUmLjOL4Vz7VQ57YO12gT/Inz4BZEQwDnGGj3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854691; c=relaxed/simple;
	bh=GY/0GwAYKkdGCB2mGjNb9iNJ3uZoj4B7s9rKLLBlD0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhb/2OQ4/q4n+PGyWSDDbh8RVgVqCQjW2OHdQQggUeJFQzLEoqXvj3h9bgx41rQ91oqTdzPyJ4T2CPgWYuVkHuIRHbJB3xiu0sNFK4uwp12EySGnSYaWq6tSx02FU0TCrXoofv4MxJ5bC8CwyOAMH2UzIU6KydfIytatAaKaT2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9fD0Qvi; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9fD0Qvi"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso345725e9.1
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 11:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854688; x=1788459488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=e9fD0QviteEKAZf51GIXV7KxTXkjgTTk+9Ko9lkXhUvY8iZsB1DvbHt/J7biDkr7ke
         DRML9PW0H9onwCPxTpJFozT/sF3BRrW43NF+chIGn4HvvQFIEYTXLm+Cm0CqtuR4U908
         Z2ZuvyWwj7F8qW7xfb4rkqHhWlewm7+1HkFbQ1zFTGDKZBK3WumiDwba26l84hcUcZi+
         KeAMQAZ38/joIu8maFOu2EHqny2Jv7ZB/acWnRALwnxCm2iVJGjduy77LmEgXB+ShtBG
         jcFkVK5/JMw7cJIN/6Y7tIbRAZksipXFwLBObQsrXcsL1ooxirL1gpt7BOQbNfKUuFUt
         CUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854688; x=1788459488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=UuMW5k+4B9LJoEItnuz95E3tBVK+cC0tRYIjnwQaGTELhBWRwZ5zu805h/lXlYFjVP
         Hk0acWrWLLeJLYQiORxRAd5fdjXsOPk0dGbdhp+Ml/i+gUkvB+4bCFKk9PbbAkfrhMP+
         +xo5xxoQJWttM/brYqYh1I/iPaYC3NBh+Si4LONm5NCCIoLGd2uqm7ajhvRucG/HxI53
         FcTdzAORhP5xvdBd+d3AzwP5Xsyd74MVtTn2h0ZAR9zL2bc1j7g03vMSsEQgq+GHAZy6
         sBgk5jM4XhUVRAV6CnZLEM3TW7v6by9yOaeLxQjsJvAPvXDo8XztnDRAJQ/MRfMVKAIc
         2C8g==
X-Gm-Message-State: AFuF++lgJh/6QvyArVr4iDIULQIgRlSMt8O+soOxHYIrkuS6VF8T72R8
	GSUUCmg13fIFIj2D3QHOEMkZ/CfyL61XTJPGO4x4d4h/Y1n3wSpd1EP5DXynfuI8
X-Gm-Gg: AR+sD10t97mebFO2HwWCVYdyf4VLV8JC0jsUdAj3hhK0Wa49Ru8gNkKY9/QtQ4dXbd9
	4dvhDKuwkJvdVjreQil/HDpkpF1TZXPUHOHwjF5httr+gMOSvw/uqXmgB26Gqu2phpo6/BU7xbn
	srcSDfa1FFzjwFj2jNoUj8H4K9pDDIY/SQMKn8LS0fL+uN5PV0Dq6jhYCu0ksjFmzxJ9c5IGppk
	8sQdD4wfG9CJZ95FLLnmQ4P6mddaeYUZlMjTxn/OJBqm0HvmeDkSYVElFDRvSfU63gN5mQ1WiPl
	wLhy55ETrkm5Hf7Ki5yqyav3xfGZCLimNq8eGyZhYdn+JOWPKxa8ewyimDOC/GEf5Bm6N7zx346
	ortS6FczY8/5OC1uPJp+w6s2v1O27nkr1eT1LfdquxR1Mlwd7udWGHeU9uuMdn8mPibr/R7jJpq
	K0yq554cI84CxC8xtz0J25kCIPUmuFllOtlS2RrJnPx2NVSmuQGacrLXBimF7cWmwq2vZSczREA
	cj8kQBH74DPNAL2/F47NU8H9UpnowRDtzIuSuHKq0Da
X-Received: by 2002:a05:600c:c4aa:b0:499:d513:e507 with SMTP id 5b1f17b1804b1-49b91c17d72mr10375995e9.2.1787854687907;
        Thu, 27 Aug 2026 11:18:07 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:18:07 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 04/11] media: ov2740: Add OVTI2740 ACPI ID
Date: Thu, 27 Aug 2026 20:17:49 +0200
Message-ID: <20260827181756.2430054-5-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware may enumerate OV2740 image sensors using the OVTI2740 ACPI ID.
Add it to the existing ACPI match table.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 8f0ad5dbb245..18bb3ac9701f 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1462,6 +1462,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{ .id = "INT3474" },
+	{ .id = "OVTI2740" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
-- 
2.53.0

