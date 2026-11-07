Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794048461;
	b=UIgRiCEz+p01sPdKvm6go3AwLD56UvtbBvI3aIglFVx+XhRxObkL3dXVqmceNx+/1q5j
	 dM18cm7lJFU2BCpGrL/apa5Shc9qb1ny66cHuLMTujioShvXzEt1nbuK0X5nszMCN3c1j
	 6KfV73bpwP/4/7wuW88iG5w0fgw3EXGWRt8XgqveJgv797mg3/46IxRE7d3ogHJlHhksS
	 bCxw6GUpslTYnjDKVkoy3t1qFzIFPyklD4St8l/YLvNl2bkCgARAUjaZW1ha9XJIfRFP1
	 GnWN8rW60dHRFP3tdroyb+9qKsI4VRIA1rX8KT0HQ0jzu2n46WRErV63C9WxRZPKoIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794048461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rW6VoKT52yP08kYUcZyVOPG+H41QN9/GqRijZgl3S1g=;
	b=yTZjmqJx8qxw8xj77KIi+IreJ6pYo4jlpPly0UvkW7bTzScunU36KFWaN4aURgtyaJYo
	 tWFtsqdacUXp8+EH4DNbpRMEVNr6L0ggR714ASGK1aK1gyt3YVVZqqGaOZknNyybtsKnk
	 hwbTAnBSeEVahV3y+mwdtymqTdVSFHKYoTVqrpMPR2643qEThcYzs+4eLWND81MmWWBXW
	 ArJAh+QTkmAGDFcNwTkTyiMflM2b5dtDHc9EppQn6dr64VkdENy5iUigf1BeOHvA5eGFE
	 X1jp4QTeQejpcelDeBKgwbjciu39SmkJsLbGZOIlFtH6iYwub/xpSH0TX6pD2QYFW0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fcSTe+/q";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF57606A337
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 10:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EF57606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fcSTe+/q
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so18666655e9.3
        for <linux-media@vger.kernel.org>; Sat, 07 Nov 2026 02:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794048460; x=1794653260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rW6VoKT52yP08kYUcZyVOPG+H41QN9/GqRijZgl3S1g=;
        b=fcSTe+/qtfweQdCUA56HDS2ncQq0PlxOZREAztU9rO5E5Lvspxw8RtA063mujF0yPY
         8PTkH/iW1nLmFQbFZC5JzS2IInAuT1A3pp19JbsNzNekKScf1Lepnm9P9ZcNVw0pHNmA
         B2We6JOQsPZObdhzUYl57if8AVA5gtJLouq4raq/qZc15h5W0dYYgPyKB6o/8B5kDt5N
         e9zsDh8xA9OzPtkrxXlr8EY1EqlKzU2eX/6PXqbLaAya4333aiMbgzxgRYqKaZzX1ssm
         IlE7RBq4RBrQrVs0Ywcie0WuZ4wCmGZwz5luhjllXKVFHupuSgIwer+fG4KykYZ87Onv
         vRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794048460; x=1794653260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rW6VoKT52yP08kYUcZyVOPG+H41QN9/GqRijZgl3S1g=;
        b=dDI8kry5Qfe9BI6HhDAnYlGjS+i/8KEZpDw7xCrj9ShcnLLj1hRR7LPiVwd6KZ9s0b
         lGCVQk3raGgFO9ndtkBXzAP4NmQ3/cXdabY2FoG2CHzQ6+7viX0DnXzLKpJRzK36jfvo
         5Xl1i3AxxJk1WERBf7utbO7hKZ9YlDRDeKXJNFnwqF6NNzxEKMItANEsqAvysmsl0Nyk
         8BWe8MSP241z9MqEmili4Sr1qAlNh+6ncU19R4Gm39iYYz0weAuvypTXSwBszIgszCDU
         BS7uQmcFO5XyCof4h8vaITe1b1fLxRhVozw4//JxkJt6yU/pWBn+JdZtq0fdgdgM8qz4
         a02g==
