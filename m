Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B6C48A2B1
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312647; cv=none; b=P2ZRa6UO/GBtRi1uvyM0/HaViPY28ikwEs1w5j/faNYGRtlwa64E7mRRglyfyyKZo1H0AMWrHT1kSzk31hD0DSXKhgI9Lw0eailKLCrYjgq3cdYkNVEkMKhmJqhOSKKZRmuwYG/bFndLHWrGFNblItkxflZEqNJLbTXy/gtUH80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312647; c=relaxed/simple;
	bh=n2N4LtDTQ+SyEJbKHTZYekwFYPHaZKMehf5ZJ+F/N8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qeJF1I9fIoRoOvWrSFdoVw7wdHn+jFLyPmSxET4CPDiOegwerTRJbR8H+kNzNNsl/x3CKEvu7S1PP4CHw6nhKYTKDAF/cOzgQq2Wqjr7gvIsSq0PFk6tO1BXp+xC4mG1iEai1v+gRXMOAcvD1LucgaSBNH44YHxbQ7BfiPsCDqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WBuhqrrh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WBuhqrrh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312645; x=1818848645;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n2N4LtDTQ+SyEJbKHTZYekwFYPHaZKMehf5ZJ+F/N8Y=;
  b=WBuhqrrhlT3uKRhpifAogynI7GrkY/a8JO1Wmpt94ocAQ9xaSUezwirQ
   76OzOrzXYperRZHw0qOvO36Rm4qG668CTH5981BrmG2vK+iBQoSzAT2Co
   z0FA5rhYidPkvb6qpWgc5sVqcXo07d166gxctpFCJjs/1XJgnMaNa1QD1
   3oXyFBrFNDNP5LQMowM3WAfzzbjkImBNEe/fJdjTPH6bIxEz8KCA5ziiZ
   V0TgEynXNILVldcjFMx3cSq39MX+TbDITXy4I58zFtrBCFRPkt1x8PWim
   wz8CwTDSTBdk8WeX2ABt4KaIFVutibzHWspW0st54MqaNGSp9Wz0r/Ny2
   w==;
X-CSE-ConnectionGUID: kRLQyDb9R+WacGmZI/SbPg==
X-CSE-MsgGUID: r0fKAHmnRCiQbkrK3SykLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989047"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989047"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:05 -0700
X-CSE-ConnectionGUID: 3hESC62nSLCwbAwgsFVLTg==
X-CSE-MsgGUID: K2apl9tDR4ejPuD7dNThuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172236"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:03 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 11/44] media: ipu6: Rename IPU subsys ID
Date: Fri, 21 Aug 2026 14:42:29 +0300
Message-ID: <20260821114302.365532-12-antti.laakso@linux.intel.com>
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

