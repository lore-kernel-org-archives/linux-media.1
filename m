Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C504486BBC
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 17:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827086; cv=none; b=S5GePKMPf0yKMxb6PGkUeQW89ff8+7lpHh6ENNtvqfCSpchU/aExi4TJj4oqJeldW+TgsNzsZL8pxs/ajO+qV/YQMl09pu058udEd1C7+kJAQMjnnQ8CsjzysGiu2bXp6iXEALbw31gKxM3+yvTu44cmXc/ychKvI7Op5OHEbBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827086; c=relaxed/simple;
	bh=0TSHSJxgodQ/VnLZXBVmwZ4Gyehegy26vFQlMpgKox4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gOx7R9CjQWx/R2h5Y9Z8/WRbFI3cfRgOSL/iVuyDcAzBc3L1/3ff5Xp/n8CS+WpONEcVkdyHGSDziMMNLfM2PZT2ALM0Dujg2t3yorE9BRR8oQlVFVJRGkTIIUJIMcYITZohEO5LRMcktTz3+mH3Ko9ECBXuokrBf08GeqJxNiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4nLuWdP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXXAUbZh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4nLuWdP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXXAUbZh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvPAl4078229
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 17:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wz/3I21jTHSBSfAdIbMCD5OVNemlIPKq5mTs9ULV/ZM=; b=X4nLuWdPn6HOmWP9
	cDnnoz1K9sUUTC5EQf/yPv0JiaTNInhNwnMPGMgL+0lz7dfPVBAUyBlOIuO4e49o
	MOgAgEOlwnPspPzvRcoPBClDJwdEW/GKaz+RUmgoNgk0EjlOVvxHI3QVYQzBsZ3f
	+9CT5t/pw8Hq/pyY/0dZAaEgpQjDK1JCSheLcljg6ckI9/smmU2MXta23wZVjXnm
	CyZt/ZjXgQn6/iGlG0la6enKaSc1NAUMFzr78i7+EUb75YBHR46MiQt1LfJxtAp4
	x/tk971h6KpvNMZr2uCVLAizsoafocqAaXns5sHIxNnZz8Zd2Erjg17IRkTUGWTj
	NCK8mw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkg5224k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 17:18:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb48f41343aso533014a12.1
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 10:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784827081; x=1785431881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wz/3I21jTHSBSfAdIbMCD5OVNemlIPKq5mTs9ULV/ZM=;
        b=MXXAUbZhj3y/MycQJEPCvisalYEn5qHcSmzRuxZN9NjgqewKgPO9Fjp/iT7d0HQdRx
         xtu5Mdvnk1FvN+uUsmtqywhSlTD60QgbByZBh/+REWFDLgFFJN7x9vHumZmrSX2d6LRN
         1L1VAg2NGUJcG+Lk03K7jiFmJgbqaBFefCUUl4Kyhp+qLNmNdpzsHRH+6opS8pItFv8Y
         cV4yUQHhUeJ5HkL3KtGEybSfGV9b19z4WPDvovCI5fyt2rtXU1oGTaKWZRtU4zjENp21
         2GedBb7FoI9x+VxtknkbL5Q0rkIXetSZN5EFsIPr3YFS7ZFQIfwqJuf86Fl+FUD7Lm/c
         e+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784827081; x=1785431881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wz/3I21jTHSBSfAdIbMCD5OVNemlIPKq5mTs9ULV/ZM=;
        b=JtWJQRd7RkTZjDP6gFmZgCZpkKnIfkfrZIWnl64b2PipmI9jvrm2pwyJwMlsWoPIpl
         9AhqDAQYtgzBIP+LUfZYrcw+qLZWcbEUGyPil3yYgOWK52N2EyvMT5TcptrhOJkGjzRJ
         nr52LFgYes2iC5ywHpbz62oQ7LOQPZGoU6266WcM1Qdadr5n8lzO1EvpHnIke5nxB3nz
         naNLUBL39rkw0ETEDnbSFsq43EmJ/ezYQrWxG6k/jdJDmqs8o2LMwiKYcyw5pBhv/pGk
         Y6CVrKLGI39IoqIu1xvPaCf+dTTGg8fMJuSqb3NEwRB99QOZHBpR2BEDKpjpFjbc3S1T
         9o9A==
