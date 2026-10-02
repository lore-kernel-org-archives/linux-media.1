Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBBF1F3B85
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 22:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790978747; cv=none; b=i+5KEBhRsP03KNeOTONPkvbkEkUicQQbV4YoYx1YzmP/RZe6xO4kKiF7yJ9LEXER3TC1G5YGvtfMnWK+6IOtkhCVLGTsfkacEJS3RQnKhbqUoVy2IpzqbeSzQP6gPLoBnaxhNUe+GE9rRZuyuhWbjiwTSIqqBRBic6VVl4dd5kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790978747; c=relaxed/simple;
	bh=01XW4uC/sGdUHWiw99Nd7VE9u7bEzoXNo4QNFV8NZy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PlmHWEpQvfVImkMKviNCxZd7m8IQsb1AoGPBOyJYNY+IgP/HQKyC42JOy9t8UBK4w4SOyam/UzsSBDIktO6SqA8Jpg/sw4Gjslyd5DHi65wF0/vhkrvoQtVQbqSqWJv/RjcfDjorPuZu3oj92LBsrwEuw8MeV+fcymmhq+3crb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+vyULPE; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+vyULPE"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2d9fdf798so275835ad.0
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 15:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790978746; x=1791583546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8/HFUWluZhijz+URCNd+7IiH1oTyp6nTgJbUzgXg/4=;
        b=c+vyULPEsPxrvz8hR4E+VQD/8I0rPSXCXN4LKlUxvkqvkFSAk0DvwC8mmkMHnQUZVy
         2v9FjRbeS5vmn0SAc51K+IilUvF/B5jBfinZl0DReiWiqUW/vHfSZXeWUhcqC3eqTkZB
         h0/CBOKpdRrc1lDZt+4yHbKiT757G1W39NF/BNkGqB62FkAgzJAvQcgtx4tikO5yced7
         B6Psxcuo7W3uzlPEyxNMdeDLeBNoxslMitR7g1vFHSDsySkd58W5ns5XNZeF004vfjW5
         QMmyPu9nLI7aGnv8mlhWSh3PL4yosVvxSmgJRWPUstD215BPBQ3SIXL3XsxNj6BPS/81
         JSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790978746; x=1791583546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j8/HFUWluZhijz+URCNd+7IiH1oTyp6nTgJbUzgXg/4=;
        b=fgSSrPR1m6oQLX9oPWPmCatrv241ufJ2TxUeJJqhPFQ1ajKFZ1YkVceCSVhpknUdMR
         QhY9GnjiyMvPPnk0GFTAwSwgi976vBJSNL5zO0H7KkdYtkw8zWm1QAu9/dkCiz39pe1n
         q/flY03htVzjQ75z4f89ffpyoA54Hf5mY+pI9RXuY5lrP/PttYZxm1Vg1PdcS05DLXOp
         W0PWuOrq5Q0+Y/k5CJpaJ2jhOO2uC4n9oh56jWydsimNI+FFEJahoBjbUdh0Xmj2y4xx
         KjBlylc8hYEeNmaEXS5whQSHj2kxnC+sLya/rCYxCkUjfWqm7yZ/IoJXS4kV3ytSjSUK
         ggJg==
X-Forwarded-Encrypted: i=1; AKwUvByMVfA2rmLZrUax8Wai8NjU4HN8YOtEUnSIdDA3O2mwgXLwvD8BLpdG0bQUYjFaE5WazDmPCy7DaYu3+A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIuCP55QGl+aL4YeuZUljGbL4MNER54D+s419joq8nMb8a3ftl1
	HdC7JxAimK8PK95pCyWOPV+jQn6D09kVYy9TPOUw9RSgexutoBu3HWRZ
X-Gm-Gg: AYBFou2Puaf1Ffb7lHANMkPjEONbSdDke9imMFAdx6LmmHI2gFhjUSPHPKcpJ2X4u8d
	7yj1Cqd7eDjQjvneU2Lav1NhrXIucQwKpXDm2foIWqs6Oldxrv1CnMeAxOD0edL7Ub9gHeYavsS
	wRkTRjd/PKW3CJmtb3RrDLylf+oYfnOKtEPPZqVOl8Z1Eb7CCjWaV72kjptgq42pJrgnBxXFT9A
	TpqvUL0xYQZcV2ZC3QXGcrjsKHZ9TdrkZuWxDdxi8B+ILhAZbBWDMXfdSFWG3Otj66Voz3A0rh3
	uDgGX84gbRHoLflIiXEVo6JKxtyyVxluMHbQBmPM9edyiMBqg8K20LU2K65Nd+PN3QR1zlUqf29
	3KUt0/a1/aj+LcYL1xoiKcKskwLv6fy5TspKMu+/iBIp7FVDV3lWyIkWIgAhdzpbDqTMKQ0mZ+3
	47Ruj4ej5uv7UWgh9gW1EZR7Q5a7WzMnWnxNKQ/UXXBhqkQIZogfLztkUXqD9pJz/i4vQ=
X-Received: by 2002:a17:902:f607:b0:2df:9556:6847 with SMTP id d9443c01a7336-2e49b7ff04emr31434085ad.70.1790978745585;
        Fri, 02 Oct 2026 15:05:45 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ad1a9sm12324835ad.43.2026.10.02.15.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 15:05:45 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	lee@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v12 9/9] media: ov8858: add ACPI device ID INT3477
Date: Fri,  2 Oct 2026 15:05:40 -0700
Message-ID: <20261002220540.1271601-1-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002163350.1248431-1-tchatard@gmail.com>
References: <20261002163350.1248431-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
INT3477 to the ACPI match table so the driver binds when instantiated by
ipu_bridge.

Assisted-by: LLM
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/i2c/ov8858.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab..d106cad6f 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -7,6 +7,7 @@
 
 #include <linux/unaligned.h>
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -1981,11 +1982,18 @@ static const struct of_device_id ov8858_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ov8858_of_match);
 
+static const struct acpi_device_id ov8858_acpi_ids[] __maybe_unused = {
+	{ .id = "INT3477" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_ids);
+
 static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
 		.of_match_table = ov8858_of_match,
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_ids),
 	},
 	.probe		= ov8858_probe,
 	.remove		= ov8858_remove,
-- 
2.53.0

