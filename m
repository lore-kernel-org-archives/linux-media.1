Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794000269;
	b=d0NKrME5Ur7lP3Cx9q1ZHNM6Al1VbPTFXMlrg4rgkZ5XTKEione9ASJXnX/SraXGKnn+
	 9rz41YLzTNJgVetOXtNjLe9WsCWIEKXFC5O4xyBWaZbxDjJmH0kgGl64lWHJOpKkUPC9/
	 jANDRndkPhrMNdvLN+jnLcBm0PsRCHFsqHm7ige92tzD1c5BQjb/FhN8VsvG026X1amwJ
	 z1swikL+/UijFwYGNr7v7xj3TB7LISU92uHp7XMXLAwvlciQwG9KNJC8dwCk4TzOB9hOA
	 P9iRDrnaWhLf1qf94CL1hV5se3v8p+4WdjPC9cL7bWyeRcQwhMXqH3kEykOL3Vp2Ufg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JgQZorfmVJL6DWcFzREhLYKs0WMZqy2VS3+IW1fCCJ4=;
	b=x81oMIdltKJdQwO9jDZ9bcACqbpQsaqNycIRWyUzhJY8xXk5eiFw4IjPHaCHh1Zg6wES
	 UaWKjEXQkigQwTXbeVr+NuSEBHjbReL4fAr8IdlyspbQznOGDIFdEuyfJ3qlx6NkS49Wj
	 j1i8ryotrDP8FaWEkQ7QzI+w5hEoIzGIlV/CMLZ0knw04WG8TbE69aAh08nv9/DrJBwPw
	 iRkNZBuqu4TGv4OXa6aoKStQKNrbPBfBZaNW98l2lKttItabgDhF0R8MvcaX7B6Go86iT
	 7e2XH/vKJeOiNkCPl0MFGGMZoKuqi1dLX7EDlanFaCI1Z0u7Temy/z0AgNLN1RiOe9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="rWLQ/8NW";
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A5D606A32C
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 21:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44A5D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rWLQ/8NW
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab43d1dbceso1550071fa.1
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 13:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794000266; x=1794605066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JgQZorfmVJL6DWcFzREhLYKs0WMZqy2VS3+IW1fCCJ4=;
        b=rWLQ/8NWxTGE/7+gNMjHcxkZNPqwFvuYgZW+TdXQEU7SS2f99Y3LAXTCHZcvHdfOBl
         PjsJ/1Fy5Qu/bARBKYihzWRiICTuoQdf50Nm8YByyuzV9d/lIKCImMWz765V72sYLfGd
         Icrjp04ZjcGfgo0ngM6Tj8bKbzvsQwtTqecy06coNgmMxoYFB+a072BrhagO0+9X4uD5
         hjFIx3zvJgr5O+yDFnMfL+HiiUCP+5dOtF2n/Gt6YUDEGLlI55CgqFOqUUlD0Ch5INhe
         wJfAqNzxWEbd8qjNMKIJetz0zFTA6W09gT1TyRGxwhdd6PSwKfQ3xqxSFfX7lseuG4I2
         4y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794000266; x=1794605066;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgQZorfmVJL6DWcFzREhLYKs0WMZqy2VS3+IW1fCCJ4=;
        b=OA4dwzktTldB9Txdx+gZgea7XxHRsLtLmFzTTsH0OvUXSFXJwWRR8PhdXeJ5BJhIFb
         mmpLyRnLrt1yKTjbhZmYIArhI69m9gT0UN8r/djI6ArhJbprzuLu7BJHeMj3RZrZ/g+E
         3n3I5c2TPsL6jKulhysU7dFSJQ++w1zdVpE8kf2UGyqc/R8SD9NKC6Nr9Uc0nlbdR9SA
         O5zBIPG5fsBxsuEwML3920DRoXjdz6OxoIR9OSZLp+YksSIL5ksySkv9bb5VVFlHKPFz
         +Q/OuvAI3OXBC1JDt5PwEZb6iG+n4JXagKFEC8TEDNxMytW2Ygafv/vvZ6OpH+ao9CnK
         jCrw==
