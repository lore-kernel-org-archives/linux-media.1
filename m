Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CD344163B
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 14:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423354; cv=none; b=FdS4X1T9tWV2kpO5BZOBCOAbCW6KlPY8RSEkrgovofs46VHOldW2BmmsyuQ9Js7ESPMQV7Co35IVhLGRR8DuQyA22MVxfaDDRB80SGizZjujw30iYOAfhzMrIiYF0CUw6SibTbx/KRx0SzDdMpB4qFjpemgNEOBqGs6Cp1gxOEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423354; c=relaxed/simple;
	bh=Dbiyy2QTVpgmROguJdk+dB7JRPNnWIHf8ZG60rFO7CI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F5f3+qLy+68c7nlS8RuelOsTFxRFmwkArPGgRUXx/SMcUUr/x8n4+7Zw8P1nxHJrl5WgS3KMQNA9it4Co0cpBvPj8CX8xbmc4pzBLPim0pXjGO6Bvd5Q6DPBbLU5wScvtQ0YhM7ULA+/oA+zQfZh84GLegg8I8c6mrkK1dLGUP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggJpwiDi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vn0tUyeV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggJpwiDi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vn0tUyeV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEelt11036262
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 14:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g6xHoKwh9v/UMdyi/AhdHr3bXm+Uphrf3HJ6/OV3E5k=; b=ggJpwiDibJ4itVfR
	tjFlOjY+ngb9yh4J2PylbyOF3yDMFCG52/JxsSMwQK2KZeq9RpHO+9GXr3UiklUK
	S19/hqBBtSiJkexkZZ1x5b+LnbszOo9qIxnci1jjlK3aSmaf52Wy79/kBk4dEOA7
	nEdehpPdt9YijA9ILa6JhOgv4JPttyJ0NoHX/jl/Rl6mylyMmAhTW4oyayDVmAqv
	0P+/qsZy5vKGJObk/hgX+FmL9dQCiy0PKuwMzrc6qCsyYej3HouXqQxsnUDQie/o
	FY4Xp2oLpS6xt7FWA0y7L8eJqS3x/zJ34F5ZH73zTW2f006m+QEBKdPPga/grqkG
	ZVkP1g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8k602va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 14:55:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso165453a91.3
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 07:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785423351; x=1786028151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6xHoKwh9v/UMdyi/AhdHr3bXm+Uphrf3HJ6/OV3E5k=;
        b=Vn0tUyeV3XjO+TseDmN5PYHNR33ly54LNvPEeyvlAyPu40SZS9mR5OOJxNhfZqkvLj
         TW6P4SGJjMPK+iTWdtTKuTWFXIknrhygIXq++myDAZCzMldc5ls4VvBdo1ulqRpJOeUz
         fLvZhjyjEPjibZ65jy2RMuyuN67v7gYUEEYP0Ucmd5GIgmEdj7sbQADRPQGMMlNkGDTb
         NaQc0GTeT/xOQ5r0aOfgrmWSkRStYAMDswBA2tgY45lgOI2w+aWUBqsUt7VKtFZyTtCS
         gyOTZpC7rMSQcslZ11oQxkNw5UqVA1eh0nLpqTph5x23CO46moLu/DF/Vrw2zbAnAZjs
         lYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785423351; x=1786028151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6xHoKwh9v/UMdyi/AhdHr3bXm+Uphrf3HJ6/OV3E5k=;
        b=oNtUZbhS1HNyFBPrgPJsNiI7oPKI6/sE72+IQkjUwFxexpq7VLuooiIex97y5FqDY9
         lmcFAhEFsY3T/Xp0RQLbASYzIMelvkU7WaQnpvNvO2ahsky8QNChnBO0t5HrNvVwKRt0
         enIoFQDBn3ALp50wzRr7gmvdnA0zrye7Lzlq5dAC3ISi2tmZX2yBLzEKwKHDYveVqD7I
         9UYmPJkx9qSmDpLnxGvVnuVJTgeIeAbEjvRmAHzkLKv3jv2vTQDJfzIm1gJCTvGunL27
         /PkT9zqPXZ8MKzwZm7l+QOX1phfdgo93HRvVCbE+z0tmUa4JrKy//3WdWbjG1CHoKhVt
         OWHg==
