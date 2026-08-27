Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9652A2FC893
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834088; cv=none; b=svU3O3UB0XWhFWScQAzfTu9HGU8tO11wKCx/Pb3CDs+yj3CWAy5DadzOf1SnA7DTuXJazjY1P7R3k3zLFv/1ImKoPGd3LnWRzR78naeCWPucRW6KpDVeqRqErknCnH5UR2tu/jAkKZp4s09DWW53DUKUM0BPJI3OsnADg+deYy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834088; c=relaxed/simple;
	bh=Blx6457ztkLp0L01lpDJYBdBHDoVEaBT5MIufnP5fF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FxT8Ca4NnYC0SVyUuU7/j74/TLpIVwGGybWTgsjf3eRp/vWBieapGG0TfH45LE27Ant840l9f8o+LXykeycyqVCgtSRJhs0Ay2moaSCWJXKbk/ObxSMCsn2y1d7tXvFsFRx98bx8lXNivd/umpQmdITbZm03vzsZ+40fGK9/grk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ln++IPvl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ln++IPvl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834086; x=1819370086;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Blx6457ztkLp0L01lpDJYBdBHDoVEaBT5MIufnP5fF0=;
  b=Ln++IPvleqTWVZ9cHsjJJ5/Mpd4rH9k0JUBcqyYtP+hulJgQEJGhSZJS
   uNTzdowq4Lze9j144jH76mkX9mOHN+w2zom+OhRcS8heNryRFiD4c6OVp
   mlhBu3Ba4jIaOytbKf5YpOyH6C53DdtURoBss3XNgCDvqnZOEHi65u6/U
   FbmDhweY7c6fvsjLZ4ErQef06yClI5+d2zQKGo8ha1kNpw0w+FfbHMIaX
   s4u2QcjYaNn4SFNWQX33MUaeuhLLhN36N3hy706ltZTdITzcRXy8Q9B0S
   bc3zVFlfVnBIPH1YWLphOaAbifwoLLB+A/yyOZ9IajVfeeTQ82BuTZxC4
   A==;
X-CSE-ConnectionGUID: xyBLpJayQ9OdW5wtff0CTA==
X-CSE-MsgGUID: 5C3QecaQROufqSKBbHhZdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188643"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188643"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:45 -0700
X-CSE-ConnectionGUID: rQaiJyY9RqWf4UwfSgLSdA==
X-CSE-MsgGUID: /s9RJFv0Q6CaP3z9OKuXLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384483"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:44 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 28/44] media: ipu6: Split ipu6 csi2 stream enable/disable
Date: Thu, 27 Aug 2026 15:33:20 +0300
Message-ID: <20260827123336.2219048-29-antti.laakso@linux.intel.com>
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

