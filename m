Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930873;
	b=tbotgZP9T2ezFrzilTMAoCpMPkLaX95uE7WXqo1XeAB8OFAarQEGfAYdCHK7ViSAW9/H
	 ds6VxC7co54DqBRHT1HGSVSoQpz88gVAGZL07bXd7qlgLaw59SUHgyfe68k0/gS3XGk2U
	 km22OYQZavK9akDSucY7pJOlYqbaIu6J0gjVRwKvtuuxsBTJlJ23K/KKgzxorWbHOSmBU
	 TfOCXNNKyCCtT3/YPKU2cmBWoJVYkAkie3BodOsjc89oRH2mdTcD3sAWiPKf6iM/JwI7A
	 m68F6bG54ZRfSB+5OdMUILWmIQ3vtqwxiPzqoQSq6y4hIKM8XTI8MNieFpq+ltUwvhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=+exUxtgPdVBwoKR5r/DiwCvHxmnKqLuiNXXsjqjObOo=;
	b=uiut+gRrDO4wfiHkMgfN1YcUJraR2osjensGP0cuvh8SK/8paUUYYbVnNydJvmcHAQze
	 VdFwglOGwpHzCoiIkKfPH8XgnpQzXzsHzj+EN8oRz5nLBogciQ9FW7SzsSIbuiifU9rW1
	 pgl1073AaKbjgC3jye0tUFBgQCLu8s8QF87wrVGdTWgOLVJUcd48n3fhzR71ZDpRQKzrV
	 YATlMAH/4GiNoNucrgHoy4T1NzxsHYJTukIPW4t0mjxtdrYURjxRBslZI5lF2gI1OjEFD
	 QVHVCj/5o8OLosTDfM7nQjyYBT8j68cI5vRYpRDezwBcP+9PQae6xyk6nWoShvaygVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--eagleshaw.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Kw232SXE;
	arc=none smtp.remote-ip=209.85.219.70
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9D4606A32C
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 15:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E9D4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--eagleshaw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Kw232SXE
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91f2b496430so111043836d6.3
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 07:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794930872; x=1795535672; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+exUxtgPdVBwoKR5r/DiwCvHxmnKqLuiNXXsjqjObOo=;
        b=Kw232SXEqQB/sRXu4G798/Ok4AHHylVlXdQ8W3R7eXXCzcexSel+ae5s/iW+fOcpYU
         Ncgi9Pw0b4rtqhulcadpOfz3RT0ECGQfW7lfE1RJiQ3w9ujU9y+0KdoHOOfLKI9ecR7o
         yCwzZsOGpG04AX7/HSOZYeVT8HUD7aI/Xm6jhak/He6AwIMR2qZcYup6xBbTevEFmCxo
         YOYZvgcFbu7JXUdM483nOp9FBGnIjuJrf8EyRTE5Vqr/B2g9Q63z6GG7rZQQ3ALmO0Ga
         koa9EKamvpTef7pKzb3bVc1PHOgsyh0EGGAl2HLKZZ9gTNrTqTWKYqTfpV4AcQBwO0If
         U/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930872; x=1795535672;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+exUxtgPdVBwoKR5r/DiwCvHxmnKqLuiNXXsjqjObOo=;
        b=xD4rBccCP91FkD4Z+3s2RHQ3/DhCBry0oqa60FOFFMSCXDul70ypi4CcE22ac56u8t
         isgZvq7oPbg0xoU70xvfMz1RfQqoK6LPcf7kgahnV9RM9oeR9JeFHBR1GzoQDeMMIx7d
         MbhmTFaRF57lB6Fcsa+VQY2zx7s0vgkFN8qwP4EQv7EYejUc16AdxXH975QCqSoSwZDA
         PYDZ+aLHclxgN7emgNeKcoz858Hs4n9srAQ+/szeS++koEy5qZgq8KnykZB9ZkKH/woj
         FBaU3JMFKO9MYmMBvf2fj/pI30CKtHNRkhIGFpXwzw33rh3jwBd64TjU/4CLLfUaDk1o
         PsMg==
