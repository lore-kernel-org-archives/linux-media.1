Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C1848C8AA
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312687; cv=none; b=K+ytzdQaS0LEIG90Rkxk0HX113p1IZrPNuTx2fvqWUr+YTRg+CGVrQAh2fQK583+GBxM2EKUh6+JSCA5S2wZe+6jyIc5Fe4kWasG4t5Ip73YFtu0H17ZUQOb2QEucBfFqsb3HEnHds/aryj4hAzUE3gTj//rNdMr8E/9dip0K3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312687; c=relaxed/simple;
	bh=Gfk/F54PaxyidR8rjc3EeabQjRb4h9p61gdYpHjT+S4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZK6hW8n1p6MkJmAXuo5jA46iw+yyjUE1gAEzed7F2LCnOuAWjsSgr8lRLrolANBKQGFFXMbdFuRTFEoCdZw0BOn70UkLO3jfwEzbATBwbZo45PjZZFm4/WRQOikHG9GB9+XofM92PnBViaxRuJv45WabDwlB8OHePLCwEzDsA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABId3FWF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABId3FWF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312686; x=1818848686;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gfk/F54PaxyidR8rjc3EeabQjRb4h9p61gdYpHjT+S4=;
  b=ABId3FWFxrzg+AhLajqPZxReZxCI2FddbSRf091x2CA15zGz/2hu4ZZk
   mqzFYYtZTR5ZvCAyZl17Olg+z/oaT2q0xOgqHhTWJBSEtN1XAGNcEookX
   auKin6BDC+GeQ9tUkWiu/kVK9J7dYtD0JCY3INh6x9DuyozQEcPr/A3ws
   YWm9kgopcGsNJJzZPqT4HqeJkaqVcbYSXbbHKWM/nyzJo06IxeFeY5hnp
   LP5rb3aA9DD+f/P6FGIg/3Lecgzw6WcyHS9JXGUhmoiF0CSWoLKiSPj62
   d5Bejqk2OwQL8w3sW5QPVPlzYRd27CwKyEdS8yWiU+NCwoD5nBFbZsiPT
   g==;
X-CSE-ConnectionGUID: o+8fOcMmSEW5sJk41+l11w==
X-CSE-MsgGUID: /pKk65ziQ6aNAUOOwkChxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989107"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989107"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:45 -0700
X-CSE-ConnectionGUID: +s2JLVFxTXGtpgSb5w+u+w==
X-CSE-MsgGUID: sWHBMoM8STGObgWHGspQ7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172354"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:43 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 29/44] media: ipu6: Add support for ipu7 csi2 receiver
Date: Fri, 21 Aug 2026 14:42:47 +0300
Message-ID: <20260821114302.365532-30-antti.laakso@linux.intel.com>
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

The csi2 receiver is different in ipu7, add support for it.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 119 +++++++++++++++++-
 1 file changed, 114 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 7b63b08f5c54..160eace947f4 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -24,6 +24,7 @@
 #include "ipu6-isys-csi2.h"
 #include "ipu6-isys-subdev.h"
 #include "ipu6-platform-isys-csi2-reg.h"
