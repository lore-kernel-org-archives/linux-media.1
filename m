Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE11D2417DE;
	Thu, 20 Aug 2026 15:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238064; cv=none; b=Ai2tN54CG2Z73dx9U5V2AlDCKo/cr8nYq9Ztk1UOxt00cKSoQI5fNp4IgeCStoTT+tAZgDua5Xqe1RVVKZ3SA2J9KkFD9hQrX2zs5Ti2MKbEt6vUJXLaAlASWgl2pHxQGt6CLeOGEDLqEnz3Xv6iC4lkPm3i3HQeRDjwgJe+Ub0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238064; c=relaxed/simple;
	bh=W39nx0xUvQJFDw697gXlKmqlgDRLETj5+HJFQQSKQkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=InSh+v0I5Mx1PvzSaBy9NN+W5sOvXRPIuPwlirISVzuX920vThk9U5RwZOflI9inc1Y7dYhcaQit3J05QU4muqPH7O7ZQys2FHoZ5j2DNW/MKLxjXj35lPMzZJc/XIgxhvDriycUo96KhZ9lxTW55qxbvxq6PrPpqEvyCtXmfNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AjxZSDWa; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AjxZSDWa"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EED5A153B;
	Thu, 20 Aug 2026 08:00:54 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 220C63F85F;
	Thu, 20 Aug 2026 08:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787238058; bh=W39nx0xUvQJFDw697gXlKmqlgDRLETj5+HJFQQSKQkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AjxZSDWaR3zUDofIoYP4OkhXqP2BE1MDLKVayMvkr6CkpeiVhTModGpFIXVU5R3m9
	 UZG3h8VXUUc7GRZcLrcnLXZEO2ukRZ2b9md9B3SS1FWqF/7jup+TGut3iatGo3wvqH
	 wZnOou0gPsmodKHI9OY3VmAQrwZQtfXDjkBQM0GU=
From: Steven Price <steven.price@arm.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Marc Zyngier <maz@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Steven Price <steven.price@arm.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jiri Pirko <jiri@resnulli.us>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v2 2/4] irqchip/gic-v3-its: Allocate VPE tables from sleepable context
Date: Thu, 20 Aug 2026 16:00:31 +0100
Message-ID: <20260820150034.88729-3-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820150034.88729-1-steven.price@arm.com>
References: <20260820150034.88729-1-steven.price@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VPE L1 table is allocated from the CPU-starting hotplug state,
where interrupts are disabled. Although the page allocation uses
GFP_ATOMIC, its_alloc_pages() subsequently calls
set_memory_decrypted(), which can sleep while splitting the arm64
linear map.

Move the allocation to the existing CPU-online callback, which runs in
sleepable context, and use GFP_KERNEL for both allocations performed
there. Register the callback even without EFI, since it is now also
responsible for VPE table allocation.

Fixes: b08e2f42e86b ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index a055837832bc..71515dbff9ec 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -2932,7 +2932,7 @@ static int allocate_vpe_l1_table(void)
 	if (val & GICR_VPROPBASER_4_1_VALID)
 		goto out;
 
-	gic_data_rdist()->vpe_table_mask = kzalloc_obj(cpumask_t, GFP_ATOMIC);
+	gic_data_rdist()->vpe_table_mask = kzalloc_obj(cpumask_t, GFP_KERNEL);
 	if (!gic_data_rdist()->vpe_table_mask)
 		return -ENOMEM;
 
@@ -2999,7 +2999,7 @@ static int allocate_vpe_l1_table(void)
 
 	pr_debug("np = %d, npg = %lld, psz = %d, epp = %d, esz = %d\n",
 		 np, npg, psz, epp, esz);
-	page = its_alloc_pages(GFP_ATOMIC | __GFP_ZERO, get_order(np * PAGE_SIZE));
+	page = its_alloc_pages(GFP_KERNEL | __GFP_ZERO, get_order(np * PAGE_SIZE));
 	if (!page)
 		return -ENOMEM;
 
@@ -3268,16 +3268,6 @@ static void its_cpu_init_lpis(void)
 		val = its_clear_vpend_valid(vlpi_base, 0, 0);
 	}
 
-	if (allocate_vpe_l1_table()) {
-		/*
-		 * If the allocation has failed, we're in massive trouble.
-		 * Disable direct injection, and pray that no VM was
-		 * already running...
-		 */
-		gic_rdists->has_rvpeid = false;
-		gic_rdists->has_vlpis = false;
-	}
-
 	/* Make sure the GIC has seen the above */
 	dsb(sy);
 	gic_data_rdist()->flags |= RD_LOCAL_LPI_ENABLED;
@@ -5452,6 +5442,19 @@ static int its_cpu_memreserve_lpi(unsigned int cpu)
 	if (gic_data_rdist()->flags & RD_LOCAL_MEMRESERVE_DONE)
 		return 0;
 
+	if (allocate_vpe_l1_table()) {
+		/*
+		 * If the allocation has failed, we're in massive trouble.
+		 * Disable direct injection, and pray that no VM was
+		 * already running...
+		 */
+		gic_rdists->has_rvpeid = false;
+		gic_rdists->has_vlpis = false;
+	}
+
+	if (!efi_enabled(EFI_CONFIG_TABLES))
+		goto out;
+
 	pend_page = gic_data_rdist()->pend_page;
 	if (WARN_ON(!pend_page)) {
 		ret = -ENOMEM;
@@ -5793,9 +5796,6 @@ int __init its_lpi_memreserve_init(void)
 {
 	int state;
 
-	if (!efi_enabled(EFI_CONFIG_TABLES))
-		return 0;
-
 	if (list_empty(&its_nodes))
 		return 0;
 
-- 
2.43.0

