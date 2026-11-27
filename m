Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774832;
	b=0Pm1FIFPmWrSDdpgiZum7T+3EYfTki1F4Q8JELxnUrTdJripV041Hqi4FkFCZPFnjb9n
	 xPRcm9o1WYxA6lpXY5CaBbTh7FrHDCDyJbeNgk3CHWARP8NQUy/vCSNVLrK7b1NMcKtXl
	 w2EHp4mC6WI1bW4OGcdG6gI9/TgiKbAS/IYR191YNI3TSSu1cfpHCfhdID1Q1+KW6g1SS
	 E0/xbooKELbe6MPkLR+E6SlXLkLPyNWUJ/iOb0JVvz04jsuTEci2V29AWkL26EP4xGJX3
	 sMsrxVzKPX9wdTUVpohRWI8CiOK+wBMw3/E8JuzFpRIV08+VR7Q7sACcscpbx9+dyFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774832;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=jdnt2/a/ZbMnN00rqXnxGWnUTsU4G3OMV0NCuzfNtiM=;
	b=HRm8CKHC0lvHKTQ2b2FzKlIEV10twgFSG7mr2jmJszZU+DMDDYqq+AorZLr0NxH7t1Yu
	 iS+kniex0+luSe+1duPRXbaHZ4rqbBxOzvVXGAetnKWqaNSFlR+5o7ykVTo5ZoM/lBcoo
	 +MxTa4dqJSZ2JOiQDEeqXUQE9BMdRGRwgJuC0J+VM2KJwbkOBe+FyIC8dAsKLRqwBP6kd
	 WopJtek07qm7DHmqbJ0uezlk1SoeLaQfnQ0ZSEg9QO71DuU0UCSV01Lqe/Q1h3t1hbGdF
	 SzafSL1uvWG/7FfMTWIxjbJfs0uGe8Wx5tJqyFKOcmp/7F3Nua8+5330ZVV5l/fuikQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nQFUykQf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7294606A331;
	Fri, 27 Nov 2026 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nQFUykQf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648C71F008A0;
	Fri, 27 Nov 2026 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795774832;
	bh=jdnt2/a/ZbMnN00rqXnxGWnUTsU4G3OMV0NCuzfNtiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nQFUykQfesqG/I9SJFTuoB2Oq6I92Vw2E0PuaZqxx6mjXpvhxB3BXNBHyuc+IkVy0
	 ZCPhMkc8JvUtfgvKg+IU3PJNf7Df9mCKgpx+4w5UuaiNLC6VCkkIe86RhlRWy63gC2
	 Hfq8cZq/ZDYc8/AbTbMd4OTQROVHUwuuZjO8n+oB1X4NzovL7B/TzTNx6gF4m/0zFw
	 DGYVes8EXPCCRI+oBphIdnpKmGsSS7v7QIrDSg7uzO2oY0ZJbYyttGqt1MWRGiUHU2
	 yA1ruSDPP059L3Rz3annSE1CjlmnzPCpNh+Z6J3DxEyx4chTIxHW6xpwbIkHqqo6I/
	 jM1ZPK5Oawtiw==
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
Subject: [RFC PATCH 5/8] drm/amdgpu: Stop using dma_fence internals
Date: Fri, 27 Nov 2026 11:18:10 +0100
Message-ID: <20261127101812.2706432-7-phasta@kernel.org>
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

amdgpu_ctx_fence_time() directly accesses a fence's internal timestamp,
not ensuring memory ordering.

Make the code more robust and readable by using the (now improved)
dma_fence_timestamp() function.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
I think this should, contrary to my previous statements, be fine since
the lock taken is the s_fence lock, whereas this function's caller holds
a distinct fctx lock.
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 2f0349233695..9d6d92cb9734 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -170,6 +170,7 @@ static unsigned int amdgpu_ctx_get_hw_prio(struct amdgpu_ctx *ctx, u32 hw_ip)
 /* Calculate the time spend on the hw */
 static ktime_t amdgpu_ctx_fence_time(struct dma_fence *fence)
 {
+	ktime_t scheduled_ts, finished_ts;
 	struct drm_sched_fence *s_fence;
 
 	if (!fence)
@@ -177,15 +178,15 @@ static ktime_t amdgpu_ctx_fence_time(struct dma_fence *fence)
 
 	/* When the fence is not even scheduled it can't have spend time */
 	s_fence = to_drm_sched_fence(fence);
-	if (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &s_fence->scheduled.flags))
+
+	if (dma_fence_timestamp(&s_fence->scheduled, &scheduled_ts) != 0)
 		return ns_to_ktime(0);
 
 	/* When it is still running account how much already spend */
-	if (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &s_fence->finished.flags))
-		return ktime_sub(ktime_get(), s_fence->scheduled.timestamp);
+	if (dma_fence_timestamp(&s_fence->finished, &finished_ts) != 0)
+		return ktime_sub(ktime_get(), scheduled_ts);
 
-	return ktime_sub(s_fence->finished.timestamp,
-			 s_fence->scheduled.timestamp);
+	return ktime_sub(finished_ts, scheduled_ts);
 }
 
 static ktime_t amdgpu_ctx_entity_time(struct amdgpu_ctx *ctx,
-- 
2.56.0

