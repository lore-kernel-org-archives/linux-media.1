Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1343E44E4
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 11:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284904; cv=pass; b=IM5YDT+Uor3H9BOhiHfBhZreqHyvIJvt8DGtX7p+Ws9sxu6Pnel7KWDtRAY69IIewEAIW+1FdO2XS57/jaemCql3ouPt8t9dqG8D+sq49F8yTv7l3q7Fm7F8Y2O58cLlyNrNOyq+Cd8GXGolntAlpkrg2M5RjQSAX8ICSmQ+nyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284904; c=relaxed/simple;
	bh=mu/t0nX9SJf6wo8N8jq58J5MNpmsuozgdWxvH8xSVO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IPFB9vRlEOUkVPSdXtuSEE+jcOvMxd+0u4rIN57z8X6J+BWfUEG8YH1SfneRPcw6pjEVKQDYdnZ94M3DribyY9HU1nd5G7Kx+NWx6IRI1c9Vhmlib0LpNioCsFdXEiIxHCYT6xdLYKeSLJjrPFpRcSxR/GXJ+fnyBWZsnYXo/Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KT1hCJ8A; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KT1hCJ8A"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4956869750eso4215345e9.2
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 04:08:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791284901; cv=none;
        d=google.com; s=arc-20260327;
        b=g83RQg9bWntM7g8ztbRnNEB7V/ymUAPbtBGGMqgfg/GNTgE8v7YSGGl0WzF9ZkMxdc
         EjLCYJp1rrMf93eT5C9TuGvH3uRrC10Tsv55u+ZVOaTar5wOGuCNuLYt3uWs0VRzvA3g
         IbJUouoSupSywqvES13szMjRicfeanJrErbcYj91D9xqHqyMaehFlylPcanzg1iYkYNg
         9EteI54FEjgqCgC3oFAZnv20F0yYnuvZ1B/8sFmit6KDw+lyyDNrGdqv1146ubGb/EzE
         AhsLnHVMtAfrB5npltaEcWxeEroBD/peA3SC0zcTNHVLTOn8clzExVj4MUpotbyHd0pM
         qAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yJ8PE6Uy4bwH6wDfLl1X3RI3sdy7oVAtm672ES1XxF4=;
        fh=9/hckwr4365BbuWvsSCyYnYZVMeBxMGjNYQtAQFIojU=;
        b=U4kJ0BUEtEwCISCFpqTvZ+YJi6mQCd8FoToUhixH6JUzKTO7D49misnIMgttU0FEpa
         pwP2Z47Zhf+OuKxy4vFRk3xJwxFUTTyCny5UVowJ/O/xWYcmglg8aayHpep8Dvn9EBl0
         NBivi3tnFbqw52WF+X6IPX8lS8LXqg1/BihteAKrK+wjaqagop2XwDj5YFMZS4uzD7F3
         BY5fVfgDQxpt7stIkI1bONgNHDxXBXFdwEwyb28qNOBc0QOqAUfTKoArZf970JPY5vTH
         cskBPTBFZyxgiqhjAZ8w4p+4TTsI0Px9cWxEQrVaW0Oz3RmlDMdcCWCxrMAO1LeWrDgc
         F/7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791284901; x=1791889701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yJ8PE6Uy4bwH6wDfLl1X3RI3sdy7oVAtm672ES1XxF4=;
        b=KT1hCJ8A7oqKyx/HwsCOpG/k8CUyOUxNqnqhANXA3v/D501wdyMQD/7fxto87CZA23
         b3H+9lTW9z58X+AKuT14XbGFYQSc1xd1lqqLdXpVWoFNwSUYUxqZQ0hqqzLjjMSk5GtP
         apdhWwTQ25paigoxcYFhy9CfgjlHYl1WPntyi0sQEXRbnMTOb70P0a3JPwAXpuqw1ABG
         oprA+Ble1uL+FudlWSAqhEngp0vooE9sZMMOS44hSUzextuaQPfpjx20CHbxdBGCyJps
         EWUTG/dqKLOhd/vvkRkl5FdwdCEklePWrRzo2hlVlzEBzwEUv8OxLdv3+ycau8Xwhmjc
         KJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284901; x=1791889701;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yJ8PE6Uy4bwH6wDfLl1X3RI3sdy7oVAtm672ES1XxF4=;
        b=hWAQNdUwgFwCO/nbeJDCCmojxWpsvY+ghdH9PkPem4K+wEZY77eXzcbVleu2gG+j4t
         +FZbxt+eU+8cXnCK2AJo5lRG+IxqOhJgKHLrQZ7iJjJhDWMBr7bweyLd4rM0N9rQKdVs
         v9CU1Z4JKqN0yxpkg31KOEGhT3xdUQ4jmjNs9d6TRUjHscQafFNLl05pkQ359BnbqVx2
         C5n9Zr3401baMP0AbWijW+6vfAsBZfeNJYCm0UR95NzBM2/fuqe33D6gZ3bNsTs8PURP
         y9mjJbi8Do7v/GulcAt2wO5fN54R2yQSTKexcstmlPvuJz8bpAw1turJWJj3s7WMB/xB
         +zQw==