+#include "ipu7-isys-csi2-regs.h"
 
 static const u32 csi2_supported_codes[] = {
 	MEDIA_BUS_FMT_RGB565_1X16,
@@ -267,6 +268,10 @@ static int ipu6_isys_csi2_stream_enable(struct ipu6_isys_csi2 *csi2)
 	cfg.port = csi2->port;
 	cfg.nlanes = csi2->nlanes;
 
+	ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
+	if (ret)
+		return ret;
+
 	mask = isys->pdata->ipdata->csi2.irq_mask;
 	nports = isys->pdata->ipdata->csi2.nports;
 
@@ -327,11 +332,106 @@ static int ipu6_isys_csi2_stream_enable(struct ipu6_isys_csi2 *csi2)
 	writel(1, csi2->base + CSI_REG_PPI2CSI_ENABLE);
 	writel(1, csi2->base + CSI_REG_CSI_FE_ENABLE);
 
-	ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
+	return isys->phy_set_power(isys, &cfg, &timing, true);
+}
+
+static void ipu7_csi2_irq_enable(struct ipu6_isys_csi2 *csi2)
+{
+	struct ipu6_isys *isys = csi2->isys;
+	unsigned int offset, mask;
+
+	/* enable CSI2 legacy error irq */
+	offset = IPU7_IS_IO_CSI2_ERR_LEGACY_IRQ_CTL_BASE(csi2->port);
+	mask = IPU7_CSI_RX_ERROR_IRQ_MASK;
+	writel(mask, csi2->base + offset + IPU7_IRQ_CTL_CLEAR);
+	writel(mask, csi2->base + offset + IPU7_IRQ_CTL_MASK);
+	writel(mask, csi2->base + offset + IPU7_IRQ_CTL_ENABLE);
+
+	/* enable CSI2 legacy sync irq */
+	offset = IPU7_IS_IO_CSI2_SYNC_LEGACY_IRQ_CTL_BASE(csi2->port);
+	mask = IPU7_CSI_RX_SYNC_IRQ_MASK;
+	writel(mask, csi2->base + offset + IPU7_IRQ_CTL_CLEAR);
+	writel(mask, csi2->base + offset + IPU7_IRQ_CTL_MASK);
+	writel(mask, csi2->base + offset + IPU7_IRQ_CTL_ENABLE);
+
+	if (!IS_IPU7_MTL(isys->adev->isp)) {
+		mask = IPU7P5_CSI_RX_SYNC_FE_IRQ_MASK;
+		writel(mask, csi2->base + offset + IPU7_IRQ1_CTL_CLEAR);
+		writel(mask, csi2->base + offset + IPU7_IRQ1_CTL_MASK);
+		writel(mask, csi2->base + offset + IPU7_IRQ1_CTL_ENABLE);
+	}
+}
+
+static void ipu7_csi2_irq_disable(struct ipu6_isys_csi2 *csi2)
+{
+	struct ipu6_isys *isys = csi2->isys;
+	unsigned int offset, mask;
+
+	/* disable CSI2 legacy error irq */
+	offset = IPU7_IS_IO_CSI2_ERR_LEGACY_IRQ_CTL_BASE(csi2->port);
+	mask = IPU7_CSI_RX_ERROR_IRQ_MASK;
+	writel(mask, csi2->base + offset + IPU7_IRQ_CTL_CLEAR);
+	writel(0, csi2->base + offset + IPU7_IRQ_CTL_MASK);
+	writel(0, csi2->base + offset + IPU7_IRQ_CTL_ENABLE);
+
+	/* disable CSI2 legacy sync irq */
+	offset = IPU7_IS_IO_CSI2_SYNC_LEGACY_IRQ_CTL_BASE(csi2->port);
+	mask = IPU7_CSI_RX_SYNC_IRQ_MASK;
+	writel(mask, csi2->base + offset + IPU7_IRQ_CTL_CLEAR);
+	writel(0, csi2->base + offset + IPU7_IRQ_CTL_MASK);
+	writel(0, csi2->base + offset + IPU7_IRQ_CTL_ENABLE);
+
+	if (!IS_IPU7_MTL(isys->adev->isp)) {
+		writel(mask, csi2->base + offset + IPU7_IRQ1_CTL_CLEAR);
+		writel(0, csi2->base + offset + IPU7_IRQ1_CTL_MASK);
+		writel(0, csi2->base + offset + IPU7_IRQ1_CTL_ENABLE);
+	}
+}
+
+static void ipu7_isys_csi2_stream_disable(struct ipu6_isys_csi2 *csi2)
+{
+	struct ipu6_isys *isys = csi2->isys;
+	void __iomem *base = isys->pdata->base;
+	struct ipu6_isys_csi2_config cfg;
+
+	cfg.port = csi2->port;
+	cfg.nlanes = csi2->nlanes;
+
+	isys->phy_set_power(isys, &cfg, NULL, false);
+
+	writel(0x4,
+	       base + IPU7_IS_IO_GPREGS_BASE + IPU7_CLK_DIV_FACTOR_APB_CLK);
+	ipu7_csi2_irq_disable(csi2);
+}
+
+static int ipu7_isys_csi2_stream_enable(struct ipu6_isys_csi2 *csi2)
+{
+	struct ipu6_isys *isys = csi2->isys;
+	void __iomem *base = isys->pdata->base;
+	struct ipu6_isys_csi2_config cfg;
+	unsigned int offset = IPU7_IS_IO_GPREGS_BASE;
+	int ret;
+
+	writel(0x2, base + offset + IPU7_CLK_DIV_FACTOR_APB_CLK);
+	if (csi2->port == 0U && csi2->nlanes == 4U &&
+	    !IS_IPU7_MTL(isys->adev->isp))
+		writel(0x1, base + offset + IPU7_CSI_PORTAB_AGGREGATION);
+
+	/* input is coming from CSI receiver (sensor) */
+	offset = IPU7_IS_IO_CSI2_ADPL_PORT_BASE(csi2->port);
+	writel(CSI_SENSOR_INPUT, base + offset + IPU7_CSI2_ADPL_INPUT_MODE);
+	writel(1, base + offset + IPU7_CSI2_ADPL_CSI_RX_ERR_IRQ_CLEAR_EN);
+
+	cfg.port = csi2->port;
+	cfg.nlanes = csi2->nlanes;
+
+	ret = isys->phy_set_power(isys, &cfg, NULL, true);
 	if (ret)
 		return ret;
 
-	return isys->phy_set_power(isys, &cfg, &timing, true);
+	ipu7_csi2_irq_enable(csi2);
+
+	return 0;
 }
 
 static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
@@ -340,6 +440,7 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 {
 	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
 	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
+	struct ipu6_device *isp = asd->isys->adev->isp;
 	struct v4l2_subdev *remote_sd;
 	struct media_pad *remote_pad;
 	u64 sink_streams;
@@ -352,14 +453,18 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
 						&streams_mask);
 
-	ret = ipu6_isys_csi2_stream_enable(csi2);
+	ret = IS_IPU7(isp) ? ipu7_isys_csi2_stream_enable(csi2) :
+			     ipu6_isys_csi2_stream_enable(csi2);
 	if (ret)
 		return ret;
 
 	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index,
 					 sink_streams);
 	if (ret) {
-		ipu6_isys_csi2_stream_disable(csi2);
+		if IS_IPU7(isp)
+			ipu7_isys_csi2_stream_disable(csi2);
+		else
+			ipu6_isys_csi2_stream_disable(csi2);
 		return ret;
 	}
 
@@ -372,6 +477,7 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 {
 	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
 	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
+	struct ipu6_device *isp = asd->isys->adev->isp;
 	struct v4l2_subdev *remote_sd;
 	struct media_pad *remote_pad;
 	u64 sink_streams;
@@ -383,7 +489,10 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
-	ipu6_isys_csi2_stream_disable(csi2);
+	if IS_IPU7(isp)
+		ipu7_isys_csi2_stream_disable(csi2);
+	else
+		ipu6_isys_csi2_stream_disable(csi2);
 
 	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, sink_streams);
 
-- 
2.55.0

