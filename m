Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635250;
	b=rbnJmWtJP1MtvGlEJ9ULrL2P17AJ314r+5kBLHlnjjSwio0hY9AYWceXO4CJ/ph71TMS
	 LtdWTcScmnTCUC5DV5HQfEp1U5LM6ZGfHUMFVDgEeBJnwdx5MGqDUk3X/UJUty+NeKChX
	 RZtmmLnamb8rJm20zXsSlIvRsr06BujrL/d3HgyiBVGSUTcKwUomUiOzROY/MvhaSncQ1
	 eQJPY/eVCvy0+iWT09Rd4xzlJS52XPDCi7BBfPqUyOZdKqDkxWRoy01Z3jwsTJMTqDWZB
	 hmb3iDzmijJPfeeSFwz6U7uWe/LtItJQU21/VAnnsvdyVL2dBd1Bkl6qq2saIh1M0xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:MIME-Version:X-Received:Date:
	 Message-ID:Subject:From:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qdDzCJX2QhExG4+G0pbTNThq0KYMMur6UF4zTamumCc=;
	b=jSPQBuRl5p9CChzm6ogpCwy9CDttvJazv1LZoj4uVmlDXQT5l8mJBMKXc1J4HOKIqSln
	 MJoyx5+5L/GKvMnWBM/rADqSrLxMaRIILEBS5jTY8SfkA9vx+FuhMUCWwFzUWNW1V6rGQ
	 FtiS6m5VX2S45/ANhC5M4WluE6MGuZYYrJefRTPk0CCRxUp/7x860pyPW+6Exkj+21VK8
	 cxVopeHz3Zla1eX1znvvkJwyTbchpnZsNY1Qa91wFpQvOgQY388i+avhY4DATAORcq6C7
	 MVKl1qR2NQCTEsIkN/Zp2dS4ZS9s2aBmqn/1cU30mESl+IIElhg2EcChRL6HiJ56UOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qFFQDKnE;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A396606A5A0
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 16:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A396606A5A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qFFQDKnE
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso3849213eec.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 08:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793635249; x=1794240049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:date:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qdDzCJX2QhExG4+G0pbTNThq0KYMMur6UF4zTamumCc=;
        b=qFFQDKnEACYBi/9A+xJ8sfJBOdb9zPpciV+Aty3Pmyjsu1rpTFRMOnRGmolTQYXRZL
         4T1ZOaVoDxgk3Jir+Q/yVD0LJcqs1NExuFZp0Ub74OD6YHDdajOjz/pYhx5NCps2SWaP
         IWghm5q+UPpG64+995kOd106ClKx++3oRtR9GzycymmUT4DyYW3DQ6JzNYJ+qSOi2pLY
         N1Qd6w23jh8O+C7u3MbXBtZUI8571tqiZxSZufH0jfhM+itLoiuS56zGv+4db+rv9th9
         KBRgasRrhPcwiD77KRe8T0fYlARekaOyfj9PlPLJJ7DPK/tdSpU76snMnwTfDLzcu1PE
         DUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635249; x=1794240049;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qdDzCJX2QhExG4+G0pbTNThq0KYMMur6UF4zTamumCc=;
        b=bCDe4Bk3L+7xF7jPWca6Gx5sdB+pPNRip9nzAbQSNgb2t82G6xVc90Q+Q7vWhIeI0b
         jeLh7dsQa+7a7vEYY38mL7HZtUFiBqxg01drCJHNI4/c0NKilwnRhwCFCjxqXeETVUrF
         JOLy5vg5sN5iTgHm7JSZBIujnb9Gn9NxXIDmnUnS7rI27Kwb9kji9CkEyWLODzh50IqS
         EY8jUayPS1PtG47E33VMolKrOqHodhUdtyNOzx2+vbsAwGE9tcFcuJc0gzU6Td69BQe2
         E81UuQ9H7ElhPzzKNEeyqmhjpJaqMgvLUBUVcTH8NGYHCfPlskx3hNsDUIS1QE+V/wAj
         X9Pw==
X-Forwarded-Encrypted: i=1; AKwUvByw4LNVIdjvLCLxP0jcPjseopPpWnl+/7Rr7IkRuXI0sA1jaCdcUtc+ZCrL7z1OYCCVj4za+f/qVhO1CQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ntb4gnUXoedyO55Zfywm3Re5D/AqS2gxk6svv//DJTOgTLeTd
	SSgLwZjKxv659ubcKYcmHwbK/QUkcIH9Y0sb4xR14wKjw5CFm304uZENzMp1GlAnUJyHhVpS9xL
	Ikt8iGgwcHFX31aCEPK1f4HYJdewa1A==
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: from dyhb15.prod.google.com ([2002:a05:7300:148f:b0:368:927a:cdaf])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:3a95:b0:36a:12c4:8bdd with SMTP id 5a478bee46e88-36a42389979mr18350254eec.21.1793635248187;
 Mon, 02 Nov 2026 08:00:48 -0800 (PST)
