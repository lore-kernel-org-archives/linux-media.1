Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB09414DFD
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092339; cv=none; b=A8DUwx/nkepJYMSm197P2/4QgT8kHbl5cnC3Pd47a6oJVE1LLp7utCkEfaerwHfXRUrwDJ9YbMPqRHdY0wUDNJFldUraUJ62V3tTx7KgfbB/wRjWixPEa93NqcRw4s+HY+Pzcm/9R/gk3SDvK6/rftTTy86k7qMqmyW4oPTO7Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092339; c=relaxed/simple;
	bh=gNeZQTVg5dGSat6qWfleXKRcmqVOGeCQtqqelatSMsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TngLh+ZUGGTYLCL7LCSxEbKZKhWfIP8/hOkmVLFTrmgm+8EAh7K38qm/fhztojgREjfqrHa8QfA4zI8uJVyGh0fSwCPq+DW7RndGoD4xHjT/YRcg5DxbmxWmrGk265Lo+Ga4a7EYP+o3Bwoh6S8ACChpqhBW1YFLKDBJYZk1drM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CAgR3SkW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CAgR3SkW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092338; x=1814628338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gNeZQTVg5dGSat6qWfleXKRcmqVOGeCQtqqelatSMsM=;
  b=CAgR3SkWpP9hFYhEITUSZaCVcTEk2tpniBTlA7L6Qy7e/HTI+WKPEIUs
   WapB+NxW1STcMDKI4e3XA2Iqeg2wE718dlY/f9EN5Gr7/XB7upXYNi5YT
   kads3DYdAvaooVdZWdKJLtnFegYPIAFMoNKjo7wFflQlshnFbIgjUTWaK
   2da6XmiESg+sL4Ra7j2SvDgI82OtezdR2moimzyHTJobtef87BRM2ENw+
   JY0LSV5Ya5vu0z+rXBaUYL37V88hzlKQ6l57VnXWoSQVoPsUdAi6//53I
   gYdaAbMLzS3WGCiPDBhzPHred0uFs0utMVWlSw4y9l9McgmipTlcLZuLG
   w==;
X-CSE-ConnectionGUID: NVQTN2jJTb+HnfBBeiVFsA==
X-CSE-MsgGUID: dApUtRwBTqGf2Dq96Mohjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396156"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396156"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:38 -0700
X-CSE-ConnectionGUID: G9k4TyKFRm6bj4zjqVXgGw==
X-CSE-MsgGUID: XdVHkaR8TdqOXliBDxifNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799511"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:37 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 12/41] media: ipu6: Rename IPU subsys ID
Date: Fri,  3 Jul 2026 18:24:22 +0300
Message-ID: <20260703152451.1743132-13-antti.laakso@linux.intel.com>
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
index 23013454f94f..3e90e1585d07 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -395,8 +395,7 @@ ipu6_isys_init(struct pci_dev *pdev, struct device *parent,
 				"ipu6_bus_initialize_device isys failed\n");
 	}
 
-	isys_adev->mmu = ipu6_mmu_init(dev, base, ISYS_MMID,
-				       &ipdata->hw_variant);
+	isys_adev->mmu = ipu6_mmu_init(dev, base, IPU_ISYS, &ipdata->hw_variant);
 	if (IS_ERR(isys_adev->mmu)) {
 		put_device(&isys_adev->auxdev.dev);
 		kfree(pdata);
@@ -439,7 +438,7 @@ ipu6_psys_init(struct pci_dev *pdev, struct device *parent,
 				"ipu6_bus_initialize_device psys failed\n");
 	}
 
-	psys_adev->mmu = ipu6_mmu_init(&pdev->dev, base, PSYS_MMID,
+	psys_adev->mmu = ipu6_mmu_init(&pdev->dev, base, IPU_PSYS,
 				       &ipdata->hw_variant);
 	if (IS_ERR(psys_adev->mmu)) {
 		put_device(&psys_adev->auxdev.dev);
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index fda75f94b0da..01bd2a965367 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -87,6 +87,9 @@ struct ipu6_device {
 	bool bus_ready_to_probe;
 };
 
+#define IPU_PSYS	0
+#define IPU_ISYS	1
+
 #define IPU6_ISYS_NAME "isys"
 #define IPU6_PSYS_NAME "psys"
 
-- 
2.54.0

