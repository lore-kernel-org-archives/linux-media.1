Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC049345CCA
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 11:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743569; cv=none; b=HFR7vlx6aM6eg5rdSd9CdK1UJ+uhI2vvsw1f3aC9QWH2EQdl7vgTTmkYWU2youWZweGuFfi/lh169R1udnxLEEzF8i6unqtLPfPzD93EtE/SETM1GQyvnubxcItVGqQWGOiNM7C1HRUrA7tDkJCzniEuCtDj2LLAiPmUeMfLOCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743569; c=relaxed/simple;
	bh=e98JGv97hJQA0VHTYBoMj1Dbzzqawgx4R87IWlZMFfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mh5xgEyCsg6mBorrdRTMPgs/J6yYe9glJTFaI8wHjsijGhzEyWM3Qb25YkqJAw/Ms+PBW72AU/jBU8xkeOKtY7ViUWy8UuPktaCWTVsgaxGFs9NHriCDzKf1d5EUgvnLEnIA8x5kVimuC7voDhIrYTuwgrEyOc5ioeAaQOwfMUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmEaZ0oZ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmEaZ0oZ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso5211505e9.0
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 04:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787743565; x=1788348365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CA1mPPqesuiE+rbBwua7+a+a7Hh2j1P5rIPyCaph8fg=;
        b=WmEaZ0oZt4P6DXy748YZw2UyXBIPnEc6mbb/xwglkaZtNjcnh6CZcVsZ1FEyFZwNHS
         l9o87CImiGZGRMuLW4WS0aIqBCOb2ZsaE8SJYfTsRqfssJMzW4FfUcfO9FXkrGdCDRN6
         mha9SPV5I7cD6XqWeER9i66TUF/I4walYXJCwwj7qNalSj0zSa1jsD0TvYLNhz4z5rQn
         aYXw10TEW+TsGJdts7mPVJwJy91tyHskvTfzFzK2biMooC6zeBrz188zdtl8ci4FrUyF
         yWaeozGSYIZzE/6qUhTcsNV4berIWQpyM6tIfPCPtBd6q+5T4aARjpHuj4ojoCUnxLYE
         +Tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743565; x=1788348365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CA1mPPqesuiE+rbBwua7+a+a7Hh2j1P5rIPyCaph8fg=;
        b=oTHz0zkLVwkMsyrOV4+2y+CmB4BVSqHLUe+nOmC9G2REB7agM4EQlTHQs6mNJqIP7T
         XuDslmsVzuAtxeD3aAjokNoixlxs/BmvsDwMGdbHVMEQcPVTBzC+E2gj3b/UvE84UZ6q
         UoMDTrHMVup3bGIDcXbU4b/esCdeuFdTdFjd630Iiet46iBUtL5RW5XiskzlFFiiyc0q
         tDbxhBLFBLQJc0pRFN3dErLeYreIz6QFIs2D3uso/8XyvI0VnVGHb5X9PbliA3O4i0WB
         BqubpUihBn9fAmQ/MfciHq1cijwFuvMvTLRcxk+FR2YYL7t/6EPTX1Ja7JZjWR474Oip
         ZiOw==
X-Forwarded-Encrypted: i=1; AHgh+RqFVzhyt96B2wPRZ+yTXRY8FYDJ6ZYKSsJFSfUiW7TdiimDLmtcPgsxziRBdz5Bq2lY5gmZ4MpecWBKQw==@vger.kernel.org
X-Gm-Message-State: AFuF++nUmtdguBUnPuluFZ/fUvmIADuKBLS17CzoTG8IMvt5Dvn6ha3s
	CPuVdHA5mNTAYVGnlpcnsh/3niwAxt8CvK5sTJlnUe7E2r4CQlum/3co
