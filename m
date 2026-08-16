Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03D33CC303
	for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 19:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786909405; cv=none; b=HH7xWy2+NMaV5oqaKK5yuAU0ssZnhmnX7JdLGDXaavnnqLA1KQqA9g2Fr5lyfn+Kea03X1PCGLTmCQ+2I4EyJVm1Dt3Xx9w+o/6KEhtdCVTCJQUvY0buw2U4uJq7g8+TIcl7SxkHfyNa374ANZUzB0fUEIoGebfk4qYsT+aLghE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786909405; c=relaxed/simple;
	bh=sYxnPVEhCDpcjqtHmfMq97hrhqo0Eo0qcmO6jrU5/zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UToiZc5SxKki+Jnh7LoQF5pJTKw5h1KSjjdPpMjYdb7FMqG8JhFYwQEK1MqJDG6vfb6OX89jVrKck0IJAk9N85JcRRpY3Ku0Eize4d2mwDNmJfZe/0RTfcYrm9hGuneCY8oR1ZS71geSORBfg5KlGP7CaIO5J1Lg1R4/gQwB5BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXIaSy+e; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXIaSy+e"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-383cb94f742so3220254a91.3
        for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 12:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786909403; x=1787514203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+SXbBJ78nn/6ntIYDKfcWHsXpFCebrOGrhFTWiZhXyw=;
        b=iXIaSy+e4rtCdscObIPSklSSt7yqyP2gHw6Z+xXcgGQ29Wxy7VWNBT+JoG0RVQRHaG
         Nn59tHggdpt1PH+U/HlXP6gLrWM9j8t78MTEzsa4lRbvuorqMauxF2iBQZpMyqCFNG51
         be1d1TiCoiLbToSE8vDDtA0ON37q776PdXMHCK0dCbp1OF4YcVaWtIE73HvKtyltCmYI
         EWBOpZAsA4g5XmG27ZP8665WcqEt6DhfvxyEfaYdY4bOmAvVVtFcJLtU24M15oPSLpKq
         TA8uVsPhQDpuKi14H40jkvo4SaRQPynONr291QgX6v1i+lf6ObgaUiAOhpEnoATR2OrB
         B5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786909403; x=1787514203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+SXbBJ78nn/6ntIYDKfcWHsXpFCebrOGrhFTWiZhXyw=;
        b=io0WT77WS/Dp0z+tYVbnGYIwWtlMvI6MjvnjqzPK5NebX1wZSbQY9MswvTTK/inIk3
         QgkS3hsNVNDCxgIPb8MSeWm9rDn8E+cNe3YFsIPhH5u8Z+svz19kWYzafR0mqdvzKKKT
         kI0AG7d+4N885VsP075ac8Uo73S1387gcs8B16T2BJt4k+UntU9vt2wzj7PoQXnquC0f
         43l4GWznb5rh25QeG5jK8x6q2caILKYTMvMOMfEiLBJjmgJfM/hUMsxAWN9aIoDF3zeu
         bzCs33NWesm7e/Iy/K64Gm9K+0Gv+cypSU/RXnLEar4QrD4Vftfk4RlPJOvTiVVolk+o
         Lm+A==
X-Forwarded-Encrypted: i=1; AHgh+RqjDC0JVYoE4+Pp7AbClUOyK5ehVkvQ8D3BfclBG/swt2HIo1vVX1Q4+9VTb8xC/zAahrjWmnCLZhQxuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtAeZlnbxcCqQXHfmLDVPn5Bcc5RpXDYMCSsSSQmtM8r2df8/o
	59/0wjntwzU3iHgqq97+51uzwjzH/BQIBjttgi5Zl06/b/Hm7TCO68OT
