Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945E747D93E
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 09:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627648; cv=none; b=Idif/oq/SgnsfTBmroZgSSTSG920glbNKA2/Oy+Hg+6vk/whbLCkQzQrqGCXyG9qJ/NT1AVG+JnV5oiR5zwzRFOIULDhVUmSJZuS51BRSd0bIqcPP+LBg6+4Mrj+tSZWBW8YxMT6hes8cwEZRtfUjPnhZ2poRR6VHK2vNe9JALQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627648; c=relaxed/simple;
	bh=G6sXT4iZQ/SavUQVdY3CX17lFIWSmBII451V49PMX/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i/IJhqVsWvbt9uCLYxM0Jv8zrQCBcV4nRdGOo2AlRhiehtFObYZ23qGFtDQSCoc2Mc00v+0783MVANcnSpopMr9dwCs21l7tImeCMWSKLTKbYQ0NDKJhL8zZ3rbV7TQE9jkHKFFK/VhTbIPAm5wfcbHy0ROebKaPK7wUFKRDU4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmfLxN93; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KWatO+mB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmfLxN93";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KWatO+mB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L8oWIc569835
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 09:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N1NnVdi7HOKftrszVSXfsw0fOgh8RyeVc9f2xhkwLz0=; b=AmfLxN93u/XiAPis
	NNMVG3BYsHMNIBbzCizaOOGJgRmhhtnB76D4ldxFaEgyj6gwT4buhWmKxZlOFomi
	ZlaTYZyGMesIvacPIxuE+NOUTQUtdLE8IFvRQn9gC205JM9dZJsez0w4Auz4TQhK
	ZrV3xfFyULs/koEWeg4fXz1+GlG6AQmeSWWh7o9CQao64PpfsORlnyeSwKxIniiX
	eaWamX1plyRf94bR3vxMsU58dYOA/hzqqkLiyWaGR2bFuq4nN8H2QdrXiYp5qjgV
	C2GFQNEazT3ihdDOkQ9Homy7yfUDPsM9QXbviYTONkKZyJce6xhS/qDOt/KWfgsd
	/sfduQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvskwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 09:54:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so12782112a91.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784627644; x=1785232444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1NnVdi7HOKftrszVSXfsw0fOgh8RyeVc9f2xhkwLz0=;
        b=KWatO+mBB8y4FNUO1kZ3GH7wuffCQmzENg8nG7aQTKHzW5GJwJppLVeLAg2RjBnAZ9
         Nd+R6lCBdjinRgBBGKmNnUxtdPY4AkyRSvn93gSYK/rTDVzDKh4SAS0PbPeV8OZJUiyv
         Ev6zHKltR+/BDSBJ23JwX2YL2TNYrO6krXprTRGGd/EscHmjEWJib2TGabdopUQx9l0+
         qPeNWl89QR5D2qkVz5mK1G2jri6nILGWHCYbUMLL1MaOxxorVrf/DU82zno3Cl16Eknr
         omgskpkodXHaC54vRJZFrr6fsvEfMVlQWlD0HyqPLvEr7WnpHziIYj4Q4JXs0YtkxKUP
         rg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627644; x=1785232444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1NnVdi7HOKftrszVSXfsw0fOgh8RyeVc9f2xhkwLz0=;
        b=ocQWcELlSxtzLeiLdlRKmI/EjuCFZKc0MVo67YLnM7uHbEJtU3PLYbRFU0YHGr9AOi
         z97ZYV7QabJG2+q6I8pLW78atiiJQKwWikyUPkhNuYag577rIHEoqHiVJDIMBcgJiZlc
         gxBTOy1YAK58o/CCp2bdqOj89VbnSlSk6vrLhW4ADpew2FvAupbcIDEm0oxU5BhaHh29
         1q5Tqn/iy/bIUO4CMzz2hlFYz00GHaDnwq7oXxHAEYoyZhPNazx97EHuAcX+nMkliza1
         ZZoOuqiY0je/Olfshs8n+R9JO/fNvEywz7TFcGlEau9DX8GpnSbUOobfgfbZYIzsCtFO
         Vdbw==
X-Gm-Message-State: AOJu0Yx4c3p0JuKwWyw0igKW/gbyJfq2PN36x0vZN/NM77v6sM19+H20
	zOVdG98RzwXu4ixeRSKn6OIiUYspFpn6cmtzJfjTsBx0OQfNtK1AU+BaN1anuIwyvk3DbLxTLCx
	1q5vfbDv0Iv0a4p9ZiG9ZNAksVVF5AaRE0iqHVSs/ql9Tw6uVRoGKr/D4/0JJxIIHmw==