X-Gm-Gg: AR+sD12FT2o366Jx6ab3wqfJ8TzRG3HsN32D13MSREYw3qGWmXXcGgm/pFDdfSxZhzd
	E+1m1xXWs6mITlYh+tnlh3OSU+lt5qYIoBNl3BSS8PgkX+7buip9olF13mrlP9HyrK3BnCYkCJ3
	duQ+zAH9BNwDjjbvHnmwwWvej/FoLmgALFm/NeAROO2dY56DmZX9PyDcVo9umIzU7Of/nZMXz+B
	PfVIFWZsLIk/sP6YzbiJpeHrdDBW8WvbCSlbFzq8S6KDkz3KwIKILXW5moG5EGw7jJk/4U4eKeY
	Qtu6ba9MTMcB2xRxM66Ttgq6jjuvBUn636izOigPvUK+7vGxB3EJ6n8BRKfezcY5z6XbyqGaMSe
	6i/+5+80Yz5DpWMWwJAirZtf5wUwGF4llZ73qyuUyHUxNdltDQJFaWTqbbkpjKeBCqofnJSI0WM
	nDadel5xfklZnD+VjixiJXhzMZgqiFOGzyvTSXlFO560+UDGoR5W5h+xZu
X-Received: by 2002:a05:600c:19c9:b0:499:5a50:b022 with SMTP id 5b1f17b1804b1-499dc6f5916mr49112805e9.3.1787743564458;
        Wed, 26 Aug 2026 04:26:04 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:6b23:b1a3:f913:3d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f6119sm2442098f8f.34.2026.08.26.04.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:26:04 -0700 (PDT)
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
Subject: [PATCH v8 3/6] platform/x86: int3472: tps68470: fix clock consumer registration for Dell Latitude 5285
Date: Wed, 26 Aug 2026 13:24:48 +0200
Message-ID: <20260826112452.13539-4-tchatard@gmail.com>
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

The BIOS on the Dell Latitude 5285 leaves GNVS field C0TP at zero.
With C0TP=0 the ACPI _DEP method on INT3479 (OV5670, front camera)
resolves to PCI0 instead of the INT3472 (TPS68470 PMIC) device.

Because for_each_acpi_consumer_dev() walks the _DEP reverse-mapping,
INT3479 is invisible to it: the clock consumer lookup entry for the
front camera is never registered with the tps68470-clk driver, and the
OV5670 sensor driver cannot acquire its MCLK.

Add optional static clock consumer fields to the board data so probe can
register the consumers directly, bypassing the broken _DEP traversal.
Platforms that do not set these fields keep using the existing ACPI
traversal path unchanged.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 104 ++++++++++--------
 drivers/platform/x86/intel/int3472/tps68470.h |  10 ++
 2 files changed, 70 insertions(+), 44 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index 828ae208e..9b98c5a15 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -145,20 +145,17 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
 	const struct int3472_tps68470_board_data *board_data;
 	struct tps68470_clk_platform_data *clk_pdata;
+	struct gpiod_lookup_table * const *tables;
 	struct mfd_cell *cells;
 	struct regmap *regmap;
 	int n_consumers;
 	int device_type;
-	int ret;
 	unsigned int i;
+	int ret;
 
 	if (!adev)
 		return -ENODEV;
 
-	n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
-	if (n_consumers < 0)
-		return n_consumers;
-
 	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
 	if (IS_ERR(regmap)) {
 		dev_err(&client->dev, "Failed to create regmap: %ld\n", PTR_ERR(regmap));
@@ -176,52 +173,71 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	device_type = skl_int3472_tps68470_calc_type(adev);
 	switch (device_type) {
 	case DESIGNED_FOR_WINDOWS:
-		board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
-		if (!board_data)
-			return dev_err_probe(&client->dev, -ENODEV, "No board-data found for this model\n");
-
-		cells = kzalloc_objs(*cells, TPS68470_WIN_MFD_CELL_COUNT);
-		if (!cells)
-			return -ENOMEM;
-
-		/*
-		 * The order of the cells matters here! The clk must be first
-		 * because the regulator depends on it. The gpios must be last,
-		 * acpi_gpiochip_add() calls acpi_dev_clear_dependencies() and
-		 * the clk + regulators must be ready when this happens.
-		 */
-		cells[0].name = "tps68470-clk";
-		cells[0].platform_data = clk_pdata;
-		cells[0].pdata_size = struct_size(clk_pdata, consumers, n_consumers);
-		cells[1].name = "tps68470-regulator";
-		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
-		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
-		cells[2].name = "tps68470-gpio";
-
-		for (i = 0; i < board_data->n_gpiod_lookups; i++)
-			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
-
-		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
-					   cells, TPS68470_WIN_MFD_CELL_COUNT,
-					   NULL, 0, NULL);
-		kfree(cells);
-
-		if (ret) {
-			for (i = 0; i < board_data->n_gpiod_lookups; i++)
-				gpiod_remove_lookup_table(board_data->tps68470_gpio_lookup_tables[i]);
-		}
-
 		break;
 	case DESIGNED_FOR_CHROMEOS:
-		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
-					   tps68470_cros, ARRAY_SIZE(tps68470_cros),
-					   NULL, 0, NULL);
-		break;
+		return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
+					    tps68470_cros,
+					    ARRAY_SIZE(tps68470_cros),
+					    NULL, 0, NULL);
 	default:
 		dev_err(&client->dev, "Failed to add MFD devices\n");
 		return device_type;
 	}
 
