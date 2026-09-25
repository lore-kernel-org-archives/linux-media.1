Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280B23F107F
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 19:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363996; cv=none; b=W0dljZIV/dYr4Us1spFCYyuxXXhpPM1eMYpsvCtazmY5oQ/oqzP4kscqi/gVwuBNo9xixGn/xV5i45PiFnl/FT519Wh4B6KP7UGy5Ts+cqIfsTIyQV/aRnMwrd1E7qfujkw+gzW0wrif5yZCaWCy4+LeYVbUD6Khc6C8XRfy59k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363996; c=relaxed/simple;
	bh=IX3hAHmd5J7B50rrTrgTQmwhlSUmM5W4T2F0KVu5jT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B1r+1r/r5WGMkZHglF0d8duSZbpC0MBHO80pvqwW/YN+vi8gNJN+hK06zNwz7CDf/qSHXarCCT0kFlzOrFT4dx79VhgZVjjeaki5X/d4BgJHeX4fu4gdMUtkUSe+GdnMR7Yv/k+SWGYQhwkHQclmc+bdWWckghxfnfnSmBJ0Eg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYsBQbE1; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYsBQbE1"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-53320068d8eso1698611cf.3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 12:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363992; x=1790968792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qhUSV8TkocBqRZDuy581BPfPgSxgiFPox4fK+CF4Ql4=;
        b=jYsBQbE1dpicI+OSbrrkSFkdVvBA4ydhCq532a97mT6lwVTai4MFjtyFpWtwEb+kpk
         sDCDLpMz0Yr6KP4EN6RkQACY4uK6SHhWtKwNJb5YiD5aeKgsPnJAwyYdjmEFvMcsVnkZ
         dVOu8R/7CVxCJMsl7fZrjYf7sP0GfLwOaF7yK1xW2R9Cz32edAFOToLWVI4X8hea7qfM
         gxuaBUXVlUvFarYtxQjlx4zx2bhmqiiIU9/ExTzSJ87kMbpJRpWrhN1EOfxB0Jy7fsBd
         NpHsAAY1yO8an42TU/Dfaa4CRbP/cSl1rqori3kg+A1zKgMtdN8AoglFwb62UxBlV/C4
         bhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363992; x=1790968792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qhUSV8TkocBqRZDuy581BPfPgSxgiFPox4fK+CF4Ql4=;
        b=X/T7RkfN4on2aJD/V2HFkC6N4fjwrMuBxhw/jpZgXkm0F6a30E4IsQ7DKu8Bdoe87I
         tjjFfRJe3q383r/xtOihDFXDhuufFCKm9TEoMTEcObi22yKMvnzvrUpt5dwTjUwVUfSL
         Va7CcRtA6SYd5DP/H+6vf7HLupfRq1ssVg9JwAkbTkF+c28FxaPdaxLbSuRlOawjpXZ/
         C5xaXgBqzqeAkLXnnucnvBY/pWpJkibvWkV/se9gn6aNPzS97ar5Vo7d4qqR5+0+52al
         Bf9Ys6MvJd3N4eH9UvB2SW9x4AjWM/k9AKFfveRfPBpHscsZVejNkO/2IdZRXNJF3HU2
         X9Mw==
X-Forwarded-Encrypted: i=1; AKwUvByjiu/2B6dkfbELQXtTFFNmuNwxcfdbwxRtME7bqvCp3+pAdqfbeKrDrJgs/b9Tu2edN2ep95Ii5Xonaw==@vger.kernel.org
X-Gm-Message-State: AFuF++kb/2iP0A1beDvWuRTS7C2SJANu5IQaAyiDCsTHYGcPF1DD9uVC
	c3IK1Of4MXB9k81S9fYoiK4Zhdk8NXa4ulfOiJ9oQonaG7Kr3xDTt+s=
X-Gm-Gg: AYBFou2i9RWKUlC0kKKJ/YDYEw/yB3rFWA/l4ltvLg8opcOMjyGjqMWBhnse90wuPcQ
	qAAx/xi1h5j/z5XAvbzTk422BZ/GY1mp1Iqe64SLKw5z5XiMCIKx//wVI49tP35qz6IExI+FTM3
	CxT7PH37lspfDWMiqechDDLjC5NggCo8fLRA1s87rgzRKig5bfrKQOfWPmAkt4K48EPr7LeGEgA
	e69iNrLFzhGkL/ZGcNDLqF5BfOFmO01ZZ5DuTUzoag1Nl/UPvtnqP6AD6Sds1djHDjyxwoMkgDq
	lcTEgltvRKrRtbZARPWXlrVaHUY3m4dXaDcnpytLCG/H4bS8Wmw8x2fTSeKK97y415NhuSY5Yhu
	HITXjveIrUaU8qN6BlhGYG/U76IkohuKnUScCEjfsTsYa2dBaolsh698qAihk1vr6fv7heW6YDw
	8tUK6HDN3gfAAreUvwiKtWGTXnfOKtSClF2TMjLlcO99SdJoPIZmEiclkpxn2/yhBh9nARrB97j
	o7f2NsMCCR8y5PyZZBKee8aNsY2Pg0oqDHS8/rSTfUnO3MzQLjRVbKU+I1kTVD11yJwvi46AYhe
	YV+yVb7AO34GX8/rLBIwz9ShJYZt7g==