Date: Mon, 02 Nov 2026 16:00:47 GMT
Message-ID: <18e445c150434665.3137322e32332e3235332e313736.109a67.0000sendgmr@google.com>
Subject: [PATCH] dma-buf: Reject private mappings in dma_buf_mmap_internal()
 and dma_buf_mmap()
From: Chris Wiseman <chriswiseman@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"T.J. Mercier" <tjmercier@google.com>, John Stultz <jstultz@google.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	Philipp Stanner <phasta@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

DMA-BUF mappings do not support copy-on-write.  Mapping a dma-buf with
MAP_PRIVATE and PROT_WRITE faults into do_wp_page() -> wp_page_copy()
and allocates private anonymous pages whose writes never reach the
underlying buffer.

Individual exporters like cma_heap_mmap(), system_heap_mmap(), and
mmap_udmabuf() already require (VM_SHARED | VM_MAYSHARE), and DRM
helpers like ttm_bo_mmap_obj() and drm_gem_shmem_object_mmap() reject
vma_is_cow_mapping(vma).  However, dma_buf_mmap_internal() and
dma_buf_mmap() do not check for this and pass MAP_PRIVATE mappings
straight through to dmabuf->ops->mmap().

Reject mappings with -EINVAL in both dma_buf_mmap_internal() and
dma_buf_mmap() when neither VM_SHARED nor VM_MAYSHARE is set.  Checking
both flags still allows read-only MAP_SHARED mappings, where do_mmap()
clears VM_SHARED and leaves VM_MAYSHARE set.

Suggested-by: T.J. Mercier <tjmercier@google.com>
Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Signed-off-by: Chris Wiseman <chriswiseman@google.com>
---
Note: For the prior discussion Christian mentioned, commit f91142c62161
("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3") added the
vma_is_cow_mapping() check in TTM, and commit fa5239f2af98
("drm/amdgpu: workaround failed COW checks for Thunk VMAs") worked
around a legacy ROCm KFD Thunk PROT_NONE, MAP_PRIVATE mapping on native
amdgpu GEM nodes.

Tested in ARM64 QEMU (Linux 7.3.0+) across /dev/dma_heap/system:

  BASE:
    [CASE 1: MAP_SHARED O_RDWR]     ret=3D0   buf[0]=3D0x00000000cafebabe
    [CASE 2: MAP_SHARED O_RDONLY]   ret=3D0
    [CASE 3: MAP_PRIVATE PROT_RDWR] ret=3D0   underlying_buf[0]=3D0x0000000=
0cafebabe
    [CASE 4: MAP_PRIVATE PROT_READ] ret=3D0
    [CASE 5: MAP_PRIVATE PROT_NONE] ret=3D0

  PATCHED:
    [CASE 1: MAP_SHARED O_RDWR]     ret=3D0   buf[0]=3D0x00000000cafebabe
    [CASE 2: MAP_SHARED O_RDONLY]   ret=3D0
    [CASE 3: MAP_PRIVATE PROT_RDWR] ret=3D-22 (-EINVAL)
    [CASE 4: MAP_PRIVATE PROT_READ] ret=3D-22 (-EINVAL)
    [CASE 5: MAP_PRIVATE PROT_NONE] ret=3D-22 (-EINVAL)

 drivers/dma-buf/dma-buf.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 1ccaffabbdbe..51e9a4dc56be 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -235,6 +235,10 @@ static int dma_buf_mmap_internal(struct file *file, st=
ruct vm_area_struct *vma)
 	if (!dmabuf->ops->mmap)
 		return -EINVAL;
=20
+	/* check for private mappings */
+	if (!(vma->vm_flags & (VM_SHARED | VM_MAYSHARE)))
+		return -EINVAL;
+
 	/* check for overflowing the buffer's size */
 	if (vma->vm_pgoff + vma_pages(vma) >
 	    dmabuf->size >> PAGE_SHIFT)
@@ -1610,6 +1614,10 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_a=
rea_struct *vma,
 	if (!dmabuf->ops->mmap)
 		return -EINVAL;
=20
+	/* check for private mappings */
+	if (!(vma->vm_flags & (VM_SHARED | VM_MAYSHARE)))
+		return -EINVAL;
+
 	/* check for offset overflow */
 	if (pgoff + vma_pages(vma) < pgoff)
 		return -EOVERFLOW;
--=20
2.51.0
