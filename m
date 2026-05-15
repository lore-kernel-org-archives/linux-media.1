Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F7044D001;
	Fri, 15 May 2026 10:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841595; cv=none; b=j7gJDZTPld5ePtF77x/xT3WY29NpYoWmcWyttWaC6OP7+Ocuarx9bxK0CeVuSZrq1007wj4T92FDt4Q0TG4xHB2PquwRVY0dmXCA7xutmY/Qo45P2RFhZtn7+fQHLr+JRG0NZnvb+0PtMc/62V2YYFjhuGI7l27J1LYKr7JudTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841595; c=relaxed/simple;
	bh=F2K+7FDUJtbESplW0IG4BAnCiZSuUiTnTBrp7OG3XTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZRfShfcT4v1vKa09IYOTgPjChujgtiipdaG9WptBZ51GwvEZz+EOzVIBeTaOjvrW0MNsg7mK6F7ZvrAdziHg4/KtL/v1xsVVRoC5FRJxNe8f9CP9IKGZRGjxhFmpo8TW7I+QSescuTcEaQdF9+4TDmZfxUxPxRmEB6Ejjg98bGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXizuLpU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXizuLpU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D90C2BCC7;
	Fri, 15 May 2026 10:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778841595;
	bh=F2K+7FDUJtbESplW0IG4BAnCiZSuUiTnTBrp7OG3XTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WXizuLpUNBsyMcu/ngYzIUOaWO8IvwPvLSUV6CR2KTx3REvsdC76yekrwglLrXaDs
	 1QT6IMdUc1+FZA+KuIX25osjTCEeB2uGDdhh17qdI4XkIz2oNZKH50Uj6sFkijJqba
	 ijy6hPHLDCU9DPci4C3+6Om4VRW567pccVxxXW0ZHlfqzp8mReUzHlLM0guzf8N9j9
	 OdhakEE5pQ9Sw47YY8UFheX6KKz4rRmTJ+KT8vVuUgTQpnl94rEUcWbO2mhHulDhCR
	 tVEzLyqW5hL24ZgvYopjfr9li+ClTUrxx38lhao86z/ARKiq6slVzjmYDftoGMWKBF
	 OU1o9JYOlo1Kw==
Date: Fri, 15 May 2026 12:39:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add Sony IMX678
Message-ID: <20260515-axiomatic-yellow-armadillo-b14dea@quoll>
References: <20260513-imx678-v1-0-30fc593ed8fa@ideasonboard.com>
 <20260513-imx678-v1-1-30fc593ed8fa@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-imx678-v1-1-30fc593ed8fa@ideasonboard.com>

On Wed, May 13, 2026 at 09:03:16PM +0530, Jai Luthra wrote:
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
> +          link-frequencies: true

Drop. My patch fixing existing bindings is still valid and I do not
agree with other approach. I wanted to fix all existing bindings to make
it easier for you.

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

Missing ref to video interface devices

> +additionalProperties: false

and this is unevaluated then

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@1a {
> +            compatible = "sony,imx678";
> +            reg = <0x1a>;
> +            clocks = <&imx678_clk>;
> +
> +            avdd-supply = <&camera_avdd_3v3>;
> +            ovdd-supply = <&camera_ovdd_1v8>;
> +            dvdd-supply = <&camera_dvdd_1v2>;
> +
> +            reset-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                imx678: endpoint {
> +                    remote-endpoint = <&cam>;
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <720000000>;
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2fb1c75afd16..5260cd83a255 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24911,6 +24911,13 @@ T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
>  F:	drivers/media/i2c/imx415.c
>  
> +SONY IMX678 SENSOR DRIVER
> +M:	Jai Luthra <jai.luthra@ideasonboard.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media.git

Drop. Individual drivers do not have dedicated trees. Media alrady
covers it.

Best regards,
Krzysztof

