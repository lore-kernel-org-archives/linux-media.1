Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703377;
	b=cx9Yq0BqP0QS14NNHOhmSRRJoVdMdSoNn9Qe4SQ/MSkmW62s4NC2xnMorJu+L4i1vWCV
	 UmdcOfifmt95fl9d3MERr9ayZ4wFKXPTAa1NkWKqbW+iaZxLEZJeKt7R/DsRdpNrz8F1+
	 ZkWNoiQqZDoJ/MFlASLGs6jvd4AGlTAXgvtJJmDz+F+IPy8a/tZPZKEvv4ZVqV6b6znGW
	 tIupZ8ivHTKmXP1pGVOQAfQlKpeUd7LSPbGxtdwi/ydkY7zcnmYxHkjpZrZ4sYe9uZQFn
	 toBipxIOj9E6ILI2Dy/N17yJfjotswCTmIU+YeiR77oaCT+yW/QMCg0AAlkxHLLl20Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=o5m6x1zTq9mQX096k7d8zrZcnlgwQ3oTTf7qyiSE3PY=;
	b=xurN8SlsF78RrTAxtf1pF9BMC9dfUtcL1NXfh1PW3tUHn34WQOY6Ajeql/BFEICI9Luh
	 vjtk8jBmYdLrYxo/Sjl5+mK89v/kTDgh3eaJAk5gC6xprvUuEmGADFvGQdp3MvVN+sMn1
	 EeZS8tJi70zirULLY9LJOT+BBRs3ahBf1/7GcVktpNeVbMUuyujSNieXbLt3TLacaaWx+
	 q8Gi2X1PtNY41HUvSXSbbzexJSBdoBr8fv2r//GafY+cfUhMqvZDIwRZjQhIGU1WDdeWa
	 4oZx0WKVV0/4PCUixb8spyqs0UALLiapvIFPFUt3GQXJOKs7Z5mRdPoHC/uKByaC4Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XbLYk30j;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F3D606EEA8
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 10:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13F3D606EEA8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XbLYk30j
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bfbc25a76aso649738e87.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 02:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793703370; x=1794308170; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o5m6x1zTq9mQX096k7d8zrZcnlgwQ3oTTf7qyiSE3PY=;
        b=XbLYk30jfXunhsEYxjVwplYjk4X+rlhKam6UuehkAzt1FaP3n2VLvzloSSe4MVDJBQ
         nWd5tH69f0pKXulOG8ihw8TZPrCSll9OXe2Mtdu5fz1uZjBsDWZB44nO4YOsbsU7VEKA
         ++XSzzNMTzcWucoBurdROfSfmGsXmuPszhqJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703370; x=1794308170;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o5m6x1zTq9mQX096k7d8zrZcnlgwQ3oTTf7qyiSE3PY=;
        b=viToTX9KNu0aLp2SBf5hCw/5yy8rjTobLTRBtrX2ULjoSeG/H7L3IS2cDZ2n7RS0wM
         snoz4ljWFSHJUkLQzJM8RzgOYXLAGFDgyaWrU7HnW6E0qewy5bx5+eW/pMoL7aI89fVe
         hSlBKvdcZJy5rvTdWaPxpt+oWmKDqRkzo3i3FdI+rj2yl7O6eucoFRB0PoeJ/Oi1vnqm
         N/olrpFzxbKVpkhujaE/Y4il16nWrjWE6NOy11cqzCDv6qBz4o3eYE045FLd3JcpCsUy
         SA0cnX1YX5pHyvFX8qmnQSo0HXmzANZv2S0cDly+3yXeK4+FOP304RBYISdFPoiIHFcG
         mzhw==
X-Gm-Message-State: APuU4Z9+7u6rmrT8lyFqQc94ja6bVmEY3ftrHLoN70Ltk1ITEgZIE6m3
	e/tH59wNoodyzXX50tedRVOSATPaLpTBtCwkwZjXIYXn+MS2Ogyu002qPRQ0dcBxnw==
