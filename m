Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102753;
	b=JTtCels7zn7gSaRXxdIqvCs/lsy05JM48HykacQrwSyWrpLXNvozZ8iqzl9LF8CjHL1W
	 mzmDwg+kXMfYP4Gtz4qNpNHcy0Za7y5jmdPOyho2bYMWkjis2kHvkWZR+5KUUN6bn638C
	 Eck1P4NwfnA92Qnn3wspxXa2ipKorKk3wFaVu5A3oH0IMFvT+TSp8Dy4GNbHZciICwKMi
	 SS6aqhmRTkrjiKaq4yA2Lr9fQi9k7pV8wOEstgel4/tafbnZ1CHrfsNHn401RFGPsUwVv
	 5B6nJqDtTtqOB77dGxwZ/zVHaf1UPg3US+3xR7zeeNlZfNFgI/ktb0h2RWohkZKn6SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102753;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cctwhphWimSn+UeKB7SnitnMafO7A3vfy/iXoCfm8rY=;
	b=X92R4vktwwKTJ9YpHiP11CVcCIOPwZEIVq7kqH/vJRIB0/tbnRqgTfyFroKf7GseudDH
	 CjcMTCrIOvYYWHfgq0/jCBpIuq5buRFarXnSbvCfbsXdtXmwellpP3XJNQfGGcFWUHb6s
	 TYgapHASl0F0V4OvP9dGi8SSyzItRMr1zH71jKw4DqCUNPRgDP0RCxGv3MchkyHPacyu2
	 7N0B23odhdfGuDZUtqVEOJ3W4lA+nDJyD3ouvxgvRjTLqsIk5BUEiVz2fC+Imcq/ZrXvt
	 7cpCR/rKK396r9rsd6IUsX4h8ptY/jkVRnOE1ovTaM/n3fnLy8CvOmixRZGqiz06v8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Re4xoUxO;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C26606D6F2;
	Thu, 19 Nov 2026 15:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C26606D6F2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Re4xoUxO
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 563631C00;
	Thu, 19 Nov 2026 07:39:02 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFA563F882;
	Thu, 19 Nov 2026 07:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102745; bh=s8/W83tRnscteSjDJu0Yk8U+bRcLRUKJ6xEKoht1PqI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Re4xoUxO2gf2PnUIEwSeBT0NivMGpN793W9t0lBNJwPTmTLN9ulpVDqZJMn1DF1yK
	 qZHwhdJFgDsppbYIbJTUAvQTPviQBa65en1g7KRwsFNc/TG1sT2gwmqqfXdJMkj7++
	 bxneuJ/+8c02+uQ9E3nH5ZfOoT6nsGjQOIgW8SzU=
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
Subject: [RFC PATCH 21/28] media: mali-vpu: handle firmware buffer exchange
Date: Thu, 19 Nov 2026 15:37:51 +0000
Message-ID: <20261119153758.1426673-22-charvi.mehta@arm.com>
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

Send queued bitstream and frame buffers to firmware using the v3 buffer
protocol. Populate the buffer descriptors with firmware-visible plane
addresses, allocation and payload sizes, strides, frame dimensions,
formats, flags and user data as appropriate for each buffer type.

Handle input and output buffer responses from firmware. Recover the
associated driver buffer, propagate returned user data, dimensions and
status flags to V4L2, synchronize capture buffers for the CPU, and
complete the corresponding v4l2-m2m buffer with the appropriate vb2
state.

Use non-zero buffer IDs to associate firmware responses with tracked
in-flight buffers.

Signed-off-by: Rath Sankaralingam <rath.sankaralingam@arm.com>
Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 .../platform/arm/mali-vpu/mali-vpu-buffer.c   | 100 ++++++
 .../platform/arm/mali-vpu/mali-vpu-buffer.h   |  14 +
 .../platform/arm/mali-vpu/mali-vpu-firmware.c | 300 ++++++++++++++++++
 .../platform/arm/mali-vpu/mali-vpu-firmware.h |  10 +
 .../arm/mali-vpu/mali-vpu-protocol-def-v3.h   | 128 ++++++++
 .../platform/arm/mali-vpu/mali-vpu-session.c  |  49 +++
 6 files changed, 601 insertions(+)

diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c
index c1df3e2d4eacf..e404fb933195f 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.c
@@ -53,6 +53,7 @@ int mali_vpu_vb2_buffer_init(struct vb2_buffer *vb2_buf)
 	vpu_buf->dev = sess->vpu_dev->dev;
 	vpu_buf->mmu = &sess->mmu;
 	vpu_buf->nplanes = vb2_buf->num_planes;
+	vpu_buf->fw_buffer_id = 0;
 	vpu_buf->attr = MALI_VPU_BUF_ATTR_NONE;
 
 	for (i = 0; i < vb2_buf->num_planes; ++i) {
@@ -86,6 +87,40 @@ static size_t mali_vpu_buffer_get_bytesused(struct vb2_buffer *b)
 	return size;
 }
 
