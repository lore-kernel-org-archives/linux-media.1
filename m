Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A44C481649
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784126298; cv=none; b=qqe4NAmQw9mQ75i9tiT0+Ll1sc2sT/f8qWsjqbMoArgKi+FqkAN0I0xhzpC4Uokw1Ty0ZTPMtHjs0xjV4Pkk5VZCL+1OjaO64cxzQ9+htC8RvbEnP5ie38YrAAgyguah2xeiVbujJsmf1HHfpLXolZIwZTZ7Tk0HPTwMbz5qzNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784126298; c=relaxed/simple;
	bh=wX3Ll/K9AqfiEwdJ+/jIgOd2YH34L+aERYOqL9rnsBA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=s5JwG0bthG7lQOBCRhO3tLWsKRIPbBM8sXd4wC+/7BDs4h/HQ24oatIe2dVeuwoce9iy0y7ffpmC3NP9VtAa9c+bPk4nZKDvkeN4cg0nD9bVnS0VOGlO2fL7scLDjDuXTKat8fh699XkxSx2IcoBHmH6NK+TLECLDFY0xAgH/Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tT5sI22E; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tT5sI22E"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79DED12D6;
	Wed, 15 Jul 2026 16:37:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784126235;
	bh=wX3Ll/K9AqfiEwdJ+/jIgOd2YH34L+aERYOqL9rnsBA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tT5sI22EzwCVqcrkv2J/A02yE3RdrCWzRGO4/rgoJDMBFZxi9ykBNwxPBZvzRYyGs
	 YRRhYH1hgwTMn82PDLtHuVUA/1MUK8XyVzUjdvGksyXTd1uo+S0WOCsheMFWcbFyWD
	 YUrS4LA2X7U5KG2jef4VZ4FIKuEV7khJxE9khI38=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260715135711.605907-1-sakari.ailus@linux.intel.com>
References: <20260715135711.605907-1-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/1] dt-bindings: media: i2c: Add Sony IMX678
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Wed, 15 Jul 2026 20:08:05 +0530
Message-ID: <178412628543.1426769.352759015067977932@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Sakari,

Quoting Sakari Ailus (2026-07-15 19:27:11)
> Really add Sony IMX678 bindings this time. Those were accidentally missed
> from commit 447ea0c26e57 ("dt-bindings: media: i2c: Add Sony IMX678") even
> though the original patch included them.
>=20
> Fixes: 447ea0c26e57 ("dt-bindings: media: i2c: Add Sony IMX678")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks for the quick response,

Acked-by: Jai Luthra <jai.luthra@ideasonboard.com>

--
Jai

> ---
>  .../bindings/media/i2c/sony,imx678.yaml       | 130 ++++++++++++++++++
>  1 file changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx6=
78.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml=
 b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> new file mode 100644
> index 000000000000..098f72544216
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2026 Ideas on Board Oy
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX678 Sensor
> +
> +maintainers:
> +  - Jai Luthra <jai.luthra@ideasonboard.com>
> +
> +description:
> +  Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid=
-state
> +  image sensor with a square pixel array and 8.40M (3856x2180) effective=
 pixels.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - sony,imx678-aamr
> +          - sony,imx678-aaqr
> +      - const: sony,imx678
> +    description:
> +      The IMX678 sensor exists in a colour variant (IMX678-AAQR) and a m=
ono
> +      variant (IMX678-AAMR). The variant-specific compatible describes t=
he
> +      exact sensor variant, with the generic IMX678 compatible as a fall=
back.
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: |
> +      Input clock (INCK). Only the rates listed in the datasheet are sup=
ported:
> +      13.5, 18, 24, 27, 36, 37.125, 72, and 74.25 MHz.
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Analog power supply (3.3V)
> +
> +  ovdd-supply:
> +    description: Interface power supply (1.8V)
> +
> +  dvdd-supply:
> +    description: Digital power supply (1.1V)
> +
> +  reset-gpios:
> +    description: Sensor RESETN (XCLR) GPIO
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +                  - const: 5
> +                  - const: 6
> +                  - const: 7
> +                  - const: 8
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - avdd-supply
> +  - ovdd-supply
> +  - dvdd-supply
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        camera@1a {
> +            compatible =3D "sony,imx678-aaqr", "sony,imx678";
> +            reg =3D <0x1a>;
> +            clocks =3D <&imx678_clk>;
> +
> +            avdd-supply =3D <&camera_avdd_3v3>;
> +            ovdd-supply =3D <&camera_ovdd_1v8>;
> +            dvdd-supply =3D <&camera_dvdd_1v1>;
> +
> +            reset-gpios =3D <&gpio 0 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                imx678: endpoint {
> +                    remote-endpoint =3D <&cam>;
> +                    data-lanes =3D <1 2 3 4>;
> +                    link-frequencies =3D /bits/ 64 <720000000>;
> +                };
> +            };
> +        };
> +    };
> +...
> --=20
> 2.47.3
>
