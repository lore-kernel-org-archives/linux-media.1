Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617119;
	b=A1yDcLKvrZM/gEechUJpzufS1xxtZM66HcT3765r0EjDbxtIQBgvO/WwBCsDuYoSQvDF
	 0vwUdWwqO2EKIRwODgywLzzTg6Cyo08HlszH5pvVdLfC5SIv/k9LIuYHW5Wa5+1eQtQnn
	 ZgWEK3/HceUGTRte6L8hYj9G0th53PkzNz/5Ku6swyyUralRs/ohzsjWkW8gFZX548kh+
	 ECK+GuKOY6hwniQeGr9jLsJlr0fDwr8EVsKN8xBHllP4tQvaegV/6NsC8MrGy9xjGWjCM
	 5QJ+Hwu4HyVq+sTrrmQgw7laBExKBDcobkLfFM0YACcgx8j0J0EBg44FJS7s9/wokgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=zKfRowNSGjVA87CJ4mW494zsgUl/v5ojHBz8f5BNf/0=;
	b=uDJ1w7nCXKwM2Pf3K1rGQkOJmV6T80vWmgXVshif4kOf0pFBxTXmqSyQWU+iul4CDMOK
	 3aqiWIyjYlFJzQz3uDES6ggUPhn99axWSo8FR0nGAe/EKP/PKTM9LFkK1WGVh6opFIwq1
	 U8ujorVC4BNoK/4WLrXAQmWFzrAQlrXA8w4OpmYoS0YJufNoM/Zm6FxVDbFpcCSP+zkJs
	 u47kN7eW8yVxlshjDF8IzqsgKX2/tlBAlugvvTqz/7PMrkamDWd8PRg+0ySsPiLm2SeCC
	 LNfqF98kD0Hw5r3yw9Tj44spOBIKAOQztggorL7+9VOGdeFe3+/zkpcVFtcNjxUpXfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AdI7v2p2;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D866606A326
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 14:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D866606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AdI7v2p2
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3adfb0c9e3cso4821831fa.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 06:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795617117; x=1796221917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zKfRowNSGjVA87CJ4mW494zsgUl/v5ojHBz8f5BNf/0=;
        b=AdI7v2p2DEnGcimvFHEZ5FVOQzGh9kkiGvTi8IyruIj4NZ9mtrDkotiCBgY8hdHcFJ
         J5vpTFTxElIV3Bfd2gJcR1dSzv9XNkGP/Y0is5nM+gHP5MukTCaUJCZEQ8hSJseL55RE
         9pbRCy1oNY2TNyYScIOM1eRVC1Hri+fvfQDSLHPgqTwElpBzAVbJA8jxApn2x2T8VfsP
         IGHTrD/GtpvO070Qkv/SUBdfTuZ0JEoOhcQ3FIPntQb1Op/aFvCZBb4v2QSDSv+JGXbj
         R/+TsbRhLAZNI5ttbtA0lnVW62/WUQaEZ8x3ikZL6ByIq294H0YzOwl+eW6ZmxOTGZbq
         aPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617117; x=1796221917;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zKfRowNSGjVA87CJ4mW494zsgUl/v5ojHBz8f5BNf/0=;
        b=vv6zzjr1RCrkwhWtkgHcctcD2s9qfFLTOE75EPkEP3EkgQRaOaTtB1OFBEOeMosOeD
         KAn9BkPB37V4Ov2bmJ/q1cg28qgUoycppkNb5ISrOsvY9JAuPJRkt+x5mbusahAdzLSY
         J+4VzciGxTvK+J/rzqO0AMyfCAdpCIJbLDnzMr4CCgjPBZBVP5hMpb7KLvdEH+sBEKwl
         qGDfosA+MSgOe6lfv6HLJ23OvAZPpRUUq1pNssAwW9UeLGTSmxqeGpRSxuhtPtKKS2BO
         MhR+//ixW0j6eOWh7yIYELgNSzehMJFGgrvqfoTQ0jBrUZ3SbBFLd1nLAlnT/L/1av36
         jaPg==
