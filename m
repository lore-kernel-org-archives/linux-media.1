Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794115011;
	b=kHrlD3Afs3gKaE5g+re3guEM32pbfaMBYa+u3wgzlf9U20JQfDDiHzEKuCTG5u02DPBA
	 +KrUf+ZbpnGsRQkDR+RsKLgPiG3Zx6JpQCjuZnEVGeIPMt39dER7psXjC6bo8w/hEEJFo
	 f12gP/2ZprqwXv+JqFdDPd42PVPylqDInGiO01qXaZ5Whr/MejvltTd2VSeohXs1Wc/31
	 1JpGK//jssP3/n8y4T3vmtrg73vb8Knj2PNDIOGP3+ETXqpVtdhh9U9pkFodLp5TM8MLX
	 ExnJWdJ97zzqI8YuIzH35Qscij2BkBARY9AQTBidr8uPxJhGYwO9g9Ap/vxtUhZYgpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794115011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NRKj6bOqQvpAl7mRq0D5pUwiApxRT0gl15oz7QQ4eDc=;
	b=0jZAyJbZ5fi/LSP4p0U+YiRwMYNSgbxYY2xwXTwIVzK6z354+YfNy4jhH4FWUdSbUkxU
	 zk+op0Yy5Q808OI81HEKZQu31XSVNCToLwGvRwZjctzWOC94bKqzNXCfug4rf8VJAwY+4
	 YSqJSIw2SkBQpmyGHKhSxJwKnmBfyEVmr0FZjQVuvLUqIQmcwdpxUosUjf93MSuQZcX+S
	 aD0nnX25fU2dYYEEUzbjH9VXDKn9BupC57mVRfXDxZQlFyJVEhYVN4IspcrNp3LHU2Pk3
	 0jYyh65aI5pEqmQxFXnYk1kZzDZCq1aSn6h4I8V1BAE9aEIAczGexV0KM3Y8qcmCuqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wb85s2L9;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805B6606A31C
	for <linux-media@vger.kernel.org>; Sun,  8 Nov 2026 05:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 805B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wb85s2L9
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14fc585291cso52625c88.1
        for <linux-media@vger.kernel.org>; Sat, 07 Nov 2026 21:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794115011; x=1794719811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRKj6bOqQvpAl7mRq0D5pUwiApxRT0gl15oz7QQ4eDc=;
        b=Wb85s2L93lXNh8yM+ewTjCs+5KD+kjdIsQep4yHiJE44bjAu+VWCX5noykz3Apyaya
         3RSjS1+bqBrMBqIUlRebJPSjwewEDhVPg/UxPMpJITGCGxxPsbyvnVmJSP7dWF//9Ugk
         1JGrMUeQaXo86W6FQGScSX1Fiy8wVaRaWRv1bH9+Gk0fqF63xUbkB2POcHshGOeM6cQc
         bxTM3GSoId408F7BX6Zfy4jbp55QRNnos5ZBOManQZ5xCcLMmqr240asiV5SJMlMFNXq
         iCRwWft3YhFr/TkCHzxaw47xvX7LBl26pOC83x6SZAhDpvF/07msbGVtaEfZxXeBLryz
         1GVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794115011; x=1794719811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRKj6bOqQvpAl7mRq0D5pUwiApxRT0gl15oz7QQ4eDc=;
        b=iVPSWJwQqf/RGcDGYHOv5glpJ1DcuMxUwQMqdLcgZzM2eCiymGmEg8SDfqhUF+FEP8
         xCmQOGCzgkmq2dNfuQntgQDoufg47h2dAvNjinOUlypyfBvfJFMnTYzYTreEO76V6Flb
         sXKLKrDGIJuZH2yH9SRoml2LiEwuVQ7UyfK+EXAc9Q5/sfjUBK5jHA1rgHoNfdKxxVjw
         n+3StiMFDOQCqX5m4gqxyPHmrxAPdRb6hE4Qf9CF2C/de09Ii4oTjUi5y9VilTn17IWC
         d4G/AfNZoM5UtzFlLGeGcXLZkqLqg98bYVWt1b2k0DAea+34ubzRzKUS5hOSGimUJR0g
         Ehjg==
X-Forwarded-Encrypted: i=1; AKwUvByRU9BocxOpxx6P2F+J9M6lOtRThPyVpCNvfmJ+YVahF0O8qVkqtPrrjUx2Y9nDi1MsIaB3zXEWbX7UGw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/+23FUSnHdIFaowR1RQs/jBqiE/pjKOl5IJtswkezTs9eSX/Ue
	FltcIIo7mt/DX/yz1x4hgz4DQHldC3Sjb/hJxIp6x5ewheu98qwnUdJg