X-Received: by 2002:a05:622a:124c:b0:530:fbd1:6078 with SMTP id d75a77b69052e-5330b58affemr62237401cf.7.1790363992326;
        Fri, 25 Sep 2026 12:19:52 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5332225b709sm98811cf.13.2026.09.25.12.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:19:51 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v3] media: ti: cal: drain WDMA IRQ before freeing contexts
Date: Fri, 25 Sep 2026 15:19:49 -0400
Message-ID: <20260925191949.3147558-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cal_remove() unregisters the video devices but does not release their vb2
queues. An active stream can therefore keep WDMA IRQs enabled while the
contexts are freed. The managed IRQ is released only after .remove()
returns, so a handler already in flight can access a freed context through
cal->ctx[i].

Use vb2_video_unregister_device() to release each queue and stop any active
stream while the IRQ is still available for DMA stop completion. Then
release the managed IRQ explicitly before destroying the contexts, which
synchronizes any in-flight handler before the context memory is freed.
Drain the IRQ on the probe error path before destroying partially created
contexts too.

Fixes: 343e89a792a5 ("[media] media: ti-vpe: Add CAL v4l2 camera capture driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v3:
- Resend the unchanged patch with intact diff headers.

Changes in v2:
- Rebuilt the mail-ready message; no code changes.

 drivers/media/platform/ti/cal/cal-video.c |  2 +-
 drivers/media/platform/ti/cal/cal.c       | 11 +++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index d40e24ab1127..0310dba0c810 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -1036,7 +1036,7 @@ void cal_ctx_v4l2_unregister(struct cal_ctx *ctx)
 	ctx_dbg(1, ctx, "unregistering %s\n",
 		video_device_node_name(&ctx->vdev));
 
-	video_unregister_device(&ctx->vdev);
+	vb2_video_unregister_device(&ctx->vdev);
 }
 
 int cal_ctx_v4l2_init(struct cal_ctx *ctx)
diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index b7e77b6b8950..d332a05facce 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -1151,7 +1151,6 @@ static int cal_probe(struct platform_device *pdev)
 	bool connected = false;
 	unsigned int i;
 	int ret;
-	int irq;
 
 	cal = devm_kzalloc(&pdev->dev, sizeof(*cal), GFP_KERNEL);
 	if (!cal)
@@ -1186,9 +1185,9 @@ static int cal_probe(struct platform_device *pdev)
 	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
 		cal->res->name, &cal->res->start, &cal->res->end);
 
-	irq = platform_get_irq(pdev, 0);
-	cal_dbg(1, cal, "got irq# %d\n", irq);
-	ret = devm_request_irq(&pdev->dev, irq, cal_irq, 0, CAL_MODULE_NAME,
+	cal->irq = platform_get_irq(pdev, 0);
+	cal_dbg(1, cal, "got irq# %d\n", cal->irq);
+	ret = devm_request_irq(&pdev->dev, cal->irq, cal_irq, 0, CAL_MODULE_NAME,
 			       cal);
 	if (ret)
 		return ret;
@@ -1268,6 +1267,8 @@ static int cal_probe(struct platform_device *pdev)
 	return 0;
 
 error_context:
+	devm_free_irq(&pdev->dev, cal->irq, cal);
+
 	for (i = 0; i < cal->num_contexts; i++)
 		cal_ctx_destroy(cal->ctx[i]);
 
@@ -1298,6 +1299,8 @@ static void cal_remove(struct platform_device *pdev)
 	for (i = 0; i < cal->data->num_csi2_phy; i++)
 		cal_camerarx_disable(cal->phy[i]);
 
+	devm_free_irq(&pdev->dev, cal->irq, cal);
+
 	for (i = 0; i < cal->num_contexts; i++)
 		cal_ctx_destroy(cal->ctx[i]);
 
-- 
2.53.0