X-Forwarded-Encrypted: i=1; AKwUvByUu3+kWqG741iSZb6LVHCiMJB0NQBmhxwuT5NT7UEfRmEOr5BDbScDvdSQQvmxcT6qs/0I+5TM+VlAAQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+1OvFrzc9mXc4T+tyV/wfFfAkoY9MtL45nIpwSdpDQCX11VHHL
	CwwoH5ALWYKzk+i28K7sEl4KEhnlnSxaiiaGJm/JtvCFSLsSZC8SWs2U
X-Gm-Gg: AYBFou1FsYMdKkgequtTUcr4H0EI6WVqc2VS2n5b92eMRovZB33CrigAFJJss9erP91
	AWzHJ2+Z18ybd/c4BUwQKUHCOgZuwY9ag/Q1CQye2PDb/lMO9D2x7oLKAA4w1cZWwpGVTljMAz1
	yn9Ql//ooHqHliuLr9gkfLwgUp9e6y8b04RSUNMR7k/gec3ogga3AcDATT7PbPi1nislWXTMEhU
	MOXDKWhtcHNgAT6LofkEPuYJH1L8P1NdIgM2Qi4XMYhtouk2GBybHZ9kcSYYOgJ0rsovnPorOCj
	6a5RjnEgW+LQ0sC+6PFLjQOU/AXuuBoQX5dlcg6bOnXcnJq3i73OWtkd0PIYaEzS3cbG1+dIzx0
	Cc9pA1VYpRTbwvFuPsmKe30W/OQcxUqcE6Ufa1OGvJIUEEHwwjnEDezM1PJ3XHeV366bV83IQmz
	PjsgRf8ZJbejREeqZm0eAqO3RNu0xdNo8RvV6wCCv97dyy1oyjwIqwlZTKSrDjQEnhpW7QQ93nW
	SuEaw5HvDpVSjFSAo28k2NxiNQbbaTC8/4zzDmxamLLOcvvq5nUsqBS+WkbkyAlstWK8ngUigQ7
	HrC1NiOjSVAr4V8Lb96nKaVm5ozytjAislYeEWApJH32S8YzYXEfS0hctRTDis/nMMISoFqXvr4
	9I7HBwkMkVQGFmD7OWLLAhXgvb/5uz7NcawpM4bAmG5UQHCSp+9c+UrS2+e5JcG4gL9NWxciz6j
	K23Qv0yZWdBloOzAjJYSbnadSuAlUxKs8Jwckq
X-Received: by 2002:a05:600c:3104:b0:4a1:fe26:24f0 with SMTP id 5b1f17b1804b1-4b6df7d4119mr94096405e9.20.1794048459465;
        Sat, 07 Nov 2026 02:47:39 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b795024730sm47935635e9.4.2026.11.07.02.47.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 02:47:39 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] media: uvcvideo: synchronize imported DMA-BUFs for CPU access
Date: Sat,  7 Nov 2026 11:47:02 +0100
Message-Id: <20261107104703.44111-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261107104703.44111-1-kmehltretter@gmail.com>
References: <20261107104703.44111-1-kmehltretter@gmail.com>
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

uvcvideo writes USB payloads into imported DMA-BUFs with the CPU without
cache synchronization, leaving physical RAM stale for non-coherent DMA
importers.

Set uses_cpu_access to bracket the driver's CPU access.

Fixes: ccc4c539c05f ("[media] v4l: uvc: add support for DMABUF importing")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/media/usb/uvc/uvc_queue.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 3c002c8f442f..1f92ee96e071 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -247,6 +247,7 @@ int uvc_queue_init(struct uvc_streaming *stream, struct uvc_video_queue *queue,
 	queue->queue.drv_priv = queue;
 	queue->queue.buf_struct_size = sizeof(struct uvc_buffer);
 	queue->queue.mem_ops = &vb2_vmalloc_memops;
+	queue->queue.uses_cpu_access = true;
 	queue->queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC
 		| V4L2_BUF_FLAG_TSTAMP_SRC_SOE;
 	queue->queue.lock = &queue->mutex;
-- 
2.39.5 (Apple Git-154)

