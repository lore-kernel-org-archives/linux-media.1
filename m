Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76383BF665
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 06:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439423; cv=none; b=YE0UwlG5jWF5A7iGRvdUU9spZLUw02b2YN1c8RVRUCQmlO3nZuGpFMx0i9QFOQVEU8vrT0Xtn6OoztjKkqaUEGZ5JBtmirlErsyUCMmIQMIg9TU1DdOInz+zBHeppjhopXftUPg/hboq5sO8NorWDVhfPrZSbppNgqfISrCCC/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439423; c=relaxed/simple;
	bh=BfxXVYVYYPpqCv3HAvsQt5PI5vltB2Nryb6YiOlFIas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KqFDPpwff7vAJlARPrVbTs/y6qAq8zrX3tt//K4srQYd3h4gavDUhpWGZ39rP3qWYoHoRNo9Q+n2ve04dFq17FmiA8UMzRsSfgDiQgXPNmPDQjy4olDWtTE8covGtYdfy/ZmLRTJJ5zm3mkYmToI0iWu3SsyNQmTvZWXWSpowus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKedmhNF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTSKeg2e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKedmhNF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTSKeg2e"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BVhv1775356
	for <linux-media@vger.kernel.org>; Thu, 8 Oct 2026 06:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mSaIxRplK8lz+P1pRwiYiDK6KGDj44xaxOfHDxftF5A=; b=iKedmhNF6wKBd7Yh
	RKacicca1vCR01Ht3TDScm1DS40cMDTqIX6GJpUQ6yhLWP0Jnjw/VVCQd2rcDjpQ
	aoHvLtd6KAeO0RV8aa9jlJ9bU8Q2uuVygZKmfCiA9J+UwLeYTLgY71+eA60zwLzU
	FHkcUar39nWxZP8z1QnYGWeYM+xOXIhO9axjQDa180J/C/M5ASSA56hnZMCxMSZG
	vobqZ+JNuzgGlu3pJwXM3GMxKB01kUOEyPG1+mArStfvZQzVKmMqQ6u3vaZCBHbB
	t3lFd7UdwclQiTOQxnJhM4OPKHS7ufTvYs164tcmKSCQHUhoE8wytmxs941O0uDX
	jGF8Ug==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39as7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 06:03:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bf4c0af4eso144925185a.1
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 23:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439420; x=1792044220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSaIxRplK8lz+P1pRwiYiDK6KGDj44xaxOfHDxftF5A=;
        b=aTSKeg2ebHPXX8co72Te7wet9M2hOuPggWC+eT7iQxaRouh6b3YzRzkYtm9O6NXeuH
         ZpymmsnOCGsLK7/X6CfUqLqmzNDNJH9oRGNI7fpEFiMi0qhE7lWtZyPDQ/EGmFR+21+C
         EkOgG3nBB5kmWfX11ULk5lUFZvjV7EVtIDn9OgZALGNTdAQO8xTPk3sfaegxc/RSIdm8
         J6/oA1RxnqrYPaAMumHCpvycV1P36GWCnzcLXLOfJ9r+zP3Rp+lC+OjLyvigu4pdF5Ys
         N4nCXL0f3yLh9VvEGbSAc+4RXQ4o7nP/qTzj4/RswpJb8U8g2mUepocHCG5Qg31SB/Md
         H+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439420; x=1792044220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSaIxRplK8lz+P1pRwiYiDK6KGDj44xaxOfHDxftF5A=;
        b=PzCnj1nxMRrJZZZIBx8inE9Uoii0YOnJqAcXuKWTD9FZnlbNqQz033GCg18fg6FJjn
         kxYk7LJOusTOn4njUyVbDHK92/5QV0bBjRv8FGPuO2jS3JfGT7EciOM8hE93hne4aGQJ
         Hy6DS9SgHTznmIWFD7USd+BfLReBZvCg5Tlp2XLeqAfIuTD6OA79KKf6QJJE/Gm2XtQ5
         yNNTqYFA8LiTpHdyBc2gprq4YtfCK16mxViQDB86frxiOdOx613YEYTGgcvM/E48KHJP
         nAymEEGPsN7pw+9pFrC6vDiSxw7DUsKwV+/1EXvEfpLPrppX2m+LE7iRCBNubBJaVs/x
         p5dQ==
X-Gm-Message-State: AFuF++ljg3iEdTmKsnvRkFyF0fslAyF1w6+6LCl4k9egXjrwOp/ci7UU
	A68AukF/8rt9JyGgLSviskC0onKUJQPAnGKEhDGYiZlZRK9dPToeDZz9o2Iotihf3Q10751L9jh
	YJfoqctb8ztNtvyxsBrW3OxAXv39s/m6wWW7SJ90MCUaWnmlm5mjJVZErTwtx6AzNOg==
X-Gm-Gg: AYBFou0FZ4lW1Uj40HsgALgobRgPcjaEE5lBWlyuCgFjdpk4M7N/ueQQLUePEtCmIsd
	3LwmphW2BNXJEyD58CrISRC0sZ51Dk7dfoft96G1npQMZ+DFmZAdMo2zjrWYpw1MHhpipNqjwus
	VwmuuNd4YcSRC3DVXa4wEAgw5w0ST2H0mN4qie1SPbgob59rSltQvAdh/0ZWmf7SYT2Xtq+bKuV
	6sCx9NgXCwHj2RLGURO20VREWmgTc2UzVzHAMR/nf09jxh+r5ernHUBjLowJEcbmlJxNlQmuc92
	3S7WpLtgeFK9U9sYDFpUMkexgzefo/N/mxnhX46vOqlOygxDVXDpEHiOk9d/4VTQb8154A/FBx4
	hm0AIh3H6sumqTXB66IzWT4hiHCzRATJjfUNHcoQ=
