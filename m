Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FC9402B9E
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 23:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763510; cv=none; b=NRgel0nNmuwXF26qRwhmO/PgYt6u0B1JaDzvsVR+O2iO15tiPIVr6npZI7dNHnQK81PdQDPNUc8l2CzCFM75VxJUbmzUwxR7nWK/DR5+873eLA2tQAhQWUC6YBXub3BfHb43HeOKHWlT3dY5F6VE6ekalF5uKb9U2BBaBQcih7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763510; c=relaxed/simple;
	bh=482j/rlGL/MyUIfK5vi1HCJAff/SkFOJEYzr2v72u54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b4OSDy+n0WK2facgSXEmy+sSA2i02Lsbpc0iaplsqbFB+LjFF+AmEOYAj+zlcH007NgqTfWPJXhW/HKju+1h/NCSOjAzFzjrySuFOiBkSWvgpNUulpOgbXCz/69LfBunaLzc25Iti7KiP8tJM+Ov3KzMGP6ZSgFzLyiIB8qr+Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co; spf=pass smtp.mailfrom=x6u.co; dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b=iA+/kGZo; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b="iA+/kGZo"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-667bae10ba3so6635d50.2
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 16:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1784763508; x=1785368308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czUeoqytFwl2f4wSjedp4ua+inBVMuooqHyWYibjU+0=;
        b=iA+/kGZobaT+lSDLZ45F6N0UzEEl1f46UkH+BD25EBWjM2bPmi86e2wxn3LogtyAxV
         FsOeHVfoRSucvTww5WRhSAjQlSpZzL73YNbklZ7woMak9x6Xe7mUlbhfutEUSjfXofwq
         LgN/GwezkBhzMxfoIQztgpFRpdIuTiLPp1Y6/PbJrHIpM4mj8uEvUdsCjPaHZeOS/VO8
         dmfqEj7Q2OQZ3ZG6OYNEKaXdFXsmauhMMxxxN0W+Vl4l6Sff58mbBPN2kwvj5/mfQuvk
         kPmZi/YWoE0IlVhhtYdnf0fyh3x750v8YortRxwSOIbjgyMDE+pWAc4KOiC5Sp9xXKWT
         2ElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763508; x=1785368308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=czUeoqytFwl2f4wSjedp4ua+inBVMuooqHyWYibjU+0=;
        b=Z96hCRsNYlgrKCHLTxt5EvVTC5WTXgVcoFXKg0NAkvuruDWctka4tBk1DLJP46JbI/
         4ZN67t/H5X/soG5dhzsL4OW2Q/fYLpnueW//tERUeN3agjWgHaPc/wR4ek52ByEITate
         v++LqE9Qfk32o7TMzkBCVZzNd91uyf4x6mE4G4iSSKasAW7dfkYgH0v5sS6XHLDu6EaR
         C4jMjY/1p1/YDbQf7i6HRoU23VHXXcFlgAXWQAarbNxn7q4qx1yh5WXA20rv1iQREQXi
         vsOPL6DNyi19iWPWaaokMSeQWjWB0yqv4Y6q+pWkker22HqMQ0aEQALAxNcdJZo4qfCC
         hSPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rop81I1+5xPPKjDdCG2+0SncRzlLr+jHkNEGMtYm11OcpJ1ZBDCAO5WSo/feXZagqksgU3NQPN27OH8KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpq04OGo5IwYyu7cEhtEIfKCRN8+BzdsXvgVy3q2stCVAykAMW
	oN09KyXszI5cmFEf68U3Hv+qHvPJcZx4nhT1PcHO63t2buCR9FsHpMVfjs0D7DNlaDyA
X-Gm-Gg: AR+sD13SndiUudcajBfxU3OrvRt3ikgbQCKh5MdByljxwYRRh+r+7S0aEBfSC9ailmv
	uwsfUo29cnxi4+jws0gJjemswuym52ajQILDASRf7NpiFNRhyu17zrUxt9AeBNZNNfnqVsdurzy
	CWvNyCVxqFzoa9AHXSixZv4GpFpr9B9NxMIiGWFxt3QPJKHt+XR0MHidqEWd4k2d0XcOdtkl/KA
	E+wqy6qS2mdouXuiXIzEJvgSPfH5YPU5JPDmfw7gpj2ZCVrmoTQ5Yzip2rC0WQLoCqhWLfPgBx4
	Rc8WEe2nhhCYxxIAKQ4NUz1aaY1Wk4+7n+eVPOn/ZJJ1+/XVFGMSv+XjRvlTk9kQvXGXuhOGqrf
	NZdUp/iN8t21C7oVKztzH6gLi4r8HgwhAJ91QAXQVCMEBMYOS8tNU70C+e3vlgCnpI38Pgf9K8l
	E++gVkpucKh1dDVShBgaPSR2UBTZd4H4eu8Tt/vdIN1dLCpLeSXOnwfF4u
X-Received: by 2002:a53:ce84:0:b0:667:af05:2e8d with SMTP id 956f58d0204a3-668a4fbd261mr142804d50.79.1784763507854;
        Wed, 22 Jul 2026 16:38:27 -0700 (PDT)
