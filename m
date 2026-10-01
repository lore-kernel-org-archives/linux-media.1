Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E4551D520
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 12:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858762; cv=none; b=Pe4mcaA8V+mVXW6ArVnOjobXk0LMamHmkId76hOZEhhLK5S8ZuSqRxuwa7GQG288gjkNB/LREDGZ5DYG3v8wqx56Wi7wx/3Fe+gRK05unytd/bksRehOy42QqGFpEPfaoVgPsz6nwylg7Linu9nXy4hVIJPhcZsy/SfYOy2xJTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858762; c=relaxed/simple;
	bh=0XHYf44rzcE8v6tV6VzEZ/nN8sOvpw8PXSVt8nKEcVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HlmInLSprou7JoZ5DikSLL5e0pkPagMMjP/Czj4j23n8sxHdVVqWhukOUz5zfr+JqTWxFSaCe1mcdVBRGn+hZX+P5o4dg4w50LFY3B2Pyu0SbDm8QAMDwRwAQ5LAD7Jzph0dqJz3Y6EuDmVZ9cxM8CKo6lvSg7fKH2tEINHpJak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XqQVAA5v; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XqQVAA5v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790858761; x=1822394761;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0XHYf44rzcE8v6tV6VzEZ/nN8sOvpw8PXSVt8nKEcVc=;
  b=XqQVAA5vWijfFispsWWfwgxyGoW+FMSXPk1xrCpR7xypfm+Djm6KD1E/
   i9hwY436GDGf8YlmmGWF9R/tJuYIwPEfasL/+5lxGTkzBXmku+8HyE5UB
   QjF6FdGoIipsmwhZnNq6v91XnM4A3+UEaMnXIOz2aoGrhY4AHJz3tszr2
   wzFznnwe6KGqF0qGqcCFIP39hz3FerlhH6bkPhoKwKQxVxc3Rx9QW4plq
   pYnys3Bb1kthjejSi1BSjp7j25/eHFkHaKN0JD6E1TPOtOIXY+rEWCai7
   xMIH628DOfu9xUwMGv9rVdEauhXCbFzmX9ml6PejYS4M2r7jhYwJB9vis
   g==;
