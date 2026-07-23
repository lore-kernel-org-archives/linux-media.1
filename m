Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3C83D647E;
	Thu, 23 Jul 2026 07:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790605; cv=none; b=a+OEhDuVK82DuiZFkWpKVwWsBIiqiRaWbO7ojUyZBR3yY5navhw1mrJAUIERdsO7jJW/npintmVZjXdGDBEFiGC2eFO+teiMgjsEANirgIOMyNO655KhSC6zQnhatrOUEWK/hXMluULbOQNpQFyB4W5t0xVdDKTf+RKUBsN9QqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790605; c=relaxed/simple;
	bh=/+jm1KdSkeN/f3ePhqlCdivLUZ596YP5ZKzM6LPHU+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jM1D1PTrhlwL+wknn9opbTnRQjApDmZvHN7g1YIAGymbcmn1Ha3ouBKXNwJiTS0mIcReYaHFcIxoAAMqowLmFEQ3j0Rr/tm+qEQ20ir+RhIcrMKGF3K1KfxWtSRjTNzLzTz1Ov7LFXAgD5uVSfB4Nv7x4/Ppcdv59AS7HnxiJVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oE1BtWTB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oE1BtWTB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C3B1F000E9;
	Thu, 23 Jul 2026 07:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784790603;
	bh=WeVOIlBDdIHAaQVs/tgKpqXWVqgJro0UHv7Mz5bSK2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oE1BtWTBuIyIoHePzQymJJdKC5fkn15TirRsIH/sdme4ZLCFb9iWTOrSWKMbpsvl/
	 30esFiz2gJFqS7DGAxhqbAi1YydSDSl0On5qfziighzr6Qk+bo6uVprDxerhVpB7P7
	 6ssciStxZHrtS901v/TUz6r5EwW8ICTQMkc8Cg+R6NNWykCZVuUkq6RWKG7YBcdQ6v
	 AmHna8bsgAzeSCpSXVC/frN7wjLMzVHSZS6mHsj2NlZ1fhgoBaVGLUjEWqbkMcIyIv
	 NKvQikp62yBQ9KNcuTcxb96iSdi1k7Z5h8gW/IDooEEiRTmXfjEaMaLI7+YITHWTAE
	 uQYOY/wQLWSJw==
Date: Thu, 23 Jul 2026 09:09:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hermes Wu <Hermes.wu@ite.com.tw>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDMI
 bridge binding
Message-ID: <20260723-rampant-stylish-toucanet-01815e@quoll>
References: <20260723-upstream-it6625-it6626-v7-0-f8175bb0ea12@ite.com.tw>
 <20260723-upstream-it6625-it6626-v7-1-f8175bb0ea12@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723-upstream-it6625-it6626-v7-1-f8175bb0ea12@ite.com.tw>

On Thu, Jul 23, 2026 at 10:44:02AM +0800, Hermes Wu wrote:
> Document the devicetree binding for the ITE IT6625/IT6626 HDMI to
> MIPI CSI-2 bridge. The device exposes two graph ports: port@0
> (MIPI0) and port@1 (MIPI1), the two selectable CSI-2 D-PHY/C-PHY
> outputs. Only port@0 is required, since a board only needs to wire up
> as many of the bridge's outputs as it actually uses.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
> Changes in v7:
> - Add back port@2 for the HDMI input port, reversing the v4 decision
>   to drop it. The v6 automated review re-raised the same concern with
>   stronger footing than v3's: devicetree describes the physical
>   hardware independent of what a given driver consumes, and the chip
>   has a physical HDMI input regardless of whether it6625.c wires
>   anything to it. Checked against adi,adv7604.yaml, an
>   actively-maintained upstream binding for a comparable HDMI-receiver
>   chip, which documents its input port(s) the same way via
>   graph.yaml's generic port pattern -- concrete precedent that an
>   input port unused by the driver still belongs in the schema.
>   Verified port@2 stays optional and the schema still validates with
>   dt-doc-validate/dt-validate both with and without it present.

5 versions sent the same day.

No, you have to slow down and allow people to actually review your code.
One version per 24h!

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

