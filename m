Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102750;
	b=wGptQyJTzM1qkCe4B/cin9p7htEagFFctPaKClApQ1LdjzDT3S3RworfmA9glTro0QqY
	 W6yyYw5rzlZqujw0cXvdEXldEvJIIJUlxX6UilvS0d2+LQLmsnAQJ9GBejUYpciiovYai
	 e3mgLOxwqW3r2nzaKtRj7a0+X4YLdB5dNHkgt3yP5wstMx4lxL6x28G8bdEnFxCc366ts
	 L1m+kgjt6cNstp9YGvSRnk68IFPQtEn57OfSrjSy2rQgapjYWGurMJaJdMlCLrau0iz5H
	 0ZWtfl0KY7iUpuHrBUSVZmprUw6y0V4S4zGYdeWi3UlQDdV32nYoRGaz2U115RO50Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102750;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DMkfFWvTvlt5j+OwcT7u+qF8lC0J7GeEM1qxU0PICks=;
	b=tg/QMJixNl7BuKMdC5UAKdEWKHcv/utLNvpE/R/dNfaB8i1zQKme5kN4Urwq3G81TkhJ
	 LYrK6w8WhwJMzBEWtB7M/5bT5RNTK8milBNJqVYGnOrCGuk9DXwh8Mbg3/+kw703p565E
	 A9zmq2rnYnB9/A16PMzqyfykrctxGFna+1aSyxAFFnPY3gx5yzQ4CM4mMuxeuLX0OOwxS
	 3EBMmOnpNnBdpKAOEZArUzRsHNQEYUKXbvVqaFYViczDcIUw6k5iXCJ8Zkqw6x8QwzuvG
	 ZKjLVjmKhhqIHbbgPeVIdQwOFMeoF+PDq+0OmAIzI5AWhPi+1FHiQ+ZCD4qot8f+vIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gSfN7drb;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C551606D6D8;
	Thu, 19 Nov 2026 15:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C551606D6D8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gSfN7drb
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88DBE1575;
	Thu, 19 Nov 2026 07:39:00 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F24EC3F882;
	Thu, 19 Nov 2026 07:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102743; bh=670bqZWDtPVaHT9oeUzS69fcUrqHRtkRwMEJa8WvIkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gSfN7drbwwc2RBkSqY7To8rX9rfMWQ+4sIJLBz4ubfDBEe7alffK924YjraRXH74u
	 4obDRKdRqGwfJZ/QCHps8mFlxOHE7Chq85l6fQ+LWzL3p9ZntqBz8PyYFlNEyZHlcv
	 o3tlmABVz13PgTqbcToDNKyWgWVYvBfQz8PA3Qgo=
From: Charvi Mehta <charvi.mehta@arm.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Charvi Mehta <charvi.mehta@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Rathinavel Sankaralingam <rath.sankaralingam@arm.com>,
	Shobhit Pandey <shobhit.pandey@arm.com>
Subject: [RFC PATCH 20/28] media: mali-vpu: implement vb2 buffer queue handling
Date: Thu, 19 Nov 2026 15:37:50 +0000
Message-ID: <20261119153758.1426673-21-charvi.mehta@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119153758.1426673-1-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
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

From: Rath Sankaralingam <rath.sankaralingam@arm.com>

Implement the vb2 callbacks needed to initialise, queue and clean up
Mali VPU buffers.

Record each DMA-SG plane in an MMU pages object during buffer
initialisation. When a buffer is queued, copy its timestamp, flags and
per-plane payload information into the driver buffer, add it to the
v4l2-m2m queue and prepare it for firmware submission.

Add helpers to map and unmap buffer planes in the VPU MMU, synchronise
their cache state and configure decoded frame layouts. Defer each buffer
until its port requests streaming and the firmware is running, then submit
deferred buffers when firmware reports RUNNING. Release the per-plane MMU
bookkeeping when vb2 cleans up the buffer.

