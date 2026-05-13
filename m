Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669984D9904;
	Wed, 13 May 2026 16:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691545; cv=none; b=admL3FxjoQoCb2Zmi27Bqpi589UIBwVDGXrzo3XyBbQMgbSL6vn69X6pMmIjt72IfNuChwxlU8+8L76/sN6TMhpqfkXfD3sguqwD7eJsLsRKeOa5xiNDYYgF3oZEcQ3LDb48GKrs43YvHGiliWkwadHkWkSxMVyxaSnjh0A1PKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691545; c=relaxed/simple;
	bh=HWBywhZNm5S90F03ab2bPfMBTJVpbp/CPUzhcaQ2NiE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aFL3BsaMNTC0MUW7JJeTiJOFTi7/ozExlw1msebWtZoWt1qPpbnqicC5q3HP6g+vAJValtcqxKtsch0XUzc+pxEDE1LWO4BC1aTohn3tZx73t83mzOcQLVeOZAVCclf6TaETsHT2kLfu5wJ2R6QIlZ3D6mtIL8v7pki039kGlwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qhZcUgMn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qhZcUgMn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778691540;
	bh=HWBywhZNm5S90F03ab2bPfMBTJVpbp/CPUzhcaQ2NiE=;
	h=From:Subject:Date:To:Cc:From;
	b=qhZcUgMnuTpab5X/QI8oJFjDDZ//d+AsQBo85S4Kz2Vdbf86wpGzix4b+ug0+BkUu
	 rdK4uKr1zrIOn6JerEhay7bJHmPnh5MZ+UzFzE4d0MU4hJJM0mAesVUumLUdNQm3T5
	 3IWc+vCEI4eHBSYYbbBppgSVwggimHvn9BlaWHpTm1Y4/mrNRbtm79TAuWKXw/mdfx
	 fnq0PKibcr1TxKFcE8Q4YZmjjgcneMMUiHUnDZfiBk2QzvOZJ8mDOk41x0EsgZwAqh
	 nLjhL3omldzn/yLvkz1q8yqRSBp80KwpHCis7wuCEBGtp/ikbz1R2tlKj1EzcA5XQ8
	 50LatGA/7zGTg==
Received: from [192.168.1.38] (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 745A717E12AA;
	Wed, 13 May 2026 18:58:59 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH 0/6] drm/panthor: Use guards
Date: Wed, 13 May 2026 18:58:48 +0200
Message-Id: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNQQ6DMAwEv4JyrqskFCo49R8VB2MCRAICTkCVE
 H9vCsfePLva8S68YWu8KJNdsNmst26KoG6JoB6nzoBtIgstdS4zpWHGKfSOoVuRG2DTIoWIraK
 8plRSqpWI4zk29nOK39XFbJY1+sMVitF4j6e/TP7s3nYTDtCyG8HyApsGCUVGuXrgMy2ofpEbB
 qwd453c+PtYozcQ79GGMkHKkCRSq1QjquP4AsQeo9HoAAAA
X-Change-ID: 20260512-panthor-guard-refactor-f1c6bc30c321
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778691539; l=2677;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=HWBywhZNm5S90F03ab2bPfMBTJVpbp/CPUzhcaQ2NiE=;
 b=IJrd8gWatJLHwjDsLmVDqjUBpvk/52KPT51orTT1YyLDcPwzWk5ZKsrBp/9W2uxlLyqRIIVD4
 /LnQ5ANH7WoBluy5DoOb15UCFn8ZmgSw4mfdRTsNYPmpGmZCvdPzuOE
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=

Turn the mixed bag of manual locks and guards into something
more consistent.

This patchset takes care of locks that already have guards
available, but also adds new guards for resv, drm_dev_enter/exit
and the custom panthor_device_resume_and_get() helper we have
around runtime PM.

I've intentionally placed the patch transition all locks with
readily available guards first so we can merge it even if the
new guards face some controversy.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Boris Brezillon (6):
      drm/panthor: Driver-wide xxx_[un]lock -> [scoped_]guard replacement
      dma-resv: Define guards for context-less dma_resv locks
      drm: Define a conditional guard for drm_dev_{enter,exit}()
      drm/panthor: Use guards for resv locking
      drm/panthor: Use the drm_dev_access guard
      drm/panthor: Add a new guard for our custom resume_and_get() PM helper

 drivers/gpu/drm/panthor/panthor_devfreq.c |  29 +-
 drivers/gpu/drm/panthor/panthor_device.c  | 163 +++++-----
 drivers/gpu/drm/panthor/panthor_device.h  |  10 +-
 drivers/gpu/drm/panthor/panthor_drv.c     |  62 ++--
 drivers/gpu/drm/panthor/panthor_gem.c     | 102 +++----
 drivers/gpu/drm/panthor/panthor_gpu.c     |  40 +--
 drivers/gpu/drm/panthor/panthor_heap.c    | 139 ++++-----
 drivers/gpu/drm/panthor/panthor_mmu.c     | 480 ++++++++++++++----------------
 drivers/gpu/drm/panthor/panthor_pwr.c     |   8 +-
 drivers/gpu/drm/panthor/panthor_sched.c   | 254 ++++++++--------
 include/drm/drm_drv.h                     |   9 +
 include/linux/dma-resv.h                  |   5 +
 12 files changed, 589 insertions(+), 712 deletions(-)
---
base-commit: ac5ac0acf11df04295eb1811066097b7022d6c7f
change-id: 20260512-panthor-guard-refactor-f1c6bc30c321
prerequisite-message-id: 20260512-panthor-signal-from-irq-v2-0-95c614a739cb@collabora.com
prerequisite-patch-id: e3cfd6399b2dc5439687932c6e961d845369562a
prerequisite-patch-id: 79820e6740c0c456efc1dfa273de04e495515a1c
prerequisite-patch-id: a3611a7c9551c606aaf87125782e6d18b6a6549e
prerequisite-patch-id: 6e9dc83a60e53e7b0d84030727ad9b1921e4b2ca
prerequisite-patch-id: eabd36064a01418a6ada3176b996a4038a314c21
prerequisite-patch-id: ca3a30182b71bf66c51ed2b6411d7ed8dc761c8e
prerequisite-patch-id: 6e549dd0ee9e3e0c8866da72dcabc82209d88360
prerequisite-patch-id: 5217700df7026ef533a2f273ea2535f9fc1274ac
prerequisite-patch-id: 8d57abec9f92bcbb21108d3005805b7c155a48f6
prerequisite-patch-id: 0bf98de955fce577ff8d4fb82c02dc04684beca6
prerequisite-patch-id: a9e0d90a64dfd5950a69b857af3867404be1ab45

Best regards,
-- 
Boris Brezillon <boris.brezillon@collabora.com>

