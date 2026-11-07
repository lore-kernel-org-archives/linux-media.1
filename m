Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794048458;
	b=07aFGHOJwER4hBlm10+2qNgxSr7R0zvs6zQ+gjR7QsiIWwKouAlDMx+abjAG7W20A/b9
	 LV3ta+rmzXkDaFCOcjWW1icYfkLmr6A9L+3CQq1iVeRiqHPPZ4pgjIt4zG1hXTkAdCmu4
	 i048XBH6iqaI23MAxUuLVBSHPELwaWqGJRzceZ8g9lpnop+ktUWnWmNxmQfOTp//7qLAp
	 lT9HTGKxIQn2/azoDXXp722teQ22akB0YmzRMZLCRx865x8yn75qzhqLA8tCDGf6vX/ZV
	 UYJkwH+WRdKQakIQUnchnVZ4t6RBL1al2OPDR8zY5i1Lc/px3Fh4NGLz9kGiLAwt8FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794048458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gs6IOJ2d9nrR4hk6rBiqyfNHtcU7Qx4Hjf4P/81L2vQ=;
	b=tBHwb9eMZ14I1oZHRw62mCOR5nyNgaIYBbmPkflcPHFain9eVKh2oSiCTKhqw6OEfONW
	 zM1RG/dz1efRCOFCCxquPwZljOwBHl2v1r+2cO8RNnNSVAcxcag+wp6e7Cld+Sr0mws7m
	 qxDnJmPSoOsdjQqlgwuIHSX5fyLQ+2Lmv2GdJG8+2Rhzf98PsC0seDodKQaIZGTS0QxNr
	 IEE8ZT9iBFdeFsBPXLXBCMSPPXABzNDOIkQes60sEj2sSHHyvZinezCyVLbiVhtjTWnHW
	 4E1Y5TIRyTh7sSgRqw1/FyhGe6JM5n9Jl607bRBRXJ8F4+HmVhfSrSEAEN8zJ9/VH5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ao5dSXnh;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C0D606A332
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 10:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84C0D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ao5dSXnh
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso11931575e9.0
        for <linux-media@vger.kernel.org>; Sat, 07 Nov 2026 02:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794048457; x=1794653257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gs6IOJ2d9nrR4hk6rBiqyfNHtcU7Qx4Hjf4P/81L2vQ=;
        b=Ao5dSXnh5T63YZE4nv498Lf9nDJMoqxV4INinVAuJPytxB4b6AqIEZ4zWnKCEHlAiS
         NpnKYQDOh46uHYfcJbN0BOsjA9dD9mpFhY5o9MzO0pwT1o8A3VeHNenWEdVJWxsJjQOV
         mmQJQSwHX05uDCWDfD4NgNC+hvBRQvlv3yZAPDDOQJQ6WNhX6c4XZTDq+IUaF0ddd8vc
         5KYPPOLvnKGDD4pc+MH0SbviFj/qh6Gi1jjA2M6MaSGQFYpbpn7iWBcWmSsd1R+xPNif
         K/2kJn46A4qNj6ulC2Cba7ThewQW0Gcat3H1gnC6D44+Azv5ntLWppBqpA/PiDxByUtd
         CQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794048457; x=1794653257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gs6IOJ2d9nrR4hk6rBiqyfNHtcU7Qx4Hjf4P/81L2vQ=;
        b=f7PvAmmyNKB+8S1BZ7Kk0roovDyt6LSy82D4WF8n08Ev9JqVLGPyQ1SF8VmVKiiRSR
         /hGbHvftAG9XU+9UF7+VyaOBkRbmUvURDN3cbulNKGrFzYqOfiAztZvYX2sMc2awNR7N
         hD+EKzw3sQFJ0eKbcCgrKADPX+l0vEeglLLjPjwcpYUAc7oeBPz4XtH0THObNPpqVc+M
         L/t3rY/QauUN1De1T9wT9Ca91SCswLgiYsYVNn7SIzUe0A+4EHUK7ly99m6H4XMemTdw
         oy7wgpich+qn2Ti2aWTrMTpNHe3xEm1lJkU5GKiLkmzOEekUtvPCiRDruTrMf9eIB4DZ
         bVSg==
X-Forwarded-Encrypted: i=1; AKwUvBySK5TZ+wYl3morBGgY+dq9KJMyEuVz+elt7lR6i2hdts/YY/Ken+7R7LlISGycoTtGaDnl2BiD8EN1dA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8jZO9EThh8nNOGh0s2/8PN/78xd/puuWno6GTorRYLOfcOQ+Ci
	qbV+hE8SFfX0XigsNEUnKwTAtOkuAOFzmf0834QTb3saFJs3BwbhsQRP
