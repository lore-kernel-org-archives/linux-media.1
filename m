Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F6544BC97
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428661; cv=none; b=Zguk6aqG+qLlLfdp3+LR0qj5zz+EJxoY2eiHjGWVLs7GciZsuzF8ytJ63kpq6jq1/OoeZPEaKmPOl6ODeWBj4VOVu36K9h5FjDrlKabYOfhX/Nzm80+ECLRZQ4unCtDJjtYQqjaQp7mJvto0RqWR9yaPT38H53q6KkAVXKAdk70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428661; c=relaxed/simple;
	bh=dpip2/uZoDOcCop3JdAiXJzYey+lcsTRIz8edNKu49Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2rfRGmnX012HrXlLRioEYVG+wPJ9i874LNyqvjcJBzlykK8FWUEDBqhJ/2wV6LMs9K/7XSbOQaj1z8fHauoZmGcJ4AR+IurdNRjlv2dq5E/UCRlU2r9nx/dCoSat4s1UdTQeuqnaQTBUMKd0N2+Wlg50doVwbuk87H1MJiXUAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e7KEltL+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VYisReZ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e7KEltL+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VYisReZ8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFQr1k1225792
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtZ4bA9jJzh6TVyXYSVwoa6OBgZkfcD8fU5BYz9BmN4=; b=e7KEltL+uC+/AjrB
	xTZlZXCWW6nwUxKS3KLnpD4l4GiT9n3tO0aPJh9Zq1u/Q7C6cViQJuXDZt4wAp7C
	fmJk2KjCl7LxS/JbzepYAT83VDNC0Iprl3af5qxnPeEz/RxtYlCU/+F2XI4jvq8K
	Ftns0dQNmZjolIa1NkIm0VnlZG8rhhuZPMAV1oVHdKG+p5KzMOSPAnWeHC/ABZXt
	Kdul2FcYz0h6RYeVMsiD1P+DxmQ6TKDWwRAV7gC3LahNu/18gFrFCCryZBCWSG+C
	FzRjkIdejV7y2PGxYgJA6TMyHt9IDxEnVU/SUPqW0I+iSdcYuKwEexQ492SQ34Oq
	hRGMlg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8kn0kmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:24:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bf321d786so27119551cf.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785428658; x=1786033458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtZ4bA9jJzh6TVyXYSVwoa6OBgZkfcD8fU5BYz9BmN4=;
        b=VYisReZ8ns1T6S762pmABItGfgjGpyta7E+MnNW1Ep0b/Md9CNZowHifMB8Mu59i+d
         PAjL+U4FICSbHmqz1HVVMBNT2sSx6E2FSg7S6A04Au2vwHsBxN0mZ6nwQUUbOkGwI3JV
         QReR4qa4HKCqc8NvY9as+vN5Qmq5+EDnk7C+KTHYE6hYue1XOc2jEteb/DjSoovvH8+m
         umIVEAiMVUYQfKvn+aofaMvpfLNwk6NENwq6zTw4mpKJIGrhAvw00e0TZX0T2e29PLFO
         wLepSR7DNLdHtscyd3BjE7JJ3e5qpIYeV3VosNqqGR9CyqoDR4AVsGj+k8SdHNuLYn9v
         BWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785428658; x=1786033458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtZ4bA9jJzh6TVyXYSVwoa6OBgZkfcD8fU5BYz9BmN4=;
        b=SBeXbutLpOSciOj/mFA4pTIN4HeEPoLtgDpmv0Se1N2yonTVw2IwB2WTi0zuAPq0Rh
         7UbpAz/6uxbPOCeK7ni3XBHgt+n88mhn/JI9FH7IzeNOy6CiYwPqZMtHZwB/kcvSkGHm
         Jqa3uD4lv2Vd4aTNQXrPfMlebGMcIEAlxdvaiB5ZWFAzvgMLEn7SW7Z1DrZBrzxzBbS3
         YsxnzuLZeVBMCQrObwmOpnxTXGcAWyGAoCErXhc6biqO+FHcp2LImLKqINBD5aeSwOSC
         2F+Afp4HKa94UrylHZD5a1yWw/EEKfJ0pE+W5TKySJPH0bUuthi2s8NhGjC/basU3ENP
         82sg==
X-Gm-Message-State: AOJu0YzixbNB+hrkmopAbxHyHMwUQeNfmKGXtVfhUUaJY36m0wubwX6H
	1yiJHruRblKCOfewwvG1Sz2DEvgwUNKF/Kf6u7zaH42EvnJwOlWI10q9p2JqFQyPdb9mKuQMU59
	t3o/U8kv7Tkj1fRSaUUjk02hM0Kv+ED/3NEZohIeoJ3Rw1idkL9kc39lv393lAi3W3A==
