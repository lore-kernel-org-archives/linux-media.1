Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B56A374197
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 08:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204014; cv=none; b=BCFdILudV71WPaZ5w0JPi6D1kF/595OR9IuF6jrjE6TWkVKxnING5LRYoucxhcO5/5EmWIuPcmG3PwJWlsGG/r6o8IRZOZr8KsK/z5vjSmaQDGdcL8fR549iaMwU/T276mmtGXQU/WYA4wivA2CniXkCcH+Zvo7Hwv2LAvTFGKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204014; c=relaxed/simple;
	bh=zLF5hVUC1QsMPm3m0dqLh5cbzsnFAMJ8VPqoMTVgIlM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BjFLrmFTODBcVvgGfjpIMIxPObVaQN6S+gAh3Lc5AEDYcDYZ0djK8Pfd0U4FArw52KW0FgExGFWYep+v36Zuc9hfQ89Y3Yu4XXOOIB+GIAXd+25dF4TPET4DheekwlFRXrgpVhiQWMEJSH68ab30gvS4+hKoKhjvGTq5jIxYQ+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e5ycg+ML; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e5ycg+ML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782204012; x=1813740012;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zLF5hVUC1QsMPm3m0dqLh5cbzsnFAMJ8VPqoMTVgIlM=;
  b=e5ycg+MLb7hvSA6HPrqiyNzITlzlkyRPV4OCfcAY4D/BvMj46/nQw58H
   2tugXMSZbVAzrutybsQ7ru0n/tkvkeVR+NXdB/ySfsdra5AFeYb/17EWl
   q9iWqOdryx8WWXkpEkCuaV3uh1pEyHZtaEHS3j4fQQ9D44ENGOfyOHXAE
   IVFnXe6Jcpfz7n0ZnRtVcQUR8siwHFjo3jmVPyr8Cc3teL+tWUEAwn2fe
   kShoeK5OvtROlXhuwwP69M9XR/2UUp+ARr27y/1UcZ7KEmVUKqoBQoglb
   0VogOfyo/Gu1QsdsZISvPNphJVhzGdFxLNLYu7rKsgjwl8ze71ysW0Bms
   w==;
X-CSE-ConnectionGUID: slqdhtWGR8S8enyy/2L/KQ==
X-CSE-MsgGUID: +PY1QwC/Sca+jKQiH/yKhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="105734512"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="105734512"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 01:40:11 -0700
X-CSE-ConnectionGUID: y/8fyCFMTEKfRGAx+K8ucg==
X-CSE-MsgGUID: XKs88JvEQS6lIlzBysL9Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="248576735"
Received: from serinyeh-ms-7d25.itwn.intel.com ([10.225.65.16])
  by orviesa010.jf.intel.com with ESMTP; 23 Jun 2026 01:40:09 -0700
From: Serin Yeh <serin.yeh@intel.com>
To: linux-media@vger.kernel.org
Cc: serin.yeh@intel.com,
	sakari.ailus@linux.intel.com,
	jimmy.su@intel.com,
	sarang.sapre@intel.com
Subject: [PATCH v2 1/2] media: i2c: ov8856 : remove ACPI node bypass mechanism
Date: Tue, 23 Jun 2026 16:45:36 +0800
Message-Id: <20260623084536.3400318-1-serin.yeh@intel.com>
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

