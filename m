Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357243D6CA3
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 05:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790660931; cv=none; b=dQHeo04Oj99kYAYBNQN1fThUYahkKZi4XIxz8ZufXhnE2l1wkJ8g0eRIm07EAw9guS1Zg3bthw76RB96Vr4Azpas+E2Yd3XP+7pbcHoidbOEB0yHzFTwQNbAm+gaPttW8G1RPMw1BFtiD9S84EnKzshJxzjuTotrr8WyPp8wwNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790660931; c=relaxed/simple;
	bh=29ZEC5PLjG/gXCEI5HDKF6BpnkTdM5aT/oFaP2wsL48=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oYgP08wWzW6jJhp9QdlN5W3ZR3kpPlvUODXB/UbjNE0+t4RGzxI69YeJPEGfsr5+hEoGeNOJad41J+3zIKypPlddgPgnEeOxwVqnxLC3tN0btXPZ+vtORBfa8h/9V+rNe3vjb6G+6wv/fLSvG2PIeDTyJIdGrgC+klfPLO9wHPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+fOKjz2; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+fOKjz2"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so23198245e9.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 22:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790660928; x=1791265728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WcZ52LtgxmvNFnY7nqHOBLnLq9Jyv8OCVXDEjqGBY8=;
        b=U+fOKjz27dNxI8/l0o9duI/7azrFo5v+OUnZpQ/+B3/oKe0Ld7Evm3T+qnp6KEVe66
         jgmoJuDv33jN6/Q03tjO3UJq21pHsKZsQejs8WPNwaZAfwLEOlP0RXdlRnVqUHmJzP2Q
         Rw0rqUhkcsYDAUBnN8ZGXUL6BhxLogEE2hW+NLuakp42iw8E/bIHQlV/5gTTsIqW9u0M
         WRkkTR10Dd1Xl1FODLkDRLRBfwXDWUrJB0IIGtse8XcJqzmz3UvAEiaqGMqu9r0+lwmY
         7lOxvoLH2/Tgjc0vVsouVFNMzdr2pFNECJd5oKS/l9X4xiDwOAOGrhI8Dvd+25vuzcjO
         DFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790660928; x=1791265728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9WcZ52LtgxmvNFnY7nqHOBLnLq9Jyv8OCVXDEjqGBY8=;
        b=O59TlJ47I5H6HAi7nF35Gt1fCWqsnEMyaQNpRXYAWENMgLc6f8ufn88QtbjCePG5+K
         hRoU3xABo0FablSDCDo8gC5TCU0AHW+IptxZ/8pi4CH3idZjlIRa5l/DwWQyXStq0dn4
         f6/qTP6bsUlBog50hO2LMwUG/ptZf+ijFaldhKMeR+VHdLVaEyrW6smOtPbjfbuIp1ke
         fIXEmTGQHTH0bWSiwj9hcejK8Ssv1VzYmgnkKuFgMEAVEBEDWVgkh9K1LRhtlEOeNMtT
         5RpgdyRWBEQb6/721ov9yBwSuP9Wc62ug+fMfXylqjog6+Vab2bOo4VulB3qqc10SGqn
         EB9g==
X-Forwarded-Encrypted: i=1; AKwUvBw8vZcwKy1T5fEuw/+Ni+iw4fb5Y7i6im9r+McTn1WudWHVpfT4U59dd3x2uRHeAgby35uy9SzPIzqg4w==@vger.kernel.org
X-Gm-Message-State: AFuF++kkb7yJFZamInmEJWz8j3SDLDYFhWQsrItNj3s85rqzK8Z8FsCd
	vjxpbulTtcgO697BKhxfxfDCugTwbnJ9prGI1FJCPRsp9IbsD32PWYiP