X-Gm-Gg: AYBFou1/ta1HAAt3r4AwZ+Zuh3qH+JABDUrFBFFlWAtihLL9/nsBJgqlr6ncOxVv/KK
	GsG5dQRvj0d9GIduvpEqTrnGZTrMqnjoj//dcw9JTXOQ7pJ5q9IFKpJkkSfvmgamJGG8Zw4ry2w
	Cel9weXmdpk/j0SkSSc3bfYCR4uJOPGrYINk8unSM55OvVG19mZL2qrLSNFJkLs8IP+LWxcHt0l
	tbOFB0pVMRbB/KJZX4MUhKympqpTLYFM0V/lpghOUbaV6upaHRHymxNmY3m6vRVkJWV0lXkPyoo
	A33l5SB3TNExsnf7+1srwBSXx1C4w0m05JES52IZfQMRGe2FvjkhTJIJjhiFjOxxqgt4buXkyB+
	9DbgQJmbrLxBmH+lzkzCrBmTMeik9GOIy4EBGC93g+Dh2IWrdWkHAnQfXiTJA5HjKIQgP1WC7SF
	D5oZengJ1tXl0pbwytZfrSc9+gGKiOL8hbA4NfbmXZmj6bMSfsPoFn6kOI7UmcxopBDp/CYC/up
	9OcqIqmuOgTWGkGR4d2njlg1zcKe5gJiREsmMY5wV+f0grgmdP6ANYd67lCkb5trIyJQGtnnGpN
	SPF5bX78YKys1GK3h8mZMJkFlGWg0oTcVium0vsakjbBHUcqsyibWtAK/bJ5FbLbd+0TrhtaJRm
	/GoGXVu1RjNoe8Q6ofKmaYwj3Wa1/ZQxnpsYedrq9Xo2O24UKcN6Ymvml5/vMODDx82lvHHM1Ks
	PM4ADMvj8UXH8RgUYPwsucTEdLflptc4sMHVth
X-Received: by 2002:a05:600d:82e1:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4b6e0cf4464mr101136445e9.34.1794048456657;
        Sat, 07 Nov 2026 02:47:36 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b795024730sm47935635e9.4.2026.11.07.02.47.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 02:47:36 -0800 (PST)
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
Subject: [PATCH v2 1/3] media: videobuf2: add opt-in DMA-BUF CPU access
Date: Sat,  7 Nov 2026 11:47:01 +0100
Message-Id: <20261107104703.44111-2-kmehltretter@gmail.com>
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

Drivers that transfer buffer contents with the CPU must bracket access to
imported DMA-BUFs with dma_buf_begin_cpu_access() and
dma_buf_end_cpu_access().

Add a uses_cpu_access queue flag for vb2-vmalloc queues to bracket the
interval from buf_prepare() through buf_finish(), using read access for
output queues and write access for capture queues.

Keep this opt-in because some vb2-vmalloc drivers pass imported buffers to
hardware, and end access in process context because DMA-BUF callbacks may
sleep and return errors.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
v2:
- Scope uses_cpu_access to vb2-vmalloc queues and drop the attach_dmabuf
  dma_dir parameter from vb2_mem_ops and the allocators (Tomasz Figa).
- Call __vb2_buf_end_cpu_access() from __vb2_buf_cancel() (Tomasz Figa).

 .../media/common/videobuf2/videobuf2-core.c   | 76 +++++++++++++++++++
 include/media/videobuf2-core.h                |  5 ++
 2 files changed, 81 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 29e539ee002e..6c32d3cccb93 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -371,6 +371,65 @@ static void __vb2_buf_mem_finish(struct vb2_buffer *vb)
 		call_void_memop(vb, finish, vb->planes[plane].mem_priv);
 }
 
