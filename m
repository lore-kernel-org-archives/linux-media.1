Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823804;
	b=4ov20g6bXstaF7uQA8m++8DcRwO9PAbHOa+ck5arwA3xm7XHbxT90g4+0qv5LAwBqCUz
	 wrh6jgz4tQf+poMc32i8NXyBXrwPHopGbw7sB3Ln1TsvjXbn9m++F2ytPr1D11F/DvcHM
	 XJk8PGxJ+62/7J9CAdeKmYfxvOPvhhHgx0/eEfDdAfeUKrQpKndsSDF6l1O2/Wu/rTrtp
	 iXHEBQ7ANFl+46PVfFV4CK4dJVpWvsUwbF1GbyfocUHg7Sd17yswB7dzoFYnLKtqEIryP
	 brMdyKVy5iYpZ1aRMP7+pGe8le8skv+F2QbOWlUZswLzHA7J+cMgh7Xh1f76YHyvmbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aBaDIUYvApa045EP5EUWzH/DfONwjW0SyQDKAQn1bhg=;
	b=svQsrYBzKU8X8zO+eOZ3VQX66nSXmIUmz5qMzzoRv0B67drkOTumg6zj0gnj9kuFA5DV
	 vN+GMIUY2JjECXtCpIJhQLkBCNy3BU/ai/lJRTJMj2fgNE0StQe4djHOBnnyl8Ty//6/Y
	 1cVwtAoHctLHmZkMXpj/1xqYkTnPg2PBNKghnCsVgwc2DmN7oGsE+Tm3xW5qfv0HKtWCF
	 kbNzw2LKkb3eGXCD42jIbDvSktUiTir0e4OG34IJftso3CG5Jim9qa1Mp/w5tbC4BLhFg
	 nYOxBO5PE3Qm60H5YM1+xKsWx+3xKxbOvnB9sh+GsVpRwh5ovKiRSCw++/B5K1ho87g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A66QhM04;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F19607074F
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 20:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96F19607074F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A66QhM04
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0d63f60bcso16654357b3.3
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 12:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1793823803; x=1794428603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBaDIUYvApa045EP5EUWzH/DfONwjW0SyQDKAQn1bhg=;
        b=A66QhM04t4FenUCvKRhts3PJR61qzN8QlzfKvK4IBROw9wS24YksaUjfEdMBe8FqW+
         wS6Sif4uUh/bEKoDRw22/BJP/CQPyL1+ZrfKS2l8Q037dioQzuwnVYVxMqs8qB1u/0I9
         cEcH26rwUcsw6uLnHl5JQaGJMAMqtxfVr492VK5yTGKML1/z/ytFb95oCdGa+oMKDQ5J
         kkddE7Kq5YvVSAGaP3kE8nTH/Qz423bq8F2ll9ZQYv8P4mWDkh44HEasJtlHWgBlbN78
         8ZGRbfXB3m1pnf1KQlezFPiYSBZ1REzruVAnyu6OYpdQYi+RiHNR/ADuag1/Atn05BXY
         cfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823803; x=1794428603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aBaDIUYvApa045EP5EUWzH/DfONwjW0SyQDKAQn1bhg=;
        b=y1MVYg4c94xiecG9i0g/fzO4Yo9yhu1Wn+qyTx232AoNLxqQh0/tvepUbVs7eafjlb
         wJDNhcxcox2XMBl/NhvQDb1RNwvePk1qQFahPZ1OodvYlhsXcwPirTff9d5HEkUqHMw2
         ueIXNSyBMMyv1VIrB+0mJIVm1xF3MbOQsZzBGkBoHu919qXq6uAn3vdD/xxIQ7jhOME/
         g7nkEpFrn9Pp0bOHHtjAAXN1MXWq7u82aoThL6NKvLTl2+zZHXu3d98Tk7IOcsgabaJ3
         SXFVAH9pa3GDRm4ct/mybqenc0HnspMbKQlZcPcz4nmPntkDxyvduufi7RCmpTgr0F0g
         EUgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRteAR9dt2iIND/wUi4zzrTmL6oieF9MDPJZQKSBa5z+E8lbQhHQTfZ2MjCNbDYWjCsIvRK2M8KFZzAg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+LIb/aQyNFD2miEc4b8/4BpehvpK+V+tJAB3IvX4Z4ApT54KYn
	OY5B+eCvf+og86+bMZBdxpJ0TAh/7ZJT5w5ReblwVLgEAYHDDZ9c4v2WHnEKzk3Wvy8=
