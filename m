Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102737;
	b=iBhar/tnnPmBz00pDFLO6U65lZQPgnnHvF2fgp16hcGD6CBjlfIYd+y78kkXEYuMlAWT
	 KBg2UOzAcZ+8xFjxGrQCenuydM1RFq9rff4RE6TqJBuucSGXTFcpPAFSiQ4OrlzG/ff+i
	 uv+o7BOej6h3tAhjFK9Wv/EtPjAyAe8YDpNiJK3lcJjJigpzlPQD8YyexGAZ9vZqmojC9
	 /RiOZ5uduEic6N0RWe/OluR6JGC/y4BzS5MjkeVjwRrFboANC5XCPMOAZw/0MCuVlZQwQ
	 I/SyHt5ciPGvvq/zvq5sI51SyKq1V+gevTIjIO3kAtrMV1vc2BWsM7zwQh3IZBMVPZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102737;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7D3cGXmB1pSY1ZVD2fE+XwkbJUPare3wS6CynPOirvk=;
	b=rw4CmY8lEyJpJx3wHWByoKt7k51HzUjlZkz6fYGn0MBdfEdpD950NtpvzcHOoaZBv9Bd
	 53NALQ3fR5J5ZbZvQ69YA02G+Lugr4b50Ah6rlUCwXkdTWUNdOxX1So/148aVsLXK6KU8
	 /qnGtaqjS3nt6Z+bPFZaPrP9AqnBbc9xe3NGzDTviU8ymjuINHgCveF8Dh0KLb4kZRg5C
	 wHfq/eWEfB5u/v+dQAgX2fKTWA7XkrpMyQZPIR449ScP0z8h7XZabaRJdrjRMS6vSh2UO
	 Y5GbETQe9s/tlaHC3liDP2FgC8EWv9miLYrCEBkJLmEhHZVN0KFN88QqpcN/1EZKQ1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DWLFRbS8;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE59E606A338;
	Thu, 19 Nov 2026 15:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE59E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DWLFRbS8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93F931C14;
	Thu, 19 Nov 2026 07:38:51 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07F703F882;
	Thu, 19 Nov 2026 07:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102734; bh=AdoWEufl1RBdZGd/5S1A8wS8TpcNvSmgfvjMObbtFkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DWLFRbS8tErmklJVUiI78Lp14VdUhdB9E8LGiGFX5mLJlDa03sZceKiRDZUKn7V+F
	 DGGD1whInBeMTHPQq6hqRgM/8xkOJ9KcTVye/9Y4AIX4vSQ+gJxra1io0FvfDyUoSf
	 ENqC7+byxJoPMSCZ238WGnboLnfFrMTn2CuIG2rs=
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
Subject: [RFC PATCH 15/28] media: mali-vpu: handle firmware RPC requests
Date: Thu, 19 Nov 2026 15:37:45 +0000
Message-ID: <20261119153758.1426673-16-charvi.mehta@arm.com>
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

Handle firmware requests for debug output and memory allocation,
resizing and release. Track allocations by firmware virtual address
and release outstanding allocations during firmware teardown.

Flag resize and free requests so the caller can invalidate cached
firmware MMU translations before resuming execution.

Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 .../platform/arm/mali-vpu/mali-vpu-firmware.c | 277 ++++++++++++++++++
 .../platform/arm/mali-vpu/mali-vpu-firmware.h |  12 +
 .../arm/mali-vpu/mali-vpu-protocol-def-v3.h   |  53 ++++
 3 files changed, 342 insertions(+)

diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
index 91a989c098cbc..c11d5c6c0ec5f 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
@@ -7,6 +7,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/sizes.h>
 #include <linux/string.h>
 
 #include "mali-vpu-firmware.h"
@@ -15,6 +16,7 @@
 #include "mali-vpu-protocol-def-v3.h"
 
 #define MALI_VPU_FW_MAX_CORES 8
+#define MALI_VPU_RPC_VA_GRANULE SZ_16M
 
 static int mali_vpu_fw_get_region(enum mali_vpu_fw_region region,
 				  mali_vpu_mmu_va *begin, mali_vpu_mmu_va *end)
