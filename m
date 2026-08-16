Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDB23CFF72
	for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 19:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786909414; cv=none; b=KIRs6V9B0JYxkDJtOhmpw6eeqS/GilVdCKy9C3k/61DCsbpiTY9+gD1Ng8NZqVaRWd/eOF+LbcXLEuvcvCgGHoVjc8tkJ3Ali5lV2S5deIiFfd0QEAaOYtoDcSxIExJyT6pg7dDzl9xHgGt8Wn4V5IIb05vmuN0RlYvIPhZtw4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786909414; c=relaxed/simple;
	bh=jclIzQuM3bzXgFYxw+/3FbMjl+ULDlFfzy81qHBP2ow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fFFC2xHNVghVd2a8obRB+a2Fg8sUMhZKO9ykT/zU4bvekiF3Sm8mW+AOFDxBjyq7ewM48vweT8DgpqStM+9EpWWA/XgadUkug4pETO+d0tEQUmjY5gg24tO4aeFuecKddqm6loRm9bK2xRXDE4/c3gDLvEsV8z4jDmnmLt55Is0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sgC9Urf0; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgC9Urf0"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38101f85591so3369574a91.1
        for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 12:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786909412; x=1787514212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TmS/O1rRWa79hgNz7Dg/kJ8vBv2DQsi5CP/JVSYodyI=;
        b=sgC9Urf02XKbLoho/Q8QCD4j83vGA8FWRsJDg2hf06ejPOxVm3ObEKsUg9OoJkQKPE
         EQEYiChmPSVo2U+5XOB2I9b0Uq4H2FdcUdS8pVQaJWmUl/D+xLh5PprtjVItSozAwc0B
         A4PRFMc3WgebL/4v+5HVyVFfS02Drl/cGKGoD8WLtEFq+rIKtGORVXWWmWHNZX81PMT4
         Om05pPLmxSJ/8ixuuwWIdQ43ckuapbm/9OEOa0sICsU0nMAtulZaIxxZp8ZjmbJTluhR
         3xZ8lkApPKYKMdwilVEWB7H4GCqPnvdPSrb/ZH3tnGL5VQPRElBohmlgLZ/U1Q6g6G+Q
         HQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786909412; x=1787514212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TmS/O1rRWa79hgNz7Dg/kJ8vBv2DQsi5CP/JVSYodyI=;
        b=ZXgf+heUym+riUslOfz1q3RsUQN+NUBq346bh6a0ACcsltBhpHy3o9Nsrv8h2OiQU2
         Qo3FyncQRBTD2SjwJJSMk/2YDF192WFIQo0BONnLTEdJlpJXxDW6PDvVaNtyLyToyXKh
         3NVGLaiWLcLkYmVV6kJJpq8JMNY3mp8fPCxLxKyO3j7vawekCyv325ae/h3OnwORWOvo
         KWrbn57bYC9vKZZj6ZWBn/SAnzYWb9SdIHD5St7z6PEeoXTtT37AEapokHNxEfBqB/dx
         elejhrIvDDliF9zqIg3uNROu5UpfnykGxCmD52dlxysOSm38QxPzxaDeU8XARzrTveWT
         ATCg==
X-Forwarded-Encrypted: i=1; AHgh+RpKyW1qYnQMwRUYLZo2kzgB5pd0YGkVSl0YriU4tIxb19x1pNF4dGoBMxW6g9NQNH4/cBUuNib4uT6wWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTHtLSIthLQjloNjUzy2jeO+46qyChUU5grZWSvwF84zYx2V+R
	PnuEzY91ougrHST6KFXJF91cbZrmNADwnQROE6Uis3YomTc+YUE1qnoe
X-Gm-Gg: AR+sD11SB5bdtGIGY3h3viDwQleNVrX5c6tc4n0AlGgHy+FU845G8OPxDd5TtfssOjQ
	+ST60hG8352wAOQ1VX7fxzLdide4qadNgajXJTASoelDHUz2GrsJxHeDb6vzjhkDhMpVgnS4qFn
	DpeP9zskkGExTR0TxvnUOOiaoc8dthtNtR6yLYkWkTB4G7F6XKQYkAEnPMAoboaFrYIrZNtZgPx
	eUHpxl8drgnFDfra0DRU94MoYdwk3ELWTC/K8XjOAAQRMrdfYdeZA2G+aBfVCsmLcCD6Bgv5vCC
	ktl3Tq7fD1w3WjNizSdHi5l1Ti5fi/oqnPIF7OoDh3ihelo2dqFnmTV5QPko/vyGiCxFjoIeD5g
	AXaHNYHJ/yrJ6o+GLvKp+rNKwIiOGC7/B/tZgMh3p6fDn83ZcfpumD87N65CmAFkOkzNikBPg6F
	r9H0U8/bejM6+dhh33SfNmM17weIm9hdjzVufqvWwj5NMfrE5He8A1IQ==