X-Gm-Gg: AYBFou1dVLON/QXlAq0vYb4pSqZkB+ZS7apmX7d7UKyTfwqTNvWGo37hpNCrvfIGYe/
	H0DgToXk4Sv7yCwbh5qCAz2dQVVrUdjoKAU4RxMAoQRCqvjJZ5ZqqxoqNRvg0xDLz5r6c+uBH9P
	P8S5/L/zj99UqtvV59NxB+4i+rOck0VX/EN9TrI+5DX3561CM5CKCtMe7Ne5B4rNtWqK+wFzrwD
	Eh88lUYhqoA2vhkKsyaQgz+OSxgCQ+MH8mHCWsM7XsL/w5q7avcpBJjt0XTo2qG11hSYWzf/O59
	5LFk8m2b4tokr9pGhu9WzMli+K/ZYQ4zHMARIpQ52sYEUhqYzdfvx0eZWU8qtnwZ3nuet6RU1Rp
	vbmpRScy88Kz5NKqDpM69gdrJwOjoBNmvZ3zrhYLhkQ5+CUyn5TfjapWC41uPAy8t7/AP6Dx8Pm
	4LSdPuARZ0pixTjB+Cq/dEvsWPAFbKIz+iXBKetUt+kLUlvHNJoOkPrCHlPsPxSj7zEDdxeV1nL
	CJxCmMM3NMoc+JwpriiNB3APNEhlM9P0mIDA6QtUKCvcN8MUyoF9BWqc7z91O3W0RPff0dNkXkS
	nsskQZ2y92Rxm+AK/z4IPX4vagDAb8nQUS32R789uw3J5oL0Ix9N4mn6r3pri5GoNAo78u8DnQN
	em4s=
X-Received: by 2002:a05:690e:400d:b0:679:94f9:5e7c with SMTP id 956f58d0204a3-67bd9cd336dmr3823187d50.69.1793823802601;
        Wed, 04 Nov 2026 12:23:22 -0800 (PST)
Received: from localhost.localdomain ([104.28.244.23])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bf91b6e7dsm1298292d50.13.2026.11.04.12.23.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 12:23:22 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] media: qcom: camss: use contiguous buffers when there is no IOMMU
Date: Wed,  4 Nov 2026 17:23:10 -0300
Message-Id: <20261104202313.72494-2-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
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

The VFE write masters are programmed with a single base address per plane
and then write the whole plane from there. video_buf_init() takes that
address from sg_dma_address() of the first scatterlist entry of a
vb2_dma_sg buffer, which is only correct when the whole buffer is mapped
as one contiguous range in the device address space.

That holds when the CAMSS is behind an IOMMU, but not on SoCs where it is
not, such as MSM8226: there vb2_dma_sg allocates scattered pages, the
write master runs past the first segment and the frame lands in memory
that belongs to someone else, which quickly brings the system down.

