Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D284322173D
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 00:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122474; cv=none; b=b2LstgqdEy2YQKxjX7oYqjuQfoDrOYR4UGjKCqUiBRTU+ni98ucG/7DC/pLFitqtP8gMFKjxTyY15H6AiinItPHflOVQZ2XHkxO03U0COZ4ipitaliDImimorpEpRLeXNEyhsyxRLs5oZOBylCjz8PW+BE4mzdvWEs5Y8u0bo6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122474; c=relaxed/simple;
	bh=P6Ln9yydET6/DT6UaCQHydMvq1BdaUCBA6jzgFW3nhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U4m7K6j/lJshJKxondpEOvQMrF/h1TghUwH52P+Wr6eV0A2y2xOLWbVcugj8bgtuL6k7BCunLjucpNYnWIyeZ69Cca49Y/m8MGFfmpWzz2YZVaZBo3ed2hZ0TKi1bBz7TFSkxIJJZ4z7EYEepMAtND8cWNGfnmSthqgPY+k6yUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7rmXKCN; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7rmXKCN"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so1784445e9.1
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 17:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790122471; x=1790727271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sRqDipDPc1dQZZEdRWvlY8idVTIi6hQUDsT00pu+0Qw=;
        b=T7rmXKCNhAaMfGu6GhBZE4mpKt0BlVK74xR39YZT60oHxKEdFTTBXt1jFdjoDKGKt0
         s9LrT7cLzTNGfk9B0Bt/XkpVaR6Fh9ovY+h0UNW3xPE55JgEAeFGtigo6Lh/sKeATtMs
         A2zXUgHUiHXmJJdBmqc7Xq7VD6d/qO1VfeJmQjxCTIM0ZD/oFUvGvmH6E//0TK+gbEeX
         xIPOVi6A1fiWmxO7tL9GA66WQo9X+7sBJ/XzcyZYaETENenHhfbBa7YeLx6tWdy4BHDt
         d+0l6dtg7oJOyVYA/oW0JesDY0bk7zJSILac+Gb6dA7LQf3uCC63lek1/2c4XayRyEDh
         JdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790122471; x=1790727271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sRqDipDPc1dQZZEdRWvlY8idVTIi6hQUDsT00pu+0Qw=;
        b=xeprM+02C/WqW4j72nhXyy+poKXwqQaE/kq2By7Ye1N0bn+NZ+Z8Hhhq6nqp7VvRVJ
         M7DfbhzpqT+QwqKS/G2mHV9iiUrH1LkP9QZdtc+kenPWGCSK0mSIex2bBWM2tjwHE0/c
         hkWXPK+u5bgp6UbyL52mogguu69TruVVIUjLjcwQSveXCJbWHFNRGN5trsLex6b1E8af
         vM93e3d9cXpMu9rhCFNxyHYJB9vXZ4ni/PO+aRo+Pp3V+sl0SuFXqwZXmRwE17iodRAZ
         ClSfIau5XQvYN1Fr1Zj4TcPVlPyY7a0zg/6+REdBrWO1taNF6XefJZKjCM/gJNw0Km9u
         YeaQ==
X-Gm-Message-State: AFuF++mujGA3KriyiuZTVG5h4+3c7VAicF4Dsnpl0eEaqQ3iLHcn0Y0y
	QFcfgM9Q8w/nmluwNNDo4akVwSSQDny/iVpZDGRjcA1or1d1KdEw83WA
