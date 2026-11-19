Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115458;
	b=3ppVVCmqNZ+cTBmm0IAhU07b7HNXfkg6GELcDcpKRL2rDVS/W4ehC8/xSVF3B6RVWKgt
	 Ys2ZoK/GoTqvMDlwVxQQKXaDsXk6n82MzqNa4sOp3MY2zutqAVKAIths6q8FVXV3EP5WQ
	 7Xx68bDVMBHN5ouSMsAFdjv7/nyL5k223tPaGSlMRneXrCD8oSPt5bPtVRbQcDC6dUUY4
	 lxginwB6M61UMy+XXZbJn2INPp+gKkraL5MjMiPk6CHJjOFgzsYkbEZv4XxfbDpNdu+wA
	 FY1wiOScQiYmtlITu+7H08SXa6WvscOMItU/wxZ8xQ3dARCxkKOx0JpJMepAslo5gog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115458;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RmdpddYozjJPVb6GiCDyPK6GgcDok35FRFm3gKsU32s=;
	b=UVV81Avlpx+07LdWK6OJNL4xBOebecKJwtn4aeiZ7Lu/Hx2N4lAz9oqt85zaDIvBJmPX
	 4RR4TCTjAWoKEVMEWRjA7NIb3IvWKsUuOjipIXFnPkyZ1Oo1carEagWcJPlCZ4DgIExz3
	 6eCRp2yf0FBo4RhDKZn8WzA5eFG4ooWwoTeGNtNc8gNVm4uZ+qBit+08GpeO4wqtAMeMe
	 If0MRh6wquJgRGTSrq4wkCHcJ5tzb4yxhUNrlVS//AhER+AWY7yZj7CZe2nlfY9x50vq4
	 h+tbHlF5F5dKkhzo84Ch1hDnaNZy87m6krAC+2EFCVNlRrZR2eoF5U17ksXfrv+c65Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G7wO+0Jd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F330260A260E;
	Thu, 19 Nov 2026 19:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G7wO+0Jd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B461F000C8;
	Thu, 19 Nov 2026 19:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795115457;
	bh=RmdpddYozjJPVb6GiCDyPK6GgcDok35FRFm3gKsU32s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G7wO+0JdhpiJYvZZBUE7uwCeGyUhReO7BHSnwt+i9vFE/Zvid9NCxYAsqXULdhs33
	 GMMofY/ROk5vYToVnE3QVvmF8pcXUjkIVC6yODjq9kZtk4DBNE0DRpgnG7DxRrXPw0
	 NdNBquIzspf4qJGYfCiH/fCYh3khzvSwRdmwZw6QzVJOtVM/TIbnAgrA+wm5vMrFuG
	 D1o6OEss5IDWm0KP6WjMRzDoKSjLR4oqQhI5GUi/oV/+7HA6DpIznFxeMsbDomJ5nX
	 kTrad4OnLMeRfEWRuXy7YhWtVpB5nBxM4P/9qq/n4OlikvR6pue9U7rGlNcCKOpdFb
	 Fl6D+NDyceImQ==
Date: Thu, 19 Nov 2026 13:10:55 -0600
From: Rob Herring <robh@kernel.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Kyrie Wu <kyrie.wu@mediatek.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] media: dt-bindings: mediatek,vcodec-subdev-decoder: Fix
 child node if/then schemas
Message-ID: <20261119191055.GA3803102-robh@kernel.org>
References: <20261019212431.4109371-1-robh@kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019212431.4109371-1-robh@kernel.org>

On Mon, Oct 19, 2026 at 04:24:29PM -0500, Rob Herring (Arm) wrote:
> The if/then schemas in mediatek,vcodec-subdev-decoder are all at the
> wrong level as they apply to child nodes. The clock-names schemas
> applies to the parent node, but the clock-names properties are in the
> child nodes. Move the clock-names definitions to the child node
> clock-names property. This exposes that the MT8186 clocks are not
> documented, so add them as well.
> 
> The interrupts if/then schema is never true as the parent compatible
> will never match the child compatible. The subschema also belongs in the
> child node.
> 
> Fixes: 3fbf1eac01b5 ("media: dt-bindings: media: mediatek: vcodec: Adds decoder dt-bindings for lat soc")
> Closes: https://sashiko.dev/#/bug/linux-5ab90035-1914-412f-8310-097fb05bda15
> Fixes: 355e9472ccb0 ("media: dt-bindings: media: mediatek: vcodec: adapt to the 'clock-names' of different platforms")
> Closes: https://sashiko.dev/#/bug/linux-caa6adb1-38de-4889-9517-2beede7c8f96
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 77 ++++++++-----------
>  1 file changed, 31 insertions(+), 46 deletions(-)

Ping! This one needs to be applied before 2 other series posted.

> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> index d1d209cbbd43..6033ecffd707 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -135,8 +135,26 @@ patternProperties:
>          maxItems: 5
>  
>        clock-names:
> -        minItems: 4
> -        maxItems: 5
> +        oneOf:
> +          - description: MT8186 clocks
> +            items:
> +              - const: vdec-sel
> +              - const: vdec-soc-vdec
> +              - const: vdec
> +              - const: vdec-top
> +          - description: MT8192 clocks
> +            items:
> +              - const: sel
> +              - const: soc-vdec
> +              - const: soc-lat
> +              - const: vdec
> +              - const: top
> +          - description: MT8195 clocks
> +            items:
> +              - const: sel
> +              - const: vdec
> +              - const: lat
> +              - const: top
>  
>        assigned-clocks:
>          maxItems: 1
> @@ -159,6 +177,17 @@ patternProperties:
>  
>      additionalProperties: false
>  
> +    if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mtk-vcodec-core
> +              - mediatek,mtk-vcodec-lat
> +    then:
> +      required:
> +        - interrupts
> +
>  required:
>    - compatible
>    - reg
> @@ -166,50 +195,6 @@ required:
>    - mediatek,scp
>    - ranges
>  
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - mediatek,mtk-vcodec-core
> -          - mediatek,mtk-vcodec-lat
> -
> -then:
> -  required:
> -    - interrupts
> -
> -allOf:
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - mediatek,mt8192-vcodec-dec
> -    then:
> -      properties:
> -        clock-names:
> -          items:
> -            - const: sel
> -            - const: soc-vdec
> -            - const: soc-lat
> -            - const: vdec
> -            - const: top
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - mediatek,mt8195-vcodec-dec
> -    then:
> -      properties:
> -        clock-names:
> -          items:
> -            - const: sel
> -            - const: vdec
> -            - const: lat
> -            - const: top
> -
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.53.0
> 
> 
