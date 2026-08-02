Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BA03AE1B1
	for <linux-media@vger.kernel.org>; Sun,  2 Aug 2026 13:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785678829; cv=none; b=FegklTNZFHlECC1v7CSLdSpxCSeIWEmEV3qZ51ivTOj5vRihJvMGvCs3LNUqpXh7E6VUz6ueX2HoHbWhbvGW5BZDHROgsHEbAgyvhgEvkaYObNI8adKkE38VDKCy8FLPma2ysshXQvMASXadSJzDUNopjjNgklfaLxGBcxDe9pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785678829; c=relaxed/simple;
	bh=HPq5yoFkEG3iBtpfzCUK0AbF2MdytGEBN2NqVBLK5uI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rNvSGlCAZWC3ZSg5+61kKsBh8XyiSh140RMBYPAAvFyyiV8WCEWircx3uUXJfbV+vJS5E0s9EXVJYn/IVYMNg00S7sKp8HRIbmhcqKTnm+uv6tQVWnNiircklP4E2CbrVGL2jf30x7EnKxXyVZ53K4KBBg/cECE2r8dSeLr6Z3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U3SqX3z3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqgDud7E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U3SqX3z3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqgDud7E"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B6amS2678840
	for <linux-media@vger.kernel.org>; Sun, 2 Aug 2026 13:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7telvqZIHvBxRLOf2U1lLAlMZd2ZOrGQxmdLTaOPOGU=; b=U3SqX3z3zUv1AOcf
	HGHTqXmIm63hoxajqhEAWxpD7Wv7TWStJyZEozCuq9R7uyF5fHSbGJRjmVr58n8N
	4hq47uLwSZF/loWxLMiYlFEwNQDRffEggam1AnkenJbtuV1DMLeQx6aOSsuu3I65
	5V19RTPiZGLoL3TeAh9ArChg4HGxEXAj+c6O+UWwxoO4nHq5cQ0ew4Q073Lv4OQ2
	9MuwKJRW3J63u/1w8C+WJhPlgUeT6CeGLLglyVf1NsZAoHqac1LepexwtWbDUyIr
	yk1HXZXZbASSp9oMcUdnKXbLfYF3E7mNSmqLfP4vVBOulIUEIU3lqW7ZbYChdHdk
	+RX52Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8pg2vrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 02 Aug 2026 13:53:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ac0a54110so268936685a.2
        for <linux-media@vger.kernel.org>; Sun, 02 Aug 2026 06:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785678825; x=1786283625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7telvqZIHvBxRLOf2U1lLAlMZd2ZOrGQxmdLTaOPOGU=;
        b=fqgDud7Emcvafl372bBVzAh8skJPgKx1hguspzemwWYgTzaq0DaxNa1p5hHeyksgvS
         kR1yG87AFKKW7R/mH8zX3UJ7foXvbya+OUUUIStmP4o4vNEj16Pe4mFFyyYMCUIZyyzY
         XuWZY70JK3aOiRlrTyrB+Inr1MtqFdxvEhF7/niNHIk4KlEFBct0QJPMeZ2yJluLblHB
         cHeuF0nJJXBVqZQ6jucUoMFd1yFLFhJrIsF4kETnglXDbWhTaOZeSp2A098jKuHYaeOB
         7Wo1hpNJf4E32NwIReCxvHQIczrt+bQGfF8n1oGnT30I7WZDthCmxNn8MXABmF42lnjV
         5BcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785678825; x=1786283625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7telvqZIHvBxRLOf2U1lLAlMZd2ZOrGQxmdLTaOPOGU=;
        b=jq9wiakbXuCOc2yetmu7BP9Q4qGvogVDobrWmnGP/g85QW5u0Vvy4irVbXwEQ+LGqt
         xcMuQbDybdt/XybBn096dm27UoqcVkjijfZAt71h8HmUL/fo6YoCkuGHBWFhrZ6rY8CG
         z4l4L9qyqjqiVoskzmzrnh/vagJo6YN7my328jdh0TKcbYDeygJztiLDkJPaVY2QnM49
         yfku8lsfbqfthpubLD9zHWZag5uCxzJIUdMFeAJ4nmZa1QKkb9golYhx+PWKo0jCCJzk
         DDX2h7oYn3Ws8M8mr7gT2LMbVRn2jCjskc3NSZGShRf7QXaOUh+sXv67hOXB0vJyUTwL
         2rqw==
