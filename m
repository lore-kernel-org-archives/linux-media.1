Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444133B27C3
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 20:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568131; cv=none; b=rlRJn6ukCq7d/2v21k6lA7yRJ7NeE+SknyQUKLpg4HkYVUc0KxEyZCiVZCTVXLS8cfaby1j+9GNd9s0X59Jh8xL5EUZaco5XP4JGJjhfsTrnoXJX5pSts3UejFMu8BJpM9ib+XU69BJuNrGnX3qxjlPRq4AQ5X0bcbyuYUhGoh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568131; c=relaxed/simple;
	bh=6wQICQWyKl2ibwonxaDxgd+QgHh/waAeDTj7EAFYDcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GO3g4K9p+Rz86u/nySmC0+mj1/gvWVBhJNsliUotQJDmLZebR+JerscknagOFxluhaZWui7hV3PdItawvnsq7W57S6K9k2bk4Wz1kBhbh9Ihporcsg9Awq2jn3BXnN5xDUWX46YxwkqvNqUAymUlaX0peLz1mj9K/mBrSfV+vrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azPFjAkm; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azPFjAkm"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b2a4359d16so35421e87.3
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 13:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786568123; x=1787172923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L9idjNb9qT7I+5v2/X0Rr3tnkcDS+t1O2ybb3dbA6Ps=;
        b=azPFjAkm3jDsOn2eJuVM9h59vURURxQzXbhDh14CluIARb1zHiyjV+2fnCYG6rsTmW
         dgIrBDfAak78k+4i8JMbX0nxOdx1Q0ZxiBSgrUAbs1B7dqz0MjnllRU1GQZoHKhcDrJn
         8adJXtbNmYdxhciO3k6tun+oIRRI1eOEZIMBeYrCb2CcvdOohpZzjP24GLZDMgT9M9tu
         BRul6Rm6OFkb173X3/tshNKPCrNoSCFt5nhMBgzb/8o8YrGzZUuSbMob4Q2yxqqVG/cb
         fIdTlnSrItuROM3iFDSlN+RF1NGqByq9Ku/mMzpXgcRYj7cMizGfy/o6fp3HAKD4WtgJ
         uYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786568123; x=1787172923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L9idjNb9qT7I+5v2/X0Rr3tnkcDS+t1O2ybb3dbA6Ps=;
        b=Sf/Asvr2acqe+HhxaOyxweZp1BXDnkUvxJ8zrzW4GWhwKNSwo8GkCD9Yd57hDpRNti
         YEM1zNczWg0Q4qJ+RXXwT8UWAFm/2ZUcclCsnq2lngRewSikGq9dDdwqw/js0qzi8nS9
         1+xoZ64CoVpUyaU1sJ4k2z73QLX0ZUVsg+2014BLeYMljHxqH7OCaCS0UTnT55986wvm
         lX1nkq74j4JlRv2Ui2DgHN7P6ajxiXX6e7bHWOY//wWQ+JoeUh5oAnrUt8n3SEoLU7Ju
         Jvuqzjjvl0aNGtY2W/lKI7Pe0QZ61Pxv2zrFxd+oPbKUszKWBsGPqhMuY9zRFgIPzEvn
         D8Ag==
X-Gm-Message-State: AOJu0YwuZkTQMwXfvMOtoEKzmVgHpg2HxgQDG6cSiP0QL0txawxNPylF
	POv9OzZkm8wjUNGr+d6IfOr90/RB8QBw5jwIS6AOVQduZR1Xyvo9bOjt
