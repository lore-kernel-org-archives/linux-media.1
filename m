Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792994338;
	b=5p33R/Q7PKtzd9I9NIGGlvg5wqlwXQCxQlVt5T5GIwwraYMEXJvNIJZEB8gqvEWxI3u2
	 RnQqP18oZF+Q/TGiDlt4geJnUPiBVUvVLStD7t8UDtsa80gGDkfY0GWyaI9Yv40vr4YHG
	 V0IC2mKY27vq/YFv1U9xJCQ/mTRI58yQKwZxuInPgctRNIQnjdVKdH1ZbcgcXDaUy3ztY
	 8lAGD3klSclVv6b0+bXgx8Z8zTsVb7+kWuXUfhIH8HI+3H8VjxuMxfDP7xAVna4KV+usf
	 seu05do3t3O+RH2Qgma6fBuerlPMACABDuokdSbiCd21pCvYuiMBkHIrSxqy+3Wv6Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792994338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3gJomeBmHPSa1nSKsQOjrx0jFw6wNV5cIGdR0fKlHFY=;
	b=pJ7+OEpdZpdaLJI56cXDS2paqvVTcpOEXiUxqAH8TxvX+awbCy8IqGWglKladhDgRTDF
	 jyx95WwNZEiNA6ynIbp2lDuiZe4eUwuFPk45fXnT6kslUeWW0rhxYOi3XdTRzsQylq5wo
	 9Es/uRCOgUcIGjIdV9phM0QqXhLqZC7/Hk0iMwsNL+Di9UxPN2jkRIbNcXbF1Ypb3B6Jo
	 X3vX23qli9CN6IK1xLWEQOnrdDrwThCL12pbhlxOjIpPgdxlNxkdGXWYB0fUvTCded5C/
	 xPoYX0q/YOoKpjMpRtXW8U/O2MHHBpazs8XV49pyJwd+6IHYRLsYPCh6O9k21U1Zt5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="I/iLmABM";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD3A606A31A
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 05:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCD3A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I/iLmABM
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e0d885929so1619997f8f.3
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 22:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792994336; x=1793599136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gJomeBmHPSa1nSKsQOjrx0jFw6wNV5cIGdR0fKlHFY=;
        b=I/iLmABMgLUn9YNum9Hg49oTL3h7Cgb6pHXIH8fdZZisy50s+0le+XnLFZRaztOoq8
         kiVk55sAcoIyKG5AMrHzYIOtdmPbyyItM+5VXPxZot99yRKlEnf2HK+u6EJ37PPaKh1T
         A9IGPd689WTuVRYUVu6G9K/HLRcoZXoOTWXLA49rxpkzSzjHsJl/11roSeOpko9CgKIJ
         MmYghK+ZOoM3x/iJnxDmc0DEmaFlD1Uxz3u+ZvhK5cMcGckfnIl5UExSIFZHAExIBD8B
         5VJkAlSjhO8SR+Nav4rDBYxypUA0Rr3JTsjvfwNWTeb6PA5iw+1SU1J/JT2w0Y0P9kmZ
         SWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792994336; x=1793599136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gJomeBmHPSa1nSKsQOjrx0jFw6wNV5cIGdR0fKlHFY=;
        b=V25hvp8fLYNu5dUmg+RF3eBu/9T3lAgiKaVQJxcf0B1f92QNQ+mgp15WNFHHGa+uJp
         XHt9ci6zK1re8Y9m56RjbnKqYOcttJ19UQXbaKltA6F+zWDH8JuU7zTOOTqE/0RqSjFM
         RS8StQp/eO8cnIk3G+Ew6v5E7Vw5d/xSSRtl+G4w/Tb1x8SpPqEz8Hy+DHo6rVaebkp2
         r8kUNOp40vNEID9XX576YFpklljAnMcBqt8n3sCUZ8l9qeJ9ww5ouqKGYT/nNZPodsJz
         9OToS/OCm8w55oLXll9kW4ixonVW1a2CafwYtlRqCbT8qGZLkYLksPJBPAS4lLpJpl0j
         W+xg==
X-Forwarded-Encrypted: i=1; AKwUvBwVPXUNfoaBktvQrifWJJ9H7DhQqUE3geXwi57EN/p1+F9otmOt0gvPKqQ4+bRKbxZfypr89ZHsBIPJBQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLEg7l0JcuNGrfk2drSD2r7Rgv7aHQhoj1Z4SwsZTB980h90bU5
	ibY9VvFG2LvnbOgTARj1oePmppFUaTi2y0elOxCVp9UvgA+dWXn79KhH