X-Received: by 2002:a05:620a:6f04:b0:93c:3863:ff7f with SMTP id af79cd13be357-93eaaab7cb0mr260592385a.0.1791439419745;
        Wed, 07 Oct 2026 23:03:39 -0700 (PDT)
X-Received: by 2002:a05:620a:6f04:b0:93c:3863:ff7f with SMTP id af79cd13be357-93eaaab7cb0mr260588485a.0.1791439419116;
        Wed, 07 Oct 2026 23:03:39 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d10272sm9294896f8f.21.2026.10.07.23.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:03:38 -0700 (PDT)
Message-ID: <f548cc48-9ba4-440e-b673-dc3e6043dae8@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 09:03:35 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/74] media: qcom: camss: vfe: Specify number of pads via
 line->num_pads
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
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-29-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-29-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac7323c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=05VxW_4AGZEvXVWIsKkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfX8Wftb71vfCm1
 cyIBYR5npamozJeiyMYb9/dFn1PXCbbInzf5RA2P+5gbc5CcZjk7XNc5+rXWMe+UFSjeOwxBHdh
 GgAyTvgP6F8E9szJWY7K63fpHlJCMOw=
X-Proofpoint-GUID: U853Vc3MuXqskINsBsdKjAXqWkZwhtbT
X-Proofpoint-ORIG-GUID: U853Vc3MuXqskINsBsdKjAXqWkZwhtbT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfX0NXlaV7OI/Dw
 5VaiRtU6NORZHgAh/XUpEhz46BVuGdcoraqiKkMgwf938YG0x0glcEwGAXMY9K082GIdyS3Ku0D
 st1g2p7M3c9NH7AFrpMI1sTcwAqqZCtpqxRNP/+dQE3draUAPxV0vFwb3P2ezTA3MmI2WeeqLkb
 13DRS7zpu6W9K3pvY5J7+q0apT37NO+hFh+rdQpO3wZ1GdZeuNrU2kACInvcZzGOICX1E2jjEm7
 JcKymSRldI3Iyq+w8Nqlzwm4yuGxpuXgi1YESJ8f2hTlvetWWjPNcRVOLgQad8XjsmxIrkcbEk0
 f4ykIyv1JOANxNZIlAVlehDmj4LQjUOF+qP6sKnTBbzZYQR+Wi/ld+och7s5zymAwDxXNBJfGkK
 tNPsfJxeKmhhGHPcLEp1BFQq1DleND3GNT/al3wZY03dLSTjGWceD8RRyIZFz7MBi5obiRYaON/
 6cElGXCZWHLayoCYuHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080023

Hi Bryan,

On 10/5/2026 8:13 PM, Bryan O'Donoghue wrote:
> We will need more pads to support the pix path - allow the code to specify
> the number of pads via variable instead of via fixed define.
> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 4 +++-
>  drivers/media/platform/qcom/camss/camss-vfe.h | 8 +++++---
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 35ab3203d75af..3fe0139f82d16 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -2050,6 +2050,8 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
>  		l->output[0].wm_num = 1;
>  		l->output[0].wm[0].bus_client = l->id;
>  
> +		l->num_pads = MSM_VFE_PAD_NUM_RDI;
> +
>  		init_completion(&l->output[0].sof);
>  		init_completion(&l->output[0].reg_update);
>  
> @@ -2231,7 +2233,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
>  
>  		sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>  		sd->entity.ops = &vfe_media_ops;
> -		ret = media_entity_pads_init(&sd->entity, MSM_VFE_PADS_NUM,
> +		ret = media_entity_pads_init(&sd->entity, vfe->line[i].num_pads,
>  					     pads);
>  		if (ret < 0) {
>  			dev_err(dev, "Failed to init media entity: %d\n", ret);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 8bc07fe7798e1..8fee26a0dc2e6 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -21,7 +21,8 @@
>  
>  #define MSM_VFE_PAD_SINK 0
>  #define MSM_VFE_PAD_SRC 1
> -#define MSM_VFE_PADS_NUM 2
> +#define MSM_VFE_PAD_NUM_RDI 2
> +#define MSM_VFE_MAX_PADS MSM_VFE_PAD_NUM_RDI
>  #define MSM_VFE_NUM_OUTPUTS 1
>  

Having not documented structures is ok when everything is readable and simple,
but having same structure used for multiple platforms and different valid fields i think
it deserves documentation and comment. But that can be done in cleanup patch.

>  #define MSM_VFE_IMAGE_MASTERS_NUM 
> @@ -141,8 +142,9 @@ struct vfe_line {
>  	enum vfe_line_id id;
>  	bool is_pix;
>  	struct v4l2_subdev subdev;
> -	struct media_pad pads[MSM_VFE_PADS_NUM];
> -	struct v4l2_mbus_framefmt fmt[MSM_VFE_PADS_NUM];
> +	struct media_pad pads[MSM_VFE_MAX_PADS];

Can we group per pad parameters in separate structure in future crop and maybe some other fields we be required.

> +	struct v4l2_mbus_framefmt fmt[MSM_VFE_MAX_PADS];
> +	u32 num_pads;
>  	struct v4l2_rect compose;
>  	struct v4l2_rect crop;
>  	struct vfe_output output[MSM_VFE_NUM_OUTPUTS];
> 

Regards,
~Gjorgji

