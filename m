Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912170;
	b=aFob3OakhYkRHOb/kG7vPEr6cclV62NOSzwv5c2QTYm7m0FjVXb/a8JYNc2yyLavCTvB
	 fF5sLC36hMbdklU0j5X5kfSu/C/XbNON8PFcdSgqvnpE1LJwqYbzIgKD8PJMdSbZa97z+
	 zAl9Rk8ygztGMRqtIpXU1DM7CQvoleKFz4f3tBtMJ8QA8SXikGKOFR5yWLgeJhxb4JG7a
	 J489vkxghhmahZWEv3XjP51Vpu0LbseJKrFTkk30h65xquWlqKyTQcNTKa+yq6iP0Pxv/
	 ho3mRqoQAjd62Pzz+VKQduqCJed2CGtZPyCRVYdF+XgE7DriAL89xL6aPsrl322Oa4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912170;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=c2CZmT+o4RDtlSE0AO927KZUMx4123MJsifI95eGzgE=;
	b=iVGTKW1zkLIjdQb1r+9LN+bKI9HacV4Skq1XzGFawPWU/eceytDDleBqGpa8TrSa9TEm
	 0B3MOnuxypRcInm9JONgYkTl2kRt3zBUmYtrq3p6vGkEhMpSFvFCkuDtD8mJTDYf/Aacm
	 Hh+DqsYomvBGRfMk+NdHLMXJ1vyOESmieJ5TkiI3ma6MSKckWn2mlZ/1iWeJeCURR1vC0
	 M4wvKQKEzIByXlaagjtb1jvE5MtFyisYbYszWVuk5aAz1TSU7fN+66/m+XxX/kpfc5Xuk
	 PHWOibQiUQwffI0JohT852SKlUd7kv7xUpnzb+Oc6/TjwXMyvhS5NLE9KjT6AWssRLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cl6mn4UM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=By0VwDQ0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54308606A31C
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 10:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54308606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cl6mn4UM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=By0VwDQ0
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6exBx2998579
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 10:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c2CZmT+o4RDtlSE0AO927KZUMx4123MJsifI95eGzgE=; b=cl6mn4UMn5QT1Ff6
	Zh0lNn+9huO+FxILQf7OVc2u27OZtFD9GDqbplGkLnRYG9wapRCXOWibhS3bLXZA
	g8LPogilqww7GKevyWzJ/QAwMsZNPlPrjyEoeBIN8RyY5Y3Dwn37r2nYe1aOV6ap
	stQ6wnUcEwFhhrO471QgHk63SS8vbI5wCEkbOJE1qQdRSZG9MOKwqKh1htTstaFG
	hxyk+a6g5KZqudjYkw35OXQg2HVktffFPhKuTXbpvDKNxZO16IQ4aJFXWQLopEne
	bW+JbwqvPHfjj3LCPj5Q2Nl3LO3i2rtsfPLtiAkHQgGDDUgv56jkFpcdArC5Ohfd
	e3SUSw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve0yrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 10:42:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso4284744eec.0
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 02:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794912169; x=1795516969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c2CZmT+o4RDtlSE0AO927KZUMx4123MJsifI95eGzgE=;
        b=By0VwDQ0eA03930TTi0zwl7qXvHF1gTisiDIY/cgNbsCr2FU5WUMUOa79HvGF7xXoP
         tl0CsumInO+syBWzl/a4VsOnPiJRf6Sx2FXHQBzLxpMZtz4KTXX8En/OFm8jSK7wDnTQ
         j7HwlPA99hrBALPR9qlsGWL9RrZpZpmRLeBRjhMSd7gc8O+1ocQT6BUJNOR0RK2lukyB
         fO0lMpOEIY817gbjF02QI1hB6NzccCJCfp5/pF0v2PX4+y/cJTIFVsNilka+9JSWrdd6
         qbS/umN5Fg6jtnMtB/21zcPLMiAYZlPh9S/TnW1AEGdSCTKRqwBZ55MnxdGZnGZ/nOlZ
         uQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912169; x=1795516969;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2CZmT+o4RDtlSE0AO927KZUMx4123MJsifI95eGzgE=;
        b=iD8JWcxQJnryVUab5ia1q+BI05NOyDdWV/eP+JBHH2F1nUl72GboMTemwXsqjEjBoK
         S8kLMtLrYrejvC84HfBpDuqfwVTEaOkAUGU2cQRUCjZF2ndXk0gERP0sysgr80Yl38rC
         YUFSV7VZG0RVIFok3mnCH7j3+703Ismrw5YP965Qql6Bo4CjcXuDMxlSyG0uOTvbhLPm
         aZLR4b9si8WlxoJ3aUB0qRGwwsAUTnOWNoi6V5I16cmt882b2Vh3R4PnrqDlraQlvUBv
         CGeYENP1dVkkN2wNdMnkbLXbfJjbpNmziKJu9FGAzWy4XizKzs3RZPUht8mEuYuxX0Zw
         ibtQ==
