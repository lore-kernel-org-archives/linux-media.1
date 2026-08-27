Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1587E274FD0
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834105; cv=none; b=UaopZQv6XOu6+dKp5Su6aW62hATWQpkxb1mz/hPRbKTz79Z6HHa1nKjK2+y/DKB73d9Mm5oA38b44zrQUb2UQBbWG94SGOX6jPdrFonbqMQRuRJR+MEUoxAqHQSFGbOyjestZm7j/bgWwNIQG+sMKOIge4hW2teySDxmrZMtq+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834105; c=relaxed/simple;
	bh=KA30LPLTNqszN1sjw832bl3AfgrDGIrFXhakJychjgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tps9llv6cDJ1Xt4nDpicMICmu/WzcVluWN1LFN95+OiZispI76Xdyk7LWH7YAScDcZDzqDnSA5ItHqdEtiFyFGrP3jR1MMedbE9KOL1XQPP1MFeWWC79E2UU7hfG3M+XZEz84dY0IZstpVWVn093kAaA3op2Kwk4Jc/F+ZkaIx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Obw2dLPC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Obw2dLPC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834102; x=1819370102;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KA30LPLTNqszN1sjw832bl3AfgrDGIrFXhakJychjgI=;
  b=Obw2dLPCIoN0SsPAlKXGVax022KFWbGO3prky53boKfwidDcLkaQQsEj
   HW8l4ApAeQwHUtOzpjFIAkD89I15AEKWvyCMeGTC+e2fwbmy52FSZ/4nj
   7P4NM7dMWj4ge1+XK+pOeiv/d/QFk2SuTxxbAXLdxdDtP00JmAgapOR9K
   Rjt8OPaEKQFLieSmDaolQBlZXuKojyj3EjvpPAosdWqf17GXb4eaA5sqy
   lez7IFCNG9bMxGyr4vu96OyW9XGBVgFaXiV+PtroZ75rOGqM2ebSEdGZe
   2hMplaRGLDDv8ScY+1j0BvGJHoq0gCV4Ylf4Ag0RJW9VWYSVxMFoIhGNT
   A==;
X-CSE-ConnectionGUID: YKjxFA0KTRWJL28/DVKI0Q==
X-CSE-MsgGUID: 7MyJmMfHSP65IxHLG/+khQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188665"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188665"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:35:01 -0700
X-CSE-ConnectionGUID: tINwjpudSbKMKPZ16u90SQ==
X-CSE-MsgGUID: aMP9+nUdRYO34mNPQu/aTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384531"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:35:00 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 36/44] media: ipu6: Read correct SKU ID for ipu7
Date: Thu, 27 Aug 2026 15:33:28 +0300
Message-ID: <20260827123336.2219048-37-antti.laakso@linux.intel.com>
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

Add SKU ID to buttress register map to get correct ID for both IPUs.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.h | 1 +
 drivers/media/pci/intel/ipu6/ipu6.c          | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
index af72de2b8729..47a49e961945 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
@@ -54,6 +54,7 @@ struct ipu6_buttress_registers {
 	u32 db0_out;
 	u32 data0_in;
 	u32 data0_out;
+	u32 sku_id;
 
 	/* Bitmasks */
 	u32 irq_is;
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 4e4f32723904..428ad046e239 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -153,6 +153,7 @@ static const struct ipu6_buttress_registers ipu6_buttress_regs = {
 	.db0_out	= BUTTRESS_REG_IU2CSEDB0,
 	.data0_in	= BUTTRESS_REG_CSE2IUDATA0,
 	.data0_out	= BUTTRESS_REG_IU2CSEDATA0,
+	.sku_id		= BUTTRESS_REG_SKU,
 
 	/* Bitmasks */
 	.irq_is		= BUTTRESS_ISR_IS_IRQ,
@@ -182,6 +183,7 @@ static const struct ipu6_buttress_registers ipu7_buttress_regs = {
 	.db0_out	= IPU7_BUTTRESS_REG_IU2CSEDB0,
 	.data0_in	= IPU7_BUTTRESS_REG_CSE2IUDATA0,
 	.data0_out	= IPU7_BUTTRESS_REG_IU2CSEDATA0,
+	.sku_id		= IPU7_BUTTRESS_REG_SKU,
 
 	/* Bitmasks */
 	.irq_is		= IPU7_BUTTRESS_IRQ_IS_IRQ,
@@ -657,7 +659,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* Configure the arbitration mechanisms for VC requests */
 	ipu6_configure_vc_mechanism(isp);
 
-	val = readl(isp->base + BUTTRESS_REG_SKU);
+	val = readl(isp->base + isp->buttress.regs->sku_id);
 	sku_id = FIELD_GET(GENMASK(6, 4), val);
 	version = FIELD_GET(GENMASK(3, 0), val);
 	dev_info(dev, "IPU%u-v%u[%x] hardware version %d\n", version, sku_id,
-- 
2.55.0

