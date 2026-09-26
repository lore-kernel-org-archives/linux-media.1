Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA52D377541
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 07:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790406792; cv=none; b=iCqOugNgm2NEMkz9sBRmj9cG0hGX7HfWLOGaaFUykixnItrLAqSlXGNmxp/4nGRAS5uucK73MMegV+m6Ng0V/mRdfIVMPLEKNjutMPQNlc4jv5MLGHN+zQWJl0Y9NGhGgXb72L/zWU4toWhFGEUnrJFokDYJE4TTpgdCbkGCWHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790406792; c=relaxed/simple;
	bh=HU4uZGxFsozjvnvwADb4B8f2sx4GI5SwrBsDFGLDqU0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cqcBEW/Wv3Uj3BeHfmWrry4oIp05+fEPgC3KKhJ3yZIzHVtMMsMvd6SkuWilFHOUubbLwRrw6me63ppzT55Sqan0z/dmaekDnsGVSxAZDdBgoU49O6j7oLw1jxZ1XWu/KBm2aoOblIrt1wG6CjdvyN0kKCphHQpd7A3AtFtvT18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdVCKrz4; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdVCKrz4"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48881a62e09so695141f8f.2
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 00:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790406785; x=1791011585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rY5HCiFtt5IzvJR7OZXNoiF5Qm5UV5uB0Zymmp5HUaY=;
        b=XdVCKrz4LtqvgbczWIW29vbnaNyN8DFhFUymwnKKxrsm6MYx1LwlKny+HQvr8q3Rwt
         88IXPrfZ4DQsnRdxYzd7tQMKG5FRG86co9hitBCfvpC1DhbI13ZrfjPdlfEOzRtnY1aP
         tnv3FH/NNqsWbVDDoNkYI0PiWb4fkGQLRk5ynFAPJPPfOSXaP+Oi/7FOap37U4ytx+RY
         vqcgcYlSRyakjiD+Zu3LV5yIatWT+/Lon1kD6eQUnIIT8b3MVHDiHe+/VKmVTaFPvbbH
         wHHQ2t0pGImXGZkAGQ4ya3lyeaa/vnqcqsNUaE1Xb3z+FH8YkJx6TMiJy2niwhIB631E
         LT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790406785; x=1791011585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rY5HCiFtt5IzvJR7OZXNoiF5Qm5UV5uB0Zymmp5HUaY=;
        b=sJwf7ZdgRWThomeDUiRF9u+7WLj/h3AKYyHEYtyxyvun3HvM44AbY5kxDQim+v2/AN
         I7C2FhfZ7e1YTYgd8LuekrgQfs7vJuNBPPmc40akTtSbPzfNY2Y2aruidMDeNWIL3Y0q
         Q/vPqnSI5wNCW6VVKnRGuMLRtd/WQjU1xQRwNr81IIrLo4N0nQW34OlsPF7zrrskGP2j
         S5WzqluW53tfaF4J5lyOPTl86ZaBq3aZ9m2PyZi98gz8nJzLXA7lsTtfqz4RY7O4YnH1
         pGSlu+PeiLxmy2xYhGr4wk77ZUgI3W6bYKtZ9Uk5wk5ZiEX5hdXx5zMyQTwJ+5M/ZiaK
         jMLA==
X-Forwarded-Encrypted: i=1; AKwUvByj/tOxI7YZSm44AHB+b6ycPoDCuMmGbypqQMjcG3UmR1x2c3VDzNertALUOTxynZdGqlFgETaQn1q9qQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lA6xmxqkUA6l4x6dV2qgOXk6F81PAuqOMW7YiWIqjTai8/+FJJ
	RUPR26TjKvtzZo86X1Qs5iGXhOpW5Q9Y0ecOmMrDBwHPhGCHw7zZSYye
