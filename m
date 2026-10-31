Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793447573;
	b=OFgOefXC6sDZbSE76RCZK2LgY6uuGfMnrUQIwvvbPYuLxPo0JlXjPqi/6sEpMcuCrqVj
	 52F5HuhFLwbwt4M+2dpGSdCoK5Imcd9S45NTASP3XLP413+1TIiZPSRD4hH1eR6/1b/cv
	 ZOd6wccT+/cHOIP+kIeJU/K8iLQTtdDdOpw8rJOu0SIZxebolZfNuIFA8Svnt23FqKSUh
	 Dra9/C5WPHy0WsEuhDPypL4p3IkPEIlWSLxZyfWvpmAMsXBmD+o7HfVv9rsRV7H+7ceDf
	 tXAf3xzuNqcYU86610IvBzZh+q/yHrP1wHSa4shyvrwtR+OPVBIgYheg7AI1Nq3t8wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793447573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=8zsL8Kt1CHK5vKimdMgWZmDCuo11hjQxDUYGHa0E+JE=;
	b=mLiihIdwcejlHfL4E1YWMlWx41Hgn19KIM6SBx4qgUPlvn2LPI1vl7pjGiZMB3gmxhoC
	 pUCjaQlM0/KPwSSmQVcWDXqQk0uzXlOUEaP/uWBFD6/sj203im0/ke3vUkXKd22+MpB1N
	 +rqWIYPujXhRhFjqYOj2KwIeYVrI6LCXNV8Wu2QbjEsuF6v5Rotp8g9p/jYGyIIj2t9kK
	 JSpqOK2d23vwd+qLHJVBpwmyWMsfX+Txm9yfgh7lCIGz7jYkNUbz0z6zADZQo7XPsYFdZ
	 h9BopdDyQErgDyLj5UuIh+9sZFAYeji5nWsWBCluJdTxU6KWdHJ+MOVtsdUVYh+kMqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Bf+3l9fS;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123CF606A31E
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 11:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 123CF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Bf+3l9fS
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab35a9d9ceso2013071fa.3
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 04:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793447570; x=1794052370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8zsL8Kt1CHK5vKimdMgWZmDCuo11hjQxDUYGHa0E+JE=;
        b=Bf+3l9fSJEpeD3eLulzhMQjbj0zZOtQt3tQrEJlWJ0S894XPmw2qU5I0G0M6VKdle6
         VwMdXvO5Ue/8jts/+IIHDNwXiZJVpfC4L3cARd+rKf4BPmrHFXQlCOSdt2K8ELZu0Ite
         CyR6txcEpI7IxI8CtH4AuLFS8rOpv0DndrE+x4Khh2OuZLMdqDYBLX8Q0h2zwvwmGRDl
         B/nLDjO8/AV0t4tWzfO61MPn59H0ekAh/Tu5nlSaUIlhKrHMQxkXXSVm6zNbTsw4hiE7
         YcHSHs6XMt4pLgLsLfBSDGcZTTeLRDyHf8sObwXej3QDR1oTY6z3yNKC++Oo2+fP+mWX
         1sCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793447570; x=1794052370;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8zsL8Kt1CHK5vKimdMgWZmDCuo11hjQxDUYGHa0E+JE=;
        b=kOLeWpEB5gorx2MpirO1iY7sH7Jotu47g1mLwXDbaH5s3jMhallpsE9CLDkDAQR61j
         ZEUrc+cHUaeFX7AX9n9e79ks2Hxv3M53kUv3HdWpMxGIKxM+WF88YbIRnrnbktQ8oti5
         tBynuBUxmozbf7zQH+QQ5eIWFnWilGziE8qcpgbQZVSnJYs2o8tKxNZHUKG4CCw++p46
         sMDaS7lr0H1cVmocDhQrqHXQIKPYayViUf9oz2WESYrvf+kM2JcjnKP4afmLbd1dxWiL
         GgfViFIv7/ttNHUQRYGYfAPC9m6eL1N40RwPvqWoSeLVqMJBoilyexkWyLC4Q+qfX4Up
         eP4g==
