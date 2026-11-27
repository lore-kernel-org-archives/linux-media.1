Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779706;
	b=baljZA4V14ERhXh7cQX83z90VIUcxLD5nvsKYVOtS2WMOs+sYEvOr1920/m7YthhLJMO
	 tT2eAFbS4pH50+3Tw/cCqEqtr1aR4GkHN1BaxS+GZnI0rBaN3wZRO9Df1eyf64Jfqbids
	 nFh3ijY8RuNW+zwtm5YU6/YORIC5FneF3n/mxdnuxapLm/37FLkXMuos4vl8LAvpf3E4E
	 U3eeAWgVgcIsgJUKVUalXBAvvDGarxRS+pXcGvDTPWVULL+sJCWCYdoAPYQQXFofeUl4U
	 bI9PuWgjC6WBU26/Gi+JaAACqGM2mwnVz+MgrxhootrFDKPwfddfyHfcSzyquXoww/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779706;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=x7cYJVc8D8uoWQORRbWYC2jDzNAHY2d8XC7XxfJKb8w=;
	b=WUsmGO6Kh8oOFNFS9JhkucJdpW8qeeUD+rqrEkizvSNmXj/99yMIZG4Y4v0kMArZWHRn
	 tGujl7RiLkN0pql2YlO9KMhfhxzRrfHukCF4uMNx6lUQtP2cjub2GJAj+FhfiFSh7HkqC
	 R864kL3AA/q6n2khpjzQUX6MxgimoqJoqXueJKBCmQPh7V5Vi4MddbvNaO/9n+UdZ5nVK
	 YkS2xj2UzB1xEwepH5WLRVI5x8ncqhyMa7OQ3v8OEZd0v/5NVzCF8fJkyF8Fy7ydeNN2q
	 vaTv8fpJcb5gTZ7H5ZuOwYvDw6Jsxc/nLDM9GBIdjmaKtWQ4gU1eFEOAUM75/X2SIqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=radxa.com;
	spf=pass smtp.mailfrom=radxa.com;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A934606A697;
	Fri, 27 Nov 2026 11:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A934606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1795779677tec956ef0
X-QQ-Originating-IP: BBCgdYenzmVxDo3eYyDDP/7qOlyPgNc7tXTTfo2QV78=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 19:41:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9762895957016935004
EX-QQ-RecipientCnt: 19
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 27 Nov 2026 19:40:56 +0800
Subject: [PATCH v2 3/5] media: iris: Add deblocking filter controls for HFI
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
Message-Id: <20261127-iris-va-fixes-v2-3-385e8636c22d@radxa.com>
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
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, sakimidare <ssmzhn@163.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11372; i=sophon@radxa.com;
 h=from:subject:message-id; bh=aPUR30J7J5RuwGt9grdi5iqIh8NtTkGcUIoWdgGua/4=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDNmcOYEf+np1Kni3bo/5Os/Vomrbf4XyuS0xM1yVM1jZU
 1MXX1nWUcrCIMbFICumyKIQzzCXvTL32lOxUj2YOaxMIEMYuDgFYCJsmxgZNu5d1pX1SPSwTWLN
 9eK+J918xYasK2U6stNvHrb6KxVtyPDP7uSi189+Xf79u11H+V7GuoiLJrX79SeqZZc7xwvcF2/
 jBAA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MGrSfDJOGEDKabsO/HiKDboWwI3GFAbBBBOZcs5e3PLSZAAAK8Z8Ku+N
	vRLJQrT/v7PbNUAGL6XQo8QigZZ6exFqSpwd/00kYupZMB8l4+GDbXBa1y0Rgislk0WPmuA
	wLvbib3kkzYW5EDFKnIF73E5sQTte524B7c9MFcwLB3YgTt9aaZouPBUgKgIvxGDSDw2GOy
	CTxIX3MF7yoHzwUs8mwR4hV6gmPWX8HqNSVkgxjXhcqgHoX0jtVyl4XgVRR/CccCxggiNOn
	YYNS1IMQwW1EAXICCGEvCdtgLMHdOYzoKGf9+4ZTShUn8gDBvkVHYCq2X4M2P3cnqY6lG3v
	dDchPEl4IqQhTPVNDWn8pShZ32vVkTdxKWqsx6PRe6oJpN0W1MwUCeOenBzmFGqhBpXTn10
	MYRyg6ZTyRQ6qyu6RMx0g+1mE4PiJNMHblDTpmkt1KQgRYnsO68mnrj7ecKQE7JtfaEYZ/x
	COrjUWVucagUwsZOphK0/hofV+Ujt04AruNHn85OfHi0Fq3e3B+HGpOKeA7j6/aexHvxF2v
	VwQQs3PNovp4F66lNKEyG6fQmsIbcSdo0U3hF3hqC+5HYQp3PClAfKGq5l+m5IZoU4Z/Pq5
	j22PHkBPpX5Aj3TGE7DhSpE4BVFZQS+U7cmDpIZIlCOvEBOhe/sySYK7KylORQ6FYrAsn2d
	EVMdEagB/jNR4+TZ6f9Qw1W03hlbNYzd9Y8Ml4W+3n1vb86sm6yJvO1wsptNjky5wDdazjg
	DUcLGYrOvxhQw61nAOkIeXnDh+BFKGaF1k1Ej9zLyiAeREkSppmxYBGXBeGY09FtoZBthJk
	kzt3MhxQvA90uNKHKQvwm8mtPZEk6HzJ9HkCWmtVHYNxQ3gcBPX/gNFqQboKbDWsmZ2py7U
	LmcQXFsrbz+vwcb6v+PcWCWSfxW8zCOK06rSwRVcKHqhoGPFHBKbmB6YsVJeAaey051p6SY
	tmwTJTRHh2dqEwPyX2rTW4QrhM4mE9gtpWuiWpnIpbyoc/VFIaFmLevHLvTwAo0KND7Nxm+
	zTRk0BSN035lU7/LF3OsE4z/18ZdK0Mc1HqaQHaXsYYh+FigA5n3N84ksh9o5aDg6JpPGBT
	i32P+aLPtKO5qtpH4AzQ3U=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