X-Forwarded-Encrypted: i=1; AHgh+Rr3HiPSCJedk0r64ohHFfo4K1nbChAGAcJBD0dG29cCjS0aMvMcK3F+VZacmnL16KYeHk/c9WLh9F6aNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ6gblf3HcktAbBpq1TstHC0Yc4T0lFllspopyPaH2903WIu5+
	ye1maEyd4FahC0pW6GRgQrUieemeB5OWuABvPTSiVlNJksBGrsBL8XVs4/jG9mVFElNv2fHwJ6J
	8lB8PkOwFaEQ5FSwxvH7pZ1A2w3HWy3fvErm4WH5uBXK04rvAxQk1nYeQGnqNE+oQnw==
X-Gm-Gg: AR+sD13DWp39N6JTctzSMkUuLdD7yztqo7xvD+Av9Ou775fUBhWpAVrWK+CBBD7xSst
	jQz0soH4S7EKg0T1z8hL4i2d4ggZHrcNY268tFCaKEsZvXs/uTxoAGiEwvKmXvzjBV2X0tcbCdD
	4HRg/muxQeRJJMhnL6Z0DZ6OmltJTA+7j8QgiRSe63d1tnRTPzVmK7FkV6RtAPYTzVI4WhCdfRW
	VZhCpIYiiKKEGCU1f1sWFWYzfu6vO2HG2Suyt6ffRoL4AGH6WP9PeXkCHFJdKjkFSSw8RwgnnNZ
	8j7E2SNOe+/+0hyfQ0odRTp+ap6ebg2bDeHtABF4NdgynBdFgjoP0jNyE4LI1W+Xf6jWvRKbzHm
	X1ZMGnMAPItgQ+yaQkS5z67dmkIaikZki
X-Received: by 2002:a05:620a:2252:10b0:930:adff:9aa1 with SMTP id af79cd13be357-934a078753bmr981849085a.13.1785678825531;
        Sun, 02 Aug 2026 06:53:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2252:10b0:930:adff:9aa1 with SMTP id af79cd13be357-934a078753bmr981845185a.13.1785678824938;
        Sun, 02 Aug 2026 06:53:44 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c5b0fasm438716966b.5.2026.08.02.06.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 06:53:44 -0700 (PDT)
Message-ID: <2d7cafb1-acd3-4be6-9fdd-3071a55a7b08@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 16:53:41 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-2-atanas.filipov@oss.qualcomm.com>
 <3cbnmjmit4gsldga5nzct4odg6hpixzlwxbj72elnogyevr2tg@6esyjj2mvyom>
 <deee4b5e-167a-4f37-b2fa-84f06ec33721@oss.qualcomm.com>
 <fcc464a8-3d1c-4b6e-ab2d-ef61c4b18b2e@oss.qualcomm.com>
 <CAFEp6-3vecjDQE1DBwQXHoj5ez5ALUVq_iwS5UB4YxaW7YGckA@mail.gmail.com>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <CAFEp6-3vecjDQE1DBwQXHoj5ez5ALUVq_iwS5UB4YxaW7YGckA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pqE2lFl06-pj4NWIokmHkzDaFRP27Lkz