X-Gm-Gg: AR+sD12FDsrarO9/MjhmpmLuClB/TLGuxS2mcREgjP5w44nFVIrJHk2XRsnpEXfZb9h
	IHTaVc21SRpZuALUZsRyCx2PUsUgRqdrajvmq/H8NVaWLgOse+ABaqdknbvU+ANWfB7G80D3OiS
	K2BR/g9RMZbjzYAIeOaAT4VMsuws6Gv5Sg2hmVa0l+1bZQJfJCOI2cGKfvJG/3pA4ybrwZG0Zxd
	X0PmqYygN2oUAD3PUPJJW2dTGWHvy+Q+hg8LCf9kUIEW5Q6jxc2HSiwt28p9RN7zLKZFnSF7VUQ
	3cHmR1dTZ4eqObC+TTDBo1bBvdqg+0NJAGTBPMS0QQmqk6hvJ1o6qpgwtN1iO9j8x6yVM9moUkP
	/77HyiK7Ed3xfOXOcSx9tPZ7GWbnXGLdj
X-Received: by 2002:a05:622a:64f:b0:51c:af4a:9d50 with SMTP id d75a77b69052e-52b3869c11bmr37699581cf.68.1785428657538;
        Thu, 30 Jul 2026 09:24:17 -0700 (PDT)
X-Received: by 2002:a05:622a:64f:b0:51c:af4a:9d50 with SMTP id d75a77b69052e-52b3869c11bmr37699151cf.68.1785428656848;
        Thu, 30 Jul 2026 09:24:16 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07d3a2914sm840072a12.27.2026.07.30.09.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:24:16 -0700 (PDT)
Message-ID: <deee4b5e-167a-4f37-b2fa-84f06ec33721@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 19:24:14 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-2-atanas.filipov@oss.qualcomm.com>
 <3cbnmjmit4gsldga5nzct4odg6hpixzlwxbj72elnogyevr2tg@6esyjj2mvyom>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <3cbnmjmit4gsldga5nzct4odg6hpixzlwxbj72elnogyevr2tg@6esyjj2mvyom>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMyBTYWx0ZWRfX5dexwyZceVEC
 c1Wvm9FeZ2fHQDyvVThZpat/wcrvBx0+YEzMqriEEl5r1a08YIb0UzmYzBnTzfYzDSwSwU6tq3i
 /AfzDSixnh5Z3acLqSLZupC9WaAcasA=
X-Proofpoint-GUID: pxgDqmmsO2SlJQc85ohV_1KheSXguiC2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMyBTYWx0ZWRfX4aC0ePUBOqbJ
 pi6u0NfHOowesz+ziMmLLiclSWq2nNUqeIYPhIKjNSD92HJVYSYEEMDbgGdwdoOfEihfBar9aPq
 akF+lsizQ9sjF8qw4jGcuztSXKpYjSS5b7nudM+e19rWFP45MOsz9+EWww1lpggHuFlXpJsCoQ6
 Tq06Z/IOAZ8NVWcyGU6ZFWDk9lBfV6bwFStISybaGp/NtBRlN9NiRbuy/23HpqhrpSIcRqGkT0y
 yveIgpLJ0KoYatWoI++sfFLCxmF0EavI/Et/NyEGng9rsPlbm660C1Cc+S/7mTeFQkuk4wLLNGN
 y/s3cmelH8ZKphS/MkHi0vfzkcx3CpDAS0X/7LhqUnCZ7vDSdfGzBfP+FRxn6NuHO41W94VvbIk
 Nd4n1kXGztkl+maqffHZ2vDFY7dYqiBv3LHCGFBIzE7L+ZCzWf8GtIDWEAKaWFKW50aimmUIrcS
 Uh9AH/qDuy5gzijdKiQ==
X-Authority-Analysis: v=2.4 cv=V7NNF+ni c=1 sm=1 tr=0 ts=6a6b7ab2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=2iqQDksCm9cAjr31UZcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: pxgDqmmsO2SlJQc85ohV_1KheSXguiC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300123

