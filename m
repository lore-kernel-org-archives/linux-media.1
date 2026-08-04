Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4F43F4DFE
	for <linux-media@vger.kernel.org>; Tue,  4 Aug 2026 05:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785823017; cv=none; b=VipXY3Cm+tlH0T3HIi86O3Xdm37YOJfCHnDCEnTBI0taSs7cjEuhbsfkZkAyPp2Bxh9HOEfreiayUMd0Mq4jb/+nD+WJdmvmq0sLHcYvB3FGODv7kqB/UeFdJs6SX35S1Gnjsx4E9v5ODgIrC7uenkmCoSda+UjaaEEedZqmoGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785823017; c=relaxed/simple;
	bh=258eEU9ggVkuDaLgqMtjjawoLrp5quPNHESnFmj8quQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R30WwI0yTMTgrC38YdfQ+XHVLbJF9Jwdcgr1IDQUWZmb63CNjZqxpE95U8XiyEC13FzNX3o9iX4use0aYKVDaIANX0xMMUnFHLrFSllx4I2rJVESBjLcoJgQ/rIv5XLdBKDzdgGCRtO9HEgLp//tqcWJgEvrzs7HVJ/aVVKP1DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nZSNcG/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0zWsN1d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nZSNcG/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0zWsN1d"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6741777q2429908
	for <linux-media@vger.kernel.org>; Tue, 4 Aug 2026 05:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CnkLpGEMBHT8USstxtuf9MhLdUsmmHDnwcAbAYMQAak=; b=nZSNcG/hn5T5GmvR
	GM3WJ4xNuTtJerPkOckmnVf5sdVy5gfNlSEppu4EDVrptKj4XaW9Xr06UXNV5hmX
	BHmNMVDRYtLaSOfIUq0H5/qfG+aIyTtjtUcyqrsn/+7njbg6l5T0Ie69lpaYmMbC
	cWQ+qzC8UNPyNSbPYYGV5RV68e8IQ/TeABCK/Rl5v7Sdr8E9SYmWx9n6SSjp4wxI
	gXTQZBsw9mTtorC4tHGhIyUpgvfj8omani7HOUVb7yocJCG7oALFSFbKA7CqONL3
	cX7TmsxQ9yisJNBuUecj7c0/juELoZcdafDHHnzEQ1KAqTJcBGE4nJgAS/Jdrvuq
	d5toqg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3r2ntf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 04 Aug 2026 05:56:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0e702df8so43926411cf.2
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 22:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785823014; x=1786427814; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CnkLpGEMBHT8USstxtuf9MhLdUsmmHDnwcAbAYMQAak=;
        b=d0zWsN1dt0q03ygG8LQPtPxsYYMCw3pxsvCSSfmekn2j+Gk6NQzewmV4DfFdFuv7gd
         1DUsE8u9/sEPvOvcmb+mJWYhIseiQJqcXTHmM29NHDiIv1rAYV7jafLnnP97EP6NP94G
         rG+YwdllW7A54/Gx2V9QNG7pK0J4WGqHTKC5hGOT+Uj+mts8CRrGtKOhO9ZAgvFY5voT
         PfR0KyH2CMumpHIA2UkuvtY6gIf48jtg8VahS/CBYOinXbjywAI69zWfKqXJ+qfvn4O5
         Wn4EDVqsiUF/do6GmogG6n623lBfTxn81lF06IrIdWFUdrqTObM6gL+59INWsaoxF4+B
         w1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785823014; x=1786427814;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CnkLpGEMBHT8USstxtuf9MhLdUsmmHDnwcAbAYMQAak=;
        b=Z/5XILAUL34+ZFkH8UCTsl6oHehdkXrF7PQZ/3hAl1qn7ByaYCn4v6BAHTd7dyUedO
         io/V3dWu/8V++EjoEGKuyPpJHs0iLLmEj2w9T0RF/hlBe1PKCtbK+l0g2rjwqtOVJMNA
         qVkEFzl03jGA+STYTP5g3LvOkyttk0YstmUk4f/8rl5OxmtDLVi494fTztU5YXyscBUz
         vOCUpy3RSrEpDfej1XF7yaAE3qw2rJfxt6fzD0Sw8ng/1lPQfBfTromEQodOiyB8DkuS
         tr3aEzX48dThsp+6jqZ7OiEbKgi6zXDQCM6G3MbUf4aP2/sNMVNIxvpZSbgtlTe39759
         4VJg==
X-Forwarded-Encrypted: i=1; AHgh+RoSKEF6yXt/ShYhsfVc4/R0i5ccrYbDalJj9wf53OA0MmXpF+HQdZKBbEEh9zl+1kIMxGrtur6Ys/fLIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YznprQKojrAu1NbbcR9vS/acEEzvHj0jjpop6rD4M2xmmPzSRne
	MtjiE319ZWgxfeqb75QdgJPU7Wd/dzHzIZ8UtRprEvr6wHrc2ID/mR6E/yb1OOkBFWw6lmFhzGg
	XMByphj8wV1h6c2BR+CDus7KfeqTTt/D6xgDVQewLsANyqJVEfFP0HLSQ6gD2YhiIVw==
