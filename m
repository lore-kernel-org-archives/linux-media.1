Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3824A5EA0
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360844; cv=none; b=mtk53dSbkx3ejZDdttfIKD+XE+7z4QguLmYXrpwesXh/wDgr4RnOkLPOhpijMo0vHsYy5jPHF9NclfjAZx65vfvTisvyAgiayfRZhP00K6k6vAFIbWpriAVcUEw1Zc/WH9JxIhO/Goxhk2VTSfQZ+uB1uQStAzl9IzoZ332RBgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360844; c=relaxed/simple;
	bh=TXh1grcukppVIGRq/jtRuAjsCenqoiHsQqtjG9cBjkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tgO70GqWEUQxG1ePGEotY32ALq2Hs4IMB9sTnuKmlPxJAHiDJO29X5bX38748me1V6ejcrUdNMBpl6SLOnd8MDjFby8+D70Ib2j+4srpMXq37z16ng1xxsmcAYmusnBOlUmTrpnspRORTqiv5nQTdsJFyD171dxOV/IFZo+5VVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4elF1GU; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4elF1GU"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4843f205a5bso853736f8f.1
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 07:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360838; x=1788965638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2f+YxbIheZwHZGTF63Z6dyP3lfK44zOBXHl5f5gYzlI=;
        b=K4elF1GU4qjkw5SwWRXZTUqmwpMvZn0PDgxNLuLA8oGShzP9kBwK2sTmVAJd8o1ira
         uqXnzs1hme/RvaWuObqjIP65X+ieK1cTR5ORw7hy+P17F9mS2I/OW6QBK3zxJaju3x0v
         dV5qRK3ebPQpGgUWm+6jBEkw1jdPiEJzvAYvtLPL8zgKBLJ0b0p+phXJ7LJ0uQUBNlH4
         ++V/KkxLHpzthAQYrDIYuWzSFBdJ6JJJt8vRKKvXbvOP11OTlFr6cQqNG4eZrDs8ngiY
         y/pgYMYtuM11AaQ+yGllFMdYXzz1uMAd3atNoCkGFQSrCpRKb0huuz6pCB3RGUrHPUvr
         eyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360838; x=1788965638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2f+YxbIheZwHZGTF63Z6dyP3lfK44zOBXHl5f5gYzlI=;
        b=OpmPBrZBx5dZJs8I2Oxv6bcvESGTe/9wMgO2wkQgV8hb7R6qMvv3YfhPOzlQV/9Xwx
         VCO8UuALu7C4CXCDZ9USqlWWF5NGo1+dS2VQ5WstxBg06qS1Sn7JcE8EnOcilSKsgCvj
         2PmIbjgZ8S6KqZ6ybL2Ux/IBDnNG0wNGljlLIgqcFYNrPIZPONDil4ifQ9Pp7LnEqSEQ
         IvOfLuhOMhrDgaSoGmH/lcb1++vaocTa5GrbNXAzsuwlNNAcc1wWqgyCTAC9BkMbOVE6
         wiU49LzFx7mdB32jvjAbbjJvtM/cn+EIM12CqgvsoyuNcWvSj23kT5DrV1ryKWdeB0tF
         cI4w==
X-Forwarded-Encrypted: i=1; AKwUvBzjOm7R/3Pp9gjduFS12x7TMXbpmHKY3fA7w91eXaE7dYOifuSdVNt8G6ltwDSbA2tuNtvZu9Boyj2ZZw==@vger.kernel.org
X-Gm-Message-State: AFuF++k/5PCM0XHN36I6rN10uTIfC3cBQAoQHzipB3dBd43UC58k8ioh
	8mIx6P6lfcQXYir2NmGC5ZHSeBVhNO+Dsgy7ls+wVIGuRvoJHKqAMHWi
X-Gm-Gg: AYBFou12r2JkfYOOPJJ0m/LdDaM6XNnzvJUHahZXAuS6rT3EVlDCDLWe9WierR5NSHt
	8bCcehEHZFNcNHwFqe4KIu+wrhTiShmR/ZSan6/e9f33bsiQw+gmiogupq3LajkXTMcelu6Y4rl
	wh4HTSkyauVaqJUbgTC/sCnndQSlYPieUkMGbENRZDpVJ4USGtc886j/Hr/D9iFKSY0gA/qb96e
	kc7hUE5ss6/GwqG4YP+2Cl9xkiXtQ2XV29klgz1ZaPI9iuN1bf+oSEOReT6bzCR+YdFihToqprS
	I3NgZNNak+RfBGUe+FrJf5WNmqf412ILqNgHURtSagHf948sXNerI2KG/kqohs59niv8dxwAIKp
	iMYQ9C5XochnDrZ8u0cEC/TVlW9CcXapYxWBgWJXeE5/U6YkqeNHCtfVY0SIps/jIQ8FkpYjosZ
	XxBujz3SzxnM9LrOT6zPRWlUke8Gn2xLhQy2hYFNjlUlSvLWTdT5RqJg7iMqHbFV94q11XfyOBt
	OPsZNcbuCChD/7owSQcLk8TytX0F3hjLA/Q9LIhgkQJ
X-Received: by 2002:a05:6000:288b:b0:482:f09f:b262 with SMTP id ffacd0b85a97d-484913b88a9mr8501885f8f.20.1788360838300;
        Wed, 02 Sep 2026 07:53:58 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:53:57 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 05/16] media: ov8858: Add INT3477 ACPI ID
Date: Wed,  2 Sep 2026 16:53:34 +0200
Message-ID: <3cd0749fa48afa1aa89781867bef49d3e6dd4e30.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
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
index e040c1fa0a94..f639d2664d81 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2017 Intel Corporation.
  */
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -2091,6 +2092,12 @@ static void ov8858_remove(struct i2c_client *client)
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
@@ -2101,6 +2108,7 @@ static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_match),
 		.of_match_table = ov8858_of_match,
 	},
 	.probe		= ov8858_probe,
-- 
2.53.0

