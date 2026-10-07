Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FCC3CB54D
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 11:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372366; cv=none; b=Zk/SQq/1h2ONG/jgTSjR1wdh2BT5C9NsG+0KBUDyUXis6SyEw9jt3ubtTEqwtmkI4p/cxH8OaEiS8KVTonmwVpb3sXgKL+VNUMl6Ny8QvQdGApCk/b3tCfsWRUt8CG8tuEvhSsbSIM6ptQIt5WjIPEvZijetJgAY1OrTIWt/Ozk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372366; c=relaxed/simple;
	bh=KJnbpRVIHloDGfDhE5+fXC557tLNYH9I8hBo5WFW5oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d8LuV4JQIdkoG8ygwqdbH/bdLfdexAIZU2H1kZ706YP2MYTRiwOoxZfEwWE5NF6wjhRXEksxbUcsAydrMzWbog30TmsDDm4XEagiFDXTXo4A1X7FAlGKaNTN6wcZiRt+WzDb7oKFwP09z4AyrTLhkvTjE46J5cpSHu4qaZmMIgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hbZWwd4f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmP+NVpP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hbZWwd4f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmP+NVpP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jj0I2970129
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 11:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	asNdnnn+jFtAWyz3FKWehQEy/53BJ1c+C7uY4v6X2c0=; b=hbZWwd4f45taM7oR
	1t/YxBlNIjROoMvoLxe0gQSim8xIGFobL9WRamvq9/R82/Y+TltHr2PAUJJ0H+Cv
	HaL084GfrENxafIPOUFc2pdpG79at5prnlP3qor8IIp+/Q3knXd+NIcsaOvQtZky
	zdaYb4wf7K6GAnlGUkcOCufrBOLB/oHIKlWJ7QlbxIWyj7OFQ85TPvCIuWC6W9ih
	BfA/WJxsIJfFX9k4oBIXuy1Vk+53Hr/pWqE+XkCjZfEcEXj6HvTk+uJOPVp0CFnj
	7mg0WpoTEk5zoY25BTy1NK5oDKltaas/XPKjwVkr9eJbsoN332Qlc01uvfon59mY
	8ggRLA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c679td0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 11:25:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so723230785a.1
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 04:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791372350; x=1791977150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asNdnnn+jFtAWyz3FKWehQEy/53BJ1c+C7uY4v6X2c0=;
        b=NmP+NVpPdBbaX2cVfdXdzxrka2cDUDvdHC1RUFYmd4mIbqzzweVd3sNy8Pwl0j7TJy
         ULgN0s9vqLk/ALfXvXu3CZwjNq+yVz8XLrkJ2BE71PcQ7J1dcvS01a7RDwH7wqIUef/g
         u91ebadgbSpi8CtwHsfEj5h5AFSgt48Kx/6pYPK6/HCzdZuQx+uU+PswtNXSSa+4iJLu
         PrzKweXkb8EtwVJbAf/phbRyqbQBree8duSlNGL+IouBTsHHjiRIEXl4mNBUe9nVp9HB
         iQj58LPg8ytIy7uOymLtsvN/SmwNCVz/KxCopPQCk7LTiuiMmXzcPVbyh97OHFYXEysQ
         FVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372350; x=1791977150;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asNdnnn+jFtAWyz3FKWehQEy/53BJ1c+C7uY4v6X2c0=;
        b=DAG91W2qNZ4+wnFFXOzQ/zbgkk0fthW+Jra2Oc+Wx8u2DxSLqAyJqXquNcVVDexcec
         2ephFV+ZheUs15xbDQj+D5YzW/SHG9NZhOjdhb64M+9VzRf1+zwbY2Pl/VmVypKj5d3T
         neFi3FPyZc0UtkHIbyxzHbI9vW2DPDSzuGxVOsX5OGorxxsd9pvyD6cBFfYPlqJl7k+N
         ZtW+KgOqlDA0JhDioR+Sqj4F0jWndbbVUh+AuaIcMOlnXrJFwtvxy03LkIhHaIL3IIrq
         Rvja9FvA7jwhDlNmH95rZ855KZSai8Ya8J7c4bq5dcDzMWWlQHnhTIDocb+3vsWdvGHq
         yBRw==
X-Gm-Message-State: AFuF++kBpp63I3yxMZkkCvSh6+LWp4cou3wUlxYKT9DBvgA9X+LNq/3r
	s+MMsLagO6LJLmUX9gSpcJiYesulaviWq0RjhyvTGdrpwhbijIeDxbx5wqTfVDD5CM3rduWG6Sw
	W4AXLnCKerQ/PPENJWRLYphJ4hURvGbA/QdWYnZ8XkaVtCpxF8msB1w4mpEut6q0leg==
