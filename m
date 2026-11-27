Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760670;
	b=AOHJ+G+KGi48ydMZgI3XNvebO79oXHTsD/lD0HLEOunlbAC1chvTleFs8pQim5bK5Gr8
	 v2LtrMf5dF834EQ3aI+mRJCUiPwxq125YXoKMgy+dLQMc7VxnwDSMAeltl/r3wp0LuOav
	 5JZ43deEs6j22R0xqPBLTp37KkMNxHK15yCH12yMVG1kOZSGszZ88LoIrO5x7WRE7KS5X
	 6cwXuzZxRs7iIuLHCoeVy3qxPkrci01XqMoamLsMGMHC6qAufulUyCMZwrIg/+fBxi75R
	 HMFCSqq3QPQRhwYSDdH/zhBdVdSc49MDWdylp6yrZsQWnqMiT6yobsgomhe/ZpFrYwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=llOO67vhoq/kH0K+7ZGst9AFsNZYewfCoJm59v6vk8Y=;
	b=xCwsIy29V9GZt/YaK+vBlEvbYooBC3UPn48rrMmxZTrI9ip+t6Rzhj86u3AsiKHIbnvl
	 37f01mZFNP0MTELrYfiKy/axIljJlE9tjQfP+eZo0777/hQyRLXsVEzxcWEEk/2PY6j4D
	 tT7qEjDl2Q+4dWt6eH91kaNEI+0RZdh1VWDzFqTrjniNfYXl4JYhwVrbm46wWTr2rx9+c
	 kNe2S/vUnO+855BimXGqcyC64csYQheG5O9R1GOdt7lA10jKlGqsYAePE8tOBwLTtmaCJ
	 7tQF3SFzUPlAIDrfyAcG3Azl8xhIMAmBTN7h0iE+feGAhxFetHfrELCegl6UTa0eR4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NWJ9N2G1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OVg4OfcZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D335606A321
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 06:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D335606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NWJ9N2G1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OVg4OfcZ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR4Z1p7565241
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 06:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	llOO67vhoq/kH0K+7ZGst9AFsNZYewfCoJm59v6vk8Y=; b=NWJ9N2G1sefu7yA3
	3nSz2vDTjziEuS7/OcZiWYW6/olrcDFWCpVYi+z8BB99nO+565AvPbGh99Howr+R
	ZLl0UV5bU1mpcjnzZMfC40rBswhKsJ/diJCl/UHnsTmqPjM3Vu2MdelqlGuJOZIV
	tfXDe8A9/fy31685BAObonJM7PVvXmrAMjAHYGsNdgAu2UJJL3tXGObA5pvSIFFr
	fzVn7/NIyZIk/R+aZSWNeT9kPes2RwniNBbBAbluAyMgu//XdiEiBq9ce1/za5UG
	INCCeg8/jdUFyxTLFJEcXNyWHYdJ9iHIpcnzc/Yi8G2eKPiXKxHdW095v2fl6TfU
	eq3NeQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru399nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 06:24:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386a65fca25so6843623eec.0
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 22:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795760667; x=1796365467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=llOO67vhoq/kH0K+7ZGst9AFsNZYewfCoJm59v6vk8Y=;
        b=OVg4OfcZw/EgqLx6TUH7kOnmbzdvS00od2bHpZuSVSPc3p/yd4i/93Z82LE+S4BQbJ
         MgCZnkD3WDhFVuiaJCRGbCh0oJ0rzDcPysl1PEsN7ZhzsLSrXQmMNeXKulQVtps179oL
         spRQ0qPXOlpmbbCaetwP1JXCeX01K4WbzJPiL/wQwT2tveN7/2u4mtixmwYt+T1K7dge
         or2494U4e/8G22riP+aUX5HOnJ5rtLJkFMuhpe7zKDl88APIJXwXkVmyaAuAY1VDGSL1
         G5eFfMKsIZrzqZio8V5i+0KxCww5stgBz9/J4VoLsR3tmbQZX/z+g9/GhhyybSw5VPvw
         AzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760667; x=1796365467;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=llOO67vhoq/kH0K+7ZGst9AFsNZYewfCoJm59v6vk8Y=;
        b=20xFmy8WFNlQpyJL1cP/SppdqfSI66Sw0Zma3kZHEAxMDV0zz12vKEuq61K3Q/oine
         gZe+Fvt0YBCP6hsPpF22MUtEppSsCCqaDzfDTNKdz8a6XvmJt1Bvicz+Ukg1eM9gDOBK
         gNLPq8QAPhsiYW25dnCR2tS2IdYpoMroXzG2Q2858ru9KhfT9J+PxQfqLSG+oC+QaZS+
         kCkc6bvCOgrGuckICWWI9e71VlBWaOQZ+9zVK/FMb16sJUnGH3VkcQr2cJDJTTzRbkK3
         SRno5/Dz2sQSG1p98R2EayPD3DT+axuLyPXW0E/PmX4iNJHazmqk3RJZwjCShmJ3Da2c
         Ceww==
