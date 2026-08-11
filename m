Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5D237FF6A
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 18:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786473018; cv=none; b=QcGAxcKDbCpV9/CYIDLHq9JxjAFA1fP4OVvqtWxF6QQINx6181QdLRig65R4JvOdSoX6BAM9aYYyndtwuDlnAzTEJQlSG16g0WiBuMI/nay3QEwR7J9Rs3bk7L0qA0jKqpTyN4Hco8G0UCWGnQFay1OuNCJ3izt1V39zduaZVgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786473018; c=relaxed/simple;
	bh=D7Sm8u1wdO3vrXIzbQAT3/Ga2Pt8dJOD+ZkS0vXQM+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sF5tvr+sVKOC3QzdUgY8v9IlP3fqpWssKNOP8NvoJPKC0ELtbVF2Tc4sckFNmL4SZiB7gVMlsHKui7XMugJpD6dJw4Q9YwIov8COhU2zTKSIEq/47Hx86dK3HuqWnNsAOFP6mrynQX9IrAvUbfcEPjmSugJrP1TlscFdoq3dVek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqNrcyBb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ymc3BIdB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqNrcyBb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ymc3BIdB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BGNw3M4120816
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 18:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	09q0dR3veXeMDQfpze3k1OX0PRNKn2Y6YM/C5CUH7vA=; b=gqNrcyBbdrhF5Nmj
	suLY+Ys8uvsP8+avTH8isdstGQgjCPn8bNkK7qcAQqjMuC+pXEFsbUsQEin/fd63
	vMTqUc6Bs79qxlg+rxraSb7fGYELBXi9/22IckoeTKtps3M70pUfSQFFroe2VU3z
	76cDYQpk4Uhdwq9R38lANxzp9Nomgm3CvD6hOlqs01Y3gcQuXk2qsln3+sfR4gTu
	PNloJ/PZen81gpyLy49scFRaZ9vl+1r+hn0HGwu76ic5FkIm9CSUWzE3q3dYl292
	4/0e4rIhopTSEJ77JNPnsKFudgKDTsMixYXmbC5HKOmh5rBiGgFk+JZPxu5jnyHh
	ycqIeg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyxwetstp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 18:30:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d0563db6bcso1010495ad.2
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 11:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786473014; x=1787077814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09q0dR3veXeMDQfpze3k1OX0PRNKn2Y6YM/C5CUH7vA=;
        b=Ymc3BIdBR4C2nwMwOn68l25nY4+UaZ2XYKz7IjFPBf0mSg8BLVjUWwxw5ecVk5/DyI
         EcaOQEh0G8mLk55YyzaY6qZNfu1XZBiXdwAAKLMIw20TmpeKbIWRgRVHogOgqspra7Xw
         dS/GwRepH/T5cIKU9ewBbeSVFENkmxHbfUsVqslv9DzK2fdUb0fzG2HmGOnOUZHDfPbq
         zhhHda6F6USp2GiF/9vPRxuVzZA7tXYyKgjyxJgndnJAI/jIIrYd0cK78twRBxX9gqyR
         TdZQOGKIX/dc04QvFHpccppg4zOJihu55kh66FPNGF9mIOojlR+ejRHHvmZ4IkgjZ6LP
         QDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786473014; x=1787077814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09q0dR3veXeMDQfpze3k1OX0PRNKn2Y6YM/C5CUH7vA=;
        b=ePFbm0LqvlQixxoaMq3KFH3NzBKx2BJzjAjwXCX+N/aakbKGbomgtDsWXnSWj476R8
         B17XanajCuTky8hac/SrfqvE1GdPKESegU4FakZVfxQ2FcbUnhnrhUuJrFos/IXGSebs
         a6W6PYyZseR9UvH+bXKAQAivWKf4vEQK1fPc6BK6uq1gZFDT8sA+NLHVnbqWoO+BpjEX
         Ac+TOZ1QDIocCOXqeRglISd8YkNNrMNSBg0UUu/PO69kn3cb5TcFdU9JSVYYBmydYTf5
         x0tl24TY6Oi/YchHMGsMB8ZJFXsTSZP5DERuavMrk6W9Bkr8lH3uCd5t03ZtgBILYX0+
         sHdA==
X-Gm-Message-State: AOJu0YxrOAA/H0RH7fc0ZrDbmPt9cXXWjHm6djbrTvsY5ConsInqTPBz
	k7rDdF6E/Pjn1/o6gH9FGIMkM06HinKhzPD3cIDi6LA3LH3dzOug4AtQRJ30qGlNP3ncoWK8JfD
	YKBl1/FUQqslwgDdQP8lw03LgR/BabUIikASRTOpN9QpEydgQYon4PrXAtjlHzlGrrfwbi8kftA
	==
X-Gm-Gg: AR+sD103lR8bjCfz6JRXD2ytDWg8QEqQUgrw2RHCEXzhuHhIAS1WvF6LYufzoP5NP4p
	D3EIHEkMb16HheT/ahwfSzWbVb0mkR5PMx+/6VfMHTaeF+5Uw3WTLvE8DwdF85+7wp71ovIIgFt
	GaiZHcCYjVCPF7EXWFwdTDNYuTDccGuhBwHLi8NJrtkBcx22iqEClN5u1BQ6Pl7Fts+A+k9uReC
	XPuWoH+PNoh6bg0ysSVC0nMAJEeA0lovCHoiJueBxjl37cJv7+ic7uDn7fztFffTWx9rVGGI8Bt
	MUNJjp2B8IuydiV6F5/8WMyUmxB6NKNPRg2UWdLe4dR2roeB8/AnHSxt6G4s/5o5Tpp/CE8GucL
	JHM2KlDoC0mTefFzD4C9s13IpavMp8HxzYTeKjswZtBCNg/rxt0SmXxfOE+Xi
