Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3CF486634
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 17:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282565; cv=none; b=EvHflk/louBbsaqMNuE6m/UaJ6Y7IOal8RH7CQgzb6jEolqRroFOSvFAKprrRwKqq/O0A27BqpYitITeLMuJg1+t5PNVsBDZLaMsHLgpCYGXysNnDL/2X+WCXR7HReYwn4mW30Tb1LqRYx9SO6zWSb6bU3avL+4EO/5IWwkYFlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282565; c=relaxed/simple;
	bh=zrnOF43taoerZ+b1qJhujsiK8novkLtc50y8hRyQ+78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=llEDy/OaR+Fj/u2p+HkN4821EFr4a+KvXyxwHW/fPz3psS5tf0rnvY46UX8QxTawg7V6evRkBQE+WxDhTesDdarRqkeobernzrH+6zE8Rv3Cp2GQeuDQoEb/BP2V31+I0/8f/bbKyILVAcNxbGjIMFSyVcE9lSaTb/w8Mrpeja8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co; spf=pass smtp.mailfrom=x6u.co; dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b=XVnErx++; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b="XVnErx++"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8549a96e93cso1710427b3.3
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 10:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1788282561; x=1788887361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+HsJ7WWSDXGGxM5KQ2N5tTmcNL3Nov2eFWn2UfdJVq4=;
        b=XVnErx++WF+TV6L6C1ayZ3jY3i+BlWRIQ6ynbjaDesJZhjmamagdRryECV5+J66oNQ
         IBeC58CHQjH2DxmcRQBMSpBk0Kirs50LAkZBGoWz6rmrdcTGXZUv04vXHA11N1wyPvhe
         Vch7T0oahlcNnzkDhsp4phqpwsrqHhvPayHyBLxMWLTJFDtJYPtRchMjkYkHKpnbmrhq
         DGMPOJwc2CYfZwy+nS80SBu44iFhXGTtwIRE7LkdD+6XqN/fLFJIMkCB1rcqHJbEDB9l
         5Zv1bP1mBtzLUi5Z0vgkpP43hOmxTUTVts5wz8GtoR+y21MEuuG0rU1Nyb4u/N1kSqK6
         hCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788282561; x=1788887361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+HsJ7WWSDXGGxM5KQ2N5tTmcNL3Nov2eFWn2UfdJVq4=;
        b=V+milk9NvL9TMJ8Lhynk+JBWezz2WiDMD/2DaiiG7TICLioSw2Sz1I3XBsmK6LS4x0
         EDVahlreymQJ5Uh7rNQrmeGqMUk+3Lnax/Q2aHGsxjqjOY1vJqXd2ZW+UQrkXmXi5t+7
         UTRQ8vexTQCgBFss+0CVofkRFJMzTdyhSuETPGOERWpVZHvZ25Fl22Z4bPpb6XunKwld
         vuUAEeHpxlB0+Sy8Es2dwcuPE7V+bFtRG26cE8hwiz7CPeOdl02RNsq4tRo+ex5JmLEA
         a0WX54n6bWAKhvfm9G5QOUG2KGsMwgSmbUqL44A10fOFHx507PR51Zi0RH6+17nZ5cjZ
         szbQ==
X-Forwarded-Encrypted: i=1; AKwUvByn7+GmiI1C6Z/RqSKsTAzMkzK/GKyXbVxa6CekyZyAmzfvG2Mewba95XKnpPxbEtJVU81O0+ciFLDmUw==@vger.kernel.org
X-Gm-Message-State: AFuF++khhHbqBQQs7zYfn+oShD/fMVKjb7eS0DoI7gfR0sjBvTEz+uxH
	3UEw6ZXHZRK6qhUqWoHFpSx4pO6M39L5nHToIKfjZHJpx7y1v/wkQCMftg6qVqT/kmzp
