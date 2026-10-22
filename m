Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792698398;
	b=YwAFOxgmimu/2IlaHlBBpxOUlA80A2msEudBOBmlkXmDo8FiFBLBjNPFkXoLtkj42qnc
	 umWSp1zZgkgrvB8VTpEjtErn9qY0lUpRCchzy4b/RdgEC4XmMBm7Eh0Je5AQpzjWim24d
	 CVTk4z39+ZuvmP3PRexPHnu0LIjPZJQhjukblxQY3yjRi/Az1iIHo9SpCHnBtN7Lztla+
	 rCFGZgx31OkkrwIDKs0WJy4WnNKiiDbIWnRmNqlxb8kRLmV+nh2dfddf6V2oUfEnKs6Ej
	 0q9Mm4hgqDkvBxBc7jr0I6jCb6Qw3eJZiCA/qKM/HcC3um7Ao/Qsx6BnMcjMpOuQi9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ARO+RiiU1JIYX/6zYNFbr4jp0V7tYgXjyYBPtET6V74=;
	b=zo13Ha8o+wsYM9hPxnt3+gfmrNTUspAa8JaR1RYQkje9Zko47olqFH7h/5y9AlBiwmfs
	 zcCUWhbfBTsOWUgvLSpc1xLABZJJp8++ThTSvJdVwQcuCnUiROiAkgb0SQpWZajjgY6lV
	 CgPPXFJqLRQVY/uD/JuG5FWOWpdl3JcwlGyBdNfqMgiOrwqiDUlmWDam5WFY3m+7jtGAg
	 /a1kfa3AzWoG5Rq+pgyZUdMbMktPbNvlsGJXG3/MhBvEs2y6aXLdRwplscclKPTtPXwR3
	 ZIc3/aNwKB/CEyArrvKe4sUaMwWOKWfkETpaO279ik/2mWm2AsvURYhc+dfWLttQerA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X4Orl8y5;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C21606A31A
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 19:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63C21606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X4Orl8y5
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e60f9af6e6so809955ad.3
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 12:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792698398; x=1793303198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ARO+RiiU1JIYX/6zYNFbr4jp0V7tYgXjyYBPtET6V74=;
        b=X4Orl8y5ZJ6qdUMN/Z0ip9ybgYPPFgcelMo4n4augpwvb5eVzx0/awG68S73cqxomg
         mHR0XquQuhCDxGhPnQ//7361DfF8RyqYWLgZ/QL3w2ZcseqvS0oRdDivhsXZ0Bw4pjlv
         SD9rwQG1lk+CoGxVVWoqrYDz7Oh1J8GAigyRajotjhavQJWm0StG29KwaiTkCgz+VkKz
         hi9Lv+8rNx4E/WLNJCL3d5+/uOF+6hEPRk3JCJcwLKZsH6eAet5xW7JErDzFs+FzwDOn
         t4z1+7LrZv7AhmT3xPnliVGw4LQD2tsz052MrA36aeA3TO3BXTo+jH5Olnud6wOP+a7H
         I+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698398; x=1793303198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ARO+RiiU1JIYX/6zYNFbr4jp0V7tYgXjyYBPtET6V74=;
        b=rGeZNHwUw3XgnBXCeCtBE3PtaHBXYB2/Pxm2ChjJ1dH95PReRIq80GDnnpeOAlge/L
         JQ0h1FlDEaYFZ48T21EBvtSVWyQws1ndUKGWoWCgdhuBxmoZoqKCerWwzWFD3RdOlOAa
         dg0WeycB+nPf87SO4a0GZoDEM5Q84MsWoTNBKn4z+ol5LNND+wpU/V/xDQDS6VM/we/R
         nMIgtriT36h6gi0Z/rmbeuWYWVooZII4BaKLkDXT0C/AUF10bRwXqou+6C5v+6TWW5vx
         iFAD+GxDWiJ19QaKeNW/L9nHp1s/jObDiPlQF9stktuZMLLA81jjA/HtZlwbmii/07fm
         0SdQ==
