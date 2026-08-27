Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D3941BA75;
	Thu, 27 Aug 2026 09:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824629; cv=none; b=qkuXYwFbMvwqzxHjHfRoiZAceOdCcz+HnJjkCnTZAdT0bTenT9fGBk6yCZpR3Vniwpd4WGTC5X8rDVw3zs54viBf0DvIOpVqtv5RzDEOYhV0y3g1hhMxcaC7XXCtyIm1qkIrgw9DNme6IPC3p3QVUbq4rZSFpmNFpoiGrlSlVJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824629; c=relaxed/simple;
	bh=w2SbV+cDaoRuc/Ag2AC8B7T+GF2xhaclc/K3IDr1sH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pASo65wjf99de/3/HbAXKNKpKp8jqvHJ5joO3YLmLuH0l9SXn33qtWLZTxducXTiLWTlywoFoPNmVSQ/hSoOHRNCsI3d3NJUmCHJtu+eHaQ7CvK8fzUz7IAj6S1KbJzMvgnySzuWYN1iSFrQJakBdB+sNV8LzcWSW9L56gLpqDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOjAI6mo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOjAI6mo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB82B1F000E9;
	Thu, 27 Aug 2026 09:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787824615;
	bh=eM8IL9Cxec1l7gBf3o+/kxSCxhuKoi3aRZYzDtuag7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KOjAI6mo3ZVsb4UTxH32cxM18SUbZ2LbqpvWEjYSEUbMlhihx3rsfg8cIH8/x4ZL5
	 Dg1MOlh2T2SerCtqKJD5g1exoe6g7a9ixNMZF8F35M23lGdgfxoyWOJglg6j+wQuK5
	 eTHjL+m1az3haYd6XBPf4OFI+GdxgfVyHS+Zygs1XXchxH6wlwAR5ylBXR/tT5bTSD
	 sSrVDF0HX7kHoUCP2hMdkrSdMwrv3SjOgFFOOT9nuH+kpqIpLyNBceo2aSOJBaAJWk
	 V0munLl9GWOTtkNEx/B5TF05/4bsAYNMm8n9kqHvl+1vx+Hesq/zvND3uh9XOMtT52
	 zzL4m00blQp9Q==
Date: Thu, 27 Aug 2026 11:56:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Quentin Freimanis <quentin@q-lab.dev>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add onsemi AR0234 image
 sensor binding
Message-ID: <20260827-legendary-viridian-tamarin-4e56e5@quoll>
References: <20260820075524.2056029-1-eagle.alexander923@gmail.com>
 <20260820075524.2056029-2-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260820075524.2056029-2-eagle.alexander923@gmail.com>

On Thu, Aug 20, 2026 at 10:55:23AM +0300, Alexander Shiyan wrote:
> Add devicetree binding for the onsemi AR0234 CMOS image sensor.
> 
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  .../bindings/media/i2c/onnn,ar0234.yaml       | 121 ++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
>

Unanswered Sashiko comments.

> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> new file mode 100644
> index 000000000000..ee321acf22b5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> @@ -0,0 +1,121 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/onnn,ar0234.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ON Semiconductor AR0234 1/2.6-inch CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Alexander Shiyan <eagle.alexander923@gmail.com>
> +
> +description:
> +  The AR0234 is a 1/2.6-inch CMOS digital image sensor with a pixel
> +  array of 1940x1220 pixels, capable of 1920x1200 resolution at up
> +  to 120 fps. It supports MIPI CSI-2 output with 2 or 4 data lanes,
> +  color raw Bayer (8/10-bit) or monochrome output.
> +
> +allOf:
> +- $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - onnn,ar0234cssc
> +      - onnn,ar0234cssm
> +      - onnn,ar0234cs
> +    description:
> +      The AR0234 sensor exists in two different models, a colour variant
> +      (AR0234CSSC) and a monochrome variant (AR0234CSSM). The device exposes
> +      the model through registers, allowing for auto-detection with a common
> +      "onnn,ar0234cs" compatible string.

So all devices are compatible? Then why compatibility is not expressed?
What are the actual programming differences between sc, sm and "none"
variants?

...


> +  vddio-supply:
> +    description: I/O (1.8V-2.8V) supply regulator
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    description: CSI-2 transmitter port
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
> +
> +          link-frequencies: true

Drop

Best regards,
Krzysztof

