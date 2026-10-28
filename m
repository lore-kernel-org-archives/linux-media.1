Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793161334;
	b=KLUPtCX+fiE6Dw8r5IDxbFwBiAHD4JJp/LF3HwYKNrxQKry5m19hH2rjMtQyH4CAud5g
	 Zw1ygmJq5n6stJn0THmaog7HrFL+GnZo6btwAhp3FlKBFZ+1M2d3sQ+O1wHw0inP93QeT
	 v4V/6Ulh/QEQPboVw9oW0k8dqWr9i8zvIar0GMBbzLKDcDtX5mfaD/CfL5Ss6bKs5mm5J
	 lXrKQoiqTeDTzrHvu1VkGYbB+WMf52zXIOd6ZN76rq/mCFakLQLjkzf004imBXZ4fSYg9
	 mW7t9R/Ulc0Q7Ah4FsA//tk5I6BQdE8mzBdP0peker4hWTomAm4KhzVcFGZ/Yt72EnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793161334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=wJ2MFNjJGpCtraZaXd4y2rNCbQBYVE4qiCL2CMipR68=;
	b=okC2fxf1NOk21wPSpxPpCm+7rBydH0my83wWS0q3u69G43GzVzItFFOy18SgPe7d45Fj
	 yFKNDmSiq3IT2ITCIkFDwhWFdkW0s/FnG4HQYW0TkqnP8/rKZsHp1OnV4onvrWhPOknPz
	 ZiG8da76/Lit2ILtKNasFbuKLXCBrT11Pg3ZwCUXYYFz68/OZ2dxKStp2HtLhqcYYOvqV
	 Z40zRL9C76EqNttbtLD5v7iRa5jqYWC5PPrKCoBNYXB0NvVqM2IHNjBDv4/+eFloSggO/
	 Dg/mZS/4EwdPVRp06w79nXCGUE6M6nNX2x2kFQx/g1zDt27KOagzLXsVjMIMNdUpT8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mF4FTmj3;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01164606A31D
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 04:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01164606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mF4FTmj3
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so350415a91.1
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 21:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161333; x=1793766133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wJ2MFNjJGpCtraZaXd4y2rNCbQBYVE4qiCL2CMipR68=;
        b=mF4FTmj38pAGHXadnKjtk9G326O/vs00fuTyYPRkiwuzvMOUb9mEajsIYRQ4h9VOgH
         hKMqNcKrw1cRwGFQr7ZeXwiMNXnDUr4cadQNiTXxwr8tmXDWR/Oea125qaTgLiahyhxp
         M/Zhb1amw4k38WHgDTg66sl58Rxf32g+qYPTOw/LT/jY0CZo79TytuB+WkUVtAOGvvSo
         PsA/tADE3hvQLwZdtjcH24fQD4ygtJ8f0h3Q77EyTsNV3ffdXMSdtm/QCjcq4Tp6Muo+
         iCB7O0RrGkGQRaKmuy0MsjANbRUsuRCxWbsemvl0m7PM9CtOcZgE24zTX5pt13qX7AKS
         XkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161333; x=1793766133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJ2MFNjJGpCtraZaXd4y2rNCbQBYVE4qiCL2CMipR68=;
        b=Tt58u5EICtW3L5/aPRzIZSSnggLzq6sMahaTEEMg6/sE3XlQ5eS/fBWAoLfBy2xlnw
         2GO9wr/l58NzBCyv+S3xJwo/s8L3Jy1JQFxxvyRNrVYJGaC0aDLF2uAPjvJhF1J+f52g
         P+kzSQBqjmv6W1tq8KVgTF9Uq8OtTmVFaA2RB0nWSqcd9zb90cW94dBGIVcW55FYqOEE
         LJkQDsXEBAlRby8w/0auH0A4nzqwAKFHlRhhl2/fQzdVHnPc+RYs+9SXI/0Z5D9DNbXk
         IOKyMiCebP/pmHfY/MqWzQIlQX3GXcM2r3hg4emkxxYzcaFXUOL5G3Ewcr0sLnt4DF8O
         jt6A==
X-Gm-Message-State: AFq9FYKgJWW7rb14loPKYTXPUXIaXhUtWaAx7ES0dpXT+Q6Z3ifyUk7q
	+31qTp5ZVWzbRDTQbHDtdPpWTOj59IJlyEY7kUROj63/0J8uf2pqkAEc
