Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0DC483BE3
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 16:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946320; cv=none; b=Oks93XvlgtNxl7keTIHq6my3QycDtIsZOsreXG8zKE1gqCcF0j59LRx3lGe6Ifz2jkr8G5BEk6PmHQT7xzpwetyRwO4ZDKPWE5PBUqg8ho+GtBpPJdW6qBwFGj/6Y1Sey1Fu1TxiimjIkKfCYohPLjWjgYjff0j6t5Ipqs4r7S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946320; c=relaxed/simple;
	bh=MgsE4PtV+RfOIMHgtG8JgykqpASYXdXzyyoX1qvvLpc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=e2rlkod6NwRXss5vSjlZVd12wt91tr5OdtNiwlobiHoikXkWN7VSIirntkZSqqcyBjbqHdjhhvs8PAbjduGv1BosxcFn6k9gjdZ109CCEp3nKNd8RxSTGmNXvzr+4OLxjgTITYIoOs7xYil56Dg7MR6zqYD4E8IbHtqXTmp9D5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QeQA6br8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmQX/+nz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QeQA6br8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gmQX/+nz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675FVTkY303096
	for <linux-media@vger.kernel.org>; Wed, 5 Aug 2026 16:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	12s7zeFJFQNNc86j7FfCIakKrwR4gPaB2TFmxcgFtPg=; b=QeQA6br849T0GApW
	PmobelB9aQmRtfTLceN976tfrR7II5BlX9oj4FZdxtDJNZT3L52mflmZbn+9EdA8
	3FKRpCO4/9Kc6VvaZYSRZwvWYuMnov+PWlZzcmRs+ahy7uWPEOyCEaGOK8uuiG+z
	WaOmOZSH+jDRQZEGdxTNOCFTgjWX2fcha1YMQI95cxShwr5tV3dE8sS4mnkYLrE2
	bVT6d7Gow45NfLVTtLof2uaFxaOKeyGd8ZldBzv3T7w1mxUdqnNNCZXr5qfZzCFI
	ZTDDJNwthqovjG/UJfMGdIMmFbqBVR+QtfmVCrIWHVLrJ57v19MHmV5TzPoh86Uo
	FJHD6A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuu3uku70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 16:11:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so878116a12.1
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 09:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785946313; x=1786551113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=12s7zeFJFQNNc86j7FfCIakKrwR4gPaB2TFmxcgFtPg=;
        b=gmQX/+nzittnqqfna+2w1ZY52LhGMLi3wvJr6+5hCjZ1naLeivDxkM3SSoy9KKgluc
         w8jpHp9IxPAyasDNIj+1E1i2hgMs4sqXMUBJp8mF/YSH7/RCmmoqi6Mp/IGCz5kmkLaK
         ZfZS1yEeru1JwQWnYndVfE4OYjVh605+WCd3A7IW57pn79gSMipTrFruTQg0DlO9II0r
         IdG2D4RmkbG87WpK/Cxeqci+YjNpY5/HQIjkIG3I//FN2crpvz2cEjm/5+cEl5+2Y+Q/
         t3h0iRUj8pUlJnyMW8bvRxZv1o4fbu0AKQ2YQw4FK99Ebzd+10cyho9WnNmmaYUVunpw
         K+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785946313; x=1786551113;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=12s7zeFJFQNNc86j7FfCIakKrwR4gPaB2TFmxcgFtPg=;
        b=li3Oy60M2uSDBYmXpbRgJxiwt7zjlPUmNbJ+WUbGPPVdGDKrychxgLsnq3bSk8/vig
         5ANmI+axU1kS2rfJyTmsJArVCbzaZZhLAcJEV3c1g/jQSzrBFCGDAorRmTg2m4udBpI9
         UkHqDLNS1OxgqzWUBZbQzVzpF2KgvqTVaMUqWJIGSaVXj5yAsUsV1IUHxMrjEBKzHKKd
         oMYCwJbZ5EyABCo29cjhdTEeI2TMwi4iNRUk2JYWA8ULpE5vXCdbXDbv9DVsj/lo/G3k
         RW61wWtGSjWbG7aRaEIXx4yTtMxdsNQzL11l4pEtCZA/j1W7qs8KV6BR1hD4M3fxv6y6
         Ol9w==
