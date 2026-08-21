Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F4A489895
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 11:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312696; cv=none; b=dJQr5FP0wKUbi4mJZ4oYuThNkmyCdvLWetp40jZAbKA/tSS7mHTi3ww6WFwinIpBHZ93131uAktxIeV/P/AG1id1E/pGx0H3r1ZdABAYbd+KC0lDqR517UtE76Th0UauCmITJfSDVuiWMBJlTd2vrSYUrP/cbGf2NRmu6wEDtjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312696; c=relaxed/simple;
	bh=vK2CIWf6N8fqiAvM4uDZdfebcMV2MNFMyiu0TukuJ6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mud9jnUIzM9MFWjXw3w7coxkNj1mQS+gYF7EooAKzZvlfMoB9EQDoYRrxZpyOcc70rpwsldIOTFDwIhp8lbl1cMUYwzajRg6dxCnMxCqrIjy35UAQWNgKyFMD8Hi1EnW0ExitXjyJVwVFooQx59oP5O8acfRoVEt+bvO3/0QO3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6abq5KG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6abq5KG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787312695; x=1818848695;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vK2CIWf6N8fqiAvM4uDZdfebcMV2MNFMyiu0TukuJ6o=;
  b=j6abq5KGfsSOjtaLpg09nEa/pW5rdoZOTmXzIaorW/WxphzmTPqXbPFM
   Tlk8hOQ40b9EHlRQUhRdfNSi2PsUjzuFzm3bvXTIna6QewWBDAm09rODd
   ojh14sV8be2xYAkR/Glf8lsGYV39G6TWZun4Z9iXUbjIPTFo6gM84euws
   0YBRjjCCenjba9BtiTLOkuap9+pKPg3pkOL+Yb4bJ1Z8YxyaU0L26hRAv
   bFxjTVj9DMqZklDg83pA35rpJv8NYI73WsRTcnf0gFD33JMK1xrV4kOrO
   BWGn7+yDRll/TemEfjGQeAiRWM7Prux1huKV39g/9Yq42/sBzOPyAb0wv
   A==;
X-CSE-ConnectionGUID: xOz1RmWJRR2xp/Z39efRuw==
X-CSE-MsgGUID: t8bFUC/pQZGiZc0KyFehmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87989117"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87989117"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:54 -0700
X-CSE-ConnectionGUID: Z48VGGm0QieEs280tsk1Lg==
X-CSE-MsgGUID: qb5zi/3WQyqp/M3uC/sLHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="291172382"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO alaakso-desk.kioski) ([10.245.246.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:44:52 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v2 33/44] media: ipu6: The SPC init is valid only for ipu6
Date: Fri, 21 Aug 2026 14:42:51 +0300
Message-ID: <20260821114302.365532-34-antti.laakso@linux.intel.com>
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

The ipu7 don't have SPC.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index fd7888a011a5..cb1145080460 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -232,10 +232,16 @@ void ipu6_configure_spc(struct ipu6_device *isp,
 			int pkg_dir_idx, void __iomem *base, u64 *pkg_dir,
 			dma_addr_t pkg_dir_dma_addr)
 {
-	void __iomem *dmem_base = base + hw_variant->dmem_offset;
-	void __iomem *spc_regs_base = base + hw_variant->spc_offset;
+	void __iomem *dmem_base;
+	void __iomem *spc_regs_base;
 	u32 val;
 
+	if (IS_IPU7(isp))
+		return;
+
+	dmem_base = base + hw_variant->dmem_offset;
+	spc_regs_base = base + hw_variant->spc_offset;
+
 	val = readl(spc_regs_base + IPU6_PSYS_REG_SPC_STATUS_CTRL);
 	val |= IPU6_PSYS_SPC_STATUS_CTRL_ICACHE_INVALIDATE;
 	writel(val, spc_regs_base + IPU6_PSYS_REG_SPC_STATUS_CTRL);
-- 
2.55.0

