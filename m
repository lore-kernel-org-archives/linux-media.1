Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794048441;
	b=FxucBjV7vb0Oyh8lv85IOBt36U2Wbd/pJ7yq/73HtmOXb6hpOUSzVVtcvkU9672ShCAB
	 68TTUVgbfUSbIjojtSGEyXl8Sjb/UqxoQ3WZ3gpoWmlMBt3a34ljS7/f0yLby9VnZRpB/
	 TZ3exYhAW8Bk/KfrZz6E/AYlMEiGl18Ng4uUpt4bp6ae0Cw1liYVhr5d0e9gy05DST3iy
	 5dsgu9PuUL2/qj0x46KTj4gACYVBQF7mP1Z1AUfU122dJ2dqhfU5DAelE6j/hiF4G1QcM
	 iC62WK8rgoHZgKfoncOhwWg+JhOPA+MuQvl42NFjKpk87SvpIqyoQTYWRr2XQdowlFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794048441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+OU4gePN1TbrZEx6lkd5UF6PxGqdlcQqr6Ot6rmKywQ=;
	b=Qg54O1ggH3b6IaARTQWFXuVwwEpvJYcLKb55qAc9QfDboHR76hI9d9w0YhzcK+cqxaqf
	 n2BSK1YnMIGHnR8xe3M8C+4+0MuQJUyvRMWX7JjnwO8vQR6KHYARCWQSSDU4jB8JZSR9S
	 53uyJ41WyPqJ69x8Ul0rAXMrFF9edvEq4Hsgg8eWG5yr9k6ZrAyiVFOroRgx5H+GAnpD1
	 aB29GzHBPeoLdmfk8o9WqqjRNjZTqDBSBz71GhWS3dkn+U2+I++SexMxi11p6NENXHV28
	 845dmo+Zdd/J5hLLPTisNTSZrqR/3VJnbvfBaRCawsEZo3sqJFw1xS2Q4bwR1mf2j4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPpZxkZh;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1917606A32C
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 10:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1917606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPpZxkZh
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso13474635e9.1
        for <linux-media@vger.kernel.org>; Sat, 07 Nov 2026 02:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794048439; x=1794653239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+OU4gePN1TbrZEx6lkd5UF6PxGqdlcQqr6Ot6rmKywQ=;
        b=FPpZxkZhP8DkXqTcCgU2KR9Y7JfY8TZj5ukgXKtcjF6rCyTzhPETGMqhaUHJcapsq5
         dTpPSHlpct1nSBdWg1Hnz7mkTR8xBebdniUE1HFqtItzYMSlPgoLyEUKihI0KIFLD4ZL
         9v4YjbQrfc+rIIaqimAX7pPaE0kU/2cHeBi0slLsQHUVRkFVNARboThr2IvKCuEz58PU
         y59sMjikGMfHrmMBkQ/Loi5vF6FGfiBXQR4tdD2aRHyI6F5IbhHghmnXWO91g4cwfO10
         ROB10FdYyMMpW6L3BCSxnWsrmJ7DoMwl0H5RMjk8CLzMeUpvA3VaZTLGKfx2b1VBAE6R
         GLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794048439; x=1794653239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OU4gePN1TbrZEx6lkd5UF6PxGqdlcQqr6Ot6rmKywQ=;
        b=YzcAGrEeHnJLTolG91aimtY4cl1JARm+Fm9QNyT1USjTxujIzc38WhFjwY/N7fzsQf
         JzXsRS3JK6YtYrsGwjkrNAZ131GXttPuel59NFj/DPagtDduAq6kiW3wT4loXOjcRKhP
         w8TBRTpV6lxuUb7WpkGTKUl+Z+kkgRht5GKDs5guwpW9Fm8aQQxTyPnxiO3Gnu6yFkZx
         SV9e/Nf1wlz9Fw4+bkgICr505tcdbCMutBun7aIvstIcHU6r3P/844FAlNgQPuVstDNy
         QUQsKwcp77yTUEMfZ4ot/2bDBPORw+14bdJfk8XeSU2JaCoLNRPcma4uK6Q1a6OW6NzH
         OCwg==
X-Forwarded-Encrypted: i=1; AKwUvBwv9rwiubM0L0PE2PcubN7csszl3BpwuRxu3d/uYFwP6TSKGmh/IhXInhUyrVwsLTMjx2aAsHkL/aq27Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+A3wntNJLb8v0B4oi8nE9lvoE4LiGSvz9Qf2QxGurgCFGua45D
	M5sUttVoMF0DC3ZWVva0U46UVl6W0QTjmADMZ1y4ApX5itgs8q/8WD65
X-Gm-Gg: AYBFou3iE0b5SF5FaCIm39oVVBnkgGfjf02bYB74+c6EbsyLN/v4SYyYrRwLM46/AfZ
	6tUffdtuyE79VoPMB0d+GyokgkpPrsTpcYiCWtlHXCuosGb9p6lJg9vHjHe78C9t/opEFgrSVeH
	BIi7oxdwkzjSXoXGX0JuHsAPmJOGRZUbMz3RgLZi1YIyOdCnllR0czQmGsp1Pe8xv1iZAIVMSYv
	LHEbs2TyiBTZ786eMvfW1FIvybbqVMTDeqZ6JMbYnkG3+RSZNXdV+PpQRSDfo6km3F2dfAafXpY
	0BczTseza14FYQ+mrYAuKBnas6gYGmoUGrXo1ZaNduVyKvCraVn1GtBqS0IqLxysZhf55RVgJ0v
	6ENwXI0iAOXGxN1+pYkjXn9dP7vmIZXOsIiUAfki2hyzqd6aA7oZpratw6MWTaijIvxiFo4+Ob1
	OumShhSAGyv1rCmy5HJEP3CGPKpDVVYLMe1VL1jXqS8pEHXiP5JyiljbvaOUwn1dbDaW0dKunxm
	YlyBj759NQ+tZgQaibUkdSTs77ihXXib++TMjnKwBDFk0HQ6udPmwuTuygfFfXuzfya0dXK/3mP
	+sMTtb79kPa9nTkSLvwBSW4dBNEmkSEzWPRD+uGIYOKNbeqNueZ5T/sw5PlJjB0OjXMI76Vah18
	mBjkuHPjYNPouGfwU01S9LBH83XROmD8b8AtUmt3em1SV84niFjODJskaizExMZNeYNpIS4CIPq
	uiBU6NLHRz8BbvyDa4RxpHBd4Fv7oj7PJCKTm/
