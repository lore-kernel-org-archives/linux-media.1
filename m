Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102733;
	b=jpwwXBYJmuwMZY3WUDZPwrAx5DpfOFhv9X4gMlTX5UEbm2FFS544QhNWCJFU+nOoOTk6
	 mDKHTtBvmH7sKBMOmL4uctaIKQGZkVymRdOV0rIOmKdLvqUlnCAmkwt0sqqhan574pFdO
	 rNjTg88TWN3FFgfjCtCRGtTcGYy0bn7EwJt0yyPvlPIUnPHOSJFzSI76kHfCqtgtwFURP
	 5mIBiK9qy9s9UH3UU9O0TZvu4spk/iA2jiM9HRzOhULKgtqJyvIAX0rGw8rZg/3jXpZQb
	 EEXom1O1O29Xz9wL1i/ecF5Uwv/05vjBfforZAYq85U7KhJ+vUbaxGaUMKK71zebN/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102733;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WBVrS9N1xxgyj6xbIscOWk4Hhu1tb0upbclT+Zn7JVA=;
	b=zUrsB17RHbtsN2ivODDgELliFNhzMZj5t7HIiG3AKbx/XsokySpzORrSrzqfTxXZds3m
	 vrDORAWS3FFuo4gc/IWKNB+Sj6pHpRu30yoLj6i7VX5ey+Hz7KTfOASXA2vr285AtGOJg
	 ImM6qJTQpsM0hWW/W0IIpVjKFgUMvF1bJ1gZnVRqpq3JdphSYviNDtHNbjjfpVmXO1Hul
	 i33ZloiBZHJnICKkFrClf745h9Mauxwkv3dWitFejhOQEQtvZimHXBgs1a5X0C1yr6tRB
	 rJbAQ1Up+S4vhC+DrNSFTGL292PO9trIGlZdfre0V7Yoqi3l7yqtqHQo0VQyAI/2hTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XOBgXolU;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B2C606A662;
	Thu, 19 Nov 2026 15:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43B2C606A662
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XOBgXolU
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 040C31C25;
	Thu, 19 Nov 2026 07:38:48 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C62A3F882;
	Thu, 19 Nov 2026 07:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102730; bh=w2HusQkhxjv7Cg8ltiK31lfQtFszft1F4alRVLXK+sA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XOBgXolUVIj/akFN0IWiL593IR+AYpMr0QnCslsMxqZ1MxEQC1qs0oyG7gqvQP8hk
	 Oqt4vtcFLKVwsDEiwJQi2eJcMivacjLww9bprph+dzAXliVzAfpkEmjrm5hUKLsB6o
	 uFVgFyvm6fYVVjpVBRXb/sFTMS6gfuxmsCu2n1+s=
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
Subject: [RFC PATCH 13/28] media: mali-vpu: add firmware message transport
Date: Thu, 19 Nov 2026 15:37:43 +0000
Message-ID: <20261119153758.1426673-14-charvi.mehta@arm.com>
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

Add transport support for exchanging messages with the firmware over
the shared circular message queues.

Provide helpers for submitting job, ping and state-change requests and
for parsing firmware state-change, error, job, switch and pong responses.
Validate queue positions and message boundaries, and synchronize
the shared pages around CPU and device access.

This provides the common message transport needed by the subsequent
firmware control and scheduler support.

Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 .../platform/arm/mali-vpu/mali-vpu-firmware.c | 370 ++++++++++++++++++
 .../platform/arm/mali-vpu/mali-vpu-firmware.h |  83 ++++
 .../arm/mali-vpu/mali-vpu-protocol-def-v3.h   | 145 +++++++
 3 files changed, 598 insertions(+)

diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
index 3c552b5fb2d9b..4aead9a062260 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/device.h>
+#include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/string.h>
@@ -381,3 +382,372 @@ void mali_vpu_fw_cleanup(struct mali_vpu_fw *fw)
 	mali_vpu_fw_unmap_core_regions(fw);
 	memset(fw, 0, sizeof(*fw));
 }