X-Forwarded-Encrypted: i=1; AL+hErHqzBC7DI/4ONnqNa92xvi5te5d4EysxrOW28e6M/gQBG3hA1DEgXWlFVVOUWfhTo3gliWdinkTnOrBZQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/eUCOnw919R/Cgzl9aE4FOwtY3PdTM9amQAxypSHeTGtHMDyBI
	OxauRhdU6nOWiO+/ztUiZiJmdTV3FQpfFPpC778EZqlpZQEw9MrxCq9Q4T5XSzvFxHM=
X-Gm-Gg: AZFdTZfzBOYcc6KEZXKJB8SNjyJMeTYd2fYGETfDt5yVhCUuk/CwD6EVsu3xUHXayKU
	GdZIg/4BKztsOyQwCHxJ63qapARUwZeLK6uv2pGX2IjlChxl2kEh6s0lXLWFThZNzJDilCeOukc
	TKGPVHBfydOAof3gL1HRvHCyMJK6t02PdAG2OYglmeBWJ3cJEqU+Qs6ewfQrIEV1TA1Y5DT4Wbh
	gYI8ks3KDbZ3eKwybYrYn0sGA05G8wochTm0KCGk+sGLMx5x+Pm2LqkFi6wjk120nxF/4Ke2Y04
	rIset4htLfejzuCgjGDqvq5ht2foqiMRpKmYfOwCcYDC+ll/XV92acBK6MUa8x+CGecG8H/VxJl
	CChiR1RYRgrtTeH65wqZj+L7DlKeR+tzG5rveJYro/8CEMkXUlo/mCwUE7spkm2ny9siQ4XUvpY
	uWJ4eoQMKVzNbVqJmMo99T9w/+H9/0zyruvVlqPkuk07Tdr6jEBQbFVTxOY8wWbGyj8KIgFham9
	46vNXApyH3N+ZKl5TbKNb0IA4igHMk+gFWQ0kCvSa/CQ0ECfosIJp2M47+prKea/Py1Au9iIBS3
	fv/gSjnZVMv7wyj9hpOrN+XFqC0StH5fi7CwI8AHErPgK80xUTIM2rxuVmC9J/V2f+zC8ffaHNG
	FUXL327g=
X-Received: by 2002:a2e:a28e:0:b0:3ac:dec0:158e with SMTP id 38308e7fff4ca-3ae7f9f3418mr40722721fa.2.1795617116747;
        Wed, 25 Nov 2026 06:31:56 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8053568esm50069981fa.25.2026.11.25.06.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:31:56 -0800 (PST)
Message-ID: <bac87368-6a84-4c75-ad25-b2fdea432b72@linaro.org>
Date: Wed, 25 Nov 2026 16:31:55 +0200
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
Subject: Re: [PATCH v4 2/3] dt-bindings: media: qcom,glymur-camss: Add Glymur
 CAMSS
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-2-d7c2983d6d7b@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260925-glymur_camss-v4-2-d7c2983d6d7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/26 08:48, Nihal Kumar Gupta wrote:
> Glymur uses only the new PHY API via standalone phy@ child nodes,
> so per-CSIPHY clocks, interrupts and supplies are absent here.
> 
> X1E80100 has four CSIPHY instances while Glymur has three
> (CSIPHY0, CSIPHY1, CSIPHY4).
> 
> Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   .../bindings/media/qcom,glymur-camss.yaml          | 300 +++++++++++++++++++++
>   1 file changed, 300 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a0b77edc212319fad69113f3d55ca24f184d4b23
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> @@ -0,0 +1,300 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,glymur-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Glymur Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,glymur-camss
> +
> +  reg:
> +    maxItems: 13
> +
> +  reg-names:
> +    items:
> +      - const: csid_wrapper
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csitpg0
> +      - const: csitpg1
> +      - const: csitpg2

I believe CAMSS on SM8350 and before has TPG as a CSID IP function, but
since then TPGs are seperate I/O blocks. It might be more appropriate
to give "tpgX" names (like it's done for sa8775p and qcs8300), and I do
understand that "csitpgX" were selected just to get a compatibility with
the reused X1E TPG names, which might be not a good enough reason...

> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  clocks:
> +    maxItems: 20
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_nrt_axi
> +      - const: camnoc_rt_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: cpas_fast_ahb
> +      - const: cpas_vfe0
> +      - const: cpas_vfe1
> +      - const: cpas_vfe_lite
> +      - const: csid
> +      - const: csid_csiphy_rx
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
> +      - const: vfe0
> +      - const: vfe0_fast_ahb
> +      - const: vfe1
> +      - const: vfe1_fast_ahb
> +      - const: vfe_lite
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +
> +  interrupts:
> +    maxItems: 9
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_mnoc
> +      - const: sf_mnoc
> +      - const: sf_icp_mnoc
> +
> +  iommus:
> +    items:
> +      - description: S1 HLOS IFE and IFE_LITE non-protected
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: top
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-3]$":

