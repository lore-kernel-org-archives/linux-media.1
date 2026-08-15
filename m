Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF633346A11
	for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 19:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786821757; cv=none; b=VE+WEN0Hs2GCYEFJSKw+K2tZGSGi6wCloQfJ6qzTSz38DYFEih58K2fJ0KVEv2yqRtxa9BmPcqSWF2pPIKsPXTSr6lKCtFr8nalrfcVmW4wMFA4zLkZgYYtTMAcakfi/08PntsavKcAr4kRPhG4y00XYlSujdSGCY98j2x0k4ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786821757; c=relaxed/simple;
	bh=ixZa0J3TggGThL0sD08+i6gjRQmCMf60YMWcgAVXzZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BGGSd7bmSuHutx2b7N7DEC4nPSymPf+9J1DrFJ2C08lKb8qOobhrdE6CHm3XKXaMJJ3YJj4aBiRUXxdeSvbh1j970VI+muP1EKjGYwXJ7lK3Wg4THje1RaI4drHkB88H1R268R3UYN/4AqBOgjPqHL9C7HbgU6puG8edyOzyYNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1KuzBE5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eFJYA6Ul; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1KuzBE5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eFJYA6Ul"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FGSvca597693
	for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 19:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Q8ud0NK10aaZ1KWgBtcRNFs14xYo0XPYZ7w4kihtyI=; b=d1KuzBE5aXeAI24z
	tGv8EUSYgUNTJw4IRz+KEmClZ5PZ+x2KnrZxTEP1V5XJ4eFSlNLDqhk+DKMapIZB
	27xPaBcmd5iU1MiP4fjkIEVfijTIsAXXfeHjMGzZGNSpxRBw79iyGvOXcY7P1vIB
	aDaMcxrczYSvIxivodNHKGJjKcTbgbGb0AFM8saYZ/j0tQU8+JVH6jkS02mbliQ9
	4KZd6y3pQOZJeLVGLbDJKpFY6KaInlK0iTrDfG/eF9tlvu7+St7q4R5vrqbTGgpi
	RjwxAh+3N4MEcBTzDCEHsKRUzkXJW9XdKi7Ib4XS30MxwXbjSSpGb2IMzmNevRKw
	vG104w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2hd7sqey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 19:22:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ceb3d20b7cso4884485ad.3
        for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 12:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786821754; x=1787426554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Q8ud0NK10aaZ1KWgBtcRNFs14xYo0XPYZ7w4kihtyI=;
        b=eFJYA6UlhrxoI79pfLUb9iJmfHccZbcrK1x7NUBffOC7bIN5g9eG/c+sjIib+iJv0O
         NtMYEvylXh6FEbwK7oLXRGMe/UAp6siLt7fIhNjKVJxtf/jSlgil69X58kRjMTPRy24D
         hLAS3HXR5IdzAhqQGO2RYa1a6HK1yS5mA/49ySBOyApJ5GJq2E/pRfuW1ytM10mKqkRN
         kJGautCD1+Da9NatQYq+0Iz+F9ZcK7e0gNm8HGoN2PiOM6yr4peCdoEEFtcqfLJKmTIo
         pZOuZCwmoEhpFcOarrgaUjlVkaHFwlbtM5j4kxaDiEfTpZTzvlUXVuuYLnY2OZMfZXHa
         Do8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786821754; x=1787426554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Q8ud0NK10aaZ1KWgBtcRNFs14xYo0XPYZ7w4kihtyI=;
        b=DhcFNtGI9thHk6m7y4iEicMPYw6+paNdYrgC3N1qf4N2vSXsuToEdKAnc4NE96Q0lZ
         Kus50PvklpIXEqoGmcMFOLKcn0jpchCVt6+vHngSAocCXIG5+BHgVpYeQsdYZLM4mK/n
         1sAgP/hStPJrgwhSjTFt9q4Ya1exKPAnvlxNSt7VmIJeHk8P95ZrzEduy70fU0xxL9Zk
         /eHvvFQCyFUmcZqjCxc45x4AP8oRzTOaiSvgPatmgXSK3/u5ypJ6gQWGPGxKON6Fb3K0
         1MO7Fl3CcS5CiJ/IX3oc9SGXTQhVWy9DUDs9b0+ziQnVECeOwaXn8qHL+4GlqFlBFNrr
         p8CQ==
