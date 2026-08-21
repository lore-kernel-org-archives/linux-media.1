Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFBC48BD47
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312702; cv=none; b=e7LGAThR6RKH3j+WCVeemM4Hx7yXcob5EAUeV+6F49FhLaTLM+1GytS4c4lOyw13FQaaRIvVemjHRy9BF5fnrUHo1UK6EEFjxuLM+M8fxW+Vda6qliFHTAfhrFh/3U3XZfhcpGYrhquGhaI0b5rsr+DTes2Mc4zlGNCojBQcJIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312702; c=relaxed/simple;
	bh=KA30LPLTNqszN1sjw832bl3AfgrDGIrFXhakJychjgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a27lyHvFlkH3N5CsB0wFf3QlsH+YjsCOuJ9dhQ/B6mug1v4BqS9R6r9yto2c/Zelgcnf/pj1CdhKt+ZkyBLbbv9bAyVjh2kjFSAJq7ZZgf7Cci7dW8lfVxpp9g+6SxNJ6Cn4ppnCCqS6Fjw1VqaqzodfTnNZqrIN0Qcvr6Vw0wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+1qWABO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+1qWABO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312701; x=1818848701;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KA30LPLTNqszN1sjw832bl3AfgrDGIrFXhakJychjgI=;
  b=b+1qWABOAj78woyA0uo0oVdo7Ln4DeR/dR648Q2vmJvRdGIb/opezyMG
   4jNLkt8wO5hevvV5qPwZ0ZBy5mwGUVRlQYssbTCYcznkbqsGt6uzPJ+ku
   rUt+rPKzlrw95co76rAngqUelqClX6QVPmUsUm7I/mhAuJbbY3S8FHT0X
   YqfHUm0YN+/IW6VzdFF2hWkwB4g8rYXXIiip3iV6ps+li5xt3bW8TFqnu
   0/FgehEtANURAcIro9UhvTNqDDHW9ntRtUeyrpHsW/ECRvsKhC+1NcpCf
   /vAyBRz0udeZv6SJONGddTVGkdl07+JAeHyE0mj4FPxb7iNCNBNA9ZdED
   g==;
X-CSE-ConnectionGUID: T4xEXehESJSdBRY0JZUohg==
X-CSE-MsgGUID: SpLPI8bkQdy/NzrNana30w==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989124"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989124"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:45:01 -0700
X-CSE-ConnectionGUID: 44u3ZNI5RIiGXkD5drJqtg==
X-CSE-MsgGUID: c0K2U8BbRE6JkUaWhMDecg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172397"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:59 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 36/44] media: ipu6: Read correct SKU ID for ipu7
Date: Fri, 21 Aug 2026 14:42:54 +0300
Message-ID: <20260821114302.365532-37-antti.laakso@linux.intel.com>
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

