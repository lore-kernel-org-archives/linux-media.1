Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF50A3AD526
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 06:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785218596; cv=none; b=NAsNQKsx2p6sl56DJHyw3Gh64TyyH4fwnEQFRsCHOLsGBgfjz/7HuDzSbBhauAgR4Y3TFnSFzjqpjnFxNRKdo2AXMMqF/aY3iPokX+8myaLuCGNeNQ3J0QCaiUkwJM5Hl8S62whLlZ2vmYctZRNWmbBHcA726AhgNmn9g4MELXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785218596; c=relaxed/simple;
	bh=Fm3O5HuHwzQyH5sExD0cnmjgUVxExoIwwxGGC/5/oDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gTuEk9Wp//L3Esvo/OOUUk/eJU674bB3iv0WqPPrumbvHju27zUZoicp8kNamuLHs5Fsifq64dY0Rx0QlOcmM8j6U5+U7yKfXnVqda6phMg9uDuGoee3St1XB76dMBDPtqJLAdOkOK+EeHqKUUY/IxZRx+3+xjJT0mwwb2sVuuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SpmrJ4wN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AawLAhHq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SpmrJ4wN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AawLAhHq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3ar7n1701595
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 06:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7tcMC3qzK98+fk0H1qV4TkMT+3mqbb+YGy3VnYZQos=; b=SpmrJ4wN0aHlM8Oz
	gKRKRjEkWP0oHPnQmh4kIJhtnvF+pNoiRknMlVY4YtewxWShD0HHpo2Qz5b+OzgK
	GDiGvyWj6xJE4ONIxFqMXN6ZCh7qY2AvyRXNrGhgLIiuoITbaPK5Wjpn4Z7UHkhr
	Ue1RCcpKgx/KfgX+4i/gcq3JB/PUXfXuzS53h0kSSXl8WXRd06ZF8LBZ46oWuTnc
	RG/d4R1i/RA4xr0fU6NzVUPbGeKeKvRmDhigLwBr57lmGWtLzH9KhRbAQaFuzRmD
	h1D7wwPX5NNZxkRK1I/a3032bg9rlbVaQ0fUcT0wa7sbFxwqDkgpIfJdgOEJbETK
	waiENg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7h5p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 06:03:13 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8487eb67173so5661917b3a.2
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 23:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785218593; x=1785823393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7tcMC3qzK98+fk0H1qV4TkMT+3mqbb+YGy3VnYZQos=;
        b=AawLAhHqahZrSvzptNG3IURQo8+QHzjKMk1S7MkRwLzFkMml3d4ikZ5uPmngf7Z84q
         MZJTOq9vRix17pHoXVdQh0hxleZaUMHtkpfpYltAeS9Irqcf7z7ZNqgwn9akWjB30Ugt
         mZJU+3zhKX1CMMgkQ5k6msYB9QCYkyDM+VHTOFXBYmrwHz+YVWHxkxesV07DIH1CnJoC
         wYPIoGNeB5Ibl1MrgAGZLo6UeMQ22t5usQd0VXWs2VzZwPmdyUjQ6ypNBtuHATzekJUp
         F1+f1q7INXWnoKPUCdV6hoMT75yF7y/yiU59RxOgKoB2Zrg0VS1rnvR5m5KFYdo9J8DS
         Lq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785218593; x=1785823393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7tcMC3qzK98+fk0H1qV4TkMT+3mqbb+YGy3VnYZQos=;
        b=FBkhomVuLCyS4E6asIG/QkXEuQk5KL1MSooI0V0cq+bHgE3GPf7K5QrRYGOBJInVkF
         pRQYVyFgOGhPep8vbxlk15RXF+IVpjJHqSmxmioDqE/TzJ2MLsxHG3tpsWxUrYDcqzlA
         lCAVQSU3FSx2VRhn1xputOXCEL9VZh5GY2WqI429YST5PEWvgwmuufcCczUNeHOtyEex
         mpL8WWbqX6o3DJsKCaq9gFVsz1eBo571rHj+E4OdNpoKTfvpRXzv8WOBr+OLbcJxH7dU
         UCeKL0H4L41ZwiOUeeb4/6zRzjvt/ln5oF5uP0ez6t+QbRkrdb3g+Nb0tIq8JY/V0L+2
         xqhg==
X-Gm-Message-State: AOJu0YwvX3s2MHDJyuq2Swd5sog/5Ikn7VsQx+pCaWlK4lt06+tMyCIx
	8lojr6+V9484OACStOcbWNRIaP/fI15U2ZWScGevdrKQlujmmekiagr1tlLfaJI0oGLNM4yquyy
	GfsDbBLu5xqdE8OA/cZ/5+IaaQYgLzkBqUPnA+0v3T490HbWqHo8lRt9BtG1hVLO0hw==
