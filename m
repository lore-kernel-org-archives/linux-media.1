Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9663E1225
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401443; cv=none; b=RISOuHNolx9BNbl3xAYHbihpm8blxYqzdua71eWHKEQ8IDFAiyvwAmkWUWnYHQ1CzvDclgH7jS5Lch28fJn/nuoqjmCvLP6OqjUetzdQ4KnNhcONq/uGtegES2C845gg2PK8X7ks7D1Hvwl/lCLEF9dWEVhZ5p5WWXr2GDt9qhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401443; c=relaxed/simple;
	bh=KZKdLIYWIv8tdGoWpFWS4PuNKTV0IFluv0JT6hkKHDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AC3fbSC9YXWBS/kScuVux3Eme6lScnlx3vuJ2QMhHVehw4EzY1UPdyAemBsngd2QUYemClO8Qjk+CdMbRl1MCD9eGa895fGsCTSyxEzQXmIVX2MlPm6Ws+NKMTObOh9WRCcPYbnrtufGClyAP4iQCmiLNCBt1ua6eRzirzHxs5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=edmY86q5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YaX2mCNq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="edmY86q5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YaX2mCNq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8fcLK1475718
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xOvJCQ+5VvVgswjumANrE9rhfvumkQxKMERIvOtcGjk=; b=edmY86q5QQeIvazu
	UjATeEWrkaPoVuItFLnqi8ukeZe/RsH5yy6ozKux94y1hl4z+rfCM7h8ZGzxRYCg
	uQOUnYrGIDzhSXY83Ov6NGdw78Ba42s0D7O9MLjPS1t0F83NMpxWnsF7fy9H6oDG
	1kPbReqs0kD3uVWJSkra3Qx99+1HN5r86f4BqlrT8nP0iL6rgFhO+Qn+QL4qskvy
	OMYX9tgCJ015m2V0P/Bys2gvumz+OF/9E3oxfisp1fzN7aNiluk+WrJK6FpmuNlG
	3UoExxKIpn36LsCIyVza3ncVWOJgIEUz3bYoMXRRHl7sxi1bJd9qI1bZtJzbq88h
	BUMKFg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3ax816p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:50:38 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so2114210a12.3
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 01:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785401438; x=1786006238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOvJCQ+5VvVgswjumANrE9rhfvumkQxKMERIvOtcGjk=;
        b=YaX2mCNqAmBm8klEQXsxbaAu0QBD/CeVsn4QxejeewF5GzQcMdK7w/AxDMzZNHqboT
         vlJyIt7EikrRVNDc1FOvHRdOdkwaTccOxHooP6wuwKQ3HDzxknd0N0IFHpk3M0j8dCPa
         R6NoZ2p1q1ldOapt8pXZPf/9LFzb6MThWv5PUt5F77u07LYfZAJJP5QAqGnocgHwNCv9
         YUoZPcdY0O8AC47EzUoRB28PE2klVpcVxLj38IuKIHRMY4tvWT/NkGM3NfhbQ8AEXfZi
         NRaWacleAtrMTqo4yEXhbfoZuffXyyWcMCXmuJqT62HrYFc3hNmNUt9P7YjsEiDQdOMQ
         d3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785401438; x=1786006238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xOvJCQ+5VvVgswjumANrE9rhfvumkQxKMERIvOtcGjk=;
        b=KkINEhPcuKdVa5V2n7QPSKDda/BpyYXp/Uopy12HFmOVOCD3PE2Sc9GT4Rb8k2u6j0
         GEf51m+G5ltnhJADZMZvMhLlrSxt0lNmPRL3LYfQhdswJy6TYGs57Yte42PghXRcic+r
         WZhWlZZEVMKdSAxfxaOz9c8gtpJxZ3ZpqRW+xI78Zs7XSx8vAwslacrtCRHbqHpXzR07
         H4zqhoSYWup5tA70azeIrA3tWvq2D+cUd+tTNjTIClNKBXI5TBujaPM/kKFVf9NIj0La
         RHdq9MpLuEgyfxBfozjn7pW8N3JI13deSiws095AI8UjxjTdfkuxAxBvVPdTkBFQYiWi
         i/Kg==
X-Forwarded-Encrypted: i=1; AHgh+Rqkx8/9pqU3oeew70jkX02ZCqI9+aAZpZAT9hY2y9FgXwyyHSlnOljaEvilHndWpoPQrZzvB/WvdV8tLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL6JkYHMt6Vd8gJvEvbTSvFW/PiBUy8EpRuT4VsiRSYnu7Xeyf
	+YTPA51pVG9u9nkc+sXdemWJEwEtusZ3O5YziP3NNbaRxxItX8y/hPtV2b7KrX9PL5W4/xXPD4n
	ADUivPjuTTYVparIcLJc+KwDhO6FkL/IcvyPPf/Xdg9jC8z5O4UazHmTX7+qU/t4g6w==
X-Gm-Gg: AR+sD12aQ9ABl6Y/G/ayRU3pkmwWkIn92iWsg62EAdJ0/tedzBN2P7g1G/OjAF64s5e
	ZAZ9xiS5HHsI+z1E+C/iO5sdW1IBD4Ck4E0BIXoN7GS/vs7x7zm6B9qP0IS3QwS42lJhgtnziWs
	ck5ECyBYQ4EtbWwoZpwdp/SH9ecfr7IeWsScWJpB9Ss8AmrjtDsQ6XLaekTyhL7/HtcD4jUj2dm
	4/6trowkLJrC/5QpnR3IcwIrX2sfKM0zxs5igYTRNAMFrScj6PN22zE74Y9MMoqR6J7Dr7mv2q8
	xcL7kRUrP0exovoTQ6o02PLvXHLmLf/VYS15bz7ZpenoNZjm/v0oTw7IWSR7VfMzJa7PS8KqejU
	7QhkSj0L+rn09/TbzEN29KLbO3ijwjXJmbtg=
