Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05398417D9B;
	Thu, 20 Aug 2026 10:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787223059; cv=none; b=d2zW4US5PgEiPkTycOziTdI8Dlwvu4giw9/20rJ3wSpmAPhFNKobNLn0eiBojkrzz3vMxjLxfwJm7wlIhOAlukr8AIqcZtcXSWzapApY/Mm91IdyEW3K6DvQFHuOxvLriRNP7+iyl8xo/e90yWu3sry4dVZTeFE9CzjZ4y7kmqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787223059; c=relaxed/simple;
	bh=hOdOjYlA+iI1ah2K1oi47SLi3OkvE+2GFQdWf32mYks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=umq4iRcwLmwmAnmm4r5BPO+9XzTPpon2+WRZgggkflwHtT/yhoBTLzxyzDh0lghwN2aSajl5hUH5sFFbbyxflQKYfM8IfqhH1pPf4e1qteViWvUwvpl5dhytvXn89mRL+9wS1Qcqz1A1rg8vA/YwqD2RSTV0HoDvbCYQR4KkFXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=sb9jepZy; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="sb9jepZy"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BED0153B;
	Thu, 20 Aug 2026 03:50:53 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2E963F66F;
	Thu, 20 Aug 2026 03:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787223057; bh=hOdOjYlA+iI1ah2K1oi47SLi3OkvE+2GFQdWf32mYks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sb9jepZyTzEBEx3PSvl7y2pZ9slsxHg0OsepC2gx/KBftfiVWC/rgugZBJ0dKfHb8
	 01cdi9VtjSIGkOoLhQk05JrfNDl2ywnlJXC5RRdMOvn2T8QUX9mR8RbfL1qELEepL4
	 d58f5eXCxif2CMnxSb2Rbv+YMgBhJNPUMkTja3VA=
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
Subject: [PATCH 2/2] dma-buf: heaps: Zero system shared heap pages after conversion
Date: Thu, 20 Aug 2026 11:50:25 +0100
Message-ID: <20260820105026.53208-3-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820105026.53208-1-steven.price@arm.com>
References: <20260820105026.53208-1-steven.price@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The system_cc_shared heap allocates pages with __GFP_ZERO before converting
them from private to shared with set_memory_decrypted(). This assumes that
the conversion preserves the contents of the pages.

For Arm CCA with MEC (Memory Encryption Contexts) the key used to access
the page will change, and so by default the visible data will change.
The host could ensure that it zeros the page after decryption, but
rather than relying on the host's behaviour it's best if the guest
simply zeros after the decryption rather than before.

For CC shared buffers, defer zeroing until each page has been converted
successfully. For other buffers keep the existing behaviour.

Fixes: 78b30c50a7ac ("dma-buf: heaps: system: add system_cc_shared heap for explicitly shared memory")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/dma-buf/heaps/system_heap.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index c8959eadc71d..f14930904089 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -376,7 +376,8 @@ static const struct dma_buf_ops system_heap_buf_ops = {
 };
 
 static struct page *alloc_largest_available(unsigned long size,
-					    unsigned int max_order)
+					    unsigned int max_order,
+					    bool defer_zero)
 {
 	struct page *page;
 	int i;
@@ -388,6 +389,9 @@ static struct page *alloc_largest_available(unsigned long size,
 		if (max_order < orders[i])
 			continue;
 		flags = order_flags[i];
+		/* Decryption can change the contents, so clear it afterwards. */
+		if (defer_zero)
+			flags &= ~__GFP_ZERO;
 		if (mem_accounting)
 			flags |= __GFP_ACCOUNT;
 		page = alloc_pages(flags, orders[i]);
@@ -438,7 +442,8 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 			goto free_buffer;
 		}
 
-		page = alloc_largest_available(size_remaining, max_order);
+		page = alloc_largest_available(size_remaining, max_order,
+					       cc_shared_buffer(buffer));
 		if (!page)
 			goto free_buffer;
 
@@ -461,9 +466,12 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 
 	if (cc_shared_buffer(buffer)) {
 		for_each_sgtable_sg(table, sg, i) {
-			ret = system_heap_set_page_decrypted(sg_page(sg));
+			page = sg_page(sg);
+			ret = system_heap_set_page_decrypted(page);
 			if (ret)
 				goto free_pages;
+
+			clear_pages(page_address(page), 1 << compound_order(page));
 		}
 	}
 
-- 
2.43.0