X-Gm-Gg: AYBFou3mTcQGWreLqRAZxaTfETK/R8PqiEFL1GldUANs1SDsJ5Xlv55HITU9Z0UJutI
	zlZnCw9AzO3pPYVSoSixE5s6cjeRHhccP92F6QdAkrjVf2ex+I2abx+H9MByc14oOKbYFbHjHT9
	tsTatFNhaJtwriEDDhD11Y1DzjcoKPHeaFe/aJ5vzH5wbHL4lhRIsJDJcPMyzRuaKM1Q5CSeTso
	7+hw7aaXOJF76JGcpwX3WdOQSoe+3DoP4BRJQt4ha+xGMkqM5KTAYKS3BjiKErdfO0E6BvucjVL
	V6OtKQ2DfQD8qHPLD+/dpHOO3lZmyl4uzicGiHmbZ36KY3TXfMuPtjymxSNxjR1cgAlFTzX/FS/
	foj4JU4aLx0sZVqSqdNWpLslcCC4DL1LmnPPmSpDSsBY0yhdotlwjo3J5zxTGXxzEujUG+bTYfF
	j0VYHN4wYCiuVP02Lx+Vq+kPXLLCbyEaQHiZfgrdoJy9Ti+6A/CDQuA4qhHR6cDJRfpscoioY3n
	r0cBeiGyAb4hZYKTBAGDAhkelOEGWlyH/KfMwwgKBAmRGHboeXYJhqe0TKMIK1OJIwTVRBY99/X
	0nApLTuFE79zmiP2TQJNq2zDosSQr5dL3cJbDWgHYprlcxigfAHzcKUaZ5ospycM5bonUtGWzX3
	DNnskg4gawItgvcVd1A==
X-Received: by 2002:a05:6000:2583:b0:485:8ee0:dfc8 with SMTP id ffacd0b85a97d-4887175a69cmr16191456f8f.41.1790406784608;
        Sat, 26 Sep 2026 00:13:04 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b162-c701-4960-a998-3de8-2fce.310.pool.telefonica.de. [2a02:3100:b162:c701:4960:a998:3de8:2fce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm11592286f8f.13.2026.09.26.00.13.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 26 Sep 2026 00:13:04 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] udmabuf: respect the device's maximum segment size
Date: Sat, 26 Sep 2026 09:12:58 +0200
Message-Id: <20260926071258.77202-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

get_sg_table() merges physically contiguous pages without accounting
for the mapping device's maximum segment size. This affects both
importer mappings and the udmabuf misc device mapping used for CPU
access.

With DMA_API_DEBUG enabled, DMA_BUF_IOCTL_SYNC on a 64 MiB udmabuf
reports:

  DMA-API: misc udmabuf: mapping sg segment longer than device claims to support [len=65884160] [max=65536]

Use sg_alloc_table_from_pages_segment() with the mapping device's
maximum segment size. Keep a PAGE_SIZE minimum because the allocator
warns and returns -EINVAL for smaller limits.

Before commit 5bf888673e0d ("udmabuf: Do not create malformed
scatterlists"), each entry covered one page.

Fixes: 5bf888673e0d ("udmabuf: Do not create malformed scatterlists")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    Tested on v7.3-rc4-70-gfe2ec83746e5 in QEMU (x86_64, TCG) with
    DMA_API_DEBUG (all_errors=1) and DMABUF_DEBUG, A/B against the same
    base:
    
                                            before        after
      DMA_BUF_IOCTL_SYNC, 64 MiB udmabuf    1 report      0
      vivid import, 4 MiB udmabuf           2 reports     0
      vivid import, 2 MiB hugetlb udmabuf   2 reports     0
        frames captured                     5/5           5/5
    
    vb2-dma-contig rejected the non-contiguous import in both runs.

 drivers/dma-buf/udmabuf.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index df6dd00462423..09f1eb8432f19 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -139,9 +139,13 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 	if (!sg)
 		return ERR_PTR(-ENOMEM);
 
-	ret = sg_alloc_table_from_pages(sg, ubuf->pages, ubuf->pagecount, 0,
-					ubuf->pagecount << PAGE_SHIFT,
-					GFP_KERNEL);
+	/* The SG allocator requires a segment limit of at least PAGE_SIZE. */
+	ret = sg_alloc_table_from_pages_segment(sg, ubuf->pages, ubuf->pagecount,
+						0, ubuf->pagecount << PAGE_SHIFT,
+						max_t(unsigned int,
+						      dma_get_max_seg_size(dev),
+						      PAGE_SIZE),
+						GFP_KERNEL);
 	if (ret < 0)
 		goto err_alloc;
 
-- 
2.53.0

