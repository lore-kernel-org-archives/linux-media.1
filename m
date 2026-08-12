Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177F747D475;
	Wed, 12 Aug 2026 21:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568595; cv=none; b=CNgJWlnJQVZ9Vq8p9KX/9NGbo1Y3S1RiEqWyEQMDAbGPlCANkwcMttbSv75fQt/A7V6S+Ey/C21RN7MhyGVm7LSXr7tojzZGs7aEbZaZ0JR9uBf/OfircMxdCf3lOjdcBn9hoON8Dj0xhAv7ZCbQ2oglk85dCRzDQUyfEsWxpGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568595; c=relaxed/simple;
	bh=PTKQki6lrRfRXl9qYq/uE9BOmgI34rvC7zxcNf/Y9Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4QGIMtZUOiaBiIvv1S+sPjMKCWhp3BtF7GwxbPMTMI+ekJyKb/ZNLJHi7JmbpiQh82c7UMIpYIoyVIVspUGIHQpd3tvLaDYEZmKj0TM5taTe0ibPMdzqWAF9Vf1uDFDzhaecq2I+dWtB8sZ+oWJha07cgvEEKNhNNtKxFGS+ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijUm1XTN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijUm1XTN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614C21F000E9;
	Wed, 12 Aug 2026 21:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786568590;
	bh=IzdXJdVv6w+k64qbO8YPTQcV7pwAVZW/byaC0vBWslI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ijUm1XTNRj3j/EI4W6TNdY/elT/30dh0orYvzeAs+46QyG3K1z8zGh2biHvLwwwo9
	 UbS8kUxUx2FeuUe/vQg5FO4u/Tfx+Mc3CR4Y56M7BDhzPf9ahIVp0tZp4rKVGM69fl
	 YXiyntfCGo/9VsByl2aJ/uMSFWRK0Ogq3EPv4xH38bN9C1rStfoe5NtJpP5hZ8PQlt
	 zVOZXmLogMqzjuxOpw3nEq2rUOtq8jhTZN6sI0xWjdpcwyZq2JxWOF/KCTrIEHAyi+
	 RjU+5pUrpXG2dctyKRV1P+8uRtEZcSK9zBIDUY5UwS/+YNyOgskJg55Lba8F95Qx7W
	 CjEFiTxC5/YEQ==
Date: Wed, 12 Aug 2026 16:03:09 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add onsemi AR0234 image
 sensor binding
Message-ID: <20260812210309.GA972604-robh@kernel.org>
References: <20260807102847.1813059-1-eagle.alexander923@gmail.com>
 <20260807102847.1813059-2-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807102847.1813059-2-eagle.alexander923@gmail.com>

On Fri, Aug 07, 2026 at 01:28:46PM +0300, Alexander Shiyan wrote:
> Add devicetree binding for the onsemi AR0234 CMOS image sensor.
> 
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  .../bindings/media/i2c/onnn,ar0234.yaml       | 126 ++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> new file mode 100644
> index 000000000000..d6db435be9e2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> @@ -0,0 +1,126 @@
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
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: onnn,ar0234cs
> +      - items:
> +          - enum: ["onnn,ar0234cssc", "onnn,ar0234cssm"]

- enum:
    - onnn,ar0234cssc
    - onnn,ar0234cssm

Please explain somewhere what the differences between the 3 cases are.


> +          - const: onnn,ar0234cs
> +
> +  reg:
> +    description: I2C device address
> +    maxItems: 1
> +
> +  clocks:
> +    description: Reference clock (external clock) input
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: Reset pin, usually active low (if needed)
> +    maxItems: 1
> +
> +  vaa-supply:
> +    description: Analog (2.8V) supply regulator
> +
> +  vdd-supply:
> +    description: Digital Core (1.2V) supply regulator
> +
> +  vddio-supply:
> +    description: I/O (1.8V-2.8V) supply regulator
> +
> +  orientation: true
> +  rotation: true

You need a reference to video-interface-device.yaml if you are going to 
use these.

> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    description: CSI-2 transmitter port
> +    additionalProperties: false

blank line

> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false

blank line

> +        properties:
> +          data-lanes:
> +            description: Number of MIPI CSI-2 data lanes
> +            oneOf:
> +              - items:
> +                  enum: [1, 2]

Is any order allowed? That implies some sort of lane remapping. If 
that's not supported, then see pretty much any other binding for an 
example of what this should look like.

> +                minItems: 2
> +                maxItems: 2
> +              - items:
> +                  enum: [1, 2, 3, 4]
> +                minItems: 4
> +                maxItems: 4
