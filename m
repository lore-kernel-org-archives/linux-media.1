Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF35C3F9F20
	for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786777328; cv=none; b=PVzxyuy0jNFNYZ/m02wmhoanwed7LLwvGGTcwZ6f6JYaHQVtruUWJDZKze/Am0pTUj4YEyASmAAJCtpJ6YYsPe0MkTZ6zXS7ctxyWKP1iloexuUsrC0V5kOHx+mFOecLj5eVGsRnzGYewJE1Kb0AnH8sU1J6L+vOCCY3/Ly1wLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786777328; c=relaxed/simple;
	bh=iPualk3ExWlEnxN7ZTR58LOodbMlHOM9QkLFiZ0s2k0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y7pIy3p9oC+OZcawkHyAEGfKIeUKNGkuoBeQyun5Yk9Kzt9gRE8twuk4i659HWkwhAhfdZSRt3GD7RDW2+OTPCJMyaJdvaCrqSkbnxK7xUNSDB+3hmN2OVVjbltHUUEe9UVsdF9CAPmtCr06ZEfUQrkN1if2nQwAohkKUGlPM4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIrNprBn; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIrNprBn"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-383cb94f742so2079501a91.3
        for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 00:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786777322; x=1787382122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MyxSssjLe/0OOnYg8ql2xBDGIwb07hj7I4YlvifUNpo=;
        b=hIrNprBncskuukl2ibycdKcUkYxI8Ss5vHhs91p8bqU3Jnf9JHVbzBFdhz2N3uojJ4
         gjKISuGmdjoP21j02jn7MoKA5NQZ20wTyg8WEYK6mB8tRh3BFdVpMkfW151NjoFRYEtk
         tb85DitMrl567IfeOVSI2+hjb0F+guyaBHbUxTx/qOWCvOl0RIwD2y7q2nAISks7uKjx
         B1/xVfeVW5vjPPKot/kN3vjl5nlCsDeA4vOIcCNij4qLUh0Cwed69vHfpnKsD9rAhWHl
         hyT7QcDes58Eev/7M5SNBOqDBwIIfyiqajoaLbwrb+FlyNvf0cUkuCeF+KjDoEpYZgKH
         dULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786777322; x=1787382122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MyxSssjLe/0OOnYg8ql2xBDGIwb07hj7I4YlvifUNpo=;
        b=AX7by6Dn7+JKu0nTlegJZPK1H6bTN3InwBRcVSfpQoPFoyT6TjKg0cXSARDjiXYF+m
         PwxHEK/b3hXL6Z/SmyzK37rgBMpoLA8ntNWdzs8lj8VvH4ZrqQLp0oCglkQ1bOHm0O89
         xCFEGJFa/88Ol/UeOFISdZwALyj0eeWEprFXvRCX5lc95SWenuRWqv8ElowxnYWl2U0J
         ZCgazHbcmb5WxwlwpoBVpU94Lvu3xaOLJIyl7+gX/9Z1oK4Rqb7OX5Y178EkPR2Msdch
         5iTmo2J7Je09OiuGs9OLWXOm+qyt0AK/A7N1SBsJvj7xHk/5hntp5pYLcGHaMGbnC0YF
         tXow==
X-Forwarded-Encrypted: i=1; AHgh+RpKYSYEtDm/rvuAm8jBhmQjHyvjt3OHd9O/uS18uk1EI7CM55wN6NW5RIB/W/AlBVkczjQzLZHJkZx/iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRTKrIoRR7A1C9U7Iqh1sDJ6g1/YaFTObkKsc5T6USKD+18upu
	UyD+m2PCtVi/OO5fx8YdYoNAYFaebeTTMlye8pspEVsoIoE6bjHCj5L2
X-Gm-Gg: AR+sD13obCaxQp66KKtY+mAcbios7T/tbh534N9TvYGy6wdbrMaPLRSMcvORcZJ16mG
	GutaIDSRzjeAgUV4Q6hXY3CTEzLP4WL0Sy13QkNUfopiCyPcVAZ5TWW1H0UIFKddNIXWm0wEAko
	5XIp/ctPBTLVK74p8P3UYkltyOFZJo+oHm4qa7cCOMnatPaZegDasI9MVVBJBL2DigKDnuJO89U
	ofIxqxPzdnyJqPZPV3yZvkX3UcFQJebe6cszDZTanoGSU8V0J+F8rD/IrIRGEW3JWFbvFxMoaVs
	K591+ndyDs/pjwf7DLfDoLnY7Y/9XmJCm9wO/2wnc2j3dnPZS1D1S1W02IlqE1rdIIHdWo7yAvH
	IJ6xvJN0Fpy/foNm48dQKd0TzHnAbhgirq5GFVTfLv/byfIByZlJoYJ6N+L2i+m6EOjMSgWRCfX
	GgoPlXLDPGflW8yEZfCqQ1DA7DU6wA9Qo/Ko6qQyNJc8s81gAh26PRgJOQ1w3UYQ==
X-Received: by 2002:a17:90b:5803:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-3933cb3b889mr13039740a91.8.1786777322154;
        Sat, 15 Aug 2026 00:02:02 -0700 (PDT)
Received: from localhost ([103.210.95.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea7fe465sm12363343eec.25.2026.08.15.00.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 00:02:01 -0700 (PDT)
From: Raushan Kumar <mitramaurya80@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Raushan Kumar <mitramaurya80@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove unnecessary return in gdc_reg_store()
Date: Sat, 15 Aug 2026 12:31:05 +0530
Message-ID: <20260815070105.124813-1-mitramaurya80@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the return statement at the end of the void function
gdc_reg_store(), as it's not needed since the function returns
implicitly, as flagged by checkpatch.pl.

Signed-off-by: Raushan Kumar <mitramaurya80@gmail.com>
---
 drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
index b31e3809c0e4..c60f53514553 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
@@ -96,5 +96,4 @@ static inline void gdc_reg_store(
     const hrt_data		value)
 {
 	ia_css_device_store_uint32(GDC_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
 }
-- 
2.55.0

