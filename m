Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04413DDB08
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 11:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743565; cv=none; b=huyn8MRijO9SdvGgovbRiDLyw8BywrSVqmPLV/Ptj5+jZRxioZDNpWhpi7uSV9g7pwM81Y0cjp3Dfmki1SsiRXulNaIC40nILjOuVXBVHkh36q6SK41dzF67ep5Z8cC3xazLR83yQaQ3wuUlGzpzxQmYIN0/wkhJ6APGEq46ewI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743565; c=relaxed/simple;
	bh=0gD5BmUMaYyCDEhRh9T6gAk4MMNoJ01ORH4Z2PV7oRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jrl2R4pjWXxdueyOpOhPQjWqISGTdR8p1uHREJyt9m5jXAFZtV5HVx4quvJj4bmKm1nH0Fr98VgmneHZv1Nkzjmj9hJbvhHCleDHQR4R6Cc8MrtggZtdAtIFaK4qrtP1WQfdxdeiEeXaPbAnMjJZghyZ8kMB17ugKQnsLi7USzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p2N11Sb4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p2N11Sb4"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482db627cd8so225623f8f.1
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 04:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787743560; x=1788348360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eC0YCYSe1tWmFefmlTdOkwZfGmFm+8DqJsofGqwxQ3c=;
        b=p2N11Sb4swLjFtbELmjMc0BShN/e3VlTv177TZ/5lfpjwLd8hlsj+dj5fVOV6YPknT
         FCchgHqV47bThg0swwml10JIUaXorId5lVC636hki315gbF4ZrFM4hj4jDzrimYtUdFe
         5JjJsJs2OY4OatJ/ibny76yOT9wYarhNmRne/yEk0/Q0R0TUju/3J8ZSrCb7wfW4wR7Z
         dwQlhAW/4M7z+TKyNcpYW7/O3q+I4sF7oD57jsRyoC6cV6dksG9v8oxCewEjJ7yycpTJ
         k7FkBzTCfa9LqkA10Bqz8ru38iqUIhSgoRgNP8YLygezgPfnh/yHvrPwOfey3Uomuf1G
         D7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743560; x=1788348360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eC0YCYSe1tWmFefmlTdOkwZfGmFm+8DqJsofGqwxQ3c=;
        b=rnep4/PIAMhCSwolrq1xiSrEEvW5ruHhgitpU5oAnbXa9li8Z5ynMCXpJuGoyd2Hgy
         GoVVMCsgsFgyiWEJGWoODvEeNzKeurzzZPhNKu7MwRrw3LMINjqtzfId2JrrUTdo6aW7
         HLMhXbLD56cQKvAgj4QSe3H//e4RAhtkJMuAQOIwcux9Wf7LwhaMRU8HYpNxDQZ6/41s
         cMOIqUYRmH1PE8fV5h0A/8ukJz6Dq52EwOnyKZw3KF5DYA3B7yI3b+Jj6Nbo3QdCcAFM
         tOwxfjjAexyYurh2/RLddy4exogAIW+mppcqR6VDEnSIrDieqHlYBWd1Zra0Z9VH3TBg
         itww==
X-Forwarded-Encrypted: i=1; AHgh+RpQxypIjsfqjoQfld7an/xijiVX7dMPSI8nf+oY/2yGbB7p1JSZQg8EjD/wiRUGlixR8HbiyrPOwpClBA==@vger.kernel.org
X-Gm-Message-State: AFuF++mhX2YEvok6+/lywMKbCP4mbQ/djygQR+6n4v9XrZDdVxcDvCpY
	L+25DgpnARakHNIuAQkXQBoi6KFGqiHm3Wqfltvd/fLQjcWQof7Ib+No
X-Gm-Gg: AR+sD11PB2cauUy35R5PN2micI6maml6LPMfVye5wg9zDiqq5bm8R4g0JsgnE/aaJpP
	RS/47o9uTxb9YU5c5kwvUWHYOYq8/2mLi9IQ8fs3w5rRihSG3b0K2lh/P1ztkly9O+UFXtru0u3
	VLMXCUlgFSuDm1afn5B4iF1X4MejDltDFbVV5ti7XEJvNq8kjxkntSi4tfBcuvD2ig1nX+dYu1B
	WypWOL9meVA+B8A+HZDtux1NhuIl1roc6cni12A5Upr6BUth5RrCKdUxbDOxKjLXIX3dr7Kq807
	62QGtdPVX6jlImhOwXLJnGysjQzBK3lhDmM7/6IS66J5a/akP18WWveBumsawTnHj83ikt2ONQR
	ZpD1qJ2KLJjiQb/c++Qx/Pki2FXubCJadmCQcIkYWzVa30Fe78OiD1shi6BSxgMwIWj71e9g5o6
	SsujMfZW3K5pnM1yJfrQzh0zpXoVDu9Vg0CWZLGdi4qpSjXzlTEhYB5XeTN+r0YwZxPus=
X-Received: by 2002:a05:6000:4910:b0:47f:96e6:70a with SMTP id ffacd0b85a97d-482e2628cd2mr5983064f8f.0.1787743560402;
        Wed, 26 Aug 2026 04:26:00 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:6b23:b1a3:f913:3d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f6119sm2442098f8f.34.2026.08.26.04.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:26:00 -0700 (PDT)
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
Subject: [PATCH v8 1/6] platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
Date: Wed, 26 Aug 2026 13:24:46 +0200
Message-ID: <20260826112452.13539-2-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826112452.13539-1-tchatard@gmail.com>
References: <20260826112452.13539-1-tchatard@gmail.com>
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

Match the affected machine by DMI and the affected device by ACPI ID,
carrying QUIRK_IGNORE_RESOURCE_CONFLICTS in the ACPI match data and
applying it to the per-device info in probe. This follows the quirk
organisation used by the PCI counterpart.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/mfd/intel-lpss-acpi.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index 63406026d..1ac1dcc41 100644
--- a/drivers/mfd/intel-lpss-acpi.c
+++ b/drivers/mfd/intel-lpss-acpi.c
@@ -8,7 +8,9 @@
  *          Mika Westerberg <mika.westerberg@linux.intel.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/device.h>
+#include <linux/dmi.h>
 #include <linux/gfp_types.h>
 #include <linux/ioport.h>
 #include <linux/mod_devicetable.h>
@@ -172,6 +174,27 @@ static const struct acpi_device_id intel_lpss_acpi_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, intel_lpss_acpi_ids);
 
+/*
+ * Devices that need a quirk applied only on the machines matched by
+ * intel_lpss_quirk_dmi[] below. The quirk to apply is carried in the
+ * matching entry's driver_data.
+ */
+static const struct acpi_device_id intel_lpss_acpi_quirk_ids[] = {
+	/* Dell Latitude 5285: ACPI GEXP device conflicts with I2C4 (INT3446) */
+	{ "INT3446", QUIRK_IGNORE_RESOURCE_CONFLICTS },
+	{ }
+};
+
+static const struct dmi_system_id intel_lpss_quirk_dmi[] = {
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
@@ -186,6 +209,15 @@ static int intel_lpss_acpi_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
+	/* Apply per-device quirks that are only needed on certain machines */
+	if (dmi_check_system(intel_lpss_quirk_dmi)) {
+		const struct acpi_device_id *id;
+
+		id = acpi_match_device(intel_lpss_acpi_quirk_ids, &pdev->dev);
+		if (id)
+			info->quirks |= id->driver_data;
+	}
+
 	/* No need to check mem and irq here as intel_lpss_probe() does it for us */
 	info->mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	info->irq = platform_get_irq(pdev, 0);
-- 
2.53.0

