Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995866;
	b=UQSQbyJCOWPpNdV9QGzHx7DxS8lzi9xwQ/nItoA2Rdv00M0gFeSuKKyTlEBbMQRovGmx
	 uZZVv6eeXawF/knn/5B49UP4uk27uRTCF67P/TvY4cLGxTFZQIazuLrf/u9IPEwTt3M0s
	 TLZBRc+UV63QEPwjjx6NXABpZOXwDK1m0X19+UvGw9g3pc1fCja7KFrt7eCYpD43Wh0W5
	 McQLadGy4MRyfIuSk9VoB5bn3gwK9y9B9byiSABUTkvXFdUN10W1SYEgSeXx4dWyb47Xz
	 reNSuNSWQY0YVF0Ry6oCTHM3ULDQ084MGBtQKdW+6Jc8mYXVmFO0W5cUwjAUY6ZM4sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995866;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=crDi3DD9d/MALlwggjqupT+B6dSUsDLqh3xi8KFruuU=;
	b=4glqmIRV4Arohzt9BDp4dbWqPOcD98Cc7LZnm29wTgIqVqZynYKvqgB43ryU922xYhNp
	 FANzRjPAYm2tL5dO913Y1MZ34+pdNo0OZAP8YuxJHtlGUGwDw5kpFKu8DsihLXt8bmQBR
	 AVXDSPeOQEc7Tgcd0he4c9N1K05MyK+otsT1VqyjWf+O2BlGPbyJFDNiAd+LOTXkSMheq
	 89r17RSvlJaSs0mcWCRxkLEHK1aHDor/sUQKj1GKivCKuAntmWJFFoTEdZ1EoO7hF5m+n
	 SIzyvcLDFEGM+dxntmR8QWNnmT/ecuc7HmLcVOKN82Q11HYaHfNledHmrTQBQI2cVpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J8SSv4fT;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB74606A32C
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FB74606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J8SSv4fT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794995866; x=1826531866;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oCMbyVUMOyUuO7QuNRgbBCQ+ivAQXTbUqU01mbPVGn8=;
  b=J8SSv4fTIZWEtcKhOKnHl3JXT5OvS/iO1Lm1UQfxLHzMxB6lEZqQcpmT
   zTvJnxzKjGthXvan9P83hyNetVLyU9FEfizflEwKpTs0ztfAr8SN+i8pK
   BelQZ2Q9IoPKtkXRpXz2D+tTO8lpR5kwrrziUCRQoWx00AMrbPwhvhwVV
   hLeOpqMvbI0Te5H9kXGwlajTYpuK+oweYgm7KOnDl5AdedT/vRbVU8QKU
   mFCHtWLzF/sROz+dqJXSq8EUUNecSUamyUgra0Sgl6aZhYjiYZZ/XbE5o
   WuRpofLqM9t3y1Yd6wwTSpAD9Wo6jswS4ygaH6quKXiNAmjXgyelgp92H
   Q==;
X-CSE-ConnectionGUID: tHm/DtmrRduU1P9lpEoGrg==
X-CSE-MsgGUID: F4mDPTXbTgCQ/x/rv7VNKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3716516"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3716516"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 01:57:45 -0800
X-CSE-ConnectionGUID: zluxhfgCRyKzzLigo5GIjg==
X-CSE-MsgGUID: +xWDqa4IQgivk38nW4uu6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10501466"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 01:57:43 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EE973121B71;
	Wed, 18 Nov 2026 11:57:40 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTcQ8-00000000sEn-2GNs;
	Wed, 18 Nov 2026 11:57:40 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>
Subject: [PATCH 1/1] media: ipu6: Make ipu6_dma_{un,}map_sg() static
Date: Wed, 18 Nov 2026 11:57:40 +0200
Message-ID: <20261118095740.208482-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make ipu6_dma_map_sg() and ipu6_dma_unmap_sg() static as they are only
used within the same file.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-dma.c | 14 ++++++--------
 drivers/media/pci/intel/ipu6/ipu6-dma.h |  6 ------
 2 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/intel/ipu6/ipu6-dma.c
index 90f530a93779..ea13a58a80f8 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
@@ -327,9 +327,9 @@ int ipu6_dma_mmap(struct ipu6_bus_device *sys, struct vm_area_struct *vma,
 	return 0;
 }
 
-void ipu6_dma_unmap_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
-		       int nents, enum dma_data_direction dir,
-		       unsigned long attrs)
+static void ipu6_dma_unmap_sg(struct ipu6_bus_device *sys,
+			      struct scatterlist *sglist, int nents,
+			      enum dma_data_direction dir, unsigned long attrs)
 {
 	struct device *dev = &sys->auxdev.dev;
 	struct ipu6_mmu *mmu = sys->mmu;
@@ -369,7 +369,6 @@ void ipu6_dma_unmap_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
 	mmu->ops->tlb_invalidate(mmu);
 	__free_iova(&mmu->dmap->iovad, iova);
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_dma_unmap_sg, "INTEL_IPU6");
 
 static struct iova *ipu7_get_fw_code_region(struct ipu6_bus_device *sys)
 {
@@ -382,9 +381,9 @@ static struct iova *ipu7_get_fw_code_region(struct ipu6_bus_device *sys)
 	return reserve_iova(&mmu->dmap->iovad, lo, hi);
 }
 
-int ipu6_dma_map_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
-		    int nents, enum dma_data_direction dir,
-		    unsigned long attrs)
+static int ipu6_dma_map_sg(struct ipu6_bus_device *sys,
+			   struct scatterlist *sglist, int nents,
+			   enum dma_data_direction dir, unsigned long attrs)
 {
 	struct device *dev = &sys->auxdev.dev;
 	struct ipu6_mmu *mmu = sys->mmu;
@@ -448,7 +447,6 @@ int ipu6_dma_map_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_dma_map_sg, "INTEL_IPU6");
 
 int ipu6_dma_map_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
 			 enum dma_data_direction dir, unsigned long attrs)
diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.h b/drivers/media/pci/intel/ipu6/ipu6-dma.h
index e5e0e7860423..bd1a0481f1ac 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.h
@@ -32,12 +32,6 @@ void ipu6_dma_free(struct ipu6_bus_device *sys, size_t size, void *vaddr,
 int ipu6_dma_mmap(struct ipu6_bus_device *sys, struct vm_area_struct *vma,
 		  void *addr, dma_addr_t iova, size_t size,
 		  unsigned long attrs);
-int ipu6_dma_map_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
-		    int nents, enum dma_data_direction dir,
-		    unsigned long attrs);
-void ipu6_dma_unmap_sg(struct ipu6_bus_device *sys, struct scatterlist *sglist,
-		       int nents, enum dma_data_direction dir,
-		       unsigned long attrs);
 int ipu6_dma_map_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,
 			 enum dma_data_direction dir, unsigned long attrs);
 void ipu6_dma_unmap_sgtable(struct ipu6_bus_device *sys, struct sg_table *sgt,

-- 
2.47.3