X-Gm-Message-State: AOJu0YwoijAa00ZhvDgd9AyZ4+cvToYxa/ZZe0+iPiZLZ3TkEoLXsZ16
	OtjBiiwPnBbta8TtTPsfsn3g0iYD2ha+p70tfEjad5KXuOPagyBGe85U8jnYO3FJ5Rk+z6v7F3x
	i03NiWdNfdqigd+EaMAmPvBAGJW60H81tLK8B0ZzE1uPLhtGY4pajj5nBh7T8RkO/aQ==
X-Gm-Gg: AR+sD11tN6SFGkkhro9hTyVB92Md3yzbcM5cmlW+rKL+RdQ6Eg5ii1VkUaBBgAjveHK
	6FtpDdsHms794OFtE4eYjpHAI2kimFtcRIUcJGvzxnlrzCqyC9fFQGBruphVHO0mnAXuzK1+l0q
	nspEQhSXh6664qB8xJQHVGpjxKqr7xWIYYAJXjmvE6G4W+efVlyO2D29ef/dq5wc9Om77LIVmKy
	Z+sgms/UE9UWK+AaAspESw5VYqZKqpCkiOFbKBR+f9uZIdWRGCFlsn/ZsX6HTt+Zu2Ddz9BQ9nB
	jm2TZNqC89P3Iw2DwFbfzDS3BG8+Gl8wGcoBsJhY0+ixsZ6x3yf6jvKjdh5Ke//KAuaQOL5tkQp
	ddXLjj0rUVSwgNCnZniN9SPKYsuUm/m0=
X-Received: by 2002:a17:90b:510f:b0:38e:dc4:3fbb with SMTP id 98e67ed59e1d1-38fa7f9b10cmr359400a91.43.1785423350558;
        Thu, 30 Jul 2026 07:55:50 -0700 (PDT)
X-Received: by 2002:a17:90b:510f:b0:38e:dc4:3fbb with SMTP id 98e67ed59e1d1-38fa7f9b10cmr359339a91.43.1785423349832;
        Thu, 30 Jul 2026 07:55:49 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b7ace53sm1236775a91.17.2026.07.30.07.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:55:49 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 20:25:27 +0530
Subject: [PATCH 2/2] media: iris: add support for vbv delay
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris_vbv_delay-v1-2-7b5a7953bcdf@oss.qualcomm.com>
References: <20260730-iris_vbv_delay-v1-0-7b5a7953bcdf@oss.qualcomm.com>
In-Reply-To: <20260730-iris_vbv_delay-v1-0-7b5a7953bcdf@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785423339; l=5976;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=Dbiyy2QTVpgmROguJdk+dB7JRPNnWIHf8ZG60rFO7CI=;
 b=J0xyrKrsDMPTbJ0FwJoRbTX9TagRmk1KSmDs5kQ8XSRzc+ji6C8IwsO3O+CrvL16mdmnCMg9F
 293fmsrjQusCgLQx7oUJdt7OJY5etdR1YtNTmhbuwONXQZEBBnRlj96
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-GUID: iMzr58k70cfGkujUYSQb9D7WNwQT52co
X-Proofpoint-ORIG-GUID: iMzr58k70cfGkujUYSQb9D7WNwQT52co
X-Authority-Analysis: v=2.4 cv=Wqgb99fv c=1 sm=1 tr=0 ts=6a6b65f7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_KnjXlf9qKQHtKUprocA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExMyBTYWx0ZWRfX0cLCZm/BAETU
 1ZfzfrbS0UUb+1rzl/Qm+0S9PjXL+OdVnXEHj6lo2GCHQ0+7mNjoBSlK7WutPb8D+uhz26xWvgY
 CVjETAOXfK40Cy5P7UDkbl0EBo88R0dmhw7YfBL+W74x/R5Dt0wiee+RRbIqJehp03Gd/mbzpY8
 VOFvvh6mz72/DMu8k3WbWP+Ni3AvOPMHCsvANoBlGbawP4rTiA+IazE9x7IcotthB8ogz9OIpTn
 HJP8ZsENqowdlp80yRyM4MmnRIJcQPXjpxIcnYLYoltOOg+OFgMcVw7IRLyZgh/OOUrS2gkHB0L
 4mCsO+nMw6wP0ZdWLkuU+h8HfFasePFzMhHvPtu8sBgW6pBeB6ezisGjQY3JYChiRkUGAZA7wb1
 Q4ig5cCjqrTVoyJHcnBv2uYkpwyoFoKvb9lJIamgZJK2u6qiTk6cUWLvbgRkSu+l/RLrCAfgmGp
 g2oQqH0MR94vcciefhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExMyBTYWx0ZWRfX1dIanKzRBS47
 s7zKF3Sma18qbqHxVhf1bVWzHHoE/ykisP3rh8dPQKue5OiEzN9UUNtyK23TvN54BlPbv63Yiu9
 99knuCekyR9pEAUorwF90BeszQbqK0o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300113

