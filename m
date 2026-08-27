Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33EB379971
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834121; cv=none; b=EJvoKTACsGytuZ7ZfD8r9ciOxGiaVyQm28etOEU/vahNmfZe7xJ5VMs8blnPHFFRi5AuOE5VsI6oKzNXtycnABvjcjqIQ7FeFGQzfbdGonrPeWcihQwnLsfswram5vPvbo/Yht9Wjcik5zBa9Yw9rZqcqpUIAxQY0IjoXwgwNA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834121; c=relaxed/simple;
	bh=RDuYPL/I+7Mq3jYl/FHmYzTZUXiSwlhmoRjtt7db+hY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MVcsjPL+Za9Pv5f0WkFHVfbOnMNUaCTr7yClrFPnBkNB0ki8wkTocja8LldymK1DqWDUSmZZtCxgO4tr3A8nsHf6SNF6RYj36Nj/Bj7IBQVsfJ8FNKQNX0S3JkFhEuiB44rW8UWvjFjI4w3ZBz3BSYQG66BjYeUJpGIhcog9KoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IX0POLdR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IX0POLdR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834116; x=1819370116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RDuYPL/I+7Mq3jYl/FHmYzTZUXiSwlhmoRjtt7db+hY=;
  b=IX0POLdRTaHTYR8FiZX5NbNB0mVaeolApNJvxOUM2Zqea8OKhiYoNS4b
   Z6gNJvvcgBiu2hIArH4xMaRXdmQ8iS7/unbedqZz76gjSWj5tbubIbfYD
   lrDCTjAKOU69oOzbxDim6SqS2n2p5WgscUsuf24RFfcqh5DhgBop0N3jB
   es0YF0i+KXbZON//FDcYV9+iG3oOnjTwpAbTu30QGGKcmW8H8t5v9JeJ4
   y9CxstRW6hrV3N5bCzWfhGP6VGCVfLN1+tukMLSS/6lulPZq4x6nXjn97
   9iOps+QAWDPz6luZVcuVGDvAOu2lNsYFXi/2D223YgoLcQ9SVlQrXqEw0
   Q==;
X-CSE-ConnectionGUID: MOW28c7ITtOPvlWg2LpgAQ==
X-CSE-MsgGUID: P8V22h6VRrCJsDgkGM6MSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188698"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188698"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:35:15 -0700
X-CSE-ConnectionGUID: r5VAniXDRquuj1VM62rY7Q==
X-CSE-MsgGUID: uObpydk0RJuqiyrIDuBAqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384720"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:35:13 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 43/44] media: ipu6: Add ipu7.5 mmu initialization data
Date: Thu, 27 Aug 2026 15:33:35 +0300
Message-ID: <20260827123336.2219048-44-antti.laakso@linux.intel.com>
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

The ipu7.5 mmu is different compared to ipu7.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c | 261 ++++++++++++++++++++-
 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h |  99 ++++++++
 2 files changed, 359 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c b/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c
index 3cd9a818733c..c9b015e89ee6 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c
@@ -431,6 +431,250 @@ static struct ipu7_mmu_hw ipu7_psys_mmu_hwdata[] = {
 	},
 };
 