+	board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
+	if (!board_data)
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "No board-data found for this model\n");
+
+	if (board_data->n_clk_consumers) {
+		clk_pdata = devm_kzalloc(&client->dev,
+					 struct_size(clk_pdata, consumers,
+						     board_data->n_clk_consumers),
+					 GFP_KERNEL);
+		if (!clk_pdata)
+			return -ENOMEM;
+		clk_pdata->n_consumers = board_data->n_clk_consumers;
+		for (i = 0; i < board_data->n_clk_consumers; i++)
+			clk_pdata->consumers[i] = board_data->clk_consumers[i];
+		n_consumers = board_data->n_clk_consumers;
+	} else {
+		n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
+		if (n_consumers < 0)
+			return n_consumers;
+	}
+
+	cells = kzalloc_objs(*cells, TPS68470_WIN_MFD_CELL_COUNT);
+	if (!cells)
+		return -ENOMEM;
+
+	/*
+	 * The order of the cells matters here! The clk must be first
+	 * because the regulator depends on it. The gpios must be last,
+	 * acpi_gpiochip_add() calls acpi_dev_clear_dependencies() and
+	 * the clk + regulators must be ready when this happens.
+	 */
+	cells[0].name = "tps68470-clk";
+	cells[0].platform_data = clk_pdata;
+	cells[0].pdata_size = struct_size(clk_pdata, consumers, n_consumers);
+	cells[1].name = "tps68470-regulator";
+	cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
+	cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
+	cells[2].name = "tps68470-gpio";
+
+	tables = board_data->tps68470_gpio_lookup_tables;
+	for (i = 0; i < board_data->n_gpiod_lookups; i++)
+		gpiod_add_lookup_table(tables[i]);
+
+	ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
+				   cells, TPS68470_WIN_MFD_CELL_COUNT,
+				   NULL, 0, NULL);
+	kfree(cells);
+
+	if (ret) {
+		for (i = 0; i < board_data->n_gpiod_lookups; i++)
+			gpiod_remove_lookup_table(tables[i]);
+	}
+
 	/*
 	 * No acpi_dev_clear_dependencies() here, since the acpi_gpiochip_add()
 	 * for the GPIO cell already does this.
diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
index 35915e701..1d3d67459 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.h
+++ b/drivers/platform/x86/intel/int3472/tps68470.h
@@ -12,11 +12,21 @@
 #define _INTEL_SKL_INT3472_TPS68470_H
 
 struct gpiod_lookup_table;
+struct tps68470_clk_consumer;
 struct tps68470_regulator_platform_data;
 
 struct int3472_tps68470_board_data {
 	const char *dev_name;
 	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
+	/*
+	 * Static clock consumers.  When n_clk_consumers is non-zero these
+	 * are used in place of for_each_acpi_consumer_dev() to build the
+	 * tps68470-clk platform data.  Needed on platforms where a sensor's
+	 * ACPI _DEP does not list the INT3472 device, causing that sensor
+	 * to be missed by the ACPI dependency traversal.
+	 */
+	unsigned int n_clk_consumers;
+	const struct tps68470_clk_consumer *clk_consumers;
 	unsigned int n_gpiod_lookups;
 	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
 };
-- 
2.53.0

