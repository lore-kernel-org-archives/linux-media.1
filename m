Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760037;
	b=rz4kSWqJwN+BxEGcU//OLGNWyrCHHRWuoVFw+wyvJk3Wq1D2FEBuKKgTUBRhsDe4yHcQ
	 6+Jn2T4JYasEAdbY+aoEcL771sarsETYm2zzKqkUYVDPg/mAbbUMioyXazauN/dB2I++N
	 ujt0xXfdkMQQcAiLf7qNH2zkTaYQDKc3sgdNGhwWe5DYpmxW5/zfUgPQ61E4uM5XTMuiv
	 HQw5849WlWgSLvpC9N3yCiwfcYl0K3eKkQvQwDjeiX6M+HVYOQzO9J90dQVoc7qMAWCwm
	 OvXqWeqImJqVDJPZALdc20CEu2SNjLj3q9e3/ZmT6t/AC+MLOeQJFVRSK7LW6UgKD7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760037;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=E9CC07hQOVJkkqtZtDLnCAicLRf+9VZKlInJHU1RiKk=;
	b=E7+AimwstSc9myQqp/ji85/9fV2WAIXa+BwinLVKkSnyhqz9m8SJgBmnY7l481jzT0Cr
	 QeQVdxAee+JkLbckLBafbxH1bn64ajqf6geZRKD0/t82LZYatuHa2jx+aWiXLwxCts3Ss
	 XtezKsCeYTIvtLmR/8HYo5SMZd2Nha9jBiO63Ai2jopgOWmPxzgy5orxoyxzT6ZvYam6M
	 olds95CanJbsnhH12wwQWsjg1aUjjBiLMe2ebomGFtfGv25ptv2KRwhwIhFA+LHYG/oq3
	 6FpfAbOOiqCTiuvJZW6mXKJatas+WZY5NYg1hYpV443e5205TdSuJRoOTOekSoHrvBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LVtAmk4L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hS6ho8Om;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A727B606A32D
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 02:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A727B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LVtAmk4L;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hS6ho8Om
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RSiH3335558
	for <linux-media@vger.kernel.org>; Wed, 4 Nov 2026 02:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E9CC07hQOVJkkqtZtDLnCAicLRf+9VZKlInJHU1RiKk=; b=LVtAmk4LEotoftOH
	VWPItEGZExdAIDnzvwuT7TO9cwr4gnN+qdWnjaj2oPiWFDKktawe7q4KQslIxWl+
	JK+0AfdffHIzHsIuZZilFGAWSxJCK0JQTgujranuscBLSLzDoTeUa65IASyDSdSk
	htGxNag842FuENnybhAr0y7wNGHZRm+p47yRAEwwEaGIqaEI2X+ZgJmJ3dgPFGkn
	eddBizVEP7aqGjjxr9wmxDx/xYrOUQu8ujxAECt9qdbrWYdVZi9owVHYwdxyAe+m
	OUkPsLaksPfkM1+c+rFxPVdQrlH7hFmmvcA34VY+Y8QS9aMYo/lO7Vm7GRti1nw4
	VPZPNQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbssmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 02:40:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3662e7a9299so767965eec.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 18:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793760034; x=1794364834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9CC07hQOVJkkqtZtDLnCAicLRf+9VZKlInJHU1RiKk=;
        b=hS6ho8OmISDoyuumjWCSM+pk2Rj8d4cGGcOhYcGxmZeUxE8jaW/HH/Ov0HX5EnkcPg
         vw0pQPIdv9dM3WcCKGn1WP6QyT86c+O/jlC52ZHKHo2o5iWjgKnRGyeX/Ym0n4OWblHx
         KaUAfUOWyoi13mcEtaR3ACbXJy+hO+zs0VexvcSVhygutuQBCmP/ShWJfVhM+HHm8Oif
         yb+nWHDrdbYzc2Cb6AwjTSnCTY2Ze297/H6QnDN6evIFQcBLwLA9ZgzR+cjlf7gwXNQG
         qSPfimQJvTGODE2CKkoAQ9rPMkzM5uxAcJNae2wlDSTVGqNfal2aXfFwk3QQ3H9TNAb3
         HTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793760034; x=1794364834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9CC07hQOVJkkqtZtDLnCAicLRf+9VZKlInJHU1RiKk=;
        b=iqbEtxyHS+nvqFOKHBlY2ExA/PUgfgerUm2e1tjTBi/P2MiQ+uTi6pGKO8J48+RINn
         nMKWewZDnwhMwdh3hVQoZWywRcIw9XZtne9nhIsqaMXeRGVAMk2HCNxJg1PMQdeI8rdv
         xSLsVoBBH89ACS18/1nipX0PXQO53SzU7lLuQ/+jIsEJw6uAKQ7nra6fZSRBXGo2sT3K
         6zrSmZXBGnSAOSASXVMe69UFlk4w+R7vyApiRd2yr1Zn3TLW6BGcO54IWXyDiHx+J+Yw
         wpjxUjvmW1F7ScWBzgxC4hl3Wjl8k1uxXP5RTAr+vAg3NDYTT/SP2JIDlx8LxtqrIs90
         UtWg==
