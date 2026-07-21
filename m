Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5485E43B484
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 21:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784670186; cv=none; b=OcPTn2KIXSUCMNmbbVXAOeO0TqJOSGz2yga4FdRiLa7fXjRpNCKSoSWIXSsoGGdCb+q+NhcWgIUz3R9g6Rr8V9tBbnM+90cQJl6d8z80T6YfQzn4buqQMOEFQXEDonRC0wNxWa5pHlHzxxIYuvS47p+SyOGhFXhT1VTvbrJlKoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784670186; c=relaxed/simple;
	bh=DefLr6N+E9PvdVZ8GGKHB1D7oDumfhx69XLAlNfBtz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q65P3VR8/LciEiMTYIeN9G0kxKlr0F1ZnjP32s8n0LSYhaDrGQ+7ykzzVB69BlM1QhNqnb3ds1ljQl0cdhFjn+WvzuJhlyA7qh3w8JL4BRw6g2cGwSSfqzdT8WS7vg6f00mZYXwqt8Turb0zYsS5lSBbCcimNrZx6w1M3i3kh3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qHQEovjJ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qHQEovjJ"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so14428995e87.0
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 14:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784670182; x=1785274982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ok5uMFFrIqvWj5X3glWDZ3EQJA6Z86TLs/gXGnbTACs=;
        b=qHQEovjJjHgFggbVr08mU0Se9vmVHSBalwtXpWrLY0zO/ckL4rW0ILObyZmDu7u9nM
         tUHFk7RjuDe1+OrFYCoX6YIT5jQ3KRPv7r/kN2lkwZA24Dx9hAWXojHg/Zx2p4OABocQ
         LonbGXQOCd+UEKKApMUlQqEWacCrae6HvNhdizFdEp9Lw7Je5zJ5jnkTQEE7AYdvRARv
         HeX8T8p2KoLnLtPaaMBPg3bLFE2+R44SLWQR07mQmx12CYwwbNw/7HCR9FBRdR+ubqYX
         iYuhYfjw0zZI6bHfXwJe7BcOusM99/TSpnschYIENah+2gSC/sdheUtD15KIsJRnkzZd
         RkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784670182; x=1785274982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ok5uMFFrIqvWj5X3glWDZ3EQJA6Z86TLs/gXGnbTACs=;
        b=NNW0ZzkSGFLbeG5Xv3EPk21p8UdTcQRhilJb46/wXVXkQRSa3TBoKJ8AquigLD+AKK
         VeR9aXMaIr71FO2ZaZYqAAqLTaU7H3Z/iiL9RB4OA/vpnOrQixXWNNVxxliE30YTXeTM
         0EJT/pXmB5WXNq6A7fbrIeXnw8wg573io/PyiJ1er3dqiI8hFR+Yh6qywSBbrT7yOSjH
         aJv9RF4LELB3mgu2bQypRBsHBDXOw/ND66rYhsfsPfBJlWWwV8fIi1n2aJbA1ysuzLHk
         DSuC2WB/c34cgj8ROu5nb08g8nYYoZmUSN/dLSNmmJD/sg5QypNXZ7y3xhKk+HRXfhcL
         Jxew==
X-Gm-Message-State: AOJu0YzOAXvkLfZ5bjv6ueLfJcbOAuo+jnVt30QX95jtENUeE0/WcaW/
	dZxp0GxLufmyF4wu/1aU300kf8/+ldsvJpf0tl0quyG6s1YTgYTa+KwA
X-Gm-Gg: AR+sD12lZPYoANgUlIEdSWZrdZ3AWXiW+1cYqLIoZXcb1lzqidkj3BQpcIDtkHdhkXq
	69iDp3hKje1WsAjcdHjCFGOVL+z4peiKQE2KZM7Ffq05pBhM+4CluzRotHQbOkatFLyHCYG6y0+
	Snh64h0AE4FZVM44OKncPeoOUYtdXT+smg5rbJMaogkUDuulsZI1maibQPFCSIa8Vm38c/QSirf
	9yPLH4cELrdtNKHsnALMTLAWsIg5/+J2gue/MC4m5AGbaTRAKHTFVCwwQTatFJTT33z7eJyeVrD
	0lZxhjkL4G22iHNvyvRRBUCTHFhmq8xiyxcOejQQ+zwizESn7g6jUXOTAhDP/gKLyhGRNjjLP87
	jJsvWhh23/8O/XV/YZTQlR0oDvwf0qTlsvh6Sr1zPFqHvHxod3GqoT+ovedlKqT5rtqJCWAyyyE
	0=
X-Received: by 2002:a05:6512:61d3:20b0:5ae:b135:64de with SMTP id 2adb3069b0e04-5b28f9ac22amr3357626e87.31.1784670182135;
        Tue, 21 Jul 2026 14:43:02 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9bada25sm131509e87.30.2026.07.21.14.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:43:01 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 2/2] staging: media: atomisp: remove unused functions from hmm_bo.c
Date: Wed, 22 Jul 2026 00:42:33 +0300
Message-ID: <20260721214238.840406-3-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721214238.840406-1-nikolayof23@gmail.com>
References: <20260721214238.840406-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove several functions that are defined but never called.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 .../media/atomisp/include/hmm/hmm_bo.h        | 19 ----
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 97 -------------------
 2 files changed, 116 deletions(-)

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

