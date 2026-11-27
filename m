Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799780;
	b=Np9mtll3x23mPKDvqlI+FQk62Tij8zlz1gVDJlY4bM/mSgKpmqq0KiBpYsZyaa6w9hi+
	 jd2yFbNTTbX888MJ8/8DXX27xISy6L5drdhRkgXy3hVz++7dCF89IMelb7AFoU5+hbP0J
	 atnfjoTo3+75KRVqYgIJtIKKNlcipn+/2BFDFRyiFfNPFvd0kUSDEy1UYNuj3O87xSorW
	 k1hfeKUu3p2HQmVkMtdvvZOM8UnLkFOT87HSV/58XIn4UrwKwlVvLRw6+j7pQlo1UtKMo
	 vkKKnceQEoQ6ZMUuSHRG7YJfLdBBs7OrlNkORXD2vaR/Y7WYqYGIbOECwtABuYqSxbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799780;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=B/rEg0Za72Pp0YQP56jniNYzT7A+3J4Fgs1ZEi5m/Cw=;
	b=FLMzsIf5km6HN0HR9ovIix+yRobW1RFosVH1va8s9V1nS9KmBiOotj56jGMsFmTmNiEI
	 AxBVO89Dc/g1dKJyN40w+/WLkrd51QV4isDKmm4PfFW8FKbamvH/RK/7aq++Syy/4iefm
	 mvV3nxuvypHtj/oDLJVCI2OANe1KZyVdoimBoUCBHDabe9VNUnAE4Q3I74wOI8L+pTVXg
	 31ZSTd5Dea9XqyJFpay3mMx6cklE64c90dD1joejiqUo2hT3TQuqLgO0TyDIFxOq+X4we
	 W4YQjAtETyNYJ7N70b+s1nueO8izyoGEeDxMj+uZE5fbNKGf/UTvEKQF0mnAyUIAR7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ZrIWX9iw;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ED5606A32E;
	Fri, 27 Nov 2026 17:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1ED5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ZrIWX9iw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795799778;
	bh=idIgV+7tvauWwuR9aNK9l0x31bYW+ojCWNoZupgFUY8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZrIWX9iwgreJ25rPpRJtGbowBJZ8rrIVajwUowv8npKYjS+674LV2qxFoiiryN3ZT
	 P3Wmo3J9bGTqIJcBwjgDo/pxegM/FF/qwXGutyu3tuv8kCCxe7TUgbr9wB8R2tldno
	 X28EDHORFifMlVBF2bOVjLgmNgMaiIxMvVT8a09nkBaEuHvcDL2d01mLvsaYqBHmw6
	 3V7NEoTCeS5QG4uKxqEeinDLfNr0ZzMCqsFu75IhvrMth2ZKiL2vLU0rHRv04RTMA+
	 HCEvvGVhQ0v2BVpOrzYlx5tNsGMuYeUH+XPDNTEuOLrGilcE8h73OHoXel69S+lbAf
	 whLwn7C+0KnAg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4780917E0883;
	Fri, 27 Nov 2026 18:16:16 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Fri, 27 Nov 2026 12:16:11 -0500
Subject: [PATCH v2 2/4] media: Store v4l2_fh in the vb_queue
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
Message-Id: <20261127-v4l2-add-mem-tracker-v2-2-73b0494260e7@collabora.com>
References: <20261127-v4l2-add-mem-tracker-v2-0-73b0494260e7@collabora.com>
In-Reply-To: <20261127-v4l2-add-mem-tracker-v2-0-73b0494260e7@collabora.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2

To be able to show the fd in the debug fs, add the v4l2_fh pointer to the
queue so that vb2 allocations can retrieve it.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/common/videobuf2/videobuf2-dma-contig.c |  1 +
 drivers/media/v4l2-core/v4l2-allocator.c              | 16 +++++++++++-----
 include/media/v4l2-allocator.h                        |  2 +-
 include/media/videobuf2-core.h                        |  1 +
 4 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index b6b7ddc96b9c..30e136dd02b7 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -205,6 +205,7 @@ static int vb2_dc_alloc_coherent(struct vb2_dc_buf *buf)
 					   &buf->dma_addr,
 					   GFP_KERNEL | q->gfp_flags,
 					   buf->attrs,
