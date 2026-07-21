Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DB6353A63
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784606949; cv=none; b=C1Vl6VtnqQ+XsFiYFefKUGc7+GIvCHXvEvPln9ltxEMC8rJmWZvw0zJNm9z9BTQTOdpOt/7ksM5SGYvm5GV7fa52UVeTqXLC48Kl0cj6Am7eaD6fm5i+CjzhycbQ+ji8MTz3DN6KoMyqNlbPx8JlFtpicgZ0TLSmzDMvdVV+rO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784606949; c=relaxed/simple;
	bh=Iu2rakKSBk9TcyKuoweKhmK3jzEGPUywuXTOSMYoNg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fPoY7aSncu4gWZdy1vkDYq7VcW5ZJyJRy0rlo8NAzJRbRgJjnDShgsRoeovZmeuaUju0qGlFwp55RKtHVfXGnTWezNqIqCjq33gJdYoAMcNRYSOIIpApRpwIUCzkVhs570wly5tTMFq1EC2DKG5bAaE0rk8VjwJhTRlPbmppkms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=au3LWNFk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aRgahDRi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="au3LWNFk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aRgahDRi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L2nDEo043308
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tlmab9/uNugRhK0WR5f4khFpLoOXKyTz+DbhMgHdtQQ=; b=au3LWNFkcjfl6eSO
	H0QvP/enCbzTUBhcqLlT56SQi1ZuEQ4Z/ii/GwcX0EgEgTA4EYsDyQVoOnkvbt5c
	zQIm0bR5ozS6DBlumUdI6P/gpbp95EeEJ9C1s10Xk6kmnlwZwHRQcNGHjV8gWTIV
	D93UZ4EHWI1UcNoGSyN3AE4/GnphRd0H138UmqE4XLHlm5bsuz3XMoMyjdhpQUVU
	88a5gywHBBinQAQuexhkf2BTFmrWf48ZWM9QW6oAj1fh94Z4+ya+EsSs/ALiDcEF
	S8SQCYK1xReAp9IQOO+kMasBAA6WIzoS0EZ8Q4tEj6HvJyWy58BP/s6fBECJchNe
	c+gQRQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as0968-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:09:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e6f71683bso3737496a91.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 21:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784606946; x=1785211746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tlmab9/uNugRhK0WR5f4khFpLoOXKyTz+DbhMgHdtQQ=;
        b=aRgahDRikTZL+WTXOUHonAHsWyD/+ClimB3ru5XiL1ia81O06dEq/alVAnrYNraQ5j
         nCbU6MD/M4xNx+GOQzk7egGwxVvLc5o2Mtto6gASNwRI9A48EqewD0txjar1thBsagMX
         OHS5eXqx5uQgfP4TYFVi8ZkQd77fRWi5Xta6fSSfkcrevjSfhHGExXgMomqwfqdglyoq
         a2ySvrL4f2MKAWaUBWIH2Z5JOqJKrj+srXmxlLYgdasuAqekEvsUaiXF/W0Ac/1AALqm
         tzxOrP1Rog0asQtV1o8iTU/kFzlanXXZmQaYkWP8hBp4X5dUvqUAIS69MR6AX92QaI0j
         VNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784606946; x=1785211746;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tlmab9/uNugRhK0WR5f4khFpLoOXKyTz+DbhMgHdtQQ=;
        b=TZJWZDHwpuBCXZL9zLQpb2jOWIbaa5+b9ZFguV4gW2/ozltdCGZ1u75BA/cKRVOGdF
         wODnWELWDX2Ljy3iI2ctmnaa9zw/T5ade7odx5+QC3rnfmRNAMLLg+kU8vuVkGyOiQYw
         2kXAxYXzPu0ooVSjXlJZ70l/8G47VKqasOG2wuWr3u3rnCjfI0MkoiwDOyPTM+ycpXFO
         zmGBslcl6hTHbeqDf5QCsyNXkX+gX+9vd2ZjVKap36qAJ2H4J+uMKE0afvhgVKcN/03a
         ihDLakXIwoF/A/49YYT95tJSs+Fd/mBd2ct4IKaafgGplX9nIDMSOTu8hO1kek5nCArx
         sk7g==
