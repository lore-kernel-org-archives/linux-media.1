Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774845;
	b=ceJom1fwKsbxZnLLrSwhaMprzMqcKOUpGoiRFP5iOUsFe73M3RiI0g8JEmFC+iAeyXTE
	 4CdrG5MsguUcDAv1cqZLusKKm9C6H4Kq+kkCUyBTLFE+ZAhEM8cCpXbbtugCtjrlL674d
	 vmRnWXt1VRXHlyQ/QP3c9QuBDWIEXoqbuBS+GXc8MU4yyzOljssQJrIJ9sgJoF+yL191A
	 XETzxHiCcYpyJpvjHFyCtmeKg9V52ZV5Ltfz/xfZ4w/FZ6X7trOfs6nM2b+PlOu5ujqN3
	 eGJz6yHiMz7DavOLMBBm//MHathkriJLkwcyYheX+rDS4UtSZYZLlhxYfpRK1GnPIiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774845;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=eKMhP9nUIJHIhP+6Zbg0A5RYBnJOUES6EU29xJ7w5Nk=;
	b=WK60V9pVsfNolbIr6Imu+Z5zkVOq8WjA5V9FMw0AVIM226fEND7PJTafACJ6PKZ1QNAo
	 ScSzgGhS5DsPurtjh8tgZ5Ehw4ZKQFOPuLhnWhheBTOJ+bfQkLFBiKpFN5y5jx3gkikZj
	 GtURnpX7cDWTv/6rmeYGz22LItGO3Xio1gGfu1nVMvGdDCKsnO99UadkFOPP7Q+1qrSUd
	 6xtvQDJ44t24uPcU4jWm5kTFco3JBneLGAi6HtswHvCrS1SbNFsNf6Nqq1Bqny/dxEuwG
	 QUmHB72/Fe8e80XxqPTRTeoApTh5UPigJmUZqiGv98wVYMrsiunt/I60sLrPIUidvWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ImKm0uk4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783A6606A32C;
	Fri, 27 Nov 2026 10:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ImKm0uk4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA78A1F00925;
	Fri, 27 Nov 2026 10:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795774845;
	bh=eKMhP9nUIJHIhP+6Zbg0A5RYBnJOUES6EU29xJ7w5Nk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ImKm0uk4YNABStVNvlUYviuSYraNdLsFtMoD9VAXloG8OBlqzDMZ1kkMBxs/lClju
	 BFaMguKuuVoken+4HZoI0hGF1AdGkdo0dePWwrXd+MhRUY5jGeH990o47EnkMh38Xw
	 WKq8pv4NBinlexpquQPtvZA2KbaZDEynHM+ncwRqIGHe2ePnoMYODOoGsD1WiB52Ij
	 28UHFnoVuOeP4Nie7ZTEUmYJt67INmG4g0yG7Y7h2JSitBd9yBY99CXqRDyJGqbJaa
	 Q9BgX6NfPS5PZrbHhCDa3z31ZDODRiZcXltD7F54iuJg3CyWMJO+vDm9er8AAgoVNT
	 Sf8LxTaGwWrag==
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
Subject: [RFC PATCH 7/8] drm/i915: Remove TIMESTAMP bit
Date: Fri, 27 Nov 2026 11:18:12 +0100
Message-ID: <20261127101812.2706432-9-phasta@kernel.org>
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

i915 seems to have built its own half-copy of parts of the dma_buf
subsystem. This includes interferences with dma_fences' timestamp bit,
which does not provide memory ordering and which does not seem to serve
a clear purpose in i915.

Remove the set_bit().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
index c10ac0ab3bfa..a43d774ba779 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
@@ -138,7 +138,6 @@ static void
 __dma_fence_signal__timestamp(struct dma_fence *fence, ktime_t timestamp)
 {
 	fence->timestamp = timestamp;
-	set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
 	trace_dma_fence_signaled(fence);
 }
 
-- 
2.56.0

