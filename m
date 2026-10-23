Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737617;
	b=vvEfWgYvx5xYbuQkGKfe+qchra5ewlIN9zcmF9cq79RiL8yJWowoEV8I1NVrbsVfYYvl
	 550HVKPpCX7jhnMVFMv7b4V17LteRPRdpkMV39JujakLU5jFnk0uU4GCBU2ca8wuUa+LP
	 FZPoW4q3j+5win8k2OfqtEwatA+DjodinbOgM0tZqMMFd2fX2BgCUoxr0qnSvo2dVhwUO
	 CZFKJT2mehvCEbyC1IjHAEIqaVEKFhyt9sYmXNkSr+Ece+hoKUQs+8ZYf4L69oPrvdAxU
	 pto38vY4wwThVQy4rdiWNSNcys9mwSBGYkSowDm6rmF0fRVnq6HNjdnsEw+ZdmqJuzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=7r0UNu5wEL8POkOSz3+rOlJOKvPQ5Qd38WxY0JoWHCY=;
	b=oiefbH5P8t5lGzV+ulffQhyF+boxBDb8WlzS3F6D5jdYh7h1Y5j+G8/qA9KUOgxqbBE9
	 htvjvHjiIdFY4K2N001Ijajyqm/wmqoIM1aUtsgT832xskw50n3u3ak98FmdyYJQKIepE
	 yGS7H0XguZkYhAgWPdtSPWLnGnqHKQvkyjpfJjxgOT9Pa6yb/vRJfw0MX/YMr8qz1XlE3
	 vo0yNPInEzxa3HJYFsHWtFJJO8ynXjLoPHpFIwTUMpQX2eA6CSLpORvwnCHGoGjg/zWXb
	 ZJi6yA4tMkBLKaxoHelUnf4Ph08U6snoszOJX2HuB0zafDLL7fCmbyBJdpNPAFHpJ+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SqiI834I;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8115F60A2621
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 06:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8115F60A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SqiI834I
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so4399395e9.0
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 23:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737616; x=1793342416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7r0UNu5wEL8POkOSz3+rOlJOKvPQ5Qd38WxY0JoWHCY=;
        b=SqiI834I39va7l3yboJlN/zD/L9WM25KLneG14hpeRk7rVJY0zl7N9XJbly8pj/uXL
         4VfXV57g1LOJemivqZPnATrIZUhRmyu3BdUl2GAzM9FYvUhxek7LWaO+tXL2+FLZI1WS
         fmn6roPNONFMKksLuKgHR6dhPzlbcK09XiUPIUwmyW98H6SbSWg6KSPiQJBqVn+mhex9
         Ey1euNmwJFduuSP3QOsITXWoZcs+Fr6IwVH02YHBvk0zbV9oVXaueclBgj5kzeQloRmd
         NbwQb7Ut1g6mbM5v1CMBQbWaAlBf6CHN+AiAJHmB4hBQURHL1LpzlXn7Jmfb6KCj2iZd
         gRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737616; x=1793342416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7r0UNu5wEL8POkOSz3+rOlJOKvPQ5Qd38WxY0JoWHCY=;
        b=UAcUhh0x7n1k4+QvnAarjy4Kv9YFAqU3KXtw+uagMTJmhg+hJQB+e13GKgDlyI2s7P
         Cl6ecGiCl/aWZnIU0Gayw+Hor2rAyKl/bePEsY8KGocYa7oRPPtTN/s3PgCeBHbKoSpZ
         aMqogjsMxai4DqGSTa5R3zCTmqEKQSSHBSU8K6AdKzQs1kcYNl+QWjTVJOXrbxRieyHj
         YZW7579hHIw/6Lufevg2CNg/mC1x+x72dBA7/JhCc98sY6qNlX5n0c0TENnGZrnq9g0L
         YZmu+ulnOECJBcVj61xeQa9B5qBHxuBttK9f+0Nianh1/bY/yA2+ORKmd0Bznu7h05GJ
         yW/Q==
X-Forwarded-Encrypted: i=1; AKwUvBz39LrKVaiYnhTarTfCbek2eWu7kMGLhgXYgyfFd2HQ/hx4uZ1I/sH2JQTl8N/mAB3DwoSZeKvNrvbwGA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIivlvtdMkItEr+B9vpJeWQ9Sk52bjSL9bZ2TaRzCPiU4H3rkYi
	8oOK/m5klq45YrvYw2eR/n05imV5MSENfg4Zn3PzcbZYUtnGUvLQ35T1
X-Gm-Gg: AYBFou1vz6eoKp/6LKjnbIaH87xRMaKLZN7JiEa1lAnDQ1Ce9WHsxRbUWVrnl/VDYfV
	zrNKH/tsrH6kJ+IpU/ifPokbDnSLl+ZC64uRpXrWgNFXnI9pZrpr+FBUCqXcQZgu9nZ6bcb1rE7
	/GjPDkqWbpCef6RicQ44Wbfm1KkY3oQYQfSajU1ZXBMmrBmHYL3Q9m0Q/hxeE9/rhc5bd6XcKFA
	EiDBEdJ5oHJNW8iGvQZcbgn08aw3Vvx2FVouI0q3qTUMNwcw61QAlGtkK7l6MezhfsZdP33pVNP
	4SRxqhWEg9fj+uSdYjB8OM0xWO0mUcuNA2SaKpOEzzVXAR1Gkk1/bCreGgkAOF9t9HO3zZeITKR
	EtoJNooIPV3gPGD3iSF6CITwTZl40A1uFcdekCIg1oNweTsvSEkt6PS5ppb2P19ReF/e/vCnnfc
	4uPa5CQN292txvAcHdV8D0IMe9fNNy1LSqGxB8/fZrzpyEECCAc36xNQ1tV/Bwp/uBwF49SLEs5
	pC37gSaAh2V+Sh8W697ITzboQl4kDW4ngMB4YssdpjQ9NOGQhWIvbIh5X6BL7JOwL/JwHfPK/el
	IkMmUclrPrWrUTYb6sXRo8J5t0g3gkbFDvZfBcQC1LWN6J8KXOpe4kro7GYeNId9TVtMQiXYeza
	krLE=