X-Gm-Gg: AYBFou0edCE0LoP5HAZc+jZEQoKMaHG9VvH5XHbSBPOCB0+CUwhzqdhM/kWpF3h2yOA
	nS+YPux9cXx+D4USdGV3d/mNdHy8MyNCRvPUPmsRincyRIRNM1Wzn8YcvAkzLDAR5P3VRjJeVVg
	7IWuYAM9mzTvDX8Bbp5iPuCqckQD0EcZ4cgiKGVyFrZzlT44yoY8ph1KP6RXGxzjaS93ts5OQbU
	L3CU/CnS+OlrdE2QsXqtjWdM1Bz5/DqGyGx7MEXCEcIjqcPtXghQ1BvuT4FZXn2aQuCr11t3lKJ
	CbGODMyO6Cn55+M0TSNitEzv0uwxhxBqtW+OW9lYeSE28RQkh1avdFuU8zI/RwBqaFX/DUAAEXJ
	M6zVNWS3DuThaoU7pgiLAlksMOvOArqFJaUENX4t4
X-Received: by 2002:a05:620a:40c4:b0:93c:ba2a:6c03 with SMTP id af79cd13be357-93e9b71c7c1mr368521085a.21.1791372350076;
        Wed, 07 Oct 2026 04:25:50 -0700 (PDT)
X-Received: by 2002:a05:620a:40c4:b0:93c:ba2a:6c03 with SMTP id af79cd13be357-93e9b71c7c1mr368493185a.21.1791372345970;
        Wed, 07 Oct 2026 04:25:45 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f4482c4sm111196265e9.0.2026.10.07.04.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 04:25:44 -0700 (PDT)
Message-ID: <647cdc36-d6ba-407f-9eb3-f3b34ad9df4d@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 14:25:42 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/74] media: qcom: camss: vfe: Add helper
 vfe_bus_v3_packer_fmt()
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-18-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-18-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfXxv5L1HsOt6QY
 pQJpm6BIsiMsQzALA5Ou425/sAtYbg7aVs/Nv7bI3J4UEuAxYHuBSd20WmfkvW2BlvOZSIWxqde
 ZiYOMpiabG8F6i/mvt/kqKsGhykA6WE=
X-Proofpoint-ORIG-GUID: J4czFSJGJNknco4XwvqSCoKyEztESXUS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfX2wFXHVFEIBD7
 EKd911Pur4Dyrd39SfdtNYgc6YRArP7pPOWCeJDXOrN1dLAL3mJMJCH8mzMLhBNu2mdPEe8KT0n
 wrVEjE6jzsGccsz+lX8ezHEWTOddxWa47AFkVCVmVVL1Q5+JSKxv+g1gVU7DnXp6C5AuZe8rsOZ
 bBthTwUqAZY+4+QxnUCmc0lHcJUSy1p+rXpZ/lR9+5JIb0Cb15IW3GQb1Pn3H7AkwxtJUXPYIWk
 KCxedrETIme4iYiuNyRd1sB7iRDg1B1jMqAJaCwYALZPhHpMfSLHbakcWpezqmC/bDV42yAfavX
 bh8dL4myUR078GSrtuzFexXMu0XslmlSKsoiefCKD17HYw9H1zWGRJK6Ra5a7nSMabM/joKNmg8
 hrOwUpZjNMSZsMFiunrIQlX8b5crigvYQImddtsHyq/kpZhh6AfbSabBPtCRTVQJZThxLJXqorB
 4RWfoJ9pCL5IjvGGPMw==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac62c3e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=F-lHOqjDzm0Mqe-WZYMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: J4czFSJGJNknco4XwvqSCoKyEztESXUS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070045

Hi Bryan,

