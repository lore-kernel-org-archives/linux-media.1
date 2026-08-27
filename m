Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C2C202C29
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834106; cv=none; b=lOWvjg6pPS4kAl2ra1TWYW85JGIpmRcFtSSTZSNPTNb8J1PK74EcdWTTbLwmUBCtyiMCTpzi++65Xz5796EU5Gx2DTuRpeAU6YvO1KK/P/jeCfGNUZBc4rd0gOpC8n7Jtzprf1ObfK/pVDTC6fytdxkzTyQgV4ut6cj5WPh1mXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834106; c=relaxed/simple;
	bh=6fGygeMLZXQJoB5epMJsu0LaYjvB36yJ7F/n+Ovtv5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bg9+lG1Wkbbt52uEmeS9N0/vbl3EnTsQBmib7RgXqt/GptkJyH3jOunm55pvICSumB8+Zepanec6UMfpe/tOgquW/HbS+npUMB+FUJuEXnH5XJPLIeQbvm6NDiu1FzvJqU+XWYw1ebLj6GZpNvYCy8HW3fAPPmD4ljERNL6Tj9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h1kEdpe7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h1kEdpe7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834101; x=1819370101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6fGygeMLZXQJoB5epMJsu0LaYjvB36yJ7F/n+Ovtv5U=;
  b=h1kEdpe7GX/cTsNIPMSQhVOv2uIt3fdIicFd9tg1hFUMMNcf3DrViV5n
   zsmUVkOUk4R2OJkXB9BQKbewoUQ51p3MjOYi69zVawf2UHClLKbip4pYs
   36dTnwo/co1xGnd+lBXnIArlz3os8djY6eILuHe0XFSimEKsayCG+WxEC
   8WpdxemcLrlGliqexAK9jNUc5cUJoqGRjKw+oPiH/hzw+/oaHwG6kwsS0
   DbZ1nr1H3gGk0JuoDWDooEP/vkNSPLQn3JVlAGvp0z4CTKqNdJkpCwKhO
   95+sq+Yv+Q7Ho9FuemNlFOWTi2yZGxZVmmhRI23pynBhehYGCzyEc4GOM
   A==;
X-CSE-ConnectionGUID: lCmwmiPFQx22Fo/4HJwLhg==
X-CSE-MsgGUID: CAEDTdUESj65c8jG/Y/uxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188662"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188662"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:59 -0700
X-CSE-ConnectionGUID: 2ql1dvSlQAanNOnVfazBAQ==
X-CSE-MsgGUID: JUQuSCa9RbG/tKZ09Gqp/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384523"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:58 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 35/44] media: ipu6: Move buttress mem alloc out from probe
Date: Thu, 27 Aug 2026 15:33:27 +0300
Message-ID: <20260827123336.2219048-36-antti.laakso@linux.intel.com>
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