+/* Output buffers are read by the driver; capture buffers are written. */
+static enum dma_data_direction vb2_cpu_access_dir(const struct vb2_queue *q)
+{
+	return q->is_output ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
+}
+
+static bool __vb2_dmabuf_is_duplicate(const struct vb2_buffer *vb,
+				      unsigned int plane)
+{
+	unsigned int i;
+
+	for (i = 0; i < plane; i++)
+		if (vb->planes[i].dbuf == vb->planes[plane].dbuf)
+			return true;
+
+	return false;
+}
+
+static void __vb2_buf_end_cpu_access(struct vb2_buffer *vb,
+				     unsigned int num_planes)
+{
+	struct vb2_queue *q = vb->vb2_queue;
+	enum dma_data_direction dir = vb2_cpu_access_dir(q);
+	unsigned int plane;
+
+	for (plane = 0; plane < num_planes; plane++) {
+		int ret;
+
+		if (__vb2_dmabuf_is_duplicate(vb, plane))
+			continue;
+
+		ret = dma_buf_end_cpu_access(vb->planes[plane].dbuf, dir);
+		if (ret)
+			pr_warn_ratelimited("[%s] failed to end CPU access to dmabuf plane %u: %d\n",
+					    q->name, plane, ret);
+	}
+}
+
+static int __vb2_buf_begin_cpu_access(struct vb2_buffer *vb)
+{
+	struct vb2_queue *q = vb->vb2_queue;
+	enum dma_data_direction dir = vb2_cpu_access_dir(q);
+	unsigned int plane;
+	int ret;
+
+	for (plane = 0; plane < vb->num_planes; plane++) {
+		if (__vb2_dmabuf_is_duplicate(vb, plane))
+			continue;
+
+		ret = dma_buf_begin_cpu_access(vb->planes[plane].dbuf, dir);
+		if (ret) {
+			__vb2_buf_end_cpu_access(vb, plane);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 /*
  * __setup_offsets() - setup unique offsets ("cookies") for every plane in
  * the buffer.
@@ -1504,9 +1563,21 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 		}
 	}
 
+	if (q->uses_cpu_access) {
+		ret = __vb2_buf_begin_cpu_access(vb);
+		if (ret) {
+			dprintk(q, 1, "failed to begin CPU access to dmabuf: %d\n",
+				ret);
+			call_void_vb_qop(vb, buf_cleanup, vb);
+			goto err_put_vb2_buf;
+		}
+	}
+
 	ret = call_vb_qop(vb, buf_prepare, vb);
 	if (ret) {
 		dprintk(q, 1, "buffer preparation failed\n");
+		if (q->uses_cpu_access)
+			__vb2_buf_end_cpu_access(vb, vb->num_planes);
 		call_void_vb_qop(vb, buf_cleanup, vb);
 		goto err_put_vb2_buf;
 	}
@@ -1720,6 +1791,7 @@ EXPORT_SYMBOL_GPL(vb2_core_prepare_buf);
 static void __vb2_buf_cancel(struct vb2_buffer *vb)
 {
 	struct media_request *req = vb->req_obj.req;
+	struct vb2_queue *q = vb->vb2_queue;
 
 	/*
 	 * If a request is associated with this buffer, then
@@ -1743,6 +1815,8 @@ static void __vb2_buf_cancel(struct vb2_buffer *vb)
 
 	if (vb->prepared) {
 		call_void_vb_qop(vb, buf_finish, vb);
+		if (q->memory == VB2_MEMORY_DMABUF && q->uses_cpu_access)
+			__vb2_buf_end_cpu_access(vb, vb->num_planes);
 		vb->prepared = 0;
 	}
 	__vb2_dqbuf(vb);
@@ -2191,6 +2265,8 @@ int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
 	}
 
 	call_void_vb_qop(vb, buf_finish, vb);
+	if (q->memory == VB2_MEMORY_DMABUF && q->uses_cpu_access)
+		__vb2_buf_end_cpu_access(vb, vb->num_planes);
 	vb->prepared = 0;
 
 	if (pindex)
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 4b4f4c15c53a..bbcdd8c8989a 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -510,6 +510,10 @@ struct vb2_buf_ops {
  *		->finish().
  * @non_coherent_mem: when set queue will attempt to allocate buffers using
  *		non-coherent memory.
+ * @uses_cpu_access: the driver transfers buffer data with the CPU instead of
+ *		DMA. For imported dma-bufs on vb2-vmalloc queues, videobuf2
+ *		brackets the interval from buf_prepare through buf_finish with
+ *		dma_buf_begin_cpu_access() and dma_buf_end_cpu_access().
  * @lock:	pointer to a mutex that protects the &struct vb2_queue. The
  *		driver must set this to a mutex to let the v4l2 core serialize
  *		the queuing ioctls. This lock is used when waiting for a new
@@ -614,6 +618,7 @@ struct vb2_queue {
 	unsigned int			uses_requests:1;
 	unsigned int			allow_cache_hints:1;
 	unsigned int			non_coherent_mem:1;
+	unsigned int			uses_cpu_access:1;
 
 	struct mutex			*lock;
 	void				*owner;
-- 
2.39.5 (Apple Git-154)

