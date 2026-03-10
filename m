Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0B3438FF9
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132798; cv=none; b=KufTN/qsIJ2RoG3GAFRptwG8eNvzclL8hdbM34Mdx7huUW04DnakZxENqPB/20nqz66OQ/PiHDJUs5xwYtKMCxSXjDKPMACuWb4L68y+ZJXIXEWMfDfpGpx7TV/vM6/tL4FmoYCvHTgCPTkly/oDWeoecGYAdcOSxaoiNyMoC9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132798; c=relaxed/simple;
	bh=79cV/JB6Zd90pNMWKP3NtKHRH1pVizulvRVpEWnwiw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n/Q5r8JrgG7Lz7PButFKVFgdoIZngJ/YgXEjGeNpD4cXY4P2VHfaAlGRU/Y4t9rcXJHYd8jvU4gQXdv2KW4LMeLhWkP6mbxjek59CzjMDb5lkAsta7ISBUlC1g32W+K3iZCAkGSLLdeoWtQJd7ijBLcwIkgPt4MjBe16yEH05Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBz3fBCf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBz3fBCf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771DDC2BC86;
	Tue, 10 Mar 2026 08:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773132798;
	bh=79cV/JB6Zd90pNMWKP3NtKHRH1pVizulvRVpEWnwiw8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YBz3fBCfWY5AuQ9JJ3fdy4ChYCta8JCJbDm0ACVmQJPwGdgDfonDHM0esw92TQ50Y
	 rSb42pG8INyI+DWIq+i98qGvxotT/PBR52MmZUum+DObqJwiWO7e0n3iS1cJXzhc+8
	 A1BOd4hdrlkzZ+L6LlnSbzjHTrihsTH+2JuvgbwxOQvLPTR/ULqbhW38qEnetklzON
	 521Hwco+GzkS72S0q+HFC+JgsySttzjiSozpmxv3am958hAqfa2dH3M8X4yINGvZfu
	 Ftd4mckHZk4O4p01h89jTnJI3HSTlCXLuk95BmaVwylElaC8qzEFeWSpjaP1jakVS7
	 1lXz5OkCeudOw==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 09:53:11 +0100
Subject: [PATCH v2 1/2] dma-buf: heaps: Clear CMA pages with clear_pages()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-cma-heap-clear-pages-v2-1-ecbbed3d7e6d@kernel.org>
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

As of commit 62a9f5a85b98
"mm: introduce clear_pages() and clear_user_pages()" we can
clear a range of pages with a potentially assembly-optimized
call.

Instead of using a memset, use this helper to clear the whole
range of pages from the CMA allocation.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma-buf/heaps/cma_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index bd3370b9a3f6..f0bacf25ed9d 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -343,7 +343,7 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 			nr_clear_pages--;
 		}
 	} else {
-		memset(page_address(cma_pages), 0, size);
+		clear_pages(page_address(cma_pages), pagecount);
 	}
 
 	buffer->pages = kmalloc_objs(*buffer->pages, pagecount);

-- 
2.53.0