X-Gm-Gg: AR+sD12NdErwJWSUW6IYN5c51Wl+/6dGMIcPKFETaMdKYhGuptDm2uGthmQ6t/lyztU
	T7UoAgoeDmCYAU+xJJf9u+ClVEiblJiz/KLfXZMcRU1chLzaF6gtwsLfp7ut9TA5OJARigL2UKy
	/vUCzb7EiUlge4B5N18oEMHU/HABngaI1Xs84QFVqQPcCePVKi5xqZgVpUBqf+m0eMGzGggc3qO
	Acqc7g1EJ81mFw2lXGgva3buwiYnVywSQ78DdJVqKHqikRRYWNyR45Yyf02K4E74GLfdpTg3PIF
	oONopWwrETLNRPPvMvMtpm6tr6ey5DCYKhbUoWXKOLT2yFiIqJzG+eJRIbvLQ8JhyOb+CtPzS7U
	/aQE+ro/8reQWpfQulFDJlBp60SpIFGMi3Ly5YK3PsOH+ml0OEq9HIqxdEySr6iVNfdybnY0xOs
	/Jclzanii/7XSfNNcY1YyvDfg7GpSbLyqhJAClzx5qW1MpKoClS797bQ==
X-Received: by 2002:a17:90b:1651:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-3933e633478mr19319456a91.15.1786909403036;
        Sun, 16 Aug 2026 12:43:23 -0700 (PDT)