Reading the commit message, I develop a feeling that it might make sense
to change the regexp to [014] or something like that.

> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +
> +        description:
> +          Input port for receiving CSI data.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,glymur-gcc.h>
> +    #include <dt-bindings/clock/qcom,glymur-camcc.h>
> +    #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss: isp@acb6000 {
> +            compatible = "qcom,glymur-camss";
> +
> +            reg = <0x0 0x0acb6000 0x0 0x1000>,
> +                  <0x0 0x0acb7000 0x0 0x2000>,
> +                  <0x0 0x0acb9000 0x0 0x2000>,
> +                  <0x0 0x0acbb000 0x0 0x2000>,
> +                  <0x0 0x0acc6000 0x0 0x1000>,
> +                  <0x0 0x0acca000 0x0 0x1000>,
> +                  <0x0 0x0acf6000 0x0 0x1000>,
> +                  <0x0 0x0acf7000 0x0 0x1000>,
> +                  <0x0 0x0acf8000 0x0 0x1000>,
> +                  <0x0 0x0ac62000 0x0 0xf000>,
> +                  <0x0 0x0ac71000 0x0 0xf000>,
> +                  <0x0 0x0acc7000 0x0 0x2000>,
> +                  <0x0 0x0accb000 0x0 0x2000>;
> +            reg-names = "csid_wrapper",
> +                        "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "csid_lite0",
> +                        "csid_lite1",
> +                        "csitpg0",
> +                        "csitpg1",
> +                        "csitpg2",
> +                        "vfe0",
> +                        "vfe1",
> +                        "vfe_lite0",
> +                        "vfe_lite1";
> +
> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +                     <&camcc CAM_CC_CORE_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_1_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_CSID_CLK>,
> +                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CLK>,
> +                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CLK>,
> +                     <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +            clock-names = "camnoc_nrt_axi",
> +                          "camnoc_rt_axi",
> +                          "core_ahb",
> +                          "cpas_ahb",
> +                          "cpas_fast_ahb",
> +                          "cpas_vfe0",
> +                          "cpas_vfe1",
> +                          "cpas_vfe_lite",
> +                          "csid",
> +                          "csid_csiphy_rx",
> +                          "gcc_axi_hf",
> +                          "gcc_axi_sf",
> +                          "vfe0",
> +                          "vfe0_fast_ahb",
> +                          "vfe1",
> +                          "vfe1_fast_ahb",
> +                          "vfe_lite",
> +                          "vfe_lite_ahb",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_csid";
> +
> +            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 458 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 860 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csid_lite0",
> +                              "csid_lite1",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe_lite0",
> +                              "vfe_lite1";
> +
> +            interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +            interconnect-names = "ahb",
> +                                 "hf_mnoc",
> +                                 "sf_mnoc",
> +                                 "sf_icp_mnoc";
> +
> +            iommus = <&apps_smmu 0x800 0x20>;
> +
> +            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +                            <&camcc CAM_CC_IFE_1_GDSC>,
> +                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +            power-domain-names = "ife0",
> +                                 "ife1",
> +                                 "top";
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    camss_csiphy0_ep: endpoint {
> +                        data-lanes = <1 2 3 4>;
> +                        remote-endpoint = <&csiphy0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    camss_csiphy1_ep: endpoint {
> +                        data-lanes = <1 2 3 4>;
> +                        remote-endpoint = <&csiphy1_out>;
> +                    };
> +                };
> +
> +                port@3 {
> +                    reg = <3>;
> +                    camss_csiphy4_ep: endpoint {

Here is a mismatch between port number and link name, please
double check, if it is intended.

> +                        data-lanes = <1 2 3 4>;
> +                        remote-endpoint = <&csiphy4_out>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> 

-- 
Best wishes,
Vladimir
