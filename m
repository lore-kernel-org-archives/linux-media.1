Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC6C47DD74
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 12:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251626; cv=none; b=rM4L50VgzKBkFcph1GuO62d7sklRljlc/Qa8rxY2f8Yjk4dwjzUD6SsQd2wlXO9/NkZ+MczhFDWrf+e9mstsMyHJfZ+Do6cU9KLgoXHQTtrxEfvkG8AJ8qg0X1HHWyZifDRf4sytSak6ICDyXl6dbgrtReb8lFDoLcJ/eea/rFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251626; c=relaxed/simple;
	bh=ZI+8Yxyomq0O4WcXYyYhjyW5I86ge2K46mDejJ2ioCI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=TIgoCpVKWxLI85LW6uYyr2OUVe1Nrjj3f+FWmUKEe+ESetSLxBCLfjv0i0vwulZae2+bJi4tfvo7t1Rh1AeU7ffPLM2D51KNpEh5TpCwYVzd+Hc2giltKd2Y6iBuj4AJnq+7SQpW4jNPQRiQre/gHczOEKLjmYLJpCn9/B8TkpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F4j+Angv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F4j+Angv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790251624; x=1821787624;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZI+8Yxyomq0O4WcXYyYhjyW5I86ge2K46mDejJ2ioCI=;
  b=F4j+AngvSXcFr8UhRPj0wDa1KIUCrVWJRIgCtzvqhauX/41ByjnTr4Rv
   D4dQQGqRjCGLbgaiWECWO7czPv2qhVrnA7ULCqfs8WDj2VFFCz9Stc5IQ
   iiSUpdhQUyyBt3BLZPkDQwOVTdhtfJ9gQ0/bwhUuffZJl1+YdLK06znfR
   toHgTaLffpSp2XEIgsDBqd8SGqFZyWvRayr81JPvqi/HB6GGJBH8FsNJT
   6vp9+P+bQYqxm/wsBTIy9fR9mSzgzoVqEtIcYKDj1XW1DjYOpiaWPFy3V
   8ZmrSbSnKs/6FNeLQegG2EhVj5RftpsOIfljPZsd+1HwjAsku5emAks5C
   w==;
X-CSE-ConnectionGUID: +W8SISMHTDKPTvag9ciESg==
X-CSE-MsgGUID: pA3xTL+nTSG1FIMGkk9fIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91123805"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="91123805"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 05:07:03 -0700
X-CSE-ConnectionGUID: SinOMRZsRu6v2nWHyAfuLA==
X-CSE-MsgGUID: lq+cLlTCQhmDgNDrIFAGdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="278728166"
Received: from dnelso2-mobl.amr.corp.intel.com (HELO alaakso-desk.intel.com) ([10.125.110.173])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 05:07:02 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com,
	error27@gmail.com
Subject: [PATCH] media: ipu6: Fix bus device use-after-free
Date: Thu, 24 Sep 2026 15:06:34 +0300
Message-ID: <20260924120634.1420687-1-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ipu6_bus_del_devices() will uninitialize and free bus devices and
dereferencing isp->psys and isp->isys will lead to use-after-free.

While at it, remove unnecessary checks for isp->isys/psys.

Reported-by: Dan Carpenter <error27@gmail.com>
Fixes: 69ebb1bfc865 ("media: ipu6: Move isys fw mapping to pci_probe")
Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 43d951735f72..b9a79181d736 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -836,6 +836,8 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 static void ipu6_pci_remove(struct pci_dev *pdev)
 {
 	struct ipu6_device *isp = pci_get_drvdata(pdev);
+	struct ipu6_mmu *isys_mmu = isp->isys->mmu;
+	struct ipu6_mmu *psys_mmu = isp->psys->mmu;
 	unsigned long dir;
 
 	devm_free_irq(&pdev->dev, pdev->irq, isp);
@@ -844,11 +846,9 @@ static void ipu6_pci_remove(struct pci_dev *pdev)
 	ipu6_cpd_free_pkg_dir(isp->psys);
 	ipu6_unmap_fw_region(isp->psys, dir);
 
-	if (isp->isys) {
-		ipu6_cpd_free_pkg_dir(isp->isys);
-		if (isp->isys->fw_sgt.nents)
-			ipu6_unmap_fw_region(isp->isys, dir);
-	}
+	ipu6_cpd_free_pkg_dir(isp->isys);
+	if (isp->isys->fw_sgt.nents)
+		ipu6_unmap_fw_region(isp->isys, dir);
 
 	vfree(isp->fw_code_region);
 	isp->fw_code_region = NULL;
@@ -862,10 +862,8 @@ static void ipu6_pci_remove(struct pci_dev *pdev)
 
 	release_firmware(isp->cpd_fw);
 
-	if (isp->psys)
-		ipu6_mmu_cleanup(isp->psys->mmu);
-	if (isp->isys)
-		ipu6_mmu_cleanup(isp->isys->mmu);
+	ipu6_mmu_cleanup(psys_mmu);
+	ipu6_mmu_cleanup(isys_mmu);
 }
 
 static void ipu6_pci_reset_prepare(struct pci_dev *pdev)
-- 
2.55.0

