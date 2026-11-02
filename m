Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625516;
	b=tWxcOBvazrMbNECmX4tuGoY25a9jhy9AHpq+R0wKpNdkI3jV68CG89AqY3cua9sWmVGt
	 JkXWg1EwolRQEL97KMm4p335NwGmSTLh/jzHsnBsFnfBmJtsPpbLjhva3J+wCfA26S0e9
	 AgJYcez9Z6Epw/Asoq9La6yqpIp0HDZ5kpl0fUAOshPs6J+Rqs4Gbv2KNd9szvmhVUqLv
	 83+ieUrCniQk3ETnXxp/CHnDUFN1n4Jr3ZnzWUPWOgDbFTT+P2CIOdNRVWX/7C7XATN/E
	 BinwTqPbn7PNuph9RuXdDeFrfGmU3G8/YN5/QFdKcMj08LCeprPyR2KLpLsXlYGG2HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625516;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wENrlcnx/TfX13LE4fmrSq6Sfd1Kg83k4NkVHnz3yWc=;
	b=TojO97oGal0O9LOMZMhwc9pGKPmbyGmyHUhQ3FGX/vY2mPkgTsZL4CID4kP/8eVP0B+i
	 bbWWRDPVKoJlqdCKPpfCaF4rHHdXyLK2hnUNVwAN3yfJo8fVV6+0omI8P2EzsOjxkHBvi
	 +OE8u49kIJ9ebHKIGUydxYKLffmxViPgYZjjN/aoAOu/pJ0AlaCZHZ+1uBD5r0Pl8jngO
	 k3kiZdXf/I2LXFW5CoL2LNMB5uwFgoAYWmUN/rnGXkpIFplF0oxjr5KB34/c6MeGR5HFA
	 B2ReIwNyZjA9KHToZ8vH+qHBBFQkIvdhI3sm5W65NNWR9h9ZWoqEItBnk3xznlmciiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JAfho2OI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G0e8fJIq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6982E606A32C
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 13:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6982E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JAfho2OI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G0e8fJIq
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DALZS364506
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 13:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wENrlcnx/TfX13LE4fmrSq6Sfd1Kg83k4NkVHnz3yWc=; b=JAfho2OIO1VS6Znz
	do1h73Vq4cioW0TO68GheEso+i0lhSG/eJSiveij9JZ0IEY0tfSRLr/KTnXZdT19
	jj+QWDf1cKBAtmLdJoNAG5f0Ov3/qQeKV6pinJ5MYshRQFzROLssCmIoFnRGA2ta
	3Ohrf/KxYZZdC0bhYumFSNBYuIEC+2Rni/gozwMYYboy3O2Y+EmHum2vRSHeJy2e
	6ZBh0+gwf60HB84h5pxk/GpmR19d4wSuUAgEr+R4q1LQ3kE9h7B8PVWkq9cwccOz
	2sOFI0SbIoHvPMpPMeZN3IjARoLBlj1qh6AXL+SdrTJm3ZEH9nG/XZU5KgHlq1Gn
	h2CNDw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6revm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 13:18:35 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b20a4b5f2bso739288c88.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 05:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625514; x=1794230314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wENrlcnx/TfX13LE4fmrSq6Sfd1Kg83k4NkVHnz3yWc=;
        b=G0e8fJIq+aWUaHHIH6l3pbYLjlbnMxlhA8rVnREJJCame4jV+b1UUSeMGhpu64aUEO
         KIg2qJiQhkg3Kx8XxklwJ4JecBzH+FnHaBz8dVEH9JqpNIYhUAJ/BrYL3RgSstioPyFr
         7jnxrpNt0e0UqkoytOrVA3l9lf+ogqY5Bpc5+puD/tnDMmZhmYA0/+uOhm2BsciUHCFu
         S96oUCpNV43O+UoD+XzyNhJyT+PxdR+MmiLA3ocGqK9fLO5TnCj9hm/ns6ghvsYa1dJJ
         W9/cnJyBZ94tJn1oSLIPAP6rLOOi/ZZEch6pJTAumEzNiOLGoYYRVDnW5OaXtfulKeqe
         MoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625514; x=1794230314;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wENrlcnx/TfX13LE4fmrSq6Sfd1Kg83k4NkVHnz3yWc=;
        b=UTpIQQO5lLAX9p07+Db99JGzrLZHWMP4TWbSCtWgeUFwJEWtR1VvEhFU7SaWGFy2tq
         UXt5zoUJniTA5SDlVyXhqibG7GI9USCJUYEbzTF6OuSRDLr/CiqSbLFgB+mG39K4+WaT
         vLacWe8vNHkTL52bJ28eduTSwwbcYnPqYKvQMPveYT0s4iqeRyiCFTtEI/plZgESmvUa
         Q7WeQNEvUHCpcnoN9+8E6CZhX/xsIc4xkNuTV09GecPhhIIS/F2TGdGFma0V3jYG6oQj
         zC3LiTAswrwKomTbChqjY1VMUTLnquifZs3WBaoJ/iiPLy8U/1Vh738Me8OsSQpGxVQZ
         fvRg==
