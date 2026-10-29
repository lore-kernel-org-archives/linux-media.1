Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292865;
	b=370wGWho8iXES6g3kby1O4Rvhq0kcTKWuH1fAbodDaOyWMER148zB+ZIiAMxOkqOIJyA
	 DrkBL/77L+FovvQM+WC9qUvEN5K3B63+Tt6jq3hUipFBfgLeGiSEjJro8a35ZOHe8IRSC
	 XbjFdaD3GSNrnJY9kOnxZDlU2UlLr7ATrYl03bosFsT12XqbOHXjU+vSsZ2ANXrtBFHol
	 E7pKXlZbAK1wJMV5YWqLlLra2bnRbjXxsYY9L1NMeNb59kEvZvXV2GEtblrb/+gidDicT
	 Gj6pZGjbXcx9VNExILI9e+xOoPTt2oN/tJO6d+7zQ2Tdw3RwV8yGBRpjWN/pcM+ow0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=FEv+lu0boJwsTO7lwbFALojqeOyVhSp+CzP+r21LEGI=;
	b=HPOqSw3qf3pt0X4dMvLuQOxJAtoYiaRr35N5u7mkH0hM07PH/RwmDXSBFKMy2guFZ1y1
	 8cqWkbGUIWrt0B+MI8hcGtkHvMJndPvgJPmf8SM04Qhy2+i9Jdw0nh6MFcR/giBSFVLDs
	 LjJdPBu4Y8rxuu4IcGDb5YcpUO9I8Pm+A/4cFg1tE7fdas9fX3vVr3IX/W5ABiuntW3j1
	 cI23Mb3JgmKymGrtagHLrBFWm/0nYv4Xq9iwRv8oIBk2dQuDky2sD7x2aPaV+1XU9mIr9
	 IyzKU1qIqpVjxo6YkGvCLj0sR/XvGfyIHAkeMHo2xyUcOptaypaEFG5vGTUZ/4PLUAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Xv6oG+ST;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EA4606A33C
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 16:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62EA4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Xv6oG+ST
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1933686f8f.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793292863; x=1793897663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FEv+lu0boJwsTO7lwbFALojqeOyVhSp+CzP+r21LEGI=;
        b=Xv6oG+STQY5JMNnAztkr2Ok9tyKlWF9sZsHyMVE0L+gHr1vtrCwJn/lPebOd1lHWko
         gmlE3CSdn5eHUZ+et+YpEDyijb4bGVGT+m1HWldNSgdmv6ziPy3ruHWu04gCUZAMqtnE
         VymGBD8Ry77g/2SVep47YvGSQqsOu+2vl9jxOSQ/4LYrG2gjmboEN6kPG3gtegT2ZLH0
         RfFvnt90wVB6dVnARHDXDseevrhB+XRc1OyuHIEoSEUKIpIjBjTmAMyAncnh9zT9XA7p
         B3vQ8AKIv4FH97CDz8s3sEYmZNcOv9Iq3Z6Yhz1j1u6FDWBXTx7nzNJQUqjc8XsG55kS
         ojjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292863; x=1793897663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FEv+lu0boJwsTO7lwbFALojqeOyVhSp+CzP+r21LEGI=;
        b=aT70mUsmyFKuHLnE4xWAgncYUZqaSQ+jJ8qXmARjhyH85Ng5PuowQg/sbQVGN/15nb
         6PAZu3Fb0objdQdtP0A42ftBpW4thsP0X5S3by2RhUNYBaTZOF3OfP1ls0UtNE3bG9Bv
         5L011zlDhaaudLXNk4LKKCuEyVdGxr31iDVLjVR86W1XvxZgQti6LY/DXYRhwKbBFUPW
         b+gn0TphG+YSz6Ry7L9N51YcSmGhZK1NQNmc2r8VyHcBzkXZdbC8pODwuy7pPCZATBkA
         FCzc3R9ygBkbhTTByCcaxKtZCQoqKFTt0wTLo2YAEErlM/ahSwRDI0KogSmwa99dI0oh
         rYWQ==
