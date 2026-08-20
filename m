Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7097236A37A;
	Thu, 20 Aug 2026 15:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238065; cv=none; b=iVty7s2RAd4M6X29QcPW2kwrPakOG/8ZksPQtRsm+O5G41ezt1lPIfMdPkS2u4IKTciu6ZmCKS5Y9aNxPI+YW5AJwx4PkzkMcmnjr3xuRj/sEVcb6bpNPBg7NaKqPCKoqJ7zRfOLhwH86bOjl3GzaRiFCz9RXLx4c8BNj1gI1zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238065; c=relaxed/simple;
	bh=H394JPwKh5ipjx6sMEgyDYJ0A1zAKvArd6u5QxFZBh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BgUhz65tvltfJSLs0kccoiTt0FrMXKzVPeXTZfDks0fT0vQnQdV/PLCr1ebXLSefHhkk189gGBrTejI3T6nffB7HMBbpBNM8KGnvZWGLTkEGfev7YsZujLz2+SznSXo5buU0TUkrysN1sD8t1S8q+eyk80rkbLyiNPbQ3rRCvKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ma6tz2BA; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ma6tz2BA"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED6E41BCA;
	Thu, 20 Aug 2026 08:00:58 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 398033F85F;
	Thu, 20 Aug 2026 08:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787238062; bh=H394JPwKh5ipjx6sMEgyDYJ0A1zAKvArd6u5QxFZBh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ma6tz2BAfOirAgwCL52wKz4U4JocafrPECKECXDxFMJVGrUtFe5TVjJLfoEHZwVcd
	 2fbXRiQgpsChx/8M8CZJMFewUOoA0XhabztzKG39rFilW8Vmyf9iV4DjIVxIsGzUbY
	 RUyxOno7+OBcAKqNj/Tlm8ov3angvrNIaVsDZHEs=
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
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v2 3/4] dma-buf: heaps: Zero system shared heap pages after conversion
Date: Thu, 20 Aug 2026 16:00:32 +0100
Message-ID: <20260820150034.88729-4-steven.price@arm.com>
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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

