Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201926;
	b=FwU5BGwe/gSAgdB2bd0u90dVID0/j6xJSc45zQL0P1e7CqtGo0qXjsQrEo5M/JSQ9WQD
	 Yx49Gz1pFq8Mx2nNpa9/F36wtjnbYTTjLS5kXCKd4pw2u8gZ+z/vnqR3QO35axWvHTHFl
	 ipbVDkAavLJqzcM9F+P7H1CnwdDBwNTXbEHx/BpuMTW+qFadBl6NlW96e95JQPYCM4vf5
	 wTsCbG9EliCgpKcMqvTGGhwMwPmW15q7cGRzdkUfKD1uAKJcEf5w1jGAEFbJ8jJoltETZ
	 aViVGUNZnpk6COWnlNVIoUdbqULZFZq1ILcp8KEqiY/PXx0ANg91eBsrdqbqY51JxaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=wJ2MFNjJGpCtraZaXd4y2rNCbQBYVE4qiCL2CMipR68=;
	b=vfZ1PQx7GargKuvcukKC7iVrKiFE1BF4mJiOXqhJbQnG8FLM5dW8fhDu2DL23DBFGymj
	 tGUHtzlefFXPXhvLrFqiSQwqOtqd1h9eOIrbBrEZROx7zRQLtRAXtZ+L5xZ2fsPmQmVK0
	 NluSjYo7A60mEWIHTFBiNKlKA8iYKaijDZO+oPyrLD7nHevgiZqeMScphHduNsZdLaP+A
	 y5hd8XhxNAq55w9Zo/szPBARKwy4cwnI9EZb/ejaOE/g/HYhY9hQCftAwUx71jVqfFts7
	 KL2oph+StTm3nL/Cd+dKTD+GJYrWE3S3ql5U3ZY6UqpcjzCbZUhCBGUxXI/vKF9U5dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hKEP/gEK";
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F47D606A31D
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F47D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hKEP/gEK
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e7e742a2c7so8102575ad.0
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793201925; x=1793806725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wJ2MFNjJGpCtraZaXd4y2rNCbQBYVE4qiCL2CMipR68=;
        b=hKEP/gEKUYLr8D7nq2JxSF6ZTqSPzguAvT4YWaVchly4Ievp+dObsDrEH0nWF4DaUk
         6zJebS830JikDn6VVPmkdth6mGXrfFfoF4g8nf42I5QWMiOMWXlhjyRNwct8NFy79J3z
         WdH4E6Mb6to/wtT6VetzOIgxinNmqcdgkYRbdZZkAXhSDRBeKBNYWMLqvFKNP4ncB/0M
         T0QjsPTiii0fzma6/ddNuzqD31lei0VvoR1vgu3q9AAKJ2guWeGIFMVQoy5xPb2WqAqH
         MU7raSecMWNESwg4yCqKobFhraDCOmYVS4c9HoxxUKH2JbolUX1buKVz016g7ffYW7tI
         E08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201925; x=1793806725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJ2MFNjJGpCtraZaXd4y2rNCbQBYVE4qiCL2CMipR68=;
        b=dJoJTng0TqnZadN05l+vswbEFPh+VpLDvJdIgvQiARYzj6PwMi2AjSamofRl6wjK29
         0u6JbjThNFrkG6J7vnQSxYdqUzd7F1ibticSEGCm1s6RbEbFCx87w3L4b0a8ZnNnzo49
         GDr5Fm4E8K/Me712QtekK4D9gBpJIZQkFxcLzRwOzmULQUsipyObYcLH0UFNqtHM4zej
         rfFF5Ymiw8fPlAIJNMzbXRMGCjp8DuWj3oMWZXP8YG/KEU8+OItYL/GQ8qCmqVuZDITJ
         mr3rlzEx/9Fk1kVamGAZbSJD+N0RwikJEDSdXEe7+9Z6buXuq3CVNXIhYsCkN5dl3eN3
         jn3g==
X-Gm-Message-State: AFq9FYJGUNtXh0rZVD09gHPfShVwWY8jR3W0diNdyfbq2fnmt6goDguI
	fJ2KKsKtRjUyGePyKOMBF9LT+UWBS75e/FPzio2Erc0BiAL6v8QI4s0Z
X-Gm-Gg: AYBFou2FDYQoPIWd83ptik2XyiVZN37vihGv0xCvTbE5kbOD27udYWTdqttBLi1d1R2
	szcuMbUylCQcjhpw6NRbhd55HYzSKBY0f5G2aMSV6Yl93UzQq0FF6HAvMdRAM1jqwbKFv6GQzl7
	QRuZr6eFfGqBXfVP/B6hULmKhIjhWZqMjEiAqJzsAG/E1Kw6Kie8r7Vmqf6JYu0pl1hu2kxyit0
	Y8G3X6axxJ/Sg8gsyJwxXZKMsAJB78nMt0S2wSDN6BoRWl3/O4jNh+l7hj36joptBWtDqnIWXcq
	Vppx3AtN3rhD1nDmY+nZjWxVUSwKEl2SJH1bXl0tK+2oZSVqulyluQc1JD6VHh4VKh2KA5IMwrX
	wC5WTMhaBFWZdJwVLOQiwiwiVt2rAC39ejQt6BAD4kQ2EIGh/iDYTT8VTDW4tpgnMA22BP34DNZ
	hzs/KXWFD2aBz/kFeFjaI3aJ64QUk24D8xcCeKK1CAdu6aJtVUvQVD5MGHO2k5czqgcbx9E2iFS
	Ae4WM5jQS8+ZdfI6OUXDxDTJbWu7YGWJ24eWlQfqIyajocdwY6/IO0RhON5ySzJ9ck+QYEbgyrB
	lU2QQkGmKSHffJqx14RsyHbX+5Lrv5Rai0p/MCpblHd1zPiH7UJU908/R/gTcPVpjbHqqeynjGI
	Hqg==
X-Received: by 2002:a17:903:3546:b0:2e8:5431:d18c with SMTP id d9443c01a7336-2eb075505demr12002865ad.40.1793201925375;
        Wed, 28 Oct 2026 08:38:45 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c91e1bsm23407625ad.59.2026.10.28.08.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:38:44 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2] media: pxa_camera: guard list_first_entry() against empty capture list in EOF bottom half
Date: Wed, 28 Oct 2026 23:38:33 +0800
Message-Id: <20261028153833.3204829-1-lixicaicai@gmail.com>
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