X-Gm-Message-State: AOJu0YyM22NcpRZLp6LuzyJNcM3Klha+VvLaKnIO0i/dJrygaVf3Rerp
	S9ECWev5XiH83tpC5n7W+PRkOaG6DzKE2ayTx+26X6IPcvHnHLMeGEFEA953NKMHIGX+5FXloM0
	ISV8IBUQD2D9U0rNO/RKAf3psyIfc1fIOj9FtPF1kxmA0bbaix30PQZC9hkLT2KAOnA==
X-Gm-Gg: AR+sD12eBeosdqxu4ZECiZEmyJWYU9tCLjcZ5RKTu0zKQvAyTJDF+xSSeDsgJz9Tx6p
	g9eAfO2uOHXsSJ9uq2tQhpHPFvxjTi4H4yP7DOEWdzHH+6llpkILFxfcA+5Fxd82a2zr1kX9jYX
	IradePTNgETr9TUzqiDFd5BVxJSZX0gyzzUTZnEzk6Z9R0POeMY3LphNkD/9MgMqzaVJOfhxIlv
	Vp76E0N2oLjnagc1K7Jo87BjAYGfMgj4Fl1e3BTqtkPcRGSHJgsnRUjtZqNdWm36lD07RWXV5gz
	zMcD3hy1/3y7g4j3bw4FmG5soJhfhkZ413f0qLKxKD1owBYbACjBnrPqKIEzV6/j5ystPEemPK7
	eE6+Lsr6kk8P4Nw/fFi15YCH1ntDEQXccioI=
X-Received: by 2002:a05:6a20:4323:b0:3b3:a66e:3911 with SMTP id adf61e73a8af0-3c44caf0a4amr4040789637.19.1784827081118;
        Thu, 23 Jul 2026 10:18:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:4323:b0:3b3:a66e:3911 with SMTP id adf61e73a8af0-3c44caf0a4amr4040747637.19.1784827080543;
        Thu, 23 Jul 2026 10:18:00 -0700 (PDT)
Received: from [192.168.0.173] ([49.205.251.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm21718275eec.26.2026.07.23.10.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 10:18:00 -0700 (PDT)
Message-ID: <d08c96ab-f220-40d6-9491-7ddfe6ed3857@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 22:47:53 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] media: iris: add support for multi_slice in iris
 encoder
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-iris_multi_slice-v4-0-45f0a3fe7fce@oss.qualcomm.com>
 <20260723-iris_multi_slice-v4-3-45f0a3fe7fce@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260723-iris_multi_slice-v4-3-45f0a3fe7fce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DtZmPm/+ c=1 sm=1 tr=0 ts=6a624cca cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Am0+rXbGVt9FyytbsJdRwA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FkQo0lBtrm9XQ4xEfWYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2OCBTYWx0ZWRfX9KbCEkJRX7XI
 aZRu7vxzw084mvkxZWFADsrEaAQyxzIp82wQarp7R080+gG2+Fnz1zeMFw9y3RwnWbRDgHMCfge
 qwFt8hbGJVSBtMI7lZDZcdT3CzNuXsU=
X-Proofpoint-GUID: vPZGpINrJWxlY-HbbDx-8IySuEWj2rfW
X-Proofpoint-ORIG-GUID: vPZGpINrJWxlY-HbbDx-8IySuEWj2rfW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2OCBTYWx0ZWRfX4OiJKBw3PKrf
 f10a6+XxIoSCtwUXQoDnvM2IN7wjjNygpropZ1DdO3HGVZ7K0XTv3r0DoRQC5zC8dS04yC+ulOU
 OJCeL2Kb9oHmivfrnnl/sws2IGkLhJ84vFkBgVcoBwOmczQgZP1sXOVddlBY2KSHgyPpZMX0xsk
 trPTrlY2o/Ns6nP+ofHe0jk6b1dMIlq1CR+bswAYoMyhBWGpkB+lG8TykV1T3UaMD5RDyIxOIzw
 eG8mWulm5td8tlVAjLUaBPMNAUhRe2ngUDWcAY+Y/PVculX7frZgJmi1w63bJ/PezULNS0reDfX
 R+GLvMfrn5txSP47wUfXY1XHPUUJPk4XKnuKGDbWqAXX0sr/nFiYkpNnhIWfPcgsWo4W+h7Xs8f
 KZ7p8sGJuRoUYTFVbUSvOt0QIrQ5LBnTw4triiqPEJFsB78y7jV/ppeV5nXDqltJrQxQxRCgCO9
 IiLK7Cm7JPaWSbmxzkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230168


On 7/23/2026 3:51 PM, Sachin Kumar Garg wrote:
> Add multi-slice encoding support with MAX_MB and MAX_BYTES modes.
> 
> Clients can enable slice mode using V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE
> control and configure slice size via V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
> or V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES controls.
> 
> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 79 ++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 33 ++++++++-
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
>   .../platform/qcom/iris/iris_platform_common.h      | 16 +++++
>   .../media/platform/qcom/iris/iris_platform_vpu3x.c | 17 +++++
>   6 files changed, 147 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index d7cbf6c3614a..ed7ed4b89a5a 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -154,6 +154,12 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>   		return LAYER4_BITRATE_HEVC;
>   	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
>   		return LAYER5_BITRATE_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
> +		return SLICE_MODE;
> +	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES:
> +		return SLICE_MAX_BYTES;
> +	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
> +		return SLICE_MAX_MB;
>   	default:
>   		return INST_FW_CAP_MAX;
>   	}
> @@ -297,6 +303,12 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>   		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
>   	case LAYER5_BITRATE_HEVC:
>   		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
> +	case SLICE_MODE:
> +		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE;
> +	case SLICE_MAX_BYTES:
> +		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES;
> +	case SLICE_MAX_MB:
> +		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB;
>   	default:
>   		return 0;
>   	}
> @@ -1482,6 +1494,73 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
>   					     &bitrate, sizeof(u32));
>   }
>   
> +int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> +	const struct platform_inst_slice_caps *slice_caps =
> +		inst->core->iris_platform_data->slice_caps;
> +	u32 slice_mode = inst->fw_caps[SLICE_MODE].value;

