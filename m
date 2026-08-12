Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B134E375AC6;
	Wed, 12 Aug 2026 02:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786500638; cv=none; b=p1b4sXzJf/oUjLQcOX404dMSEbtrkDiT7hHvlTqNATkV2gH1x9LNlmT3KRwmUWK8l4rMhD2ce3ET6YfhMtmafevMGwcMXGU+llHxAo3SzpJXgNea96SDicbflPxuFoJ4YUzM/anMHZ8uRIYFqmHcRFLIHimp4AYfrqBUGmY+c2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786500638; c=relaxed/simple;
	bh=ID3odt6xwl1iROEkBBhNGpjLb8nmkJwgJTJozDfgNHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DmQ5bc93HKzHenPYUXo+powDF/du0YVLB+aaH0gt6EQtOQ2xH3BuiMGwrUc40Lt+Qlgh8cGrRbD4X/MaQHI8nGxr6bJGdUjGeBJoA5URXPs/ERpDCBbisbNiTNi3RN8IhZ0uQ5ra6aBVG6fAsyDMZud/npl0GrjBHgGSrdVSyc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2ztoFFu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2ztoFFu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5A91F000E9;
	Wed, 12 Aug 2026 02:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786500635;
	bh=M7QfH0+UvDU6sg/jtKuoOvQ2Jpx7EZQIa7/CaXc1l3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X2ztoFFuvA5U3SZH+2aA5EHNQ7erbn7Oe47P0InpJeIR2FCqroL7tuAJQ5v3QNl5R
	 Odkf9kzDUxgpOisUbdvtHmhABCJPJIBVXmI7MANV95CpTaHgrGrvT0ijGqvWu984h/
	 RH2U7wvb9tvEBtpMKxOGCDQNYrLMy/lwvsIvP4f8AtzhT63ZPPgL299mwFV42e5CgD
	 nRBVV0bsvhkUINI78XOHt6jUOpooxb/ItXB54ay1ik23KtIUW3mejpoHBcKWnhvQNI
	 vLb0sZBJWjMqiJ0FQm6zyUi7feuv3yK1mk0cg84GGnIJGxiFVI/a6dNodbAWcDMcze
	 /EE93H4H7WILw==
Date: Tue, 11 Aug 2026 21:10:34 -0500
From: Rob Herring <robh@kernel.org>
To: Danila Tikhonov <danila@mainlining.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kate Hsuan <hpa@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Eugene Lepshy <fekz115@gmail.com>,
	Vasiliy Doylov <neko@altlinux.org>,
	Achill Gilgenast <achill@achill.org>,
	Luca Weiss <luca.weiss@fairphone.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/4] dt-bindings: media: i2c: Add Sony IMX471 CMOS Image
 Sensor
Message-ID: <20260812021034.GA537738-robh@kernel.org>
References: <20260805-imx471-v1-0-7be79f539ed8@mainlining.org>
 <20260805-imx471-v1-1-7be79f539ed8@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-imx471-v1-1-7be79f539ed8@mainlining.org>

On Wed, Aug 05, 2026 at 10:54:24PM +0300, Danila Tikhonov wrote:
> Document the Sony IMX471 CMOS Image Sensor.
> 
> Signed-off-by: Danila Tikhonov <danila@mainlining.org>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx471.yaml | 123 +++++++++++++++++++++
>  1 file changed, 123 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx471.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx471.yaml
> new file mode 100644
> index 000000000000..9c6c7c55746f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx471.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx471.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX471 CMOS Image Sensor
> +
> +maintainers:
> +  - Danila Tikhonov <danila@mainlining.org>
> +
> +description: |-
> +  The Sony IMX471 is a diagonal 5.822 mm (Type 1/3.09) 16-megapixel
> +  back-illuminated stacked CMOS active pixel image sensor with a 4656 x 3496
> +  active pixel array and 1.0 um square pixels. It uses a Quad Bayer color filter
> +  array, is programmable through an I2C interface, and outputs image data
> +  through MIPI CSI-2.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: sony,imx471
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: External input clock (19.2 MHz)
> +    maxItems: 1
> +
> +  vana-supply:
> +    description: Analog power supply (2.8 V)
> +
> +  vdig-supply:
> +    description: Digital core power supply (1.05 V)
> +
> +  vif-supply:
> +    description: I/O interface power supply (1.8 V)
> +
> +  reset-gpios:
> +    description: Sensor reset (XCLR) GPIO
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            items:
> +              - const: 1
> +              - const: 2
> +              - const: 3
> +              - const: 4
> +
> +          link-frequencies:
> +            maxItems: 1
> +            items:
> +              const: 200000000
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
> +  - vana-supply
> +  - vdig-supply
> +  - vif-supply
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sc7280.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camf_imx471: camera@1a {

Drop unused labels.

> +            compatible = "sony,imx471";
> +            reg = <0x1a>;
> +
> +            vana-supply = <&vreg_camf_vana_2p8>;
> +            vdig-supply = <&vreg_camf_vdig_1p1>;
> +            vif-supply = <&vreg_cam_vio_1p8>;
> +
> +            clocks = <&camcc CAM_CC_MCLK0_CLK>;
> +            assigned-clocks = <&camcc CAM_CC_MCLK0_CLK>;
> +            assigned-clock-rates = <19200000>;
> +
> +            reset-gpios = <&tlmm 20 GPIO_ACTIVE_LOW>;
> +            pinctrl-0 = <&cam_mclk0_default>;
> +            pinctrl-names = "default";
> +
> +            orientation = <0>;
> +            rotation = <270>;
> +
> +            port {
> +                camera_imx471_ep: endpoint {
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <200000000>;
> +                    remote-endpoint = <&csiphy0_ep>;
> +                };
> +            };
> +        };
> +    };
> +...
> 
> -- 
> 2.55.0
> 