X-Gm-Gg: AR+sD13ESwXDuhwNK4CXEJtBsCcFpINRxQKjJxhXMu5qTfDLQIOHZ0z1c1xsp5JBUPZ
	n8Uk4cV9R12TB7z6aZ6SW2DSP0GyMtTRLzyHnh/r0xTUxonLEnlXniuvFmCTMUBHi8XBzUfvCns
	V27nPwVS5fDWnTplp9Q1UzqKPGWLemHUgrxmvJlRD/VuMbvi6QolnSj//iMXWUeSKlxaxZWuthd
	YPKfl/N4T3yPFu3vLKCIG/ermzTWxFeni22MZD/EDhdH+fVNkg6I3+DVfymlOSzhQgAyRQdhyWO
	9nk3bsocJLP8TxbN8hhv9Cg3bimBoz9PItRFU7nkF2aIHGPvkE7dp9pojmkoxbVXOrWB7aHC36x
	VJco5Bh5L9dfufQUGY6CwpLgZJuNCHiM=
X-Received: by 2002:a05:6a00:4307:b0:848:7443:f2de with SMTP id d2e1a72fcca58-84e931fbbe0mr951575b3a.13.1785218592476;
        Mon, 27 Jul 2026 23:03:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:4307:b0:848:7443:f2de with SMTP id d2e1a72fcca58-84e931fbbe0mr951541b3a.13.1785218591952;
        Mon, 27 Jul 2026 23:03:11 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533ce57asm3980421b3a.28.2026.07.27.23.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 23:03:11 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:32:46 +0530
Subject: [PATCH v8 3/3] media: iris: add support for multi_slice in iris
 encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-iris_multi_slice-v8-3-eb18f96f0ed8@oss.qualcomm.com>
References: <20260728-iris_multi_slice-v8-0-eb18f96f0ed8@oss.qualcomm.com>
In-Reply-To: <20260728-iris_multi_slice-v8-0-eb18f96f0ed8@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785218571; l=16305;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=Fm3O5HuHwzQyH5sExD0cnmjgUVxExoIwwxGGC/5/oDw=;
 b=gimFB0MZ6Xdd3pDb4FHTXEJ2VLehG4cTu4XahXtB/Hh3bpWoc1xjGWwFkfOsnt9COI9tovtjK
 2b0lWyx0VmyDITAVTZ1IWiCGClYezPngBuUokuhDeEjuarpKo+USK1l
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA1MyBTYWx0ZWRfX0oBiy/pLdL0k
 WqNoUJdnopGIqlsrMzKabuRrSDhso+7REa+nr2dF7noI7d3QDuGAnoVTZptq0nFZiY/V+P6Jdpv
 dwnTA0J/mx2KWagJZvDE5U0msE3CPFcC5zaiAhstLmcAEIZ76Vz8QKBrJjDnOBRB/2S1sCxhu2O
 636nzjvxoPh3wvIaXeG5IRYp1feu1LsvhEW1BuAgN1MR4XiQTTGwXByIFEYiSKitL7cdi/7Cjqp
 hOeoGMcsRld9aXDbWiN8Zr7NjqMOEhp+G4n3PPDS6Z0TKTsR7z8r7VoLuvCjX7HEZFGNgQJTdHc
 v8t/Oiy4cRPLd/Su5Ubb6wgV9DwR5LvN4dTLRJHcoJhGftboE6Nb1S9M3Q1v27NeKQrEVFQkCka
 pv3QNUFU/dFFBTcf5HK4afRHf9DMF7BVrH5L4K9BIw4EFQv7RogAGYr4vrW2fSvCFwP/j2NDRt7
 fX05gbbKw2e23m+SBww==
X-Proofpoint-ORIG-GUID: ikbWQYyZ9wR1la6RLskhd0-cnQVQ3tue
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA1MyBTYWx0ZWRfX6Xe0bYRUtBbr
 JIPw2s2n3iBw+/A5a7W3OCeCwSnBEQHZcqhrqX6q+8DQ45xHCqlkWHrSAzYnjTPKwJLsQQojbzJ
 UIo7UH+Q96sgwx+VWkbFBtpbLwmVFF0=
X-Proofpoint-GUID: ikbWQYyZ9wR1la6RLskhd0-cnQVQ3tue
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a684621 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=oWDciPqWsRYBR5rPZ60A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280053

Add multi-slice encoding support with MAX_MB and MAX_BYTES modes.

