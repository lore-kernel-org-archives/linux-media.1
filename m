Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6548451D50B
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 12:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858758; cv=none; b=LDa0AyLpSZNa0gtAMPUVAew+4IRBD466PVjtC2LpPa0hubuJ2Vr3I2/NTrnVotVLizS9ezd8Irzh9tT9RcoOQeOMnhtvVEvZebjn4vIODRbhBeaLnYqmqW292XQzY+5lt+i0M8Wgt364qkGE0YT1tDwGHo7F/dAoxyp8C92aZqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858758; c=relaxed/simple;
	bh=RGIm7oFUoluXls8FIrHrPamFlfCsgFxST2LKMgHDzPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DDbiVWPsY3prydpFn1HRW+YehHg5xDMSNyE+8pQnfzPW1owY9VNk1ZDSEhKGXTkpq2618wH9Kb9C7SXv+s804DPwhrjtmOIaj53fdJDgiYlVFSJFZzvfpnSXIRsvNg63zcLJLKRg2tPdd1Hj/oV02rs8oLdZ1TzUH4Ige1T9sSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YUzjON9o; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YUzjON9o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790858757; x=1822394757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RGIm7oFUoluXls8FIrHrPamFlfCsgFxST2LKMgHDzPc=;
  b=YUzjON9ov9dIZ7Phc5g7LoTZARPJO7XTVQK79rJiLdamcMPeBVH7IpLm
   T23+/Wo5/EzEQ2tV8zryvA/9yEtJR+09Zhlho4HFSaS9vBxQ64g07H8ui
   Rq5Zy0XNQvX414tGU0pFM32GuLAT3USAp08jzps0zq1U6plFGKH5WAQQb
   MPk20xfS9rnrF9wv78Eb3yZpGSKPPtCkXou9EZAOl+mM2KxggGEqexIx/
   zl4/Da4PsmBK02LKfKy3gt/n7OdDEExad3rP1IEyysKnMg5wVIj0Igjue
   u5d450dDo2HGjHCFpl6PKiGfMHaLBTGwhM3GC9MQ01djp1OB6sLozTPfH
   Q==;
X-CSE-ConnectionGUID: 39Xw9JjdSZWdia5XGZzexQ==
X-CSE-MsgGUID: a6jSbGfIQVGc8cdR8pVCfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="101774561"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="101774561"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 05:45:57 -0700
X-CSE-ConnectionGUID: /lQvXZOQQVeKWqigGFeiIg==
X-CSE-MsgGUID: o/fXuITtSDi8BQujj0N6wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="313934912"
Received: from cooperst-gp119.amr.corp.intel.com (HELO alaakso-desk.intel.com) ([10.125.111.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 05:45:56 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com,
	divyamani.tripathi@intel.com
Cc: manik.bajpai@intel.com
Subject: [PATCH 4/7] media: ipu6: Make ipu7 fw config subsystem agnostic
Date: Thu,  1 Oct 2026 15:45:37 +0300
Message-ID: <20261001124540.2129309-5-antti.laakso@linux.intel.com>
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

The fw_config holds the subsystem configuration blob handed to the
firmware at boot. Make it subsystem agnostic by using void pointer.
No functional change.

Assisted-by: LLM
Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu7-fw-com.h  | 2 +-
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-com.h b/drivers/media/pci/intel/ipu6/ipu7-fw-com.h
index 097eaab99547..a98f476a8be1 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-com.h
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-com.h
@@ -25,7 +25,7 @@ struct ipu7_fw_com_context {
 	dma_addr_t boot_config_dma_addr;
 	u32 boot_config_size;
 	u32 fw_entry;
-	struct ipu7_insys_config *fw_config;
+	void *fw_config;
 	dma_addr_t fw_config_dma_addr;
 };
 
diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
index b22a01cf6f1b..00780dfa4912 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
@@ -28,8 +28,8 @@ static void ipu7_fw_isys_cleanup(struct ipu6_isys *isys)
 	ipu6_ipu7_release_boot_config(adev, fwctx);
 
 	if (fwctx->fw_config) {
-		ipu6_dma_free(adev, sizeof(*fwctx->fw_config), fwctx->fw_config,
-			      fwctx->fw_config_dma_addr, 0);
+		ipu6_dma_free(adev, sizeof(struct ipu7_insys_config),
+			      fwctx->fw_config, fwctx->fw_config_dma_addr, 0);
 		fwctx->fw_config = NULL;
 		fwctx->fw_config_dma_addr = 0;
 	}
-- 
2.55.0

