Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596722;
	b=isXiRlmnWx91iEEhYwnviGl2jMcg2v10Zfb0Jj7P6kLFxQCj/NU9ynMZPjukL4YA24xa
	 3ByEPMYKzVkpd6ulpWYyWGJ3ss/S2QKgo7HQW9aJdxZ7/axPgZFnddq9aEX/34CCeedzG
	 zqycHN1RwMdLzOkd8cXoBrzJMImEKp2dcNRsnMIvII/TvDm7Y+a4ahLIMt2EAvwDJL8rI
	 4Syr9M7v40U1/GBQ3yY3jwYlDPitw2sazvistjTLte6DfRvUw4OLIZ3bRNicBb3G73rR+
	 B7xY51v9r7CC7Nm58yR4/Lb4R/PTZC+HPQ7vmJ6BgxFf0vFwX0w8oIzrs+ZMZnSdAOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596722;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=nAo3k7IN6MFlua5noogKuUzTuJs2qKHfA/Yw66Nd6Ng=;
	b=TQ1qygaBoMdhuKCxsGvvpoYkrzB3j395buwxTH6D6pbuJSOfOyT0wAQt9cDqWDwYtPgv
	 wd+m9mRcP1qmpcJhCzCbWtflCCyj3N/d7DIREFGEB4yCo8YE2O4PnjiqBY4kReto1dhbg
	 lCcqo7ERNXU8zl9WlLN5HM1gw5P9nX33CnnthYrEpSoFUUa70A9u0hI6GnoiqwhSha8AV
	 dIW/owgoJ13lU8tWzIUXJqDP0qTgFlyDYRQXj9CYPtaYFd6m+7uzx3sQ8bLnXmykE1RYW
	 cSDIRa/sMGqgMJwymPOyM9eKbEsSKn8c4nefYH+jIPbCMGrTC7pTdvHXwaVpYdyI2sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WIu5xo20;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1784B606A689;
	Wed, 25 Nov 2026 08:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WIu5xo20
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDA21F000C6;
	Wed, 25 Nov 2026 08:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795596721;
	bh=nAo3k7IN6MFlua5noogKuUzTuJs2qKHfA/Yw66Nd6Ng=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=WIu5xo20Zcvt/DHS9FcFcsBfvdprdo1bbZDD05a7A5V9ZkHSt9VJ7u0UlRr+4OnwU
	 Uxebq7l1HxT/jCJqiR3vj7qilZS/AAoqVdLhxozKb3Vi+kqHWORNF7Wj6qBjh+VFEO
	 HhbnVBsnFblLNY8qUc7rf72vT28J0s9tLlozBT2De1MNmfHgZNH6LAqIaXSFDK73gE
	 SNAu9yAnaeKzhDcoAV+44FwfoKy57EHNyFs+3ltXknRqGENcTQVWrb1t2ZBe8d1ve8
	 s70GmeHR38PnIVMbjBALc+a5S4eUliwLI9cvhq5zcIDeDWnZLjGlzP8mSIAaIvRt3z
	 nuyqvTYKZRThg==
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 02/24] dt-bindings: media: Add bindings for Arm
 Mali-C720
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anthony McGivern <anthony.mcgivern@arm.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <nayden.kanchev@arm.com>, 
 Konstantin Babin <konstantin.babin@arm.com>, 
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com, 
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-2-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-2-0cb9bde1bd30@arm.com>
Date: Wed, 25 Nov 2026 09:51:57 +0100
Message-Id: <179559671799.14607.10622707622371448283.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-24 17:07 +0000, Anthony McGivern wrote:
> From: Anthony McGivern <Anthony.McGivern@arm.com>
> 
> Add the device tree binding for the Arm Mali-C720 Image Signal
> Processor.
> 

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

> Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
> ---
>  .../devicetree/bindings/media/arm,mali-c720.yaml   | 134 +++++++++++++++++++++
>  1 file changed, 134 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c720.yaml b/Documentation/devicetree/bindings/media/arm,mali-c720.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..3bd261bcefbe371b7b4610afdde8e556b2a2ae22
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/arm,mali-c720.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/arm,mali-c720.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Mali-C720 Image Signal Processor
> +
> +maintainers:
> +  - Anthony McGivern <anthony.mcgivern@arm.com>
> +
> +properties:
> +  compatible:
> +    const: arm,mali-c720
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1

Why is this flexible?

> +    items:
> +      - description: ISP main interrupt
> +      - description: ISP fault interrupt
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: isp
> +      - const: fault
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 3

Same question. List items with description instead.

> +
> +  clocks:
> +    items:
> +      - description: ISP main processing clock
> +
> +  clock-names:
> +    items:
> +      - const: vclk
> +
> +  resets:
> +    items:
> +      - description: ISP main processing clock domain reset
> +
> +  reset-names:
> +    items:
> +      - const: reset

Drop names

> +
> +  memory-region:
> +    maxItems: 1
> +    description: Reserved memory pool for ISP DMA allocations.
> +
> +  power-domains:
> +    description: Power domain containing the ISP.

Drop description

> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: Parallel video input ports.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input port 0
> +
> +        properties:
> +          reg:
> +            const: 0

Drop properties, should not be needed, same in places below.

> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input port 1
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input port 2
> +
> +        properties:
> +          reg:
> +            const: 2
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input port 3
> +
> +        properties:
> +          reg:
> +            const: 3
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mali_c720: isp@400000 {

Drop unused label

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
