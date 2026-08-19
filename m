Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC80F3AD53D
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 14:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787148082; cv=none; b=ef9AKmbt0WnvpRJPZR48oUKY//Otjxd17uVWmT5GQ9JQmbcT369KgB6ae0TO4HfQspSQa9GHBXYLx/NpmfCqT6Ba/8lPao8lKGMjWsTUAHs4hv4eI1bXIBj0Iwt3WG3BM/ZMQqXzi2Xm6xH3JwFq5lYq6qyICkBiUOgyEwPngzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787148082; c=relaxed/simple;
	bh=jGEqquZ2fD8KfC6B3eKEDe79Xup6NmyDIFmkXgCEm9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bvw5AOsf9PBjY3tEwjskLMYBaK+a5OJQrBjoOCBEHuSAy3orpkAM9x3AxM50ZdMvpWVnhu8y+hU7ERD+1/d98NqbOt/DqMJfqCJckv3qWZXmTXZnJ+N44hqJ4cC435YDy93hDLVRBkkxisAhzm+Gl8y+KRITh3iQAqKUcb4U2EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAWXJJRT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAWXJJRT"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-495590dde14so13053315e9.0
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 07:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787148078; x=1787752878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Njwz4GpR6Lsmc9++a5m2bWV+NAXHXBWZE5m0XlH/aas=;
        b=gAWXJJRTR2+10sOkexBeSWd5j9MwLQmFi75lqYj4IZU25t+RSQUXFgx4kgo8tSHhO6
         S8PE6io5ZjSb6ZIAw2kj4A9Krnv81f4mDc2K29zDAcHvF186n5+3DGs9e9xHGMX44bQm
         r9BhedyICLMeX6LemI7/oProm6RgJxJvSlp8USwCnrJhZWPX7/tqnlh5U/hn62LdLuO0
         KXLuwQkZIR72izGiRpZmFGxvsErVwl32la0zq1TMylLCDuOAapBzmpp9gMr2tpluw1U5
         U3Ewq5pC3rwIrFiyNtByJzH/gWAh6tCQXWR9rq+g6sBcjSTGWWYArckcANyEVb1KjVIh
         DPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787148078; x=1787752878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Njwz4GpR6Lsmc9++a5m2bWV+NAXHXBWZE5m0XlH/aas=;
        b=FJeQO9mL3a3pwgS4pqYvZpVF4NVS/GiDtcA2OTaNddGuiTaxkE9KIeta+W7vBCFxiV
         ufZ9FJyXZi+KyDqUHqxW1xpQIW4ezO/S4jRccW6AsFV6WYkxq288Z/mgZCXP1RXbKfYs
         kHNXxNK73XY9gTWxbE9I7MCsFqyIDn26i4sA8rJBHY+N/IviXwnX5tPCFJwUvcaThmX2
         +sWQ8qe/417f6rrN2mGwgwfxVlUhvgVuB6zgGfP8T1tuXKNrIy2yatbiO8Levph5qkFA
         hXH+cxBgGDpO+JWIL6/gKPpgtXPdApumBW8zqQ5rPalwWiVY6/yOfoYjw20SkN9igY6L
         JCSQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJzmW7NYp1w/PWLLiWKdgKDDEMjS6C/KkKsRtSV/ftIFgBJyOC8TYnuJLAdV808mMZ+mGt40vvaHNCDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOK3l9m6+a0KJXa1UwNEkuOAeTKnhHNWk2w34T3AwemmDjIcpj
	NnKcZ4eqzb7CK20HoduP0sSdG4kUKO5AdK6fzc8H/s4PE4dckq31J1yH
X-Gm-Gg: AR+sD11xZgxxjBy5++qECOqVR0Jba7xLtzjPBGsgJ4pDJIQRPPauxdeWKWAwMXaIq5D
	jnl1144UeTpA43r+rQti/o4ecV4RU/FiveQzr5cYwWclT5hf/hJ9fqT3t9AB6wtvn91d98ZtN3D
	2H3QZ+R8QXzT3o6Apmz7oUgtdvvJszftKnloT9ul/cwNscbNcQhv6MLiGm9hGst4J8zpeBQcG9C
	F43c015ejY7iQVYAsoNEdHSD2ZJ5h9/pkOMzNwTt3p54Po2kXihQ88LZ+R4uA7cxb/Gqunk8wlt
	RtIaRPvkI4n0dYqhSMkzXQOwJMHmJ0pQjqsUTgSaDS3EKQgIAZIiar34hZx83rDGlJ5Jpl6gB3Y
	ZJEJ9eRsignVuA5ntxsSMXyFdd5bK+vfHYMvqw9Ao8BcTwAzc1l1bSwWj1tdyOL+cCIRTuSPvC4
	zQx+ChBSkdAFXVGDaZRSUV773cEFqj120qDU+/+tO/e+AtyOqEYIE9QA8=