X-Gm-Message-State: AOJu0YwSzJFMIYaH+zMbz0zDr0B+CRY+DE3O18oNgQtnAE1AQmccZh4t
	aQiqpr7vZT3t4kDXa/lqfdbRTAyJlCRx5GsOIuMZrVbsImV+JjpnSh2CzPcUazHgTW6IW7hjG1w
	T0vnhBGV8nUsZL/W2X4Pmtmo7UH3HhIL9V2sjYhWjd5Dkv/o7o0fqRNlSn18+fAEA0w==
X-Gm-Gg: AR+sD11MVZNZHyLWqc8LRA2aHM0kT7/FlFdLrAddGH2oryi0nYe6nVEiuQsMczncZJc
	8CmVY1QpBOElwLvgTEpuAAv+TJumTSUhlor3dHx4uUxS3KpKTHk1y08TUR8mMfmL/QuWzrEd1Vu
	utU25ijD3RN163emztI0dWMBGHt6gyBLrTpIF/DdbLytUt6+QDs+zaFJmpKPDguKRulHtvslrqo
	K9wQAVXNWGIztnRzS/kLXAosD/PQc3nTTn2Wq3xWgnqtvgKAqWA09UWDRrwJyyeURwpqiILlTgB
	2zq346FgNgwq7tM2AepVOhDuknA06GSnT5ae1i6eMIoQU1c4vpOAdI6SqaZKlKX5WKrzjDf35VJ
	gAnhd6KShdxnddVaGtRzqpN8mAgxDZVEs
X-Received: by 2002:a17:90b:1b43:b0:38d:eb10:6f01 with SMTP id 98e67ed59e1d1-38e4b422875mr17195670a91.4.1784606945564;
        Mon, 20 Jul 2026 21:09:05 -0700 (PDT)
X-Received: by 2002:a17:90b:1b43:b0:38d:eb10:6f01 with SMTP id 98e67ed59e1d1-38e4b422875mr17195640a91.4.1784606945028;
        Mon, 20 Jul 2026 21:09:05 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm33617461c88.9.2026.07.20.21.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 21:09:03 -0700 (PDT)
Message-ID: <02c537c5-8516-c353-2ea9-d0408c4972cc@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 09:38:56 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] media: iris: add support for multi_slice in iris
 encoder
Content-Language: en-US
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717-iris_multi_slice-v2-0-9550b1feb39b@oss.qualcomm.com>
 <20260717-iris_multi_slice-v2-2-9550b1feb39b@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260717-iris_multi_slice-v2-2-9550b1feb39b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAzOSBTYWx0ZWRfXwkII9gBPUpRx
 BZRLRjvA8KHbkz9x+PWFkpi+RPRgX+vaSI6BMvaQpknwJO0QKHtEhYtp2rk/bm342F4wcZEW7po
 Kg+VhOw1r8IKOF3G/S8M52vtmtfPEPWpxaQkpxtK4SCw9Q35RUfAxirUKWCZQqFqKiIGd1nwGz9
 Eze/snL5oMaqCx8AcMpdjs0zlwnxAP8Mt2rupCcap8d/1MhpFglmNK+AVQZCQROdgs2sNP2ayTR
 n1Wrn75ifhlPriSFrnvTS5q+fjAmTRy2z41R6LFG9Wk3inUnP1ECIbZEVjB+tUjYHwo1+W439lt
 WnzUSSPh0+WdJXfMJtRp1kBGEKF/3FPNMO/4QS+lwDFSm/60gTTpzqZTrJ9OBxC1MvUnGPDdeNN
 5lpxEkSRcz24m8seO4oDuZHchQTwWOdmNtJkMyhAxUBrXJNukwoCPWhnL1UuW7XcVKLnj3iXFA5
 HX2VuQXlmf4k0rZuQBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAzOSBTYWx0ZWRfXzfqUAve13nmu
 02tIO/e3vgfe9TQrmn2HR2aSUkr08EEGbxghni6UfbJcs+Z5WzpITugEMx4Y+AX548jL8E1XL4I
 lP83viLA6aamBBHdpukleT4YNusoUJA=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5ef0e2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=v1_a9Vtw6dW_r32y8jwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: uxVEW_O2cYb7B2EBuL1J-pUf8slm_JJi
X-Proofpoint-ORIG-GUID: uxVEW_O2cYb7B2EBuL1J-pUf8slm_JJi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210039


