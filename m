Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08996445AD3
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 08:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621847; cv=none; b=tcX1AjE8iomfGjEdFjewPrGgrJlFGNeXpY6hH3tjj7xiCbXE9pl/vXemH+QuBZh0FH2b3IR1XDFKWhY4GKHOuAw5Xpu4UdUZ6ZsbyJlgfkCMC9dj8gcvZfWyQ9XeC2dUdaMrF4cDkhUhlimklrQlNyWSQ2tLissPg7ER8Ym9Nek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621847; c=relaxed/simple;
	bh=dpVwbMp9E2vKDgBuXrm9+r2iQvb25xCrAl3x2/DGoCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UQV1cG27aA6Mk+tJEuRr/ym8Dmn6eDXjtYZRnUReq2NU12UnNWc7cdSd0e6ZqY/psEjupm2EAVBODt8Ss18HG4ZQ03ezhUQmY+OLnkMLkA+9Xiw72pBttlSktICbyfCQFdYOzoPeB31TJs8LrBKyVjshDiXO5GywdjZTlsk9UdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fbDbdf1M; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fbDbdf1M"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeb72b0af1so1249938e87.3
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 01:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784621837; x=1785226637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gKMYuSxpffkyrGpleNqSwP2E6RLfbUM1DxXqtJdN6kU=;
        b=fbDbdf1M3fFP9iwmagRMeWDkM5YPETFEQp2qxkJu6rWzR8h6RIzKIVnUOq8HK60bsU
         J9d5nRpjjKR/SaX4yTjIinY7mUM7DKZAshxaLyBcFQSDZMLm6iPVZ1ym8O5Vto8AvZRf
         flriLfknHFFU9MQTvNhngTchCSZgKrA3kTZyjKy5I5J8jmVJNpy3ehV3ocOuF68AGf9v
         7nttAtXS+q3Cy12A8hWnzBKu8Pm4xtFDVq7mssu5RVYek82NA5gixUPZ99KfoPd7q6YX
         3eyqPjX9rHP4UYK0Qos6OSrLO6x8CHIjmvM8mImF86tfvoTlOTKXvsITKTg8ChEPLqSa
         5XyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784621837; x=1785226637;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKMYuSxpffkyrGpleNqSwP2E6RLfbUM1DxXqtJdN6kU=;
        b=UKVQLRtJDYP6IwAolZhvWPNTol6BgSvx6g7BVvC1aRhdu/A3BfraOGpEe712GrnrmN
         k5sk0/jlq6KnVVU70byw1UjyMN7J4IsebtWpofwKuPrJkJsgybA7h/3rUHwDyzG1I9bZ
         J9rlt85uU9oIRS5XHS/m+nnMe+JhWcZxr+b47AuO6jEkpviPbTypfhlXp2Xpt37WzwM9
         pYY9tUxy8JfuHNf+QeHwd5QxKzgJYQx59i2r9X+3CHQU5w3/qbTpeJC8MdKdWKQ2HZTL
         5HNEQGK8sb2c1k+kbXNyHvBWaOPcpwG0yzt12du1I1M0hsLnSZr9jNN0FNcCjZhJrIWW
         TQoQ==
X-Forwarded-Encrypted: i=1; AHgh+RobX5n65jRn5/NCaSwpxSfhFTBxqsizi/ga/MtvnBWS8yDIwyCvZtzoxuTT5ChurZoqH/ODwt0zcQ+dwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlwOImRaK8xLUGFgeZsyURQr4l8D5DAInE3i5WugXexXZeXVpu
	htdPjiJ3ExenjnY7nwiHyuavJGCS+KWpxr74OqbiWEO11BRLH2oaHPcj0trJK3Zc1Rw=
X-Gm-Gg: AR+sD10kTNv5p0X13yUUBWI04Dq9EZeE5VuN0vROg8mwsBMEBawaV+ciWpm+SdR6R8F
	ry8E+bBHZInMMNF/fBPoeWopGOiRF2VUMHUzoe/Ra5L3KP+NVs7f+wKaKP3QwxHsLLxiUZ/qQH0
	ruJp8OqXnZ6aa8HsEUyeQc1jsJuB3LCyv2aalQRquiF/mQFAZV1Wh15b8zZfqHCdV1RQIzP7BwI
	OtuUBgBfkZtF0+alflXycZ5YSmMFtsUjoH5ZbXniLTJLBQ2P66McNAcYp7GxEsuB6wrAyGj5BDx
	HpqFS74zvxnE6L8Gn3MoeBJOTDNOa9r0K2gvvaY4tDvV2v7b/EUedSD8Qh5O/aLOq2iSGHRWrHt
	Opexgl1AsDo5xZT9RgaNa5denaXr7IEXJ4AuIJr62WAt2XN7NTetUA+dLMyDmU/7wOfCb0K/QP8
	qTQsoqqZ9Hqwbely4QhWfMtDK1sut+4OCgfh/RnlpTdY84q0T+T008qGpE
X-Received: by 2002:a05:6512:3e24:b0:5ae:c063:638c with SMTP id 2adb3069b0e04-5b2a4a87341mr290377e87.7.1784621837200;
        Tue, 21 Jul 2026 01:17:17 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e25e5bsm2736698e87.78.2026.07.21.01.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 01:17:16 -0700 (PDT)
Message-ID: <0da6d314-bfa9-493a-bcc6-8c3b75751d0c@linaro.org>
Date: Tue, 21 Jul 2026 11:17:16 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org>
 <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/20/26 04:11, Bryan O'Donoghue wrote:
> Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
> supports both DPHY and CPHY operation. A special mode of DPHY operation -
> called variously split-mode or combo-mode also allows for two sensors to be
> connected to one PHY.
> 
> The submitted binding here describes the DPHY modes of operation only. CPHY
> is left to future work.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Since there is no changes in dt bindings from v12, all comments from here
are still applicable to this version of the changeset:

https://lore.kernel.org/linux-arm-msm/20260719-x1e-csi2-phy-v12-0-cc7311326d1b@linaro.org/

> ---
>   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 195 +++++++++++++++++++++
>   1 file changed, 195 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..880fe602945cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -0,0 +1,195 @@
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
> +  "#phy-cells":
> +    const: 1
> +    description:
> +      The single cell specifies the PHY operating mode.

This has been reported before, #phy-cells shall be 0, the operation
mode is selected by bus-type of endpoints as it is described in
video-interfaces.yaml

Two competing values are redundant and it opens a door to a wrong
hardware description, the technical discussion has not been started yet.

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
> +          single endpoint with one to four data lanes. DPHY split mode,
> +          where two independent sensors share the same PHY, is described
> +          by two endpoints; endpoint@0 with exactly two data-lanes and
> +          endpoint@1 with exactly one data-lane.
> +        unevaluatedProperties: false
> +
> +        patternProperties:
> +          "^endpoint(@[0-9a-f]+)?$":

endpoint suffix regexp is incorrected, this issue has been reported
previously, still it is not fixed.

> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - data-lanes
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
> +                    data-lanes:
> +                      minItems: 2
> +                      maxItems: 2
> +                endpoint@1:
> +                  properties:
> +                    data-lanes:
> +                      maxItems: 1
> +              required:
> +                - endpoint@0
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
> +  - "#phy-cells"
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
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    phy@ace4000 {
> +        compatible = "qcom,x1e80100-csi2-phy";
> +        reg = <0x0ace4000 0x2000>;
> +        #phy-cells = <1>;
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
> +                    data-lanes = <0 1 2 3>;

data-lanes values has not been corrected in accordance to linux-media
requirements.

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

-- 
Best wishes,
Vladimir
