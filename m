Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6886335F193
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 02:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784775372; cv=none; b=Dv9tuYsMwvh1WBoRFNmcN4GtMLx8gOYzs6lbT/cLht9hCmzNNtKYI6uCn/e8ZEv9pQ4aR7BUWZGi74yL/MY2YWAIwJRVnNNK9PKKwqRRsJ09i0Gpm9XfHnewrfGM+1vAPn6u9DdGY79yCmKai4zGZUbFH8I0vbqmU5RwgpF7Fao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784775372; c=relaxed/simple;
	bh=F+KjZjjv+vWvwxn2/kew75cfGij7SIQwdJE8zTVTY+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PnzY2qQH0n9nuaZqPEiiEiwQ/VpmV5pcNyw6lx24AT3TXuGEju0AdbbWKcHfAFZ/cntPs/O2a5xsyO3TXAWw+MZpjQadYrVu3MMcdYBvTi8iGFSnP3Dqvq+VF+fGbd80WWOIQZPUn1DMM/hfDL2NIfcaUnSGPmEI3wionuqZlao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0uPGdkn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FCLK1+kL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y0uPGdkn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FCLK1+kL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0WhdQ3534809
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 02:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EDbNkN0pMOKy1BFdbFnzZEOFtaTprwX2uD+E7MXne74=; b=Y0uPGdknQKPKUTIN
	t3F/xVwjvrkDjhK0PIWMxe+rZni+2dZxDn9TVOtS0/IYNZPtlvG0IWuCiBPgu7zC
	MUVNxtAINdJ/EF7qnOoNfYHLpc2cbU85dECV8BE9EE5fZviGn7lBV05YvX/nk1gO
	7ULTE1WY7CXXZsm3LxE2xFOyDyF1+9HwlxWcmevTbeWGoE4NdfO7i7yVs+Vjy/FP
	67efxZFiEbLQn5rvnHhnOUJFU8ZmIzCzwX/PA096lbCE/9ny1dqV5SH/DN5YJjy8
	IYfGKP4ZsroiWGzGkjO7zgnl2T7cegfuCvjxSqPljSGWwBGgB98LaxmN8rlfFjDe
	YsRJUQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xswmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 02:56:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e0234967aso168585b3a.3
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 19:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784775369; x=1785380169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EDbNkN0pMOKy1BFdbFnzZEOFtaTprwX2uD+E7MXne74=;
        b=FCLK1+kLgQutaY7zYarU9DaNcFfGXcLp7Z6QclPqW38ZNaQSIwLmGA1T0TmnjUxe33
         jlo3pIevqqgYxShmwDCbUesRJSrr3+FhOfqnbtijXwQDcdM6cGVe8Bx62t36uf6Na39t
         e5i/QgwvH7Fh1Z9vctOfmSIcTO0hGz+JvBLUk9T/P/OgoHe6fTzs8npKVBNa4mg7C9AG
         xLai+B6MSRNCblQQNfLMcYTC/OEqzGHX4YCDG9KZLcfwZiYR9IRutbcBDvadoxhNEntY
         EBaQXr0mQJm5sT4UiVbmoVNFNq5bFYMhGm6e54bWZEIFFXrJA/aRSxtJi2IammMQW8jj
         S4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784775369; x=1785380169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EDbNkN0pMOKy1BFdbFnzZEOFtaTprwX2uD+E7MXne74=;
        b=mPa7eCHA8S86XB+PnEt4uUmwCvjCBlxCut/8jkkZ2xqCo2FnEFKAnKLX+x3FYpZJGp
         9QYMtDM6Op92LtK1bFAG5DJOQQbzfuX7LL5GxqIAtRA15GB0X+MwlO5lA22fU2GzkBiN
         5rY4N0v9MPbvUxIzp5SCKTiQOm5vfWupGXZHByHRegS3xlBmQ3UoaHzhtR6bEzHEx5/n
         iHYinaC2lgRGxth3VNCDDlEDWVciSes2zS2aC3IJRo+0t6a4FU4R3vVGivdgmOW718z1
         YaZ6mw6SeLa+vF+XCXVLBYxNjsqWJJ82BacpxHI5+1iTnpuezBGg8tdJFbrQoTjzY0wv
         iXVw==
