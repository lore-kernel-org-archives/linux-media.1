Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848733914E8
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312714; cv=none; b=uPe691u2k1EdE8ucjFTXuN3zr5FOkblpTGPmLyuG33YmdFDCOP502QPxHuXFmwWP9CusvdO1UmT+YonGgkZP8/boJJrhjPtbN4wjd9PBMh5VrvgdA1g6lRD2XmIfCZ7S7tBGIfTWML+AtBeM0SruUuVLbubjXDIgZDbbctOohfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312714; c=relaxed/simple;
	bh=FAXRebLuJmDVCKOCRg+Is1IPzTEGUy03Pou16aYpypI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JyYuVtzvFDPAlfqcT+/QZyYZHSQT21sNCLl78TiB0QnxmrtOu09m6Izkl7dE7crpKUGFMc9qzNmEDxYcnz6PvdM/JAWJsQclCsqvTDw83du9yvucqmATj0VLFh3KWCcUMXJP0DlSkTu83BRKrl5CKZyXBpyFxiZK08pTAVMeOlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WzGsMgXf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WzGsMgXf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312712; x=1818848712;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FAXRebLuJmDVCKOCRg+Is1IPzTEGUy03Pou16aYpypI=;
  b=WzGsMgXfbfXfahUyy941rQXMi0hS9L4//HUFfjYne7XscU2zFjKx/tuZ
   Vhp37nGofUZ7yK2fULNBZI9oBysTivuJ4BhYnfa82q7BKoIurtwOag7L6
   D2F+YyWgp8qGEILtcY2onZqS6Vgo94lguinIje/S6Zassi5zlhzkDzyAJ
   q4dVvJm2Iq6gjkVXSVrNl2wg6JItB4OQ268bdEkEEqKUuBCvRt7zGzS5T
   E5l/Qmyx3gBUbkamDfCJfNxnCHUUfkrLY+e9s4X27z33YCjAaWMvESmU3
   WouHtkh1y4+Wyz1ze+w4vrtCTNo5XbTMiyXYCnVL1Tv7NDgcEds8x4qRB
   A==;
X-CSE-ConnectionGUID: b+tVDnzvQzmZLAU7K3F1iw==
X-CSE-MsgGUID: MHi0aRfkT5yfMNkY1bGRUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989141"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989141"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:45:12 -0700
X-CSE-ConnectionGUID: ET5AzFOYSKSUyXJCHJHHHg==
X-CSE-MsgGUID: fPg9xLTTRMCQAuFcj2ADUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172484"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:45:10 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 41/44] media: ipu6: Set model name for ipu7
Date: Fri, 21 Aug 2026 14:42:59 +0300
Message-ID: <20260821114302.365532-42-antti.laakso@linux.intel.com>
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
index 93f28ec9a74d..a4fd7333c68b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -585,6 +585,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	isp->cpd_metadata_cmpnt_size = sizeof(struct ipu6_cpd_metadata_cmpnt);
 	isp->buttress.regs = &ipu6_buttress_regs;
+	isp->model_name = IPU6_MEDIA_DEV_MODEL_NAME;
 	isys_ctrl = &ipu6_isys_buttress_ctrl;
 	psys_ctrl = &ipu6_psys_buttress_ctrl;
 
@@ -615,6 +616,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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

