Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D20357702
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 16:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776443585; cv=none; b=LGyPpZyB364nZ05PO5sfDEXEaEs4VahXqftfGpCQeDlzYj9NpnqWwjaK79kWbh+B9vwW9pjibEqBeCa7LDCC6e+hn9C8I8tEC6j+mbrnw1gHHF+nB0ICgnNTFKR5VAYFdXnc4b1FRFbDKih7DoI7Vc22+GcQTbVc6Zs8Oa4K+c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776443585; c=relaxed/simple;
	bh=+075GOoyLbd5S34H1HUCr/nG7KpOcOATM4+CPgFOnJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MkEYpUsdjM98GvTeUu5L7j3HqWhABojbREb3/8CaC6KpOpMaLgEOtzoyrrEQ/cm20xTEWTgIZCOII+hzzhUgYhPfhgXvuckVR+lQYEZcsEr4FUHDAR+z0dbwjenV9Uf8qx14nQ7snMK2/9APHF8+CJ9AaD1IzfoS/cEE7PlyL+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClKPsrUS; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClKPsrUS"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c1a170a50so1186033c88.0
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 09:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776443582; x=1777048382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yX+MCrL59z+GAPTCkuU/G/y2YHYVEKPhhbS8nU432oc=;
        b=ClKPsrUSsq+hitrgPAFzWIzs1HBzbZe8jyNtnZ6Sl2sbKeni2jWVys08nOfi+zw3AK
         iS2reSjObf6d8V8R5Hdq06k1lMvwG+F3GzJGnLIOeT95+ye/vSwmNjynZ3pqddp0g8Y9
         faiK7zlG+7WU9ovWzb+FclAkGMUswMEZwpAH1ROZq1QjGaL5nbCkfbl9rwlr5WqOe7Ir
         n753fcdjMsIvye7avBN28Uzw1EKckLXCgNkWfmAzBjAvD21vRY+gyVVXsaZVztlgLrvA
         ljqk18uxcb2BVF+U5+Mztr8wvxSaJ7X3MuNahjHAYQcVzaYZkG26IrMQzE2ybv5QrfTL
         pvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776443582; x=1777048382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yX+MCrL59z+GAPTCkuU/G/y2YHYVEKPhhbS8nU432oc=;
        b=gxWUKuXN4G8RdSRraTv5rJ1Fl13AWUjwQ0CoP4y0T+aRjy8k6FLOdwVVXjA8tMesBp
         6AzyT4Ol1I/bOqvknNasPMJYWNkimbgOlHVgf7iFo08TF4HfdDPbPhg+eBR1lQB6RdrV
         eupkq27cBr1LXDTvd6NtyCknIQSbr7zk24WBIYZER1pMLgoFTVhICNpTpvVeGTN5kDHC
         U/EcUcUwlDf7rDGFbjQ3obfiGvzMtJR9BhLxfWWtbfupZD/iT+s3KrebWgT/iW5klMLT
         B12dZ7j+rGtPxj7H0DmNu3WIIqaQcD4HuAASDnyaDMMnIFxR4L95H0x6754FAGWoMwho
         Yp+g==
X-Forwarded-Encrypted: i=1; AFNElJ9bMQDuQPcgeT0kQD29Ld9RkiCGzOKnYHBTteSsr3ZeUw1SOms87AA4yY+7gzS48JBwkZs/5Li9W9TUbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVkzjrp669pHHHZcaNrAmtPR9i/E9DPV7qpp7LKYVKcFlP144W
	xZPFCcaY5KSlYk4wBtvkyAFERIEfA/mnaSX2GbFjB2TMwMvN7MENWh5G
X-Gm-Gg: AeBDies6GY+PVlO4tDkk4c26znHzfdN4Nb1t3ZbHkXGZF5MTj8nvJ5l339rdkQI0lgO
	TCXQ57JKwVoghclP+YUmaZZyCwGTjjLSvQTBK9HCZo+choRXOTovN+68Hsgp+mDyCTh/IFPIn6v
	FwGTJch616KGjL2eC6XT4WBcpBwdCOAgcGMrKkrjIrk4Q1RYZEqKKDuN3dIWUQseMprzg9tJrmg
	g9hMyWeDXkIEXr02f8y1YiRr1z1EjTm0/6YR4VIrcrbbVabJ9g9et48FnBfn4TabehmZ7XLkQKV
	WfO7ImCQr8aa7U9vvkFQJG2YjzIOgKGpH80FKHlAOL3AO9+MTr3/47IT7sntL+g2o8bZh1E9y4P
	/yI4LDzXYDH8SrTsG41DqrL2Yhkjh+GLVBgFK4Tx+qa/8T56B9mWRM7l++E8x9J7g2rPQcPU3xB
	xXMGhb+a+02gPmlOr29+vJ7CxRfOw8EldR5CIeVNfrgYFRmZin/LisbsuE1mbC4xryM5GKhg==
X-Received: by 2002:a05:7022:1282:b0:122:33e:6d41 with SMTP id a92af1059eb24-12c73f975e0mr1490067c88.23.1776443582098;
        Fri, 17 Apr 2026 09:33:02 -0700 (PDT)
Received: from TC-LAPTOP (23-93-157-142.fiber.dynamic.sonic.net. [23.93.157.142])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c749dc86bsm3603777c88.8.2026.04.17.09.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 09:33:01 -0700 (PDT)
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
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v3 1/5] platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
Date: Fri, 17 Apr 2026 09:32:48 -0700
Message-ID: <20260417163252.15603-2-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417163252.15603-1-tchatard@gmail.com>
References: <4ef5f305-0234-4193-a190-edbfe770ea04@kernel.org>
 <20260417163252.15603-1-tchatard@gmail.com>
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
 drivers/mfd/intel-lpss-acpi.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index 63406026d..7d0964848 100644
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
@@ -52,6 +54,15 @@ static const struct intel_lpss_platform_info spt_i2c_info = {
 	.swnode = &spt_i2c_node,
 };
 
+/* Same as spt_i2c_info but with QUIRK_IGNORE_RESOURCE_CONFLICTS for Dell 5285
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
@@ -172,6 +183,16 @@ static const struct acpi_device_id intel_lpss_acpi_ids[] = {
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
@@ -182,6 +203,17 @@ static int intel_lpss_acpi_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENODEV;
 
+	/* Apply IGNORE_RESOURCE_CONFLICTS for I2C4 on Dell Latitude 5285.
+	 * The ACPI GEXP device conflicts with I2C4 (INT3446) MMIO resources
+	 * due to a BIOS bug where both use the same SB04 variable.
+	 */
+	if (data == &spt_i2c_info &&
+	    acpi_dev_hid_uid_match(ACPI_COMPANION(&pdev->dev), "INT3446", NULL) &&
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

