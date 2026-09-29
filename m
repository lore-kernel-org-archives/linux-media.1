Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FB33BD63C
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 08:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670707; cv=none; b=LbbCWRQD7RxBpXMnHbAuLi8ojbHBjzaYJLWLAZo+dPZgCC+XBs1GPUjw+j6n0JRAYeCF0fmy4qyW9RANzRFNJtXlgWv43x+uIVrhgcgc6rfBKTYqzILJcyM67lZ3Vn4xpoFY6wOQqrZBM8Sod9A5L87ejLuFzRH0MezyebxcBoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670707; c=relaxed/simple;
	bh=5d7yhvRypk47SeKDo5wG2q6YctIOH+eC3Zck4Bth8c0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LV2roQAcAoRPtlugI3DedZ6Qbivpgx3zyf0m/kldByQY4XwL1hoBxj/rIpkr3w7yQ5vP4bsgza9KzIrjC2VZKXaxEGAcqI2/o5olYsVGS9+vkM+S2Dlva+SyVnfza/h0PqkuBJLUdTKX3tQQYhk5rKmqkm2QhQLGEtXJtu7clEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFWivSgq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFWivSgq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790670705; x=1822206705;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5d7yhvRypk47SeKDo5wG2q6YctIOH+eC3Zck4Bth8c0=;
  b=dFWivSgq8lPdm22Neq8e4cTbczDlCFK9Pwr+uLXdrab/pYAtB3DLPQ9r
   inwhVDFCbmqh7b/6X99G8yK6Pp3ovKbUhTfF6C2gRO0FZsx5bMBuLD975
   VdpQ6hc3YrkCVf2emQsVOvHHVKQ6atIHbvMuts73BmbfzFDTq55LX0dat
   rCvb9sn8o8xvf8HIOrwuBGzE0VoWHIuVyvBCPi5RVxxbZjrmzF/hipPD0
   KRcEQZ6qB3mKdTfskwSSrEaBmxvJ/TZ6R8BYn0f7Q7Hj+77HFLG8AqhrW
   IRyazeTYHtkvL6YwdvuLxJIXDPCJOqFxfvT1TEBuln+xeWSMFGTzLZi5Q
   Q==;
X-CSE-ConnectionGUID: dFKI5dWbSx+EBVmtgAHYpw==
X-CSE-MsgGUID: qjzceK6LQXGD5Lp9Updiaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101548905"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="101548905"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 01:31:45 -0700
X-CSE-ConnectionGUID: 1KH0eWakSpGn0FCqiRd2TA==
X-CSE-MsgGUID: j56gCzF6R6641SKmkIcgzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="275339435"
Received: from unknown (HELO pepper.iind.intel.com) ([10.223.20.54])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 01:31:44 -0700
From: Manik Bajpai <manik.bajpai@intel.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com
Subject: [PATCH v2 4/4] media: ipu6: Fix NULL deref in ipu6_mmu_iova_to_phys()
Date: Tue, 29 Sep 2026 14:01:30 +0530
Message-ID: <20260929083130.88381-5-manik.bajpai@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929083130.88381-1-manik.bajpai@intel.com>
References: <arpYuzb0yJinlDyH@kekkonen.localdomain>
 <20260929083130.88381-1-manik.bajpai@intel.com>
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

Fixes: 9163d83573e4 ("media: intel/ipu6: add IPU6 DMA mapping API and MMU table")
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

