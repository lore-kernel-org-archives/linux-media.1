Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DE63CAA41
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 07:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839919; cv=none; b=O7YzMlgSFBPJ6TNsaFXYiKu8CQi2qiEG4cKefRTdGlMw4Et/LfDkhuXc8dZ+MjMHjoBM3hvOwmolOPsItw9xCcEfcnMDYuageoRFPSshIKPC3oxzKQD1lNb36DWwSGfNwFti4pMSKO/l4kT1+jKEiRoipi9GPv1PyaYCtHs92p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839919; c=relaxed/simple;
	bh=FsRo4M3ICMTFq098t7COXkwhffqiufwulZPO0cDZ9dA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q/mZh24q7Q1D1Yaqh/2lwbnvn/CWXN1issnaoUdHphSvXYv6ALugYqaPMnQyWf83tTUA6QXrB2Vk1WRg6Dqw+cctgJ1fPRj6uamlK+dS5y5/K0EvefL5Ti5CwaQx67MeD8sHUaBRCWDq9C4ohewf6pR/3hwx0McqBpOz0AOl6ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mrm4CXgn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mrm4CXgn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790839918; x=1822375918;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FsRo4M3ICMTFq098t7COXkwhffqiufwulZPO0cDZ9dA=;
  b=Mrm4CXgnAu7KbBK5j0vPeEtlik+5IU5LQ4i0VV6/R6i72nZ1Fs3tFGKQ
   MscPfeOmJOZ99nOZptOl7mX5yBqrs1rI6WWXLgywCvQVywwvPDSD1IUdb
   dN9XyN+dDL/7mqYzCQryXvKmJpbrmqJjdL2UHEcLGjyrq+w/qVPJQsXI9
   zvHOAHKbSaEUVNN7+lwaTAFcxMNHJXDjaWgNVF6Wyr74nqVbXf9fenFwA
   wixd0GEX8GjnDzg3tf8/SaFFin2dJuQLVuShaMUsXuLZoS02niFO3H61m
   c+D9mMM1viWyVWBb8ZS0J9ELEiInkt55bxo+yj9A44Rs2azy6lCNv2Lj6
   w==;
X-CSE-ConnectionGUID: J1etpaKJTJuoc/tOB9uOSg==
X-CSE-MsgGUID: BwGRbkfXQWmd1QkagPnvyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="79150773"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="79150773"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:31:52 -0700
X-CSE-ConnectionGUID: AatSNOdpQfmb5LrJnOMN6g==
X-CSE-MsgGUID: JMpdZKN7RKavvY8/0esD1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="279215616"
Received: from vtg-bdc-vm10.iil.intel.com ([143.185.124.149])
  by orviesa004.jf.intel.com with ESMTP; 01 Oct 2026 00:31:50 -0700
From: Divyamani Tripathi <divyamani.tripathi@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	sarang.sapre@intel.com,
	manik.bajpai@intel.com,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH v2 4/7] media: ipu6: make ipu7 gpreg stride configurable as per IPU version
Date: Thu,  1 Oct 2026 10:31:31 +0300
Message-ID: <20261001073134.4031143-5-divyamani.tripathi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001073134.4031143-1-divyamani.tripathi@intel.com>
References: <20261001073134.4031143-1-divyamani.tripathi@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IPU8's GPREG stride is 0x2000, not IPU7's hardcoded 0x1000. Add
csi2.gpreg_stride and use it in the two gpreg accessors instead of the
fixed value, wiring it up for both IPU7 and IPU8 in
ipu6_internal_pdata_init().

