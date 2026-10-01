Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6716552B1E3
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 17:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790877477; cv=none; b=HOkT81YbmWrpYrJS5hDbzNB6pf4v82WBSMLBYRnGisfYKh3wgRZMgK6Iv7F4nDff8QDue+mEjRa3E8CsgRSnJtu2FNuR0LrE0GEMQvJSCcmlAf2rKmHyEUS8YMrQn3RTahFcnAu0eeXMsL52OQkvfOkU2XFpNJI767BwEeevzWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790877477; c=relaxed/simple;
	bh=wziKKdMlD3hcI7MX5wQqpzq9dm/mx6FxotMLX0ZW0Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b8+mwEWDMFC1F1Zk1faeae9DuQZBCBmaLkiq4CtO/5827WsvcKz4A3oJiaOHbU9R6tRqPJTzAeS63vIkiKYHc8ePmGUmWtHaN4XsAgBO5w5wXJV50aNPgZ4UtWwtbe3LVvMhSa88ha0l189MJTscFuQOjue6rdJymK9LJhKa/c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUmd4VUj; arc=none smtp.client-ip=74.125.230.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUmd4VUj"
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-9178b9ca7e8so27012646d6.1
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 10:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790877464; x=1791482264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LidMRNdI/T2ht2GtwBzMBnzfJUDX6P9vSM3+ZvhmuPY=;
        b=JUmd4VUjZf5UGQEHyg2v3EtzBn1CiIoQfcQ9UTVW0xdLgelJDEOQ1OOu4UEDCaFkxJ
         rYiKw0lACoXi9hlsfovaX0OQYin2yds9rVMvF0ntKa8Av64XoTr7Dxvq60WNW3mhfeM+
         7HGQ6pSQ6BBBCKQNIfTL6cnz5mjQy+Hc5KP5l6KUlHNduhLbPSjh8YJXW2ziWDy8evvq
         kQkuKMf02sP4ccw/T9FwkSZGBhYyVl6GLvifWg9Hkfgx27Uz6QIrO8Tqa4/ioJEaXKM8
         tGQTpfelkJzeV87N94YhXgl9Q1EOXwCHl0l5uTscPvfoCm4fh+sJK0pxJZwAe+5PYPhD
         u9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790877464; x=1791482264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LidMRNdI/T2ht2GtwBzMBnzfJUDX6P9vSM3+ZvhmuPY=;
        b=Cs5AgG+pbfv6TBZfUgpA2wc05VTYgzznFZ0YScflJTpgOPJwPM5qvDbrj9oZuafkaf
         d0IPEx1t9xDfqOI2PapWc31qLxSSq2PJUGc4+sYyJx15dfWj3BKF/Mijm2GNq9rRL1t2
         H4gUpjrMhN0XOIyJpao5DEGG8kXjUtvb0n0r1PZbZ41RA5/1EJrM71P1Q5ZgB9Q5UdGb
         Rs6nUxAt2Myexb5XKiyFMxmxuWtsesNlUNB5k8kU4Bxw9cwmfnXIsD8HQ64lBAOQQYnJ
         CioHwarKRcvLi82Vv0F4ARlCIwP+tKDoFYrakQKwDz87ssiwPnXiybs/w8QYTFu58nfY
         p2xw==
X-Forwarded-Encrypted: i=1; AKwUvBwRU/nPhtmcvYebhRyB2KVeeXVoa+kkjLmcu+xrX2MWafPWCzGEH+3ULN+9YHNA9qWOMjgwx+W+eGj8tQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL5fG+LzMjSStXw6+uegP6EjQPTSBZdTYNJz7OXpTIaFkh1Ov2y
	8iaV1sThukYszGFxl7iyW1q4BSqHCDB1/ZMncQQfr3ChfyXVtAgfrk0=
X-Gm-Gg: AYBFou1XWAL8dwDzVYv77f4S/PKcJoxGPWGZGG/DsXFI0A/XvNLZu5s1dwrn7cAG+Sb
	u3THEV9ilGWvO2UARg4CCCeAbaAwe0XCa+9j6X++Ky3CrG3DedfYcvs/1ID1DsNpAWaR7Fdx/md
	bWirF/0IfvINzqRLQaFM/qTDuDrzGLrNJZff62M5dG06CGjAar74ukKG2RH5hij8pLlRqkASibk
	7mpuh07iHnGwHQKZKjV5NmKrCgO/naBKWTM5QCMnp1F3lF9Y9gQKrfw275eCQUVNA1/yZi9KwF0
	vNGBVUG8A37///FcD4hr6hh+KaqEPTFyMCVBDezChbs43jmaLTzN1KaKZ6vMUH/5jf1r/A6n2gY
	+HEcXVqsB1iE+Lg1vStofp3wBM9lZtpgHgh90iEiG/70eAk6XP74mdAsN8lJ6EB5baVx9BnSsyM
	F4PK7I0frCYLtEYQZEK6325epGaUcugEvGIFtrtLlxn+gNfqCRKW58dv/UVOjNG46A1zI4/BLhM
	0BudRyCptnHEhAslSjxcR6M5/vsIkTepGTzi3GTE5i8AuKg7W6eCqp3ntK4OegkfXcqoNaIn1kt
	leqm60arTD8qxPKTwYkQMhh5D9Mv
X-Received: by 2002:a05:6214:5284:b0:917:a742:47d with SMTP id 6a1803df08f44-917c0133a38mr4412546d6.25.1790877463842;
        Thu, 01 Oct 2026 10:57:43 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a8a9800dsm31853976d6.46.2026.10.01.10.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:57:43 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ming Qian <ming.qian@nxp.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Shijie Qin <shijie.qin@nxp.com>
Subject: [PATCH v5 0/2] media: amphion: fix VPU core lifetime during teardown
Date: Thu,  1 Oct 2026 13:57:35 -0400
Message-ID: <20261001175737.4048254-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vpu_core_unregister() releases the message FIFO buffer and VPU reference
before draining queued message work. An open video instance can also keep
a pointer to devm-allocated core state while sysfs unbind removes the core
or its parent.

The first patch drains message work before releasing core state. The
second prevents manual unbind on both platform drivers and warns if core
removal encounters a live instance.

Build-tested the Amphion driver for arm64 with LLVM 22 and W=1.
Both patches pass checkpatch in strict mode.

Changes in v5:
- Rebase on the latest media-committers/next.
- Add Ming Qian's Reviewed-by tags to both patches.
  No functional changes.

Changes in v4:
- Resend through git send-email after the v3 Gmail submission altered
  diff headers and whitespace in transit. No code changes.

Changes in v3:
- Resend with intact diff headers after the v2 mail submission wrapped
  the diff --git lines. No code changes.

Changes in v2:
- Move vpu_core_put_vpu() after the work drain.
- Keep runtime PM and mailbox teardown unchanged.
- Address sysfs unbind in a separate patch.

Myeonghun Pak (2):
  media: amphion: drain message work before releasing core state
  media: amphion: prevent unbind while video instances are open

 drivers/media/platform/amphion/vpu_core.c | 18 +++++++++++-------
 drivers/media/platform/amphion/vpu_drv.c  |  1 +
 2 files changed, 12 insertions(+), 7 deletions(-)


base-commit: 4a069a763e8a86821edac4159f7c59a20015631b
-- 
2.53.0

