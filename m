Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997544657EA
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 15:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786720288; cv=none; b=UCYyQqAWLiUeNvKbqGzcANgfotm+r2CR1DS2lrV0ACYqJ568lcR8VzgoNVoAx1wzPdP9/u5XwN+XOFOQlosH+vovUk9ajEJx6qsrkUerbsy8on3tmPIv+0JMnb7JmG3MccYcrlpZHLzhCVDU+zQxCe+3naOe2/AkAM2fhMG1VC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786720288; c=relaxed/simple;
	bh=0BrBkcX9UcEVHPKeK7NYdXxTwBJE9wFp4qVEes7QwFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dsqqKgKoR6BnE4zm4byZw5RrhRzsPusCk1BvQ+bSbc31QrqRgszEykE2E7qOX9UsM8xBjQxAZEF5iqPhIQPrH7oeEUF9k1DRomP/eHcvPAFAcV4WS0D+XRhWLFxttxlAerRFPSwsR9tuaHzIoWjy5NZy8IVMkbjLzAYTBSeaXFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcTWvEKU; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcTWvEKU"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39f20d19895so7661881fa.2
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 08:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786720285; x=1787325085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRvtXqxadNf2/AlBnV7jwVTo92rSYf1Qe1Qdjea6EK4=;
        b=IcTWvEKUT8lFiSd0oPWJ1qghyEoeB4gouWeb2jHFOfhDAHWMqYz294thA47iwdtEdB
         XkF9vHRXPI65uXHFpSOl53zArjzEUwT4lSZakpEMYpZMBPYgvqbQa+SxqOoNneKHKWwi
         eBhZL+IXfRF6xknqe4eP7tzqw6dY+6DZWfoFCQMjoFkzuMTO+3julFXNcIeo7XTo2vMF
         qiPr21oCx46xLMT+qPIuXQfGD8hrdm9S6Z9YycUqRxIpaLu1XWUcRCk5ef5WK/6lqN00
         MG7IsBFpquhmfksEy7ZIkTq0mLPQ9LrlpO4eF4tjC59qtrRlfQw0MrZyrRWSj352y7Hc
         3srg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786720285; x=1787325085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRvtXqxadNf2/AlBnV7jwVTo92rSYf1Qe1Qdjea6EK4=;
        b=QuVANMLqaqby1MKCjSaT0fZyZx0s7Ko77rn85IeCDGqT24ZY2Xk4jnB+NoN0XImpUn
         rwOnzQXJmYbZuaiqDv7U+1wnBrbUaVes7pGdYetnoLPKr5xM32WNc2PeIPMvD1oTqBjv
         27T/vpey6/jxbFA9zc67Ji1j/FP6k9+ohRGTlmMWlW30uDWN6sVCF8QegmWES0DGaTAC
         ah6JDx6Rh+h16rNM0s2cMzmeHtPEsHIGTMGx4nCCiLAesEyfD67NDvW4MfjetQTEFtgV
         k4reL+A4zQKRxZaeZpBeDRHA0YIGWMcw/yyXp/mXuY3zwA2YQBr5vecy/ncNx9XFpfXW
         J5Vw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3f/hvwfhDtcV03sBOU9lPY06opVtAu0yn9mwelihjEp4DgUVITKTModpFteXoXOGA+6k9u+wkeMxiOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3zeGzeWWl0qVQmW5FaULWVYnr0+uyGPlfIEbbE9VmJn3TRwaD
	/Cwfd0ZxeDZ3ZhcAgFTE9Cj3L2umS/3pnI/uq0JXAUc9pf7ad6BUMOxh
