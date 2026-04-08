Received: from 8.mo583.mail-out.ovh.net (8.mo583.mail-out.ovh.net [178.32.116.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F5A346E70
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 13:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.32.116.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775653552; cv=none; b=NEHfA8N2II/bHmkQNWg4hgob/djqlZvgM5uSisnSekxELF0jTodS4Q7TVLcpeTxxyViH6S427umVfSA33SNDhl9yFK0CWThg14sS8mP1lSwCzklQHVC2i/L0GCQZmqLZ2+39hwqwkXe6c5SH57xu7Y+ujiXWrYM9v4UCtLx50to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775653552; c=relaxed/simple;
	bh=T2ep69pEfKE5xHAslZZ3xSIyipbTysLJhfNfuI/3W9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YhDysFhCRa8n/DSnWIpSmJa0cmZVZi0EtXOYGc5vFzI72M+LOeLtdEJpvmUxPFxqJHtXnh5m+uXjY19201z6ULSQ65dYMfdaeu+zNu8dsakx1NjarMLO5wZ/FupV5nkuG5OiGe1MtEjK9a7QiZ9Ut7fQd99855ZC01VqF3o5khs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.32.116.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director5.ghost.mail-out.ovh.net (unknown [10.110.54.231])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4frN2s4W96z5yZK
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 12:40:53 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-mb8kg (unknown [10.110.113.134])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 923D91001F4;
	Wed,  8 Apr 2026 12:40:51 +0000 (UTC)
Received: from etezian.org ([37.59.142.111])
	by ghost-submission-7d8d68f679-mb8kg with ESMTPSA
	id xi9IBtNM1mmC/xcAWGcN2g
	(envelope-from <andi@etezian.org>); Wed, 08 Apr 2026 12:40:51 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-111S00502917d8b-fe65-4101-a4d9-a01200ae7c8c,
                    D209C671E6EFFA79B5C95F157C9E47DE85B2B2E2) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.82.31.9
From: Andi Shyti <andi.shyti@kernel.org>
To: christian.koenig@amd.com
Cc: janusz.krzysztofik@intel.com,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	sumit.semwal@linaro.org,
	Xiang Gao <gaoxiang17@xiaomi.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH] dma-buf: fix UAF in dma_buf_put() tracepoint
Date: Wed,  8 Apr 2026 14:39:16 +0200
Message-ID: <20260408123916.2604101-2-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260408123916.2604101-1-andi.shyti@kernel.org>
References: <68595b2ceed038074f5fe0a5739d75aafbcac8d3.camel@intel.com>
 <20260408123916.2604101-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 5536331319964046554
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFz5CK8pll4+m5rzR24T746LhjYj0+P7SPwAVsk3wZFnbp+RFDWAosALJb5nVkuVD1j5uaxE3Q2sgEtavEjgrNJlsQ6p+mnK8Qlhi0kzcJwEgnoUBVKWrsVVpQ7R/Y+9BwkJcgqgm25Q2u/F9PiAsMNwOCgi8TL/5WLXNpdsfoLSd1BWZKbZ9S7GFLaJeqB5t12xoDsqbrrHVeB2JRmOd716PcPxqa6FrDi+Nr4Lropz4Ey1GayttEWMbI7tmWXMHtER0h++jPXdEVXopxjePU8Ff0ssrpUzGvE6lfQumSM7er0ehIPkgcyj0Nzujs8ITbFvT+IaQ4L8GPlRPmrjDZBQrtJQhRdLy3zKcDevZ2XJaEKHNjIFnpXrKvzmAnimtm3eY5tUX2hl2e0RlZujJcYcHwdqYEHkvXPIuqyuxiPTAqUp3adCDzYM3Gy7qshEAIYur8uFJngi8puA4A1OBg8UBICzYxG2f//UMbqB+xrFTE3rLI3RVn3SaQ5dmc86/jRSSzOP/5+wIeQUe/dRnvlRws0Jce7EO9M7ar854ax5xofutvFlJGsxvmF1teW2yPjtaxd+F8UQAZ8PK199P9c7ApPWnZFSWW67tFEGROv5yg0xKvcm7uEK9qb2uG/f5SLqwuxWLv0GMS6Dn/c7AIeAJHxI4pLWp77DDr/ZSGKtg

dma_buf_put() may drop the final file reference via fput(), which
can free the dma-buf. The new tracepoint invocation was added
after fput(), and DMA_BUF_TRACE() dereferences dmabuf and takes
dmabuf->name_lock.

This leads to a use-after-free on the final put, visible for
example as a spinlock bad magic fault on a poisoned 0x6b6b6b...
lock.

Move the dma_buf_put tracepoint before fput().

Reported-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Fixes: 281a22631423 ("dma-buf: add some tracepoints to debug.")
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Xiang Gao <gaoxiang17@xiaomi.com>
Cc: Christian König <christian.koenig@amd.com>
---
Hi,

I believe this patch fixes the issue reported by Janusz, I haven't
tested it. Perhaps we can add some more checks in DMA_BUF_TRACE.

Thanks,
Andi

 drivers/dma-buf/dma-buf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index a202a308c079..b72932c57cb9 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -845,9 +845,8 @@ void dma_buf_put(struct dma_buf *dmabuf)
 	if (WARN_ON(!dmabuf || !dmabuf->file))
 		return;
 
-	fput(dmabuf->file);
-
 	DMA_BUF_TRACE(trace_dma_buf_put, dmabuf);
+	fput(dmabuf->file);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
 
-- 
2.53.0

