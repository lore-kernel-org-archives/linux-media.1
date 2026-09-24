Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FD53B6354
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 21:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286565; cv=pass; b=L47nAwtM5LsOw99lNa2lWmGwL9PicXx3YfoksgXNHMF6BCdWr9nvB8oKJHM6EinOLAEYg3vNs+LV8izrq4VDHpdQUYcZFmpzYgAqh8dOsL21+T9T2P+Qlc2Z5b7H8GPruzoNlGdovdljrskgJjsRscsqEQPfmZkIX9RU3oEvFpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286565; c=relaxed/simple;
	bh=IOZdo6RY6JZCS/RhKzdbZOS/gJ453N8ilVos30rrtrk=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qNw8BzcYcptPUbVHhGPs38ZUxCX0+2QJjmr4Qr3HSgNOKqZf+K2WsAeR1Tg/9HmimlSyfzOzfx4MGuybzMuRYDrtgf9Wvbco5p5K2drEyz682YO1UJa8F6sw8oG4crplOE07BXgSlqeVLUSGzZGLm/sY3KjDFb4emnvFdIDKZOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/5S7HnL; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/5S7HnL"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c294ad260fdso49596866b.1
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 14:49:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790286562; cv=none;
        d=google.com; s=arc-20260327;
        b=sXjwe0xyi6MPti2HnpVDMneVMaZcuSEkiCoKUpTcEBa1KpgWhyJkMBMExkRwKpDowk
         1sbV8/4Aj/PFzRAL8n+TTQblBArHbiNPw6hLRNAG0anC07Dh0STulUKT5sCAbh8TKeTm
         weZqv4fgwzX6C0V4UvyAVjWP2FsfCk3WseYyJUnwgxJyCFyr5zMp8EzgE/I7pwHMY6BE
         0Ulkf01NK7e/ueN60o3J8MppXtR8mDEcpVZhlQ4GECB0scXXTS4RRPhp6MC1QGCeIcXB
         0UZwsiKrS4YTywW6bIqy48WKHIIbkWVBgXgxH2MPuZTCQBFqyk7+BBAtkiflQPVGZpNJ
         yGig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=UiSS5MDz/yhz0gJroXWIYjWE1XbsEfZtw32iYL5QFY8=;
        fh=0fCEBodqASwA4PArUkN+XlNSCqtbEHEaS5RPyTW7vic=;
        b=ZriYa6lqJnG/+XN1m2zM+J13j8NnCdnuk+4Gugb+3bLtswpwoYjHl8wibGbGB9Gzzg
         PTUrhgPC6xqeE1VEi+dCfeCMxxB1NuiB0+jC/3020qVQSIcG+xmLTCLFEkV/N2QFNaIX
         +YHytTy7QCOmqpUUkFiMvk7FV/FVXgHm5WUc544VeCGEnPkz1frabQ9trPptNLAQQiqR
         lmO5cT0g0i//Vs+21zd6G2rpJShEhWDgt3mtnvUxvYiF/sXPMQqsmEeTtFf1/gY0L77i
         5ojqtiYc6v1PrQP7pu6TTbhvdAahC3b+gIouF79dYCosRH2peHVX/XJeYS/Z+yJMFnX6
         Q6cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286562; x=1790891362; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UiSS5MDz/yhz0gJroXWIYjWE1XbsEfZtw32iYL5QFY8=;
        b=J/5S7HnL4FWyRco7pkbziAehu6lP7fVmX6achpExkVa03QQ+skKvsjMBrp0V7pHeP6
         utJBdqGy2ckmgNdBOJAhXpK0TXYaPCdW1dUOvy70sQ3DLI6IP5JGaoTqvB0XsrvZG8MM
         L0Oaq1jWIHc9W3ClhKXPxoBGlW5HiL4aeUDBCOSwty8N1ZfdRvbgIIWY/znYNCUefNsq
         On4OFLC2Gurt9jvF7uikY7d3G7K5sAHxNlTNiz+fNE7nE05UfEzCBdRvUzXp4zrNw3U0
         uz//hFNZ7oqdV7ffJ/WOdt1U+Det2Rek60p03pI47jS2kKNX2A8pxndzABGO+PKcGtKO
         9K4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286562; x=1790891362;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UiSS5MDz/yhz0gJroXWIYjWE1XbsEfZtw32iYL5QFY8=;
        b=faB4d0iZouUwa8l52NLI+r59s3NfZNZwoM63YOhmcn7nhTHzaq3rocEfHbsuuHHY5Y
         uaneBA2qXlJRZq8cj9zbKusRJOXuqJCRr0tHeCx8TRhR5r7hK1gP5ZZ8MCwV/FFY5ZGk
         th5BMgqCoQ5fDxpSt2s4UIKf624C85mjTBwL5bzYNyymd5qeZjSWNkuFEpqgRRtqXbW6
         v2IgJV0G84FHm4K7V4G+KXvryzB9VfDDD3Z1mfEJOQU8Rf8eIuz8gDTPF2xuRc5UxNVx
         ECiPbqOF2t+c+IMW1VlxgkqGCTQ/rBJdRdwHTYVZy04m37L61VUQKGQaOzMN+azNh4yX
         RLHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHMtDDLw8Cwr/W+VOrLcZfer4XhJ8/634EfGQBAfkCUBzOJxoG5heJmu3u1i2WjoY2GQItqFTeey6e+A==@vger.kernel.org
