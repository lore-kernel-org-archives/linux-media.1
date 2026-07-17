Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776F5342523
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 06:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271186; cv=none; b=L8VY3b1kVuDadVQhLsK6+tBzGa5z6MTyof/mQLGaJKV3LyI4RpLJHEmtyTMmzc8B3K68NCf6taLAqt6+U2P/loURr0/QKCygh1CNDiNjwGG3UyjWo6DnTF6HOlzLWrbXcXpTjhEC9lNbn34iQDmBauwiSWKORLdrf9ZELEoAyqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271186; c=relaxed/simple;
	bh=8yDreBcOj3amPa4T0grkPkrCECgxqVZrLGhBuaQKcWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kPjhkt81oN36hOEcA+TT8q3CYuSIugutdGoEYu5AEuGxifwgHwMAIA9WTXqeRufoUfv63jWnEKEvCzxCUbPIYnTgCcrJCoaZUivFYV80NkPWTSOu9VCp+3Ps8CgB/tjpj8wUlEuWX/S89L9Lb88pDepAkdk5iC8b6JOBCxBTUFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bdnWq8/+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RTpvwMe+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bdnWq8/+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RTpvwMe+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cSTl851584
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 06:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nIDFE1Mlp6vbWKr73A4oR8KBX0Rql8MWvOli6US77bw=; b=bdnWq8/+jSH8his8
	XucfSc7T6PIwiEplcLi/mmhSFCrSlnDoufv0sjmlzVcMnhFVMpwzvDCF53GZB05h
	/So0ox8NKDZy6V8Lrzu+4DfHUx+cI4W51Y7L0OngCvTgaf5CyaLBaNFmqe/NJXkq
	USmnY1pvA8BM9669dIFm1E1a8T9maAKgMUfx2M1PbUH35+m7Rygz8JCqdsVgkPDy
	bmSCjpm6JBPa0cW1Pns7wm1r/cm8ILlahlXpmW96+qRCprBiG3VtkX6TCl/RNvSc
	v+1IvkeIG3bN4vrG/LLopIUGa3YRKkIhx1jtO5CSZAsx1aHE4gnC1yjfC/vMVZ15
	aSk0qw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9p81w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 06:53:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848551b54f5so14235318b3a.0
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 23:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784271182; x=1784875982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nIDFE1Mlp6vbWKr73A4oR8KBX0Rql8MWvOli6US77bw=;
        b=RTpvwMe+gT6lLPGAep+CE/yFgkfUl/VeVQnXWqHek4U2xab3yj81/H3op5WqlqgzJv
         3aeG4aNqCZuem33cIopnbjo+s8hHNZDE0Z3CwqjxyoXtFYeVuUjr77HsmFGoGJ6oaNuH
         6EfFK48EN0TMb4lxna9cqLRnvnmCqV+GVEEiD23r01GUiLSIAk4vDYTBzyJdnwi4XOIY
         comoElWTOAB3xr8R5GXvQNxjOP6iVK2X2+Qi+sz138HOc49BYy8oIUjOSyZuHW8dvunz
         prvWXCEYCGQ7b/txCXMjEArdVnA1LvihrajRvhzUcbROYvSSmNRKbSGJRSJJxCcqlDrp
         Gp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271182; x=1784875982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nIDFE1Mlp6vbWKr73A4oR8KBX0Rql8MWvOli6US77bw=;
        b=Ag1+1cfP44utnsUO+kG2isFWtQqzpZ2hE3pPBPbhYjqndiTEWN71bIviQdPnMujIhU
         X5t4GbNbgS5FJehsmcoDR4MD7jJcdz0iB4Y+XcDUbv1otnqwT9reOgB4Dz4NIKfRzrgG
         st3GWK9v7f6jSmvm6IpjQm90fJU7hGthGg4ZeZtHiFwy+q1k3Ljpo45Mo61AQDFT4f5z
         ZBNS+JAzoGaF+06j1YP85gk9jPYbTxlKdq9prrtyIDOT3/QwpfhPN3hzYRAx5FpWdwKv
         U8b+hMyBlBjNyNwyeEnk45ubDR3KSzVy6ZVaKkK8tlBIFTyWb0ueff3AHQcbWtKlQerZ
         Hjuw==
X-Gm-Message-State: AOJu0YxwqaDaZVsXmioV29w9LRANjQuU19Ct7oNCNQ+gHTVzwYTYpz9M
	QdI02yZkd6HQkiAmIB4QsbrQhdXAQn5ylJR2YMO45vjhV1BQlstJCsMWw1aJagZ3v9pab3SyG0v
	rI1IB7NnSvladFxG6NXGcyha7WrnF+XxplwjIBc+jAoIMr/Ne/kR6EXFGMtVjLzof0BApTdB+iQ
	==