X-Gm-Message-State: APuU4Z8Zk/+FVH115536VYuUSanf1R7kip1KiGtZMYGcvajaZxuSmZEC
	paq5uMzqw9vTUpI/d3cury9Npfty2GAZvqXncIiswXiwF1miMeCgcfcNY9G2FsEElEE7v2pUgxJ
	duScEzx1y2jTag1XRTSF+dqSjzbayI5YIvOJWJYtENhLGFKBL3Zg1t7jW/w8QCMaJfw==
X-Gm-Gg: AZFdTZeih0maS4MEtgJT4xz6h5BWIv4zIdg8xu7e2h+3+NfOUWe+9yFdLtk/H+59Ma5
	h4JoNsP9DBa1oGzZaqRjaETmXVmOAxVkaq+zpE2hRjKxStsxYdwx2+Fz3THnOop2KuskKIH0lF4
	RqfY0FeGn1skycDgdD9/OBru7C8eFZVPWlG5eHZ7SE64ubc4seO9xcrIfWZt+x/0NJh0Fs9zPzz
	P4ITop2TIr6XDQ6agv/vNVfTCEZyvoGuQxDrLYCoaUvZ+cbCW+q/YuhWah+0o8E5iA4v5j2Zux/
	W32UFk/oEe+rkJ4lpMzKnwu/YSa2oFVvIqzn4DVIivfQOoQhxrEWrDVVN+ARmFdbLbs/gsZ8ZgV
	gYlUyQTa4isUQWeO7nkGcBMprYqWFx+QetNCyYdM6r1QYEloLZ5/8TnqB53VCHG+Jh2iyZ8x5f9
	2/xfW2
X-Received: by 2002:a05:7301:6083:b0:386:a01f:a36b with SMTP id 5a478bee46e88-386a01fa8d8mr27738028eec.35.1795760667408;
        Thu, 26 Nov 2026 22:24:27 -0800 (PST)
X-Received: by 2002:a05:7301:6083:b0:386:a01f:a36b with SMTP id 5a478bee46e88-386a01fa8d8mr27737996eec.35.1795760666829;
        Thu, 26 Nov 2026 22:24:26 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm35769098eec.27.2026.11.26.22.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 22:24:26 -0800 (PST)
Message-ID: <2e4fcb24-aff0-e93c-d702-b01bfe7c17ca@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:54:18 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/5] media: iris: support decode-order output on HFI gen2
Content-Language: en-US
To: Xilin Wu <sophon@radxa.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, dragon@radxa.com,
        Chris Obbard <chris.obbard@oss.qualcomm.com>,
        Deepak Sikri <sikrid@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Loic Minier <loic.minier@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
References: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
 <20261029-iris-va-fixes-v1-1-44a2783f782b@radxa.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261029-iris-va-fixes-v1-1-44a2783f782b@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b09221c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ksxQWNrZAAAA:8 a=YvhqXWzbulz00Tmx5t4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: -iSuzosBllC36w9s6QzcavaYu4LzcK3m
