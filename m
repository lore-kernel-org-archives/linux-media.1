Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4F71DF26E;
	Wed,  3 Jun 2026 15:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499138; cv=none; b=gZc6yEUtBx43Ay4or4UVKXxE1+JCuc58FtPV9ALoXYtvdjJpBQZmmU2P74mOsLqOR4dAkjbsbcaFUrrKCyeJlgUhPa63NMda83uD/V8CP2cRBOMHRWqM8lEUTY5gbkj5SUeWZqzhGNaA5QnGJTk9No/crgf2eCGRZlbvgqoIVLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499138; c=relaxed/simple;
	bh=9TN4js7xb3Vnbn1Y2aMgy4L3bAekxgM8wMmATcU3DUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MJ8m4CGZYpM5aatFC8k64egKjPpleguI9t/f9bpEaa5xY8N+tha10QVvqE1qWjYhRzyK0uuJvT+fmSiqpaFiW/YRsWa83qcnrdrGFzyziVzll8cHtjw2+6WwqQ/3sGllKhqyYhe7B5CzzfaBTqE1jnynVaTeWiufGDds2OWdieI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mV/c52Rg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mV/c52Rg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F701F00898;
	Wed,  3 Jun 2026 15:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780499137;
	bh=tuByf2Rdrqk1BQswNNwa7vT8xrcBSht8fdfuFOgxTbI=;
	h=From:To:Cc:Subject:Date;
	b=mV/c52RgW44mEfB9ZQbYRZOVN3+EjfTj+ds8kynO5rmAZJkqlugLFinWL+xUS7U9a
	 iByrOZY7+pd5nOfxToImvO1Qpjt54Y5oo8Eao8lXnEISyH2n6szfU1Zq6nWUFZtwsW
	 xB9qN9sdCpIR4nt7dTX3Ylk+2ujgzSHAJaS0ocfNVhJY0oYylF09p4R102wXTXJrMf
	 1kabytbuJp/QONkClRo+37Zz1FubBw8aKIASOnDcWWuryDLUIm5u2wYu4eFtFf8TE4
	 +saNvolpa1e4ihlCgVufJFbWa2XVdMVog2EZEAg0+riKSSYEgYCsJjTTJX90Meyj3f
	 Jgg+4jeenxFYQ==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] dma-fence: Use dma_fence_set_error() internally
Date: Wed,  3 Jun 2026 17:05:32 +0200
Message-ID: <20260603150531.2217691-2-phasta@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dma_fence implementation sets a fence error in dma_fence_release()
manually.

Make the code a bit more readable by using the appropriate API function
for that.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Only compile-tested.
---
 drivers/dma-buf/dma-fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index c7ea1e75d38a..ae5550cda421 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -599,7 +599,7 @@ void dma_fence_release(struct kref *kref)
 		 * so that the callbacks know this signal is due to an error.
 		 */
 		dma_fence_lock_irqsave(fence, flags);
-		fence->error = -EDEADLK;
+		dma_fence_set_error(fence, -EDEADLK);
 		dma_fence_signal_locked(fence);
 		dma_fence_unlock_irqrestore(fence, flags);
 	}
-- 
2.54.0

