Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ED53DB305
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092325; cv=none; b=tEXVTceiVfKWkYnKYPYQ0YsSGperYXuat3RzQ6gumBoLsh2lH56s31+z0vAbLsdRtHrjlLoQ0+Z0G3ooOjiouE/Uz4z5J4GFREKTEHbu4uR8TNpbxABNxqc+tNmvLQTBjgtIL35N6I+lZUSOJRv1f82Ad/yQCesciHB8D5Hl8BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092325; c=relaxed/simple;
	bh=47qGxeltxuyNgiudxoAxO8qVAdooHa+Jfc8PWSOQyFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UYzZeYeSxS0EKXyoRxJBw7DM5AKVWRjjIvQ//4zFBkL4BiyU0YdASDHM7iwDepg8dYUaQ9UY8DijmQqfEKaC7CacxmTIlf5Vc1cdKd0DqoVEmrM89NxXrpN/Ed9cfKHRJKA8ZfZ9riSE601XCm8dIId97ooC12OK+rmPv0q2Bnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+XNlTu4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+XNlTu4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092325; x=1814628325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=47qGxeltxuyNgiudxoAxO8qVAdooHa+Jfc8PWSOQyFY=;
  b=A+XNlTu4RhCYiu9b1Bd0upt3d71N6mX2BGn3CQ4TKeNDXmLGlLlzguaW
   tCIipH7LcUgcC8KQuPUZPbpgLNxoUpjBei1hrD5dzklzM4BVx0dhAnu+7
   yDGxpA4VWg72uyvkk+JymDzM0DqvuBRf3RtFB7BxxR429Dw+ckxRAYhu0
   /yqw5Rpb0HGhHhSRk7dpbaaTnRuId7DG+5PUjySsQ6VWqzMoxZnZ0nzVI
   Iyw2jIkFYdRX3x8wIXFbzgSVJySVVJqs3bbQc5h3e/0FWkXXSDCiXMJF/
   qVxsuLh+OQtZ/RTq0Ba/JOvSYyla+5eyVJlYQe+jtbGss7VlBIJqxDyDq
   A==;
X-CSE-ConnectionGUID: TrEGzat+SzSzg8umtJTZ2Q==
X-CSE-MsgGUID: vHHQLn+LRgqS7veNWllmLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396132"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396132"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:24 -0700
X-CSE-ConnectionGUID: FcCcwNPwTiWb2RExfYgkdQ==
X-CSE-MsgGUID: B7dogx3YQT2KJcByLWbCSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799480"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:23 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 06/41] media: ipu6: Cleanup ipu6_mmu_init()
Date: Fri,  3 Jul 2026 18:24:16 +0300
Message-ID: <20260703152451.1743132-7-antti.laakso@linux.intel.com>
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

The struct ipu6_mmu_pdata is used only in ipu6_mmu_init(),
and not really needed, remove it.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-mmu.c | 13 ++++++-------
 drivers/media/pci/intel/ipu6/ipu6.h     |  6 ------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
index 0e6dca36b6ba..35307ebc2f43 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -750,27 +750,26 @@ struct ipu6_mmu *ipu6_mmu_init(struct device *dev,
 			       const struct ipu6_hw_variants *hw)
 {
 	struct ipu6_device *isp = pci_get_drvdata(to_pci_dev(dev));
-	struct ipu6_mmu_pdata *pdata;
+	struct ipu6_mmu_hw *mmu_hw;
 	struct ipu6_mmu *mmu;
 	unsigned int i;
 
 	if (hw->nr_mmus > IPU6_MMU_MAX_DEVICES)
 		return ERR_PTR(-EINVAL);
 
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
+	mmu_hw = devm_kzalloc(dev, sizeof(*mmu_hw) * hw->nr_mmus, GFP_KERNEL);
+	if (!mmu_hw)
 		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < hw->nr_mmus; i++) {
-		struct ipu6_mmu_hw *pdata_mmu = &pdata->mmu_hw[i];
 		const struct ipu6_mmu_hw *src_mmu = &hw->mmu_hw[i];
 
 		if (src_mmu->nr_l1streams > IPU6_MMU_MAX_TLB_L1_STREAMS ||
 		    src_mmu->nr_l2streams > IPU6_MMU_MAX_TLB_L2_STREAMS)
 			return ERR_PTR(-EINVAL);
 
-		*pdata_mmu = *src_mmu;
-		pdata_mmu->base = base + src_mmu->offset;
+		mmu_hw[i] = *src_mmu;
+		mmu_hw[i].base = base + src_mmu->offset;
 	}
 
 	mmu = devm_kzalloc(dev, sizeof(*mmu), GFP_KERNEL);
@@ -778,7 +777,7 @@ struct ipu6_mmu *ipu6_mmu_init(struct device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	mmu->mmid = mmid;
-	mmu->mmu_hw = pdata->mmu_hw;
+	mmu->mmu_hw = mmu_hw;
 	mmu->nr_mmus = hw->nr_mmus;
 	mmu->tlb_invalidate = tlb_invalidate;
 	mmu->ready = false;
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index 883c83f30682..3c1197b59240 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -252,12 +252,6 @@ struct ipu6_mmu_hw {
 	bool insert_read_before_invalidate;
 };
 
-struct ipu6_mmu_pdata {
-	u32 nr_mmus;
-	struct ipu6_mmu_hw mmu_hw[IPU6_MMU_MAX_DEVICES];
-	int mmid;
-};
-
 struct ipu6_isys_csi2_pdata {
 	void __iomem *base;
 };
-- 
2.54.0