+					   q->v4l2_fh,
 					   name);
 	if (!buf->cookie)
 		return -ENOMEM;
diff --git a/drivers/media/v4l2-core/v4l2-allocator.c b/drivers/media/v4l2-core/v4l2-allocator.c
index d600e0591501..c373a9947d81 100644
--- a/drivers/media/v4l2-core/v4l2-allocator.c
+++ b/drivers/media/v4l2-core/v4l2-allocator.c
@@ -109,8 +109,8 @@ void v4l2_allocator_cleanup(struct v4l2_device *v4l2_dev)
 }
 EXPORT_SYMBOL_GPL(v4l2_allocator_cleanup);
 
-static int v4l2_allocator_add(struct v4l2_device *v4l2_dev, size_t size,
-			      dma_addr_t dma_addr, const char *name)
+static int v4l2_allocator_add(struct v4l2_device *v4l2_dev, size_t size, dma_addr_t dma_addr,
+			      struct v4l2_fh *fh, const char *name)
 {
 	struct v4l2_allocator *allocator = v4l2_dev->v4l2_allocator;
 	struct v4l2_allocator_entry *entry;
@@ -126,7 +126,13 @@ static int v4l2_allocator_add(struct v4l2_device *v4l2_dev, size_t size,
 	entry->dma_addr = dma_addr;
 	strscpy(entry->name, name, sizeof(entry->name));
 	get_task_comm(entry->creator, current->group_leader);
-	entry->tgid = current->tgid;
+	if (fh) {
+		entry->fd = fh->fd;
+		entry->tgid = fh->tgid;
+	} else {
+		entry->fd = 0;
+		entry->tgid = current->tgid;
+	}
 
 	mutex_lock(&allocator->lock);
 	list_add(&entry->list, &allocator->list);
@@ -157,12 +163,12 @@ static void v4l2_allocator_remove(struct v4l2_device *v4l2_dev, size_t size, dma
 
 void *v4l2_dma_alloc_attrs(struct v4l2_device *v4l2_dev, struct device *dev,
 			   size_t size, dma_addr_t *dma_handle,
-			   gfp_t flag, unsigned long attrs, const char *name)
+			   gfp_t flag, unsigned long attrs, struct v4l2_fh *fh, const char *name)
 {
 	void *ret = dma_alloc_attrs(dev, size, dma_handle, flag, attrs);
 
 	if (ret && v4l2_dev)
-		v4l2_allocator_add(v4l2_dev, size, *dma_handle, name);
+		v4l2_allocator_add(v4l2_dev, size, *dma_handle, fh, name);
 
 	return ret;
 }
diff --git a/include/media/v4l2-allocator.h b/include/media/v4l2-allocator.h
index f3fe0da10321..cdf0569bea0a 100644
--- a/include/media/v4l2-allocator.h
+++ b/include/media/v4l2-allocator.h
@@ -19,7 +19,7 @@ void v4l2_allocator_cleanup(struct v4l2_device *v4l2_dev);
 
 void *v4l2_dma_alloc_attrs(struct v4l2_device *v4l2_dev, struct device *dev,
 			   size_t size, dma_addr_t *dma_handle,
-			   gfp_t flag, unsigned long attrs, const char *name);
+			   gfp_t flag, unsigned long attrs, struct v4l2_fh *fh, const char *name);
 
 void v4l2_dma_free_attrs(struct v4l2_device *v4l2_dev, struct device *dev,
 			 size_t size, void *cpu_addr,
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index dc5572cf41c8..5d3bd393d145 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -606,6 +606,7 @@ struct vb2_queue {
 	unsigned int			io_modes;
 	struct device			*dev;
 	struct v4l2_device		*v4l2_dev;
+	struct v4l2_fh			*v4l2_fh;
 	unsigned long			dma_attrs;
 	unsigned int			bidirectional:1;
 	unsigned int			fileio_read_once:1;

-- 
2.56.1

