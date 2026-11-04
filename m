Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832277;
	b=QLMUIceRoETTB19xJLI/tIfpIJFRMfincrjYVIJBrrCZwezbmd+X+2Fgnyhsu51pT/9E
	 1Mexw03cgPd6VvgyNC4E1SSZ0V8vvGBbDpLyWVasIsFbanouW6JmKqttaofgJ0uwquw2u
	 6l8DidV5Z0ibm1bTombCvPV/Elc86unjHYuq7u4O/vbL6ZNT/iDUfm33bL62osq7yccPL
	 Q/++IAFcX2nW5TeuouLQNFMltZc8cz0jRixQ71jk+t/wTpptCx8qNZXnF5kIqZtFwIt0X
	 o8QFzCyurrkS/f86LB4obF3htj1YbuVOYE7HTBA2kuwE++R/epD13JhuU+PxerSeGWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=OfxaueTyc8XbQISpMtsIlMHRs6clavLyxX39MYG47W4=;
	b=vZ497N00vESh/r3yXbF+tZPUK97TVMrb7qkhYTWNiB75S0Y6uhWmIEhA/pSvCuf5YS9m
	 ARkexaUNvzDBPd9Zb8UkRvzFSGfWQSGFKche9Qnfa7PqCg2s0Hl0VrcUtNremCrN4ogT1
	 SJkgR9zC34Wh6NsCqlHyXV+39xZdXx7ct6Uxk0fMKEN8sKDYugiI/PJv/gFf49rxmfqUP
	 /r6eNxQWBaqhCfm2W10mXgyb7ClyhrSVrzYqfgweMabOY7CDTI4qXIuIsMxVW6uWySprc
	 aHa4zzhX/7YHOgJl9XIo/EbSFeUIDA70CfJzPGMb4Hl3P7vx0HKpifmIHPZws9XZSlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GFmcmu9h;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101C9606A329
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 22:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 101C9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GFmcmu9h
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso253838f8f.1
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 14:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793832274; x=1794437074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OfxaueTyc8XbQISpMtsIlMHRs6clavLyxX39MYG47W4=;
        b=GFmcmu9hLbT7gL7Z0iSuvfx4/E6mlopRAZlbgNKa0yii9goBfsKgPBukEIE+tIItrQ
         4j52+KBXv5zQS3mN4LNkgbyzpUlbywZdKyvhXhPeTbyG1/haq++/bdaV2M/JQS2gx/Zx
         ixW3HJSUEaZ9c67TLhIrVm34ofUY6UYebVkxYy/3P0JaQ9QADTINPpMMMX3Lfx9JG/Kx
         T1xSSE0Fa1xlR5pRVVCBWwoJDM7HQ00f36mFlOw5bvq7eD9TLhNCRoWoioqiewUvibDl
         x3CH0tXoBEFYoNYiJLBsWPG42h5iV4pzTg8bRWzArVSsygd5wUBKWEAxPujUAh8FBguC
         JbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793832274; x=1794437074;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OfxaueTyc8XbQISpMtsIlMHRs6clavLyxX39MYG47W4=;
        b=KjrFoqH1BfiDOlq0Mo4Rm7SFmyAoAlLguVAu0OeOJvFR53n2ccQHCeVc49rfbNGU/P
         crWhdusutcgJSZ88+Y8BCKQt6Pn02vRVvBBXqmLQgeOYwCodoCx1QSqu71ZwPY6DnYJN
         2JOfTgN0uGDIPs5GnRi9/hHFXvpvC7dUQX8dzoL3vcoprfC7nSIr9R/DyxST8mYTOLxK
         32T8nyPsON0nGwB77BXVcnMXQv+xj8LYnuhIfdCQKg24WprISDxvxKPs1BrsKckUzS+6
         o+VZvgBDFUJ4ZNIcNGHFjCPN1LAWPsjz2rsuQ37TnM6oFo7NuWXaPVwrFVVGxLRsZ4yG
         yNRw==
X-Forwarded-Encrypted: i=1; AKwUvBzfh1N5UrHqFsxYrLv5WoWy2Lc1uioEb2yKIo+Vvr/uSVJciguT22Exu9G5KWyYrPcg8BSlL0X0Nw9Yvg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/qVk04leCdpHDDJ117Fb7zlKoSYE2XLY/7cUNELCMetcfXuMzW
	mSNCn21lQxt0/mHj6KjhGSCTou4otCC1mSAfnEF8205scJKzxevGoVihMDpL9PN4a27q0N5eK74
	sMqPaYJk=
