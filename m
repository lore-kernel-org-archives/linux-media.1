Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025324;
	b=YTicN6z46uuR/SkQ/QbmhY2BZrjY37kJxJ1W5rRUGsDgvGIIH1SUfpoTIbgJcalLJ4tG
	 1wmhmmjKI+Nnt6itwQP40UGcO0tlEG5AMQONkzeWdPvaM7jM1Y1tbdzEwzEy17+B2Jvmc
	 DFMgVGvSj8W+yENdS7FNpXNUNFTKmqxZiJqnmBOSgZ9O8bNc8pdErCPWfNAOqSmmejvAZ
	 CAf29uVo0JHXslePgWEeid1R3MxKSU04U2Cgs04TG/e5MyT+sr0YLrzsp4Y/SFgIvaLFD
	 1MLDzq4yf7EbExv5Hvk9wiZYWaycxgH9ia1C6pj4/zz3TKZ9c2wjTyqnAFJx3caIw0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025324;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pvnTky2rr1OVYIEAjOLyue2SPG2gAHzpqmoJhFf34Tw=;
	b=hRcGefioTGTI1aPI/GFvsYb9FnqP/cz5jN1rBBjCKBlbMBXw1Hw9scJ1aXK87nVTzPi4
	 5n2G3nn8RS6BRLwhbvWcPHirKzzWv3IeFDIhjeSE5+ycTE4QJL6SgvUHt8c33zrlWNfpq
	 o/YrSx8d6O2NO2zOm7bBIVUWlC+E6kYe0S9FWXWfqr4AgHRFB8L5gQic4Ebrl9BjK1ICl
	 uqnT+v1yyYHGqmftOnh4IlaHJIMXAb83GUFLzYUv3bZoES7ldphE0U9YZtHsN8PQOqBll
	 CTXhmpK3lJx0urg+8w0NlY8eY/J5VaqXay1VKzgTTl/G1EmRc3V2ng2Hy3IbPK/MDOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=DU2IWKZF;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5260C606A338;
	Wed, 18 Nov 2026 18:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5260C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=DU2IWKZF
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72CFD63C;
	Wed, 18 Nov 2026 19:06:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795025174;
	bh=KYZkWwB2Tv0K0JLJrfyDO8wArdfZxNOZP5A5oLs+kCE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DU2IWKZFPu3nwBFggeKBQWM+amKllfvsEIBP2z3grEgZiq6Eb2TzEL5gGNQ0TqFtv
	 mCW+enU+5N+yrE583ZCXd9AESkA8XDSaFL8+9sIlVJ/tJd23LiFLoW5/OA6rvQQ+fe
	 eFQiDqfNcCnDTKxEuw2s2SsC61477VQpJPuNzr1c=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 18 Nov 2026 23:38:14 +0530
Subject: [PATCH v7 1/5] media: videobuf2-core: Move type check out of
 vb2_core_expbuf()
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
Message-Id: <20261118-b4-vchiq-isp-v7-1-b8c81d193abf@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4563;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=KYZkWwB2Tv0K0JLJrfyDO8wArdfZxNOZP5A5oLs+kCE=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq/ema128AzWzyIap2LY+z87g5oQt9FIOcISUTv
 7rcu3Stp9yJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCav3pmgAKCRBD3pH5JJpx
 RR9WD/9ovR1/r2kpAofHbE1s4dR4RNKGNQR3CJGn5k++PXSMdsCFEsXQ3bMWH3Wv8n8g6mHcTgn
 IS+2E9NATMcxgf0kSlS5Oz9WTx/2o0aBg2raVHvz0GQNHEvwBVFJMDe5/fTslFgJ9KpmBgmyU2J
 S4NKxOa2gMZVj4JM3Mx6yTDdl5MhE6ymtn2V/kEe5MY087kFvj0wKEx0RGu2imTygPMTT021iET
 C7YtFhD9gLDFYMxrl0eBJPl/n+2bY4+TZLz01NS6vb137eTgCooKvByzhm49MD2wMqkEPvYzvk8
 gCyXPCK7EwnZg3qbkwPwkO6+RTE0TsDHqchIJt3o07ps9Buj0DroWEsC0h3hFjgOL/essySNVp+
 R8iLxGOTOI6TvuTmfdtNP1A2I5ZVQG8qpwgzXpiI/iYXGhpFEsWBZBWgfDQFX5QVgBhPySvanDY
 c/1lFXsLjnxwKsoOSxI8a1ArA1oDJJmz2XJ8yaeXwxfJoQ5dtmfW2My01iJD5tb/AIPktTkLk+S
 lc+IZq8MRG/197faOk5JEZYsshw4Ltr0UHNv27LG/O47ctsrQwUNMgTMaF6/RlidK8xEfEqV9hr
 +xZipZ6TsYFaGjTqVhqMDM7bKbmLCC+uQ1zXLoAB+4hiGpNQSHtTx7huIJEr63u03ghEBUzWNI8
 njpkaK7S7CzmrPA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