@@ -80,6 +82,14 @@ static int mali_vpu_fw_get_region(enum mali_vpu_fw_region region,
 		*begin = MVE_MEM_REGION_FW_INSTANCE7_ADDR_BEGIN;
 		*end = MVE_MEM_REGION_FW_INSTANCE7_ADDR_END;
 		break;
+	case MALI_VPU_FW_REGION_PROTECTED:
+		*begin = MVE_MEM_REGION_PROTECTED_ADDR_BEGIN;
+		*end = MVE_MEM_REGION_PROTECTED_ADDR_END;
+		break;
+	case MALI_VPU_FW_REGION_FRAMEBUF:
+		*begin = MVE_MEM_REGION_FRAMEBUF_ADDR_BEGIN;
+		*end = MVE_MEM_REGION_FRAMEBUF_ADDR_END;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -352,6 +362,7 @@ int mali_vpu_fw_construct(struct mali_vpu_fw *fw, const struct mali_vpu_fw_bin *
 	fw->dev = dev;
 	fw->mmu = mmu;
 	fw->ncores = ncores;
+	hash_init(fw->rpc_mem);
 
 	/* Initialise firmware core and protocol regions */
 	ret = mali_vpu_fw_map_core_regions(fw, fw_bin);
@@ -375,11 +386,21 @@ int mali_vpu_fw_construct(struct mali_vpu_fw *fw, const struct mali_vpu_fw_bin *
 
 void mali_vpu_fw_cleanup(struct mali_vpu_fw *fw)
 {
+	struct mali_vpu_mmu_pages *pages;
+	struct hlist_node *tmp;
+	unsigned int bkt;
+
 	if (!fw)
 		return;
 
 	mali_vpu_fw_unmap_protocol(fw);
 	mali_vpu_fw_unmap_core_regions(fw);
+
+	hash_for_each_safe(fw->rpc_mem, bkt, tmp, pages, node) {
+		hash_del(&pages->node);
+		mali_vpu_mmu_free_pages(pages);
+	}
+
 	memset(fw, 0, sizeof(*fw));
 }
 
@@ -908,3 +929,259 @@ int mali_vpu_fw_parse_msg(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *msg)
 
 	return ret;
 }
+
+static void mali_vpu_fw_dbg_rpc(struct mali_vpu_fw *fw, const char *direction,
+				const struct mve_rpc_communication_area *rpc)
+{
+	dev_dbg(fw->dev, "rpc %s: state=%u call_id=%u size=%u\n",
+		direction, rpc->state, rpc->call_id, rpc->size);
+}
+
+static struct mali_vpu_mmu_pages *mali_vpu_find_pages(struct mali_vpu_fw *fw,
+						      mali_vpu_mmu_va va)
+{
+	struct mali_vpu_mmu_pages *pages;
+
+	hash_for_each_possible(fw->rpc_mem, pages, node, va) {
+		if (pages->va == va)
+			return pages;
+	}
+
+	return NULL;
+}
+
+static void mali_vpu_rpc_mem_resize(struct mali_vpu_fw *fw,
+				    struct mve_rpc_communication_area *rpc_area)
+{
+	union mve_rpc_params *p = &rpc_area->params;
+	struct mali_vpu_mmu_pages *pages;
+	mali_vpu_mmu_va va = 0;
+	int ret;
+
+	pages = mali_vpu_find_pages(fw, p->mem_resize.ve_pointer);
+	if (pages) {
+		size_t npages;
+
+		/* Resize the allocated pages. */
+		npages = DIV_ROUND_UP(p->mem_resize.new_size, MALI_VPU_PAGE_SIZE);
+		ret = mali_vpu_mmu_resize_pages(pages, npages);
+		if (ret) {
+			dev_warn(fw->dev,
+				 "failed to resize RPC mapped pages. ret=%d\n",
+				 ret);
+			goto err;
+		}
+
+		va = pages->va;
+	} else {
+		dev_warn(fw->dev, "could not find pages for RPC resize. va=0x%x\n",
+			 p->mem_resize.ve_pointer);
+	}
+
+	dev_dbg(fw->dev, "RPC resize memory. va=0x%x, new_size=%u\n",
+		p->mem_resize.ve_pointer, p->mem_resize.new_size);
+
+err:
+	/*
+	 * The memory RPC ABI returns the resulting firmware VA. Firmware treats
+	 * a zero VA as allocation failure and reports MVE_ERROR_OUT_OF_MEMORY.
+	 * The RPC itself was still handled successfully.
+	 */
+	rpc_area->size = sizeof(u32);
+	p->data[0] = va;
+}
+
+static void mali_vpu_rpc_mem_alloc(struct mali_vpu_fw *fw,
+				   struct mve_rpc_communication_area *rpc_area)
+{
+	union mve_rpc_params *p = &rpc_area->params;
+	enum mali_vpu_fw_region region;
+	struct mali_vpu_mmu_pages *pages;
+	size_t npages, max_pages;
+	mali_vpu_mmu_va end, begin = 0;
+	int ret;
+
+	if (!p->mem_alloc.size ||
+	    p->mem_alloc.size > p->mem_alloc.max_size) {
+		dev_warn(fw->dev,
+			 "invalid RPC allocation:size=%u max_size=%u alignment=%u\n",
+			 p->mem_alloc.size, p->mem_alloc.max_size,
+			 p->mem_alloc.log2_alignment);
+		goto err;
+	}
+
+	switch (p->mem_alloc.region) {
+	case MVE_MEM_REGION_PROTECTED:
+		region = MALI_VPU_FW_REGION_PROTECTED;
+		break;
+	case MVE_MEM_REGION_OUTBUF:
+		region = MALI_VPU_FW_REGION_FRAMEBUF;
+		break;
+	default:
+		dev_err(fw->dev,
+			"unsupported RPC mem alloc region. region=%u\n",
+			p->mem_alloc.region);
+		goto err;
+	}
+
+	ret = mali_vpu_fw_get_region(region, &begin, &end);
+	if (ret)
+		goto err;
+
+	npages = DIV_ROUND_UP(p->mem_alloc.size, MALI_VPU_PAGE_SIZE);
+	max_pages = DIV_ROUND_UP(p->mem_alloc.max_size, MALI_VPU_PAGE_SIZE);
+
+	pages = mali_vpu_mmu_alloc_pages(fw->dev, npages, max_pages);
+	if (IS_ERR(pages)) {
+		begin = 0;
+		goto err;
+	}
+
+	ret = -EINVAL;
+	while (begin < end) {
+		ret = mali_vpu_mmu_map_pages(fw->mmu, begin, pages,
+					     MALI_VPU_ATTR_SHARED_RW,
+					     MALI_VPU_ACCESS_READ_WRITE);
+		if (!ret)
+			break;
+
+		begin += MALI_VPU_RPC_VA_GRANULE;
+	}
+
+	if (ret) {
+		dev_err(fw->dev,
+			"failed to find memory region for RPC alloc.\n");
+		mali_vpu_mmu_free_pages(pages);
+		begin = 0;
+		goto err;
+	}
+
+	hash_add(fw->rpc_mem, &pages->node, pages->va);
+	begin = pages->va;
+
+	dev_dbg(fw->dev,
+		"RPC alloc memory. size=%u, max_size=%u, region=%u, npages=%zu, begin=0x%x\n",
+		p->mem_alloc.size, p->mem_alloc.max_size, p->mem_alloc.region, npages, begin);
+
+err:
+	rpc_area->size = sizeof(u32);
+	p->data[0] = begin;
+}
+
+static void mali_vpu_rpc_mem_free(struct mali_vpu_fw *fw,
+				  struct mve_rpc_communication_area *rpc_area)
+{
+	union mve_rpc_params *p = &rpc_area->params;
+	struct mali_vpu_mmu_pages *pages;
+
+	pages = mali_vpu_find_pages(fw, p->mem_free.ve_pointer);
+	if (pages) {
+		hash_del(&pages->node);
+		mali_vpu_mmu_free_pages(pages);
+	} else {
+		dev_warn(fw->dev,
+			 "could not find pages for RPC free. va=0x%x\n",
+			 p->mem_free.ve_pointer);
+	}
+
+	dev_dbg(fw->dev, "RPC free memory. va=0x%x\n", p->mem_free.ve_pointer);
+
+	rpc_area->size = 0;
+}
+
+int mali_vpu_fw_handle_rpc(struct mali_vpu_fw *fw, bool *flush_mmu)
+{
+	struct mve_rpc_communication_area *rpc_area = fw->rpc.cpu;
+	int ret = 0;
+
+	if (flush_mmu)
+		*flush_mmu = false;
+
+	dma_sync_single_for_cpu(fw->dev, fw->rpc.dma, sizeof(*rpc_area),
+				DMA_FROM_DEVICE);
+
+	if (READ_ONCE(rpc_area->state) == MVE_RPC_STATE_PARAM) {
+		/*
+		 * Firmware publishes param only after writing the RPC request.
+		 */
+		dma_rmb();
+
+		ret = 1;
+
+		mali_vpu_fw_dbg_rpc(fw, "fw->host", rpc_area);
+
+		switch (rpc_area->call_id) {
+		case MVE_RPC_FUNCTION_DEBUG_PRINTF: {
+			if (!rpc_area->size ||
+			    rpc_area->size > sizeof(rpc_area->params.debug_print.string)) {
+				ret = -EPROTO;
+				rpc_area->size = 0;
+				break;
+			}
+
+			const char *s = rpc_area->params.debug_print.string;
+			size_t len = strnlen(s, rpc_area->size);
+
+			/* Strip trailing characters */
+			while (len && (s[len - 1] == '\n' || s[len - 1] == '\r'))
+				len--;
+
+			dev_info(fw->dev,
+				 "firmware DEBUG Print: %.*s\n", (int)len, s);
+			break;
+		}
+		case MVE_RPC_FUNCTION_MEM_ALLOC: {
+			if (rpc_area->size != sizeof(rpc_area->params.mem_alloc)) {
+				ret = -EPROTO;
+				break;
+			}
+
+			mali_vpu_rpc_mem_alloc(fw, rpc_area);
+			break;
+		}
+		case MVE_RPC_FUNCTION_MEM_RESIZE: {
+			if (rpc_area->size != sizeof(rpc_area->params.mem_resize)) {
+				ret = -EPROTO;
+				break;
+			}
+
+			mali_vpu_rpc_mem_resize(fw, rpc_area);
+			if (flush_mmu)
+				*flush_mmu = true;
+			break;
+		}
+		case MVE_RPC_FUNCTION_MEM_FREE: {
+			if (rpc_area->size != sizeof(rpc_area->params.mem_free)) {
+				ret = -EPROTO;
+				break;
+			}
+
+			mali_vpu_rpc_mem_free(fw, rpc_area);
+			if (flush_mmu)
+				*flush_mmu = true;
+			break;
+		}
+		default:
+			dev_warn_ratelimited(fw->dev,
+					     "unsupported RPC request. call_id=%u\n",
+					     rpc_area->call_id);
+			ret = -EOPNOTSUPP;
+			break;
+		}
+
+		/*
+		 * Make sure the whole RPC message body has been written before
+		 * the RPC message area is returned to the firmware.
+		 */
+		dma_wmb();
+		WRITE_ONCE(rpc_area->state, MVE_RPC_STATE_RETURN);
+
+		dma_sync_single_for_device(fw->dev, fw->rpc.dma,
+					   sizeof(*rpc_area), DMA_TO_DEVICE);
+
+		/* Log RPC response. */
+		mali_vpu_fw_dbg_rpc(fw, "host->fw", rpc_area);
+	}
+
+	return ret;
+}
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
index e5dd67ce3397a..c03a07d994873 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
@@ -6,9 +6,11 @@
 #ifndef __MALI_VPU_FIRMWARE_H__
 #define __MALI_VPU_FIRMWARE_H__
 
+#include <linux/hashtable.h>
 #include <linux/media/arm/mali-vpu-config.h>
 #include <linux/types.h>
 
+#define MALI_VPU_FW_HTABLE_BITS 3
 #define MALI_VPU_FW_TEXT_BASE_ADDR 0x1000u
 
 struct device;
@@ -156,6 +158,8 @@ struct mali_vpu_fw_msg {
  * @MALI_VPU_FW_REGION_CORE_5: Firmware instance region for core 5.
  * @MALI_VPU_FW_REGION_CORE_6: Firmware instance region for core 6.
  * @MALI_VPU_FW_REGION_CORE_7: Firmware instance region for core 7.
+ * @MALI_VPU_FW_REGION_PROTECTED: Protected firmware memory region.
+ * @MALI_VPU_FW_REGION_FRAMEBUF: Frame-buffer memory region.
  */
 enum mali_vpu_fw_region {
 	MALI_VPU_FW_REGION_MSG_HOST,
@@ -175,6 +179,9 @@ enum mali_vpu_fw_region {
 	MALI_VPU_FW_REGION_CORE_5,
 	MALI_VPU_FW_REGION_CORE_6,
 	MALI_VPU_FW_REGION_CORE_7,
+
+	MALI_VPU_FW_REGION_PROTECTED,
+	MALI_VPU_FW_REGION_FRAMEBUF,
 };
 
 /**
@@ -207,6 +214,8 @@ struct mali_vpu_fw_proto_page {
  * @shared_bss_pages: Shared BSS pages mapped into every core instance.
  * @ncores: Number of firmware core-instance regions constructed.
  * @pending_response_count: Number of requests awaiting a firmware response.
+ * @rpc_mem: Keeps track of RPC allocated memory. Maps MVE virtual address to
+ *		'struct mali_vpu_mmu_pages' object.
  */
 struct mali_vpu_fw {
 	struct device *dev;
@@ -225,6 +234,8 @@ struct mali_vpu_fw {
 	struct mali_vpu_mmu_pages *shared_bss_pages;
 	u32 ncores;
 	u32 pending_response_count;
+
+	DECLARE_HASHTABLE(rpc_mem, MALI_VPU_FW_HTABLE_BITS);
 };
 
 int mali_vpu_fw_construct(struct mali_vpu_fw *fw, const struct mali_vpu_fw_bin *fw_bin,
@@ -235,5 +246,6 @@ int mali_vpu_fw_send_ping(struct mali_vpu_fw *fw);
 int mali_vpu_fw_send_state_change(struct mali_vpu_fw *fw, enum mali_vpu_fw_state state);
 int mali_vpu_fw_send_set_option(struct mali_vpu_fw *fw, struct mali_vpu_fw_set_option *option);
 int mali_vpu_fw_parse_msg(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *msg);
+int mali_vpu_fw_handle_rpc(struct mali_vpu_fw *fw, bool *flush_mmu);
 
 #endif /* __MALI_VPU_FIRMWARE_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
index c7c18bd4e1551..8a81ed1fd730a 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
@@ -77,6 +77,16 @@
  * 0x10079000 - 0x1007FFFF, see special defines further down.
  */
 
+/* PROTECTED virtual memory region */
+#define MVE_MEM_REGION_PROTECTED_ADDR_BEGIN	(0x20000000u)
+#define MVE_MEM_REGION_PROTECTED_ADDR_END	(0x6FFFFFFFu + 1)
+
+/* FRAMEBUF virtual memory region */
+#define MVE_MEM_REGION_FRAMEBUF_ADDR_BEGIN	(0x70000000u)
+#define MVE_MEM_REGION_FRAMEBUF_ADDR_END	(0xEFFFFFFFu + 1)
+
+/* 0xF0000000 - 0xFFFFFFFF is used internally in MVE */
+
 /*****************************************************************************
  *
  * Communication queues between HOST/DRIVER and MVE
@@ -153,6 +163,49 @@ struct mve_comm_area_mve {
 	u32 out_data[MVE_COMM_QUEUE_SIZE_IN_WORDS];
 };
 
+#define MVE_RPC_AREA_SIZE_IN_WORDS 256
+#define MVE_RPC_DATA_SIZE_IN_WORDS (MVE_RPC_AREA_SIZE_IN_WORDS - 3)
+union mve_rpc_params {
+	u32 data[MVE_RPC_DATA_SIZE_IN_WORDS];
+	struct {
+		char string[MVE_RPC_DATA_SIZE_IN_WORDS * 4];
+	} debug_print;
+	struct {
+		u32 size;
+		u32 max_size;
+		u8 region; /* Memory region selection */
+			#define MVE_MEM_REGION_PROTECTED (0)
+			#define MVE_MEM_REGION_OUTBUF    (1)
+			#define MVE_MEM_REGION_FRAMEBUF  (MVE_MEM_REGION_OUTBUF)
+
+		/* The newly allocated memory must be placed
+		 * on (at least) a 2^(log2_alignment) boundary
+		 */
+		u8 log2_alignment;
+	} mem_alloc;
+	struct {
+		u32 ve_pointer;
+		u32 new_size;
+	} mem_resize;
+	struct {
+		u32 ve_pointer;
+	} mem_free;
+};
+
+struct mve_rpc_communication_area {
+	u32 state;
+		#define MVE_RPC_STATE_FREE   (0)
+		#define MVE_RPC_STATE_PARAM  (1)
+		#define MVE_RPC_STATE_RETURN (2)
+	u32 call_id;
+		#define MVE_RPC_FUNCTION_DEBUG_PRINTF (1)
+		#define MVE_RPC_FUNCTION_MEM_ALLOC    (2)
+		#define MVE_RPC_FUNCTION_MEM_RESIZE   (3)
+		#define MVE_RPC_FUNCTION_MEM_FREE     (4)
+	u32 size;
+	union mve_rpc_params params;
+};
+
 /*********************************************************************
  *
  *   Message codes
-- 
2.43.0