X-Received: by 2002:a05:600c:4e55:b0:499:a07d:a482 with SMTP id 5b1f17b1804b1-499aa1a28efmr108125755e9.10.1787148077976;
        Wed, 19 Aug 2026 07:01:17 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:d3:816e:dd0c:fe6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd728sm92751985e9.3.2026.08.19.07.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:01:17 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v7 1/5] platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
Date: Wed, 19 Aug 2026 16:01:03 +0200
Message-ID: <20260819140107.1329091-2-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819140107.1329091-1-tchatard@gmail.com>
References: <ae8U0JBdSaPgU-Zl@kekkonen.localdomain>
 <20260819140107.1329091-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell Latitude 5285 2-in-1 has a BIOS bug where the ACPI GEXP device
and the I2C4 controller (INT3446) both claim the same MMIO region via the
shared SB04 variable. This causes intel_lpss_acpi to fail binding to I2C4
with -EBUSY, preventing the front camera (OV5670) sensor from being
registered.

Add a DMI quirk that selects IGNORE_RESOURCE_CONFLICTS for INT3446 on this
machine, matching the existing pattern used by other LPSS quirks.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/mfd/intel-lpss-acpi.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index 63406026d..f08b41970 100644
--- a/drivers/mfd/intel-lpss-acpi.c
+++ b/drivers/mfd/intel-lpss-acpi.c
@@ -13,6 +13,8 @@
 #include <linux/ioport.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/acpi.h>
+#include <linux/dmi.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/platform_device.h>
@@ -52,6 +54,16 @@ static const struct intel_lpss_platform_info spt_i2c_info = {
 	.swnode = &spt_i2c_node,
 };
 
+/*
+ * Same as spt_i2c_info but with QUIRK_IGNORE_RESOURCE_CONFLICTS for Dell 5285
+ * where ACPI GEXP device conflicts with I2C4 (INT3446) MMIO resources.
+ */
+static const struct intel_lpss_platform_info spt_i2c_info_ignore_conflicts = {
+	.clk_rate = 120000000,
+	.swnode = &spt_i2c_node,
+	.quirks = QUIRK_IGNORE_RESOURCE_CONFLICTS,
+};
+
 static const struct property_entry uart_properties[] = {
 	PROPERTY_ENTRY_U32("reg-io-width", 4),
 	PROPERTY_ENTRY_U32("reg-shift", 2),
@@ -172,6 +184,16 @@ static const struct acpi_device_id intel_lpss_acpi_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, intel_lpss_acpi_ids);
 
+static const struct dmi_system_id dell5285_lpss_dmi[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
+		},
+	},
+	{ }
+};
+
 static int intel_lpss_acpi_probe(struct platform_device *pdev)
 {
 	const struct intel_lpss_platform_info *data;
@@ -182,6 +204,18 @@ static int intel_lpss_acpi_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENODEV;
 
+	/*
+	 * Apply IGNORE_RESOURCE_CONFLICTS for I2C4 on Dell Latitude 5285.
+	 * The ACPI GEXP device conflicts with I2C4 (INT3446) MMIO resources
+	 * due to a BIOS bug where both use the same SB04 variable.
+	 */
+	if (acpi_dev_hid_uid_match(ACPI_COMPANION(&pdev->dev),
+				   "INT3446", NULL) &&
+	    dmi_check_system(dell5285_lpss_dmi)) {
+		dev_info(&pdev->dev, "Dell 5285: applying IGNORE_RESOURCE_CONFLICTS for I2C4\n");
+		data = &spt_i2c_info_ignore_conflicts;
+	}
+
 	info = devm_kmemdup(&pdev->dev, data, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
-- 
2.51.0

