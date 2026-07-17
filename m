Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983913F12E0;
	Fri, 17 Jul 2026 11:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286350; cv=none; b=pyNpVq6R/GHM7DgtJC6M/WJWSUfnqkkRA0W3a4bBzdHGW0FATv1uaSAtIXAnSsiPtPZd7Yg+OLoR9KPUQg72GqR48UmhXCpj7VXEZzZD+FIqEACQk8SEQEw3mnVzcsHShp8kvvhVSFWApILw8PIFIZnVwDRERHodbJA5BmwguvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286350; c=relaxed/simple;
	bh=1k0x5vvJdkhPFqpJFnK1Q8W57LefSILIy6DFEKiBJnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AhGMKv6V8EBXCtErmaEQniGc4Ub4bj2V2f+arwcVuEdP/wQjawfqK108jLyDiuAsU+DykSf4d4N4ObCjhqBEM34Wney6J9D8hA68FZVJ5zTwpggo3KDbQ/G3ZXwX9s6rrscuGcLK3zPevxInvpnQ7knx8EeEq+Y7gOwyeIjhRO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=usb+GSBQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="usb+GSBQ"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F84F130E;
	Fri, 17 Jul 2026 13:04:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784286281;
	bh=1k0x5vvJdkhPFqpJFnK1Q8W57LefSILIy6DFEKiBJnY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=usb+GSBQRjLOdSHpOqHpyshoT/gJlilEBQRig0vED8XSgK1RzI3unm8Hlcdd2ikY3
	 SVUHwtGt5+syz72JOZrRdi2dl1CvOGp5RSMami9YFiH1sNgepNAFMUJQqwtu1xyE/8
	 PB+Uxy7hHtXNZkj6mHCYc9xanTPLWY9al9Ikmn7A=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 17 Jul 2026 16:34:21 +0530
Subject: [PATCH v3 6/9] media: videobuf2: Allow exporting of a struct
 dmabuf
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-vchiq-isp-v3-6-fb8235e15c68@ideasonboard.com>
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
In-Reply-To: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3193;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=jeiBBqRNUidgSJANnOBpxra4dsoT1kB23zv3ycgLa6Y=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqWgxZH4By1iSCcbzZ8Eb/+Gu8ZTEczZn2iaagY
 7Dv/ZhN9+GJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaloMWQAKCRBD3pH5JJpx
 RXM/D/4nO9YwBy+jSplPtVd6ARNvGB3ediG2NFY0O3/T0a6TtmsTqZVlU1owThh0z66qp5rnAu6
 YaATusBsLymcvmRmrOsyWqctx4+ZP5dlHXs031U9GS2Vf7QHNxx7uO3ALCzeMY0HdXS/QAsu917
 ig88oQiIOzKdwhXFW19uKXzy5MkXjFFNM2GVbWV91eIGpi8VEh6PHhy0yBEpCTTX969jGz7u3aK
 Le3o+M/DE+oyW2wmNv0Ev0IS2ZKp6wA/DpHw6fDlTQ2IjoUa9t1qOPvznoXZmqFzYduhgvxsaA9
 H942VznWdtxwKmHZjgkcC8my5PMH5wAgugCNgNHnyJMgeNPu69PGMqpKqsncqlSwkTSaVoUbOYz
 lIPL0jzOCtv8wfYzRfHlJmv2dX9odo/UmPiBEQN78wlyVqqE/w0C3bJjJVuUTQzZoFPoBdaydH+
 GJohNwXFFiJ/F2SCeBIKrZv5A+f9m0IiaG1y5j6WFJzfOggeR9rOPTeOet/PwFYflaVp9rxJyHC
 ciUj14zgGie6asb/Grj8rCeaAyads0T7AqtEpvWeL7if5apCeg3/5QWL9qejWNb6O1OtkDtj9yW
 h1+E5hEgfGKMacqJReCnYdICR4wIPqFpdRe//Yrb4iDfvpCcOdW98ZUA/xTq5weK6yIpULkJ21q
 W6M5vcOBg0fEyzw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

videobuf2 only allowed exporting a dmabuf as a file descriptor,
but there are instances where having the struct dma_buf is
useful within the kernel.

Split the current implementation into two, one step which
exports a struct dma_buf, and the second which converts that
into an fd.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 21 ++++++++++++++++++---
 include/media/videobuf2-core.h                  | 15 +++++++++++++++
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index b0a6084f1757..0e62f3d97194 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2419,11 +2419,11 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
 	return 0;
 }
 
-int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
-		    struct vb2_buffer *vb, unsigned int plane, unsigned int flags)
+int vb2_core_expbuf_dmabuf(struct vb2_queue *q, unsigned int type,
+			   struct vb2_buffer *vb, unsigned int plane,
+			   unsigned int flags, struct dma_buf **dmabuf)
 {
 	struct vb2_plane *vb_plane;
-	int ret;
 	struct dma_buf *dbuf;
 
 	if (q->memory != VB2_MEMORY_MMAP) {
@@ -2468,6 +2468,21 @@ int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
 		return -EINVAL;
 	}
 
+	*dmabuf = dbuf;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vb2_core_expbuf_dmabuf);
+
+int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
+		    struct vb2_buffer *vb, unsigned int plane, unsigned int flags)
+{
+	struct dma_buf *dbuf;
+	int ret;
+
+	ret = vb2_core_expbuf_dmabuf(q, type, vb, plane, flags, &dbuf);
+	if (ret)
+		return ret;
+
 	ret = dma_buf_fd(dbuf, flags & ~O_ACCMODE);
 	if (ret < 0) {
 		dprintk(q, 3, "buffer %d, plane %d failed to export (%d)\n",
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 4b4f4c15c53a..15aeaaeaf8ad 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -954,6 +954,21 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type);
  */
 int vb2_core_streamoff(struct vb2_queue *q, unsigned int type);
 
+/**
+ * vb2_core_expbuf_dmabuf() - Export a buffer as a dma_buf structure
+ * @q:         videobuf2 queue
+ * @type:      buffer type
+ * @index:     id number of the buffer
+ * @plane:     index of the plane to be exported, 0 for single plane queues
+ * @flags:     flags for newly created file, currently only O_CLOEXEC is
+ *             supported, refer to manual of open syscall for more details
+ * @dmabuf:    Returns the dmabuf pointer
+ *
+ */
+int vb2_core_expbuf_dmabuf(struct vb2_queue *q, unsigned int type,
+			   struct vb2_buffer *vb, unsigned int plane,
+			   unsigned int flags, struct dma_buf **dmabuf);
+
 /**
  * vb2_core_expbuf() - Export a buffer as a file descriptor.
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.

-- 
2.54.0