X-Received: by 2002:a05:6a21:600b:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3c9007b4c82mr1766094637.31.1785401437699;
        Thu, 30 Jul 2026 01:50:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:600b:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3c9007b4c82mr1766066637.31.1785401437294;
        Thu, 30 Jul 2026 01:50:37 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.250.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b12cdasm21115475eec.1.2026.07.30.01.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 01:50:36 -0700 (PDT)
Message-ID: <854914dd-0872-497d-94f6-81a36a405cf2@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 14:20:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: media: qcom,venus-common: Add IOMMU
 IOVA reservation region
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
 <5nIoqMekE2B3CTU4TIlUJxoI3Exckc2sUM9RmZBqboEOvgmkdrhKlRX3-FiMOiYFCWXwzO5pii52NJ6epuy1Fw==@protonmail.internalid>
 <20260722-shikra_vpu-v5-1-3d80babd4672@oss.qualcomm.com>
 <557377b0-7a21-45b6-b62c-d3b34a6a29f4@linaro.org>
 <67c78d88-92b8-44b9-bbcc-6f53f6c60ef9@oss.qualcomm.com>
 <048506d0-7dac-43f1-a50b-f9f4c1d125a1@oss.qualcomm.com>
 <c3131fcd-c2ff-47e2-a8eb-858456b88ed9@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <c3131fcd-c2ff-47e2-a8eb-858456b88ed9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Acyt8umI0hioQ-iu5L6XceErPZrNH8gg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2MyBTYWx0ZWRfX2IGk08mqX0g8
 PyH15XAWUab2oAI/oMaQvnkGII4mhalUYvBfb/m9ruKYPYGTcx4+d/1h/+Wz8jmz51XUOEWmCeD
 oI79fVuiSQp7b88p7qc+TLsszkms6p1460mQ8ddBI/zlc7xycNSiZ9KZyzvk8fLRjNGjdDC8tHt
 pN/96Xi+DZfZGWTTJfvL2oASgyfFxgiwq0ACFp61Ee+PJiSgozbq1gn2cdzJh9AVGYMdv/R+YLZ
 9Cx2Afcl7bmke/TppfowIN56pi/WeKS2QlSBUb4PJ1x/UOpG/mNUIQEam0ZJETV+42rHz79Nkeu
 q9CFkFuoCMXGcdBq7gJ7n6KPJfSoS7hwT7OYbEbEKXEb8HDDeJqvj38Bh7c8HrVJrNMc7zle/kg
 YZDS+7B/9LfA3a1/KH4MK3DOO0I2W0/xow7HUarMXO1GG94Vhw6XXpBcdpusfvspVj9q1+INecE
 9MRfDnE8HOWdHzt0kaA==
X-Authority-Analysis: v=2.4 cv=Frg1OWrq c=1 sm=1 tr=0 ts=6a6b105e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=M2acBXnaP4sAQTlOGKtplg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Z3p5NtGldf99kMNzltkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Acyt8umI0hioQ-iu5L6XceErPZrNH8gg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2MyBTYWx0ZWRfX/+LKEo7kCzs7
 2Ikut+F7UMs5FCV0vnMzIjumLr7zQejwBAswjkzcKDT0ARq20iI4n7XXfC4d11NaX1QOJ4piv/4
 AYVrT6XLoRRFMDxQuaFGZBrhOvb8BgM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300063


On 7/29/2026 5:51 PM, Konrad Dybcio wrote:
> On 7/23/26 12:44 PM, Vikash Garodia wrote:
>>
>> On 7/23/2026 2:36 PM, Konrad Dybcio wrote:
>>> On 7/23/26 12:03 AM, Bryan O'Donoghue wrote:
>>>> On 22/07/2026 14:41, Vikash Garodia wrote:
>>>>> Update the memory-region property to support two regions:
>>>>> 1. Firmware-loaded codec carveout (existing)
>>>>> 2. IOMMU IOVA reservation region (new)
>>>>>
>>>>> The IOMMU IOVA reservation region is required to restrict usage of
>>>>> specific IOVA memory range. For example, VPU restricts usage of 600MB
>>>>> for specific streams, which could otherwise lead to device crash. This
>>>>> change allows platforms to define separate memory regions for codec
>>>>> carveout and IOVA restrictions.
>>>>> This schema update supports existing DTS having single memory-region,
>>>>> thereby allowing gradual migration of DTS to support two memory region.
>>>>>
>>>>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> I'm not mega-happy with this pattern being used - I prefer the pixel pixel_cb sub-node model you've proposed yourself.
>>>>
>>>> OTOH you're the maintainer so its really up to you how you want to arbitrate this - the 600MB constraint will work even if its not pretty or the best thing (tm).
>>>>
>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>
>>> Doesn't this cause the same limitation that the initial patch
>>> by Daniel (all HW contexts can't access 0-600MiB anymore)?
>>
>> Yes, it does, but for cases, like Shikra, which have single streams (with SMRs), there is no additional benefit in going with sub nodes in such case.
> 
> Please note that somewhere, I was under the impression all venus
> impls suffer from that

Yes, all of venus/iris, including Shikra, have this limitation. I was 
trying to convey that for single stream case, like that of Shikra, we 
can specify the restrictive IOVA range in the parent iris node itself 
instead of introducing a sub node and put the same restriction there.

Regards,
Vikash

> 
> Konrad

