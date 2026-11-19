Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102733;
	b=WCigQuqTiGcppn+0G8NFNgz50I9wjXmws9RkS4sV5vhvGaJpxDUiIkA2+rc2nsd75mkN
	 r5Yz+8TZT5TgyMh1Xj3vkZeekfuzmaws77c7daWBL3yQ72nnU7L7G6yET/31yNpnR67DA
	 FwcJTEtoFJygLGFoocoy9hhe5Lc0RJgUPpuN+XDxv71y8R8pQrbWzQ37Np1/A+12uPWhs
	 MiZaTS9vFv2zo9RmDsRlC4SCNJgwRsrEh7yuW0WixshO4oyIctUDDrv1ZHR5nB78fW3Oc
	 VUM06JSeg7dp+ninDtF+nJMzFfmmKnCxTulaRv158ccNQKTjEF+Q9aWldThnIBrr8vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102733;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wDQVFklMEPkWRJaiWz+r3fBXMdiZ0dwETI2SNGHp7f8=;
	b=h9rU0b2k9hVUdnCsWuWWAiw9jJdtJrtclXbmhuSicF0Sv/CAPMnMQ9sukPy0tz+Qg3T3
	 kj5ESNlqOZoyYZaZJCSsGlEdquuH+CZGmk/CsNJpG8GbNCi8iLqGfMx9JuShbZFNndYrR
	 YMc/NGvDqI6Zdgc+xRalFXfMUfwjdrcvw+PTT1+iVPOdmDOboy1NhlRzAjNAN10qIcOGJ
	 RC9gzV9rGdFaIQ+Bnn0YeSNB80ACPWqcny4UwAN+RwxIoNUL00JCRUsh5SGzxuurIc+IV
	 dfeZCs0smT7Dp7pndVCSeOa1F6/fQjOr/ta3riMMQD4nSvWbM3Oa5S90XLxXgi3W9sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HoDYvf7t;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6595460A6F73;
	Thu, 19 Nov 2026 15:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6595460A6F73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HoDYvf7t
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 350971C14;
	Thu, 19 Nov 2026 07:38:46 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EA453F882;
	Thu, 19 Nov 2026 07:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102729; bh=1KMR9veEzXfMz9MEmmYl0Wewye9BgthEA9QSvaLfY2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HoDYvf7tUB4dc1wUtgGEJueztgBJ3KrNHhC1cNE9eMjliXsEQOgG1krgqBmlfb1ai
	 mzV0OH/iW1ANYBw/LdoT2e49N5TBxDHpQdb0E6gDUQnnXfVbNqtGPVyBIuUmTHA0yb
	 NLAcc/AWY7k+WfbI8DWPa81ZNbceWYM29+8CfSRE=
From: Charvi Mehta <charvi.mehta@arm.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Charvi Mehta <charvi.mehta@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Rathinavel Sankaralingam <rath.sankaralingam@arm.com>,
	Shobhit Pandey <shobhit.pandey@arm.com>
Subject: [RFC PATCH 12/28] media: mali-vpu: prepare firmware address space
Date: Thu, 19 Nov 2026 15:37:42 +0000
Message-ID: <20261119153758.1426673-13-charvi.mehta@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119153758.1426673-1-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a per-session firmware object containing the memory required to
communicate with and execute the firmware.

Define the fixed firmware virtual-address layout and allocate the host
communication pages. Allocate firmware text pages shared by each core
instance, private BSS pages for each core and shared BSS pages mapped
across all instances. Copy the loaded firmware text into the executable
mapping.

Construct the firmware address space when the firmware binary
finishes loading, using the number of cores reported by the hardware.
Release all the firmware mappings and backing pages during session
teardown.

Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 drivers/media/platform/arm/mali-vpu/Makefile  |   3 +-
 .../arm/mali-vpu/mali-vpu-firmware-cache.c    |  55 ++-
 .../arm/mali-vpu/mali-vpu-firmware-cache.h    |   6 +
 .../platform/arm/mali-vpu/mali-vpu-firmware.c | 383 ++++++++++++++++++
 .../platform/arm/mali-vpu/mali-vpu-firmware.h | 108 +++++
 .../platform/arm/mali-vpu/mali-vpu-probe.c    |   6 -
 .../arm/mali-vpu/mali-vpu-protocol-def-v3.h   |  94 +++++
 .../arm/mali-vpu/mali-vpu-registers.h         |   7 +
 .../platform/arm/mali-vpu/mali-vpu-session.c  |  20 +
 .../platform/arm/mali-vpu/mali-vpu-session.h  |   8 +-
 10 files changed, 675 insertions(+), 15 deletions(-)
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h

diff --git a/drivers/media/platform/arm/mali-vpu/Makefile b/drivers/media/platform/arm/mali-vpu/Makefile
index 74e1455c01d8b..168b4bc43d54d 100644
--- a/drivers/media/platform/arm/mali-vpu/Makefile
+++ b/drivers/media/platform/arm/mali-vpu/Makefile
@@ -10,6 +10,7 @@ mali-vpu-objs := mali-vpu-probe.o \
 		mali-vpu-formats.o \
 		mali-vpu-controls.o \
 		mali-vpu-mmu.o \
-		mali-vpu-firmware-cache.o
+		mali-vpu-firmware-cache.o \
+		mali-vpu-firmware.o
 
 obj-$(CONFIG_VIDEO_MALI_VPU) += mali-vpu.o
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.c
index 2cc69df71bd93..40eba8caeb0d7 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.c
@@ -7,6 +7,7 @@
 #include <linux/kthread.h>
 
 #include "mali-vpu-device.h"
