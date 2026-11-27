Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779700;
	b=dCvDBX3MRg0z3BHoFcWjYF31qK1DAisuOGi5xQjQDe4QP/FzD/H2yBYeAbls0hctmW/N
	 fjMT7ixzIE9RUU7Yh1sTDxik5XoW7JJ4351O+V8TF5z+w/+Lsd6ooN69Bof4tGTEgtDre
	 hc1tTXtNIXg14q5A7k9nVQobd+5jPKQMmNw/2Oj8ykABIn9frKfKQqKGFRCcUkw4Mz2qh
	 a4NoI/gZrnHBICd906Vn/zXuXDt4H7htudmRXbeGLoRta2Gl3dSuWFCmQZMXW9VUq/HmQ
	 y1P84jVKTZA4J3e7EXOsuKk2NLxzsQFA93tYMLKbaSigH+LbkV8mTCgWokA0Qs4uWug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779700;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=TN6rBqfHlHv8pEIE4p1KrZ6/M+CW0gsVmSH4UJNVQiE=;
	b=A6xJeYXqlYItkh0XwlbCXnHRxCBEdYofQQTh85Jdv8Umz/i7EfqvjEHVfTthzL8yUQB0
	 QEDyJsc7YZFFp5Ld3DF+bexaFncSBcXSPTMo23dEH1Czs3etkb187RvtQRoJ78MGx8LQS
	 R+neWQdBBx0Lq9xW/kgLk4akA803NQaxatYKc0P6FkgnjK6+KhSdiSrx86yonE2ndm9BY
	 ckb1qOAWppDRsfgntAI+hbiiq9eGkljBA/xeQ50LOWTehJPFFV+8fTGPi0GzLKgtLRmQ6
	 5ic54Ib/1Z3+byGRYnwwlxKadzq1NfLrphKRMhI8E6cpZjyaPwatrwz5FHtsEy12KXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=radxa.com;
	spf=pass smtp.mailfrom=radxa.com;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FAF606A327;
	Fri, 27 Nov 2026 11:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57FAF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1795779671t8fefebc7