X-Forwarded-Encrypted: i=1; AKwUvBxQjq9e49T5hgmqYjq5uRuN53jfFYjepE7QJoEQKFi83MBSRBc3LysugE7Ql+UYlK0XHErVmgTFZXf3Bw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKN6uJsl+7oAVS1Sn6gRVRFWicpKmRYRsyInfROtJv5c6gP2tMk
	94b8bgxX9VlkxPqkeJSFmDG5lVecDJZ4rGpcv9If2OuI4wYC9JDdCxkxG8NPSOYU+4g=
X-Gm-Gg: AYBFou3sRM+8kkTvX/IsiLmx8cwOlKZ+l2mbboiEj3JQngpXqzPmQwVmfDHTFn8X+ZM
	dDjbYXvQfmO/6CArsVDPaJrknBhI0Z1yYlRmAr5EyjQcQAChK2OxrbEoWRzcKkSH1+4eD6J5CMO
	EqYc6t6Kf47CsXcctxmr/5a7Fkq/amrcmJgPlbn15RmxEAnA/kkUP7slva0LPeCJ3MpMPsTOFb2
	wKmdHCDQfkxOxQ9ubbhOHJFJKtNpugfOUL3fWWju+HFYq7EfooARcvYjaUr4aNfcgr3NRag+9ti
	iel8ZJ28Yhto1LUQfUDbOFrH9KoDQKc11WioN34A34yM9HlUNO7XKBwNw7PfHfiZqWWVkpawzfF
	XxUsdlG1e2AHfKUlaywVuxzIV9i6y1jsNOwqp/13+mxZa9/EXbzcuj79W816tcBwwB5CeQwnNzp
	w4+MjiHW8Va3kESmC0/dQkEZaHaCyRQQHgKXx6BE+noo2YbgJ1aqaTz4h7pVu7vk3K2gYw52jQ7
	jQTGAwYrRTLJ8xDz0cLIwpuybEUbaBVe8hCS5v3AF5Do1LUlsm0uev+uWN9ZLgdgDuiai0EeKVY
	zrfkQzuqH8OM+axBjSn8qNV+Lec3Z4s51kXR8UxRWsP7Z45TbNpi+ylhHToGwMReWdy3EXMp8c5
	BJ8VUjog=
X-Received: by 2002:a2e:9d8a:0:b0:3ab:1864:5004 with SMTP id 38308e7fff4ca-3acb7889256mr7975531fa.0.1793447570081;
        Sat, 31 Oct 2026 04:52:50 -0700 (PDT)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbc07764sm9957491fa.4.2026.10.31.04.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 04:52:49 -0700 (PDT)
Message-ID: <af3600e1-fc1d-42f4-aed7-380d9546b910@linaro.org>
Date: Sat, 31 Oct 2026 13:52:48 +0200
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
Subject: Re: [PATCH v23 05/15] media: dt-bindings: Add CAMSS device for
 Kaanapali
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-5-95f250b18612@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261028-kaanapali-camss-v23-5-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 17:20, Hangxiang Ma wrote:
> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Kaanapali
> platform.
> 
> The Kaanapali platform provides:
> - 6 x CSIPHY (CSI Physical Layer)
> - 3 x TPG (Test Pattern Generator)
> - 3 x CSID (CSI Decoder)
> - 2 x CSID Lite
> - 3 x VFE (Video Front End), 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   .../bindings/media/qcom,kaanapali-camss.yaml       | 306 +++++++++++++++++++++
>   1 file changed, 306 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
> new file mode 100644
> index 000000000000..dec451fc940f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
> @@ -0,0 +1,306 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,kaanapali-camss
> +
> +  reg:
> +    maxItems: 14
> +
> +  reg-names:
> +    items:
> +      - const: top
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csitpg0
> +      - const: csitpg1
> +      - const: csitpg2

Rename it to 'tpgX'.

> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  clocks:
> +    maxItems: 23
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_nrt_axi
> +      - const: camnoc_rt_axi
> +      - const: cpas_ahb
> +      - const: cpas_fast_ahb
> +      - const: cpas_vfe0
> +      - const: cpas_vfe1
> +      - const: cpas_vfe2
> +      - const: cpas_vfe_lite
> +      - const: csid
> +      - const: csid_csiphy_rx

