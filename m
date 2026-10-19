Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B72489FDB
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 07:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394070; cv=none; b=ZGbS8VNrKkgVEq6WOMPPeAemt/vH0WmEPkMmuAq+Pzhqdh8JHivqDGbizp6i3aJZp+kxbYfUy4nugs6WxKIuLwplzyyifPcjPJZNz0JvxFojlKWA6n/Bt6UoxmgdycFyErNRLmzDtdmJCdk4ziJCCgFYebUM3eOOnr0kNepofcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394070; c=relaxed/simple;
	bh=SFqiFbwT5zc1Xy3gOBv6MyMahvIHAjT/LaJDsud62Wk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=auCEDNJwFwF8Nwv1zNXX2lUeqnp+zK3Iv3KpXT49BW34ucdZrtCFEjWNVLX9OLZxQf7PCsCZq/f7shsQCp357vCSBpaRIct5klSixYw0kZL17OhGTv4JcjYKna2XWx3rojme4tebX/aym57m8JH7/sXUoglZ/s+kKqBEfF046hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgRcbOUg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgRcbOUg"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so13333685e9.1
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 00:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792394066; x=1792998866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yk1PIjZ/V5CKGQclQeGzlozEfFu9qAElw/hhv/wGbR8=;
        b=FgRcbOUgMZRV6JE1Lhh17+XiVe0jD9TmJfKMVIf3L9AqlaOLGd9UyTxYF7FRgwQ5hr
         gBhydyk+xI8xFV+z68qigklDN8D7kSA2bZ15foWrb9tf2WXFKTPIS+5mTeKFTafTdBd3
         XZQB472E4z9Ornt8zaqGQi8XdzwgS/6zS3TR6MIkF7up98+u/MIou2jMjQeE27vd5a5O
         OqoqPzw9fmsFzJPZI/VgL/G/a6L3UWjNQJ8jMRxi5ScuNTfLq3k3cT7M3MS+MMkPNQlL
         U7cMlT6FrvZpzsO5GBJrKOhXhJoHuBmuriTnI6EUJM/VHE83N9RInL2SnHgVAmcgZtJC
         VP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394066; x=1792998866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yk1PIjZ/V5CKGQclQeGzlozEfFu9qAElw/hhv/wGbR8=;
        b=IzUlTe8F6C+wC2A4Tg5fBG+6Ep7y7zlPzIDNGdKGM4ogp0/k2UkiT4ksN9W0FSLFTs
         XwdJV+/HSKIRfeGoYmr7fK6tD4Cyps+CSizgmOJHljcJHTcxI8EA57GI95knOzJcacWx
         HkA3c97Q6vnqsbcwTmg6YBGLqlSW8k9U37MWKmIu2yX49xlywUf/3wCLxQ/na94AWKO+
         rgnnQ4UorEUHACNXJmxfLYXgxWONqtQLkxMsJhOhEAKrgU3QYHnV6gM8V5y8Bf+Q2Z8K
         21vrKIrywSCb2z4bjLOkN26FhXhWLwvaRsNlqE4stpnYK+3Si+G7sqyv/IU3ggDCSy4r
         8eAg==
X-Gm-Message-State: AFq9FYKK9//dDYBnZEjUbMNz2m7o7XsTJMLuTx0QHs3UR3QiPO8AiGII
	UJckaWbA4kc0zbjYh24uUZM4rWsQ+FivwXuuefeVrstZS4Wq3dZkmWaJ/dllNVLh
X-Gm-Gg: AYBFou1mlQBJjXPsduRcyYMYAqB8t1PfnzKoNhEsOHMYzflTNSQEqeHn3CxrTGei5Uf
	6na+i6Za0CuNrxgjrwtBX8G+mZRZGU6ijvQ6LBhJMnU9zQtxmvw9k5/Ow4H4eZHEGPuEDVPokBY
	96kFbeMWYvA2o+Ctv7Lnb3mzz9TPJqd9yoyaX2S8YuVCi1xuuL7xPGpJlJt3UnbZQCdLOd2ZZdx
	7PzKtR3FnsQPuTqsEZ55TBdANMlac+chNN9UhygJIXFkoPFGAGAY0sjG456nfRd/hkX7VyblUAB
	+94qhu6wQQHGyO/etXV6nb6YENLif/NC3lF1iZGrlL+181UFAJUyrDOhrGqXvbrukXADj2t8XFf
	akw1hSwq+uK5pnIAsuO+aO3gmf1Ve4bIgdBKafTBwweKSeG2jwmW1MPBhBrmAcpjzinBZ+pbKBg
	rRwIUyyACB3kiXgUbcaD3gTMvGrm9HjaDjTmGpDIwY55MuJWHwj5Kf6V4WH7r2LQAfbc+9Z1OGN
	R2A/I8JaBV/D0hWl/8Pqv17uPETTFxc6B0fZruFKHGqIOtrbYbrsoxmReAUj+Bgv2xGSn54rvQk
	gJBZHtRQUYg5Mg8uBPhVVF2zvDYUnUfG8f8u6iLnsiUNXQ0+L75n5u6+wF7yjSzAfFdII+M5S84
	f
X-Received: by 2002:a05:600c:4f95:b0:4a1:7bae:d80a with SMTP id 5b1f17b1804b1-4a1d75e3c9amr148966095e9.9.1792394065279;
        Mon, 19 Oct 2026 00:14:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4e0-4601-c43a-536a-04a3-af7d.310.pool.telefonica.de. [2a02:3100:a4e0:4601:c43a:536a:4a3:af7d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm21559338f8f.2.2026.10.19.00.14.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 00:14:24 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: linux-media@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomasz Stanislawski <t.stanislaws@samsung.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH 3/4] media: uvcvideo: synchronize imported DMA-BUFs for CPU access
Date: Mon, 19 Oct 2026 09:14:10 +0200
Message-Id: <bd42fc312d9a046a9dc943bfbdd3e2b3612f8c78.1792392288.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1792392288.git.kmehltretter@gmail.com>
References: <cover.1792392288.git.kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uvcvideo writes USB payloads into imported DMA-BUFs with the CPU without
cache synchronization, leaving physical RAM stale.

Set uses_cpu_access to bracket the driver's CPU access.

On a Pi 400, 12 eight-frame captures each had stale data before this
change. All 96 frames matched RAM with it.

Fixes: ccc4c539c05f ("[media] v4l: uvc: add support for DMABUF importing")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/media/usb/uvc/uvc_queue.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 3c002c8f442fb..1f92ee96e0710 100644
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
2.47.3

