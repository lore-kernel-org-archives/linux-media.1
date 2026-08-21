Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0475048BD39
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312700; cv=none; b=Y17MnqZK83Bi66oXxmj6RslQbJ/DaXzr1p90Df+dviBvr1Q0iNhlRbY+vWLDFULxgOhUZ5xtvGCb9EcKC2Yfc8qRK7gFSN9H4C38V/igPOWJwhgxObb0O4jzMM+b47Qvrcag25B1xbWOa09lv6+nkvo50t5jHigot3cfCkLGDbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312700; c=relaxed/simple;
	bh=6fGygeMLZXQJoB5epMJsu0LaYjvB36yJ7F/n+Ovtv5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SMn4ZpBOZgwyv7HHfzFhuhMlaBMCJojFyn/TNnELsGBATt2UE81r1eznZdyaSVKSRsldukKhwTTF7VLvWCJfZp7QjpymvdsuIJ7Rq+WUqDv4S+qNOG61bx5ZTghMm/rz2yuH7ufFPeGA9qGBj/dBaHrp8/VpUB4sm7LvZ+O/7IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xgg03o2y; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xgg03o2y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312699; x=1818848699;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6fGygeMLZXQJoB5epMJsu0LaYjvB36yJ7F/n+Ovtv5U=;
  b=Xgg03o2y/nHExfJiPYuws5QqK7sGrw8XDE5Xes58jNOF8rKOOkYf2+wt
   WYASUssp9ivmJuYe/bvt3UsM5U8SpzIrQD45t5Qi1gG60GSFO/MIoTtFx
   /oU333uYT+fn6lBCp15TVLue53hppz/y5vlSwWxzvPhhdvdOYx2HoX02w
   XNKZmtsGAWRBPHyiAHCY4qWFWwe+EUaZmBQZaDIRq8oLaVlRTBbAiMRAd
   BFRcpuA7JAZIe/x3nHsJTDY0zTCfhlM1gAhOCxOtVkjSqPWIHCLS/Ae5v
   guFHU9d1y3aCWmLbAIQgOLe7iWdbAdGzoONTp5iqR9X4zPlsua9PgaUMF
   g==;
X-CSE-ConnectionGUID: PguULRQcTKSjXEXc6yxH+Q==
X-CSE-MsgGUID: 72uhYUMzTGu97FaBCDpqgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989122"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989122"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:59 -0700
X-CSE-ConnectionGUID: oUytIGq0RJKE8boFIHHLhA==
X-CSE-MsgGUID: tsPx4nwtRXyJVR4RTGSQ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172390"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:57 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 35/44] media: ipu6: Move buttress mem alloc out from probe
Date: Fri, 21 Aug 2026 14:42:53 +0300
Message-ID: <20260821114302.365532-36-antti.laakso@linux.intel.com>
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

Buttress registers are stored in separate buffer, which is passed
down to bus driver. Move allocation of this buffer to subsystem init
to cleanup pci probe function a bit.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 43 +++++++++++++++--------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 7d1c3713a69b..4e4f32723904 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -90,7 +90,7 @@ static struct ipu6_psys_internal_pdata psys_ipdata = {
 	},
 };
 