X-Gm-Gg: AR+sD138vh1H9YI2CB4VTeHgzjFBMlb1KzvVQCxZSimnAvPaKbwaRD4jddGuJYS42rr
	Vh6cxrDiHHTMbau4PMNdQua5TDqq/a/+zYyRzVWV9B/vhBx2b7ZxJdUF+JX/IuySfnWrBTHd5OC
	P5ojaWkrCilK5gil4Sz3wi+5/8ZbRcJwJqt29lDVoS+e8NZX8RT983MZPzNipfcKCQC+FaZvjsp
	qeY7bdM4cskxEmC1UWtXzzpuQry0oQi+beTM7NT+iNJJZL4fF+la5bO+NKKt9t6nhJjS6GQii+Z
	zf3NsB6SKJwB/jkEHC0ngYg3RUzBuNallAV9G9IYKx1Zg5qorm9msReuwJlhc0d6uuooOzBfqBV
	LXjma/XuAEU/wK6uEZY1QQiE7NqFOfH5Ch00ZDp1m3cvLq58el8h4dME24WqkH8XM1rp6Pf6H/I
	mi906tTjeEGYS5+128fZ9strIbwup3OWcvV8MDVFm8U14KbVc1GqTf1T5W6dozNtfIEp9tvQ==
X-Received: by 2002:a05:6512:8383:b0:5ae:b6b1:5fcd with SMTP id 2adb3069b0e04-5b453f37160mr41200e87.10.1786568122505;
        Wed, 12 Aug 2026 13:55:22 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4539e9605sm60999e87.22.2026.08.12.13.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:55:21 -0700 (PDT)
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
Subject: [PATCH v3 2/5] staging: media: atomisp: inline macros for checking the bo/bodev pointer
Date: Wed, 12 Aug 2026 23:51:35 +0300
Message-ID: <20260812205429.39181-3-nikolayof23@gmail.com>
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

These macros perform a pointer check. Replace it with direct conditional
expressions to simplify the code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 .../media/atomisp/include/hmm/hmm_bo.h        |  14 ---
 .../media/atomisp/include/hmm/hmm_common.h    |   6 -
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 112 ++++++++++++++----
 3 files changed, 88 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index ba3c582a0f89..e974ab5ca2fc 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -19,14 +19,6 @@
 #include "hmm/hmm_common.h"
 #include "ia_css_types.h"
 
-#define	check_bodev_null_return(bdev, exp)	\
-		check_null_return(bdev, exp, \
-			"NULL hmm_bo_device.\n")
-
-#define	check_bodev_null_return_void(bdev)	\
-		check_null_return_void(bdev, \
-			"NULL hmm_bo_device.\n")
-
 #define	check_bo_status_yes_goto(bo, _status, label) \
 	var_not_equal_goto((bo->status & (_status)), (_status), \
 			label, \
@@ -48,12 +40,6 @@
 #define	kref_to_hmm_bo(kref_ptr)	\
 	list_entry((kref_ptr), struct hmm_buffer_object, kref)
 
-#define	check_bo_null_return(bo, exp)	\
-	check_null_return(bo, exp, "NULL hmm buffer object.\n")
-
-#define	check_bo_null_return_void(bo)	\
-	check_null_return_void(bo, "NULL hmm buffer object.\n")
-
 #define	ISP_VM_START	0x0
 #define	ISP_VM_SIZE	(0x7FFFFFFF)	/* 2G address space */
 #define	ISP_PTR_NULL	NULL
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_common.h b/drivers/staging/media/atomisp/include/hmm/hmm_common.h
index b251e96cc19d..f215130e5e17 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_common.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_common.h
@@ -51,10 +51,4 @@
 		} \
 	} while (0)
 
