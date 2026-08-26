Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D442B3F9298
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 11:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743577; cv=none; b=q0L6VNZ4CtKVQmNdIv7sNj8/fjciPE95JcEE8nWY2uCKxmg71sU+dTiennInhSHGgTIc/rsvgtLv+eoyPY4w0DQ4/EFkvPfeoqk/vTk6+G6v4K82S6qRnr8zJ0NX4ln8rSLNuNa/oVdIuJe4vYwm0SAUoJ8FCSud7qOU2WtaBdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743577; c=relaxed/simple;
	bh=ot5s3z0y3WkGd23yN8si0am4L6kSSGA+LkIE6cUufHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dugldj04hkS0jibS48V4kl3+ANiQVR+R5Kq7mB1ia7ZYUXPC8VY/OmKkkv/6MtGlpj/+tNGLG9xFZrFjsX8k2YxGi5DxjqwtXFXiBY911e974fiyAiNXnbTcU1JhjB87fEoYB5c2qCB0K2wGDLvTB7Sd7s58pZpQFDQ3iA0+tVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGrfPUux; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGrfPUux"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47db714766aso1146172f8f.0
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 04:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787743572; x=1788348372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+YYaj9hB2BEbjd6/AK9OJyefsLzkvfj7sSU25cg5Eo=;
        b=RGrfPUux2Ma3TjFzrQAH80VXbzpLAQp9b2kZW9KNpMCcO/tu1q087merOEPoVzBWqQ
         snONxDlMQq3uRIfypYlS9w1z0242WAyd8edRkp8QGvotltHjEB2ioZ9VYbploR4XMUf7
         5+BsBaTPnNKM7JdwCK8BSHwbORgxHnjQblZ5CXLahhq5w3tWR3yevemUUHrlCTzxZnly
         DTq95rVVjyOt+YBWxr86Lk0XwyzoTzGo+O34C8zvaitRIjxc0FvEHRnMTovADj6H5xG5
         osy6gVbXKsjCXWVkDTf7abkbsFJmioGL6QOjC48CNwYCm1sHFCTk4gITNxXVo65tgdn7
         Zvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743572; x=1788348372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+YYaj9hB2BEbjd6/AK9OJyefsLzkvfj7sSU25cg5Eo=;
        b=WKhwsnByqmTsaZRWB3+YfaKd7kS3gE/TJvleQsCnU0hf2omZr6Ql3XC4PwRr2KhZOW
         hxP+9+wFhHqihBGVFeZeTW1fOiO0QOPqdVqiEVK1j5hFNaQFlUgtN9/IDpRjF0ameEHC
         5quz5GgeT5IsGwxbrz4T7HkutmlV1QkmavgFa6fIwZ7hK8w+PyddROuLt/pKEpRLRuCn
         DrY/xNhaa6tk6DilXD+Qy1LPjEuQNqlcaSOgpN+CbOddsZcFX9hiISNyQ7RUauxopDoQ
         PhoFIiJPsJP17m634zCftlHWts67eioy/DCxEv4OwF0FbhDw1spJzByfwl2uSS7hEwsH
         HRVg==
X-Forwarded-Encrypted: i=1; AHgh+RruWQRfojsTyxLNcag2g4AQJYwOZGhx7S+759gAQSr0u1e1yI7rdIk4uZPyLpAMZKhTCeievHxy3ggFaw==@vger.kernel.org
X-Gm-Message-State: AFuF++nyZ38b67sKt7tzkqqzEbEZ977xO6zTNp+ANZ/rwesw/BeopYtd
	fbUDskRjTuV7bh3UnV3d7cZqb4Xdbpwbmr8bhVdJZhb+ayBCVY8rB6Ro
X-Gm-Gg: AR+sD12TKnlBsV4MIysZ9hB9s4UD+WEVaI0mjIFq0dy8DE3BWM23rC9mml3BYJGU3gM
	9/lDefXZUpAmrbQBzVzLCSswDEfK4wNxOLeMVDKCA78WPY5I9php+Ll9JmfdpPPOB95wNl6NgkF
	nEZmnX7VHZJtHBcem8JGomtvVWearA5NMvbGhmZvLKlSljdsja5kHjZjAK/DeNUjuPMXMj9UVC4
	xAA44L0zeBcJWDo0T8g+61WZLHq+2Cx0dd/fHJLF7v0E4UTDbWdOND3SbEmX8EoUB3v1aPKelRU
	w4XBUTvGeIe7UNaTjtZBpskwsEbq/o38uk2TZfo8sPM5H5wo0Ia5fnWLmzF7L2pv6L0Bnoc0JYm
	eH8vbAIHjMsZCS0EzPfCtNMJhlh0vJeBE1syyzAadYsGTFkXsTI++IWYtDmUBrRlKJD5cGAL0B1
	FvaTFU8S/GYJQjqV0mqwByjBBGATUdfLb7HxmVr/wTA3bJb3HeIkjNTp6Tq4Z0CzaXZLg=
X-Received: by 2002:a05:6000:25c3:b0:482:a9a4:91e7 with SMTP id ffacd0b85a97d-482d99aa11amr13881439f8f.15.1787743572201;
        Wed, 26 Aug 2026 04:26:12 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:6b23:b1a3:f913:3d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f6119sm2442098f8f.34.2026.08.26.04.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:26:11 -0700 (PDT)
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
Subject: [PATCH v8 6/6] media: ov8858: add ACPI device ID INT3477
Date: Wed, 26 Aug 2026 13:24:51 +0200
Message-ID: <20260826112452.13539-7-tchatard@gmail.com>
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

The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
INT3477 to the ACPI match table so the driver binds when instantiated by
ipu_bridge.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/i2c/ov8858.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab..f0148c1f2 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1981,11 +1981,18 @@ static const struct of_device_id ov8858_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ov8858_of_match);
 
+static const struct acpi_device_id ov8858_acpi_ids[] = {
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
+		.acpi_match_table = ov8858_acpi_ids,
 	},
 	.probe		= ov8858_probe,
 	.remove		= ov8858_remove,
-- 
2.53.0

