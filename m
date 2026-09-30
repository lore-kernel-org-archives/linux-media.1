Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EF451EDE3
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 21:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804621; cv=none; b=A9zorUnQ5XCBdqRJubs9kolFbPThREghPfFyZBK+4GFCXupwniRLw6pM4o3PJEgAcvVZBXMeys/ggBHtR/N1dmXslyT+b7iHAx7J/qqGS8K40JMAwjGNCdQ7fD8xF3aoczuIogaQnUCz6xOjnbfXWI70TUMfVSXd08W26CyqWps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804621; c=relaxed/simple;
	bh=mMTTHMPR75bUOCOYBZV1Ugzu8uh7Brmqc/EPaghm+HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YWXNI/pK25EJ7uqe6Wv6r8MCw8ErTQUf1QNG3Gb8CyqWqWZOMXUZIM7lkaVGY7q9c13LdlVtBtPJQ5vl9OosLp44tOUH1r7fpGuvOZTf9poKjxxnKEpInfdgdnqcx3zzTAxSvxrtgn5EQgoRP7GSi1+/9zbWILZp22X2r3SPC4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljrqpNju; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljrqpNju"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398beb616f5so2716786a91.1
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 14:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790804619; x=1791409419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1zpZHPuVM+iqq7iFBG6v7ofF86AB0nq1tUsjQIMM3w=;
        b=ljrqpNju4S+PJSQRiUMQRuqXKtHjK6fbwt9nf5rY/o1x55avzS5ux+xTsVEXEdeDKt
         D6y/JD1hEDCv9HPywTFwjyAPFKq5ggwyPXSGXJJNjKHJ6DSSzVHzXs4v5SmaXOV38A+d
         kngNiIKPurH9b8rivuB9TsFhVW9dlkg5Yh1KYvGmklGb6/UjfNnIHn0U4Gnu7aFULSNG
         1CStJxPPcq1W2qtTrI+tmTxnQYWmAAtgtkIwo0zlX4HLmY6WHY8ZqC5vQisIxz5QfOuU
         Hi9APIuzgY8evvJ/OggE+gKaV8kO4NQ9y7gsQLZBFzdZDiXe3Y8OpDI1EVvJV1pF4JbM
         Nbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790804619; x=1791409419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1zpZHPuVM+iqq7iFBG6v7ofF86AB0nq1tUsjQIMM3w=;
        b=ZozpkgPqFRBL5BXxJKNqEEYXEzn2Xb2DrQcs/LJChkEq1vBrKR+HtTvg+fIhLsSLfE
         szTy7DO3oV1EqcAVE8fx83110EDcrYjId1R8FApgrG8iB9kuXPi3nWv8IBAv5ErpJTz6
         4noxngDOZtuATh/sP9zWUmssDbB5NZITAzSkDv9aqkHxmtqfXeCpoKRdi44+7gLWfOSg
         Hclyc7bZqJ/fhk6h1x4zvukVaOfTE0yCgyj8BG9bhkEhLucXf4A9zi6U5AakHu5VWVSC
         wIiy45TowBa3NRGgz1oHRYBLYld8yf+SmgNgTG7rc9tNU09AUkVY3fnhzZwKV0MCtUxE
         Cx4A==
X-Forwarded-Encrypted: i=1; AKwUvBw5tM0i2GrLjmcyokwJBXEQl/dUtKoL6pSWGbWzfV9uYqGzqDCywqM9eZUR6ovOOCqPZfKG70o3p4oy0Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKIJlJ3Q8BnlExE2LNI7Ro7MATMttUMrlYK/ykeGUUwpv7LCkWU
	yDXmAhAgaJdjyXbQSetcga5DCKQqs5defbVSSqfAB9C7xEgncoKrKvQi
X-Gm-Gg: AYBFou0x6OnR36oC1QqgfXYKUdJBok16DbRHdyLYUzkvaRbatSzsEF0vkB0sJBBtBy+
	TFZklQEibOMmXcXo7wl+aWb4LWyBO3P/D5zzXNONSrnluewsRRlxYGNrd9Zg93m7fugCGefFg8S
	E0Z6a2jTe+V9v4XqkkS/dtJmNmPpWxDudVTMIN6ubQKh6Fy9Re+BCQV0aWEB1i5J+GO7QffbFC3
	QhJSZn5188QRQJWvm6cLymEfowhiuAVXIBed8CzrEseZK9+Ajzwnist22RN1AL1i4y9rAhbxtN4
	1mfwS4QIjyacMO9F1dSMTYY1s7ksYGRHBGtfN1F9RXfg2cmurBxOavwWKS0+zrM7p4pA5EHCgU7
	fXDIajfpYa9a1EQAoD3PCVDaozuZLcUyLSVlPyHQ6iDZQRYqGbUKTGeSAaziSFXJSZzxbXJfl8V
	d2UVPu4dKokV0E4lEiDYl1/2gTTPxjF+55dPWcvd1hHvHv2kHdfE1MBqpuae6o7QfLqxU=
X-Received: by 2002:a17:90a:d2cb:b0:39e:6a7f:6187 with SMTP id 98e67ed59e1d1-3a4f2deabccmr468991a91.24.1790804619250;
        Wed, 30 Sep 2026 14:43:39 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cbd1dsm1060539a91.16.2026.09.30.14.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:43:38 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v11 2/9] mfd: intel-lpss: add Dell Latitude 7275 to the resource conflict quirk
Date: Wed, 30 Sep 2026 14:43:14 -0700
Message-ID: <20260930214321.600863-3-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930214321.600863-1-tchatard@gmail.com>
References: <20260930214321.600863-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "D. Manresa" <dmanresa@gmail.com>

The Dell Latitude 7275 2-in-1 has the same BIOS bug as the Latitude 5285:
the ACPI GEXP device declares an OperationRegion (BAR0) on the GNVS
variable SB04 and the I2C4 controller (INT3446) builds its _CRS from that
same variable, so intel_lpss_acpi fails to bind the controller with
-EBUSY and the front camera sensor (OV5670, INT3479) is never registered
unless acpi_enforce_resources=lax is passed.

Add the machine to the DMI table so QUIRK_IGNORE_RESOURCE_CONFLICTS is
applied to INT3446 on it as well.

Assisted-by: Claude Code:claude-fable-5-1
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: D. Manresa <dmanresa@gmail.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/mfd/intel-lpss-acpi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index 9d7d0ad62..f49ce3bb8 100644
--- a/drivers/mfd/intel-lpss-acpi.c
+++ b/drivers/mfd/intel-lpss-acpi.c
@@ -191,6 +191,12 @@ static const struct dmi_system_id intel_lpss_quirk_dmi[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
 		},
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 7275"),
+		},
+	},
 	{ }
 };
 
-- 
2.53.0

