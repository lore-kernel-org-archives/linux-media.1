Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025281;
	b=LALutksuFZXNbp84gTn11yP32KJebytFcqgWMo2uPeoBrVdrg4GzCbMgx9ii/PTYE0FZ
	 k9bJNlNfouRvEARgjVUjuE6KRV6sO24dGj99Pgsc+p32mJ7+W/KuC4wwjXNk+PX4b1eck
	 skEHr5GAJ6BLjB6flhzVcBUgnD/Il1oU/T8xcTnzAzuDLFw+irKWqL73d5ZgVPi/S6A2B
	 IvqDk+kaVcrJG7Fl+3Um8a6C1c487YzcxPiRiitHRtMG8mZkXKHfou1zg9BdQksDOssPk
	 H+AbOoOcFZxL5eyH9QiknJTspP913zCiyTHjMTTfAx7FLPBozOUpMSe9l7U4IxuW2tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025281;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pJz0q/j+a/Ss/3BCRCnhr/q+DN+SscbUuCywmDGVV1U=;
	b=qCSFqZc8dqXEwZvahnXHTjQOj0EpcO+qiav6v6Ch691aaV5FxLqE8udO61cuFt777WYk
	 2KBRiXakXropKOTSBQYgWjEIxJRVPNWr23I8Gs51r9S72zJoQM2QQ+aLrCQZ0TgbyNeg6
	 jbqr8zu4I9ZT/y+6SWVILow3YpM22Q5ipjmw6PJS+2o3QO6IBe5mCV/YXIYHrmoCrElb8
	 gwqP/X9njqJofwdtP3mtgN+p7UGgLrdk/aGETnTyPZ5/EeFrip9dVNJVSgbjH9cOICJOC
	 wUCpIh1MxWnSSeCtVMJyV7jjU5Sl1TLCae+vDPyP9eXcTOT7HLeAUIQe+r2Lm4p/2Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6OOEvqt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IIwekA51;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E08606A31D
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 14:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60E08606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6OOEvqt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IIwekA51
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtEnU3034730
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 14:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJz0q/j+a/Ss/3BCRCnhr/q+DN+SscbUuCywmDGVV1U=; b=M6OOEvqt6/cOKucb
	Q5OZwST7lwdGWa0CSwaN9mN3wvTl4izer2/55/0Yxz5XAKBB5yBCOXNb39Z/7Q0e
	Shrps8jXSHZ+7swMbp5qt6OSKKGfg5x7OErAi+hO33NTjwcmKfBvrA9BWE1NeA3T
	4WfViqkG2Wd1IU2zk9xVpVFVcYuu/waF9Zrij3BRqS9rSqU0cxSG5Pgc/xdyg4iB
	eaflTv65SmyOjzkhMl4SuTkIJVc2Jft3XJFXdyrNnrPmFSoZFAnNgQhg6TqbO89L
	N+196sbu32KAvWsTrDFHvkLRxeARlTe5X6RTiA/ogPIb91kRH93+xhkZe/xp795N
	Uz4tSg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y0vk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 14:34:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf7856ffso734055485a.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 07:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793025280; x=1793630080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJz0q/j+a/Ss/3BCRCnhr/q+DN+SscbUuCywmDGVV1U=;
        b=IIwekA51XcYa1+QvoNklFdWCHCbwv/GmjLj3fpRPChYgpz0DwpQ4YdKACmOc9V8DXJ
         9Qc3d9aW5iPABXEldKyA+D5o3BfdqQYwAiWylv1andKBUN2rS3//ezB4q9V0PAUoAn/e
         0HzVv4A+/qDEOALDJFjRbWKTX+E5aWsOoslOCuiGeAgroReaocpheHHPLcIyOLXHLyKA
         Pwc4yVJ1BPJZ1xAWnE/FK7jB6yAQGiDabuRbtPi1K/WjED1uDvMRmC0p0j2VDZ9BgOLl
         gUADqkr6ylDYXllwRdkLtR3M2UfEa3DMLYoFwgS2upkLtRoYyzwa3xEGmYUro9JTuRyr
         H4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025280; x=1793630080;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJz0q/j+a/Ss/3BCRCnhr/q+DN+SscbUuCywmDGVV1U=;
        b=uRlRzeNIgj/yNrkTtX69B2Ni+gq9VCRg6AIgfeGIHKZCC6TtgCclZrJoyrmwIZDcCT
         KH1cS4P4HGxL1tW7ywJOaCyEKhbd3r/2yJWWYzV4H04nnf7NZplw4mfaWQ4ujfHcN8l7
         DOdc3heFi5T1+2LnH/iCRV4gucoIL1zyftJfKAj/CRa1+dNFZbHdCACqDcrAcblWMFnn
         vUSdH+psbZdp7Q64kn7jVi9Cr21DwBXToUmi98uJpdROuFLy2/Ep8MaX2BHOFzkrtdyT
         arRmskLRGEwVRcxwVUVGKdeOFSkWNb/apbYTpT8auOVXKUEtNJzO2JNKZsSuFAhkVcrp
         uCLQ==
