Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102725;
	b=Er/wF9JgF+h5C2MhkZ00YK2OxdHsKhdQTwgpMLET/DHDItuErSgvVCg6/Jq5CR3y8egK
	 1RpqmkvPlLiTb6k//SJ1ArwTjlTcSN+9Hf4KfWidWzWNpqHzocdLpsUbn3Fg+MTAlfxWV
	 sBi0LGt2B8/969ME/r0Cs0w0ym/5AYSPBkZWy2buRJxOF5rX13gtxFTqseEN51UX8HQwN
	 76WrdR/YKVkIJwRRaYQQUQgIt/pOWv/iVEDEsTQNGLqWcltGTt+iaIUtffKU6qdvjE/IB
	 eQNRca1o2lBq8ysRq1M68dzIMs92CJMomVSe0KEds693/Qzvl+J12d5CVZ9xTqijF5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102725;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OlKDKmeR9d98EjY1ecIZTbuzGIuRbcE3mZD2T0S75fU=;
	b=TJpQxhznViRl07NizwIQfr4Y6ibVxA0UWh6wlEAbJLqJWUO6FBNjbtpvF37ZUISKbJ4v
	 qB6i1nMJhdOdoyWfI53VB8vuo/jTxcJvauRtfP9d0jRyay7H3DHQ9wBH/dldX219kaG7t
	 ES9k06e3lGPOuI/RDjzY7uDSGGUczhGQ8MSXhR9/3DqAPM9MGTQq1ch8Hre1MWoPDYC9F
	 y4HtXk019trU5O94q9g6fh6+qoZdSvid7+PoXy+/CZ//y3U3NSAvj6hsWPJhXqttO9YEZ
	 XP/gBG5OMrnjhD4F1R74A/xY5cr1krbTxyjTCG8yujGIY5YdxjS/rFg3f1e+mZqC4KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mYKuvnjm;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378ED60A3823;
	Thu, 19 Nov 2026 15:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 378ED60A3823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mYKuvnjm
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD8BD1C14;
	Thu, 19 Nov 2026 07:38:40 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 429A73F882;
	Thu, 19 Nov 2026 07:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102723; bh=FZn7uEBLWQ9nWEbKhN05i8KMdVZGq9XMtSezx2Ll29I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mYKuvnjmKqhfvcu6qgfQAlVitk603JBtMViyl8YedEHslZ/j44P7Z3xffiYb/v+ow
	 eDedxDww9a79VbASVA+wFBRuyuQIPjKSo4AFena27a/HFjUqIXudXnBexb86OZE4lJ
	 +C0ZqeJb6t/HSLgCnVv5YmgIdK66yfexCbWKl8ns=
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
Subject: [RFC PATCH 09/28] media: mali-vpu: add MMU software page table manager
Date: Thu, 19 Nov 2026 15:37:39 +0000
Message-ID: <20261119153758.1426673-10-charvi.mehta@arm.com>
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

From: Rath Sankaralingam <rath.sankaralingam@arm.com>

Add Mali VPU internal MMU page table manager for managing
firmware-visible virtual address space.  The MMU code builds and
maintains the VPU two-level page tables, allocating backing pages and maps
scatter-gather and dma-buf backed memory.  It also exposes helpers for
mapping, unmapping, resizing, synchronizing and writing into mapped
regions.

The page table entries describe the addresses consumed by the VPU
peripheral MMU, allowing firmware communication queues and video buffers
to be mapped into the VPU virtual address layout with the required bus
attributes and access permissions.

This also configures the V76 DMA mask for its 40-bit addressing
capability and sets the maximum DMA segment size used by DMA-backed
buffers.

Signed-off-by: Rath Sankaralingam <rath.sankaralingam@arm.com>
---
 drivers/media/platform/arm/mali-vpu/Makefile  |   3 +-
 .../platform/arm/mali-vpu/mali-vpu-device.h   |   2 +
 .../platform/arm/mali-vpu/mali-vpu-mmu.c      | 693 ++++++++++++++++++
 .../platform/arm/mali-vpu/mali-vpu-mmu.h      | 152 ++++
 .../platform/arm/mali-vpu/mali-vpu-probe.c    |   8 +
 .../platform/arm/mali-vpu/mali-vpu-session.c  |  10 +
 .../platform/arm/mali-vpu/mali-vpu-session.h  |   3 +
 .../arm/mali-vpu/mali-vpu-variant-v76.c       |   1 +
 .../platform/arm/mali-vpu/mali-vpu-variant.h  |   2 +
 9 files changed, 873 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.h

diff --git a/drivers/media/platform/arm/mali-vpu/Makefile b/drivers/media/platform/arm/mali-vpu/Makefile
index 95bad821eb466..0716a2b0c8712 100644
--- a/drivers/media/platform/arm/mali-vpu/Makefile
+++ b/drivers/media/platform/arm/mali-vpu/Makefile
@@ -8,6 +8,7 @@ mali-vpu-objs := mali-vpu-probe.o \
 		mali-vpu-buffer.o \
 		mali-vpu-vb2.o \
 		mali-vpu-formats.o \