X-Forwarded-Encrypted: i=1; AL+hErHtIrILTcrcrP8nAlHh/bRTkojaFEekJ4ioPbx42NayHue4E1JO9PI1nAGc9Kc7RNF45tsRH6swRYeI5w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/4cGIN5nbEBORV3WMk3s6s+sgW6V0AUOUnqCnfBSvwuDJVyJ8s
	7wXyVLWNEdMHyBjlG4vIO6csxovouSeAV6l6SSljb1jKYkIhiOVOYAafSVu9Z0iPU1fXEYjuzlN
	m9Mp96Df966itlq2CRA==
X-Received: from qvbpe4.prod.google.com ([2002:a05:6214:4944:b0:91f:2759:c36b])
 (user=eagleshaw job=prod-delivery.src-stubby-dispatcher) by
 2002:ad4:5cec:0:b0:91f:2abb:a791 with SMTP id 6a1803df08f44-91f2abbad25mr212446406d6.20.1794930871987;
 Tue, 17 Nov 2026 07:54:31 -0800 (PST)
Date: Tue, 17 Nov 2026 15:54:31 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117155431.1654298-1-eagleshaw@google.com>
Subject: [PATCH] dma-buf: heaps: system: zero pages after set_memory_decrypted()
From: Ying Xiao <eagleshaw@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, "T . J . Mercier" <tjmercier@google.com>, 
	Jiri Pirko <jiri@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Philipp Stanner <phasta@kernel.org>, 
	Jacob Moroni <jmoroni@google.com>, Xuehao Hu <xuehaohu@google.com>, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	Ying Xiao <eagleshaw@google.com>
Content-Type: text/plain; charset="UTF-8"

system_heap_allocate() allocates pages via order_flags[] with __GFP_ZERO
while the direct map still has the memory encryption bit set. For the
system_cc_shared heap, set_memory_decrypted() subsequently clears the
encryption bit without re-zeroing, leaving ciphertext in DRAM on
confidential computing (CoCo) guests instead of plaintext zeros.

Skip __GFP_ZERO during alloc_pages() for cc_shared allocations, and zero
the pages once in system_heap_set_page_decrypted() after
set_memory_decrypted() succeeds.

Fixes: 78b30c50a7ac ("dma-buf: heaps: system: add system_cc_shared heap for explicitly shared memory")
Reviewed-by: Jacob Moroni <jmoroni@google.com>
Signed-off-by: Ying Xiao <eagleshaw@google.com>
---
 drivers/dma-buf/heaps/system_heap.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index c8959eadc71d..5f98d0df11e7 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -72,11 +72,19 @@ static int system_heap_set_page_decrypted(struct page *page)
 	int ret;
 
 	ret = set_memory_decrypted(addr, nr_pages);
-	if (ret)
+	if (ret) {
 		pr_warn_ratelimited("dma-buf system heap: failed to decrypt page at %p\n",
 				    page_address(page));
+		return ret;
+	}
 
-	return ret;
+	/*
+	 * Clearing the encryption bit does not clear DRAM, leaving ciphertext
+	 * from when the page was encrypted. Zero it now that it is decrypted.
+	 */
+	memset((void *)addr, 0, (size_t)nr_pages << PAGE_SHIFT);
+
+	return 0;
 }
 
 static int system_heap_set_page_encrypted(struct page *page)
@@ -376,7 +384,8 @@ static const struct dma_buf_ops system_heap_buf_ops = {
 };
 
 static struct page *alloc_largest_available(unsigned long size,
-					    unsigned int max_order)
+					    unsigned int max_order,
+					    bool cc_shared)
 {
 	struct page *page;
 	int i;
@@ -388,6 +397,12 @@ static struct page *alloc_largest_available(unsigned long size,
 		if (max_order < orders[i])
 			continue;
 		flags = order_flags[i];
+		/*
+		 * Zeroing while encrypted is wasted since decryption leaves
+		 * ciphertext; system_heap_set_page_decrypted() zeroes instead.
+		 */
+		if (cc_shared)
+			flags &= ~__GFP_ZERO;
 		if (mem_accounting)
 			flags |= __GFP_ACCOUNT;
 		page = alloc_pages(flags, orders[i]);
@@ -438,7 +453,8 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 			goto free_buffer;
 		}
 
-		page = alloc_largest_available(size_remaining, max_order);
+		page = alloc_largest_available(size_remaining, max_order,
+					       cc_shared_buffer(buffer));
 		if (!page)
 			goto free_buffer;
 
-- 
2.56.0.679.gc527c65306-goog