X-Gm-Message-State: AFq9FYKWIhIl2avGZwe1DkawVyWPbdGlejcF3iBNVgdPBknvenmEktva
	9BLZZ+bdzZ8/iENflf38Sqlib7eTBgRCogz3zCXPljY6qSdmtPyexnDOFq2YbEk1zOpPVUkV9LE
	dyBzt5ZesM6DvnCbQT05ZVxdWlg1UvoqRQUshvvO3vixFELEnWTpY4WWgkbUBbzosDg==
X-Gm-Gg: AYBFou3FQDkq8CPBiLF6TETY+r/CSkFGqu11V+H1RZdeyuIqOhLBiOlEPof7B8XryWF
	aGRGuYN5tfOu4Chn0Wt18YrmwkBbw/4NOyypglxrlwd78uDsN9gydyypu8PCmSTTAZZH/ueNLZY
	5x30hAdVzuz+jmle+0y8izLRjzgV7PuxTp58JSdBA44d5ZVizlFYBKWzbagWL687PHxboZW3yAm
	yM7wPBjb/IrivPoUuZ8+QirxR+YJniSu9eNlqIZWLxJLEWrir/NOyGvyYQWbuyZDyiJY2gcxbWn
	BD/R9uY3iXF+Vzg/erdhiDkv63am85geeNtMIcCFZjs9Lnx/lct0wwsriH64jsgcaerdKFmNjdd
	RyJM+GIvrU2rYMbbyS4A=
X-Received: by 2002:a05:620a:f06:b0:93f:3978:481a with SMTP id af79cd13be357-940ef90a7a2mr997538385a.51.1793025279552;
        Mon, 26 Oct 2026 07:34:39 -0700 (PDT)
X-Received: by 2002:a05:620a:f06:b0:93f:3978:481a with SMTP id af79cd13be357-940ef90a7a2mr997532885a.51.1793025279058;
        Mon, 26 Oct 2026 07:34:39 -0700 (PDT)
Received: from [10.40.99.45] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445984207sm3552132a12.22.2026.10.26.07.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:34:37 -0700 (PDT)
Message-ID: <bbed82ed-97aa-4b12-a8ce-a4f21ed60595@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:34:35 +0100
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
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v11 1/9] media: qcom: camss: Add V4L2 meta format for
 CAMSS ISP parameters
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
 <20261023-camss-isp-ope-v11-1-0c2937195298@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20261023-camss-isp-ope-v11-1-0c2937195298@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfX54gH3LzqOIUJ
 UWNj1Xa/KzzSLFnwD06PPBycZY/wMskQMGHvIcUuKpoe9qM4PmWLlDa7z/0zuFY42qVUZKKPnLc
 HOCxuIJPivU/cgIzGZnHYAq94M0527Q=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf6500 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=cfCy20KhcoV1EizUSHcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfX7zTFEuzrp5EI
 eWhlV0Ib5dqJTuGAgK0v+7CX5Dh/EIewccxRTq5lBIpzO5qO8gE/ZhYtu5AZw4q1EG7BxnRopNY
 A4wO/7EMRyH/BFXhQBxZMWhgI1jgvHpzczQiDR8aj8qLXTyoUsdalhKebhCgQmDKPPS7T1Rpsgi
 /Xc03SileHx5IIaHHVIjv5BC8SaBNqPDbV4b+XTS5wCvtLpJepr19FMkme9YvohHrK8pkQSOXF3
 mf3n/PDEfaaRCSUX8xsKoW+DCa9sXXvhmwbduDYifCYbqqMOqpmdAldAvoPfJJmXKzwfsgNYj/3
 aBrPF4mC/6LZHIC8zmRqrDsJUpbzuCKTsNpfd8n68UI9cad/+vSoEx+7CrBrmeH9Apl7J8VXjyR
 2vdR8Yc/fncUn74bZpT6ma4q8r/ykjpbWRBJaDI9oMb+Z/h3hLdoqmqF8smvLJmxpRVklq8G4ou
 EGI7ILg4jiliRAAw9/A==
X-Proofpoint-GUID: 4UVjaU7AxgEMl50POL8MADbixW44Dw3N
X-Proofpoint-ORIG-GUID: 4UVjaU7AxgEMl50POL8MADbixW44Dw3N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260057

Hi,

On 23-Oct-26 5:09 PM, Loic Poulain wrote:
> Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
> Qualcomm CAMSS ISP parameter buffer. This format is used by the params
> video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
> ISP tuning data such as white balance, color correction and chroma
> enhancement settings.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>  include/uapi/linux/videodev2.h       | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 17ba1ae707355a134047de646f61fcc2d1512d4c..cef1593c1835070f7b34a8b8c860738fb77f533a 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
>  	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
>  	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
> +	case V4L2_META_FMT_QCOM_ISP_PARAMS:	descr = "Qualcomm CAMSS ISP Parameters"; break;
>  	case V4L2_META_FMT_RPPX1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
>  	case V4L2_META_FMT_RPPX1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
>  	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..70208a9443d8ade569f130e2fc3d6beebab6b636 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -893,6 +893,9 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_RPPX1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
>  #define V4L2_META_FMT_RPPX1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
>  
> +/* Vendor specific - used for Qualcomm CAMSS ISP */
> +#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP Parameters */
> +
>  #ifdef __KERNEL__
>  /*
>   * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
> 