X-Gm-Gg: AfdE7clUcThnO+GVL0E8Za2FwZ1WDyVWFIsITmRUk4mejMBIMypFY6O/fJM9i6GxmZc
	IHFFCv/u3XPxGjG8+upabJUeJK/oWgayxrKlx5IUCPInt6nIg7eOuX4h5it9eOFVJ6vTuU08GPO
	A81v86UQXgos+x7fgvwZyUUYU4sgc09gBOxBchTMq8CYaU9QY+kIKQTXNYv0czfSV1R7XUTSkIp
	4jK6xw6bEzIGAxvyQbwDGPcgXohS7F8FBJPCA3blXLBo2mH2BlGUbAkoQfqp7hXSuAEwWG0t65G
	FldajP5snn5U0o02gQf2aJLpD3C+OJc2iRFQyI+Zi011OM8w6rUj6PZiEtrZjx5iCJclfRPjdES
	gkbKn69wIfnwsuoE+z/+PjxqnXbJKzuw=
X-Received: by 2002:a05:6a00:2f97:b0:847:8704:1c48 with SMTP id d2e1a72fcca58-84c292ac4d3mr870311b3a.20.1784271182066;
        Thu, 16 Jul 2026 23:53:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:2f97:b0:847:8704:1c48 with SMTP id d2e1a72fcca58-84c292ac4d3mr870174b3a.20.1784271178004;
        Thu, 16 Jul 2026 23:52:58 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adc3466sm437651b3a.15.2026.07.16.23.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:52:57 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 12:21:45 +0530
Subject: [PATCH v2 2/2] media: iris: add support for multi_slice in iris
 encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-iris_multi_slice-v2-2-9550b1feb39b@oss.qualcomm.com>
References: <20260717-iris_multi_slice-v2-0-9550b1feb39b@oss.qualcomm.com>
In-Reply-To: <20260717-iris_multi_slice-v2-0-9550b1feb39b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784271167; l=11814;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=8yDreBcOj3amPa4T0grkPkrCECgxqVZrLGhBuaQKcWw=;
 b=LL5LIVcfHYfnWkxStiyNjmd5dpFL6XKCL9D+oXNhFDSflAG29nEMqGSQwK6LYtsqmzmjNU+MA
 /cwxh3ugnwuDKG3D/xO8mtP3lxvMOEDTTOlTqMoaz09bbM0dLuYtqBn
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-GUID: Yii0lRsqZ_Kk6rJTjjoNS4P1SjH8TdTI
X-Proofpoint-ORIG-GUID: Yii0lRsqZ_Kk6rJTjjoNS4P1SjH8TdTI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA2NiBTYWx0ZWRfXzCVDnJLuXJ5Y
 3vsZRLcL1dd4EnMG7oOYFATfxA611H0hvWXWapqEcHiWlbkp2cDZWwbH/rPA9UIf8J7VmCT9APu
 h/ZXWcPn9Wg4dFSYgVgmbu0OI8ibh9LVnikQOPT5ImvRe1w684JW+HgsJY4Cg3qmtHELXjdgCIf
 g00nu12JveKCsMG6DbPTj9VREGHEgTSTC+EWoNgoMcsVVp1QObRl3qaiOBDIlZVnCnECVyQLi/y
 rziguWSBD7BzoyXcjUQW8aG9lcT3PWgVXwF2PVZw8GspRg3uEcGWgsaRidcao7xiH90+zDAZucN
 MxxbjGeeeFDbPog0beNmKzU8Qb1mijLwvuou3BXXd40vzAq4TPLft1+FCl9villICLZUPdZ9Bh5
 bDLyVkXW71t45IfbJ+SXMRs9TFu1BWbitKZoe2PLzpcr8ce2aK9vNOK9/0sn1M9F1yAD1UHvUdf
 iRJtVnT6w8UOKLP/4ag==
X-Authority-Analysis: v=2.4 cv=TaqmcxQh c=1 sm=1 tr=0 ts=6a59d14f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=57x6y-xoAtUlfagzgEwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA2NiBTYWx0ZWRfX5TEqL9rLVcbx
 IQ2FufcDuorq5CADqTwt0U/bcLqtmUYvYgbCyczqR260qTbMzGpJxZD7OGKLbl8nzuVLIcmvdzO
 G84DaWBlHWaeEDf5CsJlGsLxlVROayI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170066

Add multi-slice encoding support with MAX_MB and MAX_BYTES modes.

