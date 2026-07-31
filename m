Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7700F30C610
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 19:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785526225; cv=none; b=rQOZCLms8Vrr1p5fRQlm0YiEYtAa48it1+vtCZ1EKo/2ZAA1qEMeBfl7P7q6TmngDCE6rAJweNId364+VCz4ncw6mlL4iEpgi0VnLAGw6FcwmVcumAr0oZWsJkJCtImPnv7vtdMOAX8kpohkgLAEhW4pQVcXLcPQIAjrMEJWWcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785526225; c=relaxed/simple;
	bh=hSvvyu0gM3TmzR4JhcHeKrwwx5sqsSKJ+YsHl5FTcVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b0A7cGvyofK3eEMInXPiRCNSkXZaMD5xsK/PaBXX12USGvmg8umlynVT+5NaN/CfEcDYsrPCPdxJlv8XlKfI95kLmuJ571LlrQ0E3lP31WKgHyGecneUGwwD4ZvXyQyCfs1DYl4BI3nkeGBVzydoi26krwMaZuxMcxFML4j5FaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfK6PKHE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AnyeCn6/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfK6PKHE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AnyeCn6/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VIcsAF555796
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 19:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qqnTleWc4aOs+18EOqxz46M/aGgFpQKcUHE35qkLIDU=; b=HfK6PKHEZIEU+uF0
	PaTjHqwe9JSenWEy1nGb2ynFGDPMegBM811IsHD5OT4wVPMzYisKjBD9SFDllHLK
	ggNMTVddxUvAkKGqTDobe6Lp4w+E5nLKOJVYhWt5HPAY5eKdBF1Fz75GcbaKl9RW
	uDmgZcaORQlJ8jTXUDQbdIu6bbiGPY5M9Tg0NHbAy7bZkkU8MEBL6iM7nygizgE3
	Qbm3nUE6asMyiLQFIWq6DQTAcuWFKFhh1swU2331bSJGy+f7xMYO7++E0ml9V4Bw
	zlyTaeI6wYQh151v/58KlFcINlelSzTaOrpdCMEulQwnyvgRFC5BkLBesRZADXhA
	v3AnEw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru2u23y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 19:30:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1e6f602cso20157701cf.3
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 12:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785526219; x=1786131019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qqnTleWc4aOs+18EOqxz46M/aGgFpQKcUHE35qkLIDU=;
        b=AnyeCn6/IuzFQR5eHJlwvnIHuNhs5PWo7HuzlEp28gp1L+SDnUZs9pTK7rephCXLgd
         x7DlDCoDLy9l8EYo9vYDRx+t1aD8h+kddPwn4HBBqISVtgzGwS4IkN7vJGtVkvznsPAz
         /0nV/U9urlSCKu1gXg6oHNEKb9w0BMmZiH9IEP3vFafdn+9pCa3U27ZHxEzVHV7ju7Y7
         oR7oUUphp5Bn8K9gy6q0mRAZgPsoJYEakACHF/t0LPzoOdCL0XZjBl+6lPQCZK+eE3Er
         LvqCYHFJ5SYhc18wZ+iyTI97zLllBDqykG4/KAaHZQHByQlKb95rKsTDt8TaHflvek4m
         sx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785526219; x=1786131019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqnTleWc4aOs+18EOqxz46M/aGgFpQKcUHE35qkLIDU=;
        b=ZJgfdrrdQur8UUhW6GVjhOcIx3moMyLxqbgQO2+GSJHDwUWB7EFdvZ0xZrGKfZxGYw
         BnO7woYgVvhQSP8Uy5TGDSfhwfAL2aIqGgdoVZ35wCM7jQMsSwftMFBpO1nw4PrVAEW1
         WhjGZOgFeuO5KZtzozYkYwd9NllwwkdWNqXvHa92Zx3002pEGp5h2fQk0Hxh2dETFkpk
         Y8BFnnfvKjj02mLTDuXFE0Dg1vcwQkGEbSN1LqUHIWHsS5D87gqsIsyZGM9bzR4N8zO0
         oL5DsN42VHEfMleELydfJCK4AsdLFFITFTB6RZio0H4ykkdGX/uN1/NNhm77oCZnSMVN
         jfWQ==
X-Gm-Message-State: AOJu0Yxs2mzkvjqAU+AAn177jalhiFWzWijTXtXP59NT9qHQFV7k/mIB
	KkpWSDyhrhvOErJu2xR6I6IHs01u7+4TT3xr9pUX9EDx4sN9Jas5gMqWiEviDlRYma3dZ8iVNJK
	uqCjH1L3tltqluPkAJIfOxmwTXdCdRkrZXndsTlgB0k1xM1qwUmmGSxRy7o7TppHKlQ==
X-Gm-Gg: AR+sD13OJ5xaAXtqIwLP3nj1UesvXkXfayNMBneH9D8jp0nFJTfHXHL207/vI8+f8o2
	oKRRZscSTYL/SC9rxtcBRQHzx6BtEifC/ubkbxleR09eJgbH1NDo9OKU4sUlzBD6cRunvNA87L1
	AAvvH89ZI5rj25F2rJ6qud+qmG15kC8O321D7FfSZOa8HR8wkGVxMmZdOAzjj7dXEb71ui28w6f
	Y4T7FsEstKw17cAGdi13mBc1AyUwRDY1PnaODmqOjCjUU2vaUq+Pdvqatt+0IYqS1VrOiBQV62O
	MBG9YW69+3bRJzUaAnCnthdppECf7YrandgVNf+fvpJNIVVGFTCa4QQQATmBBtuZYCZFhXETBsr
	4R63JlFTlYWIV2T7y73+8DcaXYtAQ9M/gPwCsHLfexRLBDFX+GSkf+aSfIv20ZWyYassZBEpv