Signed-off-by: Rath Sankaralingam <rath.sankaralingam@arm.com>
---
 .../platform/arm/mali-vpu/mali-vpu-buffer.c   | 275 ++++++++++++++++++
 .../platform/arm/mali-vpu/mali-vpu-buffer.h   |  74 +++++
 .../platform/arm/mali-vpu/mali-vpu-firmware.c |   4 +-
 .../platform/arm/mali-vpu/mali-vpu-firmware.h |   7 +
 .../platform/arm/mali-vpu/mali-vpu-session.c  | 145 +++++++++
 .../platform/arm/mali-vpu/mali-vpu-session.h  |   6 +
 .../platform/arm/mali-vpu/mali-vpu-vb2.c      |  23 ++
 7 files changed, 532 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c
index 7ace0489996a8..c1df3e2d4eacf 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c
@@ -4,13 +4,44 @@
  */
 
 #include <linux/errno.h>
+#include <media/videobuf2-dma-sg.h>
 
 #include "mali-vpu-buffer.h"
 #include "mali-vpu-session.h"
 
+static int mali_vpu_buffer_alloc_planes(struct mali_vpu_buffer *vpu_buf,
+					struct sg_table **sgt)
+{
+	u32 i;
+	int ret;
+
+	for (i = 0; i < vpu_buf->nplanes; ++i) {
+		struct mali_vpu_buffer_plane *plane = &vpu_buf->planes[i];
+
+		plane->pages = mali_vpu_mmu_alloc_pages_sg(vpu_buf->dev, sgt[i], 0);
+		if (IS_ERR(plane->pages)) {
+			ret = PTR_ERR(plane->pages);
+			goto free_pages;
+		}
+	}
+
+	return 0;
+
+free_pages:
+	while (i--)
+		mali_vpu_mmu_free_pages(vpu_buf->planes[i].pages);
+
+	return ret;
+}
+
 int mali_vpu_vb2_buffer_init(struct vb2_buffer *vb2_buf)
 {
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb2_buf);
+	struct mali_vpu_buffer *vpu_buf = to_mali_vpu_buffer(v4l2_buf);
 	struct mali_vpu_session *sess = vb2_get_drv_priv(vb2_buf->vb2_queue);
+	struct sg_table *sgt[MALI_VPU_BUFFER_MAX_PLANES] = { 0 };
+	u32 i;
+	int ret;
 
 	if (vb2_buf->num_planes > MALI_VPU_BUFFER_MAX_PLANES) {
 		dev_err(sess->vpu_dev->dev,
@@ -19,6 +50,82 @@ int mali_vpu_vb2_buffer_init(struct vb2_buffer *vb2_buf)
 		return -EINVAL;
 	}
 
+	vpu_buf->dev = sess->vpu_dev->dev;
+	vpu_buf->mmu = &sess->mmu;
+	vpu_buf->nplanes = vb2_buf->num_planes;
+	vpu_buf->attr = MALI_VPU_BUF_ATTR_NONE;
+
+	for (i = 0; i < vb2_buf->num_planes; ++i) {
+		sgt[i] = vb2_dma_sg_plane_desc(vb2_buf, i);
+		if (!sgt[i]) {
+			dev_err(sess->vpu_dev->dev,
+				"cannot fetch SG descriptor. vb=%p, plane=%u",
+				vb2_buf, i);
+			return -ENOMEM;
+		}
+	}
+
+	ret = mali_vpu_buffer_alloc_planes(vpu_buf, sgt);
+
+	return ret;
+}
+
+bool mali_vpu_is_buffer_mapped(struct mali_vpu_buffer *vpu_buf)
+{
+	return (vpu_buf->planes[0].pages &&  vpu_buf->planes[0].pages->va);
+}
+
+static size_t mali_vpu_buffer_get_bytesused(struct vb2_buffer *b)
+{
+	size_t size;
+	u32 i;
+
+	for (i = 0, size = 0; i < b->num_planes; i++)
+		size += b->planes[i].bytesused;
+
+	return size;
+}
+
+static void mali_vpu_buffer_update_flags_from_v4l2(struct vb2_buffer *vb2_buf)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb2_buf);
+	struct mali_vpu_buffer *vpu_buf = to_mali_vpu_buffer(v4l2_buf);
+
+	u32 flags = v4l2_buf->flags;
+
+	vpu_buf->flags = 0;
+
+	if (V4L2_TYPE_IS_OUTPUT(vb2_buf->type) && mali_vpu_buffer_get_bytesused(vb2_buf) == 0)
+		flags |= V4L2_BUF_FLAG_LAST;
+
+	if (flags & V4L2_BUF_FLAG_LAST)
+		vpu_buf->flags |= MALI_VPU_BUFFER_EOS;
+}
+
+int mali_vpu_buffer_update_info_from_v4l2(struct vb2_buffer *vb2_buf)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb2_buf);
+	struct mali_vpu_buffer *vpu_buf = to_mali_vpu_buffer(v4l2_buf);
+	u32 offset;
+	u32 i;
+	int ret;
+
+	vpu_buf->user_data = vb2_buf->timestamp;
+	vpu_buf->type = vb2_buf->type;
+
+	for (i = 0; i < vb2_buf->num_planes; i++) {
+		offset = vb2_buf->planes[i].data_offset;
+
+		/* set plane payload size and offset */
+		ret = mali_vpu_buffer_set_plane_payload(vpu_buf, i, vb2_buf->planes[i].bytesused,
+							offset);
+		if (ret)
+			return ret;
+	}
+
+	/* update flags */
+	mali_vpu_buffer_update_flags_from_v4l2(vb2_buf);
+
 	return 0;
 }
 