X-CSE-ConnectionGUID: gMlcyUSfSiqVdlusG/GQzQ==
X-CSE-MsgGUID: pGbtN0q1RpiWtQnHCRQwkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="101774569"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="101774569"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 05:46:00 -0700
X-CSE-ConnectionGUID: ATIak1K+R46WHs+g960QRg==
X-CSE-MsgGUID: elaCaD8MRdKJ//h453Dp5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="313934936"
Received: from cooperst-gp119.amr.corp.intel.com (HELO alaakso-desk.intel.com) ([10.125.111.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 05:45:59 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com,
	divyamani.tripathi@intel.com
Cc: manik.bajpai@intel.com
Subject: [PATCH 6/7] media: ipu6: Add the ipu7 psys buttress support
Date: Thu,  1 Oct 2026 15:45:39 +0300
Message-ID: <20261001124540.2129309-7-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001124540.2129309-1-antti.laakso@linux.intel.com>
References: <20261001124540.2129309-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add buttress psys helpers, needed by ipu7 psys driver.

Assisted-by: LLM
Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c  | 22 +++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-buttress.h  |  2 ++
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |  4 ++++
 .../media/pci/intel/ipu6/ipu7-platform-regs.h | 12 ++++++++++
 4 files changed, 40 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index 00d504647c29..f1d236054cf7 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -1055,6 +1055,28 @@ u32 ipu7_buttress_get_isys_freq(struct ipu6_device *isp)
 }
 EXPORT_SYMBOL_NS_GPL(ipu7_buttress_get_isys_freq, "INTEL_IPU6");
 
+/* trigger uc control to wakeup fw */
+void ipu7_buttress_wakeup_psys(const struct ipu6_device *isp)
+{
+	u32 val;
+
+	val = readl(isp->base + IPU7_BUTTRESS_REG_PSYS_UCX_CTRL_STATUS);
+	val |= IPU7_UCX_CTL_WAKEUP;
+	writel(val, isp->base + IPU7_BUTTRESS_REG_PSYS_UCX_CTRL_STATUS);
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_buttress_wakeup_psys, "INTEL_IPU6");
+
+u32 ipu7_buttress_get_psys_freq(struct ipu6_device *isp)
+{
+	u32 val;
+
+	val = readl(isp->base + IPU7_BUTTRESS_REG_PS_WORKPOINT_REQ);
+	val &= IPU7_BUTTRESS_PS_FREQ_CTL_RATIO_MASK;
+
+	return val * IPU7_BUTTRESS_PS_FREQ_RATIO_STEP;
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_buttress_get_psys_freq, "INTEL_IPU6");
+
 static const struct x86_cpu_id ipu7_misc_cfg_exclusion[] = {
 	X86_MATCH_VFM_STEPS(INTEL_PANTHERLAKE_L, 0x1, 0x1, 0),
 	{},
diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
index 79d8f5893686..39c2951c5370 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
@@ -108,4 +108,6 @@ void ipu6_buttress_csi_port_config(struct ipu6_device *isp,
 void ipu6_buttress_restore(struct ipu6_device *isp);
 void ipu7_buttress_wakeup_isys(const struct ipu6_device *isp);
 u32 ipu7_buttress_get_isys_freq(struct ipu6_device *isp);
+void ipu7_buttress_wakeup_psys(const struct ipu6_device *isp);
+u32 ipu7_buttress_get_psys_freq(struct ipu6_device *isp);
 #endif /* IPU6_BUTTRESS_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
index 04d196c49c60..4c4ca95c7d54 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
@@ -237,6 +237,8 @@ enum {
 #define IPU7_BUTTRESS_REG_PB_TIMESTAMP_VALID	0x2038
 #define IPU7_BUTTRESS_REG_IS_WORKPOINT_REQ	0x2104
 #define IPU7_BUTTRESS_REG_PS_WORKPOINT_REQ	0x2100
+#define IPU7_BUTTRESS_REG_PS_WORKPOINT_DOMAIN_REQ	0x2108
+#define IPU7_BUTTRESS_REG_PS_DOMAINS_STATUS	0x2110
 #define IPU7_BUTTRESS_REG_IDLE_WDT		0x218c
 #define IPU7_BUTTRESS_REG_ISYS_UCX_CTRL_STATUS	0x2200
 #define IPU7_BUTTRESS_REG_ISYS_UCX_START_ADDR	0x2204
@@ -280,6 +282,8 @@ enum {
 #define IPU7_FREQ_CTL_CDYN			0x80
 #define IPU7_FREQ_CTL_CDYN_SHIFT		8
 #define IPU7_BUTTRESS_IS_FREQ_CTL_RATIO_MASK	GENMASK(7, 0)
+#define IPU7_BUTTRESS_PS_FREQ_CTL_RATIO_MASK	GENMASK(7, 0)
+#define IPU7_BUTTRESS_PS_FREQ_RATIO_STEP	25U
 #define IPU7_IS_FREQ_CTL_DEFAULT_RATIO		0x1b
 #define IPU7_PS_FREQ_CTL_DEFAULT_RATIO		0x14
 /* IS: 400MHz, PS: 400MHz */
diff --git a/drivers/media/pci/intel/ipu6/ipu7-platform-regs.h b/drivers/media/pci/intel/ipu6/ipu7-platform-regs.h
index 39cd5c0890e5..3493e0efe24d 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-platform-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu7-platform-regs.h
@@ -4,6 +4,8 @@
 #ifndef IPU7_PLATFORM_REGS_H
 #define IPU7_PLATFORM_REGS_H
 
+#include <linux/bits.h>
+
 #define IPU7_IS_UC_CTRL_BASE                   0x230000
 #define IPU7_ISYS_DMEM_OFFSET                  0x200000
 #define IPU7_PS_UC_CTRL_BASE                   0x130000
@@ -29,4 +31,14 @@
 #define IPU7_TO_SW_IRQ_FW			BIT(0)
 #define IPU7_REG_PRINTF_AXI_CNTL		0x301c
 
+/* psys subdomain power request positions in PS_WORKPOINT_DOMAIN_REQ */
+enum ipu7_psys_subdomain_pos {
+	IPU7_PSYS_SUBDOMAIN_LB		= 0,
+	IPU7_PSYS_SUBDOMAIN_BB		= 1,
+};
+
+#define IPU7_PSYS_DOMAIN_POWER_MASK		(BIT(IPU7_PSYS_SUBDOMAIN_LB) | \
+						 BIT(IPU7_PSYS_SUBDOMAIN_BB))
+#define IPU7_PSYS_DOMAIN_POWER_IN_PROGRESS	BIT(31)
+
 #endif
-- 
2.55.0