X-Gm-Gg: AR+sD13lCFPBB/Kvx3b+fDNjDzY86nkAuAIIRLyAc2Za2W+q4Yn5wzDIfDFEUS7BUXJ
	CJl2ODmtv1st5zRb9Z7vfa31vIB0pDMe+r5MgQstp1H9g2xbDBcRIm1HUeN+736DOo0aG9AlLy1
	DwGDym7l6YNUc8twFHmjBZj+TvX9UhksI05sB4CerNwGrU+5fV5re2yZYKPcuH3ZsT66+eAWdwa
	G72N08j7/Yl9vbabLJbBEGuYPMuTfSFQNc4TojyKkjJkx/zvB+GdorljpfDy88j3QDimTq7X/Gk
	c4+0vyFLHNVA4DcsAy/FOy2WAsLl2fnLwM35o3DthryAnkzu+AF/587ni4CgafT9HHDpAHp7DlC
	3LR9MCXqlgf6Grt7SXCLrfQjnrOHErPkfH0i20qwYU9AcNqLlCoh6jjAWSsXZckJ1YH5TIzwus3
	LuygewHsFsAO5NbeiCf5xp4BK37+fqrTd8KTmPwhV/Sy5Cz1Q75tmQU7HJKKWPqOCj1qoQQQ==
X-Received: by 2002:a2e:be9b:0:b0:39c:650c:4540 with SMTP id 38308e7fff4ca-3a132498229mr7305901fa.15.1786720284542;
        Fri, 14 Aug 2026 08:11:24 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130d204b2sm7138251fa.41.2026.08.14.08.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 08:11:24 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Fri, 14 Aug 2026 18:10:08 +0300
Subject: [PATCH v4 1/5] staging: media: atomisp: remove unused functions
 from pci/hmm/
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-atomisp_remove_hmm-v4-1-c3c954a12b51@gmail.com>
References: <20260814-atomisp_remove_hmm-v4-0-c3c954a12b51@gmail.com>
In-Reply-To: <20260814-atomisp_remove_hmm-v4-0-c3c954a12b51@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786720280; l=8865;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=0BrBkcX9UcEVHPKeK7NYdXxTwBJE9wFp4qVEes7QwFQ=;
 b=17ov1ejH9Y4fmeXP3BlwdLqNSouwa2H9tDhTC1BBA95xdO1q9x28gFeTjPyboMALzh/ZhO6UL
 KTKPOMuChCSBH14x5SiQ9dtCl7PsP1+wvBSgtfUFKqiKmbTOGkSuNdW
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

These functions are declared and defined but are not called anywhere.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm.h    |  16 ---
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h |  19 ---
 drivers/staging/media/atomisp/pci/hmm/hmm.c        |  41 ------
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     | 139 ---------------------
 4 files changed, 215 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index a7aef27f54de..6bda02b9ff85 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -32,12 +32,6 @@ void hmm_free(ia_css_ptr ptr);
 int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes);
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes);
 int hmm_set(ia_css_ptr virt, int c, unsigned int bytes);
-int hmm_flush(ia_css_ptr virt, unsigned int bytes);
-
-/*
- * get kernel memory physical address from ISP virtual address.
- */
-phys_addr_t hmm_virt_to_phys(ia_css_ptr virt);
 
 /*
  * map ISP memory starts with virt to kernel virtual address
@@ -55,16 +49,6 @@ void hmm_vunmap(ia_css_ptr virt);
  */
 void hmm_flush_vmap(ia_css_ptr virt);
 
-/*
- * map ISP memory starts with virt to specific vma.
- *
- * used for mmap operation.
- *
- * virt must be the start address of ISP memory (return by hmm_alloc),
- * do not pass any other address.
- */
-int hmm_mmap(struct vm_area_struct *vma, ia_css_ptr virt);
-
 extern struct hmm_bo_device bo_device;
 
 #endif
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index e09ac29ac43d..ba3c582a0f89 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -205,7 +205,6 @@ int hmm_bo_page_allocated(struct hmm_buffer_object *bo);
  */
 int hmm_bo_bind(struct hmm_buffer_object *bo);
 void hmm_bo_unbind(struct hmm_buffer_object *bo);
-int hmm_bo_binded(struct hmm_buffer_object *bo);
 
 /*
  * vmap buffer object's pages to contiguous kernel virtual address.
@@ -224,17 +223,6 @@ void hmm_bo_flush_vmap(struct hmm_buffer_object *bo);
  */
 void hmm_bo_vunmap(struct hmm_buffer_object *bo);
 
