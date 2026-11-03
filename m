Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691692;
	b=gMs6SbiYdmPQVW9uVxBZ8q5E6gnSaKf2CQSm4JJFcKhDZrhD1l8FFBcq4IZasPfS5tqT
	 pvf2thOEmGEvEHI0d1cWpvxM91AvNKEP2YCSHWYIbAkkffkjYGZZ4mFwTrGxakKY0DEcM
	 nLRpdY0MCvGhJEZhQ2aYxZt5EveW56sZrRoYv2uTzSB8DBJTURIiOFp+/rLaegUgQ2Kxl
	 i7uVFCO8xHIGyXzlyFWld8Eguue8bOO7zyMyzWAvrI18uDbASBeYeXhg12wlxSgtI3h+1
	 SCT74U4PeRw0MxNPAHxU4qqlR1nwXIk9bVL3163Y4/QE5x6NkVK0qKiIOdaXquY2FDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691692;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=jb9k7NJwiGOsLAwtgqFgWnrDEmjdfphexebrynwYSD0=;
	b=IWtEUJZA9PAqETA/rJXOtpGkk/A7nzZfKDExOtZo4bVtTfL2EY0gbKP4oSt2bT2svwnD
	 No3ZXrGef1hBkGUnWfiaWgO1Toh2Qa9NMjbuUe29Kjq0mUnf7u/EQvOG3tn3UK8sdFF4c
	 QTv9QuvXmY4IIa8ukXPAt/NKsgru1L+8P6Diw8sWvOQTl502IDkoNWbuBHaek0R9ToQcM
	 +gi8RgpPiHmb6HQgOi9JrlaorQ4eJrY5SzBvo3ESACNt7hAiu5Ag/GFcIrPIShjThT2LN
	 pqnkZOAASnZ4VebsGqgb66UFAENYWZx9hgHfKs/gvFm+0n+xRPORokOfQLCC3uDe2Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=fLsxZiZM;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8814606A33B
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:41:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8814606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=fLsxZiZM
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63FC15211;
	Tue,  3 Nov 2026 08:38:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691539;
	bh=DouAP44a/xjibckQCvicq+7yx5PPwPBXllkSkwoGU2o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fLsxZiZMpxrLkQsmwLZcMdTJa1BISAYiyNJXJgJ2X51UsdJEOEy8+kwk/6j5Aeb3m
	 I4peTF0otNxB0EbeKSJG5cSFlq3xFcknQ/Jk+Hk+US72Y0mJGJtP51gvoGWXloJe9G
	 nA5l9dQtHiS2nrEYcV9H6jTMUcuTrxGJb9uLKDNQ=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:51 +0000
Subject: [PATCH 15/16] media: rkisp1: Expose startup and shutdown functions
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
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-15-08f863b6fdc5@ideasonboard.com>
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
In-Reply-To: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6524;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=DouAP44a/xjibckQCvicq+7yx5PPwPBXllkSkwoGU2o=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZARpgUmCDOM+khdRQ/VsWiwUjbzVfmKaYkSG
 2UPUGM6n42JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQEQAKCRDISVd6bEV1
 MrFSD/oCYZ2DCfv1gx/oCLCKsyMHwLZ9w4U7O6MCYkI5QKCicPOKfpx6glxCSIa0UsvI2/RRSlG
 f5UNkd2NAZ78ujD3QmAamjmaWZpPj7U89pZ9eJ06fxrkPyb1Pke9gY6xHu8Wgah0Jcn2y6gHWfB
 F6s5/E+SMOu3lZcV/05FQIcHgGLBslok72+r4s3YEJwoPTfoPq/FM6wOAOmyZKfwhi+PcOG3kkO
 X5wdGHUaNP6lEJ7Q9kOEdJi2P1PgsBim/t8saL02AHLVvL2s1/BDdylAEdc3+m+89lX5S+jEHMH
 Yode3QMwxe2/mfz05P62WrUGaDuwDYqkoBXSbHWelKHIhRQfxjwI8bY1MmChFOcZm/F/XpiL7ZG
 qSedP9YmLqpRLrxehRpNVe7OGZDTc+jNaIGLhx7RGMgRcDVfVu/2HYJsQXLiWXbyLv7W9ZvrjgV
 rlPawwMwjIoMKImW6Z55fgofNAhrZi/dnWF/iutQicPNkTEPURotpn/c/J+n3YlTUhFj1azuMfT
 2sIw3m62xGvZ9r6IgKY6bOcBE7QUpCj+VbmAHv+4ynwd5a6vgr+bqDLvcf+tbCHTjUyD6t9n/QC
 84m5ZeLEF4zmWXCPclwpQyX+H8O3m7wjS29p7l4tkDLP7t3z7MVfFuNKgcjs+lP3DvHgcBGZots
 Xy4ee5GaaC9pMTg==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Expose the startup and shutdown functions throughout the module so
that they can be called from different source files to the one that
they are defined in - this is in preparation for the runtime resume
and suspend operations being updated to accommodate hibernation and
suspension with an active stream.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-capture.c  | 14 ++++++++++----
 .../media/platform/rockchip/rkisp1/rkisp1-common.h   |  9 +++++++++
 .../media/platform/rockchip/rkisp1/rkisp1-params.c   |  9 +++++++--
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c    | 20 +++++++++++---------
 4 files changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 3204f5afe3bbf1a5de88d57b50a120e716b1345b..3e199814a50f4042624393ee28bbf3b6485e5844 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -953,8 +953,8 @@ static int rkisp1_vb2_buf_prepare(struct vb2_buffer *vb)
 	return 0;
 }
 
