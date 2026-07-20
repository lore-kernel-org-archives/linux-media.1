Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9519343DA49
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 17:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784567672; cv=none; b=sTYAd1X+9QMk9XtF5L0VrJ7QtB1W0UOJ/Gg1dBFj5ui9XPUhlypsJ5Ms64+KfNgS/c3qVQuA/8AEIT7MeEuo7vt7bAfAuyMHzas9VHWKWlI9D1olYbnbX9dSV05NHWhGfy1butcS8eWF4PQFE3+VOzfnhXNU64N7PsIQtBZITBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784567672; c=relaxed/simple;
	bh=1ceuByS+KorQxsHHoWFtaQThgygJItBnF+JMEb9EC5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EUMbAOpCFoO87YXnboBAPQBU5vTjxS+TV1WP+6y9re5FZrlAM1YizQZW2id7cXfZ8lSLDaprkrwnAjrgnymK96vasHbriuPEMLW/YT4bJKo2Vq7BIxZwAma1k5PYdFSwSgbjX5S+92KvuRwBPufNQ6/rem2DwcZdj1ITwHpyIMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQHquzqu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YIq4T9Ev; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQHquzqu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YIq4T9Ev"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KHBr093442626
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 17:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8MEgIdUNJ+fERL7JplvYVI
	TwRlm+Lk6oTqq0HqaWyX0=; b=SQHquzquhLGpMKREkm372Z/5mUVgitINZ01ttk
	IGlNstfqk7EDAvmOkc5RldLkb1Cm7VkH6yPKVtTyVD7+ixURly7ykhFJCTEx3erG
	xWMUcn2RY7RZa19I670huZWEMzcZ4VEqRcuXk57nOcaahTzYuQ0M692rGp6XKNOi
	1A91cDpfiLBc8gppU8ZOYx5j2Vr1y1wfkkuLwDVGjK+NqIDPhdtmo742ap+QIRvM
	hW5kyh6Vwy+BMriuHuiCDHOHzP9DJZwTKngYu+GpSUnqZVJVqfouRfbW7fg+gRu/
	J9/iOBtXChrkEJ/EhLoqflz3DewNW4K7Z6WEKxbWML2/D9xw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5r0cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 17:14:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so2402875a12.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 10:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784567666; x=1785172466; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8MEgIdUNJ+fERL7JplvYVITwRlm+Lk6oTqq0HqaWyX0=;
        b=YIq4T9Ev7YXzc2Xk6t0cDao59xuabLpt8+VUIY+9zP3y94a+LLtjExyeObp/jy2khJ
         cBC6S6RxjdNpsZ8ii4puiZ/lF3jtM+9kUviRUF7wHs5P0msr3YUdBP7lvUeXHZTgs/h4
         tEjlmSHjsJT21Z1iEYvJ3QLisEFMbPJO1KjuGX8a9a943Ueu867njcpokE3Kmo4PDYwm
         jQKjsuEsD/c+gQCEVau4rRoNrjVw9BjbMBmfJP3fX2i5hvxJas3zGXEGnJ/oVhv/wK/h
         GqJPgevefELGpbV8kyrNSPUyVgCfOFJGn5AhNt7qYxTVhcTVq9jU+n6mulu6X+uKbhbE
         Ge+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784567666; x=1785172466;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8MEgIdUNJ+fERL7JplvYVITwRlm+Lk6oTqq0HqaWyX0=;
        b=VwQ2f30L4Cb4Qc5YKWGZQjsg+3Yb3Qbd85RdYoLuSS/hBTwd1ESzWvBNZwIHH+X8y+
         IzNoSIgxVKPvrosQtQjm+c5SyUS2Lqzl1+5Vdauugul8SiqSZcuexhgYire84yyFrjVc
         aSPGiO/RwiSw/CvUrTjVhrCcLgEnHpu74jsQ7Buj18m9+cYuRSciszKrTjNP0KzknxPS
         1PMROoT05/s4E5tzMffT6A1ZLjFYTlIwf1YX2l5/cV26ZW7HaKqkRMPj+T6ni+ugUU7l
         HDbb7/jU+BSO9DPvE302JgQclAI06z24o5GKHu9BLTsaLmJzU7HlIOLLB6NnmUnsjEFa
         lw7Q==
X-Gm-Message-State: AOJu0YyoCm2dkLWS86Hcio3+Ojffs6RKI0SvcKtuoge8q6D/jjRyI8CF
	8QpBypneX3OaSlOfTCpa6dCjCwtutXHykPsl8teO1BwU7k2uyEM6VJZDkYgWZO33obdLsIcTNP2
	0UG2KmclNnu04A2i+BnuTls7tLeDGPkTKDXPRWp7oT/3gbRxu0rm9Lva1Fv3yf7+MZQ==