X-Gm-Gg: AYBFou39HNfoswXp1N6+4tDMshuTJQ6Eu+WnTslK8QHFw9z6WSQ5Y414qG9owsQrgx8
	Suhg3X9BHev4ToFM200wVGx86a81MbDOfLyJ9g77vk+5q0u/EdRneaN51kiHkFUP5rOWqa31UXC
	u7RDtdV0SjXzTrS6ZMGjokFG9m9o9LPI1k+lUThi+gSewh7PTHJjC/zTZUCGu8oo8XK+SK/NQyv
	8pk33EoxJCWAc97g4XBknO5FtufSkaX8MKGJpYilzUk66Sx8gsrmrbqgijU1eoHTvoAw8FW317J
	skVBB7pE6wWJ7h9qQ/2ttlh0LOIn5T6L05qnWvTE7H8sqHdptmfPuojgXFfzirX1QSBvsX9sZNm
	IYAFtSXCwgDg0RrvfdoL8QWBDT/PySMvgLg8814tdG3JE8VjBBfRHS5niDxeMP7gwcSJCXmpkAf
	CQvJUIZO6nQ8kVLU2Qs09U3++b0VzqCTreZEXKlw0qs9GUkjU1BKckJRlu7iqg04kOcn4oAf1XG
	3b7M8Q1nljuxS+B3Afg6cwamkVVP6Up1V/F+scgH5ihwTJXBASlmjG0wfl+2uIGdz0fuU7J9bDL
	8b7R+MA/8ND+jvH3KG2LAXYlmEwzEY3mRwaXo5ryvDf7y+IxMhrYvJfLs2/VTr4=
X-Received: by 2002:a05:6000:24c4:b0:48d:f9dd:e3de with SMTP id ffacd0b85a97d-48e6e511219mr38508954f8f.45.1793832274218;
        Wed, 04 Nov 2026 14:44:34 -0800 (PST)
