Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39A4202C29
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834090; cv=none; b=cDfHXkiYMjwcaQAeO/bOMhG3Ce5fTGq0LEmPzsKZ9UttDp2HbZhnz19U58B5Dx5L2N6X9n6y2tvlDjnv5+vGaiZaUIC/ohaaYA0JBOqetAPH01TckdGjuXYBBV3ig+hH5NbSDeSSMnJVxY4/nghXxuaw0X/IsnW05LLgnkBYc3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834090; c=relaxed/simple;
	bh=Gfk/F54PaxyidR8rjc3EeabQjRb4h9p61gdYpHjT+S4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/RcPp45iw/vjq2blWaeKwlgQTC1PQyBwFPFx+zeHHp3MLcADQMUEdDK5tqrXCg+CWb353lFf4CAQOJ1FaTpnt2SJG/43TiPo85hVasVzGwY0BzKyYGSvfi0jDM95CG3STHlT/Bd+Vg8HgZFxCHlPH63LULB/RXniOqSvFrO25A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BqUU8PBb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BqUU8PBb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834088; x=1819370088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gfk/F54PaxyidR8rjc3EeabQjRb4h9p61gdYpHjT+S4=;
  b=BqUU8PBbibQu5h8faU/ocMcD4eYYdN/NoD0wXOmDbh+/y94HS8oEihPh
   3WsDNOGAamvg4OIqNuyrEkk4RJk/BIJfz7zEBOEo/nRJohfZ+aOuXLtOX
   7L7K3AJLq5J0R9/55HMBfMZ9UsHi/QI2jSKJ9W/LVoVLMBm+SuUHR6iRu
   Rfa3bkrSYwrI0CZvVNqY6cTMBl8TbaZ/i6nQHCDpH+YnKpAi6GrzKuIaq
   laLl7htRVa7CfVcjsM+GV6N23xITkiSuBNL1Lw3/20iL0UB+mdsUCYdx8
   ZauPvRZ09PijHCPZ4kgv4dkVB4KzL2C7FD12X3F5gm98IanPUz88oJ85J
   g==;
X-CSE-ConnectionGUID: M+WLblV0SiKTc2hXiQCTVw==
X-CSE-MsgGUID: HQK33TzJTMWaDVSZ9EgKfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188647"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188647"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:47 -0700
X-CSE-ConnectionGUID: 4h7uJWvGQienzf4ftwTQMA==
X-CSE-MsgGUID: 27gMXHegSYmC0TiUIXkYzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384488"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:46 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 29/44] media: ipu6: Add support for ipu7 csi2 receiver
Date: Thu, 27 Aug 2026 15:33:21 +0300
Message-ID: <20260827123336.2219048-30-antti.laakso@linux.intel.com>
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