X-Gm-Message-State: AFq9FYKAlDbszOIqE4JZeqtC3aV84LH/Mgt44TAQ9enZFoi2vlGQDMkf
	z6LvWHPHAZIZEAYtyYG5ux1+BhZ+W2sgcM7+DPPDs5B/5BwrzIzHpsjd0EhWOijWAL4=
X-Gm-Gg: AYBFou0A8ZWRIWRyFqlciIyiTKSKkX8/AFb5bfslsWU0W7f0vpNd+R9p5R76emtH3Kv
	UyCTSCfpMtq1WNcTW6NTCoD7YYx3KmJaLSGEr4hw9XWWYk68iEyc7+HzEFnsXfIBFez/wPFmUKi
	F/9C5vSMuFmTCauAllP4ChDiOIqATDe9iiyI9MKDIdPN/zn8lO8Tl2ZHUGgo5gr/D/TK6pDWDWB
	MkXLOVB2bNfHrXa6FWJyPzHAa2ojwmarK7frPZLtKNJbUG3sk19fIptW01ZHlSw+GZ0dmDSGQoa
	f/JOQQEBXpgFj23uX487AoUbWWY8XgLC/YJzj7VDlKv6/SLpiTsO1I1y/PY2IhG8/z8r9E9YelU
	s2Vxn2LmkSs8ihJ+QKtHyaeZwhHvLspCbJWutd/CD+zL+8fq4a478I4aOGyrLYmyVtrVl1OMbsx
	bUac+tfTg9FZjGW5AkpJCh11MA+4g/va7ilYsVYFDZ29BJtyqf0eux9eGcqS1daRBOoWKpaU+j4
	4MlEF1OIZu+FN6IiEENiXiLTo1OrP1qrKqTIskpAC9o0FPR0UHE/mAmFv4bdlzo/VNxv7IIJk5u
	ZaX07DInluucypdzYI60TGq986K+kq+LEcwuxWTMy6Q=
X-Received: by 2002:a5d:5889:0:b0:48a:fbcf:6f43 with SMTP id ffacd0b85a97d-48e5d5b8768mr14655156f8f.54.1793292862863;
        Thu, 29 Oct 2026 09:54:22 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:db5:c0cf:53f4:d20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df87fdbsm310880f8f.13.2026.10.29.09.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:54:21 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 29 Oct 2026 16:54:16 +0000
Subject: [PATCH 4/5] media: i2c: Use named initializers for acpi_device_id
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-acpi-media-v1-4-eb50f0a34e36@thegoodpenguin.co.uk>
References: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
In-Reply-To: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
To: Ettore Chimenti <ek5.chimenti@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Miguel Vadillo <miguel.vadillo@intel.com>, 
 Antti Laakso <antti.laakso@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Bingbu Cao <bingbu.cao@amd.com>, Bryan O'Donoghue <bod@kernel.org>, 
 Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
 Arec Kao <arec.kao@intel.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Kate Hsuan <hpa@redhat.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793292856; l=13426;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=vr5XlwSiWPDykWKMXg+/MohMR77rOUg7vNBUckQI/Q0=;
 b=HSiDZEANSpetcUWLldWpgmYgpB9KNOU8dxtxtSlksb1gU6ewXaZljhz4vHHDaavzxdmGQxATk
 WcyU5BNMl06B/iwU5WdVHMfGGTBVX4HyyoPro8giBReCV2ePCbddNFM
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/media/i2c/gc0310.c    | 4 ++--
 drivers/media/i2c/hi556.c     | 4 ++--
 drivers/media/i2c/hi847.c     | 4 ++--
 drivers/media/i2c/imx208.c    | 4 ++--
 drivers/media/i2c/imx258.c    | 4 ++--
 drivers/media/i2c/lt6911uxe.c | 4 ++--
 drivers/media/i2c/mt9m114.c   | 4 ++--
 drivers/media/i2c/og01a1b.c   | 4 ++--
 drivers/media/i2c/ov01a10.c   | 4 ++--
 drivers/media/i2c/ov02c10.c   | 4 ++--
 drivers/media/i2c/ov02e10.c   | 4 ++--
 drivers/media/i2c/ov08d10.c   | 4 ++--
 drivers/media/i2c/ov08x40.c   | 4 ++--
 drivers/media/i2c/ov13858.c   | 4 ++--
 drivers/media/i2c/ov13b10.c   | 8 ++++----
 drivers/media/i2c/ov2680.c    | 4 ++--
 drivers/media/i2c/ov2740.c    | 4 ++--
 drivers/media/i2c/ov5670.c    | 4 ++--
 drivers/media/i2c/ov5675.c    | 4 ++--
 drivers/media/i2c/ov5693.c    | 6 +++---
 drivers/media/i2c/ov7251.c    | 2 +-
 drivers/media/i2c/ov8856.c    | 4 ++--
 drivers/media/i2c/ov8865.c    | 2 +-
 drivers/media/i2c/ov9734.c    | 4 ++--
 drivers/media/i2c/t4ka3.c     | 4 ++--
 25 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/drivers/media/i2c/gc0310.c b/drivers/media/i2c/gc0310.c
