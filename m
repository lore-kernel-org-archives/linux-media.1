Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EB72D12EC
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 12:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834067; cv=none; b=Qf9nZTu9EIgvAu6OdUesYGSlBfOIIxfcvCJ0LA3Gm5za/1yFmUAmfFV6EGBAAf6PdAcXSsID+1g2mXkU1TeLZinlE43RjHatARsEx/hT9aIULiM5y1mYajydzoZCl2KzU293a5hErAyGhq1HzTBCo9kv32909wOzuRKFaeKyFIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834067; c=relaxed/simple;
	bh=JF9kebROsFH8YQh2N8Pco7kNgRFNLwErj3IBiQfT3Ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gwkvs756AkyTj4nOO1qd5EOi/nPgiSo9CMTpwxoTuqaH6CS2lf/4C8Zj0tgLM75YL1XT1yGJc//E5tt5IbRWceXPVVFZD3BX1UjAHal5BgPwx8wcj/+gC1TjEro/p1RohVjILQTrqtoZ/4fSaLs9k8Vh6HROsS1ev2xsyCb52y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KpbjY72M; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KpbjY72M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834066; x=1819370066;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JF9kebROsFH8YQh2N8Pco7kNgRFNLwErj3IBiQfT3Ss=;
  b=KpbjY72MM6FWANz4xGKjBmcZWdS9w7aJW1CNW7coRngVrEfhCAvSwxZ/
   kcGGGjANCLonAznvymmYqep558CCCRxCu/iB32rSa1qVV39PLGGyLy78Y
   6zUIDUWduJfx/37ubzwdyghaRNbMrvoqQyG9FYbqy1ewfyrs9RYiZ1rPC
   OHLzeWoHRuxUIG2kOS7aGgEKq+LptrfuCXvHLGIEK4z5Oel3Mm2ahCRCG
   mAuowZDJ57G8GMwVmfP+C1onzdzjCjHWklNWuqcsOTaptv6tI9rRsHUOt
   bPBBEVcUMWe4vUKXdFY7se0NQ94vrtQICoAFLdTSwRBV7sQdgub/tXCeC
   g==;
X-CSE-ConnectionGUID: y/BEMx4rRiG4HqFT/ZZsFg==
X-CSE-MsgGUID: CmYPMy0VQVGZsykuZpmJbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88188617"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88188617"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:26 -0700
X-CSE-ConnectionGUID: s9Wj0Q/GS9mB1Wu9MhprSQ==
X-CSE-MsgGUID: 7C7mxhoDT1OE1I/9xZvVVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271384427"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO alaakso-desk.kioski) ([10.125.109.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:34:24 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	sarang.sapre@intel.com
Cc: daxing.li@intel.com,
	ong.hock.yu@intel.com,
	antti.laakso@linux.intel.com
Subject: [PATCH v3 18/44] media: ipu6: Move isys isr handlers to fw file
Date: Thu, 27 Aug 2026 15:33:10 +0300
Message-ID: <20260827123336.2219048-19-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827123336.2219048-1-antti.laakso@linux.intel.com>
References: <20260827123336.2219048-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ipu7 will have its own isr handlers. Move ipu6 isr
code to hardware specific file.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c | 259 +++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h |   3 +
 drivers/media/pci/intel/ipu6/ipu6-isys.c    | 263 +-------------------
 3 files changed, 263 insertions(+), 262 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
index fc2f24c05de7..7f7125202ffd 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -487,3 +487,262 @@ ipu6_fw_isys_dump_frame_buff_set(struct device *dev,
 
 	dev_dbg(dev, "-----------------------------------------------------\n");
 }