Clients can enable slice mode using V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE
control and configure slice size via V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
or V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES controls.

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 81 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 33 ++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
 .../platform/qcom/iris/iris_platform_common.h      | 12 ++++
 .../platform/qcom/iris/iris_platform_qcs8300.h     |  9 +++
 .../platform/qcom/iris/iris_platform_sm8550.h      |  9 +++
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  9 +++
 8 files changed, 155 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 6c4eed62d7e3..3f8b869ab87d 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -154,6 +154,12 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return LAYER4_BITRATE_HEVC;
 	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
 		return LAYER5_BITRATE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
+		return SLICE_MODE;
+	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES:
+		return SLICE_MAX_BYTES;
+	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
+		return SLICE_MAX_MB;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -297,6 +303,12 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
 	case LAYER5_BITRATE_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
+	case SLICE_MODE:
+		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE;
+	case SLICE_MAX_BYTES:
+		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES;
+	case SLICE_MAX_MB:
+		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB;
 	default:
 		return 0;
 	}
@@ -1480,6 +1492,75 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
 					     &bitrate, sizeof(u32));
 }
 
+int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
+	u32 slice_mode = inst->fw_caps[SLICE_MODE].value;
+	u32 bitrate = inst->fw_caps[BITRATE].value;
+	u32 rc_type = inst->fw_caps[BITRATE_MODE].value;
+	u32 fps = inst->frame_rate;
+	u32 output_width = inst->fmt_dst->fmt.pix_mp.width;
+	u32 output_height = inst->fmt_dst->fmt.pix_mp.height;
+	u32 mbpf = NUM_MBS_PER_FRAME(output_height, output_width);
+	u32 max_width, max_height, min_width, min_height;
+	u32 max_avg_slicesize, hfi_value, hfi_id;
+
+	if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE) {
+		dev_dbg(inst->core->dev, "slice mode is: %u, ignore setting to fw\n", slice_mode);
+		return 0;
+	}
+	if (!fps) {
+		dev_err(inst->core->dev, "Invalid frame rate %d\n", fps);
+		return -EINVAL;
+	}
+	if (fps > caps->max_slice_frame_rate ||
+	    (rc_type != HFI_RC_OFF && rc_type != HFI_RC_CBR_CFR &&
+	    rc_type != HFI_RC_CBR_VFR && rc_type != HFI_RC_VBR_CFR)) {
+		dev_err(inst->core->dev, "slice unsupported, fps: %u, rc_type: %#x\n",
+			fps, rc_type);
+		return -EINVAL;
+	}
+
+	max_width = (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
+			caps->max_mb_slice_width : caps->max_bytes_slice_width;
+	max_height = (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
+			caps->max_mb_slice_height : caps->max_bytes_slice_height;
+	min_width = (inst->codec == V4L2_PIX_FMT_HEVC) ?
+			caps->min_hevc_slice_width : caps->min_avc_slice_width;
+	min_height = caps->min_slice_height;
+
+	if (output_width < min_width || output_height < min_height ||
+	    output_width > max_width || output_height > max_height) {
+		dev_err(inst->core->dev, "slice unsupported, codec: %#x wxh: [%dx%d]\n",
+			inst->codec, output_width, output_height);
+		return -EINVAL;
+	}
+
+	if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) {
+		hfi_value = inst->fw_caps[SLICE_MAX_MB].value;
+		hfi_value = max(hfi_value, mbpf / caps->max_slices_per_frame);
+		if (inst->codec == V4L2_PIX_FMT_HEVC)
+			hfi_value = (hfi_value + 3) / 4;
+		hfi_id = inst->fw_caps[SLICE_MAX_MB].hfi_id;
+	} else if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
+		hfi_value = inst->fw_caps[SLICE_MAX_BYTES].value;
+		if (rc_type != HFI_RC_OFF) {
+			max_avg_slicesize = ((bitrate / fps) / 8) / caps->max_slices_per_frame;
+			hfi_value = max(hfi_value, max_avg_slicesize);
+		}
+		hfi_id = inst->fw_caps[SLICE_MAX_BYTES].hfi_id;
+	} else {
+		return -EINVAL;
+	}
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &hfi_value, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 3c462ec9190b..5a73c7c49d36 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type c
 int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index acc0ed8adda1..fcbebced05c3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -12,6 +12,8 @@
 
 #define VIDEO_ARCH_LX 1
 #define BITRATE_MAX				245000000
+#define MAX_SLICE_MB_SIZE         \
+	(((4096 + 15) >> 4) * ((2160 + 15) >> 4))
 
 static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