vb2_core_expbuf() takes the type of the exportbuffer as an argument and
checks if it matches the type of the vb2 queue. Move that check to the
caller (vb2_expbuf).

There is only one other user of this, which is dvb-core, where the check
was anyway redundant as it passed the vb2 queue type instead. So update
it too.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/all/20260910150454.GP1892234%40killaraus.ideasonboard.com
Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Tested-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 9 ++-------
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 8 ++++++--
 drivers/media/dvb-core/dvb_vb2.c                | 3 +--
 include/media/videobuf2-core.h                  | 5 ++---
 4 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index b0a6084f1757..5e318165659f 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2419,8 +2419,8 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
 	return 0;
 }
 
-int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
-		    struct vb2_buffer *vb, unsigned int plane, unsigned int flags)
+int vb2_core_expbuf(struct vb2_queue *q, int *fd, struct vb2_buffer *vb,
+		    unsigned int plane, unsigned int flags)
 {
 	struct vb2_plane *vb_plane;
 	int ret;
@@ -2441,11 +2441,6 @@ int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
 		return -EINVAL;
 	}
 
-	if (type != q->type) {
-		dprintk(q, 1, "invalid buffer type\n");
-		return -EINVAL;
-	}
-
 	if (plane >= vb->num_planes) {
 		dprintk(q, 1, "buffer plane out of range\n");
 		return -EINVAL;
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 5a1ee5eb9c0f..aee1a9244a7b 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -877,14 +877,18 @@ int vb2_expbuf(struct vb2_queue *q, struct v4l2_exportbuffer *eb)
 {
 	struct vb2_buffer *vb;
 
+	if (eb->type != q->type) {
+		dprintk(q, 1, "invalid buffer type\n");
+		return -EINVAL;
+	}
+
 	vb = vb2_get_buffer(q, eb->index);
 	if (!vb) {
 		dprintk(q, 1, "can't find the requested buffer %u\n", eb->index);
 		return -EINVAL;
 	}
 
-	return vb2_core_expbuf(q, &eb->fd, eb->type, vb,
-				eb->plane, eb->flags);
+	return vb2_core_expbuf(q, &eb->fd, vb, eb->plane, eb->flags);
 }
 EXPORT_SYMBOL_GPL(vb2_expbuf);
 
diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
index 672b0efdca21..fe7a6554b30e 100644
--- a/drivers/media/dvb-core/dvb_vb2.c
+++ b/drivers/media/dvb-core/dvb_vb2.c
@@ -357,8 +357,7 @@ int dvb_vb2_expbuf(struct dvb_vb2_ctx *ctx, struct dmx_exportbuffer *exp)
 		return -EINVAL;
 	}
 
-	ret = vb2_core_expbuf(&ctx->vb_q, &exp->fd, q->type, vb2,
-			      0, exp->flags);
+	ret = vb2_core_expbuf(&ctx->vb_q, &exp->fd, vb2, 0, exp->flags);
 	if (ret) {
 		dprintk(1, "[%s] index=%d errno=%d\n", ctx->name,
 			exp->index, ret);
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 4b4f4c15c53a..feda638d0064 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -959,7 +959,6 @@ int vb2_core_streamoff(struct vb2_queue *q, unsigned int type);
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.
  * @fd:		pointer to the file descriptor associated with DMABUF
  *		(set by driver).
- * @type:	buffer type.
  * @vb:		pointer to struct &vb2_buffer.
  * @plane:	index of the plane to be exported, 0 for single plane queues
  * @flags:	file flags for newly created file, as defined at
@@ -973,8 +972,8 @@ int vb2_core_streamoff(struct vb2_queue *q, unsigned int type);
  *
  * Return: returns zero on success; an error code otherwise.
  */
-int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
-		    struct vb2_buffer *vb, unsigned int plane, unsigned int flags);
+int vb2_core_expbuf(struct vb2_queue *q, int *fd, struct vb2_buffer *vb,
+		    unsigned int plane, unsigned int flags);
 
 /**
  * vb2_core_queue_init() - initialize a videobuf2 queue

-- 
2.56.0