X-Gm-Gg: AfdE7ckNtOApDQsTF1nQIzfVgfOF5TXJqHMQHlZefSrabTV4vnZiwuRGCgignkGqkxQ
	s5K9MooS+vSfVKuHxpAwQoguBtMASK5TxrqcLFC68erNrCMOk9zMnJfe6yuhFwkFyZVwJucd1ww
	HwqGZMC/IF3qdX64G4xChkiM5eHjrnDEl09Lr+BOr4PJIFjKPHZImrBPPIMVIPAX2oO0ywZhlH6
	P7A1HX3NMmL710RK63IQyqz8J0xzXKNKDN1q5TgI2Y2qDA9BNqqqZCVrjsusW5vmCkCSsqE4Nl/
	UuRouh64SwNYRNKXzvIIigmEx7i9CBrEiv1Hs7L/Bb+IK+cgWXmYdM6383JNqT1ZK5cZ/CCo4TX
	Juw9rYFAbolkL44kVz3onsv2XtL2Zr4E=
X-Received: by 2002:a05:6a21:7d06:b0:3bf:e24e:3afe with SMTP id adf61e73a8af0-3c3ad949d5dmr16131258637.43.1784567665712;
        Mon, 20 Jul 2026 10:14:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:7d06:b0:3bf:e24e:3afe with SMTP id adf61e73a8af0-3c3ad949d5dmr16131207637.43.1784567665204;
        Mon, 20 Jul 2026 10:14:25 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20cfe3sm41239012eec.30.2026.07.20.10.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:14:24 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 22:44:19 +0530
Subject: [PATCH v2] media: iris: add new rate control type MBR for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-b4-add_sc7280_mbr-v2-1-a2a86f630f57@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGpXXmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDI0Mj3SQT3cSUlPjiZHMjC4P43KQiXVNL88RkM0PTJEtjQyWgvoKi1LT
 MCrCZ0bG1tQAHTLpdYwAAAA==
X-Change-ID: 20260212-b4-add_sc7280_mbr-597ac615b931
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784567661; l=11940;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=1ceuByS+KorQxsHHoWFtaQThgygJItBnF+JMEb9EC5E=;
 b=pNXi2vhzbjMoPe8ipIaYuH7f5XUkxfUti3jUYN4P594jjhY4QvIg22Si/1zXoKYqVo8iCl78c
 ++1D5TnvsaqBI6gkr7KbyU41cynQExPT8cQeOd3Q8d061JoTYVd2a4S
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE5MSBTYWx0ZWRfX80I3q5PsSRXq
 02EeFcN2QTXBZpZBWScD6+Oax/il0+rKIbctTnCj1SxUx2kR9bd8X2mikbs5w7/Q890x4Tuc1SE
 mcWWZXzCLq5zdpekR3fLPE73Y/cOerusj00210PNfbNVyLpD8bJZS/0s3riol6wjAz3oYVmSXYg
 x8yEoYVRrWdf5mARO8e8sfVqCU6wZqAa2hwpKSczU7QxIWqpNxjLrqkjxPf2xnJ7toDr0NEVz88
 h3wKsTbLIPz3HgGxaywZhWmIybEjNoNMQ2UU/vNPCKfh8n8Xw6EyLVB6fYYGdOZJ5hs8xlrYSCd
 iKyM/dxswIapA9TpIr+wscoWOGdSJr3b4pc7O53pkPG0NAYaNAFDVnAcsBjrWQqD14SG13OpTXm
 hnObRjet7yKfGcW8Yd3wmVcJlh1iP/oLymEK2jW5mIYMwNoVnqsLvrM5T5som5L9SvUM4IHdLjl
 fxCTXZq6niyFSELE4Ig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE5MSBTYWx0ZWRfXz/XVCc/d41X7
 MwDWC8mzqeV5LyB+la+AtfUt1HNltdl8sKa9iQF7gKnkGV7LZCTupjPkenHc3zFtyqnI7j5tZK9
 kLcwUjBgBRAetZ3Jv4+vlEC+RQBTnJc=
X-Authority-Analysis: v=2.4 cv=WNpPmHsR c=1 sm=1 tr=0 ts=6a5e5772 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1QIxuLaiHgt7Oux3S1AA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: _KsNp3nzvNCA-QC_6LDILY3HvHi3Pmw0
X-Proofpoint-ORIG-GUID: _KsNp3nzvNCA-QC_6LDILY3HvHi3Pmw0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_04,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200191

Add support for the MBR rate-control mode on the encoder.
MBR has no corresponding V4L2-spec definition, it is exposed as a
Qualcomm IRIS vendor-specific control rather than a generic
bitrate-mode value.