X-Forwarded-Encrypted: i=1; AHgh+Rq5WA64h5g9TCqs1C4GPCGoy/WC8XRTaIcsELYAdXKu6nILos+5VHfEYTs2VBJ2Hv6CjkG+qUkPKUhn+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWnRE+A4TZ6uesoKGLOUd5S0azzcuByMTq+7r2iqXGoJL5ZxIq
	QDD3BAli4B9boMcaC4Omx2qJX5hVb+sh+H83bbRC3U8n2MHvU8LBlotsLOrZLEHvMmpVHIDUUX8
	U7+gwYg0MvTWpLsTq5Kd/M+OkKs4BAvT/KmunKPTPoY2e7rsWS0mYp5ubWwR61tesYA==
X-Gm-Gg: AR+sD10rjBHsSlJUU2A2Dqpa+UcEgbdvoQSA7RU/GBNzwsL+hmHKgJbyyJuIJ6+tTbQ
	b8Tq9zMEz3B3YcNoWSLPW2VikuvUTw8WJE8ySPtycqwiHu+hz0XVS6hqlgYqtKF9Y3URfa2uujC
	lXK8Ls5q8IipNO8fgqaf3Dq8DT4nVCSmUAIBBz/4hha0ZaDmXgTdQdJIxOc29Dq00R4ZkKhw3Zq
	fxxT6UkZdmPSrL9ksNokIUCDJ1ZOMNhj0NgEOSMDOCalPcP0dJqSLrpqmQT7yNjaABphtu9ieI+
	nO98hdSv7G7k4vW8dWkVSuVRsulzM7TeulrDe7u71vc4YKYxhgnGH7fI0z0NURW135nV0L6HTs8
	Ee0fUqtdCG6TXHu/cWphjT+ya3t+OdTfLbYO9iPZw01QqeXs3iKvO186Bs2P+nt+vbivqv6+bUu
	g=
X-Received: by 2002:a05:6a00:3c8b:b0:84e:216d:7e4e with SMTP id d2e1a72fcca58-84e2b7fc212mr1525268b3a.1.1784775368630;
        Wed, 22 Jul 2026 19:56:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c8b:b0:84e:216d:7e4e with SMTP id d2e1a72fcca58-84e2b7fc212mr1525235b3a.1.1784775368146;
        Wed, 22 Jul 2026 19:56:08 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17262e33sm2233312b3a.14.2026.07.22.19.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 19:56:07 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:55:55 +0800
Subject: [PATCH v4 2/2] media: qcom: iris: Add request key frame support
 for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dynamic_encode-v4-2-5fd6bd549ead@oss.qualcomm.com>
References: <20260723-dynamic_encode-v4-0-5fd6bd549ead@oss.qualcomm.com>
In-Reply-To: <20260723-dynamic_encode-v4-0-5fd6bd549ead@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784775356; l=8205;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=F+KjZjjv+vWvwxn2/kew75cfGij7SIQwdJE8zTVTY+A=;
 b=u8LXVU0tZJzkD3TDrPlSPJSiKBcDQIDmqdjt8udyc25zVm1A9SwotNFKey462guVH/qwJfivg
 ZIq4FMKhHEKDW2zhi1NJXdmcWfkzr8HNPyodLSABWIdVP12U/7dJjYq
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: hDiuFgSVzSTWEvHU3-CEwtaHGNcXbz86
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAyNyBTYWx0ZWRfX6wQE4s5Wb92Y
 aW2mWSZQ3/9k3s36HE87uxGujvqO76gVM1F4IffnALOIO+/fWVtxH7Uuxz44FNKst9VBsy+tDfv
 HVAejIJaK2DzsVh2sTLnSPmSury3Ijk=
X-Proofpoint-GUID: hDiuFgSVzSTWEvHU3-CEwtaHGNcXbz86
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAyNyBTYWx0ZWRfX9AkjIKNMlIqM
 uL/g/w/bosx/KMSy6v1ChJG1XFSkLkOU5AdXGDRWlIL/LXv9mgFsmubSex4p/NrX95eKC4LZBbC
 hTnNGg5FR4swulu5Z3mbnGueq1HBwY0d0T9FUBiqiN7Yull9XUNkpCzOnaIEf9vj8szVzUUl5yt
 mjKZODhP1rVXGCa6FUxFL+cLWwahzdcQBgFIh+lg/zeHNfilbEakZSTql7ViD8i64Hv3ZdC8ixF
 w50UMlFMwyl2QZJJYessrMTqpBcZMNu5mXPTPeV5SB3N0Q+YNxbqfiHSmZGzuTxczy7PtYghEmp
 /Js5O2EsB0oleDIZ5LkQuT2nq1/pGcU1YYAP/6fbgrbebXrkvX7j4Iu49wPAZ5ZuFc9JjU+JM+2
 Gdi+dB77WYMp5BGMb4AR3L2E2rxXTYz8DjOdm3no1n70DG5dDA3Ri+Z1wA+4ExsL1E2RT2jSEDD
 TIfcpm9b8hbULHvxzhA==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a6182c9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=J9qvyUYpVtujyueP22MA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230027

