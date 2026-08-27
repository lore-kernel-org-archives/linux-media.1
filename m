Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D411F4C77CB
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 18:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854689; cv=none; b=Rex7Vwei3w0D0PTFWPRDxbDJh9BtodmW6KdjvF97t6tt2rm96giVx8DLC6uDiv8fC9S82T/T/rqRJ/RYjn0PWpjQ0/g3PxNmCrJdC5wX8031xxoTfkQckgULUwCWImdH+qB4eX389mtDYntkJOx9aUzq1IZrC+N79LM4T07lEek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854689; c=relaxed/simple;
	bh=i4XP/y1OtMKTpjmyldq1NfyuUnIY9DtWEpicagMug+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdWyGesMkRUrTmIoga+ecfXacitVmmO7PvGjVGzs44tFDQA0MjpnTJOmpGwzpxUmKFMsuRJMndmco7eMySDw33IcPSf2bkNKeJm+1Wi9edAdfNyGqC4n7Evaoc3sQa3F4tTt8O+lWbmhEOogMX8Vk4jf+8Wei2HAI8qCwYkMju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAmd6me6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAmd6me6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-499840a2575so237575e9.3
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 11:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854686; x=1788459486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VEsNUYGlKy1ooscwN6zWUOqqar7TDxOoNVnM+VqT2yI=;
        b=cAmd6me6u+7OzDIBk/v2EYHMAcc9uKzlCaYiCqz7UywCNWXhBd/hDECXW7v9kxiEK+
         HGAyHZFIDqOUUhvOybUuqD7CKpwqm4qMnNej3ErpV7Xr4wabMXPLfCflK8WeZoHGEao6
         lkq7Ku7TAaljcUoQuJktrMbhkKI6KkNjnZ5K9udHMRMWCbAdoqHLnC1j4KZF2sIEtWae
         44rwszqOdsaiHns75FzbXCWAbpK7eOPpCwp9f9vhs35XkeW014Joyig7RA+vqU+9ZXlZ
         XnTNyoQ0D9tGddxArYb5alXC/cNGbmaiOzdBjbmIm3Le1AQK1Mti48lwqBLzFrryy/Vw
         K9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854686; x=1788459486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VEsNUYGlKy1ooscwN6zWUOqqar7TDxOoNVnM+VqT2yI=;
        b=GqbKfsVSoCZoiN71QR2A5DoMZHR2892svucSjralvtjJI4tFwo5NMFww6xAfn7wVdJ
         E25/zzhrM/gH2gllthH2KCLW9kYp8uP5GDU/Do0kFyKxKaCfGnwM/FJ0c4fQ9c4NMEmZ
         Tre0H7ZrxoiQZtbP0Bb6O56UcVAyOo95je3f004mTrE52fJG/mLEZ/YjKPGdKto+l9bj
         cqNhkntBN9sVXpLo2dRScNSYNe6JXOUmoHogUIgfZVhbug69LzSJhAX50sNCCZ+ED3+Z
         4vbQA5qqocw1jJxfyWRdnhkKedieyMPEJ4iyoBCs2ZgCbwkjegcDHAQ7VNr+0nfrO68T
         EgVQ==
X-Gm-Message-State: AFuF++lqpHp+Gwds2ji7lRpopLCSAWKkLLJs4qv7NbY4n1tKBSX7eQTM
	Q3kxgrWPM0KbkH6FWrrkeymI8+UlZ/OyDWLB+1F+r/WS5ZOIwAevI9icIxAaaCDJ
X-Gm-Gg: AR+sD12VIEoJjy5wJVOkwxViR7oXqie7VweMXeZ/I3WYNKY8LaZR4Q8UfXlOrRGYgli
	/ZkCHBCjifSvYXioEh85tNQ5EhSvtZw3My7HOXxuriEYC1Yy9ihQqg+U8lhAoPGoszQghZMUPCO
	5ZmkHSgQX2xbmDe2fz3c395lCRe+u4z7Zymj6aYHcKn+DZnAh+7bQ6jNsWmmq+0GmugJWe+j2Cl
	BXTaNDuEOSyl+9CLtbH4XDi9XBy5EZrcbGQ0i3hkHTzeYCsBGmWEBWThg2yatMvRRb1yc7/Oln7
	2eTPc+6UfDn2kaPc9EQ7ylRpoCfIAbXcmbesxloJ5f5LEkOkYkW+sO9GeVefhytvJ7vXdmJNtp7
	HUCq7J9d9guorrDf5Qmx6iXL0l3UsMgbf2dXf7yyeFc4vWfCbFIIWrxFiAyOspDHaQnslZvNVIG
	NSOVEX/1wyfsrj2U4asD3EmSFw5oESylgR60QG5ircUOZOqJ76PD5A9HyMXy7CBjITVrv2pZngB
	VnEKS1RsWP31YWEgJ/Y5IPAgtDJ/KkkobyqEqYX+7PW
X-Received: by 2002:a05:600c:3107:b0:49b:4dc0:9a06 with SMTP id 5b1f17b1804b1-49b91c50f5emr10361015e9.13.1787854686006;
        Thu, 27 Aug 2026 11:18:06 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:18:05 -0700 (PDT)
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
Subject: [PATCH v2 03/11] media: ov2740: Use C99 initializers for ACPI IDs
Date: Thu, 27 Aug 2026 20:17:48 +0200
Message-ID: <20260827181756.2430054-4-mauriziocasciano7@gmail.com>
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

Use designated initializers and the standard empty sentinel style
before adding firmware IDs.

Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 39003c1632ad..8f0ad5dbb245 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1461,10 +1461,9 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 				 NULL);
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
-	{"INT3474"},
-	{}
+	{ .id = "INT3474" },
+	{ }
 };
-
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
 
 static struct i2c_driver ov2740_i2c_driver = {
-- 
2.53.0