X-Gm-Message-State: AOJu0YyPaV6ivg2BKkdUM80KGNfjVBt+EIw1HD84M8tLCXemDTsl/GmH
	KboLnTRk19qveOdjnMn19S4vmu/Yi+mg6Hb9mLhbSHDYuP8XUG2z4LNvcMRIKd3OKZUf90arwzg
	iPQerv/e1Wn/aFiGmwFKE9cH8uxLpW1kYcWtLmUKXSBJ3DIp2yuTkVmrFsstVCQ2z4wFUt7mT0A
	==
X-Gm-Gg: AR+sD13Z/yvF8NUIz8xSpX9LAU0gX7KW76ISr1WLgLLeEj5Iicm1pQkKu5rHjZRs+B8
	csl444vUZqGflsiAmjPXkFV3+0Da2RLSybBXb71vwMP2MGxw5Nm+B2IMCFW/pl7kS7PvT6OWqZC
	At3YRb8Z0seWAzfUC+Xpxu5C05eTX5nusAGqJd0C3PFinzIZr1sUNAXH/cUwXFei2AWc/Loeali
	O0EMr/3vYGxaWHurBl6RGvEg1W/ThFS8yPhfgLgWKeSummQrIsm+FdaLym42qJ3nGlm3xwQc+5J
	tb0+lp6yEPGXBwaO4w86ENAj7cwst17lAysZYb1bh7Y73YPIxLjAkKzR5IVz3cSOlinRbi6Ru+B
	KGO4kUShzXHchb1luTGwv2sSFcCU6Uj8=
X-Received: by 2002:a05:6a20:43a9:b0:3c3:7e9c:e292 with SMTP id adf61e73a8af0-3cb85f49477mr9574629637.25.1785946313303;
        Wed, 05 Aug 2026 09:11:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a9:b0:3c3:7e9c:e292 with SMTP id adf61e73a8af0-3cb85f49477mr9574550637.25.1785946312829;
        Wed, 05 Aug 2026 09:11:52 -0700 (PDT)