+
+/*
+ * Read arbitrary byte count from circular u32 queue payload area.
+ * Return new read position in the queue.
+ */
+static u16 mali_vpu_fw_read32n(u32 *src, u16 offset, u32 *dst, size_t size)
+{
+	u32 v;
+
+	for (; size >= sizeof(u32); size -= sizeof(u32)) {
+		*dst++ = READ_ONCE(src[offset]);
+		offset = (offset + 1) % MVE_COMM_QUEUE_SIZE_IN_WORDS;
+	}
+
+	if (size) {
+		v = READ_ONCE(src[offset]);
+		memcpy(dst, &v, size);
+		offset = (offset + 1) % MVE_COMM_QUEUE_SIZE_IN_WORDS;
+	}
+
+	return offset;
+}
+
+static int mali_vpu_fw_read_msg(struct mali_vpu_fw *fw,
+				struct mali_vpu_fw_proto_page *host_page,
+				struct mali_vpu_fw_proto_page *mve_page,
+				u16 *code, void *payload, size_t *size)
+{
+	struct mve_comm_area_host *host = host_page->cpu;
+	struct mve_comm_area_mve *mve = mve_page->cpu;
+	struct mve_msg_header hdr;
+	u16 rpos, out_wpos;
+	ssize_t capacity;
+
+	if (!host || !mve)
+		return -EINVAL;
+
+	dma_sync_single_for_cpu(fw->dev, mve_page->dma, MALI_VPU_PAGE_SIZE,
+				DMA_FROM_DEVICE);
+
+	rpos = READ_ONCE(host->out_rpos);
+	out_wpos = READ_ONCE(mve->out_wpos);
+
+	if (rpos >= MVE_COMM_QUEUE_SIZE_IN_WORDS ||
+	    out_wpos >= MVE_COMM_QUEUE_SIZE_IN_WORDS)
+		return -EPROTO;
+
+	/* Calculate how much data that is available in the buffer. */
+	capacity = out_wpos - rpos;
+	if (capacity < 0)
+		capacity += MVE_COMM_QUEUE_SIZE_IN_WORDS;
+
+	if (capacity <= 0)
+		return 0;
+
+	/* Firmware publishes out_wpos after writing the message. */
+	dma_rmb();
+
+	rpos = mali_vpu_fw_read32n(mve->out_data, rpos, (u32 *)&hdr, sizeof(hdr));
+
+	/* Make sure there is enough space for both header and message. */
+	capacity -= DIV_ROUND_UP(sizeof(hdr) + hdr.size, sizeof(u32));
+	if (capacity < 0) {
+		dev_err(fw->dev,
+			"fw msg larger than capacity code=%u size=%u, wpos=%u, rpos=%u\n",
+			hdr.code, hdr.size, out_wpos, rpos);
+		return -EPROTO;
+	}
+
+	if (hdr.size > *size)
+		return -EMSGSIZE;
+
+	rpos = mali_vpu_fw_read32n(mve->out_data, rpos,
+				   (u32 *)payload, hdr.size);
+
+	/*
+	 * Finish reading the message before publishing updated consumed queue
+	 * positions to the firmware.
+	 */
+	dma_mb();
+	WRITE_ONCE(host->out_rpos, rpos);
+
+	dma_sync_single_for_device(fw->dev,
+				   host_page->dma + offsetof(struct mve_comm_area_host, out_rpos),
+				   sizeof(host->out_rpos), DMA_TO_DEVICE);
+
+	*code = hdr.code;
+	*size = hdr.size;
+
+	return 1;
+}
+
+/*
+ * Write arbitrary byte count to circular u32 queue payload area.
+ * Return new write position in the queue.
+ */
+static u16 mali_vpu_fw_write32n(u32 *dst, u16 offset, const u32 *src, size_t size)
+{
+	u32 v;
+
+	for (; size >= sizeof(u32); size -= sizeof(u32)) {
+		WRITE_ONCE(dst[offset], *src++);
+		offset = (offset + 1) % MVE_COMM_QUEUE_SIZE_IN_WORDS;
+	}
+
+	if (size) {
+		v = 0;
+		memcpy(&v, src, size);
+		WRITE_ONCE(dst[offset], v);
+		offset = (offset + 1) % MVE_COMM_QUEUE_SIZE_IN_WORDS;
+	}
+
+	return offset;
+}
+
+static int mali_vpu_fw_write_msg(struct mali_vpu_fw *fw,
+				 struct mali_vpu_fw_proto_page *host_page,
+				 struct mali_vpu_fw_proto_page *mve_page,
+				 u16 code, const void *payload, size_t size)
+{
+	struct mve_comm_area_host *host = host_page->cpu;
+	struct mve_comm_area_mve *mve = mve_page->cpu;
+	struct mve_msg_header hdr = { .code = code, .size = size};
+	u16 wpos, in_rpos;
+	int capacity;
+
+	if (!host || !mve)
+		return -EINVAL;
+
+	dma_sync_single_for_cpu(fw->dev,
+				mve_page->dma + offsetof(struct mve_comm_area_mve, in_rpos),
+				sizeof(mve->in_rpos), DMA_FROM_DEVICE);
+
+	wpos = READ_ONCE(host->in_wpos);
+	in_rpos = READ_ONCE(mve->in_rpos);
+
+	if (wpos >= MVE_COMM_QUEUE_SIZE_IN_WORDS || in_rpos >= MVE_COMM_QUEUE_SIZE_IN_WORDS)
+		return -EPROTO;
+
+	/* Calculate how much space that is available in the buffer. */
+	capacity = in_rpos - wpos;
+	if (capacity <= 0)
+		capacity += MVE_COMM_QUEUE_SIZE_IN_WORDS;
+
+	/* Make sure there is enough space for both header and message. */
+	capacity -= DIV_ROUND_UP(sizeof(hdr) + size, sizeof(u32));
+	if (capacity <= 0)
+		return -ENOMEM;
+
+	wpos = mali_vpu_fw_write32n(host->in_data, wpos, (const u32 *)&hdr, sizeof(hdr));
+	wpos = mali_vpu_fw_write32n(host->in_data, wpos, (const u32 *)payload, size);
+
+	/*
+	 * Publish the producer position only after the complete message has
+	 * been written.
+	 */
+	dma_wmb();
+	WRITE_ONCE(host->in_wpos, wpos);
+
+	dma_sync_single_for_device(fw->dev, host_page->dma, sizeof(*host), DMA_TO_DEVICE);
+
+	return 0;
+}
+
+static size_t mali_vpu_get_capacity_bytes(int rpos, int wpos)
+{
+	ssize_t capacity;
+
+	capacity = wpos - rpos;
+	if (capacity < 0)
+		capacity += MVE_COMM_QUEUE_SIZE_IN_WORDS;
+
+	return capacity * sizeof(u32);
+}
+
+static void mali_vpu_fw_print_debug(struct mali_vpu_fw *fw)
+{
+	struct mve_comm_area_host *host = fw->msg_host.cpu;
+	struct mve_comm_area_mve *mve = fw->msg_mve.cpu;
+	struct mve_msg_header hdr;
+	u16 rpos, wpos;
+	size_t capacity;
+
+	dma_sync_single_for_cpu(fw->dev, fw->msg_mve.dma, MALI_VPU_PAGE_SIZE,
+				DMA_FROM_DEVICE);
+
+	dev_dbg(fw->dev,
+		"dump message q. host={out_rpos=%u, in_wpos=%u}, mve={out_wpos=%u, in_rpos=%u}\n",
+		host->out_rpos, host->in_wpos, mve->out_wpos, mve->in_rpos);
+
+	rpos = READ_ONCE(host->out_rpos);
+	wpos = READ_ONCE(mve->out_wpos);
+
+	if (rpos >= MVE_COMM_QUEUE_SIZE_IN_WORDS ||
+	    wpos >= MVE_COMM_QUEUE_SIZE_IN_WORDS)
+		return;
+
+	/* Firmware publishes out_wpos after writing the message. */
+	dma_rmb();
+
+	while ((capacity = mali_vpu_get_capacity_bytes(rpos, wpos)) >= sizeof(hdr)) {
+		unsigned int pos;
+
+		pos = mali_vpu_fw_read32n(mve->out_data, rpos, (u32 *)&hdr, sizeof(hdr));
+
+		dev_dbg(fw->dev,
+			"queue={rpos=%u, wpos=%u, capacity=%zu}, msg={code=%u, size=%u}\n",
+			rpos, wpos, capacity, hdr.code, hdr.size);
+
+		capacity = mali_vpu_get_capacity_bytes(pos, wpos);
+		if (hdr.size > capacity) {
+			dev_dbg(fw->dev,
+				"size is larger than capacity. capacity=%zu, size=%u.\n",
+				capacity, hdr.size);
+			return;
+		}
+
+		rpos = (pos + DIV_ROUND_UP(hdr.size, sizeof(u32))) % MVE_COMM_QUEUE_SIZE_IN_WORDS;
+	}
+}
+
+int mali_vpu_fw_send_job(struct mali_vpu_fw *fw, u16 cores, u16 frames)
+{
+	struct mve_request_job job = {
+		.cores = cores,
+		.frames = frames,
+		.flags = 0,
+	};
+
+	return mali_vpu_fw_write_msg(fw, &fw->msg_host, &fw->msg_mve,
+				     MVE_REQUEST_CODE_JOB, &job, sizeof(job));
+}
+
+int mali_vpu_fw_send_ping(struct mali_vpu_fw *fw)
+{
+	return mali_vpu_fw_write_msg(fw, &fw->msg_host, &fw->msg_mve,
+				     MVE_REQUEST_CODE_PING, NULL, 0);
+}
+
+int mali_vpu_fw_send_state_change(struct mali_vpu_fw *fw, enum mali_vpu_fw_state state)
+{
+	u16 code;
+
+	switch (state) {
+	case MALI_VPU_FW_STATE_STOPPED:
+		code = MVE_REQUEST_CODE_STOP;
+		break;
+	case MALI_VPU_FW_STATE_RUNNING:
+		code = MVE_REQUEST_CODE_GO;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return mali_vpu_fw_write_msg(fw, &fw->msg_host, &fw->msg_mve, code, NULL, 0);
+}
+
+int mali_vpu_fw_parse_msg(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *msg)
+{
+	u16 code;
+	union {
+		struct mve_response_state_change state_change;
+		struct mve_response_error error;
+	} fw_msg = {};
+	size_t size = sizeof(fw_msg);
+	int ret;
+
+	if (!fw || !msg)
+		return -EINVAL;
+
+	ret = mali_vpu_fw_read_msg(fw, &fw->msg_host, &fw->msg_mve, &code,
+				   &fw_msg, &size);
+	if (ret <= 0)
+		return ret; /* 0 = no msg, <0 = error */
+
+	memset(msg, 0, sizeof(*msg));
+
+	switch (code) {
+	case MVE_RESPONSE_CODE_SWITCHED_IN:
+		msg->code = MALI_VPU_FW_CODE_SWITCH_IN;
+		break;
+	case MVE_RESPONSE_CODE_SWITCHED_OUT:
+		msg->code = MALI_VPU_FW_CODE_SWITCH_OUT;
+		break;
+	case MVE_RESPONSE_CODE_JOB_DEQUEUED:
+		msg->code = MALI_VPU_FW_CODE_JOB;
+		break;
+	case MVE_RESPONSE_CODE_PONG:
+		msg->code = MALI_VPU_FW_CODE_PONG;
+		break;
+	case MVE_RESPONSE_CODE_IDLE:
+		msg->code = MALI_VPU_FW_CODE_IDLE;
+		break;
+	case MVE_RESPONSE_CODE_STATE_CHANGE: {
+		if (size != sizeof(fw_msg.state_change))
+			return -EPROTO;
+
+		msg->code = MALI_VPU_FW_CODE_STATE_CHANGE;
+
+		switch (fw_msg.state_change.new_state) {
+		case MVE_STATE_STOPPED:
+			msg->data.state = MALI_VPU_FW_STATE_STOPPED;
+			break;
+		case MVE_STATE_RUNNING:
+			msg->data.state = MALI_VPU_FW_STATE_RUNNING;
+			break;
+		default:
+			return -EPROTO;
+		}
+		break;
+	}
+	case MVE_RESPONSE_CODE_ERROR: {
+		size_t message_offset = offsetof(struct mve_response_error, message);
+		size_t message_size;
+
+		if (size < message_offset + 1 || size > sizeof(fw_msg.error))
+			return -EPROTO;
+
+		message_size = size - message_offset;
+		if (fw_msg.error.message[message_size - 1] != '\0')
+			return -EPROTO;
+
+		msg->code = MALI_VPU_FW_CODE_ERROR;
+
+		switch (fw_msg.error.error_code) {
+		case MVE_ERROR_ABORT:
+			msg->data.error.error_code = MALI_VPU_FW_ERROR_ABORT;
+			break;
+		case MVE_ERROR_OUT_OF_MEMORY:
+			msg->data.error.error_code = MALI_VPU_FW_ERROR_OUT_OF_MEMORY;
+			break;
+		case MVE_ERROR_ASSERT:
+			msg->data.error.error_code = MALI_VPU_FW_ERROR_ASSERT;
+			break;
+		case MVE_ERROR_UNSUPPORTED:
+			msg->data.error.error_code = MALI_VPU_FW_ERROR_UNSUPPORTED;
+			break;
+		case MVE_ERROR_INVALID_BUFFER:
+			msg->data.error.error_code = MALI_VPU_FW_ERROR_INVALID_BUFFER;
+			break;
+		case MVE_ERROR_INVALID_STATE:
+			msg->data.error.error_code = MALI_VPU_FW_ERROR_INVALID_STATE;
+			break;
+		case MVE_ERROR_WATCHDOG:
+			msg->data.error.error_code = MALI_VPU_FW_ERROR_WATCHDOG;
+			break;
+		default:
+			msg->data.error.error_code = MALI_VPU_FW_ERROR_UNKNOWN;
+			dev_warn(fw->dev, "unsupported fw error code. code=%u.\n",
+				 fw_msg.error.error_code);
+			break;
+		}
+
+		strscpy(msg->data.error.message, fw_msg.error.message,
+			min(sizeof(msg->data.error.message), sizeof(fw_msg.error.message)));
+
+		break;
+	}
+	default:
+		dev_warn(fw->dev,
+			 "unknown fw message code. code=%u, size=%zu.\n",
+			 code, size);
+		msg->code = MALI_VPU_FW_CODE_UNKNOWN;
+		mali_vpu_fw_print_debug(fw);
+		break;
+	}
+
+	return ret;
+}
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
index a40928db774f0..f26fd78101661 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-firmware.h
@@ -15,6 +15,85 @@ struct mali_vpu_mmu;
 struct mali_vpu_fw_bin;
 struct mali_vpu_mmu_pages;
 
+/**
+ * enum mali_vpu_fw_state - Firmware execution state.
+ * @MALI_VPU_FW_STATE_STOPPED: Firmware is STOPPED.
+ * @MALI_VPU_FW_STATE_RUNNING: Firmware is RUNNING.
+ */
+enum mali_vpu_fw_state {
+	MALI_VPU_FW_STATE_STOPPED,
+	MALI_VPU_FW_STATE_RUNNING
+};
+
+/**
+ * struct mali_vpu_fw_job - Job request.
+ * @cores: Number for cores to use.
+ * @frames: Number of frames to process before job is switched out.
+ */
+struct mali_vpu_fw_job {
+	unsigned int cores;
+	unsigned int frames;
+};
+
+/**
+ * struct mali_vpu_fw_error - Firmware error message.
+ * @error_code: What kind of error that was reported.
+ * @message: Error message string.
+ */
+struct mali_vpu_fw_error {
+	enum {
+		MALI_VPU_FW_ERROR_UNKNOWN,
+		MALI_VPU_FW_ERROR_ABORT,
+		MALI_VPU_FW_ERROR_OUT_OF_MEMORY,
+		MALI_VPU_FW_ERROR_ASSERT,
+		MALI_VPU_FW_ERROR_UNSUPPORTED,
+		MALI_VPU_FW_ERROR_INVALID_BUFFER,
+		MALI_VPU_FW_ERROR_INVALID_STATE,
+		MALI_VPU_FW_ERROR_WATCHDOG
+	} error_code;
+	char message[128];
+};
+
+/**
+ * enum mali_vpu_fw_code - Driver representation of firmware messages.
+ * @MALI_VPU_FW_CODE_ERROR: Firmware reported fatal error.
+ * @MALI_VPU_FW_CODE_JOB: Firmware dequeued a job.
+ * @MALI_VPU_FW_CODE_PING: Ping request sent to firmware.
+ * @MALI_VPU_FW_CODE_PONG: Firmware responded to a ping request.
+ * @MALI_VPU_FW_CODE_IDLE: Firmware informs the driver that it's idle.
+ * @MALI_VPU_FW_CODE_STATE_CHANGE: Firmware state-change request or response.
+ * @MALI_VPU_FW_CODE_SWITCH_IN: Firmware was booted on a Core in a session.
+ * @MALI_VPU_FW_CODE_SWITCH_OUT: The last core in a session was switched out.
+ * @MALI_VPU_FW_CODE_UNKNOWN: Unrecognized firmware message.
+ * @MALI_VPU_FW_CODE_MAX: Sentinel marking the end of the message-code enum.
+ */
+enum mali_vpu_fw_code {
+	MALI_VPU_FW_CODE_ERROR,        /* Driver <- Firmware. */
+	MALI_VPU_FW_CODE_JOB,          /* Driver -> Firmware. */
+	MALI_VPU_FW_CODE_PING,         /* Driver -> Firmware. */
+	MALI_VPU_FW_CODE_PONG,         /* Driver <- Firmware. */
+	MALI_VPU_FW_CODE_IDLE,         /* Driver <- Firmware. */
+	MALI_VPU_FW_CODE_STATE_CHANGE, /* Driver <-> Firmware. */
+	MALI_VPU_FW_CODE_SWITCH_IN,    /* Driver <- Firmware. */
+	MALI_VPU_FW_CODE_SWITCH_OUT,   /* Driver <-> Firmware. */
+	MALI_VPU_FW_CODE_UNKNOWN,      /* Driver <- Firmware. */
+	MALI_VPU_FW_CODE_MAX
+};
+
+/**
+ * struct mali_vpu_fw_msg - Parsed firmware message.
+ * @code: Driver representation of the firmware message code.
+ * @data: Message-specific decoded payload.
+ */
+struct mali_vpu_fw_msg {
+	enum mali_vpu_fw_code code;
+	union {
+		enum mali_vpu_fw_state state;
+		struct mali_vpu_fw_job job;
+		struct mali_vpu_fw_error error;
+	} data;
+};
+
 /**
  * enum mali_vpu_fw_region - Regions in the firmware virtual address space.
  * @MALI_VPU_FW_REGION_MSG_HOST: Host-to-firmware message queue.
@@ -104,5 +183,9 @@ struct mali_vpu_fw {
 int mali_vpu_fw_construct(struct mali_vpu_fw *fw, const struct mali_vpu_fw_bin *fw_bin,
 			  struct device *dev, struct mali_vpu_mmu *mmu, u32 ncores);
 void mali_vpu_fw_cleanup(struct mali_vpu_fw *fw);
+int mali_vpu_fw_send_job(struct mali_vpu_fw *fw, u16 cores, u16 frames);
+int mali_vpu_fw_send_ping(struct mali_vpu_fw *fw);
+int mali_vpu_fw_send_state_change(struct mali_vpu_fw *fw, enum mali_vpu_fw_state state);
+int mali_vpu_fw_parse_msg(struct mali_vpu_fw *fw, struct mali_vpu_fw_msg *msg);
 
 #endif /* __MALI_VPU_FIRMWARE_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
index b6d46f91287c4..3523ac3e49f1d 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-protocol-def-v3.h
@@ -122,6 +122,151 @@
 /* One struct mve_rpc_communication_area located here */
 #define MVE_COMM_RPC_ADDR	(0x1007F000u)
 
+/*
+ * One page of memory (4 kB) is used for each queue,
+ * so maximum 1024 words, but need room for some counters as well,
+ * see structs mve_comm_area_mve and mve_comm_area_host below.
+ */
+#define MVE_COMM_QUEUE_SIZE_IN_WORDS 1020
+
+/* This is the part of the message area that is written by host. */
+struct mve_comm_area_host {
+	u16 out_rpos;
+	u16 in_wpos;
+	u32 reserved[3];
+	/*
+	 * Queue of messages to MVE, each block of data prefixed with
+	 * a mve_msg_header
+	 */
+	u32 in_data[MVE_COMM_QUEUE_SIZE_IN_WORDS];
+};
+
+/* This is the part of the message area that is written by MVE. */
+struct mve_comm_area_mve {
+	u16 out_wpos;
+	u16 in_rpos;
+	u32 reserved[3];
+	/*
+	 * Queue of messages to host, each block of data prefixed with
+	 * a mve_msg_header
+	 */
+	u32 out_data[MVE_COMM_QUEUE_SIZE_IN_WORDS];
+};
+
+/*********************************************************************
+ *
+ *   Message codes
+ *
+ *********************************************************************/
+
+/*
+ * Messages consist of one struct mve_msg_header, possibly followed
+ * by extra data.
+ */
+struct mve_msg_header {
+	u16 code;
+		/*
+		 * REQUESTs are messages from the
+		 * host/driver to the firmware:               Code:     Extra data in message:
+		 */
+		#define MVE_REQUEST_CODE_GO                   (1001) /* no extra data */
+		#define MVE_REQUEST_CODE_STOP                 (1002) /* no extra data */
+		#define MVE_REQUEST_CODE_PING                 (1006) /* no extra data */
+		#define MVE_REQUEST_CODE_JOB                  (1009) /* struct mve_request_job */
+
+		/*
+		 * RESPONSEs are messages from
+		 * the firmware to the host:
+		 */
+		/* struct mve_response_switched_in */
+		#define MVE_RESPONSE_CODE_SWITCHED_IN         (2001)
+		/* struct mve_response_switched_out */
+		#define MVE_RESPONSE_CODE_SWITCHED_OUT        (2002)
+		/* struct mve_response_job_dequeued */
+		#define MVE_RESPONSE_CODE_JOB_DEQUEUED        (2004)
+		#define MVE_RESPONSE_CODE_PONG                (2009)
+		/* struct mve_response_error */
+		#define MVE_RESPONSE_CODE_ERROR               (2010)
+		/* struct mve_response_state_change */
+		#define MVE_RESPONSE_CODE_STATE_CHANGE        (2011)
+		#define MVE_RESPONSE_CODE_IDLE                (2013)
+
+	u16 size; /* size in bytes of trailing data, 0 if none */
+};
+
+/*********************************************************************
+ *
+ *   REQUESTs are messages from the host to the firmware
+ *
+ *   Some of the MVE_REQUEST_CODE_ codes are followed by one of the
+ *   structs below.
+ *
+ *********************************************************************/
+
+struct mve_request_job {
+	u16 cores; /* >= 1, number of cores to use, must match request to HW scheduler */
+	u16 frames; /* number of frames to process, zero means infinite */
+	u32 flags; /* can be zero */
+		#define MVE_JOB_FLAG_DISABLE_BNDMGR (0x01)
+};
+
+/*********************************************************************
+ *
+ *   RESPONSEs are messages from the firmware to the host
+ *
+ *   Some of the MVE_RESPONSE_CODE_ codes are followed by one of the
+ *   structs below.
+ *
+ *********************************************************************/
+
+/* Sent when firmware has booted. */
+struct mve_response_switched_in {
+	u32 core;
+};
+
+/* Sent when last core in a session has switched out. */
+struct mve_response_switched_out {
+	u32 core;
+	u32 reason;
+	u32 sub_reason;
+};
+
+/*
+ * Response confirming state transition after either GO or STOP
+ * command from host.
+ */
+struct mve_response_state_change {
+	u32 new_state;
+		#define MVE_STATE_STOPPED (0)
+		#define MVE_STATE_RUNNING (2)
+};
+
+/*
+ * Message sent when all cores in the session have dequeued a
+ * job from the firmware job queue.
+ */
+struct mve_response_job_dequeued {
+	u32 valid_job;
+};
+
+/*
+ * Fatal error message from firmware, if sent then no further
+ * operation is possible.
+ */
+struct mve_response_error {
+	u32 error_code;
+		#define MVE_ERROR_ABORT          (1)
+		#define MVE_ERROR_OUT_OF_MEMORY  (2)
+		#define MVE_ERROR_ASSERT         (3)
+		#define MVE_ERROR_UNSUPPORTED    (4)
+		#define MVE_ERROR_INVALID_BUFFER (6)
+		#define MVE_ERROR_INVALID_STATE  (8)
+		#define MVE_ERROR_WATCHDOG       (9)
+
+		#define MVE_MAX_ERROR_MESSAGE_SIZE  (128)
+	char message[MVE_MAX_ERROR_MESSAGE_SIZE];
+};
+
  #define MVE_CHROMA_FORMAT_420 (0x1)
 
 /* format bitfield: */
-- 
2.43.0