X-Gm-Message-State: APuU4Z+aclVExhRPWiBBqOiWA2JH1yoQvIOnC3Utie+R0VG/Q+/xKSOq
	SzWZgKaulJf5Bbtf5YO2phFdCa5655gHRfafA55DOpUtZ06vqkgmnKh+vSb+teJuJeIE1O6w5jf
	SdJEdlQrvuUrBWObUt6ziNzxE43eWnht+7RBRgxypyG6djLnsjCjmvEGOgd+1UadjMQ==
X-Gm-Gg: AYBFou1IW7kkdDSprccLQcwJlLGe17uSKLf08j7xI3VDoaLyKtoyL6UMIpe4f5Eb5pX
	aNqlYkwtGhIpnGwOff50TeraZSFx3zoABmTolxLZ4zUimuBPIxg1wFHeJ/M3OJ7p+03JhQhYip5
	TL2EpVW3/kc0uu0XL7U96/QACUdcZmi8cwuXjhyX/t4PCX6+5yshiGxBlu7vmnI4kLZGptd2tnQ
	WuwpS43eDlMq46bAqc/hfxyGea0ZhSHdFAmJKzemGutXW/1FFbjSPO4fL+w2NrREyoBcNH2PCWv
	zJ4QpoYICvhf/MfprFCidS2FBpsHnduRzq+0oYoIUoGk1bZugqGST2N79PnwMHaonoE0QVfheOG
	jzL9VkbUWasIBbu5/DVHKggQxZ5jgeAzVzQeJ4IttwdkbDBhV2MjH/jyFMsOnEbK6CXkDXj4oEo
	U8
X-Received: by 2002:a05:7022:b059:20b0:145:4ef:e8de with SMTP id a92af1059eb24-1ac55f2d1c2mr23887771c88.6.1793760034333;
        Tue, 03 Nov 2026 18:40:34 -0800 (PST)
X-Received: by 2002:a05:7022:b059:20b0:145:4ef:e8de with SMTP id a92af1059eb24-1ac55f2d1c2mr23887714c88.6.1793760033417;
        Tue, 03 Nov 2026 18:40:33 -0800 (PST)
Received: from [192.168.1.4] ([122.177.245.68])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm3571048c88.22.2026.11.03.18.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 18:40:32 -0800 (PST)
Message-ID: <bf1c44de-f180-4c8c-90a9-6a97603bc03a@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 08:10:10 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: iris: Retain firmware confirmed video_format
 across GOP restarts
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-read_video_format_from_firmware-v2-1-21a606cdd288@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20260905-read_video_format_from_firmware-v2-1-21a606cdd288@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hEZRl9MGlex1FPjpilU4dEYzx6Qjpoqn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAxMCBTYWx0ZWRfX0DD8gwep1XgM
 WXfWDka6zlaLg9EJFj6LgY2JMlku6nDAGHTXEXEi1nCp5zAqckVbNGjDMdM5DsxOcEszJj5+TxZ
 FkfPQEe0eJTblnL0n5seCfG/14oyylKxh87SswVrPdVUpkJxtLVhSCtnNBVX6tu2S5YIlON7ugD
 U0uaoBqQm6+LPO3lAHqIOWI9H/UMX0FDfPrN6THwR12ERd6UFZVVdt7kKITr+FM1iq6UWXdLidF
 Q2j3DA96g/OCisCmky4EjCFIiITbhk/sKSw3kVEdbvjraxxuFi2MZfpQ3GIGGxjzQs79mgYz+cD
 VJicr6Mc+HO1HNzP9ueTwmUtJAZg5hCYWd8iu55iNQIXzhfT35itxCPFT12Wk4ePy1u3ficKgIy
 R6itJ9OLiGRqYfBv6eJh+PyMiIHr1zmhC4VOyutdRLA3PWotfj+oZqm1LTHb7N2p00sV169CGL/
 sis8ZIgcAqXqFqMwRGg==