X-Forwarded-Encrypted: i=1; AKwUvBxaaATi9O6URe2kqlaDetbJy6FNgk3TBaq0hlueLxfz8ji6Whq0lPvesFefGVU4SjLerFylPoiwYuIfHQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nR/c3QDjbpVI1ruPrHnsryiztcRWskglunGvJ21j2jDSCwoY9V
	tpFqzh1ns7ZE2c8gDWJXe/qWj1XZxLkoR4MNAf5ajzzZGv1qdCDsccpiVg2ztCsExnHKnpkrngc
	grx1ILdmsHwnKm0pkQkbbZrFNyZ3nu/MS2VFFgpU=
X-Gm-Gg: AYBFou06WxKp/a2a9gJtokzIpkvCeWIhAQam0Sy7b4okCqC4ys7b/KcVjqtVjX0wh4A
	Uv85Wuc5SiENjcDjoKoAF0xqZH90ajjBjjCSnhQ8RVSEU123o/lbJY+YU/pYogh7U7dnvFLbAPM
	Mdm6YOqYggQUylsI0IC9EUwymtN6VfRkg6h9/7vnErom6Z4yoaqFFrKbKcpqtIT9sp0gSgp972Z
	aedMKw9MWbqSLc0YSaXynw6LOFd8CK8vprLfys/HVRnCfwPxDaiGcXYNQdXo5CAYIlD3sg6UugW
	I9tiMKuHT3dAsiHIlJw7P/c52PoqTl59nWdu9tcduAv0QR/0dS5cYZkQkdw23iF8KExmr/WMgq3
	lrc2fuU1wObx+/KXtQOXcSSBhaeXSbpiYWhIjCDZ/qkZLgqW3Pn1Ao7/ag5pzfI07SRyGN/gP
X-Received: by 2002:a05:600c:8b55:b0:4a0:13ea:2ec3 with SMTP id
 5b1f17b1804b1-4a17b55f8d4mr16436125e9.35.1791284900622; Tue, 06 Oct 2026
 04:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org> <20260928-mali-c55-renesas-dts-v3-1-2cf7eb746ebb@kernel.org>
In-Reply-To: <20260928-mali-c55-renesas-dts-v3-1-2cf7eb746ebb@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Oct 2026 12:07:53 +0100
X-Gm-Features: AclHuK93-zqsTFDUIXHtLL21RUOx75gjaGfM2OXZX3yb6vwYcEZ12igB1pL2UyA
Message-ID: <CA+V-a8t_WZpq+n_z8zk7M+OpWExRZydZaS3W1uxi6dH7SukXtg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: media: renesas,r9a09g057-ivc:
 Describe additional interrupts
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Thank you for the patch.

On Mon, Sep 28, 2026 at 1:32=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> The RZ/V2H IVC provides input frame-start and frame-stop completion
> interrupts alongside its input frame-end interrupt.
>
> Describe these optional interrupts, keeping frame end first and requiring
> only that entry to preserve support for existing device trees. Extend the
> example to show all three interrupts using mock interrupt numbers.
>
> Assisted-by: LLM
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  .../devicetree/bindings/media/renesas,r9a09g057-ivc.yaml      | 11 +++++=
++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/renesas,r9a09g057-iv=
c.yaml b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
> index c09cbd8c9e35..3eeb1a92c9cf 100644
> --- a/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
> @@ -21,7 +21,11 @@ properties:
>      maxItems: 1
>
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Image input frame-end interrupt
> +      - description: Image input frame-start interrupt
> +      - description: Frame-stop processing completion interrupt
>
>    clocks:
>      items:
> @@ -92,7 +96,10 @@ examples:
>                 <&cpg 0xd3>;
>        reset-names =3D "reg", "axi", "isp";
>
> -      interrupts =3D <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
> +      /* Example interrupt numbers. */
> +      interrupts =3D <GIC_SPI 103 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 104 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
>
I think it would be better to use the actual interrupt numbers used on
the RZ/V2H(P) SoC. Most of the Renesas bindings use the actual
interrupt numbers.

Rest LGTM,
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

>        port {
>          ivc_out: endpoint {
>
> --
> 2.55.0
>
>
