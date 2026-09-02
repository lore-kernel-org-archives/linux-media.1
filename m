Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC134A5C41
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 14:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360848; cv=none; b=G+17iphQ3QNfNfoAOcebHpxAsjYfW0Gf4IryxaLlHkIsbuNzdKJyxQXoWNZ/G0gT9EFHpZfG+mSE4G08rxJ7q8wzq0OSAFQQ+K8+yiEEryV7YonOD8cYKcjcmUk9VPgWHmEfx7kSMlY7dIbW0lbUBG8GSzJJFw/DVybnNVfm0h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360848; c=relaxed/simple;
	bh=zMz6YudLMNRyvt1tJOUeINHtau4Y9OLX8SPtgDvi43k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rrFysXBOKxq7kfb0G6/oQXP+2JsP9BwvAHR3gsIKcSyITDMFTrfC3WNjKwV7j0iwM7mdRS3Pp3lWPr72WKBqnyqlTj6Y1juxFohP6dSjlqZRtMWxjOSY4cqgS796s3qdTc0ZePHu6PuVRiEpKOC+BwnvMUU3wUSHnKRF02WZAto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+K4zmnP; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+K4zmnP"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48436216a98so766819f8f.0
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 07:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360842; x=1788965642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBHgyyi12Pg5PI+CSb0AvNcQMuxkHJiS6M4/J+uLYMc=;
        b=W+K4zmnPc3dOJnxrKmMJ2Uj696MymC1q+s/G9dvtenar2TqQ8SLdeQ8cI3a9R/PC+1
         U3UPh/IJhFX0DDxwyHZ1Ez8WQNW3kxicdFm6RVuevwNFVQFM1G/zlXYO2z1FR15Iyjfj
         pDm4Sl9bH+DMaIGZYnkbR3mcqSOAuz2iJZbJMtKYhMroLT5e5kWcMUBvgwlUX9oDPqRd
         Imvof7vT0W4L0JeHvVD2xHkK8gFOb247c0yzAKPkrzbLrFJ9Gx5ibGUlPkRLkt/ugT82
         b/1FBtaDJDJbDy6b4SJO6J5QJCYzmCYYDeGB9Yuxtuej0hAPHUic4y956XKIG9ykaWU2
         s4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360842; x=1788965642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DBHgyyi12Pg5PI+CSb0AvNcQMuxkHJiS6M4/J+uLYMc=;
        b=bZqt1zFnmkLTjzm8/jPYFCb3FMGuhAceiW9F0LSJqTy/9VEcP1H3WJNAIr/51DRd8M
         YXca5wRVR0WEm3Qc6PxjVeZpTF9Zk/RhtG/nfeYPcpWNl7v488xNPHC0B67i9IjB4Vka
         M4bd7Dt6XAaM88s5koRBoYr0/q/2y2Nh/t/lplkCIiSeH9DNgk5NGxnCkuGTRFZB3exO
         wF63hCvc2wsF0icv5hpfbmKzaq17ZWV1d74cXAGoVQx99vXlEGslLSuHvGwniBStw2bN
         0uOn9txxXbJilStUu87g5AYztSCaGlGGzBjwLbt4Gq5FGgRs3eJSM7sk2CqedDqykWmd
         7cbg==
X-Forwarded-Encrypted: i=1; AKwUvBxxSBtksrVKyN32atpnbff0PN15pugkugD71H2chb2fNWQ06mlkKkVsFptBliuLyJZnf0QNaimEQDXlcg==@vger.kernel.org
X-Gm-Message-State: AFuF++ktWRjfXs5UvMj4/G6o267TnJBXgBdimz99V+z2uxNAp2/e/MJZ
	dCNSBsohvzzbp+thxuFoNDQdXE6M82oiOtji0W17Lj/urqKXx316cwPEvK/pTqZiaOt4Lg==
X-Gm-Gg: AYBFou0YKP/R813fRUzFgXQtd+j7XgFD3SvvNFAy8CoAuOTRXaHZpaVUdWsSOIxZr0C
	Cp2oPAaAV89TYvZFvmz46lxaGrLj4WhpQkga6hevnpur5gUD56lWR4guvxMnnf67zSTpcAFuXbT
	/3tSUAwAqJFtbiq4jDLAXzLnAgtxLaB7ZcHk/Jsya66I2yY0Qkcz8mEkrFngawU2iHHU3g+REmQ
	3oAPlV94W5H7HIPyS8Im9bR+cyrwRvNLoIPqQlZQMqMBGvfKfXz21SiHlqjH23vjJo1HKJIDqZU
	INrr5jrrGuLU3Wpef1SAs7Zw3dWcZq1lnGixMIUVWY3INijhte+3Ko1ZANrEguCswOT713rUxbV
	EIJ3v7k4GKC1OGQDS1JQGyUDQd3ZlkDurPt3dLEDGIMy9u/4Wm9SpWW1akdcypZKCODLc3SLEij
	lZOc3kC13O8EoyA383JbsaGLtEvWYLnlEtAh7Zfgn0zr255OchceAqy9uKuYgreorNl5zF7h4UK
	tigDcF6zQTw/yUqZOhj6M4z1L/APAolaFAchSmtnxfa+sWIbweFvHE=
X-Received: by 2002:a05:6000:4819:b0:484:4537:95ed with SMTP id ffacd0b85a97d-48488efe633mr10448603f8f.5.1788360842124;
        Wed, 02 Sep 2026 07:54:02 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:01 -0700 (PDT)
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
Subject: [PATCH v7 07/16] media: atomisp: Add Yoga Book camera configuration
Date: Wed,  2 Sep 2026 16:53:36 +0200
Message-ID: <3aa1bfa59816f3fab70801434659bdc2885ba4a1.1788360629.git.mauriziocasciano7@gmail.com>
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

The Yoga Book YB1-X91 firmware lacks usable AtomISP configuration for
both cameras. Rear INT3477 OV8858 uses four CSI-2 lanes and a WV517S
actuator, while the front OVTI2740 firmware reports the wrong lane
count.

Add the rear sensor configuration and a DMI-scoped two-lane override
for OVTI2740:00. Add the front sensor configuration separately once
its link frequency can be supplied at the same time.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d71a5..56da454f0d9e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -74,6 +74,12 @@ static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
 	{}
 };
 
+static struct gmin_cfg_var lenovo_yogabook_x91_vars[] = {
+	/* The vendor driver and sensor modes use two CSI data lanes. */
+	{ "OVTI2740:00", "CsiLanes", "2" },
+	{}
+};
+
 static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 	/* _DSM contains the wrong CsiPort for the front facing OV5693 sensor */
 	{ "INT33BE:00", "CsiPort", "0" },
@@ -83,6 +89,14 @@ static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 };
 
 static const struct dmi_system_id gmin_cfg_dmi_overrides[] = {
+	{
+		/* Lenovo Yoga Book X91L */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91L"),
+		},
+		.driver_data = lenovo_yogabook_x91_vars,
+	},
 	{
 		/* Lenovo Ideapad Miix 310 */
 		.matches = {
@@ -359,7 +373,10 @@ static const struct acpi_device_id atomisp_sensor_configs[] = {
 	 * the sensor fails to start streaming when instantiating
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
-	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
+	/* OV5693 */
+	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),
+	/* OV8858 */
+	ATOMISP_SENSOR_CONFIG("INT3477", 4, true),
 	{}
 };
 
-- 
2.53.0

