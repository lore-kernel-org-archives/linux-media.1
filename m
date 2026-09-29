Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDB63BD63C
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 08:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670704; cv=none; b=awDKIiuBYQ65zlH5MQz21K6vSZOCeexECah/nhV2adVfXmPffneN9voElI6JoMrFkoH7Rqh1oDkxKFsnbDg/0wBY9WDqJ/5VdQSvW/AyGXbhsi7SMMnqYAhTdDZSDAdzpxf6Wh7+qcorfTj25FlCPtmoNg9pWhTpxAXceHuXmqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670704; c=relaxed/simple;
	bh=CyWNB5RJcc0/DqQz74hVbcTLsADU9lRVHC+06vINoEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kc/HKpSMK8LeSbZJoK/Ra6j6TwN/3rphqZoyQ5gqhUNTQ7361GCl/oUepZeAq49y3Na+IztlLZcg/q5JUkO+xxTAMHejjGFUCvUEbvSHqkBDF+e+zWPthk/P7cEX3pnccBuWqIpclLM5Pw93JyQHHEzQ9sjVzQ4Ic7xbnb2dp3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGv0B6HX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGv0B6HX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790670702; x=1822206702;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CyWNB5RJcc0/DqQz74hVbcTLsADU9lRVHC+06vINoEI=;
  b=oGv0B6HXlsQHUThbfdsTpOZGch87pjo5SQxq/A76roeS214D1g3LrY+R
   3yeQcenOahSrC7qloP0rcdbtLjpENvWcWHAP6T8WR1c9JZguCOH/Qy3+p
   W5gln6TYpS1Uw6M58YGY6RbVwtYBqv0DhKdA6Ku5Iugb+dF0dWXhe3Ga4
   2kU9j8bOLH4ym1ELxz1EGV6KLVXCGpDOzxneMaXMYDQwN2AuLz4RPNgqq
   8z1ByenZuDpGyGxqjqByePmJXRSm+q4vJpmWLQ0X5OzTWipsS8RE3QPkt
   CBcbXnv7GmrZLOUcL8ZyqSb9Qm7SLBtkrV7SDfa7aYuOq1ZaZGO3eqo7F
   Q==;
X-CSE-ConnectionGUID: Ti/ayOS+RA26VDt22J4AFQ==
X-CSE-MsgGUID: YKOOtPdBS8q89b6ujQdE2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101548900"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="101548900"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 01:31:42 -0700
X-CSE-ConnectionGUID: c4t9jPRhSNOnJ9T8MmxPxA==
X-CSE-MsgGUID: iRfYTJEvQMO8Ur+Ka3VfTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="275339419"
Received: from unknown (HELO pepper.iind.intel.com) ([10.223.20.54])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 01:31:41 -0700
From: Manik Bajpai <manik.bajpai@intel.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com
Subject: [PATCH v2 2/4] media: ipu6: Always run cleanup in ipu7 power on/off on timeout
Date: Tue, 29 Sep 2026 14:01:28 +0530
Message-ID: <20260929083130.88381-3-manik.bajpai@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929083130.88381-1-manik.bajpai@intel.com>
References: <arpYuzb0yJinlDyH@kekkonen.localdomain>
 <20260929083130.88381-1-manik.bajpai@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__ipu7_power_on() and __ipu7_power_off() both return early when the
pwr_status readl_poll_timeout() call times out, skipping cleanup that
was previously done only on the success path:

 - __ipu7_power_on() left the clock-ownership override bit set in
   SLEEP_LEVEL_CFG instead of clearing it, which could break
   subsequent power transitions.

 - __ipu7_power_off() skipped D2D power-down and NDE-disable, leaving
   those subsystems powered despite reporting a failure.

 - Additionally, the return value of ipu7_isys_d2d_power() in
   __ipu7_power_off() was discarded, silently masking D2D power-down
   failures.

Always run the clock-override clear / D2D-NDE teardown regardless of
whether the status poll timed out, and propagate a D2D power-down
failure through the return value when the poll itself succeeded.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Manik Bajpai <manik.bajpai@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 24 ++++++++++++--------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index 105de1744dff..06a773b5b66b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -530,16 +530,15 @@ static int __ipu7_power_on(struct device *dev,
 	ret = readl_poll_timeout(isp->base + isp->buttress.regs->pwr_status,
 				 val, (val & ctrl->pwr_sts_mask) == pwr_sts,
 				 100, BUTTRESS_POWER_TIMEOUT_US);
-	if (ret) {
+	if (ret)
 		dev_err(&isp->pdev->dev,
 			"Change power status timeout with 0x%x\n", val);
-		return ret;
-	}
 
+	/* Always drop the clock override, even if the poll above timed out. */
 	slp = readl(isp->base + IPU7_BUTTRESS_REG_SLEEP_LEVEL_CFG);
 	writel(slp & ~ovrd_clk, isp->base + IPU7_BUTTRESS_REG_SLEEP_LEVEL_CFG);
 
-	return 0;
+	return ret;
 }
 
 static int __ipu7_power_off(struct device *dev,
@@ -555,18 +554,25 @@ static int __ipu7_power_off(struct device *dev,
 	ret = readl_poll_timeout(isp->base + isp->buttress.regs->pwr_status,
 				 val, (val & ctrl->pwr_sts_mask) == pwr_sts,
 				 100, BUTTRESS_POWER_TIMEOUT_US);
-	if (ret) {
+	if (ret)
 		dev_err(&isp->pdev->dev,
 			"Change power status timeout with 0x%x\n", val);
-		return ret;
-	}
 
+	/* Always release D2D/NDE, even if the power status poll timed out. */
 	if (ctrl->subsys_id == IPU_ISYS) {
-		ipu7_isys_d2d_power(isp, false);
+		int d2d_ret;
+
+		d2d_ret = ipu7_isys_d2d_power(isp, false);
+		if (d2d_ret) {
+			dev_err(&isp->pdev->dev,
+				"D2D power down failed (%d)\n", d2d_ret);
+			if (!ret)
+				ret = d2d_ret;
+		}
 		ipu7_nde_control(isp, false);
 	}
 
-	return 0;
+	return ret;
 }
 
 static int __ipu6_power(struct device *dev,
-- 
2.53.0

