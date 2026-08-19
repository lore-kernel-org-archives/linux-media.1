Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D501C476694
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 14:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787148089; cv=none; b=P3jBOdqnbC2CGdCkqPG9cZUQBqh7quYKAs6tioAJ+3xDGFvnDpnRwF4Q0BY8U2hPzqnzOyQJTBsSW1T+dO7rkA3GJM3khCse+wg43PAL9M/2DkKgTPH4skncNdygY/pxB6+/UbQkNMUJxloCqp8yj8aBTdiCLOk8No/aWRxTKDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787148089; c=relaxed/simple;
	bh=86MNvmsnbWVXkw6zWONeDyMeOkiRVg8K9Hjh+fAPMKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AdaPHUMnQ38AuqGpiNMnZYal3jAh8iIE5n1+AoQ6bbWDAmcYHxxFPZGdUJmvcNX/DmR+VM9Fre4wqJrwOzYy8poUVo4drIWWms3UDOkvg11g7SrufN2seByAS4v1krdeZlT9C3UnezilEpyhOHFqaIpwUt6pkgqTGtDTXwcGFj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZcmANFA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZcmANFA"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4956242332dso10499955e9.2
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 07:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787148086; x=1787752886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NmAH5ezdPVsVJaUq1RUn7vsVIqur53S8admsZ2HZb1Y=;
        b=WZcmANFAnxN+u+5B1bRRCKC1236Qqsey7G1PGfnkVqrXPNfZq6xqS5GAgfLnEWTb4X
         13VDFH7dgQUsFa/4gAuN6v+GklDhazam6LBFj4+8AxmkxJVn8O2DIVHpJa0SeFkZj2VW
         py4Ovm8T1UJz2liMBnXMnNRkSN/d2tE5AOjEvPsiVlTEqSYxYkEOC3Faeh78RkoC/7W+
         THUWjUjS2LjyQs3iRK50KehhYLBCH6bOsOiK5yoiJBFeps9s9jeY3+U1BsScVThQ6i60
         0ec80cmgOY52JyOfdPtcAwKcr5CBCo2JRVlY4/r/wlFmxA7IJWRafDioedJ7+iwt5ZAw
         /IXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787148086; x=1787752886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NmAH5ezdPVsVJaUq1RUn7vsVIqur53S8admsZ2HZb1Y=;
        b=qQNVw6founsC1rZLNAA8lcH309tyfUHKha/ZylplIoxLvl5SH5hMTHvhFMnficn5KL
         XDqjuoT+8no/OVd6r+f5VdL5583A/iX0PyyzK/wxDyd6udBf1C5hiE61HoDuUhHsNJln
         3MmDwVR+hY9P1GclxqlGXQoWX0izTiGiPcl+tTCeMwB64QCGCZTj1dvXWWjLQVhypEo1
         0ZUQDgc8qA/LoP37K5r+MSRlR7JMty/SBExss9aRTBkwRRHpEEYGXxcJSmJF6xm6m3+c
         bJdadLZuweK1HavqpAI32uROJVvK3IsKvuBTIotHq3r19vP5CwB1IU4jrO9p40ESkha9
         OeCA==
X-Forwarded-Encrypted: i=1; AHgh+RoguwLe5GL5q/w93mlCF8PleksLWLU6798jG57e6GtzpldxVnOhMt3vL7M9zjGid3P3LhMrM6siNG41ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRyUMdrA6WDr+eVrwnoAswbamPYdaT5PoigZk8Jal8Q6TEh2Gx
	tuNjSMLvyr/u4nj7fqYT/vjk7rJSn65MTIWrZ/M2ARMOFcSSTJS6Rg2S
X-Gm-Gg: AR+sD132ixnZDo52VHRTJkSiVy6GdkD+ojkL0DZCHNbEtTqGWMVd0U0gaikRAUhdUAf
	/CONt93PsH3SyHLLl8H591TblJsOEecmhYPGJ4eThDLHs1G/gefrPnq33PxzI7/hpWmlDrkSlmB
	1k45MWZMVDzGKHorxea3ZaxRTZWqh8DAlZOkl6DE5HyzDBO8nTc3+YNlmzVKCaiYD1oPQHHHYPY
	YjmI2ZU7ZvWURIov5T3FqZCI+M1naSfsfpHh2v3sReK4QDSFSZiFf6rF9pgSsmAU9Rps0qLsib4
	NimbwKeUfRRDVMeomsVb7pwpfbFNmmjwMKeY7JTYWWlUWvO2b/dioT4hnB2CNlo4+j6PG2+/2G6
	dVKlbLbF4HdRY+deJ8t/Le6WaY9aproHjROA7wdZpcS+xDmSJjPm4zGoVCU3vzfncJRw1UwA7Yb
	ElevdHnrmeCDcYmyLw8DWttmKlwakLBn/Yz/D5vYHHacPSJ/SiLKQJ49g=
X-Received: by 2002:a05:600c:a30f:b0:499:b01e:911c with SMTP id 5b1f17b1804b1-499b01e9125mr1489005e9.2.1787148085828;
        Wed, 19 Aug 2026 07:01:25 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:d3:816e:dd0c:fe6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd728sm92751985e9.3.2026.08.19.07.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:01:25 -0700 (PDT)
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
Subject: [PATCH v7 5/5] media: ov8858: add ACPI device ID INT3477
Date: Wed, 19 Aug 2026 16:01:07 +0200
Message-ID: <20260819140107.1329091-6-tchatard@gmail.com>
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

The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
INT3477 to the ACPI match table so the driver binds when instantiated by
ipu_bridge.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/i2c/ov8858.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab..9c786c9bc 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1981,11 +1981,18 @@ static const struct of_device_id ov8858_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ov8858_of_match);
 
+static const struct acpi_device_id ov8858_acpi_ids[] = {
+	{ "INT3477" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_ids);
+
 static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
 		.of_match_table = ov8858_of_match,
+		.acpi_match_table = ov8858_acpi_ids,
 	},
 	.probe		= ov8858_probe,
 	.remove		= ov8858_remove,
-- 
2.51.0