-/*
- * mmap the bo's physical pages to specific vma.
- *
- * vma's address space size must be the same as bo's size,
- * otherwise it will return -EINVAL.
- *
- * vma->vm_flags will be set to (VM_RESERVED | VM_IO).
- */
-int hmm_bo_mmap(struct vm_area_struct *vma,
-		struct hmm_buffer_object *bo);
-
 /*
  * find the buffer object by its virtual address vaddr.
  * return NULL if no such buffer object found.
@@ -251,11 +239,4 @@ struct hmm_buffer_object *hmm_bo_device_search_start(
 struct hmm_buffer_object *hmm_bo_device_search_in_range(
     struct hmm_bo_device *bdev, ia_css_ptr vaddr);
 
-/*
- * find the buffer object with kernel virtual address vaddr.
- * return NULL if no such buffer object found.
- */
-struct hmm_buffer_object *hmm_bo_device_search_vmap_start(
-    struct hmm_bo_device *bdev, const void *vaddr);
-
 #endif
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index f998b57f90c4..8130be4a30e3 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -262,12 +262,6 @@ int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes)
 	return load_and_flush(virt, data, bytes);
 }
 
-/* Flush hmm data from the data cache */
-int hmm_flush(ia_css_ptr virt, unsigned int bytes)
-{
-	return load_and_flush(virt, NULL, bytes);
-}
-
 /* Write function in ISP memory management */
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes)
 {
@@ -411,41 +405,6 @@ int hmm_set(ia_css_ptr virt, int c, unsigned int bytes)
 	return 0;
 }
 
-/* Virtual address to physical address convert */
-phys_addr_t hmm_virt_to_phys(ia_css_ptr virt)
-{
-	unsigned int idx, offset;
-	struct hmm_buffer_object *bo;
-
-	bo = hmm_bo_device_search_in_range(&bo_device, virt);
-	if (!bo) {
-		dev_err(atomisp_dev,
-			"can not find buffer object contains address 0x%x\n",
-			virt);
-		return -1;
-	}
-
-	idx = (virt - bo->start) >> PAGE_SHIFT;
-	offset = (virt - bo->start) - (idx << PAGE_SHIFT);
-
-	return page_to_phys(bo->pages[idx]) + offset;
-}
-
-int hmm_mmap(struct vm_area_struct *vma, ia_css_ptr virt)
-{
-	struct hmm_buffer_object *bo;
-
-	bo = hmm_bo_device_search_start(&bo_device, virt);
-	if (!bo) {
-		dev_err(atomisp_dev,
-			"can not find buffer object start with address 0x%x\n",
-			virt);
-		return -EINVAL;
-	}
-
-	return hmm_bo_mmap(vma, bo);
-}
-
 /* Map ISP virtual address into IA virtual address */
 void *hmm_vmap(ia_css_ptr virt, bool cached)
 {
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 0a8f401a1ca1..fd40e64e660e 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -578,31 +578,6 @@ struct hmm_buffer_object *hmm_bo_device_search_in_range(
 	return bo;
 }
 
-struct hmm_buffer_object *hmm_bo_device_search_vmap_start(
-    struct hmm_bo_device *bdev, const void *vaddr)
-{
-	struct list_head *pos;
-	struct hmm_buffer_object *bo;
-	unsigned long flags;
-
-	check_bodev_null_return(bdev, NULL);
-
-	spin_lock_irqsave(&bdev->list_lock, flags);
-	list_for_each(pos, &bdev->entire_bo_list) {
-		bo = list_to_hmm_bo(pos);
-		/* pass bo which has no vm_node allocated */
-		if ((bo->status & HMM_BO_MASK) == HMM_BO_FREE)
-			continue;
-		if (bo->vmap_addr == vaddr)
-			goto found;
-	}
-	spin_unlock_irqrestore(&bdev->list_lock, flags);
-	return NULL;
-found:
-	spin_unlock_irqrestore(&bdev->list_lock, flags);
-	return bo;
-}
-
 static void free_pages_bulk_array(unsigned long nr_pages, struct page **page_array)
 {
 	unsigned long i;
@@ -885,21 +860,6 @@ void hmm_bo_unbind(struct hmm_buffer_object *bo)
 		"buffer vm or page not allocated or not binded yet.\n");
 }
 