Add request key frame support for both gen1 and gen2 encoders by enabling

V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 10 ++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  3 +++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 +++++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  7 +++++++
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 8 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 391e1fc5f6e2ec8e9cf5ba4e0f76b2d1da3e2a35..2918a7df0b403a886648e90ec00968f51c4660a0 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -154,6 +154,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return LAYER4_BITRATE_HEVC;
 	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
 		return LAYER5_BITRATE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
+		return REQUEST_SYNC_FRAME;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -297,6 +299,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
 	case LAYER5_BITRATE_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
+	case REQUEST_SYNC_FRAME:
+		return V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME;
 	default:
 		return 0;
 	}
@@ -1477,6 +1481,24 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
 					     &bitrate, sizeof(u32));
 }
 
+int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 hfi_val = 0;
+
+	if (inst->fw_caps[PREPEND_SPSPPS_TO_IDR].value)
+		hfi_val = HFI_SYNC_FRAME_REQUEST_WITH_PREFIX_SEQ_HDR;
+	else
+		hfi_val = HFI_SYNC_FRAME_REQUEST_WITHOUT_SEQ_HDR;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32_ENUM,
+					     &hfi_val, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 3c462ec9190be8935176b290588f224fe4f144a4..8d8bbef960076c08e5af0f65920dde187f24a313 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type c
 int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index eff9216bb50143c0d752051a6400605bbaf3803e..0f7e7d6b25f41eb8a67a9a8f01dce20ea54dc335 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -375,6 +375,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_bitrate_gen1,
 	},
+	{
+		.cap_id = REQUEST_SYNC_FRAME,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_req_sync_frame,
+	},
 };
 
 static const u32 sm8250_vdec_input_config_param_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 7674b47ad6c49adfaf16b444c8ec7295b230a529..d7fd867cf6c98523123e9205fcfe4b469708da72 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -741,6 +741,9 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32);
 		break;
 	}
+	case HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME: {
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 0e4dee19238464a9671a94eaab8eeda2d7f7ca9f..275f3fea3d2aabe26a2a0498c78c09ec28765b24 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -157,6 +157,7 @@
 #define HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER	0x2005026
 #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
 #define HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD			0x2006003
+#define HFI_PROPERTY_CONFIG_VENC_REQUEST_SYNC_FRAME		0x2006004
 #define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
 #define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
 #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index acc0ed8adda1ae726c94ab6346b0b4b2b3db1d7b..7d6fde36f0e9036145e45b84054b439536b25e50 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -937,7 +937,17 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_layer_bitrate,
-	}
+	},
+	{
+		.cap_id = REQUEST_SYNC_FRAME,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_REQUEST_SYNC_FRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_req_sync_frame,
+	},
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 776b21cd11b2cd5555cbced8e438cb32e87a539c..a8b47e4ceba0fc868125f841a5635476571aab85 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -90,6 +90,13 @@ enum hfi_layer_encoding_type {
 #define HFI_PROP_BITRATE_LAYER4			0x0300013f
 #define HFI_PROP_BITRATE_LAYER5			0x03000140
 #define HFI_PROP_BITRATE_LAYER6			0x03000141
+
+enum hfi_syncframe_request_mode {
+	HFI_SYNC_FRAME_REQUEST_WITHOUT_SEQ_HDR		= 0x00000001,
+	HFI_SYNC_FRAME_REQUEST_WITH_PREFIX_SEQ_HDR	= 0x00000002,
+};
+
+#define HFI_PROP_REQUEST_SYNC_FRAME		0x03000145
 #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
 #define HFI_PROP_MAX_B_FRAMES			0x03000147
 #define HFI_PROP_QUALITY_MODE			0x03000148
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index ff48333ad089894c3393e8ad45903c2603288eb9..23b6e7676d05bd01725f8e2cfca47b06ef112c27 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -182,6 +182,7 @@ enum platform_inst_fw_cap_type {
 	LAYER3_BITRATE_HEVC,
 	LAYER4_BITRATE_HEVC,
 	LAYER5_BITRATE_HEVC,
+	REQUEST_SYNC_FRAME,
 	INST_FW_CAP_MAX,
 };
 

-- 
2.43.0

