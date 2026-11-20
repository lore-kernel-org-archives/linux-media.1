Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.204
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795153381;
	b=VAjm8wSXDT2v6ZypHd6+64XeuvxkOudSRePoSLiCfXB1e3X5tIZjigvJvT13CiJ36dV6
	 dtETTTDlENgD+g4sZ6kvRl0JsgDPkhwvydA/NGbjFfwTR9zYBfQ1NfVoCjDKOGiSGowDa
	 6Ksfif9Hpukw4o3OI6auDdAAIO0x+yy81SD6Rqr4E2SPl3e6MIyWq7l19P/r/BPwaJGwL
	 UlV7YF4VQBkX9efE0wG6l0TI8BP9VFfesfMZMjYRqWQGzyynI7If3xGxp09sF2dnMLW3w
	 LpN43LZWMgHyhKcW681M82JJ1NgXEUf8shPfbHxAKiKSkVP86trRrZ9LzyhROE7GmzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153381;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=hEpOzMSWsqAZ4vmFyWKGhKlXAADp5QsHm5LpUYITr+0=;
	b=O9OWcDW+bBx3ePSAYH0Tp9ISXvZH5dVxI3PGLiyiAUtbOGuC4fBKOflhfsgGswe0vWyp
	 WTGcryPmOVmspf9bBF1gsbguGplo2EDh45kWsYch3ZSAYbQT7YOnFYCzLmEtxqRAC8NW6
	 rxZlNJZBYd3zUQICAkenTCutkEMixrghAzX5G+1ty8AIejDq+JWLsaGBrymM3tAsUJksX
	 mKrOXizQhAv7Yhk+IGzwJRpfC6+JuFVZ4QeLBBG+PMeCLRadZ57PMkGeSI4VdsoA6DADR
	 yNRz1cVSvtFUfrzzDKAVlGZKLiOk/YLikCG0hIWbRyiN/W1Ob7Es7czQW1vDW2Q1nEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HnwNyYEh;
	arc=none smtp.remote-ip=95.215.58.204
Received: from mta1.migadu.com (out-204.mta1.migadu.com [95.215.58.204])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFCA606A326
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 05:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EFCA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HnwNyYEh
X-Envelope-To: linux-media@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sygBjDYX2IBEsh5RgXxZv4L/2uT7TB2ul0lFCsAHpAY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795153377; v=1; x=1795758177;
 b=HnwNyYEhKKOlUdgeUYJUJL4JYe667WQ34/ki58BF47Qx6FMrzuJzi/koQHY+tSl9fG6h2AKC
 4jhvrHpMYNsO34J5V4AC+PVlfXiIS59hS21wgPH1wAZWjsXy+y5kxYSZhry1uDm3q+d6qSAuMmG
 rq2jRXrp8iKbnNfr5iXFW5/A=
X-Envelope-To: linux-media@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5caa3697f8970349;
	Fri, 20 Nov 2026 05:42:57 +0000
X-Mizu-Trace-ID: 5caa3697f8970349
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Albert Esteve <aesteve@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Philipp Stanner <phasta@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-mm@kvack.org,
	akpm@linux-foundation.org,
	cuitao@kylinos.cn
Subject: [PATCH v2] dma-buf/udmabuf: account the page array metadata to memcg
Date: Fri, 20 Nov 2026 13:42:41 +0800
Message-ID: <20261120054241.525109-1-cui.tao@linux.dev>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Cui <cuitao@kylinos.cn>

udmabuf pins the pages of a memfd and hands them out as a dma-buf.  The
data pages keep the accounting of the memfd they were instantiated in,
but the bookkeeping around them does not: the page pointer array and
the pinned_folios array, both sized by the buffer page count, plus the
transient folios array sized by the memfd folio count, are plain
GFP_KERNEL.  A 1GB buffer costs about 4MB of uncharged SUnreclaim
memory, and size_limit_mb defaults to INT_MAX.

Charge the three kvmalloc allocations so the creator pays for the
metadata it induces.  The data pages stay with the memfd they were
instantiated in, including hugetlb memfds, which remain uncharged.

The system heap in the same subsystem accounts its buffer allocation
only when the mem_accounting module param is set; Android runs with it
off because heap buffers change ownership mid lifetime, and explicit
charge transfer for dma-buf memory is being worked on.  The metadata
here is charged to the creator directly, which sidesteps the transfer
problem for a resource that does keep a single owner: the memfd.

Reviewed-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
Changes in v2:
- commit message: note that the system heap accounting is gated by the
  mem_accounting module param, which Android keeps off, and that
  hugetlb memfds stay uncharged.  No functional change.
Link to v1: https://lore.kernel.org/r/20261106131829.3228926-3-cui.tao@linux.dev

 drivers/dma-buf/udmabuf.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index df6dd0046242..40182c82df6b 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -190,11 +190,12 @@ static void unpin_all_folios(struct udmabuf *ubuf)
 
 static __always_inline int init_udmabuf(struct udmabuf *ubuf, pgoff_t pgcnt)
 {
-	ubuf->pages = kvmalloc_objs(*ubuf->pages, pgcnt);
+	ubuf->pages = kvmalloc_objs(*ubuf->pages, pgcnt, GFP_KERNEL_ACCOUNT);
 	if (!ubuf->pages)
 		return -ENOMEM;
 
-	ubuf->pinned_folios = kvmalloc_objs(*ubuf->pinned_folios, pgcnt);
+	ubuf->pinned_folios = kvmalloc_objs(*ubuf->pinned_folios, pgcnt,
+					    GFP_KERNEL_ACCOUNT);
 	if (!ubuf->pinned_folios)
 		return -ENOMEM;
 
@@ -387,7 +388,7 @@ static long udmabuf_create(struct miscdevice *device,
 	if (ret)
 		goto err;
 
-	folios = kvmalloc_objs(*folios, max_nr_folios);
+	folios = kvmalloc_objs(*folios, max_nr_folios, GFP_KERNEL_ACCOUNT);
 	if (!folios) {
 		ret = -ENOMEM;
 		goto err;
-- 
2.43.0

