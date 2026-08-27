Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230E626ED3D
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834042; cv=none; b=C7NIDne/JLQhEQIoQ+n8yt2tCvfo196Dayr3SJ0BJuGB/iuY2W1cz+IA7F7a/cxKoDL/vN+IvsSAcp8wK0l1qYhx5yFmIvFDvWGr46Q0LtEh1Tbp4+LHOuqtQylaA9QwHU7ZtXTAxb2VSXIP3lOTnUZfJ0l5V3L78/iousc3B5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834042; c=relaxed/simple;
	bh=iELjQHvuqn77pPyD+X9Jc0mj+cz9dgTNhHBLoCjg1ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VWvsLGa9S9QdK2WY/SKud5hnkiM5pQRGtwNyaIjcs9OzQnwAn3wLyGeTgNpTzARs+vwi6HXz1tAr5IiQaqVQ6V2RPRUyjnM2gCezBKCvJnw7dItkFjz9r7TIbP777/c82OR2ntEDClTVoapmxpqw1XC20wb3hxDJrxsgI/owPgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELd4Orp3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELd4Orp3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834041; x=1819370041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iELjQHvuqn77pPyD+X9Jc0mj+cz9dgTNhHBLoCjg1ss=;
  b=ELd4Orp31dBL6Uu7ugizXFMTNuSpI8nqKxNvgu+nLbVqmwbaSEt6xAyW
   JKn8cknUN6TNn00I4I/4plu+xeNQYaBAGfdwQ60+gSRO7kZ7lL7obBdir
   Fkb5+IG9j/NxTsJx+G2EcakW5cLOMhpsJBU/KpPexWJe41XAi7cJapP/C
   gxOOghuQeQ5/jlMb9qlT5z4wDQTx6CLaT/nE7gVtP1kiaVHPvZzfAtRm+
   vem/66CQ9tm51lPnPC0lyW/yUBnEnhoA90iJEQvZT+XZvLzOWePniExhx
   yy95BX0jmQpAIF3YEYdMvAP2McjQhTdf3yc7a0o6acgNLKu7lswRHwv5p
   A==;
X-CSE-ConnectionGUID: 2kFev10uTga3mVl/FlmhXg==
X-CSE-MsgGUID: iM6rb1EFRnyGxclC0wRr9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188541"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188541"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:01 -0700
X-CSE-ConnectionGUID: lpj+I1cLQCqncU6XUNhp+w==
X-CSE-MsgGUID: rJA9uKiMQlWozJT/88D89A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384290"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:33:59 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 06/44] media: ipu6: Cleanup ipu6_mmu_init()
Date: Thu, 27 Aug 2026 15:32:58 +0300
Message-ID: <20260827123336.2219048-7-antti.laakso@linux.intel.com>
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

The struct ipu6_mmu_pdata is used only in ipu6_mmu_init(),
and not really needed, remove it.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-mmu.c | 13 ++++++-------
 drivers/media/pci/intel/ipu6/ipu6.h     |  6 ------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
index 0e6dca36b6ba..6b1a49ebbcc2 100644
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
+	mmu_hw = devm_kcalloc(dev, sizeof(*mmu_hw), hw->nr_mmus, GFP_KERNEL);
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
index 07ca59048f44..874b377a2e9a 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -239,12 +239,6 @@ struct ipu6_mmu_hw {
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
2.55.0