X-Gm-Gg: AR+sD10S0Fg+lt7Lk/eRbHMN1QHj1GLGKeNbozVn7Avp99rQ99wl1CQgcEuTNmGY3wF
	eUAFIoOdcZG2bbcMrzpEGK6xxc9UwJPONPJtHanzpGS/f7njZbZgie3mgZKy4+849DbKAYb7Dhb
	mScG4yKFPd3ZLRvlbzM21LrWLIOmnB0fQ7SMfA081pulh/xv0gCgn6uiBkchro5rtPepue+Z/Rz
	Xz7SjveGOE1Fu17cCM8BfCX+jLX/KJJV08A4v8HFT3+1M/9e2fRmC2V3A0CFmgfQKMdRGPBxEuj
	jajb2iPeXfAejKegL4ezbDJtG8hdJnIrtrljU66tW5+uNbNVwsymz9SbGL/Vg8u6eu+RR3W9Npa
	27Q4p9zlvZk2rqYeFT3A1lSlxI/u7vwQSVCJ5EBRVI7xrUy+OaYmL62+7rzb7i3BLRmJVNv9u
X-Received: by 2002:a05:622a:5145:b0:527:43a:2f31 with SMTP id d75a77b69052e-52b566afa58mr262163351cf.15.1785823014174;
        Mon, 03 Aug 2026 22:56:54 -0700 (PDT)
X-Received: by 2002:a05:622a:5145:b0:527:43a:2f31 with SMTP id d75a77b69052e-52b566afa58mr262163121cf.15.1785823013571;
        Mon, 03 Aug 2026 22:56:53 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c5b1a66sm6954381a12.10.2026.08.03.22.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 22:56:52 -0700 (PDT)
Message-ID: <275a6cee-08d1-477b-8803-e57992d49052@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 08:56:49 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
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
 <wmac2yl5i2psdld7pnj67bnpjx65q5recfw5zi3mbxko2inpgm@5g2kzyr5xx57>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <wmac2yl5i2psdld7pnj67bnpjx65q5recfw5zi3mbxko2inpgm@5g2kzyr5xx57>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=caPiaHDM c=1 sm=1 tr=0 ts=6a717f27 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=D19gQVrFAAAA:8 a=EUspDBNiAAAA:8 a=XqDJFxXNpytrKbGnDnMA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA0NSBTYWx0ZWRfX1fzPOia7IU0x
 hODg7bccN8uIDQ+L2r+BkilA15RJYpJZv141nEnuJEsbOUvTF+7nrWzd61Vyb0fwA2uLri5Ax72
 htsIMx4o9C7e/fLRf54IyE0AAncAQg8=
X-Proofpoint-GUID: xMldieyUyJaTvf3ZWbGOBFfY7K3Wj2e8
X-Proofpoint-ORIG-GUID: xMldieyUyJaTvf3ZWbGOBFfY7K3Wj2e8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA0NSBTYWx0ZWRfX6n1MflzsmHUw
 5ZxAHb9Oc6J48SzeJvBjvZlSCEJJbbZvVJVtW+QgljXlqpPZkRdDkUcIWGUKGKVJ10EpgtLx25I
 3wqnnSF+rxbqbHGXgffYPv2b8KdnymP4O2AxUODZlEjjwuDjwvkP8QH2k/AahysD5L12EdTr92o
 N4EbpY8uue2T1tipk/b81T/qBbc0j5heejtMntnYPduZ20LepY2zPCXDnYhCFjJNuoiNlFhtCSG
 ZjWvGnwZ/24xtN/ahXX+VEKO9gRkAtZznB+7tiJfikU19GQZP0mgg+2l0aJJuBGzED3snv2HHaK
 ocjcAU3GDkoToJsm8uTRQqXhZmeMHH1BtJ4FS++CH1swz9zQctWaD75zyHf4ieVomp9o2BXulBj
 U/rPN2FH800hnZdR0eg6BN610wRGoG5Uz13G51zPApLIO+xfNrZ3KCTXhhKhCrDyLQzTOybWAYy
 out8JJiJtAeozvmfBkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040045

Hi Dmitry,

On 8/3/2026 9:16 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 31, 2026 at 10:26:39PM +0300, Gjorgji Rosikopulos (Consultant) wrote:
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
>>>>>   .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 156 ++++++++++++++++++
>>>>>   1 file changed, 156 insertions(+)
>>>>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
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
> "core" is better. It defines the purpose. They problem with clamping the
> "cam_cc_foo_clk" names is that they change from time to time, while the
> IP core doesn't actually change.

I undestand, ok then we will use core to have similar approach as OPE driver.

> 
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
> 
> It definitely can't come _after_ this patch. We already have CAMSS
> voting on those clocks, so adding JPEG shoudn't disrupt its
> functionality.

Ok, then the camnoc icc + changes in camss will came first then on top the JPEG driver.

~Gjorgji

