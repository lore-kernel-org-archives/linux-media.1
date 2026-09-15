Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414E549E5F9
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471524; cv=none; b=ocHlmcH4rkB+uQnMmRQorFuYHqKCvafj8IEB8rqZ75O/zNOQLxPM3yLGImOMz3i1kPcugtwoIxAogfQNEslJB82Ug/3GCRLrWeqHYv5UmCWdYNjXUd1XFevXd+rIeettj72vFIQ591murL0XJS80VQ2P2GBgWZvHdZ5SWOoGUgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471524; c=relaxed/simple;
	bh=JciKneq+ovpdv8gqUDVuoYPtwcnhOaSHeZQ1sy8ZmKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Usa/4BDQwllsJYVlRLTQqU0fEDWFtPZlRTdlu3dWfKQHwp26srVLmOeh/1tWdh3TUi2K2b+eFtUjYw/ownoyt40HKJa58+98iZ+Ty5XW+lwxhPtbUDSH+qtCMaU8VdMDENo7mLW5wnGJ58DVjIBjWmlzWEz1bKQVfQOKlK5TB4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EK4hMLH4; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EK4hMLH4"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2dd68a16955so9698625ad.0
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 04:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789471521; x=1790076321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B9svfT9glpJgkoC//MjvMoYEtW7Hx9VQdKaO91u+NqI=;
        b=EK4hMLH4cGnKtlrKDEkmEerJfGpwumN1S/S429PvkQJxJFfXtEVFo3RXbiib3faFx3
         V0PXSPlrhij+kWFxCSvNk+8qQacW59ziL7EMT3tN8O0ekPEO6W78svt4mXjgUu/2iSK0
         W5EHoNvx+RlxdVzU7nK5giM6av0ezYGayOitnbhUprkIeEvCx5BU7jhRBiq8WL33F+P7
         E8LsiBprmyDxKv7q2MfpJiQnCzIM1arKgsa09m0z3or5aMy0cDsHGbKGkyc0iH10GqR8
         yxNS+5XvRbIq+s0jLhqa6DooPjMXLmpdFj4jm6j+Tmg5x4KSWGhkK8KQauR6nNMdO+66
         oTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789471521; x=1790076321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9svfT9glpJgkoC//MjvMoYEtW7Hx9VQdKaO91u+NqI=;
        b=ydWlyzxO7wZ+JGN/zg9SqOW1VDr2lE19y2e2FsqFrvi3dxlodog0180yd9c5qbXyhf
         gczvy+KzWJtZ0hgGulwlvo9EdUPRK00Aks/x7UCrdMkAK37dvRYftB0bdtEE14GlQrOY
         IMaKuCxnjEmVi7vylE5aD8kx5ibJTiHlno+IDNVtOTyro6uw1qQWhamp0tYPUxWOhY6F
         PfAv1iKfkI48hbIhbW22mKZkA4pUMXC8RCRHFTGzRe+Qn6gWIm0t9eev2kEQWExSnHsc
         A7Qd/rD6fmB5YQuNsntetKKsXOhb9tAycRtxwRcNtTViTSaEK73MObuQMoPGFnB/2xsQ
         M/Tg==
X-Forwarded-Encrypted: i=1; AKwUvByNhXtW9c+manTDqdTQeZDt8hCp0KD4z/gkH5LEwtOGc017BOLYtrcR4LkqGyJGObddcArTbJxobBqZdQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kbrPU+CBoFvB6/gB+NpTvlYrp/23zstN28bIUAjwkH1lL5/DHl
	x56xgJJnaAhnttrh9lt3ia3TJ7zmZpZ97P78v+0kjb6VqF/sFVL98mQb
X-Gm-Gg: AYBFou2yuvzfn9137r+ZcY1MGVp75JgvDyJj9ywF2K68OMfhF7tj84fPMsProjd7H6K
	Tqxl1vcpMZED4SBOPpsrbkrd2hXIgJP92GfspYsPNTawY2tUqfKXgEpMu8lV8EABJlubkkJbTkt
	0YHyvbFzMYfNS141kD3/S99nyqS13WEueFpbP6/NmTy6dklYdJo24W8Wv7Bp8VBIg0DnW/QR7oK
	3FOCn0wvBiABcRATRtrhySvF+9+khxGxfxSn4v9n85e2eiz6QO/zVtfOi2Qv5KSJfZSmHhUFtNl
	8iwgQ6XMKLcTX6QWpTNfN9b0Xqo4h92o+puGv35jEb5HlYT2YvVVfEUL+/GqZHoU4vggvrLKsB5
	bT8XoYRMz+LynSOsKHPzzUbSTEfRIgoiitQKbuxyCNA3oWVh2N8kJqcG6sCFp5gbRruBkAk/I86
	xTG06x18YCzDBoIX3OvlRtth5GVrA4VfUkEKDaLq3KVAHB84mbVVQaOw==
X-Received: by 2002:a17:902:db0c:b0:2bd:2c3a:2a36 with SMTP id d9443c01a7336-2dd763da77fmr44939985ad.0.1789471521158;
        Tue, 15 Sep 2026 04:25:21 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2d2565d2sm65391005ad.15.2026.09.15.04.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:25:20 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Eugen Hristev <ehristev@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: atmel-isi: release unregistered video device on remove
Date: Tue, 15 Sep 2026 19:25:10 +0800
Message-ID: <20260915112511.2397941-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atmel_isi_probe() allocates the video device before registering the
V4L2 async notifier. The video device is registered later from the
notifier complete callback once the remote subdevice has been bound.

The remove path relies on the notifier unbind callback to unregister
the video device. However, if the remote subdevice is never bound, or
the complete callback fails before video_register_device() succeeds,
the video device remains unregistered. In that case the unbind path
does not release the object allocated by video_device_alloc(), and the
remove path leaks it.

Only unregister the video device from the unbind callback when it has
actually been registered, and clear the driver pointer afterwards.
After unregistering and cleaning up the notifier, release the video
device directly if the pointer is still present. This covers devices
that were allocated but never registered while avoiding a second
release of successfully registered devices.

This issue was found by manual code inspection.

Fixes: d12c9088c0b2a ("[media] atmel-isi: remove dependency of the soc-camera framework")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/atmel/atmel-isi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
index a05a744cbb75..6a7e240c5b18 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -1121,10 +1121,13 @@ static void isi_graph_notify_unbind(struct v4l2_async_notifier *notifier,
 {
 	struct atmel_isi *isi = notifier_to_isi(notifier);
 
+	if (!video_is_registered(isi->vdev))
+		return;
+
 	dev_dbg(isi->dev, "Removing %s\n", video_device_node_name(isi->vdev));
 
-	/* Checks internally if vdev have been init or not */
 	video_unregister_device(isi->vdev);
+	isi->vdev = NULL;
 }
 
 static int isi_graph_notify_bound(struct v4l2_async_notifier *notifier,
@@ -1323,6 +1326,8 @@ static void atmel_isi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	v4l2_async_nf_unregister(&isi->notifier);
 	v4l2_async_nf_cleanup(&isi->notifier);
+	if (isi->vdev)
+		video_device_release(isi->vdev);
 	v4l2_device_unregister(&isi->v4l2_dev);
 }
 
-- 
2.43.0

