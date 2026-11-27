Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.22.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779705;
	b=UQb9YAmunmOKQnvCuG7gu8cJRZo/7lzT3hvsf4dNYzec7LwRyVUwjDiJuUdv0WDYNhk+
	 FHReltvU7xB8IU7sc9sFCVd5MbVIbKOklaN4mifK5hAF0exdV0A0dtaVYY2/lhAnoM2z2
	 +K2+O0v7hGezH3QCBkNT6r3JUvrv2ti/kSvmACNGydQPN3PlueRD5EdfLNVfPOUIhk5TO
	 wUvoofnclSH6hAvJrTj1z8BMadKPK1OuC5Pezp8iZj8/sYDnZHAbZr6YL5UbAn6yBi2c0
	 XUN38SM9VfzMkdo7wKE+I4DgVuc63CLeQeyW0hO9fZ7QF16ViAB4i3F/fhRkyYjs5XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779705;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=+638/+1Wz5LGuWXxywiuUxSrFiPvV2i3KGxrACnYSJM=;
	b=rAD4y0BLfmDjE4dlQnBfzlnn9tmWYTY+PDlxJf9rTwSBnsy8NJzbxinpUY1E8VONT0Hz
	 W2bFtPY3Spwb4k+dS6W4OUsX59tG/RbIdtsQt54u6K67GNvoIMzRkh72MsXNiFBTC8aQx
	 N+eXDp0kI1s864Sl/DGLuwjd+ceyEyNF+blMNOQKh0bAXI9HwQqcTl3KNTpg3pUNqdJrV
	 5DuFoZaVFiDVhmWqAIKFLELXqU4cDmCLT27pkWG10FUNUQy+e9iwJKm99/pRB6Ro2cfib
	 z+zOFlI+fisZuqNCrZy8wg1+Mmwjdy2qXeTXQnK1hQ9OK10BWKIvc9omkY3E0ixWMWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=radxa.com;
	spf=pass smtp.mailfrom=radxa.com;
	arc=none smtp.remote-ip=54.207.22.56
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA761606A686;
	Fri, 27 Nov 2026 11:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA761606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1795779674t0e799b3b
X-QQ-Originating-IP: 7BFZc2uM3MdBSsP1nQ18KuRpMBa6WoXUeVenlTUU4QU=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 19:41:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16840508615790752312
EX-QQ-RecipientCnt: 17
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 27 Nov 2026 19:40:55 +0800
Subject: [PATCH v2 2/5] media: iris: allow larger capture buffer pools on
 HFI gen2
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
Message-Id: <20261127-iris-va-fixes-v2-2-385e8636c22d@radxa.com>
References: <20261127-iris-va-fixes-v2-0-385e8636c22d@radxa.com>
In-Reply-To: <20261127-iris-va-fixes-v2-0-385e8636c22d@radxa.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 dragon@radxa.com, Chris Obbard <chris.obbard@oss.qualcomm.com>, 
 Deepak Sikri <sikrid@qti.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Loic Minier <loic.minier@oss.qualcomm.com>, 
 Jason Pettit <jason.pettit@oss.qualcomm.com>, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3910; i=sophon@radxa.com;
 h=from:subject:message-id; bh=erOHiazvxhrlPtfyNzRv/vS0wgbfnIj2WYv8/0/QDgU=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDNmcOYFrJxW2PT/F/TPi5IvWu+0cv3t4txufepI2aULLY
 z2L7P+PO0pZGMS4GGTFFFkU4hnmslfmXnsqVqoHM4eVCWQIAxenAEzksi4jw97LLDccP/twP/qf
 Ibfy3BGhvODiYz+L/3Scd+097eP05hjD/6BnzpOvS2vsOJm4eGaVnWbgx44v7m+53yhW9ic5nXv
 nxAQA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MHAMmLg4tmnVZ43YOxxspz4BiyxgTHJcXNJX0GCbGXmjONj/PSYa7TYW
	RU6a8EEElRKBCeMN/xdsMXgsMn74Dd8JFdJs21BYEojdVCaM8qKWlpPahlZugM4rCYCA3HF
	X9k1C7eiccg5geCeLValZ7rnCMxn5CO6KK4uuOcsFtlsG5VCGCbjOlN8cV6znhaP/npHA6E
	qRUx2YqWteyXMseSAxMV76GwZzlqCzLFvVUg3lFg81B1N0jAE8REj0rbZIdQKSNyct/ho8R
	moHoXDGc5Ut+7DULGk8A1a4MLU+vimtaN/RfNQxRS28vAh1foFh+A9OMB0L9TZvckXCtobQ
	t2gYcbkOVoS0avm03RaxJfVD22MnlZzaM08sggS3hOQKe7Q+u/ZsX7p409Wn7dgCzozCoY4
	mwP2x7aEQbirZQckGl60QW/8Hk4SGDMaO711XHBrBx1bmtIcL8narDvwHQucTw8nZw1GXwM
	8SyQoBSwaFbFB/wRLCmHyuV7MNf26NGOZhh4TkY5pTlBxTSdHlu/9bpIdHIPbKZC2CmR4FM
	j84LG2/Ho21rMt6Y3VMAwxYxROz37eoxlsksDCuxWMP6BbLHzD8oJ0S0stD3FLtXce/JjIm
	dRL2QAVqlm4mE1jZxgQ3Pfu5XXLDdvkQ7wpkxrAWi4nfPBROWWOlmo4mWyxUQtpi14TwzDV
	e8KhAG2coSar+ejCdrj3YZF2qD1JvF7zGcytMj+KsRDNZq626CNiyOIFJ/EKAlEZMKja6TK
	JBnxOOfTM9HgD+88imXJagswPLgPcylzEG9NCgN8t1EzywkoEn5eoaMp628mwN+UrCrSCj8
	DRR5VnPZrnF8XznwqatfHFb3D8LOjkus2W+gbCPZpy45TYNqLSpyhjedB+M9s3+sU1DW3RH
	GWjizW91VgFRLvV3qsgvMFygkPSBQ/p3QSHsOxVnp3h8dtaujFPE6u+RAVQdresa0q+7enb
	OICbOIeEBNrcYlOrBLcgSs96gk4cIvJMEV/zKcuhB21uqb7ncCK9ADfxpfyoFlNFTT66I4l
	Ag1HsSEpwtFvAb04AFx44ukgEDJJ/VWhrQ3RkL+IPyHoD2eJ9oMvH3x0tMWwEfDrJBXisJX
	Q==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