X-QQ-Originating-IP: d41NCsXoz5NegJcO08CufLN2EP3FSn9SX2ZHltzoRGA=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 19:41:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13669349462440002212
EX-QQ-RecipientCnt: 19
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 27 Nov 2026 19:40:54 +0800
Subject: [PATCH v2 1/5] media: iris: support decode-order output on HFI
 gen2
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
Message-Id: <20261127-iris-va-fixes-v2-1-385e8636c22d@radxa.com>
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
 Jason Pettit <jason.pettit@oss.qualcomm.com>, Xilin Wu <sophon@radxa.com>, 
 sakimidare <ssmzhn@163.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6790; i=sophon@radxa.com;
 h=from:subject:message-id; bh=lZh0zAI5mupz5P1JHg4vPlR3w5xaI070I9i4bzj3WX8=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDNmcOQF3msMZn5b41ezRvvC2u9WQ/euiuwUK9V0bphTUz
 NI5ELuyo5SFQYyLQVZMkUUhnmEue2XutadipXowc1iZQIYwcHEKwEQCXzIy7D26MtXO2+GJmVjW
 Wcmcdfpc2d/qJ0x6/zVz7Q+1qSus9jD8d+tTv2VQfHPJ3Z9/A5i1vjVdW3XMbAZbyOoPklmX9bN
 dGQA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MSstRF5C1p/j1zTNtAdAJBaqSb13aDLP3EWkE5pa2xrLWZ52662BdX7P
	Ut1sWJUjAyXxu4tP2aGe2Nf3icrV2BvZM1Wzb3eSExG0MXMVEbUAMAgoyE4vgJXNwKhMLN+
	zKT2FRq/ZNGYMY0F/hCbEJavkKdFKnQOQnIC7bQZK8ls28fwZYnpJIZobCu1nX0jKOSNcM/
	THlf5f6ug1d2kYc1f1cMMhlB3Ya+ByXL21qWA4/E5exGVwbd2DtK0tuZXAiixzvP4BEU5/a
	Sqrwd3fiyTP5jLbDbwDJkrssjqYpwh/lhdYP3I+opEHcFQ0aVUGYWBeNKkOOmVC8mBKrtd3
	SgRqoCrWCtk+m6/KCN8lMJrt4/1QQ/Xd92WZ+LGfCcaV4eyYzN0L2YjGqCG/A8h/AnB3JP7
	MW2OYfSxAJS0g2QHzZJ3ATri7OhmbVNXSMZEYsgeodIUthXBRBfo0rqEKYG8GETqJNi4h6p
	DzEID944dYjcozvO31E8Appj4C1st0diOv44h/f0oVfqYntwplqvtBVDRPy1Ou0F7JKP951
	o5JK6VnPUbRS1DJqBGE57gmVAH/fF/pDsiEiLFo8kTyA0V2at6+yNS2qapgl4KWWDAEanwV
	lLKwhqwsRkhLhBBiQVLHJZT7BlivtFiBIDIRauw2Z2wlSxo//eMnVes4bLYKr4PyxpEmS6e
	lcf0G5Arx3iWnoIztSU5SVELGvvCD6K8raP/IE+5urujhJwy6lNNo0QR1t9w9r9hTt4RWiI
	Mfnn/mwxLXClnIfmz2g/To88jbrT219vaI7Hivv3k4SH5rOcVupeijkpnX2C2WfyTta9bzS
	cWttSt3hkb/WRQUGdzS8WgaBsoRilhOCHxufYNfV4rIMea5Dcdcq2IEt03xdfCb1FT3raik
	ENv8BLajEXsohUMMpeWUk/aq7HCsDoQpPVVCahkRqb6NfQy/QcRrD4wjJbCSLsoeH6rrFlI
	Cpl7YXB05nWJT4shJyFwGnaL1jKWCZmUj/O+WL1jbaGhFjSUimf5N3X/fEBTtNfg1gOkmcI
	UEjfhrQtufx0cE3J3pRE7wpLPy4hhh2xKJ4uyx5d4gOSfbcawUizp0FEEuvXwBbZ4FjpqsE
	g==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

Venus implements V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE and
V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY, which let a client ask for
decoded pictures in decode order instead of waiting for display
reordering. Iris does not expose them on HFI gen2.

Add both controls for HFI gen2 decoders. Enabling the display delay
with a delay of zero, the only supported value, selects decode-order
output through HFI_PROP_DECODE_ORDER_OUTPUT. Display-order output
stays the default.

Tested-by: sakimidare <ssmzhn@163.com>
Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c        |  8 ++++++++
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c     | 20 ++++++++++++++++++++
 .../media/platform/qcom/iris/iris_hfi_gen2_command.c | 18 ++++++++++++++++++
 .../media/platform/qcom/iris/iris_hfi_gen2_defines.h |  1 +
 .../media/platform/qcom/iris/iris_platform_common.h  |  2 ++
 5 files changed, 49 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 4f2633bbb49f..0b59fc79971c 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -163,6 +163,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return SLICE_MAX_BYTES;
 	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
 		return SLICE_MAX_MB;
+	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:
+		return DISPLAY_DELAY_ENABLE;
+	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:
+		return DISPLAY_DELAY;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -314,6 +318,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES;
 	case SLICE_MAX_MB:
 		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB;
+	case DISPLAY_DELAY_ENABLE:
+		return V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE;
+	case DISPLAY_DELAY:
+		return V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY;
 	default:
 		return 0;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 79bbd06ef8d2..7a1204da17ca 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1106,6 +1106,22 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 		.flags = CAP_FLAG_INPUT_PORT,
 		.set = iris_set_u32,
 	},
