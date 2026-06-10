Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F014367282;
	Wed, 10 Jun 2026 08:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079990; cv=none; b=b+iwXpXRP3xMxsuFLmzXraixEnKdCatKQcOc9VimHy0h7Atsg1FzeiwJMFbunnMya/lsufljORjSN/zKMBHSCNiMjVmHJgYQWV7jp/PpzL/nyb9gagYcatJ5VR5G1FaLQuKz8ffkRR9Tbx1K1W9piuPZDF/tTKTDjarDH8tE0Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079990; c=relaxed/simple;
	bh=upBE6XdDO9KfoWGHqWduguAXWsUjY2MtHvBwzGsDSy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rADva4OuF+ZQTsoe/8GTlD4ra4CzYeoolpfrb9qMWyC0mw8V6tkrajxuYA6NogvFaiWkStikxdnnNnVzKEKfiBtku9JQjLlAWW7o5CNAqrMONRUUhMDPvr0kdOB0qkjTZN8niJhw45T8YpLPKNbD67/WevT3qxNCv4PQptraEOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7euH2ph; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7euH2ph"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0BD31F00893;
	Wed, 10 Jun 2026 08:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781079989;
	bh=N/meOR8qXZA62uzXKo7V6ddIdrYaFI08nRHNwkyigvU=;
	h=From:To:Cc:Subject:Date;
	b=D7euH2ph0IRx5agO0gaC8kNCg/qxTzdB45LZ2MgtRE8hNgp+rHYbfSzV/BxQenHYt
	 TP2nltVdTft9SDuhDqRmw+wQooocWHUmfwcB8HKm0aGCpn9O8THjjXKx0m1CS3OQ/J
	 sDMYRZHbhlRkW+zLElSrMNaPRwOQLgtfkOa9F3Ar6CgvH5ieWV7/ghVK59n5TzAkZJ
	 Ylsrhsj0BVWhyC2wLCW0w6GpNIuAitcUz+uJTaq3WGymLeW3a8oqNWgPUe9oyPGLfd
	 Innx51sYQo1imPN23H03RIBohDSnnK3GykmMCvai/IYofIUQ2AnOq2vTtMGYVXY5mF
	 aLmhVJm61TNhA==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] drm/nouveau: Document weird looking bugfix
Date: Wed, 10 Jun 2026 10:26:03 +0200
Message-ID: <20260610082602.1292853-2-phasta@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit c8a5d5ea3ba6 ("nouveau: fix client work fence deletion race")
fixed a race. To do so, it replaced the automatically locking
dma_fence_is_signaled() with manual locks plus
dma_fence_is_signaled_locked().

For someone browsing through the code, this reads very much like a
cleanup or rework leftover. Future contributors and / or new maintainers
not familiar with the history might be tempted to remove that bugfix.

Document the bugfix.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
(I did not test this)
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 42a81166f3a9..519a0c164a72 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -159,6 +159,13 @@ nouveau_cli_work_ready(struct dma_fence *fence)
 	unsigned long flags;
 	bool ret = true;
 
+	/*
+	 * This is not a cleanup / rework leftover, but a bugfix to prevent a
+	 * race with someone signalling the fence. The locked
+	 * dma_fence_is_signaled() cannot be used. The dma_fence implementation
+	 * is not fully synchronized with locks, but also uses atomic bits,
+	 * which can cause the dma_fence_put() below to be executed too soon.
+	 */
 	dma_fence_lock_irqsave(fence, flags);
 	if (!dma_fence_is_signaled_locked(fence))
 		ret = false;
-- 
2.54.0

