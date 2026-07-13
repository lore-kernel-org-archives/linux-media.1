Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCA93FE645
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 12:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944531; cv=none; b=tV1pZyxkrS8cJ4GemrlXbUqKKiPV/zqW0kydIid71hse54HrhvQtx0f7vIqJiXULp+A7tMJ3BzwYPrRCOkfqp5BkDawqv3NHVx3gcEF1tkPj+OjAZvGcoDk5zCWCmT1lPLyai4WJZ1R90CzYBCdn0t3lJbaShP8tejT3c/da8ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944531; c=relaxed/simple;
	bh=K4ILPUNRBeoP2Zur+TEHcw7nDTxcQwJCcj7zlQ3bEUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZYn1vg9KJM+tByyd72UNQ0N2bcMxsudn7HezT8pARh6m2XW3zgoyW6+UxzXMFzg4p3InzK6+yBMrHjhrKd5co+5yrJ+k7swqL3FdKoMEMSaeqEDy5As+RUKyZ/fM27CHUC7iD+U5JrvzshtNWdF/ZOl8ZJP+EEKqhE6AdqmWwfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YH4VHkXc; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YH4VHkXc"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so47222805ad.2
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944530; x=1784549330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FR0HREIu+ElJTqYD8DnR97TKZwOpP6adDHM14P7pQGE=;
        b=YH4VHkXcBF1e1/+hmtCjLCt3n/kzCCMDz26/pPu+X/eZNLYtyft6tqEsd9MsbOzl7O
         /Rtqlavc+7yhcvTVbgYimlK/0Pu42N3Pzs7tZnU4KonD1t9AygdZx2lmuqaiDk0tOSMJ
         DSjpeosKQK/PCy9tV62RExJjp3FCzGucpvM8m+6AKXZu0YupJ8fs7J5tze+jdBMuXVb5
         HIaeirAVSHDs2u90RSwELASmECtFd9n8okDHcxCnWEBYa4H55iBP9I5hJQa+ZZqvDh7X
         Vj26m7PXporfQUoU5bI3iWyDjPOB1p06PscY0/c7HG9Sxq0yDZCQ6WWMKJ2Xfxu30aCK
         jHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944530; x=1784549330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FR0HREIu+ElJTqYD8DnR97TKZwOpP6adDHM14P7pQGE=;
        b=IIq2ji5EGm76vh4Xh+iO0lsgu0VIrRLPldtCAGd3DTDQEL2+INyK3aB6rlwEWS9cJi
         XLTEtMALqtiZ0tqUe3MVFDlXrj5HdxPk042pMuIIrkgYMATKyyegst1vs5YTrGpZ9kHS
         bq1d8AU0VJg/ZSTCDI/oM/CQycJSQdN0dTdFPJRzuWaQPYh5okucz+AEMYvpqbsfRkz6
         YL9s3PsOk1atoNu8r9gBxK4WXKC135H5Oim81jMnRnGJzIA1Yg28qyLVrx3Bv1+gU90b
         h03CCI7icXhB+TpNbVwXmk0i1TJBqmWnwYWILjosx0LP2u/FKIGw08Fct2B0JW0TpA37
         JmnA==
X-Forwarded-Encrypted: i=1; AHgh+RpiLCCQEUm23pda/5JmUN+oaHmH1AStlcQdfoYJtaPisMUL93eW00PVeQrgSUa4S5q/d+wWb7xB48R5mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaCF2m3laVBYcm96zLjOuuFxW2RpkAIIYJAw9j9OBU9eTmjJP8
	K4t4NFjq/AEr9ig3pfmgRBOZ7sqSpN8atmkuS2AzAhhrN7knMY7EwwiL
X-Gm-Gg: AfdE7clrUXTIndm+GUTZzSq2wql9/pNUxbFBHaaZbFcusfhwqQNVdjIsqR0gqyjhpbo
	NOeLjuXoyaOfanlHlHYItREMmdX3CZIHdR6LnFHEBpt7OMMRFOGucyqLuF9zhqT3s//JuzU63rz
	O0Ac4jw0dtx0JwvkhtRqQqCxIJClF1NIKxl4x3oG/5m2jljrgNaWNP4nn6pIVXGm7GHlPfPba85
	02JQ+kDiOzHWGGN6AKxsL6NuUYFLP8XmV+iTjQd/K4vMKFomEICBVvjUeqN6V4IX97jPYKkxA0h
	tvFcw8Y/wSqDj7D2bZikkr1HBqKtN1s0yDTSuP5xqcsVDOwJi+hMXMj6Tdn/yGsFZa2KvBAkryR
	sNSpBbsPMDZbPNM/UatgU8TwMGkPewJeBS/zRlCbuJ842Wm79oGW8apFnQbL1WROLoFGOgrz8ib
	OuN7MGkJzLFptLQf7EoGoTYQo4JtlOyCo=
