Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE6A369206;
	Thu, 20 Aug 2026 15:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238060; cv=none; b=Jv0G7x6d+XtYS2TUmUedlriXRslbMxxwnzddRWwGql9j31EzMxSL051VTnXPgCXMN7RPSSiFjbIrs7s2w7VcxOEIdZ0Hw6LaMVkOqLdj265cUKmcIW3jfwx4UhLypAtZ5SqRXVSukTHt5FltgUPpy8zZ7fwoNRMRn4Xsqs9CRjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238060; c=relaxed/simple;
	bh=yiXHLW2hxd28E7satGbfCpdtNX7Djkd4B3UsK9jXuSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QRlIZSrGz34me/zxw1QI2noK6GYl84K/iieZl9c9/NEWb1v5R0bPe389uDQ5GxxclFO+28lzeYTKpAS3SGMnSuN0XmlsGk6j7EBJ4FV8eRKdbph/aBlw5Xzqk9Q8snArn1Bq9RadwYl4acphyHB4IVUpc+/JOoo+LdzBXJmEv6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=X0e4gMfP; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="X0e4gMfP"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D630D1BCA;
	Thu, 20 Aug 2026 08:00:50 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD05F3F85F;
	Thu, 20 Aug 2026 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787238054; bh=yiXHLW2hxd28E7satGbfCpdtNX7Djkd4B3UsK9jXuSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X0e4gMfPovvYXck0tTBhHOmJLMstfkUnCnNqiDzYXhSNYcwY3Gug1gjBOr+tjVOJv
	 mxdYYezRnNcKpvJ/DWTDz21EfzV8KUWJN31ZLfCD+LL0EPFY8ZNo1S97Loms+GN+E3
	 eACpp3CmwR4hNNEJB02ekqu0uQWJK7SBhVMqUZxM=
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
Subject: [PATCH v2 1/4] irqchip/gic-v3-its: Zero shared pages after conversion
Date: Thu, 20 Aug 2026 16:00:30 +0100
Message-ID: <20260820150034.88729-2-steven.price@arm.com>
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

its_alloc_pages_node() passes __GFP_ZERO to the page allocator before
calling set_memory_decrypted(). This assumes that converting a page from
private to shared preserves its contents.

For Arm CCA with MEC (Memory Encryption Contexts) the key used to access
the page will change, and so by default the visible data will change.
The host could ensure that it zeros the page, but rather than relying on
the host's behaviour it's best if the guest simply zeros after the
decryption rather than before. Specifically in this case the ITS tables
are required to be zeroed.

Mask out __GFP_ZERO from the allocation request, and do the zeroing as a
separate step after decryption.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Fixes: b08e2f42e86b ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 6f5811aae59c..a055837832bc 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -213,16 +213,18 @@ static gfp_t gfp_flags_quirk;
 static struct page *its_alloc_pages_node(int node, gfp_t gfp,
 					 unsigned int order)
 {
+	bool want_zero = gfp & __GFP_ZERO;
 	struct page *page;
 	int ret = 0;
 
-	page = alloc_pages_node(node, gfp | gfp_flags_quirk, order);
+	page = alloc_pages_node(node, (gfp & ~__GFP_ZERO) | gfp_flags_quirk,
+				order);
 
 	if (!page)
 		return NULL;
 
 	ret = set_memory_decrypted((unsigned long)page_address(page),
-				   1 << order);
+				   BIT(order));
 	/*
 	 * If set_memory_decrypted() fails then we don't know what state the
 	 * page is in, so we can't free it. Instead we leak it.
@@ -231,6 +233,9 @@ static struct page *its_alloc_pages_node(int node, gfp_t gfp,
 	if (ret)
 		return NULL;
 
+	if (want_zero)
+		clear_pages(page_address(page), BIT(order));
+
 	return page;
 }
 
-- 
2.43.0