X-Received: by 2002:a17:902:f791:b0:2ca:d803:5c8f with SMTP id d9443c01a7336-2d31776844emr48010245ad.1.1786473013826;
        Tue, 11 Aug 2026 11:30:13 -0700 (PDT)
X-Received: by 2002:a17:902:f791:b0:2ca:d803:5c8f with SMTP id d9443c01a7336-2d31776844emr48009545ad.1.1786473013270;
        Tue, 11 Aug 2026 11:30:13 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315d829c4sm11759955ad.0.2026.08.11.11.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:30:12 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 11:30:08 -0700
Subject: [PATCH v4 3/5] media: iris: Add ROI delta QP control support for
 HFI Gen2 encoders
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-enc_roi_enable-v4-3-1c9ea2405bb8@oss.qualcomm.com>
References: <20260811-enc_roi_enable-v4-0-1c9ea2405bb8@oss.qualcomm.com>
In-Reply-To: <20260811-enc_roi_enable-v4-0-1c9ea2405bb8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786473008; l=8860;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=D7Sm8u1wdO3vrXIzbQAT3/Ga2Pt8dJOD+ZkS0vXQM+A=;
 b=Q+/aNB1zVGfEXJdLmArq4OF/yG8GXHtQ1hEOucen6dZI2V5/nhtiSspJuJ2u3IvbAsdkuxJ+R
 sbJ5ir4fApKAc9URXV2Q6dJuRqMqfrTJMaru75HoP9Hi0xSOR25LH6J
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: H76ae_XjR4_W6x7ARNoxnkPRkfik4fmE
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=6a7b6a36 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=UQCaeshRnrjKnXqCz0QA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: H76ae_XjR4_W6x7ARNoxnkPRkfik4fmE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX486oUKdYNWC5
 riV0GBC40Fh1BuuPVCl+olfK8qTnuD8VnieulBfAi33KLR7b6cZqf5qdEGC/5NANWJvZf6Sk6uN
 B4R/LDxXNVcrNW8YLJERwYT1RGzixWw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX0vt90OnWj2Y/
 qcPu0DcgN4mU0ZQoYceosOz8adAA9SqWAKwrFkRYet9BV4Bbnv+XFkyybe9XFO8h94kmiYeIKGp
 TZ3mnVoVgvHYE2/fnA0gkIO9yhnp2xYQd2ZQCJcOuKSgl9swgpbWp9eMG03YSJZOmtrqZ89ySsj
 5hziwJA7ezsSCXLSdmKH6ywjgll5cTDzkY/1HQ/7ecX/TSBaDOCHa52LC42jsv2L7ZZs0jwvBI2
 wReYmvtGv0bmuSqqwc2mmDUTEXX0stFI49iITtkliWUcKFku1ba9Zh3e1+etBkG2ZyxjAAw0rME
 ynJ1UFSK7ghOlMHI4KJ9Q5rtQexUn4p8MOkFXdN8sm6utjt64eObII0qXVnYNTBJHWXPS3KBwI5
 eImMLpJrzVj/LnVU3pynotFuiu/Hojle96peBu20FI0nM3pSRgKD6j13ALzrWF4E9IgAy0Qm9qq
 9eLCqAQUpwy7Gi7aUYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_04,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110155

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
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 88 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 14 ++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  5 ++
 5 files changed, 108 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index bf17d310eac081ffd3a4ad4842c2255ad798d4d8..de48b6e65d2ef6c7939455d28c08db88a8a0fda0 100644
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
+const struct v4l2_ctrl_config roi_mbqp_cfg = {
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
@@ -1540,3 +1607,22 @@ int iris_set_properties(struct iris_inst *inst, u32 plane)
 
 	return 0;
 }
+
+int iris_set_roi_params(struct iris_inst *inst, u32 plane)
+{
+	struct iris_buffers *buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
+	u32 metadata_header_bytes = 256;
+	u32 size = 0;
+	int ret = 0;
+
+	if (!inst->fw_caps[ROI_PARAMS].p_array)
+		return -EINVAL;
+
+	size = inst->fw_caps[ROI_PARAMS].elems * 2 + metadata_header_bytes;
+	buffers->size = ALIGN(size, 4096);
+	ret = iris_hfi_gen2_session_alloc_roi_metadata_buffer(inst);
+	if (ret)
+		return ret;
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 5180d53d3c904cad460b2760913b475d0ff1bb55..4eb632c923e961de3679a8b049fa264d0ad88621 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -50,5 +50,6 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
 int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_time_delta_based_rc(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
+int iris_set_roi_params(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 3b8fbefb8b93576962abd3850215f7b7fb364930..4d40d6733e5877a302ce63fb0b4a61b8f284e6dc 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1782,6 +1782,20 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
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
+		.set = iris_set_roi_params,
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

