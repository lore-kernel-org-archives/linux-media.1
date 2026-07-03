Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B243CCFC4
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092391; cv=none; b=cVgPhd+luNeJGJtiZoABR9qxdUabac07JxAJwbN5+MlklBPpnTSaRIwel2jF2sV33c3Me/G4FleSHrjkGTaQu2UY/Uma/HA6SZFhC/wq3NHGqbo6SuBYIHEFlUyLGGeg3w63bzRyUQhTuqG246omq25f1ex9pThGqmds+rjKDqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092391; c=relaxed/simple;
	bh=s4OIoHhee5e41l2C2q2rHW9974k2MB8eVrV5VtOqfQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RHhhewLfIATAkiIA4MkkmaJgzPbgBt3suc9P27gsK+aqFy9Rzp+S/lGVGs71tWgbbowk3M7hl92HYqC4cXQmRvuad+E/X6DWMNYJgruwWmtyO3WM9rsmaoDx3m08MXU34iCCFpNuTNgggzj+UXSbWQwdNvMuuAo2wEjOgLNY59w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TqKarbFK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TqKarbFK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092390; x=1814628390;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s4OIoHhee5e41l2C2q2rHW9974k2MB8eVrV5VtOqfQM=;
  b=TqKarbFK938TjQNHx1xvwTlKH65KAF7mMQVjpSKFO8vu3BDKmVJ2B4Sv
   JDvyd0v1TjnUn1se2ohJ739ug6KEvRWrYFy/ZnxzEljIkvamnFBh3eiRW
   bGhCCIJ31GjbZhgs7DFPX17xFmwC8yjla3cCZ7GnwljUmjuJtn9ige9pN
   H1SYvrb+W6D993tiFVg93kvv95eEpq2VurGIZvVucPwoNC1guRXxxBKUW
   P9jNmBZQVZJltxz4qFNZLPqIVX6Oagsq1htQKm2eWk+S+TZtrRIqtXV3N
   0bX/7AojaQ4qHyWwCkmz2Y1+nbVI3mBLWv8xneH6K4bvDpVD6IqDrhWaI
   A==;
X-CSE-ConnectionGUID: /URDJCIpQ9qkrbfhNiTZQA==
X-CSE-MsgGUID: lW36a34VRYCPrBZjy7Y+NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396259"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396259"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:30 -0700
X-CSE-ConnectionGUID: LC9NxNYWToCwOrw8GwivPg==
X-CSE-MsgGUID: gUHej9OyRxCqWYEikeus/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799832"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:28 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 34/41] media: ipu6: Add support for fixed iova region
Date: Fri,  3 Jul 2026 18:24:44 +0300
Message-ID: <20260703152451.1743132-35-antti.laakso@linux.intel.com>
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

The ipu7 need specific region for firmware in non-secure mode,
add support for it.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-dma.c | 26 +++++++++++++++++++++++--
 drivers/media/pci/intel/ipu6/ipu6-dma.h |  2 ++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
index 6e8295d9c3a3..99a031e5a16e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
@@ -371,6 +371,25 @@ void ipu6_dma_unmap_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
 }
 EXPORT_SYMBOL_NS_GPL(ipu6_dma_unmap_sg, "INTEL_IPU6");
 
+static struct iova *ipu7_get_fw_code_region(struct ipu6_bus_device *sys)
+{
+	struct device *dev = &sys->auxdev.dev;
+	struct ipu6_mmu *mmu = sys->mmu;
+	struct iova *iova;
+	unsigned long lo, hi;
+
+	lo = iova_pfn(&mmu->dmap->iovad, IPU7_FW_CODE_REGION_START);
+	hi = iova_pfn(&mmu->dmap->iovad, IPU7_FW_CODE_REGION_END) - 1U;
+
+	iova = reserve_iova(&mmu->dmap->iovad, lo, hi);
+	if (!iova) {
+		dev_err(dev, "Reserve iova[%lx:%lx] failed\n", lo, hi);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	return iova;
+}
+
 int ipu6_dma_map_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
 		    int nents, enum dma_data_direction dir,
 		    unsigned long attrs)
@@ -397,8 +416,11 @@ int ipu6_dma_map_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
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
 		return 0;
 
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
2.54.0

