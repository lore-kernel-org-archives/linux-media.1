Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28663403E9
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 16:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784304356; cv=none; b=SdPaBDL91eNluRxi50r9OoV/37vg1OIPxLnzQ3h3rk8+KtkzooRXfQ8SC4YeMzdfS9KdCoDuJDqz1P/AFrIfXBbYqpZ9yrL+Fzqvu6j+/dAIQm+uxZa1bunVu9LFX+7yRD/wY864Z8uHFKxv2DTDgulDQcDzl+5Jcg3ljf4pbS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784304356; c=relaxed/simple;
	bh=97i8xe4qzFvaiFutvw48eX8tHd/TsTkX9mpNpq424x0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DiDSvh6YOtEHRzKOebDPWd0aFjH/nRoRn1XJ3CQY7nazNOh6rbqj5In7yCvCH3ELuCESuKTG4yVDN3fwFrRJcYs9P+VYzeoazD5diSMkvBXsqFGwXeSDhM/8HXX9EpTFOIQwDZr6Cy0QKmMaRiquKcmMV+ptoGC/iHBKpMHMLQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eH5x4mg1; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eH5x4mg1"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39c7fd21b63so60757051fa.0
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 09:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784304353; x=1784909153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5bUCnt97h5CBtRFgUec9lRH+/+kYNrMwk/z/ACUx7U=;
        b=eH5x4mg1Yk8WT8LQbh2UhsYY4g2dcj8R35L88ugLWlNAAmFahOgwkb5g2CPjjml3Qg
         s47FGq+mnXAMOIMAQ04rPFwuxtVlGXc/wBNzkM6GQYqrGLStdPAs1SDk18hrTkfrA/T2
         IO8rwcgPVo6BulQZbyQ+O1jNfq69wSm7DbEKKhUqp7Hg6nC1eV6bQeS+/HZXrFWDhoOt
         x2l7GciVjWa3AEp73ovhUr8OQRV8l+6JDrXKCvjzVFsqUg2UH8d+tcaL6ueXJJ5oBsC5
         r9veEFZRcxYEWtEJzvax09fE5rJq4e3wB4YqG9AeI10Qdf3ruYozwsW387iPvlu51xni
         BF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784304353; x=1784909153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5bUCnt97h5CBtRFgUec9lRH+/+kYNrMwk/z/ACUx7U=;
        b=ojcd/LiSkRu2X30rLQxpw12GszM1VwWY8KLz3iCWDhWhFmr5CYXU+fUldgeDLDdDm0
         4sB5dXsgnShrXjfkaOyx5Zn6M5JW23PQzKTWUyZqd7oIpJKmMV5gz5AJx5PkJVKd76Qu
         zo0n2l9YgKeEg0FkAR4+UiymB3rrMsMM7Gzl1oazDKo+WMcOUpbMjCkmQaEMj4Vr/PBs
         OL5KaGIER7f14AZzsfdO5OwHlJoQoUL7i/J50HxP9yIxrFPUtwY4o4lcVoC++J1FSqXZ
         8Geveew2APQuXlz6+fZm3XtacRFZwKuJcV3faukicwjDnXh8UyWlHTT82v3UDh0/ZfXE
         M0UA==
X-Gm-Message-State: AOJu0YwNq/sGxnpMjK52jQ4cAEQiFxLv5440umHKqtXBBQ/qnVDfOo9u
	1VZBsrhceL9wxJFa1QlyOiGVq8XEk5tZtkX4CRVQqi+YLnVKoqTkH7iX
X-Gm-Gg: AfdE7cnTvyxUGVq+SjyvAv2YB1RlpwbycEiJRHmm8sVjNIeMht6pob4z9Zx/7kHXPbU
	U0X8p9i94yz4OKfa2gEJqrXCZWpwSaS5XOEyljqTooRzg3mroKgtA1x98xC023pQlCfNqlj8Pwh
	l7jEfRocKa30p1XoCQhAjyB/aeFOZ8J4ILW80IGfwLnzM6PilCMTcy8vHoCjOng8yXbNtpFfJfa
	GKPRwF6bJiKoX6FpyOHhNLWmAnXnhtDc50Dlun08LzEaUhj0ktuYwPKrhzbCHWsuMeafgpNtk6F
	wox6DhXBWlOxG//xCFYoZu1B4kee8EXYAtJbLL1TmZ3BCvZaDVaJsmedm3ZQwYNG1zrHoyG2sP1
	l8oj3274GJyULkt66LkMrXOOFsqLu3a53YVLn+WiCpBcEvkA54d/FChxaNWDcAqM3yAPWF1uQQ+
	Qx7rLnOXy34ibsoWUS+S2ql/NzhmLbMxyxqbRHOFBtmx9rMPO9lH8qcdygS7Hk
X-Received: by 2002:a05:651c:1508:b0:39b:b01:ab84 with SMTP id 38308e7fff4ca-39eb274d9d7mr7254931fa.3.1784304352699;
        Fri, 17 Jul 2026 09:05:52 -0700 (PDT)
Received: from thinkpad ([5.215.185.239])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39eb4e91096sm2703671fa.18.2026.07.17.09.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:05:52 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	linux-sunxi@lists.linux.dev,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v4 0/2] media: sun6i-csi: Convert to active state and improve MC support
Date: Fri, 17 Jul 2026 19:35:45 +0330
Message-Id: <20260717160547.44460-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series modernizes the sun6i-csi driver by aligning the bridge and
capture components with the V4L2 subdev active state API and improving
media controller integration.

The first patch migrates the bridge driver to the V4L2 subdev active
state framework. The private mbus_format field and its associated lock
are removed, with the framework-managed state becoming the single
source of truth. As part of this change, the capture driver no longer
accesses bridge-private data directly and instead resolves the active
format through the subdev pad API. Since the hardware does not perform
format conversion, identical formats are enforced on both pads.

The second patch implements vidioc_enum_framesizes for the capture
device, reporting a stepwise range of even frame sizes within the
hardware limits.

Hardware testing performed on LicheePi Zero Dock (Allwinner V3s):

  - Parallel pipeline (csi1):
    ov7670 -> sun6i-csi-bridge -> sun6i-csi-capture

  - MIPI pipeline (csi0):
    ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-csi-capture

---
Changes in v4:
  - Remove sun6i-csi MC centric patch due to Paul feedback
  - Link to discussion: https://patchwork.linuxtv.org/project/linux-media/patch/20260509050921.22158-4-arash.golgol@gmail.com/
  - Link to v3: https://patchwork.kernel.org/project/linux-media/list/?series=1091921

Changes in v3:
  - Fix Media CI robot warnings about open parenthesis
  - Link to report: https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99380724/artifacts/report.htm
  - Link to v2: https://patchwork.kernel.org/project/linux-media/list/?series=1091728

Changes in v2:
  - Fix indentation in link validation path
  - Return pixelformat directly instead of a pointer
  - Link to v1: https://patchwork.kernel.org/project/linux-media/list/?series=1054768

Arash Golgol (2):
  media: sun6i-csi: bridge: Use V4L2 subdev active state
  media: sun6i-csi: capture: Implement vidioc_enum_framesizes

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  49 +++++-
 3 files changed, 108 insertions(+), 105 deletions(-)

-- 
2.34.1

