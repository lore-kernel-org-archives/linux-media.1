Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013481;
	b=ut8uGGYsdasX+d6m6xHjKJKYVpVUSgzEc5VCU53ksuoaIpbBj417ofQSjTKrcDpij67N
	 cWUjqMZH/CFzXHCIKksEq5Lt7KLLS3MM1p48aeYAWJEG97SH5d2fPPcafbmnCsWnpUr0g
	 atL7jB99jq207bX3clcNeEkUGhyHYpxSDAcTrACqsoUMjjOKmI1fmr3dZoCOb9l3BLn+7
	 tkB/hcA7Tf8UTSE1YFSer4SNHLxlMC+qxJJb2/j1Kre2kkhjXOb5VYyn4VALoLmP49ZWu
	 Qv4tCfUXuL+wuONtMqiWMDCNBbST8tmlmTm1GdADCOCNTV64LkTijQxwfvi1TCUIJeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013481;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XNfcKxtjE3WyApHOpNrRRQwr1Y2c1MZAzNhEcwdN+qo=;
	b=H5ZKSylx1RSB0co42lu/YA4Ab96g/672wlwSnl9xh2Zap8dAgkniH0lAmPPkIYa4gYLV
	 gikSNnPROOvc00u2uadJmi12fbel+X0/2xdIWN/fI0HgnvMIGiS+VwCWTs3z1kSW3mBNl
	 0Wd+cWWUsB0wiSKdwI6NuPP0U3BJBv4dORLaD8cwAu5vev9Tupf3jBVLkWoSUFu3mC/Yp
	 S8xHUp7QHAQ5nuMWwMP9MY63AIqUOYupurDfqJ7hMs5t8G9aIg4w+nH24T0JkfwrV9zyf
	 xFlwdicBc+kuVnR8uB1c2I2zvHmjSgWpSFyOcbI5vnIGg3z5j2Pqiw+YLqrRzAJpC0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=egqQAmIn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880C0606A31C;
	Wed, 18 Nov 2026 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=egqQAmIn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4631E1F000C8;
	Wed, 18 Nov 2026 14:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795013481;
	bh=XNfcKxtjE3WyApHOpNrRRQwr1Y2c1MZAzNhEcwdN+qo=;
	h=From:To:Cc:Subject:Date;
	b=egqQAmIn0hLtgYrwMl0jV2JGZCG0rFiJWz6fvECPwSIcn4tcBeyTKI76TjVPgyAht
	 YYAh7T5iXLt+6vdhHgukEblEmUisyPuBYv6+bhDJMynhpk6D8DtpHXVWSRffsh31SA
	 4DD4DLCuxgDNo1C9U5JO9J/59+CnZ3KKuCKnJi4NIMUf0xb3uwNt40qWoE9us/vMh4
	 irG9ZVyMKmlB9zPT6YLp2MU6g9pO45HxgkUkNvgrBZ5ZI/QWXRqRenGXIpVx8Ow9Ww
	 tSvmYXAmXkyO4wrkK/EdetTZpDqBGGuhMpZqy1uPWePuWVKQ28T+oqR6csmvlMvLO3
	 kiswOlWCnbx3g==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dma-buf/dma-fence: Remove dma_fence_later()
Date: Wed, 18 Nov 2026 15:50:27 +0100
Message-ID: <20261118145026.1755441-2-phasta@kernel.org>
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

dma_fence_later() does not have any in-tree users anymore.
dma_fence_is_later() is available as an alternative.

Remove the surplus function.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
No idea why we have two such functions.

dma_fence_later() seems to be older, coming from a big-bang commit in
2014. Yet Christian added dma_fence_is_later() in 2015.

*shrug*
---
 drivers/dma-buf/dma-fence.c |  6 ------
 include/linux/dma-fence.h   | 26 --------------------------
 2 files changed, 32 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index bd58688b81a7..2f805b788f8f 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -1099,9 +1099,6 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
  * refcount after committing with this fence, but it will need to hold a
  * refcount again if &dma_fence_ops.enable_signaling gets called.
  *
- * context and seqno are used for easy comparison between fences, allowing
- * to check which fence is later by simply using dma_fence_later().
- *
  * External locks are a relic of legacy use cases that needed a shared lock
  * to serialize signaling when no out-of-order signaling was possible through
  * &dma_fence_ops.signaled. Drivers have abandoned this concept since the
@@ -1129,9 +1126,6 @@ EXPORT_SYMBOL(dma_fence_init);
  * refcount after committing with this fence, but it will need to hold a
  * refcount again if &dma_fence_ops.enable_signaling gets called.
  *
- * Context and seqno are used for easy comparison between fences, allowing
- * to check which fence is later by simply using dma_fence_later().
- *
  * New users MUST NOT use external locks. Check the documentation in
  * dma_fence_init() to understand the motives behind the legacy use cases.
  */
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index a3fa1341765e..e11e65b916f1 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -633,32 +633,6 @@ static inline bool dma_fence_is_later_or_same(struct dma_fence *f1,
 	return f1 == f2 || dma_fence_is_later(f1, f2);
 }
 
-/**
- * dma_fence_later - return the chronologically later fence
- * @f1:	the first fence from the same context
- * @f2:	the second fence from the same context
- *
- * Returns NULL if both fences are signaled, otherwise the fence that would be
- * signaled last. Both fences must be from the same context, since a seqno is
- * not re-used across contexts.
- */
-static inline struct dma_fence *dma_fence_later(struct dma_fence *f1,
-						struct dma_fence *f2)
-{
-	if (WARN_ON(f1->context != f2->context))
-		return NULL;
-
-	/*
-	 * Can't check just DMA_FENCE_FLAG_SIGNALED_BIT here, it may never
-	 * have been set if enable_signaling wasn't called, and enabling that
-	 * here is overkill.
-	 */
-	if (dma_fence_is_later(f1, f2))
-		return dma_fence_is_signaled(f1) ? NULL : f1;
-	else
-		return dma_fence_is_signaled(f2) ? NULL : f2;
-}
-
 /**
  * dma_fence_get_status_locked - returns the status upon completion
  * @fence: the dma_fence to query
-- 
2.56.0