+#include "mali-vpu-firmware.h"
 #include "mali-vpu-firmware-cache.h"
 #include "mali-vpu-mmu.h"
 #include "mali-vpu-protocol-def-v3.h"
@@ -15,11 +16,6 @@
 
 #define MALI_VPU_GET_MAJOR_VERSION(ver) (((ver) >> 16) & 0xFF)
 
-static inline bool mali_vpu_test_bit_le32(u32 bit, const __le32 *addr)
-{
-	return !!(le32_to_cpu(addr[bit >> 5]) & BIT(bit & 0x1F));
-}
-
 static void mali_vpu_fw_bin_release(struct kref *ref)
 {
 	struct mali_vpu_fw_bin *bin = container_of(ref, struct mali_vpu_fw_bin, refcount);
@@ -71,9 +67,13 @@ static int mali_vpu_fw_parse_header(const struct firmware *fw,
 	u32 header_fw_ver_major;
 	u32 fw_version, text_length, bss_start, bss_bitmap_size;
 	u32 master_rw_start, master_rw_size;
+	u64 text_end, bss_end, master_rw_end;
 	mali_vpu_mmu_va va;
 	u32 i;
 
+	u32 region_size = MVE_MEM_REGION_FW_INSTANCE0_ADDR_END -
+				MVE_MEM_REGION_FW_INSTANCE0_ADDR_BEGIN;
+
 	/* Validate the fw binary */
 	if (fw->size < sizeof(*header)) {
 		dev_err(vpu_fw_bin->cache->dev,
@@ -91,8 +91,15 @@ static int mali_vpu_fw_parse_header(const struct firmware *fw,
 	master_rw_start	= le32_to_cpu(header->master_rw_start_address);
 	master_rw_size	= le32_to_cpu(header->master_rw_size);
 
+	/*
+	 * text_length includes header and is measured from file offset zero.
+	 * The image is mapped at MALI_VPU_FW_TEXT_BASE_ADDR.
+	 */
+	text_end = (u64)MALI_VPU_FW_TEXT_BASE_ADDR + text_length;
+
 	if (text_length < sizeof(*header) ||
-	    text_length > fw->size) {
+	    text_length > fw->size ||
+	    text_end > region_size) {
 		dev_err(vpu_fw_bin->cache->dev,
 			"invalid firmware text length: %u\n",
 			text_length);
@@ -106,6 +113,42 @@ static int mali_vpu_fw_parse_header(const struct firmware *fw,
 		return -EBADMSG;
 	}
 
+	/*
+	 * BSS addresses are relative to a firmware instance's base, not offsets
+	 * into the file. Each bitmap bit describes one VPU page,
+	 *
+	 * The BSS span must fit within the instance and must not overlap the
+	 * text mapping. Since bss_start is page-aligned, comparing it against
+	 * text_end also prevents overlap with the final text page.
+	 */
+	bss_end = (u64)bss_start +
+		(u64)bss_bitmap_size * MALI_VPU_PAGE_SIZE;
+
+	if ((bss_start & MALI_VPU_PAGE_MASK) ||
+	    bss_start < text_end ||
+	    bss_end > region_size) {
+		dev_err(vpu_fw_bin->cache->dev,
+			"invalid firmware BSS layout: start=%#x, pages=%u\n",
+			bss_start, bss_bitmap_size);
+		return -EBADMSG;
+	}
+
+	/*
+	 * The shared region must lie within the BSS span. Its start must be
+	 * page-aligned, but its size need not be: the final page may be only
+	 * partially used.
+	 */
+	master_rw_end = (u64)master_rw_start + master_rw_size;
+
+	if ((master_rw_start & MALI_VPU_PAGE_MASK) ||
+	    master_rw_start < bss_start ||
+	    master_rw_end > bss_end) {
+		dev_err(vpu_fw_bin->cache->dev,
+			"invalid firmware shared region: start=%#x, size=%#x\n",
+			master_rw_start, master_rw_size);
+		return -EBADMSG;
+	}
+
 	/* Firmware version mismatch */
 	header_fw_ver_major = MALI_VPU_GET_MAJOR_VERSION(fw_version);
 	if (header_fw_ver_major != vpu_fw_bin->key.fw_ver_major) {
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.h
index ea7d35ef8ca60..181bf164b49a7 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware-cache.h
@@ -7,6 +7,7 @@
 #define __MALI_VPU_FIRMWARE_CACHE_H__
 
 #include <asm/byteorder.h>
+#include <linux/bits.h>
 #include <linux/firmware.h>
 #include <linux/kref.h>
 #include <linux/list.h>
@@ -171,4 +172,9 @@ void mali_vpu_fw_cache_put(struct mali_vpu_fw_bin *bin);
 bool mali_vpu_fw_cache_cancel_waiter(struct mali_vpu_fw_cache *cache,
 				     struct mali_vpu_fw_event *event);
 
+static inline bool mali_vpu_test_bit_le32(u32 bit, const __le32 *addr)
+{
+	return !!(le32_to_cpu(addr[bit >> 5]) & BIT(bit & 0x1F));
+}
+
 #endif /* __MALI_VPU_FIRMWARE_CACHE_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
new file mode 100644
index 0000000000000..3c552b5fb2d9b
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
@@ -0,0 +1,383 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/string.h>
+
+#include "mali-vpu-firmware.h"
+#include "mali-vpu-firmware-cache.h"
+#include "mali-vpu-mmu.h"
+#include "mali-vpu-protocol-def-v3.h"
+
+#define MALI_VPU_FW_MAX_CORES 8
+
+static int mali_vpu_fw_get_region(enum mali_vpu_fw_region region,
+				  mali_vpu_mmu_va *begin, mali_vpu_mmu_va *end)
+{
+	switch (region) {
+	case MALI_VPU_FW_REGION_MSG_HOST:
+		*begin = MVE_COMM_MSG_INQ_ADDR;
+		*end = MVE_COMM_MSG_INQ_ADDR + MALI_VPU_PAGE_SIZE;
+		break;
+	case MALI_VPU_FW_REGION_MSG_MVE:
+		*begin = MVE_COMM_MSG_OUTQ_ADDR;
+		*end = MVE_COMM_MSG_OUTQ_ADDR + MALI_VPU_PAGE_SIZE;
+		break;
+	case MALI_VPU_FW_REGION_BUF_IN_HOST:
+		*begin = MVE_COMM_BUF_INQ_ADDR;
+		*end = MVE_COMM_BUF_INQ_ADDR + MALI_VPU_PAGE_SIZE;
+		break;
+	case MALI_VPU_FW_REGION_BUF_IN_MVE:
+		*begin = MVE_COMM_BUF_INRQ_ADDR;
+		*end = MVE_COMM_BUF_INRQ_ADDR + MALI_VPU_PAGE_SIZE;
+		break;
+	case MALI_VPU_FW_REGION_BUF_OUT_HOST:
+		*begin = MVE_COMM_BUF_OUTQ_ADDR;
+		*end = MVE_COMM_BUF_OUTQ_ADDR + MALI_VPU_PAGE_SIZE;
+		break;
+	case MALI_VPU_FW_REGION_BUF_OUT_MVE:
+		*begin = MVE_COMM_BUF_OUTRQ_ADDR;
+		*end = MVE_COMM_BUF_OUTRQ_ADDR + MALI_VPU_PAGE_SIZE;
+		break;
+	case MALI_VPU_FW_REGION_RPC:
+		*begin = MVE_COMM_RPC_ADDR;
+		*end = MVE_COMM_RPC_ADDR + MALI_VPU_PAGE_SIZE;
+		break;
+	case MALI_VPU_FW_REGION_CORE_0:
+		*begin = MVE_MEM_REGION_FW_INSTANCE0_ADDR_BEGIN;
+		*end = MVE_MEM_REGION_FW_INSTANCE0_ADDR_END;
+		break;
+	case MALI_VPU_FW_REGION_CORE_1:
+		*begin = MVE_MEM_REGION_FW_INSTANCE1_ADDR_BEGIN;
+		*end = MVE_MEM_REGION_FW_INSTANCE1_ADDR_END;
+		break;
+	case MALI_VPU_FW_REGION_CORE_2:
+		*begin = MVE_MEM_REGION_FW_INSTANCE2_ADDR_BEGIN;
+		*end = MVE_MEM_REGION_FW_INSTANCE2_ADDR_END;
+		break;
+	case MALI_VPU_FW_REGION_CORE_3:
+		*begin = MVE_MEM_REGION_FW_INSTANCE3_ADDR_BEGIN;
+		*end = MVE_MEM_REGION_FW_INSTANCE3_ADDR_END;
+		break;
+	case MALI_VPU_FW_REGION_CORE_4:
+		*begin = MVE_MEM_REGION_FW_INSTANCE4_ADDR_BEGIN;
+		*end = MVE_MEM_REGION_FW_INSTANCE4_ADDR_END;
+		break;
+	case MALI_VPU_FW_REGION_CORE_5:
+		*begin = MVE_MEM_REGION_FW_INSTANCE5_ADDR_BEGIN;
+		*end = MVE_MEM_REGION_FW_INSTANCE5_ADDR_END;
+		break;
+	case MALI_VPU_FW_REGION_CORE_6:
+		*begin = MVE_MEM_REGION_FW_INSTANCE6_ADDR_BEGIN;
+		*end = MVE_MEM_REGION_FW_INSTANCE6_ADDR_END;
+		break;
+	case MALI_VPU_FW_REGION_CORE_7:
+		*begin = MVE_MEM_REGION_FW_INSTANCE7_ADDR_BEGIN;
+		*end = MVE_MEM_REGION_FW_INSTANCE7_ADDR_END;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mali_vpu_fw_map_region(struct mali_vpu_fw *fw, struct mali_vpu_fw_proto_page *proto_page,
+				  enum mali_vpu_fw_region region)
+{
+	mali_vpu_mmu_va begin, end;
+	dma_addr_t dma;
+	int ret;
+
+	/* Get virtual address where the message queue is to be mapped. */
+	ret = mali_vpu_fw_get_region(region, &begin, &end);
+	if (ret)
+		return ret;
+
+	/* Allocate backing memory and retain the original page. */
+	dma = mali_vpu_mmu_alloc_page(fw->dev, &proto_page->linux_page, DMA_BIDIRECTIONAL);
+	if (!proto_page->linux_page)
+		return -ENOMEM;
+
+	/* Memory map region. */
+	ret = mali_vpu_mmu_map_dma(fw->mmu, begin, dma, MALI_VPU_PAGE_SIZE,
+				   MALI_VPU_ATTR_SHARED_RW, MALI_VPU_ACCESS_READ_WRITE);
+	if (ret) {
+		mali_vpu_mmu_free_page(fw->dev, dma, proto_page->linux_page, DMA_BIDIRECTIONAL);
+		proto_page->linux_page = NULL;
+		return ret;
+	}
+
+	proto_page->cpu = page_address(proto_page->linux_page);
+	proto_page->dma = dma;
+	proto_page->va = begin;
+
+	return 0;
+}
+
+static void mali_vpu_fw_unmap_region(struct mali_vpu_fw *fw,
+				     struct mali_vpu_fw_proto_page *proto_page)
+{
+	if (!fw || !proto_page || !proto_page->linux_page)
+		return;
+
+	mali_vpu_mmu_unmap_va(fw->mmu, proto_page->va, MALI_VPU_PAGE_SIZE);
+	mali_vpu_mmu_free_page(fw->dev, proto_page->dma, proto_page->linux_page,
+			       DMA_BIDIRECTIONAL);
+	memset(proto_page, 0, sizeof(*proto_page));
+}
+
+static void mali_vpu_fw_unmap_protocol(struct mali_vpu_fw *fw)
+{
+	if (!fw)
+		return;
+
+	mali_vpu_fw_unmap_region(fw, &fw->rpc);
+	mali_vpu_fw_unmap_region(fw, &fw->buf_out_mve);
+	mali_vpu_fw_unmap_region(fw, &fw->buf_out_host);
+	mali_vpu_fw_unmap_region(fw, &fw->buf_in_mve);
+	mali_vpu_fw_unmap_region(fw, &fw->buf_in_host);
+	mali_vpu_fw_unmap_region(fw, &fw->msg_mve);
+	mali_vpu_fw_unmap_region(fw, &fw->msg_host);
+}
+
+static int mali_vpu_fw_map_protocol(struct mali_vpu_fw *fw)
+{
+	int ret = 0;
+
+	if (!fw)
+		return -EINVAL;
+
+	ret = mali_vpu_fw_map_region(fw, &fw->msg_host, MALI_VPU_FW_REGION_MSG_HOST);
+	if (ret)
+		return ret;
+
+	ret = mali_vpu_fw_map_region(fw, &fw->msg_mve, MALI_VPU_FW_REGION_MSG_MVE);
+	if (ret)
+		goto err_unmap_protocol;
+
+	ret = mali_vpu_fw_map_region(fw, &fw->buf_in_host, MALI_VPU_FW_REGION_BUF_IN_HOST);
+	if (ret)
+		goto err_unmap_protocol;
+
+	ret = mali_vpu_fw_map_region(fw, &fw->buf_in_mve, MALI_VPU_FW_REGION_BUF_IN_MVE);
+	if (ret)
+		goto err_unmap_protocol;
+
+	ret = mali_vpu_fw_map_region(fw, &fw->buf_out_host, MALI_VPU_FW_REGION_BUF_OUT_HOST);
+	if (ret)
+		goto err_unmap_protocol;
+
+	ret = mali_vpu_fw_map_region(fw, &fw->buf_out_mve, MALI_VPU_FW_REGION_BUF_OUT_MVE);
+	if (ret)
+		goto err_unmap_protocol;
+
+	ret = mali_vpu_fw_map_region(fw, &fw->rpc, MALI_VPU_FW_REGION_RPC);
+	if (ret)
+		goto err_unmap_protocol;
+
+	return 0;
+
+err_unmap_protocol:
+	mali_vpu_fw_unmap_protocol(fw);
+
+	return ret;
+}
+
+static int mali_vpu_fw_map_one_core(struct mali_vpu_fw *fw,
+				    const struct mali_vpu_fw_bin *fw_bin,
+				    u32 core)
+{
+	/* Map pages for the text and BSS segments for one core. */
+	enum mali_vpu_fw_region region = MALI_VPU_FW_REGION_CORE_0 + core;
+	mali_vpu_mmu_va begin, end, va;
+	const struct mali_vpu_fw_header *hdr = fw_bin->header;
+	u32 bss_count = core * fw_bin->bss_page_count;
+	u32 shared_bss_count = 0;
+	u32 master_rw_start, master_rw_size, bss_bitmap_size, i;
+	bool is_shared;
+	int ret;
+
+	/*
+	 * Get the base address where the pages for this core should be
+	 * mapped.
+	 */
+	ret = mali_vpu_fw_get_region(region, &begin, &end);
+	if (ret)
+		return ret;
+
+	/* Map text segment. */
+	ret = mali_vpu_mmu_map_pages(fw->mmu, begin + MALI_VPU_FW_TEXT_BASE_ADDR,
+				     fw->text_pages, MALI_VPU_ATTR_PRIVATE,
+				     MALI_VPU_ACCESS_EXECUTABLE);
+	if (ret)
+		return ret;
+
+	bss_bitmap_size = le32_to_cpu(hdr->bss_bitmap_size);
+	master_rw_start = le32_to_cpu(hdr->master_rw_start_address);
+	master_rw_size = le32_to_cpu(hdr->master_rw_size);
+
+	/* Map bss shared and private pages. */
+	va = le32_to_cpu(hdr->bss_start_address);
+	for (i = 0; i < bss_bitmap_size; i++) {
+		dma_addr_t dma;
+
+		is_shared = (va >= master_rw_start &&
+			     va < (master_rw_start + master_rw_size));
+
+		if (is_shared) {
+			dma = fw->shared_bss_pages->pages[shared_bss_count++].dma;
+		} else if (mali_vpu_test_bit_le32(i, hdr->bss_bitmap)) {
+			dma = fw->bss_pages->pages[bss_count++].dma;
+		} else {
+			va += MALI_VPU_PAGE_SIZE;
+			continue;
+		}
+
+		ret = mali_vpu_mmu_map_dma(fw->mmu, begin + va, dma, MALI_VPU_PAGE_SIZE,
+					   MALI_VPU_ATTR_PRIVATE, MALI_VPU_ACCESS_READ_WRITE);
+		if (ret)
+			return ret;
+
+		va += MALI_VPU_PAGE_SIZE;
+	}
+
+	return 0;
+}
+
+static void mali_vpu_fw_unmap_core_regions(struct mali_vpu_fw *fw)
+{
+	enum mali_vpu_fw_region region;
+	mali_vpu_mmu_va begin, end;
+	u32 core;
+	int ret;
+
+	if (!fw)
+		return;
+
+	for (core = 0; core < fw->ncores; core++) {
+		region = MALI_VPU_FW_REGION_CORE_0 + core;
+		ret = mali_vpu_fw_get_region(region, &begin, &end);
+		if (!ret)
+			mali_vpu_mmu_unmap_va(fw->mmu, begin, end - begin);
+	}
+
+	if (!IS_ERR_OR_NULL(fw->text_pages)) {
+		mali_vpu_mmu_free_pages(fw->text_pages);
+		fw->text_pages = NULL;
+	}
+
+	if (!IS_ERR_OR_NULL(fw->bss_pages)) {
+		mali_vpu_mmu_free_pages(fw->bss_pages);
+		fw->bss_pages = NULL;
+	}
+
+	if (!IS_ERR_OR_NULL(fw->shared_bss_pages)) {
+		mali_vpu_mmu_free_pages(fw->shared_bss_pages);
+		fw->shared_bss_pages = NULL;
+	}
+}
+
+static int mali_vpu_fw_map_core_regions(struct mali_vpu_fw *fw,
+					const struct mali_vpu_fw_bin *fw_bin)
+{
+	const struct mali_vpu_fw_header *hdr;
+	int ret = 0;
+	u32 core;
+
+	if (!fw || !fw_bin || !fw_bin->header || !fw_bin->fw)
+		return -EINVAL;
+
+	hdr = fw_bin->header;
+
+	fw->text_pages = mali_vpu_mmu_alloc_pages(fw->dev, fw_bin->text_page_count, 0);
+	if (IS_ERR(fw->text_pages)) {
+		ret = PTR_ERR(fw->text_pages);
+		goto err_unmap;
+	}
+
+	if (fw_bin->bss_page_count) {
+		fw->bss_pages = mali_vpu_mmu_alloc_pages(fw->dev,
+							 fw_bin->bss_page_count * fw->ncores, 0);
+		if (IS_ERR(fw->bss_pages)) {
+			ret = PTR_ERR(fw->bss_pages);
+			goto err_unmap;
+		}
+	}
+
+	if (fw_bin->shared_bss_page_count) {
+		fw->shared_bss_pages = mali_vpu_mmu_alloc_pages(fw->dev,
+								fw_bin->shared_bss_page_count, 0);
+		if (IS_ERR(fw->shared_bss_pages)) {
+			ret = PTR_ERR(fw->shared_bss_pages);
+			goto err_unmap;
+		}
+	}
+
+	for (core = 0; core < fw->ncores; core++) {
+		ret = mali_vpu_fw_map_one_core(fw, fw_bin, core);
+		if (ret)
+			goto err_unmap;
+	}
+
+	ret = mali_vpu_mmu_write(fw->text_pages, fw_bin->fw->data,
+				 le32_to_cpu(hdr->text_length));
+	if (ret)
+		goto err_unmap;
+
+	return 0;
+
+err_unmap:
+	mali_vpu_fw_unmap_core_regions(fw);
+	return ret;
+}
+
+int mali_vpu_fw_construct(struct mali_vpu_fw *fw, const struct mali_vpu_fw_bin *fw_bin,
+			  struct device *dev, struct mali_vpu_mmu *mmu, u32 ncores)
+{
+	int ret;
+
+	if (!fw || !fw_bin || !dev || !mmu)
+		return -EINVAL;
+
+	if (ncores == 0 || ncores > MALI_VPU_FW_MAX_CORES)
+		return -EINVAL;
+
+	memset(fw, 0, sizeof(*fw));
+	fw->dev = dev;
+	fw->mmu = mmu;
+	fw->ncores = ncores;
+
+	/* Initialise firmware core and protocol regions */
+	ret = mali_vpu_fw_map_core_regions(fw, fw_bin);
+	if (ret) {
+		dev_err(fw->dev, "failed to map firmware core regions: %d\n", ret);
+		return ret;
+	}
+
+	ret = mali_vpu_fw_map_protocol(fw);
+	if (ret) {
+		dev_err(fw->dev, "failed to map firmware protocol regions: %d\n", ret);
+		goto err_unmap_core;
+	}
+
+	return 0;
+
+err_unmap_core:
+	mali_vpu_fw_unmap_core_regions(fw);
+	return ret;
+}
+
+void mali_vpu_fw_cleanup(struct mali_vpu_fw *fw)
+{
+	if (!fw)
+		return;
+
+	mali_vpu_fw_unmap_protocol(fw);
+	mali_vpu_fw_unmap_core_regions(fw);
+	memset(fw, 0, sizeof(*fw));
+}
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
new file mode 100644
index 0000000000000..a40928db774f0
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#ifndef __MALI_VPU_FIRMWARE_H__
+#define __MALI_VPU_FIRMWARE_H__
+
+#include <linux/types.h>
+
+#define MALI_VPU_FW_TEXT_BASE_ADDR 0x1000u
+
+struct device;
+struct mali_vpu_mmu;
+struct mali_vpu_fw_bin;
+struct mali_vpu_mmu_pages;
+
+/**
+ * enum mali_vpu_fw_region - Regions in the firmware virtual address space.
+ * @MALI_VPU_FW_REGION_MSG_HOST: Host-to-firmware message queue.
+ * @MALI_VPU_FW_REGION_MSG_MVE: Firmware-to-host message queue.
+ * @MALI_VPU_FW_REGION_BUF_IN_HOST: Host input-buffer queue.
+ * @MALI_VPU_FW_REGION_BUF_IN_MVE: Returned input-buffer queue.
+ * @MALI_VPU_FW_REGION_BUF_OUT_HOST: Host output-buffer queue.
+ * @MALI_VPU_FW_REGION_BUF_OUT_MVE: Returned output-buffer queue.
+ * @MALI_VPU_FW_REGION_RPC: Firmware RPC communication area.
+ * @MALI_VPU_FW_REGION_CORE_0: Firmware instance region for core 0.
+ * @MALI_VPU_FW_REGION_CORE_1: Firmware instance region for core 1.
+ * @MALI_VPU_FW_REGION_CORE_2: Firmware instance region for core 2.
+ * @MALI_VPU_FW_REGION_CORE_3: Firmware instance region for core 3.
+ * @MALI_VPU_FW_REGION_CORE_4: Firmware instance region for core 4.
+ * @MALI_VPU_FW_REGION_CORE_5: Firmware instance region for core 5.
+ * @MALI_VPU_FW_REGION_CORE_6: Firmware instance region for core 6.
+ * @MALI_VPU_FW_REGION_CORE_7: Firmware instance region for core 7.
+ */
+enum mali_vpu_fw_region {
+	MALI_VPU_FW_REGION_MSG_HOST,
+	MALI_VPU_FW_REGION_MSG_MVE,
+	MALI_VPU_FW_REGION_BUF_IN_HOST,
+	MALI_VPU_FW_REGION_BUF_IN_MVE,
+	MALI_VPU_FW_REGION_BUF_OUT_HOST,
+	MALI_VPU_FW_REGION_BUF_OUT_MVE,
+	MALI_VPU_FW_REGION_RPC,
+
+	/* Firmware instance regions (one per core) */
+	MALI_VPU_FW_REGION_CORE_0,
+	MALI_VPU_FW_REGION_CORE_1,
+	MALI_VPU_FW_REGION_CORE_2,
+	MALI_VPU_FW_REGION_CORE_3,
+	MALI_VPU_FW_REGION_CORE_4,
+	MALI_VPU_FW_REGION_CORE_5,
+	MALI_VPU_FW_REGION_CORE_6,
+	MALI_VPU_FW_REGION_CORE_7,
+};
+
+/**
+ * struct mali_vpu_fw_proto_page - Backing memory and mappings for a protocol page.
+ * @linux_page: Original allocated page backing the queue/RPC area.
+ * @cpu: Kernel CPU mapping used by host-side queue/RPC access.
+ * @dma: DMA address of the queue/RPC page, mapped into the VPU address space.
+ * @va: Firmware-visible virtual address used by firmware-side queue/RPC access.
+ */
+struct mali_vpu_fw_proto_page {
+	struct page *linux_page;
+	void *cpu;
+	dma_addr_t dma;
+	u32 va;
+};
+
+/**
+ * struct mali_vpu_fw - Firmware object
+ * @dev: Pointer to device.
+ * @mmu: Pointer to MMU object.
+ * @msg_host: Host message queue.
+ * @msg_mve: MVE message queue.
+ * @buf_in_host: Input buffer queue. Host enqueue filled buffers.
+ * @buf_in_mve: Input buffer queue. MVE return empty buffers.
+ * @buf_out_host: Output buffer queue. Host enqueue empty buffers.
+ * @buf_out_mve: Output buffer queue. MVE return filled buffers.
+ * @rpc: RPC communication area.
+ * @text_pages: Firmware text pages shared by all mapped core instances.
+ * @bss_pages: Private BSS pages allocated separately for each core instance.
+ * @shared_bss_pages: Shared BSS pages mapped into every core instance.
+ * @ncores: Number of firmware core-instance regions constructed.
+ */
+struct mali_vpu_fw {
+	struct device *dev;
+	struct mali_vpu_mmu *mmu;
+
+	struct mali_vpu_fw_proto_page msg_host;
+	struct mali_vpu_fw_proto_page msg_mve;
+	struct mali_vpu_fw_proto_page buf_in_host;
+	struct mali_vpu_fw_proto_page buf_in_mve;
+	struct mali_vpu_fw_proto_page buf_out_host;
+	struct mali_vpu_fw_proto_page buf_out_mve;
+	struct mali_vpu_fw_proto_page rpc;
+
+	struct mali_vpu_mmu_pages *text_pages;
+	struct mali_vpu_mmu_pages *bss_pages;
+	struct mali_vpu_mmu_pages *shared_bss_pages;
+	u32 ncores;
+};
+
+int mali_vpu_fw_construct(struct mali_vpu_fw *fw, const struct mali_vpu_fw_bin *fw_bin,
+			  struct device *dev, struct mali_vpu_mmu *mmu, u32 ncores);
+void mali_vpu_fw_cleanup(struct mali_vpu_fw *fw);
+
+#endif /* __MALI_VPU_FIRMWARE_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
index b87725d7d4cab..123ff4d8fc937 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
@@ -26,12 +26,6 @@
 #include "mali-vpu-variant.h"
 #include "mali-vpu-vidioc.h"
 
-/* VPU register access helpers */
-static u32 mali_vpu_read_reg(void __iomem *regs_base, u32 off)
-{
-	return readl(regs_base + off);
-}
-
 static void mali_vpu_read_version(struct mali_vpu_dev *vpu_dev, u32 *product_id, u32 *rev,
 				  u32 *patch)
 {
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
index f3a61731191bc..b6d46f91287c4 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
@@ -28,6 +28,100 @@
 #define MALI_VPU_HOST_PROTOCOL_MAJOR 3
 #define MALI_VPU_HOST_PROTOCOL_MINOR 1
 
+/*****************************************************************************
+ *
+ * Virtual memory regions
+ *
+ * ..._ADDR_BEGIN gives the starting virtual address of the region,
+ * and ..._ADDR_END the (non-inclusive) ending address, such that
+ * the size of the region is obtained with the subtraction
+ * (..._ADDR_END - ..._ADDR_BEGIN).
+ *
+ ****************************************************************************/
+
+/* Memory region for first firmware instance */
+#define MVE_MEM_REGION_FW_INSTANCE0_ADDR_BEGIN	(0x00000000u)
+#define MVE_MEM_REGION_FW_INSTANCE0_ADDR_END	(0x000FFFFFu + 1)
+
+/* Memory regions for other firmware instances */
+#define MVE_MEM_REGION_FW_INSTANCE1_ADDR_BEGIN	(0x01000000u)
+#define MVE_MEM_REGION_FW_INSTANCE1_ADDR_END \
+	(MVE_MEM_REGION_FW_INSTANCE1_ADDR_BEGIN + MVE_MEM_REGION_FW_INSTANCE0_ADDR_END)
+
+#define MVE_MEM_REGION_FW_INSTANCE2_ADDR_BEGIN (0x02000000u)
+#define MVE_MEM_REGION_FW_INSTANCE2_ADDR_END \
+	(MVE_MEM_REGION_FW_INSTANCE2_ADDR_BEGIN + MVE_MEM_REGION_FW_INSTANCE0_ADDR_END)
+
+#define MVE_MEM_REGION_FW_INSTANCE3_ADDR_BEGIN (0x03000000u)
+#define MVE_MEM_REGION_FW_INSTANCE3_ADDR_END \
+	(MVE_MEM_REGION_FW_INSTANCE3_ADDR_BEGIN + MVE_MEM_REGION_FW_INSTANCE0_ADDR_END)
+
+#define MVE_MEM_REGION_FW_INSTANCE4_ADDR_BEGIN (0x04000000u)
+#define MVE_MEM_REGION_FW_INSTANCE4_ADDR_END \
+	(MVE_MEM_REGION_FW_INSTANCE4_ADDR_BEGIN + MVE_MEM_REGION_FW_INSTANCE0_ADDR_END)
+
+#define MVE_MEM_REGION_FW_INSTANCE5_ADDR_BEGIN (0x05000000u)
+#define MVE_MEM_REGION_FW_INSTANCE5_ADDR_END \
+	(MVE_MEM_REGION_FW_INSTANCE5_ADDR_BEGIN + MVE_MEM_REGION_FW_INSTANCE0_ADDR_END)
+
+#define MVE_MEM_REGION_FW_INSTANCE6_ADDR_BEGIN (0x06000000u)
+#define MVE_MEM_REGION_FW_INSTANCE6_ADDR_END \
+	(MVE_MEM_REGION_FW_INSTANCE6_ADDR_BEGIN + MVE_MEM_REGION_FW_INSTANCE0_ADDR_END)
+
+#define MVE_MEM_REGION_FW_INSTANCE7_ADDR_BEGIN (0x07000000u)
+#define MVE_MEM_REGION_FW_INSTANCE7_ADDR_END \
+	(MVE_MEM_REGION_FW_INSTANCE7_ADDR_BEGIN + MVE_MEM_REGION_FW_INSTANCE0_ADDR_END)
+
+/*
+ * Areas for communication between host and MVE are placed in the interval
+ * 0x10079000 - 0x1007FFFF, see special defines further down.
+ */
+
+/*****************************************************************************
+ *
+ * Communication queues between HOST/DRIVER and MVE
+ *
+ ****************************************************************************/
+
+/*
+ * Address for queue for messages in to MVE,
+ * one struct mve_comm_area_host located here
+ */
+#define MVE_COMM_MSG_INQ_ADDR	(0x10079000u)
+
+/*
+ * Address for queue for messages out from MVE,
+ * one struct mve_comm_area_mve located here
+ */
+#define MVE_COMM_MSG_OUTQ_ADDR	(0x1007A000u)
+
+/*
+ * Address for queue for input buffers in to MVE,
+ * one struct mve_comm_area_host located here
+ */
+#define MVE_COMM_BUF_INQ_ADDR	(0x1007B000u)
+
+/*
+ * Address for queue for input buffers returned from MVE,
+ * one struct mve_comm_area_mve located here
+ */
+#define MVE_COMM_BUF_INRQ_ADDR	(0x1007C000u)
+
+/*
+ * Address for queue for output buffers in to MVE,
+ * one struct mve_comm_area_host located here
+ */
+#define MVE_COMM_BUF_OUTQ_ADDR	(0x1007D000u)
+
+/*
+ * Address for queue for output buffers returned from MVE,
+ * one struct mve_comm_area_mve located here
+ */
+#define MVE_COMM_BUF_OUTRQ_ADDR	(0x1007E000u)
+
+/* One struct mve_rpc_communication_area located here */
+#define MVE_COMM_RPC_ADDR	(0x1007F000u)
+
  #define MVE_CHROMA_FORMAT_420 (0x1)
 
 /* format bitfield: */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h
index 471a1f2412a7a..b7883b1ea47f3 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h
@@ -7,6 +7,7 @@
 #define __MALI_VPU_REGISTERS_H__
 
 #include <linux/bits.h>
+#include <linux/io.h>
 
 /*
  * Mali VPU register offsets and bitfield definitions.
@@ -14,6 +15,7 @@
  * Offsets are relative to the VPU MMIO base.
  */
 #define MALI_VPU_REG_VERSION 0x00000
+#define MALI_VPU_REG_NCORES  0x00008
 
 /* Version register fields */
 #define MALI_VPU_VERSION_PRODUCT_ID_MASK GENMASK(31, 16)
@@ -21,4 +23,9 @@
 #define MALI_VPU_VERSION_PATCH_MASK      GENMASK(7, 0)
 #define MALI_VPU_PID_SUFFIX_MASK         GENMASK(15, 12)
 
+static inline u32 mali_vpu_read_reg(void __iomem *regs_base, u32 off)
+{
+	return readl(regs_base + off);
+}
+
 #endif /* __MALI_VPU_REGISTERS_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
index b9a3960bca4c7..c9a2c683b8dab 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
@@ -13,8 +13,10 @@
 #include "mali-vpu-session.h"
 #include "mali-vpu-controls.h"
 #include "mali-vpu-dec.h"
+#include "mali-vpu-firmware.h"
 #include "mali-vpu-firmware-cache.h"
 #include "mali-vpu-formats.h"
+#include "mali-vpu-registers.h"
 #include "mali-vpu-variant.h"
 #include "mali-vpu-vb2.h"
 
@@ -136,6 +138,7 @@ static void mali_vpu_session_release_fw_bin(struct mali_vpu_session *sess)
 	lockdep_assert_held(&sess->vq_lock);
 
 	if (sess->fw_bin_state == MALI_VPU_SESSION_FW_BIN_READY) {
+		mali_vpu_fw_cleanup(&sess->fw);
 		mali_vpu_fw_cache_put(sess->fw_bin);
 		sess->fw_bin = NULL;
 		sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_UNINITIALIZED;
@@ -208,6 +211,8 @@ static void mali_vpu_session_fw_bin_ready(struct mali_vpu_fw_bin *vpu_fw_bin,
 					  bool same_thread)
 {
 	struct mali_vpu_session *sess = arg;
+	u32 ncores;
+	int ret;
 
 	if (!same_thread)
 		mutex_lock(&sess->vq_lock);
@@ -228,6 +233,21 @@ static void mali_vpu_session_fw_bin_ready(struct mali_vpu_fw_bin *vpu_fw_bin,
 
 	sess->fw_bin = vpu_fw_bin;
 
+	/*
+	 * Get total number of cores on VPU element.
+	 * This will be scheduler decision in subsequent patches.
+	 */
+	ncores = mali_vpu_read_reg(sess->vpu_dev->regs_base, MALI_VPU_REG_NCORES);
+
+	ret = mali_vpu_fw_construct(&sess->fw, sess->fw_bin, sess->vpu_dev->dev,
+				    &sess->mmu, ncores);
+	if (ret) {
+		dev_err(sess->vpu_dev->dev,
+			"failed to initialise firmware: %d\n", ret);
+		sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_FAILED;
+		goto err_cache_put;
+	}
+
 	sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_READY;
 
 	goto out_complete;
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
index 0b810d7d6a036..ecd048e3e5c01 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
@@ -13,6 +13,7 @@
 #include <media/v4l2-fh.h>
 
 #include "mali-vpu-device.h"
+#include "mali-vpu-firmware.h"
 #include "mali-vpu-formats.h"
 #include "mali-vpu-mmu.h"
 
@@ -41,8 +42,9 @@ struct mali_vpu_port {
  * loading to complete. READY and LOADING requests are reused.
  *
  * A cache hit may invoke the callback synchronously. An asynchronous callback
- * discards its result if neither port requests streaming. A successfully
- * loaded binary is retained until session cleanup.
+ * discards its result if neither port requests streaming. Successful callbacks
+ * construct the firmware address space before making the binary READY. The
+ * session retains its binary reference until cleanup.
  *
  * Session cleanup waits for an in-flight callback before releasing the
  * session-owned binary reference and callback event. On timeout, it cancels
@@ -71,6 +73,7 @@ enum mali_vpu_session_fw_bin_state {
  * @ctrl_handler: V4L2 control handler bound to this session.
  * @fh: V4L2 file handle for this session.
  * @m2m_ctx: V4L2 mem2mem context for this session.
+ * @fw: Per-session firmware address space object.
  * @fw_bin: Pointer to firmware binary loaded for this session.
  * @fw_event: Firmware binary load event callback structure for this session.
  * @fw_bin_state: Session firmware binary status.
@@ -94,6 +97,7 @@ struct mali_vpu_session {
 	struct v4l2_fh		fh;
 	struct v4l2_m2m_ctx	*m2m_ctx;
 
+	struct mali_vpu_fw			fw;
 	struct mali_vpu_fw_bin			*fw_bin;
 	struct mali_vpu_fw_event		*fw_event;
 	enum mali_vpu_session_fw_bin_state	fw_bin_state;
-- 
2.43.0

