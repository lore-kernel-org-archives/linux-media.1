Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A5C3A380C
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 12:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782304165; cv=none; b=sj+J05D1y29Dl7stayeg1EfSJQn+Piz3vTEROw6TfU/j0lASi1Yy99SyaY6ATLT3Y4tzVSa9Zo4CuLr6+tWIIWZtdfTh4/grHexfZY1qFrwNfCbqgiGC7UTnlXIY7zaXdWX1jrO/tI5EoWLk+h1cV66aFJL5US9ArziYWmeOISA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782304165; c=relaxed/simple;
	bh=AfB819ohejNakOwWOOfkwHoImDDD8WWgQp9xgC+ZuIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AHOgSgehxM7XYicqkOMdlrLkxd6GCIzIo8rzDX+j/U2kzSRf3W6uGI9M2ZW7405ZzjKZaKFK9D83fZF4FIOMiik+l/tgeOqkOEUfpBm1FiF1YPVwy/KvKfqzisbzqoxnJT/GiYSlf4H38Rr1r4UNurMd72sGZEICXiurmRnQ3Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNVJAupE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNVJAupE"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so15190825e9.1
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 05:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782304163; x=1782908963; darn=vger.kernel.org;
        h=content-transfer-encoding:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rK7BBYKp4olcSlX/FhhqJF/M5dPppXiXimriQNw/H+8=;
        b=WNVJAupE9tNUVsrsKgM/HOAKeUqjrJaXzXPkPo7oONqvLO/m+nbS7wVsCbuysKAXJv
         8mEbioL3p1BqlBGF8Ib2Exn8IxeGcObjZtS4YQHAMwzsgo89j7mJ7o0pvaw9minO8bJm
         chX+TGR/PyQIAGmJ5HB3RXSG/Ij+1Jm1Ggt3ffFWOCTmgJ4tlfd5Te9lgRoeJH8f/Ujs
         8FJTbN3P3Yl8HtHlYilAMno1PeUwd7wm21mwg4Ido9+iUE//vKiUTs9fqIXplDvUU0ef
         vlYQ4q3ya1AenWBJutFtg/lOiS8UjyQu3CSKJDSDc1bQdW0+1QBhn9I0DLuwAvPni35G
         j4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782304163; x=1782908963;
        h=content-transfer-encoding:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rK7BBYKp4olcSlX/FhhqJF/M5dPppXiXimriQNw/H+8=;
        b=J9fUOaB1NL763zbKrLiSmsDh96T3Tkde4PM7d9o7Ah+L6+YYPvP27ogaa/8wm0ziff
         +LSCzDI8wulK5+o2fDtu2wOKmIaqq2Kp3ZGJv8foYSy43iUKQ85d+gfs8JthZ4QCigfG
         ZzcWNpup7/T3YKQdSKNNvmUvWhfXVoPMletcc/VRpvQuQdJS86DJDCiYQLiKxMpJmW79
         geMBS1VjedOZd3BAndFZ/tX+NVF1kTy4lmuryY6QEsSk/g/4PLLvvHfXJp8qFCeVyRPX
         Ofkm+mQnUPJ47ZwCBnEfm9krwF4XDURfIJkeSLJHCOD9pmZGAGfnp3+NRDQ4nuSbSV/V
         xzPA==
X-Forwarded-Encrypted: i=1; AFNElJ9fWE9wTX1w+P5LdKH6IzIkynLCOGOtGKD/sYCTN1QNDI5O2XNy/IcMw99pf2rvVFIeTmVJlvo17P+xdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvbcGJxXwfvPz68jzAsd+uNb7XrrYWMbWEoKJmcjI1b+Y9M+aF
	WRg/R1ePVgXpprfpdpuceNGdisoX7+L7lYaRxWm+hSsHYwJLLgqPlvRh
X-Gm-Gg: AfdE7clKhvwRZbW9hcS9GBl00MtLNKYfcvRq6dH3+SoMn9JBUrV9faEFADMu9cyFtIz
	MuqI4finFol0CSuNmCIZa37ba2WX53OeKkQWxcNz2Eu5ZwvPnhA2uKCNCneiMVGL0/bfnWoMJuC
	P8QKFUjyX2iBf0bHKKXVslRH91r2r1aG0RPk0zKiOftn6VMHkyPCuTh73tLYVjBAS75ELUQF/bp
	K0TRYccyYJ32PPkoaeRFxfqtl9GRGF71CFeuTfXRKySmet7ZOPx0yOTQaYoSVv7OnssO0u2zEMP
	tciHv/CAJfb3U3ntdPZjoSrnNIezlT+2han3LriySg15oQtXWC3piyhoA46MuesOwQhqwyQk/DB
	LATwjOQAq2UFJ93/qr/R+nzdpdsFmeDJGY0kdOcitXVcVCgIqm9tFj6/egmDt2s+vkgvhLx1o8X
	a8h3fNW9IyzHaVS2PU6lXmWwMmRfQDHoJ+68bi
