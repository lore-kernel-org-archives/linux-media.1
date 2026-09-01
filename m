Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D2449F13F
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 19:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289494; cv=none; b=XN9HohSbMetsCRjyqqE674mPMonJkaHvfY4hss25YeH5aXifLltE+ICnT3lhfgj2UI8nNBg/FsJ2q9yqv7EkAPlFDuNu8PtNOmfwivMRp+GqcR6I6gwHcTMV/wAcqgaOdKHu7Jg1+0pivxp5milsS81lUjZoy/y4DuJBH7W9JnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289494; c=relaxed/simple;
	bh=EXysUx/Mi2yYPLl4+sT6qBbUBxeUlVBGr4WTyCR2voY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E439UCncuGnf+ISk6p6HOGBrSX2yHOdJGhGdze5RsVx2BmPBcsF7if8pJqga8FHk0ZusvFZPsc9SWfjFxPYl1ua2o8vsl8qhZGZruJhjriUosBgh/gR4YD/OZTOf/XVkIo/WZIy0vfxJ70hmWb/Q6wySjEbVBL3THndsW0Ou7qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdKLqWs+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdKLqWs+"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso1673165e9.1
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 12:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289490; x=1788894290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ognZlCZdfi4SFVd7C7og5EeWiW2/+2tCLUN3iR2p3A=;
        b=KdKLqWs+ZVgJ3nRwGRimUfcIM2L/nzPSMgmz9eM0iu89Y9RX0gqQQDjr+mZj9ZSZeC
         jQZYd86GJEvbO/rAl9xSNk57g6H2l/zX9po+b33rwqzMWgZUp6gpqKgtcMul1LJWMkjk
         sE2nJRG5IWi278UV08TVJj0prvj3kApn7KDlBCh8eGC0JidU7XEtZeQPpYswegAF5HL8
         tBhfx6KqeakPPgHaL5Tt3L2cCDbAEl32seNHQ6MdzWgYnGeXFt03iMP6Xx6yQhYKFWpX
         2vSY0HHAo1Vmwe1HMskFuy8vj0LTL7qKatEmQt2uOfDd66yRi3W+prPudRSfVontDxzt
         vENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289490; x=1788894290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ognZlCZdfi4SFVd7C7og5EeWiW2/+2tCLUN3iR2p3A=;
        b=WmPFTDfW7kYhbM2aAz/LXzXoqYvv2+q7p4pQw08wzfU7mWFN91+d2Kb0JXxfWSsUGJ
         wxOF7hhZ46efm9eAdRaURIX7iEioiu7W3T1GQ99FLroxH/ygSSVyuSJ0jCTx4NVtKnGq
         HEefxbBQc7DJQVLFyoIU5RuqYTLykhbnyrcDvZA6P0MGOM5FgyN9GDEhGmY2mEjUCs+b
         AyK3CuEo5nVtQg36FChseRkhibUCaI4Q3aXHwTS+UgZUIGundmsEI3XAQpPLbbNtHfxa
         axCHzxfNr5y0jttdpVEoZlNfHDWehwxekXyoo/SlqMESqof1foMJb/2Drwdhja90eyGH
         lFcA==
X-Forwarded-Encrypted: i=1; AHgh+Rrao4RbRTN3fxeeHiWOAwcSMRWzHGwMWSg4cSuySt4KDGmVxeMQ93aNC5ui33znvZYorKb8jP5PfIHGEw==@vger.kernel.org
X-Gm-Message-State: AFuF++n3WXu5pkxwFWcMjDWrQZkOgB6rT+xGgZXbXrC5Paooo+XklCpk
	XzZ9E3ro39Np7sNMhpq2UI9wwY0UXgRew/hoUW8EWDNSGAPU6I3ojbBZ
X-Gm-Gg: AR+sD10Ucqrs1WfBTK8aozqSUNn1261hFndoBioBEaf2R06/I6IVVeABryAgNlThiZa
	38PqG9yBKuH8s6x1bLNUypiyB7Ldsx8f86es3J4ggz7CgjbvNJIaj7UAlMAmuKy4i4zQv8A1H4Y
	+St+nTOx25TU/DfEhV3KvbdlaakNo05sZwOZ6P7KyPrItS+OnoyI1UtzeKzwMZs2ev+4qHKFtQJ
	IZ2dzyxPlLB4QNGcEu/dX9ZtL0yveONogB+v55CFfutZ9w7IRWpYZgpN8Eti69J4ejVuE4JqibX
	ShwupXUD+/fhmRVDsnu5v4GSADxONynB2w31wPJk9tna81xkg5ohsgbXr2VOQpVP3Ff/mFz8IQQ
	uBPSbP9v+SCamjcfUUQg8VcmyN6Ti3Q+GQOEyl/UEu/x8Wq+D+mtKaPYOIKTdkkx+a8Jqseotmk
	h7SmazEAM5qJnt8heETC1ssghZZ8jCj271TJGEmEpYUxj/LfW3elOP/lSjmrNmIXBwtNcjybU+R
	F6M8v3Y7ak+EOn+5j7LU7WSUt42ucwtaWtMpTbG1cI=
X-Received: by 2002:a05:600c:19ca:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-49ccee0f3cdmr367033135e9.16.1788289490263;
        Tue, 01 Sep 2026 12:04:50 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:49 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 05/16] media: ov8858: Add INT3477 ACPI ID
Date: Tue,  1 Sep 2026 21:04:27 +0200
Message-ID: <1c2ae26f61ce9bd9e6689c58df7b17e9980fdcf3.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware may use INT3477 as the ACPI hardware ID for an OV8858 image
sensor. Add an ACPI match table for that ID.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 8d697b8d11c6..76769da94f80 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2017 Intel Corporation.
  */
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -2087,6 +2088,12 @@ static void ov8858_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(&client->dev);
 }
 
+static const struct acpi_device_id ov8858_acpi_match[] = {
+	{ .id = "INT3477" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_match);
+
 static const struct of_device_id ov8858_of_match[] = {
 	{ .compatible = "ovti,ov8858" },
 	{ /* sentinel */ },
@@ -2097,6 +2104,7 @@ static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_match),
 		.of_match_table = ov8858_of_match,
 	},
 	.probe		= ov8858_probe,
-- 
2.53.0