X-Gm-Message-State: AOJu0Yzio+7/QNGgFuD1j95hP++G96H+fa8JAlQ+Nqm/5loW9KlzWqwm
	0vCERAfpwYLzIDfa8kdEsbwOlcSOjAofsTOoivBCUfilg22gP2EWUDo48N11ZR4s4ffeIESc/I2
	E4gYOGDcDJPBJsxD05M78Q26tWByRFtPjl0vgQ+Q0v4O7tSmMSU9X3bmNlggC4P7aKg==
X-Gm-Gg: AR+sD12XqPO/QlWTxwL53O6WYhQlfR9uK9cCL0aTzOUb3z458cnBJFJYjijff/pFa9E
	CnK2n/o+eqzLqWe8pdJW2MzLfds4FNHlWzdM5TuDMxaFcnlRqgVhIVprDesavHBH8Cz0KEkuV2S
	RJ5efwh3DJ8Ff7rO3+pbRLN7aedyQn9e4jFlsQTK7XeZgHhEKIIjzw/4soMBCDcw6fkNy7ROJNs
	u9XMJgx0d56AGtZNdN8Tqf/sR5iW8bOmqimqnqnr/ix4xrRT/lfRy3YBe6YNyg7AIuM5EXeLxIi
	TCh79wKZXkVWkLMq5FgPyYTWCGwKosMunSCwlxjNtgP4Q+4sG8QnZNpbmQ0NIqs++DAd8HdYszH
	ahWnmWOnzhPAV9TmTVCOL3+t7mMc9Guo/KQ5LhZXWzgSJmVCBVFYhSnoqnByx
X-Received: by 2002:a17:903:2451:b0:2c9:d298:6c0a with SMTP id d9443c01a7336-2d3b0d7af99mr110827405ad.2.1786821754358;
        Sat, 15 Aug 2026 12:22:34 -0700 (PDT)
X-Received: by 2002:a17:903:2451:b0:2c9:d298:6c0a with SMTP id d9443c01a7336-2d3b0d7af99mr110827045ad.2.1786821753892;
        Sat, 15 Aug 2026 12:22:33 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e1cccsm15889350eec.8.2026.08.15.12.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 12:22:33 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Sat, 15 Aug 2026 12:22:26 -0700
Subject: [PATCH v5 3/5] media: iris: Add ROI delta QP control support for
 HFI Gen2 encoders
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260815-enc_roi_enable-v5-3-ded944f0fc7f@oss.qualcomm.com>
References: <20260815-enc_roi_enable-v5-0-ded944f0fc7f@oss.qualcomm.com>
In-Reply-To: <20260815-enc_roi_enable-v5-0-ded944f0fc7f@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786821749; l=7540;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=ixZa0J3TggGThL0sD08+i6gjRQmCMf60YMWcgAVXzZA=;
 b=TAY5iiE5FgIMMkz28ntpoij0XL2ClKoeZWciNLis+2fOJyNDOT099bIZ6MoZn4UcGWBunrPpC
 rHHuN4MMDknAL5SKucqIP+WIYjFapP7/e8glSmmFrGnCkuz6cicq2Yj
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDE0NiBTYWx0ZWRfX7Z5DNqPsOCU8
 pGk17fuezhHhqx87Phl/cXNtqd3OfuQmb0fUvixJ2UWc5OWziUpo9YaK/bnC139v43lRKDPSsjH
 92ftxCvkDtu0fNrcDo7ZF+80muK28KsuhDRogD6knHrod4jQNsEGVwAroytdjjIIT3wLkvw0hhI
 g+puANjt22ondZG9OcKPqVtLmY4dRQnRBSEDjqotS433DFbWOt4Gkv9OUKCzxlkAwxEXMxE/qXt
 w1ko4KUnJiK0a6irERU0eOGlRTLUkP6iGkYeCUj0zxLPhDSVsBPzUJAse0Nynkq97YgW2DirJ7y
 ZgcHukym+SZVGodHtFdglsqHqllGI6m+yiWxZc9PQOhRHfPwFiKHrngH7sP7IrbD8AsEN7W45/J
 zzyCghK/51udBu/HYyKP1r/I7hEYqbhjBtwJQZ69fRI1zDjpaLND6Ztl9oMk+/TKYK+SILABuv+
 5DdHp6KWuj//uwrb3Yw==
