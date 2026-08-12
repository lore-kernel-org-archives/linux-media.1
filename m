Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66011423E9A
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 10:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786532007; cv=none; b=ujDf6ujQJdA+QhGNQDcsKq4Y4lPiVMtxwuuMGATHwD3bpGp3DKK27goHKC1jSU8dSFaM85/OGIXtxq+QBlyLv0ZsC9W83qINP+F1EY0ymUFzM4P5zXi7N2rJxPqCpVa0QI2SAR/l8BRQ4j+t3omp1FdJQ5zravsKaSzbGIkV45c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786532007; c=relaxed/simple;
	bh=EOEb3UPJO0b6mx0UWjxOTX67IPVI7s0B5UaSclrLb3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ItKFaapiUMXZw9bNfThbrOCpkQdxJ9kvEGLmIEgkCOdN7Pe00SqaE5Phbw/SkbLpv2RdC2l2J5k5Ell3R9HaTPt2eJYD9NwVkwkFcR0cyKKlIzuG2xm4taEkZXyMHLlvI4hSVUgeUAWAH0G8Hs0bj60crCZtnOcj88/9oBjdC0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSBclENy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSBclENy"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so4154795e9.3
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 03:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786532003; x=1787136803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qJWZ6QeYAslNfnwX1/nS1qNOqky0RLqqSS3O/3zFPTc=;
        b=PSBclENyc8inXPf3+QjhVFtnEUaZiBGQmvXhqAJTlp36zPcDSJSMHZujNVM+K42g70
         shkRVjRM9jSDRrqM9ESsp6BGiAAIA0MGWwClTlMAdPr+jIgN1KeaE3DXpWwG6US+JCHJ
         uwkSyKFd3134lT8uEVuNJCJsEF2roxRltSDUnF+SXsvvpZJHuMvs17DepyOicBDvPbtx
         pAjG2gyKDQXypwlqoqdOFq5P6pE7vnOCzuJ0mArPTz2Uvq8EjpnT4velc9QCq1VJ/Ao6
         N2fz0PGM0HOSRY48sN3HwOd4iQGh+5LnswkdbkWZTjNEUlNfqKxbTTVTJWrhm9ePKc7i
         qcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786532003; x=1787136803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qJWZ6QeYAslNfnwX1/nS1qNOqky0RLqqSS3O/3zFPTc=;
        b=R83eI9cqnx3cBwN42ZKR0WEcE9qf2BK+jcqBgWotFyqHbIRkvch//TEwDgo2h0Ftdw
         IEoxzyv9cQgNOoma9S5IeVmYu9XYr24NfWNrFPg/BLYRIDpZ13XjhIGjeR6k1P1yTFJt
         6/N8Y1QiCa/Bp79g2deFZKVBMQ+6YMj2oENQh2/pUJPcn7PbG0Zk2+MR+I5UeI7ora8w
         qncHAZqAT/fN6wfxJlTyZphnJOUauRanOATX0ZF2GhJZqz0gX4D4Ojbl4GKJihiEqeuE
         eR9TAiMqyKKjEcDVGV2Q/Tes7Jyox1a4cP5z7w2I0PkFbaiO12aMvF3CXrbzGUZg4kK7
         xLfg==
X-Gm-Message-State: AOJu0YzeVgA/xcn4QO/u54PJ7MeA+g62j+/6qIuc7Ws5OzMLkiAucGx/
	uyTa4v1lW1f3m3WaiPaAQBNf8WMvrVmx4cX1GBDZdTWptr25wWXuFNhx8bewrH6m
X-Gm-Gg: AR+sD12FkZy9lXREjS2Bo+brnO/VeK2JeR+rxc3P4Ya65xouFPXYNfWHc+XbC7ANcnH
	BFE10KTQnXrLdaOvHhyrpImbpfwKMgavft8s85B16HjBjHlXLVU2JNt6EPtMxCA5Qop/r1qUp5H
	8cDmXIUeIjIG98Lwe74RkARAiRbEvuCmjx/t1vCUim7Zd2qxu/9NcKiTbx27znAHOqrKH7gT9Nc
	wzFZra9WWmb1G2W6uCmg/F4rXajC/usrsgF9azMmfrTNdu8Nky2fXMzW/nmXLFi6JBp19ZqLESy
	EwSiZ33uTTv81jeEqss5yMMybpja0XYFwb1zJN+tci2NiQCL3n73/TTVpJ64eTGQmHsk7jblINz
	SBPcf7QJ6mgut0hi71+VR2OyphMeveTUVQ+6GCJ72ppp0Fk1WGxWFyI9O3brhcMH+EbLGBorQGz
	IBmby12khigSlUGrpUr4nV7VoFGhJj3ojDdIN2rv8Mx1lPz/eO/9ReeyKu26E7jI70J1ZT7zCNK
	xxWrNqMwGKW4bAW66/3nZFo2SILsAcFJAinxGLAmN5BGeMVV9zDDZVE4ZwPeyKVExcrBuKpShW+
	bfhGmVbJtXOn6urYFPZwPY4uivJ1J84vkluVa4li+W6j3ZGkJ8VQI+DtTUN1MlN/hsOL87/7g6B
	9F6DNHzIugssjt/qaG+ogjMRb2I7vUewX4mc/xJsdm8ESEw==
