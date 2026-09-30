Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4B352CCD8
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 21:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804632; cv=none; b=RJM1BDYmhmjmCYn3P4I4KiyyYfrQWpLbWFBBOIZaIZkbxZDTu097iMl3TtmgVN/oFyhWlC96vz397CfohThWwJrF0+2/AbHQHBt/wmHRcBVa08QyQTWXKiaL3pAfn1x6npS6v2SukPdK+7ggeIECHgPfMLWSkPX1Nr5uDfhH30Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804632; c=relaxed/simple;
	bh=JaYYc/MebRQQvnPhb6g6B2V4uIViyu5GZFRD0yqRn88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j89qME4HbV27NnVkpkrhIUmBfs5bTwC7eb9PVqhny2ZCrRJxCRhIO4oVgeIX2kWskFxvq3FtIljNg+0a9Cg6KmweKwsWycrDWo1fJxNU6r6ysw3K1ykAPKUJvXly56GchQH4q4JR5JqDyoVayfVEreW+eEy38cIpkqvwsckYAkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ML7CogMM; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ML7CogMM"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb65437so3489251a91.3
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 14:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790804631; x=1791409431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxKjjaswIqYpJP4gFTjG5f76wpVmS82nrOI8R56lUWA=;
        b=ML7CogMMjmT59CJD754AnaJew8PhGXWjUhMLfnqdonV9SAF+E33RYV8DBCzO0iX37a
         +p6A/hEhwrDhOOeKQ2vAkxh4XboWnK9QtF8/dZSq0DyP3r92QrJxcAWCU/v+4ldqtvmP
         +vbgVzLLmRaVIZ4qaPYhymYJBXsAMFir5Vn1gQXoUxZE2mFJfAMjfny8pcIGuZSH4Yby
         pOEtDE4jYR+jRvUa9GBucpDoKTYAFOGai2khUYMSl2W8REXWz1Sh44srBX51OJE+jdnI
         aOX5TUXZKw/t8ZUSDM8mCHio22vMwHO1MxdiR2jCEkn70lrsp5dJ+IVzOtfxqijLiilX
         i6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790804631; x=1791409431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xxKjjaswIqYpJP4gFTjG5f76wpVmS82nrOI8R56lUWA=;
        b=PUhSaVNjJxPCGaPINpO+MDo7YcdGmpBVsMXYY0s4sC7y9s/ie4Db+kplmBfdPqagXJ
         IYNiIZ3t2r42cN3V9t5YS4Ie4+SP8gfxPjXi+CIq4+yvyrUt2InIRzsZBRnVBY7L4/mP
         uSYDGsGD3WqWim87JQ6/wl0y0zks0Qr5jO0ohDlqO+XFf4gtNEBgI6yarfH86Ur9BWfm
         rZp3VFayU7fcRFnYrFIZ/DsdrDb+91d+tA1eu0c+XAkdDGsxnEWMcZ5qVO+BvcFesyV8
         Z+VdjANwfwmkxydRf0TL+gotLZkyviK0nJ6gUceeShvXraGDoxU+4XOJ0CYsik1ljuF6
         T+AQ==
X-Forwarded-Encrypted: i=1; AKwUvBzme//V5mfoSuLLfPRyjWXAldylLA+YEkWKvjVm6NVoKzE0BSYqxGvH/msy4LfxD0/tGd5AQ6zcmqCtVg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIYocz3eE6wzcjB58fHSBciX0bynj/q2lOdp3L81xzKHLovreRw
	w0Vk7jY4dh+ZTs3CGKPpo0PDXNZwuRdbAtSew14okAG8YjSrZWgRqvHRHPTPCCvM
X-Gm-Gg: AYBFou0xUhXMSSSl6nOBzUmn/6Wr+JbI1zydlI3+6UjoS6m2URRLzhicJiX2cQDPr6O
	wG7k50B/0XeSYK8X8ZanFLnjDJoekn2j7EVSAYwUKSI7XWZAl0iZrjbpuvdDE3t7lrzFPZNGP/f
	uf57pyhLmHP3AuCwBXykV1flkBdQexV2vPZqnl966Nu2hjN6ySUogaizmVnDBvI+jwNqUdDLA58
	xy9pO4HNaDPPlEBWH6CCn25MWEjbatW45gpJ1GOhV0q7El8Y8d9fziiDY98pLvyxvuFMMw4vHGi
	Rft3VmRb74UelhNlxVvWqwdwkebIKbCByMEBuZrE9xj2bds9D4U3FsxvlOXE7f43NPZk1EL0VN7
	glqp5oq1B0FQsd2eiBmIBwkGTviR+JBp6uw390Lo/zeTtAEDhRJZX9wgQOpCW8Qoz8o5j1XfaWA
	1QzOUPaV5I4GRP211KUAA9gUi9UDnrdPDHumETxZ4g0rLGH5+hpsFVz3qlRMByZMBWVuU=