On 10/5/2026 8:13 PM, Bryan O'Donoghue wrote:
> vfe_bus_v3_packer_fmt()'s job in life is to translate a given v4l2 pixel
> format and plane into the appropriate bus packing format for v3 class
> hardware.
> 
> Other versions are currently not covered.
> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 53 +++++++++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss-vfe.h | 32 ++++++++++++++++
>  2 files changed, 85 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 5b5201b55a485..c95fe5b0b05fc 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -370,6 +370,59 @@ const struct camss_formats vfe_formats_pix_845 = {
>  	.formats = formats_pix_845
>  };
>  
> +u32 vfe_bus_v3_packer_fmt(u32 v4l2_fmt, u8 plane, u8 align_shift)
> +{
> +	switch (v4l2_fmt) {
> +	case V4L2_PIX_FMT_NV12:
> +	case V4L2_PIX_FMT_NV12M:
> +	case V4L2_PIX_FMT_NV16:
> +		return VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_LSB_MSB_10;
> +	case V4L2_PIX_FMT_NV21:
> +	case V4L2_PIX_FMT_NV21M:
> +	case V4L2_PIX_FMT_NV61:
> +		return plane ? VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_LSB_MSB_10_ODD_EVEN
> +			     : VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_LSB_MSB_10;
> +
> +	case V4L2_PIX_FMT_SRGGB10P:
> +	case V4L2_PIX_FMT_SGRBG10P:
> +	case V4L2_PIX_FMT_SGBRG10P:
> +	case V4L2_PIX_FMT_SBGGR10P:
> +		return VFE_BUS_WM_PACKER_FMT_V3_MIPI10;
> +	case V4L2_PIX_FMT_SRGGB12P:
> +	case V4L2_PIX_FMT_SGRBG12P:
> +	case V4L2_PIX_FMT_SGBRG12P:
> +	case V4L2_PIX_FMT_SBGGR12P:
> +		return VFE_BUS_WM_PACKER_FMT_V3_MIPI12;
> +	case V4L2_PIX_FMT_SRGGB14P:
> +	case V4L2_PIX_FMT_SGRBG14P:
> +	case V4L2_PIX_FMT_SGBRG14P:
> +	case V4L2_PIX_FMT_SBGGR14P:
> +		return VFE_BUS_WM_PACKER_FMT_V3_MIPI14;
> +
> +	case V4L2_PIX_FMT_SRGGB10:
> +	case V4L2_PIX_FMT_SGRBG10:
> +	case V4L2_PIX_FMT_SGBRG10:
> +	case V4L2_PIX_FMT_SBGGR10:
> +		return VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_10BPP |
> +		       BIT(align_shift);
> +	case V4L2_PIX_FMT_SRGGB12:
> +	case V4L2_PIX_FMT_SGRBG12:
> +	case V4L2_PIX_FMT_SGBRG12:
> +	case V4L2_PIX_FMT_SBGGR12:
> +		return VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_12BPP |
> +		       BIT(align_shift);
> +
> +	case V4L2_PIX_FMT_SRGGB8:
> +	case V4L2_PIX_FMT_SGRBG8:
> +	case V4L2_PIX_FMT_SGBRG8:
> +	case V4L2_PIX_FMT_SBGGR8:
> +		return VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8;
> +	}
> +
> +	WARN_ONCE(1, "no packer format for 0x%08x\n", v4l2_fmt);
> +	return VFE_BUS_WM_PACKER_FMT_V3_PLAIN_128;
> +}
> +
>  static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>  			    unsigned int index, u32 src_req_code)
>  {
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 089f525b98cf5..98d403a71cf95 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -56,6 +56,27 @@ enum vfe_line_id {
>  	VFE_LINE_NUM_MAX = 4
>  };
>  
> +enum vfe_packer_format_v3 {
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_128 = 0,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_ODD_EVEN,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_LSB_MSB_10,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_8_LSB_MSB_10_ODD_EVEN,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_10BPP,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_12BPP,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_14BPP,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_16_16BPP,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_32,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN_64,
> +	VFE_BUS_WM_PACKER_FMT_V3_TP_10,
> +	VFE_BUS_WM_PACKER_FMT_V3_MIPI10,
> +	VFE_BUS_WM_PACKER_FMT_V3_MIPI12,
> +	VFE_BUS_WM_PACKER_FMT_V3_MIPI14,
> +	VFE_BUS_WM_PACKER_FMT_V3_MIPI20,
> +	VFE_BUS_WM_PACKER_FMT_V3_PLAIN32_20BPP,
> +	VFE_BUS_WM_PACKER_FMT_V3_MAX,
> +};

I think all wm configurations should be separated in separate bus or wm
abstraction and move those per version of the wm/bus.

> +
>  struct vfe_output {
>  	u8 wm_num;
>  	u8 wm_idx[3];
> @@ -315,4 +336,15 @@ int vfe_enable_output_v2(struct vfe_line *line);
>  int vfe_queue_buffer_v2(struct camss_video *vid,
>  			struct camss_buffer *buf);
>  
> +/*
> + * vfe_bus_v3_packer_fmt
> + *
> + * @v4l2_fmt: v4l2 format
> + * @plane: plane for the given format
> + * @align_shift: bit position of the PLAIN16 LSB alignment flag
> + *
> + * Return: the bus packer format for the register
> + */
> +u32 vfe_bus_v3_packer_fmt(u32 v4l2_fmt, u8 plane, u8 align_shift);
> +
>  #endif /* QC_MSM_CAMSS_VFE_H */
> 