On 7/30/2026 6:39 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 30, 2026 at 06:05:22PM +0300, Atanas Filipov wrote:
>> Add device-tree binding for the Qualcomm JPEG encoder hardware block
>> present in SM8250 (Kona) SoCs.
>>
>> The JPEG encoder is a standalone hardware IP within the camera subsystem
>> that performs JPEG compression in memory-to-memory fashion.  It is
>> separate from the CAMSS ISP pipeline and has its own register space,
>> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 156 ++++++++++++++++++
>>   1 file changed, 156 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
>> new file mode 100644
>> index 000000000000..70f573100573
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
>> @@ -0,0 +1,156 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,sm8250-jpeg-enc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm JPEG Encoder
>> +
>> +maintainers:
>> +  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> +
>> +description:
>> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
>> +  The encoder is a standalone hardware IP within the camera subsystem that
>> +  performs JPEG compression in memory-to-memory fashion.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,sm8250-jpeg-enc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 5
>> +
>> +  clock-names:
>> +    items:
>> +      - const: sf_axi
>> +      - const: core_ahb
>> +      - const: cpas_ahb
>> +      - const: cnoc_axi
>> +      - const: jpeg
>> +
>> +  power-domains:
>> +    maxItems: 3
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: titan_top
>> +      - const: mmcx
>> +      - const: mx
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: cpu-cfg
>> +      - const: sf-mnoc
>> +
>> +  iommus:
>> +    description:
>> +      SMMU stream ID for the JPEG hardware. The stream ID 0x2040 is used
>> +      for the JPEG core engine on SM8250.
>> +    maxItems: 1
>> +
>> +  operating-points-v2: true
>> +
>> +  opp-table:
>> +    type: object
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - power-domains
>> +  - power-domain-names
>> +  - interconnects
>> +  - interconnect-names
>> +  - iommus
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
>> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/interconnect/qcom,sm8250.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    jpeg-encoder@ac53000 {
>> +        compatible = "qcom,sm8250-jpeg-enc";
>> +        reg = <0x0ac53000 0x1000>;
>> +
>> +        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
>> +
>> +        power-domains = <&camcc TITAN_TOP_GDSC>,
>> +                        <&rpmhpd RPMHPD_MMCX>,
>> +                        <&rpmhpd RPMHPD_MX>;
>> +        power-domain-names = "titan_top", "mmcx", "mx";
>> +
>> +        clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
>> +                 <&camcc CAM_CC_CORE_AHB_CLK>,
>> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
>> +                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>> +                 <&camcc CAM_CC_JPEG_CLK>;
>> +        clock-names = "sf_axi",
>> +                      "core_ahb",
>> +                      "cpas_ahb",
>> +                      "cnoc_axi",
>> +                      "jpeg";
> 
> What are the pin input names for these clocks on the JPEG side? Can we
> use a better name?
> 

In my opinion, there is no such thing as a better name; the only 
important thing is that it matches the HW documentation. As can be seen 
from the clock names in the FW shown above. So, could you be more 
specific about which names you would like to see used here?

Regards,
Atanas

>> +
>> +        interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
>> +                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +                        <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
>> +                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
>> +        interconnect-names = "cpu-cfg",
>> +                             "sf-mnoc";
>> +
>> +        iommus = <&apps_smmu 0x2040 0x400>;
>> +
>> +        operating-points-v2 = <&jpeg_opp_table>;
>> +
>> +        jpeg_opp_table: opp-table {
>> +            compatible = "operating-points-v2";
>> +
>> +            opp-100000000 {
>> +                opp-hz = /bits/ 64 <400000000>,
>> +                         /bits/ 64 <100000000>;
> 
> So, you've identified the issue earlier. The shared clocks need to be
> scaled, taking all users in account. Please come up with the solution
> too.
> 
>> +                required-opps = <&rpmhpd_opp_min_svs>;
>> +            };
>> +
>> +            opp-200000000 {
>> +                opp-hz = /bits/ 64 <400000000>,
>> +                         /bits/ 64 <200000000>;
>> +                required-opps = <&rpmhpd_opp_low_svs>;
>> +            };
>> +
>> +            opp-400000000 {
>> +                opp-hz = /bits/ 64 <400000000>,
>> +                         /bits/ 64 <400000000>;
>> +                required-opps = <&rpmhpd_opp_svs>;
>> +            };
>> +
>> +            opp-480000000 {
>> +                opp-hz = /bits/ 64 <400000000>,
>> +                         /bits/ 64 <480000000>;
>> +                required-opps = <&rpmhpd_opp_svs_l1>;
>> +            };
>> +
>> +            opp-600000000 {
>> +                opp-hz = /bits/ 64 <400000000>,
>> +                         /bits/ 64 <600000000>;
>> +                required-opps = <&rpmhpd_opp_nom>;
>> +            };
>> +        };
>> +    };
>> -- 
>> 2.34.1
>>
> 

