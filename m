Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025330;
	b=olcV0xzhQeFxSJc1Zb++frUT6hEQqhFdfeRj1YE57Ki29w6MyQ6ZuN+SiSsfOrTYfeDu
	 mKu7eqtez+s0NW6OCDTZ+jeEZ1cvpukPhVl6r9HNBH8z4P7opw01caELw5ZBSeIhv83l3
	 gOUJQ5DD17XmzzPQWiaSRPtHl2gvAMT6HI4pme3UlPXMkEYnP1k4rVMDlDR0IyCC+h0n1
	 W2vvrgXtSajyUKzF1ko2prMp1NIUnvFdk9WvFDd4dWoNZealPtQ9J4lvN1x4KBYc28Yih
	 tqpG1mLZdP/wZTvSWr4NFua13mcF1rumdOLfdNaRYAfNmhIhDTH2oW3qmOXdyegUPDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025330;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=iSurMTjjXMqIbAPmYlacWsBpDjoN1amWMKgaBaCdTD0=;
	b=ezntgn3SBYlfjcI+xjbrX+h1a8gIgd9aJfZtOiuB/qAoMGuHnmDGINNNlx8JCkIM/I+8
	 mWwlXzU20+4q+CFF0jixXSAZRgFRQ587ctDfT1cNT8+DqDKJ1ImgdXbNioXHkovlHQZtm
	 k16qAG4At0EDXW/RPGdhckWRmDjhbDheDW0CcUq4nPwwflGDROVoGqW7ovbgJpiYZpL2M
	 rxJgQ0fpx/QGKiI8c+FWCmKG/f7SmzisOb00t8rR8gA5fNv3EsSc27sabcXfvz3tXMoQO
	 hpeydTQApLfMX0lOhItkS4RGpnaCynyQbz6U9kIqa2t5KkIkYUgOn8mVMP5TqCoSINg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=qCB8Ahfo;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB76606A31C;
	Wed, 18 Nov 2026 18:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BB76606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=qCB8Ahfo
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDD4034;
	Wed, 18 Nov 2026 19:06:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795025179;
	bh=0qrNB/5Q37mChnTV04xfvUY+Y5wzyUabCqTpoOedSQw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qCB8Ahfomj0dOdTAIp519A7vGG6G9nxFObzFa16uc1CPdykGz6m0/F7VEtnlrFRum
	 NIbZtmKLJPA6sgMokUHJMPRDtLkUA6MvGL8F+bjrPyhb3ZA70+IOxuHTjrIZB0way2
	 kpz7TKRTYCeFlxvsg0GH90kvKE7RTUNfhVO4YQHA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 18 Nov 2026 23:38:15 +0530
Subject: [PATCH v7 2/5] media: videobuf2: Allow exporting of a struct
 dmabuf
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
Message-Id: <20261118-b4-vchiq-isp-v7-2-b8c81d193abf@ideasonboard.com>
References: <20261118-b4-vchiq-isp-v7-0-b8c81d193abf@ideasonboard.com>
In-Reply-To: <20261118-b4-vchiq-isp-v7-0-b8c81d193abf@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hans@jjverkuil.nl>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4856;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Le5D9sRlLa64/8mx0DNW1ZignBpuaWsmfPP8cdXuoOA=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq/embkE+IivHBgzvAMqF2UHfgRKkKeoYz6VXp0
 Ai9FFnC5k+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCav3pmwAKCRBD3pH5JJpx
 RT18EACUAVixxqJmsoaNqCe9ckJ0j4AKIE1Puu/spvukKlZerkAOwcMF2nOuDCKl2lki0BoKxPR
 kf+BJo6WE7WUtd+H3GDC/11t67rpCuT0Jh/gJjqJ35UQWZoMOquavV/UHCMt8OB16Gklb4nu1Xz
 gW9C7n4H+LsGMINb4xWMDGVKKYOnC4fk7yDRaXmce4b3rg3nyNqU++EggmMv1EP6wvj2f6Uuj5s
 sViV3Ztk1TinJG3yAQfxJIcK9y6L7TfuYpwZwNhW4qgPjsPYS1LDvkaDcsH47XR+s4ibZUerHQB
 Io5izaUQE9VH2VTyWYnzOdQHIRwoGzmmtyN2Ayx7gPn0iSp6Tc251Ep3f4mBoa1pH7ddpps2QZA
 eJ4WH1NwF9OWhdgG07rH55u3e4ZgcIsSrt0TzFA4npouJy2tYjA+dDZHQb+ZZlSnK9/TDAh7PUZ
 OPNrhYJkv+6zCfVqlvfBrvz5z+Dch2uFZdZL5+8i9qZ9fK2cGDk0q0aBUSAry4rSR5lO7XIn4ty
 2wtKoh3/FkevHSBnfHS0eaNeXUJPTMGrntajDq4vGjOBzZuyhGvXfh2PNipEUL+PDxHiJdMNLxh
 OH89ltxvdv1ylzw2dj9znLw5eHiVGQi7wg+bOnjMAGEi1Bv9EB8zQVrqPBJ0/qVcfT2TynXnylU
 X+kxb2ZzN2VGySQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

