Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CAF3C10AB
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 11:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458589; cv=none; b=qB3SojeSurvueyhljDtgYu9pheckkDuOJ375VRjR1Hjbr8HvfAhnyQTgvE/QTIdk3o2HYlMEzZiwb9SW58rYV+UkqxizswAPRXFumr4fKklluds68FbINyPvSohWXmPJDQKhlFlWWUA3dVJ2W8c1Zis8RyuATL4+I/wdrsBTlGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458589; c=relaxed/simple;
	bh=abiO/LiL2o7ZQnpcmnb/LlUFm3gPKmid+91QJ59tZPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OIph4EYompbB8EyALKMRZiyuWROMXct/2evoACV+iQw9B3khD0K74fKNBrLAIRlKzNw+23cY0xLAGcjJJHNse3qhcAsZ9T+HhhhKoIfx+FusOVUPc6fw83Kszt2Ak0O38r+v2kA3/6t02MlEZ1S1FOyRyiuYwTKG/jJF2rjQOMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T1ZF0qq4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c7R33rrd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T1ZF0qq4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c7R33rrd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK8vr2705115
	for <linux-media@vger.kernel.org>; Thu, 8 Oct 2026 11:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	agZ8NifRLOozJsK1Q2H4ch9Owtp/lTg/2FCgMokd4JY=; b=T1ZF0qq45yzmdWLu
	WoS2o77dtaeuWTvudJUWSOkiG805HRPziF8FgR+Qp8r9lK0pOvmuII6BiMT2XvvR
	b9ze5Tuk2va5MOygIOmQvuILVnKa1GHUUhCHpO3Ry75QFHyJJQoP7U784A7exRg5
	t+QySPac9iLLUFql28aFFtjjT7P694mncUaIEo0lqzqFZdVBcxYnCd4KOzO6ViO7
	4rYlW4tgpovDlWPPhpm+v9kr8ZlcqP/Bt1+L8gXryO37oFDLGf2t62ulfItyBrKj
	y9RhzCYzmmBnQX2umQehBUnJa/xS+O1jZRoPQ+WDkpst+JaRNX58JH7ne0FxvAdN
	kpBmgA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2trr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 11:23:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb6391e89so1004630785a.1
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 04:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791458586; x=1792063386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=agZ8NifRLOozJsK1Q2H4ch9Owtp/lTg/2FCgMokd4JY=;
        b=c7R33rrdSteLUlxIoIFMGU6aLCV3hXQliVPKdrXRvXw2pqdbsrO/4W2sg+411QuH/1
         ee5cOj3x/sW+j0nJ2BBZnVxj5c+eaRKdVyAsf8AbXBcFiU7/i7cXn31V2YWezfrnoftX
         oJXYw463pQ5WNsdybDiM4AHj+AssWXY/Gp/UK9IQ8tR7CXDFqsFTWETtrdLEJbQFgaUW
         UtxvQsTpCBvpEniVAQxlT/1k3NMlepSu3cUnfeYAF1Bp2Rq2ZO1deRdwOS3Vn2aJaFC6
         2Ioz6TEO3IBcxcyGnf13tpwZCfF30SZvyBTrV4RAd0661SlLipww6dwcHh68wdTy3UBS
         6ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458586; x=1792063386;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agZ8NifRLOozJsK1Q2H4ch9Owtp/lTg/2FCgMokd4JY=;
        b=T8tGb7w0h0myjmmClhaWI2eg2fsQ+JIVqKpjMUFDke5ISFW53PT3lZEGAaCQek3swM
         0ZL6Xzg1ZkvAfwPTEe0NtcfuSyHrICegrrBPJIY4/kdhth70ywdUeab6hHbifTT1fwFl
         aiXyM8aijO7NHSyIaDoZJx7+iP61P1xhTf5Z548SFfGXZvfG38O9c9jUWOOCLHnYmkG6
         yByuZH5gpgz7KBUdYdATmRm3+yUD2fO78Ak0vQC4GAFV4/Al6HCHJBcL97q1PKWlvh3e
         Cq7EKklZsF3w68kpcEBVqIV/0XamXcJ5tvk6NAQumI+pTOjOI1HNeKy0ot/ZXqfDHQHq
         J2Ig==
X-Gm-Message-State: AFuF++np91Ff9R/xOM7DTq0/H23gxnsIljVHQwP2ejtOecV1vHCK3eRK
	79TgNgHPqNZWpEpIwLGJ+fhyftYNSqkP4IE3eW2/tT3FZ1Upktr3YW/sUsnYEwfuDV8y0X4sPG6
	DwXtshIrNU3u45DKvOuDyvg957BAKrw3gzz81OZtb1U/eu2p0c5JKUIIQ/3XbOExfHw==
X-Gm-Gg: AYBFou10fgZMOvFADtzcSf+geKnuKPsYFp98RwnIbpMeDzCKblESPmnurK2mZDvzsCB
	/3YZBsKcgmP3Tpe5Fb8+QYayJl7c41kDWNQgrmChscVCyaVIqAtG9978jeer0d9XsigxmJGp8ds
	b8BlT5qsiZuvTd1GbeXbCo3unA7WQwv6kPsBbsQLknjGXZ3jsoTw2J8ftutdQLvzkeWSlHH7SFU
	pYm/Nf76VfxoSiQoOu4yctzouY+nneJZYz54R2QI6yNoWx4Mw5tvDH+242+3FzYe8v5S/CTe9ca
	iwjU5XPGpOda86I1Aqd9kpG4tLYYD1qYWLSTdUJPiJoSgjxfxM7ywKfcJnwwglBO9SK+a5WhwAU
	Pcsoi4QjrvTZb7loeSUBkFnQyNU7AyIoLiHhzsz8v
