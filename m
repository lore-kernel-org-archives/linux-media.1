Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532215;
	b=I4G82NHCGFLKytFDFiZCRwGnjfBsUGfdapGhNPAVpCC13Ez9CnY5Ln1tcub+arQoaxoH
	 U91+jF8jzzGJSx+dXhnX5OpVr8l97Iawwce6+9x8ChHsOyPuTd7v5HQGWrwalIQnDnz85
	 VNhOsBKyBsy17xzdy0JjLsMkU48DsnmOdW75q6M+vxUKoLwrakbfVXN8m4Y4pIYtHL27s
	 floErSVwBc+/gjBQ0rywiybl4ONn0s++tUKmDtmrRiiSKZDal/6arDVKj3O8ufn/SEB7f
	 fK+vaRdqLzV1empekS9k1V6VjfY3HcEAz5KUXu0oXixJiK+vFBvX+yfSNWDlet4gE3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532215;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6ljZQd+A8hlRvztSzlA4/q0WCsIDb1/JrAE0c3c4d8k=;
	b=ENkZQu+cfG9Y99W9A0MBOpbYYS2YYhdVYc/hBMZD+xZa+77uyQBqouKCBn+eh3VclJzL
	 5ixzXmPNON8QG26/5jqbpeMiBnI0EgBxIi2yARptLoGPscOiwS7khyF41FNEIKESa29LM
	 5+QaJreMhAfG0PiGbIYiHqLQCh2x56XR6CfFMTa8+dUuttMZT/eHksg+ZcjK2ZBqPBZwX
	 ysgh20rr7Y7+91sb7g/rLqxGEpz8SzlmNJzOZbmfY4QVGL7mP0xyRB+7JR7bGdQuL5gmS
	 UyZayS4/Ql9iiFmfrQQhn1l7rrVHnVt0eKfc9DTcprBEB/DJzBs8dL7LOZi3kDBYeAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SzPep4VP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6AF606A33D;
	Tue, 24 Nov 2026 14:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SzPep4VP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F3C1F00AD4;
	Tue, 24 Nov 2026 14:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795532215;
	bh=6ljZQd+A8hlRvztSzlA4/q0WCsIDb1/JrAE0c3c4d8k=;
	h=From:To:Cc:Subject:Date;
	b=SzPep4VPN8Sy0XElS+PRpLcSrLY94bccshHxN0x0U0IoOntw/c6kHDYYq32aQQM04
	 QF9Q8mgTGTslsQDXQZWfcR/oKmoXxTSXXG5thr6SKqwgGOYWQaX6Drc9xNqZZ7sdjZ
	 W8xywf85qO4XMdg5sY/Mcp0UrGXvDm8Eh8tWMoMPtwNBg5+ZMTkDTRpAwUssklgTqa
	 aci/67iepvEVnrgjMNe4ai2dHRktRczm1tWHTkjGsXWY49Bm0pr6pD+KKSXBuy0EQ2
	 oISVd1pCU3DSZiWHnl5Eg4tEvSJLYYOJGOsDAGKVUvgPiiS8qp/kruQQEXj8zuoHVo
	 KKzloYXbCO0Wg==
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-rpi-kernel@lists.infradead.org,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: semantic conflict between the drm-misc and broadcom trees
Date: Tue, 24 Nov 2026 09:56:52 -0500
Message-ID: <20261124145652.3657102-1-sashal@kernel.org>
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

Hi Mark,

The current drm-misc tree has a semantic conflict with the broadcom
tree that breaks the build:

  drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c:217:3: error: call to undeclared function 'dma_buf_unmap_attachment_unlocked'
  drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c:438:8: error: call to undeclared function 'dma_buf_map_attachment_unlocked'

77e0b2d2f4f3 ("treewide: Rename dma_buf_(un)map_attachment() to
dma_buf_(un)map_sgt()") in the drm-misc tree renames the functions, and
6e0a8f1a8347 ("platform/raspberrypi: Add VideoCore shared memory
support") in the broadcom tree adds a new user of the old names. It is
the only caller in next-20261123 that the rename doesn't cover.

The fix for the merge:

diff --git a/drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c b/drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c
--- a/drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c
+++ b/drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c
@@ -214,9 +214,8 @@ static void vc_sm_clean_up_dmabuf(struct vc_sm_buffer *buffer)
 {
 	/* Handle cleaning up imported dmabufs */
 	if (buffer->sgt) {
-		dma_buf_unmap_attachment_unlocked(buffer->attach,
-						  buffer->sgt,
-						  DMA_BIDIRECTIONAL);
+		dma_buf_unmap_sgt_unlocked(buffer->attach, buffer->sgt,
+					   DMA_BIDIRECTIONAL);
 		buffer->sgt = NULL;
 	}
 	if (buffer->attach) {
@@ -435,7 +434,7 @@ vc_sm_cma_import_dmabuf_internal(struct dma_buf *dma_buf,
 		goto error;
 	}

-	sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
+	sgt = dma_buf_map_sgt_unlocked(attach, DMA_BIDIRECTIONAL);
 	if (IS_ERR(sgt)) {
 		ret = PTR_ERR(sgt);
 		goto error;
@@ -550,8 +549,7 @@ vc_sm_cma_import_dmabuf_internal(struct dma_buf *dma_buf,
 		free_kernel_id(import.kernel_id);
 	kfree(buffer);
 	if (sgt)
-		dma_buf_unmap_attachment_unlocked(attach, sgt,
-						  DMA_BIDIRECTIONAL);
+		dma_buf_unmap_sgt_unlocked(attach, sgt, DMA_BIDIRECTIONAL);
 	if (attach)
 		dma_buf_detach(dma_buf, attach);
 	dma_buf_put(dma_buf);

-- 
Thanks,
Sasha