X-Gm-Message-State: AFq9FYLEkcZiRH3AFbmmEbMmORWx/TYzhXB6LuXD6sFOHaeKON/WfrOw
	921NjAZK2XvCQaHsB9ADOaIvMihPQqV0mO/4w2/yPSyf3TEjvLxK4CyL
X-Gm-Gg: AYBFou1Dw+OafHd8s9B2Vxf9Bpo6aeM3TEL5OcWurNLLm+sEmEESvUaWDFUd09a/BLf
	D906v9SAXieq4DO83ttD8UorNZW9zHQkyCVebmd3ZEfwYn2TOKO+Ha1/cSOtRgcZVGgaxe+DIxB
	aFptoo+tjICKMx3X8LdYNogzL6CbgKLvDKU1ou3/cQAWjOz7tnWQhp5AjmmorFOTMvPuFhajl5W
	rx5nXOwOSpRhWVKihRZrJlBzGvz2XWJFsO3HrR/A08wBiFoVAsCPQJJSYYlY3oi9D/x6FkmXnVL
	otfJWvIddQe7ad4muVm224wScktSp9ewMlOpUwJ/byeOhTaZWmDTnWkZ7Cs8Mygh1dA1aHdnqzl
	fnH8zmdn2CN9tJtWwDgRfKOOhZl8AiNonHcXnyngq08Pl/fDYTMpQb4VnS0evK0Mbyjg1Wf9c6j
	C1IM4Q2zSdIpyJA24I5JxpggbgoAzk8PTvX1FNGhyQg+KXTL4MZIGJzVYULYXJy7m0PqScs10pN
	uiEUIfgNEoo39U4xysL/2QLkOGsUbZ4R/C/JyEILqLx/X+vUZDkKe+SfvelVuM9jIGz6XOtq2rW
	a6ZCL9ecINb1ZEstn7aMuW3zAkH5oQln
X-Received: by 2002:a17:90a:ec86:b0:3aa:548f:eb7d with SMTP id 98e67ed59e1d1-3ad86f44cc4mr5332559a91.20.1792698397762;
        Thu, 22 Oct 2026 12:46:37 -0700 (PDT)
Received: from casta ([42.116.198.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada49366fdsm5505889a91.14.2026.10.22.12.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:46:37 -0700 (PDT)
From: Nguyen Duy Nhat Anh <neganhat@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duy Nhat Anh <neganhat@gmail.com>
Subject: [PATCH 0/3] media: em28xx: fix multiple disconnect races and UAFs
Date: Fri, 23 Oct 2026 02:46:17 +0700
Message-ID: <20261022194618.14170-1-neganhat@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This patch series addresses three distinct lifecycle and race condition bugs in
the em28xx driver triggered during concurrent USB disconnect and userspace
file operations (open/close).

Fixing the initial refcount underflow (addressed in Patch 3/3) allowed
syzbot re-testing to progress further down the teardown pipeline, which
subsequently unveiled two deeper Use-After-Free (UAF) bugs in sequence
(Patches 1/3 and 2/3). 

Summary of changes in the patches:

1. media: em28xx: check dev->disconnected in em28xx_v4l2_open()
   Rejects open() attempts with -ENODEV when the device is disconnected,
   preventing hardware register I/O on freed dev->intf memory.

2. media: em28xx: clear v4l2_dev.mdev on media device unregister
   Zeros out v4l2_dev.mdev in em28xx_unregister_media_device() before freeing
   dev->media_dev, avoiding a dangling pointer read in v4l2_release() during
   file close.

3. media: em28xx: fix refcount underflow in em28xx_free_v4l2()
   Removes v4l2_device_unregister() from the v4l2_dev release callback
   em28xx_free_v4l2() and invokes it in em28xx_v4l2_fini() instead, eliminating
   an illegal double-decrement on a zero reference count.

Nguyen Duy Nhat Anh (3):
  media: em28xx: check dev->disconnected in em28xx_v4l2_open()
  media: em28xx: clear v4l2_dev.mdev on media device unregister
  media: em28xx: fix refcount underflow in em28xx_free_v4l2()

 drivers/media/usb/em28xx/em28xx-cards.c | 2 ++
 drivers/media/usb/em28xx/em28xx-video.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.55.0