@@ -49,3 +156,171 @@ int mali_vpu_vb2_buffer_out_validate(struct vb2_buffer *vb2_buf)
 
 	return 0;
 }
+
+static int mali_vpu_buffer_plane_map(struct mali_vpu_buffer *vpu_buf, mali_vpu_mmu_va begin,
+				     mali_vpu_mmu_va end, u32 plane)
+{
+	while (begin < end) {
+		struct mali_vpu_buffer_plane *p = &vpu_buf->planes[plane];
+		int ret;
+
+		ret = mali_vpu_mmu_map_pages(vpu_buf->mmu, begin, p->pages,
+					     MALI_VPU_ATTR_SHARED_RW, MALI_VPU_ACCESS_READ_WRITE);
+		if (!ret) {
+			dev_dbg(vpu_buf->dev,
+				"memory map buffer. buf=%p, plane=%u, va=0x%x, size=%zu.",
+				vpu_buf, plane, p->pages->va,
+				mali_vpu_mmu_size_pages(p->pages));
+			return 0;
+		}
+
+		if (ret != -EAGAIN)
+			return ret;
+
+		begin += SZ_1M;
+	}
+
+	return -ENOMEM;
+}
+
+int mali_vpu_buffer_map(struct mali_vpu_buffer *vpu_buf, mali_vpu_mmu_va begin, mali_vpu_mmu_va end)
+{
+	u32 i;
+	int ret;
+
+	for (i = 0; i < vpu_buf->nplanes; i++) {
+		struct mali_vpu_buffer_plane *plane = &vpu_buf->planes[i];
+
+		if (plane->pages) {
+			ret = mali_vpu_buffer_plane_map(vpu_buf, begin, end, i);
+			if (ret) {
+				mali_vpu_buffer_unmap(vpu_buf);
+				return ret;
+			}
+		}
+	}
+	return 0;
+}
+
+void mali_vpu_buffer_unmap(struct mali_vpu_buffer *vpu_buf)
+{
+	u32 i;
+
+	for (i = 0; i < vpu_buf->nplanes; i++) {
+		struct mali_vpu_buffer_plane *plane = &vpu_buf->planes[i];
+
+		if (plane->pages && plane->pages->va != 0)
+			mali_vpu_mmu_unmap_pages(plane->pages);
+	}
+}
+
+size_t mali_vpu_buffer_plane_size(struct mali_vpu_buffer *vpu_buf, u32 plane)
+{
+	struct vb2_buffer *vb2_buf = &vpu_buf->m2m_buf.vb.vb2_buf;
+
+	if (plane >= vb2_buf->num_planes)
+		return 0;
+
+	return vb2_plane_size(vb2_buf, plane);
+}
+
+int mali_vpu_buffer_sync(struct mali_vpu_buffer *vpu_buf, enum dma_data_direction dir)
+{
+	u32 i;
+	int ret;
+
+	for (i = 0; i < vpu_buf->nplanes; i++) {
+		struct mali_vpu_buffer_plane *plane = &vpu_buf->planes[i];
+
+		if (plane->pages) {
+			ret = mali_vpu_mmu_sync_pages(plane->pages, dir);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+int mali_vpu_buffer_set_plane_payload(struct mali_vpu_buffer *vpu_buf, u32 plane,
+				      u32 bytesused, u32 offset)
+{
+	struct mali_vpu_buffer_plane *p;
+	size_t capacity;
+
+	if (plane >= vpu_buf->nplanes)
+		return -EINVAL;
+
+	capacity = mali_vpu_buffer_plane_size(vpu_buf, plane);
+
+	if (offset > capacity || bytesused > capacity || offset > bytesused) {
+		dev_err(vpu_buf->dev,
+			"invalid plane payload. Plane: %u, capacity: %zu, bytesused=%u, offset=%u.\n",
+			plane, capacity, bytesused, offset);
+		return -EINVAL;
+	}
+
+	p = &vpu_buf->planes[plane];
+
+	p->payload_size = bytesused - offset;
+	p->offset = offset;
+
+	return 0;
+}
+
+int mali_vpu_buffer_set_frame_layout(struct mali_vpu_buffer *vpu_buf)
+{
+	struct vb2_buffer *vb2_buf = &vpu_buf->m2m_buf.vb.vb2_buf;
+	struct mali_vpu_session *sess = vb2_get_drv_priv(vb2_buf->vb2_queue);
+	struct mali_vpu_port *port;
+	struct v4l2_pix_format_mplane *pix_mp;
+	int ret;
+	size_t size;
+	u32 i;
+
+	port = V4L2_TYPE_IS_OUTPUT(vb2_buf->vb2_queue->type) ? &sess->port_src :
+							       &sess->port_dst;
+
+	pix_mp = &port->curr_fmt.fmt.pix_mp;
+
+	if (vpu_buf->nplanes != pix_mp->num_planes)
+		return -EINVAL;
+
+	for (i = 0; i < vpu_buf->nplanes; i++) {
+		struct mali_vpu_buffer_plane *plane = &vpu_buf->planes[i];
+
+		size = pix_mp->plane_fmt[i].sizeimage;
+		plane->stride = pix_mp->plane_fmt[i].bytesperline;
+		plane->offset = 0;
+
+		if (!V4L2_TYPE_IS_OUTPUT(vpu_buf->type)) {
+			ret = mali_vpu_buffer_set_plane_payload(vpu_buf, i, size, 0);
+			if (ret)
+				return ret;
+		}
+
+		if (plane->payload_size != size) {
+			dev_err(vpu_buf->dev,
+				"payload size mismatch. Plane: %u, payload_size: %u, actual: %zu.\n",
+				i, plane->payload_size, size);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+void mali_vpu_vb2_buffer_cleanup(struct vb2_buffer *vb2_buf)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb2_buf);
+	struct mali_vpu_buffer *vpu_buf = to_mali_vpu_buffer(v4l2_buf);
+	u32 i;
+
+	for (i = 0; i < vpu_buf->nplanes; i++) {
+		if (!vpu_buf->planes[i].pages)
+			continue;
+
+		mali_vpu_mmu_free_pages(vpu_buf->planes[i].pages);
+		vpu_buf->planes[i].pages = NULL;
+	}
+}
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.h
index f5d67d48e5921..645dcc775cd2c 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.h
@@ -8,14 +8,88 @@
 
 #include <media/v4l2-mem2mem.h>
 
+#include "mali-vpu-mmu.h"
+
 #define MALI_VPU_BUFFER_MAX_PLANES 3
 
+#define MALI_VPU_BUFFER_EOS                  0x00000001
+
+/**
+ * enum mali_vpu_buffer_attributes - Buffer submission state.
+ * @MALI_VPU_BUF_ATTR_NONE: Buffer is neither deferred nor queued for firmware
+ *                          processing.
+ * @MALI_VPU_BUF_ATTR_DEFERRED: Buffer is held by driver for later submission
+ *                              to firmware.
+ * @MALI_VPU_BUF_ATTR_QUEUED: Buffer has been submitted to firmware and is
+ *                            awaiting its return.
+ */
+enum mali_vpu_buffer_attributes {
+	MALI_VPU_BUF_ATTR_NONE,
+	MALI_VPU_BUF_ATTR_DEFERRED,
+	MALI_VPU_BUF_ATTR_QUEUED
+};
+
+/**
+ * struct mali_vpu_buffer_plane - Plane information.
+ * @pages: MMU pages object.
+ * @payload_size: Number of bytes written to this plane. For a frame buffer this
+ *                value should always match the size of the plane.
+ * @offset: Byte offset from beginning of buffer to first bitstream data.
+ * @stride: Bytes per line for the plane.
+ */
+struct mali_vpu_buffer_plane {
+	struct mali_vpu_mmu_pages *pages;
+	u32 payload_size;
+	u32 offset;
+	u32 stride;
+};
+
+/**
+ * struct mali_vpu_buffer - Buffer descriptor.
+ * @m2m_buf: Embedded v4l2-mem2mem buffer.
+ * @dev: Pointer to device.
+ * @mmu: Pointer to MMU.
+ * @nplanes: Number of planes.
+ * @type: Type of the buffer (output/capture).
+ * @user_data: Userdata(timestamp) to be copied to capture buffer.
+ * @flags: Buffer Flags.
+ * @planes: Array of planes.
+ * @attr: Firmware Queuing Status Attribute.
+ */
 struct mali_vpu_buffer {
 	struct v4l2_m2m_buffer m2m_buf;
+	struct device *dev;
+	struct mali_vpu_mmu *mmu;
+	u32 nplanes;
+	u32 type;
+	u64 user_data;
+	u32 flags;
+	struct mali_vpu_buffer_plane planes[MALI_VPU_BUFFER_MAX_PLANES];
+	enum mali_vpu_buffer_attributes attr;
 };
 
+static inline struct mali_vpu_buffer *to_mali_vpu_buffer(struct vb2_v4l2_buffer *v4l2_buf)
+{
+	struct v4l2_m2m_buffer *m2m_buf = container_of(v4l2_buf, struct v4l2_m2m_buffer, vb);
+
+	return container_of(m2m_buf, struct mali_vpu_buffer, m2m_buf);
+}
+
 int mali_vpu_vb2_buffer_init(struct vb2_buffer *vb2_buf);
 int mali_vpu_vb2_buffer_prepare(struct vb2_buffer *vb2_buf);
 int mali_vpu_vb2_buffer_out_validate(struct vb2_buffer *vb2_buf);
+void mali_vpu_vb2_buffer_cleanup(struct vb2_buffer *vb2_buf);
+
+int mali_vpu_buffer_map(struct mali_vpu_buffer *vpu_buf, mali_vpu_mmu_va begin,
+			mali_vpu_mmu_va end);
+void mali_vpu_buffer_unmap(struct mali_vpu_buffer *vpu_buf);
+int mali_vpu_buffer_sync(struct mali_vpu_buffer *vpu_buf, enum dma_data_direction dir);
+bool mali_vpu_is_buffer_mapped(struct mali_vpu_buffer *vpu_buf);
+
+int mali_vpu_buffer_update_info_from_v4l2(struct vb2_buffer *vb2_buf);
+int mali_vpu_buffer_set_plane_payload(struct mali_vpu_buffer *vpu_buf, u32 plane,
+				      u32 bytesused, u32 offset);
+int mali_vpu_buffer_set_frame_layout(struct mali_vpu_buffer *vpu_buf);
+size_t mali_vpu_buffer_plane_size(struct mali_vpu_buffer *vpu_buf, u32 plane);
 
 #endif /* __MALI_VPU_BUFFER_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
index c11d5c6c0ec5f..820853ca4519a 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
@@ -18,8 +18,8 @@
 #define MALI_VPU_FW_MAX_CORES 8
 #define MALI_VPU_RPC_VA_GRANULE SZ_16M
 
-static int mali_vpu_fw_get_region(enum mali_vpu_fw_region region,
-				  mali_vpu_mmu_va *begin, mali_vpu_mmu_va *end)
+int mali_vpu_fw_get_region(enum mali_vpu_fw_region region,
+			   mali_vpu_mmu_va *begin, mali_vpu_mmu_va *end)
 {
 	switch (region) {
 	case MALI_VPU_FW_REGION_MSG_HOST:
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
index c03a07d994873..5431959befb24 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
@@ -10,6 +10,8 @@
 #include <linux/media/arm/mali-vpu-config.h>
 #include <linux/types.h>
 
+#include "mali-vpu-mmu.h"
+
 #define MALI_VPU_FW_HTABLE_BITS 3
 #define MALI_VPU_FW_TEXT_BASE_ADDR 0x1000u
 
@@ -101,6 +103,7 @@ struct mali_vpu_fw_error {
  * enum mali_vpu_fw_code - Driver representation of firmware messages.
  * @MALI_VPU_FW_CODE_ERROR: Firmware reported fatal error.
  * @MALI_VPU_FW_CODE_JOB: Firmware dequeued a job.
+ * @MALI_VPU_FW_CODE_BUFFER: Send and receive buffer.
  * @MALI_VPU_FW_CODE_PING: Ping request sent to firmware.
  * @MALI_VPU_FW_CODE_PONG: Firmware responded to a ping request.
  * @MALI_VPU_FW_CODE_IDLE: Firmware informs the driver that it's idle.
@@ -115,6 +118,7 @@ struct mali_vpu_fw_error {
 enum mali_vpu_fw_code {
 	MALI_VPU_FW_CODE_ERROR,              /* Driver <- Firmware. */
 	MALI_VPU_FW_CODE_JOB,                /* Driver -> Firmware. */
+	MALI_VPU_FW_CODE_BUFFER,             /* Driver <-> Firmware. */
 	MALI_VPU_FW_CODE_PING,               /* Driver -> Firmware. */
 	MALI_VPU_FW_CODE_PONG,               /* Driver <- Firmware. */
 	MALI_VPU_FW_CODE_IDLE,               /* Driver <- Firmware. */
@@ -138,6 +142,7 @@ struct mali_vpu_fw_msg {
 		enum mali_vpu_fw_state state;
 		struct mali_vpu_fw_job job;
 		struct mali_vpu_fw_error error;
+		struct mali_vpu_buffer *vpu_buf;
 	} data;
 };
 
@@ -246,6 +251,8 @@ int mali_vpu_fw_send_ping(struct mali_vpu_fw *fw);
 int mali_vpu_fw_send_state_change(struct mali_vpu_fw *fw, enum mali_vpu_fw_state state);
 int mali_vpu_fw_send_set_option(struct mali_vpu_fw *fw, struct mali_vpu_fw_set_option *option);
 int mali_vpu_fw_parse_msg(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *msg);
+int mali_vpu_fw_get_region(enum mali_vpu_fw_region region, mali_vpu_mmu_va *begin,
+			   mali_vpu_mmu_va *end);
 int mali_vpu_fw_handle_rpc(struct mali_vpu_fw *fw, bool *flush_mmu);
 
 #endif /* __MALI_VPU_FIRMWARE_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
index 6d22a5d479008..540104bcd38e2 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
@@ -150,6 +150,122 @@ int mali_vpu_session_fw_send_set_option(struct mali_vpu_session *sess,
 	return 0;
 }
 
+static int mali_vpu_buffer_map_fw_region(struct mali_vpu_session *sess,
+					 struct mali_vpu_buffer *vpu_buf)
+{
+	mali_vpu_mmu_va begin, end;
+	enum mali_vpu_fw_region region;
+	enum v4l2_buf_type type;
+	int ret;
+
+	type = vpu_buf->m2m_buf.vb.vb2_buf.type;
+
+	if (mali_vpu_is_coded_q(sess, type))
+		region = MALI_VPU_FW_REGION_PROTECTED;
+	else
+		region = MALI_VPU_FW_REGION_FRAMEBUF;
+
+	ret = mali_vpu_fw_get_region(region, &begin, &end);
+	if (ret)
+		return ret;
+
+	return mali_vpu_buffer_map(vpu_buf, begin, end);
+}
+
+static int mali_vpu_queue_buffer(struct mali_vpu_session *sess, struct mali_vpu_buffer *vpu_buf)
+{
+	int ret;
+	enum dma_data_direction dma_dir;
+
+	dma_dir = (vpu_buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) ?
+		   DMA_TO_DEVICE : DMA_FROM_DEVICE;
+
+	/* Map MMU buffer pages if it is not already mapped */
+	if (!mali_vpu_is_buffer_mapped(vpu_buf)) {
+		ret = mali_vpu_buffer_map_fw_region(sess, vpu_buf);
+		if (ret)
+			return ret;
+	}
+
+	if (!mali_vpu_is_coded_q(sess, vpu_buf->type) && sess->role == MALI_VPU_DECODER) {
+		ret = mali_vpu_buffer_set_frame_layout(vpu_buf);
+		if (ret)
+			return ret;
+	}
+
+	/* dma sync for cache coherency */
+	ret = mali_vpu_buffer_sync(vpu_buf, dma_dir);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int mali_vpu_submit_deferred_bufs_for_queue(struct mali_vpu_session *sess,
+						   enum v4l2_buf_type type)
+{
+	struct v4l2_m2m_buffer *buffer;
+	struct mali_vpu_buffer *vpu_buf;
+	int ret;
+
+	if (!mali_vpu_session_get_port(sess, type)->stream_requested ||
+	    !mali_vpu_session_can_stream(sess) ||
+	    sess->fw_state != MALI_VPU_FW_STATE_RUNNING)
+		return 0;
+
+	if (V4L2_TYPE_IS_OUTPUT(type)) {
+		v4l2_m2m_for_each_src_buf(sess->m2m_ctx, buffer) {
+			vpu_buf = to_mali_vpu_buffer(&buffer->vb);
+			if (vpu_buf->attr != MALI_VPU_BUF_ATTR_DEFERRED)
+				continue;
+
+			ret = mali_vpu_queue_buffer(sess, vpu_buf);
+			if (ret)
+				return ret;
+
+			vpu_buf->attr = MALI_VPU_BUF_ATTR_QUEUED;
+		}
+	} else if (V4L2_TYPE_IS_CAPTURE(type)) {
+		v4l2_m2m_for_each_dst_buf(sess->m2m_ctx, buffer) {
+			vpu_buf = to_mali_vpu_buffer(&buffer->vb);
+			if (vpu_buf->attr != MALI_VPU_BUF_ATTR_DEFERRED)
+				continue;
+
+			ret = mali_vpu_queue_buffer(sess, vpu_buf);
+			if (ret)
+				return ret;
+
+			vpu_buf->attr = MALI_VPU_BUF_ATTR_QUEUED;
+		}
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mali_vpu_submit_deferred_bufs(struct mali_vpu_session *sess)
+{
+	int ret;
+
+	ret = mali_vpu_submit_deferred_bufs_for_queue(sess, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (ret)
+		goto err_submit;
+
+	ret = mali_vpu_submit_deferred_bufs_for_queue(sess,
+						      V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (ret)
+		goto err_submit;
+
+	mali_vpu_sched_send_irq(&sess->sched_sess, &sess->vpu_dev->sched);
+
+	return 0;
+
+err_submit:
+	dev_err(sess->vpu_dev->dev, "failed to queue deferred buffers\n");
+	return ret;
+}
+
 static int mali_vpu_session_sched_activate(struct mali_vpu_session *sess)
 {
 	lockdep_assert_held(&sess->vq_lock);
@@ -180,6 +296,9 @@ static int mali_vpu_session_handle_fw_msg(struct mali_vpu_session *sess,
 		return 0;
 	case MALI_VPU_FW_CODE_STATE_CHANGE:
 		sess->fw_state = fw_msg->data.state;
+
+		if (sess->fw_state == MALI_VPU_FW_STATE_RUNNING)
+			return mali_vpu_submit_deferred_bufs(sess);
 		return 0;
 	case MALI_VPU_FW_CODE_SWITCH_IN:
 		/* Single session policy: the scheduler already tracks the active LSID mapping. */
@@ -390,6 +509,32 @@ static void mali_vpu_session_release_fw_bin(struct mali_vpu_session *sess)
 		sess->fw_bin_state = MALI_VPU_SESSION_FW_BIN_UNINITIALIZED;
 }
 
+int mali_vpu_session_qbuf(struct mali_vpu_session *sess, struct vb2_buffer *vb2_buf)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb2_buf);
+	struct mali_vpu_buffer *vpu_buf = to_mali_vpu_buffer(v4l2_buf);
+	struct mali_vpu_port *port =
+			mali_vpu_session_get_port(sess, vb2_buf->type);
+	int ret;
+
+	if (!port->stream_requested ||
+	    !mali_vpu_session_can_stream(sess) ||
+	    sess->fw_state != MALI_VPU_FW_STATE_RUNNING) {
+		vpu_buf->attr = MALI_VPU_BUF_ATTR_DEFERRED;
+		return 0;
+	}
+
+	ret = mali_vpu_queue_buffer(sess, vpu_buf);
+	if (ret)
+		return ret;
+
+	vpu_buf->attr = MALI_VPU_BUF_ATTR_QUEUED;
+
+	mali_vpu_sched_send_irq(&sess->sched_sess, &sess->vpu_dev->sched);
+
+	return 0;
+}
+
 int mali_vpu_session_cleanup(struct mali_vpu_session *sess)
 {
 	struct mali_vpu_dev *vpu_dev = sess->vpu_dev;
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
index e331965d32fd8..5cabb7844131b 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
@@ -12,6 +12,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fh.h>
 
+#include "mali-vpu-buffer.h"
 #include "mali-vpu-device.h"
 #include "mali-vpu-firmware.h"
 #include "mali-vpu-formats.h"
@@ -52,6 +53,10 @@ struct mali_vpu_port {
  * streaming: OUTPUT for a decoder, both ports for an encoder.
  * Binary READY and firmware RUNNING are separate states.
  *
+ * Buffers received before the firmware confirms RUNNING are deferred. The
+ * RUNNING response submits those buffers. Buffers received afterwards are
+ * submitted directly.
+ *
  * Session cleanup waits for an in-flight callback before releasing the
  * session-owned binary reference and callback event. On timeout, it cancels
  * the pending cache waiter or waits for an already claimed callback.
@@ -128,6 +133,7 @@ int mali_vpu_session_prepare_streaming(struct mali_vpu_session *sess,
 				       enum v4l2_buf_type type);
 int mali_vpu_session_streamoff(struct mali_vpu_session *sess, enum v4l2_buf_type type);
 void mali_vpu_session_irq(struct mali_vpu_session *sess);
+int mali_vpu_session_qbuf(struct mali_vpu_session *sess, struct vb2_buffer *vb2_buf);
 
 static inline struct mali_vpu_session *mali_vpu_get_session(struct file *filp)
 {
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c
index b9f6968e9f13f..41158bf4e0ecb 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vb2.c
@@ -55,8 +55,30 @@ static void mali_vpu_vb2_buffer_queue(struct vb2_buffer *vb2_buf)
 {
 	struct mali_vpu_session *sess = vb2_get_drv_priv(vb2_buf->vb2_queue);
 	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb2_buf);
+	int ret;
+
+	/* Update vb2 metadata and payload info onto mali_vpu_buffer. */
+	ret = mali_vpu_buffer_update_info_from_v4l2(vb2_buf);
+	if (ret)
+		goto err_buf_done;
 
 	v4l2_m2m_buf_queue(sess->m2m_ctx, v4l2_buf);
+
+	ret = mali_vpu_session_qbuf(sess, vb2_buf);
+	if (ret)
+		goto err_m2m_buf_remove;
+
+	return;
+
+err_m2m_buf_remove:
+	if (V4L2_TYPE_IS_OUTPUT(vb2_buf->type))
+		v4l2_m2m_src_buf_remove_by_buf(sess->m2m_ctx, v4l2_buf);
+	else
+		v4l2_m2m_dst_buf_remove_by_buf(sess->m2m_ctx, v4l2_buf);
+
+err_buf_done:
+	v4l2_m2m_buf_done(v4l2_buf, VB2_BUF_STATE_ERROR);
+
 }
 
 static int mali_vpu_vb2_prepare_streaming(struct vb2_queue *q)
@@ -123,6 +145,7 @@ static const struct vb2_ops mali_vpu_vb2_ops = {
 	.buf_init		= mali_vpu_vb2_buffer_init,
 	.buf_prepare		= mali_vpu_vb2_buffer_prepare,
 	.buf_queue		= mali_vpu_vb2_buffer_queue,
+	.buf_cleanup		= mali_vpu_vb2_buffer_cleanup,
 	.prepare_streaming	= mali_vpu_vb2_prepare_streaming,
 	.start_streaming	= mali_vpu_vb2_start_streaming,
 	.stop_streaming		= mali_vpu_vb2_stop_streaming,
-- 
2.43.0

