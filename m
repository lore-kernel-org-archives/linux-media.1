Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BCFB36A37A;
	Thu, 20 Aug 2026 15:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238071; cv=none; b=EuHtK8vFwXYSql8SWMrjrRMY9NHPFQmfmP0i3oi1doSlRcOX5pVwCMIFzYuSupQygNnQf6tKm4d689fmTHFB8gCkCGScKTfy9+GhwyqTqC1fljxhLZXrFiCS/8htNJ65A89+ar5475IETjPuriseQeExIXsNahCnQRBzc5bRj7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238071; c=relaxed/simple;
	bh=Adowm8TaRmLb4+nhfuTq8XG6Qz8i8b31EokqJq1SBFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kgFb81rK9+r7JtwzL/q0MTtoBAoBDaIhYAtEDgBa3joAJprc+xp03th7U8UttZqJbuiySX5lPq/lAqRnzHE40/U8vaiTk/jMNtncZhUfSbbuOe30uWEUop+OY921e+jNRtS+wErTJZK12e0fQ55Hzkr7tYf3BN1m7J7akm4i9Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AnIbFs3q; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AnIbFs3q"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BB04153B;
	Thu, 20 Aug 2026 08:01:03 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50FF43F85F;
	Thu, 20 Aug 2026 08:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787238067; bh=Adowm8TaRmLb4+nhfuTq8XG6Qz8i8b31EokqJq1SBFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AnIbFs3qOe6tXAa76/75xbIi30a6sclahiGuKAa7TNyNiW5Z+k4gQ8FETu4UTPSKO
	 8Juo5IUGdb+gncLLrOLJBF1w9IYh74/rR/FXRuJR7tsoW1Se2JDZh0t2glua/wxv1v
	 ZHr2qdGjJiBb9RZp3FHVr1rdzV1QZD3j0HcXo/HU=
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
Subject: [PATCH v2 4/4] dma-buf: heaps: Fix shared system heap allocation rollback
Date: Thu, 20 Aug 2026 16:00:33 +0100
Message-ID: <20260820150034.88729-5-steven.price@arm.com>
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

If converting one of the allocated pages to shared memory fails, the
cleanup path attempts to convert every page back to private memory.
Pages after the failed page have not been converted yet, so attempting
to convert them back can fail and cause otherwise reusable memory to be
leaked.

Count the pages converted successfully and only convert those and the
failed allocation back during cleanup. If converting the failed
allocation back succeeds it can be freed safely; otherwise it is leaked
because its state is unknown. Allocations that were not converted can be
freed directly.

Fixes: 78b30c50a7ac ("dma-buf: heaps: system: add system_cc_shared heap for explicitly shared memory")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/dma-buf/heaps/system_heap.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index f14930904089..8d3ffeb64e00 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -418,6 +418,7 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	struct scatterlist *sg;
 	struct list_head pages;
 	struct page *page, *tmp_page;
+	int nr_decrypted = 0;
 	int i, ret = -ENOMEM;
 
 	buffer = kzalloc_obj(*buffer);
@@ -472,6 +473,7 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 				goto free_pages;
 
 			clear_pages(page_address(page), 1 << compound_order(page));
+			nr_decrypted++;
 		}
 	}
 
@@ -496,9 +498,11 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 		 * Intentionally leak pages that cannot be re-encrypted
 		 * to prevent shared memory from being reused.
 		 */
-		if (cc_shared_buffer(buffer) &&
-		    system_heap_set_page_encrypted(p))
-			continue;
+		if (cc_shared_buffer(buffer)) {
+			if (i <= nr_decrypted &&
+			    system_heap_set_page_encrypted(p))
+				continue;
+		}
 		__free_pages(p, compound_order(p));
 	}
 	sg_free_table(table);
-- 
2.43.0