The common name is 'csiphy_rx', the clock supplies CSIPHYs and non-CSID TPGs.

> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf

Unused clock.

> +      - const: vfe0
> +      - const: vfe0_fast_ahb
> +      - const: vfe1
> +      - const: vfe1_fast_ahb
> +      - const: vfe2
> +      - const: vfe2_fast_ahb
> +      - const: vfe_lite
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +      - const: qdss_debug_xo
> +
> +  interrupts:
> +    maxItems: 10
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
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_mnoc
> +
> +  iommus:
> +    items:
> +      - description: S1 HLOS IFE non-protected stream
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Global Distributed Switch Controller for IFE0.
> +      - description: IFE1 GDSC - Global Distributed Switch Controller for IFE1.
> +      - description: IFE2 GDSC - Global Distributed Switch Controller for IFE2.
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: ife2
> +      - const: top
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports. Each port receives the CSI data
> +      decoded by the matching CSIPHY.
> +
> +    patternProperties:
> +      "^port@[0-5]$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data from CSIPHY 0-5.
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
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - data-lanes
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
> +    #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
> +    #include <dt-bindings/clock/qcom,kaanapali-camcc.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        isp@900b000 {
> +            compatible = "qcom,kaanapali-camss";
> +
> +            reg = <0x0 0x0900b000 0x0 0x1000>,
> +                  <0x0 0x09253000 0x0 0x5e80>,
> +                  <0x0 0x09263000 0x0 0x5e80>,
> +                  <0x0 0x09273000 0x0 0x5e80>,
> +                  <0x0 0x092d3000 0x0 0x3880>,
> +                  <0x0 0x092e7000 0x0 0x3880>,
> +                  <0x0 0x093fd000 0x0 0x400>,
> +                  <0x0 0x093fe000 0x0 0x400>,
> +                  <0x0 0x093ff000 0x0 0x400>,
> +                  <0x0 0x09151000 0x0 0x20000>,
> +                  <0x0 0x09171000 0x0 0x20000>,
> +                  <0x0 0x09191000 0x0 0x20000>,
> +                  <0x0 0x092dc000 0x0 0x1300>,
> +                  <0x0 0x092f0000 0x0 0x1300>;
> +
> +            reg-names = "top",
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
> +                        "vfe2",
> +                        "vfe_lite0",
> +                        "vfe_lite1";
> +
> +            clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
> +                     <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                     <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_CSID_CLK>,
> +                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                     <&camcc CAM_CC_TFE_0_MAIN_CLK>,
> +                     <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_TFE_1_MAIN_CLK>,
> +                     <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_TFE_2_MAIN_CLK>,
> +                     <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
> +
> +            clock-names = "camnoc_nrt_axi",
> +                          "camnoc_rt_axi",
> +                          "cpas_ahb",
> +                          "cpas_fast_ahb",
> +                          "cpas_vfe0",
> +                          "cpas_vfe1",
> +                          "cpas_vfe2",
> +                          "cpas_vfe_lite",
> +                          "csid",
> +                          "csid_csiphy_rx",
> +                          "gcc_axi_hf",
> +                          "gcc_axi_sf",
> +                          "vfe0",
> +                          "vfe0_fast_ahb",
> +                          "vfe1",
> +                          "vfe1_fast_ahb",
> +                          "vfe2",
> +                          "vfe2_fast_ahb",
> +                          "vfe_lite",
> +                          "vfe_lite_ahb",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_csid",
> +                          "qdss_debug_xo";
> +
> +            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
> +
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csid_lite0",
> +                              "csid_lite1",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe2",
> +                              "vfe_lite0",
> +                              "vfe_lite1";
> +
> +            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +            interconnect-names = "ahb",
> +                                 "hf_mnoc";
> +
> +            iommus = <&apps_smmu 0x1c00 0x00>;
> +
> +            power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
> +                            <&camcc CAM_CC_TFE_1_GDSC>,
> +                            <&camcc CAM_CC_TFE_2_GDSC>,
> +                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +            power-domain-names = "ife0",
> +                                 "ife1",
> +                                 "ife2",
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
> +            };
> +        };
> +    };
> 

In general it looks good.

-- 
Best wishes,
Vladimir