X-Received: by 2002:a05:600c:8b22:b0:495:5045:39e6 with SMTP id 5b1f17b1804b1-4997c138cf5mr48034675e9.17.1786532003480;
        Wed, 12 Aug 2026 03:53:23 -0700 (PDT)
Received: from localhost.localdomain (host-213-45-168-79.pool21345.interbusiness.it. [213.45.168.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c939574sm37352315e9.1.2026.08.12.03.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:53:23 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	linux-kernel@vger.kernel.org,
	Nicola Fiorillo <nicfio@gmail.com>
Subject: [PATCH 0/3] media: Two oopses and a hang when unbinding a streaming sensor
Date: Wed, 12 Aug 2026 12:53:02 +0200
Message-ID: <20260812105305.32447-1-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unbinding a camera sensor while a capture is running is a scenario that
nothing in the IPU6 path handles: the kernel oopses twice, corrupts memory
once, and leaves the application blocked forever. None of this is caused by
the sensor drivers themselves, and all four failures are present in
mainline today.

They were found while testing two new sensor drivers on a CHUWI Hi10 X1
(Intel N100, Alder Lake-N, IPU6) on a kernel built with KASAN, UBSAN,
KMEMLEAK, PROVE_LOCKING and DETECT_HUNG_TASK. Three of them are fixed here;
the fourth, a use-after-free in the media controller, is sent separately
because it belongs to a different subsystem.

Patch 1 is a NULL pointer dereference in ipu6_isys_csi2_get_remote_desc().
The remote pad is dereferenced without being checked, and unbinding the
sensor mid-stream makes it NULL. Present since May 2024.

Patch 2 is a second NULL pointer dereference, in subdev_open().
v4l2_device_unregister_subdev() clears sd->v4l2_dev before the device node
goes away, so anything opening /dev/v4l-subdevN in that window oopses. This
one was not provoked deliberately: udev's v4l_id walked into it on its own.
The window has been open since 2011.

Patch 3 is the hang. isys_async_ops has no .unbind() callback, so nothing
tells the video nodes that the sensor is gone, and a DQBUF already waiting
in vb2_core_dqbuf() never returns. The sleep is interruptible, so
DETECT_HUNG_TASK stays quiet and the process is simply stuck until it is
killed. Reproduced 10 times out of 10 on both sensors of the machine; with
the patch, all 10 return -EIO and exit.

How each one was verified, since the three differ:

  - patch 1: the oops was provoked deliberately on the unpatched kernel
    before the fix was written
  - patch 2: reproduced itself, unprompted, with udev alone; after the fix,
    150 cycles of a reproducer with four concurrent openers left no oops
    and no leaked minors
  - patch 3: rebuilt both ways, same kernel and same test. Without it,
    3 attempts out of 3 hang; with it, 10 out of 10 wake up and return
    -EIO

The full test cycle with the three fixes in place is clean: no KASAN or
UBSAN reports, no KMEMLEAK findings, and lockdep still enabled at the end
of the run. That last detail matters: lockdep disables itself on its first
complaint and silently invalidates everything measured afterwards.

The reproducer is a shell script that streams with v4l2-ctl, unbinds the
sensor after two seconds, then rebinds it, in a loop. I am happy to post it
if that would be useful.

Nicola Fiorillo (3):
  media: ipu6: Check the remote pad before dereferencing it
  media: v4l2-subdev: Check v4l2_dev before dereferencing it in open()
  media: ipu6: Signal the video queues when a sensor is unbound

 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 41 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-subdev.c         | 31 +++++++++++---
 3 files changed, 78 insertions(+), 8 deletions(-)

-- 
2.47.3

