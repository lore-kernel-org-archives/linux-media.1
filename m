Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8480831F996
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834100; cv=none; b=VcyuECAYcYVLOQlaBdypcO+EUy9l3SM+t5dE+QOiNZCgY60oYCNQF7MbZq69eLATBmvopksApQRXjXwtcAsbmTyEiEyK+c2cRoT93VWcauxipqRamRk3gkBSxckEAoogFDvgsdUvzdcbBkE9JSCpMoR9rEOg66HsLOFWTimdSBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834100; c=relaxed/simple;
	bh=vK2CIWf6N8fqiAvM4uDZdfebcMV2MNFMyiu0TukuJ6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iV7HtF3mCZs6bvnunReuB5AOtIPiD/25Ie2n6T+gyryrBfOAmJw/3hdWhkafAkc1WkrFb7zkFqZI+9sSFSSk/1ZdaSmYhGF2OSRL3CR/n99ec1KBWEqYnN2o15lQ6CL2o9+1EBCakihhfhRZG9OdtL/slUKgh++HUUKRkE2QGIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CRPeDpNe; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRPeDpNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834097; x=1819370097;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vK2CIWf6N8fqiAvM4uDZdfebcMV2MNFMyiu0TukuJ6o=;
  b=CRPeDpNeDXlVcU9fy0V8gR/w6f7BemS8coVI7fUkgu8vfj5Kl2LiBjrD
   SrR7v4Kez6FWQ7UK4NL5Lp8dYJiIwnce/yZpAgOQBP7F87WTzqN4Xainj
   hpRJqnNwVImD7eI+1y5OB4v4kJ0R6GQQv5A1h3HPuUKvqX7GgXwtaV7AI
   3aayLYGKot4ZPia9umtfiB6nTLNA0uD9dSqXLB3uccNW/nnbJBFpcC0rw
   T7OD1ItqkdkL+ZA3Avxt+s8FlSOsGM33HjUzlPNrj6iCFEw4HxhcfFaUO
   EzpoUlBNKdKEJ0spFS8E/2cWSPV1irgdmxiqDWcngca3z7lA/kdRCkJcK
   w==;
X-CSE-ConnectionGUID: Nj7YFqYxRReCtG802n/+Qw==
X-CSE-MsgGUID: TwTkydm9TDqCjmqzX2UWaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188658"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188658"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:55 -0700
X-CSE-ConnectionGUID: AGNMxMV+R8a7EMpLYWADvg==
X-CSE-MsgGUID: WtcPG7DDQgOtoMctEPbW/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384506"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:54 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 33/44] media: ipu6: The SPC init is valid only for ipu6
Date: Thu, 27 Aug 2026 15:33:25 +0300
Message-ID: <20260827123336.2219048-34-antti.laakso@linux.intel.com>
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

