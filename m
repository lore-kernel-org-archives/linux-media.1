Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71502DCF74
	for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 23:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783814385; cv=none; b=BSPLjvoppEd0MR5NMGcSksC49k1BchSuIRZd2n7AxqdifmDZWatAOWYIYDJjGlThG0JmcKUM5jvYkx1qJY75oqSuKXBPWb/gyKyIhQBAfAQaUYirvWjh8rAoBRz/wNrPB8m879dKKqh6Ek/q40WvuCaH1hh3fC71wC0XcRGVF7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783814385; c=relaxed/simple;
	bh=N0t5NA/8beISCQazAYKckeJ/1LUkC3t/EF8+WGe0V5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fGkPrKtqLRHi622909MEa7PR6ld9Qm0mAq8Hi0dkhshv+QE+2ZeFTgyYOhcR1UpoQDj33gINd6H1/JEA4Ti7UhbGk5g/oXs6GC0QArXm3AQIBjH25+SubSL8fGEGeDkiWJtzwWbJ8ohe8fkC+FwV5jsUSiXF0QmCPG15i3659Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDsKfOXL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDsKfOXL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b27c7451so37677885e9.0
        for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 16:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783814382; x=1784419182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=va3lbDOabJpTEp+PXcTh7ncglStTA4kjwteoex88828=;
        b=tDsKfOXL+Nxo6Gdtq5T04dM+9ZSHWLonIJUPH0gu/hUJ9KzyaYqL9sKsAswk6CGM8C
         PjWyjOV2RNCJBd8XjIvtadLVrRikRxWYYV5jO1YJPxjv7mSgMms5PW0mBz4zYdIZUcZF
         BSGA+PT8TRyU5OmNVvMY+9bCbZAjiMWwDcIeJYWSw62JFJAW3A8uJ6IQvl7UaAWUlGpW
         ja7JfkQuLay4nFqvjM121NZayr0Gx1/dGWTRxVa1vUQtN1o8m69pMNlHGIY4GFG4EhyW
         F8W/Jn/SnbpTIRcXtTJqrWh5RxFykSiEqC+tOExoDB/9t4Wzn7NIdS7wku/XGYDTcEth
         Mu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783814382; x=1784419182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=va3lbDOabJpTEp+PXcTh7ncglStTA4kjwteoex88828=;
        b=F4P0alFkCYSn6iHpfE9bsJNeXtWqod508YQnNB16p2/LHn+1fFEUh10OjJhH2vc4W9
         dNtQXBcaxBJUyaZPysK9Y++bHB+cDU72e1a/U12ZpCbAY0sU3fjcl5XT9QruZzmgTfQl
         UQCIvOfmDwk5zLeOq5JH6EUfQLow9qFEYO8BcfiuTDcI7v+8qecdKvMKpyZVVQ+tQp/7
         GWAB5jqWne4my0W7OuZFDpa0y1ddZ9WmYBZ6hYNG7Qo9SxHcxvdmwaajc/4AIoGC1mGY
         xhMTglY4wITn2qVas/MHUHNzZ4zBWjYdY/gWZDk4YhISBpG+iMok6ojYprGYlBKyOwwX
         41Kw==
X-Forwarded-Encrypted: i=1; AHgh+RoU0iOaOrea+5LP38KYIWIevHfXzAPhHuv38yEMIdfaUdNE06+UyaeFQk9r/yW1ucwZisIP0q/9dDPcXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1714Ewj6xMotcLDoNIBi1xRocW2BHAeeXz3pECIb8r3ZWROW1
	BnnMhKLHIUX0+SRoZlTqGST529bAyNB97SCXDyQKyiymXjf/wCpm7UPs
X-Gm-Gg: AfdE7cm3aFrI5W1l3PmFN8XFY7Vsxux5BpZS8QJEwXquLj4Y1yH/0jffKYu9g0PBqCI
	YmC9azFrFrTSEL5bcS2NTss/JaUUM7vQZMYPxeopUfLZZm6sOpk6ts3xDC5Fm6UDENqLXiEMhGW
	UzSCOGl+w/S6xGeb7pDoC9LJJHGQ0YamMh60ptGEYe0xWqQ7LEuyfmpSqVEalwy7IW0atp1zb+5
	F9BguY8rDOwHVlH/YVglgWqIIjAC2Exz2c8eWvIw2DTw+sy4h3ZuaK/cLrey0/m52nr9PYRGhmX
	4hi3DO1aRTAHqdDC8iEUIvSMjbbHDADK9SPAbKnVIxcp0YSZKZ9kaRe/9LSql4CRJCFJNRIaL4l
	nVGU8wj9AKgUCQ/C/lI6DzmGkk503mBfZm60/AxNOCuF/xM1GEfBqFYBKUmD7Xl+JYC3kFFhJvA
	nTuMB/lXwtEfum341TTX7FdLk4JYVSeFLgcMVwSpBUcPMi7K21PD0imnrhOp3dVoETHyWTP3M6V
	HVTATYoH5fJ1Jo=
X-Received: by 2002:a05:600c:3b0e:b0:493:f806:fc4d with SMTP id 5b1f17b1804b1-493f88268e9mr35215685e9.0.1783814382081;
        Sat, 11 Jul 2026 16:59:42 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb742a49sm234604115e9.12.2026.07.11.16.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 16:59:41 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: bin.du@amd.com,
	pratap.nirujogi@amd.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: sultan@kerneltoast.com,
	Svetoslav.Stoilov@amd.com,
	superm1@kernel.org,
	arnd@arndb.de,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] media: platform: amd: fix unmet dependency for VIDEO_V4L2_SUBDEV_API
Date: Sun, 12 Jul 2026 00:59:39 +0100
Message-ID: <20260711235939.2312639-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, VIDEO_AMD_ISP4_CAPTURE selects VIDEO_V4L2_SUBDEV_API without
ensuring MEDIA_CONTROLLER is enabled, causing an unmet dependency:

WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
  Depends on [n]: MEDIA_SUPPORT [=m] && VIDEO_DEV [=m] && MEDIA_CONTROLLER [=n]
  Selected by [m]:
  - VIDEO_AMD_ISP4_CAPTURE [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && DRM_AMDGPU [=m] && DRM_AMD_ISP [=y] && HAS_DMA [=y] && VIDEO_DEV [=m]

Many other options in this subsystem select MEDIA_CONTROLLER, let's do the
same here.

This unmet dependency bug was detected by kconfirm, a static analysis tool
for Kconfig.

Fixes: 9a54c285630c ("media: platform: amd: Introduce amd isp4 capture driver")
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/media/platform/amd/isp4/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/amd/isp4/Kconfig b/drivers/media/platform/amd/isp4/Kconfig
index 9d1927af1cb8..77b61fae82ba 100644
--- a/drivers/media/platform/amd/isp4/Kconfig
+++ b/drivers/media/platform/amd/isp4/Kconfig
@@ -5,6 +5,7 @@ config VIDEO_AMD_ISP4_CAPTURE
 	depends on DRM_AMDGPU && DRM_AMD_ISP
 	depends on HAS_DMA
 	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
 	select VIDEOBUF2_CORE
 	select VIDEOBUF2_MEMOPS
 	select VIDEOBUF2_V4L2
-- 
2.54.0