X-Received: by 2002:a05:600c:6387:b0:4a2:bbd:ea3a with SMTP id 5b1f17b1804b1-4a211c51aa9mr18565345e9.6.1792737615806;
        Thu, 22 Oct 2026 23:40:15 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:40:15 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:37 +0200
Subject: [PATCH v3 12/16] accel/thames: Install memory mappings populated
 and dirty
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-thames-v3-12-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2

The GEM DMA mmap helper maps the whole buffer up front, but with pages
that fault on their first write, since the A53 in the J722S has no
hardware dirty-bit management. The GEM shmem helper maps by page fault,
one at each page's first touch and another at its first write, which
its write-notify needs. Neither helper can install the pages writable
and dirty, so the driver sets the protection itself: for contiguous
buffers it calls dma_mmap_pages() with it, and for the others it
installs the pages with remap_pfn_range().

This saves 20% of the total time in the first invoke of a model on the
J722S.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/thames/thames_gem.c | 76 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/thames/thames_gem.c b/drivers/accel/thames/thames_gem.c
index 5a4dc497768f..9f55169c6370 100644
--- a/drivers/accel/thames/thames_gem.c
+++ b/drivers/accel/thames/thames_gem.c
@@ -808,12 +808,82 @@ static void thames_gem_shmem_bo_free(struct drm_gem_object *obj)
 	drm_gem_shmem_free(&bo->shmem);
 }
 
+/*
+ * Installed dirty and writable: the A53s have no hardware dirty-bit management,
+ * so every first write would fault.
+ */
+static int thames_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
+	pgprot_t prot;
+	int ret;
+
+	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
+	vm_flags_mod(vma, VM_DONTDUMP | VM_DONTEXPAND, VM_PFNMAP);
+
+	prot = vm_get_page_prot(vma->vm_flags);
+	if (vma->vm_flags & VM_WRITE)
+		prot = pte_pgprot(pte_mkdirty(pte_mkwrite_novma(pfn_pte(0, prot))));
+	vma->vm_page_prot = prot;
+
+	ret = dma_mmap_pages(drm_dev_dma_dev(obj->dev), vma, vma->vm_end - vma->vm_start,
+			     virt_to_page(dma_obj->vaddr));
+	if (ret)
+		drm_gem_vm_close(vma);
+
+	return ret;
+}
+
+/*
+ * Every page installed now, dirty and writable: they are pinned for the
+ * object's life, and the helper would take two faults on each.
+ */
+static int thames_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct thames_gem_object *bo = to_thames_bo(obj);
+	unsigned long addr = vma->vm_start;
+	struct scatterlist *sg;
+	pgprot_t prot;
+	unsigned int i;
+	int ret;
+
+	if (vma_is_cow_mapping(vma))
+		return -EINVAL;
+
+	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
+
+	prot = vm_get_page_prot(vma->vm_flags);
+	if (vma->vm_flags & VM_WRITE)
+		prot = pte_pgprot(pte_mkdirty(pte_mkwrite_novma(pfn_pte(0, prot))));
+	vma->vm_page_prot = prot;
+
+	for_each_sgtable_sg(bo->shmem.sgt, sg, i) {
+		unsigned long len = min_t(unsigned long, sg->length, vma->vm_end - addr);
+
+		ret = remap_pfn_range(vma, addr, page_to_pfn(sg_page(sg)), len, prot);
+		if (ret)
+			return ret;
+
+		addr += len;
+		if (addr == vma->vm_end)
+			break;
+	}
+
+	return 0;
+}
+
+/* Only the GEM reference: the pages are pinned for the object's life. */
+static const struct vm_operations_struct thames_gem_shmem_vm_ops = {
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+};
+
 static const struct drm_gem_object_funcs thames_gem_funcs = {
 	.free = thames_gem_bo_free,
 	.print_info = drm_gem_dma_object_print_info,
 	.get_sg_table = drm_gem_dma_object_get_sg_table,
 	.vmap = drm_gem_dma_object_vmap,
-	.mmap = drm_gem_dma_object_mmap,
+	.mmap = thames_gem_mmap,
 	.vm_ops = &drm_gem_dma_vm_ops,
 };
 
@@ -825,8 +895,8 @@ static const struct drm_gem_object_funcs thames_gem_shmem_funcs = {
 	.get_sg_table = drm_gem_shmem_object_get_sg_table,
 	.vmap = drm_gem_shmem_object_vmap,
 	.vunmap = drm_gem_shmem_object_vunmap,
-	.mmap = drm_gem_shmem_object_mmap,
-	.vm_ops = &drm_gem_shmem_vm_ops,
+	.mmap = thames_gem_shmem_mmap,
+	.vm_ops = &thames_gem_shmem_vm_ops,
 };
 
 int thames_ioctl_bo_create(struct drm_device *ddev, void *data, struct drm_file *file)

-- 
2.54.0

