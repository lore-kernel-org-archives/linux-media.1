Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9A336AB6B;
	Tue, 31 Mar 2026 06:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774940293; cv=none; b=lKsxgu+PMYb7CEJkWeCOGS+0gueaVWFkKbRQYaHlHQ9uqrDU77IsWIy2abMSPxF7DmgMGf3W3PJKzTyT9E3Yz1mZMFWB+uUCBSYqoonPk3nh+oCVy/ksJ4B6pzVhRHVwX3p8sZ9HAMBta2CXO1Hk+ekq0R8msPbPnkf+Ly5zWik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774940293; c=relaxed/simple;
	bh=vZRhJfLIHtRNxv9Ku8UnrdHkQj63umsc0nroN0CiSVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnBnvVPgMdMMp1nUuOSWYbLZQJYyG1+yBnDjrHdXFl0gtouG4AR6qp2VthkfZPsOamwIS1UVnv9HukLquyrmYJiGhgzEBmmM/DlcwabW397I1sQKlHhPZ3f+XgglzgkOJLb4ZLJGHslpmTc68MN1jAIVvQzfbRr9x7ilX52AJeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DFnvt4Vr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DFnvt4Vr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5D3C19423;
	Tue, 31 Mar 2026 06:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774940293;
	bh=vZRhJfLIHtRNxv9Ku8UnrdHkQj63umsc0nroN0CiSVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DFnvt4VrrZmcm2PstmRZXNm45WHCeH7OgYOg3Q0leLVTj/SIpXSxL0W19zsdk9X8I
	 he4gRaNRwP4dhmSnFU2zFfosEJvPlIity6K0lyY8vWbJkyTStL9vuGEDFiilu1DkOE
	 iDlLaqXATsDH3qkySF1HT82ImNt/ejvAk5Z0ddAKjmCGX8TjuVcqj3TUie8zY8xlhg
	 lU5lIqgPNe/DJCay49+04YOUCBZxnvyqMBKCR7ebe6ZDGmB+r2Yf2q1RydHf4vWBfV
	 MSl30gU6me9sgK0iR21Qx6CsKY8/jgP6mEaAhbtiWQxcWhYntwyN9YMPeYkV41rIZ1
	 QnDOh70oPK00A==
Date: Tue, 31 Mar 2026 08:58:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: nicolas@ndufresne.ca, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Subject: Re: [PATCH v5 1/3] dt-bindings: media: mediatek-jpeg-decoder: add
 MT8189 compatible string
Message-ID: <20260331-thankful-crouching-camel-cfabce@quoll>
References: <20260331005458.24010-1-jianhua.lin@mediatek.com>
 <20260331005458.24010-2-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331005458.24010-2-jianhua.lin@mediatek.com>

On Tue, Mar 31, 2026 at 08:54:56AM +0800, Jianhua Lin wrote:
> Add the compatible string for the JPEG decoder block found in the
> MediaTek MT8189 SoC.
> 
> Compared to previous generation ICs, the MT8189 JPEG decoder requires
> 34-bit IOVA address space support and only needs a single clock
> ("jpgdec") instead of two. Therefore, it is added as a standalone
> compatible string without falling back to older SoCs.
> 
> Update the binding schema to include the new compatible string and add
> an `allOf` block with conditional checks. This enforces the single clock
> requirement for MT8189 while preserving the two-clock requirement
> ("jpgdec-smi", "jpgdec") for older SoCs.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
>  .../bindings/media/mediatek-jpeg-decoder.yaml | 44 +++++++++++++++----
>  1 file changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> index a4aacd3eb189..601fe05b73e7 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> @@ -15,10 +15,10 @@ description: |-
>  properties:
>    compatible:
>      oneOf:
> -      - items:
> -          - enum:
> -              - mediatek,mt8173-jpgdec
> -              - mediatek,mt2701-jpgdec
> +      - enum:
> +          - mediatek,mt2701-jpgdec
> +          - mediatek,mt8173-jpgdec
> +          - mediatek,mt8189-jpgdec
>        - items:
>            - enum:
>                - mediatek,mt7623-jpgdec
> @@ -32,13 +32,22 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 1
>      maxItems: 2
> -    minItems: 2
>  
>    clock-names:
> -    items:
> -      - const: jpgdec-smi
> -      - const: jpgdec
> +    minItems: 1
> +    maxItems: 2

Why jpgdec-smi alone is now valid? Drop these two.

> +    oneOf:
> +      - items:
> +          - const: jpgdec
> +      - items:
> +          - const: jpgdec-smi
> +          - const: jpgdec
> +
> +  mediatek,larb:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: a phandle to the smi_larb node.

Best regards,
Krzysztof