X-Received: by 2002:a05:600c:3e0b:b0:4aa:2339:a375 with SMTP id 5b1f17b1804b1-4b6ded4ac6fmr78413885e9.13.1794048438783;
        Sat, 07 Nov 2026 02:47:18 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b795024730sm47935635e9.4.2026.11.07.02.47.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 02:47:18 -0800 (PST)
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
Subject: [PATCH v2 0/3] media: synchronize CPU access to imported DMA-BUFs
Date: Sat,  7 Nov 2026 11:47:00 +0100
Message-Id: <20261107104703.44111-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

uvcvideo and vivid (when using vb2-vmalloc) access imported DMA-BUFs
through a kernel vmap without cache synchronization. When a non-coherent
importer such as V3D maps the same DMA-BUF persistently, captured data
remains in the CPU cache while physical RAM holds stale bytes.

Add an opt-in uses_cpu_access queue flag for vb2-vmalloc queues to
bracket the interval from buf_prepare() through buf_finish() with
dma_buf_begin_cpu_access() and dma_buf_end_cpu_access(). Keep this
opt-in because some vb2-vmalloc drivers pass imported buffers to
hardware, and end CPU access in process context because DMA-BUF
callbacks may sleep.

This follows the per-queue flag proposed here:
https://lore.kernel.org/r/CAAFQd5Am5jBev5P1HmsdeHoJfROZat3bi1W=UsN7wpVqw-XUQQ@mail.gmail.com/

Based on Linux 7.4-rc1 with prerequisite patch "media: videobuf2: finish
prepared buffers in VIDIOC_REMOVE_BUFS":
https://lore.kernel.org/r/20261026071735.37220-1-kmehltretter@gmail.com/

Changes in v2:
- Split patch 1 of v1 into the standalone VIDIOC_REMOVE_BUFS patch above
  and use its __vb2_buf_cancel() helper so queue cancellation and
  VIDIOC_REMOVE_BUFS share the finish path (Tomasz).
- Scope uses_cpu_access to vb2-vmalloc queues and drop the attach_dmabuf
  dma_dir parameter from vb2_mem_ops, videobuf2-dma-contig,
  videobuf2-dma-sg and videobuf2-vmalloc (Tomasz).
- Enable uses_cpu_access in vivid only when vivid uses
  vb2_vmalloc_memops (Tomasz).

Link to v1:
  https://lore.kernel.org/r/cover.1792392288.git.kmehltretter@gmail.com/

Testing:

- Raspberry Pi 500+ (6.18.34+rpt-rpi-2712, aarch64, 16 KiB pages,
  Sunplus UVC camera 1bcf:2701 and Broadcom V3D 7.1 GPU), backport of
  the prerequisite patch plus patches 1 and 2: eight 640x480 YUYV frames
  (614,400 B) captured into DMA-BUFs pre-seeded with 0xA5 and imported
  into persistent EGL_LINUX_DMA_BUF_EXT textures before VIDIOC_STREAMON,
  then copied by V3D 7.1 immediately after VIDIOC_DQBUF:

  Heap                        Baseline stale      Patched v2 stale
  /dev/dma_heap/linux,cma     8/8 (329,890 B)        0/8 (0 B)
  /dev/dma_heap/system        8/8 (509,818 B)        0/8 (0 B)

- QEMU virt (arm64, Linux 7.4-rc1 with the prerequisite patch and
  patches 1-3, VIDEO_ADV_DEBUG=y, DEBUG_ATOMIC_SLEEP=y): six vivid
  lifecycle cases (stream, streamoff-queued, prepare-reqbufs0,
  prepare-remove, close-streaming, replace-dmabuf) across single-planar
  and multi-planar queues with kprobe counters on
  dma_buf_begin_cpu_access() and dma_buf_end_cpu_access():

  Queue                        begin/end calls   Unbalanced   Warnings
  vivid vb2-vmalloc (SP)           34 / 34            0           0
  vivid vb2-vmalloc (MP)           34 / 34            0           0
  vivid vb2-dma-contig (SP)         0 / 0             0           0
  vivid vb2-dma-contig (MP)         0 / 0             0           0
  20x prepare-remove (vmalloc)     20 / 20            0           0

Assisted by an LLM for code changes, test harnesses and commit message
drafting.

Karl Mehltretter (3):
  media: videobuf2: add opt-in DMA-BUF CPU access
  media: uvcvideo: synchronize imported DMA-BUFs for CPU access
  media: vivid: synchronize imported DMA-BUFs for CPU access

 .../media/common/videobuf2/videobuf2-core.c   | 76 +++++++++++++++++++
 drivers/media/test-drivers/vivid/vivid-core.c |  4 +-
 drivers/media/usb/uvc/uvc_queue.c             |  1 +
 include/media/videobuf2-core.h                |  5 ++
 4 files changed, 85 insertions(+), 1 deletion(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
prerequisite-patch-id: aa99d5c3c27082cbe003ed94a195e3de415777c9
-- 
2.39.5 (Apple Git-154)