X-Proofpoint-ORIG-GUID: -iSuzosBllC36w9s6QzcavaYu4LzcK3m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyNSBTYWx0ZWRfX5BGWKMl0F9ne
 swKqdja/3YXJxGLbfpUAR6/VhUoKBaB/0S406xlzK3++shPH8cnwaK86TNx/lj4QJgZdgHy/1ms
 psNjyt5HsKVo78bFBzrkeo7GFK8IWR/wk3yfjJerOVEvsXLnlvKweA97ZQ7z0PXCxxtw6doHbgP
 472XF03wjZlwePFOWWUinqGqFEG/dSGtQeUNXXji/7bGpjkLL6XKCys7ELbBbAL3DffWFmetJ8W
 yI6b2bH5MaLQvcRHrdjRiUR8nlZGswd5qc39r/G1X6Y47EZL4D5t/F2pLmlopQ4WndGDrvqJy20
 YTmcpJl1TNWmrEWJzTRZWT7CYeDd/W7wBZAZoNMudhuLO4t8QMLjdHH1elVhoRoYDcbnHkX+lez
 e5/ytH5gv1KaThX4Ui7Dj3GEQXQFNmQkLn5h7mpfDX56KYvZMiBMdlqFbu0jNKs3oBwm82af9Hd
 XaA6gdrn/Udk8oyGvCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyNSBTYWx0ZWRfX0eMN+lhzB29t
 Q11zZsKCzN9dl1yav7/ou9gXOu6QdBC8bH+udIwBBiawzz3BerAA978a7j/E67eYT7kQW1Fsr64
 M4yH/Zf39fZ7JWeIvTHkVAbtRL/PK5Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270025


On 10/29/2026 9:28 AM, Xilin Wu wrote:
> Synchronous per-picture clients such as VA-API can stall when firmware
> holds decoded pictures for display reordering while the client waits for
> the current picture before submitting more input.
>
> Expose the decoder display-delay controls on HFI gen2, with a zero delay
> selecting decode-order output. Keep display-order output as the default.
>
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c        |  8 ++++++++
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c     | 20 ++++++++++++++++++++
>  .../media/platform/qcom/iris/iris_hfi_gen2_command.c | 18 ++++++++++++++++++
>  .../media/platform/qcom/iris/iris_hfi_gen2_defines.h |  1 +
>  .../media/platform/qcom/iris/iris_platform_common.h  |  2 ++
>  5 files changed, 49 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 4f2633bbb49f..1dbea37c93c3 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -155,6 +155,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  		return LAYER4_BITRATE_HEVC;
>  	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
>  		return LAYER5_BITRATE_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:
> +		return DISPLAY_DELAY_ENABLE;
> +	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:
> +		return DISPLAY_DELAY;
>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
>  		return REQUEST_SYNC_FRAME;
>  	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
> @@ -306,6 +310,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>  		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
>  	case LAYER5_BITRATE_HEVC:
>  		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
> +	case DISPLAY_DELAY_ENABLE:
> +		return V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE;
> +	case DISPLAY_DELAY:
> +		return V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY;
>  	case REQUEST_SYNC_FRAME:
>  		return V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME;
>  	case SLICE_MODE:
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> index 79bbd06ef8d2..65af61b63a29 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> @@ -842,6 +842,22 @@ static const struct platform_inst_fw_cap inst_fw_cap_milos_enc[] = {
>  };
>  
>  static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
> +	{
> +		.cap_id = DISPLAY_DELAY_ENABLE,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_DECODE_ORDER_OUTPUT,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +	},
> +	{
> +		.cap_id = DISPLAY_DELAY,
> +		.min = 0,
> +		.max = 0,
> +		.step_or_mask = 1,
> +		.value = 0,
> +	},

Nit: Since DISPLAY_DELAY_ENABLE and DISPLAY_DELAY were added at the end of
enum platform_inst_fw_cap_type, it may be cleaner to place this capability
entries at the end of this table as well for consistency. Same consistency
comment applies to the iris_get_cap_id() and iris_get_v4l2_id() additions
above as well.

