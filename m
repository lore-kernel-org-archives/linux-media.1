Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653280;
	b=3PvNBJ017VAKQ2/ewWk1Dtdoja2+c7Qn0PZEuBU4xcwiAVtJ4zXcWpTN+4/GdXCcRvFQ
	 a1mCcm+VKIRoFyyTyhP1fMFYl1savbgVkRZCwtmLm033fHsd6LgmmrdKFkWsNwyrqS2l4
	 yEFo4OFUc5B/y+730zrBQ2mGtFSJXK/4J5eVK8bYAkQOajTqkwKykSeUxJI+3mJC/366a
	 1emrNAdDLJJpCHKh7KebpygkmPHnLW2Ys7GT76xzdiSDPyasP4rcYAt6Ql5rHUgTIWCsL
	 lQTxTIfYQBQ58suxTWyRO8SwyGA6TbsVFbH7D2k79a7rt5ySlrfpb5tl8VBWAzrpZGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t8ltOwjxA6KeKnGObAuyhyG+hzNLbLDdGdsDrm0q03I=;
	b=kluFswK3P+I94P/JzeUM72LkCt0ozS3GHtBX0Np/v2ZUjxT6bB0gBOgGyNPm4fTbViSH
	 GrqE5ZO5x91aKn9AAbHSKrPGOBQeZx0f5MAxOtDK8cyHYHBvo9Gv0mwg3oJWXpQ0qRx0Y
	 2g4uA7TV5VWi9DW+a6o2un7RaIhyyH15xsbiyPqUArrZpdC9h8uqJhC/1aZUREgho5JwD
	 ohlXcz4z4LjULpDzArBB/4hITZc5xTvCpDrtpfrBeegDr9n0u4XdEyo2P4OHDHtISb+3t
	 JhjjBcbuxgEoNDdyIF+cJvdQprOpPx4YRKyTy+h74m7sZa+GHfGpIYtxRJf8EauJxSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CfGCSdab;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D9A606A319
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 07:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7D9A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CfGCSdab
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-181516de561so247386c88.1
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 00:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792653279; x=1793258079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8ltOwjxA6KeKnGObAuyhyG+hzNLbLDdGdsDrm0q03I=;
        b=CfGCSdab2SO2BZvAkr8SlDMq+axi7u/ywHZv15FNsOpdUqbJSQQFIzb6Tn6UrvewUd
         rz4MziqbMsrTh1X6wZx8j/7+//73PcjF/+gMRaGxDo7V8pwDJ9+qUGvtlZQ6Py7wOrp2
         Mh7GYYO7o8wk7HWI38hcCKn5vAY4Miu7HhBzf1/d3XwVdYxaDe9O0pIWE738ZabjktQF
         yTmAINEJeOO/1H+LvfTVsUNkBOu9MltCB7XTTSvzZimNurGpwYl5m4MSDCtexlJtMBcY
         5Cip6/qeuAiuvTgK97HF6bjIsBfhoafSw5RAOeKIg4KCSnaTjQL0OPQNKHr5NE1TxKO5
         Rifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653279; x=1793258079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t8ltOwjxA6KeKnGObAuyhyG+hzNLbLDdGdsDrm0q03I=;
        b=SZWhTwLZRbeMEURHViyBUdpLGs2ZGWVq7Sa/p4qxr4PnkMX66ksBDmfhfwyragfWNU
         d1amyD7lHcbuXq2+SL1z/undG8mTTiFIs8c7HIIWEtudVI+8hpfN7G26D9FftgJFEDvW
         D/b+AKo6XepJkFAQgvtqtk2R2eIaxj/TT/OcW8JYTsARMqb3Npv5MsegyUuzyXV1YMUG
         ENz2UgRuGdhF+Ay/X9yVx4EKaBzWRwVPP3hRlZOst1GBeyVrvn4UjHWfjWivItspCnlz
         BJ5vCMhpk6hChsJ5Ku5WKmzdxlf/51UdQyZXGTrxMpaRZPY9cq7/jRiBS2gEbwXN97AE
         W4dg==
X-Forwarded-Encrypted: i=1; AKwUvBwlJFXsED1CZ3SDSX31LN9VsZnagfSDX8owLTCL3mHm7k18KVQmVPLF3JsghFUNyZ6mJ+6G/peQMcbSQQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIlLZ8ADvN4F2tUi2Skx9ZlLRL4FzHq1kZSIw1ne2FF1PxjdTFJ
	Rljz+OS+Kx7Hx60DLjhewr8awXRQYywqMLIFG5I2jDss6LdhJBkBsIYV