vb2 limits a queue to 32 buffers unless the driver sets
max_num_buffers. Clients with deep decode pipelines, such as VLC with
frame threading, can need more CAPTURE buffers than that.

HFI gen2 firmware takes the number of host buffers for each port
through HFI_PROP_BUFFER_HOST_MAX_COUNT. The encoder caps set it for
both ports, while the decoder caps only set it for the bitstream port.

Add OUTPUT_BUF_HOST_MAX_COUNT to the HFI gen2 decoder caps, and size
the CAPTURE queue from that capability when the platform provides it.
Platforms without it, such as HFI gen1, keep the vb2 default.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 30 ++++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vidc.c     |  8 +++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 7a1204da17ca..90cba1ae534b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -137,6 +137,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_milos_dec[] = {
 		.flags = CAP_FLAG_INPUT_PORT,
 		.set = iris_set_u32,
 	},
+	{
+		.cap_id = OUTPUT_BUF_HOST_MAX_COUNT,
+		.min = DEFAULT_MAX_HOST_BUF_COUNT,
+		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
+		.step_or_mask = 1,
+		.value = DEFAULT_MAX_HOST_BUF_COUNT,
+		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_u32,
+	},
 	{
 		.cap_id = STAGE,
 		.min = STAGE_1,
@@ -1056,6 +1066,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 		.flags = CAP_FLAG_INPUT_PORT,
 		.set = iris_set_u32,
 	},
+	{
+		.cap_id = OUTPUT_BUF_HOST_MAX_COUNT,
+		.min = DEFAULT_MAX_HOST_BUF_COUNT,
+		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
+		.step_or_mask = 1,
+		.value = DEFAULT_MAX_HOST_BUF_COUNT,
+		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_u32,
+	},
 	{
 		.cap_id = STAGE,
 		.min = STAGE_1,
@@ -2188,6 +2208,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_gen2_ar50lt_dec[] = {
 		.flags = CAP_FLAG_INPUT_PORT,
 		.set = iris_set_u32,
 	},
+	{
+		.cap_id = OUTPUT_BUF_HOST_MAX_COUNT,
+		.min = DEFAULT_MAX_HOST_BUF_COUNT,
+		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
+		.step_or_mask = 1,
+		.value = DEFAULT_MAX_HOST_BUF_COUNT,
+		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_u32,
+	},
 	{
 		.cap_id = STAGE,
 		.min = STAGE_1,
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 05aab6e3005d..4a2cb965a824 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -116,8 +116,14 @@ static int
 iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 {
 	struct iris_inst *inst = priv;
+	struct iris_core *core = inst->core;
+	const struct platform_inst_fw_cap *caps;
 	int ret;
 
+	/* inst->fw_caps is set up later, in iris_vdec/venc_inst_init(). */
+	caps = inst->domain == DECODER ? core->inst_fw_caps_dec :
+					 core->inst_fw_caps_enc;
+
 	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
@@ -140,6 +146,8 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	dst_vq->drv_priv = inst;
 	dst_vq->buf_struct_size = sizeof(struct iris_buffer);
 	dst_vq->min_reqbufs_allocation = MIN_BUFFERS;
+	if (caps[OUTPUT_BUF_HOST_MAX_COUNT].cap_id)
+		dst_vq->max_num_buffers = caps[OUTPUT_BUF_HOST_MAX_COUNT].value;
 	dst_vq->dev = inst->core->dev;
 	dst_vq->lock = &inst->ctx_q_lock;
 

-- 
2.56.1