index 5e941291dbf7..f822fe3fe200 100644
--- a/drivers/media/i2c/gc0310.c
+++ b/drivers/media/i2c/gc0310.c
@@ -759,8 +759,8 @@ static DEFINE_RUNTIME_DEV_PM_OPS(gc0310_pm_ops,
 				 gc0310_power_off, gc0310_power_on, NULL);
 
 static const struct acpi_device_id gc0310_acpi_match[] = {
-	{"INT0310"},
-	{},
+	{ .id = "INT0310" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, gc0310_acpi_match);
 
diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 4c13adf4a900..55c2a59bee07 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1432,8 +1432,8 @@ static DEFINE_RUNTIME_DEV_PM_OPS(hi556_pm_ops, hi556_suspend, hi556_resume,
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id hi556_acpi_ids[] = {
-	{"INT3537"},
-	{}
+	{ .id = "INT3537" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, hi556_acpi_ids);
diff --git a/drivers/media/i2c/hi847.c b/drivers/media/i2c/hi847.c
index 41b8cac6a5e3..7af74b41786b 100644
--- a/drivers/media/i2c/hi847.c
+++ b/drivers/media/i2c/hi847.c
@@ -2934,8 +2934,8 @@ static int hi847_probe(struct i2c_client *client)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id hi847_acpi_ids[] = {
-	{"HYV0847"},
-	{}
+	{ .id = "HYV0847" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, hi847_acpi_ids);
diff --git a/drivers/media/i2c/imx208.c b/drivers/media/i2c/imx208.c
index 3a899b41a9d2..ea7d102c7383 100644
--- a/drivers/media/i2c/imx208.c
+++ b/drivers/media/i2c/imx208.c
@@ -1044,8 +1044,8 @@ static void imx208_remove(struct i2c_client *client)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id imx208_acpi_ids[] = {
-	{ "INT3478" },
-	{ /* sentinel */ }
+	{ .id = "INT3478" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, imx208_acpi_ids);
diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 065c33380f60..51982645ae55 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -1536,8 +1536,8 @@ static const struct dev_pm_ops imx258_pm_ops = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id imx258_acpi_ids[] = {
-	{ "SONY258A" },
-	{ /* sentinel */ }
+	{ .id = "SONY258A" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, imx258_acpi_ids);
diff --git a/drivers/media/i2c/lt6911uxe.c b/drivers/media/i2c/lt6911uxe.c
index c9da174dbfa6..8d97d0000ae8 100644
--- a/drivers/media/i2c/lt6911uxe.c
+++ b/drivers/media/i2c/lt6911uxe.c
@@ -687,8 +687,8 @@ static int lt6911uxe_probe(struct i2c_client *client)
 }
 
 static const struct acpi_device_id lt6911uxe_acpi_ids[] = {
-	{ "INTC10C5" },
-	{}
+	{ .id = "INTC10C5" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, lt6911uxe_acpi_ids);
 
diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index c6c950d5c8f3..f9dc4f6b83d9 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2679,8 +2679,8 @@ static const struct of_device_id mt9m114_of_ids[] = {
 MODULE_DEVICE_TABLE(of, mt9m114_of_ids);
 
 static const struct acpi_device_id mt9m114_acpi_ids[] = {
-	{ "INT33F0", (kernel_ulong_t)&mt9m114_models_default },
-	{ /* sentinel */ }
+	{ .id = "INT33F0", .driver_data = (kernel_ulong_t)&mt9m114_models_default },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mt9m114_acpi_ids);
 
diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index b207b1d853a4..41f00f3b94f3 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -1117,8 +1117,8 @@ static const struct dev_pm_ops og01a1b_pm_ops = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id og01a1b_acpi_ids[] = {
-	{"OVTI01AC"},
-	{}
+	{ .id = "OVTI01AC" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, og01a1b_acpi_ids);
diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index b9a7dacd603e..932254f2fbe1 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -1114,8 +1114,8 @@ static const struct ov01a10_sensor_cfg ov01a1b_cfg = {
 };
 
 static const struct acpi_device_id ov01a10_acpi_ids[] = {
-	{ "OVTI01A0", (uintptr_t)&ov01a10_cfg },
-	{ "OVTI01AB", (uintptr_t)&ov01a1b_cfg },
+	{ .id = "OVTI01A0", .driver_data = (uintptr_t)&ov01a10_cfg },
+	{ .id = "OVTI01AB", .driver_data = (uintptr_t)&ov01a1b_cfg },
 	{ }
 };
 
diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 8ffe0a07ef85..f915a64f8e47 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -984,8 +984,8 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov02c10_pm_ops, ov02c10_power_off,
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov02c10_acpi_ids[] = {
-	{ "OVTI02C1" },
-	{ /* sentinel */ }
+	{ .id = "OVTI02C1" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov02c10_acpi_ids);
diff --git a/drivers/media/i2c/ov02e10.c b/drivers/media/i2c/ov02e10.c
index 5c1e7013f559..8e2d3dc5888b 100644
--- a/drivers/media/i2c/ov02e10.c
+++ b/drivers/media/i2c/ov02e10.c
@@ -924,8 +924,8 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov02e10_pm_ops, ov02e10_power_off,
 				 ov02e10_power_on, NULL);
 
 static const struct acpi_device_id ov02e10_acpi_ids[] = {
-	{ "OVTI02E1" },
-	{ /* sentinel */ }
+	{ .id = "OVTI02E1" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov02e10_acpi_ids);
diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 0710d2243cc0..67f167a7f77c 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -1596,8 +1596,8 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov08d10_pm_ops,
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov08d10_acpi_ids[] = {
-	{ "OVTI08D1" },
-	{ /* sentinel */ }
+	{ .id = "OVTI08D1" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov08d10_acpi_ids);
diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 6de0c17e633d..df2c63d64e62 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -2372,8 +2372,8 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov08x40_pm_ops, ov08x40_power_off,
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov08x40_acpi_ids[] = {
-	{"OVTI08F4"},
-	{ /* sentinel */ }
+	{ .id = "OVTI08F4" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov08x40_acpi_ids);
diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 5a49fa0ec026..c086d5292537 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1806,8 +1806,8 @@ MODULE_DEVICE_TABLE(i2c, ov13858_id_table);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov13858_acpi_ids[] = {
-	{"OVTID858"},
-	{ /* sentinel */ }
+	{ .id = "OVTID858" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov13858_acpi_ids);
diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 242a95834126..59e94b2f661d 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1697,10 +1697,10 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov13b10_pm_ops, ov13b10_suspend,
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov13b10_acpi_ids[] = {
-	{"OVTIDB10"},
-	{"OVTI13B1"},
-	{"OMNI13B1"},   /* ASUS ROG Flow Z13 (GZ302) uses this ACPI ID */
-	{ /* sentinel */ }
+	{ .id = "OVTIDB10" },
+	{ .id = "OVTI13B1" },
+	{ .id = "OMNI13B1" },   /* ASUS ROG Flow Z13 (GZ302) uses this ACPI ID */
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov13b10_acpi_ids);
diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 147862a813c5..8bfcd8bd3ae4 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -1304,8 +1304,8 @@ static const struct of_device_id ov2680_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, ov2680_dt_ids);
 
 static const struct acpi_device_id ov2680_acpi_ids[] = {
-	{ "OVTI2680" },
-	{ /* sentinel */ }
+	{ .id = "OVTI2680" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov2680_acpi_ids);
 
diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 536325bb7b92..fbba9e5a5fba 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1462,8 +1462,8 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 				 NULL);
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
-	{"INT3474"},
-	{}
+	{ .id = "INT3474" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 940f21fe0dd3..84d209955385 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2797,8 +2797,8 @@ static const struct dev_pm_ops ov5670_pm_ops = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov5670_acpi_ids[] = {
-	{ "INT3479" },
-	{ /* sentinel */ }
+	{ .id = "INT3479" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov5670_acpi_ids);
diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index c5eb07576129..47837d13c1f2 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1355,8 +1355,8 @@ static const struct dev_pm_ops ov5675_pm_ops = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov5675_acpi_ids[] = {
-	{"OVTI5675"},
-	{}
+	{ .id = "OVTI5675" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov5675_acpi_ids);
diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 56599f9ca74b..d2eff7422194 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1422,9 +1422,9 @@ static const struct dev_pm_ops ov5693_pm_ops = {
 };
 
 static const struct acpi_device_id ov5693_acpi_match[] = {
-	{"INT33BE"},
-	{"OVTI5693"},
-	{},
+	{ .id = "INT33BE" },
+	{ .id = "OVTI5693" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov5693_acpi_match);
 
diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index fce6344b5120..5b03343a0350 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1802,7 +1802,7 @@ static const struct of_device_id ov7251_of_match[] = {
 MODULE_DEVICE_TABLE(of, ov7251_of_match);
 
 static const struct acpi_device_id ov7251_acpi_match[] = {
-	{ "INT347E" },
+	{ .id = "INT347E" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov7251_acpi_match);
diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 42c4b9c4e380..7a825738777c 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -2457,8 +2457,8 @@ static const struct dev_pm_ops ov8856_pm_ops = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov8856_acpi_ids[] = {
-	{"OVTI8856"},
-	{}
+	{ .id = "OVTI8856" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov8856_acpi_ids);
diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 5a59cca8eeae..a28ee2cd2232 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -3130,7 +3130,7 @@ static const struct dev_pm_ops ov8865_pm_ops = {
 };
 
 static const struct acpi_device_id ov8865_acpi_match[] = {
-	{"INT347A"},
+	{ .id = "INT347A" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov8865_acpi_match);
diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index 8f39609ad1b6..31d22de7efd3 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -972,8 +972,8 @@ static int ov9734_probe(struct i2c_client *client)
 }
 
 static const struct acpi_device_id ov9734_acpi_ids[] = {
-	{ "OVTI9734", },
-	{}
+	{ .id = "OVTI9734" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, ov9734_acpi_ids);
diff --git a/drivers/media/i2c/t4ka3.c b/drivers/media/i2c/t4ka3.c
index 6506225683bb..187206178854 100644
--- a/drivers/media/i2c/t4ka3.c
+++ b/drivers/media/i2c/t4ka3.c
@@ -1043,8 +1043,8 @@ static int t4ka3_probe(struct i2c_client *client)
 }
 
 static const struct acpi_device_id t4ka3_acpi_match[] = {
-	{ "XMCC0003" },
-	{}
+	{ .id = "XMCC0003" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, t4ka3_acpi_match);
 

-- 
2.53.0

