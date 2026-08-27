Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C983521A434
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834052; cv=none; b=ULrEDPZwC64A6UT29jwaR4QqZQjtPsyEJpEExaGCtpyw8qzuzeYSYTrlwCLwUgvfA7LrGjgWfMVo2Z4dU6xR1lCoNqKi15jKwudSoi0+jHLecLtYSjcpilkMkvbkSbtYd+C4Xer0FVa9BiBUHMCY9koCziF95I4ICb2z6EAGEms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834052; c=relaxed/simple;
	bh=n2N4LtDTQ+SyEJbKHTZYekwFYPHaZKMehf5ZJ+F/N8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V48UCVw0IGkjhuW5R5hZvR67EEFGsz1Qma5eX49cF9nWjY6QH345PgUbBU0V8dZslMuF8sb6jVmmXxBD3UmQ2dtRLWqEqaQ5xrc2usbrNb+qVRy6F+l5WF3MDwl91rwK1sbVmBcjlJnwMJida22MZKz1NmZ2ctSf0e2vNFGGo6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f40WOfCK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f40WOfCK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834051; x=1819370051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n2N4LtDTQ+SyEJbKHTZYekwFYPHaZKMehf5ZJ+F/N8Y=;
  b=f40WOfCK2/X+WOPfMeBdtRGpW6J0yZB+JCEEiJ37uZyvNR+PjLDdV5nm
   V9ZfqtGssE96kNFmGnOHyv70E4ZRkrdzm8A01rC65eOzP3sQzwSunjHiN
   8PcMHLPwUT6ScsKsHlnxEzOVXheuTcKbiUYOmO1a0K/GcAaLc6KSAi470
   by+R0Dv2b7Ih8G1WSrZx3cJDmg20ggnLe2Ddbpm1tatUeMNlm0380bysx
   BNWMvDG6swIyT2ymtQfFU3IXsN4QyhVo3pz06sGZE71csjQBuSLfaFe85
   +LQIQgy0t79hTGHFoZaKYHetQ6YN6URgQ008LB+BJ6N82RbSZWZHW3vp3
   Q==;
X-CSE-ConnectionGUID: L66wkULDRf2fGNwJAiDMzA==
X-CSE-MsgGUID: IOnsJS+nSYuZ/63GbrwNgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188584"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188584"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:10 -0700
X-CSE-ConnectionGUID: J33ONLr5SH+coUgFEIpEmw==
X-CSE-MsgGUID: Ngso+hqHTHytp3slV3nDsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384350"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:09 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 11/44] media: ipu6: Rename IPU subsys ID
Date: Thu, 27 Aug 2026 15:33:03 +0300
Message-ID: <20260827123336.2219048-12-antti.laakso@linux.intel.com>
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

We will need subsys ID later elsewhere, so move it to
common header too.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-mmu.h | 3 ---
 drivers/media/pci/intel/ipu6/ipu6.c     | 5 ++---
 drivers/media/pci/intel/ipu6/ipu6.h     | 3 +++
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.h b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
index 8e40b4a66d7d..35cac80d2d4e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
@@ -4,9 +4,6 @@
 #ifndef IPU6_MMU_H
 #define IPU6_MMU_H
 
-#define ISYS_MMID 1
-#define PSYS_MMID 0
-
 #include <linux/list.h>
 #include <linux/spinlock_types.h>
 #include <linux/types.h>
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 7ac9c92744c0..c24e18520de6 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -424,8 +424,7 @@ ipu6_isys_init(struct pci_dev *pdev, struct device *parent,
 				"ipu6_bus_initialize_device isys failed\n");
 	}
 
-	isys_adev->mmu = ipu6_mmu_init(dev, base, ISYS_MMID,
-				       &ipdata->hw_variant);
+	isys_adev->mmu = ipu6_mmu_init(dev, base, IPU_ISYS, &ipdata->hw_variant);
 	if (IS_ERR(isys_adev->mmu)) {
 		put_device(&isys_adev->auxdev.dev);
 		return dev_err_cast_probe(dev, isys_adev->mmu,
@@ -465,7 +464,7 @@ ipu6_psys_init(struct pci_dev *pdev, struct device *parent,
 				"ipu6_bus_initialize_device psys failed\n");
 	}
 
-	psys_adev->mmu = ipu6_mmu_init(&pdev->dev, base, PSYS_MMID,
+	psys_adev->mmu = ipu6_mmu_init(&pdev->dev, base, IPU_PSYS,
 				       &ipdata->hw_variant);
 	if (IS_ERR(psys_adev->mmu)) {
 		put_device(&psys_adev->auxdev.dev);
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index ebae876058ca..dc98a787612f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -70,6 +70,9 @@ struct ipu6_device {
 	bool bus_ready_to_probe;
 };
 
+#define IPU_PSYS	0
+#define IPU_ISYS	1
+
 #define IPU6_ISYS_NAME "isys"
 #define IPU6_PSYS_NAME "psys"
 
-- 
2.55.0

