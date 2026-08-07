Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BDC23AE87;
	Fri,  7 Aug 2026 04:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786077276; cv=none; b=hIXztVSVMiFn79XF3lUdvaxfk1nCdIuor/PI0TTTaKvbDfN1H8A2Egfe6PHH2/wHzHBs62mvNL5FNhBQldU9Kyeq96go45v+0e+mF0Xy52jhsnfeVI/ibjkFooet/K804xXN6yGTZQCn6bqbbYncK53d3Fkkw7qYcSc6MCG7JEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786077276; c=relaxed/simple;
	bh=AUi+gCo4kulH2npNlvS/HOJU4ckriZuI9b2wAGE7mVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UhktPbSq4k5aSozHa6qHfoskF5wBusleBYVSU9TFvQ3cetPG2EpE2Q6OeKAUrQZwUsgbKT3XOs8R7pfRNSD3+9t4LWG44zm4OPbRWt4QqiEW/OQzF3jA1qEIAD2SLadMhSxYHVUpZODLT7sR14l0LRr2UaGGi1pkJTqk6yF+F8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WZFBdKoP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZFBdKoP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786077275; x=1817613275;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AUi+gCo4kulH2npNlvS/HOJU4ckriZuI9b2wAGE7mVA=;
  b=WZFBdKoPJQ5ekzYXhY54ouatlCUunuxHaneM2WYEN0goiJO/nxq5qTc3
   SmylelRdJyBlBKYnWoGe5wVEsEWKVvXT5CEP15yR9qn2vcpIgL5J6DT2T
   c4B7Cohl9ZPEMshLyoaxp/ay1k2m0RK/1GR6i1pY0g2JVKwzDnveIoywu
   JBdxcXyFQMGZgz3hjkbVd6AXDKSVsVrDePzxhkmAGgdvjrQFxNJxrmes1
   7NA4XGDCpocriIVJSy2dwsUeA1IpEdBlRrAqjUXTybl+uDS8eNSbLeMs+
   7hYNpG5CZM3OoNLFZLWo4CdB/cIkwDZlh3Q9w4S8yAqYYTDYRPewhVYqw
   w==;
X-CSE-ConnectionGUID: hkY2/3ROTY+kax/soJZqwg==
X-CSE-MsgGUID: tPJyg0LZQPSZSw9Ebfx1Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="85653387"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="85653387"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 21:34:34 -0700
X-CSE-ConnectionGUID: bDxFfp/sTOuFx1O/+pfPaQ==
X-CSE-MsgGUID: OWYw+UjRQH22nuF15Ygnsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="265773919"
Received: from clke06vm103.fm.intel.com (HELO clke06vm103.amr.corp.intel.com) ([10.80.128.218])
  by orviesa003.jf.intel.com with ESMTP; 06 Aug 2026 21:34:34 -0700
From: "Prabhakaran, Krishna" <krishna.prabhakaran@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tursulin@ursulin.net,
	airlied@gmail.com,
	simona@ffwll.ch,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	Krishna Prabhakaran <krishna.prabhakaran@intel.com>
Subject: [PATCH 1/1] drm/i915/dmabuf: avoid global wbinvd on dma-buf import
Date: Thu,  6 Aug 2026 21:33:26 -0700
Message-ID: <20260807043326.556767-1-krishna.prabhakaran@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Krishna Prabhakaran <krishna.prabhakaran@intel.com>

When i915 needs to make an imported dma-buf coherent for GPU access on
non-LLC platforms, or for objects that bypass LLC, it currently calls
wbinvd_on_all_cpus(). get_pages() runs whenever an imported buffer is
pinned, so this triggers a whole-cache write-back and invalidate,
broadcast by IPI to every CPU, on every execbuf submission involving an
imported dma-buf. That stalls the entire machine for milliseconds and
starves latency-sensitive work on unrelated cores (e.g. USB isochronous
audio serviced on the VMM's main thread).

A dma-buf sg_table is not guaranteed to be backed by struct pages, and
the importer has no way to tell, so drm_clflush_sg() cannot be used
here. Instead vmap the buffer and flush that virtual range with
drm_clflush_virt_range(): x86 uses PIPT caches, so flushing one virtual
alias evicts the cache lines for every alias of the same physical
pages. This provides the required coherency, locally and without an IPI.

Fall back to wbinvd only when the buffer cannot be vmapped or is backed
by I/O memory, where there is no CPU-side range to clflush. The
dma_resv lock required by dma_buf_vmap() is already held here via the
imported object.

Fixes: a035154da45d ("drm/i915/dmabuf: add paranoid flush-on-acquire")
Signed-off-by: Krishna Prabhakaran <krishna.prabhakaran@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 26 +++++++++++++++-------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index b43d34c7d641..1c1f3dc9c212 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -10,6 +10,8 @@
 
 #include <asm/smp.h>
 
+#include <drm/drm_cache.h>
+
 #include "gem/i915_gem_dmabuf.h"
 #include "i915_drv.h"
 #include "i915_gem_object.h"
@@ -249,16 +251,24 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
 	 * DG1 is special here since it still snoops transactions even with
 	 * CACHE_NONE. This is not the case with other HAS_SNOOP platforms. We
 	 * might need to revisit this as we add new discrete platforms.
-	 *
-	 * XXX: Consider doing a vmap flush or something, where possible.
-	 * Currently we just do a heavy handed wbinvd_on_all_cpus() here since
-	 * the underlying sg_table might not even point to struct pages, so we
-	 * can't just call drm_clflush_sg or similar, like we do elsewhere in
-	 * the driver.
 	 */
 	if (i915_gem_object_can_bypass_llc(obj) ||
-	    (!HAS_LLC(i915) && !IS_DG1(i915)))
-		wbinvd_on_all_cpus();
+	    (!HAS_LLC(i915) && !IS_DG1(i915))) {
+		struct dma_buf *dma_buf = obj->base.import_attach->dmabuf;
+		struct iosys_map map;
+		int vmap_ret;
+
+		/* We already hold the dma_resv lock via the imported obj. */
+		vmap_ret = dma_buf_vmap(dma_buf, &map);
+		if (!vmap_ret && !map.is_iomem) {
+			drm_clflush_virt_range(map.vaddr, obj->base.size);
+			dma_buf_vunmap(dma_buf, &map);
+		} else {
+			if (!vmap_ret)
+				dma_buf_vunmap(dma_buf, &map);
+			wbinvd_on_all_cpus();
+		}
+	}
 
 	__i915_gem_object_set_pages(obj, sgt);
 
-- 
2.43.0