Received: from worldpeace10.c.googlers.com.com (234.207.85.34.bc.googleusercontent.com. [34.85.207.234])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66890521188sm2193219d50.1.2026.07.22.16.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:38:27 -0700 (PDT)
From: dhu@x6u.co
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	David Laight <david.laight.linux@gmail.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alex Williamson <alex@shazbot.org>,
	Pranjal Shrivastava <praan@google.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	stable@vger.kernel.org,
	jmoroni@google.com,
	kpberry@google.com,
	chriscli@google.com,
	viursachi@google.com,
	xuehaohu@google.com,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH v3] dma-buf: Split sgl by largest page-aligned chunk
Date: Wed, 22 Jul 2026 23:38:06 +0000
Message-ID: <20260722233806.3922093-1-dhu@x6u.co>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260623015459.1153884-1-xuehaohu@google.com>
References: <20260623015459.1153884-1-xuehaohu@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Hu <xuehaohu@google.com>

Currently, `fill_sg_entry()` splits the scatterlist using `UINT_MAX`.
This creates a non-page-aligned DMA length (`0xFFFFFFFF`) for the
first entry, resulting in non-page-aligned DMA addresses for all
subsequent entries.

While the underlying IOMMU mapping may be contiguous, hardware
DMA engines often require explicit address alignment (e.g., page,
cacheline, or storage sector boundaries). Passing unaligned
addresses and lengths can cause explicit failures in DMA descriptor
creation or silent data corruption if lower unaligned bits are
truncated.

In addition, a non-page-aligned sgl length will trigger an edge case
in `ib_umem_find_best_pgsz()`. In case of a discontinuity in later
buffers, we will have a `va` with lowest bit set to 1. That will lead
to `ib_umem_find_best_pgsz()` always return 0, and break the promise
to find best page size for the mapping on the NIC side.

Fix this by splitting the scatterlist by the largest possible page
aligned chunk within `UINT_MAX` (`ALIGN_DOWN(UINT_MAX, PAGE_SIZE)`).
This ensures all scatterlist DMA addresses and lengths remain page
aligned, while minimizing the total number of sgl entries.

Page-aligned entries allow the system to cleanly chunk payloads into
PCIe MaxPayloadSize (MPS) (e.g., 128 bytes, 256 bytes, 512 bytes).
As a result, this may help reduce TLP fragmentation in P2P transfers
and alleviate potential congestion within a logical PCIe switch
partition, especially when Relaxed Ordering is not possible due to
hardware constraints.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260609165431.778061F00893@smtp.kernel.org/
Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
Cc: stable@vger.kernel.org
Signed-off-by: David Hu <xuehaohu@google.com>
---
 Changes in v3:
 - Removed the type cast for `min` (David Laight)
 - Reverted max ent size to be `ALIGN_DOWN(UINT_MAX, PAGE_SIZE)` and
   updated commit message to reflect that (Jason Gunthorpe)
 - Updated commit message to reflect that this also fixes an edge case
   in `ib_umem_find_best_pgsz()`

 Changes in v2:
 - Updated commit title and message to reflect the switch to 2G chunks
 - Switch to using 2G as the max sg entry size as it naturally aligns
   with most hardware boundaries, while allowing compiler optimizations
   with bit shifts (David Laight)
 - Optimized away division calculation for `nent`, and multiplication
   calculation for sgl address, by dropping the `for` loop in favor of a
   `while (length)` loop (David Laight)
 - Dropped `min_t` in favor of `min()` to maintain a strict type
   checking safety net (David Laight)

 drivers/dma-buf/dma-buf-mapping.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
index 794acff2546a..50ded9daf5fb 100644
--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -5,16 +5,17 @@
  */
 #include <linux/dma-buf-mapping.h>
 #include <linux/dma-resv.h>
+#include <linux/align.h>
+
+#define MAX_SG_ENT_SZ ALIGN_DOWN(UINT_MAX, PAGE_SIZE)
 
 static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
 					 dma_addr_t addr)
 {
-	unsigned int len, nents;
-	int i;
+	size_t len;
 
-	nents = DIV_ROUND_UP(length, UINT_MAX);
-	for (i = 0; i < nents; i++) {
-		len = min_t(size_t, length, UINT_MAX);
+	while (length) {
+		len = min(length, MAX_SG_ENT_SZ);
 		length -= len;
 		/*
 		 * DMABUF abuses scatterlist to create a scatterlist
@@ -24,8 +25,10 @@ static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
 		 * does not require the CPU list for mapping or unmapping.
 		 */
 		sg_set_page(sgl, NULL, 0, 0);
-		sg_dma_address(sgl) = addr + (dma_addr_t)i * UINT_MAX;
+		sg_dma_address(sgl) = addr;
 		sg_dma_len(sgl) = len;
+		addr += len;
+		/* Unconditionally advance. On last segment, this becomes NULL */
 		sgl = sg_next(sgl);
 	}
 
@@ -41,14 +44,14 @@ static unsigned int calc_sg_nents(struct dma_iova_state *state,
 
 	if (!state || !dma_use_iova(state)) {
 		for (i = 0; i < nr_ranges; i++)
-			nents += DIV_ROUND_UP(phys_vec[i].len, UINT_MAX);
+			nents += DIV_ROUND_UP(phys_vec[i].len, MAX_SG_ENT_SZ);
 	} else {
 		/*
 		 * In IOVA case, there is only one SG entry which spans
 		 * for whole IOVA address space, but we need to make sure
 		 * that it fits sg->length, maybe we need more.
 		 */
-		nents = DIV_ROUND_UP(size, UINT_MAX);
+		nents = DIV_ROUND_UP(size, MAX_SG_ENT_SZ);
 	}
 
 	return nents;
-- 
2.55.0.229.g6434b31f56-goog