X-Gm-Gg: AYBFou0soJpU5xQI6/uvI7X3WpQImhtkEWUvSl1nfygIHmHBpPhjxIBa7l7wd2IXw5d
	ZHyNrnnnHm8Chepklxfc3hf7xCUTFMKxKESInevKqBslIo8CVEfLHhsxKOdixS2e8sEr6m46wq0
	5S3yQR+X+ZDbaklEE04onGuUlGSUVbef4r9ROt/hRE0ft0CYoBpUaOrvAWxQkzcFn5HzcUa3FVK
	HoTuzTkKSKnxqkDpodKPoHG7Y5tkyx5IjlaQzheIG/SCbuq3b67CIsKaD5rFHnUYMGQsTx2Eczn
	W7KWzt/5/qKXSc0WOi3TxJ67Y6HmE3LiXmPzRBUlC9BYDzGLJ+Xv8Xtb76Qu+cIjSfi7CNoEpUx
	F7N8iipehVs3UZCEvYTJxIu5poRT7VDON83w4kxiVx80kQwk2muZ8PxtxP4jmr8yQs2zzVt/uJF
	MvjRVV13tyMmiwPfGisNF0KI8mpM/CRYf0pB3Gydx3nB/aTAuAJsV6RkaImoE3h4DPiiyx2I6ux
	Nq2q6g3CdYLZqf/1uvo0wlxDOdQPoQGwTAzlbTyzYwMNy3/RatIYgGFIX3JRJXnvH+CD02s47U0
	6L0bLtBPdEXjnxhHFQvBLg3X5ewliH3YG9pMUFC/K/ISDMtRyq+UUwb7FOxsC0a5RY3XzRfe4NN
	oIKGlVSqPj2no1ETDFOnlOA==
X-Received: by 2002:a05:600c:871a:b0:49f:dcc8:c735 with SMTP id 5b1f17b1804b1-49fdf1370b1mr9001355e9.18.1790122470917;
        Tue, 22 Sep 2026 17:14:30 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-8c68-4a09-6ad6-6324.ipv6.o2.cz. [2a00:1028:c000:ddf:8c68:4a09:6ad6:6324])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde180a39sm34612165e9.1.2026.09.22.17.14.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 17:14:29 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <v4bel@theori.io>,
	Josef Schlehofer <pepe.schlehofer@gmail.com>
Subject: [PATCH 0/6] media: az6007/drxk/dvb-core: cope with a tuner unplugged while in use
Date: Wed, 23 Sep 2026 02:14:04 +0200
Message-ID: <20260923001410.30297-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unplugging an az6007 based tuner (here a TechniSat CableStar Combo HD
CI with a CAM inserted) while it is in use can leave parts of the DVB
stack stuck on the disconnected device.

In particular:

- drxk keeps accessing the device after unplug and hides the resulting
  errors from userspace.
- The CA thread can get stuck polling a removed CAM slot and prevent
  the disconnect from completing.
- Applications that wait on or poll the DVB devices are neither woken
  up nor told that the device is gone, so the disconnect can wait
  indefinitely for them to close the devices.

This series fixes these issues by:

- treating an unreadable CAM slot status as no CAM,
- propagating -ENODEV from az6007 to drxk and stopping further device
  access,
- waking up the users of the demux, dvr and CA devices and returning
  -ENODEV to them, so they can handle the device removal.

Tested on Linux 6.18.44 on a Turris 1.x (PowerPC P2020, two CPUs,
non-preemptible):

- tvheadend with CAM enabled, idle, scanning and streaming,
- unplugging the tuner or the whole USB hub,
- unbinding the driver through sysfs,
- blocking reads on dvr0 and demux0.

In all tested cases the disconnect completed and blocked userspace
operations returned -ENODEV.

Some pre-existing cases where the release waits for users that are
not woken up remain. The unlocked user count check in
dvb_ca_en50221_release() and dvb_dmxdev_release() also still races
with a concurrent close(), and patches 5 and 6 make that race easier
to hit.

Josef Schlehofer (6):
  media: az6007: fix CAM status polling after disconnect
  media: az6007: propagate USB errors from I2C transfers
  media: drxk: stop retrying after disconnect
  media: drxk: stop accessing a disconnected device
  media: dvb-core: dmxdev: wake up readers on release
  media: dvb-core: wake up CA users on release

 drivers/media/dvb-core/dmxdev.c         | 31 ++++++++++++++--
 drivers/media/dvb-core/dvb_ca_en50221.c | 24 ++++++++++++-
 drivers/media/dvb-frontends/drxk_hard.c | 48 +++++++++++++++++++------
 drivers/media/dvb-frontends/drxk_hard.h |  2 +-
 drivers/media/usb/dvb-usb-v2/az6007.c   | 23 ++++++------
 5 files changed, 104 insertions(+), 24 deletions(-)


base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.54.0 (Apple Git-157)

