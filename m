Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB15A25B08B
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834114; cv=none; b=j/Vynv39a8ij3aIPziq5ltWv6hzvFZ/a+BqW7ntQzPabyGkQunP6HGyvUtIgV1MiBD0vUebD65gFtIWsabM3dUUwCqVs72wHTzs9kVNcBTm0zSRAi6sUZQC7XltXLwM8qePuq3M3A+oq3lCpewFgtrA39RNrFyD4xJ6I5h3fGn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834114; c=relaxed/simple;
	bh=laa+CXgeOsCQ2MZokvDYjAdITdOCiSWJTrFQ7DzaDK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JLyJYPUEQVsRHLf6MpVnNzlQEMVDEI9553LpUsqNmXtCI2wKZGoJH0EdzVdWvkt6DPQ+rV1WMCaOf8xF6g69QTyf08DjydOGKQ6ObCD32QOId3cAv0hLARaWKOO8bqu6yKwjjqqN1UsH3LwSlx8/rHyHlNaINUDlm0kMg6dSfro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5vWZSy0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5vWZSy0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834112; x=1819370112;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=laa+CXgeOsCQ2MZokvDYjAdITdOCiSWJTrFQ7DzaDK4=;
  b=C5vWZSy0O6A1idscGip19Ad0XVZ0rLz4vc+fyCzVqTCdNOTFGvn1Ktmr
   ipqGuMuqtCFZZq/K3OknTgHp/sSdOwANQ7b13A/rAjW1hyNS7krUTfg8H
   sXWQnVaeO6Vg+yGSFqs8Vo0/MSdMPr4ZCpS+26daCkAG+PhvS3Mp7Dd2h
   6kok0zWaamKGx+fgBdzwohucUQ/2BVxTlA2yiQomOYwxNGNDIcKrjtFBC
   CPWLELVO8i3GL70xKzlXvXwD9l5bJwzpq73Fe4B1b0OuHRce73dGdeca1
   EQx5/n/o4h7R8q1o38ZyQrZNFN/aLqWbuhb0wjfo0oG40Uq+Xl/8sWpDU
   g==;
X-CSE-ConnectionGUID: Z+rDKo6SQ5aZbjTDKTlYAQ==
X-CSE-MsgGUID: 3Ou+6nHGQ+65NfUS5WbCnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188691"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188691"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:35:11 -0700
X-CSE-ConnectionGUID: zdAo062KTuuHB3no0joZog==
X-CSE-MsgGUID: qrviPW5pREisS+CIzBJ/Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384695"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:35:09 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 41/44] media: ipu6: Set model name for ipu7
Date: Thu, 27 Aug 2026 15:33:33 +0300
Message-ID: <20260827123336.2219048-42-antti.laakso@linux.intel.com>
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

We are about to enable support for ipu7 hardware, set model name
accordingly.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 2 +-
 drivers/media/pci/intel/ipu6/ipu6.c      | 2 ++
 drivers/media/pci/intel/ipu6/ipu6.h      | 3 +++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 3fb34d2d189c..08f29b678d1b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -739,7 +739,7 @@ static int isys_register_devices(struct ipu6_isys *isys)
 
 	isys->media_dev.dev = dev;
 	media_device_pci_init(&isys->media_dev,
-			      pdev, IPU6_MEDIA_DEV_MODEL_NAME);
+			      pdev, isys->adev->isp->model_name);
 
 	strscpy(isys->v4l2_dev.name, isys->media_dev.model,
 		sizeof(isys->v4l2_dev.name));
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index c73b2426fb75..21b277bebf26 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -586,6 +586,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	isp->cpd_metadata_cmpnt_size = sizeof(struct ipu6_cpd_metadata_cmpnt);
 	isp->buttress.regs = &ipu6_buttress_regs;
+	isp->model_name = IPU6_MEDIA_DEV_MODEL_NAME;
 	isys_ctrl = &ipu6_isys_buttress_ctrl;
 	psys_ctrl = &ipu6_psys_buttress_ctrl;
 
@@ -616,6 +617,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	case PCI_DEVICE_ID_INTEL_IPU7:
 		isp->hw_ver = IPU_VERSION_7;
 		isp->cpd_fw_name = IPU7_FIRMWARE_NAME;
+		isp->model_name = IPU7_MEDIA_DEV_MODEL_NAME;
 		isp->buttress.regs = &ipu7_buttress_regs;
 		isys_ctrl = &ipu7_isys_buttress_ctrl;
 		psys_ctrl = &ipu7_psys_buttress_ctrl;
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index a2992ffe8e3c..8a696caf4b88 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -16,6 +16,8 @@ struct ipu6_bus_device;
 
 #define IPU6_NAME			"intel-ipu6"
 #define IPU6_MEDIA_DEV_MODEL_NAME	"ipu6"
+#define IPU7_MEDIA_DEV_MODEL_NAME	"ipu7"
+#define IPU7P5_MEDIA_DEV_MODEL_NAME	"ipu7.5"
 
 #define IPU6SE_FIRMWARE_NAME		"intel/ipu/ipu6se_fw.bin"
 #define IPU6EP_FIRMWARE_NAME		"intel/ipu/ipu6ep_fw.bin"
@@ -63,6 +65,7 @@ struct ipu6_device {
 	const struct firmware *cpd_fw;
 	const char *cpd_fw_name;
 	u32 cpd_metadata_cmpnt_size;
+	const char *model_name;
 
 	void __iomem *base;
 	void __iomem *pb_base;
-- 
2.55.0