X-Received: by 2002:a17:90a:d64c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-38dc7296c33mr7622430a91.0.1783944529816;
        Mon, 13 Jul 2026 05:08:49 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:08:49 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH v7 00/19] media: meson: vdec: Fix lifecycles, race conditions, and stability bugs
Date: Mon, 13 Jul 2026 17:36:55 +0530
Message-ID: <20260713120840.17427-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses a collection of critical race conditions,
memory leaks, use-after-free bugs, and resource management issues
within the Amlogic Meson video decoder (meson-vdec) driver and
associated components.

The primary focus is tightening session lifecycles, safely synchronising
the V4L2 m2m framework callbacks, hardening work queue operations
(esparser_queue_work), and correcting buffer validations to prevent
stability issues like KASAN out-of-bounds errors or stream-on timeouts.

Summary of Changes:
* Race Conditions & Synchronisation: Fixes multi-threading and
  execution races across stream-on, stream-off, job abort, and
  teardown pathways.
* Memory Lifecycle: Eliminates memory leaks and use-after-free
  vulnerabilities by safely pinning, canceling, and sequencing
  device removals.
* VP9 & Buffer Hardening: Addresses payload handling bugs in the ES
  parser, properly tracks ongoing buffers via atomic counters, and
  prevents invalid memory writes.
* Platform/DMA Adjustments: Adjusts DMA segment configurations,
  canvas handling, and buffer sizes to match modern hardware demands.

Note on an outstanding issue:
An execution deadlock occurs in the driver workqueue path during high
stress or long playback sessions. This stall is triggered when the
Amlogic hardware internal video FIFO buffer becomes completely full.
When esparser_queue_all_src runs, the capacity validation check is
tripped due to a design limitation in how buffer exhaustion is handled.
This blocks progress and leaves the workqueue worker waiting indefinitely
on a core mutex lock.

The resulting hung task call trace shows the worker thread blocking
on the internal lock:

Workqueue: events esparser_queue_all_src [meson_vdec]
...
__mutex_lock
mutex_lock_nested
esparser_queue_all_src

I have tried to address this issue, but the underlying deadlock persists
under extreme conditions.

Any feedback on this new appock is welcome.

Testing was done using v4l2-compliance and active decoding pipelines
on Meson platforms (like Hardkernel ODROID-N2+ and ODROID-C4) SBCs.

The v4l2-compliance tests passed successfully via:
$ v4l2-compliance -s -v -d /dev/video0

Pipelines were validated using the following GStreamer script.

[1] https://gist.github.com/moonlinux/08295ba1f17ce7155550773f2d2cb6e5

Previous changes:
v6: https://lore.kernel.org/all/20260530094326.11892-2-linux.amoon@gmail.com/

Thanks
-Annad

Anand Moon (19):
  media: meson: vdec: Fix m2m device lifetime and cleanup path
  media: meson: vdec: Fix STREAMON / STREAMOFF race conditions and
    session teardown
  media: meson: vdec: Fix lifecycle leaks and race conditions in
    recycle_thread
  media: meson: vdec: Fix use-after-free race between teardown and ISR
    routines
  media: meson: vdec: Fix race condition and synchronize esparser IRQ
  media: meson: vdec: Fix race condition by canceling work sync
  media: meson: vdec: Refactor esparser work queue and fix teardown race
  media: meson: vdec: Fix concurrent execution races and unsafe teardown
  media: meson: vdec: Fix vp9 header update failure on invalid payloads
  media: meson: vdec: Fix race conditions and leaks in esparser pipeline
  media: meson: vdec: Update core m2m stream state during transitions
  media: meson: vdec: Coordinate m2m task execution inside async loop
  media: meson: vdec: Fix race conditions in job abort sequence
  media: meson: vdec: Correct atomic counter placement in dst_buf_done
  media: meson: vdec: Fix concurrent firmware loading race and hardware
    timeout
  media: meson: vdec: Configure DMA mask and segment size in probe
  media: meson: canvas: Fix Use-After-Free by linking canvas provider
    device
  media: meson: vdec: Increase VIFIFO buffer size to 32 MiB
  gpu: drm: meson: Fix DMA segment size limits and maximize allocation
    boundaries

 drivers/gpu/drm/meson/meson_drv.c             |   6 +
 drivers/soc/amlogic/meson-canvas.c            |  14 +-
 drivers/staging/media/meson/vdec/esparser.c   | 127 +++++--
 drivers/staging/media/meson/vdec/vdec.c       | 320 ++++++++++++++----
 drivers/staging/media/meson/vdec/vdec.h       |   8 +-
 drivers/staging/media/meson/vdec/vdec_1.c     |  16 +-
 .../staging/media/meson/vdec/vdec_helpers.c   |   3 +
 7 files changed, 388 insertions(+), 106 deletions(-)


base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.50.1