X-Gm-Gg: AYBFou3spJQFn864LKvWc/DG/rCdcr1BMxSZpJ1xWtweNtS/u2KwIC6hoG84WSFuIIu
	lIO8OYchHlnj6V+4xJYJsFMGwrpU6QueKOw/QRoNR9Wpu2O+iugsDCE/8lj3qtZr0TpwbqIeSU4
	lYWOR/qLbDI1QtRzUrgdAQtDNhHAAQCBcSOTFa77WRgYY8dFgcRladPGeiz39URdP0RE5FpPxec
	mymhzYlJLr0hjwpqzEQdP5ZvIJyowrk3lBkaAGJkq5Uw5SHJ8tzreeVGlU1mAGKYm9QgTry3Jvw
	3Yczov3yUMIEewHRLYwrBr/xW7c2XVrTZSkPlZUvKRXPWwTSKCBbWdyW5MQ9IDDnhacvzzzCHPi
	XxqZ4itmpqp3bRHrsR+2C5IwuOQYgZRF4G2Ll7JTmAnV+rLQUVCLZNhwqKylaEzAFyzRxJskXHr
	Es9qH68MkgKuQ/QR6JnOwI4+yeKGPaRDgtGUWQiWgalI4b/KNa7hFJrxJZ/KSgY0A3xRsCG6UFX
	6EZiCEVzKHpCc0g/BHafuBIB0s0bGMq2xzGnvbXgi5cPysojc6KjaId1/+vAY6JN1KHaO6RTwf2
	NLMQyFqIBU8pP6mMrODbGVp8+bItnfqm1LQSb5XmCpfxHhPkdlawVV0N5AX3gec42VNCU54Taff
	RVHhQWC91uCB4iILjQzoWhqpKd4ssvX6mclTXCesyspJB0Eor7+5see/9INeHZaQh
X-Received: by 2002:a05:6000:4386:b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-48e3eba7fdemr8948523f8f.37.1792994335994;
        Sun, 25 Oct 2026 22:58:55 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b1a4-1201-5c78-89f4-99d8-70d7.310.pool.telefonica.de. [2a02:3100:b1a4:1201:5c78:89f4:99d8:70d7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f25fsm13901379f8f.2.2026.10.25.22.58.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 22:58:55 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tegra: Fix dma-buf reference on import errors
Date: Mon, 26 Oct 2026 06:58:42 +0100
Message-Id: <20261026055842.96484-1-kmehltretter@gmail.com>
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

tegra_bo_import() acquires the reference retained by a successfully
imported object only after all attachment and mapping operations have
completed. Its detach error path nevertheless calls dma_buf_put().

drm_gem_prime_fd_to_handle() holds a temporary reference while invoking
the import callback and drops it after the callback returns. Consequently,
when mapping fails after a successful attachment, tegra_bo_import() drops
that borrowed reference and the caller drops it again.

With only the installed file descriptor and the temporary import
reference present, these two puts reduce the file reference count to zero.
This queues the dma-buf file for release while its descriptor remains
installed, leaving the descriptor without a live reference for later use
or close. On a Jetson Nano, forcing the mapping to fail after attachment
produced:

  VFS: Close: file count is 0 (f_op=dma_buf_fops)
  imbalanced put on file reference count

Remove the unmatched dma_buf_put(). Successful imports continue to take
their own reference before storing bo->dma_buf, and tegra_bo_free_object()
drops that reference when the imported object is destroyed.

Fixes: f5b8794e17e4 ("drm/tegra: gem: Don't attach dma-bufs when not needed")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Found while auditing Tegra PRIME-import error handling for
CONFIG_DMABUF_DEBUG testing.

Tested on a Jetson Nano (p3450-0000) with CONFIG_DMABUF_DEBUG=y and a
separate change that rejects zero-byte IOMMU mappings to exercise the
post-attachment error path. Without this patch, the forced failure
produced the diagnostics quoted above. With this patch, 100 consecutive
failures returned -EINVAL, preserved the original dma-buf FD and left zero
dma-buf objects. No file-reference warnings or DMA-API errors occurred.

Additional regression coverage passed 33 dma-buf heap selftests, with
three vgem-only tests skipped, and all seven udmabuf selftests using a
volatile 2 GiB HugeTLB pool.

 drivers/gpu/drm/tegra/gem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index f76af73..ed35a34 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -502,7 +502,6 @@ detach:
 		dma_buf_unmap_attachment_unlocked(attach, bo->sgt, DMA_TO_DEVICE);
 
 	dma_buf_detach(buf, attach);
-	dma_buf_put(buf);
 free:
 	drm_gem_object_release(&bo->gem);
 	kfree(bo);

base-commit: 21a7f44fd0765fcc5194130b28767786eba1d1e7
-- 
2.39.5 (Apple Git-154)

