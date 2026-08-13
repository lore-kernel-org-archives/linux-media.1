Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A73398910;
	Thu, 13 Aug 2026 09:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613150; cv=none; b=huDGdQQM/kjIjQrzPZndNGPWDsUU3dL1/6tljBCLgmaqF60XM1EE/eeZGawTKFajy+asu96utwJfKR5VFHZWz+eIuRybG5YH+dKWds28N7F9dLcb9XiZjnYMdtCxET4fBle8XkGx5k8+4QCM+r5PH0uNhiLCXkP+c0QWLgwCMrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613150; c=relaxed/simple;
	bh=lzTuUfNwGvxjQmTLSG3hK8we5wRXMWA+yRqx8d/6FMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=muvr8lpAMpCH/mDMrNOHSvnbNR9pv7Ef2BkrGhPh7rFCz7jSaY/dSWP456qrBAJjmpvfOPMULvMtTRh+cgyvm0iVJCDRUydPL0+B/HcjM7TQtw8FkKspOuY63QBBO2To94g8LIW/KbROPbXs5l6b7KN8nCZeKizqQ9SYealu9JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EAyrX4LI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EAyrX4LI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2281F000E9;
	Thu, 13 Aug 2026 09:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786613149;
	bh=ZhCNxiDA8SnwYZ6xcBnoRkq2TX2dfnL4cLvkGttpTLc=;
	h=From:To:Cc:Subject:Date;
	b=EAyrX4LIrUUC5q5o0FBkarYNtmFAOanDEgIGXQmD8+Kb0KboVV4QTpJYE/LQGBpxN
	 7TrxzMZymhWs0KyQcV0BOv/5F3v63G4ZKFaNZX+YYzvne8YOaINp3vjzV3DtnA672J
	 RgRubb+dNydjkXw648on+MDW6UHYG0s4OVsRNq3OaDrMJOoBz+6cIwP2AJN3p9upxx
	 HHpfu8B3mjFxEzZEGe5CO0kw8IKUgoJ5EICbIaPFHmlOzqJoEP+JMbTS+dlfgjGWVs
	 nGgRXjWlMvJ/Xq+1YNXJAWG4Eo9Ci8Gk10laS4n+1YJFMVszmELKY89OF957GLD2eF
	 cKpQW1Mee0gUQ==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/2] drm/sched: Introduce more locking to entity
Date: Thu, 13 Aug 2026 11:25:11 +0200
Message-ID: <20260813092510.2385962-4-phasta@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is for now based on drm-misc-fixes. I send it out so we can get
consensus for our work in the upcoming cycle.

Changes since v1:
  - Remove a bunch of patches; make this series only about locking
    entity->last_scheduled. The rest shall be done in separate patches
    and series. Consequently, also do not lock spsc_queue, yet.
  - Move lock-cycle patch to first position. (Tvrtko)


Both Tvrtko [1] and I [2] have recently proposed some improvals for
drm_sched.

While taking Tvrtko's feedback into account for my patch, I realized
that both his and my patch can be fully replaced with a bigger and far
more beautiful series.

If I am not mistaken, it turns out that the entire entity->entity_idle
completion is also nothing but a workaround around the grave mistake of
not using the greatest helper with parallel programming that exists in
computer science: Locking.

This series adds locking to the last_scheduled field and all checks
related to detect the idleness of the entity. As before, the
job_scheduled event queue causes the periodic checks.

This way, we can get rid of memory barriers, RCU, a few lines of code,
make things more readable, understandable...


Tested with drm-sched-unit tests. I'm a bit busy right now, but wanted
to show you guys the idea. Before merging I'd test it more exhaustively
with Nouveau.

Greetings,
Philipp

[1] https://lore.kernel.org/dri-devel/20260611123423.39819-1-tvrtko.ursulin@igalia.com/
[2] https://lore.kernel.org/dri-devel/20260626081942.2122144-2-phasta@kernel.org/

Philipp Stanner (2):
  drm/sched: Lock drm_sched_rq_pop_entity() externally
  drm/sched: Protect entity->last_scheduled with spinlock

 drivers/gpu/drm/scheduler/sched_entity.c | 52 ++++++++++--------------
 drivers/gpu/drm/scheduler/sched_rq.c     |  4 +-
 include/drm/gpu_scheduler.h              | 10 ++---
 3 files changed, 28 insertions(+), 38 deletions(-)


base-commit: 9a11db68872055e6ead919bad04d6330851c522d
-- 
2.55.0