X-Gm-Message-State: APuU4Z/SMVmDcPzomKDDuNdjkSKtQrxMdmsyp1HsAgwtaiirebkG3nQB
	d8VARlEIjcJCfvIqT46CqLbXb/RWtyyfJq85idcgfi9QHOm2AkkyUTdZuVOxlYUZFLaP2ih9LPJ
	Jf3Ya1NNPAYSrlEMUCtxZCedeZDftMjt9p5dMK33pr5SEz+3ff2ja+kPFwk7M0RdCPQ==
X-Gm-Gg: AYBFou1zDAsJ37l+nugmjiEyNj3lrOjs9W0PEKpeCH3K6OqflY+fB8Smvhet48pHNcJ
	YAS1uZ//4rUsyxn2CXXh6vCFa9bOp96AtCjL7KL6gVTjJ7HEtASOn6bsVmQEKHLwB7nq/PeL5sB
	EC/w4AkH91664QwN0shcg2n7IB2qqLltt8TRoke74Q4M0778hlU2UUm8jue/NHkfKzXnsSIMh0H
	maMPUUqEgW3+EsZ++2hkIeccfR/6KYmrEX9OBIPSw0lkcX296eIXl0XitLHkbL9mLaApAFO7DAt
	QHJWBXX0gstn3bSG7H7DCvXMx3ZLHrTMDAfsPXLPa2XY5wQoqAKq90VWEf0Q3qHL2mYccIRPQkr
	PFYCTP/ZnaPHvs86X7byd8HBtW4v37pkgrqK98OGk1uPoyTQ/R9n9JgcjsTjiDmqd1JH1wSMwe8
	cS0VSp
X-Received: by 2002:a05:701b:2402:b0:1ab:faad:cba with SMTP id a92af1059eb24-1b5030eb09amr10946744c88.34.1794912168734;
        Tue, 17 Nov 2026 02:42:48 -0800 (PST)
X-Received: by 2002:a05:701b:2402:b0:1ab:faad:cba with SMTP id a92af1059eb24-1b5030eb09amr10946714c88.34.1794912168051;
        Tue, 17 Nov 2026 02:42:48 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm43918360c88.14.2026.11.17.02.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 02:42:47 -0800 (PST)
Message-ID: <e693b076-39b9-46d5-468b-800159a47f76@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:12:40 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,mahua-iris: Add Mahua video
 codec
Content-Language: en-US
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
 <20261113-mahua_iris_enable-v1-1-b7107e1cbcaa@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261113-mahua_iris_enable-v1-1-b7107e1cbcaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX9pBqtdTyv4U2
 6LGCGBSCZz2affJjc3Uy9xb2a9xWWHkyWFImkEIMZQSo4JBWCjg0nV/BwUuV0eufytYuh7zepqC
 IiWZn8gf+RIU5nKVnckbWqX4qnkR9Fs=