X-Gm-Gg: AYBFou2Loz6y7GQDROJz9OwBnwai/7OpWL6Sn00qhXF/6Dzx/3mqmhhDqUIKUA69z9T
	8iEmiFm370y1Jc0YKVZSj20WdiXtJzt8Ndovn3znnBFmjRR+I69QEgW7uue5sXeVbb5QEidRb01
	MPJ+EW5RjvEEmAVYk4Jlz1OGtuTQGqFd9+ho+TMalifKpT99cDigJPf1IrRec/eLBvTD4njSIl1
	fHmkj2cGY7QCxqWIUNfU7oWWNtg/APJ/i4lSV2soVC9BdUj5qmH/KWbdvCQnmdolIb+WgMGZN4Z
	Arx5R1k5hzXX56cWpsQN0FQJZSMmfxTq7M57SGccUNIPCxBJqa6FuG4KNpT26Fswx7+Vudk/EPo
	UOj9Y939t21cm/SF/Nq6+70mGfU40scHiKBupsbmnXf1/CVei2rJdwdWVTleM2FTZhiGBtVrKIR
	Lnibt3uWJWv9IZLgllhxZDx/pOByH4KlK2rJKTTQFot7iPVxfFnWJdgyQul0VDYIvB9MmahccH4
	5jdxdgaCwJ+LX/eK3TL0mEYIKQ2LXbz0zusRTQuD+h/DSTTYMxnTmJemvzz0iWl2tvCrhYVyPlT
	b/MsvWmsnT8mwJexRMct+IJ9QqsABdii7fC3wbyoYyP5zM9m4fulP8ZaRBsh1eJMzewdhA==
X-Received: by 2002:a17:90b:3e87:b0:3ac:a5ff:2cc3 with SMTP id 98e67ed59e1d1-3ae57e2f423mr934737a91.8.1793161332890;
        Tue, 27 Oct 2026 21:22:12 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6cdf649sm16060395ad.72.2026.10.27.21.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:22:12 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2] media: pxa_camera: guard list_first_entry() against empty capture list in EOF bottom half
Date: Wed, 28 Oct 2026 12:21:36 +0800
Message-Id: <20261028042136.1622059-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Haoran <haoranwangsec@gmail.com>

list_first_entry() does not return NULL on an empty list; it returns a
bogus pointer computed by container_of() from the list head.
pxa_camera_eof_bh_work() calls list_first_entry() on &pcdev->capture
without checking list_empty() first. The capture list can become empty
between the EOF interrupt and the execution of the queued bottom-half
work: pxa_camera_irq() queues eof_bh_work on system_bh_wq on every
end-of-frame interrupt, and if the DMA completion path runs first,
pxa_camera_wakeup() removes the last buffer from pcdev->capture (e.g.
with a single queued buffer) and stops the capture. The already-queued
bottom half then observes an empty list, obtains the bogus pointer,
stores it in pcdev->active, and unconditionally writes through it in
pxa_video_buf_set_actdma() (buf->active_dma = DMA_Y) before starting
the DMA channels on it, corrupting memory around pcdev and likely
crashing the kernel. This was found by code audit; we do not have PXA
hardware to reproduce it.

The sibling function pxa_camera_wakeup(), which operates on the very
same list and sets the very same pcdev->active, already guards against
an empty list with list_empty() and pxa_camera_stop_capture(). Add the
same guard to pxa_camera_eof_bh_work() so both consumers of
pcdev->capture behave consistently.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Link: https://lore.kernel.org/r/20261023073437.1517305-1-lixicaicai@gmail.com
Reported-by: Li Ximo <lixicaicai@gmail.com>
Link: https://lore.kernel.org/r/20261023073437.1517305-1-lixicaicai@gmail.com
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v2: add Link: tag referencing the v1 submission as requested by the
media CI; no code change.

 drivers/media/platform/intel/pxa_camera.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index 2269d852a..73ce48650 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -1161,6 +1161,11 @@ static void pxa_camera_eof_bh_work(struct work_struct *t)
 	cifr = __raw_readl(pcdev->base + CIFR) | CIFR_RESET_F;
 	__raw_writel(cifr, pcdev->base + CIFR);
 
+	if (list_empty(&pcdev->capture)) {
+		pxa_camera_stop_capture(pcdev);
+		return;
+	}
+
 	pcdev->active = list_first_entry(&pcdev->capture,
 					 struct pxa_buffer, queue);
 	buf = pcdev->active;
-- 
2.30.2
