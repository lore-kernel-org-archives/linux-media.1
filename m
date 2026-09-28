Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F1C4B7A50
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 11:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596628; cv=none; b=XVMINz+P/SqCaonOOw1SmYxLfmss7Hvx2a96NRV1U3dybyS2dyG2LEMH6SzbQd5f7R/YtHnD77+Xgqf2/qaHs0yvhB6HIExllzI4Ff4R7hD3WmuIF25ZH3N35vBJcwWea570eUUrrlW32LLTzGquzzorppA5yNIWmrkVZGVKN4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596628; c=relaxed/simple;
	bh=CyWNB5RJcc0/DqQz74hVbcTLsADU9lRVHC+06vINoEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OuCilTPSLlSeeuNWB+K+iPIBF2zqPSyQvIGIK1L94QwxA+r3ITTIk14p7bkKnFFm/K4zuL6TZ+npfYIhVlnai8upzfwp3P5c+f69a/S0D1OVzKEtm0DLpmtWVRTKIntWNSC0csmI/qAHUZeVcz8o89PDCOlHVA4zG+En9itNC7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YIWr6tsv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YIWr6tsv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790596626; x=1822132626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CyWNB5RJcc0/DqQz74hVbcTLsADU9lRVHC+06vINoEI=;
  b=YIWr6tsvXN32XU5rBTDThbE4V5QC4nVgiF7KjcPALJP8fnvn/5EACKZN
   lrTDjFzYXvofr2M2rMWI/EZvyhMx3Z2aeOLpn+BNkK5lfEHyqoLmrG5U4
   i/8ZWDzfp+dUH0vKd4bVXFJdNecTAb4eJT8DyZWkDLpXJBzlftvbTsxrX
   EqDEi0BghrEN4abF9rRlXguA7TQkYvvIWLE6+JwYAgU60qD5F0Hx4jLE1
   71bgBqqavI56EZkxGmUERoe8uQqsxE1lCUTFoQafiCnRtYdf5fxgCqaR+
   XAz8sE0TYFNqHmsRu7+vf+rty1KkJWKul9aYemiEFJG/8o5QWzfgKrzLN
   A==;
X-CSE-ConnectionGUID: mMvfuAjQTgG5XusvV/5epA==
X-CSE-MsgGUID: pReuLkw4TuKytVByaRBAiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90059370"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="90059370"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 04:56:59 -0700
X-CSE-ConnectionGUID: M24HqI0gR2qFxELBuVyGLg==
X-CSE-MsgGUID: 4RvrbxrARhiJDUOFUCFFkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="302981368"
Received: from unknown (HELO pepper.iind.intel.com) ([10.223.20.54])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 04:56:57 -0700
From: Manik Bajpai <manik.bajpai@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com
Subject: [PATCH v1 2/4] media: ipu6: Always run cleanup in ipu7 power on/off on timeout
Date: Mon, 28 Sep 2026 17:26:44 +0530
Message-ID: <20260928115646.77399-3-manik.bajpai@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928115646.77399-1-manik.bajpai@intel.com>
References: <20260928115646.77399-1-manik.bajpai@intel.com>
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