Clients can enable slice mode using V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE
control and configure slice size via V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
or V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES controls.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 86 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 86 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
 .../platform/qcom/iris/iris_platform_common.h      | 18 +++++
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  1 +
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  5 ++
 .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  |  1 +
 8 files changed, 200 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 74a299f72024..fb5bdecf6fba 100644
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
@@ -1485,6 +1497,80 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
 					     &bitrate, sizeof(u32));
 }
 
+int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct platform_inst_slice_caps *slice_caps =
+		inst->core->iris_platform_data->slice_caps;
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 output_height = inst->fmt_dst->fmt.pix_mp.height;
+	u32 output_width = inst->fmt_dst->fmt.pix_mp.width;
+	u32 mbpf = NUM_MBS_PER_FRAME(output_height, output_width);
+	u32 max_width, max_height, min_width, min_height;
+	u32 slice_mode = inst->fw_caps[cap_id].value;
+	u32 max_avg_slicesize, hfi_value, hfi_id;
+	u32 rc_type = inst->hfi_rc_type;
+	u32 fps = inst->frame_rate;
+
+	if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE) {
+		dev_dbg(inst->core->dev, "slice mode is single slice, ignore setting to fw\n");
+		return 0;
+	}
+	if (fps > slice_caps->max_slice_frame_rate ||
+	    (rc_type != HFI_RC_OFF && rc_type != HFI_RC_CBR_CFR &&
+	    rc_type != HFI_RC_CBR_VFR)) {
+		dev_err(inst->core->dev, "slice unsupported, fps: %u, rc_type: %#x\n",
+			fps, rc_type);
+		return -EINVAL;
+	}
+
+	max_width = (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
+			slice_caps->max_mb_slice_width : slice_caps->max_bytes_slice_width;
+	max_height = (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
+			slice_caps->max_mb_slice_height : slice_caps->max_bytes_slice_height;
+	min_width = (inst->codec == V4L2_PIX_FMT_HEVC) ?
+			slice_caps->min_hevc_slice_width : slice_caps->min_avc_slice_width;
+	min_height = slice_caps->min_slice_height;
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
+		hfi_value = max(hfi_value, DIV_ROUND_UP(mbpf, slice_caps->max_slices_per_frame));
+		if (inst->codec == V4L2_PIX_FMT_HEVC)
+			hfi_value = (hfi_value + 3) / 4;
+		hfi_id = inst->fw_caps[SLICE_MAX_MB].hfi_id;
+	} else if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
+		hfi_value = inst->fw_caps[SLICE_MAX_BYTES].value;
+		if (rc_type != HFI_RC_OFF) {
+			max_avg_slicesize = DIV_ROUND_UP((inst->fw_caps[BITRATE].value / fps) / 8,
+							 slice_caps->max_slices_per_frame);
+		} else {
+			/*
+			 * No bitrate target exists under RC_OFF, so approximate a
+			 * worst-case frame size the same way size_bin_bitstream_enc()
+			 * does for buffer allocation, to keep the slice count bounded.
+			 */
+			max_avg_slicesize = DIV_ROUND_UP(output_width * output_height * 3,
+							 slice_caps->max_slices_per_frame);
+		}
+		hfi_value = max(hfi_value, max_avg_slicesize);
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
index f89245269e8c..ac1c1603640c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -12,6 +12,10 @@
 
 #define VIDEO_ARCH_LX 1
 #define BITRATE_MAX				245000000
+#define MAX_SLICE_MB_SIZE         \
+	(((4096 + 15) >> 4) * ((2160 + 15) >> 4))
+#define MAX_SLICE_MB_SIZE_AR50LT         \
+	(((1920 + 15) >> 4) * ((1088 + 15) >> 4))
 
 static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
@@ -937,6 +941,35 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_layer_bitrate,
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
 	}
 };
 
