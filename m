Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF8848A2D0
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312685; cv=none; b=EMNsFubog3yNHxJGYQUPT9u4ulMkX+1R/m/qbybWotAFYKXVDzyAdFJFpHCT9117GDxM10cMcjQW8kFDTYu8zx78RK2uLkJZRWVOKk/KJADGcTFT8RRAfg5ZvDkw/0Csf7ltBBo7kGjmPRNQajoYg/f+UX1zMKFo0XBtWM1kYLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312685; c=relaxed/simple;
	bh=Blx6457ztkLp0L01lpDJYBdBHDoVEaBT5MIufnP5fF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AUVVOFkRXuYZQGvWAmPU4inaBgmbQ9hNq9FMuiJsjTN/vOI6CoyeeE2PBT7m9d7IhAhiZgq34h/FNtHfKX+SQ9CHIGcPtFmCAibr6m6Jy0WWn/LktDd4L83+u+9KJbuN84WDDO60irytd55Y0iXlDwIRHBh8gfGnnANyOeGYcxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mu7UoY1U; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mu7UoY1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312684; x=1818848684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Blx6457ztkLp0L01lpDJYBdBHDoVEaBT5MIufnP5fF0=;
  b=mu7UoY1UHJHBVFbczThx1IHKWkf/WSo94fPA42JRLbElsZUxXSgSgyAh
   YxnsDr4KtshSX3x+Hi7HT59l4XEvEXrREsM+1v5h2FyasZnAlBdAnGTSZ
   Atql6J5kibhiQ8xnOVTiQgxOgrMW77GgJrN9HU7fk7dey58PRGXgs/l9l
   bSCPPzSkepYcS1M+ZjIz5EPuCuJ8sL+pWdzVENnzek90S3ssSM/YS3Is9
   Gc6gOSgiyp3AXnVVEKAFk5Vc2WEHUnC0j0Bq20kCiPZUCgUPFpIuc3abQ
   oVSeQuXLPwflTbm718CKjLcrr/8EYftxQWLrS/0QELNdTWlPgx9myj1Ym
   Q==;
X-CSE-ConnectionGUID: nj46T6p5RAagORM53fwpyw==
X-CSE-MsgGUID: o5ABbRn0RlW5mVeFhw4OwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989104"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989104"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:43 -0700
X-CSE-ConnectionGUID: zCx3VBr3RDGhbOQ0MFrJmg==
X-CSE-MsgGUID: EAmFl8j/QH6RNHhcSE3B1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172348"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:41 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 28/44] media: ipu6: Split ipu6 csi2 stream enable/disable
Date: Fri, 21 Aug 2026 14:42:46 +0300
Message-ID: <20260821114302.365532-29-antti.laakso@linux.intel.com>
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

Instead of single function, split csi2 receiver stream enable and
disable into own functions. This make it easier to add ipu7 support.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 98 ++++++++-----------
 1 file changed, 43 insertions(+), 55 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 7e539a0c6c92..7b63b08f5c54 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -228,64 +228,55 @@ void ipu6_isys_csi2_error(struct ipu6_isys_csi2 *csi2)
 	}
 }
 