X-Received: by 2002:ac8:5955:0:b0:51a:8b64:69e2 with SMTP id d75a77b69052e-52b5666c85cmr26788851cf.7.1785526218795;
        Fri, 31 Jul 2026 12:30:18 -0700 (PDT)
X-Received: by 2002:ac8:5955:0:b0:51a:8b64:69e2 with SMTP id d75a77b69052e-52b5666c85cmr26787471cf.7.1785526218119;
        Fri, 31 Jul 2026 12:30:18 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c5a054asm2615293a12.2.2026.07.31.12.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 12:30:17 -0700 (PDT)
Message-ID: <476aee61-015f-4793-9be7-a102c1c3e811@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 22:30:14 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
 <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
 <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pU4bsLhsiMdQDh0s6wxx5y-NTjS8ha9A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE0NyBTYWx0ZWRfXxfIyNwBmGSqz
 P5UlncywggU6ZvChi1F0MhDJ41Q0rvEn+MrrRHwKTXS7dawBsaB7zB1j0brBFs1ybh56DMlZYHF
 IFBz2e9UJR1WyjTZDfh4kUvduC4dUu26ZI9JrWtg0j3Oy2ZoI0gxxI8Zdr+XeqY7HxVkVJsFdve
 5wBO+awfCfePMIw5bnhZp0uT1oXyS4WgxEAaJ+XGQyg6R2WpIsQbsC+rnFAwHowE0oGzy8eer3G
 udORqDZFgEogE3QOmxXJOPLLPAtU+0URRIPvg1dDq0of1sNBXVio20cfQ3j1dbUYxNSDWeYqkH+
 OHjtsGrzv3cQgHcROQdIsDVLSGBr3fTu9vXeOuKzZx9bwgyK3aXs7S10O2Fxv1NFDke6Sx7/Mfg
 r/h1Dp0GI7wosCsUUWD5AmRw03MgCQP4nOw+5yPdXpvHCI/JlbkQe39zwrlGVDVwxjhssAdJsra
 SEBj4TxfeFHa1WM941A==
X-Proofpoint-GUID: pU4bsLhsiMdQDh0s6wxx5y-NTjS8ha9A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE0NyBTYWx0ZWRfX379V7RITBF15
 7fcTOUn4lmRetVMIqbTIL2UEMFC5nQcNK3UQKJaaKEl7bVQnXasUu9WdwD/FjH4SxP0pO6xEQwb
 I3K0PQlGvbCoMIGqlYP7JLutrC4fp3I=
X-Authority-Analysis: v=2.4 cv=b+uCJNGx c=1 sm=1 tr=0 ts=6a6cf7cf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mwlGEVAn24TgBEnf5_UA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310147

Hi Atanas, Dmitry,

On 7/30/2026 9:02 PM, Atanas Filipov wrote:
> On 7/30/2026 7:01 PM, Dmitry Baryshkov wrote:
>> On Thu, Jul 30, 2026 at 06:05:24PM +0300, Atanas Filipov wrote:
>>> Add the JPEG encoder hardware node to the SM8250 device tree so the
>>> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
>>>
>>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 72 ++++++++++++++++++++++++++++
>>>   1 file changed, 72 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>> index f11da2ca4181..d42b29419320 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>> @@ -13,6 +13,7 @@
>>>   #include <dt-bindings/firmware/qcom,scm.h>
>>>   #include <dt-bindings/gpio/gpio.h>
>>>   #include <dt-bindings/interconnect/qcom,osm-l3.h>
>>> +#include <dt-bindings/interconnect/qcom,icc.h>
>>>   #include <dt-bindings/interconnect/qcom,sm8250.h>
>>>   #include <dt-bindings/mailbox/qcom-ipcc.h>
>>>   #include <dt-bindings/phy/phy-qcom-qmp.h>
>>> @@ -4486,6 +4487,77 @@ cci1_i2c1: i2c-bus@1 {
>>>   			};
>>>   		};
>>>   
>>> +		jpeg-encoder@ac53000 {
>>> +			compatible = "qcom,sm8250-jpeg-enc";
>>> +			status = "disabled";
>>> +
>>> +			reg = <0x0 0x0ac53000 0x0 0x1000>;
>>> +
>>> +			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
>>> +
>>> +			power-domains = <&camcc TITAN_TOP_GDSC>,
>>> +					<&rpmhpd RPMHPD_MMCX>,
>>
>> Is TITAN_TOP a part of the MMCX or CX domain? In the former case,
>> please drop separate mmcx vote here and let it come through the
>> titan_top (it might require camcc driver and node modifications).
>>
> 
> The change was requested by Brian, most likely in connection with 
> upcoming migrations. I think he would be able to explain the exact 
> reasons. As far as the facts are concerned, this is not currently 
> necessary for the driver to be functional.

In the documentation we have this jpeg block need only TITAN_TOP_GDSC power domain.
However Bryan request to ad MMCX and MX.
As i can see same is for csiphy. Maybe is better to sync with Bryan.

Regards,
~Gjorgji