@@ -1669,6 +1702,35 @@ static const struct platform_inst_fw_cap inst_fw_cap_gen2_ar50lt_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_ir_period_gen2,
 	},
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
+		.max = BITRATE_MAX_AR50LT >> 3,
+		.step_or_mask = 1,
+		.value = 512,
+		.hfi_id = HFI_PROP_MULTI_SLICE_BYTES_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = SLICE_MAX_MB,
+		.min = 1,
+		.max = MAX_SLICE_MB_SIZE_AR50LT,
+		.step_or_mask = 1,
+		.value = 1,
+		.hfi_id = HFI_PROP_MULTI_SLICE_MB_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
 };
 
 static const u32 iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl[] = {
@@ -1731,3 +1793,27 @@ const struct iris_firmware_data iris_hfi_gen2_ar50lt_data = {
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
+
+const struct platform_inst_slice_caps iris_vpu2_vpu3x_slice_caps = {
+	.max_slices_per_frame = 128,
+	.max_slice_frame_rate = 60,
+	.max_mb_slice_width = 4096,
+	.max_mb_slice_height = 2160,
+	.max_bytes_slice_width = 1920,
+	.max_bytes_slice_height = 1088,
+	.min_hevc_slice_width = 384,
+	.min_avc_slice_width = 192,
+	.min_slice_height = 128,
+};
+
+const struct platform_inst_slice_caps iris_ar50lt_slice_caps = {
+	.max_slices_per_frame = 128,
+	.max_slice_frame_rate = 60,
+	.max_mb_slice_width = 1920,
+	.max_mb_slice_height = 1088,
+	.max_bytes_slice_width = 1920,
+	.max_bytes_slice_height = 1088,
+	.min_hevc_slice_width = 384,
+	.min_avc_slice_width = 192,
+	.min_slice_height = 128,
+};
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
index 5afe395cc4a0..85f66002d029 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -58,6 +58,8 @@ extern const struct iris_firmware_data iris_hfi_gen1_data;
 extern const struct iris_firmware_data iris_hfi_gen1_ar50lt_data;
 extern const struct iris_firmware_data iris_hfi_gen2_data;
 extern const struct iris_firmware_data iris_hfi_gen2_ar50lt_data;
+extern const struct platform_inst_slice_caps iris_vpu2_vpu3x_slice_caps;
+extern const struct platform_inst_slice_caps iris_ar50lt_slice_caps;
 
 extern const struct iris_platform_data qcm2290_data;
 extern const struct iris_platform_data qcs8300_data;
@@ -96,6 +98,18 @@ struct tz_cp_config {
 	u32 cp_nonpixel_size;
 };
 
+struct platform_inst_slice_caps {
+	u32 max_slices_per_frame;
+	u32 max_slice_frame_rate;
+	u32 max_mb_slice_width;
+	u32 max_mb_slice_height;
+	u32 max_bytes_slice_width;
+	u32 max_bytes_slice_height;
+	u32 min_hevc_slice_width;
+	u32 min_avc_slice_width;
+	u32 min_slice_height;
+};
+
 struct platform_inst_caps {
 	u32 min_frame_width;
 	u32 max_frame_width;
@@ -191,6 +205,9 @@ enum platform_inst_fw_cap_type {
 	LAYER3_BITRATE_HEVC,
 	LAYER4_BITRATE_HEVC,
 	LAYER5_BITRATE_HEVC,
+	SLICE_MODE,
+	SLICE_MAX_BYTES,
+	SLICE_MAX_MB,
 	INST_FW_CAP_MAX,
 };
 
@@ -319,6 +336,7 @@ struct iris_platform_data {
 	const u32 *inst_iris_fmts;
 	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
+	const struct platform_inst_slice_caps *slice_caps;
 	const struct tz_cp_config *tz_cp_config_data;
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index e194f67a6f48..907bda8a9a75 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -92,6 +92,7 @@ const struct iris_platform_data sc7280_data = {
 	.inst_iris_fmts = iris_fmts_vpu2_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
 	.inst_caps = &platform_inst_cap_vpu2,
+	.slice_caps = &iris_vpu2_vpu3x_slice_caps,
 	.tz_cp_config_data = tz_cp_config_vpu2,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 1,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index b8099d7ce556..e963cb116313 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -112,6 +112,7 @@ const struct iris_platform_data qcs8300_data = {
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_qcs8300,
+	.slice_caps = &iris_vpu2_vpu3x_slice_caps,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
@@ -143,6 +144,7 @@ const struct iris_platform_data sm8550_data = {
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
+	.slice_caps = &iris_vpu2_vpu3x_slice_caps,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
@@ -182,6 +184,7 @@ const struct iris_platform_data sm8650_data = {
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
+	.slice_caps = &iris_vpu2_vpu3x_slice_caps,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
@@ -213,6 +216,7 @@ const struct iris_platform_data sm8750_data = {
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
+	.slice_caps = &iris_vpu2_vpu3x_slice_caps,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
@@ -250,6 +254,7 @@ const struct iris_platform_data x1p42100_data = {
 	.inst_iris_fmts = iris_fmts_vpu3x_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
+	.slice_caps = &iris_vpu2_vpu3x_slice_caps,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 1,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
index 99c839a0424f..43460b82ae77 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
@@ -103,6 +103,7 @@ const struct iris_platform_data qcm2290_data = {
 	.inst_iris_fmts = iris_fmts_ar50lt_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_ar50lt_dec),
 	.inst_caps = &platform_inst_cap_ar50lt,
+	.slice_caps = &iris_ar50lt_slice_caps,
 	.tz_cp_config_data = tz_cp_config_ar50lt,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_ar50lt),
 	.num_vpp_pipe = 1,

-- 
2.34.1

