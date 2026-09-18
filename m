Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C6C49890A
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 07:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715343; cv=none; b=NX9K3SVFfQJn3pLs2gHqNywDpvBZxEeGxtNPX5lKHGpfCwlgh0kL7jSmOnjCTal1mMJDeezAa//ZWSYW5gLp6/fv51V6MOkw3vnytU0BHE/soeP6m3QHxde4qr4qFXtwP933B5DEjbkUsj5Vh4WiQyoUGMFgda6mXFqScFWOeOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715343; c=relaxed/simple;
	bh=p4bb+zBHJnPJfKQ3DuhQrsQU/ybQ7EqVzyn5dFbuHt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bcrw1DPGdUxtTZYKNoQ7ZUQsizmpaAxfg35USIdhRXpbvsVHEbz6mum0KLu/gt696tq73DsFD5oMN4wYYQhIoNVL4OgR8bMhETTtvY3ryuFcQbyBsTn43jc5TGvlfmUOzzy0xO5UmMOGYZVKPWbrlRVquZOEsUkQOVSVw00pa2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fo4xVFpk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QS2dlw8r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fo4xVFpk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QS2dlw8r"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I6028U3304822
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 07:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4wM01dpinLcGjeeVb6PylFoAR0qepZkT+u1aGAqcjXE=; b=Fo4xVFpkxpoSCjRK
	KgUO6IPDONUzkS2JrL1n8IlX1/L6UEQQTP/FVnL9xCFhINyFGjBSoYp7TG8VgTxG
	XudK7qVrlKADe8oKH9Uq/aJQ/4e3U9LASuJvTJV8LmA98thSsyqfkdmldfxSiCBv
	wwzIT5qVwAT8GdxkniFxDeZ56AL3OVVsdTvZEQS805Qao7P8QqaxLYnh9bO4jscP
	JA7KaJlAbLzfnlKQdxTIvbNLe0K6Fg2Ijgi/mB0gxp/2Kuk4lPMhxzgWlGqgcLbr
	raD+2h2RL+WYQEcaHi23pisKfNOfb9k04T/J6/3RuTExEs8oUbVt1aqseBAGwkZf
	PVnd9w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2kt9ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 07:09:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91219341db7so9653696d6.1
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 00:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789715340; x=1790320140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4wM01dpinLcGjeeVb6PylFoAR0qepZkT+u1aGAqcjXE=;
        b=QS2dlw8rsHaH8Fdx4v8/5B6Uiif/ejETRypx7hzpEjAEh9yRHumS3+LBhUC9kNJeTd
         IgaZWLlgJBnEPIq5ig9BYME4kxFCnmL+BQkaXQTmQY8z2JKRwY785w0nyXng3E6oQ+++
         w9JaIK5PWsxVPrLHVuSD0+7/PvsQYtMwjdMLhQ7pQZl2e6r0Y8ygnl4tPzzzJzQikRVn
         eP5DT+lrl0jdrkAI9kq5/sbAq2ev19IaE9HQIi2cpIsAd5laeolifk3yIlZSjmekDkBz
         OSCtl7v7293zkahVCarpY1UyxDOPtaijELV8tLAMp8Upar7K7u7i0EJJ7Pxz3UxzjyXW
         kICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789715340; x=1790320140;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wM01dpinLcGjeeVb6PylFoAR0qepZkT+u1aGAqcjXE=;
        b=WG0++Zveu+Mu3Dzv7wCsBAyzE/ZzOKVMqoRFZl6ps/XbAJP9kogBD/LhrzclDy1oDW
         qNB2tupLhfI04yd4YeTPuENw9t6s202taB5l924M2yOcJAjo1kINSbC2Rin04qPAZ01Z
         L4ZqUd5iiFhIsEM1M+fR48wr6Y60dr9G8JJe8pdDcZxTuNs/Z4xm6qEwQ1+iwHTaC61M
         l+MDQxVTSI9yedyy/XQsiMMj6nTrQV/dIuS6i+wFIKTdLBQ29q7SVHqxO27JM8evSAZB
         2v2GTtfsGm9+7b3NT3+Hg8aIBtqXqyrMCntmWtumpTaRhFJYuei5PN/Lw8ntl0Q+O0lH
         tBiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyqB7nDJX+vCGzt60XcBi94gSpkmls/JyLH0Bx1zdOooUfrG5DxF8F2uoEd5GebTDhDIgw25b1c9Xl1w==@vger.kernel.org