-static void rkisp1_return_all_buffers(struct rkisp1_capture *cap,
-				      enum vb2_buffer_state state)
+void rkisp1_return_all_buffers(struct rkisp1_capture *cap,
+			       enum vb2_buffer_state state)
 {
 	struct rkisp1_buffer *buf;
 
@@ -1061,7 +1061,7 @@ static void rkisp1_cap_stream_disable(struct rkisp1_capture *cap)
  * rkisp1_pipeline_stream_enable() and disable the DMA engine.
  * Should be called before video_device_pipeline_stop()
  */
-static void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap)
+void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap)
 	__must_hold(&cap->rkisp1->stream_lock)
 {
 	struct rkisp1_device *rkisp1 = cap->rkisp1;
@@ -1077,7 +1077,7 @@ static void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap)
  * Enable the DMA Engine and call s_stream(true) through the pipeline.
  * Should be called after video_device_pipeline_start()
  */
-static int rkisp1_pipeline_stream_enable(struct rkisp1_capture *cap)
+int rkisp1_pipeline_stream_enable(struct rkisp1_capture *cap)
 	__must_hold(&cap->rkisp1->stream_lock)
 {
 	struct rkisp1_device *rkisp1 = cap->rkisp1;
@@ -1173,6 +1173,12 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 	return ret;
 }
 
+bool rkisp1_vb2_is_streaming(struct rkisp1_capture *cap)
+{
+	return vb2_is_streaming(&cap->vnode.buf_queue) &&
+	       vb2_start_streaming_called(&cap->vnode.buf_queue);
+}
+
 static const struct vb2_ops rkisp1_vb2_ops = {
 	.queue_setup = rkisp1_vb2_queue_setup,
 	.buf_init = rkisp1_vb2_buf_init,
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 90942b22df313d83d9722cc550f01758cda9fa27..8f379a783da1fa97a330a7ec547354eb936cfadd 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -691,6 +691,15 @@ void rkisp1_stats_unregister(struct rkisp1_device *rkisp1);
 int rkisp1_params_register(struct rkisp1_device *rkisp1);
 void rkisp1_params_unregister(struct rkisp1_device *rkisp1);
 
+/* suspend / resume handling helpers */
+bool rkisp1_vb2_is_streaming(struct rkisp1_capture *cap);
+void rkisp1_stats_vb2_return_all_buffers(struct rkisp1_stats *stats);
+void rkisp1_params_vb2_return_buffers(struct rkisp1_params *params);
+void rkisp1_return_all_buffers(struct rkisp1_capture *cap,
+			       enum vb2_buffer_state state);
+int rkisp1_pipeline_stream_enable(struct rkisp1_capture *cap);
+void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap);
+
 #if IS_ENABLED(CONFIG_DEBUG_FS)
 void rkisp1_debug_init(struct rkisp1_device *rkisp1);
 void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1);
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index cc42b5afbf65a9a992323c40cff1a6fe2d8b61e4..1f08b57e616159a389411e13f9217c4f4fcddd57 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2761,9 +2761,8 @@ static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
 	return 0;
 }
 
-static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
+void rkisp1_params_vb2_return_buffers(struct rkisp1_params *params)
 {
-	struct rkisp1_params *params = vq->drv_priv;
 	struct rkisp1_params_buffer *buf;
 	LIST_HEAD(tmp_list);
 
@@ -2778,7 +2777,13 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
 
 	list_for_each_entry(buf, &tmp_list, queue)
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+}
+
+static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
+{
+	struct rkisp1_params *params = vq->drv_priv;
 
+	rkisp1_params_vb2_return_buffers(params);
 	params->enabled_blocks = 0;
 }
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
index fba95a1786be0d6782829a5604d41893dda8e826..c476310b401b39c3bf1784fcc6b521421192877f 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
@@ -128,23 +128,25 @@ static int rkisp1_stats_vb2_buf_prepare(struct vb2_buffer *vb)
 	return 0;
 }
 
-static void rkisp1_stats_vb2_stop_streaming(struct vb2_queue *vq)
+void rkisp1_stats_vb2_return_all_buffers(struct rkisp1_stats *stats)
 {
-	struct rkisp1_stats *stats = vq->drv_priv;
-	struct rkisp1_buffer *buf;
-	unsigned int i;
+	struct rkisp1_buffer *buf, *tmp;
 
 	guard(spinlock_irq)(&stats->lock);
-	for (i = 0; i < RKISP1_ISP_STATS_REQ_BUFS_MAX; i++) {
-		if (list_empty(&stats->stat))
-			break;
-		buf = list_first_entry(&stats->stat,
-				       struct rkisp1_buffer, queue);
+
+	list_for_each_entry_safe(buf, tmp, &stats->stat, queue) {
 		list_del(&buf->queue);
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
 	}
 }
 
+static void rkisp1_stats_vb2_stop_streaming(struct vb2_queue *vq)
+{
+	struct rkisp1_stats *stats = vq->drv_priv;
+
+	rkisp1_stats_vb2_return_all_buffers(stats);
+}
+
 static const struct vb2_ops rkisp1_stats_vb2_ops = {
 	.queue_setup = rkisp1_stats_vb2_queue_setup,
 	.buf_queue = rkisp1_stats_vb2_buf_queue,

-- 
2.43.0