Signed-off-by: Divyamani Tripathi <divyamani.tripathi@intel.com>
---
Changes since v1:
- Use separate "if (IS_IPU7(isp))" / "if (IS_IPU8(isp))" blocks in
  ipu6_internal_pdata_init() instead of "if (IS_IPU8(isp)) { ... }
  else { ... }", so a third/unknown IPU version can't silently fall
  into the IPU7 branch just because it isn't IPU8.

 drivers/media/pci/intel/ipu6/ipu6.c                | 7 +++++++
 drivers/media/pci/intel/ipu6/ipu6.h                | 1 +
 drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.c   | 6 ++++--
 drivers/media/pci/intel/ipu6/ipu7-isys-csi2-regs.h | 2 ++
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 43d951735f72..965410defa09 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -373,6 +373,13 @@ static void ipu6_internal_pdata_init(struct ipu6_device *isp)
 
 	if (IS_IPU7(isp)) {
 		isys_ipdata.csi2.gpreg = IPU7_IS_IO_CSI2_GPREGS_BASE;
+		isys_ipdata.csi2.gpreg_stride = IPU7_IS_IO_CSI2_GPREGS_STRIDE;
+		isys_ipdata.csi2.nports = 4;
+	}
+
+	if (IS_IPU8(isp)) {
+		isys_ipdata.csi2.gpreg = IPU8_IS_IO_CSI2_GPREGS_BASE;
+		isys_ipdata.csi2.gpreg_stride = IPU8_IS_IO_CSI2_GPREGS_STRIDE;
 		isys_ipdata.csi2.nports = 4;
 	}
 }
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index 20ffbb4a9934..00fb78a1ec1d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -147,6 +147,7 @@ struct ipu6_isys_internal_csi2_pdata {
 	u32 fw_access_port_ofs;
 	/* IPU7-specific field */
 	u32 gpreg;
+	u32 gpreg_stride;
 };
 
 struct ipu6_isys_internal_tpg_pdata {
diff --git a/drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.c b/drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.c
index 10273c687faa..ac4f94764407 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.c
@@ -167,7 +167,8 @@ static void gpreg_write(struct ipu6_isys *isys, u32 id, u32 addr, u32 data)
 {
 	void __iomem *isys_base = isys->pdata->base;
 	u32 gpreg = isys->pdata->ipdata->csi2.gpreg;
-	void __iomem *base = isys_base + gpreg + 0x1000 * id;
+	void __iomem *base = isys_base + gpreg +
+				     isys->pdata->ipdata->csi2.gpreg_stride * id;
 	struct device *dev = &isys->adev->auxdev.dev;
 
 	dev_dbg(dev, "gpreg write: reg 0x%lx = data 0x%08x",
@@ -344,7 +345,8 @@ static int ipu7_isys_phy_ready(struct ipu6_isys *isys, u32 id)
 {
 	void __iomem *isys_base = isys->pdata->base;
 	u32 gpreg_offset = isys->pdata->ipdata->csi2.gpreg;
-	void __iomem *gpreg = isys_base + gpreg_offset + 0x1000 * id;
+	void __iomem *gpreg = isys_base + gpreg_offset +
+				      isys->pdata->ipdata->csi2.gpreg_stride * id;
 	struct device *dev = &isys->adev->auxdev.dev;
 	u32 phy_ready;
 	u32 reg, rext;
diff --git a/drivers/media/pci/intel/ipu6/ipu7-isys-csi2-regs.h b/drivers/media/pci/intel/ipu6/ipu7-isys-csi2-regs.h
index 3859401d4802..4f7f33b9d661 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-isys-csi2-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu7-isys-csi2-regs.h
@@ -968,7 +968,9 @@
 
 /* software config the phy */
 #define IPU7_IS_IO_CSI2_GPREGS_BASE		(IPU7_IS_IO_BASE + 0x53400)
+#define IPU7_IS_IO_CSI2_GPREGS_STRIDE		0x1000
 #define IPU8_IS_IO_CSI2_GPREGS_BASE		(IPU7_IS_IO_BASE + 0x40e00)
+#define IPU8_IS_IO_CSI2_GPREGS_STRIDE		0x2000
 #define IPU7_CSI_ADAPT_LAYER_SRST		0x0
 #define IPU7_MPF_SRST_RST			0x4
 #define IPU7_CSI_ERR_IRQ_CTRL_SRST		0x8
-- 
2.43.0