X-Received: by 2002:a17:90b:1dcb:b0:38e:5ce1:ae30 with SMTP id 98e67ed59e1d1-3933b0d37ebmr14980176a91.14.1786909411881;
        Sun, 16 Aug 2026 12:43:31 -0700 (PDT)
Received: from [127.0.1.1] ([1.243.227.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395320229f4sm2141310a91.15.2026.08.16.12.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 12:43:31 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
Date: Mon, 17 Aug 2026 04:42:11 +0900
Subject: [PATCH 4/4] drm/imagination: Add sparse mappings to VM_BIND
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-pvr-vm-bind-v1-4-0a0f21be7d38@gmail.com>
References: <20260817-pvr-vm-bind-v1-0-0a0f21be7d38@gmail.com>
In-Reply-To: <20260817-pvr-vm-bind-v1-0-0a0f21be7d38@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matt Coster <opensource@mtcoster.net>, 
 Donald Robson <donald.robson@imgtec.com>, 
 Sarah Walker <sarah.walker@imgtec.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Gyeyoung Baek <gye976@gmail.com>
X-Mailer: b4 0.15.1

Vulkan sparse residency requires that an access to an unbound part of a
sparse resource does not fault, so a range has to be mappable without
naming any buffer object.

Add DRM_PVR_VM_BIND_OP_MAP_SPARSE:
every page table entry of the range points at the same dummy page,
so the mapping costs one physical page however wide it is.

The dummy is created per file rather than per device - writes to a sparse
range stay in this page, and one shared device-wide would let clients see
each other's writes.

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_device.h |  9 ++++
 drivers/gpu/drm/imagination/pvr_drv.c    | 14 ++++++-
 drivers/gpu/drm/imagination/pvr_drv.h    |  1 +
 drivers/gpu/drm/imagination/pvr_mmu.c    | 71 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_mmu.h    |  2 +
 drivers/gpu/drm/imagination/pvr_vm.c     | 52 ++++++++++++++++++-----
 include/uapi/drm/pvr_drm.h               | 32 +++++++++++---
 7 files changed, 164 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index d51c57cf933..133b5c789bf 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -380,6 +380,15 @@ struct pvr_file {
 	 */
 	struct xarray hwrt_handles;
 
+	/**
+	 * @sparse_dummy_bo: Single page every sparse mapping made through this
+	 * file points at.
+	 *
+	 * Writes to a sparse range land here, so it is kept per file rather
+	 * than per device to keep them out of other clients' view.
+	 */
+	struct pvr_gem_object *sparse_dummy_bo;
+
 	/**
 	 * @vm_ctx_handles: Array of VM contexts belonging to this file. Array
 	 * members are of type "struct pvr_vm_context *".
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index ec6ed610e29..ae11fbf7528 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1402,11 +1402,21 @@ static int
 pvr_drm_driver_open(struct drm_device *drm_dev, struct drm_file *file)
 {
 	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
+	struct pvr_gem_object *dummy_bo;
 	struct pvr_file *pvr_file;
 
+	dummy_bo = pvr_gem_object_create(pvr_dev, PVR_DEVICE_PAGE_SIZE,
+					 DRM_PVR_BO_BYPASS_DEVICE_CACHE);
+	if (IS_ERR(dummy_bo))
+		return PTR_ERR(dummy_bo);
+
 	pvr_file = kzalloc_obj(*pvr_file);
-	if (!pvr_file)
+	if (!pvr_file) {
+		pvr_gem_object_put(dummy_bo);
 		return -ENOMEM;
+	}
+
+	pvr_file->sparse_dummy_bo = dummy_bo;
 
 	/*
 	 * Store reference to base DRM file private data for use by
@@ -1460,6 +1470,8 @@ pvr_drm_driver_postclose(__always_unused struct drm_device *drm_dev,
 	pvr_destroy_hwrt_datasets_for_file(pvr_file);
 	pvr_destroy_vm_contexts_for_file(pvr_file);
 
+	pvr_gem_object_put(pvr_file->sparse_dummy_bo);
+
 	kfree(pvr_file);
 	file->driver_priv = NULL;
 }
diff --git a/drivers/gpu/drm/imagination/pvr_drv.h b/drivers/gpu/drm/imagination/pvr_drv.h
index 9ca8f8780a3..109b99ea062 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.h
+++ b/drivers/gpu/drm/imagination/pvr_drv.h
@@ -14,6 +14,7 @@
  * Driver interface version:
  *  - 1.0: Initial interface
  *  - 1.1: adds DRM_IOCTL_PVR_VM_BIND
+ *         adds DRM_PVR_VM_BIND_OP_MAP_SPARSE flag
  */
 #define PVR_DRIVER_MAJOR 1
 #define PVR_DRIVER_MINOR 1
diff --git a/drivers/gpu/drm/imagination/pvr_mmu.c b/drivers/gpu/drm/imagination/pvr_mmu.c
index 3cac482e103..fc1347d6f23 100644
--- a/drivers/gpu/drm/imagination/pvr_mmu.c
+++ b/drivers/gpu/drm/imagination/pvr_mmu.c
@@ -2558,6 +2558,77 @@ pvr_mmu_map_sgl(struct pvr_mmu_op_context *op_ctx, struct scatterlist *sgl,
 	return err;
 }
 
+/**
+ * pvr_mmu_map_dummy() - Point a range of device-virtual memory at a single
+ * repeated physical page.
+ * @op_ctx: Target MMU op context.
+ * @size: Size of memory to be mapped in bytes. Must be a non-zero multiple
+ * of the device page size.
+ * @flags: Flags from pvr_gem_object associated with the mapping.
+ * @device_addr: Virtual device address to map to. Must be device page-aligned.
+ *
+ * Every entry of the range is pointed at the first page of
+ * &pvr_mmu_op_context.map.sgt, so the mapping costs one page whatever @size is.
+ *
+ * Return:
+ *  * 0 on success,
+ *  * -%EINVAL if @size or @device_addr is misaligned, or
+ *  * Any error encountered while creating a page with pvr_page_create(), or
+ *  * Any error encountered while advancing @op_ctx.curr_page.
+ */
+int pvr_mmu_map_dummy(struct pvr_mmu_op_context *op_ctx, u64 size, u64 flags,
+		      u64 device_addr)
+{
+	const u64 pages = size >> PVR_DEVICE_PAGE_SHIFT;
+	struct pvr_page_table_ptr ptr_copy;
+	struct pvr_page_flags_raw flags_raw;
+	dma_addr_t dma_addr;
+	u64 page;
+	int err;
+
+	if (!size)
+		return 0;
+
+	if (size & ~PVR_DEVICE_PAGE_MASK)
+		return -EINVAL;
+
+	dma_addr = sg_dma_address(op_ctx->map.sgt->sgl);
+
+	err = pvr_mmu_op_context_set_curr_page(op_ctx, device_addr, true);
+	if (err)
+		return -EINVAL;
+
+	memcpy(&ptr_copy, &op_ctx->curr_page, sizeof(ptr_copy));
+
+	flags_raw = pvr_page_flags_raw_create(false, false,
+					      flags & DRM_PVR_BO_BYPASS_DEVICE_CACHE,
+					      flags & DRM_PVR_BO_PM_FW_PROTECT);
+
+	err = pvr_page_create(op_ctx, dma_addr, flags_raw);
+	if (err)
+		return err;
+
+	for (page = 1; page < pages; ++page) {
+		err = pvr_mmu_op_context_next_page(op_ctx, true);
+		if (err)
+			goto err_destroy_pages;
+
+		err = pvr_page_create(op_ctx, dma_addr, flags_raw);
+		if (err)
+			goto err_destroy_pages;
+	}
+
+	pvr_mmu_op_context_require_sync(op_ctx, PVR_MMU_SYNC_LEVEL_0);
+
+	return 0;
+
+err_destroy_pages:
+	memcpy(&op_ctx->curr_page, &ptr_copy, sizeof(op_ctx->curr_page));
+	pvr_mmu_op_context_unmap_curr_page(op_ctx, page);
+
+	return err;
+}
+
 /**
  * pvr_mmu_map() - Map an object's virtual memory to physical memory.
  * @op_ctx: Target MMU op context.
diff --git a/drivers/gpu/drm/imagination/pvr_mmu.h b/drivers/gpu/drm/imagination/pvr_mmu.h
index a8ecd460168..b014ea8efb0 100644
--- a/drivers/gpu/drm/imagination/pvr_mmu.h
+++ b/drivers/gpu/drm/imagination/pvr_mmu.h
@@ -101,6 +101,8 @@ struct pvr_mmu_op_context *
 pvr_mmu_op_context_create(struct pvr_mmu_context *ctx,
 			  struct sg_table *sgt, u64 sgt_offset, u64 size);
 
+int pvr_mmu_map_dummy(struct pvr_mmu_op_context *op_ctx, u64 size, u64 flags,
+		      u64 device_addr);
 int pvr_mmu_map(struct pvr_mmu_op_context *op_ctx, u64 size, u64 flags,
 		u64 device_addr);
 int pvr_mmu_unmap(struct pvr_mmu_op_context *op_ctx, u64 device_addr, u64 size);
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index f92bfeacd7a..d11e192c772 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -200,6 +200,12 @@ struct pvr_vm_bind_op {
 	 */
 	struct pvr_vm_gpuva *next_va;
 
+	/**
+	 * @sparse: The mapping repeats the file's dummy page rather than
+	 * covering real pages of @pvr_obj.
+	 */
+	bool sparse;
+
 	/** @offset: Offset into @pvr_obj to begin mapping from. */
 	u64 offset;
 
@@ -267,7 +273,7 @@ static int
 pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 			struct pvr_vm_context *vm_ctx,
 			struct pvr_gem_object *pvr_obj, u64 offset,
-			u64 device_addr, u64 size)
+			u64 device_addr, u64 size, bool sparse)
 {
 	struct drm_gem_object *obj = gem_from_pvr_gem(pvr_obj);
 	const bool is_user = vm_ctx != vm_ctx->pvr_dev->kernel_vm_ctx;
@@ -285,11 +291,19 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 	}
 
 	if (!pvr_device_addr_and_size_are_valid(vm_ctx, device_addr, size) ||
-	    offset & ~PAGE_MASK || size & ~PAGE_MASK ||
-	    offset >= pvr_obj_size || offset_plus_size > pvr_obj_size)
+	    offset & ~PAGE_MASK || size & ~PAGE_MASK)
+		return -EINVAL;
+
+	/*
+	 * A sparse mapping repeats one page over a deliberately wider range,
+	 * so the containment check only applies to ordinary mappings.
+	 */
+	if (!sparse &&
+	    (offset >= pvr_obj_size || offset_plus_size > pvr_obj_size))
 		return -EINVAL;
 
 	bind_op->type = PVR_VM_BIND_TYPE_MAP;