-int hmm_bo_binded(struct hmm_buffer_object *bo)
-{
-	int ret;
-
-	check_bo_null_return(bo, 0);
-
-	mutex_lock(&bo->mutex);
-
-	ret = bo->status & HMM_BO_BINDED;
-
-	mutex_unlock(&bo->mutex);
-
-	return ret;
-}
-
 void *hmm_bo_vmap(struct hmm_buffer_object *bo, bool cached)
 {
 	check_bo_null_return(bo, NULL);
@@ -981,102 +941,3 @@ void hmm_bo_unref(struct hmm_buffer_object *bo)
 
 	kref_put(&bo->kref, kref_hmm_bo_release);
 }
-
-static void hmm_bo_vm_open(struct vm_area_struct *vma)
-{
-	struct hmm_buffer_object *bo = vma->vm_private_data;
-
-	check_bo_null_return_void(bo);
-
-	hmm_bo_ref(bo);
-
-	mutex_lock(&bo->mutex);
-
-	bo->status |= HMM_BO_MMAPED;
-
-	bo->mmap_count++;
-
-	mutex_unlock(&bo->mutex);
-}
-
-static void hmm_bo_vm_close(struct vm_area_struct *vma)
-{
-	struct hmm_buffer_object *bo = vma->vm_private_data;
-
-	check_bo_null_return_void(bo);
-
-	hmm_bo_unref(bo);
-
-	mutex_lock(&bo->mutex);
-
-	bo->mmap_count--;
-
-	if (!bo->mmap_count) {
-		bo->status &= (~HMM_BO_MMAPED);
-		vma->vm_private_data = NULL;
-	}
-
-	mutex_unlock(&bo->mutex);
-}
-
-static const struct vm_operations_struct hmm_bo_vm_ops = {
-	.open = hmm_bo_vm_open,
-	.close = hmm_bo_vm_close,
-};
-
-/*
- * mmap the bo to user space.
- */
-int hmm_bo_mmap(struct vm_area_struct *vma, struct hmm_buffer_object *bo)
-{
-	unsigned int start, end;
-	unsigned int virt;
-	unsigned int pgnr, i;
-	unsigned int pfn;
-
-	check_bo_null_return(bo, -EINVAL);
-
-	check_bo_status_yes_goto(bo, HMM_BO_PAGE_ALLOCED, status_err);
-
-	pgnr = bo->pgnr;
-	start = vma->vm_start;
-	end = vma->vm_end;
-
-	/*
-	 * check vma's virtual address space size and buffer object's size.
-	 * must be the same.
-	 */
-	if ((start + pgnr_to_size(pgnr)) != end) {
-		dev_warn(atomisp_dev,
-			 "vma's address space size not equal to buffer object's size");
-		return -EINVAL;
-	}
-
-	virt = vma->vm_start;
-	for (i = 0; i < pgnr; i++) {
-		pfn = page_to_pfn(bo->pages[i]);
-		if (remap_pfn_range(vma, virt, pfn, PAGE_SIZE, PAGE_SHARED)) {
-			dev_warn(atomisp_dev,
-				 "remap_pfn_range failed: virt = 0x%x, pfn = 0x%x, mapped_pgnr = %d\n",
-				 virt, pfn, 1);
-			return -EINVAL;
-		}
-		virt += PAGE_SIZE;
-	}
-
-	vma->vm_private_data = bo;
-
-	vma->vm_ops = &hmm_bo_vm_ops;
-	vm_flags_set(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP);
-
-	/*
-	 * call hmm_bo_vm_open explicitly.
-	 */
-	hmm_bo_vm_open(vma);
-
-	return 0;
-
-status_err:
-	dev_err(atomisp_dev, "buffer page not allocated yet.\n");
-	return -EINVAL;
-}

-- 
2.55.0

