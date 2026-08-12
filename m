Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3DC3AE6E9
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 20:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568128; cv=none; b=GWDSysvwTJR05KUoXJZxBKbD9HkEu2Yl49e5zSxL2eqz8xrFWSzrpozHP/Z7c10Wv27gGa6bFABVwW1zV/PDHCAwuhKXkwKjVEE+V8S4phcZyQ1IIxl0oA8S5neZLONiR6GqL7uzRe0S4sZBg7w4BvrhWQsMKy9wh2mysly+zMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568128; c=relaxed/simple;
	bh=FOycCqunyoZT8bgxjzlkGYKt/0jU9FcTV7Q7HQv2ThM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m1Rvj2Mn+vL+Pk5YXAufR7FH/B/zNGzrxcrJVP0T/K7vGGHBhBURVpwUq1T4FG7B2Kx9lzdKCVKVPXx4bFshYH0lsp5Q4tj/W9lwUvbxboWPk4+JERmeKPOrp3zl700VjGSHM8644zPy9pmAc4XDPuKUyykuDdzENtoIhcYfLTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGl1XmWx; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGl1XmWx"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b01cb18515so1398083e87.2
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 13:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786568119; x=1787172919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i6ugBaIIKiiLCYgtPZsQcl5yA/18Djk/6dZvEnQ+uks=;
        b=OGl1XmWxG4ewYLrAqqMct19jvXPjpnj0tsZDIFeJJIWZJyBALrnDz5R4ryFScshGSI
         MwOXnGBwhP0EfOpp7y2yFqGPgq8nqYtGDEICN69gP5713E140KXooVmHoO5ZwbT+5Tq9
         NSvQx5Zq0svMHhNLWYQnHPiAIv8YBB9Wu/QoNhkzb/EFBKgHXbtUnoDkXLNqq3f032yN
         R7qGqk9Uv2odmwD9fdgzkYvzNaRdbz8iP6KwmY7a8CPUUtV6GRvadIMbf3R6c89eXNhI
         5smQyO8ljmpcKUMhsSQ5P9UVz7/rn+tNZZZPmG14SKTKFHfrdXZhKz69lT5vTGvll5an
         WD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786568119; x=1787172919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i6ugBaIIKiiLCYgtPZsQcl5yA/18Djk/6dZvEnQ+uks=;
        b=dDPNV8qJrs3g+DqAdCnQPCo+JybdS+NtaOC5T5RkXrBrDHsomoHRY5HSY/NumW4E74
         D5EcZlsAo/yH1851Hr9Pd4Viw3dSmgFQAqAL0h15iqiw2hb1V7UXTwjANpJwziDqQ17f
         uwSnuuqIdUHMxRPg6/11oBFQsfgZ9TFjPhtfq8Qdm1fm/n/uca9zzrw8MrIDbfNVu/8K
         NyaYxhIkRKG2qxw2YzRRt01RH2VLQp5LqMY8qqZimwZg6yCavEjqvEMdEqdI5yQ2Nl39
         8ZZUPzyB92UqNumRWgdpqY4txXzVhIkyODcdtHx8MDQx3nTX35FoqThkCqLJWqm8uhcl
         atdA==
X-Gm-Message-State: AOJu0YzIuuxUNhffnZXZDoeg5ETXvbNXnISUulG7YaFeo6YMk8PLqsQq
	D4f6wUfWPde2u3eMA72GSkAAGdQHUcewFvH82YNdbsWxfimSFbJup8Ma
X-Gm-Gg: AR+sD13mUDTLEaRgDYe+DVj/SodDaDX2nhAmIJhkRgs97jbMw8FwYAlBYfMl2FqNAn7
	O8QodtRbKK8M6Oceqc73pqI65IoWQqVHu9Ix5h0DS+aFL3RkhbYwNF2XWzmeMZjqayTi0BtSjF2
	jGpXxPP/a8s3li21rjwJaYRrbksDCbszxN4ZJh2OBs9+c4dWgLMH/+90L1SgoH+Qx0px+aiE9e1
	MVSnBaAoiOsHNds7b+vEoB4FrsywE/oUD5PA9+i4jNqyIijc2MEVQC9a+jumvJDluLqUQkV1+Nv
	bHkF+NKnqNkpLCeaWtkuIn9DX6hm7lxs3So3mkORiJi6mlH47Cjsw24oYzbm5CrF1KwCLt3fFmA
	ANQbAhqixADQYtsfFxn+XPcp3qe+jhFF6hqOuyw9aT8gCDXqzUU4ICBzG16jGjQcHivQIoKD57F
	eUhyn3lfUALD614dOfQV3VjPV1xVse0jIPxcTzq2cHwZYL3Ym08gamvy38Xa8=
X-Received: by 2002:a05:6512:61dc:20b0:5b4:4c28:2249 with SMTP id 2adb3069b0e04-5b453f454d2mr38340e87.24.1786568118761;
        Wed, 12 Aug 2026 13:55:18 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4539e9605sm60999e87.22.2026.08.12.13.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:55:18 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v3 1/5] staging: media: atomisp: remove unused functions from pci/hmm/
Date: Wed, 12 Aug 2026 23:51:34 +0300
Message-ID: <20260812205429.39181-2-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812205429.39181-1-nikolayof23@gmail.com>
References: <20260812205429.39181-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These functions are declared and defined but are not called anywhere.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 .../staging/media/atomisp/include/hmm/hmm.h   | 16 ---
 .../media/atomisp/include/hmm/hmm_bo.h        | 19 ----
 drivers/staging/media/atomisp/pci/hmm/hmm.c   | 41 --------
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 97 -------------------
 4 files changed, 173 deletions(-)

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
index 0a8f401a1ca1..837077f1d229 100644
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
@@ -1023,60 +983,3 @@ static const struct vm_operations_struct hmm_bo_vm_ops = {
 	.open = hmm_bo_vm_open,
 	.close = hmm_bo_vm_close,
 };
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