@@ -937,7 +939,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_layer_bitrate,
-	}
+	},
+	{
+		.cap_id = SLICE_MODE,
+		.min = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE,
+		.max = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE) |
+					BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) |
+					BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES),
+		.value = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_slice_count,
+	},
+	{
+		.cap_id = SLICE_MAX_BYTES,
+		.min = 512,
+		.max = BITRATE_MAX >> 3,
+		.step_or_mask = 1,
+		.value = 512,
+		.hfi_id = HFI_PROP_MULTI_SLICE_BYTES_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = SLICE_MAX_MB,
+		.min = 1,
+		.max = MAX_SLICE_MB_SIZE,
+		.step_or_mask = 1,
+		.value = 1,
+		.hfi_id = HFI_PROP_MULTI_SLICE_MB_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 776b21cd11b2..226894b99dcc 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -71,6 +71,8 @@ enum hfi_rate_control {
 #define HFI_PROP_MIN_QP_PACKED			0x0300012f
 #define HFI_PROP_MAX_QP_PACKED			0x03000130
 #define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
+#define HFI_PROP_MULTI_SLICE_MB_COUNT		0x03000132
+#define HFI_PROP_MULTI_SLICE_BYTES_COUNT	0x03000133
 #define HFI_PROP_LTR_COUNT			0x03000134
 #define HFI_PROP_LTR_MARK			0x03000135
 #define HFI_PROP_LTR_USE			0x03000136
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc..659d15166365 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -100,6 +100,15 @@ struct platform_inst_caps {
 	u32 mb_cycles_fw_vpp;
 	u32 max_frame_rate;
 	u32 max_operating_rate;
+	u32 max_slices_per_frame;
+	u32 max_slice_frame_rate;
+	u32 max_mb_slice_width;
+	u32 max_mb_slice_height;
+	u32 max_bytes_slice_width;
+	u32 max_bytes_slice_height;
+	u32 min_hevc_slice_width;
+	u32 min_avc_slice_width;
+	u32 min_slice_height;
 };
 
 enum platform_inst_fw_cap_type {
@@ -183,6 +192,9 @@ enum platform_inst_fw_cap_type {
 	LAYER3_BITRATE_HEVC,
 	LAYER4_BITRATE_HEVC,
 	LAYER5_BITRATE_HEVC,
+	SLICE_MODE,
+	SLICE_MAX_BYTES,
+	SLICE_MAX_MB,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
index 3cfecae80d1e..764acf71c72b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -17,6 +17,15 @@ static struct platform_inst_caps platform_inst_cap_qcs8300 = {
 	.mb_cycles_fw_vpp = 44156,
 	.max_frame_rate = MAXIMUM_FPS,
 	.max_operating_rate = MAXIMUM_FPS,
+	.max_slices_per_frame = 128,
+	.max_slice_frame_rate = 60,
+	.max_mb_slice_width = 4096,
+	.max_mb_slice_height = 2160,
+	.max_bytes_slice_width = 1920,
+	.max_bytes_slice_height = 1088,
+	.min_hevc_slice_width = 384,
+	.min_avc_slice_width = 192,
+	.min_slice_height = 128,
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
index 3c9dae995bb2..ef87976c2360 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
@@ -25,6 +25,15 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
 	.mb_cycles_fw_vpp = 66234,
 	.max_frame_rate = MAXIMUM_FPS,
 	.max_operating_rate = MAXIMUM_FPS,
+	.max_slices_per_frame = 128,
+	.max_slice_frame_rate = 60,
+	.max_mb_slice_width = 4096,
+	.max_mb_slice_height = 2160,
+	.max_bytes_slice_width = 1920,
+	.max_bytes_slice_height = 1088,
+	.min_hevc_slice_width = 384,
+	.min_avc_slice_width = 192,
+	.min_slice_height = 128,
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 6e06a32822bb..39720e7af889 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -44,6 +44,15 @@ static struct platform_inst_caps platform_inst_cap_vpu2 = {
 	.mb_cycles_vpp = 200,
 	.max_frame_rate = MAXIMUM_FPS,
 	.max_operating_rate = MAXIMUM_FPS,
+	.max_slices_per_frame = 128,
+	.max_slice_frame_rate = 60,
+	.max_mb_slice_width = 4096,
+	.max_mb_slice_height = 2160,
+	.max_bytes_slice_width = 1920,
+	.max_bytes_slice_height = 1088,
+	.min_hevc_slice_width = 384,
+	.min_avc_slice_width = 192,
+	.min_slice_height = 128,
 };
 
 static const struct icc_info iris_icc_info_vpu2[] = {

-- 
2.34.1

