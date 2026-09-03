Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F35247ACC0
	for <linux-media@vger.kernel.org>; Thu,  3 Sep 2026 11:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436412; cv=none; b=DrTAD1PPJG8PKruKtlOgYoFp3J6WtXQVkvX5vIRN6//+9Z0Nw7eTfUq/j+XCLlRrK+OWjxzd2vePh2a4HiJKz2VfGFt5sCxmmP8ULN5o+YxpLhn4DVDWftBi7VAsZxiz7gt9lvheN9PLiKHpizpYwmoraEO3MFknk3iAkh+cM/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436412; c=relaxed/simple;
	bh=n5ctRfXvrUaJX4olBTeuOGHj+PO5gbXXUrz1f2Frvss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FO+a0SQ4vY9XSTeMPK8bf9whq4RqmyIYx4J09X7gJdKQgFFdwH69eLV6ZWiOVEiFh9ooiQs0PKXe3sILsYiH31gDn4Qt/S1o0xNlRq5sQcVPwXaobwkvhbkd/1j1ngLoNgmkbxvm+wgit85u8+L35ESLfCXz9MbpygKwITV9wuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gL73X60l; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gL73X60l"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b4a9175181so263855e87.3
        for <linux-media@vger.kernel.org>; Thu, 03 Sep 2026 04:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788436404; x=1789041204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YlAxcekko1WzQ9ej7nCP/3I5A9S1XkCyAocKTij2/Qs=;
        b=gL73X60lhEAN95JgdMhMGAtLsNyJpdOj5nIWnsTUd0mBYojsbW5HfXrMU2ekHbt81H
         bVKDgJz2mokkmYRMgrZZKQ4XA6C9FPXXgi/zv/03m8s+FQ8T/KXHWw4UTphcnaHsmovQ
         pyWyb+cU9zRCgEx3F8jdbabaYrJnxeSHld0kjT5HUR4L2nbD97U+bf2+mjJifOLOLMW/
         KZSFULryGDPt4cdHJYL3305StOthvSIIgjyY4ea+dctVBHPmhpkARO+eyzdreBjDDtHn
         ULz5JPIzbmYvhYxW09X5v8XmQpQFkTcblGh9f5K4AkpoMXCfDHCG0RuVU8dCVoCpTiHO
         ELNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436404; x=1789041204;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YlAxcekko1WzQ9ej7nCP/3I5A9S1XkCyAocKTij2/Qs=;
        b=Gg3Gb62InFl+rMpHieNI9/jPHZJqbMveUVx3sAwXOk/ugsu1EEsx3JFC7EYXBNikrP
         Dff36izoR095RBYl1FpIB8XVG7WcFEkeSJD2dBIAVdepba3dSxq5SHM2t0wJv0+n4CWF
         /myRjVZnXETz7pHNp4uiz8FFad0DGK5B/O+utM4EiOJjTVl3r3wgn3QkOgt2jAqmqMSF
         D0PrqKW/vcbX4aycvf1hlQ6piHJCHdlCKptS5QrSjW89bckxIIaAP18HEDhOxB84z3kE
         mwfduKy8eJNGZfoRCVz4+K2zVrcXg27VIGVfZEHG1xM+dfbacAC30KUZ+45OmOrlrewT
         FvoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdehkrzSQ5IJgvZ+lTw2u5YJ7dxqLq/rP/QhheRzfH0A20hiOEHVgjnGIhioDYkO+MyAVUX7S0c4mWVw==@vger.kernel.org
X-Gm-Message-State: AFuF++lkeB7Wgh6H0QEUhwTtCQQyt8SS+fPFMMrmnPqDuNHNk7jCqJ92
	qdNdqwyOElRurF4NgwEIlWbMsfTEf/8E9JdDvgVYbGj1SDSbJLHn5WvTwUC81a0zPgU=
X-Gm-Gg: AYBFou3EDOcg4S0DZ4/85Uxx/awR9mJGX8+VbHAPEzYzGuFONO1MlNV7HTz8GHDbPtz
	Bq82/Zy6wNRyQWquvWh6bH2zCmElMMjDW+InV+vo2lFKsTXp5TdI+e5St29LLd4anuSrY34GDpR
	xX4a32K6Rvxnj3aY0en2LlWArjdm54dsMNUW89nb9YGwEOhblQQ/K1Ln1wf39vajh/57vKYJx/Q
	3xnb8SCw5O2XEDvkEUpOKL8UpTqU54guyHmBeFrr1zMcnc9HHi7TL3862LmT4cJIDqNhXe4sm3W
	y5CGGYQkoEzH3QRHYpdyUYspUGCPF3OZzZSxEbnBJb4ZGhstoyO99Zi6tjZecOVO1uX0fAqgGvl
	N7hDgYHKAscQPpALLu8rxtHU24w8mGsX5mssWUliQyQfUUx73Jf4TxWsAqmAdJC2WFQz6UUqqOG
	Ae3hRA21hS+EcfJPNaq7PORj9zkBU7WSsm4zKxoPaK6S60cnBRxRy57JkRX9YY564+2aLCJwj7U
	5BxPVg+SsGgBNkhcu2Y5QfreWJNJov86GiDOy90Gg==
X-Received: by 2002:a05:6512:2350:b0:5b6:4ae:19ef with SMTP id 2adb3069b0e04-5b608810e61mr1613364e87.5.1788436404014;
        Thu, 03 Sep 2026 04:53:24 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34ad21ef8sm11778701fa.28.2026.09.03.04.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:53:23 -0700 (PDT)