-static int ipu6_isys_csi2_set_stream(struct v4l2_subdev *sd,
-				     const struct ipu6_isys_csi2_timing *timing,
-				     unsigned int nlanes, int enable)
+static void ipu6_isys_csi2_stream_disable(struct ipu6_isys_csi2 *csi2)
 {
-	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
-	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
 	struct ipu6_isys *isys = csi2->isys;
-	struct device *dev = &isys->adev->auxdev.dev;
 	struct ipu6_isys_csi2_config cfg;
-	unsigned int nports;
-	int ret = 0;
-	u32 mask = 0;
-	u32 i;
+	u32 mask = isys->pdata->ipdata->csi2.irq_mask;
+
+	cfg.port = csi2->port;
+	cfg.nlanes = csi2->nlanes;
+
+	writel(0, csi2->base + CSI_REG_CSI_FE_ENABLE);
+	writel(0, csi2->base + CSI_REG_PPI2CSI_ENABLE);
+	writel(0, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI +
+	       CSI_PORT_REG_BASE_IRQ_ENABLE_OFFSET);
+	writel(mask, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI +
+	       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
+	writel(0, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
+	       CSI_PORT_REG_BASE_IRQ_ENABLE_OFFSET);
+	writel(0xffffffff, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
+	       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
 
-	dev_dbg(dev, "stream %s CSI2-%u with %u lanes\n", enable ? "on" : "off",
-		csi2->port, nlanes);
+	isys->phy_set_power(isys, &cfg, NULL, false);
+
+	writel(0, isys->pdata->base + CSI_REG_HUB_FW_ACCESS_PORT
+	       (isys->pdata->ipdata->csi2.fw_access_port_ofs, csi2->port));
+	writel(0, isys->pdata->base + CSI_REG_HUB_DRV_ACCESS_PORT(csi2->port));
+}
+
+static int ipu6_isys_csi2_stream_enable(struct ipu6_isys_csi2 *csi2)
+{
+	struct ipu6_isys *isys = csi2->isys;
+	struct ipu6_isys_csi2_timing timing = { };
+	struct ipu6_isys_csi2_config cfg;
+	unsigned int nports;
+	u32 mask;
+	int ret;
 
 	cfg.port = csi2->port;
-	cfg.nlanes = nlanes;
+	cfg.nlanes = csi2->nlanes;
 
 	mask = isys->pdata->ipdata->csi2.irq_mask;
 	nports = isys->pdata->ipdata->csi2.nports;
 
-	if (!enable) {
-		writel(0, csi2->base + CSI_REG_CSI_FE_ENABLE);
-		writel(0, csi2->base + CSI_REG_PPI2CSI_ENABLE);
-
-		writel(0,
-		       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI +
-		       CSI_PORT_REG_BASE_IRQ_ENABLE_OFFSET);
-		writel(mask,
-		       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI +
-		       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
-		writel(0,
-		       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
-		       CSI_PORT_REG_BASE_IRQ_ENABLE_OFFSET);
-		writel(0xffffffff,
-		       csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
-		       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
-
-		isys->phy_set_power(isys, &cfg, timing, false);
-
-		writel(0, isys->pdata->base + CSI_REG_HUB_FW_ACCESS_PORT
-		       (isys->pdata->ipdata->csi2.fw_access_port_ofs,
-			csi2->port));
-		writel(0, isys->pdata->base +
-		       CSI_REG_HUB_DRV_ACCESS_PORT(csi2->port));
-
-		return ret;
-	}
-
 	/* reset port reset */
 	writel(0x1, csi2->base + CSI_REG_PORT_GPREG_SRST);
 	usleep_range(100, 200);
 	writel(0x0, csi2->base + CSI_REG_PORT_GPREG_SRST);
 
 	/* enable port clock */
-	for (i = 0; i < nports; i++) {
+	for (unsigned int i = 0; i < nports; i++) {
 		writel(1, isys->pdata->base + CSI_REG_HUB_DRV_ACCESS_PORT(i));
 		writel(1, isys->pdata->base + CSI_REG_HUB_FW_ACCESS_PORT
 		       (isys->pdata->ipdata->csi2.fw_access_port_ofs, i));
@@ -329,18 +320,18 @@ static int ipu6_isys_csi2_set_stream(struct v4l2_subdev *sd,
 	writel(CSI_SENSOR_INPUT, csi2->base + CSI_REG_CSI_FE_MUX_CTRL);
 	writel(CSI_CNTR_SENSOR_LINE_ID | CSI_CNTR_SENSOR_FRAME_ID,
 	       csi2->base + CSI_REG_CSI_FE_SYNC_CNTR_SEL);
-	writel(FIELD_PREP(PPI_INTF_CONFIG_NOF_ENABLED_DLANES_MASK, nlanes - 1),
+	writel(FIELD_PREP(PPI_INTF_CONFIG_NOF_ENABLED_DLANES_MASK,
+			  csi2->nlanes - 1),
 	       csi2->base + CSI_REG_PPI2CSI_CONFIG_PPI_INTF);
 
 	writel(1, csi2->base + CSI_REG_PPI2CSI_ENABLE);
 	writel(1, csi2->base + CSI_REG_CSI_FE_ENABLE);
 
-	ret = isys->phy_set_power(isys, &cfg, timing, true);
+	ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
 	if (ret)
-		dev_err(dev, "csi-%d phy power up failed %d\n", csi2->port,
-			ret);
+		return ret;
 
-	return ret;
+	return isys->phy_set_power(isys, &cfg, &timing, true);
 }
 
 static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
@@ -349,7 +340,6 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 {
 	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
 	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
-	struct ipu6_isys_csi2_timing timing = { };
 	struct v4l2_subdev *remote_sd;
 	struct media_pad *remote_pad;
 	u64 sink_streams;
@@ -362,18 +352,14 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
 						&streams_mask);
 
-	ret = ipu6_isys_csi2_calc_timing(csi2, &timing, CSI2_ACCINV);
-	if (ret)
-		return ret;
-
-	ret = ipu6_isys_csi2_set_stream(sd, &timing, csi2->nlanes, true);
+	ret = ipu6_isys_csi2_stream_enable(csi2);
 	if (ret)
 		return ret;
 
 	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index,
 					 sink_streams);
 	if (ret) {
-		ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
+		ipu6_isys_csi2_stream_disable(csi2);
 		return ret;
 	}
 
@@ -384,6 +370,8 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 					  struct v4l2_subdev_state *state,
 					  u32 pad, u64 streams_mask)
 {
+	struct ipu6_isys_subdev *asd = to_ipu6_isys_subdev(sd);
+	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
 	struct v4l2_subdev *remote_sd;
 	struct media_pad *remote_pad;
 	u64 sink_streams;
@@ -395,7 +383,7 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
-	ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
+	ipu6_isys_csi2_stream_disable(csi2);
 
 	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, sink_streams);
 
-- 
2.55.0