Reserve V4L2_CID_USER_QCOM_IRIS_BASE for Qualcomm IRIS driver
specific controls and add a new boolean control,
V4L2_CID_QCOM_MBR_RATE_CONTROL, to enable it. When set, the driver
programs the firmware with HFI_RATE_CONTROL_MBR, taking priority
over V4L2_CID_MPEG_VIDEO_BITRATE_MODE when both are client-set.

MBR is currently supported only on sc7280. Rather than duplicating
the encoder capability table per platform, add a mbr_rc_supported
flag to struct iris_platform_data, and merge in a small
platform-specific capability table containing only the MBR cap for
platforms that support it.

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
This patch adds support for the MBR rate-control mode in the Iris driver.

Changes in v2:
- Per upstream review feedback, convert MBR enablement from the
  generic V4L2_MPEG_VIDEO_BITRATE_MODE_MBR menu value to a new
  Qualcomm IRIS vendor-specific boolean control,
  V4L2_CID_QCOM_MBR_RATE_CONTROL.
- Drop the now-unneeded generic V4L2_MPEG_VIDEO_BITRATE_MODE_MBR
  enum, its "Maximum Bitrate" menu string, and its documentation
  (previously sent as a separate patch 1/2).
- Drop the separate inst_fw_cap_sc7280_enc[] table (a near-complete
  duplicate of inst_fw_cap_sm8250_enc[]); sc7280 now reuses the
  shared encoder cap table and layers in only the MBR-specific cap
  entry via the new mbr_rc_supported flag.
- Link to v1: https://lore.kernel.org/linux-media/20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com/
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 101 +++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   4 +
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |   1 +
 include/uapi/linux/v4l2-controls.h                 |   6 ++
 6 files changed, 98 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..0a979649663b 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -154,6 +154,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return LAYER4_BITRATE_HEVC;
 	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
 		return LAYER5_BITRATE_HEVC;
+	case V4L2_CID_QCOM_MBR_RATE_CONTROL:
+		return MBR_RATE_CONTROL;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -297,6 +299,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
 	case LAYER5_BITRATE_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
+	case MBR_RATE_CONTROL:
+		return V4L2_CID_QCOM_MBR_RATE_CONTROL;
 	default:
 		return 0;
 	}
@@ -335,6 +339,17 @@ static const struct v4l2_ctrl_ops iris_ctrl_ops = {
 	.s_ctrl = iris_op_s_ctrl,
 };
 
+static const struct v4l2_ctrl_config iris_mbr_rate_control_ctrl_config = {
+	.ops = &iris_ctrl_ops,
+	.id = V4L2_CID_QCOM_MBR_RATE_CONTROL,
+	.name = "MBR Rate Control",
+	.type = V4L2_CTRL_TYPE_BOOLEAN,
+	.min = 0,
+	.max = 1,
+	.step = 1,
+	.def = 0,
+};
+
 int iris_ctrls_init(struct iris_inst *inst)
 {
 	struct platform_inst_fw_cap *cap = &inst->fw_caps[0];
@@ -368,7 +383,11 @@ int iris_ctrls_init(struct iris_inst *inst)
 			goto error;
 		}
 
-		if (cap[idx].flags & CAP_FLAG_MENU) {
+		if (v4l2_id == V4L2_CID_QCOM_MBR_RATE_CONTROL) {
+			ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
+						    &iris_mbr_rate_control_ctrl_config,
+						    NULL);
+		} else if (cap[idx].flags & CAP_FLAG_MENU) {
 			ctrl = v4l2_ctrl_new_std_menu(&inst->ctrl_handler,
 						      &iris_ctrl_ops,
 						      v4l2_id,
@@ -411,6 +430,39 @@ int iris_ctrls_init(struct iris_inst *inst)
 	return ret;
 }
 
+static const struct platform_inst_fw_cap inst_fw_cap_sc7280_only_enc[] = {
+	{
+		.cap_id = MBR_RATE_CONTROL,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_mbr_rate_control,
+	},
+};
+
+static void iris_copy_enc_caps(struct iris_core *core, const struct platform_inst_fw_cap *caps,
+			       u32 num_cap)
+{
+	u32 i, cap_id;
+
+	for (i = 0; i < num_cap; i++) {
+		cap_id = caps[i].cap_id;
+		if (!iris_valid_cap_id(cap_id))
+			continue;
+
+		core->inst_fw_caps_enc[cap_id].cap_id = caps[i].cap_id;
+		core->inst_fw_caps_enc[cap_id].min = caps[i].min;
+		core->inst_fw_caps_enc[cap_id].max = caps[i].max;
+		core->inst_fw_caps_enc[cap_id].step_or_mask = caps[i].step_or_mask;
+		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
+		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
+		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
+		core->inst_fw_caps_enc[cap_id].set = caps[i].set;
+	}
+}
+
 void iris_session_init_caps(struct iris_core *core)
 {
 	const struct platform_inst_fw_cap *caps;
@@ -444,23 +496,12 @@ void iris_session_init_caps(struct iris_core *core)
 		}
 	}
 
