Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774851;
	b=HtPWQeXnm8Psejp0wtMtSsKPegdEbRMLDBKydQBD/Cd4CZdq5n4rb0uo4sTvDicMjwEa
	 vzvml5ZvDir18S6D/dtePwM631I/zjzl737USGk4Nx59HfrA2yEBZL702jUvtDsPyYMtQ
	 ulm8lYx44UiDAgeLRgNq6gob+Aep1PpsuEgM/WcUvmkV/iinFjp1Lc12BpOQBLTM5noIl
	 5IuCi2F9gRIif/4t32Fd1QFkzrK+O39ysJd02sprAdb+biRJCFITQCzDP58U5Tk8aVmSy
	 ZZpzFhZGM38vQQh3husP1yb9uRf8mtJxlSqXT/dZvC7lyiYCABUwbUMED7VImrQFTeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774851;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=LJAOAOmUEmG/SIqbDw1V2AKXbo1TznTck0yy9LpnC3E=;
	b=WcOH9Xj4qy7AvjNVfoMafohfEM7D+UZlcWVvEhUbb2liaCCmAa3VlPaBgnOcEKs79Jb7
	 gL0ixeTsDUpVpb9GeUvPaXLrO0SLt3ExxZQNRgE8r3nhrmfa4/6ypcwcJaCDMunD106La
	 yhP26o7/w/Lin+Ye3AbKJef1Viigb+pTyrsJYe+Zexhzocv9ObhRLGUbDfcdfC7WkH2CW
	 LKtM143brudBy4h7zBGGahN8VJIN7b7JECDqq3Htdr07iJRybf0WmSmcAMoAdePBIOEwm
	 5Eel5aKvrebFsK7Wx11qe8a3atVW8bEL0tokb87Galq+MPvoxAIkWwNQhGqeMqQp/6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OC8Foa0M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C605F606A32D;
	Fri, 27 Nov 2026 10:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OC8Foa0M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2D21F00925;
	Fri, 27 Nov 2026 10:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795774851;
	bh=LJAOAOmUEmG/SIqbDw1V2AKXbo1TznTck0yy9LpnC3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OC8Foa0MNiS34e6fL7RZdfr4ORrStCI7g2Vvlf1MeFKS+ntVkpsSOodYrAK1Wjzz0
	 PxQb1GhcqM3PYiI/axiF5lh+7T9vwe5V/rjBdOilW7wyISUKtfdrsjoXqoi9l+SVEZ
	 y8uoeQ4wG+5Pxud4f5IRr6CEI7eDlmQvToc6w056iCgF4OjUeCaIpQS6qoekqwJ1xV
	 mt39fr05NrBizGhX08CF7vEMkkSjXr7WqmRiwZ3jDbtXviHWoh6bVNpl2nPWGMfJ8X
	 KVgB9RMza6zO7owH7uzkaVFSfmvsH2G3Zv/t60aOTYutgI2ODWmwBvqhErp76m+Du7
	 kAu9GJ68IvTkQ==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	Ruslan Vagner <rusya92266@gmail.com>,
	Gustavo Padovan <gustavo.padovan@collabora.com>,
	Chris Wilson <chris@chris-wilson.co.uk>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 8/8] dma-buf: dma-fence: Remove TIMESTAMP bit
Date: Fri, 27 Nov 2026 11:18:13 +0100
Message-ID: <20261127101812.2706432-10-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127101812.2706432-2-phasta@kernel.org>
References: <20261127101812.2706432-2-phasta@kernel.org>
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

All users of DMA_FENCE_FLAG_TIMESTAMP_BIT have been removed. Remove the
bit now, too.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/dma-buf/dma-fence.c | 2 --
 include/linux/dma-fence.h   | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index ab02afdb0f18..58faee7166ae 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -376,9 +376,7 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 
 	/* Stash the cb_list before replacing it with the timestamp */
 	list_replace(&fence->cb_list, &cb_list);
-
 	fence->timestamp = timestamp;
-	set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
 
 	list_for_each_entry_safe(cur, tmp, &cb_list, node) {
 		INIT_LIST_HEAD(&cur->node);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 70bb8434ac1a..bab0aa339e05 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -52,7 +52,6 @@ struct seq_file;
  * DMA_FENCE_FLAG_INITIALIZED_BIT - fence was initialized
  * DMA_FENCE_FLAG_INLINE_LOCK_BIT - use inline spinlock instead of external one
  * DMA_FENCE_FLAG_SIGNALED_BIT - fence is already signaled
- * DMA_FENCE_FLAG_TIMESTAMP_BIT - timestamp recorded for fence signaling
  * DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT - enable_signaling might have been called
  * DMA_FENCE_FLAG_USER_BITS - start of the unused bits, can be used by the
  * implementer of the fence for its own purposes. Can be used in different
@@ -114,7 +113,6 @@ enum dma_fence_flag_bits {
 	DMA_FENCE_FLAG_INLINE_LOCK_BIT,
 	DMA_FENCE_FLAG_SEQNO64_BIT,
 	DMA_FENCE_FLAG_SIGNALED_BIT,
-	DMA_FENCE_FLAG_TIMESTAMP_BIT,
 	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
 
 	DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
-- 
2.56.0