X-Proofpoint-GUID: 90Nr0vC1culv9WdYFKWWw4y4_RdT2e7s
X-Authority-Analysis: v=2.4 cv=Ja2Ma0KV c=1 sm=1 tr=0 ts=6a80bc7b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uxVkaJQCnwIzyWVbueAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 90Nr0vC1culv9WdYFKWWw4y4_RdT2e7s
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDE0NiBTYWx0ZWRfXy1vqSvl3Nol+
 4gYiXF3AizZud1BTw+trI5dEN+/GWqpOneHJNlx5ZJAktoeOBu3ptwGmblUMlqffc0iNczO0S99
 3PWQwOtPzKlCaI8QQGkf2xDdE3f5vZM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150146

Add ROI support to the Iris encoder driver for HFI Gen2 based targets.

- Add control infrastructure, ROI_PARAMS and MB_SIZE capability IDs to
  platform_inst_fw_cap_type. Extend struct platform_inst_fw_cap with
  p_array and elems fields to hold a pointer to the per-frame
  delta QP array and its element count, set during s_ctrl.
- Register V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP as a dynamic S8
  array control (max dims = 139264 entries, supporting resolution of
  8192x4352 at 16x16 MB granularity).
  Register V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE as a read-only U8
  control; g_volatile_ctrl returns 32 for HEVC and 16 for H.264.
- Define HFI_PROP_ROI_INFO and hook ROI_PARAMS to iris_set_roi_params().

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 70 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 13 ++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  5 ++
 4 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index bf17d310eac081ffd3a4ad4842c2255ad798d4d8..943c9dcaec12b38ad4dd42ff3beac13ee0402547 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -156,6 +156,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return LAYER5_BITRATE_HEVC;
 	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
 		return REQUEST_SYNC_FRAME;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		return ROI_PARAMS;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
+		return MB_SIZE;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -301,6 +305,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
 	case REQUEST_SYNC_FRAME:
 		return V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME;
+	case ROI_PARAMS:
+		return V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP;
+	case MB_SIZE:
+		return V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE;
 	default:
 		return 0;
 	}
@@ -327,6 +335,14 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	inst->fw_caps[cap_id].value = ctrl->val;
 
+	if (inst->fw_caps[cap_id].flags & CAP_FLAG_CUSTOM) {
+		if (cap_id == ROI_PARAMS) {
+			inst->fw_caps[cap_id].p_array =
+				(const void *)ctrl->p_new.p;
+			inst->fw_caps[cap_id].elems = ctrl->new_elems;
+		}
+	}
+
 	if (vb2_is_streaming(q)) {
 		if (cap[cap_id].set)
 			cap[cap_id].set(inst, cap_id);
@@ -335,8 +351,52 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
+static int iris_get_roi_mb_size(struct iris_inst *inst)
+{
+	return inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
+}
+
+static int iris_op_g_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct iris_inst *inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
+	enum platform_inst_fw_cap_type cap_id;
+
+	cap_id = iris_get_cap_id(ctrl->id);
+	if (!iris_valid_cap_id(cap_id))
+		return -EINVAL;
+
+	if (cap_id == MB_SIZE)
+		ctrl->val = iris_get_roi_mb_size(inst);
+
+	return 0;
+}
+
 static const struct v4l2_ctrl_ops iris_ctrl_ops = {
 	.s_ctrl = iris_op_s_ctrl,
+	.g_volatile_ctrl = iris_op_g_ctrl,
+};
+
+static const struct v4l2_ctrl_config roi_mbqp_cfg = {
+	.ops = &iris_ctrl_ops,
+	.id = V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP,
+	.name = "Enc Mb ROI Delta QP",
+	.type = V4L2_CTRL_TYPE_S8,
+	.dims = {139264}, /* Max MBPF = 8192 * 4352 / 256 */
+	.min = -31,
+	.max = 30,
+	.def = 0,
+	.step = 1,
+};
+
+static const struct v4l2_ctrl_config roi_mbqp_size = {
+	.ops = &iris_ctrl_ops,
+	.id = V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE,
+	.name = "ROI Mb size",
+	.type = V4L2_CTRL_TYPE_U8,
+	.min = 16,
+	.max = 32,
+	.def = 16,
+	.step = 1,
 };
 
 int iris_ctrls_init(struct iris_inst *inst)
