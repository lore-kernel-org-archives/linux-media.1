Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F9D36E48C
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 18:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199275; cv=none; b=HQzmLgGv4OmawVI+fz8b35pp91m9DN1rHQ7DSIICE37AQHmCSMBCnyId5u4KdDSSZvbSZeUGT24k5oA0Z1F6uYRKe8MwI36ioGbIxv9VV5+1f4hvXa5Tpsv+2fCN2zpJ0BphufsMBcC9Khfuxs3CCgt10pqANcTEQbh0MXG5Asg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199275; c=relaxed/simple;
	bh=dMHhEeZzc+g0IX6lqLqY4IrziqVxJJRg2znt5XQ0Rfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j9CBc1tF22BJb7zFfrsGP+zly/NNAZbAKNsKleI10U3Krl0uo1O/f5DLWWkKrkSIqlaql4WzUlcOb1LnPpKNL0tSaZcRdqmO1eZVgK08U3HHm8nxcJmzWKYqK9S6vJE+e8RPg11d4EOAVr10Sc0DQkONDaL1Yrppsq1H71NEoU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hz1bYt9q; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hz1bYt9q"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so19086f8f.1
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 11:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199271; x=1788804071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XzF2GiQLWqxybVzvZE6EZJoLEDzHgosCVIqT/75toU=;
        b=Hz1bYt9qegPJNuqeM3uF3vn4xBuE+VJNIQ6vhJoJwi4PMPuXG2JDwX5xXzK3Y0V+A9
         67hTWWCLTfCcWE8IZN4gj8lMpXxXTgEz9wprw7tjkeld3l3nl5XsDYk5JypUsDC742J3
         Q8lzg7dV4i+ayAuywwaRLHNGt59nHwimNcTdIWsjG+a5ebcBireSyvLsmhV+I50M6J2/
         S367YpFv2V+tktMII5Oy335hcFZSKSPF5s7QV3AReW3W/ql/Rti+CraV+tBT3pARXq9t
         5wwNglH2h4i7n9EA5sP3mhEPgwCKoK+c5VIbBmExPpD2ZV4mxWRWi2CvTT2jzrXahf8O
         iSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199271; x=1788804071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7XzF2GiQLWqxybVzvZE6EZJoLEDzHgosCVIqT/75toU=;
        b=Ns2JDVDQ2WCmu29ncnHWAlw8Cp4Yd1KpOiPAG26X3sjYSLmFSOAttnzU2V0UngTihf
         HyNp0ZA3zFa02ITzQjsaCOFLGymhHWe2sV+9rwEDzzx69WYTexJOP1MT6dewWWSr6C/7
         FbRnIsG+si77NJnxvYDLnPH3B2yrW26H0twSfTNJiCffurt6LwcSfcq16XjVkzc39fEw
         LlQ1Bt0fzhxaQc1Cgkd+RHuARMd9KVOW+j5zoOEgVzL8LqhS4B1NYXLAOj5p8AfdJA91
         uQY97zmVTfmEEpe5NUBY2CqjY9lmy2WQcm1BrMqoTGZ/Gap4tAW5Wuo1GVngHUz9DZI5
         dvEA==
X-Gm-Message-State: AFuF++lG6e43onvpyC9teDzSB9bXt7jeuDDw9NC2AY/IX4aclBANYkla
	mtRk237rV+Jv3TSrXK+OkdY00fWvEbJyRJauIk2qC+xA96BJYhflot1kuHB9yYfYRYk=
X-Gm-Gg: AR+sD13sf9VkQdP/8gPWljWlIbLubz4rDQW9F4falgfZjAqtiwZvN19JqOY12vaIqeX
	eCtCdfeJBm8G4SF35FtNzYq9CvZtUZd1wxni6XXl2AMcBoaAV73Gy1m5aV+nxztZ4lkLei5y/Qy
	oqIeZ3vPyNp0MjlqnCyebJC7cy5Gbz9qtMYUS57VnF1+WCXSd9mp0dovcIH1w6XoKKms5tuODYG
	SLumllBRB7gtxNpLPUlOl34ay1ZhvVJL5KiAlUQF49IvixFeiLGZtOhhKV1MaVJt51BRiAEcB8m
	I5YfoBJHBxK14BmyhNBreMEEc5278YwKLiZ9CetZbkNFZjUa1cqSxU+OoT46h5uAaz04yAq6mZl
	HJXPlQ+PRgykoV/yb8Jx0ngirUjvDNAapz3x5vxN1Or9ATHRUf/s9oev3I22Yj1+7znotV0FrXr
	Zfk7bbgWESl4IezVrojlWSVh+YDpxfKiUOnsVUgfr6WykgV30azNhOipc2SogpsI1ww5l+COk+t
	WlMRNg9VM4am/OncMXe5m3jXDXwOhhQImCxHEWLFjif/nKYVlMhPg==
X-Received: by 2002:a05:600c:46ca:b0:49c:db20:da13 with SMTP id 5b1f17b1804b1-49cdb20dd1bmr85500855e9.5.1788199271314;
        Mon, 31 Aug 2026 11:01:11 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:10 -0700 (PDT)
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
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 03/16] media: ov2740: Use C99 initializers for ACPI IDs
Date: Mon, 31 Aug 2026 20:00:48 +0200
Message-ID: <20260831180101.3109854-4-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use designated initializers and the standard empty sentinel style
before adding firmware IDs.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: LLM sparse
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
With Best Regards,
Maurizio Casciano