Add the VBV_DELAY instance capability for the HFI Gen2 encoder,
exposed to userspace via V4L2_CID_MPEG_VIDEO_VBV_DELAY and mapped to
HFI_PROP_VBV_DELAY through a new iris_set_vbv_delay(). The property
is only meaningful for CBR rate-control modes.

Low VBV delay values (34-100 ms) require the encoder to run
with a single video pipe, so extend iris_set_pipe() to force
work_route to 1 whenever the configured VBV_DELAY falls in that
range.

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 31 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 ++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 5 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 33114d80aa68..0ad873f3be78 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -154,6 +154,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return LAYER4_BITRATE_HEVC;
 	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
 		return LAYER5_BITRATE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_VBV_DELAY:
+		return VBV_DELAY;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -297,6 +299,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
 	case LAYER5_BITRATE_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
+	case VBV_DELAY:
+		return V4L2_CID_MPEG_VIDEO_VBV_DELAY;
 	default:
 		return 0;
 	}
@@ -544,6 +548,11 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 	u32 work_route = inst->fw_caps[PIPE].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
+	if (inst->domain == ENCODER) {
+		if (inst->fw_caps[VBV_DELAY].value > 34 && inst->fw_caps[VBV_DELAY].value < 100)
+			work_route = 1;
+	}
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),
@@ -1487,6 +1496,28 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
 					     &bitrate, sizeof(u32));
 }
 
+int iris_set_vbv_delay(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 rc_type = inst->hfi_rc_type;
+	u32 hfi_val;
+
+	if (rc_type != HFI_RC_CBR_VFR &&
+	    rc_type != HFI_RC_CBR_CFR) {
+		dev_err(inst->core->dev, "vbv_delay unsupported, rc_type: %#x\n", rc_type);
+		return -EINVAL;
+	}
+
+	hfi_val = inst->fw_caps[cap_id].value;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &hfi_val, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 3c462ec9190b..16939e31c784 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type c
 int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_vbv_delay(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 45a418fde7e9..716947f256f1 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -944,7 +944,17 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_layer_bitrate,
-	}
+	},
+	{
+		.cap_id = VBV_DELAY,
+		.min = 34,
+		.max = 300,
+		.step_or_mask = 1,
+		.value = 300,
+		.hfi_id = HFI_PROP_VBV_DELAY,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_vbv_delay,
+	},
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 776b21cd11b2..19d04981cdb9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -127,6 +127,7 @@ enum hfi_flip {
 #define HFI_PROP_BUFFER_MARK			0x0300016c
 #define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
 #define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
+#define HFI_PROP_VBV_DELAY			0x03000176
 #define HFI_PROP_RAW_RESOLUTION		0x03000178
 #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
 #define HFI_PROP_AV1_FILM_GRAIN_PRESENT	0x03000180
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc..a533740ced7c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -183,6 +183,7 @@ enum platform_inst_fw_cap_type {
 	LAYER3_BITRATE_HEVC,
 	LAYER4_BITRATE_HEVC,
 	LAYER5_BITRATE_HEVC,
+	VBV_DELAY,
 	INST_FW_CAP_MAX,
 };
 

-- 
2.34.1