When the CAMSS device is not IOMMU mapped, use vb2_dma_contig instead,
which allocates physically contiguous (CMA) buffers and checks that
imported USERPTR/DMABUF buffers are contiguous. Keep vb2_dma_sg when there
is an IOMMU, but refuse a buffer whose DMA segments are not contiguous
instead of handing a partial mapping to the hardware.

Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 drivers/media/platform/qcom/camss/Kconfig     |  1 +
 .../media/platform/qcom/camss/camss-video.c   | 64 +++++++++++++++++--
 2 files changed, 58 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index b51745c94..3d3555b55 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -5,6 +5,7 @@ config VIDEO_QCOM_CAMSS
 	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_DMA_SG
 	select V4L2_FWNODE
 	select GENERIC_PHY
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6f1..2c15546c8 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -7,12 +7,14 @@
  * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
  * Copyright (C) 2015-2018 Linaro Ltd.
  */
+#include <linux/device.h>
 #include <linux/slab.h>
 #include <media/media-entity.h>
 #include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
+#include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-dma-sg.h>
 
 #include "camss-video.h"
@@ -146,6 +148,48 @@ static int video_queue_setup(struct vb2_queue *q,
 	return 0;
 }
 
+/*
+ * The VFE write masters take a single base address per plane and write the
+ * whole plane from there, so every plane must be contiguous in the device
+ * address space. Without an IOMMU the buffers come from vb2_dma_contig, which
+ * guarantees that. With an IOMMU the scatterlist mapping may still be split
+ * in several DMA segments (max_seg_size): accept it only when the segments
+ * follow each other in the IOVA space.
+ */
+static int video_buf_plane_addr(struct camss_video *video,
+				struct vb2_buffer *vb, unsigned int plane,
+				dma_addr_t *addr)
+{
+	struct scatterlist *sg;
+	struct sg_table *sgt;
+	dma_addr_t next;
+	unsigned int i;
+
+	if (video->vb2_q.mem_ops == &vb2_dma_contig_memops) {
+		*addr = vb2_dma_contig_plane_dma_addr(vb, plane);
+		return 0;
+	}
+
+	sgt = vb2_dma_sg_plane_desc(vb, plane);
+	if (!sgt || !sgt->nents)
+		return -EFAULT;
+
+	next = sg_dma_address(sgt->sgl);
+	for_each_sgtable_dma_sg(sgt, sg, i) {
+		if (sg_dma_address(sg) != next) {
+			dev_err(video->camss->dev,
+				"Plane %u is not contiguous in DMA space\n",
+				plane);
+			return -EINVAL;
+		}
+		next += sg_dma_len(sg);
+	}
+
+	*addr = sg_dma_address(sgt->sgl);
+
+	return 0;
+}
+
 static int video_buf_init(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
@@ -154,15 +198,13 @@ static int video_buf_init(struct vb2_buffer *vb)
 						   vb);
 	const struct v4l2_pix_format_mplane *format =
 						&video->active_fmt.fmt.pix_mp;
-	struct sg_table *sgt;
 	unsigned int i;
+	int ret;
 
 	for (i = 0; i < format->num_planes; i++) {
-		sgt = vb2_dma_sg_plane_desc(vb, i);
-		if (!sgt)
-			return -EFAULT;
-
-		buffer->addr[i] = sg_dma_address(sgt->sgl);
+		ret = video_buf_plane_addr(video, vb, i, &buffer->addr[i]);
+		if (ret < 0)
+			return ret;
 	}
 
 	if (format->pixelformat == V4L2_PIX_FMT_NV12 ||
@@ -699,7 +741,15 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 
 	q = &video->vb2_q;
 	q->drv_priv = video;
-	q->mem_ops = &vb2_dma_sg_memops;
+	/*
+	 * Without an IOMMU a scatter-gather buffer is physically scattered and
+	 * the write masters, which only take a base address, would run past
+	 * its first segment. Use physically contiguous (CMA) buffers instead.
+	 */
+	if (device_iommu_mapped(video->camss->dev))
+		q->mem_ops = &vb2_dma_sg_memops;
+	else
+		q->mem_ops = &vb2_dma_contig_memops;
 	q->ops = &msm_video_vb2_q_ops;
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	q->io_modes = VB2_DMABUF | VB2_MMAP | VB2_READ;
-- 
2.43.0

