Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF27418345;
	Thu, 20 Aug 2026 10:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787223059; cv=none; b=lVdIwsF4oWbIpVEoLP3V1fp1sC3ky5MiLeOJAeSfHbilrn6UkmGqCngE34QTvCkVhJw0ntyrIamoNQDQ3Xpatx+UFoIrtkvGQ3SlBKRPf/MkwAbnTeEzqjMdE78MSkECOV0gUgLOzH6doxZo9oF5B18pyFrHYUvo5GkMJqlwXjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787223059; c=relaxed/simple;
	bh=NNzpHX/+mcqN6PkciZSU1ANfzwjeDq5G33MuimdG0sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pd0QfEUMOr1QlViULm79Py4yhL81UZKCM5fwih7h1HclaJNgE+a2X0OwKdIetmskSG8NMpktlf4zZmxAKkquxJRwFDSPdYvKxcMpjBMFWEjixRK2B7i431ww2XltZdpH8jCYjeJQ1l5RjOBYCSvdDNF1UXwu6Rj7uTxFIgB4pFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=W4kE0KL6; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="W4kE0KL6"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9ED321CDD;
	Thu, 20 Aug 2026 03:50:49 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C18063F66F;
	Thu, 20 Aug 2026 03:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787223053; bh=NNzpHX/+mcqN6PkciZSU1ANfzwjeDq5G33MuimdG0sw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W4kE0KL6dNp7OqTRKjIPeZLCk+ii0EBnVG/XxDg0MD3rO7EF/L9D3wU3qboJsdbUS
	 hheGHwUmyv0wPqNomhF2R63ZFm3H+6Jf70rLU7PG0rKvIRRdZoGQ6/9nse4YwFZOgg
	 CciKo6BqLRnmeklVuYxQdzga3B9VQiqUm3w7LMw8=
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
Subject: [PATCH 1/2] irqchip/gic-v3-its: Zero shared pages after conversion
Date: Thu, 20 Aug 2026 11:50:24 +0100
Message-ID: <20260820105026.53208-2-steven.price@arm.com>
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

Fixes: b08e2f42e86b ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 6f5811aae59c..c954bbe9f4db 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -213,10 +213,12 @@ static gfp_t gfp_flags_quirk;
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
@@ -231,6 +233,9 @@ static struct page *its_alloc_pages_node(int node, gfp_t gfp,
 	if (ret)
 		return NULL;
 
+	if (want_zero)
+		clear_pages(page_address(page), 1 << order);
+
 	return page;
 }
 
-- 
2.43.0

