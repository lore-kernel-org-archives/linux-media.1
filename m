Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775794;
	b=R1JGQz0aaxdHXwX6+SNKDxlRo7enoBGQCdglPGAivvgpnCTOpbET4Sg+vUPFxD0mPrDN
	 z++Fiv41Hj/loj7yZHePaGao5VC65hWzcvIjdT2bfvTqgRXLCB/+4wNbMBnurv4g9V1yn
	 36oHSyHtkFpjRwlCwdnaAuKy1/SVBrK1yWBzyI8VE3wsMUjnQMCwdmT3EFjx8w8avJhli
	 soMNONcNZgXNLPdftUblANvcpm2Hc+4UEe0x7iosh5u11K4pXq6j3i1mUjsTfNfn5nu4t
	 2jf0sLyVOH7k+AR3jTcwwu6tNPiofdh+llkyUufghAxSwoWNe0wngHbMb4eigJnOFIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AxT6ErZcxtbn4jfQ1enHPgny/7wYHTfvzRYz44rVvFc=;
	b=hn4AreJbt8OlFi6+pdIZYQyXU5a0fD11TkP3IjI4BWZe4VURLs9jCbh4RrZIYBNXlNBE
	 xwj7kFLYfKG80/xhzcjWRVewxdKJVrz4RZhp6QZ5nA9Ry2iLo2f+HGw5uq4S6JpeSckzi
	 DJuaSP5HjQUjKuduAuLYw7IP1y9paVkWv9/0HJjFFhn70n9UCIvHqTR/OK2kYXIZ/uCJ/
	 RZE9mCN85vQGgo9cLUGRo35akyVZPdvSKKe/XUVwZLqfemQ5tteE/+znqUrRx+6zC9A8s
	 /qZfAwRYttJIFnAmAOatKf8KOoxq2mg8kzbMUgDq0PljXY1uwAqzl7Ijjtt3mG3wEmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zr6JrZ8w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GeFm1eD4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439A6606A333
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 10:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 439A6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zr6JrZ8w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GeFm1eD4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GrSQ560538
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 10:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AxT6ErZcxtbn4jfQ1enHPgny/7wYHTfvzRYz44rVvFc=; b=Zr6JrZ8wY3roZmwe
	s4W71jwJW3R480YYLmwc69i0L73xBVVP4F9RfmmAYRFeTLZs5kGd0p4FCZFKp2O0
	GWvhGbbbqHUBrwb2vsZjKFhATCbRRU8AViNQLPNbV8p6DPqFJ4H3qy9nlO79JN8H
	EeT2nWktbC+GBD4QZJwLgTkqcUOfrpjXzoc3G6imrVNuYyzL5iWht9LxcuY+SpUT
	GkzqTIT0zy1JFwLF0uVsmYdJL8kpRVy0WNRlxxfLBtFuE9u+rikWE5LrL056RdUJ
	qOwkv8dDFZ1qc3ejIWWtCGzVtvNm6YbM1TMz04LjPKUPJaT9/0tXho4T/w+ptxPa
	G70mpQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqkj2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 10:36:32 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14373747468so7639475c88.1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 02:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795775791; x=1796380591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxT6ErZcxtbn4jfQ1enHPgny/7wYHTfvzRYz44rVvFc=;
        b=GeFm1eD4sroM/I8MtibdlGPCZn07QWhXaZQ5rGWyhW898HhZfupAGQglX62QqkDgvK
         Fq/VdSD+oxXk/aavL1jx5xEr9YcOmL+uMldST/kZXy6sotTdhIKKG+6aICSrRIa1rxAi
         l7yQajt0xggL98q1hIiVPD59LVZ/dJCx04x2HiQjmnGp9F0Y2CECbvKLRJUqDvASPJyB
         k3INmt6SJ9TVd+g46hpwTkk42q06KtH8NutLGFqUP1zN4nErv1LE5BVmr89LsQmLKEP+
         dS3AE554gwDKYtFi9OcLGuJz0AYHJ29ScVvh5yOB/BApmbtCKyveGrmOQZpZ1MzLOYOc
         3DMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795775791; x=1796380591;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxT6ErZcxtbn4jfQ1enHPgny/7wYHTfvzRYz44rVvFc=;
        b=Bxcnuk6KWAqZAX3Nke1gWDhl2WNThfYrtfwA7YpLgmZGhLrbftgkw+LhfhmNWzFrcL
         abb0d5+J4lyuE0cy7By76ZrM4kfbWGQqbupMLpLaIfbdpx+ImHGEuvqfvJK1V8TpTzvq
         uDf8HTYwPd+R3OJ0YSk5T0OSjBpwhVaSvTegw0ZVTkgE1y+NNue6r5xKnJdko+/fzuEl
         AQdU0oZtcgvJTlsgLZL0p2R1FtzvPg68cV8WxQKM89gxk1zNCPfe475C5bD9AaxQi/BB
         /mxG0dnpEe44lbdeL6Uqq6vk6kW4SInSeRpLC3mrQWDrssXh7yyAZDiqPkWoJM0tN9ny
         ZIdQ==
X-Gm-Message-State: APuU4Z8ODSSiXPhQ2xzTa4g0ttNJo5+BrP3TUOyrJZ+r3TlORiP/XJ1N
	c4nDlXzClaRmlihg0SVcYtU1Ihmjh7gpX4fGcRB0Wy8Lt7CqKvfAwpEgiqjlSxpbnF6yyT7o8wR
	56paKmZgZf6gcj9icCBEenQeE5LjTvk+CkCKT6U73DjthgrXIdBEywY7W9/5qV3pb5Q==
