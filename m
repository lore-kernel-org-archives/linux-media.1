Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA0F3C0A17
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 09:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171103; cv=none; b=ZNvcRnDg5YIC1QvDUeTS/mZ/8YubMK6i9SkUGBx9ziIK2PbgD2jw8jUcRsS0lmNExYSckyuXSleHN9Ruzbbhhe4fIEgLraPvOpqSVtsA05D8Reug4RghXwyaduutinFxqh45DZf7Lo0KN7lktcomqxIRkf0bmOJ4TZukxlWqA04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171103; c=relaxed/simple;
	bh=zLF5hVUC1QsMPm3m0dqLh5cbzsnFAMJ8VPqoMTVgIlM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SGJHhlgDMsi4dTSmVKHRphOrfQIyWtJdJFNJ4r/KWToSADRLiGhGAdhVO8OaI9mYAwosbOifDWg3DWly+CA0Od2rJ4+0/PPwBAHEJb/O73r1BWeWvA0rlERGKKoAGdGsluw25LA012LaTzwx7mEGX4pjminxNmqywt5pTJffpMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEmC1a5a; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEmC1a5a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781171087; x=1812707087;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zLF5hVUC1QsMPm3m0dqLh5cbzsnFAMJ8VPqoMTVgIlM=;
  b=EEmC1a5am0ANzxF8UOAUX5ymxwW1aTqRuhHCWnZMTTyi9eSjcktKz3/z
   LSSRcACQYZydag0oDz+bvL4YWdhZpfm1+n0LSRMjUwOtOy7SxBmZP459H
   AF1lGflGv/8JVrjnLLJdIMLacc9x7xKd2PVxtFIEDCXk7JsGHCbYxQNSl
   xBLHRa3zO70zcymtsBnZF8Yz3fxDOi18GvPQaUiNenRoBFju2i8I8oqTa
   EaK3ay76GkxrtiEQ1KP7SJUMF9QC9WzoxuHTYYiKPxItc8qXv7AtK6DMu
   DneX/y39eEC4lHk4aKnPo7M61lMuhJQ6HXLNaxMcLMoGgv263i+Sy5Y0N
   w==;
X-CSE-ConnectionGUID: IhygxBv/TSuqS3cJC7g/Jg==
X-CSE-MsgGUID: er8KhVFKTyekN/7SMz6+Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82041167"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="82041167"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 02:44:46 -0700
X-CSE-ConnectionGUID: OBzU1nrUT+WtZ1bcSmhyHA==
X-CSE-MsgGUID: U+nbq0krTPyLS80/8QoloQ==
X-ExtLoop1: 1
Received: from serinyeh-ms-7d25.itwn.intel.com ([10.225.65.16])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jun 2026 02:44:44 -0700
From: Serin Yeh <serin.yeh@intel.com>
To: linux-media@vger.kernel.org
Cc: serin.yeh@intel.com,
	sakari.ailus@linux.intel.com,
	jimmy.su@intel.com,
	sarang.sapre@intel.com
Subject: [PATCH v1 1/2] media: i2c: ov8856 : remove ACPI node bypass mechanism
Date: Thu, 11 Jun 2026 17:50:31 +0800
Message-Id: <20260611095031.2664939-1-serin.yeh@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver currently skips power-on and power-off sequences when
running with ACPI devices by checking is_acpi_node(). This results in
all power configuration steps (GPIO, and regulators) being bypassed.

Remove the is_acpi_node() checks to ensure that the full power
sequence is always executed regardless of the firmware interface.
Also fix a debug message to report the actual number of CSI data lanes
from the parsed bus configuration instead of cur_mode.

With these changes, the driver behaves consistently across DT and ACPI
platforms and ensures correct hardware initialization.

Signed-off-by: Serin Yeh <serin.yeh@intel.com>
---
 drivers/media/i2c/ov8856.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 8bedb47cd7cf..9d2b0469a576 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -2082,9 +2082,6 @@ static int ov8856_power_on(struct device *dev)
 	struct ov8856 *ov8856 = to_ov8856(sd);
 	int ret;
 
-	if (is_acpi_node(dev_fwnode(dev)))
-		return 0;
-
 	ret = clk_prepare_enable(ov8856->xvclk);
 	if (ret < 0) {
 		dev_err(dev, "failed to enable xvclk\n");
@@ -2120,9 +2117,6 @@ static int ov8856_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov8856 *ov8856 = to_ov8856(sd);
 
-	if (is_acpi_node(dev_fwnode(dev)))
-		return 0;
-
 	gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(ov8856_supply_names),
 			       ov8856->supplies);
@@ -2293,21 +2287,18 @@ static int ov8856_get_hwcfg(struct ov8856 *ov8856)
 		dev_warn(dev, "external clock rate %u is unsupported",
 			 xvclk_rate);
 
-	if (!is_acpi_node(fwnode)) {
-		ov8856->reset_gpio = devm_gpiod_get_optional(dev, "reset",
-							     GPIOD_OUT_LOW);
-		if (IS_ERR(ov8856->reset_gpio))
-			return PTR_ERR(ov8856->reset_gpio);
+	ov8856->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						     GPIOD_OUT_LOW);
+	if (IS_ERR(ov8856->reset_gpio))
+		return PTR_ERR(ov8856->reset_gpio);
 
-		for (i = 0; i < ARRAY_SIZE(ov8856_supply_names); i++)
-			ov8856->supplies[i].supply = ov8856_supply_names[i];
+	for (i = 0; i < ARRAY_SIZE(ov8856_supply_names); i++)
+		ov8856->supplies[i].supply = ov8856_supply_names[i];
 
-		ret = devm_regulator_bulk_get(dev,
-					      ARRAY_SIZE(ov8856_supply_names),
-					      ov8856->supplies);
-		if (ret)
-			return ret;
-	}
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ov8856_supply_names),
+				      ov8856->supplies);
+	if (ret)
+		return ret;
 
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
-- 
2.25.1

