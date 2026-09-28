Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F9649EC4A
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 11:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596630; cv=none; b=PZ+GkXqUWmgy+9/oDdFAbfTxIIgpe0GREXgcZEW1XbVzPFtA9A3KPKbR3WUEoCuCddXC8GOzKTOPSMld54rFY8E64WWcTVCrNkmW/uB9vsi54hl729CKGZBvah4HfsULAyPDY+/W1Sx+Q3jvHUK1sor/GrqJ++YZmTL4d8SKHGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596630; c=relaxed/simple;
	bh=PlNW2Yqs8Fi+aLmEPOpvEeeYc+6u+ApVfvXCNfKbMbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hld13VwxEZvZ3fuQA7Tqq76Gnacoy6qY69nlCiORiwgcT03aeU+iiFGjhAEAt2nqtRubVb2/l/eUJOSo1QvFFkwgmk1p4G3ctwx9j6hGws2p6gK2/5qyHxVM5tWRCtPM02Bcs9W2RIo9yW+5/zuM0TmDedLKX7glZGHpMOlGZyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WN2YMkLE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WN2YMkLE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790596629; x=1822132629;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PlNW2Yqs8Fi+aLmEPOpvEeeYc+6u+ApVfvXCNfKbMbY=;
  b=WN2YMkLEAnTDxDREoo+oTj5uiFuPgRr6p/1/CLv8kyTwM7dn2s4OrsdI
   Tq+oEKDYRmB+jCC0iENp2aAlkRoGsaEsh1F7sJtfbp0OGadj8m+UH3IOU
   yep9k/rvCp6X1rYvT5Gcpxa5iVbYlSY81v5k+sp15KDMGZT9CZhOiXzW8
   KPoOgVGcmMq+wqLcPsSAzafcGMMzgqbAX5Y3wsZgZWM/ahmYUHbiei38V
   k2+xWSfc2A7U09ODqqqauZgD78AOEzWYovtQrDj7PZyIs18ZSio9snPwp
   C3RcnWmXyOVAdMQUcnogNP9F2edQU3q6dXw0nAd7UGi6Q4ELfC7kErpW1
   g==;
X-CSE-ConnectionGUID: aP8wz1cAR2uHOTFCikrsig==
X-CSE-MsgGUID: K9w9JSw2R8iPSMxka771OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90059376"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="90059376"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 04:57:02 -0700
X-CSE-ConnectionGUID: 9LkKrou+T/qzOdZ8ZmvEdQ==
X-CSE-MsgGUID: TfSp1xN/TPGBOKaksyzo7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="302981388"
Received: from unknown (HELO pepper.iind.intel.com) ([10.223.20.54])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 04:57:01 -0700
From: Manik Bajpai <manik.bajpai@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com
Subject: [PATCH v1 4/4] media: ipu6: Fix NULL deref in ipu6_mmu_iova_to_phys()
Date: Mon, 28 Sep 2026 17:26:46 +0530
Message-ID: <20260928115646.77399-5-manik.bajpai@intel.com>
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

ipu6_mmu_iova_to_phys() looked up the L2 page table for the given iova
and dereferenced it immediately, without checking whether the
corresponding L1 entry is actually mapped. l2_map() and l2_unmap()
already guard the equivalent lookup by checking the L1 entry against
mmu_info->dummy_l2_pteval before touching l2_pts[].

An unmapped iova (e.g. a stale address passed from a debug path)
would dereference an invalid pointer and crash.

Add the same "is this L1 entry mapped" check used by l2_map()/
l2_unmap(), returning 0 for an unmapped iova instead of crashing.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Manik Bajpai <manik.bajpai@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-mmu.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
index 243d438786ba..b8a8ed622b8d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -566,10 +566,19 @@ phys_addr_t ipu6_mmu_iova_to_phys(struct ipu6_mmu_info *mmu_info,
 {
 	phys_addr_t phy_addr;
 	unsigned long flags;
+	u32 l1_idx = iova >> ISP_L1PT_SHIFT;
 	u32 *l2_pt;
 
 	spin_lock_irqsave(&mmu_info->lock, flags);
-	l2_pt = mmu_info->l2_pts[iova >> ISP_L1PT_SHIFT];
+	if (mmu_info->l1_pt[l1_idx] == mmu_info->dummy_l2_pteval) {
+		spin_unlock_irqrestore(&mmu_info->lock, flags);
+		dev_err(mmu_info->dev,
+			"iova_to_phys: no mapping for iova %pad\n",
+			&iova);
+		return 0;
+	}
+
+	l2_pt = mmu_info->l2_pts[l1_idx];
 	phy_addr = (phys_addr_t)l2_pt[(iova & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT];
 	phy_addr <<= ISP_PAGE_SHIFT;
 	spin_unlock_irqrestore(&mmu_info->lock, flags);
-- 
2.53.0