X-Gm-Gg: AZFdTZd22ltry1+/T2ZzCXiw4IkvfLD9ajj87Gr1zLRzpUzx2eo74WyH8NgI5vsN6MF
	2DpN8q68+YvxXPjgcyvj0mKU2nWigIAjsg0Xdf7pRKnqRe7xjLjrdFnHQ0HQ+XDOv+eVpT+wNWi
	qc7izSQEoCxfI7REufRgfrK+Ot5i1tfZzQyn4Y3bxH1yIcJ85ngRNLfkXz32mZTB+D1yVf6gASQ
	pHJSyW598FUwaQ+YEUBKaaPEVmsXU24ORdTmED7Nh26hev2dwaxyyM84qUwDB2mxLDxjeFrkwjV
	js6tJgocbPo4TMN33HRLpyTJ8lnZOVZTIiuXUNPvNVfD9yaLVXpT9v7IQ5oHiLvn4euRiQ3TVQc
	/Vo9RXIpNakrfGDDIwzd8JNCREkmO4yFflgLEPXRjQE0Fr3nLT+UaXYL/qofkH44FYFQ0Ty/lLG
	3hzKt3
X-Received: by 2002:a05:701b:42c4:20b0:1b3:aa92:b183 with SMTP id a92af1059eb24-1b556898c1bmr24211401c88.15.1795775790736;
        Fri, 27 Nov 2026 02:36:30 -0800 (PST)
X-Received: by 2002:a05:701b:42c4:20b0:1b3:aa92:b183 with SMTP id a92af1059eb24-1b556898c1bmr24211376c88.15.1795775790126;
        Fri, 27 Nov 2026 02:36:30 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm92427615c88.9.2026.11.27.02.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:36:29 -0800 (PST)
Message-ID: <ef6b1405-8354-a6a6-2c5f-344449fd4492@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 16:06:23 +0530
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
Subject: Re: [PATCH v2 1/3] dt-bindings: media: qcom,mahua-iris: Add Mahua
 video codec
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
References: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
 <20261123-mahua_iris_enable-v2-1-b1a16b16afca@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261123-mahua_iris_enable-v2-1-b1a16b16afca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _Y8zDzwadjzn7omTkPyoi0OE5GMuno5H
X-Proofpoint-ORIG-GUID: _Y8zDzwadjzn7omTkPyoi0OE5GMuno5H
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b095d30 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=9jCxr5-6HRLit5GijAoA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0MiBTYWx0ZWRfX44fXugvR+H6/
 Ii+CD01Ofr6FqIYQWYjB5nJ3DnO4U082eVo8Nrg2IwJNGWocmSotwLKhp2PEv7yVrJhjKsCmxOI
 V8iGsIGU7xBRC5Wr6WIhN7MjEH71GSg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0MiBTYWx0ZWRfX/F7cAGTFdmv8
 P9gOiTU0fnL7umFf++fH1iQmoXXi5p0Xa78MMtIrvuCPOroVRFG1/gI9S365JBKxvgSF1u96sLZ
 Vem6l4MWDmZU6sO2WZTcioFuPXvjb/PSkQWwrRk2lL+gA6vShYYBX0WHFxKyz8S+Z4CUxsUMDrQ
 0wPH8K2c+St9jJDTO1yzuVXmW7aAoUhsCh7DmN5e/yfFxnPSmMhX5aBqIjh8nVWGr3UYps9MzLr
 a/bHnrwjePgWuFzkmTbgdouyP/xBseYjGjWJN6ojTDO7kQvLSyV75nd90PfiX9mAJ4rnp+2SofC
 bR9zaa3nl7zkIQ3dsxL3ZkSJUno5I+YVq0VJYYVc65PHKzZQTOYpxpeO2lVQ+RxRw3J/vUXwEDv
 vrQjbMur8Yp29wWKV3i56Ah51WSDsGD3X3scFjaTa54QUdAZuIWEFMkDCxA8PKYnhSNMExjE4C2
 2+hl4lL0O15ukIVVjQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270042


On 11/24/2026 12:14 PM, Deepa Guthyappa Madivalara wrote:
> Add a devicetree binding for the Iris3.9 video encoder and decoder block
> found on the Qualcomm Mahua SoC. This is a single core derivative,
> leveraging most of Glymur data with the clks, resets present only
> for vcodec0 core.
>
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,mahua-iris.yaml | 200 +++++++++++++++++++++
>  1 file changed, 200 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..5a96fd4ea08422daf3eb0fa832a75a4994e86ffa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
> @@ -0,0 +1,200 @@
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
> +    const: qcom,mahua-iris
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
> +  non-pixel:
> +    type: object
> +    properties:
> +      iommus:
> +        maxItems: 3
> +
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
> +  power-domains:
> +    maxItems: 4
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
> +  - power-domains
> +  - power-domain-names
> +  - resets
> +  - reset-names

clocks, clock-names and power-domain can be dropped from required list as
this can be already present in required list in qcom,venus-common.yaml which
this schema is $ref.

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
> +                 <&videocc_mvs0_freerun_clk>;
> +        clock-names = "core_iface",
> +                      "core",
> +                      "vcodec0_core",
> +                      "vcodec0_iface",
> +                      "core_freerun",
> +                      "vcodec0_core_freerun";
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
> +                        <&rpmhpd RPMHPD_MMCX>;
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
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        dma-ranges = <0x0 0x0 0xffe00000>;
> +
> +        non-pixel {
> +            iommus = <&apps_smmu 0x1940 0x0000>,
> +                     <&apps_smmu 0x1944 0x0000>,
> +                     <&apps_smmu 0x19e0 0x0000>;
> +            iommu-ranges = <0x25800000 0xda600000>;
> +        };
> +
> +        pixel {
> +            iommus = <&apps_smmu 0x1943 0x0000>;
> +        };
> +
> +        video-firmware {
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