X-Proofpoint-GUID: -XX-uZx7h6m1Tn2zWG_2ffia0sV8dPt8
X-Proofpoint-ORIG-GUID: -XX-uZx7h6m1Tn2zWG_2ffia0sV8dPt8
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc2fa9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QknTHhjYaj74atS0PrEA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX7qAKUCCkk/F6
 VOgtAYLBXmRoe3DpsZfJhxHwNpNfpw8udtbKluQ16yfz820ngkgIHIoEV1lmLKoAIwiU3hb2FKl
 w/Kem5GjzKie7oZrwG8pX5ba29iqDbiFd126S4hSn9FPa/jWtH2Ng6bLNg5Z8ELfCyAy4YOa4ym
 +6zaH3H+HFuB4cZnet6+SUu9NmlCEM8SVnORDUE6LPXOezq9CxXjY/9lVQmW3nggvEIiMD18BkF
 ZFHFeZ0nNSveWbchsS3mb/5/gQNhV+Qmjk9tv1z+EB+5FCS2GoIXTJj2VTsAyI3P7JnjyEUqZRt
 nIQxZ6Z+A5KGb/LMXyFcETOJmCNoaQ8m/Fcuc5f1ltO97w5rCkyOOpsEv4InBFiXijqaGW51C6z
 ecfVzgX8bsxO7QEaAMVox8cC7QTJZ3qc4Pvob0wVSYFvLsbHTPbLzzAu2XP915SkM+StR/Jj2Q+
 RM5fhroH5c00Sal/pHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170042


On 11/14/2026 8:39 AM, Deepa Guthyappa Madivalara wrote:
> Add a devicetree binding for the Iris3.9 video encoder and decoder block
> found on the Qualcomm Mahua SoC. This is a single core derivative,
> leveraging most of Glymur data with the clks, resets present only
> for vcodec0 core.
>
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,mahua-iris.yaml | 243 +++++++++++++++++++++
>  1 file changed, 243 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..cbae6bddf7fd4b67330ce47033874f3d349e5a3d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
> @@ -0,0 +1,243 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,mahua-iris.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Mahua SoC Iris video encoder and decoder
> +
> +maintainers:
> +  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> +
> +description:
> +  The Iris video processing unit on Qualcomm Mahua SoC is a video encode and
> +  decode accelerator.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: qcom,mahua-iris
> +          - const: qcom,glymur-iris
> +      - const: qcom,mahua-iris
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +      - const: core_iface
> +      - const: core
> +      - const: vcodec0_core
> +      - const: vcodec0_iface
> +      - const: core_freerun
> +      - const: vcodec0_core_freerun
> +
> +  dma-coherent: true
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: video-mem
> +
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +
> +  non-pixel:
> +    type: object
> +    description:
> +      Context bank for VPU non-pixel buffers, including compressed and internal buffers.
> +    properties:
> +      iommus:
> +        maxItems: 3
> +      memory-region:
> +        maxItems: 1

The use of memory-region for specifying carveout regions was discussed
previously and was not considered the preferred approach [1].

There is also an active series introducing iommu-ranges support for this use
case [2]. Please consider using iommu-ranges instead of relying on memory-region
here.

[1] https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org

[2]
https://lore.kernel.org/all/20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com