+static struct ipu7_mmu_hw ipu7p5_isys_mmu_hwdata[] = {
+	{
+		.name = "IS_FW_RD",
+		.offset = IPU7P5_IS_MMU_FW_RD_OFFSET,
+		.zlx_offset = IPU7P5_IS_ZLX_UC_RD_OFFSET,
+		.uao_offset = IPU7P5_IS_UAO_UC_RD_OFFSET,
+		.info_bits = 0x20005101,
+		.refill = 0x00002726,
+		.collapse_en_bitmap = 0x1,
+		.at_sp_arb_cfg = 0x1,
+		.l1_block = IPU7P5_IS_MMU_FW_RD_L1_BLOCKNR_REG,
+		.l2_block = IPU7P5_IS_MMU_FW_RD_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU7P5_IS_MMU_FW_RD_STREAM_NUM,
+		.nr_l2streams = IPU7P5_IS_MMU_FW_RD_STREAM_NUM,
+		.l1_block_sz = { 0x0, 0x8, 0xa },
+		.l2_block_sz = { 0x0, 0x2, 0x4 },
+		.zlx_nr = IPU7P5_IS_ZLX_UC_RD_NUM,
+		.zlx_axi_pool = { 0x00000f30 },
+		.zlx_en = { 0, 1, 0, 0 },
+		.zlx_conf = { 0x0 },
+		.uao_p_num = IPU7P5_IS_UAO_UC_RD_PLANENUM,
+		.uao_p2tlb = { 0x49, 0x4c, 0x4d, 0x0 },
+	},
+	{
+		.name = "IS_FW_WR",
+		.offset = IPU7P5_IS_MMU_FW_WR_OFFSET,
+		.zlx_offset = IPU7P5_IS_ZLX_UC_WR_OFFSET,
+		.uao_offset = IPU7P5_IS_UAO_UC_WR_OFFSET,
+		.info_bits = 0x20005001,
+		.refill = 0x00002524,
+		.collapse_en_bitmap = 0x1,
+		.at_sp_arb_cfg = 0x1,
+		.l1_block = IPU7P5_IS_MMU_FW_WR_L1_BLOCKNR_REG,
+		.l2_block = IPU7P5_IS_MMU_FW_WR_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU7P5_IS_MMU_FW_WR_STREAM_NUM,
+		.nr_l2streams = IPU7P5_IS_MMU_FW_WR_STREAM_NUM,
+		.l1_block_sz = { 0x0, 0x8, 0xa },
+		.l2_block_sz = { 0x0, 0x2, 0x4 },
+		.zlx_nr = IPU7P5_IS_ZLX_UC_WR_NUM,
+		.zlx_axi_pool = { 0x00000f20 },
+		.zlx_en = { 0, 1, 1, 0 },
+		.zlx_conf = { 0x0, 0x00010101, 0x00010101, 0x0 },
+		.uao_p_num = IPU7P5_IS_UAO_UC_WR_PLANENUM,
+		.uao_p2tlb = { 0x49, 0x4a, 0x4b, 0x0 },
+	},
+	{
+		.name = "IS_DATA_WR_ISOC",
+		.offset = IPU7P5_IS_MMU_M0_OFFSET,
+		.zlx_offset = IPU7P5_IS_ZLX_M0_OFFSET,
+		.uao_offset = IPU7P5_IS_UAO_M0_WR_OFFSET,
+		.info_bits = 0x20004e01,
+		.refill = 0x00002120,
+		.collapse_en_bitmap = 0x1,
+		.at_sp_arb_cfg = 0x1,
+		.l1_block = IPU7P5_IS_MMU_M0_L1_BLOCKNR_REG,
+		.l2_block = IPU7P5_IS_MMU_M0_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU7P5_IS_MMU_M0_STREAM_NUM,
+		.nr_l2streams = IPU7P5_IS_MMU_M0_STREAM_NUM,
+		.l1_block_sz = { 0x0, 0x2, 0x4, 0x6, 0x8, 0xa, 0xc, 0xe, 0x10,
+				 0x12, 0x14, 0x16, 0x18, 0x1a, 0x1c, 0x01e },
+		.l2_block_sz = { 0x0, 0x2, 0x4, 0x6, 0x8, 0xa, 0xc, 0xe, 0x10,
+				 0x12, 0x14, 0x16, 0x18, 0x1a, 0x1c, 0x1e },
+		.zlx_nr = IPU7P5_IS_ZLX_M0_NUM,
+		.zlx_axi_pool = { 0x00000f10 },
+		.zlx_en = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
+		.zlx_conf = { 0x00010103, 0x00010103, 0x00010103, 0x00010103,
+			      0x00010103, 0x00010103, 0x00010103, 0x00010103,
+			      0x00010103, 0x00010103, 0x00010103, 0x00010103,
+			      0x00010103, 0x00010103, 0x00010103, 0x00010103 },
+		.uao_p_num = IPU7P5_IS_UAO_M0_WR_PLANENUM,
+		.uao_p2tlb = { 0x00000041, 0x00000042, 0x00000043, 0x00000044,
+			       0x00000041, 0x00000042, 0x00000043, 0x00000044,
+			       0x00000041, 0x00000042, 0x00000043, 0x00000044,
+			       0x00000041, 0x00000042, 0x00000043, 0x00000044 },
+	},
+	{
+		.name = "IS_DATA_WR_SNOOP",
+		.offset = IPU7P5_IS_MMU_M1_OFFSET,
+		.zlx_offset = IPU7P5_IS_ZLX_M1_OFFSET,
+		.uao_offset = IPU7P5_IS_UAO_M1_WR_OFFSET,
+		.info_bits = 0x20004f01,
+		.refill = 0x00002322,
+		.collapse_en_bitmap = 0x1,
+		.at_sp_arb_cfg = 0x1,
+		.l1_block = IPU7P5_IS_MMU_M1_L1_BLOCKNR_REG,
+		.l2_block = IPU7P5_IS_MMU_M1_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU7P5_IS_MMU_M1_STREAM_NUM,
+		.nr_l2streams = IPU7P5_IS_MMU_M1_STREAM_NUM,
+		.l1_block_sz = { 0x0, 0x2, 0x4, 0x6, 0x8, 0xa, 0xc, 0xe, 0x10,
+				 0x12, 0x14, 0x16, 0x18, 0x1a, 0x1c, 0x1e },
+		.l2_block_sz = { 0x0, 0x2, 0x4, 0x6, 0x8, 0xa, 0xc, 0xe, 0x10,
+				 0x12, 0x14, 0x16, 0x18, 0x1a, 0x1c, 0x1e },
+		.zlx_nr = IPU7P5_IS_ZLX_M1_NUM,
+		.zlx_axi_pool = { 0x00000f20 },
+		.zlx_en = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
+		.zlx_conf = { 0x00010103, 0x00010103, 0x00010103, 0x00010103,
+			      0x00010103, 0x00010103, 0x00010103, 0x00010103,
+			      0x00010103, 0x00010103, 0x00010103, 0x00010103,
+			      0x00010103, 0x00010103, 0x00010103, 0x00010103 },
+		.uao_p_num = IPU7P5_IS_UAO_M1_WR_PLANENUM,
+		.uao_p2tlb = { 0x00000045, 0x00000046, 0x00000047, 0x00000048,
+			       0x00000045, 0x00000046, 0x00000047, 0x00000048,
+			       0x00000045, 0x00000046, 0x00000047, 0x00000048,
+			       0x00000045, 0x00000046, 0x00000047, 0x00000048 },
+	},
+};
+
+static struct ipu7_mmu_hw ipu7p5_psys_mmu_hwdata[] = {
+	{
+		.name = "PS_FW_RD",
+		.offset = IPU7P5_PS_MMU_FW_RD_OFFSET,
+		.zlx_offset = IPU7P5_PS_ZLX_FW_RD_OFFSET,
+		.uao_offset = IPU7P5_PS_UAO_FW_RD_OFFSET,
+		.info_bits = 0x20004001,
+		.refill = 0x00002726,
+		.collapse_en_bitmap = 0x1,
+		.at_sp_arb_cfg = 0x1,
+		.l1_block = IPU7P5_PS_MMU_FW_RD_L1_BLOCKNR_REG,
+		.l2_block = IPU7P5_PS_MMU_FW_RD_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU7P5_PS_MMU_FW_RD_STREAM_NUM,
+		.nr_l2streams = IPU7P5_PS_MMU_FW_RD_STREAM_NUM,
+		.l1_block_sz = { 0x00, 0x08, 0x0a, 0x0c, 0x0d, 0x0f, 0x11,
+				 0x12, 0x13, 0x14, 0x16, 0x18, 0x19, 0x1a,
+				 0x1a, 0x1a },
+		.l2_block_sz = { 0x00, 0x02, 0x04, 0x06, 0x08, 0x0a, 0x0c,
+				 0x0e, 0x10, 0x12, 0x14, 0x16, 0x18, 0x1a,
+				 0x1c, 0x1e },
+		.zlx_nr = IPU7P5_PS_ZLX_FW_RD_NUM,
+		.zlx_axi_pool = { 0x00000f30 },
+		.zlx_en = { 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0 },
+		.zlx_conf = { 0x00000000, 0x00010101, 0x00000000, 0x00000000,
+			      0x00010101, 0x00010101, 0x00000000, 0x00000000,
+			      0x00000000, 0x00010101, 0x00010101, 0x00000000,
+			      0x00000000, 0x00000000, 0x00000000, 0x00000000 },
+		.uao_p_num = IPU7P5_PS_UAO_FW_RD_PLANENUM,
+		.uao_p2tlb = { 0x2e, 0x35, 0x36, 0x31, 0x37, 0x38, 0x39, 0x32,
+			       0x33, 0x3a, 0x3b, 0x3c, 0x34, 0x00, 0x00, 0x00 },
+	},
+	{
+		.name = "PS_FW_WR",
+		.offset = IPU7P5_PS_MMU_FW_WR_OFFSET,
+		.zlx_offset = IPU7P5_PS_ZLX_FW_WR_OFFSET,
+		.uao_offset = IPU7P5_PS_UAO_FW_WR_OFFSET,
+		.info_bits = 0x20003e01,
+		.refill = 0x00002322,
+		.collapse_en_bitmap = 0x1,
+		.at_sp_arb_cfg = 0x1,
+		.l1_block = IPU7P5_PS_MMU_FW_WR_L1_BLOCKNR_REG,
+		.l2_block = IPU7P5_PS_MMU_FW_WR_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU7P5_PS_MMU_FW_WR_STREAM_NUM,
+		.nr_l2streams = IPU7P5_PS_MMU_FW_WR_STREAM_NUM,
+		.l1_block_sz = { 0x00, 0x08, 0x0a, 0x0c, 0x0d, 0x0e, 0x0f, 0x10,
+				 0x10, 0x10 },
+		.l2_block_sz = { 0x00, 0x02, 0x04, 0x06, 0x08, 0x0a, 0x0c, 0x0e,
+				 0x10, 0x12 },
+		.zlx_nr = IPU7P5_PS_ZLX_FW_WR_NUM,
+		.zlx_axi_pool = { 0x00000f20 },
+		.zlx_en = { 0, 1, 1, 0, 0, 0, 0, 0, 0, 0 },
+		.zlx_conf = { 0x00000000, 0x00010101, 0x00010101, 0x00000000,
+			      0x00000000, 0x00000000, 0x00000000, 0x00000000,
+			      0x00000000, 0x00000000 },
+		.uao_p_num = IPU7P5_PS_UAO_FW_WR_PLANENUM,
+		.uao_p2tlb = { 0x0000002e, 0x0000002f, 0x00000030, 0x00000031,
+			       0x00000032, 0x00000033, 0x00000034, 0x00000000,
+			       0x00000000, 0x00000000 },
+	},
+	{
+		.name = "PS_DATA_RD",
+		.offset = IPU7P5_PS_MMU_SRT_RD_OFFSET,
+		.zlx_offset = IPU7P5_PS_ZLX_DATA_RD_OFFSET,
+		.uao_offset = IPU7P5_PS_UAO_SRT_RD_OFFSET,
+		.info_bits = 0x20003f01,
+		.refill = 0x00002524,
+		.collapse_en_bitmap = 0x1,
+		.at_sp_arb_cfg = 0x1,
+		.l1_block = IPU7P5_PS_MMU_SRT_RD_L1_BLOCKNR_REG,
+		.l2_block = IPU7P5_PS_MMU_SRT_RD_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU7P5_PS_MMU_SRT_RD_STREAM_NUM,
+		.nr_l2streams = IPU7P5_PS_MMU_SRT_RD_STREAM_NUM,
+		.l1_block_sz = { 0x00, 0x04, 0x06, 0x08, 0x0b, 0x0d, 0x0f, 0x13,
+				 0x17, 0x19, 0x1b, 0x1d, 0x1f, 0x2b, 0x33, 0x3f,
+				 0x47, 0x49, 0x4b, 0x4c, 0x4d, 0x4e },
+		.l2_block_sz = { 0x00, 0x02, 0x04, 0x06, 0x08, 0x0a, 0x0c, 0x0e,
+				 0x10, 0x12, 0x14, 0x16, 0x18, 0x1a, 0x1c, 0x1e,
+				 0x20, 0x22, 0x24, 0x26, 0x28, 0x2a },
+		.zlx_nr = IPU7P5_PS_ZLX_DATA_RD_NUM,
+		.zlx_axi_pool = { 0x00000f30 },
+		.zlx_en = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+			    1, 1, 0, 0, 0, 0 },
+		.zlx_conf = { 0x00030303, 0x00010101, 0x00010101, 0x00030202,
+			      0x00010101, 0x00010101, 0x00030303, 0x00030303,
+			      0x00010101, 0x00030800, 0x00030500, 0x00020101,
+			      0x00042000, 0x00031000, 0x00042000, 0x00031000,
+			      0x00020400, 0x00010101, 0x00000000, 0x00000000,
+			      0x00000000, 0x00000000 },
+		.uao_p_num = IPU7P5_PS_UAO_SRT_RD_PLANENUM,
+		.uao_p2tlb = { 0x0000001c, 0x0000001d, 0x0000001e, 0x0000001f,
+			       0x00000020, 0x00000021, 0x00000022, 0x00000023,
+			       0x00000024, 0x00000025, 0x00000026, 0x00000027,
+			       0x00000028, 0x00000029, 0x0000002a, 0x0000002b,
+			       0x0000002c, 0x0000002d, 0x00000000, 0x00000000,
+			       0x00000000, 0x00000000 },
+	},
+	{
+		.name = "PS_DATA_WR",
+		.offset = IPU7P5_PS_MMU_SRT_WR_OFFSET,
+		.zlx_offset = IPU7P5_PS_ZLX_DATA_WR_OFFSET,
+		.uao_offset = IPU7P5_PS_UAO_SRT_WR_OFFSET,
+		.info_bits = 0x20003d01,
+		.refill = 0x00002120,
+		.collapse_en_bitmap = 0x1,
+		.at_sp_arb_cfg = 0x1,
+		.l1_block = IPU7P5_PS_MMU_SRT_WR_L1_BLOCKNR_REG,
+		.l2_block = IPU7P5_PS_MMU_SRT_WR_L2_BLOCKNR_REG,
+		.nr_l1streams = IPU7P5_PS_MMU_SRT_WR_STREAM_NUM,
+		.nr_l2streams = IPU7P5_PS_MMU_SRT_WR_STREAM_NUM,
+		.l1_block_sz = { 0x00, 0x02, 0x06, 0x0a, 0x0c, 0x0e, 0x10, 0x12,
+				 0x14, 0x16, 0x18, 0x1a, 0x1c, 0x1e, 0x20, 0x22,
+				 0x24, 0x28, 0x2a, 0x36, 0x3e, 0x40, 0x42, 0x4e,
+				 0x56, 0x5c, 0x68, 0x70, 0x76, 0x77, 0x78, 0x79 },
+		.l2_block_sz = { 0x00, 0x02, 0x06, 0x0a, 0x0c, 0x0e, 0x10, 0x12,
+				 0x14, 0x16, 0x18, 0x1a, 0x1c, 0x1e, 0x20, 0x22,
+				 0x24, 0x28, 0x2a, 0x36, 0x3e, 0x40, 0x42, 0x4e,
+				 0x56, 0x5c, 0x68, 0x70, 0x76, 0x77, 0x78, 0x79 },
+		.zlx_nr = IPU7P5_PS_ZLX_DATA_WR_NUM,
+		.zlx_axi_pool = { 0x00000f50 },
+		.zlx_en = { 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1,
+			    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0 },
+		.zlx_conf = { 0x00010102, 0x00030103, 0x00030103, 0x00010101,
+			      0x00010101, 0x00030101, 0x00010101, 0x38010101,
+			      0x00000000, 0x00000000, 0x38010101, 0x38010101,
+			      0x38010101, 0x38010101, 0x38010101, 0x38010101,
+			      0x00030303, 0x00010101, 0x00042000, 0x00031000,
+			      0x00010101, 0x00010101, 0x00042000, 0x00031000,
+			      0x00031000, 0x00042000, 0x00031000, 0x00031000,
+			      0x00000000, 0x00000000, 0x00000000, 0x00000000 },
+		.uao_p_num = IPU7P5_PS_UAO_SRT_WR_PLANENUM,
+		.uao_p2tlb = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
+			       0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
+			       0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
+			       0x18, 0x19, 0x1a, 0x1b, 0x00, 0x00, 0x00, 0x00 },
+	},
+};
+
 static const struct ipu7_mmu_hwdata ipu7_mmu_hwdata_lookup[IPU_SUBSYS_NUM] = {
 	[IPU_PSYS] = {
 		.hwdata = ipu7_psys_mmu_hwdata,
@@ -442,6 +686,17 @@ static const struct ipu7_mmu_hwdata ipu7_mmu_hwdata_lookup[IPU_SUBSYS_NUM] = {
 	},
 };
 
+static const struct ipu7_mmu_hwdata ipu7p5_mmu_hwdata_lookup[IPU_SUBSYS_NUM] = {
+	[IPU_PSYS] = {
+		.hwdata = ipu7p5_psys_mmu_hwdata,
+		.nr_mmus = ARRAY_SIZE(ipu7p5_psys_mmu_hwdata),
+	},
+	[IPU_ISYS] = {
+		.hwdata = ipu7p5_isys_mmu_hwdata,
+		.nr_mmus = ARRAY_SIZE(ipu7p5_isys_mmu_hwdata),
+	},
+};
+
 static void __ipu7_tlb_invalidate(struct ipu6_mmu *mmu)
 {
 	struct ipu7_mmu_hw *mmu_hw = mmu->ipu7_mmu_hw;
@@ -561,13 +816,17 @@ static int __ipu7_mmu_hw_init(struct ipu6_mmu *mmu)
 static int __ipu7_mmu_init_hw_data(struct ipu6_mmu *mmu, struct device *dev,
 				   void __iomem *base)
 {
-	const struct ipu7_mmu_hwdata *lookup = ipu7_mmu_hwdata_lookup;
+	struct ipu6_device *isp = pci_get_drvdata(to_pci_dev(dev));
+	const struct ipu7_mmu_hwdata *lookup;
 	struct ipu7_mmu_hw *mmu_hw, *src;
 	unsigned int i, nr_mmus;
 
 	if (mmu->mmid >= IPU_SUBSYS_NUM)
 		return -EINVAL;
 
+	lookup = IS_IPU7P5(isp) ? ipu7p5_mmu_hwdata_lookup :
+				  ipu7_mmu_hwdata_lookup;
+
 	src = lookup[mmu->mmid].hwdata;
 	nr_mmus = lookup[mmu->mmid].nr_mmus;
 
diff --git a/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h b/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h
index 68663057138a..ba31ed31b245 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h
+++ b/drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h
@@ -114,6 +114,105 @@
 #define IPU7_PS_ZLX_FW_RD_NUM			16
 #define IPU7_PS_ZLX_FW_WR_NUM			10
 
+/* IPU7P5 */
+/* IS MMU Cmd RD */
+#define IPU7P5_IS_MMU_FW_RD_OFFSET		0x274000
+#define IPU7P5_IS_MMU_FW_RD_STREAM_NUM		3
+#define IPU7P5_IS_MMU_FW_RD_L1_BLOCKNR_REG	0x54
+#define IPU7P5_IS_MMU_FW_RD_L2_BLOCKNR_REG	0x60
+
+/* IS MMU Cmd WR */
+#define IPU7P5_IS_MMU_FW_WR_OFFSET		0x275000
+#define IPU7P5_IS_MMU_FW_WR_STREAM_NUM		3
+#define IPU7P5_IS_MMU_FW_WR_L1_BLOCKNR_REG	0x54
+#define IPU7P5_IS_MMU_FW_WR_L2_BLOCKNR_REG	0x60
+
+/* IS MMU Data WR Snoop */
+#define IPU7P5_IS_MMU_M0_OFFSET			0x276000
+#define IPU7P5_IS_MMU_M0_STREAM_NUM		16
+#define IPU7P5_IS_MMU_M0_L1_BLOCKNR_REG		0x54
+#define IPU7P5_IS_MMU_M0_L2_BLOCKNR_REG		0x94
+
+/* IS MMU Data WR ISOC */
+#define IPU7P5_IS_MMU_M1_OFFSET			0x277000
+#define IPU7P5_IS_MMU_M1_STREAM_NUM		16
+#define IPU7P5_IS_MMU_M1_L1_BLOCKNR_REG		0x54
+#define IPU7P5_IS_MMU_M1_L2_BLOCKNR_REG		0x94
+
+/* PS MMU FW RD */
+#define IPU7P5_PS_MMU_FW_RD_OFFSET		0x148000
+#define IPU7P5_PS_MMU_FW_RD_STREAM_NUM		16
+#define IPU7P5_PS_MMU_FW_RD_L1_BLOCKNR_REG	0x54
+#define IPU7P5_PS_MMU_FW_RD_L2_BLOCKNR_REG	0x94
+
+/* PS MMU FW WR */
+#define IPU7P5_PS_MMU_FW_WR_OFFSET		0x149000
+#define IPU7P5_PS_MMU_FW_WR_STREAM_NUM		10
+#define IPU7P5_PS_MMU_FW_WR_L1_BLOCKNR_REG	0x54
+#define IPU7P5_PS_MMU_FW_WR_L2_BLOCKNR_REG	0x7c
+
+/* PS MMU FW Data RD VC0 */
+#define IPU7P5_PS_MMU_SRT_RD_OFFSET		0x14a000
+#define IPU7P5_PS_MMU_SRT_RD_STREAM_NUM		22
+#define IPU7P5_PS_MMU_SRT_RD_L1_BLOCKNR_REG	0x54
+#define IPU7P5_PS_MMU_SRT_RD_L2_BLOCKNR_REG	0xac
+
+/* PS MMU FW Data WR VC0 */
+#define IPU7P5_PS_MMU_SRT_WR_OFFSET		0x14b000
+#define IPU7P5_PS_MMU_SRT_WR_STREAM_NUM		32
+#define IPU7P5_PS_MMU_SRT_WR_L1_BLOCKNR_REG	0x54
+#define IPU7P5_PS_MMU_SRT_WR_L2_BLOCKNR_REG	0xd4
+
+/* IS UAO UC RD */
+#define IPU7P5_IS_UAO_UC_RD_OFFSET		0x27c000
+#define IPU7P5_IS_UAO_UC_RD_PLANENUM		4
+
+/* IS UAO UC WR */
+#define IPU7P5_IS_UAO_UC_WR_OFFSET		0x27d000
+#define IPU7P5_IS_UAO_UC_WR_PLANENUM		4
+
+/* IS UAO M0 WR */
+#define IPU7P5_IS_UAO_M0_WR_OFFSET		0x27e000
+#define IPU7P5_IS_UAO_M0_WR_PLANENUM		16
+
+/* IS UAO M1 WR */
+#define IPU7P5_IS_UAO_M1_WR_OFFSET		0x27f000
+#define IPU7P5_IS_UAO_M1_WR_PLANENUM		16
+
+/* PS UAO FW RD */
+#define IPU7P5_PS_UAO_FW_RD_OFFSET		0x156000
+#define IPU7P5_PS_UAO_FW_RD_PLANENUM		16
+
+/* PS UAO FW WR */
+#define IPU7P5_PS_UAO_FW_WR_OFFSET		0x157000
+#define IPU7P5_PS_UAO_FW_WR_PLANENUM		10
+
+/* PS UAO SRT RD */
+#define IPU7P5_PS_UAO_SRT_RD_OFFSET		0x154000
+#define IPU7P5_PS_UAO_SRT_RD_PLANENUM		22
+
+/* PS UAO SRT WR */
+#define IPU7P5_PS_UAO_SRT_WR_OFFSET		0x155000
+#define IPU7P5_PS_UAO_SRT_WR_PLANENUM		32
+
+#define IPU7P5_IS_ZLX_UC_RD_OFFSET		0x278000
+#define IPU7P5_IS_ZLX_UC_WR_OFFSET		0x279000
+#define IPU7P5_IS_ZLX_M0_OFFSET			0x27a000
+#define IPU7P5_IS_ZLX_M1_OFFSET			0x27b000
+#define IPU7P5_IS_ZLX_UC_RD_NUM			4
+#define IPU7P5_IS_ZLX_UC_WR_NUM			4
+#define IPU7P5_IS_ZLX_M0_NUM			16
+#define IPU7P5_IS_ZLX_M1_NUM			16
+
+#define IPU7P5_PS_ZLX_DATA_RD_OFFSET		0x14e000
+#define IPU7P5_PS_ZLX_DATA_WR_OFFSET		0x14f000
+#define IPU7P5_PS_ZLX_FW_RD_OFFSET		0x150000
+#define IPU7P5_PS_ZLX_FW_WR_OFFSET		0x151000
+#define IPU7P5_PS_ZLX_DATA_RD_NUM		22
+#define IPU7P5_PS_ZLX_DATA_WR_NUM		32
+#define IPU7P5_PS_ZLX_FW_RD_NUM			16
+#define IPU7P5_PS_ZLX_FW_WR_NUM			10
+
 struct ipu7_mmu_hw {
 	char name[32];
 
-- 
2.55.0