-static const struct ipu6_buttress_ctrl isys_buttress_ctrl = {
+static const struct ipu6_buttress_ctrl ipu6_isys_buttress_ctrl = {
 	.subsys_id = IPU_ISYS,
 	.ratio = IPU6_IS_FREQ_CTL_DEFAULT_RATIO,
 	.qos_floor = IPU6_IS_FREQ_CTL_DEFAULT_QOS_FLOOR_RATIO,
@@ -101,7 +101,7 @@ static const struct ipu6_buttress_ctrl isys_buttress_ctrl = {
 	.pwr_sts_off = IPU6_BUTTRESS_PWR_STATE_DN_DONE,
 };
 
-static const struct ipu6_buttress_ctrl psys_buttress_ctrl = {
+static const struct ipu6_buttress_ctrl ipu6_psys_buttress_ctrl = {
 	.subsys_id = IPU_PSYS,
 	.ratio = IPU6_PS_FREQ_CTL_DEFAULT_RATIO,
 	.qos_floor = IPU6_PS_FREQ_CTL_DEFAULT_QOS_FLOOR_RATIO,
@@ -341,11 +341,12 @@ static void ipu6_internal_pdata_init(struct ipu6_device *isp)
 
 static struct ipu6_bus_device *
 ipu6_isys_init(struct pci_dev *pdev, struct device *parent,
-	       struct ipu6_buttress_ctrl *ctrl, void __iomem *base,
+	       const struct ipu6_buttress_ctrl *ctrl, void __iomem *base,
 	       const struct ipu6_isys_internal_pdata *ipdata)
 {
 	struct device *dev = &pdev->dev;
 	struct ipu6_bus_device *isys_adev;
+	struct ipu6_buttress_ctrl *devm_ctrl;
 	struct ipu6_isys_pdata *pdata;
 	int ret;
 
@@ -355,6 +356,10 @@ ipu6_isys_init(struct pci_dev *pdev, struct device *parent,
 		return ERR_PTR(ret);
 	}
 
+	devm_ctrl = devm_kmemdup(dev, ctrl, sizeof(*ctrl), GFP_KERNEL);
+	if (!devm_ctrl)
+		return ERR_PTR(-ENOMEM);
+
 	pdata = kzalloc_obj(*pdata);
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
@@ -362,7 +367,7 @@ ipu6_isys_init(struct pci_dev *pdev, struct device *parent,
 	pdata->base = base;
 	pdata->ipdata = ipdata;
 
-	isys_adev = ipu6_bus_initialize_device(pdev, parent, pdata, ctrl,
+	isys_adev = ipu6_bus_initialize_device(pdev, parent, pdata, devm_ctrl,
 					       IPU6_ISYS_NAME);
 	if (IS_ERR(isys_adev)) {
 		kfree(pdata);
@@ -388,13 +393,19 @@ ipu6_isys_init(struct pci_dev *pdev, struct device *parent,
 
 static struct ipu6_bus_device *
 ipu6_psys_init(struct pci_dev *pdev, struct device *parent,
-	       struct ipu6_buttress_ctrl *ctrl, void __iomem *base,
+	       const struct ipu6_buttress_ctrl *ctrl, void __iomem *base,
 	       const struct ipu6_psys_internal_pdata *ipdata)
 {
+	struct device *dev = &pdev->dev;
 	struct ipu6_bus_device *psys_adev;
+	struct ipu6_buttress_ctrl *devm_ctrl;
 	struct ipu6_psys_pdata *pdata;
 	int ret;
 
+	devm_ctrl = devm_kmemdup(dev, ctrl, sizeof(*ctrl), GFP_KERNEL);
+	if (!devm_ctrl)
+		return ERR_PTR(-ENOMEM);
+
 	pdata = kzalloc_obj(*pdata);
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
@@ -402,7 +413,7 @@ ipu6_psys_init(struct pci_dev *pdev, struct device *parent,
 	pdata->base = base;
 	pdata->ipdata = ipdata;
 
-	psys_adev = ipu6_bus_initialize_device(pdev, parent, pdata, ctrl,
+	psys_adev = ipu6_bus_initialize_device(pdev, parent, pdata, devm_ctrl,
 					       IPU6_PSYS_NAME);
 	if (IS_ERR(psys_adev)) {
 		kfree(pdata);
@@ -469,7 +480,7 @@ static void ipu6_configure_vc_mechanism(struct ipu6_device *isp)
 
 static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
-	struct ipu6_buttress_ctrl *isys_ctrl = NULL, *psys_ctrl = NULL;
+	const struct ipu6_buttress_ctrl *isys_ctrl, *psys_ctrl;
 	struct device *dev = &pdev->dev;
 	void __iomem *isys_base = NULL;
 	void __iomem *psys_base = NULL;
@@ -484,6 +495,8 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	isp->cpd_metadata_cmpnt_size = sizeof(struct ipu6_cpd_metadata_cmpnt);
 	isp->buttress.regs = &ipu6_buttress_regs;
+	isys_ctrl = &ipu6_isys_buttress_ctrl;
+	psys_ctrl = &ipu6_psys_buttress_ctrl;
 
 	switch (id->device) {
 	case PCI_DEVICE_ID_INTEL_IPU6:
@@ -513,6 +526,8 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		isp->hw_ver = IPU_VERSION_7;
 		isp->cpd_fw_name = IPU7_FIRMWARE_NAME;
 		isp->buttress.regs = &ipu7_buttress_regs;
+		isys_ctrl = &ipu7_isys_buttress_ctrl;
+		psys_ctrl = &ipu7_psys_buttress_ctrl;
 		break;
 	default:
 		return dev_err_probe(dev, -ENODEV,
@@ -582,13 +597,6 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto out_ipu6_bus_del_devices;
 	}
 
-	isys_ctrl = devm_kmemdup(dev, &isys_buttress_ctrl,
-				 sizeof(isys_buttress_ctrl), GFP_KERNEL);
-	if (!isys_ctrl) {
-		ret = -ENOMEM;
-		goto out_ipu6_bus_del_devices;
-	}
-
 	isp->isys = ipu6_isys_init(pdev, dev, isys_ctrl, isys_base,
 				   &isys_ipdata);
 	if (IS_ERR(isp->isys)) {
@@ -596,13 +604,6 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto out_ipu6_bus_del_devices;
 	}
 
-	psys_ctrl = devm_kmemdup(dev, &psys_buttress_ctrl,
-				 sizeof(psys_buttress_ctrl), GFP_KERNEL);
-	if (!psys_ctrl) {
-		ret = -ENOMEM;
-		goto out_ipu6_bus_del_devices;
-	}
-
 	isp->psys = ipu6_psys_init(pdev, &isp->isys->auxdev.dev, psys_ctrl,
 				   psys_base, &psys_ipdata);
 	if (IS_ERR(isp->psys)) {
-- 
2.55.0