+	{
+		.cap_id = DISPLAY_DELAY_ENABLE,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_DECODE_ORDER_OUTPUT,
+		.flags = CAP_FLAG_INPUT_PORT,
+	},
+	{
+		.cap_id = DISPLAY_DELAY,
+		.min = 0,
+		.max = 0,
+		.step_or_mask = 1,
+		.value = 0,
+	},
 };
 
 static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
@@ -1818,6 +1834,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
+	HFI_PROP_DECODE_ORDER_OUTPUT,
 	HFI_PROP_BITSTREAM_RESOLUTION,
 	HFI_PROP_CROP_OFFSETS,
 	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
@@ -1830,6 +1847,7 @@ static const u32 sm8550_vdec_input_config_params_default[] = {
 };
 
 static const u32 sm8550_vdec_input_config_param_hevc[] = {
+	HFI_PROP_DECODE_ORDER_OUTPUT,
 	HFI_PROP_BITSTREAM_RESOLUTION,
 	HFI_PROP_CROP_OFFSETS,
 	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
@@ -1841,6 +1859,7 @@ static const u32 sm8550_vdec_input_config_param_hevc[] = {
 };
 
 static const u32 sm8550_vdec_input_config_param_vp9[] = {
+	HFI_PROP_DECODE_ORDER_OUTPUT,
 	HFI_PROP_BITSTREAM_RESOLUTION,
 	HFI_PROP_CROP_OFFSETS,
 	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
@@ -1850,6 +1869,7 @@ static const u32 sm8550_vdec_input_config_param_vp9[] = {
 };
 
 static const u32 sm8550_vdec_input_config_param_av1[] = {
+	HFI_PROP_DECODE_ORDER_OUTPUT,
 	HFI_PROP_BITSTREAM_RESOLUTION,
 	HFI_PROP_CROP_OFFSETS,
 	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 388a36ff2b07..a285e6fc8728 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -665,6 +665,23 @@ static int iris_hfi_gen2_set_super_block(struct iris_inst *inst, u32 plane)
 						  sizeof(u32));
 }
 
+static int iris_hfi_gen2_set_decode_order_output(struct iris_inst *inst, u32 plane)
+{
+	struct platform_inst_fw_cap *cap = &inst->fw_caps[DISPLAY_DELAY_ENABLE];
+	u32 decode_order = cap->value;
+
+	/* Leave the firmware default unchanged unless userspace sets the control. */
+	if (!(cap->flags & CAP_FLAG_CLIENT_SET))
+		return 0;
+
+	return iris_hfi_gen2_session_set_property(inst,
+						  HFI_PROP_DECODE_ORDER_OUTPUT,
+						  HFI_HOST_FLAGS_NONE,
+						  HFI_PORT_BITSTREAM,
+						  HFI_PAYLOAD_U32,
+						  &decode_order, sizeof(decode_order));
+}
+
 static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_firmware_data *fdata = inst->core->iris_firmware_data;
@@ -691,6 +708,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
 		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
 		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
+		{HFI_PROP_DECODE_ORDER_OUTPUT,        iris_hfi_gen2_set_decode_order_output    },
 	};
 
 	if (inst->domain == DECODER) {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 2b8b057d35a9..e89ed4075526 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -130,6 +130,7 @@ enum hfi_flip {
 
 #define HFI_PROP_FLIP				0x0300014c
 #define HFI_PROP_SIGNAL_COLOR_INFO		0x03000155
+#define HFI_PROP_DECODE_ORDER_OUTPUT		0x0300015b
 #define HFI_PROP_PICTURE_TYPE			0x03000162
 #define HFI_PROP_DEC_DEFAULT_HEADER		0x03000168
 #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index cddab9a9c375..aa8cd2e1b3f1 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -211,6 +211,8 @@ enum platform_inst_fw_cap_type {
 	SLICE_MODE,
 	SLICE_MAX_BYTES,
 	SLICE_MAX_MB,
+	DISPLAY_DELAY_ENABLE,
+	DISPLAY_DELAY,
 	INST_FW_CAP_MAX,
 };
 

-- 
2.56.1

