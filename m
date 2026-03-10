Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0994042E01E
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132802; cv=none; b=XqpjeXHEsfnk6smhn1ii+IH455Kk57Tjy/nNDvuOuWA4J8VtrmnniUEEbRynEygl05/ASP7x633mUAuaVhEo/sgzeEKuiT/YjdcvX6GUwxU5CCAzBT0//RQP3I8vsdKGs/WqSBI8Bne0b3f+fQWiMOQVwhdOoeo4sM7mbije6WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132802; c=relaxed/simple;
	bh=Ls3uEmiMRoW8ba83sAqv7xQmcKvLyhiUZFpckfPFfz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XfXp2UYPgTCLdSjB/PZBJglscTikSXy/Vjx3IqXugh9P4W58MvyXyvdKSm9Y5KtenXkphas3Nlxc/ONlgJbgrx0429jr6Ci89hwG/KkeFfCPL/aMYEv5LWWJShINXG1Zk4/fq271ijNQp9Kg+l7+t/MeD57mPJlujiczTnJueN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bv/r3H18; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bv/r3H18"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C7DC2BC87;
	Tue, 10 Mar 2026 08:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773132801;
	bh=Ls3uEmiMRoW8ba83sAqv7xQmcKvLyhiUZFpckfPFfz0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Bv/r3H18pLal+VtpNQoVn3AgmHGQcDCzp3edTyBNOpDasg4r7YPSYTWn+ZPpuk/3e
	 9GqiDThQfHcwb+NnN/MbNmUDebp67dx+FSG9gRyKwGAzvTtUneS1B2k9zgVLo0AuMT
	 Ux2IH1yXgIp2rKLDdnJELZZ+MNpkyKFJdVJryXsTmwZ7IYaV9rLEyhX0NToe900Ioh
	 NY8GO5Kzk2gSlbLrgaFrgha8JFHnTzOLS14qvNALADwBauUrHZ/QtYBcvK40QRt1t+
	 FZ7fTgm9MkMZF5zKAjVIkhnFj718sziWdF3ObRnbaPdka1LSVps/0iRtKdVRVr2lvU
	 DX1FWQzLGZehA==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 09:53:12 +0100
Subject: [PATCH v2 2/2] dma-buf: heaps: Clear CMA highages using helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-cma-heap-clear-pages-v2-2-ecbbed3d7e6d@kernel.org>
References: <20260310-cma-heap-clear-pages-v2-0-ecbbed3d7e6d@kernel.org>
In-Reply-To: <20260310-cma-heap-clear-pages-v2-0-ecbbed3d7e6d@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Currently the CMA allocator clears highmem pages using
kmap()->clear_page()->kunmap(), but there is a helper
static inline in <linux/highmem.h> that does the same for
us so use clear_highpage() instead of open coding this.

Suggested-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma-buf/heaps/cma_heap.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index f0bacf25ed9d..92865786cfc9 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -329,10 +329,7 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 		struct page *page = cma_pages;
 
 		while (nr_clear_pages > 0) {
-			void *vaddr = kmap_local_page(page);
-
-			clear_page(vaddr);
-			kunmap_local(vaddr);
+			clear_highpage(page);
 			/*
 			 * Avoid wasting time zeroing memory if the process
 			 * has been killed by SIGKILL.

-- 
2.53.0