X-Gm-Message-State: AFuF++nvwKao/lISlXSyHRebSKBvXVpwC+CgvvvF87MkJC6f/yMjj0Cm
	1ryY41dJdMvPJn9gB1Lbszv/TOZ1fYoAX9A+9/Yhd4paTcidxezU0yyEB2Ze2KQOx7+ZNYad8Py
	ZCdH6Bx0/Z+VwjiCyrnRZehzqm4AU478plI9Cdbac5eC2CE4z+FtpUGZgTCnnuujA9Q==
X-Gm-Gg: AYBFou2fSCeoNQj/GcLZLW5oZHcXpVm2JhWmivUJA5ap9AU+T54CzMvxstPocpFyAWH
	PZfiQDpOqQCi60c/eRpZBPbjNb3CNA8hvNeveGT3ey8PgRuvtNpA6Y8XKtjycKFK5xqCiaVf61B
	JAB0W7b3//yOvht0TXlym2y10s47CipwqlRv2oTmBjnY3lbAUH/CvwEgXcURnQRJsdEDHNMYGWP
	V62Oer6p+ujV4JnChvMCezeb4ReFDPxcJj+yTnY4pzme0yYP4s0FkJ8j+mcI4pUsajptpqTjQsP
	N6Uk7xrmKKyTVF8dCemjZSImqK3XyeprMjbYz1o7+1qFJatArqdUj9K1iGgkR7HDD6cpXatLqIf
	ayNONK73RY1v3pULvpFPMgAsCFGyPpd9dmQ81eBojqwP+8vhd6GMY9WIb4KAnO4fT
X-Received: by 2002:a05:620a:2713:b0:936:623e:2603 with SMTP id af79cd13be357-93bdc6988f8mr194508385a.17.1789715339637;
        Fri, 18 Sep 2026 00:08:59 -0700 (PDT)
X-Received: by 2002:a05:620a:2713:b0:936:623e:2603 with SMTP id af79cd13be357-93bdc6988f8mr194505585a.17.1789715339162;
        Fri, 18 Sep 2026 00:08:59 -0700 (PDT)
Received: from [10.111.172.118] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91258056195sm6164066d6.29.2026.09.18.00.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 00:08:58 -0700 (PDT)
Message-ID: <ebe9f27b-4eb2-4c87-a02f-78961dbc1827@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 15:08:52 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: media: Add bindings for qcom,nord-camss
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
 <20260915-nord-v1-1-20db41a7f1ff@oss.qualcomm.com>
 <20260917-active-strong-emu-bf8fbd@quoll>
 <d89a7376-ffab-405a-a3b6-d3633cddd063@oss.qualcomm.com>
 <f6cb2a51-b385-4203-bd33-4b789cac5616@kernel.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <f6cb2a51-b385-4203-bd33-4b789cac5616@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA5NSBTYWx0ZWRfXwYhwaXCoiwl+
 s3gViR/KhyI19xv/ee9b5O4pYLle9FdfFFiBnY44dvK0eZp23qqHTIyeet6gG02PqEEmIachXWB
 E6r7USTLIKevaRdEijxgerm76FjlNUqbCyXGP1l0HUqdCVZuG7F+ZDZ5kdgshOHL219Tyue3gPD
 dL4kGSZG3WVhutKxNh6Eto/oQi+p7VT3Xn+LV0qR6gIIFezDDN+IoD7gZqhE0MteI92Zvq7LgvS
 Q/wAXUDSvjoRskomX2qBFEmX6x5nYDdHJki5FOGqlIGxok3rTG24454e3e0MHGnbD7wGCy6M4M5
 yeqiDaugM9o35oxF3i3jBEqmCYWVCY0fMNFtKeB+YlSZTDfKEpK/hYlUxs1HAkjS5iKyD2ygU75
 Ix/FQ0prSY08+Vye0I4PPSMoDC3wZYficHr7afJ23ai79zZxaEwtt4m4DFS+i5Z7ZH/hLD1LGVv
 JAj8OzSkIyh3u1ffDeQ==
