Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094379;
	b=2upVxoFHbJc+ZJ/7aOl4ZzOMq2M3PG7xK82oP14OUC9mc5QM0hIkIwYzZMeJCqGnRcmT
	 nNwAr6k0/1Dp+FEwmF1i4BvtS1IjqcdP2UMh/MDfjnxEqjyXHdvJVvmND+CS7OsNRCzdn
	 Tn7nisLnqBd0TRonroaYvO0c4d1erru6V1fqcRn+Xun77NldKdNJfXnDbn0FOITtGK5D1
	 pTeQDZEZA4e+cJBdTikl7LoNmTD/gdndoFcKePOhv58mYXHjpLsrAT0nAARIO0ptZgDzC
	 SpZAXIz6klrL7GQT5nBlu5kJEwCgEVUgtchQjmT3HCX3VUrf7KiMPiXTGKi0DErApjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094379;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gK1ForMjyEmgPmikJ+yHxqKUGm6sEgHvzRHvKpK3TlY=;
	b=24yy/U+DT9BPvAYYKbTTLAYDm1gwMn18jVpOB/BEWtixMOrvdblBiU14qnynnwcxZjl8
	 Fl/k6hxghHhmy3kuvMeHvBPW3wPF4lMBefOT7qAT1kNl5XK1fsjOB5kiebWBt0OFgmWZG
	 uYPM1qrz5JVcAJxiWljznPvbu22bKlwGjh9TwkQY6Y2hXaaZz6QZ3nNg9NrrajXn+42jF
	 i3hvrWXrVd4Pycp5wOwgakk9jcctE87mTlXWHuEnFzhaLCMjcJKlMun6IRYMcJFV+KD+p
	 dKaWc74FrFIbsK6eUK3xM40rjdO7iSbjZBg+kVAt12F2a21oy88xf+Frd0F86OJHKsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iYrxmap9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F642606A320;
	Thu, 19 Nov 2026 13:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iYrxmap9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195CB1F000C5;
	Thu, 19 Nov 2026 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795094378;
	bh=gK1ForMjyEmgPmikJ+yHxqKUGm6sEgHvzRHvKpK3TlY=;
	h=From:To:Cc:Subject:Date;
	b=iYrxmap9F95zC7zevzlIkNvm2EvW0xFeZEV4uDvbltwjqYDMQDZgoctTK79JgpP6v
	 I33+MyJSK1AWI6xpnh/bQL3XsfaZZloLDwjcq6M4OhHbjxka2rqWS/9C7k6QjiQKpV
	 lo9owqejGMK+pEir1kr72Cu8/95kEj1SBJdg2h30swHFWBbRjuuNVzjPRpqxwoL+eP
	 JDSvzEUSbDMIK3mvtQTtE9JZ1/HfPvaNx7LxdLihSiTz0hvgD8IYiimYGBgxw7degI
	 5NitSr8PHy4otVpN269UpDlnCkWhacVOysN65dLm6121gLeZ0CWiNJqtj03mZ6OGen
	 CyOlsrJR23T0w==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Yunxiang Li <Yunxiang.Li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] dma-fence: Fix timestamp memory ordering
Date: Thu, 19 Nov 2026 14:18:28 +0100
Message-ID: <20261119131830.2535266-2-phasta@kernel.org>
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

Based on misc-fixes

The memory ordering for obtaining a fences timestamp seems to be broken.
Moreover, there is no canonical way for users to obtain the timestamp,
as proven by the broken ordering in drm_sched.

See also my patch for the signaled flag [1].

@Tvrtko, would you mind basing your patch [2] on this series? That way
we'd solve both bugs.


[1] https://lore.kernel.org/dri-devel/20261119104030.2381685-3-phasta@kernel.org/
[2] https://lore.kernel.org/dri-devel/20261117094324.8256-1-tvrtko.ursulin@igalia.com/

Philipp Stanner (3):
  dma-buf/dma-fence: Ensure correct ordering in dma_fence_timestamp()
  dma-buf: dma-fence: Add dma_fence_overwrite_timestamp()
  drm/sched: Fix memory ordering with dma_fence_overwrite_timestamp()

 drivers/dma-buf/dma-fence.c            | 28 ++++++++++++++++++++++++++
 drivers/gpu/drm/scheduler/sched_main.c | 28 +++++++++++++++++++++-----
 include/linux/dma-fence.h              | 15 +++++++++-----
 3 files changed, 61 insertions(+), 10 deletions(-)


base-commit: 7488ee210542b918b9c5749a29fd1502c49a0665
-- 
2.56.0

