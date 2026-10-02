Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848834E36F8
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 15:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954958; cv=none; b=AeELaGZ6VXIWSYp7NP3pbbqZZMelbxyjmUyYaOE7kqhjSOjjdtgcP8oS5nZhxKF2PRwkhQ9+JCoLV6NZ0/rJyKJKkEa6W7qXxOduD4UB5iL4zv8oNLZtUmhEgoEJPahIBuvKAdP1OwcQhO69uSyXK8qbRnV8rNXwmKsTleW3vH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954958; c=relaxed/simple;
	bh=EUw1WzOuX4c74KGVkPvPqLB7KZE53M79YcIkko+a2pY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NuTg0p1JOURYeuN383UQOgiPQRG4MfJ4UfRM9gxQcQSiLsfOPCuTlEpxaaJdqtohh25CfH0/DKKAH39lQD0J+Oil+PPGvxYy5kCAJCMnvOqcykJ6m2qQAYVG+TAgvUz8FmBAZPAjdSEkM16+WSPYdCnIjwoPRWAKv/9qbPLgxhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Km3ono8o; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Km3ono8o"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba379d8804so3805534e87.3
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 08:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790954954; x=1791559754; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C3lpUuIJkpMbj+ceGO26hsI5ydaqDv+ysVk3F0/il0Q=;
        b=Km3ono8o4sPqtPbDnAtHHGi/YouvAPf/jegrKNL0ZFz5ZQqgUXRJSHtlq5HtBr9HTu
         UpKeMlRxqw0AkXbcJdvkqqXP+CADmvPc9ngvsCfBTLW94O8So6W8BC84eqLeqqNxHWxu
         8SgSQSDv11QyVpju+zV4Kpcrv0/aYNTlxfqY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954954; x=1791559754;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C3lpUuIJkpMbj+ceGO26hsI5ydaqDv+ysVk3F0/il0Q=;
        b=abw0EAOxUhuvAhyNjUqI2XtTfW9MZuaG32cyetahVPNaLbEfxYfBZmRbCpsG0k6mXg
         fBxTr7oKL+Dza0qATjr8Vm8Ph54mb7R/Sb4eucmy2HNe+XXflJauuUZtefTb3Tmq5haS
         n5rOfJKLnJxcIL4V7LU8MKCBQ1bYXpjtDxLBz2sUa6Ww0VVgqK51olHi5joNtyCrs5T3
         HXshA//qnj0HtH3oHCFYqdW9oy2uivJ1zw2MhXb4uAVRYjxd9QkGf9zoXSPWCcRDHU4r
         M3SNx3snhZaRHNZpduNg8NxJjPa05LpEFtu5XDV0imMuzofPCfjPZfLMBAOtcZKSi2jI
         aL3w==
X-Gm-Message-State: AFq9FYImiqdHC46pe7ShK1IWsSvnysmcXgagJvtUtd/Szt78/ZAprM4Y
	2LmlCL5gKRzXNadbAidfz2MyRGvPPTCA3hzWUzQJ+padAp1sTPSeamr9YXvqQfQROg==
X-Gm-Gg: AYBFou3DBUjf4rmbokyLr+To5H4/ARe4Nhz4cSB+jHG71hRKQ/aCic2GETRaypJolky
	O2CuW4F0up7sBWHbkHnfftGKEIlpMeCz7dQfKTnLiK9x5wQTUsPhBMliTC0zrKOPKKiGaVt1XP5
	hxgMXOSL6n7pBA586QeSG2h3NVv4s79DGcS9U9VXcZ9vC/+Jg64etvIPpXcVyu8cQXB3gV6pj8e
	5vjAUzK9brSBXadRCCID5WqRq2XdCROY6odpejQQha7rrteZ5SpGVU3/r6vzBXAFrcEa5XbZbIG
	NqRbmcOULDSZSSU0Wn8pdZxHrZ8QqOlXk3m+LjSr+6hu/ElBeIMIxqApBoERiflJqIYbiup6yFZ
	jwWtRCjG6x641V8hSu7KPtMbgKjQ5uxv9qm2YBlRAwTib7Us6t0TghCRcUfpNNQ2zx6nHOeb8pl
	PfbCtCaQZL4K87t7rSrOENCIeNJUPF2YBdm3wilAH2NrArlHlWfs/uVMtBlelEyEKnDIpiZ8MEt
	8nnSi2ePGIQOq9qSu9Wy5NJwTO8wsDpLuLSyz9SCPIlwfj8tC5Aovk=
X-Received: by 2002:a05:6512:3052:b0:5b8:f533:d439 with SMTP id 2adb3069b0e04-5bb9bb1aca7mr941379e87.38.1790954954375;
        Fri, 02 Oct 2026 08:29:14 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c718f62sm835544e87.12.2026.10.02.08.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:29:13 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: uvcvideo: Automate quirk sorting
Date: Fri, 02 Oct 2026 15:29:04 +0000
Message-Id: <20261002-uvc-sorted-v1-0-65f52e4d7e16@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMDNv2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwMj3dKyZN3i/KKS1BRdy6RU01TjVDMD0zQTJaCGgqLUtMwKsGHRsbW
 1AIrn/MFcAAAA
X-Change-ID: 20261002-uvc-sorted-9be5e3e605f4
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

As the number of quirks grows it becomes more complicated to keep them
sorted.

Lets rely on automation to check that all the quirks are where they are
supposed to be, so we can focus on reviewing the more fun code.

We use this opportunity to modernize a bit the quirks.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (3):
      media: uvcvideo: Use USB_DEVICE_AND_INTERFACE_INFO macro
      media: uvcvideo: Convert one quirk to a per_device check
      media: uvcvideo: Sort all the uvc_ids quirks

 drivers/media/usb/uvc/uvc_driver.c | 730 ++++++-------------------------------
 drivers/media/usb/uvc/uvc_status.c |   7 +-
 2 files changed, 122 insertions(+), 615 deletions(-)
---
base-commit: 79dd149ff9244884f7c62356a9e499a934ed6071
change-id: 20261002-uvc-sorted-9be5e3e605f4

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