-	caps = core->iris_firmware_data->inst_fw_caps_enc;
-	num_cap = core->iris_firmware_data->inst_fw_caps_enc_size;
-
-	for (i = 0; i < num_cap; i++) {
-		cap_id = caps[i].cap_id;
-		if (!iris_valid_cap_id(cap_id))
-			continue;
+	iris_copy_enc_caps(core, core->iris_firmware_data->inst_fw_caps_enc,
+			   core->iris_firmware_data->inst_fw_caps_enc_size);
 
-		core->inst_fw_caps_enc[cap_id].cap_id = caps[i].cap_id;
-		core->inst_fw_caps_enc[cap_id].min = caps[i].min;
-		core->inst_fw_caps_enc[cap_id].max = caps[i].max;
-		core->inst_fw_caps_enc[cap_id].step_or_mask = caps[i].step_or_mask;
-		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
-		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
-		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
-		core->inst_fw_caps_enc[cap_id].set = caps[i].set;
-	}
+	if (core->iris_platform_data->mbr_rc_supported)
+		iris_copy_enc_caps(core, inst_fw_cap_sc7280_only_enc,
+				   ARRAY_SIZE(inst_fw_cap_sc7280_only_enc));
 }
 
 static u32 iris_get_port_info(struct iris_inst *inst,
@@ -761,6 +802,11 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	u32 rc_mode = 0;
 
+	/* MBR_RATE_CONTROL takes priority over BITRATE_MODE when both are client-set */
+	if ((inst->fw_caps[MBR_RATE_CONTROL].flags & CAP_FLAG_CLIENT_SET) &&
+	    inst->fw_caps[MBR_RATE_CONTROL].value)
+		return iris_set_mbr_rate_control(inst, MBR_RATE_CONTROL);
+
 	if (!frame_rc)
 		rc_mode = HFI_RATE_CONTROL_OFF;
 	else if (bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
@@ -779,6 +825,27 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
 				     &rc_mode, sizeof(u32));
 }
 
+int iris_set_mbr_rate_control(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 mbr_enable = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[BITRATE_MODE].hfi_id;
+	u32 rc_mode;
+
+	if (mbr_enable)
+		rc_mode = HFI_RATE_CONTROL_MBR;
+	else
+		return iris_set_bitrate_mode_gen1(inst, BITRATE_MODE);
+
+	inst->hfi_rc_type = rc_mode;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					 HFI_HOST_FLAGS_NONE,
+				     iris_get_port_info(inst, BITRATE_MODE),
+				     HFI_PAYLOAD_U32_ENUM,
+				     &rc_mode, sizeof(u32));
+}
+
 int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 3c462ec9190b..730d2d66ae2c 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -7,6 +7,9 @@
 #define __IRIS_CTRLS_H__
 
 #include "iris_platform_common.h"
+#include <linux/videodev2.h>
+
+#define V4L2_CID_QCOM_MBR_RATE_CONTROL (V4L2_CID_USER_QCOM_IRIS_BASE + 0)
 
 struct iris_core;
 struct iris_inst;
@@ -27,6 +30,7 @@ int iris_set_bitrate_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type
 int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_mbr_rate_control(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 0e4dee192384..d737d3aba0aa 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -130,6 +130,7 @@
 #define HFI_RATE_CONTROL_VBR_CFR		0x1000003
 #define HFI_RATE_CONTROL_CBR_VFR		0x1000004
 #define HFI_RATE_CONTROL_CBR_CFR		0x1000005
+#define HFI_RATE_CONTROL_MBR			0x1000006
 #define HFI_RATE_CONTROL_CQ				0x1000008
 
 #define HFI_H264_ENTROPY_CAVLC			0x1
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc..08b660d3285c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -183,6 +183,7 @@ enum platform_inst_fw_cap_type {
 	LAYER3_BITRATE_HEVC,
 	LAYER4_BITRATE_HEVC,
 	LAYER5_BITRATE_HEVC,
+	MBR_RATE_CONTROL,
 	INST_FW_CAP_MAX,
 };
 
@@ -319,6 +320,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	bool mbr_rc_supported;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 6e06a32822bb..2e160710d6af 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -87,6 +87,7 @@ const struct iris_platform_data sc7280_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 1,
 	.no_aon = true,
+	.mbr_rc_supported = true,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index affec0ab4781..04ac1c6532f7 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -234,6 +234,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1230)
 
+/*
+ * The base for the Qualcomm iris driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_QCOM_IRIS_BASE		(V4L2_CID_USER_BASE + 0x1240)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */

---
base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
change-id: 20260212-b4-add_sc7280_mbr-597ac615b931

Best regards,
-- 
Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>