X-Proofpoint-ORIG-GUID: pqE2lFl06-pj4NWIokmHkzDaFRP27Lkz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDEyMyBTYWx0ZWRfX3npWOXF9/FO7
 oqQ3vD6kubKG+Yg1SoIp3QgGcHUEe5k1o+mrzyO6Iw/QW8qiO7KoVXwLHoHOmYTNqRXd/cm9Ymg
 N0IyWKr9M1DtDuvHvQu+B+IIRkWKXx0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDEyMyBTYWx0ZWRfX4aPymu1Hk/Ka
 gdTEz1nRaZRWu1vKA59dGbU99V8E6F9zT+C/GPU9DCxUn7IvE+0tZLMKtOMne8VinLBr8QbTGs4
 cq5Rxlt8NWN7dAgURx9pSIufNEA45FX3Z4JlI+b0gEK23QZwneiDLIuge+eA28yzvucO6LNHMrv
 ieFw3A2jm8C1cyZfJMPOtMR3A6rU8QRH0Aucue0fA4hqisSU5+FnWz2POb5bwoqouk+eUHU6DFL
 +fFJGhExASXtnXgxUEA0iUW3G8ii4OmaaW6ZcyCui0ug8nHDLuNBQn7NOfDgNAcjcU7h182w1ZZ
 YgcH3xAL8VlyQ0l/SMM9NsDN7VubpnRU4PyvQcs6a/eIScZk+MPtMFppobDAmFsiO+AAOv/qQtB
 CXjKgobmqVSiJf5/5AKmGHc4DS/AVlS2PqrmZG0Rnt2OVVzkmHgTUvEuQ73/qXa7tL1+dQmFksr
 JywbNbhcuaK6pqT40Qw==
X-Authority-Analysis: v=2.4 cv=U4Oiy+ru c=1 sm=1 tr=0 ts=6a6f4bea cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=D19gQVrFAAAA:8 a=EUspDBNiAAAA:8 a=DArUqyWxf9ZkW7bf0ckA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020123

