Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA32374726
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 18:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199279; cv=none; b=cldgxRVMU0mZ7kzhgayh2ThhcvB+EYL/1i7R2Wkw6o1YJxkpFCqHV7vFX6JIKl2Z/Tb2mI4wMkZuQlqdn8fRoAUkMdNYM/Ps8nkL89fgrhNuzlJIZzlZnO3+u1e7zUfi1cFeOn9OeLt1ZOlQw2qZBGImhwJTC/Hc84EjgE98wnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199279; c=relaxed/simple;
	bh=sTTdJ+a915WjRhsMxkVa81I/Ww6U/l+JAdnO6byk8Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QuNIzZCqORN+X9/l9/1YylmDC5N6qL+851sgEFShvcYWNPZtUyloteHnvwvXXIsh6AelUyC5YbVV3zGByrestJCid3ZJJ4cWf1+dI6DKF5ywPHeO7i2aORjD0yeu9fV9cnQFFtSjXHhRZnV4bLJuqpeSAhsghfi29KdhG48sbXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/kuU7q7; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/kuU7q7"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-484415c8cb1so214569f8f.2
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 11:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199275; x=1788804075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O14LPPXLUHkibdGlwfhv5IQQ+lgmVBBTlfYVPR5q/qg=;
        b=d/kuU7q75vrWH2t1z1IpGS1n/BfIVuCCnA1g7v1Wk2j+DLxGYQ9z+bQJjxXCNVKJnY
         5Dqo8tK80c7sMOFkFl5fDR3//JDQKjNFcPSpfqXLKkc17w5ljtUPJDsISmGWMQgooOL6
         YJNfQ41kLpNO7umtAwh+9GdGKqQnqXijJS43cEHC+g1vUkKdGPV4EOpk2+WsuPyudgfy
         QUhMtJYiPCBht424dStTKbS4LU3LdZHa5prnh8i63Fkp3JoMRdmoelJzGevY0z8kcTzS
         o2ByYriA8T8OFqDOb/jZExrTNVGZZFb5z5cQ24ZAx7mlIisSSWvtxamf0qI5wYjGMy4g
         d1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199275; x=1788804075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O14LPPXLUHkibdGlwfhv5IQQ+lgmVBBTlfYVPR5q/qg=;
        b=di7BB5RCsDOUj03HMcE2+eH+Jxr67UJJU/wtQ1t5tYUQQFcOalxpjjB/ChD/rOE4Sf
         6EV5xIxykQpAjPk6zMvK1QZHPFzSOgNOGTNqjY5TTcuQLpo4VcBFCzTMk8DuRWetZeZ0
         CYzVeCMBtRyHDw2X5IqMPLVn5PuABnrGhdqsBFLkSsdDn2O2m8bUXzV9WqrgWHp2l1j9
         pWH/YRzpG7H8pw+92GtbvI42D6xkouzHT+SJs36naVx9posOsupxIC1ItcxsiM7aJjuh
         QnnJeNtYehgUfexwWYWRYdHwvBJHiqEY/EtO5rGvWKqZSD0xZNqKXKrvzdeC6WX2WT51
         vqOw==
X-Gm-Message-State: AFuF++mbEG+KAJKFMcuCWm+0SmuOn/5b1yVuul3LhWaCxHtkNXJAMSPC
	5H6oCL18rHbft8GxgfN6abXGq2u7rudoGTVtG/OxTzFlwZdq/+yCSIr8tY4qcvXdhLI=
X-Gm-Gg: AYBFou30Xge2gF6UNJoXcuqXVvVObZZJuR/jvoB/J6UH/wQKQGyPPMo8bWLtWIyGQzS
	o6KroCLbTXgLud2hFedhEAhXJ0kL7iEfeV9pxVnxrMqXOQtB+CIonHFJoBtcImtnlFxIMUt9mnq
	hhSjaPMSPVkgnWq9s5+kXrrQoGnpOMC2U3o2OQREI9FfEIOGSm2qJa7otn8ADBhR0xocffleBt5
	bQ6l3UTW11dDsV/Yr0un7NlAYO9ZzkX4a9bWTgjs6HrN6nm6i8LtyCtN6ZpAhZulsVXADe/HQpY
	XYMtmkPg59OCYlPi3j55uotZ7yIGqMoDv4O3zFlHykIHjkAevZr89dysiZSpR5uYNtYOao5vJ0G
	W9vGeSHlGTCePsXBmn4pCOa4XgtyL4BLz1vPDZCuJqwhCPrivR6wU1k8kUbDADxZiZHdFuAFXFM
	aIUKYZwH2WdBgE77RG3PZ4VLUXRtMnLlWVLBg4ye5lbPR9PqQFoa/ooSNmWvpKAHSkI4dmc514f
	lLpUVjnJLPXnW6HF0SD62GMottEjaIioitU55C1HYA=
X-Received: by 2002:a05:6000:64a:b0:484:3310:710d with SMTP id ffacd0b85a97d-4844102ad9amr4771790f8f.25.1788199275336;
        Mon, 31 Aug 2026 11:01:15 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:14 -0700 (PDT)
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
Subject: [PATCH v5 05/16] media: ov8858: Add INT3477 ACPI ID
Date: Mon, 31 Aug 2026 20:00:50 +0200
Message-ID: <20260831180101.3109854-6-mauriziocasciano7@gmail.com>
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

Firmware may use INT3477 as the ACPI hardware ID for an OV8858 image
sensor. Add an ACPI match table for that ID.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index d45659bd5dda..e48902d517aa 100644
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
With Best Regards,
Maurizio Casciano

