Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055924DBD7D
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 18:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785349714; cv=none; b=SIN50fYwuzsaXrtcG0f+pYnqRnL5DEYv259YhhdkU12d3APLLVlFZLyK+u7X+B7y6umGF5HEdwAKCr4M/7rRArTUYLvsxN+pU5bo7/+T1CehUP6yq1o1jFs+DW6d8yEm2exKMy2UGRXEKqNf9jOqVqaooMchwfVSjtic/LGvMbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785349714; c=relaxed/simple;
	bh=eupjsbxKINcRQuC29F595+o6K1wLkOTXL9fh5anBXX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6lT2HQ1nL/8fC6evC7YakKhvxCpuaeG4t7le9sGjsOYg0uqJOxtVbw0iQ31efmaviWf/LqgAzFMGtAEWmxgkPe3ChZXcJTezoBHPya8ckLEeOLRhr20ewe49mAHPrqnVVbKbGFgGYMiQFbpcbfguzCFK+wufBfVc3f+1Qk8u00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+UjYE6t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fWKXPGZG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+UjYE6t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fWKXPGZG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TIQs9l2540594
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 18:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AnU1zi8FAw41jHzsJAGhK9y6ec/GVYsZBSJFjyj491s=; b=E+UjYE6tKRDqpkD/
	RQfg+U1dEx8FBsE/fUbVM5whZE8WdrPhqNj51A0T41hzrXa15utlAa3z6u9d6m2s
	9vj07rIf9iwNfLSot+WxL25/VpwHb3NGI+PVxCJ3usRsb5wBHHkda/xXKzFtVPT7
	BxZjGI9RBwjBDTcftoIuawmOaJmmMHgIBkX/aor0Z5QiexIvgEFkvz8p/Mu3+Er2
	+36s+1zHy+z0qJ8yM5zul8WhWGhpbU2l2JNWOKSLBBoLT0t5DiJxpNj9iGBiz8PL
	jvNDpmEYkb8lniNQjA8z7c83+gl9em0bE1ZTKSWwbJ6ysyZhVbit7CQ20leu40x0
	EHf2tg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqm0fh556-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 18:28:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe3fa93bso13330091cf.2
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 11:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785349708; x=1785954508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AnU1zi8FAw41jHzsJAGhK9y6ec/GVYsZBSJFjyj491s=;
        b=fWKXPGZGVmhha9rppOsEVciPKdMGq7UO7+I4hhI51mjLJYZ6RZtojVJDlwxOyWx3xP
         SMCt6MV+tdE4gQk3dfbGNyX2yV2DNQBtYyf3RUltkYR9stdbOyIBiVi6dnKRRzNxvwkt
         VtYhlwBoQQrJPXPtww+qM3HgWrSyokUq+gV3oYts6t2jgTyrjmyizzglaiQ2mHiGS/vc
         kCDilpH345CLCQhJWGl7U13B931KdWsB7MkHC+QdZ+mOnOuVPDxueU3JbOf0HQj8hlJ1
         3I8kXp1k1r3b+/mWW4skO0HrOadIjzynkiKsuu1kdUYXpdcykKDw7iYa3+COGyogY43X
         vFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785349708; x=1785954508;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AnU1zi8FAw41jHzsJAGhK9y6ec/GVYsZBSJFjyj491s=;
        b=kxGqqYCF2C30TG7fEnkm4rpEsvK4fCH7wWEDca7B/VZfNvT/Xci3VNfyDy8cDOowuB
         vxFNTyQHiAUhDheoge/NDoZkzdQSPdQE1kVqIIR7AwELD5NpZOkssUJj+TlRqhKMkKJv
         kY99c7KQ3AzIv/LvThC77c/1pGwe0dQZANWgWPxsplfZmu3UNj0fAuIPxrU50/kcprpH
         PFPfq8bzdu55Gk+JvsJ+OcfpYsCWptPUX01CdzWgBGlUNCY8RM/1yEHZKKh/CGBmPVPM
         fRJyBgWbT2iZL9sp+Pg+H8cxHvbZQ8go2wGETLo2BEH6ap3F0mDultDqdJOeOmJxhkRl
         QtKQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCjX0RJqui+nm0My1Px0ZO4DZQCBImLVQnyRfZfSzcVC3/8BXIaabGKqKGrjH3O1OAkio8YzXFon5Ssw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuHZ8RqhwOqybSsqRpetX6lchrrUxU+29uvFr0sL7E98XafAUH
	nRiHMxBvroFBpHrFiGlhV5ZwBnOsBkwVI0DEdXXN7fph0TcAS8ESyvCzc88pMn6H1n7xZsqrAKH
	UB9xQu9oQgNpBiwDco9IW5oRv7rDs84nIF8lMdfY1mNkvWqTgi5339tjq1ZRB3GQYNQ==
