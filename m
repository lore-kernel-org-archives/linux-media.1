Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11BF3CCFC4
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092389; cv=none; b=sgfEGcvVnnOkSJ7Cs+TvsOqv9SRN/ZJH+S+SzQoBxwTq03qzOpkme5SQl9DQzE/A0K4cQjv4pWDvbwXOesEAbrAGC8RUQlR9F5z9L8HqHnjMEucXFxNTK0OoIUU70XUknwZYTBFs3HrksGEeTpSQqf+MzTBhKdeHeNXKM64isYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092389; c=relaxed/simple;
	bh=/WWCKoCzEqSCfemDfLBtDRROTYpVAa85KIetBN34udE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8zjLAk7+Oi7Regeb38QE+8+UoONmcQzWuMqpSHIWKxgK7Kh4fQ0AP/3dHOH5wNX8gTduzrOwK0NPQerN1FudjWMkTQGPlEDgFXOIB+OW7wodsgTpg3VvzOCG98sII6gJsQPIV1ztSIw9BBZ7vnNh89JBFLQGDcODWXlYwCP++8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6oPgo8+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6oPgo8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092388; x=1814628388;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/WWCKoCzEqSCfemDfLBtDRROTYpVAa85KIetBN34udE=;
  b=X6oPgo8+0pkhESblWnbwEH/JsGwV6rmbqsIbcTMvd6+ZCPX6ZXZSVWC8
   aFBj2ykkV6drfQcWaaSeBVY0ryS1NrAXvWOPxwINvsm+VTTYWMn7MPExc
   9a1cMvdq1bbDERiJxo+o7NnX/hxT9qD1likjg6Fn1BRh9q9KzATvyAzUA
   GYSMTezURT8rdcnu8zSqZQ0XKfnPlYmRj30ysfHg7t1e1SjuTXCSSambe
   Uyce/bZZlyDRgaQ+hV4VjoGjQ7Tz2pRWJwduYiBFC8owehHzH174sJ22t
   NbbECOpO4lR7DkbV7GgqHZJtha8FYnVDHkG1/T80VqJubbY3FKEiR3Rg+
   w==;
X-CSE-ConnectionGUID: byOTFnrrSgm/naTfd1cIYQ==
X-CSE-MsgGUID: pYBkVMqpRYWPxOh+suzvEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396255"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396255"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:28 -0700
X-CSE-ConnectionGUID: KA9UBVwKS4unZR2wNxgGxA==
X-CSE-MsgGUID: t2Da9RYRQbKiOxN5B7UpLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799821"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:26 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 33/41] media: ipu6: Read correct SKU ID for ipu7
Date: Fri,  3 Jul 2026 18:24:43 +0300
Message-ID: <20260703152451.1743132-34-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
References: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SKU ID to buttress register map to get correct ID for both IPUs.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 2 ++
 drivers/media/pci/intel/ipu6/ipu6-buttress.h | 1 +
 drivers/media/pci/intel/ipu6/ipu6.c          | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index c1dfc4e45424..582b63d6a9be 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -75,6 +75,7 @@ static const struct ipu6_buttress_registers ipu6_buttress_regs = {
 	.db0_out	= BUTTRESS_REG_IU2CSEDB0,
 	.data0_in	= BUTTRESS_REG_CSE2IUDATA0,
 	.data0_out	= BUTTRESS_REG_IU2CSEDATA0,
+	.sku_id		= BUTTRESS_REG_SKU,
 
 	/* Bitmasks */
 	.irq_is		= BUTTRESS_ISR_IS_IRQ,
@@ -105,6 +106,7 @@ static const struct ipu6_buttress_registers ipu7_buttress_regs = {
 	.db0_out	= IPU7_BUTTRESS_REG_IU2CSEDB0,
 	.data0_in	= IPU7_BUTTRESS_REG_CSE2IUDATA0,
 	.data0_out	= IPU7_BUTTRESS_REG_IU2CSEDATA0,
+	.sku_id		= IPU7_BUTTRESS_REG_SKU,
 
 	/* Bitmasks */
 	.irq_is		= IPU7_BUTTRESS_IRQ_IS_IRQ,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
index 6691d511c97b..419cf1380fc7 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
@@ -55,6 +55,7 @@ struct ipu6_buttress_registers {
 	u32 db0_out;
 	u32 data0_in;
 	u32 data0_out;
+	u32 sku_id;
 
 	/* Bitmasks */
 	u32 irq_is;
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 0c2c09a1c981..81664b777bef 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -566,7 +566,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* Configure the arbitration mechanisms for VC requests */
 	ipu6_configure_vc_mechanism(isp);
 
-	val = readl(isp->base + BUTTRESS_REG_SKU);
+	val = readl(isp->base + isp->buttress.regs->sku_id);
 	sku_id = FIELD_GET(GENMASK(6, 4), val);
 	version = FIELD_GET(GENMASK(3, 0), val);
 	dev_info(dev, "IPU%u-v%u[%x]\n", version, sku_id, pdev->device);
-- 
2.54.0