X-Forwarded-Encrypted: i=1; AL+hErGvYvKf40A3QVi1l73ortF7BfiOZ1JtFnIbmWzBQ8HW2egVMYtvkTQ7BZoUmWdOMynbsxFNasNI7tQekg==@vger.kernel.org
X-Gm-Message-State: APuU4Z89jXLEiKtvxgf0cdoaWeQFe1rXRZzK00I1JITCcPANrsBCuH5U
	mzXY4MStTTEB3h7RIlz8lCWMXQzDUMj20LXZrTY959M4ORtihvuiVyJS996nEOoZbXU=
X-Gm-Gg: AYBFou1aK3MkzdH/uub9pJazLStU4ipU1YRsBeYv0O0fwJG3chfhNeShQGqc2BoIM4H
	v+213b7HhB/mbjFZVVpXy2EBMT4RtRySKx1eHVzmDAKZxAB86Qauu2ZSWBjDEmStf+HygFTreta
	2ABNVF8ATVjR8OnXEvsrOBhXaiD2A3odnLKvXf60C/evYQUmHjJR5DL9eDZC0OQ8KB65659jmdF
	Z2bD17QebQEYm9yS6MyMi+0Live4NJXoIyijBzc+v3Ifbhol9Q4NCB+v7N5oZz0VHwtk21zOVgR
	XmheKvbkwjaW2RSKNzv9paNEhk99A5+q547jP97GrGUWeHc6qk3GPUImQT7jGxKtuotm5DZqfEF
	5GteahEIZ3SyVickJJPFX8LVXYsMA7n/TDO+l2F2t8D730331WojEBy35betCvPSJXwetZwR1//
	K8qzaIpsk2GJpNDMywJ22n2QBI0kgEqE0sFk/57uXW6UbzmtSuUOJGmBZ0kiURyxbW4ajgFaqAv
	UWjNancAhmSoPU6xTNUdw9Ew6OmsMkCwdgBrNn17LsLpsvYL5gkpWCkgBmmPDFubfo+Ybrjp0Yv
	V1m8tdDfVeC7E0g/k+LI8wNE9BMPc2+Xz0dQpTmSwG934U1wqBSkGhQn1f40V6SRRstUOymAcLk
	EoqcJsQ==
X-Received: by 2002:a05:6512:1296:b0:5bf:a48b:7827 with SMTP id 2adb3069b0e04-5c0037d4da0mr1356307e87.2.1794000266266;
        Fri, 06 Nov 2026 13:24:26 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c00309a58bsm497564e87.73.2026.11.06.13.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 13:24:25 -0800 (PST)
Message-ID: <a9ab1add-5f04-4687-83bf-ca29a068ee33@linaro.org>
Date: Fri, 6 Nov 2026 23:24:24 +0200
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
Subject: Re: [PATCH v3 3/7] dt-bindings: phy: qcom,sm8150-csi2-phy: Add SM8150
 CSI2 PHY
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-3-0103e8a0bbcd@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v3-3-0103e8a0bbcd@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 11/6/26 20:35, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Document the Qualcomm SM8150 MIPI CSI2 D-PHY. The PHY sits between the
> CSI2 sensor and the CAMSS CSI decoder and is fed by the CSIPHY "core" and
> "timer" clocks, the TITAN top power domain and the vdda-phy/vdda-pll
> supplies.
> 
> Unlike the X1E80100 C-PHY/D-PHY combo PHY, SM8150 only has a D-PHY, has
> no separate AHB clock and no MMCX/MX power domains, so describe it in a
> dedicated schema.
> 

very much appreciated for changing the CAMSS phys to this format.

Please double check if SM8150 CSIPHY v1.1 is capable of C-PHY:

