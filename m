Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E613E025E
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 23:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872672; cv=none; b=W/27ql5wUaTZcI8FB2giGwkspQGtR3ECDQre6krhlAPiBHGKb2txa/M01NT1oIlAbhwJQSdTLgXOjUskR13DepeEZFWWgYiLXj47xMYl+M3Ecfq5zWEr7xZM1IhOW08EFW9rS3E6kiPPn8Np67sHDemYKySrOa8Ei/8dYNFf88w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872672; c=relaxed/simple;
	bh=8sgBglwA/JZD3s5QLDFR6gbGeXrL/rfq/BC01OXwQ6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HZHxSpd9ZG/Z6nvp4VhqSlSWQGBQUFVjnaXLGxnUQ9nGSFCbLE3Kk5pO9P8KkHn9/Yd4IWMvbpVLzRhu6J5PiF6GIDgVr5ClR9XXZkFDxaefrWPG3V14MJ6kGd42reiQRsF1ZSwWd3Gv5xr8A6A/t6URk3oILwPuTscRklyEV5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7X4x8TM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7X4x8TM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso2126735e9.0
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 16:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872668; x=1788477468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GebuOBWxdSlma292Cd7c/kTR3183p1RfnNGHX7vtHbs=;
        b=O7X4x8TM6HWnb9gzHFAoPPeaxpdN0y1tdHKNVbhGDtyE78guk5fRzXR+vImY72hmou
         zSrX/mG4R3TSje0OAw4mzWesi645eE+KpZN96sSm3f9dluTpXdJhGVCTjZpSOYGavFK9
         x3X830oPgv3/FHCquG+ecD18699CHEWReT1JQ3uKTE089cecvqWfkCqB/0zlsAjKYGzz
         sUAj1U35jdm5UNUdu7nU5ZNo+jKLvvjLABZvdsydas6X/j+6We/ChadxAvo0OpbpgCaC
         Wr4CllSzM2bAGx5S94c4Es7Vc/4Jo60uhDxJB3DJD9hW2vQyEllXEyMgJ4M3qWYbt7xg
         9tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872668; x=1788477468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GebuOBWxdSlma292Cd7c/kTR3183p1RfnNGHX7vtHbs=;
        b=YCjWxKCKo6+dAJ4enUz5A12p4hhn561FNW+RQFY1SUAOwaq3ppXskmEOJGYFWXdcF3
         ESpVOFnAl/N93fuUCz90V4QZBSjvHODPkgG07IRkaw/a5L4Q9iEK9hByBQ7Q+79BNcWa
         fM6VFxDqsoU2I3n9tj4BQNjNsnQEoRuEmmfP+fQhPplH1vtFBm0z5G2vQBD3YgDA736L
         xf4LE4JcGR8Dyd6iQcwCt/9zkGMtwqyPwAKgh/4Q/M7x4+mQ+Zy/Xvon8jdsHo1CCCIr
         DPngYXYsisfh135r6sGgtdppt9s4j8MJb69AHLa2wPuReThd+K9iS4aTa45uvQYjUdNh
         u8pw==
X-Gm-Message-State: AFuF++kypSK4w7DTuMX4/9N21BdGPZnTa/5oEoXPaPP8VE1pSqsDFaEZ
	Wrf/eeVdKyEekUc0d7sPrFHpkYKZQbXmXswXBooTNmM66vp4UkyTcks15T//qXoY
X-Gm-Gg: AR+sD11KxmpPMnx8sk0CFM+3KXrjSJo2JECCmsjBTXynnyo2rlTDQNpU8aX5LykEnoK
	oYRtDB6HqQHoXCoviG5EI8szH+2A6BYTu564DWi3WVdOkB5SW3hAcpYsj4QVDYFc7iV4wwp2Ca1
	Au6LBFahFu1Icy4GbhicAQw22Nl5geCUrCk3jdpAjSgzwc4UYgdaS3S6NpULA/N0HlnqSmAgMbC
	qJsaCtqZ9OIqMPrPNJz7mBIMF9EKKb3OStzKsBEld7STVMegnUr9ZOyy/MY+BLgdqgRsP1rIZ9Z
	YvBPqO08SaHNba8SI6/+7AnlJ1Efi//jj4F62IuLk9DxQhE9YG/BQQMSi71H7RCVmq/w2DXRlhC
	gJoIwiEyqZK6G0n0zrh+LfvlXu0JgZ42hMOTwuyC9Icd1GtP2zerAX83CcEi/NSvvtaUfx/JRI7
	MEzm1nzfGRXAthTWvpGXBUJb2kFarkv/pmbuafw3OBbYHCrTc9Gzpt4uls+BS2EFiNNX8sdsWSD
	lwREAOUmlmq1FH+JSrtM6NsLsiOWUYiA+wyvaYZN4sv
X-Received: by 2002:a05:600c:4453:b0:499:8777:ccba with SMTP id 5b1f17b1804b1-49b91c486abmr31698845e9.12.1787872668079;
        Thu, 27 Aug 2026 16:17:48 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm7157765e9.2.2026.08.27.16.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:17:47 -0700 (PDT)
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
Subject: [PATCH v3 05/12] media: ov8858: Add INT3477 ACPI ID
Date: Fri, 28 Aug 2026 01:17:23 +0200
Message-ID: <10cefd9c6dde13eeebee5a1ba9109f35e2201305.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787872237.git.mauriziocasciano7@gmail.com>
References: <cover.1787872237.git.mauriziocasciano7@gmail.com>
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
index 9b3e6eaca665..26093f887c66 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2017 Intel Corporation.
  */
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -2088,6 +2089,12 @@ static void ov8858_remove(struct i2c_client *client)
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
@@ -2098,6 +2105,7 @@ static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
+		.acpi_match_table = ov8858_acpi_match,
 		.of_match_table = ov8858_of_match,
 	},
 	.probe		= ov8858_probe,
-- 
2.53.0

