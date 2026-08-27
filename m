Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F0C257827
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834107; cv=none; b=LoOtdAEdhmnQUm2EYFC6ADTgTch5T/zJK238QUC2FlPVpJTfe50Lb7+nI0BvqLI/8vFZqvCjOrLoFETIDGO3mIqYUVjoG9DLUtbAmoC9H5VMrLUB4AIOGfDGWaUxGDEvryr5Cbj0fkSEPtPRXQJS678nNqau6666SzXIvStpbZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834107; c=relaxed/simple;
	bh=hAZrmsuXg2rDm+SGtX3NQVcFt2nhJfqXLIUqn1TxM3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N84BLO09ZD+75zWNLwy/b5BMcZFgXslxksbAfdK9FNtvvEyIzSRh9CVlav889sS9HNPFnPqEBVf5Us8zosb0COLVwLfQ6agwHrr96XElAFFYWhWsZxnsg91jEIFL8K3KTWRq12pWzUhJCBYnsgZ0X1tZufeNUAve63nN/61DgzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ge74sn/1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ge74sn/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834104; x=1819370104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hAZrmsuXg2rDm+SGtX3NQVcFt2nhJfqXLIUqn1TxM3Y=;
  b=ge74sn/1f6hTk0wCV2OiUaHpaVjXTykpoqP93iuQmCZCCW4MSZ9bePAU
   +0tvR58DWbjZrW21zuCcpZbPQ7PEqbgqc2m2H7F0zEcOtcsxyCbKQfA5u
   YhuYxVQPe4jGk+uoTM/i1O8065Fv1iM6fe55GPoHxv+5+Fcln7QzIE4YD
   7lLDyrt2M+BEb64C/nKPZ25LNPZxEU14wLiu+d2aTS8ItniZ8K1wn4ZiA
   TvfDWUKllUU7bFGYmEDFCxPUZDZ/g3f8viHnMl7l1ZR7WgQzpr3jd6gws
   ZeaTp25Kvl+kCDwW7Aq9aUYAtpF771GxJqgsq96T15tyDsjvWWPSHG8qr
   g==;
X-CSE-ConnectionGUID: U7LgCZPwQHKlcRHikoqLeA==
X-CSE-MsgGUID: 7zRaBIE6Rm+HJDNxYU3z8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188667"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188667"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:35:03 -0700
X-CSE-ConnectionGUID: azMXkS+kSXerJs8eCJ3wLA==
X-CSE-MsgGUID: EVV3wI0SR2GkFLU3ep0CFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384588"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:35:02 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 37/44] media: ipu6: Add support for fixed iova region
Date: Thu, 27 Aug 2026 15:33:29 +0300
Message-ID: <20260827123336.2219048-38-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827123336.2219048-1-antti.laakso@linux.intel.com>
References: <20260827123336.2219048-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ipu7 need specific region for firmware in non-secure mode,
add support for it.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-dma.c | 20 +++++++++++++++++---
 drivers/media/pci/intel/ipu6/ipu6-dma.h |  2 ++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
index 6e8295d9c3a3..90f530a93779 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
@@ -371,6 +371,17 @@ void ipu6_dma_unmap_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
 }
 EXPORT_SYMBOL_NS_GPL(ipu6_dma_unmap_sg, "INTEL_IPU6");
 
+static struct iova *ipu7_get_fw_code_region(struct ipu6_bus_device *sys)
+{
+	struct ipu6_mmu *mmu = sys->mmu;
+	unsigned long lo, hi;
+
+	lo = iova_pfn(&mmu->dmap->iovad, IPU7_FW_CODE_REGION_START);
+	hi = iova_pfn(&mmu->dmap->iovad, IPU7_FW_CODE_REGION_END) - 1U;
+
+	return reserve_iova(&mmu->dmap->iovad, lo, hi);
+}
+
 int ipu6_dma_map_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
 		    int nents, enum dma_data_direction dir,
 		    unsigned long attrs)
@@ -397,10 +408,13 @@ int ipu6_dma_map_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
 	dev_dbg(dev, "dmamap trying to map %d ents %zu pages\n",
 		nents, npages);
 
-	iova = alloc_iova(&mmu->dmap->iovad, npages,
-			  PHYS_PFN(mmu->dmap->mmu_info->aperture_end), 0);
+	if (attrs & DMA_ATTR_RESERVE_REGION)
+		iova = ipu7_get_fw_code_region(sys);
+	else
+		iova = alloc_iova(&mmu->dmap->iovad, npages,
+				  PHYS_PFN(mmu->dmap->mmu_info->aperture_end), 0);
 	if (!iova)
-		return 0;
+		return -ENOMEM;
 
 	dev_dbg(dev, "dmamap: iova low pfn %lu, high pfn %lu\n", iova->pfn_lo,
 		iova->pfn_hi);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.h b/drivers/media/pci/intel/ipu6/ipu6-dma.h
index ae9b9a5df57f..e5e0e7860423 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.h
@@ -10,6 +10,8 @@
 
 #include "ipu6-bus.h"
 
+#define DMA_ATTR_RESERVE_REGION		BIT(31)
+
 struct ipu6_mmu_info;
 
 struct ipu6_dma_mapping {
-- 
2.55.0