Received: from [192.168.0.6] ([183.83.142.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867a68fdsm29693485eec.25.2026.08.05.09.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 09:11:52 -0700 (PDT)
Message-ID: <ca5476eb-0eeb-177c-9f80-b616f8aff92a@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 21:41:46 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH 1/9] media: iris: translate Gen1 profile/level to HFI
 enumerants
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
 <20260709-iris-vp8-v1-1-6af3ab578a7c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260709-iris-vp8-v1-1-6af3ab578a7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEzMiBTYWx0ZWRfX7kOQH5PD2fty
 AdsDqklRPuIYgZVvhq5qcd9en0Ify2atRXeZqYgYkJBP9sB3ym2PviwQ4gaBY1EdAEebCpf4tOI
 oDn4wGH0YWGXaFmECguSO3gnRBWrVx0=
X-Proofpoint-GUID: PSYhPfRYaN4vhx341SwRy40VOmgGvcHQ
X-Authority-Analysis: v=2.4 cv=B5aJFutM c=1 sm=1 tr=0 ts=6a7360ca cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=HwWiqg1urrzBETcKeqCncQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=L1gT1Ituyu5WA1K9yjIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: PSYhPfRYaN4vhx341SwRy40VOmgGvcHQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEzMiBTYWx0ZWRfX+ct7xUCg0vGG
 X/MmnTyQz8LCWtmyfl2HLPjl/bVY55IAmnjBBuAzQdIvndytn/8v0W4sRrF4xVIc8TXxmXDXHv6
 4teyc40OfI+rKnFtyOQ80gZwmngNHfA1xnQ601pq1uWxiwxTNL0Zr4+s/c4qoUeX4Vzo538iOjz
 Mpe1UDgHYaDNXwmRDIDPvyCMmcsG1PZN/bQArES5RAaubAjicjAXuIHXZfav3l0cv2fh7uTIYwG
 s9YvzA9ORaCzkmh04ZwKoTCmdmPAH+MvY3aN8GmTfZ2l8sVaEspO+lNRNUvVzmgNKDDv82vIr5Z
 aFjEIiv3zb6kfIvSixRCP5+t0ksGfjM1OJrZeskMFkMzbV4CpIO/Ru2Qtz/R+6OzESaXR60Ha6I
 NvXs4wwVKCoK+ivpxHpx5JfEEIHyYpOpF+m7E7nbgtpvtVlXKUlQORiAjXpE+66Ap4aZV67dEnv
 bdCROjchtec4MenTpVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050132


On 7/10/2026 1:06 AM, Dmitry Baryshkov wrote:
> The Gen1 firmware expects the profile and level in the
> HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT property as HFI-specific
> enumerants (a one-hot bitmask), but the iris driver passed the raw V4L2
> profile and level values straight through. Only the V4L2 H264 high
> profile happened to match its HFI value (both 0x4); every other profile
> and all levels were programmed with a wrong value.
>
> Translate the V4L2 profile and level to the HFI enumerants per codec
> before building the property, mirroring the mapping the venus driver
> performs for the same firmware interface.
>
> Fixes: d22037f3fd33 ("media: iris: Set platform capabilities to firmware for encoder video device")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 109 +++++++++++++++++++--
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  44 +++++++++
>  2 files changed, 144 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index c4baabbacefd..ed9fef2aec08 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -479,6 +479,105 @@ static int iris_hfi_gen1_session_drain(struct iris_inst *inst, u32 plane)
>  	return -EINVAL;
>  }
>  
> +struct iris_hfi_gen1_id_mapping {
> +	u32 hfi_id;
> +	u32 v4l2_id;
> +};
> +
> +static const struct iris_hfi_gen1_id_mapping iris_hfi_gen1_h264_profiles[] = {
> +	{ HFI_H264_PROFILE_BASELINE, V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE },
> +	{ HFI_H264_PROFILE_MAIN, V4L2_MPEG_VIDEO_H264_PROFILE_MAIN },
> +	{ HFI_H264_PROFILE_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH },
> +	{ HFI_H264_PROFILE_STEREO_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH },
> +	{ HFI_H264_PROFILE_MULTIVIEW_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH },
> +	{ HFI_H264_PROFILE_CONSTRAINED_BASE, V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE },
> +	{ HFI_H264_PROFILE_CONSTRAINED_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH },
> +};
> +
> +static const struct iris_hfi_gen1_id_mapping iris_hfi_gen1_h264_levels[] = {
> +	{ HFI_H264_LEVEL_1, V4L2_MPEG_VIDEO_H264_LEVEL_1_0 },
> +	{ HFI_H264_LEVEL_1b, V4L2_MPEG_VIDEO_H264_LEVEL_1B },
> +	{ HFI_H264_LEVEL_11, V4L2_MPEG_VIDEO_H264_LEVEL_1_1 },
> +	{ HFI_H264_LEVEL_12, V4L2_MPEG_VIDEO_H264_LEVEL_1_2 },
> +	{ HFI_H264_LEVEL_13, V4L2_MPEG_VIDEO_H264_LEVEL_1_3 },
> +	{ HFI_H264_LEVEL_2, V4L2_MPEG_VIDEO_H264_LEVEL_2_0 },
> +	{ HFI_H264_LEVEL_21, V4L2_MPEG_VIDEO_H264_LEVEL_2_1 },
> +	{ HFI_H264_LEVEL_22, V4L2_MPEG_VIDEO_H264_LEVEL_2_2 },
> +	{ HFI_H264_LEVEL_3, V4L2_MPEG_VIDEO_H264_LEVEL_3_0 },
> +	{ HFI_H264_LEVEL_31, V4L2_MPEG_VIDEO_H264_LEVEL_3_1 },
> +	{ HFI_H264_LEVEL_32, V4L2_MPEG_VIDEO_H264_LEVEL_3_2 },
> +	{ HFI_H264_LEVEL_4, V4L2_MPEG_VIDEO_H264_LEVEL_4_0 },
> +	{ HFI_H264_LEVEL_41, V4L2_MPEG_VIDEO_H264_LEVEL_4_1 },
> +	{ HFI_H264_LEVEL_42, V4L2_MPEG_VIDEO_H264_LEVEL_4_2 },
> +	{ HFI_H264_LEVEL_5, V4L2_MPEG_VIDEO_H264_LEVEL_5_0 },
> +	{ HFI_H264_LEVEL_51, V4L2_MPEG_VIDEO_H264_LEVEL_5_1 },
> +	{ HFI_H264_LEVEL_52, V4L2_MPEG_VIDEO_H264_LEVEL_5_1 },

Is it correct that both HFI levels 51 and 52 map to V4L2 level 5_1?

> +};
> +
> +static const struct iris_hfi_gen1_id_mapping iris_hfi_gen1_hevc_profiles[] = {
> +	{ HFI_HEVC_PROFILE_MAIN, V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN },
> +	{ HFI_HEVC_PROFILE_MAIN_STILL_PIC, V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE },
> +	{ HFI_HEVC_PROFILE_MAIN10, V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10 },
> +};
> +
> +static const struct iris_hfi_gen1_id_mapping iris_hfi_gen1_hevc_levels[] = {
> +	{ HFI_HEVC_LEVEL_1, V4L2_MPEG_VIDEO_HEVC_LEVEL_1 },
> +	{ HFI_HEVC_LEVEL_2, V4L2_MPEG_VIDEO_HEVC_LEVEL_2 },
> +	{ HFI_HEVC_LEVEL_21, V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1 },
> +	{ HFI_HEVC_LEVEL_3, V4L2_MPEG_VIDEO_HEVC_LEVEL_3 },
> +	{ HFI_HEVC_LEVEL_31, V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1 },
> +	{ HFI_HEVC_LEVEL_4, V4L2_MPEG_VIDEO_HEVC_LEVEL_4 },
> +	{ HFI_HEVC_LEVEL_41, V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1 },
> +	{ HFI_HEVC_LEVEL_5, V4L2_MPEG_VIDEO_HEVC_LEVEL_5 },
> +	{ HFI_HEVC_LEVEL_51, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1 },
> +	{ HFI_HEVC_LEVEL_52, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2 },
> +	{ HFI_HEVC_LEVEL_6, V4L2_MPEG_VIDEO_HEVC_LEVEL_6 },
> +	{ HFI_HEVC_LEVEL_61, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1 },
> +	{ HFI_HEVC_LEVEL_62, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2 },
> +};
> +
> +static u32 iris_hfi_gen1_find_hfi_id(u32 v4l2_id,
> +				     const struct iris_hfi_gen1_id_mapping *array,
> +				     unsigned int array_sz)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < array_sz; i++)
> +		if (v4l2_id == array[i].v4l2_id)
> +			return array[i].hfi_id;
> +
> +	return 0;
> +}
> +
> +/*
> + * The Gen1 firmware expects profile and level as HFI enumerants, while the
> + * client provides raw V4L2 values. Translate them per codec, mirroring the
> + * mapping performed by the venus driver for the same firmware interface.
> + */
> +static void
> +iris_hfi_gen1_profile_level(struct iris_inst *inst, u32 v4l2_pf, u32 v4l2_lvl,
> +			    struct hfi_profile_level *pl)
> +{
> +	switch (inst->codec) {
> +	case V4L2_PIX_FMT_H264:
> +		pl->profile = iris_hfi_gen1_find_hfi_id(v4l2_pf, iris_hfi_gen1_h264_profiles,
> +							ARRAY_SIZE(iris_hfi_gen1_h264_profiles));
> +		pl->level = iris_hfi_gen1_find_hfi_id(v4l2_lvl, iris_hfi_gen1_h264_levels,
> +						      ARRAY_SIZE(iris_hfi_gen1_h264_levels));
> +		break;
> +	case V4L2_PIX_FMT_HEVC:
> +		pl->profile = iris_hfi_gen1_find_hfi_id(v4l2_pf, iris_hfi_gen1_hevc_profiles,
> +							ARRAY_SIZE(iris_hfi_gen1_hevc_profiles));
> +		pl->level = iris_hfi_gen1_find_hfi_id(v4l2_lvl, iris_hfi_gen1_hevc_levels,
> +						      ARRAY_SIZE(iris_hfi_gen1_hevc_levels));
> +		break;
> +	default:
> +		pl->profile = 0;
> +		pl->level = 0;
> +		break;
> +	}
> +}
> +
>  static int
>  iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *packet,
>  					  struct iris_inst *inst, u32 ptype, void *pdata)
> @@ -582,15 +681,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
>  	case HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT: {
>  		struct hfi_profile_level *in = pdata, *pl = prop_data;
>  
> -		pl->level = in->level;
> -		pl->profile = in->profile;
> -		if (pl->profile <= 0)
> -			/* Profile not supported, falling back to high */
> -			pl->profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH;
> -
> -		if (!pl->level)
> -			/* Level not supported, falling back to 1 */
> -			pl->level = 1;
> +		iris_hfi_gen1_profile_level(inst, in->profile, in->level, pl);
>  
>  		packet->shdr.hdr.size += sizeof(*pl);
>  		break;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index bb495a1d2623..2702f255bc04 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -17,6 +17,50 @@
>  #define HFI_VIDEO_CODEC_HEVC				0x00002000
>  #define HFI_VIDEO_CODEC_VP9				0x00004000
>  
> +#define HFI_H264_PROFILE_BASELINE			0x00000001
> +#define HFI_H264_PROFILE_MAIN				0x00000002
> +#define HFI_H264_PROFILE_HIGH				0x00000004
> +#define HFI_H264_PROFILE_STEREO_HIGH			0x00000008
> +#define HFI_H264_PROFILE_MULTIVIEW_HIGH			0x00000010
> +#define HFI_H264_PROFILE_CONSTRAINED_BASE		0x00000020
> +#define HFI_H264_PROFILE_CONSTRAINED_HIGH		0x00000040
> +
> +#define HFI_H264_LEVEL_1				0x00000001
> +#define HFI_H264_LEVEL_1b				0x00000002
> +#define HFI_H264_LEVEL_11				0x00000004
> +#define HFI_H264_LEVEL_12				0x00000008
> +#define HFI_H264_LEVEL_13				0x00000010
> +#define HFI_H264_LEVEL_2				0x00000020
> +#define HFI_H264_LEVEL_21				0x00000040
> +#define HFI_H264_LEVEL_22				0x00000080
> +#define HFI_H264_LEVEL_3				0x00000100
> +#define HFI_H264_LEVEL_31				0x00000200
> +#define HFI_H264_LEVEL_32				0x00000400
> +#define HFI_H264_LEVEL_4				0x00000800
> +#define HFI_H264_LEVEL_41				0x00001000
> +#define HFI_H264_LEVEL_42				0x00002000
> +#define HFI_H264_LEVEL_5				0x00004000
> +#define HFI_H264_LEVEL_51				0x00008000
> +#define HFI_H264_LEVEL_52				0x00010000
> +
> +#define HFI_HEVC_PROFILE_MAIN				0x00000001
> +#define HFI_HEVC_PROFILE_MAIN10				0x00000002
> +#define HFI_HEVC_PROFILE_MAIN_STILL_PIC			0x00000004
> +
> +#define HFI_HEVC_LEVEL_1				0x00000001
> +#define HFI_HEVC_LEVEL_2				0x00000002
> +#define HFI_HEVC_LEVEL_21				0x00000004
> +#define HFI_HEVC_LEVEL_3				0x00000008
> +#define HFI_HEVC_LEVEL_31				0x00000010
> +#define HFI_HEVC_LEVEL_4				0x00000020
> +#define HFI_HEVC_LEVEL_41				0x00000040
> +#define HFI_HEVC_LEVEL_5				0x00000080
> +#define HFI_HEVC_LEVEL_51				0x00000100
> +#define HFI_HEVC_LEVEL_52				0x00000200
> +#define HFI_HEVC_LEVEL_6				0x00000400
> +#define HFI_HEVC_LEVEL_61				0x00000800
> +#define HFI_HEVC_LEVEL_62				0x00001000
> +
>  #define HFI_ERR_NONE					0x0
>  
>  #define HFI_CMD_SYS_INIT				0x10001

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