X-Forwarded-Encrypted: i=1; AKwUvBwekdAnrxV3ptds8wu2uGpyf53UDnEBJS1WhzZiK2CmByJ6FtLz2HSk7RBwaLe2KieUT+pCS04dnj+mIA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJBpbDsixf/10x5iU2bBYC4517KXjMYxNKwpUrx44qrK31Al2GV
	v0/UUyS0Ba3YqHcdOL6V69vgYhqYg2OeWBuZiFtzyg9oFeB89pPQS63RJmszqSw4cwRz5duvqny
	aQhU0ztIdZbgWjpP0FOyBWMR3icqQBHuHrJlc4iTWHwuQMjCGDctI0zlAvYyjIn/OGA==
X-Gm-Gg: AYBFou1414/EKLqUo3xIiKudzU1uZALNUvfve5SpQQ0OnWUdg7QQUC+maEHuiIp9VP6
	UoXc8l5JsWhGJiLOoBxUqJkhTo5dZBd9+pockUHsb7qjk5Yr52ceHKyBymukUbIoygUBbBKofJp
	GLMKUAxa45Qqn5s2lgR3cEbyLUR2EXCAiE5o5jg9EmuqxnSvjc4oBobJjMIIVAzsvkSNimdksit
	X/gO4LH1F1uPFauAopvQwLKt7SyyQkZOQTQlV8RUxc1P3mcsCe3oKZw2tTJ88YfE3BG7vpQBz7F
	O0Zp0KratonbndpfvZQ4BZDreoO8DSq73EhyjB9F7W2eHhbdKTErLdJTesZLnHX0OW6bsRrZfRa
	ggNcMNNwejF2PQbyJNXyvxD3zzNfZHmz79jyq6O/nDn/kMxrhDCt18BW8Nkf5qDIsPReh+8fYAA
	NGrkDc5w==
X-Received: by 2002:a05:7022:eb44:10b0:186:5b49:90d8 with SMTP id a92af1059eb24-1ac5782fd31mr16463750c88.4.1793625514099;
        Mon, 02 Nov 2026 05:18:34 -0800 (PST)
X-Received: by 2002:a05:7022:eb44:10b0:186:5b49:90d8 with SMTP id a92af1059eb24-1ac5782fd31mr16463714c88.4.1793625513450;
        Mon, 02 Nov 2026 05:18:33 -0800 (PST)
Received: from [10.204.101.201] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1a16sm30918429c88.1.2026.11.02.05.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:18:32 -0800 (PST)
Message-ID: <366b19af-326f-424d-987a-bb0fb77d3665@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 18:48:27 +0530
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
Subject: Re: [PATCH] media: iris: Fix VSP clock calculation for high bitrate
 streams
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20261006-fix-vsp-freq-calc-v1-1-53532d893852@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261006-fix-vsp-freq-calc-v1-1-53532d893852@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX7xB0Ux40qt9h
 aRMab2L2kQHEdEGOT1UJkPnDC20RvENlEGfNSdXP/MBAxxcEKmc08izX4IDJXuTzw5futCfsYsZ
 Y5CQ2EPMTqVdvQq1sWB3Ru+WQixdEZPDOmqw2khkJZacIcrMiQmUdAQY4NOlPAWaboLJFy54m7O
 nOcQNDrPeIDNs27MEmSNJx4KVCKY5lfxKKFQi4gpixtR2kj9KBgEF75jCICaum02EyPD1DVJQC0
 ORUqnkJH4FtxLId719K4QFin1SihbPmLLZkt2WW5CGCWk5L7ZutCrrsqgNPpDW8EfFvSNzNOJJh
 6aY4Z0mvUxpgWYsnPhVA54mbShevOXJs++ktg4eHUUS86Bbo2mjAlnMwI4yFWKbR4fKQPAZZWKm
 SEMbdcZlEaONMQIcWMl1FZrKmLJih90tDlriJeTjj3noGGPKXDCuSrbA6t2oTRmaZ1FVpK2FtcV
 o9pbaLFFbigcO+9pTuw==