On 7/17/2026 12:21 PM, Sachin Kumar Garg wrote:
> Add multi-slice encoding support with MAX_MB and MAX_BYTES modes.
>
> Clients can enable slice mode using V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE
> control and configure slice size via V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB
> or V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES controls.
>
> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 81 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 33 ++++++++-
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 +
>  .../platform/qcom/iris/iris_platform_common.h      | 12 ++++
>  .../platform/qcom/iris/iris_platform_qcs8300.h     |  9 +++
>  .../platform/qcom/iris/iris_platform_sm8550.h      |  9 +++
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  |  9 +++
>  8 files changed, 155 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 6c4eed62d7e3..3f8b869ab87d 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -154,6 +154,12 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  		return LAYER4_BITRATE_HEVC;
>  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
>  		return LAYER5_BITRATE_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
> +		return SLICE_MODE;
> +	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES:
> +		return SLICE_MAX_BYTES;
> +	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
> +		return SLICE_MAX_MB;
>  	default:
>  		return INST_FW_CAP_MAX;
>  	}
> @@ -297,6 +303,12 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>  		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
>  	case LAYER5_BITRATE_HEVC:
>  		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
> +	case SLICE_MODE:
> +		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE;
> +	case SLICE_MAX_BYTES:
> +		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES;
> +	case SLICE_MAX_MB:
> +		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB;
>  	default:
>  		return 0;
>  	}
> @@ -1480,6 +1492,75 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
>  					     &bitrate, sizeof(u32));
>  }
>  
> +int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> +	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
> +	u32 slice_mode = inst->fw_caps[SLICE_MODE].value;
> +	u32 bitrate = inst->fw_caps[BITRATE].value;
> +	u32 rc_type = inst->fw_caps[BITRATE_MODE].value;
> +	u32 fps = inst->frame_rate;
> +	u32 output_width = inst->fmt_dst->fmt.pix_mp.width;
> +	u32 output_height = inst->fmt_dst->fmt.pix_mp.height;
> +	u32 mbpf = NUM_MBS_PER_FRAME(output_height, output_width);
> +	u32 max_width, max_height, min_width, min_height;
> +	u32 max_avg_slicesize, hfi_value, hfi_id;
> +
> +	if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE) {
> +		dev_dbg(inst->core->dev, "slice mode is: %u, ignore setting to fw\n", slice_mode);
> +		return 0;
> +	}
> +	if (!fps) {

This condition will never be true as fps (inst->frame_rate) cannot become zero
anywhere in the driver.

> +		dev_err(inst->core->dev, "Invalid frame rate %d\n", fps);
> +		return -EINVAL;
> +	}
> +	if (fps > caps->max_slice_frame_rate ||
> +	    (rc_type != HFI_RC_OFF && rc_type != HFI_RC_CBR_CFR &&
> +	    rc_type != HFI_RC_CBR_VFR && rc_type != HFI_RC_VBR_CFR)) {
> +		dev_err(inst->core->dev, "slice unsupported, fps: %u, rc_type: %#x\n",
> +			fps, rc_type);
> +		return -EINVAL;
> +	}
> +
> +	max_width = (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
> +			caps->max_mb_slice_width : caps->max_bytes_slice_width;
> +	max_height = (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) ?
> +			caps->max_mb_slice_height : caps->max_bytes_slice_height;
> +	min_width = (inst->codec == V4L2_PIX_FMT_HEVC) ?
> +			caps->min_hevc_slice_width : caps->min_avc_slice_width;
> +	min_height = caps->min_slice_height;
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
> +		hfi_value = max(hfi_value, mbpf / caps->max_slices_per_frame);
> +		if (inst->codec == V4L2_PIX_FMT_HEVC)
> +			hfi_value = (hfi_value + 3) / 4;
> +		hfi_id = inst->fw_caps[SLICE_MAX_MB].hfi_id;
> +	} else if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
> +		hfi_value = inst->fw_caps[SLICE_MAX_BYTES].value;
> +		if (rc_type != HFI_RC_OFF) {
> +			max_avg_slicesize = ((bitrate / fps) / 8) / caps->max_slices_per_frame;
> +			hfi_value = max(hfi_value, max_avg_slicesize);
> +		}
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
>  int iris_set_properties(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 3c462ec9190b..5a73c7c49d36 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type c
>  int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_properties(struct iris_inst *inst, u32 plane);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> index acc0ed8adda1..fcbebced05c3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> @@ -12,6 +12,8 @@
>  
>  #define VIDEO_ARCH_LX 1
>  #define BITRATE_MAX				245000000
> +#define MAX_SLICE_MB_SIZE         \
> +	(((4096 + 15) >> 4) * ((2160 + 15) >> 4))
>  
>  static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>  	{
> @@ -937,7 +939,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>  		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
>  			CAP_FLAG_DYNAMIC_ALLOWED,
>  		.set = iris_set_layer_bitrate,
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
>  };
>  
>  static const u32 sm8550_vdec_input_config_params_default[] = {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 776b21cd11b2..226894b99dcc 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -71,6 +71,8 @@ enum hfi_rate_control {
>  #define HFI_PROP_MIN_QP_PACKED			0x0300012f
>  #define HFI_PROP_MAX_QP_PACKED			0x03000130
>  #define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
> +#define HFI_PROP_MULTI_SLICE_MB_COUNT		0x03000132
> +#define HFI_PROP_MULTI_SLICE_BYTES_COUNT	0x03000133
>  #define HFI_PROP_LTR_COUNT			0x03000134
>  #define HFI_PROP_LTR_MARK			0x03000135
>  #define HFI_PROP_LTR_USE			0x03000136
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index c9256f2323dc..659d15166365 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -100,6 +100,15 @@ struct platform_inst_caps {
>  	u32 mb_cycles_fw_vpp;
>  	u32 max_frame_rate;
>  	u32 max_operating_rate;
> +	u32 max_slices_per_frame;
> +	u32 max_slice_frame_rate;
> +	u32 max_mb_slice_width;
> +	u32 max_mb_slice_height;
> +	u32 max_bytes_slice_width;
> +	u32 max_bytes_slice_height;
> +	u32 min_hevc_slice_width;
> +	u32 min_avc_slice_width;
> +	u32 min_slice_height;
>  };
>  
>  enum platform_inst_fw_cap_type {
> @@ -183,6 +192,9 @@ enum platform_inst_fw_cap_type {
>  	LAYER3_BITRATE_HEVC,
>  	LAYER4_BITRATE_HEVC,
>  	LAYER5_BITRATE_HEVC,
> +	SLICE_MODE,
> +	SLICE_MAX_BYTES,
> +	SLICE_MAX_MB,
>  	INST_FW_CAP_MAX,
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> index 3cfecae80d1e..764acf71c72b 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> @@ -17,6 +17,15 @@ static struct platform_inst_caps platform_inst_cap_qcs8300 = {
>  	.mb_cycles_fw_vpp = 44156,
>  	.max_frame_rate = MAXIMUM_FPS,
>  	.max_operating_rate = MAXIMUM_FPS,
> +	.max_slices_per_frame = 128,
> +	.max_slice_frame_rate = 60,
> +	.max_mb_slice_width = 4096,
> +	.max_mb_slice_height = 2160,
> +	.max_bytes_slice_width = 1920,
> +	.max_bytes_slice_height = 1088,
> +	.min_hevc_slice_width = 384,
> +	.min_avc_slice_width = 192,
> +	.min_slice_height = 128,
>  };
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
> index 3c9dae995bb2..ef87976c2360 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
> @@ -25,6 +25,15 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
>  	.mb_cycles_fw_vpp = 66234,
>  	.max_frame_rate = MAXIMUM_FPS,
>  	.max_operating_rate = MAXIMUM_FPS,
> +	.max_slices_per_frame = 128,
> +	.max_slice_frame_rate = 60,
> +	.max_mb_slice_width = 4096,
> +	.max_mb_slice_height = 2160,
> +	.max_bytes_slice_width = 1920,
> +	.max_bytes_slice_height = 1088,
> +	.min_hevc_slice_width = 384,
> +	.min_avc_slice_width = 192,
> +	.min_slice_height = 128,
>  };
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index 6e06a32822bb..39720e7af889 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -44,6 +44,15 @@ static struct platform_inst_caps platform_inst_cap_vpu2 = {
>  	.mb_cycles_vpp = 200,
>  	.max_frame_rate = MAXIMUM_FPS,
>  	.max_operating_rate = MAXIMUM_FPS,
> +	.max_slices_per_frame = 128,
> +	.max_slice_frame_rate = 60,
> +	.max_mb_slice_width = 4096,
> +	.max_mb_slice_height = 2160,
> +	.max_bytes_slice_width = 1920,
> +	.max_bytes_slice_height = 1088,
> +	.min_hevc_slice_width = 384,
> +	.min_avc_slice_width = 192,
> +	.min_slice_height = 128,
>  };
>  
>  static const struct icc_info iris_icc_info_vpu2[] = {
>