* https://git.codelinaro.org/clo/la/kernel/msm-4.14/-/blob/LA.UM.8.1.r1-16600-sm8150.0/drivers/media/platform/msm/camera/cam_sensor_module/cam_csiphy/cam_csiphy_soc.c#L239-256

D-PHY combo mode is also supported on the CSIPHY apparently.

Likely these features are supported on SM8150.

> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> ---
>   .../bindings/phy/qcom,sm8150-csi2-phy.yaml         | 163 +++++++++++++++++++++
>   1 file changed, 163 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sm8150-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sm8150-csi2-phy.yaml
> new file mode 100644
> index 000000000000..86d8970d1119
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,sm8150-csi2-phy.yaml
> @@ -0,0 +1,163 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,sm8150-csi2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8150 SoC CSI2 PHY
> +
> +maintainers:
> +  - Andrew Gigena <mail@andrewgigena.dev>
> +
> +description:
> +  Qualcomm MIPI CSI2 D-PHY. Connects MIPI CSI2 sensors to Qualcomm's Camera
> +  CSI decoder (CAMSS).
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8150-csi2-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: timer
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
> +    maxItems: 1
> +
> +  power-domain-names:
> +    items:
> +      - const: top

In downstream camcc-sm8150.c, PLL0 is on MX, and PLL0 supplies CSIPHY
clocks. I believe MX shall be added to the list of 'power-domains'.

> +
> +  vdda-phy-supply:
> +    description: Phandle to a 0.88V regulator supply to a PHY.
> +
> +  vdda-pll-supply:
> +    description: Phandle to a 1.2V regulator supply to a PHY PLL.

Still it would be preferred to get 'vdda-0p9-supply' and 'vdda-1p2-supply'
properties.

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Sensor input. A single sensor is described by a single endpoint with
> +          one to four data lanes, numbered 1-4. The clock lane is position 0.
> +
> +        properties:
> +          endpoint:

Back to downstream

* https://git.codelinaro.org/clo/la/kernel/msm-4.14/-/blob/LA.UM.8.1.r1-16600-sm8150.0/drivers/media/platform/msm/camera/cam_sensor_module/cam_csiphy/cam_csiphy_soc.c#L239-256

D-PHY combo mode is also supported on the SM8150 CSIPHY apparently,
it shall be reflected in a way that two endpoints could be present.

> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              bus-type:
> +                enum:
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +                default: 4

Please double check if SM8150 CSIPHY v1.1 is capable of C-PHY:

* https://git.codelinaro.org/clo/la/kernel/msm-4.14/-/blob/LA.UM.8.1.r1-16600-sm8150.0/drivers/media/platform/msm/camera/cam_sensor_module/cam_csiphy/cam_csiphy_soc.c#L239-256

> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  minimum: 1
> +                  maximum: 4
> +
> +            required:
> +              - data-lanes
> +              - remote-endpoint
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output to the CAMSS CSI input port.
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
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sm8150-camcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +
> +    phy@ac65000 {
> +        compatible = "qcom,sm8150-csi2-phy";
> +        reg = <0xac65000 0x1000>;
> +
> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
> +        clock-names = "core",
> +                      "timer";
> +
> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +        operating-points-v2 = <&csiphy0_opp_table>;
> +
> +        power-domains = <&camcc TITAN_TOP_GDSC>;
> +        power-domain-names = "top";
> +
> +        vdda-phy-supply = <&vreg_l5a_0p88>;
> +        vdda-pll-supply = <&vreg_l12a_1p2>;
> +
> +        csiphy0_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-400000000 {
> +                opp-hz = /bits/ 64 <400000000>;
> +            };
> +        };
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                endpoint {
> +                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +                    data-lanes = <1 2 3 4>;
> +                    remote-endpoint = <&sensor_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                endpoint {
> +                    remote-endpoint = <&camss_csi0_in>;
> +                };
> +            };
> +        };
> +    };
> 

In general the change looks good, thank you, but likely it can be embedded
into the scheme for X1E.

-- 
Best wishes,
Vladimir
