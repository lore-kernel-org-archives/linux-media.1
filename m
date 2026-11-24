Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540140;
	b=OPbZZGJb9gI6DjM9K8F4SnmK7qgQbJz0/yh5p4NcuzYteO/5fGAVFT93boE/L4PdtoZk
	 YwtnspBAA3uePPtlfWMUfLUUQ8DNrZlatn+IHnGZUz9mcu76C+693c2T5Ui1utnwdaVvl
	 7gsPbOO1oWUWMw7ToCrZFW6rp0bRTdBb5H/Mtl5+WB0EZ1b2ZTv+8BNfHpto0kFMeQyOL
	 bJlSXsx+XIAovVEYf0TtAdGvNkFUX7PE7kXbovz2rjzVUYZVW0rHFsZYHJ4Zal08XySRf
	 Mrex45n5xlNSLSPzi93jdrJZLsm1oLo4N2oe/4zZ/sGaMItyvMvL9nBldchfFNwgS5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540140;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=9tMBs+ekqBtRP//BJhR7OUEUGAmWEFzI+1Fz6fFMi5U=;
	b=PrQK4EM8tsz6Xf3nfPoMwJ1y2fc9Ku6ACll5WVgZzEPvVVm6bLdKzuYgltH957fsB6zA
	 YqSOE8WWflnDI/7SpAnEQIofPByVCNj9eFC2ZFfAvAhYHMOGMIkSzmTWTMkOVw+jsHRAd
	 AJxDuvULO9O9gIjgZREVyYdRT2cN32tgH11x4wIacYzLsIs6AdV7SQxCf/Rrqv0rQ2V12
	 P6pJ3NkaaqkIWZATtpQ266ME+8naiOJ+Qo0IGBVNVSORv4D+HQM4uK/F+ra4DHqcb+G5l
	 ecKiTKNey+pT4alLMum2UDYKifdWvHjwLeKhK5tZnRKoSGNr5mTlCntuncEtvLOgTgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LvWk3EpO;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BF5606A69F;
	Tue, 24 Nov 2026 17:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8BF5606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LvWk3EpO
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A6CD1BD0;
	Tue, 24 Nov 2026 09:08:55 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E6B73F763;
	Tue, 24 Nov 2026 09:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540138; bh=HHZxobOaxskjlijsSkAiLssPLkHhQ2F9nsdAla/vXHM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LvWk3EpO/SMhqNBHIfwL8W9uoJdoeroNCgukgaX/ukqQkZ9CDvR8maK0nHAMOjubO
	 su5g/NAsCaSddocqvkl7vzuiOQBA1H++OB3iAyesMgmTGZfBCTWgB6NJX6/ia2Fsm0
	 70lapKCqAHqQX4xMcWCdu+GSpNLlAvKvbY+SJ1aY=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:46 +0000
Subject: [PATCH 18/24] media: mali-c720: Add 3A statistics video node
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
Message-Id: <20261124-b4-initial-upstream-candidate-v1-18-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Anthony McGivern <anthony.mcgivern@arm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <nayden.kanchev@arm.com>, 
 Konstantin Babin <konstantin.babin@arm.com>, 
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com, 
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Anthony McGivern <Anthony.McGivern@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540079; l=47672;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=ZkCFAi6oa0wpogqrnQOpT3ORZHziXqTKNH+1TeIDKC0=;
 b=ampGkp+ToechEMLbaGyFSfNoUsuhDonzXxaVQwBZTN7ZOenpTS6sW/GHQudEx8IgOeHywSvci
 nnXb92X+Y+wAPQALD7IC3eKGlZlNQ8fmcJETElznLn4cebDNAsdFqvi
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=

From: Anthony McGivern <Anthony.McGivern@arm.com>

Add a metadata capture node for ISP statistics used by userspace image
processing algorithms, such as auto-exposure and auto-white-balance.

Use the ISP's configuration DMA engine (CDMA) scatter-gather unit to
transfer statistics into queued buffers and return them at frame end.
Each buffer carries the sequence number of the processed frame,
matching image buffers produced from that frame.

Initial support exposes colour statistics and pixel intensity
histograms. Available statistics blocks are reported through a read-only
capability control.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 drivers/media/platform/arm/mali-c720/Kconfig       |   1 +
 drivers/media/platform/arm/mali-c720/Makefile      |   1 +
 .../platform/arm/mali-c720/mali-c720-common.h      |  51 ++
 .../media/platform/arm/mali-c720/mali-c720-core.c  |  43 +-
 .../platform/arm/mali-c720/mali-c720-ctx-mgr.c     | 166 ++++-
 .../platform/arm/mali-c720/mali-c720-ctx-mgr.h     |  24 +
 .../media/platform/arm/mali-c720/mali-c720-isp.c   |  17 +-
 .../media/platform/arm/mali-c720/mali-c720-stats.c | 730 +++++++++++++++++++++
 8 files changed, 1028 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c720/Kconfig b/drivers/media/platform/arm/mali-c720/Kconfig
index 576b619fe06c9b96115eeb825f5e8130d9f67395..2785631c258d3c21673d13542658d1ed587b11be 100644
--- a/drivers/media/platform/arm/mali-c720/Kconfig
+++ b/drivers/media/platform/arm/mali-c720/Kconfig
@@ -7,6 +7,7 @@ config VIDEO_MALI_C720
 	select CRC_ITU_T
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
+	select V4L2_ISP
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
diff --git a/drivers/media/platform/arm/mali-c720/Makefile b/drivers/media/platform/arm/mali-c720/Makefile
index b818f6c9b44ef335e78a307ccc232c134e94db61..c48d54dac23a94d429349d90eaf96c19bc017468 100644
--- a/drivers/media/platform/arm/mali-c720/Makefile
+++ b/drivers/media/platform/arm/mali-c720/Makefile
@@ -15,6 +15,7 @@ mali-c720-y := mali-c720-capture.o \
 	      mali-c720-registers-top.o \
 	      mali-c720-registers-ctx-mgr.o \
 	      mali-c720-registers-modules.o \
+	      mali-c720-stats.o \
 	      mali-c720-tpg.o \
 	      mali-c720-vision-pipe.o \
 
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-common.h b/drivers/media/platform/arm/mali-c720/mali-c720-common.h
index 0018c7b5776f34bdd7c262c51972f619255720e2..7a137de2e020d9de18df9918fe54519fab111a38 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-common.h
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-common.h
@@ -27,6 +27,8 @@
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-v4l2.h>
 
+#include <linux/media/arm/mali-c720-config.h>
+
 #include "mali-c720-ctx-mgr.h"
 #include "mali-c720-discovery.h"
 #include "mali-c720-formats.h"
@@ -108,6 +110,7 @@ struct mali_c720_input {
 enum mali_c720_isp_pads {
 	MALI_C720_ISP_PAD_SINK_VIDEO,
 	MALI_C720_ISP_PAD_SOURCE_HV,
+	MALI_C720_ISP_PAD_SOURCE_STATS,
 	MALI_C720_ISP_NUM_PADS,
 };
 
@@ -210,6 +213,42 @@ struct mali_c720_cap_dev {
 	} buffers;
 };
 