X-Gm-Gg: AYBFou0vY4FJse/vQdtpOQ7VhfALZDb5XPGvd4giK/vuMvvaez+H+uni3rHSehi6U08
	ao12rBQl61gqvzdRGJeI9aTPxGEkEvH3cPqfGPfmdQdGeTSYt5/h/tGb4N2XLTxE6eKDe0duTHi
	niHGzPkxPXLupcFKXMT+RU4gEW95cFIIf34oKR13uqmPxG0JcG9mmoH71N091nUrnqXjTQxhRsd
	sa+m5xk3gPTsBqBzg/WFnmSTz9QCsLqTsi7c/zjoWcgoEWQ1e6V8zQLRSFz6RRhbHFopQO0MeX/
	bjjyb8k2PXwG7o17ZlINOuvT2HcDl9/7KUpwLTuMHyP0prP5W9BOKILaXI8umHeMp9ZGVrZKc3K
	cgo4Rg6epnoiyeyDxG8jO/CyG+79tgDOiu7tqvI82UixzEZVO5uht+5HCFbkec4Ni6NLGYWKuIw
	jgRxJBpjcxUWvUEUv6J7N3JACspindzdVxB5PEDCXF+VqrvuqcOIbrjhipaaqQpl5MeQcIIGCVn
	zwRmToXcIh4XoOTX3XvM10aTpSZJADbCOxOC5rWC0htxs9SO+LmpQ==
X-Received: by 2002:a05:701b:42d3:10b0:15b:1959:15e0 with SMTP id a92af1059eb24-192f2d2203dmr2161433c88.4.1792653279017;
        Thu, 22 Oct 2026 00:14:39 -0700 (PDT)
Received: from fedora-x1e ([210.89.35.119])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bd6b7ccsm11112321c88.13.2026.10.22.00.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:14:38 -0700 (PDT)
From: Saikiran <bjsaikiran@gmail.com>
To: loic.poulain@oss.qualcomm.com
Cc: rfoss@kernel.org,
	andi.shyti@kernel.org,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	bod@kernel.org,
	mchehab@kernel.org,
	vladimir.zapolskiy@linaro.org,
	jishnu.prakash@oss.qualcomm.com,
	birk.skyum@pm.me,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 1/2] i2c: qcom-cci: Select pinctrl states during runtime PM
Date: Thu, 22 Oct 2026 12:44:17 +0530
Message-ID: <20261022071418.26895-2-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022071418.26895-1-bjsaikiran@gmail.com>
References: <20261022071418.26895-1-bjsaikiran@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CCI runtime PM callbacks only gate the controller clocks, leaving the
bus pins in their default state while the controller is suspended. On the
Lenovo Yoga Slim 7x, this can back-power the camera sensor through SDA and
SCL after its supplies have been disabled, contributing to brownouts on
subsequent power cycles.

Select the sleep pinctrl state before disabling the clocks so that the
configured pull-downs can take effect. Restore the default state before
enabling the clocks on resume, and return to the sleep state if enabling
the clocks fails.

Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 873e901a23d7..fba5f664eeaa 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
 
 #define CCI_HW_VERSION				0x0
@@ -474,6 +475,11 @@ static void cci_disable_clocks(struct cci *cci)
 static int __maybe_unused cci_suspend_runtime(struct device *dev)
 {
 	struct cci *cci = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pinctrl_pm_select_sleep_state(dev);
+	if (ret)
+		return ret;
 
 	cci_disable_clocks(cci);
 	return 0;
@@ -484,10 +490,16 @@ static int __maybe_unused cci_resume_runtime(struct device *dev)
 	struct cci *cci = dev_get_drvdata(dev);
 	int ret;
 
-	ret = cci_enable_clocks(cci);
+	ret = pinctrl_pm_select_default_state(dev);
 	if (ret)
 		return ret;
 
+	ret = cci_enable_clocks(cci);
+	if (ret) {
+		pinctrl_pm_select_sleep_state(dev);
+		return ret;
+	}
+
 	cci_init(cci);
 	return 0;
 }
-- 
2.56.0

