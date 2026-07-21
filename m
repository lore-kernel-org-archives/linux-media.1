Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC61444700
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 08:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621748; cv=none; b=AWqX0Pa6NZmIRPbNiPJoGwv0SiCFx8W61miJXR2obaVrpoOswCPJzmS5shbfOg30iEw57FwhK3G63g0u0GrE6tG48hwnYx5cmSIaJQv2+6SOrk7oMmhjUqnfQDWqZkRJWnIGODZz4Vr2N1iHmsqQLFPWvRdb9LjOWzs/FA+JbSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621748; c=relaxed/simple;
	bh=prhorMOs0HUs4HPMOoyn3Wxj7sy84z7z9tcp/RjFPvo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IfTjJU2Ey0EanZKYHNe0XSzDNBjrMFaZ+EEhgpm83BA7htYnYI10dbbnoAml/twbJjzYKhzQgPefrPyKR80dU9vEDOsvb9hydBnNUUHljZqneIlIfR6aOc2fEiwzeOvwoPG78LJhceNbL+JzFvwoiF7L/gNWjrMjKCpyMdBZMAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vsTC1/nm; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vsTC1/nm"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-471eeac43bfso10244331f8f.3
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 01:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784621732; x=1785226532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYoAtIkHW87FIAd0vM+TKdI5UC2ppQruRqxPUsfJzmE=;
        b=vsTC1/nmIHqMBYyt8RzRVERPI6lqz+eDYrvMeYS+647+48QW9wkrJ43Ep2gxHTvKGm
         KHwLcvGVxYI0LG9dyhVGXLZ+CoLUsG3MvTGDaFSdw25rVd+zM0Z6x72mIow63B35qnLs
         zw2DdiPhBsPRfKcHyzuw+QXVp0zf8RUwcpviQzsIjIU6wNCnzmCZSLzhDmHKp4Ng8Whl
         bZrjKtHXMf/gemHNwYKOo5tJoBMagYuZpT6ofr0jUETs2z7iWYtubkXRhIQGxMeVNm2p
         tr3hZI6s2BNNnylL5gJGEETH6Z4Bxv7SQ2lf5LpQhwnA8rKqVM0sohKx0fLF7+v60nLO
         hvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784621732; x=1785226532;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZYoAtIkHW87FIAd0vM+TKdI5UC2ppQruRqxPUsfJzmE=;
        b=F8ho5khIn+DC1HeYGnWfhZu4cw/2yET0uQr00gnES4t0lJj2wfPis23dgayUgIAk6T
         9TiGJR2+JR90R81A8Y7nJJoml/3ha7yFFSRImHSOKzHn6gR8dSd//UT6xK1AKNaOukx8
         j6A76OFOBgVkKxPI3nzUuDvygsGAq0/DoxMO94vqQGHGR45OfSwDKvL6Jx1YOewjZDd5
         vQp12Z1IkqXFJ8IwZywwx4gJisHAPTGV5zqWMOcMv/c2OwyjLhqkPXNzwCtghPOzEphO
         DkdW+EcI98fKS7xHoHBsrLFX73PbBmZaPrmtCSf1/Defy/m08xeTOF3J3h36IGXaPU/9
         gxnA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9ZFCXf6AYEez11pvOvSeIJTEEz2Z/PLfyGfirAEjP3sE02wBUrqTCfcBAIe2i6O7lzyF55Kq/VPZdmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNeq6QeKgHM7f7h1Ady8YmbeI6Ip0ac5sV2J1XMu+LBR0qxu1V
	SraBuR+SgnZuOAeSBtGfaOJbeWP6hivWBE8G0MKt+0vXTporYGfzrXqYJa6F9yLstjM=
X-Gm-Gg: AR+sD125N45sqwhIkU5uiS6Tgw3t0oXU88lOeAF23KFHoGNCGkJty2F0D9Yzk43TS9f
	sZ2Q2V+OzTIM8WZwG37XCFGvj8y2VAacQVMvHjEEW9K/+VEDugH+bAzhFn3DQ7vaonYpUqc9mqT
	TkJaGiT+3nmQA+WGuJlzOvMJr2qYT5VSh3UkBW6d1dA4Ltam1ZojA+kOva3c/O1KecrGwfcc82u
	4zdjis33kGZhBmgw20J/RB4t30WDMA8R9N30wlRlyzDmKOIy16AT47u/g0mZv2kH2dE+5LIaSrk
	e52RduCPt9KG3T2QNl6NWBABOMYtcFC4QdVPJ7Tq3ua+GpOXzhiB8yiRmtRXcIQiYOCpnogcs5I
	nNbOV2f0nILTKHgnV2kPI0GNjzkrwN39+RGx1w4hv1O2A64e1S0sN6VdohLxzwsbynkF3NOKtB5
	OdI06pFarbE633twHRaOOkg8B3idrIQytUjB3DYT5LKZZYyWeVLGDbkxk=
X-Received: by 2002:adf:e00f:0:20b0:47f:77ae:d8f9 with SMTP id ffacd0b85a97d-47f77aeda2emr6547848f8f.59.1784621731787;
        Tue, 21 Jul 2026 01:15:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:588:18d6:82ff:eb96? ([2a01:e0a:106d:1080:588:18d6:82ff:eb96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f6b85970esm30396524f8f.15.2026.07.21.01.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 01:15:31 -0700 (PDT)
Message-ID: <4c9ef1ac-1748-4604-99af-52e37877b23b@linaro.org>
Date: Tue, 21 Jul 2026 10:15:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v13 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org>
 <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 7/20/26 03:11, Bryan O'Donoghue wrote:
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

While I see the utility of moving the CSI PHY into a separate node and
transferring the sensor endpoints there, I don't see why the PHYs would
be linked to CAMSS via the `phys =` property and via a port/endpoint to the CSIDs.

In my view, the `phys =` property should be used to reference static PHYs
associated with a controller, whereas port/endpoint graphs are better suited
for identifying the node and device for dynamic PHYs, like the ones we have here.

To that extent, I understand how moving this to the PHY framework could help
clean up the code. However, some PHY-related logic will still need to remain in
CAMSS to handle dynamic associations to different CSIDs at runtime.

I'm still not really convinced about moving this code to the PHY subsystem
as a standalone PHY driver.

Neil