+struct mali_c720_stats_buf {
+	struct vb2_v4l2_buffer vb;
+	struct list_head queue;
+	dma_addr_t addr;
+};
+
+struct mali_c720_stats_target {
+	struct mali_c720_cdma_sg_cfg desc[2];
+	u8 num_desc;
+	bool present;
+};
+
+struct mali_c720_stats {
+	struct mali_c720 *mali_c720;
+	unsigned int num_targets;
+	struct mali_c720_stats_target targets[MALI_C720_STATS_MAX];
+	u32 buffer_size;
+	struct video_device vdev;
+	struct vb2_queue queue;
+	struct media_pad pad;
+	/* Mutex to provide to vb2 */
+	struct mutex lock;
+
+	struct {
+		/* Spinlock to guard buffer queue */
+		spinlock_t lock;
+		struct list_head input;
+		struct list_head processing;
+	} buffers;
+
+	struct {
+		struct v4l2_ctrl_handler handler;
+		struct v4l2_ctrl *stats_capabilities;
+	} ctrls;
+};
+
 struct mali_c720_request {
 	struct media_request req;
 	unsigned int queue_sequence;
@@ -283,6 +322,7 @@ struct mali_c720 {
 	struct mali_c720_vision_pipe vision_pipe;
 	struct mali_c720_fr_pipe fr_pipe;
 	struct mali_c720_cap_dev cap_devs[MALI_C720_MAX_NUM_CAP_DEVS];
+	struct mali_c720_stats stats;
 
 	unsigned int num_async_endpoints;
 
@@ -330,6 +370,10 @@ int mali_c720_register_capture_devs(struct mali_c720 *mali_c720);
 void mali_c720_unregister_capture_devs(struct mali_c720 *mali_c720);
 void mali_c720_cleanup_capture_devs(struct mali_c720 *mali_c720);
 
+int mali_c720_register_stats(struct mali_c720 *mali_c720);
+void mali_c720_unregister_stats(struct mali_c720 *mali_c720);
+void mali_c720_cleanup_stats(struct mali_c720 *mali_c720);
+
 void mali_c720_fr_pipe_apply_resizer_config(struct mali_c720_fr_pipe *pipe);
 
 bool mali_c720_cap_dev_uses_requests(struct mali_c720_cap_dev *cap_dev);
@@ -340,6 +384,13 @@ void mali_c720_cap_dev_set_next_buffer(struct mali_c720_cap_dev *cap_dev,
 void mali_c720_cap_dev_buffer_done(struct mali_c720_cap_dev *cap_dev,
 				   bool success);
 
+bool mali_c720_stats_uses_requests(struct mali_c720_stats *stats);
+struct media_request *mali_c720_stats_get_request(struct mali_c720_stats *stats);
+int mali_c720_stats_is_ready(struct mali_c720_stats *stats);
+void mali_c720_stats_set_next_buffer(struct mali_c720_stats *stats,
+				     struct media_request *req);
+void mali_c720_stats_buffer_done(struct mali_c720_stats *stats, bool success);
+
 void mali_c720_isp_queue_event_sof(struct mali_c720 *mali_c720, u32 sequence);
 
 int mali_c720_pipeline_ready(struct mali_c720 *mali_c720);
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-core.c b/drivers/media/platform/arm/mali-c720/mali-c720-core.c
index a6970c921ad486a41073779862bab68a22ce35f1..ad768b0a2e03a0a6f38b72603ccdedaeeee42f0a 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-core.c
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-core.c
@@ -45,6 +45,8 @@ static void mali_c720_remove_links(struct mali_c720 *mali_c720)
 
 	for (i = 0; i < MALI_C720_MAX_NUM_CAP_DEVS; i++)
 		media_entity_remove_links(&mali_c720->cap_devs[i].vdev.entity);
+
+	media_entity_remove_links(&mali_c720->stats.vdev.entity);
 }
 
 static int mali_c720_create_tpg_links(struct mali_c720 *mali_c720,
@@ -142,6 +144,24 @@ static int mali_c720_create_fr_pipe_links(struct mali_c720 *mali_c720)
 	return ret;
 }
 
+static int mali_c720_create_3a_links(struct mali_c720 *mali_c720)
+{
+	struct v4l2_subdev *isp_sd = &mali_c720->isp.mdev.sd;
+	int ret;
+
+	ret = media_create_pad_link(&isp_sd->entity,
+				    MALI_C720_ISP_PAD_SOURCE_STATS,
+				    &mali_c720->stats.vdev.entity, 0,
+				    0);
+	if (ret) {
+		dev_err(mali_c720->dev,
+			"Failed to link ISP and 3A stats node\n");
+		return ret;
+	}
+
+	return ret;
+}
+
 static int mali_c720_create_links(struct mali_c720 *mali_c720)
 {
 	const struct mali_c720_discovery_target tpg = {
@@ -168,6 +188,10 @@ static int mali_c720_create_links(struct mali_c720 *mali_c720)
 	if (ret)
 		goto err_remove_links;
 
+	ret = mali_c720_create_3a_links(mali_c720);
+	if (ret)
+		goto err_remove_links;
+
 	return 0;
 
 err_remove_links:
@@ -181,6 +205,7 @@ static void mali_c720_unregister_video_devices(struct mali_c720 *mali_c720)
 	guard(mutex)(&mali_c720->media_dev.req_queue_mutex);
 
 	mali_c720_unregister_capture_devs(mali_c720);
+	mali_c720_unregister_stats(mali_c720);
 }
 
 static void mali_c720_unregister_entities(struct mali_c720 *mali_c720)
@@ -221,6 +246,10 @@ static int mali_c720_register_entities(struct mali_c720 *mali_c720)
 	if (ret)
 		goto err_unregister_entities;
 
+	ret = mali_c720_register_stats(mali_c720);
+	if (ret)
+		goto err_unregister_entities;
+
 	ret = mali_c720_create_links(mali_c720);
 	if (ret)
 		goto err_unregister_entities;
@@ -341,6 +370,7 @@ static void mali_c720_release(struct v4l2_device *v4l2_dev)
 	struct mali_c720 *mali_c720 = container_of(v4l2_dev, struct mali_c720, v4l2_dev);
 
 	mali_c720_cleanup_capture_devs(mali_c720);
+	mali_c720_cleanup_stats(mali_c720);
 	mali_c720_cleanup_fr_pipe(mali_c720);
 	mali_c720_cleanup_vision_pipe(mali_c720);
 	mali_c720_cleanup_isp(mali_c720);
@@ -538,6 +568,9 @@ static bool mali_c720_has_ready_output(struct mali_c720 *mali_c720)
 {
 	unsigned int i;
 
+	if (!mali_c720_stats_is_ready(&mali_c720->stats))
+		return true;
+
 	for (i = 0; i < MALI_C720_MAX_NUM_CAP_DEVS; i++) {
 		if (!mali_c720_cap_dev_is_ready(&mali_c720->cap_devs[i]))
 			return true;
@@ -569,9 +602,12 @@ mali_c720_oldest_request(struct media_request *oldest, struct media_request *can
 
 static struct media_request *mali_c720_find_request(struct mali_c720 *mali_c720)
 {
-	struct media_request *candidate, *req = NULL;
+	struct media_request *candidate, *req;
 	unsigned int i;
 
+	candidate = mali_c720_stats_get_request(&mali_c720->stats);
+	req = mali_c720_oldest_request(NULL, candidate);
+
 	for (i = 0; i < MALI_C720_MAX_NUM_CAP_DEVS; i++) {
 		candidate = mali_c720_cap_dev_get_request(&mali_c720->cap_devs[i]);
 		req = mali_c720_oldest_request(req, candidate);
@@ -584,6 +620,9 @@ static bool mali_c720_uses_requests(struct mali_c720 *mali_c720)
 {
 	unsigned int i;
 
+	if (mali_c720_stats_uses_requests(&mali_c720->stats))
+		return true;
+
 	for (i = 0; i < MALI_C720_MAX_NUM_CAP_DEVS; i++) {
 		if (mali_c720_cap_dev_uses_requests(&mali_c720->cap_devs[i]))
 			return true;
@@ -632,6 +671,8 @@ void mali_c720_try_schedule_frame(struct mali_c720_context *ctx)
 
 		for (i = 0; i < MALI_C720_MAX_NUM_CAP_DEVS; i++)
 			mali_c720_cap_dev_set_next_buffer(&mali_c720->cap_devs[i], req);
+
+		mali_c720_stats_set_next_buffer(&mali_c720->stats, req);
 	}
 
 	ctx->pipeline_busy = true;
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-ctx-mgr.c b/drivers/media/platform/arm/mali-c720/mali-c720-ctx-mgr.c
index 9391b087f74eed7dbf7f3bc1e2abbe5f8969fe86..cd0cf046ac58a001ec821342b2e64e85755438f1 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-ctx-mgr.c
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-ctx-mgr.c
@@ -188,6 +188,35 @@ static u16 mali_c720_crc16_mcrf4xx_reg(u16 crc, u32 data, u32 mask)
 					    mali_c720_reg_width(mask));
 }
 
+static u16 mali_c720_ctx_mgr_calc_cdma_sg_crc(const struct mali_c720_registers *regs,
+					      const struct mali_c720_cdma_sg_table *sg_table,
+					      unsigned int sg_table_size)
+{
+	const struct mali_c720_cm_sg_regs *load_cdma_sg_load = regs->cm->load_cdma_sg_load;
+	u16 crc = MALI_C720_CRC16_MCRF4XX_INIT;
+	u32 mask;
+	unsigned int i;
+
+	for (i = 0; i < sg_table_size; i++) {
+		const struct mali_c720_cdma_sg_cfg *desc = &sg_table->desc[i];
+
+		/* Load and store register masks are identical */
+		mask = mali_c720_reg_mask(&load_cdma_sg_load->isp_address);
+		crc = mali_c720_crc16_mcrf4xx_reg(crc, desc->isp_address, mask);
+		mask = mali_c720_reg_mask(&load_cdma_sg_load->length_low);
+		crc = mali_c720_crc16_mcrf4xx_reg(crc, desc->length_low, mask);
+		mask = mali_c720_reg_mask(&load_cdma_sg_load->length_high);
+		crc = mali_c720_crc16_mcrf4xx_reg(crc, desc->length_high, mask);
+		mask = mali_c720_reg_mask(&load_cdma_sg_load->axi_address);
+		crc = mali_c720_crc16_mcrf4xx_reg(crc, desc->axi_address, mask);
+		crc = mali_c720_crc16_mcrf4xx_bits(crc, 0, 7);
+		mask = mali_c720_reg_mask(&load_cdma_sg_load->alt_address);
+		crc = mali_c720_crc16_mcrf4xx_reg(crc, desc->alt_address, mask);
+	}
+
+	return crc;
+}
+
 static u16 mali_c720_ctx_mgr_calc_cdma_desc_crc(struct mali_c720_context *ctx)
 {
 	const struct mali_c720_cm_cdma_slot_regs *cdma_slot =
@@ -504,6 +533,92 @@ static void mali_c720_ctx_mgr_prepare_output_fifos(struct mali_c720_context *ctx
 	}
 }
 
+int mali_c720_ctx_mgr_prepare_cdma_sg_descriptors(struct mali_c720 *mali_c720)
+{
+	const struct mali_c720_registers *regs = &mali_c720->registers;
+	struct mali_c720_ctx_mgr *ctx_mgr = &mali_c720->ctx_mgr;
+	struct mali_c720_cdma_sg_table *store = &ctx_mgr->sg_descriptors.store;
+	unsigned int i;
+
+	memset(&ctx_mgr->sg_descriptors, 0, sizeof(ctx_mgr->sg_descriptors));
+
+	for (i = 0; i < MALI_C720_STATS_MAX; i++) {
+		const struct mali_c720_stats_target *target = &mali_c720->stats.targets[i];
+
+		if (!target->present)
+			continue;
+
+		if (target->num_desc > ctx_mgr->cdma_sg_size - store->num_desc) {
+			dev_warn_once(mali_c720->dev, "Insufficient CDMA SG descriptors\n");
+			return -ENOSPC;
+		}
+
+		memcpy(&store->desc[store->num_desc], target->desc,
+		       target->num_desc * sizeof(*target->desc));
+		store->num_desc += target->num_desc;
+	}
+
+	ctx_mgr->sg_descriptors.load.crc =
+		mali_c720_ctx_mgr_calc_cdma_sg_crc(regs, &ctx_mgr->sg_descriptors.load,
+						   ctx_mgr->cdma_sg_size);
+	ctx_mgr->sg_descriptors.store.crc =
+		mali_c720_ctx_mgr_calc_cdma_sg_crc(regs, &ctx_mgr->sg_descriptors.store,
+						   ctx_mgr->cdma_sg_size);
+
+	return 0;
+}
+
+static void mali_c720_ctx_mgr_write_cdma_sg_descriptors(struct mali_c720_context *ctx)
+{
+	struct mali_c720 *mali_c720 = ctx->mali_c720;
+	const struct mali_c720_registers *regs = &mali_c720->registers;
+	const struct mali_c720_cm_sg_regs *load_cdma_sg_load =
+		regs->cm->load_cdma_sg_load;
+	const struct mali_c720_cm_sg_regs *load_cdma_sg_store =
+		regs->cm->load_cdma_sg_store;
+	const struct mali_c720_cm_sg_crc_regs *load_cdma_sg_load_crc =
+		regs->cm->load_cdma_sg_load_crc;
+	const struct mali_c720_cm_sg_crc_regs *load_cdma_sg_store_crc =
+		regs->cm->load_cdma_sg_store_crc;
+	struct mali_c720_ctx_mgr *ctx_mgr = &mali_c720->ctx_mgr;
+	unsigned int i;
+
+	for (i = 0; i < ctx_mgr->cdma_sg_size; i++) {
+		const struct mali_c720_cdma_sg_cfg *load = &ctx_mgr->sg_descriptors.load.desc[i];
+		const struct mali_c720_cdma_sg_cfg *store = &ctx_mgr->sg_descriptors.store.desc[i];
+		u32 base;
+
+		base = mali_c720_group_base(&load_cdma_sg_load->group, i);
+		mali_c720_ctx_group_write(ctx, base, &load_cdma_sg_load->isp_address,
+					  load->isp_address);
+		mali_c720_ctx_group_write(ctx, base, &load_cdma_sg_load->length_low,
+					  load->length_low);
+		mali_c720_ctx_group_write(ctx, base, &load_cdma_sg_load->length_high,
+					  load->length_high);
+		mali_c720_ctx_group_write(ctx, base, &load_cdma_sg_load->axi_address,
+					  load->axi_address);
+		mali_c720_ctx_group_write(ctx, base, &load_cdma_sg_load->alt_address,
+					  load->alt_address);
+
+		base = mali_c720_group_base(&load_cdma_sg_store->group, i);
+		mali_c720_ctx_group_write(ctx, base, &load_cdma_sg_store->isp_address,
+					  store->isp_address);
+		mali_c720_ctx_group_write(ctx, base, &load_cdma_sg_store->length_low,
+					  store->length_low);
+		mali_c720_ctx_group_write(ctx, base, &load_cdma_sg_store->length_high,
+					  store->length_high);
+		mali_c720_ctx_group_write(ctx, base, &load_cdma_sg_store->axi_address,
+					  store->axi_address);
+		mali_c720_ctx_group_write(ctx, base, &load_cdma_sg_store->alt_address,
+					  store->alt_address);
+	}
+
+	mali_c720_ctx_write(ctx, &load_cdma_sg_load_crc->cdma_sg_crc,
+			    ctx_mgr->sg_descriptors.load.crc);
+	mali_c720_ctx_write(ctx, &load_cdma_sg_store_crc->cdma_sg_crc,
+			    ctx_mgr->sg_descriptors.store.crc);
+}
+
 static void mali_c720_ctx_mgr_write_buffer_desc(struct mali_c720_context *ctx,
 						struct mali_c720_buffer_pool *pool,
 						unsigned int index)
@@ -642,6 +757,25 @@ static void mali_c720_ctx_mgr_write_cdma_desc(struct mali_c720_context *ctx)
 			      &cdma_slot->crc, desc->crc);
 }
 
+static void mali_c720_ctx_mgr_update_cdma_desc(struct mali_c720_context *ctx)
+{
+	struct mali_c720 *mali_c720 = ctx->mali_c720;
+	const struct mali_c720_cm_cdma_slot_regs *cdma_slot = mali_c720->registers.cm->cdma_slot;
+	struct mali_c720_cdma_desc *desc = &ctx->cdma_desc;
+	u32 cdma_slot_addr = mali_c720_group_base(&cdma_slot->group, ctx->id);
+
+	desc->crc = mali_c720_ctx_mgr_calc_cdma_desc_crc(ctx);
+
+	mali_c720_group_write(mali_c720, cdma_slot_addr,
+			      &cdma_slot->alt_base_address_low, desc->alt_base_address_low);
+	mali_c720_group_write(mali_c720, cdma_slot_addr,
+			      &cdma_slot->alt_base_address_high, desc->alt_base_address_high);
+	mali_c720_group_write(mali_c720, cdma_slot_addr,
+			      &cdma_slot->st_sg_count, desc->st_sg_count);
+	mali_c720_group_write(mali_c720, cdma_slot_addr,
+			      &cdma_slot->crc, desc->crc);
+}
+
 static void mali_c720_ctx_mgr_write_slot_desc(struct mali_c720_context *ctx)
 {
 	struct mali_c720 *mali_c720 = ctx->mali_c720;
@@ -1245,6 +1379,23 @@ void mali_c720_ctx_mgr_update_buffer(struct mali_c720_context *ctx,
 	mali_c720_ctx_mgr_relinquish_buffer_control(ctx, pool, index);
 }
 
+void mali_c720_ctx_mgr_set_stats_buffer_address(struct mali_c720_context *ctx, dma_addr_t *addr)
+{
+	struct mali_c720_ctx_mgr *ctx_mgr = &ctx->mali_c720->ctx_mgr;
+
+	if (addr) {
+		ctx->cdma_desc.alt_base_address_low = lower_32_bits(*addr);
+		ctx->cdma_desc.alt_base_address_high = upper_32_bits(*addr);
+		ctx->cdma_desc.st_sg_count = ctx_mgr->sg_descriptors.store.num_desc;
+	} else {
+		ctx->cdma_desc.alt_base_address_low = 0;
+		ctx->cdma_desc.alt_base_address_high = 0;
+		ctx->cdma_desc.st_sg_count = 0;
+	}
+
+	mali_c720_ctx_mgr_update_cdma_desc(ctx);
+}
+
 void mali_c720_ctx_mgr_prepare_frame(struct mali_c720_context *ctx)
 {
 	lockdep_assert_held(&ctx->state_lock);
@@ -1273,6 +1424,8 @@ void mali_c720_ctx_mgr_buffer_done(struct mali_c720_context *ctx, bool success)
 
 	for (i = 0; i < MALI_C720_MAX_NUM_CAP_DEVS; i++)
 		mali_c720_cap_dev_buffer_done(&mali_c720->cap_devs[i], success);
+
+	mali_c720_stats_buffer_done(&mali_c720->stats, success);
 }
 
 void mali_c720_ctx_mgr_handle_sw_ready(struct mali_c720_context *ctx)
@@ -1290,6 +1443,7 @@ void mali_c720_ctx_mgr_configure_context(struct mali_c720_context *ctx,
 	struct mali_c720 *mali_c720 = ctx->mali_c720;
 	const struct mali_c720_registers *regs = &mali_c720->registers;
 	const struct mali_c720_pipeline_regs *pipeline = regs->top->pipeline;
+	struct mali_c720_ctx_mgr *ctx_mgr = &mali_c720->ctx_mgr;
 	dma_addr_t ctx_regs_addr = ctx->regs.dma_handle;
 
 	mali_c720_ctx_group_write(ctx, mali_c720->top_base,
@@ -1307,9 +1461,9 @@ void mali_c720_ctx_mgr_configure_context(struct mali_c720_context *ctx,
 	ctx->cdma_desc.units_high = 0;
 	ctx->cdma_desc.base_address_low = lower_32_bits(ctx_regs_addr);
 	ctx->cdma_desc.base_address_high = upper_32_bits(ctx_regs_addr);
-	ctx->cdma_desc.ld_sg_count = 0;
+	ctx->cdma_desc.ld_sg_count = ctx_mgr->sg_descriptors.load.num_desc;
 	ctx->cdma_desc.st_sg_count = 0;
-	ctx->cdma_desc.alt_transfer_size = 0;
+	ctx->cdma_desc.alt_transfer_size = mali_c720->stats.buffer_size;
 	ctx->cdma_desc.alt_base_address_low = 0;
 	ctx->cdma_desc.alt_base_address_high = 0;
 
@@ -1347,6 +1501,7 @@ void mali_c720_ctx_mgr_configure_context(struct mali_c720_context *ctx,
 	ctx->slot_desc_updated = false;
 
 	mali_c720_ctx_mgr_write_cdma_desc(ctx);
+	mali_c720_ctx_mgr_write_cdma_sg_descriptors(ctx);
 }
 
 void mali_c720_ctx_mgr_prepare_context(struct mali_c720_context *ctx,
@@ -1689,6 +1844,7 @@ int mali_c720_init_ctx_mgr(struct mali_c720 *mali_c720)
 		ctx_mgr->num_inputs * ctx_mgr->num_input_streams;
 	ctx_mgr->input_fifo_size = caps->input_fifo_size;
 	ctx_mgr->output_fifo_size = caps->output_fifo_size;
+	ctx_mgr->cdma_sg_size = caps->cdma_sg_size;
 
 	if (!ctx_mgr->num_raw_buffer_descriptors) {
 		dev_err(mali_c720->dev, "No raw buffer descriptors available\n");
@@ -1731,6 +1887,12 @@ int mali_c720_init_ctx_mgr(struct mali_c720 *mali_c720)
 		return -EINVAL;
 	}
 
+	if (ctx_mgr->cdma_sg_size > MALI_C720_MAX_CDMA_SG_DESCRIPTORS) {
+		dev_dbg(mali_c720->dev, "CDMA SG table size %u exceeds driver limit, truncating\n",
+			ctx_mgr->cdma_sg_size);
+		ctx_mgr->cdma_sg_size = MALI_C720_MAX_CDMA_SG_DESCRIPTORS;
+	}
+
 	num_slots = caps->num_slots;
 	if (num_slots <= MALI_C720_NUM_SAFETY_SLOTS) {
 		dev_err(mali_c720->dev,
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-ctx-mgr.h b/drivers/media/platform/arm/mali-c720/mali-c720-ctx-mgr.h
index d5af820cc5527523dd42f00e849466b71871fa8b..05443d91212e97421c6b0f8d7118fe7486edd338 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-ctx-mgr.h
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-ctx-mgr.h
@@ -24,6 +24,7 @@ struct mali_c720_context;
 #define MALI_C720_MAX_STREAMS_PER_INPUT	4
 #define MALI_C720_MAX_VIRTUAL_INPUTS	(MALI_C720_MAX_INPUTS * MALI_C720_MAX_STREAMS_PER_INPUT)
 #define MALI_C720_MAX_CONTEXTS		16
+#define MALI_C720_MAX_CDMA_SG_DESCRIPTORS 32
 #define MALI_C720_NUM_SAFETY_SLOTS	4
 
 enum mali_c720_input_command {
@@ -185,6 +186,20 @@ struct mali_c720_cdma_desc {
 	u32 alt_base_address_high;
 };
 
+struct mali_c720_cdma_sg_cfg {
+	u32 isp_address;
+	u16 length_low;
+	u8 length_high;
+	u32 axi_address;
+	u8 alt_address;
+};
+
+struct mali_c720_cdma_sg_table {
+	struct mali_c720_cdma_sg_cfg desc[MALI_C720_MAX_CDMA_SG_DESCRIPTORS];
+	u16 crc;
+	u8 num_desc;
+};
+
 struct mali_c720_buffer_desc {
 	u16 crc;
 	u8 data_format;
@@ -253,6 +268,10 @@ struct mali_c720_ctx_mgr {
 	u8 input_context_map[MALI_C720_MAX_VIRTUAL_INPUTS];
 	unsigned long raw_buffer_descriptors[BITS_TO_LONGS(MALI_C720_MAX_RAW_BUFFERS)];
 	unsigned long out_buffer_descriptors[BITS_TO_LONGS(MALI_C720_MAX_OUT_BUFFERS)];
+	struct {
+		struct mali_c720_cdma_sg_table load;
+		struct mali_c720_cdma_sg_table store;
+	} sg_descriptors;
 	unsigned int num_raw_buffer_descriptors;
 	unsigned int reuse_buffer;
 	unsigned int num_out_buffer_descriptors;
@@ -260,6 +279,7 @@ struct mali_c720_ctx_mgr {
 	unsigned int num_input_streams;
 	unsigned int num_virtual_inputs;
 	unsigned int num_contexts;
+	unsigned int cdma_sg_size;
 	unsigned int input_fifo_size;
 	unsigned int output_fifo_size;
 };
@@ -272,6 +292,8 @@ void mali_c720_free_context(struct mali_c720_context *ctx);
 
 int mali_c720_init_ctx_mgr(struct mali_c720 *mali_c720);
 
+int mali_c720_ctx_mgr_prepare_cdma_sg_descriptors(struct mali_c720 *mali_c720);
+
 int mali_c720_ctx_mgr_start_context_inputs(struct mali_c720_context *ctx);
 void mali_c720_ctx_mgr_stop_context_inputs(struct mali_c720_context *ctx);
 
@@ -287,6 +309,8 @@ void mali_c720_ctx_mgr_update_buffer(struct mali_c720_context *ctx,
 				     struct mali_c720_buffer_pool *pool,
 				     dma_addr_t *addr,
 				     unsigned int index);
+void mali_c720_ctx_mgr_set_stats_buffer_address(struct mali_c720_context *ctx,
+						dma_addr_t *addr);
 
 void mali_c720_ctx_mgr_configure_context(struct mali_c720_context *ctx,
 					 const struct mali_c720_top_cfg *cfg);
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-isp.c b/drivers/media/platform/arm/mali-c720/mali-c720-isp.c
index 962a2215543b49a6f90159fcb75ac253727cf2b6..a6c4da686bde0b76302ee9ad4fb49a132fa82b7c 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-isp.c
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-isp.c
@@ -23,7 +23,11 @@ static int mali_c720_isp_enum_mbus_code(struct v4l2_subdev *sd,
 	struct mali_c720_mbus_format_match match;
 
 	/* HV uses the sink Bayer order at the internal 16-bit precision. */
-	if (code->pad == MALI_C720_ISP_PAD_SOURCE_HV) {
+	if (code->pad == MALI_C720_ISP_PAD_SOURCE_STATS) {
+		if (code->index)
+			return -EINVAL;
+		code->code = MEDIA_BUS_FMT_METADATA_FIXED;
+	} else if (code->pad == MALI_C720_ISP_PAD_SOURCE_HV) {
 		if (code->index)
 			return -EINVAL;
 
@@ -89,6 +93,8 @@ static int mali_c720_isp_enum_frame_size(struct v4l2_subdev *sd,
 		if (!cfg || !mali_c720_validate_mbus_format_match(cfg, &match))
 			return -EINVAL;
 		break;
+	case MALI_C720_ISP_PAD_SOURCE_STATS:
+		return -ENOTTY;
 	default:
 		return -EINVAL;
 	}
@@ -292,7 +298,7 @@ static const struct v4l2_subdev_ops mali_c720_isp_ops = {
 static int mali_c720_isp_init_state(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *state)
 {
-	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt, *stats_fmt;
 
 	sink_fmt = v4l2_subdev_state_get_format(state, MALI_C720_ISP_PAD_SINK_VIDEO);
 	sink_fmt->width = MALI_C720_DEFAULT_WIDTH;
@@ -308,6 +314,12 @@ static int mali_c720_isp_init_state(struct v4l2_subdev *sd,
 	*src_fmt = *sink_fmt;
 	src_fmt->code = MEDIA_BUS_FMT_SRGGB16_1X16;
 
+	stats_fmt = v4l2_subdev_state_get_format(state, MALI_C720_ISP_PAD_SOURCE_STATS);
+	stats_fmt->width = 0;
+	stats_fmt->height = 0;
+	stats_fmt->field = V4L2_FIELD_NONE;
+	stats_fmt->code = MEDIA_BUS_FMT_METADATA_FIXED;
+
 	return 0;
 }
 
@@ -370,6 +382,7 @@ int mali_c720_register_isp(struct mali_c720 *mali_c720)
 	isp->pads[MALI_C720_ISP_PAD_SINK_VIDEO].flags = MEDIA_PAD_FL_SINK |
 							MEDIA_PAD_FL_MUST_CONNECT;
 	isp->pads[MALI_C720_ISP_PAD_SOURCE_HV].flags = MEDIA_PAD_FL_SOURCE;
+	isp->pads[MALI_C720_ISP_PAD_SOURCE_STATS].flags = MEDIA_PAD_FL_SOURCE;
 
 	ret = media_entity_pads_init(&sd->entity,
 				     MALI_C720_ISP_NUM_PADS,
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-stats.c b/drivers/media/platform/arm/mali-c720/mali-c720-stats.c
new file mode 100644
index 0000000000000000000000000000000000000000..fdb31ef136c04923543a3ac5ba0fa6bfeaeb2ca1
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-stats.c
@@ -0,0 +1,730 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#include <linux/cleanup.h>
+#include <linux/container_of.h>
+#include <linux/dev_printk.h>
+#include <linux/dma-buf.h>
+#include <linux/err.h>
+#include <linux/media-bus-format.h>
+#include <linux/pm_runtime.h>
+#include <linux/string.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-isp.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "mali-c720-common.h"
+
+struct mali_c720_stats_discovery_info {
+	u32 data_offset;
+	u32 table_size;
+	u32 nodes_offset;
+};
+
+static const struct mali_c720_stats_discovery_info
+mali_c720_stats_discovery_info[MALI_C720_STATS_MAX] = {
+	[MALI_C720_STATS_COLOR_HV] = {
+		.data_offset = offsetof(struct mali_c720_stats_color, data),
+		.table_size = offsetof(struct mali_c720_awb_statistics, nodes_used),
+		.nodes_offset = offsetof(struct mali_c720_awb_statistics,
+					 nodes_used.nodes_used_horiz),
+	},
+	[MALI_C720_STATS_HISTOGRAM_INP] = {
+		.data_offset = offsetof(struct mali_c720_stats_histogram, data),
+		.table_size = sizeof(struct mali_c720_ae_1024bin_hist),
+	},
+	[MALI_C720_STATS_HISTOGRAM_HV] = {
+		.data_offset = offsetof(struct mali_c720_stats_histogram, data),
+		.table_size = sizeof(struct mali_c720_ae_1024bin_hist),
+	},
+	[MALI_C720_STATS_HISTOGRAM_HV_IRIDIX] = {
+		.data_offset = offsetof(struct mali_c720_stats_histogram, data),
+		.table_size = sizeof(struct mali_c720_ae_1024bin_hist),
+	},
+};
+
+static const struct mali_c720_discovery_target
+mali_c720_stats_discovery_targets[MALI_C720_STATS_MAX] = {
+	[MALI_C720_STATS_COLOR_HV] = {
+		.module_id = MALI_C720_DISC_MODULE_ID_COLOR_STATS, .module_instance = 0,
+		.pipeline_id = MALI_C720_DISC_PIPE_STATS, .pipeline_instance = 0 },
+	[MALI_C720_STATS_HISTOGRAM_INP] = {
+		.module_id = MALI_C720_DISC_MODULE_ID_HISTOGRAM_STATS, .module_instance = 0,
+		.pipeline_id = MALI_C720_DISC_PIPE_STATS, .pipeline_instance = 0 },
+	[MALI_C720_STATS_HISTOGRAM_HV] = {
+		.module_id = MALI_C720_DISC_MODULE_ID_HISTOGRAM_STATS, .module_instance = 1,
+		.pipeline_id = MALI_C720_DISC_PIPE_STATS, .pipeline_instance = 0 },
+	[MALI_C720_STATS_HISTOGRAM_HV_IRIDIX] = {
+		.module_id = MALI_C720_DISC_MODULE_ID_HISTOGRAM_STATS, .module_instance = 2,
+		.pipeline_id = MALI_C720_DISC_PIPE_STATS, .pipeline_instance = 0 },
+};
+
+static const struct v4l2_isp_stats_block_type_info
+mali_c720_stats_block_types_info[MALI_C720_STATS_MAX] = {
+	[MALI_C720_STATS_COLOR_HV] = {
+		.size = sizeof(struct mali_c720_stats_color),
+	},
+	[MALI_C720_STATS_HISTOGRAM_INP] = {
+		.size = sizeof(struct mali_c720_stats_histogram),
+	},
+	[MALI_C720_STATS_HISTOGRAM_HV] = {
+		.size = sizeof(struct mali_c720_stats_histogram),
+	},
+	[MALI_C720_STATS_HISTOGRAM_HV_IRIDIX] = {
+		.size = sizeof(struct mali_c720_stats_histogram),
+	},
+	[MALI_C720_STATS_NOOP] = {
+		.size = ALIGN(sizeof(struct v4l2_isp_buffer) +
+			      sizeof(struct v4l2_isp_block_header), 16) -
+			sizeof(struct v4l2_isp_buffer),
+	},
+};
+
+static int
+mali_c720_stats_fill_target(struct mali_c720 *mali_c720,
+			    unsigned int block_type,
+			    struct mali_c720_stats_target *target, u32 offset)
+{
+	const struct mali_c720_stats_discovery_info *info;
+	const struct mali_c720_discovery_target *discovery;
+	const struct mali_c720_stat_color_stats_regs *stat_color_stats =
+		mali_c720->registers.modules->stat_color_stats;
+	const struct mali_c720_reg_field *nodes_register = NULL;
+	u32 module_base, table_base;
+	u32 size_words;
+	int ret;
+
+	memset(target, 0, sizeof(*target));
+
+	discovery = &mali_c720_stats_discovery_targets[block_type];
+
+	if (!mali_c720_discovery_module_present(mali_c720, discovery))
+		return -ENOENT;
+
+	ret = mali_c720_discovery_get_module_table_base(mali_c720, discovery, 0,
+							&table_base);
+	if (ret)
+		return ret;
+
+	ret = mali_c720_discovery_get_module_base(mali_c720, discovery, &module_base);
+	if (ret)
+		return ret;
+
+	info = &mali_c720_stats_discovery_info[block_type];
+
+	offset += info->data_offset;
+	size_words = info->table_size / sizeof(u32);
+	/* Destination bits [3:2] are taken from the ISP address. */
+	target->desc[0] = (struct mali_c720_cdma_sg_cfg) {
+		.isp_address = table_base,
+		.axi_address = offset >> 4,
+		.length_low = (u16)(size_words & 0xfff),
+		.length_high = (u8)((size_words >> 12) & 0xf),
+		.alt_address = 1,
+	};
+	target->num_desc = 1;
+
+	if (block_type == MALI_C720_STATS_COLOR_HV) {
+		nodes_register = &stat_color_stats->awb_nodes_used_horiz;
+
+		target->desc[1] = (struct mali_c720_cdma_sg_cfg) {
+			.isp_address = mali_c720_reg_addr(module_base, nodes_register),
+			.axi_address = (offset + info->nodes_offset) >> 4,
+			.length_low = 1,
+			.alt_address = 1,
+		};
+		target->num_desc++;
+	}
+
+	target->present = true;
+
+	return 0;
+}
+
+static int mali_c720_stats_build_target_cache(struct mali_c720 *mali_c720)
+{
+	struct mali_c720_stats *stats = &mali_c720->stats;
+	unsigned int block_type;
+	int ret;
+
+	/* The NOOP aligns the first statistics payload for the CDMA engine. */
+	stats->buffer_size =
+		v4l2_isp_buffer_size(mali_c720_stats_block_types_info[MALI_C720_STATS_NOOP].size);
+	stats->num_targets = 0;
+
+	for (block_type = 0; block_type < MALI_C720_STATS_MAX; block_type++) {
+		if (block_type == MALI_C720_STATS_NOOP)
+			continue;
+
+		ret = mali_c720_stats_fill_target(mali_c720, block_type,
+						  &stats->targets[block_type], stats->buffer_size);
+		if (ret == -ENOENT)
+			continue;
+		if (ret)
+			return ret;
+
+		stats->buffer_size += (u32)mali_c720_stats_block_types_info[block_type].size;
+		stats->num_targets++;
+	}
+
+	if (stats->buffer_size > v4l2_isp_buffer_size(MALI_C720_STATS_MAX_SIZE)) {
+		dev_err(mali_c720->dev, "statistics buffer exceeds maximum size\n");
+		return -EINVAL;
+	}
+
+	if (!stats->num_targets) {
+		dev_err(mali_c720->dev, "no supported statistics blocks found\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int mali_c720_stats_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct mali_c720_stats *stats =
+		container_of(ctrl->handler, struct mali_c720_stats, ctrls.handler);
+	u16 *ids = ctrl->p_new.p_u16;
+	unsigned int block_type;
+
+	if (ctrl->id != V4L2_CID_MALI_C720_STATS_CAPABILITIES)
+		return -EINVAL;
+
+	for (block_type = 0; block_type < MALI_C720_STATS_MAX; block_type++) {
+		if (stats->targets[block_type].present)
+			*ids++ = (u16)block_type;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops mali_c720_stats_ctrl_ops = {
+	.g_volatile_ctrl = mali_c720_stats_g_volatile_ctrl,
+};
+
+static const struct v4l2_ctrl_config mali_c720_stats_caps_ctrl = {
+	.ops = &mali_c720_stats_ctrl_ops,
+	.id = V4L2_CID_MALI_C720_STATS_CAPABILITIES,
+	.name = "Mali-C720 Stats Capabilities",
+	.type = V4L2_CTRL_TYPE_U16,
+	.dims = { MALI_C720_STATS_MAX },
+	.min = 0,
+	.max = U16_MAX,
+	.step = 1,
+	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_VOLATILE,
+};
+
+static int mali_c720_stats_init_buffer(struct mali_c720_stats *stats, void *vaddr)
+{
+	struct mali_c720 *mali_c720 = stats->mali_c720;
+	const unsigned int num_types = ARRAY_SIZE(mali_c720_stats_block_types_info);
+	struct v4l2_isp_buffer *buffer = vaddr;
+	struct v4l2_isp_block_header *header;
+	size_t max_size = stats->buffer_size - sizeof(*buffer);
+	unsigned int block_type;
+
+	memset(buffer, 0, stats->buffer_size);
+	v4l2_isp_stats_init_buffer(buffer, V4L2_ISP_VERSION_V1);
+
+	header = v4l2_isp_stats_init_block(mali_c720->dev, buffer,
+					   mali_c720_stats_block_types_info,
+					   num_types, MALI_C720_STATS_NOOP, max_size);
+	if (IS_ERR(header))
+		return (int)PTR_ERR(header);
+
+	for (block_type = 0; block_type < MALI_C720_STATS_MAX; block_type++) {
+		if (!stats->targets[block_type].present)
+			continue;
+
+		header = v4l2_isp_stats_init_block(mali_c720->dev, buffer,
+						   mali_c720_stats_block_types_info,
+						   num_types, block_type, max_size);
+		if (IS_ERR(header))
+			return (int)PTR_ERR(header);
+	}
+
+	return 0;
+}
+
+static int mali_c720_stats_enum_fmt_meta_cap(struct file *file, void *fh,
+					     struct v4l2_fmtdesc *f)
+{
+	if (f->index)
+		return -EINVAL;
+
+	if (f->mbus_code && f->mbus_code != MEDIA_BUS_FMT_METADATA_FIXED)
+		return -EINVAL;
+
+	f->pixelformat = V4L2_META_FMT_MALI_C720_STATS;
+
+	return 0;
+}
+
+static int mali_c720_stats_g_fmt_meta_cap(struct file *file, void *fh,
+					  struct v4l2_format *f)
+{
+	struct mali_c720_stats *stats = video_drvdata(file);
+
+	const struct v4l2_meta_format mfmt = {
+		.dataformat = V4L2_META_FMT_MALI_C720_STATS,
+		.buffersize = stats->buffer_size
+	};
+
+	f->fmt.meta = mfmt;
+
+	return 0;
+}
+
+static int mali_c720_stats_querycap(struct file *file,
+				    void *priv, struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, MALI_C720_DRIVER_NAME, sizeof(cap->driver));
+	strscpy(cap->card, "ARM Mali-C720 ISP", sizeof(cap->card));
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops mali_c720_stats_v4l2_ioctl_ops = {
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_streamon = mali_c720_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_enum_fmt_meta_cap = mali_c720_stats_enum_fmt_meta_cap,
+	.vidioc_g_fmt_meta_cap = mali_c720_stats_g_fmt_meta_cap,
+	.vidioc_s_fmt_meta_cap = mali_c720_stats_g_fmt_meta_cap,
+	.vidioc_try_fmt_meta_cap = mali_c720_stats_g_fmt_meta_cap,
+	.vidioc_querycap = mali_c720_stats_querycap,
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static const struct v4l2_file_operations mali_c720_stats_v4l2_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = video_ioctl2,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.poll = vb2_fop_poll,
+	.mmap = vb2_fop_mmap,
+};
+
+static int
+mali_c720_stats_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
+			    unsigned int *num_planes, unsigned int sizes[],
+			    struct device *alloc_devs[])
+{
+	struct mali_c720_stats *stats = vb2_get_drv_priv(q);
+
+	if (*num_planes && *num_planes > 1)
+		return -EINVAL;
+
+	if (sizes[0] && sizes[0] < stats->buffer_size)
+		return -EINVAL;
+
+	*num_planes = 1;
+
+	if (!sizes[0])
+		sizes[0] = stats->buffer_size;
+
+	return 0;
+}
+
+static void mali_c720_stats_buf_queue(struct vb2_buffer *vb)
+{
+	struct mali_c720_stats *stats = vb2_get_drv_priv(vb->vb2_queue);
+	struct mali_c720 *mali_c720 = stats->mali_c720;
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct mali_c720_stats_buf *buf = container_of(vbuf, struct mali_c720_stats_buf, vb);
+
+	vb2_set_plane_payload(vb, 0, stats->buffer_size);
+
+	scoped_guard(spinlock, &stats->buffers.lock)
+		list_add_tail(&buf->queue, &stats->buffers.input);
+
+	if (!mali_c720_stats_uses_requests(stats))
+		mali_c720_try_schedule_frame(ctx);
+}
+
+static int mali_c720_stats_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct mali_c720_stats_buf *buf = container_of(vbuf, struct mali_c720_stats_buf, vb);
+
+	buf->addr = vb2_dma_contig_plane_dma_addr(vb, 0);
+	if (!IS_ALIGNED(buf->addr, 16)) {
+		dev_dbg(vb->vb2_queue->dev,
+			"Statistics buffer DMA address is not 16-byte aligned\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mali_c720_stats_buf_prepare(struct vb2_buffer *vb)
+{
+	struct mali_c720_stats *stats = vb2_get_drv_priv(vb->vb2_queue);
+	struct dma_buf *dbuf = vb->planes[0].dbuf;
+	void *vaddr;
+	int ret;
+
+	vaddr = vb2_plane_vaddr(vb, 0);
+	if (!vaddr)
+		return -EFAULT;
+
+	if (dbuf) {
+		ret = dma_buf_begin_cpu_access(dbuf, DMA_BIDIRECTIONAL);
+		if (ret)
+			return ret;
+	}
+
+	ret = mali_c720_stats_init_buffer(stats, vaddr);
+
+	if (dbuf) {
+		int err = dma_buf_end_cpu_access(dbuf, DMA_BIDIRECTIONAL);
+
+		if (!ret)
+			ret = err;
+	}
+
+	return ret;
+}
+
+static void mali_c720_buf_request_complete(struct vb2_buffer *vb)
+{
+}
+
+bool mali_c720_stats_uses_requests(struct mali_c720_stats *stats)
+{
+	return video_is_registered(&stats->vdev) &&
+	       vb2_is_streaming(&stats->queue) &&
+	       stats->queue.uses_requests;
+}
+
+struct media_request *mali_c720_stats_get_request(struct mali_c720_stats *stats)
+{
+	struct mali_c720_stats_buf *buf;
+
+	if (!mali_c720_stats_uses_requests(stats))
+		return NULL;
+
+	guard(spinlock)(&stats->buffers.lock);
+
+	buf = list_first_entry_or_null(&stats->buffers.input,
+				       struct mali_c720_stats_buf, queue);
+
+	return buf ? buf->vb.vb2_buf.request : NULL;
+}
+
+int mali_c720_stats_is_ready(struct mali_c720_stats *stats)
+{
+	struct mali_c720_stats_buf *buf;
+
+	if (!video_is_registered(&stats->vdev))
+		return -ENODEV;
+
+	if (!vb2_is_streaming(&stats->queue))
+		return -ENODEV;
+
+	scoped_guard(spinlock, &stats->buffers.lock) {
+		buf = list_first_entry_or_null(&stats->buffers.input,
+					       struct mali_c720_stats_buf, queue);
+		if (!buf)
+			return -ENOENT;
+	}
+
+	return 0;
+}
+
+void mali_c720_stats_set_next_buffer(struct mali_c720_stats *stats,
+				     struct media_request *req)
+{
+	struct mali_c720 *mali_c720 = stats->mali_c720;
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+	struct mali_c720_stats_buf *buf;
+
+	if (!video_is_registered(&stats->vdev))
+		return;
+
+	if (!vb2_is_streaming(&stats->queue))
+		return;
+
+	scoped_guard(spinlock, &stats->buffers.lock) {
+		buf = list_first_entry_or_null(&stats->buffers.input,
+					       struct mali_c720_stats_buf, queue);
+		if (buf && (!buf->vb.vb2_buf.request ||
+			    buf->vb.vb2_buf.request == req)) {
+			mali_c720_ctx_mgr_set_stats_buffer_address(ctx, &buf->addr);
+			list_move_tail(&buf->queue, &stats->buffers.processing);
+		} else {
+			mali_c720_ctx_mgr_set_stats_buffer_address(ctx, NULL);
+		}
+	}
+}
+
+void mali_c720_stats_buffer_done(struct mali_c720_stats *stats, bool success)
+{
+	struct mali_c720 *mali_c720 = stats->mali_c720;
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+	struct mali_c720_stats_buf *buf;
+
+	if (!video_is_registered(&stats->vdev))
+		return;
+
+	if (!vb2_is_streaming(&stats->queue))
+		return;
+
+	guard(spinlock)(&stats->buffers.lock);
+
+	buf = list_first_entry_or_null(&stats->buffers.processing,
+				       struct mali_c720_stats_buf, queue);
+	if (!buf)
+		return;
+
+	if (success) {
+		buf->vb.vb2_buf.timestamp = ctx->timestamp;
+		buf->vb.sequence = ctx->frame_sequence;
+	}
+
+	vb2_buffer_done(&buf->vb.vb2_buf, success ? VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR);
+	list_del(&buf->queue);
+}
+
+static void mali_c720_stats_return_buffers(struct mali_c720_stats *stats,
+					   enum vb2_buffer_state state)
+{
+	struct mali_c720_stats_buf *buf, *tmp;
+
+	guard(spinlock) (&stats->buffers.lock);
+
+	list_for_each_entry_safe(buf, tmp, &stats->buffers.input, queue) {
+		list_del(&buf->queue);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+
+	list_for_each_entry_safe(buf, tmp, &stats->buffers.processing, queue) {
+		list_del(&buf->queue);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+}
+
+static int mali_c720_stats_start_streaming(struct vb2_queue *q,
+					   unsigned int count)
+{
+	struct mali_c720_stats *stats = vb2_get_drv_priv(q);
+	struct mali_c720 *mali_c720 = stats->mali_c720;
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+	struct v4l2_subdev *isp_sd = &mali_c720->isp.mdev.sd;
+	int ret;
+
+	guard(mutex) (&mali_c720->device_lock);
+
+	if (!media_devnode_is_registered(mali_c720->media_dev.devnode)) {
+		ret = -ENODEV;
+		goto err_return_buffers;
+	}
+
+	ret = pm_runtime_resume_and_get(mali_c720->dev);
+	if (ret)
+		goto err_return_buffers;
+
+	ret = video_device_pipeline_start(&stats->vdev, &mali_c720->pipe);
+	if (ret)
+		goto err_pm_put;
+
+	ret = mali_c720_alloc_context(ctx);
+	if (ret)
+		goto err_stop_pipeline;
+
+	ret = mali_c720_pipeline_ready(mali_c720);
+	if (ret && ret != -EAGAIN)
+		goto err_free_context;
+
+	if (!ret) {
+		ret = v4l2_subdev_enable_streams(isp_sd,
+						 MALI_C720_ISP_PAD_SOURCE_HV,
+						 BIT(0));
+		if (ret)
+			goto err_free_context;
+	}
+
+	return 0;
+
+err_free_context:
+	mali_c720_free_context(ctx);
+err_stop_pipeline:
+	video_device_pipeline_stop(&stats->vdev);
+err_pm_put:
+	pm_runtime_put(mali_c720->dev);
+err_return_buffers:
+	mali_c720_stats_return_buffers(stats, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static void mali_c720_stats_stop_streaming(struct vb2_queue *q)
+{
+	struct mali_c720_stats *stats = vb2_get_drv_priv(q);
+	struct mali_c720 *mali_c720 = stats->mali_c720;
+	struct mali_c720_context *ctx = mali_c720_get_active_context(mali_c720);
+	struct mali_c720_isp *isp = &mali_c720->isp;
+	struct v4l2_subdev *isp_sd = &isp->mdev.sd;
+
+	guard(mutex) (&mali_c720->device_lock);
+
+	v4l2_subdev_disable_streams(isp_sd, MALI_C720_ISP_PAD_SOURCE_HV,
+				    BIT(0));
+	mali_c720_stats_return_buffers(stats, VB2_BUF_STATE_ERROR);
+
+	mali_c720_free_context(ctx);
+
+	video_device_pipeline_stop(&stats->vdev);
+
+	pm_runtime_put_autosuspend(mali_c720->dev);
+}
+
+static const struct vb2_ops mali_c720_stats_vb2_ops = {
+	.queue_setup = mali_c720_stats_queue_setup,
+	.buf_queue = mali_c720_stats_buf_queue,
+	.buf_init = mali_c720_stats_buf_init,
+	.buf_prepare = mali_c720_stats_buf_prepare,
+	.buf_request_complete = mali_c720_buf_request_complete,
+	.start_streaming = mali_c720_stats_start_streaming,
+	.stop_streaming = mali_c720_stats_stop_streaming,
+};
+
+void mali_c720_unregister_stats(struct mali_c720 *mali_c720)
+{
+	struct mali_c720_stats *stats = &mali_c720->stats;
+
+	if (!video_is_registered(&stats->vdev))
+		return;
+
+	vb2_video_unregister_device(&stats->vdev);
+}
+
+void mali_c720_cleanup_stats(struct mali_c720 *mali_c720)
+{
+	struct mali_c720_stats *stats = &mali_c720->stats;
+
+	if (!stats->mali_c720)
+		return;
+
+	v4l2_ctrl_handler_free(&stats->ctrls.handler);
+	media_entity_cleanup(&stats->vdev.entity);
+
+	mutex_destroy(&stats->lock);
+	stats->mali_c720 = NULL;
+}
+
+int mali_c720_register_stats(struct mali_c720 *mali_c720)
+{
+	struct mali_c720_stats *stats = &mali_c720->stats;
+	struct video_device *vdev = &stats->vdev;
+	struct vb2_queue *vb2q = &stats->queue;
+	u32 dims[V4L2_CTRL_MAX_DIMS] = { 0 };
+	int ret;
+
+	ret = mali_c720_stats_build_target_cache(mali_c720);
+	if (ret)
+		return ret;
+
+	ret = mali_c720_ctx_mgr_prepare_cdma_sg_descriptors(mali_c720);
+	if (ret)
+		return ret;
+
+	stats->mali_c720 = mali_c720;
+	mutex_init(&stats->lock);
+	INIT_LIST_HEAD(&stats->buffers.input);
+	INIT_LIST_HEAD(&stats->buffers.processing);
+	spin_lock_init(&stats->buffers.lock);
+
+	ret = v4l2_ctrl_handler_init(&stats->ctrls.handler, 1);
+	if (ret)
+		goto err_destroy_mutex;
+
+	stats->ctrls.stats_capabilities =
+		v4l2_ctrl_new_custom(&stats->ctrls.handler,
+				     &mali_c720_stats_caps_ctrl, NULL);
+	if (stats->ctrls.stats_capabilities) {
+		dims[0] = stats->num_targets;
+		ret = v4l2_ctrl_modify_dimensions(stats->ctrls.stats_capabilities, dims);
+		if (ret)
+			goto err_free_ctrl_handler;
+	}
+
+	if (stats->ctrls.handler.error) {
+		ret = stats->ctrls.handler.error;
+		goto err_free_ctrl_handler;
+	}
+
+	stats->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
+	ret = media_entity_pads_init(&stats->vdev.entity, 1, &stats->pad);
+	if (ret)
+		goto err_free_ctrl_handler;
+
+	vb2q->type = V4L2_BUF_TYPE_META_CAPTURE;
+	vb2q->io_modes = VB2_MMAP | VB2_DMABUF;
+	vb2q->drv_priv = stats;
+	vb2q->mem_ops = &vb2_dma_contig_memops;
+	vb2q->bidirectional = 1;
+	vb2q->ops = &mali_c720_stats_vb2_ops;
+	vb2q->buf_struct_size = sizeof(struct mali_c720_stats_buf);
+	vb2q->min_queued_buffers = 0;
+	vb2q->supports_requests = 1;
+	vb2q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC |
+				V4L2_BUF_FLAG_TSTAMP_SRC_SOE;
+	vb2q->lock = &stats->lock;
+	vb2q->dev = mali_c720->dev;
+
+	ret = vb2_queue_init(vb2q);
+	if (ret) {
+		dev_err(mali_c720->dev, "stats vb2 queue init failed\n");
+		goto err_cleanup_entity;
+	}
+
+	strscpy(stats->vdev.name, "mali-c720 3a stats", sizeof(stats->vdev.name));
+	vdev->release = video_device_release_empty;
+	vdev->fops = &mali_c720_stats_v4l2_fops;
+	vdev->ioctl_ops = &mali_c720_stats_v4l2_ioctl_ops;
+	vdev->lock = &stats->lock;
+	vdev->v4l2_dev = &mali_c720->v4l2_dev;
+	vdev->queue = &stats->queue;
+	vdev->ctrl_handler = &stats->ctrls.handler;
+	vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
+	vdev->vfl_dir = VFL_DIR_RX;
+	video_set_drvdata(vdev, stats);
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(mali_c720->dev,
+			"failed to register stats video device\n");
+		goto err_release_vb2q;
+	}
+
+	return 0;
+
+err_release_vb2q:
+	vb2_queue_release(vb2q);
+err_cleanup_entity:
+	media_entity_cleanup(&stats->vdev.entity);
+err_free_ctrl_handler:
+	v4l2_ctrl_handler_free(&stats->ctrls.handler);
+err_destroy_mutex:
+	mutex_destroy(&stats->lock);
+	stats->mali_c720 = NULL;
+
+	return ret;
+}

-- 
2.55.0