On 8/1/2026 10:48 PM, Loic Poulain wrote:
> On Fri, Jul 31, 2026 at 9:27 PM Gjorgji Rosikopulos (Consultant)
> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>
>> Hi Dmitry, Atanas,
>>
>> On 7/30/2026 7:24 PM, Atanas Filipov wrote:
>>> On 7/30/2026 6:39 PM, Dmitry Baryshkov wrote:
>>>> On Thu, Jul 30, 2026 at 06:05:22PM +0300, Atanas Filipov wrote:
>>>>> Add device-tree binding for the Qualcomm JPEG encoder hardware block
>>>>> present in SM8250 (Kona) SoCs.
>>>>>
>>>>> The JPEG encoder is a standalone hardware IP within the camera subsystem
>>>>> that performs JPEG compression in memory-to-memory fashion.  It is
>>>>> separate from the CAMSS ISP pipeline and has its own register space,
>>>>> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
>>>>>
>>>>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>>>> ---
>>>>>    .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 156 ++++++++++++++++++
>>>>>    1 file changed, 156 insertions(+)
>>>>>    create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..70f573100573
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
>>>>> @@ -0,0 +1,156 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/media/qcom,sm8250-jpeg-enc.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Qualcomm JPEG Encoder
>>>>> +
>>>>> +maintainers:
>>>>> +  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>>>> +
>>>>> +description:
>>>>> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
>>>>> +  The encoder is a standalone hardware IP within the camera subsystem that
>>>>> +  performs JPEG compression in memory-to-memory fashion.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - qcom,sm8250-jpeg-enc
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  clocks:
>>>>> +    maxItems: 5
>>>>> +
>>>>> +  clock-names:
>>>>> +    items:
>>>>> +      - const: sf_axi
>>>>> +      - const: core_ahb
>>>>> +      - const: cpas_ahb
>>>>> +      - const: cnoc_axi
>>>>> +      - const: jpeg
>>>>> +
>>>>> +  power-domains:
>>>>> +    maxItems: 3
>>>>> +
>>>>> +  power-domain-names:
>>>>> +    items:
>>>>> +      - const: titan_top
>>>>> +      - const: mmcx
>>>>> +      - const: mx
>>>>> +
>>>>> +  interconnects:
>>>>> +    maxItems: 2
>>>>> +
>>>>> +  interconnect-names:
>>>>> +    items:
>>>>> +      - const: cpu-cfg
>>>>> +      - const: sf-mnoc
>>>>> +
>>>>> +  iommus:
>>>>> +    description:
>>>>> +      SMMU stream ID for the JPEG hardware. The stream ID 0x2040 is used
>>>>> +      for the JPEG core engine on SM8250.
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  operating-points-v2: true
>>>>> +
>>>>> +  opp-table:
>>>>> +    type: object
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +  - clocks
>>>>> +  - clock-names
>>>>> +  - interrupts
>>>>> +  - power-domains
>>>>> +  - power-domain-names
>>>>> +  - interconnects
>>>>> +  - interconnect-names
>>>>> +  - iommus
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
>>>>> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
>>>>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>>>>> +    #include <dt-bindings/interconnect/qcom,sm8250.h>
>>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>>>>> +
>>>>> +    jpeg-encoder@ac53000 {
>>>>> +        compatible = "qcom,sm8250-jpeg-enc";
>>>>> +        reg = <0x0ac53000 0x1000>;
>>>>> +
>>>>> +        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
>>>>> +
>>>>> +        power-domains = <&camcc TITAN_TOP_GDSC>,
>>>>> +                        <&rpmhpd RPMHPD_MMCX>,
>>>>> +                        <&rpmhpd RPMHPD_MX>;
>>>>> +        power-domain-names = "titan_top", "mmcx", "mx";
>>>>> +
>>>>> +        clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
>>>>> +                 <&camcc CAM_CC_CORE_AHB_CLK>,
>>>>> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
>>>>> +                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>>>>> +                 <&camcc CAM_CC_JPEG_CLK>;
>>>>> +        clock-names = "sf_axi",
>>>>> +                      "core_ahb",
>>>>> +                      "cpas_ahb",
>>>>> +                      "cnoc_axi",
>>>>> +                      "jpeg";
>>>>
>>>> What are the pin input names for these clocks on the JPEG side? Can we
>>>> use a better name?
>>
>> The name of the the clock on jpeg side(based on documentation we have) is
>> cam_cc_jpeg_clk, There was comment from Krzysztof "https://lkml.org/lkml/2026/5/15/1112"
>> to drop cam and clk, so it remains cc_jpeg or only jpeg.
>>
>> As i can see in ope patches ope_clk is named as "core", do we have some general
>> guidance how to name those clocks? or if you have any preference or proposal it will
>> be included in next patchset.
> 
> In ope series I named the clocks based on OPE block PoV ant its
> function, so usually the main function clock (the one you named jpeg
> above) is the 'core' clock, the AHB is usually for clocking the
> 'config' bus and the axi one is usually for the actual 'data' bus.
> IMO, it's clearer like that.
> 

Thank you for the feedback. I'll make the necessary changes in next version.

>>>>
>>>
>>> In my opinion, there is no such thing as a better name; the only
>>> important thing is that it matches the HW documentation. As can be seen
>>> from the clock names in the FW shown above. So, could you be more
>>> specific about which names you would like to see used here?
>>>
>>> Regards,
>>> Atanas
>>>
>>>>> +
>>>>> +        interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
>>>>> +                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>>> +                        <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
>>>>> +                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
>>>>> +        interconnect-names = "cpu-cfg",
>>>>> +                             "sf-mnoc";
>>>>> +
>>>>> +        iommus = <&apps_smmu 0x2040 0x400>;
>>>>> +
>>>>> +        operating-points-v2 = <&jpeg_opp_table>;
>>>>> +
>>>>> +        jpeg_opp_table: opp-table {
>>>>> +            compatible = "operating-points-v2";
>>>>> +
>>>>> +            opp-100000000 {
>>>>> +                opp-hz = /bits/ 64 <400000000>,
>>>>> +                         /bits/ 64 <100000000>;
>>>>
>>>> So, you've identified the issue earlier. The shared clocks need to be
>>>> scaled, taking all users in account. Please come up with the solution
>>>> too.
>>
>> One proposal is to have camnoc icc clock provider, there is implementation
>> available and it will be posted, What is the preference to have different
>> patchset or to have camnoc icc provider as part of this patchset new version?
>>
>> Regards,
>> ~Gjorgji
>>
>>
>>
>>