X-Proofpoint-ORIG-GUID: hEZRl9MGlex1FPjpilU4dEYzx6Qjpoqn
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea9b23 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=EtrGahee6tu1RMNbwH63qg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=r1EkoBCNwLdSQPggacgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAxMCBTYWx0ZWRfX1ODkgVyqAyL3
 MxPiGkNIVvOfkF/s59G9hyoZ2UGPwVZ1Q7fkBw8+Ap8yYA+FrF8qS0FqiS5JmMSJR5me88hUCV5
 wCQsHcaw554F2qPB60kF44uSBLVDDbM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040010



On 9/5/2026 7:27 PM, Vishnu Reddy wrote:
> During speed-based rewind, the client restarts the decoder queues once per
> group of pictures (GOP). This is because playing a GOP-based stream in
> reverse requires decoding each group forward first and then showing its
> frames in reverse order. Each restart makes the driver resend the colour
> info property on the bitstream port, which firmware always treats as a
> sign that the stream's properties may have changed. The driver never
> stored the video_format value that firmware had last confirmed, so it
> resent colour info with a fixed unspecified value instead of the real one,
> and the value firmware received kept differing from what it already had.
> 
> On every restart during rewind, this looked to firmware like a real change
> on the bitstream port, so firmware sent a settings-change notification,
> and the driver treated it as a dynamic resolution change and paused the
> port. The client then removed its buffers and built new ones for a
> resolution that had not actually changed, stalling playback once per GOP.
> 
> Store and send back the same video_format value firmware already confirmed
> so both sides stay in agreement across every restart, avoiding the false
> settings-change notification.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated the commit description (Konrad)
> - Link to v1: https://patch.msgid.link/20260901-read_video_format_from_firmware-v1-1-499edea4d200@oss.qualcomm.com
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_common.h        | 1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c  | 3 ++-
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 2 ++
>  3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index a27447eb2519..439197e9e199 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -141,6 +141,7 @@ struct hfi_subscription_params {
>  	u32	fw_min_count;
>  	u32	pic_order_cnt;
>  	u32	color_info;
> +	u32	video_format;
>  	u32	profile;
>  	u32	level;
>  	u32	tier;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 388a36ff2b07..a43a9d7687ad 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -358,7 +358,7 @@ static int iris_hfi_gen2_set_colorspace(struct iris_inst *inst, u32 plane)
>  	struct v4l2_pix_format_mplane *pixmp = &inst->fmt_src->fmt.pix_mp;
>  	u32 video_signal_type_present_flag = 0, color_info;
>  	u32 matrix_coeff = HFI_MATRIX_COEFF_RESERVED;
> -	u32 video_format = UNSPECIFIED_COLOR_FORMAT;
> +	u32 video_format = inst_hfi_gen2->src_subcr_params.video_format;
>  	u32 full_range = V4L2_QUANTIZATION_DEFAULT;
>  	u32 transfer_char = HFI_TRANSFER_RESERVED;
>  	u32 port = iris_hfi_gen2_get_port(inst, plane);
> @@ -806,6 +806,7 @@ static int iris_hfi_gen2_session_open(struct iris_inst *inst)
>  
>  	inst_hfi_gen2->ipsc_properties_set = false;
>  	inst_hfi_gen2->opsc_properties_set = false;
> +	inst_hfi_gen2->src_subcr_params.video_format = UNSPECIFIED_COLOR_FORMAT;
>  
>  	inst_hfi_gen2->packet = kzalloc(4096, GFP_KERNEL);
>  	if (!inst_hfi_gen2->packet)
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 8c2644c7f6e8..8b1ff253a560 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -581,6 +581,8 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>  	full_range = (subsc_params.color_info & 0x2000000) >> 25;
>  	video_signal_type_present_flag =
>  		(subsc_params.color_info & 0x20000000) >> 29;
> +	inst_hfi_gen2->src_subcr_params.video_format =
> +		(subsc_params.color_info & 0x1C000000) >> 26;
>  
>  	pixmp_op->colorspace = V4L2_COLORSPACE_DEFAULT;
>  	pixmp_op->xfer_func = V4L2_XFER_FUNC_DEFAULT;
> 
> ---
> base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
> change-id: 20260905-read_video_format_from_firmware-ecbb322a6fd4
> 
> Best regards,
> --  
> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

Tested-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