X-Gm-Gg: AYBFou1kqPUkPst++RElQqeUVNi6eTbQh48o7uzaeb2FCjT8kXb5tX0rWRUDBgeHgRL
	6cQ06wEy+P4vkhXs+0Q+XOiJg89kgWkAV2x+pLDLJt96QLD+7Rv+ZO0vYAzXAIk2ECSefX9BtCv
	V7TPdKeD3abEmmfWUFUgv+0DGZgM8oBdx6d5oJJq5belTgbrxHe/lip7TaoHEVeoHiMZG+ebpIP
	uhOwpG0pTxOtJa7rKTrbg6z5YfwBuo7J1JnUdNi4Ev5p07peuaplI2echHw1AEi3ku8JwzFEzgS
	q93hb8X2KqmMq2tJ62DAhyZ89wBCXKAq2pewqQHDLMPe0WB3MNSL32ND0uk2ZRVH3HAseluNStN
	bKAF+py2oS9bAp2zLjmP+rUnI4NXwyrEB0J5RHnhoHUzCnM2f64jkIFZBCuGpFjq9fijiHvrlCb
	1wb62eV/GTECzIF3MlIPQSETBAvleO2DhLar7EY3hgP9g1we6zQ7RLbs+KmxF2cZvj820yb14Tu
	QWU984Mc9DGUEhwJf6QJGjfpH6Pl38l8rks98fatW5zYxb4bOxaGAKMY0wkKzrWwbwaGj8cF0Fh
	Hh/7c4H2VGi/mLzFkpaEzE9LlKsYhUpzIUP/Sto3DZOczRaZMFTIlAx9iHh5KFsL3zzqu4H2wJ7
	YQ4TfJFhR2HcJjs9O7BdnzYKIVUVCoOU=
X-Received: by 2002:a05:6512:1325:b0:5bf:a34f:14ce with SMTP id 2adb3069b0e04-5bfd11e9f41mr4389560e87.11.1793703369932;
        Tue, 03 Nov 2026 02:56:09 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0754779sm2103257e87.82.2026.11.03.02.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:56:09 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/2] media: videobuf2: publish buffers in bufs_bitmap
 under mmap_lock
Date: Tue, 03 Nov 2026 10:56:07 +0000
Message-Id: <20261103-vb2-mmap_lock-v2-0-054e11dcd013@chromium.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMe96WoC/3XMQQ7CIBCF4as0sxYDVIx15T1MY1oYykQpDSjRN
 Nxd7N7l/5L3rZAwEiY4NytEzJQozDXkrgHthnlCRqY2SC6PQnDJ8iiZ98NyewR9Z53qkGt9QDO
 2UD9LREvvzbv2tR2lZ4ifjc/it/6TsmCCWVSKW+QtmtNFuxg8vfw+xAn6UsoXYTpcyK0AAAA=
X-Change-ID: 20261102-vb2-mmap_lock-959e0cc4edb3
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

vb2_mmap() only takes q->mmap_lock, not the main queue serialization
lock (q->lock). Commit a286b0837e13 ("media: core: Add bitmap manage
bufs array entries") started setting bits in q->bufs_bitmap inside
__vb2_queue_alloc() before buffer memory is allocated and without
holding q->mmap_lock, allowing a concurrent mmap() to access a
half-initialized buffer and hit a use-after-free if allocation or
.buf_init() fails, and prematurely counting tentative buffers during
partial-allocation .queue_setup() re-checks.

Patch 1 fixes this by dropping set_bit() from vb2_queue_add_buffer() and
publishing the range in q->bufs_bitmap via vb2_queue_publish_buffers()
under q->mmap_lock once allocation and .queue_setup() succeed.

Patch 2 adds smp_mb__before_atomic() / test_bit_acquire() ordering on
q->bufs_bitmap for lockless vb2_get_buffer() callers (such as
vb2_find_buffer() called from stateless mem2mem .device_run() while
VIDIOC_CREATE_BUFS runs on weakly-ordered architectures).

This series was generated by an LLM, but supervised and reviewed by a
human (not the most handsome human, but a human).

---
Changes in v2:
- Keep vb2_queue_add_buffer() without set_bit() so __vb2_queue_alloc()
  stays unchanged, and add vb2_queue_publish_buffers() using atomic
  set_bit() (rather than non-atomic bitmap_set(), since vb2_get_buffer()
  has lockless readers).
- Split the smp_mb__before_atomic() / test_bit_acquire() memory barrier
  pair into a separate patch with an explanation of the arm64
  VIDIOC_CREATE_BUFS vs vb2_find_buffer() race.
- Drop lockdep_assert_held() from vb2_queue_remove_buffer().
- Simplify the !q->bufs guard in __vb2_queue_free() to 'if (!q->bufs)
  return;' (still needed as a NULL check now that __vb2_queue_free()
  indexes q->bufs[] directly instead of going through vb2_get_buffer(),
  since vb2_core_queue_release() and REQBUFS(0) call it when
  q->bufs == NULL).
- Clarify @bufs and @bufs_bitmap documentation in struct vb2_queue.
- Link to v1: https://lore.kernel.org/r/20261102-vb2-mmap_lock-v1-1-fe550fe03ed8@chromium.org

---
Ricardo Ribalda (2):
      media: videobuf2: publish buffers in bufs_bitmap under mmap_lock
      media: videobuf2: order buffer initialization before bufs_bitmap publication

 drivers/media/common/videobuf2/videobuf2-core.c | 74 +++++++++++++++++++++----
 include/media/videobuf2-core.h                  | 14 +++--
 2 files changed, 74 insertions(+), 14 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-vb2-mmap_lock-959e0cc4edb3

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