X-Gm-Gg: AYBFou10kU2PrHu5ReEyYVaw2V036tKvIv9zWvq2YALPTu4UF3HX92Ar8UKJj8GxPZM
	acqAbj5Y3ejXvgmssqpx+mVUa00z8uXRR8PhiutLme4KyG7pb3gzXZzQrgiW5DWzPfRIFxtBJSm
	0w0XwwoWeJ0uhgxc9wcx1hyYJ2Eezp9V2mwCLhA0bloPd/5vqphSVVUOEYSw/TKGUiU5rnp+XqB
	MxZ7Vf7VJC65DNZPY9DnFFTXm7vDu/BS/BR4nW7gfh9CZPeIvLsvcnPcq6nL809OWBxwjYf12nj
	cRHuSRj8JrXBEF2GEzy3zzbBSdEH1Ml4m90KYfK4l3+MvpN3SCgnPMi5DvAkkDpeUnriDKv68YL
	ivThO0NCCIG8LXecWC3AWxQCdlicP6MmHcFvSZ25rdmF7OFUR4iDqYkckM14D7E72duUoMB2LPO
	bjVarvO3G4zDHutznqs82D9XTXqAG/ObXn5oNvL7qXQtwOdxro+IWWA4QeUTHF/8jBGDQK71Rhf
	XsrldOPdp0kP6snuvIP0xtR5cUuoLMyQijyhrl37xl6Gvlfve7z2VbiFxlRhpAns1htqMNZDMUa
	Jl/Fiu96nTPTcemr7NRPT/IuweeSIibyk7xIGr1KxQHxKxb2NmLE07+CvmBeVyTeNrCar9ZrQDu
	v
X-Received: by 2002:a05:600c:530f:b0:49f:ffdc:939d with SMTP id 5b1f17b1804b1-49fffdc9a4amr93691455e9.9.1790660928275;
        Mon, 28 Sep 2026 22:48:48 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c32-f801-0451-cc94-d3ca-f56b.310.pool.telefonica.de. [2a02:3100:9c32:f801:451:cc94:d3ca:f56b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf8fa5bsm58477615e9.6.2026.09.28.22.48.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 22:48:47 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] udmabuf: respect the device's maximum segment size
Date: Tue, 29 Sep 2026 07:48:35 +0200
Message-Id: <20260929054835.94118-1-kmehltretter@gmail.com>
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

  DMA-API: misc udmabuf: mapping sg segment longer than device claims to
  support [len=65884160] [max=65536]

Use sg_alloc_table_from_pages_segment() with the mapping device's
maximum segment size. Return -EINVAL if the limit is smaller than
PAGE_SIZE because the page-based allocator cannot honor it.

Before commit 5bf888673e0d ("udmabuf: Do not create malformed
scatterlists"), each entry covered one page.

Fixes: 5bf888673e0d ("udmabuf: Do not create malformed scatterlists")
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    Changes in v2:
    - Return -EINVAL when the maximum segment size reported by the device is
      smaller than PAGE_SIZE instead of clamping it. (Christian)
    - Add Jason Gunthorpe's Reviewed-by tag.
    
    Tested on v7.3-rc4-70-gfe2ec83746e5 in QEMU (x86_64, TCG) with
    DMA_API_DEBUG (all_errors=1) and DMABUF_DEBUG, A/B against the same
    base:
    
                                            before        after
      DMA_BUF_IOCTL_SYNC, 64 MiB udmabuf    1 report      0
      vivid import, 4 MiB udmabuf           2 reports     0
      vivid import, 2 MiB hugetlb udmabuf   2 reports     0
        frames captured                     5/5           5/5
    
    vb2-dma-contig rejected the non-contiguous import in both runs.
    
    For v2, a focused importer advertising PAGE_SIZE / 2 returned
    -EINVAL under KASAN and DMA_API_DEBUG. No warning, BUG, or DMA-API
    report was emitted.

 drivers/dma-buf/udmabuf.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index df6dd00462423..018937435356e 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -133,15 +133,22 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 {
 	struct udmabuf *ubuf = buf->priv;
 	struct sg_table *sg;
+	unsigned int max_segment;
 	int ret;
 
+	max_segment = dma_get_max_seg_size(dev);
+	/* The SG allocator requires a segment limit of at least PAGE_SIZE. */
+	if (max_segment < PAGE_SIZE)
+		return ERR_PTR(-EINVAL);
+
 	sg = kzalloc_obj(*sg);
 	if (!sg)
 		return ERR_PTR(-ENOMEM);
 
-	ret = sg_alloc_table_from_pages(sg, ubuf->pages, ubuf->pagecount, 0,
-					ubuf->pagecount << PAGE_SHIFT,
-					GFP_KERNEL);
+	ret = sg_alloc_table_from_pages_segment(sg, ubuf->pages, ubuf->pagecount,
+						0, ubuf->pagecount << PAGE_SHIFT,
+						max_segment,
+						GFP_KERNEL);
 	if (ret < 0)
 		goto err_alloc;
 

base-commit: fe2ec83746e501645709761605c2464a44fd2929
-- 
2.53.0