+	bind_op->sparse = sparse;
 
 	bind_op->gpuvm_bo = drm_gpuvm_bo_create(&vm_ctx->gpuvm_mgr, obj);
 	if (!bind_op->gpuvm_bo)
@@ -396,8 +410,12 @@ pvr_vm_gpuva_map(struct drm_gpuva_op *op, void *op_ctx)
 	if ((op->map.gem.offset | op->map.va.range) & ~PVR_DEVICE_PAGE_MASK)
 		return -EINVAL;
 
-	err = pvr_mmu_map(ctx->mmu_op_ctx, op->map.va.range, pvr_gem->flags,
-			  op->map.va.addr);
+	if (ctx->sparse)
+		err = pvr_mmu_map_dummy(ctx->mmu_op_ctx, op->map.va.range,
+					pvr_gem->flags, op->map.va.addr);
+	else
+		err = pvr_mmu_map(ctx->mmu_op_ctx, op->map.va.range,
+				  pvr_gem->flags, op->map.va.addr);
 	if (err)
 		return err;
 
@@ -790,7 +808,7 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
 
 	int err = pvr_vm_bind_op_map_init(&bind_op, vm_ctx, pvr_obj,
 					  pvr_obj_offset, device_addr,
-					  size);
+					  size, false);
 
 	if (err)
 		return err;
