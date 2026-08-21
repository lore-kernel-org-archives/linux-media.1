Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C576E47126E
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312636; cv=none; b=hNlZmDbwfPSySGzcxviZ+BVtlBqBFmQ3TONtkpfdBaCgTwUJzkA05Gqcu1cOY3PDA3qGfMyf+bZcpFomv+4JcUoEVyRai2yWs5WuhL2aNVcXOTkHpxwMGh+99Mci3Qd/gfFfJOxVPtmuO5Wyxa/U5KO40Ahh7fWeZUL4rl9bhYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312636; c=relaxed/simple;
	bh=iELjQHvuqn77pPyD+X9Jc0mj+cz9dgTNhHBLoCjg1ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AGIfIsluKpL+0e6D3WmQFpwvCaPqC4MYTJynfaC6rn4hKy7wgdIshQInpmnTNsYVSlTICKx6PVBqk5eKhfUbq6BTEUM7Akr6bJQ2+ap8F7yMsC75kxRI0LSR7HaYL7LWLMext+R/KEjVWxD/7cd+b6qDsgz8hQ/vyIHgrpvkU8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPR4BU9U; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPR4BU9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312635; x=1818848635;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iELjQHvuqn77pPyD+X9Jc0mj+cz9dgTNhHBLoCjg1ss=;
  b=JPR4BU9UbskPxA4BUmOUZKuU468B5D7OQhWh9c170ihn6mJb5x+v/ghS
   9MqLiKjFDkNwAnNEkYpwLOa26U5R8scKxfOa90ak0Y6y0/BzCF+yGEArC
   aJxp0Ca9+UW18o8SPJyGxDzyz5VDcZ21izStuauBEO/5QOPp4ul8lIf1L
   LnjIuqcnNqn7buy4Znl64Qp0qHT7gpRjL2v0NRUTQQ6QJrqSoa0S0vB2t
   vO192/VYJrBhnJzsFbIx5TBzpXffo63BkQmfrQT9kubu+DvMq2KsBbRRK
   4tHvv0cZlpTxbbrHbhQu02h1Yqcrnz7JO/WZwCJUCnVFLo/MgapLVimSr
   Q==;
X-CSE-ConnectionGUID: 8iaqetuTSr6kKodahzKCzA==
X-CSE-MsgGUID: fb0WvLjyTnmVVEjRqZGYWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989028"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989028"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:43:54 -0700
X-CSE-ConnectionGUID: OvxwODC/SGaTnI6LI8OiJQ==
X-CSE-MsgGUID: K3kDwfh/RJOnUyUR8GGPTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172183"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:43:52 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 06/44] media: ipu6: Cleanup ipu6_mmu_init()
Date: Fri, 21 Aug 2026 14:42:24 +0300
Message-ID: <20260821114302.365532-7-antti.laakso@linux.intel.com>
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