HFI gen2 encoders do not expose deblocking filter controls, preventing
applications from configuring the filter mode and offsets.

Add the standard V4L2 H.264 and HEVC loop filter controls.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Tested-by: sakimidare <ssmzhn@163.com>
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  85 +++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 116 +++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   8 ++
 .../platform/qcom/iris/iris_platform_common.h      |   6 ++
 5 files changed, 216 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 0b59fc79971c..aa98499b48c0 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -55,6 +55,18 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return GOP_SIZE;
 	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
 		return ENTROPY_MODE;
+	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE:
+		return DEBLOCK_MODE_H264;
+	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA:
+		return DEBLOCK_ALPHA_H264;
+	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA:
+		return DEBLOCK_BETA_H264;
+	case V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE:
+		return DEBLOCK_MODE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2:
+		return DEBLOCK_TC_HEVC;
+	case V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2:
+		return DEBLOCK_BETA_HEVC;
 	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
 		return MIN_FRAME_QP_H264;
 	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:
@@ -210,6 +222,18 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_GOP_SIZE;
 	case ENTROPY_MODE:
 		return V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE;
+	case DEBLOCK_MODE_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE;
+	case DEBLOCK_ALPHA_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA;
+	case DEBLOCK_BETA_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA;
+	case DEBLOCK_MODE_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE;
+	case DEBLOCK_TC_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2;
+	case DEBLOCK_BETA_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2;
 	case MIN_FRAME_QP_H264:
 		return V4L2_CID_MPEG_VIDEO_H264_MIN_QP;
 	case MIN_FRAME_QP_HEVC:
@@ -884,6 +908,67 @@ int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
 				     &entropy_mode, sizeof(u32));
 }
 
+int iris_set_deblock_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 mode = inst->fw_caps[cap_id].value;
+	u32 alpha_tc, beta, hfi_value;
+
+	if (inst->codec == V4L2_PIX_FMT_H264) {
+		if (cap_id != DEBLOCK_MODE_H264)
+			return 0;
+
+		switch (mode) {
+		case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED:
+			mode = HFI_DEBLOCK_ALL_BOUNDARY;
+			break;
+		case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED:
+			mode = HFI_DEBLOCK_DISABLE;
+			break;
+		case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY:
+			mode = HFI_DEBLOCK_DISABLE_AT_SLICE_BOUNDARY;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		alpha_tc = inst->fw_caps[DEBLOCK_ALPHA_H264].value + 6;
+		beta = inst->fw_caps[DEBLOCK_BETA_H264].value + 6;
+	} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
+		if (cap_id != DEBLOCK_MODE_HEVC)
+			return 0;
+
+		switch (mode) {
+		case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED:
+			mode = HFI_DEBLOCK_ALL_BOUNDARY;
+			break;
+		case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED:
+			mode = HFI_DEBLOCK_DISABLE;
+			break;
+		case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY:
+			mode = HFI_DEBLOCK_DISABLE_AT_SLICE_BOUNDARY;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		alpha_tc = inst->fw_caps[DEBLOCK_TC_HEVC].value + 6;
+		beta = inst->fw_caps[DEBLOCK_BETA_HEVC].value + 6;
+	} else {
+		return 0;
+	}
+
+	/* Firmware expects offsets biased by 6, with alpha or HEVC tc in bits 23:16. */
+	hfi_value = alpha_tc << 16 | beta << 8 | mode;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_32_PACKED,
+					     &hfi_value, sizeof(hfi_value));
+}
+
 int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 08db80744420..82437f4e19c1 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -29,6 +29,7 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
 int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_deblock_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 90cba1ae534b..b41d59c645a9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -367,6 +367,64 @@ static const struct platform_inst_fw_cap inst_fw_cap_milos_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_entropy_mode_gen2,
 	},