X-Proofpoint-GUID: -Ts2GXMyyOTo0cETIWP-L8Mzb1ayJZ99
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aace38c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=qU0-ABsse5SAqXbbjgwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA5NSBTYWx0ZWRfX+H1BSrDLiKkt
 sdtdDqlFG3+y5Dy/elzAxC0k3yQ7MLxPDDLrIjd07gpwlz8jf8B+x3+yKB4B/fX29L9sIJX0lVD
 8MY8fbKvLiwQkNJ+G9WgesIcUjJeF/k=
X-Proofpoint-ORIG-GUID: -Ts2GXMyyOTo0cETIWP-L8Mzb1ayJZ99
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180095



On 9/18/2026 2:47 PM, Krzysztof Kozlowski wrote:
> On 17/09/2026 14:37, Wenmeng Liu wrote:
>> Hi Krzysztof,
>>
>> On 9/17/2026 6:13 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Sep 15, 2026 at 05:34:11PM +0800, Wenmeng Liu wrote:
>>>> Add bindings for the camera subsystem (CAMSS) on the Qualcomm Nord
>>>> platform.
>>>>
>>>> The Nord platform provides:
>>>> - 3 x TPG (Test Pattern Generator)
>>>> - 3 x CSID (CSI Decoder)
>>>> - 10 x CSID Lite
>>>> - 3 x VFE (Video Front End)
>>>> - 10 x VFE Lite
>>>>
>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>> ---
>>>>    .../devicetree/bindings/media/qcom,nord-camss.yaml | 393 +++++++++++++++++++++
>>>>    1 file changed, 393 insertions(+)
>>>
>>> A nit, subject: drop second/last, redundant "bindings for". The
>>> "dt-bindings" prefix is already stating that these are bindings.
>>> See also:
>>> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
>>>
>> ACK
>>
>>> ...
>>>
>>>> +        description:
>>>> +          Input port for receiving CSI data.
>>>> +
>>>> +        properties:
>>>> +          endpoint:
>>>> +            $ref: video-interfaces.yaml#
>>>> +            unevaluatedProperties: false
>>>> +
>>>> +            properties:
>>>> +              data-lanes:
>>>> +                minItems: 1
>>>> +                maxItems: 4
>>>> +
>>>> +              bus-type:
>>>> +                enum:
>>>> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>>>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>>>> +
>>>> +            required:
>>>> +              - data-lanes
>>>> +
>>>
>>> Missing supplies, altough maybe this is related to some other ongoing
>>> work, so would be useful to see explanation in commit msg.
>>
>> At the moment, the Nord platform only supports TPG. Perhaps I should
>> remove this part of the change for now and reintroduce it later when
>> CSIPHY support is available, once the EVK board is ready.
> 
> Hm? So you added hardware for TPG? I do not see how such hardware is
> useful at all, thus I don't think we want the bindings for it. Bring
> real hardware, since the bindings should be complete.
> 
> Best regards,
> Krzysztof

CSIPHY support will be added later on top of Bryan's CSIPHY rework, and 
the current bindings are already complete with new csiphy rework.
At the moment, no suitable hardware is available, so only the TPG -> 
CSID -> VFE path is supported.

Thanks,
Wenmeng