> 
> Changes in v6:
> - Unchanged. The v5 automated review flagged that the it6626
>   conditional's `required: [bus-type]` constraint, expressed under
>   `properties: { endpoint: {...} }`, doesn't match an `endpoint@N`
>   unit-addressed node and could in principle be bypassed. Checked
>   against mipi-ccs.yaml, an actively-maintained upstream binding that
>   requires bus-type (among other properties) via the exact same
>   `properties.endpoint.required` idiom with no patternProperties --
>   direct evidence this is accepted convention, not a defect, so no
>   fix was made.
> 
> Changes in v4:
> - Drop port@2 (the HDMI connector input graph port) entirely: it
>   added no constraints beyond graph.yaml's generic endpoint-base, and
>   the driver doesn't use this graph port for anything schema-relevant,
>   so there was nothing for a consumer devicetree to usefully validate
>   against it. Found by the automated review of v3, which suggested
>   adding it to `required` instead -- dropping it entirely was judged
>   the better fix since the port carried no real constraints to begin
>   with.
> - Require bus-type on port@0/port@1 endpoints when compatible contains
>   "ite,it6626": the driver defaults to D-PHY when bus-type is omitted,
>   which is always correct for it6625 (D-PHY only) but would silently
>   misconfigure an it6626 board actually wired for C-PHY. Also found by
>   the automated review of v3.
> 
> One other v3 review finding was checked and is not being acted on:
> - The plain `properties: { endpoint: {...} }` override used for each
>   port technically doesn't reach graph.yaml's separate
>   `patternProperties` matcher, so an `endpoint@0`-style node could in
>   principle bypass the local data-lanes/bus-type constraints. This is
>   the same convention already used by other single-endpoint-per-port
>   bindings in-tree (e.g. thine,thp7312.yaml), not a defect unique to
>   this binding.
> 
> Changes in v2:
> - Restrict port@0/port@1 endpoint bus-type to D-PHY (4) only when
>   compatible is "ite,it6625", via an allOf/if/then constraint. IT6625
>   only supports MIPI CSI-2 D-PHY output; the schema previously allowed
>   both C-PHY (1) and D-PHY (4) unconditionally, so a devicetree
>   claiming "ite,it6625" with bus-type = C-PHY passed schema validation
>   despite being invalid on that hardware. IT6626, which supports both
>   PHY types, is unaffected. Found by the sashiko.dev automated review
>   of v1.
> ---
>  .../devicetree/bindings/media/i2c/ite,it6625.yaml  | 174 +++++++++++++++++++++
>  1 file changed, 174 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..3899829036c6ba41f8f9c77908561c75ab4e3f6a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
> @@ -0,0 +1,174 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ite,it6625.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ITE IT6625/IT6626 HDMI to dual MIPI CSI-2 bridge
> +
> +maintainers:
> +  - Hermes Wu <Hermes.wu@ite.com.tw>
> +
> +description: |-

Drop |-

> +  The ITE IT6625 and IT6626 are HDMI to MIPI CSI-2 bridge devices.
> +  IT6625 supports an HDMI 2.0 input and converts it to one or two D-PHY CSI
> +  outputs, while IT6626 supports an HDMI 2.1 input and converts it to one or
> +  two C/D-PHY CSI outputs. The bridges are programmable through I2C and
> +  expose two selectable CSI-2 output ports and an HDMI input port. The
> +  bridge can operate in split mode or clone mode.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ite,it6625
> +      - ite,it6626
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      GPIO connected to the active-low reset line.
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 output port MIPI0
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +              clock-noncontinuous: true
> +              link-frequencies: true

Drop both

> +
> +            required:
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 output port MIPI1
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +              clock-noncontinuous: true
> +              link-frequencies: true

Drop both

> +
> +            required:
> +              - data-lanes
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: HDMI input port
> +
> +    required:
> +      - port@0

Missing blank line

> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ite,it6625
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              properties:
> +                endpoint:
> +                  properties:
> +                    bus-type:
> +                      const: 4
> +            port@1:
> +              properties:
> +                endpoint:
> +                  properties:
> +                    bus-type:
> +                      const: 4

If the bus-type is fixed, why is it in the DT in the first place?
Compatible defines it already.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ite,it6626
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              properties:
> +                endpoint:
> +                  required:
> +                    - bus-type
> +            port@1:
> +              properties:
> +                endpoint:
> +                  required:
> +                    - bus-type
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      hdmi-bridge@4c {
> +        compatible = "ite,it6625";
> +        reg = <0x4c>;
> +
> +        reset-gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            csi_out0: endpoint {
> +              remote-endpoint = <&csi2_rx0>;
> +              bus-type = <4>; /* MEDIA_BUS_TYPE_CSI2_DPHY */
> +              data-lanes = <1 2 3 4>;
> +            };
> +          };

Incomplete example - where is port@2?

Best regards,
Krzysztof