>  	{
>  		.cap_id = PROFILE_H264,
>  		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> @@ -1818,6 +1834,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>  };
>  
>  static const u32 sm8550_vdec_input_config_params_default[] = {
> +	HFI_PROP_DECODE_ORDER_OUTPUT,
>  	HFI_PROP_BITSTREAM_RESOLUTION,
>  	HFI_PROP_CROP_OFFSETS,
>  	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> @@ -1830,6 +1847,7 @@ static const u32 sm8550_vdec_input_config_params_default[] = {
>  };
>  
>  static const u32 sm8550_vdec_input_config_param_hevc[] = {
> +	HFI_PROP_DECODE_ORDER_OUTPUT,
>  	HFI_PROP_BITSTREAM_RESOLUTION,
>  	HFI_PROP_CROP_OFFSETS,
>  	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> @@ -1841,6 +1859,7 @@ static const u32 sm8550_vdec_input_config_param_hevc[] = {
>  };
>  
>  static const u32 sm8550_vdec_input_config_param_vp9[] = {
> +	HFI_PROP_DECODE_ORDER_OUTPUT,
>  	HFI_PROP_BITSTREAM_RESOLUTION,
>  	HFI_PROP_CROP_OFFSETS,
>  	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> @@ -1850,6 +1869,7 @@ static const u32 sm8550_vdec_input_config_param_vp9[] = {
>  };
>  
>  static const u32 sm8550_vdec_input_config_param_av1[] = {
> +	HFI_PROP_DECODE_ORDER_OUTPUT,
>  	HFI_PROP_BITSTREAM_RESOLUTION,
>  	HFI_PROP_CROP_OFFSETS,
>  	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 388a36ff2b07..a285e6fc8728 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -665,6 +665,23 @@ static int iris_hfi_gen2_set_super_block(struct iris_inst *inst, u32 plane)
>  						  sizeof(u32));
>  }
>  
> +static int iris_hfi_gen2_set_decode_order_output(struct iris_inst *inst, u32 plane)
> +{
> +	struct platform_inst_fw_cap *cap = &inst->fw_caps[DISPLAY_DELAY_ENABLE];
> +	u32 decode_order = cap->value;
> +
> +	/* Leave the firmware default unchanged unless userspace sets the control. */
> +	if (!(cap->flags & CAP_FLAG_CLIENT_SET))
> +		return 0;
> +
> +	return iris_hfi_gen2_session_set_property(inst,
> +						  HFI_PROP_DECODE_ORDER_OUTPUT,
> +						  HFI_HOST_FLAGS_NONE,
> +						  HFI_PORT_BITSTREAM,
> +						  HFI_PAYLOAD_U32,
> +						  &decode_order, sizeof(decode_order));
> +}
> +
>  static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_firmware_data *fdata = inst->core->iris_firmware_data;
> @@ -691,6 +708,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>  		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
>  		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
>  		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
> +		{HFI_PROP_DECODE_ORDER_OUTPUT,        iris_hfi_gen2_set_decode_order_output    },
>  	};
>  
>  	if (inst->domain == DECODER) {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 2b8b057d35a9..e89ed4075526 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -130,6 +130,7 @@ enum hfi_flip {
>  
>  #define HFI_PROP_FLIP				0x0300014c
>  #define HFI_PROP_SIGNAL_COLOR_INFO		0x03000155
> +#define HFI_PROP_DECODE_ORDER_OUTPUT		0x0300015b
>  #define HFI_PROP_PICTURE_TYPE			0x03000162
>  #define HFI_PROP_DEC_DEFAULT_HEADER		0x03000168
>  #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index cddab9a9c375..aa8cd2e1b3f1 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -211,6 +211,8 @@ enum platform_inst_fw_cap_type {
>  	SLICE_MODE,
>  	SLICE_MAX_BYTES,
>  	SLICE_MAX_MB,
> +	DISPLAY_DELAY_ENABLE,
> +	DISPLAY_DELAY,
>  	INST_FW_CAP_MAX,
>  };
>  
>