..[cap_id].value;

> +	u32 bitrate = inst->fw_caps[BITRATE].value;

if used only once, can be used directly instead of a new variable.

> +	u32 rc_type = inst->hfi_rc_type;
> +	u32 fps = inst->frame_rate;
> +	u32 output_width = inst->fmt_dst->fmt.pix_mp.width;
> +	u32 output_height = inst->fmt_dst->fmt.pix_mp.height;
> +	u32 mbpf = NUM_MBS_PER_FRAME(output_height, output_width);
> +	u32 max_width, max_height, min_width, min_height;
> +	u32 max_avg_slicesize, hfi_value, hfi_id;

follow reverse christmas tree

> +
> +	if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE) {
> +		dev_dbg(inst->core->dev, "slice mode is: %u, ignore setting to fw\n", slice_mode);

we know here that the logic returned due to single slice, print it 
directly saying the same, there is no other possibility.

> +		return 0;
> +	}
> +	if (fps > slice_caps->max_slice_frame_rate ||
> +	    (rc_type != HFI_RC_OFF && rc_type != HFI_RC_CBR_CFR &&
> +	    rc_type != HFI_RC_CBR_VFR && rc_type != HFI_RC_VBR_CFR)) {
> +		dev_err(inst->core->dev, "slice unsupported, fps: %u, rc_type: %#x\n",
> +			fps, rc_type);
> +		return -EINVAL;
> +	}
> +
> +	max_width = (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
> +			slice_caps->max_mb_slice_width : slice_caps->max_bytes_slice_width;
> +	max_height = (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
> +			slice_caps->max_mb_slice_height : slice_caps->max_bytes_slice_height;
> +	min_width = (inst->codec == V4L2_PIX_FMT_HEVC) ?
> +			slice_caps->min_hevc_slice_width : slice_caps->min_avc_slice_width;
> +	min_height = slice_caps->min_slice_height;
> +
> +	if (output_width < min_width || output_height < min_height ||
> +	    output_width > max_width || output_height > max_height) {
> +		dev_err(inst->core->dev, "slice unsupported, codec: %#x wxh: [%dx%d]\n",
> +			inst->codec, output_width, output_height);
> +		return -EINVAL;
> +	}
> +
> +	if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) {
> +		hfi_value = inst->fw_caps[SLICE_MAX_MB].value;
> +		hfi_value = max(hfi_value, DIV_ROUND_UP(mbpf, slice_caps->max_slices_per_frame));
> +		if (inst->codec == V4L2_PIX_FMT_HEVC)
> +			hfi_value = (hfi_value + 3) / 4;
> +		hfi_id = inst->fw_caps[SLICE_MAX_MB].hfi_id;
> +	} else if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
> +		hfi_value = inst->fw_caps[SLICE_MAX_BYTES].value;
> +		if (rc_type != HFI_RC_OFF) {
> +			max_avg_slicesize = DIV_ROUND_UP((bitrate / fps) / 8,
> +							 slice_caps->max_slices_per_frame);
> +			hfi_value = max(hfi_value, max_avg_slicesize);
> +		}

for RC_OFF case, the value would be 512 and could lead to huge number of 
slice per frame. Could you check if thats the desired case ?

> +		hfi_id = inst->fw_caps[SLICE_MAX_BYTES].hfi_id;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &hfi_value, sizeof(u32));
> +}
> +
>   int iris_set_properties(struct iris_inst *inst, u32 plane)
>   {
>   	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 3c462ec9190b..5a73c7c49d36 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type c
>   int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>   int iris_set_properties(struct iris_inst *inst, u32 plane);
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> index acc0ed8adda1..fcbebced05c3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> @@ -12,6 +12,8 @@
>   
>   #define VIDEO_ARCH_LX 1
>   #define BITRATE_MAX				245000000
> +#define MAX_SLICE_MB_SIZE         \
> +	(((4096 + 15) >> 4) * ((2160 + 15) >> 4))
>   
>   static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>   	{
> @@ -937,7 +939,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>   		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
>   			CAP_FLAG_DYNAMIC_ALLOWED,
>   		.set = iris_set_layer_bitrate,
> -	}
> +	},
> +	{
> +		.cap_id = SLICE_MODE,
> +		.min = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE,
> +		.max = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE) |
> +					BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) |
> +					BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES),
> +		.value = V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_slice_count,
> +	},
> +	{
> +		.cap_id = SLICE_MAX_BYTES,
> +		.min = 512,
> +		.max = BITRATE_MAX >> 3,
> +		.step_or_mask = 1,
> +		.value = 512,

refer my above comment on rc_off aspect.

> +		.hfi_id = HFI_PROP_MULTI_SLICE_BYTES_COUNT,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = SLICE_MAX_MB,
> +		.min = 1,
> +		.max = MAX_SLICE_MB_SIZE,
> +		.step_or_mask = 1,
> +		.value = 1,
> +		.hfi_id = HFI_PROP_MULTI_SLICE_MB_COUNT,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
>   };
>   
>   static const u32 sm8550_vdec_input_config_params_default[] = {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 776b21cd11b2..226894b99dcc 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -71,6 +71,8 @@ enum hfi_rate_control {
>   #define HFI_PROP_MIN_QP_PACKED			0x0300012f
>   #define HFI_PROP_MAX_QP_PACKED			0x03000130
>   #define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
> +#define HFI_PROP_MULTI_SLICE_MB_COUNT		0x03000132
> +#define HFI_PROP_MULTI_SLICE_BYTES_COUNT	0x03000133
>   #define HFI_PROP_LTR_COUNT			0x03000134
>   #define HFI_PROP_LTR_MARK			0x03000135
>   #define HFI_PROP_LTR_USE			0x03000136
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index c9256f2323dc..ad9f2b20cd90 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -88,6 +88,18 @@ struct tz_cp_config {
>   	u32 cp_nonpixel_size;
>   };
>   
> +struct platform_inst_slice_caps {
> +	u32 max_slices_per_frame;
> +	u32 max_slice_frame_rate;
> +	u32 max_mb_slice_width;
> +	u32 max_mb_slice_height;
> +	u32 max_bytes_slice_width;
> +	u32 max_bytes_slice_height;
> +	u32 min_hevc_slice_width;
> +	u32 min_avc_slice_width;
> +	u32 min_slice_height;
> +};
> +
>   struct platform_inst_caps {
>   	u32 min_frame_width;
>   	u32 max_frame_width;
> @@ -183,6 +195,9 @@ enum platform_inst_fw_cap_type {
>   	LAYER3_BITRATE_HEVC,
>   	LAYER4_BITRATE_HEVC,
>   	LAYER5_BITRATE_HEVC,
> +	SLICE_MODE,
> +	SLICE_MAX_BYTES,
> +	SLICE_MAX_MB,
>   	INST_FW_CAP_MAX,
>   };
>   
> @@ -315,6 +330,7 @@ struct iris_platform_data {
>   	const u32 *inst_iris_fmts;
>   	u32 inst_iris_fmts_size;
>   	struct platform_inst_caps *inst_caps;
> +	const struct platform_inst_slice_caps *slice_caps;
>   	const struct tz_cp_config *tz_cp_config_data;
>   	u32 tz_cp_config_data_size;
>   	u32 num_vpp_pipe;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> index 2c63adbc5579..6e44bed5ebff 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> @@ -12,6 +12,18 @@
>   #include "iris_vpu_buffer.h"
>   #include "iris_vpu_common.h"
>   
> +static const struct platform_inst_slice_caps default_slice_caps_vpu3x = {
> +	.max_slices_per_frame = 128,
> +	.max_slice_frame_rate = 60,
> +	.max_mb_slice_width = 4096,
> +	.max_mb_slice_height = 2160,
> +	.max_bytes_slice_width = 1920,
> +	.max_bytes_slice_height = 1088,
> +	.min_hevc_slice_width = 384,
> +	.min_avc_slice_width = 192,
> +	.min_slice_height = 128,
> +};
> +
>   #include "iris_platform_qcs8300.h"
>   #include "iris_platform_sm8550.h"
>   #include "iris_platform_sm8650.h"
> @@ -110,6 +122,7 @@ const struct iris_platform_data qcs8300_data = {
>   	.inst_iris_fmts = iris_fmts_vpu3x_dec,
>   	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
>   	.inst_caps = &platform_inst_cap_qcs8300,
> +	.slice_caps = &default_slice_caps_vpu3x,

please keep it as slice_caps_.., drop the default keyword to keep it 
consistent with others.

>   	.tz_cp_config_data = tz_cp_config_vpu3,
>   	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>   	.num_vpp_pipe = 2,
> @@ -139,6 +152,7 @@ const struct iris_platform_data sm8550_data = {
>   	.inst_iris_fmts = iris_fmts_vpu3x_dec,
>   	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
>   	.inst_caps = &platform_inst_cap_sm8550,
> +	.slice_caps = &default_slice_caps_vpu3x,
>   	.tz_cp_config_data = tz_cp_config_vpu3,
>   	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>   	.num_vpp_pipe = 4,
> @@ -176,6 +190,7 @@ const struct iris_platform_data sm8650_data = {
>   	.inst_iris_fmts = iris_fmts_vpu3x_dec,
>   	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
>   	.inst_caps = &platform_inst_cap_sm8550,
> +	.slice_caps = &default_slice_caps_vpu3x,
>   	.tz_cp_config_data = tz_cp_config_vpu3,
>   	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>   	.num_vpp_pipe = 4,
> @@ -205,6 +220,7 @@ const struct iris_platform_data sm8750_data = {
>   	.inst_iris_fmts = iris_fmts_vpu3x_dec,
>   	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
>   	.inst_caps = &platform_inst_cap_sm8550,
> +	.slice_caps = &default_slice_caps_vpu3x,
>   	.tz_cp_config_data = tz_cp_config_vpu3,
>   	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>   	.num_vpp_pipe = 4,
> @@ -240,6 +256,7 @@ const struct iris_platform_data x1p42100_data = {
>   	.inst_iris_fmts = iris_fmts_vpu3x_dec,
>   	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
>   	.inst_caps = &platform_inst_cap_sm8550,
> +	.slice_caps = &default_slice_caps_vpu3x,
>   	.tz_cp_config_data = tz_cp_config_vpu3,
>   	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>   	.num_vpp_pipe = 1,
> 

Regards,
Vikash