@@ -1475,14 +1493,25 @@ pvr_vm_bind_op_init_from_uapi(struct pvr_vm_bind_op *bind_op,
 
 	switch (uapi_op->flags & DRM_PVR_VM_BIND_OP_TYPE_MASK) {
 	case DRM_PVR_VM_BIND_OP_TYPE_MAP:
-		pvr_obj = pvr_gem_object_from_handle(pvr_file, uapi_op->handle);
-		if (!pvr_obj)
-			return -ENOENT;
+		if (uapi_op->flags & DRM_PVR_VM_BIND_OP_MAP_SPARSE) {
+			if (uapi_op->handle || uapi_op->offset)
+				return -EINVAL;
+
+			pvr_obj = pvr_file->sparse_dummy_bo;
+			pvr_gem_object_get(pvr_obj);
+		} else {
+			pvr_obj = pvr_gem_object_from_handle(pvr_file,
+							     uapi_op->handle);
+			if (!pvr_obj)
+				return -ENOENT;
+		}
 
 		err = pvr_vm_bind_op_map_init(bind_op, vm_ctx, pvr_obj,
 					      uapi_op->offset,
 					      uapi_op->device_addr,
-					      uapi_op->size);
+					      uapi_op->size,
+					      uapi_op->flags &
+					      DRM_PVR_VM_BIND_OP_MAP_SPARSE);
 		if (err) {
 			pvr_gem_object_put(pvr_obj);
 			return err;
@@ -1494,6 +1523,9 @@ pvr_vm_bind_op_init_from_uapi(struct pvr_vm_bind_op *bind_op,
 		if (uapi_op->handle || uapi_op->offset)
 			return -EINVAL;
 
+		if (uapi_op->flags & DRM_PVR_VM_BIND_OP_MAP_SPARSE)
+			return -EINVAL;
+
 		return pvr_vm_bind_op_unmap_init(bind_op, vm_ctx, NULL,
 						 uapi_op->device_addr,
 						 uapi_op->size);
diff --git a/include/uapi/drm/pvr_drm.h b/include/uapi/drm/pvr_drm.h
index eb1535cd513..5cb63eb8182 100644
--- a/include/uapi/drm/pvr_drm.h
+++ b/include/uapi/drm/pvr_drm.h
@@ -1309,27 +1309,45 @@ struct drm_pvr_ioctl_submit_jobs_args {
  * DOC: Flags for VM_BIND operations.
  *
  * The type of a VM bind operation is stored in the top four bits of
- * &drm_pvr_vm_bind_op.flags.
+ * &drm_pvr_vm_bind_op.flags. The remaining bits carry modifiers, each of which
+ * is only valid with one type.
+ *
+ * .. c:macro:: DRM_PVR_VM_BIND_OP_MAP_SPARSE
+ *
+ *    Sparsely map a range of virtual addresses, without naming a buffer
+ *    object. Only valid with %DRM_PVR_VM_BIND_OP_TYPE_MAP;
+ *    &drm_pvr_vm_bind_op.handle and &drm_pvr_vm_bind_op.offset must both be
+ *    zero.
+ *
+ *    GPU accesses to the range do not fault. Reads return undefined values,
+ *    and writes may become visible through other sparse mappings. Nothing
+ *    more is guaranteed; in particular
+ *    %VkPhysicalDeviceSparseProperties.residencyNonResidentStrict is not
+ *    provided.
  *
  * .. c:macro:: DRM_PVR_VM_BIND_OP_TYPE_MAP
  *
  *    Create a new mapping. &drm_pvr_vm_bind_op.handle must be a valid buffer
- *    object handle.
+ *    object handle, unless %DRM_PVR_VM_BIND_OP_MAP_SPARSE is also set.
  *
  * .. c:macro:: DRM_PVR_VM_BIND_OP_TYPE_UNMAP
  *
  *    Remove existing mappings. &drm_pvr_vm_bind_op.handle and
- *    &drm_pvr_vm_bind_op.offset must both be zero.
+ *    &drm_pvr_vm_bind_op.offset must both be zero, as must
+ *    %DRM_PVR_VM_BIND_OP_MAP_SPARSE.
  *
  * .. c:macro:: DRM_PVR_VM_BIND_OP_TYPE_MASK
  *
  *    Mask used to extract the operation type.
  */
+#define DRM_PVR_VM_BIND_OP_MAP_SPARSE _BITUL(0)
+
 #define DRM_PVR_VM_BIND_OP_TYPE_MAP (0u << 28)
 #define DRM_PVR_VM_BIND_OP_TYPE_UNMAP (1u << 28)
 #define DRM_PVR_VM_BIND_OP_TYPE_MASK (0xfu << 28)
 
-#define DRM_PVR_VM_BIND_OP_FLAGS_MASK DRM_PVR_VM_BIND_OP_TYPE_MASK
+#define DRM_PVR_VM_BIND_OP_FLAGS_MASK \
+	(DRM_PVR_VM_BIND_OP_MAP_SPARSE | DRM_PVR_VM_BIND_OP_TYPE_MASK)
 
 /**
  * struct drm_pvr_vm_bind_op - A single VM bind operation.
@@ -1342,13 +1360,15 @@ struct drm_pvr_vm_bind_op {
 	 * @handle: [IN] Handle of the target buffer object.
 	 *
 	 * Must be a valid handle returned by %DRM_IOCTL_PVR_CREATE_BO for map
-	 * operations. MBZ for unmap operations.
+	 * operations. MBZ for unmap operations, and for sparse map operations,
+	 * which have no buffer object to name.
 	 */
 	__u32 handle;
 
 	/**
 	 * @offset: [IN] Offset into the target buffer object from which to
-	 * begin the mapping. MBZ for unmap operations.
+	 * begin the mapping. MBZ for unmap operations and for sparse map
+	 * operations.
 	 */
 	__u64 offset;
 

-- 
2.43.0