X-Gm-Gg: AR+sD11qAgkgz5SuL9gQ9q4pG9+XXf28NeLGfJJ3SMkZl4b3LoGN8ZxNM/Zunsq++g0
	Uhw+ZiRdzEbS5SvG4FEitZ+FGU/Ukh7irAxR4WDuv/xTGdGm8jQYM+NvFOMezU0nlndXNI5yWcT
	su7noycuG3UEnrbh7B4orOq2goWF43vzdZutNayZlXPD8g/Fp/6mcHQ6CXWRVarnsz8WyGXr1cN
	+EIiIc3eH9sX1kSDj3rEjvmCWwQGUwk9j9q+HST72++DCmJG4zaTvNAywB+YC7eo8cdh7XIpUPy
	oe+PS8yQsmyumRjuRI9NctmdiPEJNc934yLjlInrrefz2WedqUjX9KadhxqcchGuDwq/oX28sOd
	gVj03Y0P5u0AQtngiL0pPkD0ix/QT6mo=
X-Received: by 2002:a17:90b:1c86:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-38e4b420041mr18000756a91.4.1784627644292;
        Tue, 21 Jul 2026 02:54:04 -0700 (PDT)
X-Received: by 2002:a17:90b:1c86:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-38e4b420041mr18000732a91.4.1784627643764;
        Tue, 21 Jul 2026 02:54:03 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e92064c77sm1285462a91.1.2026.07.21.02.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:54:03 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:23:33 +0530
Subject: [PATCH v3 2/2] media: iris: add support for multi_slice in iris
 encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-iris_multi_slice-v3-2-adc61a687e7e@oss.qualcomm.com>
References: <20260721-iris_multi_slice-v3-0-adc61a687e7e@oss.qualcomm.com>
In-Reply-To: <20260721-iris_multi_slice-v3-0-adc61a687e7e@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784627632; l=11832;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=G6sXT4iZQ/SavUQVdY3CX17lFIWSmBII451V49PMX/0=;
 b=hM2EsKMqM8YzCBhpg3ldd59niOdKEy+OqNA0U3KAFfMARMhsea9TfOFny49xhlASZjbmez0c1
 zY7AA3VCMSsB8cEAuRGNL7CrbXlGURMbcRv7HwmcmodoAvfQZUxXJgH
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-ORIG-GUID: 0bAfF5GNYo21jWKSIg9P2qVExuXYHIGp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfX1lZ1hIU5NmtT
 dGlB275R3j9xh6DX+j3+65gJhwwiOBfSpZC4wVdot/QiSRX7KBxhAHoiJtB9XpIhgh+aRUr2BHZ
 PgR9avfva9C9CkbJRZIoU7Ux5tlPEMM=
X-Proofpoint-GUID: 0bAfF5GNYo21jWKSIg9P2qVExuXYHIGp
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f41bd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=57x6y-xoAtUlfagzgEwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwNCBTYWx0ZWRfX3n9xSTHp5q1s
 frAaQmXiK4JxeqEkNu4ab/+FHnLj7EBKa9fH8p1ar1r5LF3YdrlxCHl9UWkeUDwS2DcqszsFBK6
 wSgjWbCi+XtmdbQLTbdtNrNPvFfWQlPNf/P3YEo3EnXl9g8f/A94ol0cAQ+8QbhYuYouv4t6k4u
 soivCS5vKfbER+JBFmfl9X2rSflRy5Cp5wBVD8bVOS8wmYxFdfusgi18N87k4dupLy7DyHRtxZj
 09IKyedPvRHQ7knzYOBffLMe8efjWNO2kL1AG5CPe6nrHtuzg99BG9z+aiC6wmn0USYa27ZIgtF
 iatZB2ZIOsFxwF88RWOaCdilNg+WfubEPIIbrXdj+qYoCJFuzf3G4SFy2by/XoAZsr0OyXV4CG3
 2vK7aB07F4oF4w8iLJsTjmcrbKFrMCrWzv+UsSfsAao1M17ByVdjddAhkWdB/WV0nBZpjF/PWRZ
 YDyT/Hzfq9Xpl75MJUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210104

Add multi-slice encoding support with MAX_MB and MAX_BYTES modes.

Clients can enable slice mode using V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE
control and configure slice size via V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
or V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES controls.

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 82 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 33 ++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
 .../platform/qcom/iris/iris_platform_common.h      | 12 ++++
 .../platform/qcom/iris/iris_platform_qcs8300.h     |  9 +++
 .../platform/qcom/iris/iris_platform_sm8550.h      |  9 +++
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  9 +++
 8 files changed, 156 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index d7cbf6c3614a..36ccb9918921 100644
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
@@ -1482,6 +1494,76 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
 					     &bitrate, sizeof(u32));
 }
 
+int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
+	u32 slice_mode = inst->fw_caps[SLICE_MODE].value;
+	u32 bitrate = inst->fw_caps[BITRATE].value;
+	u32 rc_type = inst->hfi_rc_type;
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
+		hfi_value = max(hfi_value, DIV_ROUND_UP(mbpf, caps->max_slices_per_frame));
+		if (inst->codec == V4L2_PIX_FMT_HEVC)
+			hfi_value = (hfi_value + 3) / 4;
+		hfi_id = inst->fw_caps[SLICE_MAX_MB].hfi_id;
+	} else if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
+		hfi_value = inst->fw_caps[SLICE_MAX_BYTES].value;
+		if (rc_type != HFI_RC_OFF) {
+			max_avg_slicesize = DIV_ROUND_UP((bitrate / fps) / 8,
+							 caps->max_slices_per_frame);
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