Received: from [192.168.0.167] ([109.76.163.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed551dbasm6028154f8f.37.2026.11.04.14.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:44:33 -0800 (PST)
Message-ID: <427eb0e0-5e10-4f24-8686-4d06c26cdd13@linaro.org>
Date: Wed, 4 Nov 2026 22:44:31 +0000
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
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 20:54, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Document the Qualcomm SM8150 Camera Subsystem. The IP integrates four
> CSIPHY, four CSID (two full and two lite), two VFE and two VFE-Lite
> instances, with 42 clocks, 12 interrupts, eight IOMMU streams, four
> interconnect paths and three power domains.
> 
> SM8150 has a different register layout, clock tree and power domain
> topology from SM8250, so describe it in a dedicated schema instead of
> using qcom,sm8250-camss as a fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> ---
>   .../bindings/media/qcom,sm8150-camss.yaml          | 477 +++++++++++++++++++++
>   1 file changed, 477 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> new file mode 100644
> index 000000000000..a65067352b58
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
> @@ -0,0 +1,477 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8150-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8150 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Andrew Gigena <mail@andrewgigena.dev>
> +
> +description: |
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8150-camss
> +
> +  clocks:
> +    minItems: 42
> +    maxItems: 42
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: camnoc_axi_src
> +      - const: cpas_ahb
> +      - const: cphy_rx_src
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy0_timer_src
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy1_timer_src
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy2_timer_src
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: csiphy3_timer_src
> +      - const: vfe0_axi
> +      - const: vfe0
> +      - const: vfe0_src
> +      - const: vfe0_cphy_rx
> +      - const: vfe0_csid
> +      - const: vfe0_csid_src
> +      - const: vfe1_axi
> +      - const: vfe1
> +      - const: vfe1_src
> +      - const: vfe1_cphy_rx
> +      - const: vfe1_csid
> +      - const: vfe1_csid_src
> +      - const: vfe_lite0
> +      - const: vfe_lite0_src
> +      - const: vfe_lite0_cphy_rx
> +      - const: vfe_lite0_csid
> +      - const: vfe_lite0_csid_src
> +      - const: vfe_lite1
> +      - const: vfe_lite1_src
> +      - const: vfe_lite1_cphy_rx
> +      - const: vfe_lite1_csid
> +      - const: vfe_lite1_csid_src
> +      - const: slow_ahb_src
> +      - const: gcc_ahb
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
> +
> +  interrupts:
> +    minItems: 12
> +    maxItems: 12
> +
> +  interrupt-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: vfe0
> +      - const: csid0
> +      - const: vfe1
> +      - const: csid1
> +      - const: vfe_lite0
> +      - const: csid_lite0
> +      - const: vfe_lite1
> +      - const: csid_lite1
> +
> +  iommus:
> +    maxItems: 8
> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: cam_ahb
> +      - const: cam_hf_0_mnoc
> +      - const: cam_hf_1_mnoc
> +      - const: cam_sf_0_mnoc
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
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data from CSIPHY0.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
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
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data from CSIPHY1.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
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
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data from CSIPHY2.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
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
> +              - clock-lanes
> +              - data-lanes
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port for receiving CSI data from CSIPHY3.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
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
> +              - clock-lanes
> +              - data-lanes
> +
> +  reg:
> +    minItems: 12
> +    maxItems: 12
> +
> +  reg-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: vfe0
> +      - const: csid0
> +      - const: vfe1
> +      - const: csid1
> +      - const: vfe_lite0
> +      - const: csid_lite0
> +      - const: vfe_lite1
> +      - const: csid_lite1
> +
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
> +required:
> +  - clock-names
> +  - clocks
> +  - compatible
> +  - interconnects
> +  - interconnect-names
> +  - interrupts
> +  - interrupt-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +  - reg
> +  - reg-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8150.h>
> +    #include <dt-bindings/clock/qcom,sm8150-camcc.h>
> +    #include <dt-bindings/interconnect/qcom,sm8150.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss: camss@ac65000 {
> +            compatible = "qcom,sm8150-camss";
> +
> +            reg = <0 0xac65000 0 0x1000>,
> +              <0 0xac66000 0 0x1000>,
> +              <0 0xac67000 0 0x1000>,
> +              <0 0xac68000 0 0x1000>,
> +              <0 0xacaf000 0 0x4000>,
> +              <0 0xacb3000 0 0x1000>,
> +              <0 0xacb6000 0 0x4000>,
> +              <0 0xacba000 0 0x1000>,
> +              <0 0xacc4000 0 0x4000>,
> +              <0 0xacc8000 0 0x1000>,
> +              <0 0xaccb000 0 0x4000>,
> +              <0 0xaccf000 0 0x1000>;
> +
> +            reg-names = "csiphy0",
> +              "csiphy1",
> +              "csiphy2",
> +              "csiphy3",
> +              "vfe0",
> +              "csid0",
> +              "vfe1",
> +              "csid1",
> +              "vfe_lite0",
> +              "csid_lite0",
> +              "vfe_lite1",
> +              "csid_lite1";
> +
> +            interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
> +              <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>;
> +
> +            interrupt-names = "csiphy0",
> +              "csiphy1",
> +              "csiphy2",
> +              "csiphy3",
> +              "vfe0",
> +              "csid0",
> +              "vfe1",
> +              "csid1",
> +              "vfe_lite0",
> +              "csid_lite0",
> +              "vfe_lite1",
> +              "csid_lite1";
> +
> +            power-domains = <&camcc IFE_0_GDSC>,
> +              <&camcc IFE_1_GDSC>,
> +              <&camcc TITAN_TOP_GDSC>;
> +
> +            power-domain-names = "ife0",
> +              "ife1",
> +              "top";
> +
> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +              <&camcc CAM_CC_CAMNOC_AXI_CLK_SRC>,
> +              <&camcc CAM_CC_CPAS_AHB_CLK>,
> +              <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
> +              <&camcc CAM_CC_CSIPHY0_CLK>,
> +              <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +              <&camcc CAM_CC_CSI0PHYTIMER_CLK_SRC>,
> +              <&camcc CAM_CC_CSIPHY1_CLK>,
> +              <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +              <&camcc CAM_CC_CSI1PHYTIMER_CLK_SRC>,
> +              <&camcc CAM_CC_CSIPHY2_CLK>,
> +              <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +              <&camcc CAM_CC_CSI2PHYTIMER_CLK_SRC>,
> +              <&camcc CAM_CC_CSIPHY3_CLK>,
> +              <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +              <&camcc CAM_CC_CSI3PHYTIMER_CLK_SRC>,
> +              <&camcc CAM_CC_IFE_0_AXI_CLK>,
> +              <&camcc CAM_CC_IFE_0_CLK>,
> +              <&camcc CAM_CC_IFE_0_CLK_SRC>,
> +              <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +              <&camcc CAM_CC_IFE_0_CSID_CLK>,
> +              <&camcc CAM_CC_IFE_0_CSID_CLK_SRC>,
> +              <&camcc CAM_CC_IFE_1_AXI_CLK>,
> +              <&camcc CAM_CC_IFE_1_CLK>,
> +              <&camcc CAM_CC_IFE_1_CLK_SRC>,
> +              <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +              <&camcc CAM_CC_IFE_1_CSID_CLK>,
> +              <&camcc CAM_CC_IFE_1_CSID_CLK_SRC>,
> +              <&camcc CAM_CC_IFE_LITE_0_CLK>,
> +              <&camcc CAM_CC_IFE_LITE_0_CLK_SRC>,
> +              <&camcc CAM_CC_IFE_LITE_0_CPHY_RX_CLK>,
> +              <&camcc CAM_CC_IFE_LITE_0_CSID_CLK>,
> +              <&camcc CAM_CC_IFE_LITE_0_CSID_CLK_SRC>,
> +              <&camcc CAM_CC_IFE_LITE_1_CLK>,
> +              <&camcc CAM_CC_IFE_LITE_1_CLK_SRC>,
> +              <&camcc CAM_CC_IFE_LITE_1_CPHY_RX_CLK>,
> +              <&camcc CAM_CC_IFE_LITE_1_CSID_CLK>,
> +              <&camcc CAM_CC_IFE_LITE_1_CSID_CLK_SRC>,
> +              <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +              <&gcc GCC_CAMERA_AHB_CLK>,
> +              <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +              <&gcc GCC_CAMERA_SF_AXI_CLK>;
> +
> +            clock-names = "camnoc_axi",
> +              "camnoc_axi_src",
> +              "cpas_ahb",
> +              "cphy_rx_src",
> +              "csiphy0",
> +              "csiphy0_timer",
> +              "csiphy0_timer_src",
> +              "csiphy1",
> +              "csiphy1_timer",
> +              "csiphy1_timer_src",
> +              "csiphy2",
> +              "csiphy2_timer",
> +              "csiphy2_timer_src",
> +              "csiphy3",
> +              "csiphy3_timer",
> +              "csiphy3_timer_src",
> +              "vfe0_axi",
> +              "vfe0",
> +              "vfe0_src",
> +              "vfe0_cphy_rx",
> +              "vfe0_csid",
> +              "vfe0_csid_src",
> +              "vfe1_axi",
> +              "vfe1",
> +              "vfe1_src",
> +              "vfe1_cphy_rx",
> +              "vfe1_csid",
> +              "vfe1_csid_src",
> +              "vfe_lite0",
> +              "vfe_lite0_src",
> +              "vfe_lite0_cphy_rx",
> +              "vfe_lite0_csid",
> +              "vfe_lite0_csid_src",
> +              "vfe_lite1",
> +              "vfe_lite1_src",
> +              "vfe_lite1_cphy_rx",
> +              "vfe_lite1_csid",
> +              "vfe_lite1_csid_src",
> +              "slow_ahb_src",
> +              "gcc_ahb",
> +              "gcc_axi_hf",
> +              "gcc_axi_sf";

42 is ofc a sacred number so its a pity BUT you almost certainly don't 
need the _src clocks here.

> +
> +            iommus = <&apps_smmu 0x840 0x620>,
> +              <&apps_smmu 0x860 0x620>,
> +              <&apps_smmu 0xA40 0x620>,
> +              <&apps_smmu 0xA60 0x620>,
> +              <&apps_smmu 0xC40 0x620>,
> +              <&apps_smmu 0xC60 0x620>,
> +              <&apps_smmu 0xE40 0x620>,
> +              <&apps_smmu 0xE60 0x620>;
> +
> +            interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
> +                <&mmss_noc MASTER_CAMNOC_HF0 0 &mc_virt SLAVE_EBI_CH0 0>,
> +                <&mmss_noc MASTER_CAMNOC_HF1 0 &mc_virt SLAVE_EBI_CH0 0>,
> +                <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;
> +
> +            interconnect-names = "cam_ahb",
> +              "cam_hf_0_mnoc",
> +              "cam_hf_1_mnoc",
> +              "cam_sf_0_mnoc";
> +
> +            vdda-phy-supply = <&vreg_l5a_0p88>;
> +            vdda-pll-supply = <&vreg_l3c_1p2>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    csiphy_ep0: endpoint@0 {
> +                        reg = <0>;
> +                        clock-lanes = <7>;
> +                        data-lanes = <0 1 2 3>;
> +                        remote-endpoint = <&sensor_ep>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> 