Received: from [127.0.1.1] ([1.243.227.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395320229f4sm2141310a91.15.2026.08.16.12.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 12:43:22 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
Date: Mon, 17 Aug 2026 04:42:09 +0900
Subject: [PATCH 2/4] drm/imagination: Switch the GPUVM to immediate mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-pvr-vm-bind-v1-2-0a0f21be7d38@gmail.com>
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

In preparation for the asynchronous VM_BIND that follows.

Why DRM_GPUVM_IMMEDIATE_MODE is needed:

Running binds from a async-job makes a deadlock. run_job() takes a BO's
dma_resv to update that BO's gpuva list, and has to signal a fence once
done(=signalling section). Another thread can be holding the same dma_resv
while waiting on that fence, so the two wait on each other.

Switching to DRM_GPUVM_IMMEDIATE_MODE requires two things:

1. Drop drm_gpuvm_exec.

   It calls dma_resv_lock() internally, which is the path that deadlocks.
   It did also serve as the address space tree lock, so take
   pvr_vm_context::lock explicitly instead.

2. Let the GEM's gpuva.lock protect the list.

   That lock is only ever held across list surgery, so no fence waiter can
   be holding it. Panthor went this way first, for the same reason.

No functional change intended.

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_vm.c | 80 +++++++++++++-----------------------
 1 file changed, 29 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 608e8c0467d..45df76e61f7 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -214,7 +214,7 @@ static int pvr_vm_bind_op_exec(struct pvr_vm_bind_op *bind_op)
 
 static void pvr_vm_bind_op_fini(struct pvr_vm_bind_op *bind_op)
 {
-	drm_gpuvm_bo_put(bind_op->gpuvm_bo);
+	drm_gpuvm_bo_put_deferred(bind_op->gpuvm_bo);
 
 	kfree(bind_op->new_va);
 	kfree(bind_op->prev_va);
@@ -255,11 +255,11 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 
 	bind_op->type = PVR_VM_BIND_TYPE_MAP;
 
-	dma_resv_lock(obj->resv, NULL);
-	bind_op->gpuvm_bo = drm_gpuvm_bo_obtain_locked(&vm_ctx->gpuvm_mgr, obj);
-	dma_resv_unlock(obj->resv);
-	if (IS_ERR(bind_op->gpuvm_bo))
-		return PTR_ERR(bind_op->gpuvm_bo);
+	bind_op->gpuvm_bo = drm_gpuvm_bo_create(&vm_ctx->gpuvm_mgr, obj);
+	if (!bind_op->gpuvm_bo)
+		return -ENOMEM;
+
+	bind_op->gpuvm_bo = drm_gpuvm_bo_obtain_prealloc(bind_op->gpuvm_bo);
 
 	bind_op->new_va = kzalloc_obj(*bind_op->new_va);
 	bind_op->prev_va = kzalloc_obj(*bind_op->prev_va);
@@ -366,7 +366,11 @@ pvr_vm_gpuva_map(struct drm_gpuva_op *op, void *op_ctx)
 		return err;
 
 	drm_gpuva_map(&ctx->vm_ctx->gpuvm_mgr, &ctx->new_va->base, &op->map);
+
+	mutex_lock(&op->map.gem.obj->gpuva.lock);
 	drm_gpuva_link(&ctx->new_va->base, ctx->gpuvm_bo);
+	mutex_unlock(&op->map.gem.obj->gpuva.lock);
+
 	ctx->new_va = NULL;
 
 	return 0;
@@ -396,7 +400,7 @@ pvr_vm_gpuva_unmap(struct drm_gpuva_op *op, void *op_ctx)
 		return err;
 
 	drm_gpuva_unmap(&op->unmap);
-	drm_gpuva_unlink(op->unmap.va);
+	drm_gpuva_unlink_defer(op->unmap.va);
 	kfree(to_pvr_vm_gpuva(op->unmap.va));
 
 	return 0;
@@ -419,6 +423,7 @@ static int
 pvr_vm_gpuva_remap(struct drm_gpuva_op *op, void *op_ctx)
 {
 	struct drm_gpuva *unmap_va = op->remap.unmap->va;
+	struct drm_gem_object *obj = unmap_va->gem.obj;
 	struct drm_gpuvm_bo *vm_bo = unmap_va->vm_bo;
 	struct pvr_vm_bind_op *ctx = op_ctx;
 	u64 va_start = 0, va_range = 0;
@@ -436,17 +441,21 @@ pvr_vm_gpuva_remap(struct drm_gpuva_op *op, void *op_ctx)
 
 	if (op->remap.prev) {
 		pvr_gem_object_get(gem_to_pvr_gem(ctx->prev_va->base.gem.obj));
+		mutex_lock(&obj->gpuva.lock);
 		drm_gpuva_link(&ctx->prev_va->base, vm_bo);
+		mutex_unlock(&obj->gpuva.lock);
 		ctx->prev_va = NULL;
 	}
 
 	if (op->remap.next) {
 		pvr_gem_object_get(gem_to_pvr_gem(ctx->next_va->base.gem.obj));
+		mutex_lock(&obj->gpuva.lock);
 		drm_gpuva_link(&ctx->next_va->base, vm_bo);
+		mutex_unlock(&obj->gpuva.lock);
 		ctx->next_va = NULL;
 	}
 
-	drm_gpuva_unlink(unmap_va);
+	drm_gpuva_unlink_defer(unmap_va);
 	kfree(to_pvr_vm_gpuva(unmap_va));
 
 	return 0;
@@ -590,7 +599,8 @@ pvr_vm_create_context(struct pvr_device *pvr_dev, bool is_userspace_context)
 	drm_gem_private_object_init(&pvr_dev->base, &vm_ctx->dummy_gem, 0);
 	drm_gpuvm_init(&vm_ctx->gpuvm_mgr,
 		       is_userspace_context ? "PowerVR-user-VM" : "PowerVR-FW-VM",
-		       0, &pvr_dev->base, &vm_ctx->dummy_gem,
+		       DRM_GPUVM_IMMEDIATE_MODE, &pvr_dev->base,
+		       &vm_ctx->dummy_gem,
 		       0, 1ULL << device_addr_bits, 0, 0, &pvr_vm_gpuva_ops);
 
 	mutex_init(&vm_ctx->lock);
@@ -624,6 +634,7 @@ pvr_vm_context_release(struct kref *ref_count)
 		pvr_fw_object_destroy(vm_ctx->fw_mem_ctx_obj);
 
 	pvr_vm_unmap_all(vm_ctx);
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
 
 	pvr_mmu_context_destroy(vm_ctx->mmu_ctx);
 	drm_gem_private_object_fini(&vm_ctx->dummy_gem);
@@ -693,16 +704,6 @@ void pvr_destroy_vm_contexts_for_file(struct pvr_file *pvr_file)
 	}
 }
 
-static int
-pvr_vm_lock_extra(struct drm_gpuvm_exec *vm_exec)
-{
-	struct pvr_vm_bind_op *bind_op = vm_exec->extra.priv;
-	struct pvr_gem_object *pvr_obj = bind_op->pvr_obj;
-
-	/* Acquire lock on the GEM object being mapped/unmapped. */
-	return drm_exec_lock_obj(&vm_exec->exec, gem_from_pvr_gem(pvr_obj));
-}
-
 /**
  * pvr_vm_map() - Map a section of physical memory into a section of
  * device-virtual memory.
@@ -730,15 +731,6 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
 	   u64 pvr_obj_offset, u64 device_addr, u64 size)
 {
 	struct pvr_vm_bind_op bind_op = {0};
-	struct drm_gpuvm_exec vm_exec = {
-		.vm = &vm_ctx->gpuvm_mgr,
-		.flags = DRM_EXEC_INTERRUPTIBLE_WAIT |
-			 DRM_EXEC_IGNORE_DUPLICATES,
-		.extra = {
-			.fn = pvr_vm_lock_extra,
-			.priv = &bind_op,
-		},
-	};
 
 	int err = pvr_vm_bind_op_map_init(&bind_op, vm_ctx, pvr_obj,
 					  pvr_obj_offset, device_addr,
@@ -749,16 +741,12 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
 
 	pvr_gem_object_get(pvr_obj);
 
-	err = drm_gpuvm_exec_lock(&vm_exec);
-	if (err)
-		goto err_cleanup;
-
+	mutex_lock(&vm_ctx->lock);
 	err = pvr_vm_bind_op_exec(&bind_op);
+	mutex_unlock(&vm_ctx->lock);
 
-	drm_gpuvm_exec_unlock(&vm_exec);
-
-err_cleanup:
 	pvr_vm_bind_op_fini(&bind_op);
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
 
 	return err;
 }
@@ -787,15 +775,6 @@ pvr_vm_unmap_obj_locked(struct pvr_vm_context *vm_ctx,
 			u64 device_addr, u64 size)
 {
 	struct pvr_vm_bind_op bind_op = {0};
-	struct drm_gpuvm_exec vm_exec = {
-		.vm = &vm_ctx->gpuvm_mgr,
-		.flags = DRM_EXEC_INTERRUPTIBLE_WAIT |
-			 DRM_EXEC_IGNORE_DUPLICATES,
-		.extra = {
-			.fn = pvr_vm_lock_extra,
-			.priv = &bind_op,
-		},
-	};
 
 	int err = pvr_vm_bind_op_unmap_init(&bind_op, vm_ctx, pvr_obj,
 					    device_addr, size);
@@ -804,15 +783,8 @@ pvr_vm_unmap_obj_locked(struct pvr_vm_context *vm_ctx,
 
 	pvr_gem_object_get(pvr_obj);
 
-	err = drm_gpuvm_exec_lock(&vm_exec);
-	if (err)
-		goto err_cleanup;
-
 	err = pvr_vm_bind_op_exec(&bind_op);
 
-	drm_gpuvm_exec_unlock(&vm_exec);
-
-err_cleanup:
 	pvr_vm_bind_op_fini(&bind_op);
 
 	return err;
@@ -840,6 +812,8 @@ pvr_vm_unmap_obj(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
 	err = pvr_vm_unmap_obj_locked(vm_ctx, pvr_obj, device_addr, size);
 	mutex_unlock(&vm_ctx->lock);
 
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
+
 	return err;
 }
 
@@ -874,6 +848,8 @@ pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 size)
 
 	mutex_unlock(&vm_ctx->lock);
 
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
+
 	return err;
 }
 
@@ -906,6 +882,8 @@ pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx)
 	}
 
 	mutex_unlock(&vm_ctx->lock);
+
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
 }
 
 /* Static data areas are determined by firmware. */

-- 
2.43.0

