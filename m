Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713668;
	b=mB3bkbB0Tr6HUyyLccnYMajXhO8Lb/ME/tCrDIEmjQENDHUXgwG3W+uF07CbA0/tOSd9
	 GjllnBqslVaItPRaEhxZ8Bj+Mx86X/kufAKGYohndQBx2O4mYMWC5gEnEd2MMkpcNQOF2
	 FYcxTgekOf18eBDN+BU9mBpzlPHCHyzIqWk9QItnbe3p7DUhuTGcXkfbNaXulHZ6DoTzK
	 gUwJL8bGGS1UUQBzfpk4tIYe75k8gWl7qOrGTt8n6L5TBJH5C6RDGwDXDChyh3LF7uPEC
	 KKOzSoAalIzPAe+b0w9ry093INE2IcvnMCYeLY8tIb5nTXb4hizFHAZo8CpMjBqQoqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713668;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3U4ZmO6S4QfEt/0nkql9n+zraERnhGp5O1oAWKI8DhM=;
	b=fweHW+F/l0NBLWWTLypwUgIAWPyiLLLpO/DV0gIvFlbAQ20zGtxZBgr3CrHI1CJd5zjv
	 yY0J+PZg+3lJtabrQ9+4K7Th/3Vp/QCbqGX8gDNs7/f94HMO+2JfS2QPn6yP70lC+u3Ew
	 eFou/o1u54sLm9tJQ5lndHWstR2gKHPIxRVVcuQuA3D83aI5XUk07qW0gfd3NON+YxGLs
	 ZkgB2o9/aNglkesCOPqLTxdULNnIpxAOn+Q9wIi4XI0yi6soNVPv1I7DSStLZFL6LqeNw
	 /MM/kTS3EAepKBE1xmfTUWi8aLLiCbgnMU/bLWcLOKRJuFlX1qUQA1Okj1iKuzNH5AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mTJwNm4m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5FC606A31C;
	Thu, 26 Nov 2026 17:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mTJwNm4m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9239D1F000C4;
	Thu, 26 Nov 2026 17:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795713668;
	bh=3U4ZmO6S4QfEt/0nkql9n+zraERnhGp5O1oAWKI8DhM=;
	h=From:To:Cc:Subject:Date;
	b=mTJwNm4muBgPSCGc64/Nxa/Yqq8VD8DExUAgAmSaFUqoqQogRhM3TaRi+/0fHv+UF
	 gIOnIcyf5/tLdiZordWsLWTYWAv+kF5m4ISeXMXSwEf4Ld18dsbc/ywSTp3fgQySwg
	 j1YKVGEcc5kZ03yxNqXZGri3/e1VY4l7me75qvhHXTf2FJfM37MknEiCvknRFxOYiQ
	 0gLyX/te8A0rpHwrwQJviE7u3wbUVJ+0kNL/PaeH9SO1N+p+8odmzCGDLTPK2h+zy3
	 QXifcEdJn0akMa1x/s1fBLQDCrfntJ0RY22qQ6kpXkO/d1eaCYB8S2x29GALOw19sf
	 J+xCbh2ySobTA==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	Gustavo Padovan <gustavo.padovan@collabora.com>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Luben Tuikov <ltuikov89@gmail.com>,
	Shashank Sharma <shashank.sharma@amd.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Gary Guo <gary@garyguo.net>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 0/3] dma-fence: Properly order timestamps
Date: Thu, 26 Nov 2026 18:20:44 +0100
Message-ID: <20261126172046.2473303-2-phasta@kernel.org>
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

I propose stuffing these hotfixes into the stable kernel / misc-fixes
while we move on on misc-next with a more proper solution. I'll post a
series for that soonish, too.

P.

Philipp Stanner (3):
  dma-buf: dma-fence: Hot-fix timestamp misordering
  drm/sched: Hot-fix timestamp misordering
  drm/amdgpu: Hot-fix timestamp misordering

 drivers/dma-buf/dma-fence.c             |  9 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c |  4 ++--
 drivers/gpu/drm/scheduler/sched_main.c  | 12 ++++++++++--
 include/linux/dma-fence.h               |  8 ++++++--
 4 files changed, 27 insertions(+), 6 deletions(-)


base-commit: bf57105b00e32d37b666c029c8c6b8708391da20
-- 
2.56.0