X-Received: by 2002:a05:600c:c171:b0:490:e180:2e0 with SMTP id 5b1f17b1804b1-4926329a875mr3823145e9.3.1782304162768;
        Wed, 24 Jun 2026 05:29:22 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:157e:3500:2be7:1a89:41c5:9239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c9787dddbsm3896530f8f.3.2026.06.24.05.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 05:29:22 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: phasta@kernel.org,
	simona@ffwll.ch,
	sumit.semwal@linaro.org,
	tvrtko.ursulin@igalia.com,
	dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 03/10] drm/amdgpu: use dma_fence_test_signaled_flag()
Date: Wed, 24 Jun 2026 13:13:27 +0200
Message-ID: <20260624122917.2483-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624122917.2483-1-christian.koenig@amd.com>
References: <20260624122917.2483-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: 8bit

Instead of dma_fence_is_signaled_locked() use
dma_fence_test_signaled_flag().

The extra polling check seems unecessary for those use cases.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c       | 8 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c        | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index ea69b1bac7c6..1192b9800ff2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -652,7 +652,7 @@ void amdgpu_fence_driver_set_error(struct amdgpu_ring *ring, int error)
 
 		fence = rcu_dereference_protected(drv->fences[i],
 						  lockdep_is_held(&drv->lock));
-		if (fence && !dma_fence_is_signaled_locked(fence))
+		if (fence && !dma_fence_test_signaled_flag(fence))
 			dma_fence_set_error(fence, error);
 	}
 	spin_unlock_irqrestore(&drv->lock, flags);
@@ -677,7 +677,7 @@ void amdgpu_fence_driver_force_completion(struct amdgpu_ring *ring,
 
 		fence = rcu_dereference_protected(drv->fences[i],
 						  lockdep_is_held(&drv->lock));
-		if (fence && !dma_fence_is_signaled_locked(fence)) {
+		if (fence && !dma_fence_test_signaled_flag(fence)) {
 			if (fence == timedout_fence)
 				dma_fence_set_error(fence, -ETIME);
 			else
@@ -738,7 +738,7 @@ void amdgpu_ring_set_fence_errors_and_reemit(struct amdgpu_ring *ring,
 		rcu_read_lock();
 		unprocessed = rcu_dereference(*ptr);
 
-		if (unprocessed && !dma_fence_is_signaled_locked(unprocessed)) {
+		if (unprocessed && !dma_fence_test_signaled_flag(unprocessed)) {
 			fence = container_of(unprocessed, struct amdgpu_fence, base);
 			is_guilty_fence = fence == guilty_fence;
 			is_guilty_context = fence->context == guilty_fence->context;
@@ -802,7 +802,7 @@ void amdgpu_ring_backup_unprocessed_commands(struct amdgpu_ring *ring,
 		rcu_read_lock();
 		unprocessed = rcu_dereference(*ptr);
 
-		if (unprocessed && !dma_fence_is_signaled(unprocessed)) {
+		if (unprocessed && !dma_fence_test_signaled_flag(unprocessed)) {
 			fence = container_of(unprocessed, struct amdgpu_fence, base);
 
 			amdgpu_ring_backup_unprocessed_command(ring, fence);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index d6bee5c30073..ae9d6a2eefab 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -460,7 +460,7 @@ bool amdgpu_ring_soft_recovery(struct amdgpu_ring *ring, unsigned int vmid,
 		return false;
 
 	dma_fence_lock_irqsave(fence, flags);
-	if (!dma_fence_is_signaled_locked(fence))
+	if (!dma_fence_test_signaled_flag(fence))
 		dma_fence_set_error(fence, -ENODATA);
 	dma_fence_unlock_irqrestore(fence, flags);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index a41fb72dba94..2cc6552a6399 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -426,7 +426,7 @@ amdgpu_userq_fence_driver_set_error(struct amdgpu_userq_fence *fence,
 
 	f = rcu_dereference_protected(&fence->base,
 				      lockdep_is_held(&fence_drv->fence_list_lock));
-	if (f && !dma_fence_is_signaled_locked(f))
+	if (f && !dma_fence_test_signaled_flag(f))
 		dma_fence_set_error(f, error);
 	spin_unlock_irqrestore(&fence_drv->fence_list_lock, flags);
 }
-- 
2.43.0