X-Received: by 2002:a17:90b:35cf:b0:3a0:4384:adf6 with SMTP id 98e67ed59e1d1-3a4d05a6f4fmr1835573a91.0.1790804630754;
        Wed, 30 Sep 2026 14:43:50 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cbd1dsm1060539a91.16.2026.09.30.14.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:43:50 -0700 (PDT)
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
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v11 6/9] platform/x86: int3472: tps68470: use a common always-on VIO regulator init_data
Date: Wed, 30 Sep 2026 14:43:18 -0700
Message-ID: <20260930214321.600863-7-tchatard@gmail.com>
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

The surface_go and intel_nvl board data define byte-identical VIO
regulator init_data (1.8006 V, apply_uV, always_on). Replace both with a
single shared common_tps68470_vio_reg_init_data so new boards with the
same requirement can reuse it instead of duplicating the definition.

No functional change.

Assisted-by: Claude Code:claude-opus-4-8
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 .../x86/intel/int3472/tps68470_board_data.c   | 21 +++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index c53542465..c2ec802fc 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -75,8 +75,12 @@ static const struct regulator_init_data surface_go_tps68470_vcm_reg_init_data =
 	.consumer_supplies = int347a_vcm_consumer_supplies,
 };
 
-/* Ensure the always-on VIO regulator has the same voltage as VSIO */
-static const struct regulator_init_data surface_go_tps68470_vio_reg_init_data = {
+/*
+ * Common always-on VIO regulator init_data. Its voltage must match VSIO;
+ * boards using the TPS68470 I2C pass-through that need this exact setting
+ * can share this instead of defining their own.
+ */
+static const struct regulator_init_data common_tps68470_vio_reg_init_data = {
 	.constraints = {
 		.min_uV = 1800600,
 		.max_uV = 1800600,
@@ -123,7 +127,7 @@ static const struct tps68470_regulator_platform_data surface_go_tps68470_pdata =
 		[TPS68470_CORE] = &surface_go_tps68470_core_reg_init_data,
 		[TPS68470_ANA]  = &surface_go_tps68470_ana_reg_init_data,
 		[TPS68470_VCM]  = &surface_go_tps68470_vcm_reg_init_data,
-		[TPS68470_VIO] = &surface_go_tps68470_vio_reg_init_data,
+		[TPS68470_VIO] = &common_tps68470_vio_reg_init_data,
 		[TPS68470_VSIO] = &surface_go_tps68470_vsio_reg_init_data,
 		[TPS68470_AUX1] = &surface_go_tps68470_aux1_reg_init_data,
 		[TPS68470_AUX2] = &surface_go_tps68470_aux2_reg_init_data,
@@ -339,15 +343,6 @@ static const struct regulator_init_data intel_nvl_tps68470_vcm_reg_init_data = {
 	.consumer_supplies = ovti13b1_vcm_consumer_supplies,
 };
 
-/* Ensure the always-on VIO regulator has the same voltage as VSIO */
-static const struct regulator_init_data intel_nvl_tps68470_vio_reg_init_data = {
-	.constraints = {
-		.min_uV = 1800600,
-		.max_uV = 1800600,
-		.apply_uV = true,
-		.always_on = true,
-	},
-};
 static const struct regulator_init_data intel_nvl_tps68470_vsio_reg_init_data = {
 	.constraints = {
 		.min_uV = 1800600,
@@ -364,7 +359,7 @@ static const struct tps68470_regulator_platform_data intel_nvl_tps68470_pdata =
 		[TPS68470_CORE] = &intel_nvl_tps68470_core_reg_init_data,
 		[TPS68470_ANA]  = &intel_nvl_tps68470_ana_reg_init_data,
 		[TPS68470_VCM]  = &intel_nvl_tps68470_vcm_reg_init_data,
-		[TPS68470_VIO] = &intel_nvl_tps68470_vio_reg_init_data,
+		[TPS68470_VIO] = &common_tps68470_vio_reg_init_data,
 		[TPS68470_VSIO] = &intel_nvl_tps68470_vsio_reg_init_data,
 	},
 };
-- 
2.53.0