X-Gm-Message-State: AFuF++nU2M6QQ60Pm/LJ6Aw7Lq1ZS1P25cKZT10YjqimSfW1cBp+Od7x
	DlydouUZ1dhit5/BrWpdrqlUyN7/EeuvZ60NPU+G9CNjEkF8RlLeXEJaJg9mAEYei91BzsJflMd
	GXC+pydV1lCcar4U5IHFNNoGXsb3LSg==
X-Gm-Gg: AYBFou3zBJYf7j6+4IJtehfTnKY9GRDpIio5wEogcDR4QlSqdhjnWgqrNoSJTiEYw6/
	MagCWlGX/vqzzupw5Ygl2+WKOryDgImwcHHyV2vVKbLyL2CsxHsEZ5REf2bVgNEjCkWld+miAhe
	brc+ZuhKR1uiQsFkQ7T+aDDIm+NUu8ngH1t95Oubh77gtlXr2yld3/UQKw8wPxy5Efh4GyLlKJd
	gQ3IYaTQU+GueUwY3BrtJEnRIro3t+Q13w6yGgBQxEUJ2l64XYe4/RPwuq8TdBe4oxmldBDo/52
	pC1PoJ7BIP57RujUOgM0Papfe5m/B2aBsYzM3fEllbiK2oFkgyhZkqbAZeYSdGFCXyh40qaza0n
	/viTI0eGWvVUKbMBQ5xtsWXuuxeveA6mPjNsTE03qY0iwtikGdXwTlUKuBOkA7JLL
X-Received: by 2002:a17:907:86a3:b0:c25:5a26:3787 with SMTP id
 a640c23a62f3a-c2ac2240137mr324783166b.8.1790286562321; Thu, 24 Sep 2026
 14:49:22 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 16:49:21 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 16:49:21 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAGEsz8HmUoQq7XLr5ZN7diWt-sWYoUwYd400vpq5jYEDEB7_vQ@mail.gmail.com>
References: <CAGEsz8HmUoQq7XLr5ZN7diWt-sWYoUwYd400vpq5jYEDEB7_vQ@mail.gmail.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 24 Sep 2026 16:49:21 -0500
X-Gm-Features: AclHuK-DvetQh1gHZkZvAtF-Wo01E6S6SV8NInGxHeSu-8odoao-bwAIz_ybmN8
Message-ID: <CAGEsz8HrSazyf=aoRkAD49S15fKwYdswFBXbHq=+MCVN4PTg1Q@mail.gmail.com>
Subject: [PATCH v2 1/2] media: amphion: drain message work before releasing
 core state
To: Ming Qian <ming.qian@nxp.com>, Ming Qian <ming.qian@oss.nxp.com>, 
	Zhou Peng <eagle.zhou@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

vpu_core_unregister() frees core->msg_buffer before cancelling the message
workers, although core->msg_fifo still uses the buffer as its backing
storage. A queued worker can read it after it has been freed.

Drain the core and instance message work first, then release core->vpu
and the FIFO buffer. This follows the ordering in vpu_core_suspend().

Fixes: 9f599f351e86 ("media: amphion: add vpu core driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/amphion/vpu_core.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_core.c
b/drivers/media/platform/amphion/vpu_core.c
index 85cc4a14f8ed..a0c58ec97a42 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -299,22 +299,23 @@ static void vpu_core_put_vpu(struct vpu_core *core)
 	core->vpu->put_vpu(core->vpu);
 }

+static void vpu_core_cancel_work(struct vpu_core *core);
+
 static int vpu_core_unregister(struct device *dev, struct vpu_core *core)
 {
 	list_del_init(&core->list);

-	vpu_core_put_vpu(core);
-	core->vpu = NULL;
-	kfree(core->msg_buffer);
-	core->msg_buffer = NULL;
-
 	if (core->workqueue) {
-		cancel_work_sync(&core->msg_work);
-		cancel_delayed_work_sync(&core->msg_delayed_work);
+		vpu_core_cancel_work(core);
 		destroy_workqueue(core->workqueue);
 		core->workqueue = NULL;
 	}

+	vpu_core_put_vpu(core);
+	core->vpu = NULL;
+	kfree(core->msg_buffer);
+	core->msg_buffer = NULL;
+
 	return 0;
 }

-- 
2.53.0



On Thu, 24 Sep 2026 14:49:08 -0700, Myeonghun Pak <mhun512@gmail.com> wrote:
> vpu_core_unregister() releases the message FIFO buffer and VPU reference
> before draining queued message work. An open video instance can also keep
> a pointer to devm-allocated core state while sysfs unbind removes the core
> or its parent.
>
> The first patch drains message work before releasing core state. The
> second prevents manual unbind on both platform drivers and warns if core
> removal encounters a live instance.
>
> Changes in v2:
> - Move vpu_core_put_vpu() after the work drain.
> - Keep runtime PM and mailbox teardown unchanged.
> - Address sysfs unbind in a separate patch.
>
> Myeonghun Pak (2):
>   media: amphion: drain message work before releasing core state
>   media: amphion: prevent unbind while video instances are open
>
>  drivers/media/platform/amphion/vpu_core.c | 18 +++++++++++-------
>  drivers/media/platform/amphion/vpu_drv.c  |  1 +
>  2 files changed, 12 insertions(+), 7 deletions(-)
>
> --
> 2.53.0