+static int mali_vpu_buffer_clear_bytesused(struct mali_vpu_buffer *vpu_buf)
+{
+	struct vb2_buffer *vb2_buf = &vpu_buf->m2m_buf.vb.vb2_buf;
+	u32 i;
+
+	for (i = 0; i < vb2_buf->num_planes; i++) {
+		vb2_set_plane_payload(vb2_buf, i, 0);
+		vb2_buf->planes[i].data_offset = 0;
+	}
+
+	return 0;
+}
+
+static int mali_vpu_buffer_update_bytesused_to_v4l2(struct mali_vpu_buffer *vpu_buf)
+{
+	struct vb2_buffer *vb2_buf = &vpu_buf->m2m_buf.vb.vb2_buf;
+	u32 i;
+
+	if (vpu_buf->nplanes != vb2_buf->num_planes) {
+		dev_dbg(vpu_buf->dev,
+			"mali VPU buf and vb2 buf have different num_planes. vpu_buf=%u vb2_buf=%u.\n",
+			vpu_buf->nplanes, vb2_buf->num_planes);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < vpu_buf->nplanes; i++) {
+		vb2_buf->planes[i].bytesused =
+			vpu_buf->planes[i].payload_size + vpu_buf->planes[i].offset;
+		vb2_buf->planes[i].data_offset = vpu_buf->planes[i].offset;
+	}
+
+	return 0;
+}
+
 static void mali_vpu_buffer_update_flags_from_v4l2(struct vb2_buffer *vb2_buf)
 {
 	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb2_buf);
@@ -102,6 +137,27 @@ static void mali_vpu_buffer_update_flags_from_v4l2(struct vb2_buffer *vb2_buf)
 		vpu_buf->flags |= MALI_VPU_BUFFER_EOS;
 }
 
+static void mali_vpu_buffer_update_flags_to_v4l2(struct mali_vpu_buffer *vpu_buf)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = &vpu_buf->m2m_buf.vb;
+
+	v4l2_buf->flags &= ~(V4L2_BUF_FLAG_ERROR |
+			     V4L2_BUF_FLAG_KEYFRAME |
+			     V4L2_BUF_FLAG_LAST);
+
+	if (vpu_buf->flags & MALI_VPU_BUFFER_EOS ||
+	    (V4L2_TYPE_IS_CAPTURE(vpu_buf->type) &&
+	     mali_vpu_buffer_get_bytesused(&vpu_buf->m2m_buf.vb.vb2_buf) == 0))
+		v4l2_buf->flags |= V4L2_BUF_FLAG_LAST;
+
+	if (vpu_buf->flags & MALI_VPU_BUFFER_CORRUPT)
+		v4l2_buf->flags |= V4L2_BUF_FLAG_ERROR;
+
+	if (V4L2_TYPE_IS_CAPTURE(vpu_buf->type) &&
+	    vpu_buf->flags & MALI_VPU_BUFFER_REJECTED)
+		mali_vpu_buffer_clear_bytesused(vpu_buf);
+}
+
 int mali_vpu_buffer_update_info_from_v4l2(struct vb2_buffer *vb2_buf)
 {
 	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb2_buf);
@@ -129,6 +185,30 @@ int mali_vpu_buffer_update_info_from_v4l2(struct vb2_buffer *vb2_buf)
 	return 0;
 }
 
+enum vb2_buffer_state mali_vpu_buffer_update_info_to_v4l2(struct mali_vpu_buffer *vpu_buf)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = &vpu_buf->m2m_buf.vb;
+	struct vb2_buffer *vb2_buf = &v4l2_buf->vb2_buf;
+	int ret;
+
+	vb2_buf->timestamp = vpu_buf->user_data;
+
+	if (V4L2_TYPE_IS_CAPTURE(vpu_buf->type)) {
+		ret = mali_vpu_buffer_update_bytesused_to_v4l2(vpu_buf);
+		if (ret)
+			goto error;
+	}
+
+	mali_vpu_buffer_update_flags_to_v4l2(vpu_buf);
+	if ((v4l2_buf->flags & V4L2_BUF_FLAG_ERROR) != 0)
+		goto error;
+
+	return VB2_BUF_STATE_DONE;
+
+error:
+	return VB2_BUF_STATE_ERROR;
+}
+
 int mali_vpu_vb2_buffer_prepare(struct vb2_buffer *vb2_buf)
 {
 	struct mali_vpu_session *sess = vb2_get_drv_priv(vb2_buf->vb2_queue);
@@ -157,6 +237,20 @@ int mali_vpu_vb2_buffer_out_validate(struct vb2_buffer *vb2_buf)
 	return 0;
 }
 