> +    required:
> +      - iommus
> +      - memory-region
> +    additionalProperties: false
> +
> +  pixel:
> +    type: object
> +    description:
> +      Context bank for VPU pixel buffers containing uncompressed video data.
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +    additionalProperties: false
> +
> +  video-firmware:
> +    type: object
> +    description:
> +      Context bank for the VPU firmware processing domain.
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +    additionalProperties: false
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +  power-domains:
> +    maxItems: 5
> +
> +  power-domain-names:
> +    items:
> +      - const: venus
> +      - const: vcodec0
> +      - const: mxc
> +      - const: mmcx
> +
> +  resets:
> +    maxItems: 4
> +
> +  reset-names:
> +    items:
> +      - const: core_bus
> +      - const: vcodec0_bus
> +      - const: core
> +      - const: vcodec0_core
> +
> +required:
> +  - clocks
> +  - clock-names
> +  - compatible
> +  - dma-coherent
> +  - interconnects
> +  - interconnect-names
> +  - non-pixel
> +  - pixel
> +  - power-domains
> +  - power-domain-names
> +  - resets
> +  - reset-names
> +
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    video-codec@aa00000 {
> +        compatible = "qcom,mahua-iris";
> +        reg = <0x0aa00000 0xf0000>;
> +
> +        clocks = <&gcc_video_axi0c_clk>,
> +                 <&videocc_mvs0c_clk>,
> +                 <&videocc_mvs0_clk>,
> +                 <&gcc_video_axi0_clk>,
> +                 <&videocc_mvs0c_freerun_clk>,
> +                 <&videocc_mvs0_freerun_clk>,
> +
> +        clock-names = "core_iface",
> +                      "core",
> +                      "vcodec0_core",
> +                      "vcodec0_iface",
> +                      "core_freerun",
> +                      "vcodec0_core_freerun",
> +
> +        dma-coherent;
> +
> +        interconnects = <&hsc_noc_master_appss_proc &config_noc_slave_venus_cfg>,
> +                        <&mmss_noc_master_video &mc_virt_slave_ebi1>;
> +        interconnect-names = "cpu-cfg",
> +                             "video-mem";
> +
> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        memory-region = <&video_mem>;
> +
> +        operating-points-v2 = <&iris_opp_table>;
> +
> +        power-domains = <&videocc_mvs0c_gdsc>,
> +                        <&videocc_mvs0_gdsc>,
> +                        <&rpmhpd RPMHPD_MXC>,
> +                        <&rpmhpd RPMHPD_MMCX>,
> +
> +        power-domain-names = "venus",
> +                             "vcodec0",
> +                             "mxc",
> +                             "mmcx";
> +
> +        resets = <&gcc_video_axi0c_clk_ares>,
> +                 <&gcc_video_axi0_clk_ares>,
> +                 <&videocc_mvs0c_freerun_clk_ares>,
> +                 <&videocc_mvs0_freerun_clk_ares>;
> +        reset-names = "core_bus",
> +                      "vcodec0_bus",
> +                      "core",
> +                      "vcodec0_core";
> +
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        non-pixel {
> +            iommus = <&apps_smmu 0x1940 0x0000>,
> +                     <&apps_smmu 0x1944 0x0000>,
> +                     <&apps_smmu 0x19e0 0x0000>;
> +            memory-region = <&iris_resv>;
> +        };
> +
> +        pixel {
> +            iommus = <&apps_smmu 0x1943 0x0000>;
> +        };
> +
> +        firmware {
> +            iommus = <&apps_smmu 0x19e2 0x0000>;
> +        };
> +
> +        iris_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-240000000 {
> +                opp-hz = /bits/ 64 <240000000 360000000>;
> +                required-opps = <&rpmhpd_opp_svs>,
> +                                <&rpmhpd_opp_low_svs>;
> +            };
> +
> +            opp-338000000 {
> +                opp-hz = /bits/ 64 <338000000 507000000>;
> +                required-opps = <&rpmhpd_opp_svs>,
> +                                <&rpmhpd_opp_svs>;
> +            };
> +
> +            opp-366000000 {
> +                opp-hz = /bits/ 64 <366000000 549000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-444000000 {
> +                opp-hz = /bits/ 64 <444000000 666000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_nom>;
> +            };
> +
> +            opp-533333334 {
> +                opp-hz = /bits/ 64 <533333334 800000000>;
> +                required-opps = <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_turbo>;
> +            };
> +
> +            opp-655000000 {
> +                opp-hz = /bits/ 64 <655000000 982000000>;
> +                required-opps = <&rpmhpd_opp_nom>,
> +                                <&rpmhpd_opp_turbo_l1>;
> +            };
> +        };
> +    };
>
