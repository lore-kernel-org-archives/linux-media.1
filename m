Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088823290A6
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834095; cv=none; b=ISKu9OjyUNNj0t1yA1KstT95Gv/3hDSPJO4qDA5JXqxD5QVEaNDsfjR+vEy1YrJ8rD9Lq1csOdbmLUjVNELnd0YTODdat4TD9KQ/tp8iYO34hm3Asv8AGe6HNo/qxJPhy0ZAa+s9GiUBCjGv/j4Khh9kK5yNzAeCrGfhTJaagIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834095; c=relaxed/simple;
	bh=uC0nTpZwRLvrAU7lciWi65frqZ36F3YWIguHhhUKVTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MzjUUchjsHvO6AVDn4fd5HOE+94VcwV5ZhfhVpy9UmINI5ULUM+NlWyPaqC1BW6is/1A0Qx42gRUNRlCT6DF3PNRdgZWjL67jzKe5/9uJQdRGrb7r453zX1srLaOEcSrHzU8oN2hrvGb281xUZZcW9j3Lg6rNNdTOnVMup9IMMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FQFZFLqr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FQFZFLqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834092; x=1819370092;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uC0nTpZwRLvrAU7lciWi65frqZ36F3YWIguHhhUKVTI=;
  b=FQFZFLqrbgvC0QEFzDCGsm1aZbxW8T3vpXsYAyfuTLSKBQ69GgfIAmln
   OWus13PLa9BS6kkG9SJ7GtyWkH8hhlz4Km2GyiZ4zFeCPI9429NlHQZOo
   ZNiF8fbxzCMmKLcc/4KngLS0T93pDlyGyijICBtvXo2nsIhlBPvH2JIRW
   sbjx40yWL1hWKs092Ftq1YjCLVIsjt81n2rAznFDcgBaWXIwAyGhJxom2
   5XbsROz92SwFgmoqHnmbIW+fowSZNlgYy20gGWSIS24IBi+QOC6/Q5Hyc
   bjpcOcDsYz+VGIKur9uQypjuVjcvhHNZ8PIrSeZKDv/7lra7ac50X/zp4
   Q==;
X-CSE-ConnectionGUID: bLWplHxDTuWhARfNI0eoQA==
X-CSE-MsgGUID: 8shhoDQQReqpGvOXWkjZow==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188651"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188651"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:51 -0700
X-CSE-ConnectionGUID: 85e8ROnqSgycyxvn3IDTiA==
X-CSE-MsgGUID: GjB2kL5aRU6DfbQSHVTo2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384497"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:50 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 31/44] media: ipu6: Enable ipu7 isys interrupts
Date: Thu, 27 Aug 2026 15:33:23 +0300
Message-ID: <20260827123336.2219048-32-antti.laakso@linux.intel.com>
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

Add ipu7 specific isys initialization of clocks and
enabling interrupts.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 56 +++++++++++++++++++++---
 1 file changed, 49 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 976ed064f262..622f74021f6d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -180,13 +180,23 @@ static int isys_csi2_register_subdevices(struct ipu6_isys *isys)
 	int ret;
 
 	for (i = 0; i < csi2_pdata->nports; i++) {
-		ret = ipu6_isys_csi2_init(&isys->csi2[i], isys,
-					  isys->pdata->base +
-					  CSI_REG_PORT_BASE(i), i);
+		void __iomem *base = isys->pdata->base;
+
+		if (IS_IPU7(isys->adev->isp)) {
+			u32 mask = IS_IPU7_MTL(isys->adev->isp) ?
+					IPU7_CSI_LEGACY_IRQ_MASK(i) :
+					IPU7P5_CSI_LEGACY_IRQ_MASK(i);
+
+			isys->isr_csi2_bits |= mask;
+			isys->csi2[i].legacy_irq_mask = mask;
+		} else {
+			base += CSI_REG_PORT_BASE(i);
+			isys->isr_csi2_bits |= IPU6_ISYS_UNISPART_IRQ_CSI2(i);
+		}
+
+		ret = ipu6_isys_csi2_init(&isys->csi2[i], isys, base, i);
 		if (ret)
 			goto fail;
-
-		isys->isr_csi2_bits |= IPU6_ISYS_UNISPART_IRQ_CSI2(i);
 	}
 
 	return 0;
@@ -273,7 +283,36 @@ static int isys_register_video_devices(struct ipu6_isys *isys)
 	return ret;
 }
 
-static void isys_setup_hw(struct ipu6_isys *isys)
+static void ipu7_isys_setup_hw(struct ipu6_isys *isys)
+{
+	u32 offset, mask;
+	void __iomem *base = isys->pdata->base;
+
+	offset = IPU7_IS_IO_GPREGS_BASE;
+
+	writel(0x0, base + offset + IPU7_CLK_EN_TXCLKESC);
+	/* Update if ISYS freq updated (0: 400/1, 1:400/2, 63:400/64) */
+	writel(0x0, base + offset + IPU7_CLK_DIV_FACTOR_IS_CLK);
+	/* correct the initial printf configuration */
+	writel(0x200, base + IPU7_IS_UC_CTRL_BASE + IPU7_REG_PRINTF_AXI_CNTL);
+
+	offset = IPU7_IS_UC_CTRL_BASE;
+	mask = IPU7_IS_UC_TO_SW_IRQ_MASK;
+
+	writel(mask, base + offset + IPU7_TO_SW_IRQ_CNTL_CLEAR);
+	writel(mask, base + offset + IPU7_TO_SW_IRQ_CNTL_MASK_N);
+	writel(mask, base + offset + IPU7_TO_SW_IRQ_CNTL_ENABLE);
+
+	offset = IPU7_IS_IO_CSI2_LEGACY_IRQ_CTRL_BASE;
+	mask = IPU7_CSI_RX_LEGACY_IRQ_MASK;
+
+	writel(mask, base + offset + IPU7_IRQ_CTL_EDGE);
+	writel(mask, base + offset + IPU7_IRQ_CTL_CLEAR);
+	writel(mask, base + offset + IPU7_IRQ_CTL_MASK);
+	writel(mask, base + offset + IPU7_IRQ_CTL_ENABLE);
+}
+
+static void ipu6_isys_setup_hw(struct ipu6_isys *isys)
 {
 	void __iomem *base = isys->pdata->base;
 	const u8 *thd = isys->pdata->ipdata->hw_variant.cdc_fifo_threshold;
@@ -783,7 +822,10 @@ static int isys_runtime_pm_resume(struct device *dev)
 	isys->power = 1;
 	spin_unlock_irqrestore(&isys->power_lock, flags);
 
-	isys_setup_hw(isys);
+	if (IS_IPU7(isp))
+		ipu7_isys_setup_hw(isys);
+	else
+		ipu6_isys_setup_hw(isys);
 
 	set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_ON);
 
-- 
2.55.0