X-Proofpoint-GUID: djh-dAHkYUNcIsnx9UIqLzx5PXBzIkTx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX1i7KZ+FVKIRA
 VjrfonH2F/pcVw8NlGrU9qLP4LSKRaKNWCLcTSKV/QC7qlv4JeO8Ojqq+pJfp9Tf3av9oGe8kFt
 Phbm7o9JhugcRPltpi7DUnqC7R3Bcts=
X-Proofpoint-ORIG-GUID: djh-dAHkYUNcIsnx9UIqLzx5PXBzIkTx
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae88dab cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=actxAcgqoPy2R-xb-rkA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020052


On 10/6/2026 1:46 PM, Vishnu Reddy wrote:
> Frame drops were observed during high-resolution streams decoded at high
> bitrates, as well as concurrent decode sessions. Analysis showed that the
> Video Signal Processor (VSP) clock requirement was underestimated for
> these workloads, resulting in insufficient clock scaling and reduced
> processing throughput.
> 
> Update the VSP frequency calculation to more accurately reflect the
> processing requirements of different codecs and bitrates, ensuring that
> the requested clock frequency is sufficient to sustain the workload and
> prevent frame drops.
> 
> Fixes: 82b96a8d8d6e ("media: iris: Move vpu35 specific api to common to use for vpu4")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 29 +++++++++++++++++++++-
>   1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 243bd845349f..c4762229a1de 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -454,11 +454,32 @@ u64 iris_vpu2_calculate_frequency(struct iris_inst *inst, size_t data_size)
>   	return max(vpp_freq, vsp_freq);
>   }
>   
> +static u64 iris_get_vsp_ref_bitrate(struct iris_inst *inst)
> +{
> +	struct device *dev = inst->core->dev;
> +	u32 codec = inst->codec;
> +
> +	switch (codec) {
> +	case V4L2_PIX_FMT_H264:
> +		return 150;
> +	case V4L2_PIX_FMT_HEVC:
> +		return 140;
> +	case V4L2_PIX_FMT_VP9:
> +		return 70;
> +	case V4L2_PIX_FMT_AV1:
> +		return 100;
> +	default:
> +		dev_err(dev, "Unsupported codec\n");
> +		return 1;
> +	}
> +}
> +
>   u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size)
>   {
>   	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
>   	struct v4l2_format *inp_f = inst->fmt_src;
>   	u32 height, width, mbs_per_second, mbpf;
> +	u64 vsp_ref_bitrate, vsp_ref_freq;
>   	u64 fw_cycles, fw_vpp_cycles;
>   	u64 vsp_cycles, vpp_cycles;
>   	u32 fps = inst->frame_rate;
> @@ -485,7 +506,13 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
>   		vpp_cycles += div_u64(vpp_cycles * 5, 100);
>   
>   	vsp_cycles = fps * data_size * 8;
> -	vsp_cycles = div_u64(vsp_cycles, 2);
> +	vsp_ref_bitrate = iris_get_vsp_ref_bitrate(inst);
> +	vsp_ref_freq = inst->codec == V4L2_PIX_FMT_AV1 ? 533 : 444;
> +	vsp_cycles = div_u64(vsp_ref_freq * vsp_cycles, vsp_ref_bitrate);

Please check this for encoder if it is calculating the value properly 
considering raw YUV frame size.

Regards,
Vikash

> +
> +	/* VSP FW SW offset */
> +	vsp_cycles = div_u64(vsp_cycles * 1000, 1055);
> +
>   	/* VSP FW overhead 1.05 */
>   	vsp_cycles = div_u64(vsp_cycles * 21, 20);
>   
> 
> ---
> base-commit: f0406245cb9855e6318335a8a223551354291a46
> change-id: 20261005-fix-vsp-freq-calc-19b967b79e62
> 
> Best regards,
> --
> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

