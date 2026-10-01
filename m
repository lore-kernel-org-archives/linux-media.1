Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6B93E16A5
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 18:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790878030; cv=none; b=BkA7Avh7jsDXu7cK2Di3fwEx5ekqtk7ZTOkB3Q0V26ZHY0ttKp6Dd+TKfwO1tK7HCKT3bIVJqzWIYWC86LzsiGyR0zUpnEr+yaZ8Z3t6q2KcMHUnn59isAOEc2KEpPwjrnLn9cEqJHOpR+SgZiL7lCvsmLXNQbkrJju5AqF2LWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790878030; c=relaxed/simple;
	bh=QsCmprxjt2AIVs23Cx9JQTbYtmyYsaQxrbmPDfjmTRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZtLt9Ut5EXvd6q4rX5jxOMpN0uImTAmakN17KRg3IaTzDvnGh1Cw7YX8FnZ0OpsVS3bFAEjeXXziaFG6tDikuii5ujHKg2sXLR6pqChCQUfqbxlVvApkPh5M2lvTVnsP6WOpyI2D7CKkg9KU+b/LrflZ9ba02iCSVJcu0P5PNz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTvBFO5e; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTvBFO5e"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-914411dd7ecso25495966d6.1
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 11:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790878025; x=1791482825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7GPDCUkXzbddkBBz1dYgs3l5YKgPxDZJWy/V/n2BPFU=;
        b=LTvBFO5e4vJnXr0+4FKdBv0Oat3qg3EB/WoQUwBvQCQAebiX0pJvoMZdfxe6HXDPd9
         k52+cEHhSyoE7aht4e6VhyFKo6JyFfrY7fU7a87r0Zd6/2hExFgl/BnHbF5qK7S4kR+O
         ngMiq14OUpvvPHHbXSwf4yUAO7Ys3vrysP3b2hQ88eeL84qLMttCVAicSiMpXPlDc1xQ
         toKjTcDGDtwOGcQKoyJVir4fF5AjjIRL/baKeMzxKvC9izOMAdmNGxsdHEk17fp6zONJ
         w738wU6JdhpJkQo94ne/uKlYX+NxiF8Y2aAawPHu9JhC7m3Xh5ZjHQj6BDRvsQ5YJUfR
         OWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790878025; x=1791482825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7GPDCUkXzbddkBBz1dYgs3l5YKgPxDZJWy/V/n2BPFU=;
        b=N4WsYwlqZr6St8XHEiv4lIwf6GDhjS6fU/U7+NPGyEqAvkM/NHrHPjbQDOFHK54UqI
         duTnrtcpweuWJeKcljAC/7sBxmP9czGU8To8Xkq/Gu4CfKvPBjj8kJs4WkMnNV+8urJt
         nujk0ZhKO3Eiy5EpuU+v42XBdC48ZNyqBM7rEUSg3PobV9Y0b9g2fbg8TTFuykUomyev
         JbhtBhFQVqNLe5zlGTX6W/BA/XsxgcQUlV5HyEYRWWmFyC9WMp8QGJcj2UPb7EvMIwyo
         Ac79/4qptyNZt4WdrlAmwcnHEmmM5Gdzk0F0Z+ZddHAJS9FsI22aOe5XRshBuLNGqkG0
         DFXw==
X-Gm-Message-State: AFuF++kkWHpNl1BIqnr/Ho4RNMRK+tYGBNSSohPJ0oc/Hxtuvtxwoab8
	u4uMEDRy2L0bPiQfdLEjQALJpgPtdP3gQwoY/P3EuoXdVFP03RHTroA=
X-Gm-Gg: AYBFou1GpxXihIwRo0MWI2EENqGfpi5b8TIOZsUfRUsTNuIzosQ4UFA3L8TPUkO2hpR
	yGCL3AX/Ny/oFyQRZqNoVnJJrp0wfO/ew7A/9jN8hQnqkC9DI/WKjorszFxP3GGB/ojzw2LTdJA
	Tk74pKAr+BViC+HKFS+zrgAW5RLpuApJ4c+GstaRvZloDenmhlBLE6PMYO88/adtzFAhbnCo+Bv
	bS/efdFfpau00wRGCI8MXcJc5aM5DF72v02PIdXPQxT/2gOtxrK0pZgSx1nfIT6W6Eo/e+3TmnT
	4Q/vpG5tNrY2DUXpnc8FBWxOWU5537Tvb50a5wtfEAyMPGZrIMgK31KpSkudquXjSxpnvxKI5wh
	moLUHc+9D5Og9I1oHqnV8IHmPlb18lYr18WHzDjdex4hsUW2VkdzKg2lDHu3QQCysZNDTKNR4WW
	tZiWTVjBuOrfFw2OEsTyfJqxtYbIk/O11ddk6siajxCrK+GdshiSgpMbXMzr8vdj3R/c6BYKJmr
	ICUkRUrDz/0/E8kUln86nSKs3fF/X397iilvtqKPcZ0Kk8hKDy9TknrlwlzyVhYaL1nhNtKk3ME
	nXDEDV6sUEvSZZk3jgc0zT3DMDr1
