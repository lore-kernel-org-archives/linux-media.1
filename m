Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789496;
	b=FQxxtt+antP2aG5W28sPOB9GiaffGlPLFjg0t1SG7WUy498fBVv4pWQmZnTPtuM+BBII
	 kvJ63QkqGBbyZukHzPhoNd2RCbni4FwO7TnMIzpVjjGG/epiKnflEaMkyb0knwTKZQHxO
	 1YmhSYEY+DqzWlSGoUycdWtTNPjvMP0KlX88RpTH0Z502E/NOc0Gdpu0R9Zh2QMkq1bso
	 MdOCBHEeLmfgLvGLdUfWzQVd/e36grHVas7DiKEZnHiaExWW3fGupyiuJWPRl2EtQx/hU
	 9wr7I5ZXntock3+GSBWXuDM+LvQbCnWAbXpa+KGFMZQZ3PvXKPtFVH4pMNtnuhcMXhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789496;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uhHRm7kkzjKan9LF2/vrmffawdqZAtwXopyG8TlGTSg=;
	b=ODWdbFc2c+Qu6I5Zphw7wYrui0nvVeUu/GAuulKoOfi+k2pHxtRN5BPHm8BNN2705nGG
	 VyFL+vj0spTuPfaYIauh3QfCAYvCZijeXVvmn/bwZ1GdxA2wJujKEsvpb0BYtcgdmOXIF
	 msUY9XjdK6Vp8eMJSB510WojsLbbMXr/Z0HVCiYK8X2asFi+7oqypX+h62PK+b2/5WFw+
	 GYMGJUrH09mnXczigc75YHmuXIJA+sTO4bGt+7r8E5yOK9AdcyPCaQWbRdw2gk/izQr5w
	 bjZ8YV0OmRGadCqkcdZc6UPooYLeQKCEBzRt4wkoIpQr4iRsw47LFC/PiW/OmaClc2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k30r4jhX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2911860A5BD5;
	Fri, 27 Nov 2026 14:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k30r4jhX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357B71F02803;
	Fri, 27 Nov 2026 14:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789495;
	bh=uhHRm7kkzjKan9LF2/vrmffawdqZAtwXopyG8TlGTSg=;
	h=From:To:Cc:Subject:Date;
	b=k30r4jhXruTX9fAgzYXVcEn+/p7pBodzmjKKm6vNxHihGUwEKH67H874pxz0AOmX1
	 cSq3ignEBGX2ahiYLauxK6C56tQNPxC2PjBz4L/gH6ETsbv0KRInS58AuSIrFicUAg
	 hsVkUa9D+X0thZ4HdAxkPeAJ0oeXQlwd/bpJfprPl5a/w2Cw/6DRoFXWBn0V48p1Vr
	 pIo99ma24g2BeXuXQqmG2/ORQxIgTC+kJgxozyKhYqngeGQoRP4p+CW3JrfrjL5qpp
	 fFfYvVRJBBxI8aaobhNpElUK81cAEnpVldduOqR9XIlFYdfkjA0Zwk6n5t8Aor2T/G
	 aOdmLNMkzZ4sw==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH] drm/sched: Document reclaim restrictions for ops->prepare_job()
Date: Fri, 27 Nov 2026 15:24:27 +0100
Message-ID: <20261127142425.2956053-3-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_sched_backend_ops->prepare_job() gets called from
drm_sched_entity_pop_job(). Thus, it's in the fence critical path where
a memory reclaim might wait for the job / fence to complete.

Sleeping in general seems to be (currently) allowed in prepare_job(),
but a sleeping allocation risks deadlock.

Document the allocation pitfals for prepare_job().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Didn't we recently discuss deprecating this callback for good?
There's a great many users, though...
---
 include/drm/gpu_scheduler.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 3b0978fa8cf0..1e4d0399a9b9 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -447,6 +447,10 @@ struct drm_sched_backend_ops {
 	 *
 	 * Can be NULL if no additional preparation to the dependencies are
 	 * necessary. Skipped when jobs are killed instead of run.
+	 *
+	 * This gets called in the job submission path (dma_fence critical path).
+	 * You must not perform sleeping allocations in your implementation, or
+	 * deadlock can occur.
 	 */
 	struct dma_fence *(*prepare_job)(struct drm_sched_job *sched_job,
 					 struct drm_sched_entity *s_entity);
-- 
2.56.0