X-Gm-Gg: AR+sD13X9YzXdxex+Fd1bDMLiOwUcHVXIei/e+RTjmk8WuCj/ixRMBGgNt8YQ3Rou3N
	6Y8nLqTVBwnQXEf8Mh3bvmxbOpiSGxEgGYRB7QcoDGT3L8ae0d3NNb6e+bmveU96V+g4SuD/iYI
	pcKSgzIKyPqO0TO4Vt6XpRG4czzksgMHoVO22LJKMLxsNMY86fQgWREY5MqOwFSHgLzhwG9PyWW
	1Ak+faw7EvBgHHSWMxdDTfs8bgpKVVPGFZjz4uX8XSus2n5vdSgm1OBSdBJVV3kKOf7nIg6JSDG
	yi/8zBI91MapjtwGPu1h4D5JcksuMKtSggF1uD2lTn9+9IUCKjWvLVqsG3Xv7hG7IcBwYNtQXJc
	qaEggOgIH7HiLrvh5oFNQjxW2i9AAwvuWDfRfyaYF3ledYGXBMQ45vOQH2NuYbs8AwatFDZ7u
X-Received: by 2002:a05:622a:2b05:b0:516:df62:bdd2 with SMTP id d75a77b69052e-529d70e2ed5mr75381691cf.55.1785349707676;
        Wed, 29 Jul 2026 11:28:27 -0700 (PDT)
X-Received: by 2002:a05:622a:2b05:b0:516:df62:bdd2 with SMTP id d75a77b69052e-529d70e2ed5mr75381341cf.55.1785349707118;
        Wed, 29 Jul 2026 11:28:27 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49764d777afsm92277955e9.4.2026.07.29.11.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 11:28:26 -0700 (PDT)
Message-ID: <e50e3859-0343-4795-a564-757ac58f6cbe@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 21:28:23 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
 <20260724-camss-isp-ope-v5-1-e70ad4fa39ce@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20260724-camss-isp-ope-v5-1-e70ad4fa39ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5BwuF1z3V81Y9dp4uGWq11KbzYjqXcC3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE0MiBTYWx0ZWRfX4ZfQW34PowZJ
 3/WzrSvQnZAoHgFEZZs7hyNBgxWmJ659DYwwJYL+u1+LJ96dNJzj00TnyCyHUSlD9X311j0W7u7
 7KRj3AvYs55n/4h6WJREXClNf3WE98c9vgPIcxZSnb31CC3RruKhk1BS7DkGOjgrp5zM/XZjcwU
 7na6jqJX9MAMXmHY0JwgiZ31ISx8m0zyp/85ZALBHIzR9OwOjqK8UZtpb3mg5W8emOGG1FdLRbp
 M/jEIw38/1VAqIBjzARi3i4InFZnWzQi/ZVPShRgj94wz8oc+jGwc6AjRWojmKL0bxka/Q+kSDi
 Zt6Fto/cyi4orpvpW3eL/teTz7OrO6O17RSQk863+BcmPJ+6h2rA4ApcUcL56IXsNri98nm/FrI
 u9AjiZz1Rl7IOl3lRDrg0L7nXKRFHZq+g8eiiPItbRTGP9nij9BiKcuQ5BA7bzIHrVwh30aBUtV
 n4X9uHYFzDg+7v6ezGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE0MiBTYWx0ZWRfXyCDA+IdObsPI
 TWiEZ/Njbe1aEShl4tB19Xxf77ApVzvBEUjbINH93ciU9efm3Uso+8Rx+aVvsiYalC3n9sZvyuP
 DvDzfFGWIpVpjRS73iVX1yc93FqoGU8=
X-Authority-Analysis: v=2.4 cv=LvuiDHdc c=1 sm=1 tr=0 ts=6a6a464c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cfCy20KhcoV1EizUSHcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 5BwuF1z3V81Y9dp4uGWq11KbzYjqXcC3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_07,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290142

Hi Loic,

On 7/24/2026 3:42 PM, Loic Poulain wrote:
> Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
> Qualcomm CAMSS ISP parameter buffer. This format is used by the params
> video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
> ISP tuning data such as white balance, color correction and chroma
> enhancement settings.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>  include/uapi/linux/videodev2.h       | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..7b6e9a9a514f037190d55d59409dd6cc97522943 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
>  	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
>  	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
> +	case V4L2_META_FMT_QCOM_ISP_PARAMS:	descr = "Qualcomm CAMSS ISP Parameters"; break;
>  	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index add08188f06890182a5c399a223c1ab0a546cae1..011026194a20cde22a374e6fb2570cbc6bced230 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -888,6 +888,9 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
>  #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
>  
> +/* Vendor specific - used for Qualcomm CAMSS offline ISP */

It seems that this is generic format for ISP parameters, can we update the comment and remove offline. The proposal:
/* Vendor specific - used for Qualcomm CAMSS ISP */

~Gjorgji