X-Received: by 2002:a05:622a:181b:b0:531:85a:25db with SMTP id d75a77b69052e-533832a853cmr71428341cf.11.1790878025154;
        Thu, 01 Oct 2026 11:07:05 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398a5c3fbsm4310221cf.8.2026.10.01.11.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 11:07:03 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Benoit Parrot <bparrot@ti.com>,
	Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH v4] media: ti: cal: drain WDMA IRQ before freeing contexts
Date: Thu,  1 Oct 2026 14:07:02 -0400
Message-ID: <ea39fac2402d401d452fe191ac6f9cc1e9e9dfce.1790877910.git.mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925191949.3147558-1-mhun512@gmail.com>
References: <20260925191949.3147558-1-mhun512@gmail.com>
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
Changes in v4:
- Rebase onto the latest media-committers next branch.
- Rewrap devm_request_irq() to stay within 80 columns; no functional changes.
- Compile-test the CAL driver with x86_64 COMPILE_TEST and W=1.

Changes in v3:
- Resend the unchanged patch with intact diff headers.

Changes in v2:
- Rebuilt the mail-ready message; no code changes.

 drivers/media/platform/ti/cal/cal-video.c |  2 +-
 drivers/media/platform/ti/cal/cal.c       | 13 ++++++++-----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index 1990cab77344..fdf0b2f2a310 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -1051,7 +1051,7 @@ void cal_ctx_v4l2_unregister(struct cal_ctx *ctx)
 	ctx_dbg(1, ctx, "unregistering %s\n",
 		video_device_node_name(&ctx->vdev));
 
-	video_unregister_device(&ctx->vdev);
+	vb2_video_unregister_device(&ctx->vdev);
 }
 
 int cal_ctx_v4l2_init(struct cal_ctx *ctx)
diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index 5c82378d1eee..0340e19fe8cb 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -1145,7 +1145,6 @@ static int cal_probe(struct platform_device *pdev)
 	bool connected = false;
 	unsigned int i;
 	int ret;
-	int irq;
 
 	cal = devm_kzalloc(&pdev->dev, sizeof(*cal), GFP_KERNEL);
 	if (!cal)
@@ -1180,10 +1179,10 @@ static int cal_probe(struct platform_device *pdev)
 	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
 		cal->res->name, &cal->res->start, &cal->res->end);
 
-	irq = platform_get_irq(pdev, 0);
-	cal_dbg(1, cal, "got irq# %d\n", irq);
-	ret = devm_request_irq(&pdev->dev, irq, cal_irq, 0, CAL_MODULE_NAME,
-			       cal);
+	cal->irq = platform_get_irq(pdev, 0);
+	cal_dbg(1, cal, "got irq# %d\n", cal->irq);
+	ret = devm_request_irq(&pdev->dev, cal->irq, cal_irq, 0,
+			       CAL_MODULE_NAME, cal);
 	if (ret)
 		return ret;
 
@@ -1264,6 +1263,8 @@ static int cal_probe(struct platform_device *pdev)
 	return 0;
 
 error_context:
+	devm_free_irq(&pdev->dev, cal->irq, cal);
+
 	for (i = 0; i < cal->num_contexts; i++)
 		cal_ctx_destroy(cal->ctx[i]);
 
@@ -1294,6 +1295,8 @@ static void cal_remove(struct platform_device *pdev)
 	for (i = 0; i < cal->data->num_csi2_phy; i++)
 		cal_camerarx_disable(cal->phy[i]);
 
+	devm_free_irq(&pdev->dev, cal->irq, cal);
+
 	for (i = 0; i < cal->num_contexts; i++)
 		cal_ctx_destroy(cal->ctx[i]);
 

base-commit: 4a069a763e8a86821edac4159f7c59a20015631b
-- 
2.53.0

