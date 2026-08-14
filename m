Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE3447FB1E
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 15:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786720291; cv=none; b=K0sseINHjLi9P0Bcv8fWMlYTnQaUUFaQADI3mBrt8RcaZ/nqIZu5HuFuRnZsRhsZUJ+yR1FsqTYLst4RJm7uwDkZZ0ENAwb/6uqIL4xgmV1TOkpXY6stnzhB2OoGub13OqzsVG8bC+dlqqoJ/fV7JUYPUSMz1mJz0j946lbkOl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786720291; c=relaxed/simple;
	bh=Zb0JdRTTBpBFvd+zpRkd3VNQu6Q9tb1qFNVb5sh9jvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O71+WiPpcxl5aJ2fY3ICI6LSTYizEJ7ZZZuj+4HS3C5IYqJWXIzVUImDnr33ozGEf+dnwnQWb/MM/vuRvpHSlZJk57eIck90yUzSIZoUbNYQMR10p/h3CQHwd8RAGb4w0psaVObD3+b2emfOa9eFcOwRKQUHmR5Hx1iqoqKrNJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSGh6Tn7; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSGh6Tn7"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c7ed5410bso6403621fa.0
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 08:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786720287; x=1787325087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhSnA/jaMSVMwo72ij4kRp0HfOxnSGz5aEjAkXrBOFU=;
        b=OSGh6Tn7oZqt5MuVEOC4jA9feE7WVDdYqc0//pDUbZ9RM0eAQ4Xd4oiBcV3l6P7T6o
         pF7M1Xrgt0lYxBsQI1bgFKS4ePASpbYq/d5yxy2XMbhLeFdzmKkJ4MVrkHE9+JOxo7HV
         99DF5ZI206G3iEgJUUQYOjSv6/Q2MiYNVs3dYUBByHiRWw41wL4X2mnC/wKuSdx9v7XP
         nN/6t2RfMGOEDcBe2Q/nbeT5nKJMHVZXdx6IoaI2Ewrxzf2CbjsPrteEcP/7GZIFRdp2
         xBqGQ7fI/cwJmoGd2hP/vpsjQyBQ19CZqO/hZZ2WQfIwfQmYQ8NgBv7srN7GXqG6K/yE
         su2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786720287; x=1787325087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhSnA/jaMSVMwo72ij4kRp0HfOxnSGz5aEjAkXrBOFU=;
        b=T4bA3atRl/S8rX7Ulq6AQUhJe/zlDlv3JCYtnyFe8bb9uEL4ayoE4STO9eNpZ8/X6k
         YNb1CGGPn2a+nrf55TQDo9lDF70HPxxRRTW2jONG/Z26PBaGzJL2t3utdARouYgPNpGr
         BN0esyFU9GmvBqu6lKw1JjmFrc9CX1NL8BD//aPmvtR5G5q7bUKeKW6U7HbkyMfmbP6X
         F0UzJ4xxWEdGGf8mctnIWC9KXWOAgWSnix9OF9L8cYtYrDW54l3YU5ihD3s0GDN2k5L8
         qkJDsPHiecVeiTIZjuaRbwvK5T4JL4cOf+nVaIyrb3DNwPWgmeLqBy8vohCPL0G/+XxV
         AFmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1bxiNV6OQMn7/TLHyRLx+9KqNH8N0Pb4lc8kL5M0J2BPqjjhF9rYZZ3JWHAR+ElsgiRaIPJpczCOJTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyM+hc14nnCCZOGGmTEKFmQTxgtpR6S8Qq/ZevP/6FKpSmGXN7W
	TA4FFdC6oqimawHXpPM3mWGeIZNcNyjlpuShbPE2AsYUYGLN9gFm/pkc
X-Gm-Gg: AR+sD11+woRdyWkNdgC8ttxQqNVQBHPA2VN7cVy8pWoLqmWYp2Ab549ug6Dw0S7KHt/
	uiwbulobnFwaVp8QaYSOF41IHk3iP4fT1YVAYBPJszVyPbPh7/+Dv5J6kNq4Xzey0MUmxqPuNcR
	Jlqiy1Q5B4r5ZagSSiXV0tZ5O36HxWRJMId0ILaJDi3C6oqlDzARdldjdgKF2+ae8kBqt/bvPam
	DHkDKWl/UioE9tjJ1PeBsNr1nsi9uNo04wRETrxuPISjhCiiVZSsc7lzpi81V64Xijfpmz0gdVd
	2QDUF6mx85YOm71kH9nS4wnV5jIDm4IQNp56WrSYyWcSEFZrDvsTfIKjB4rEgM4IeTeYL889UdV
	DwxmUyLuphenORrG5B44oxpsDXtrYBdB1ZZvGJp9/mK9mTDouMtiwfcrsHVJ7h3vw9UJh4HKFwh
	4+oqvI85Igvv7B5ucc7sWRIH38QWu5XC1LheMWojr5jqojMxK2ctjWC+5F9Na98/Jkq+/B4w==
X-Received: by 2002:a2e:be85:0:b0:39c:8124:93b0 with SMTP id 38308e7fff4ca-3a1323d507bmr6746051fa.7.1786720287081;
        Fri, 14 Aug 2026 08:11:27 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130d204b2sm7138251fa.41.2026.08.14.08.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 08:11:26 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Fri, 14 Aug 2026 18:10:09 +0300
Subject: [PATCH v4 2/5] staging: media: atomisp: inline macros for checking
 the bo/bodev pointer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-atomisp_remove_hmm-v4-2-c3c954a12b51@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786720280; l=8419;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=Zb0JdRTTBpBFvd+zpRkd3VNQu6Q9tb1qFNVb5sh9jvk=;
 b=65vpxuAVvuqdRi/k+3qLyhNb5H++kFh8R8LHKfTviMxK1fGP2z3RoVvectNgNU6hv6+rA3Ccz
 3meV1B1nqTFCFoON7mmV2W7gi6jIZODVXXwUROxYkhCLi9M6/T/OnoH
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

These macros perform a pointer check. Replace it with direct conditional
expressions to simplify the code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h | 14 ----
 .../staging/media/atomisp/include/hmm/hmm_common.h |  6 --
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     | 96 +++++++++++++++++-----
 3 files changed, 76 insertions(+), 40 deletions(-)

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
index fd40e64e660e..9b29b6381abf 100644
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
@@ -937,7 +990,10 @@ static void kref_hmm_bo_release(struct kref *kref)
 
 void hmm_bo_unref(struct hmm_buffer_object *bo)
 {
-	check_bo_null_return_void(bo);
+	if (!bo) {
+		dev_err(atomisp_dev, "NULL hmm buffer object.\n");
+		return;
+	}
 
 	kref_put(&bo->kref, kref_hmm_bo_release);
 }

-- 
2.55.0