@@ -361,7 +421,7 @@ int iris_ctrls_init(struct iris_inst *inst)
 		return ret;
 
 	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
-		struct v4l2_ctrl *ctrl;
+		struct v4l2_ctrl *ctrl = NULL;
 
 		v4l2_id = iris_get_v4l2_id(cap[idx].cap_id);
 		if (!v4l2_id)
@@ -379,6 +439,13 @@ int iris_ctrls_init(struct iris_inst *inst)
 						      cap[idx].max,
 						      ~(cap[idx].step_or_mask),
 						      cap[idx].value);
+		} else if (cap[idx].flags & CAP_FLAG_CUSTOM) {
+			if (cap[idx].cap_id == ROI_PARAMS)
+				ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
+							    &roi_mbqp_cfg, NULL);
+			if (cap[idx].cap_id == MB_SIZE)
+				ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
+							    &roi_mbqp_size, NULL);
 		} else {
 			ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler,
 						 &iris_ctrl_ops,
@@ -1540,3 +1607,4 @@ int iris_set_properties(struct iris_inst *inst, u32 plane)
 
 	return 0;
 }
+
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 3b8fbefb8b93576962abd3850215f7b7fb364930..d628bc6748438b19dac01cd11cb9f8da0b8500af 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1782,6 +1782,19 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_req_sync_frame,
 	},
+	{
+		.cap_id = ROI_PARAMS,
+		.step_or_mask = 1,
+		.p_array = NULL,
+		.hfi_id = HFI_PROP_ROI_INFO,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_CUSTOM |
+			 CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = MB_SIZE,
+		.step_or_mask = 1,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_CUSTOM,
+	},
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index f43aea10090d8f1d6ae5c20547e5f6321b2ca203..08fc1036013de29e51747a6425ae7bb805ca3e0f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -133,6 +133,7 @@ enum hfi_flip {
 #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
 #define HFI_PROP_NO_OUTPUT			0x0300016a
 #define HFI_PROP_BUFFER_MARK			0x0300016c
+#define HFI_PROP_ROI_INFO			0x03000173
 #define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
 #define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
 #define HFI_PROP_RAW_RESOLUTION		0x03000178
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9748095091461ba13443c63955a42906fa4f050c..9910eb5514b3ae0a6b5349adb071d0a56375102c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -186,6 +186,8 @@ enum platform_inst_fw_cap_type {
 	LAYER5_BITRATE_HEVC,
 	REQUEST_SYNC_FRAME,
 	TIME_DELTA_BASED_RC,
+	ROI_PARAMS,
+	MB_SIZE,
 	INST_FW_CAP_MAX,
 };
 
@@ -197,6 +199,7 @@ enum platform_inst_fw_cap_flags {
 	CAP_FLAG_CLIENT_SET		= BIT(4),
 	CAP_FLAG_BITMASK		= BIT(5),
 	CAP_FLAG_VOLATILE		= BIT(6),
+	CAP_FLAG_CUSTOM			= BIT(7),
 };
 
 struct platform_inst_fw_cap {
@@ -206,6 +209,8 @@ struct platform_inst_fw_cap {
 	s64 step_or_mask;
 	s64 value;
 	u32 hfi_id;
+	const void *p_array;
+	u32 elems;
 	enum platform_inst_fw_cap_flags flags;
 	int (*set)(struct iris_inst *inst,
 		   enum platform_inst_fw_cap_type cap_id);

-- 
2.34.1