-		mali-vpu-controls.o
+		mali-vpu-controls.o \
+		mali-vpu-mmu.o
 
 obj-$(CONFIG_VIDEO_MALI_VPU) += mali-vpu.o
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
index 26b2bf9e1588e..20361df05bdcd 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
@@ -32,6 +32,7 @@ enum mali_vpu_session_role {
  * @clk_count: Number of clocks in @clk_list.
  * @rst_list: List of reset controls.
  * @rst_count: Number of reset controls in @rst_list.
+ * @dma_mask: DMA mask for the device, indicating supported address width.
  * @irq: IRQ number for VPU.
  * @variant: Structure describing variant-specific features and capabilities.
  * @v4l2_dev: V4L2 device structure for mali vpu.
@@ -45,6 +46,7 @@ struct mali_vpu_dev {
 	unsigned int			clk_count;
 	struct reset_control_bulk_data	*rst_list;
 	unsigned int			rst_count;
+	u64				dma_mask;
 	int				irq;
 
 	const struct mali_vpu_variant	*variant;
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.c
new file mode 100644
index 0000000000000..00cf5251eff5e
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.c
@@ -0,0 +1,693 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#include <linux/build_bug.h>
+#include <linux/dma-mapping.h>
+#include <linux/gfp.h>
+#include <linux/slab.h>
+
+#include "mali-vpu-mmu.h"
+
+/* Number of bits for the VPU physical (DMA) address space. */
+#define MALI_VPU_PA_BITS		40
+#define MALI_VPU_PA_MASK		GENMASK_ULL(MALI_VPU_PA_BITS - 1, 0)
+
+/* Number of bits for the virtual address space. */
+#define MALI_VPU_VA_BITS		32
+#define MALI_VPU_VA_MASK		GENMASK(MALI_VPU_VA_BITS - 1, 0)
+
+/* Number of bits from the VA used to index a PTE in a page. */
+#define MALI_VPU_INDEX_SHIFT		10
+#define MALI_VPU_INDEX_SIZE		BIT(MALI_VPU_INDEX_SHIFT)
+#define MALI_VPU_INDEX_MASK		GENMASK(MALI_VPU_INDEX_SHIFT - 1, 0)
+
+/* Access permission defines. */
+#define MALI_VPU_PTE_AP_SHIFT		0
+#define MALI_VPU_PTE_AP_BITS		2
+#define MALI_VPU_PTE_AP_MASK		((1 << MALI_VPU_PTE_AP_BITS) - 1)
+
+/* PTE shift defines. */
+#define MALI_VPU_PTE_PHYSADDR_SHIFT	2
+#define MALI_VPU_PTE_ATTR_SHIFT		30
+
+/* Number of levels for Page Table Walk. */
+#define MALI_VPU_PTW_LEVELS		2
+
+/*
+ * A Linux physical page can be equal in size or larger than the MVE page size.
+ * This define calculates how many MVE pages fit in one Linux page.
+ */
+#define MALI_VPU_PAGES_PER_LINUX_PAGE	(PAGE_SIZE / MALI_VPU_PAGE_SIZE)
+
+/*
+ * If the Linux PAGE_SIZE were ever smaller than MALI_VPU_PAGE_SIZE, the define
+ * above would evaluate to 0 and break the page accounting. This static_assert enforces
+ * this invariant at build time.
+ */
+static_assert(MALI_VPU_PAGES_PER_LINUX_PAGE > 0,
+	      "PAGE_SIZE must be >= MALI_VPU_PAGE_SIZE");
+
+/*
+ * Return the PTE index for a given level (L1=0, L2=1).
+ *                   22                  12                       0
+ * +-------------------+-------------------+-----------------------+
+ * |      Level 1      |      Level 2      |      Page offset      |
+ * +-------------------+-------------------+-----------------------+
+ */
+static unsigned int mali_vpu_get_index(const mali_vpu_mmu_va va, const unsigned int level)
+{
+	return (va >> (MALI_VPU_PAGE_SHIFT + (MALI_VPU_PTW_LEVELS - level - 1) *
+			MALI_VPU_INDEX_SHIFT)) & MALI_VPU_INDEX_MASK;
+}
+
+static mali_vpu_mmu_pte mali_vpu_mmu_set_pte(enum mali_vpu_mmu_attr attr,
+					     dma_addr_t dma,
+					     enum mali_vpu_mmu_access access)
+{
+	return (attr << MALI_VPU_PTE_ATTR_SHIFT) |
+		((dma >> MALI_VPU_PAGE_SHIFT) << MALI_VPU_PTE_PHYSADDR_SHIFT) |
+		(access << MALI_VPU_PTE_AP_SHIFT);
+}
+
+static mali_vpu_mmu_pte *mali_vpu_page_table_walk(struct mali_vpu_mmu *mmu, mali_vpu_mmu_va va,
+						  bool alloc)
+{
+	struct mali_vpu_mmu_pt_page *l2;
+	mali_vpu_mmu_pte *pte = mmu->root.cpu;
+	unsigned int index;
+
+	/* Level 1. */
+	index = mali_vpu_get_index(va, 0);
+	l2 = &mmu->l2_tables[index];
+
+	/* Map in L2 page if it is missing. */
+	if (!l2->linux_page) {
+		if (!alloc) {
+			dev_err(mmu->dev, "missing L2 page in PTW. va=0x%x", va);
+			return ERR_PTR(-EFAULT);
+		}
+
+		l2->dma = mali_vpu_mmu_alloc_page(mmu->dev, &l2->linux_page, DMA_TO_DEVICE);
+		if (!l2->linux_page) {
+			dev_err(mmu->dev, "failed to allocate L2 page. va=0x%x", va);
+			return ERR_PTR(-ENOMEM);
+		}
+
+		l2->cpu = page_address(l2->linux_page);
+
+		pte[index] = mali_vpu_mmu_set_pte(MALI_VPU_ATTR_PRIVATE, l2->dma,
+						  MALI_VPU_ACCESS_READ_ONLY);
+		dma_sync_single_for_device(mmu->dev, mmu->root.dma + index * sizeof(*pte),
+					   sizeof(*pte), DMA_TO_DEVICE);
+	}
+
+	/* Level 2. */
+	index = mali_vpu_get_index(va, 1);
+
+	/* The caller must sync the entry for the device after modifying it. */
+	return &l2->cpu[index];
+}
+
+static int mali_vpu_map_page(struct mali_vpu_mmu *mmu,
+			     mali_vpu_mmu_va va,
+			     dma_addr_t dma,
+			     enum mali_vpu_mmu_attr attr,
+			     enum mali_vpu_mmu_access access)
+{
+	struct mali_vpu_mmu_pt_page *l2;
+	mali_vpu_mmu_pte *pte;
+
+	/* Check that both VA and DMA address are page aligned. */
+	if ((va | dma) & MALI_VPU_PAGE_MASK) {
+		dev_err(mmu->dev, "VA and DMA address must be page aligned. va=0x%x, dma=%pad",
+			va, &dma);
+		return -EFAULT;
+	}
+
+	/* Check that VA is within valid address range. */
+	if (va & ~MALI_VPU_VA_MASK) {
+		dev_err(mmu->dev, "VA out of valid range. va=0x%x", va);
+		return -EFAULT;
+	}
+
+	/* Check that the DMA address is within valid address range. */
+	if (dma & ~MALI_VPU_PA_MASK) {
+		dev_err(mmu->dev, "DMA address out of valid range. dma=%pad", &dma);
+		return -EFAULT;
+	}
+
+	pte = mali_vpu_page_table_walk(mmu, va, true);
+	if (IS_ERR(pte))
+		return PTR_ERR(pte);
+
+	/* Return error if the entry is already mapped or reserved. */
+	if (*pte)
+		return -EAGAIN;
+
+	/* Map in DMA address and flush data. */
+	*pte = mali_vpu_mmu_set_pte(attr, dma, access);
+	l2 = &mmu->l2_tables[mali_vpu_get_index(va, 0)];
+	dma_sync_single_for_device(mmu->dev,
+				   l2->dma + mali_vpu_get_index(va, 1) * sizeof(*pte),
+				   sizeof(*pte), DMA_TO_DEVICE);
+
+	return 0;
+}
+
+static void mali_vpu_unmap_page(struct mali_vpu_mmu *mmu, mali_vpu_mmu_va va)
+{
+	struct mali_vpu_mmu_pt_page *l2;
+	mali_vpu_mmu_pte *pte;
+
+	pte = mali_vpu_page_table_walk(mmu, va, false);
+	if (IS_ERR(pte))
+		return;
+
+	/* Unmap virtual address and flush data. */
+	*pte = 0;
+	l2 = &mmu->l2_tables[mali_vpu_get_index(va, 0)];
+	dma_sync_single_for_device(mmu->dev,
+				   l2->dma + mali_vpu_get_index(va, 1) * sizeof(*pte),
+				   sizeof(*pte), DMA_TO_DEVICE);
+}
+
+static int mali_vpu_remap_page(struct mali_vpu_mmu *mmu,
+			       mali_vpu_mmu_va va,
+			       dma_addr_t dma,
+			       enum mali_vpu_mmu_attr attr,
+			       enum mali_vpu_mmu_access access)
+{
+	mali_vpu_unmap_page(mmu, va);
+	return mali_vpu_map_page(mmu, va, dma, attr, access);
+}
+
+static int mali_vpu_remap_pages(struct mali_vpu_mmu_pages *pages, size_t oldcount,
+				size_t newcount)
+{
+	int ret;
+
+	if (!pages->mmu)
+		return 0;
+
+	/* Remap pages to no access if new count is smaller than old count. */
+	while (newcount < oldcount) {
+		oldcount--;
+
+		ret = mali_vpu_remap_page(pages->mmu,
+					  pages->va + oldcount * MALI_VPU_PAGE_SIZE,
+					  MALI_VPU_PAGE_SIZE, MALI_VPU_ATTR_PRIVATE,
+					  MALI_VPU_ACCESS_NO);
+		if (ret)
+			return ret;
+	}
+
+	/* Map up pages if new count is larger than old count. */
+	while (newcount > oldcount) {
+		ret = mali_vpu_remap_page(pages->mmu,
+					  pages->va + oldcount * MALI_VPU_PAGE_SIZE,
+					  pages->pages[oldcount].dma, pages->attr,
+					  pages->access);
+		if (ret)
+			return ret;
+
+		oldcount++;
+	}
+
+	return 0;
+}
+
+static int mali_vpu_mapped_count(const mali_vpu_mmu_pte *l2)
+{
+	int count = 0;
+	unsigned int j;
+
+	for (j = 0; j < MALI_VPU_INDEX_SIZE; j++) {
+		/* Do not count pages with AP as MALI_VPU_ACCESS_NO */
+		if (l2[j] & MALI_VPU_PTE_AP_MASK)
+			count++;
+	}
+
+	return count;
+}
+
+static size_t mali_vpu_get_sg_table_npages(struct sg_table *sgt)
+{
+	struct sg_dma_page_iter piter;
+	size_t count = 0;
+
+	for_each_sg_dma_page(sgt->sgl, &piter, sgt->nents, 0) {
+		count++;
+	}
+
+	return count;
+}
+
+static int mali_vpu_append_sg_table(struct mali_vpu_mmu_pages *pages, struct sg_table *sgt)
+{
+	size_t count;
+	struct sg_dma_page_iter piter;
+
+	/*
+	 * SG import must describe complete Linux pages. VB2 DMA-SG MMAP buffers
+	 * are allocated as whole pages with zero offset. DMA-BUF attachment
+	 * mappings guarantee PAGE_SIZE-aligned DMA addresses and lengths.
+	 * USERPTR is disabled on both queues because it can supply partial pages.
+	 *
+	 * Each Linux page is split into MALI_VPU_PAGES_PER_LINUX_PAGE VPU pages.
+	 * Do not round DMA addresses down: the supplied mapping must already
+	 * cover every page inserted into the VPU page tables.
+	 */
+
+	count = mali_vpu_get_sg_table_npages(sgt) * MALI_VPU_PAGES_PER_LINUX_PAGE;
+
+	if ((pages->count + count) > pages->capacity) {
+		dev_err(pages->dev,
+			"pages capacity too small to append sgt. count=%zu, capacity=%zu, append=%zu",
+			pages->count, pages->capacity, count);
+		return -ENOMEM;
+	}
+
+	for_each_sg_dma_page(sgt->sgl, &piter, sgt->nents, 0) {
+		unsigned int j;
+		dma_addr_t base;
+
+		base = sg_page_iter_dma_address(&piter);
+
+		for (j = 0; j < MALI_VPU_PAGES_PER_LINUX_PAGE; ++j)
+			pages->pages[pages->count++].dma =
+				base + j * MALI_VPU_PAGE_SIZE;
+	}
+
+	return 0;
+}
+
+int mali_vpu_mmu_init(struct mali_vpu_mmu *mmu, struct device *dev)
+{
+	struct page *page;
+	dma_addr_t dma;
+
+	mmu->dev = dev;
+
+	/* Allocate Page Table Base (the L1 table). */
+	dma = mali_vpu_mmu_alloc_page(dev, &page, DMA_TO_DEVICE);
+	if (!page)
+		return -ENOMEM;
+
+	mmu->l2_tables = kvcalloc(MALI_VPU_INDEX_SIZE, sizeof(*mmu->l2_tables), GFP_KERNEL);
+	if (!mmu->l2_tables) {
+		mali_vpu_mmu_free_page(dev, dma, page, DMA_TO_DEVICE);
+		return -ENOMEM;
+	}
+
+	mmu->root.linux_page = page;
+	mmu->root.cpu = page_address(page);
+	mmu->root.dma = dma;
+
+	return 0;
+}
+
+void mali_vpu_mmu_cleanup(struct mali_vpu_mmu *mmu)
+{
+	int count = 0;
+	unsigned int i;
+
+	for (i = 0; i < MALI_VPU_INDEX_SIZE; i++) {
+		struct mali_vpu_mmu_pt_page *l2 = &mmu->l2_tables[i];
+
+		if (!l2->linux_page)
+			continue;
+
+		count += mali_vpu_mapped_count(l2->cpu);
+		mali_vpu_mmu_free_page(mmu->dev, l2->dma, l2->linux_page, DMA_TO_DEVICE);
+	}
+
+	kvfree(mmu->l2_tables);
+	mali_vpu_mmu_free_page(mmu->dev, mmu->root.dma, mmu->root.linux_page,
+			       DMA_TO_DEVICE);
+
+	WARN_ON_ONCE(count > 0);
+}
+
+/* Optionally return the original page for callers that track CPU access. */
+dma_addr_t mali_vpu_mmu_alloc_page(struct device *dev, struct page **out_page,
+				   enum dma_data_direction dir)
+{
+	struct page *page;
+	dma_addr_t dma_handle;
+
+	if (out_page)
+		*out_page = NULL;
+
+	page = alloc_page(GFP_KERNEL | __GFP_ZERO | __GFP_NORETRY);
+	if (!page)
+		return 0;
+
+	dma_handle = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
+	if (dma_mapping_error(dev, dma_handle) != 0) {
+		dev_err(dev, "cannot map page to DMA address space. page=%p", page);
+		goto free_page;
+	}
+
+	dma_sync_single_for_device(dev, dma_handle, PAGE_SIZE, dir);
+
+	if (out_page)
+		*out_page = page;
+
+	return dma_handle;
+
+free_page:
+	__free_page(page);
+	return 0;
+}
+
+void mali_vpu_mmu_free_page(struct device *dev, dma_addr_t dma, struct page *page,
+			    enum dma_data_direction dir)
+{
+	if (!page)
+		return;
+
+	dma_unmap_page(dev, dma, PAGE_SIZE, dir);
+	__free_page(page);
+}
+
+struct mali_vpu_mmu_pages *mali_vpu_mmu_alloc_pages(struct device *dev,
+						    size_t count,
+						    size_t capacity)
+{
+	struct mali_vpu_mmu_pages *pages;
+	int ret;
+
+	count = roundup(count, MALI_VPU_PAGES_PER_LINUX_PAGE);
+	capacity = roundup(capacity, MALI_VPU_PAGES_PER_LINUX_PAGE);
+	capacity = max(count, capacity);
+
+	pages = devm_kzalloc(dev,
+			     sizeof(*pages) + sizeof(pages->pages[0]) * capacity,
+			     GFP_KERNEL);
+	if (!pages)
+		return ERR_PTR(-ENOMEM);
+
+	pages->dev = dev;
+	pages->capacity = capacity;
+
+	for (pages->count = 0; pages->count < count; ) {
+		struct page *page;
+		dma_addr_t dma;
+		unsigned int i;
+
+		/* Allocate one linux page containing one or more MVE pages. */
+		dma = mali_vpu_mmu_alloc_page(dev, &page, DMA_BIDIRECTIONAL);
+		if (!page) {
+			ret = -ENOMEM;
+			goto release_pages;
+		}
+
+		/*
+		 * If the Linux page is larger than the MVE page, then
+		 * we iterate and add DMA addresses with an offset from
+		 * the Linux page.
+		 */
+		for (i = 0; i < MALI_VPU_PAGES_PER_LINUX_PAGE; i++) {
+			pages->pages[pages->count].dma = dma + i * MALI_VPU_PAGE_SIZE;
+			pages->pages[pages->count].linux_page = page;
+			pages->count++;
+		}
+	}
+
+	return pages;
+
+release_pages:
+	mali_vpu_mmu_free_pages(pages);
+
+	return ERR_PTR(ret);
+}
+
+struct mali_vpu_mmu_pages *mali_vpu_mmu_alloc_pages_sg(struct device *dev,
+						       struct sg_table *sgt,
+						       size_t capacity)
+{
+	struct mali_vpu_mmu_pages *pages;
+	size_t count;
+	int ret;
+
+	count = mali_vpu_get_sg_table_npages(sgt) * MALI_VPU_PAGES_PER_LINUX_PAGE;
+	capacity = roundup(capacity, MALI_VPU_PAGES_PER_LINUX_PAGE);
+	capacity = max(count, capacity);
+
+	pages = devm_kzalloc(dev,
+			     sizeof(*pages) + sizeof(pages->pages[0]) * capacity,
+			     GFP_KERNEL);
+	if (!pages)
+		return ERR_PTR(-ENOMEM);
+
+	pages->dev = dev;
+	pages->capacity = capacity;
+	pages->is_external = true;
+	pages->offset = sgt->sgl ? sgt->sgl->offset : 0;
+
+	ret = mali_vpu_append_sg_table(pages, sgt);
+	if (ret) {
+		devm_kfree(dev, pages);
+		return ERR_PTR(ret);
+	}
+
+	return pages;
+}
+
+/* Release backing pages only; page-table updates are handled by the caller. */
+static void mali_vpu_mmu_shrink_pages(struct mali_vpu_mmu_pages *pages, size_t npages)
+{
+	while (pages->count > npages) {
+		pages->count--;
+
+		if ((pages->count % MALI_VPU_PAGES_PER_LINUX_PAGE) == 0)
+			mali_vpu_mmu_free_page(pages->dev,
+					       pages->pages[pages->count].dma,
+					       pages->pages[pages->count].linux_page,
+					       DMA_BIDIRECTIONAL);
+
+		pages->pages[pages->count].dma = 0;
+		pages->pages[pages->count].linux_page = NULL;
+	}
+}
+
+int mali_vpu_mmu_resize_pages(struct mali_vpu_mmu_pages *pages, size_t npages)
+{
+	int ret;
+	size_t oldcount = pages->count;
+
+	if (pages->is_external) {
+		dev_err(pages->dev, "externally managed pages cannot be resized");
+		return -EINVAL;
+	}
+
+	npages = roundup(npages, MALI_VPU_PAGES_PER_LINUX_PAGE);
+
+	if (npages > pages->capacity) {
+		dev_err(pages->dev,
+			"new MMU pages size is larger than capacity. npages=%zu, capacity=%zu",
+			npages, pages->capacity);
+		return -ENOMEM;
+	}
+
+	/* Free pages if npage is smaller than allocated pages. */
+	if (pages->count > npages) {
+		/* Replace the PTEs before releasing their backing pages. */
+		ret = mali_vpu_remap_pages(pages, oldcount, npages);
+		if (ret)
+			return ret;
+
+		mali_vpu_mmu_shrink_pages(pages, npages);
+		return 0;
+	}
+
+	/* Allocate pages if npage is larger than allocated pages. */
+	while (pages->count < npages) {
+		struct page *page;
+		dma_addr_t dma;
+		unsigned int i;
+
+		dma = mali_vpu_mmu_alloc_page(pages->dev, &page, DMA_BIDIRECTIONAL);
+		if (!page)
+			goto rollback_alloc;
+
+		for (i = 0; i < MALI_VPU_PAGES_PER_LINUX_PAGE; i++) {
+			pages->pages[pages->count].dma = dma + i * MALI_VPU_PAGE_SIZE;
+			pages->pages[pages->count].linux_page = page;
+			pages->count++;
+		}
+	}
+
+	return mali_vpu_remap_pages(pages, oldcount, pages->count);
+
+rollback_alloc:
+	mali_vpu_mmu_shrink_pages(pages, oldcount);
+	return -ENOMEM;
+}
+
+void mali_vpu_mmu_free_pages(struct mali_vpu_mmu_pages *pages)
+{
+	unsigned int i;
+
+	mali_vpu_mmu_unmap_pages(pages);
+
+	if (!pages->is_external)
+		for (i = 0; i < pages->count; i += MALI_VPU_PAGES_PER_LINUX_PAGE)
+			mali_vpu_mmu_free_page(pages->dev, pages->pages[i].dma,
+					       pages->pages[i].linux_page,
+					       DMA_BIDIRECTIONAL);
+
+	devm_kfree(pages->dev, pages);
+}
+
+size_t mali_vpu_mmu_size_pages(struct mali_vpu_mmu_pages *pages)
+{
+	return pages->count * MALI_VPU_PAGE_SIZE;
+}
+
+int mali_vpu_mmu_sync_pages(struct mali_vpu_mmu_pages *pages, enum dma_data_direction dir)
+{
+	size_t i;
+
+	if (dir == DMA_FROM_DEVICE) {
+		for (i = 0; i < pages->count; i += MALI_VPU_PAGES_PER_LINUX_PAGE)
+			dma_sync_single_for_cpu(pages->dev, pages->pages[i].dma,
+						PAGE_SIZE, DMA_FROM_DEVICE);
+	} else if (dir == DMA_TO_DEVICE) {
+		for (i = 0; i < pages->count; i += MALI_VPU_PAGES_PER_LINUX_PAGE)
+			dma_sync_single_for_device(pages->dev, pages->pages[i].dma,
+						   PAGE_SIZE, DMA_TO_DEVICE);
+	} else {
+		dev_err(pages->dev, "unsupported MMU flush direction. dir=%u", dir);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int mali_vpu_mmu_map_pages(struct mali_vpu_mmu *mmu,
+			   mali_vpu_mmu_va va,
+			   struct mali_vpu_mmu_pages *pages,
+			   enum mali_vpu_mmu_attr attr,
+			   enum mali_vpu_mmu_access access)
+{
+	size_t i;
+	int ret;
+
+	/*
+	 * A pages object may be mapped at multiple virtual addresses. For example,
+	 * each core maps the same physical firmware text pages into its own virtual
+	 * address region.
+	 */
+	for (i = 0; i < pages->count; i++) {
+		ret = mali_vpu_map_page(mmu, va + i * MALI_VPU_PAGE_SIZE,
+					pages->pages[i].dma, attr, access);
+		if (ret)
+			goto unmap_pages;
+	}
+
+	/*
+	 * Reserve the rest of the address range. Adding a dummy page with
+	 * DMA address 'MALI_VPU_PAGE_SIZE' should not lead to memory corruption,
+	 * because the page is marked as 'no access'.
+	 */
+	for (; i < pages->capacity; i++) {
+		ret = mali_vpu_map_page(mmu, va + i * MALI_VPU_PAGE_SIZE, MALI_VPU_PAGE_SIZE,
+					MALI_VPU_ATTR_PRIVATE, MALI_VPU_ACCESS_NO);
+		if (ret)
+			goto unmap_pages;
+	}
+
+	pages->mmu = mmu;
+	pages->va = va;
+	pages->attr = attr;
+	pages->access = access;
+
+	return 0;
+
+unmap_pages:
+	while (i-- > 0)
+		mali_vpu_unmap_page(mmu, va + i * MALI_VPU_PAGE_SIZE);
+
+	return ret;
+}
+
+void mali_vpu_mmu_unmap_pages(struct mali_vpu_mmu_pages *pages)
+{
+	size_t i;
+
+	if (!pages->mmu)
+		return;
+
+	for (i = 0; i < pages->capacity; i++)
+		mali_vpu_unmap_page(pages->mmu, pages->va + i * MALI_VPU_PAGE_SIZE);
+
+	pages->mmu = NULL;
+	pages->va = 0;
+}
+
+int mali_vpu_mmu_map_dma(struct mali_vpu_mmu *mmu,
+			 mali_vpu_mmu_va va,
+			 dma_addr_t dma,
+			 size_t size,
+			 enum mali_vpu_mmu_attr attr,
+			 enum mali_vpu_mmu_access access)
+{
+	int ret;
+	size_t offset;
+
+	for (offset = 0; offset < size; offset += MALI_VPU_PAGE_SIZE) {
+		ret = mali_vpu_map_page(mmu, va + offset, dma + offset, attr, access);
+		if (ret)
+			goto unmap_pages;
+	}
+
+	return 0;
+
+unmap_pages:
+	/* Unroll mapped pages. */
+	while (offset > 0) {
+		offset -= MALI_VPU_PAGE_SIZE;
+		mali_vpu_unmap_page(mmu, va + offset);
+	}
+
+	return ret;
+}
+
+void mali_vpu_mmu_unmap_va(struct mali_vpu_mmu *mmu,
+			   mali_vpu_mmu_va va,
+			   size_t size)
+{
+	size_t offset;
+
+	for (offset = 0; offset < size; offset += MALI_VPU_PAGE_SIZE)
+		mali_vpu_unmap_page(mmu, va + offset);
+}
+
+/* Initialize read-only firmware text before the VPU accesses these pages. */
+int mali_vpu_mmu_write(struct mali_vpu_mmu_pages *pages,
+		       const void *data,
+		       size_t size)
+{
+	size_t i;
+
+	if (pages->is_external || size > mali_vpu_mmu_size_pages(pages))
+		return -EINVAL;
+
+	for (i = 0; size; i += MALI_VPU_PAGES_PER_LINUX_PAGE) {
+		dma_addr_t dma = pages->pages[i].dma;
+		void *dst = page_address(pages->pages[i].linux_page);
+		size_t n = min_t(size_t, size, PAGE_SIZE);
+
+		memcpy(dst, data, n);
+		dma_sync_single_for_device(pages->dev, dma, PAGE_SIZE,
+					   DMA_TO_DEVICE);
+
+		data += n;
+		size -= n;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.h
new file mode 100644
index 0000000000000..6ad645a2dc6bb
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-mmu.h
@@ -0,0 +1,152 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#ifndef __MALI_VPU_MMU_H__
+#define __MALI_VPU_MMU_H__
+
+#include <linux/dma-mapping.h>
+#include <linux/hashtable.h>
+#include <linux/types.h>
+
+/* Page size is 4 KB - pow(2,12) bytes */
+#define MALI_VPU_PAGE_SHIFT		12
+#define MALI_VPU_PAGE_SIZE		BIT(MALI_VPU_PAGE_SHIFT)
+#define MALI_VPU_PAGE_MASK		(MALI_VPU_PAGE_SIZE - 1)
+
+/**
+ * typedef mali_vpu_mmu_va - 32 bit virtual address.
+ *
+ * This is the address the firmware/MVE will use.
+ */
+typedef u32 mali_vpu_mmu_va;
+
+/**
+ * typedef mali_vpu_mmu_pte - Page table entry.
+ *
+ * A PTE pointer should always point at a Linux kernel virtual address.
+ *
+ * AT - Attribute.
+ * PA - VPU physical address bits [39:12], supplied as a DMA address.
+ * AP - Access permission.
+ *
+ *    30                                                       2   0
+ * +---+-------------------------------------------------------+---+
+ * | AT|                          PA                           | AP|
+ * +---+-------------------------------------------------------+---+
+ */
+typedef u32 mali_vpu_mmu_pte;
+
+enum mali_vpu_mmu_attr {
+	MALI_VPU_ATTR_PRIVATE   = 0,
+	MALI_VPU_ATTR_REFFRAME  = 1,
+	MALI_VPU_ATTR_SHARED_RO = 2,
+	MALI_VPU_ATTR_SHARED_RW = 3
+};
+
+enum mali_vpu_mmu_access {
+	MALI_VPU_ACCESS_NO         = 0,
+	MALI_VPU_ACCESS_READ_ONLY  = 1,
+	MALI_VPU_ACCESS_EXECUTABLE = 2,
+	MALI_VPU_ACCESS_READ_WRITE = 3
+};
+
+/**
+ * struct mali_vpu_mmu_pages - Structure used to allocate an array of pages.
+ * @dev: Pointer to device.
+ * @node: Hash table node. Used to keep track of allocated pages objects.
+ * @mmu: Pointer to MMU instance.
+ * @va: MVE virtual address. Set to 0 if objects is unmapped.
+ * @offset: Offset from mapped VA to where the data begins.
+ * @attr: Page table attributes.
+ * @access: Page table access.
+ * @capacity: Maximum number of MVE pages this object can hold.
+ * @count: Current number of allocated pages.
+ * @is_external: If the physical pages have been externally allocated.
+ * @pages: DMA address and original backing Linux page for each MVE page.
+ *         The backing page is NULL for external memory and may be shared by
+ *         multiple MVE entries when Linux pages are larger than MVE pages.
+ */
+struct mali_vpu_mmu_pages {
+	struct device *dev;
+	struct hlist_node node;
+	struct mali_vpu_mmu *mmu;
+	mali_vpu_mmu_va va;
+	size_t offset;
+	enum mali_vpu_mmu_attr attr;
+	enum mali_vpu_mmu_access access;
+	size_t capacity;
+	size_t count;
+	bool is_external;
+	struct {
+		dma_addr_t dma;
+		struct page *linux_page;
+	} pages[];
+};
+
+/**
+ * struct mali_vpu_mmu_pt_page - Backing memory for one VPU page table.
+ * @linux_page: Original Linux page backing the table.
+ * @cpu: Kernel virtual address used to access the table entries.
+ * @dma: DMA address used by the VPU page-table walker.
+ */
+struct mali_vpu_mmu_pt_page {
+	struct page *linux_page;
+	mali_vpu_mmu_pte *cpu;
+	dma_addr_t dma;
+};
+
+/**
+ * struct mali_vpu_mmu - VPU page tables for one session.
+ * @dev: Device used for DMA mapping and synchronization.
+ * @root: Root (L1) page table.
+ * @l2_tables: Array of L2 table descriptors indexed by the L1 index.
+ *             L2 backing pages are allocated on demand.
+ */
+struct mali_vpu_mmu {
+	struct device *dev;
+	struct mali_vpu_mmu_pt_page root;
+	struct mali_vpu_mmu_pt_page *l2_tables;
+};
+
+int mali_vpu_mmu_init(struct mali_vpu_mmu *mmu, struct device *dev);
+void mali_vpu_mmu_cleanup(struct mali_vpu_mmu *mmu);
+
+dma_addr_t mali_vpu_mmu_alloc_page(struct device *dev, struct page **out_page,
+				   enum dma_data_direction dir);
+void mali_vpu_mmu_free_page(struct device *dev, dma_addr_t dma, struct page *page,
+			    enum dma_data_direction dir);
+
+struct mali_vpu_mmu_pages *mali_vpu_mmu_alloc_pages(struct device *dev,
+						    size_t count,
+						    size_t capacity);
+
+struct mali_vpu_mmu_pages *mali_vpu_mmu_alloc_pages_sg(struct device *dev,
+						       struct sg_table *sgt,
+						       size_t capacity);
+
+size_t mali_vpu_mmu_size_pages(struct mali_vpu_mmu_pages *pages);
+int mali_vpu_mmu_resize_pages(struct mali_vpu_mmu_pages *pages, size_t npages);
+void mali_vpu_mmu_free_pages(struct mali_vpu_mmu_pages *pages);
+int mali_vpu_mmu_sync_pages(struct mali_vpu_mmu_pages *pages, enum dma_data_direction dir);
+
+int mali_vpu_mmu_map_pages(struct mali_vpu_mmu *mmu,
+			   mali_vpu_mmu_va va,
+			   struct mali_vpu_mmu_pages *pages,
+			   enum mali_vpu_mmu_attr attr,
+			   enum mali_vpu_mmu_access access);
+
+void mali_vpu_mmu_unmap_pages(struct mali_vpu_mmu_pages *pages);
+
+int mali_vpu_mmu_map_dma(struct mali_vpu_mmu *mmu,
+			 mali_vpu_mmu_va va,
+			 dma_addr_t dma,
+			 size_t size,
+			 enum mali_vpu_mmu_attr attr,
+			 enum mali_vpu_mmu_access access);
+
+void mali_vpu_mmu_unmap_va(struct mali_vpu_mmu *mmu, mali_vpu_mmu_va va, size_t size);
+int mali_vpu_mmu_write(struct mali_vpu_mmu_pages *pages, const void *data, size_t size);
+
+#endif /* __MALI_VPU_MMU_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
index 36a25030d7324..2d63dc058c91a 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
@@ -213,6 +213,13 @@ static int mali_vpu_probe(struct platform_device *pdev)
 		goto err_rst_clk;
 	}
 
+	vpu_dev->dma_mask = vpu_dev->variant->dma_mask;
+	ret = dma_set_mask_and_coherent(vpu_dev->dev, vpu_dev->dma_mask);
+	if (ret)
+		goto err_rst_clk;
+
+	dma_set_max_seg_size(vpu_dev->dev, SZ_2G);
+
 	ret = v4l2_device_register(&pdev->dev, &vpu_dev->v4l2_dev);
 	if (ret) {
 		dev_err(vpu_dev->dev, "failed to register V4L2 device\n");
@@ -280,3 +287,4 @@ static struct platform_driver mali_vpu_driver = {
 module_platform_driver(mali_vpu_driver);
 MODULE_DESCRIPTION("Arm Mali VPU driver");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("DMA_BUF");
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
index d1e8680de5556..10481ba16d68a 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
@@ -86,8 +86,17 @@ int mali_vpu_session_init(struct mali_vpu_session *sess)
 		goto err_m2m_ctx_release;
 	}
 
+	ret = mali_vpu_mmu_init(&sess->mmu, sess->vpu_dev->dev);
+	if (ret) {
+		dev_err(sess->vpu_dev->dev, "failed to initialise MMU: %d\n", ret);
+		goto err_ctrls_cleanup;
+	}
+
 	return 0;
 
+err_ctrls_cleanup:
+	mali_vpu_ctrls_cleanup(sess);
+
 err_m2m_ctx_release:
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 
@@ -108,6 +117,7 @@ void mali_vpu_session_cleanup(struct mali_vpu_session *sess)
 
 	mutex_unlock(&sess->vq_lock);
 
+	mali_vpu_mmu_cleanup(&sess->mmu);
 	mali_vpu_ctrls_cleanup(sess);
 	mutex_destroy(&sess->vq_lock);
 }
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
index 766912aec0b8e..4dd6c8bc22dd9 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
@@ -13,6 +13,7 @@
 
 #include "mali-vpu-device.h"
 #include "mali-vpu-formats.h"
+#include "mali-vpu-mmu.h"
 
 struct v4l2_m2m_ctx;
 
@@ -32,6 +33,7 @@ struct mali_vpu_port {
  * @role: Role of this session.
  * @port_src: Source (OUTPUT) port for this session.
  * @port_dst: Destination (CAPTURE) port for this session.
+ * @mmu: MMU handle for this session
  * @vq_lock: Mutex lock to serialise per-session queue related ioctls.
  * @is_fw_ready: True if the firmware is loaded and ready to accept commands.
  * @min_buffers_required: Driver-reported minimum buffers for role-specific queue.
@@ -47,6 +49,7 @@ struct mali_vpu_session {
 	enum mali_vpu_session_role	role;
 	struct mali_vpu_port		port_src;
 	struct mali_vpu_port		port_dst;
+	struct mali_vpu_mmu		mmu;
 	struct mutex			vq_lock; /* lock to serialise per-session ioctls */
 	bool				is_fw_ready;
 	u32				min_buffers_required;
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
index b807f8d888222..19ad2667f2597 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
@@ -149,6 +149,7 @@ static const struct mali_vpu_ctrl_desc mali_v76_dec_ctrls[] = {
 };
 
 const struct mali_vpu_variant mali_vpu_v76_variant = {
+	.dma_mask = DMA_BIT_MASK(40),
 	.expected_hw_pid = MALI_VPU_HW_PID_V76,
 
 	.rst_names = mali_v76_rst_names,
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
index ad20896c90b0f..d316e010fff48 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
@@ -49,6 +49,7 @@ struct mali_vpu_control_caps {
  * @rst_names: Array of reset control names for this variant.
  * @num_rsts: Number of reset controls for this variant.
  * @expected_hw_pid: Expected hardware product ID read from the version register.
+ * @dma_mask: DMA addressing capability mask.
  * @fmt_caps: Format capability tables for encode/decode paths.
  * @frmsz_caps: Frame dimension limits and defaults.
  * @ctrl_caps:  Control capability tables for encode/decode paths.
@@ -57,6 +58,7 @@ struct mali_vpu_variant {
 	const char * const *rst_names;
 	unsigned int num_rsts;
 	u32 expected_hw_pid;
+	u64 dma_mask;
 
 	struct mali_vpu_format_caps	fmt_caps;
 	struct mali_vpu_framesize_caps	frmsz_caps;
-- 
2.43.0

