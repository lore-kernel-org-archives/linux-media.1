Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C322A390CB4;
	Thu, 13 Aug 2026 07:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786604536; cv=none; b=csPcek3sSsBxGUMSVWyRMLYiN/+vCJ7GCh8H9eAL13XGgtaLE5lqywEuRG8k/Qos5uVrKnnPnLXUdf/1578Ih81WCN147/1xSVG5CDr0DsVXkUAoikZp++gsbqU93mk0gAAtZFXL9Q8ynHs/0jHpnmgYTiw5FXcC7uMsq+xISCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786604536; c=relaxed/simple;
	bh=TMp38GFfHkcUYOevGJYPyAfnC1j/t5my58XLzRCm/dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSb9dQxzkDLqo+YjZBQ0r1ceCv0qp3rOG18zdbjvHWFSJUx9i7/MPnfLqlrtjfp2Pg40+jG8U46v/Bwj/+ULpDPDomz6KMjVXiHGeoR4cUYs0ffThz6/m1/mWCC3DsCi4TXxF7KSM2Zor9UpVdXSNGuBqwoeasJf92yD6NoerpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPNynnMK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPNynnMK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8A11F000E9;
	Thu, 13 Aug 2026 07:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786604527;
	bh=/gqKioEF1GbavDA4gwe7ihUQosNd/QI2W5YICXn7nnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VPNynnMKL0D+jC2TYBCxyz6/CIOrImpUbn9HaqmsYgbOJXdkyDNTUWGSAAkfUj210
	 qzNYoVGaM2Lh/HZrM9fAkftOBaDQ1wReQ9dLFTc2G8JskEYyMCgpS6QZvKLfE5+cyP
	 3Iw3Wb+BOP/gG6i9vqc6e+CIPywd97oWkr9otA7rHSZ3V6/dLZALCRccRgUzzs7qWn
	 qQ1RO7HelgDVVyYRwLz4mNS9E1L7vEA8yop7bsKrklGsZZ3wiHzF682nsnyPwYbsf8
	 4TrMzMPPokVRUcU23LStE2v79ttyY7xstReSObt4x9mtUpvW57g4uNYKprJLuXdM56
	 2Wjwj97PEl8fw==
Date: Thu, 13 Aug 2026 09:01:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
Message-ID: <20260813-rustling-sassy-terrier-11b99d@quoll>
References: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
 <20260812-b4-s4-vdec-upstream-v7-3-3fae085861bd@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812-b4-s4-vdec-upstream-v7-3-3fae085861bd@amlogic.com>

On Wed, Aug 12, 2026 at 10:41:25AM +0800, Zhentao Guo wrote:
> Describe the initial support for the V4L2 stateless video decoder
> driver used with the Amlogic S4 (S805X2) platform.
> 
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>  .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 111 +++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> new file mode 100644
> index 000000000000..b5af3f931b26
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/amlogic,s4-vdec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Video Decode Accelerator
> +
> +maintainers:
> +  - Zhentao Guo <zhentao.guo@amlogic.com>
> +
> +description:
> +  The Video Decoder Accelerator present on Amlogic SOCs.
> +  It supports stateless h264 decoding.
> +
> +properties:
> +  compatible:
> +    const: amlogic,s4-vdec
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: dos
> +      - const: dmc
> +
> +  interrupts:
> +    maxItems: 2
> +
> +  interrupt-names:
> +    items:
> +      - const: hvdec
> +      - const: vdec

vdec is the name of the module, so not really useful name.

> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: dos
> +      - const: vdec

Same here

> +      - const: hevcf
> +
> +  power-domains:
> +    maxItems: 2
> +
> +  power-domain-names:
> +    items:
> +      - const: vdec
> +      - const: hvdec

Same here.

> +
> +  resets:
> +    maxItems: 1
> +
> +  amlogic,canvas:
> +    description: should point to a canvas provider node

You basically duplicate the property name. Say something useful, what is
it used for?

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  secure-monitor:
> +    description: phandle to the secure-monitor node

Can a property whose type is a phandle and is called "secure-monitor" be
not "phandle to the secure-monitor node"?

Write useful code, not redundant.

Anyway, missing vendor prefix as it is not a generic property (otherwise
point me to generic schema defining it).

Best regards,
Krzysztof