+mali_vpu_mmu_va mali_vpu_buffer_plane_va(struct mali_vpu_buffer *vpu_buf, u32 plane)
+{
+	struct mali_vpu_buffer_plane *vpu_buf_plane;
+
+	if (plane >= vpu_buf->nplanes)
+		return 0;
+
+	vpu_buf_plane = &vpu_buf->planes[plane];
+	if (!vpu_buf_plane->pages)
+		return 0;
+
+	return vpu_buf_plane->pages->va + vpu_buf_plane->pages->offset;
+}
+
 static int mali_vpu_buffer_plane_map(struct mali_vpu_buffer *vpu_buf, mali_vpu_mmu_va begin,
 				     mali_vpu_mmu_va end, u32 plane)
 {
@@ -283,6 +377,12 @@ int mali_vpu_buffer_set_frame_layout(struct mali_vpu_buffer *vpu_buf)
 
 	pix_mp = &port->curr_fmt.fmt.pix_mp;
 
+	vpu_buf->width = pix_mp->width;
+	vpu_buf->height = pix_mp->height;
+	vpu_buf->format = mali_vpu_find_format(sess, pix_mp->pixelformat, vpu_buf->type);
+	if (!vpu_buf->format)
+		return -EINVAL;
+
 	if (vpu_buf->nplanes != pix_mp->num_planes)
 		return -EINVAL;
 
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.h
index 645dcc775cd2c..01dd49082fdcc 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-buffer.h
@@ -13,6 +13,8 @@
 #define MALI_VPU_BUFFER_MAX_PLANES 3
 
 #define MALI_VPU_BUFFER_EOS                  0x00000001
+#define MALI_VPU_BUFFER_CORRUPT              0x00000004
+#define MALI_VPU_BUFFER_REJECTED             0x00000008
 
 /**
  * enum mali_vpu_buffer_attributes - Buffer submission state.
@@ -44,6 +46,8 @@ struct mali_vpu_buffer_plane {
 	u32 stride;
 };
 
+struct mali_vpu_format_desc;
+
 /**
  * struct mali_vpu_buffer - Buffer descriptor.
  * @m2m_buf: Embedded v4l2-mem2mem buffer.
@@ -53,6 +57,10 @@ struct mali_vpu_buffer_plane {
  * @type: Type of the buffer (output/capture).
  * @user_data: Userdata(timestamp) to be copied to capture buffer.
  * @flags: Buffer Flags.
+ * @width: Frame width in pixels.
+ * @height: Frame height in pixels.
+ * @fw_buffer_id: Non-zero identifier while registered for firmware submission.
+ * @format: Buffer format.
  * @planes: Array of planes.
  * @attr: Firmware Queuing Status Attribute.
  */
@@ -64,6 +72,10 @@ struct mali_vpu_buffer {
 	u32 type;
 	u64 user_data;
 	u32 flags;
+	u32 width;
+	u32 height;
+	u32 fw_buffer_id;
+	const struct mali_vpu_format_desc *format;
 	struct mali_vpu_buffer_plane planes[MALI_VPU_BUFFER_MAX_PLANES];
 	enum mali_vpu_buffer_attributes attr;
 };
@@ -85,11 +97,13 @@ int mali_vpu_buffer_map(struct mali_vpu_buffer *vpu_buf, mali_vpu_mmu_va begin,
 void mali_vpu_buffer_unmap(struct mali_vpu_buffer *vpu_buf);
 int mali_vpu_buffer_sync(struct mali_vpu_buffer *vpu_buf, enum dma_data_direction dir);
 bool mali_vpu_is_buffer_mapped(struct mali_vpu_buffer *vpu_buf);
+mali_vpu_mmu_va mali_vpu_buffer_plane_va(struct mali_vpu_buffer *vpu_buf, u32 plane);
 
 int mali_vpu_buffer_update_info_from_v4l2(struct vb2_buffer *vb2_buf);
 int mali_vpu_buffer_set_plane_payload(struct mali_vpu_buffer *vpu_buf, u32 plane,
 				      u32 bytesused, u32 offset);
 int mali_vpu_buffer_set_frame_layout(struct mali_vpu_buffer *vpu_buf);
 size_t mali_vpu_buffer_plane_size(struct mali_vpu_buffer *vpu_buf, u32 plane);
+enum vb2_buffer_state mali_vpu_buffer_update_info_to_v4l2(struct mali_vpu_buffer *vpu_buf);
 
 #endif /* __MALI_VPU_BUFFER_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
index 820853ca4519a..4e3eaecb8ebee 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
@@ -12,6 +12,7 @@
 
 #include "mali-vpu-firmware.h"
 #include "mali-vpu-firmware-cache.h"
+#include "mali-vpu-formats.h"
 #include "mali-vpu-mmu.h"
 #include "mali-vpu-protocol-def-v3.h"
 
@@ -347,6 +348,20 @@ static int mali_vpu_fw_map_core_regions(struct mali_vpu_fw *fw,
 	return ret;
 }
 
+static void mali_vpu_fw_clear_buffers(struct mali_vpu_fw *fw)
+{
+	struct mali_vpu_buffer *vpu_buf;
+	unsigned long id;
+
+	xa_for_each(&fw->inflight_buffers, id, vpu_buf) {
+		xa_erase(&fw->inflight_buffers, id);
+		vpu_buf->fw_buffer_id = 0;
+		vpu_buf->attr = MALI_VPU_BUF_ATTR_NONE;
+	}
+
+	xa_destroy(&fw->inflight_buffers);
+}
+
 int mali_vpu_fw_construct(struct mali_vpu_fw *fw, const struct mali_vpu_fw_bin *fw_bin,
 			  struct device *dev, struct mali_vpu_mmu *mmu, u32 ncores)
 {
@@ -362,6 +377,8 @@ int mali_vpu_fw_construct(struct mali_vpu_fw *fw, const struct mali_vpu_fw_bin *
 	fw->dev = dev;
 	fw->mmu = mmu;
 	fw->ncores = ncores;
+	xa_init_flags(&fw->inflight_buffers, XA_FLAGS_ALLOC1);
+	fw->next_buffer_id = 1;
 	hash_init(fw->rpc_mem);
 
 	/* Initialise firmware core and protocol regions */
@@ -393,6 +410,8 @@ void mali_vpu_fw_cleanup(struct mali_vpu_fw *fw)
 	if (!fw)
 		return;
 
+	mali_vpu_fw_clear_buffers(fw);
+
 	mali_vpu_fw_unmap_protocol(fw);
 	mali_vpu_fw_unmap_core_regions(fw);
 
@@ -781,6 +800,153 @@ int mali_vpu_fw_send_set_option(struct mali_vpu_fw *fw,
 	return ret;
 }
 
+static struct mali_vpu_buffer *
+mali_vpu_fw_resolve_returned_buffer(struct mali_vpu_fw *fw,
+				    u64 host_handle,
+				    enum v4l2_buf_type expected_type)
+{
+	struct mali_vpu_buffer *vpu_buf;
+	u32 id;
+
+	if (!host_handle || host_handle > UINT_MAX)
+		return ERR_PTR(-EPROTO);
+
+	id = host_handle;
+
+	vpu_buf = xa_load(&fw->inflight_buffers, id);
+	if (!vpu_buf)
+		return ERR_PTR(-EPROTO);
+
+	if (vpu_buf->fw_buffer_id != id ||
+	    vpu_buf->type != expected_type ||
+	    vpu_buf->attr != MALI_VPU_BUF_ATTR_QUEUED)
+		return ERR_PTR(-EPROTO);
+
+	if (xa_erase(&fw->inflight_buffers, id) != vpu_buf)
+		return ERR_PTR(-EPROTO);
+
+	vpu_buf->fw_buffer_id = 0;
+	vpu_buf->attr = MALI_VPU_BUF_ATTR_NONE;
+
+	return vpu_buf;
+}
+
+static int
+mali_vpu_convert_buffer_frame(struct mali_vpu_fw *fw,
+			      struct mali_vpu_fw_msg *msg,
+			      u32 buf_type,
+			      struct mve_buffer_frame *mve_frame_buf)
+{
+	struct mali_vpu_buffer *vpu_buf;
+	unsigned int i;
+
+	vpu_buf = mali_vpu_fw_resolve_returned_buffer(fw,
+						      mve_frame_buf->host_handle,
+						      buf_type);
+	if (IS_ERR(vpu_buf))
+		return PTR_ERR(vpu_buf);
+
+	msg->code = MALI_VPU_FW_CODE_BUFFER;
+	msg->data.vpu_buf = vpu_buf;
+
+	if (buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		vpu_buf->width = mve_frame_buf->visible_frame_width;
+		vpu_buf->height = mve_frame_buf->visible_frame_height;
+
+		if (vpu_buf->width == 0 || vpu_buf->height == 0) {
+			for (i = 0; i < vpu_buf->nplanes; i++)
+				(void)mali_vpu_buffer_set_plane_payload(vpu_buf, i, 0, 0);
+		}
+	}
+
+	vpu_buf->user_data = mve_frame_buf->user_data_tag;
+	vpu_buf->flags = 0;
+
+	if (mve_frame_buf->frame_flags & MVE_BUFFER_FRAME_FLAG_EOS)
+		vpu_buf->flags |=  MALI_VPU_BUFFER_EOS;
+
+	if (mve_frame_buf->frame_flags & MVE_BUFFER_FRAME_FLAG_REJECTED)
+		vpu_buf->flags |=  MALI_VPU_BUFFER_REJECTED;
+
+	if (mve_frame_buf->frame_flags & MVE_BUFFER_FRAME_FLAG_CORRUPT)
+		vpu_buf->flags |=  MALI_VPU_BUFFER_CORRUPT;
+
+	return 0;
+}
+
+static int
+mali_vpu_convert_buffer_bitstream(struct mali_vpu_fw *fw,
+				  struct mali_vpu_fw_msg *msg,
+				  u32 buf_type,
+				  struct mve_buffer_bitstream *mve_stream_buf)
+{
+	struct mali_vpu_buffer *vpu_buf =
+		mali_vpu_fw_resolve_returned_buffer(fw,
+						    mve_stream_buf->host_handle,
+						    buf_type);
+	if (IS_ERR(vpu_buf))
+		return PTR_ERR(vpu_buf);
+
+	msg->code = MALI_VPU_FW_CODE_BUFFER;
+	msg->data.vpu_buf = vpu_buf;
+
+	vpu_buf->user_data = mve_stream_buf->user_data_tag;
+	vpu_buf->flags = 0;
+
+	if (mve_stream_buf->bitstream_flags & MVE_BUFFER_BITSTREAM_FLAG_EOS)
+		vpu_buf->flags |= MALI_VPU_BUFFER_EOS;
+
+	return 0;
+}
+
+static int mali_vpu_fw_get_buffer(struct mali_vpu_fw *fw,
+				  struct mali_vpu_fw_proto_page *buf_host_page,
+				  struct mali_vpu_fw_proto_page *buf_mve_page,
+				  struct mali_vpu_fw_msg *msg, u32 buf_type)
+{
+	u16 code;
+	union {
+		struct mve_buffer_frame frame;
+		struct mve_buffer_bitstream bitstream;
+	} fw_msg;
+	size_t size = sizeof(fw_msg);
+	int ret;
+
+	ret = mali_vpu_fw_read_msg(fw, buf_host_page, buf_mve_page, &code,
+				   &fw_msg, &size);
+	if (ret <= 0)
+		return ret;
+
+	switch (code) {
+	case MVE_BUFFER_CODE_FRAME:
+		if (size != sizeof(fw_msg.frame) ||
+		    (!fw_msg.frame.host_handle &&
+		     !(fw_msg.frame.frame_flags & MVE_BUFFER_FRAME_FLAG_EOS)))
+			return -EPROTO;
+
+		ret = mali_vpu_convert_buffer_frame(fw, msg, buf_type, &fw_msg.frame);
+		if (ret)
+			return ret;
+		break;
+	case MVE_BUFFER_CODE_BITSTREAM:
+		if (size != sizeof(fw_msg.bitstream) ||
+		    (!fw_msg.bitstream.host_handle &&
+		     !(fw_msg.bitstream.bitstream_flags & MVE_BUFFER_BITSTREAM_FLAG_EOS)))
+			return -EPROTO;
+
+		ret = mali_vpu_convert_buffer_bitstream(fw, msg, buf_type,
+							&fw_msg.bitstream);
+		if (ret)
+			return ret;
+		break;
+	default:
+		dev_dbg(fw->dev, "unknown buf code. code: %u.\n", code);
+		break;
+	}
+
+	return 1;
+}
+
 int mali_vpu_fw_parse_msg(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *msg)
 {
 	u16 code;
@@ -791,6 +957,8 @@ int mali_vpu_fw_parse_msg(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *msg)
 		struct mve_response_error error;
 	} fw_msg = {};
 	size_t size = sizeof(fw_msg);
+	struct mali_vpu_fw_proto_page *buf_host_page;
+	struct mali_vpu_fw_proto_page *buf_mve_page;
 	int ret;
 
 	if (!fw || !msg)
@@ -871,6 +1039,20 @@ int mali_vpu_fw_parse_msg(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *msg)
 		fw->pending_response_count--;
 		break;
 	}
+	case MVE_RESPONSE_CODE_INPUT:
+		buf_host_page = &fw->buf_in_host;
+		buf_mve_page = &fw->buf_in_mve;
+
+		ret = mali_vpu_fw_get_buffer(fw, buf_host_page, buf_mve_page, msg,
+					     V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+		break;
+	case MVE_RESPONSE_CODE_OUTPUT:
+		buf_host_page = &fw->buf_out_host;
+		buf_mve_page = &fw->buf_out_mve;
+
+		ret = mali_vpu_fw_get_buffer(fw, buf_host_page, buf_mve_page, msg,
+					     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+		break;
 	case MVE_RESPONSE_CODE_ERROR: {
 		size_t message_offset = offsetof(struct mve_response_error, message);
 		size_t message_size;
@@ -930,6 +1112,124 @@ int mali_vpu_fw_parse_msg(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *msg)
 	return ret;
 }
 
+static int mali_vpu_fw_track_buffer(struct mali_vpu_fw *fw,
+				    struct mali_vpu_buffer *vpu_buf)
+{
+	u32 id;
+	int ret;
+
+	if (vpu_buf->fw_buffer_id)
+		return -EBUSY;
+
+	ret = xa_alloc_cyclic(&fw->inflight_buffers, &id, vpu_buf,
+			      XA_LIMIT(1, UINT_MAX),
+			      &fw->next_buffer_id, GFP_KERNEL);
+	if (ret)
+		return ret;
+
+	vpu_buf->fw_buffer_id = id;
+
+	return 0;
+}
+
+static void mali_vpu_fw_untrack_buffer(struct mali_vpu_fw *fw,
+				       struct mali_vpu_buffer *vpu_buf)
+{
+	void *entry;
+
+	if (!vpu_buf->fw_buffer_id)
+		return;
+
+	entry = xa_erase(&fw->inflight_buffers, vpu_buf->fw_buffer_id);
+	WARN_ON_ONCE(entry && entry != vpu_buf);
+
+	vpu_buf->fw_buffer_id = 0;
+}
+
+static int mali_vpu_fw_put_buffer_frame(struct mali_vpu_fw *fw,
+					struct mali_vpu_fw_msg *fw_msg,
+					struct mali_vpu_fw_proto_page *host_page,
+					struct mali_vpu_fw_proto_page *mve_page)
+{
+	struct mve_buffer_frame mve_frame_buf = { 0 };
+	struct mali_vpu_buffer *vpu_buf = fw_msg->data.vpu_buf;
+	struct mve_buffer_frame_planar *planar;
+	u32 i;
+
+	mve_frame_buf.host_handle = vpu_buf->fw_buffer_id;
+
+	mve_frame_buf.format = vpu_buf->format->mve_frame_fmt;
+	planar = &mve_frame_buf.data.planar;
+
+	for (i = 0; i < vpu_buf->nplanes; i++) {
+		struct mali_vpu_buffer_plane *plane = &vpu_buf->planes[i];
+
+		if (plane->stride > 0)
+			planar->plane_top[i] = mali_vpu_buffer_plane_va(vpu_buf, i);
+
+		planar->stride[i] = plane->stride;
+		planar->max_frame_width = vpu_buf->width;
+		planar->max_frame_height = vpu_buf->height;
+	}
+
+	return mali_vpu_fw_write_msg(fw, host_page, mve_page, MVE_BUFFER_CODE_FRAME,
+				     &mve_frame_buf, sizeof(mve_frame_buf));
+}
+
+static int mali_vpu_fw_put_buffer_bitstream(struct mali_vpu_fw *fw,
+					    struct mali_vpu_fw_msg *fw_msg,
+					    struct mali_vpu_fw_proto_page *host_page,
+					    struct mali_vpu_fw_proto_page *mve_page)
+{
+	struct mve_buffer_bitstream mve_stream_buf = { 0 };
+	struct mali_vpu_buffer *vpu_buf = fw_msg->data.vpu_buf;
+
+	if (V4L2_TYPE_IS_OUTPUT(vpu_buf->type))
+		mve_stream_buf.bitstream_filled_len = vpu_buf->planes[0].payload_size;
+
+	mve_stream_buf.host_handle = vpu_buf->fw_buffer_id;
+	mve_stream_buf.user_data_tag = vpu_buf->user_data;
+	mve_stream_buf.bitstream_alloc_bytes = mali_vpu_buffer_plane_size(vpu_buf, 0);
+	mve_stream_buf.bitstream_offset = vpu_buf->planes[0].offset;
+	mve_stream_buf.bitstream_buf_addr = mali_vpu_buffer_plane_va(vpu_buf, 0);
+
+	if (vpu_buf->flags & MALI_VPU_BUFFER_EOS)
+		mve_stream_buf.bitstream_flags |= MVE_BUFFER_BITSTREAM_FLAG_EOS;
+
+	return mali_vpu_fw_write_msg(fw, host_page, mve_page, MVE_BUFFER_CODE_BITSTREAM,
+				     &mve_stream_buf, sizeof(mve_stream_buf));
+}
+
+int mali_vpu_fw_send_buffer(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *fw_msg)
+{
+	struct mali_vpu_buffer *vpu_buf = fw_msg->data.vpu_buf;
+	struct mali_vpu_fw_proto_page *host;
+	struct mali_vpu_fw_proto_page *mve;
+	int ret;
+
+	if (V4L2_TYPE_IS_OUTPUT(fw_msg->data.vpu_buf->type)) {
+		host = &fw->buf_in_host;
+		mve = &fw->buf_in_mve;
+	} else {
+		host = &fw->buf_out_host;
+		mve = &fw->buf_out_mve;
+	}
+
+	ret = mali_vpu_fw_track_buffer(fw, vpu_buf);
+	if (ret)
+		return ret;
+
+	if (V4L2_TYPE_IS_OUTPUT(fw_msg->data.vpu_buf->type))
+		ret = mali_vpu_fw_put_buffer_bitstream(fw, fw_msg, host, mve);
+	else
+		ret = mali_vpu_fw_put_buffer_frame(fw, fw_msg, host, mve);
+
+	if (ret)
+		mali_vpu_fw_untrack_buffer(fw, vpu_buf);
+
+	return ret;
+}
+
 static void mali_vpu_fw_dbg_rpc(struct mali_vpu_fw *fw, const char *direction,
 				const struct mve_rpc_communication_area *rpc)
 {
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
index 5431959befb24..c936730698837 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
@@ -9,7 +9,9 @@
 #include <linux/hashtable.h>
 #include <linux/media/arm/mali-vpu-config.h>
 #include <linux/types.h>
+#include <linux/xarray.h>
 
+#include "mali-vpu-buffer.h"
 #include "mali-vpu-mmu.h"
 
 #define MALI_VPU_FW_HTABLE_BITS 3
@@ -19,6 +21,8 @@ struct device;
 struct mali_vpu_mmu;
 struct mali_vpu_fw_bin;
 struct mali_vpu_mmu_pages;
+struct mve_buffer_frame;
+struct mve_buffer_bitstream;
 
 /**
  * enum mali_vpu_fw_state - Firmware execution state.
@@ -219,6 +223,9 @@ struct mali_vpu_fw_proto_page {
  * @shared_bss_pages: Shared BSS pages mapped into every core instance.
  * @ncores: Number of firmware core-instance regions constructed.
  * @pending_response_count: Number of requests awaiting a firmware response.
+ * @inflight_buffers: XArray mapping non-zero firmware-visible buffer IDs to
+ *			buffers currently owned by firmware.
+ * @next_buffer_id: Next candidate ID for cyclic buffer-ID allocation.
  * @rpc_mem: Keeps track of RPC allocated memory. Maps MVE virtual address to
  *		'struct mali_vpu_mmu_pages' object.
  */
@@ -239,6 +246,8 @@ struct mali_vpu_fw {
 	struct mali_vpu_mmu_pages *shared_bss_pages;
 	u32 ncores;
 	u32 pending_response_count;
+	struct xarray inflight_buffers;
+	u32 next_buffer_id;
 
 	DECLARE_HASHTABLE(rpc_mem, MALI_VPU_FW_HTABLE_BITS);
 };
@@ -247,6 +256,7 @@ int mali_vpu_fw_construct(struct mali_vpu_fw *fw, const struct mali_vpu_fw_bin *
 			  struct device *dev, struct mali_vpu_mmu *mmu, u32 ncores);
 void mali_vpu_fw_cleanup(struct mali_vpu_fw *fw);
 int mali_vpu_fw_send_job(struct mali_vpu_fw *fw, u16 cores, u16 frames);
+int mali_vpu_fw_send_buffer(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *fw_msg);
 int mali_vpu_fw_send_ping(struct mali_vpu_fw *fw);
 int mali_vpu_fw_send_state_change(struct mali_vpu_fw *fw, enum mali_vpu_fw_state state);
 int mali_vpu_fw_send_set_option(struct mali_vpu_fw *fw, struct mali_vpu_fw_set_option *option);
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
index 8a81ed1fd730a..7f3a13ec744b9 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
@@ -241,6 +241,10 @@ struct mve_msg_header {
 		#define MVE_RESPONSE_CODE_SET_OPTION_CONFIRM  (2003)
 		/* struct mve_response_job_dequeued */
 		#define MVE_RESPONSE_CODE_JOB_DEQUEUED        (2004)
+		/* no extra data, but buffer placed in buffer queue */
+		#define MVE_RESPONSE_CODE_INPUT               (2005)
+		/* no extra data, but buffer placed in buffer queue */
+		#define MVE_RESPONSE_CODE_OUTPUT              (2006)
 		#define MVE_RESPONSE_CODE_PONG                (2009)
 		/* struct mve_response_error */
 		#define MVE_RESPONSE_CODE_ERROR               (2010)
@@ -250,6 +254,14 @@ struct mve_msg_header {
 		/* struct mve_response_set_option_fail */
 		#define MVE_RESPONSE_CODE_SET_OPTION_FAIL     (2017)
 
+		/* BUFFERs are sent from host to firmware,
+		 * and then return at some time:
+		 */
+		/* struct mve_buffer_frame */
+		#define MVE_BUFFER_CODE_FRAME                 (3001)
+		/* struct mve_buffer_bitstream */
+		#define MVE_BUFFER_CODE_BITSTREAM             (3002)
+
 	u16 size; /* size in bytes of trailing data, 0 if none */
 };
 
@@ -409,4 +421,120 @@ struct mve_response_set_option_fail {
 				(2 << MVE_FORMAT_BF_N) | \
 				(1 << MVE_FORMAT_BF_V))
 
+/*********************************************************************
+ *
+ *   BUFFERs are sent both ways, from host to firmware and back again
+ *
+ *   Each MVE_BUFFER_CODE_ code is followed by one of the structs
+ *   below.
+ *
+ *********************************************************************/
+
+/* Flags in mve_buffer_frame::frame_flags:
+ *                                     Set by whom?    Meaning:
+ *                                     DECODE:
+ * MVE_BUFFER_FRAME_FLAG_REJECTED       fw             Buffer was too small, host should re-allocate
+ *
+ * MVE_BUFFER_FRAME_FLAG_CORRUPT        fw             Frame contains visual corruption
+ *
+ * MVE_BUFFER_FRAME_FLAG_EOS            fw             This is the last frame in the stream.
+ */
+
+/* mve_buffer_frame_planar stores uncompressed YUV pictures.
+ *       ________________________________________
+ *      |  ^                          |          |  ^
+ *      |<-:--visible_frame_width---->|          |  :
+ *      |  :                          |          |  :
+ *      |  :                          |          |  :
+ *      | visible_frame_height        |          | max_frame_height
+ *      |  :                          |          |  :
+ *      |  :                          |          |  :
+ *      |__v__________________________|          |  :
+ *      |                                        |  :
+ *      |<-------------max_frame_width---------->|  :
+ *      |________________________________________|  v
+ *
+ */
+struct mve_buffer_frame_planar {
+	/* Y,Cb,Cr top field */
+	u32 plane_top[3];
+
+	/* Y,Cb,Cr bottom field (interlace only) */
+	u32 plane_bot[3];
+
+	/* Stride between rows, in bytes */
+	s32 stride[3];
+
+	/* Size of largest frame allowed to put in this buffer */
+	u16 max_frame_width;
+	u16 max_frame_height;
+};
+
+/* mve_buffer_frame stores PLANAR buffer information. */
+struct mve_buffer_frame {
+	/* For identification of the buffer, this is not changed by
+	 * the firmware.
+	 */
+	u64 host_handle;
+
+	/* For matching input buffer with output buffers, the firmware
+	 * copies these values between frame buffers and bitstream buffers.
+	 */
+	u64 user_data_tag;
+
+	/* Frame buffer flags, see commentary above */
+	u32 frame_flags;
+		#define MVE_BUFFER_FRAME_FLAG_REJECTED		(0x00001000)
+		#define MVE_BUFFER_FRAME_FLAG_CORRUPT		(0x00002000)
+		#define MVE_BUFFER_FRAME_FLAG_EOS		(0x00010000)
+	/* Height (in luma samples) of visible part of frame,
+	 * may be smaller than allocated frame size.
+	 */
+	u16 visible_frame_height;
+
+	/* Width (in luma samples) of visible part of frame,
+	 * may be smaller than allocated frame size.
+	 */
+	u16 visible_frame_width;
+
+	/* Color format of buffer */
+	u16 format;
+
+	u16 reserved0; /* force 'data' to be 4-byte aligned */
+
+	union {
+		struct mve_buffer_frame_planar planar;
+	} data;
+
+	u32 reserved1; /* force size to be multiple of 8 bytes */
+};
+
+/* The bitstream buffer stores a number of bitstream bytes */
+struct mve_buffer_bitstream {
+	/* For identification of the buffer, this is not changed by
+	 * the firmware.
+	 */
+	u64 host_handle;
+
+	/* For matching input buffer with output buffers, the firmware
+	 * copies these values between frame buffers and bitstream buffers.
+	 */
+	u64 user_data_tag;
+
+	/* BufferFlags */
+	u32 bitstream_flags;
+		#define MVE_BUFFER_BITSTREAM_FLAG_EOS              (0x00000001)
+
+	/* Length of allocated buffer */
+	u32 bitstream_alloc_bytes;
+	/* Byte offset from start to first byte */
+	u32 bitstream_offset;
+	/* Number of bytes in the buffer */
+	u32 bitstream_filled_len;
+	/* Pointer to buffer start */
+	u32 bitstream_buf_addr;
+	/* Pad to force 8-byte alignment */
+	u32 reserved;
+};
+
 #endif /* __MALI_VPU_PROTOCOL_DEF_V3_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
index 540104bcd38e2..60e4b7e25eff8 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
@@ -176,6 +176,7 @@ static int mali_vpu_queue_buffer(struct mali_vpu_session *sess, struct mali_vpu_
 {
 	int ret;
 	enum dma_data_direction dma_dir;
+	struct mali_vpu_fw_msg fw_msg;
 
 	dma_dir = (vpu_buf->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) ?
 		   DMA_TO_DEVICE : DMA_FROM_DEVICE;
@@ -198,6 +199,13 @@ static int mali_vpu_queue_buffer(struct mali_vpu_session *sess, struct mali_vpu_
 	if (ret)
 		return ret;
 
+	/* put buf to fw q */
+	fw_msg.code = MALI_VPU_FW_CODE_BUFFER;
+	fw_msg.data.vpu_buf = vpu_buf;
+	ret = mali_vpu_fw_send_buffer(&sess->fw, &fw_msg);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -277,6 +285,28 @@ static int mali_vpu_session_sched_activate(struct mali_vpu_session *sess)
 	return mali_vpu_sched_switch_in(&sess->sched_sess, &sess->vpu_dev->sched);
 }
 
+static void mali_vpu_session_buffer_done(struct mali_vpu_session *sess,
+					 struct mali_vpu_buffer *vpu_buf,
+					 enum vb2_buffer_state state)
+{
+	struct vb2_v4l2_buffer *vbuf = &vpu_buf->m2m_buf.vb;
+	struct vb2_buffer *vb2_buf = &vbuf->vb2_buf;
+
+	if (vb2_buf->state != VB2_BUF_STATE_ACTIVE) {
+		dev_dbg(sess->vpu_dev->dev,
+			"ignore returned buffer. type=%u index=%u vb2_state=%u\n",
+			vpu_buf->type, vb2_buf->index, vb2_buf->state);
+		return;
+	}
+
+	if (V4L2_TYPE_IS_OUTPUT(vpu_buf->type))
+		v4l2_m2m_src_buf_remove_by_buf(sess->m2m_ctx, vbuf);
+	else
+		v4l2_m2m_dst_buf_remove_by_buf(sess->m2m_ctx, vbuf);
+
+	v4l2_m2m_buf_done(vbuf, state);
+}
+
 static int mali_vpu_session_handle_fw_msg(struct mali_vpu_session *sess,
 					  const struct mali_vpu_fw_msg *fw_msg)
 {
@@ -291,6 +321,25 @@ static int mali_vpu_session_handle_fw_msg(struct mali_vpu_session *sess,
 		 * switch-out scheduling.
 		 */
 		return 0;
+	case MALI_VPU_FW_CODE_BUFFER: {
+		struct mali_vpu_buffer *vpu_buf = fw_msg->data.vpu_buf;
+		enum vb2_buffer_state state;
+
+		dev_dbg(sess->vpu_dev->dev,
+			"firmware rsp: Buffer. type=%u, len=[%u, %u, %u], flags=0x%08x, eos=%u",
+			vpu_buf->type, vpu_buf->planes[0].payload_size,
+			vpu_buf->planes[1].payload_size, vpu_buf->planes[2].payload_size,
+			vpu_buf->flags, (vpu_buf->flags & MALI_VPU_BUFFER_EOS) != 0);
+
+		if (vpu_buf->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+			mali_vpu_buffer_sync(vpu_buf, DMA_FROM_DEVICE);
+
+		state = mali_vpu_buffer_update_info_to_v4l2(vpu_buf);
+
+		mali_vpu_session_buffer_done(sess, vpu_buf, state);
+
+		return 0;
+	}
 	case MALI_VPU_FW_CODE_PONG:
 		/* Receiving the responses completes the diagnostic ping. */
 		return 0;
-- 
2.43.0