videobuf2 only allowed exporting a dmabuf as a file descriptor,
but there are instances where having the struct dma_buf is
useful within the kernel.

Split the current implementation into two, one step which
exports a struct dma_buf, and the second which converts that
into an fd.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Tested-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v6:
- None
Changes in v5:
- Update documentation of return type to only ERR_PTR and not NULL
Changes in v4:
- Return a pointer to struct dmabuf instead of passing it as a double
  pointer argument and returning an int for errors (Laurent)
- Document the return type (Paul)
---
 drivers/media/common/videobuf2/videobuf2-core.c | 45 ++++++++++++++++---------
 include/media/videobuf2-core.h                  | 16 +++++++++
 2 files changed, 45 insertions(+), 16 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 5e318165659f..7b99d39d7cb1 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2419,50 +2419,63 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
 	return 0;
 }
 
-int vb2_core_expbuf(struct vb2_queue *q, int *fd, struct vb2_buffer *vb,
-		    unsigned int plane, unsigned int flags)
+struct dma_buf *vb2_core_expbuf_dmabuf(struct vb2_queue *q,
+				       struct vb2_buffer *vb,
+				       unsigned int plane, unsigned int flags)
 {
 	struct vb2_plane *vb_plane;
-	int ret;
-	struct dma_buf *dbuf;
+	struct dma_buf *dmabuf;
 
 	if (q->memory != VB2_MEMORY_MMAP) {
 		dprintk(q, 1, "queue is not currently set up for mmap\n");
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
 	if (!q->mem_ops->get_dmabuf) {
 		dprintk(q, 1, "queue does not support DMA buffer exporting\n");
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
 	if (flags & ~(O_CLOEXEC | O_ACCMODE)) {
-		dprintk(q, 1, "queue does support only O_CLOEXEC and access mode flags\n");
-		return -EINVAL;
+		dprintk(q, 1, "queue supports only O_CLOEXEC and access mode flags\n");
+		return ERR_PTR(-EINVAL);
 	}
 
 	if (plane >= vb->num_planes) {
 		dprintk(q, 1, "buffer plane out of range\n");
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
 	if (vb2_fileio_is_active(q)) {
 		dprintk(q, 1, "expbuf: file io in progress\n");
-		return -EBUSY;
+		return ERR_PTR(-EBUSY);
 	}
 
 	vb_plane = &vb->planes[plane];
 
-	dbuf = call_ptr_memop(get_dmabuf,
-			      vb,
-			      vb_plane->mem_priv,
-			      flags & O_ACCMODE);
-	if (IS_ERR_OR_NULL(dbuf)) {
+	dmabuf = call_ptr_memop(get_dmabuf, vb, vb_plane->mem_priv,
+				flags & O_ACCMODE);
+	if (IS_ERR_OR_NULL(dmabuf)) {
 		dprintk(q, 1, "failed to export buffer %d, plane %d\n",
 			vb->index, plane);
-		return -EINVAL;
+		if (!dmabuf)
+			dmabuf = ERR_PTR(-EINVAL);
 	}
 
+	return dmabuf;
+}
+EXPORT_SYMBOL_GPL(vb2_core_expbuf_dmabuf);
+
+int vb2_core_expbuf(struct vb2_queue *q, int *fd, struct vb2_buffer *vb,
+		    unsigned int plane, unsigned int flags)
+{
+	struct dma_buf *dbuf;
+	int ret;
+
+	dbuf = vb2_core_expbuf_dmabuf(q, vb, plane, flags);
+	if (IS_ERR(dbuf))
+		return PTR_ERR(dbuf);
+
 	ret = dma_buf_fd(dbuf, flags & ~O_ACCMODE);
 	if (ret < 0) {
 		dprintk(q, 3, "buffer %d, plane %d failed to export (%d)\n",
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index feda638d0064..45bfe8a2a12a 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -954,6 +954,22 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type);
  */
 int vb2_core_streamoff(struct vb2_queue *q, unsigned int type);
 
+/**
+ * vb2_core_expbuf_dmabuf() - Export a buffer as a dma_buf structure
+ * @q:		pointer to &struct vb2_queue with videobuf2 queue
+ * @vb:		pointer to &struct vb2_buffer
+ * @plane:	index of the plane to be exported, 0 for single plane queues
+ * @flags:	file flags for newly created file, as defined at
+ *		include/uapi/asm-generic/fcntl.h.
+ *		Currently, the only used flag is %O_CLOEXEC.
+ *		is supported, refer to manual of open syscall for more details.
+ *
+ * Return: returns a pointer to &struct dma_buf on success; an ERR_PTR otherwise.
+ */
+struct dma_buf *vb2_core_expbuf_dmabuf(struct vb2_queue *q,
+				       struct vb2_buffer *vb,
+				       unsigned int plane, unsigned int flags);
+
 /**
  * vb2_core_expbuf() - Export a buffer as a file descriptor.
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.

-- 
2.56.0

