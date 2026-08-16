Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6743BF684
	for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 19:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786909400; cv=none; b=a10cAaHgXrV0Reuv1PdsbrfCt+lcNhCZzWrJQIqQYsBz2pA2w8FMSWA7L7ElimSzGUI4EtoL+6GYa2JO2A1y5HmRlUEJkOT3PoBIZ/QWhCPGLoVsulU80Ye2h+Q2RaRdPfghUFZslZfDKEL46rBNMr5Gv6O41IFoczJM/hv4qT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786909400; c=relaxed/simple;
	bh=V6Vta2LVRAm12vCpi7RtdujFKx7yC7EukxxOPcdPjLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PO6YkKCNys3lS/NYqEjVajrw3yssHZTjvyzHQj73jHuencmEiwWTNCYqoaYv6Q6xEnPppPBzZpENkNZUYOfRnEI4pmwmtMIg/qPTpfdk4Ot8N/euhKP/jB708jMinOZc7I+NnoUznR1OzcgRbR17xb2uHZM1kftQ+N/I0FISthg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xl+NYBMj; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xl+NYBMj"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1983228a91.0
        for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 12:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786909399; x=1787514199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vQV907MxENOHehwyCp9rz0FCgUqiCVS0Fmif7CccKAA=;
        b=Xl+NYBMj5u02XK9MQ9LLXEUtAW/YzI6EhTUcTAr6eU9MdIYDQFmOKCjNXy4C/jb904
         D74lSsCcfx9+yaLHYvp0fZzii4DW495D2cx674KuYQza5HAUn8ZvWxxPEDjTj1IomA6z
         XVxtjNLsPy9zDmqUqyguMVnrJl7kpP5x4bFwgjIB+eXDJXU6AC0QVmn15mNJIamJFpO1
         L9/DACvSPoi9lgVRftHkM9c/crhwBfN0QyTDixJ7Nabr5EEvvFIe9j/8RAXjWKwnByTt
         htEFZ/LGe11PYF6LIRfAKDGTd16YyfSqo4reR1eN9tGV2Op9OotcLIidLvl8IrvPeyAv
         Z1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786909399; x=1787514199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQV907MxENOHehwyCp9rz0FCgUqiCVS0Fmif7CccKAA=;
        b=B8zj893p40wZPc8GXjJRPcjrgEXBqj572AbVzTOaG5aYczRLZxLVPh8NGCCcRjGdtw
         1EfjEfXX2foOG//9FFRrfk/VsCpLIoD0wxq/NMJTOEp0dQ6rEp9y4p8CMi7k0W1jjj+v
         kIHuzJQk2DLK7uuBmRX4OuYYvOBaolsmrJw7VGiAf+Vg3GbS67vkuLq2PYzBBsnMLifU
         M/rG5UQNlb67kHLer4f/4V2vXJDD5bojhBdLZPKGM/yd764z0+F8HCLdwXvTuoJakBCp
         IOKxpfaS9dq236a1CzHFAV1yJBqvcNiScD4oGeUj2TOfmi2cNSg6JRkmQspv/n3lAv8U
         4Png==
X-Forwarded-Encrypted: i=1; AHgh+RoIGjKfr41GTroGbvhCCmyjrhQytV1uYFYVH5RcLgCXZ3R+vre/k1oDuMX1m4QknchjO4ZtD69ySFeQmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUHt+vTkbi83dX281M6UUfH+c151cRa/WPUTpzIqyeT1k58ZIs
	F13uL8xOrJYQdgRyk5oReg/NuLyLSQuCTVdGQVeKzAqOgJVyflxrgTGIZfSyJdrN
X-Gm-Gg: AR+sD11S2l45xmur+7LCEgDn6XwKtKCRXfsqClYdfIAcfp0zYkscJnIsn7rPY7H9gwW
	mPtNQAtxmsPnQuxO6O1g2CgPZydSZNI20f2vgzkCopjXXBvtOF4OajwU65kJwHWwPn1Iy3J5wOT
	UD+iFdkc2MyxUKJkkN5xy+Vfhc+LlSf0BMRjX0gYd35/HZiJhjDDMFYfjR420J9B8kCSzZRExpd
	VOQ7d8fZhdFvCUnWuZAw08KB2D9wmFqsEnIGHL7l7Tw7Jfbtk4LO+3jtczGeIfI2H+a8QROg882
	eer4nT799aUD3bEVup2lK7RZD30qXa6PItj8Bgetv0H7fz6K55GRu4Roq5H7VBRoSQEmXrRpf3O
	PRRG+1iQ7fPa1taQ4BKWiS07ZMYhH7gkCoEi2UcV29Rp1NJ08FmYv636AbgqfsScp22ruTguQo8
	pLcfWdOBcaqXAm4jAsKtlOkkf4RczuOZU/Ia6kawn1KuyGD8eqOkZBfA==
X-Received: by 2002:a17:90b:5606:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-3933b78b698mr21706032a91.6.1786909398914;
        Sun, 16 Aug 2026 12:43:18 -0700 (PDT)
Received: from [127.0.1.1] ([1.243.227.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395320229f4sm2141310a91.15.2026.08.16.12.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 12:43:18 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
Date: Mon, 17 Aug 2026 04:42:08 +0900
Subject: [PATCH 1/4] drm/imagination: Fix the vm_bo split mappings are
 linked to
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-pvr-vm-bind-v1-1-0a0f21be7d38@gmail.com>
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

A remap does not map anything new. It splits an existing mapping and
re-creates the parts the request did not cover, and that mapping is handed
to the callback in op->remap.unmap->va, carrying the &drm_gpuvm_bo those
parts belong to.

However, pvr_vm_gpuva_remap() linked the parts to
pvr_vm_bind_op::gpuvm_bo, which belongs to the object the request maps
rather than the object the parts came from.

Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_vm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 396d349fb6c..608e8c0467d 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -418,6 +418,8 @@ pvr_vm_gpuva_unmap(struct drm_gpuva_op *op, void *op_ctx)
 static int
 pvr_vm_gpuva_remap(struct drm_gpuva_op *op, void *op_ctx)
 {
+	struct drm_gpuva *unmap_va = op->remap.unmap->va;
+	struct drm_gpuvm_bo *vm_bo = unmap_va->vm_bo;
 	struct pvr_vm_bind_op *ctx = op_ctx;
 	u64 va_start = 0, va_range = 0;
 	int err;
@@ -434,18 +436,18 @@ pvr_vm_gpuva_remap(struct drm_gpuva_op *op, void *op_ctx)
 
 	if (op->remap.prev) {
 		pvr_gem_object_get(gem_to_pvr_gem(ctx->prev_va->base.gem.obj));
-		drm_gpuva_link(&ctx->prev_va->base, ctx->gpuvm_bo);
+		drm_gpuva_link(&ctx->prev_va->base, vm_bo);
 		ctx->prev_va = NULL;
 	}
 
 	if (op->remap.next) {
 		pvr_gem_object_get(gem_to_pvr_gem(ctx->next_va->base.gem.obj));
-		drm_gpuva_link(&ctx->next_va->base, ctx->gpuvm_bo);
+		drm_gpuva_link(&ctx->next_va->base, vm_bo);
 		ctx->next_va = NULL;
 	}
 
-	drm_gpuva_unlink(op->remap.unmap->va);
-	kfree(to_pvr_vm_gpuva(op->remap.unmap->va));
+	drm_gpuva_unlink(unmap_va);
+	kfree(to_pvr_vm_gpuva(unmap_va));
 
 	return 0;
 }

-- 
2.43.0