X-Received: by 2002:a05:620a:1792:b0:93e:9809:3365 with SMTP id af79cd13be357-93e9b82b487mr1008021085a.70.1791458586207;
        Thu, 08 Oct 2026 04:23:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1792:b0:93e:9809:3365 with SMTP id af79cd13be357-93e9b82b487mr1008014885a.70.1791458585538;
        Thu, 08 Oct 2026 04:23:05 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71b786d8sm10831159f8f.0.2026.10.08.04.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:23:03 -0700 (PDT)
Message-ID: <7cec7156-e85b-42e0-857a-e590b9e252b2@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:23:01 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 58/74] media: uapi: Add CAMSS ISP statistics definition
To: bod@kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-58-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-58-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac77d1b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=1YEbtdj09zidbz6vPioA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: tCgqZap3XOcoorT6OGAdaKweczbrpjZW
X-Proofpoint-ORIG-GUID: tCgqZap3XOcoorT6OGAdaKweczbrpjZW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfX90s6WCcKaVyY
 ORGkTR5eojc0j89l//iTvQDkE76LUgNOYKzU/orqzFSALmOuUagvwo/hlRNweIU8pnVyUUfQIxr
 SNwf8kLADn1AYjaoZwwdirzlTHKAxQs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfX+49n7S7AcuLy
 JKHQicxo6/EkHOKNSzsn6XolERa7x1EyI7FHI8IywjkZAu34YRWEyPEYaMYFksmb1Aefj6E0t7H
 2ggdc7cE0dkq8u9Kj72RDcbnKCHxPU/KXHrOJt8Bff9JmhO+M3uvDUng/i3XV+itFHx4WRVajvg
 cUizvm9N49++o6bs9qi2WjItj3iAXOq1hi7u0Uo5lVBdKAaZCsXN+PmHPQh7ql0BFqf/w5vrdXn
 snd7XpvmBivzv8n478rFIflMhy5GJRi5Vrzkbqw3p6TZ+pTW5ILjO2ycGaDxPPwPD6qH23SsxQQ
 9erkjfHEeoN2MFAiT8Z/hjGBT5ad9j2ukpoZ82xKXlAs2TMdx0TKprFnP1jpJodE8vpXzbOw0ae
 JUVYZdjd2CNsl2BCf5Z1WP6Jjmj0vwf0LOJiOlv0EvLaTS7rhVfziE9RQUU4Oo6/p9r1KtGnK63
 BeQm4fREzU381uIuAgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080045

Hi Bryan,

On 10/5/2026 8:14 PM, bod@kernel.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Add V4L2_META_FMT_QCOM_ISP_STATS, the statistics counterpart of the CAMSS
> ISP parameters. Statistics use the v4l2-isp extensible format: the driver
> serialises one block per statistics engine into a struct v4l2_isp_buffer,
> each block embedding a struct v4l2_isp_block_header with a type from
> enum camss_stats_block_type.
> 
> The first block is the AEC Bayer histogram, CAMSS_STATS_AEC_BHIST:
> 1024 bins counting the luma of each 2x2 Bayer quad in the histogram's
> region.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c   |  1 +
>  include/uapi/linux/qcom-camss-config.h | 33 +++++++++++++++++++++++++++++++++
>  include/uapi/linux/videodev2.h         |  3 +++
>  3 files changed, 37 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index a2b650f4ec3c3..e5eccb62e76b2 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
>  	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
>  	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
> +	case V4L2_META_FMT_QCOM_ISP_STATS:	descr = "Qualcomm CAMSS ISP Statistics"; break;
>  	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
> diff --git a/include/uapi/linux/qcom-camss-config.h b/include/uapi/linux/qcom-camss-config.h
> index aa3d97cfcc78e..23c12b8955ef6 100644
> --- a/include/uapi/linux/qcom-camss-config.h
> +++ b/include/uapi/linux/qcom-camss-config.h
> @@ -209,4 +209,37 @@ struct camss_params_gamma {
>  	 sizeof(struct camss_params_color_correct)	+\
>  	 sizeof(struct camss_params_gamma))
>  
> +/**
> + * enum camss_stats_block_type - CAMSS ISP statistics block identifiers
> + *
> + * Each value identifies one statistics block in a
> + * V4L2_META_FMT_QCOM_ISP_STATS buffer. The value is placed in the @type field
> + * of &struct v4l2_isp_block_header.
> + *
> + * @CAMSS_STATS_AEC_BHIST: AEC Bayer histogram, &struct camss_stats_bhist
> + */
> +enum camss_stats_block_type {
> +	CAMSS_STATS_AEC_BHIST = 1,
> +};
> +
> +/* Number of bins in a Bayer histogram. */
> +#define CAMSS_STATS_BHIST_BINS	1024
> +
> +/**
> + * struct camss_stats_bhist - Bayer histogram
> + *
> + * Histogram of the luma of each 2x2 Bayer quad inside the histogram's region,
> + * over CAMSS_STATS_BHIST_BINS equal bins spanning its input range. Quads
> + * whose luma falls outside the input range are not counted.
> + *
> + * @header: block header; @header.type = CAMSS_STATS_AEC_BHIST
> + * @bins:   number of quads per bin
> + */
> +struct camss_stats_bhist {
> +	struct v4l2_isp_block_header header;

I think that the whole format is not correct, having header is preventing address alignment 
of the buffer for the stats, as i have mentioned in the next patch copying the statistics
on each frame is not correct, just to have generic statistics format in userspace.

~Gjorgji