+	{
+		.cap_id = DEBLOCK_MODE_H264,
+		.min = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
+		.max = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
+		.step_or_mask =
+			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED) |
+			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED) |
+			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY),
+		.value = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
+		.hfi_id = HFI_PROP_DEBLOCKING_MODE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_deblock_gen2,
+	},
+	{
+		.cap_id = DEBLOCK_ALPHA_H264,
+		.min = -6,
+		.max = 6,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = DEBLOCK_BETA_H264,
+		.min = -6,
+		.max = 6,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = DEBLOCK_MODE_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED,
+		.max = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
+		.step_or_mask =
+			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED) |
+			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED) |
+			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY),
+		.value = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED,
+		.hfi_id = HFI_PROP_DEBLOCKING_MODE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_deblock_gen2,
+	},
+	{
+		.cap_id = DEBLOCK_TC_HEVC,
+		.min = -6,
+		.max = 6,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = DEBLOCK_BETA_HEVC,
+		.min = -6,
+		.max = 6,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
 	{
 		.cap_id = MIN_FRAME_QP_H264,
 		.min = MIN_QP_8BIT,
@@ -1329,6 +1387,64 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_entropy_mode_gen2,
 	},
+	{
+		.cap_id = DEBLOCK_MODE_H264,
+		.min = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
+		.max = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
+		.step_or_mask =
+			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED) |
+			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED) |
+			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY),
+		.value = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
+		.hfi_id = HFI_PROP_DEBLOCKING_MODE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_deblock_gen2,
+	},
+	{
+		.cap_id = DEBLOCK_ALPHA_H264,
+		.min = -6,
+		.max = 6,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = DEBLOCK_BETA_H264,
+		.min = -6,
+		.max = 6,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = DEBLOCK_MODE_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED,
+		.max = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
+		.step_or_mask =
+			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED) |
+			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED) |
+			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY),
+		.value = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED,
+		.hfi_id = HFI_PROP_DEBLOCKING_MODE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_deblock_gen2,
+	},
+	{
+		.cap_id = DEBLOCK_TC_HEVC,
+		.min = -6,
+		.max = 6,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = DEBLOCK_BETA_HEVC,
+		.min = -6,
+		.max = 6,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
 	{
 		.cap_id = MIN_FRAME_QP_H264,
 		.min = MIN_QP_8BIT,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index e89ed4075526..04e5429328eb 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -57,6 +57,14 @@
 #define HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT	0x03000124
 #define HFI_PROP_PIC_ORDER_CNT_TYPE		0x03000128
 
+enum hfi_deblock_mode {
+	HFI_DEBLOCK_ALL_BOUNDARY			= 0x0,
+	HFI_DEBLOCK_DISABLE			= 0x1,
+	HFI_DEBLOCK_DISABLE_AT_SLICE_BOUNDARY	= 0x2,
+};
+
+#define HFI_PROP_DEBLOCKING_MODE			0x03000129
+
 enum hfi_rate_control {
 	HFI_RC_VBR_CFR		= 0x00000000,
 	HFI_RC_CBR_CFR		= 0x00000001,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index aa8cd2e1b3f1..75e56d10f5d0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -158,6 +158,12 @@ enum platform_inst_fw_cap_type {
 	FRAME_RC_ENABLE,
 	GOP_SIZE,
 	ENTROPY_MODE,
+	DEBLOCK_MODE_H264,
+	DEBLOCK_ALPHA_H264,
+	DEBLOCK_BETA_H264,
+	DEBLOCK_MODE_HEVC,
+	DEBLOCK_TC_HEVC,
+	DEBLOCK_BETA_HEVC,
 	MIN_FRAME_QP_H264,
 	MIN_FRAME_QP_HEVC,
 	MAX_FRAME_QP_H264,

-- 
2.56.1

