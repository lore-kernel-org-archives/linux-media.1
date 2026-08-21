Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696AE3914E8
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312704; cv=none; b=dRMELOixL2KiV7O6ioJBzbzJa5Yi5CusnAdyTNcbQtWfAdVsrUDCiHCYTZr4BPIm+/IFbx/w+Rg0LPBPEdtHvPX6zn1TlCzisEeDChrwYRbd/x/yHcGg1AUB7zOEX+zAufzuGCiftwauoaBs4FpWI5S7N2mEb2meqswJ0BLlfbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312704; c=relaxed/simple;
	bh=hAZrmsuXg2rDm+SGtX3NQVcFt2nhJfqXLIUqn1TxM3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fcFO0RzDOcvE3O7df6TuFq4uwdGLm7xK6pI8MIHVqwb0asMvCmHseeGqHjIuFTWIz7q7ET/9N41bzUNoncYkSDnBp1UVN+YlYZ/XWud3zG5xaCHqwTxqD+eVeCz0nVU6PZnYC3Mclq+VdbWGGXZsoWm8owT6/9XSDf0Kf7hgrH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWz86n6S; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWz86n6S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312703; x=1818848703;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hAZrmsuXg2rDm+SGtX3NQVcFt2nhJfqXLIUqn1TxM3Y=;
  b=EWz86n6S+bQuwDGmugAaFMd6Jhn9tANPojyW3I168GK0i/FTi1Rc2CiK
   r9LjyI2Vz64tvxvWK3w+Jo0JfWrOtGtW/i8dWun008UIGosUj0nhvWSsp
   RxmNGXCzp5aNZ7MrTw4ACjcfiZsi/hIN9xvffsxLKTrvF1kIiSpfWmhqw
   aPZRnJ3GIvkQ5mnJe9ogideXWhMA8dP6vJOyLW52tvg16RnjBQ2M4MQaO
   RbL2D1lckFhYVzxqniaAdDkC9SaSLU+x+ZlDzmFUDR9pPSOkcNclln/NP
   IXRM0KT+QwXlmJUe49rHTNcZBKIp2MzFSPuURgg1Qfcdv6iOVtc6l+1Vt
   Q==;
X-CSE-ConnectionGUID: FQnfiHCLSkGAIXRBBlNKkg==
X-CSE-MsgGUID: yTM0KMXbQDCk19pOsGW0UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989129"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989129"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:45:03 -0700
X-CSE-ConnectionGUID: f4qPmCxPQ4OzwXU0IzXB8Q==
X-CSE-MsgGUID: rjhZK097R46RPG2iilP0AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172419"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:45:01 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 37/44] media: ipu6: Add support for fixed iova region
Date: Fri, 21 Aug 2026 14:42:55 +0300
Message-ID: <20260821114302.365532-38-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821114302.365532-1-antti.laakso@linux.intel.com>
References: <20260821114302.365532-1-antti.laakso@linux.intel.com>
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