+
+struct fwmsg {
+	int type;
+	char *msg;
+	bool valid_ts;
+};
+
+static const struct fwmsg fw_msg[] = {
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE, "STREAM_OPEN_DONE", 0},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_CLOSE_ACK, "STREAM_CLOSE_ACK", 0},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_START_ACK, "STREAM_START_ACK", 0},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK,
+	 "STREAM_START_AND_CAPTURE_ACK", 0},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_STOP_ACK, "STREAM_STOP_ACK", 0},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_FLUSH_ACK, "STREAM_FLUSH_ACK", 0},
+	{IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_READY, "PIN_DATA_READY", 1},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_ACK, "STREAM_CAPTURE_ACK", 0},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE,
+	 "STREAM_START_AND_CAPTURE_DONE", 1},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_DONE, "STREAM_CAPTURE_DONE", 1},
+	{IPU6_FW_ISYS_RESP_TYPE_FRAME_SOF, "FRAME_SOF", 1},
+	{IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF, "FRAME_EOF", 1},
+	{IPU6_FW_ISYS_RESP_TYPE_STATS_DATA_READY, "STATS_READY", 1},
+	{-1, "UNKNOWN MESSAGE", 0}
+};
+
+static u32 resp_type_to_index(int type)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(fw_msg); i++)
+		if (fw_msg[i].type == type)
+			return i;
+
+	return  ARRAY_SIZE(fw_msg) - 1;
+}
+
+int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
+{
+	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
+	struct ipu6_fw_isys_resp_info_abi *resp;
+	struct ipu6_isys_stream *stream;
+	struct ipu6_isys_csi2 *csi2 = NULL;
+	u32 index;
+	u64 ts;
+
+	if (!isys->fwctx)
+		return 1;
+
+	resp = ipu6_fw_isys_get_resp(isys);
+	if (!resp)
+		return 1;
+
+	ts = (u64)resp->timestamp[1] << 32 | resp->timestamp[0];
+
+	index = resp_type_to_index(resp->type);
+	dev_dbg(&adev->auxdev.dev,
+		"FW resp %02d %s, stream %u, ts 0x%16.16llx, pin %d\n",
+		resp->type, fw_msg[index].msg, resp->stream_handle,
+		fw_msg[index].valid_ts ? ts : 0, resp->pin_id);
+
+	if (resp->error_info.error == IPU6_FW_ISYS_ERROR_STREAM_IN_SUSPENSION)
+		/* Suspension is kind of special case: not enough buffers */
+		dev_dbg(&adev->auxdev.dev,
+			"FW error resp SUSPENSION, details %d\n",
+			resp->error_info.error_details);
+	else if (resp->error_info.error)
+		dev_dbg(&adev->auxdev.dev,
+			"FW error resp error %d, details %d\n",
+			resp->error_info.error, resp->error_info.error_details);
+
+	if (resp->stream_handle >= IPU6_ISYS_MAX_STREAMS) {
+		dev_err(&adev->auxdev.dev, "bad stream handle %u\n",
+			resp->stream_handle);
+		goto leave;
+	}
+
+	stream = ipu6_isys_query_stream_by_handle(isys, resp->stream_handle);
+	if (!stream) {
+		dev_err(&adev->auxdev.dev, "stream of stream_handle %u is unused\n",
+			resp->stream_handle);
+		goto leave;
+	}
+	stream->error = resp->error_info.error;
+
+	csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
+
+	switch (resp->type) {
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE:
+		complete(&stream->stream_open_completion);
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CLOSE_ACK:
+		complete(&stream->stream_close_completion);
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_START_ACK:
+		complete(&stream->stream_start_completion);
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK:
+		complete(&stream->stream_start_completion);
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_STOP_ACK:
+		complete(&stream->stream_stop_completion);
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_FLUSH_ACK:
+		complete(&stream->stream_stop_completion);
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_READY:
+		/*
+		 * firmware only release the capture msg until software
+		 * get pin_data_ready event
+		 */
+		ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), resp->buf_id);
+		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS &&
+		    stream->output_pins_queue[resp->pin_id])
+			ipu6_isys_queue_buf_ready(stream, resp);
+		else
+			dev_warn(&adev->auxdev.dev,
+				 "%d:No queue for pin id %d\n",
+				 resp->stream_handle, resp->pin_id);
+		if (csi2)
+			ipu6_isys_csi2_error(csi2);
+
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_ACK:
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE:
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_DONE:
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_FRAME_SOF:
+
+		ipu6_isys_csi2_sof_event_by_stream(stream);
+		stream->seq[stream->seq_index].sequence =
+			atomic_read(&stream->sequence) - 1;
+		stream->seq[stream->seq_index].timestamp = ts;
+		dev_dbg(&adev->auxdev.dev,
+			"sof: handle %d: (index %u), timestamp 0x%16.16llx\n",
+			resp->stream_handle,
+			stream->seq[stream->seq_index].sequence, ts);
+		stream->seq_index = (stream->seq_index + 1)
+			% IPU6_ISYS_MAX_PARALLEL_SOF;
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF:
+		ipu6_isys_csi2_eof_event_by_stream(stream);
+		dev_dbg(&adev->auxdev.dev,
+			"eof: handle %d: (index %u), timestamp 0x%16.16llx\n",
+			resp->stream_handle,
+			stream->seq[stream->seq_index].sequence, ts);
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STATS_DATA_READY:
+		break;
+	default:
+		dev_err(&adev->auxdev.dev, "%d:unknown response type %u\n",
+			resp->stream_handle, resp->type);
+		break;
+	}
+
+	ipu6_isys_put_stream(stream);
+leave:
+	ipu6_fw_isys_put_resp(isys);
+	return 0;
+}
+
+static void ipu6_isys_csi2_isr(struct ipu6_isys_csi2 *csi2)
+{
+	struct ipu6_isys_stream *stream;
+	unsigned int i;
+	u32 status;
+	int source;
+
+	ipu6_isys_register_errors(csi2);
+
+	status = readl(csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
+		       CSI_PORT_REG_BASE_IRQ_STATUS_OFFSET);
+
+	writel(status, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
+	       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
+
+	source = csi2->asd.source;
+	for (i = 0; i < NR_OF_CSI2_VC; i++) {
+		if (status & IPU_CSI_RX_IRQ_FS_VC(i)) {
+			stream = ipu6_isys_query_stream_by_source(csi2->isys,
+								  source, i);
+			if (stream) {
+				ipu6_isys_csi2_sof_event_by_stream(stream);
+				ipu6_isys_put_stream(stream);
+			}
+		}
+
+		if (status & IPU_CSI_RX_IRQ_FE_VC(i)) {
+			stream = ipu6_isys_query_stream_by_source(csi2->isys,
+								  source, i);
+			if (stream) {
+				ipu6_isys_csi2_eof_event_by_stream(stream);
+				ipu6_isys_put_stream(stream);
+			}
+		}
+	}
+}
+
+irqreturn_t ipu6_isys_isr(struct ipu6_bus_device *adev)
+{
+	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
+	void __iomem *base = isys->pdata->base;
+	u32 status_sw, status_csi;
+	u32 ctrl0_status, ctrl0_clear;
+
+	spin_lock(&isys->power_lock);
+	if (!isys->power) {
+		spin_unlock(&isys->power_lock);
+		return IRQ_NONE;
+	}
+
+	ctrl0_status = isys->pdata->ipdata->csi2.ctrl0_irq_status;
+	ctrl0_clear = isys->pdata->ipdata->csi2.ctrl0_irq_clear;
+
+	status_csi = readl(isys->pdata->base + ctrl0_status);
+	status_sw = readl(isys->pdata->base +
+			  IPU6_REG_ISYS_UNISPART_IRQ_STATUS);
+
+	writel(ISYS_UNISPART_IRQS & ~IPU6_ISYS_UNISPART_IRQ_SW,
+	       base + IPU6_REG_ISYS_UNISPART_IRQ_MASK);
+
+	do {
+		writel(status_csi, isys->pdata->base + ctrl0_clear);
+
+		writel(status_sw, isys->pdata->base +
+		       IPU6_REG_ISYS_UNISPART_IRQ_CLEAR);
+
+		if (isys->isr_csi2_bits & status_csi) {
+			unsigned int i;
+
+			for (i = 0; i < isys->pdata->ipdata->csi2.nports; i++) {
+				/* irq from not enabled port */
+				if (!isys->csi2[i].base)
+					continue;
+				if (status_csi & IPU6_ISYS_UNISPART_IRQ_CSI2(i))
+					ipu6_isys_csi2_isr(&isys->csi2[i]);
+			}
+		}
+
+		writel(0, base + IPU6_REG_ISYS_UNISPART_SW_IRQ_REG);
+
+		if (!ipu6_isys_isr_one(adev))
+			status_sw = IPU6_ISYS_UNISPART_IRQ_SW;
+		else
+			status_sw = 0;
+
+		status_csi = readl(isys->pdata->base + ctrl0_status);
+		status_sw |= readl(isys->pdata->base +
+				   IPU6_REG_ISYS_UNISPART_IRQ_STATUS);
+	} while ((status_csi & isys->isr_csi2_bits) ||
+		 (status_sw & IPU6_ISYS_UNISPART_IRQ_SW));
+
+	writel(ISYS_UNISPART_IRQS, base + IPU6_REG_ISYS_UNISPART_IRQ_MASK);
+
+	spin_unlock(&isys->power_lock);
+
+	return IRQ_HANDLED;
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
index 15d4ae355f28..f65461a4c907 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
@@ -578,4 +578,7 @@ void ipu6_fw_isys_cleanup(struct ipu6_isys *isys);
 struct ipu6_fw_isys_resp_info_abi *
 ipu6_fw_isys_get_resp(struct ipu6_isys *isys);
 void ipu6_fw_isys_put_resp(struct ipu6_isys *isys);
+int ipu6_isys_isr_one(struct ipu6_bus_device *adev);
+irqreturn_t ipu6_isys_isr(struct ipu6_bus_device *adev);
+
 #endif
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 8f2d361b89f6..a58a35112ebd 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -100,8 +100,6 @@ enum ltr_did_type {
 
 #define ISYS_PM_QOS_VALUE	300
 
-static int isys_isr_one(struct ipu6_bus_device *adev);
-
 static int
 isys_complete_ext_device_registration(struct ipu6_isys *isys,
 				      struct v4l2_subdev *sd,
@@ -304,104 +302,6 @@ static void isys_setup_hw(struct ipu6_isys *isys)
 		writel(thd[i], base + IPU6_REG_ISYS_CDC_THRESHOLD(i));
 }
 
-static void ipu6_isys_csi2_isr(struct ipu6_isys_csi2 *csi2)
-{
-	struct ipu6_isys_stream *stream;
-	unsigned int i;
-	u32 status;
-	int source;
-
-	ipu6_isys_register_errors(csi2);
-
-	status = readl(csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
-		       CSI_PORT_REG_BASE_IRQ_STATUS_OFFSET);
-
-	writel(status, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
-	       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
-
-	source = csi2->asd.source;
-	for (i = 0; i < NR_OF_CSI2_VC; i++) {
-		if (status & IPU_CSI_RX_IRQ_FS_VC(i)) {
-			stream = ipu6_isys_query_stream_by_source(csi2->isys,
-								  source, i);
-			if (stream) {
-				ipu6_isys_csi2_sof_event_by_stream(stream);
-				ipu6_isys_put_stream(stream);
-			}
-		}
-
-		if (status & IPU_CSI_RX_IRQ_FE_VC(i)) {
-			stream = ipu6_isys_query_stream_by_source(csi2->isys,
-								  source, i);
-			if (stream) {
-				ipu6_isys_csi2_eof_event_by_stream(stream);
-				ipu6_isys_put_stream(stream);
-			}
-		}
-	}
-}
-
-static irqreturn_t isys_isr(struct ipu6_bus_device *adev)
-{
-	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
-	void __iomem *base = isys->pdata->base;
-	u32 status_sw, status_csi;
-	u32 ctrl0_status, ctrl0_clear;
-
-	spin_lock(&isys->power_lock);
-	if (!isys->power) {
-		spin_unlock(&isys->power_lock);
-		return IRQ_NONE;
-	}
-
-	ctrl0_status = isys->pdata->ipdata->csi2.ctrl0_irq_status;
-	ctrl0_clear = isys->pdata->ipdata->csi2.ctrl0_irq_clear;
-
-	status_csi = readl(isys->pdata->base + ctrl0_status);
-	status_sw = readl(isys->pdata->base +
-			  IPU6_REG_ISYS_UNISPART_IRQ_STATUS);
-
-	writel(ISYS_UNISPART_IRQS & ~IPU6_ISYS_UNISPART_IRQ_SW,
-	       base + IPU6_REG_ISYS_UNISPART_IRQ_MASK);
-
-	do {
-		writel(status_csi, isys->pdata->base + ctrl0_clear);
-
-		writel(status_sw, isys->pdata->base +
-		       IPU6_REG_ISYS_UNISPART_IRQ_CLEAR);
-
-		if (isys->isr_csi2_bits & status_csi) {
-			unsigned int i;
-
-			for (i = 0; i < isys->pdata->ipdata->csi2.nports; i++) {
-				/* irq from not enabled port */
-				if (!isys->csi2[i].base)
-					continue;
-				if (status_csi & IPU6_ISYS_UNISPART_IRQ_CSI2(i))
-					ipu6_isys_csi2_isr(&isys->csi2[i]);
-			}
-		}
-
-		writel(0, base + IPU6_REG_ISYS_UNISPART_SW_IRQ_REG);
-
-		if (!isys_isr_one(adev))
-			status_sw = IPU6_ISYS_UNISPART_IRQ_SW;
-		else
-			status_sw = 0;
-
-		status_csi = readl(isys->pdata->base + ctrl0_status);
-		status_sw |= readl(isys->pdata->base +
-				   IPU6_REG_ISYS_UNISPART_IRQ_STATUS);
-	} while ((status_csi & isys->isr_csi2_bits) ||
-		 (status_sw & IPU6_ISYS_UNISPART_IRQ_SW));
-
-	writel(ISYS_UNISPART_IRQS, base + IPU6_REG_ISYS_UNISPART_IRQ_MASK);
-
-	spin_unlock(&isys->power_lock);
-
-	return IRQ_HANDLED;
-}
-
 static void get_lut_ltrdid(struct ipu6_isys *isys, struct ltr_did *pltr_did)
 {
 	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
@@ -1167,169 +1067,8 @@ static void isys_remove(struct auxiliary_device *auxdev)
 	mutex_destroy(&isys->mutex);
 }
 
-struct fwmsg {
-	int type;
-	char *msg;
-	bool valid_ts;
-};
-
-static const struct fwmsg fw_msg[] = {
-	{IPU6_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE, "STREAM_OPEN_DONE", 0},
-	{IPU6_FW_ISYS_RESP_TYPE_STREAM_CLOSE_ACK, "STREAM_CLOSE_ACK", 0},
-	{IPU6_FW_ISYS_RESP_TYPE_STREAM_START_ACK, "STREAM_START_ACK", 0},
-	{IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK,
-	 "STREAM_START_AND_CAPTURE_ACK", 0},
-	{IPU6_FW_ISYS_RESP_TYPE_STREAM_STOP_ACK, "STREAM_STOP_ACK", 0},
-	{IPU6_FW_ISYS_RESP_TYPE_STREAM_FLUSH_ACK, "STREAM_FLUSH_ACK", 0},
-	{IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_READY, "PIN_DATA_READY", 1},
-	{IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_ACK, "STREAM_CAPTURE_ACK", 0},
-	{IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE,
-	 "STREAM_START_AND_CAPTURE_DONE", 1},
-	{IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_DONE, "STREAM_CAPTURE_DONE", 1},
-	{IPU6_FW_ISYS_RESP_TYPE_FRAME_SOF, "FRAME_SOF", 1},
-	{IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF, "FRAME_EOF", 1},
-	{IPU6_FW_ISYS_RESP_TYPE_STATS_DATA_READY, "STATS_READY", 1},
-	{-1, "UNKNOWN MESSAGE", 0}
-};
-
-static u32 resp_type_to_index(int type)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(fw_msg); i++)
-		if (fw_msg[i].type == type)
-			return i;
-
-	return  ARRAY_SIZE(fw_msg) - 1;
-}
-
-static int isys_isr_one(struct ipu6_bus_device *adev)
-{
-	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
-	struct ipu6_fw_isys_resp_info_abi *resp;
-	struct ipu6_isys_stream *stream;
-	struct ipu6_isys_csi2 *csi2 = NULL;
-	u32 index;
-	u64 ts;
-
-	if (!isys->fwctx)
-		return 1;
-
-	resp = ipu6_fw_isys_get_resp(isys);
-	if (!resp)
-		return 1;
-
-	ts = (u64)resp->timestamp[1] << 32 | resp->timestamp[0];
-
-	index = resp_type_to_index(resp->type);
-	dev_dbg(&adev->auxdev.dev,
-		"FW resp %02d %s, stream %u, ts 0x%16.16llx, pin %d\n",
-		resp->type, fw_msg[index].msg, resp->stream_handle,
-		fw_msg[index].valid_ts ? ts : 0, resp->pin_id);
-
-	if (resp->error_info.error == IPU6_FW_ISYS_ERROR_STREAM_IN_SUSPENSION)
-		/* Suspension is kind of special case: not enough buffers */
-		dev_dbg(&adev->auxdev.dev,
-			"FW error resp SUSPENSION, details %d\n",
-			resp->error_info.error_details);
-	else if (resp->error_info.error)
-		dev_dbg(&adev->auxdev.dev,
-			"FW error resp error %d, details %d\n",
-			resp->error_info.error, resp->error_info.error_details);
-
-	if (resp->stream_handle >= IPU6_ISYS_MAX_STREAMS) {
-		dev_err(&adev->auxdev.dev, "bad stream handle %u\n",
-			resp->stream_handle);
-		goto leave;
-	}
-
-	stream = ipu6_isys_query_stream_by_handle(isys, resp->stream_handle);
-	if (!stream) {
-		dev_err(&adev->auxdev.dev, "stream of stream_handle %u is unused\n",
-			resp->stream_handle);
-		goto leave;
-	}
-	stream->error = resp->error_info.error;
-
-	csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
-
-	switch (resp->type) {
-	case IPU6_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE:
-		complete(&stream->stream_open_completion);
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CLOSE_ACK:
-		complete(&stream->stream_close_completion);
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_STREAM_START_ACK:
-		complete(&stream->stream_start_completion);
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK:
-		complete(&stream->stream_start_completion);
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_STREAM_STOP_ACK:
-		complete(&stream->stream_stop_completion);
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_STREAM_FLUSH_ACK:
-		complete(&stream->stream_stop_completion);
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_READY:
-		/*
-		 * firmware only release the capture msg until software
-		 * get pin_data_ready event
-		 */
-		ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), resp->buf_id);
-		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS &&
-		    stream->output_pins_queue[resp->pin_id])
-			ipu6_isys_queue_buf_ready(stream, resp);
-		else
-			dev_warn(&adev->auxdev.dev,
-				 "%d:No queue for pin id %d\n",
-				 resp->stream_handle, resp->pin_id);
-		if (csi2)
-			ipu6_isys_csi2_error(csi2);
-
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_ACK:
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE:
-	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_DONE:
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_FRAME_SOF:
-
-		ipu6_isys_csi2_sof_event_by_stream(stream);
-		stream->seq[stream->seq_index].sequence =
-			atomic_read(&stream->sequence) - 1;
-		stream->seq[stream->seq_index].timestamp = ts;
-		dev_dbg(&adev->auxdev.dev,
-			"sof: handle %d: (index %u), timestamp 0x%16.16llx\n",
-			resp->stream_handle,
-			stream->seq[stream->seq_index].sequence, ts);
-		stream->seq_index = (stream->seq_index + 1)
-			% IPU6_ISYS_MAX_PARALLEL_SOF;
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF:
-		ipu6_isys_csi2_eof_event_by_stream(stream);
-		dev_dbg(&adev->auxdev.dev,
-			"eof: handle %d: (index %u), timestamp 0x%16.16llx\n",
-			resp->stream_handle,
-			stream->seq[stream->seq_index].sequence, ts);
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_STATS_DATA_READY:
-		break;
-	default:
-		dev_err(&adev->auxdev.dev, "%d:unknown response type %u\n",
-			resp->stream_handle, resp->type);
-		break;
-	}
-
-	ipu6_isys_put_stream(stream);
-leave:
-	ipu6_fw_isys_put_resp(isys);
-	return 0;
-}
-
 static const struct ipu6_auxdrv_data ipu6_isys_auxdrv_data = {
-	.isr = isys_isr,
+	.isr = ipu6_isys_isr,
 	.isr_threaded = NULL,
 	.wake_isr_thread = false,
 };
-- 
2.55.0