-#define	check_null_return(ptr, exp, fmt, arg ...)	\
-		var_equal_return(ptr, NULL, exp, fmt, ## arg)
-
-#define	check_null_return_void(ptr, fmt, arg ...)	\
-		var_equal_return_void(ptr, NULL, fmt, ## arg)
-
 #endif
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 837077f1d229..ecd920e49488 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -36,7 +36,10 @@
 static int __bo_init(struct hmm_bo_device *bdev, struct hmm_buffer_object *bo,
 		     unsigned int pgnr)
 {
-	check_bodev_null_return(bdev, -EINVAL);
+	if (!bdev) {
+		dev_err(atomisp_dev, "NULL hmm_bo_device.\n");
+		return -EINVAL;
+	}
 	/* prevent zero size buffer object */
 	if (pgnr == 0) {
 		dev_err(atomisp_dev, "0 size buffer is not allowed.\n");
@@ -324,7 +327,10 @@ int hmm_bo_device_init(struct hmm_bo_device *bdev,
 	unsigned long flags;
 	int ret;
 
-	check_bodev_null_return(bdev, -EINVAL);
+	if (!bdev) {
+		dev_err(atomisp_dev, "NULL hmm_bo_device.\n");
+		return -EINVAL;
+	}
 
 	ret = isp_mmu_init(&bdev->mmu, mmu_driver);
 	if (ret) {
@@ -382,9 +388,14 @@ struct hmm_buffer_object *hmm_bo_alloc(struct hmm_bo_device *bdev,
 				       unsigned int pgnr)
 {
 	struct hmm_buffer_object *bo, *new_bo;
-	struct rb_root *root = &bdev->free_rbtree;
+	struct rb_root *root;
+
+	if (!bdev) {
+		dev_err(atomisp_dev, "NULL hmm_bo_device.\n");
+		return NULL;
+	}
 
-	check_bodev_null_return(bdev, NULL);
+	root = &bdev->free_rbtree;
 	var_equal_return(hmm_bo_device_inited(bdev), 0, NULL,
 			 "hmm_bo_device not inited yet.\n");
 
@@ -493,7 +504,10 @@ void hmm_bo_device_exit(struct hmm_bo_device *bdev)
 
 	dev_dbg(atomisp_dev, "%s: entering!\n", __func__);
 
-	check_bodev_null_return_void(bdev);
+	if (!bdev) {
+		dev_err(atomisp_dev, "NULL hmm_bo_device.\n");
+		return;
+	}
 
 	/*
 	 * release all allocated bos even they a in use
@@ -526,14 +540,20 @@ void hmm_bo_device_exit(struct hmm_bo_device *bdev)
 
 int hmm_bo_device_inited(struct hmm_bo_device *bdev)
 {
-	check_bodev_null_return(bdev, -EINVAL);
+	if (!bdev) {
+		dev_err(atomisp_dev, "NULL hmm_bo_device.\n");
+		return -EINVAL;
+	}
 
 	return bdev->flag == HMM_BO_DEVICE_INITED;
 }
 
 int hmm_bo_allocated(struct hmm_buffer_object *bo)
 {
-	check_bo_null_return(bo, 0);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return 0;
+	}
 
 	return bo->status & HMM_BO_ALLOCED;
 }
@@ -543,7 +563,10 @@ struct hmm_buffer_object *hmm_bo_device_search_start(
 {
 	struct hmm_buffer_object *bo;
 
-	check_bodev_null_return(bdev, NULL);
+	if (!bdev) {
+		dev_err(atomisp_dev, "NULL hmm_bo_device.\n");
+		return NULL;
+	}
 
 	mutex_lock(&bdev->rbtree_mutex);
 	bo = __bo_search_by_addr(&bdev->allocated_rbtree, vaddr);
@@ -563,7 +586,10 @@ struct hmm_buffer_object *hmm_bo_device_search_in_range(
 {
 	struct hmm_buffer_object *bo;
 
-	check_bodev_null_return(bdev, NULL);
+	if (!bdev) {
+		dev_err(atomisp_dev, "NULL hmm_bo_device.\n");
+		return NULL;
+	}
 
 	mutex_lock(&bdev->rbtree_mutex);
 	bo = __bo_search_by_addr_in_range(&bdev->allocated_rbtree, vaddr);
@@ -653,9 +679,12 @@ int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 		       enum hmm_bo_type type,
 		       void *vmalloc_addr)
 {
-	int ret = -EINVAL;
+	int ret;
 
-	check_bo_null_return(bo, -EINVAL);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return -EINVAL;
+	}
 
 	mutex_lock(&bo->mutex);
 	check_bo_status_no_goto(bo, HMM_BO_PAGE_ALLOCED, status_err);
@@ -702,7 +731,10 @@ int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
  */
 void hmm_bo_free_pages(struct hmm_buffer_object *bo)
 {
-	check_bo_null_return_void(bo);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return;
+	}
 
 	mutex_lock(&bo->mutex);
 
@@ -731,7 +763,10 @@ void hmm_bo_free_pages(struct hmm_buffer_object *bo)
 
 int hmm_bo_page_allocated(struct hmm_buffer_object *bo)
 {
-	check_bo_null_return(bo, 0);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return 0;
+	}
 
 	return bo->status & HMM_BO_PAGE_ALLOCED;
 }
@@ -746,7 +781,10 @@ int hmm_bo_bind(struct hmm_buffer_object *bo)
 	struct hmm_bo_device *bdev;
 	unsigned int i;
 
-	check_bo_null_return(bo, -EINVAL);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return -EINVAL;
+	}
 
 	mutex_lock(&bo->mutex);
 
@@ -823,7 +861,10 @@ void hmm_bo_unbind(struct hmm_buffer_object *bo)
 	struct hmm_bo_device *bdev;
 	unsigned int i;
 
-	check_bo_null_return_void(bo);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return;
+	}
 
 	mutex_lock(&bo->mutex);
 
@@ -862,7 +903,10 @@ void hmm_bo_unbind(struct hmm_buffer_object *bo)
 
 void *hmm_bo_vmap(struct hmm_buffer_object *bo, bool cached)
 {
-	check_bo_null_return(bo, NULL);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return NULL;
+	}
 
 	mutex_lock(&bo->mutex);
 	if (((bo->status & HMM_BO_VMAPED) && !cached) ||
@@ -893,7 +937,10 @@ void *hmm_bo_vmap(struct hmm_buffer_object *bo, bool cached)
 
 void hmm_bo_flush_vmap(struct hmm_buffer_object *bo)
 {
-	check_bo_null_return_void(bo);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return;
+	}
 
 	mutex_lock(&bo->mutex);
 	if (!(bo->status & HMM_BO_VMAPED_CACHED) || !bo->vmap_addr) {
@@ -907,7 +954,10 @@ void hmm_bo_flush_vmap(struct hmm_buffer_object *bo)
 
 void hmm_bo_vunmap(struct hmm_buffer_object *bo)
 {
-	check_bo_null_return_void(bo);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return;
+	}
 
 	mutex_lock(&bo->mutex);
 	if (bo->status & HMM_BO_VMAPED || bo->status & HMM_BO_VMAPED_CACHED) {
@@ -922,7 +972,10 @@ void hmm_bo_vunmap(struct hmm_buffer_object *bo)
 
 void hmm_bo_ref(struct hmm_buffer_object *bo)
 {
-	check_bo_null_return_void(bo);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return;
+	}
 
 	kref_get(&bo->kref);
 }
@@ -937,16 +990,23 @@ static void kref_hmm_bo_release(struct kref *kref)
 
 void hmm_bo_unref(struct hmm_buffer_object *bo)
 {
-	check_bo_null_return_void(bo);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return;
+	}
 
 	kref_put(&bo->kref, kref_hmm_bo_release);
 }
 
 static void hmm_bo_vm_open(struct vm_area_struct *vma)
 {
-	struct hmm_buffer_object *bo = vma->vm_private_data;
+	struct hmm_buffer_object *bo;
 
-	check_bo_null_return_void(bo);
+	bo = vma->vm_private_data;
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return;
+	}
 
 	hmm_bo_ref(bo);
 
@@ -961,9 +1021,13 @@ static void hmm_bo_vm_open(struct vm_area_struct *vma)
 
 static void hmm_bo_vm_close(struct vm_area_struct *vma)
 {
-	struct hmm_buffer_object *bo = vma->vm_private_data;
+	struct hmm_buffer_object *bo;
 
-	check_bo_null_return_void(bo);
+	bo = vma->vm_private_data;
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return;
+	}
 
 	hmm_bo_unref(bo);
 
-- 
2.55.0