X-Gm-Gg: AYBFou1KZ8UP1L5rcCUaFxj17vP+YVSj/ObBZXYy3xSKmyvrB7MsLOj8R1Jcch9UgCO
	wM6nFFpzXI6wYMs5zQ7vLuXvrWIx0nywvvV+Oi9mqLUZv72oPCgHleAJjVJ+mJUeB4E+Q9dd2ge
	OcGZoR9MtE0nCLH+ZA7lIsnTcAVE9FSHcwhFHslaEivJ0hqirajifjJyFW5pQ0tiKgu90QQGbqF
	mJifEaUzkX+9BrVUpISGbJHeR5ijpSpHwFGHs0MtLqLpTfcf1ryNnRbYej1rFuK8Kpl+8n4wx9z
	6AvKbxNarE/l7WhhkLrkkqQkIt735EAKjWhM33mhgUFepvIDLvFPFQJnRLhvter5JyqO1WmopV+
	Z5lZR/Z3tdM1279yrZAvR7PIFqB08VTLyrv38aaWxOYUzPBgvOBdRLm8Q8MvlC3+m3LILFesWs1
	DLcR+X31kQ15wVBLzdhU39fu56r91tQcOAnD8KRDH0pgxiXUUBEjcgtCJQ8Dgjo9XgD2cywFz9w
	lyZgLb/fVglogJIL0AMEJIsVisfzg6zkTXCarLg2exfGxnJj38sM67mnp/kOT8MTvvZBjVYr1tk
	S2jrYXPAZzi8qNAWvIwDdYwH0A==
X-Received: by 2002:a05:701a:c919:b0:189:d6bf:7eaa with SMTP id a92af1059eb24-1b39fe93a6cmr866284c88.16.1794115010609;
        Sat, 07 Nov 2026 21:16:50 -0800 (PST)
Received: from [127.0.1.1] ([121.125.115.175])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d60absm2750989eec.26.2026.11.07.21.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:16:50 -0800 (PST)
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 08 Nov 2026 14:16:24 +0900
Subject: [PATCH v2 2/6] drm/imagination: Stop locking reservations around
 map and unmap
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
Message-Id: <20261108-pvr-vm-bind-v2-2-730103d2cc9a@gmail.com>
References: <20261108-pvr-vm-bind-v2-0-730103d2cc9a@gmail.com>
In-Reply-To: <20261108-pvr-vm-bind-v2-0-730103d2cc9a@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Philipp Stanner <phasta@kernel.org>, 
 Donald Robson <donald.robson@imgtec.com>, 
 Sarah Walker <sarah.walker@imgtec.com>, 
 Matt Coster <opensource@mtcoster.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
 Gyeyoung Baek <gye976@gmail.com>
X-Mailer: b4 0.15.1

The GPUVA lists are now protected by gpuva.lock instead of the
reservations, so map and unmap no longer need to lock the reservations.
Nothing else on that path relies on them.

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_vm.c | 44 ------------------------------------
 1 file changed, 44 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index d551d9a4ab4..12ebf0daf88 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -10,7 +10,6 @@
 #include "pvr_rogue_fwif.h"
 #include "pvr_rogue_heap_config.h"
 
-#include <drm/drm_exec.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gpuvm.h>
 #include <drm/drm_print.h>
@@ -684,16 +683,6 @@ void pvr_destroy_vm_contexts_for_file(struct pvr_file *pvr_file)
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
@@ -721,15 +710,6 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
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
@@ -741,15 +721,7 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
 	pvr_gem_object_get(pvr_obj);
 
 	mutex_lock(&vm_ctx->lock);
-	err = drm_gpuvm_exec_lock(&vm_exec);
-	if (err)
-		goto err_cleanup;
-
 	err = pvr_vm_bind_op_exec(&bind_op);
-
-	drm_gpuvm_exec_unlock(&vm_exec);
-
-err_cleanup:
 	mutex_unlock(&vm_ctx->lock);
 
 	pvr_vm_bind_op_fini(&bind_op);
@@ -782,15 +754,6 @@ pvr_vm_unmap_obj_locked(struct pvr_vm_context *vm_ctx,
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
@@ -799,15 +762,8 @@ pvr_vm_unmap_obj_locked(struct pvr_vm_context *vm_ctx,
 
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

-- 
2.43.0