Message-ID: <9b0ac659-999a-4caa-8578-f34a39a67e4f@linaro.org>
Date: Thu, 3 Sep 2026 14:53:14 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260901-x1e-csi2-phy-v16-0-dd863b929080@linaro.org>
 <20260901-x1e-csi2-phy-v16-1-dd863b929080@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260901-x1e-csi2-phy-v16-1-dd863b929080@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 23:15, Bryan O'Donoghue wrote:
> Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
> supports both DPHY and CPHY operation. A special mode of DPHY operation -
> called variously split-mode or combo-mode also allows for two sensors to be
> connected to one PHY.
> 
> The submitted binding here describes the DPHY modes of operation only. CPHY
> is left to future work.

Like I've said in v14 review, the statement above is incorrect, and it has
to be changed, for whatever reason it hasn't happened so far.

 From https://lore.kernel.org/all/1e1bc17a-4c7a-4c08-b0c8-2a2ff31fe870@linaro.org/

>>> C-PHY bus type is also well described by this version of the bindings.

> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 222 +++++++++++++++++++++
>   1 file changed, 222 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..17de0701eb103
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -0,0 +1,222 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm X1E80100 SoC CSI2 PHY
> +
> +maintainers:
> +  - Bryan O'Donoghue <bod@kernel.org>
> +
> +description:
> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
> +  modes.
> +
> +properties:
> +  compatible:
> +    const: qcom,x1e80100-csi2-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: timer
> +      - const: ahb
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +
> +  power-domains:
> +    items:
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +      - description: MMCX voltage rail
> +      - description: MXC or MXA voltage rail
> +
> +  power-domain-names:
> +    items:
> +      - const: top
> +      - const: mmcx
> +      - const: mx
> +
> +  vdda-0p9-supply:
> +    description: Phandle to a 0.9V regulator supply to a PHY.
> +
> +  vdda-1p2-supply:
> +    description: Phandle to 1.2V regulator supply to a PHY.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description:
> +          Sensor input. Always present. A single sensor is described by a
> +          single endpoint with the clock lane at position 0 and one to four
> +          data lanes.
> +
> +          DPHY split mode, where two independent sensors share the same PHY,
> +          is described by two endpoints, each with its own clock lane position;
> +          endpoint@0 with clock-lanes = <0> and one or two data-lanes and
> +          endpoint@1 with clock-lanes = <3> and one data lane.
> +
> +        unevaluatedProperties: false
> +
> +        patternProperties:
> +          "^endpoint(@[01])?$":
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  minimum: 1
> +                  maximum: 4
> +                description:
> +                  Data lane positions following this endpoint's clock
> +                  lane. Positions are a per-port logical numbering, not
> +                  package pad or ball positions.
> +
> +            required:
> +              - bus-type

A review comment given to v14 is still applicable, 'bus-type' property
should be set as optional with D-PHY mode fallback.

> +              - data-lanes
> +              - clock-lanes

Here 'clock-lanes' is a truly optional proiperty since its value is
immutable in each endpoint, it should be removed from the list of
required properties.

Also 'clock-lanes' are not expected to be found in C-PHY bus type case.

> +              - remote-endpoint
> +
> +        allOf:
> +          - if:
> +              required:
> +                - endpoint@1
> +            then:
> +              properties:
> +                endpoint@0:
> +                  properties:
> +                    clock-lanes:
> +                      const: 0
> +                    data-lanes:
> +                      maxItems: 2
> +                endpoint@1:
> +                  properties:
> +                    clock-lanes:
> +                      const: 3
> +                    data-lanes:
> +                      items:
> +                        - const: 4
> +              required:
> +                - endpoint@0
> +            else:
> +              patternProperties:
> +                "^endpoint(@0)?$":
> +                  properties:
> +                    clock-lanes:
> +                      const: 0
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output to the CAMSS CSID controller.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - operating-points-v2
> +  - power-domains
> +  - power-domain-names
> +  - vdda-0p9-supply
> +  - vdda-1p2-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    phy@ace4000 {
> +        compatible = "qcom,x1e80100-csi2-phy";
> +        reg = <0x0ace4000 0x2000>;
> +
> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                 <&camcc CAM_CC_CORE_AHB_CLK>;
> +        clock-names = "core",
> +                      "timer",
> +                      "ahb";
> +
> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +        operating-points-v2 = <&csiphy_opp_table>;
> +
> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +                        <&rpmhpd RPMHPD_MMCX>,
> +                        <&rpmhpd RPMHPD_MX>;
> +        power-domain-names = "top",
> +                             "mmcx",
> +                             "mx";
> +
> +        vdda-0p9-supply = <&vreg_l2c_0p9>;
> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                csiphy0_in: endpoint {
> +                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +                    clock-lanes = <0>;
> +                    data-lanes = <1 2 3 4>;
> +                    remote-endpoint = <&sensor_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                csiphy0_out: endpoint {
> +                    remote-endpoint = <&csid_in>;
> +                };
> +            };
> +        };
> +
> +        csiphy_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-300000000 {
> +                opp-hz = /bits/ 64 <300000000>;
> +                required-opps = <&rpmhpd_opp_low_svs_d1>,
> +                                <&rpmhpd_opp_low_svs_d1>;
> +            };
> +        };
> +    };
> 

Apart of a few minor comments above, everything else looks good to me.

-- 
Best wishes,
Vladimir