X-Gm-Gg: AYBFou3kBIfY7gDU0epaoy5zw54zmD8msrakh/nuqfizTkMk1EpDiff2eqPEV2bcwKU
	ZiHGnkL8pJsrwh51YitSdPq7P/XuJGUrQU99m8+G9oTKzhILUFEQs449lJSeUbsjlcWQ/ovkXnE
	0bWwD7JFUN89yMf2HkDez5+kuNimpj+EEExmS0c3oEhHlmpVMDT0gQylh+YW9JEKddqkQZyGSuR
	U1cBE4TzkzUlmPXttLfypIO7VG/BVIY76EA6t/keNMNMLEDtdMFo02dm65nJkvrtyDlhNstHbbk
	amxQRCWwfzrjb2Mi3apRCyOinUa/hPEgNRvx2vbDSdWDazsPwcoZeBV4t2YSpLZSylZUwHzdLwN
	hjoDypHk3y+jJtoApK4LCkPgbvHBZnlmTfGjDea1XqHChnvSAua0JEs1igOZ+b3+K93Lncm2l7G
	KiypUs74rgCxFKR3GclbAi1FBZNdgjrwdB9wh2MyadTk7TMl/veJwZjy4SyksifWLbkHjt1OYQQ
	YjpNfHJDnm1K/wOHVbx0JbmUXHZhxZQaSe0SBs9kR+THQdsh47Ob0cZVQFUF/0+BnxvJT0S8Cxi
	43E=
X-Received: by 2002:a05:690c:6603:b0:81f:e85b:f9f4 with SMTP id 00721157ae682-85d6b8472ebmr126795317b3.27.1788282561098;
        Tue, 01 Sep 2026 10:09:21 -0700 (PDT)
Received: from worldpeace10.c.googlers.com.com (109.243.150.34.bc.googleusercontent.com. [34.150.243.109])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e65f146edsm79761867b3.32.2026.09.01.10.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:09:20 -0700 (PDT)
From: David Hu <dhu@x6u.co>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: alex@shazbot.org,
	ankita@nvidia.com,
	chriscli@google.com,
	david.laight.linux@gmail.com,
	dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	jmoroni@google.com,
	kevin.tian@intel.com,
	kpberry@google.com,
	leon@kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	nicolinc@nvidia.com,
	praan@google.com,
	sashiko-bot@kernel.org,
	stable@vger.kernel.org,
	viursachi@google.com,
	xuehaohu@google.com,
	Leon Romanovsky <leonro@nvidia.com>
Subject: [PATCH v8 2/2] dma-buf: Split sgl by largest page-aligned chunk
Date: Tue,  1 Sep 2026 17:08:49 +0000
Message-ID: <20260901170849.4052816-3-dhu@x6u.co>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
In-Reply-To: <20260901170849.4052816-1-dhu@x6u.co>
References: <20260901170849.4052816-1-dhu@x6u.co>
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
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
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
index 80f6ab2f4809..833be519e1e6 100644
--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -6,16 +6,17 @@
 #include <linux/dma-buf-mapping.h>
 #include <linux/dma-resv.h>
 #include <linux/overflow.h>
+#include <linux/align.h>
+
+#define MAX_SG_ENT_SZ ALIGN_DOWN(UINT_MAX, PAGE_SIZE)
 
 static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
 					 dma_addr_t addr)
 {
-	unsigned int len, nents;
-	unsigned int i;
+	size_t len;
 
-	nents = DIV_ROUND_UP(length, UINT_MAX);
-	for (i = 0; i < nents; i++) {
-		len = min_t(size_t, length, UINT_MAX);
+	while (length) {
+		len = min(length, MAX_SG_ENT_SZ);
 		length -= len;
 		/*
 		 * DMABUF abuses scatterlist to create a scatterlist
@@ -25,8 +26,10 @@ static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
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
 
@@ -42,7 +45,7 @@ static unsigned int calc_sg_nents(struct dma_iova_state *state,
 
 	if (!state || !dma_use_iova(state)) {
 		for (i = 0; i < nr_ranges; i++) {
-			unsigned int added = DIV_ROUND_UP(phys_vec[i].len, UINT_MAX);
+			unsigned int added = DIV_ROUND_UP(phys_vec[i].len, MAX_SG_ENT_SZ);
 
 			if (check_add_overflow(nents, added, &nents))
 				return 0;
@@ -53,7 +56,7 @@ static unsigned int calc_sg_nents(struct dma_iova_state *state,
 		 * for whole IOVA address space, but we need to make sure
 		 * that it fits sg->length, maybe we need more.
 		 */
-		nents = DIV_ROUND_UP(size, UINT_MAX);
+		nents = DIV_ROUND_UP(size, MAX_SG_ENT_SZ);
 	}
 
 	return nents;
-- 
2.55.0.897.gb25b4bd76c-goog

