Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC963F0770;
	Thu,  6 Aug 2026 10:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786012418; cv=none; b=T2Q8YXKDetQr999vpGJ/lqJdN2M/ilAXW+5FBDLcTnsfsaLy0DugOCrC046hS+Ol6EG5d7ajMmTolWKe/efEXiMsFWz5VYjPgAN7y5Ivjx1WOrVtoXtbKHzPIU17J+mmqhHT2vE3NROPQwPuqyf4CX2QxAwDKR0opLuEZoYCnMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786012418; c=relaxed/simple;
	bh=fwVTr9tIDtBT7T7uSGrNDOv/+s35O7ySNAbqC5QtOek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzmDHJYFzBMlp+HH1HTT6EC52cjedbVJil3GDyeUkwmtTKBMtVo9tnSkW06QKnK4gIq4rYoVNgqADOjRk7S2KJzF2bphtHvfbnlnOzMTi5f9WY+6QxNSN7UsnguCO1TsLWoE9NqjF7NKysPFgYmZnhhNTNTvNWuzLR1ikrizmWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZH7NdKF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZH7NdKF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786012416; x=1817548416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fwVTr9tIDtBT7T7uSGrNDOv/+s35O7ySNAbqC5QtOek=;
  b=QZH7NdKF/40FnP1+ORKtimryfXpXQ0oM2lpZtrShaU4Tjzr8g7/Tj0dG
   i9DszyqOMEQcex+4Pm5nnt71FpQxoN4pG1uz1ebZ4K1uCQpJTgx0Kp0a6
   iZS+HMAUOQ6t/GjTfeH0RFlSspvZxrxsn7T8m5QAdOno3GFI+TCQvylvm
   qH1/k+XC4bUG0mrxbWKZRefQrf2ljO8o8+fXCXS/2/vmN/3JYOCYeq3V2
   3ODHdF5sPYXm23m0QS9E8pg9a9Hb86oj3CqdVrWwQWwManS8kjbmBdj+4
   TMrlDL1+vBz/LPwiQ6SY8tEeh0oI9qnvb2WCeTv0OOqy9Tg0JSie47HdX
   w==;
X-CSE-ConnectionGUID: GH31yF1FQMqMicPDeq46aw==
X-CSE-MsgGUID: aMV5giBuTjC1qCvPrlECrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86717269"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="86717269"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 03:33:35 -0700
X-CSE-ConnectionGUID: NcN9eEkpSbq0dJZ+18UNxg==
X-CSE-MsgGUID: ASLHmVknTdGWBL+lUmyM7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="266295363"
Received: from inaky-mobl1.amr.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.225])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 03:33:31 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6AADE121C0F;
	Thu, 06 Aug 2026 13:33:38 +0300 (EEST)
Date: Thu, 6 Aug 2026 13:33:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Danila Tikhonov <danila@mainlining.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kate Hsuan <hpa@redhat.com>,
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
Message-ID: <anRjAhAhFBWfgxvV@kekkonen.localdomain>
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

Hi Danila,

Thanks for the set.

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

I believe you can drop ' |-'.

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

The sensor also supports two-lane operation.

> +
> +          link-frequencies:
> +            maxItems: 1
> +            items:
> +              const: 200000000

The sensor isn't limited to 200 MHz, is it? I just wouldn't specify it at
all.

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

-- 
Regards,

Sakari Ailus
