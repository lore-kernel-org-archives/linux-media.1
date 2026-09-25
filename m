Received: from mail-vs2-f9.google.com (mail-vs2-f9.google.com [74.125.227.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF76A3AFD05
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 13:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342642; cv=none; b=ZE6Qnsi3AlK/03CPevbfmSIqIAgRnW52wKwXzzz4/aa8wiZvPVJYaDgi3iGbtFmLjjKYJjBNIL2gokSHfjyQ4nLNnsJlLHBBeX5JblpTgK/mVXnEwRUQKhsoTXjzMRE9W3Q3yRvMpeRcDhmgyXH5vzz19Q8gsLycBh/C6nUTUIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342642; c=relaxed/simple;
	bh=e9ZaZSx3eDGIv/mDx4R9ViuSXheyDD4PNUjRvfCbEXA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dmgWgdmKThc/tb/UJiT2WAiL5vLmAWRVd4exW7JiSv4iPTxU8ulo8TMg5KJqDper/bQ4MMPXUS6QWD6XDjxD5a4kOnFefBwBnJOTTdtTWS6NCOr11GNx/hlU/Y74y3yufM8QAasIG/IpakpoB5TZnN18GQRCCjNvSpUk3TBtshw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=ivIRzSKS; arc=none smtp.client-ip=74.125.227.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="ivIRzSKS"
Received: by mail-vs2-f9.google.com with SMTP id ada2fe7eead31-78fb3801712so1017448137.1
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 06:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790342629; x=1790947429; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QXjgWoYM5yLRvHw6p4AZW2Tr6Hu5WyVowGNfLEc6J8s=;
        b=ivIRzSKSKcjtQBIQ7S6xQp11/vmtKCT+dXkhWrM98do6Zl+hbnVWEoen8nZbDFVstC
         TA8AdYNAnvRFUMqTlz/bm9mpMwu2iFnAQcmFC1MXgK7wTuuykPKceFN0pK5uap4YGfkU
         REAWRIAv+lUvSN8CaEHHvyC3oHd199ZIlRYmynL/SnkSdsolBVCDVRHR2BVYeBXMJGKE
         D7auChKUsD8bbJ3FLO67derR7CCBP8EbfYlouoYSXwpPyTZssZH5IenjGyCVEUEQfNs1
         mf+m6oqK5aPgJ7i970JEpGT8pyPDXOhrjkhy/8fX8bG1gBkd/5I5TwHo2TDD7DcNxlos
         QXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790342629; x=1790947429;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXjgWoYM5yLRvHw6p4AZW2Tr6Hu5WyVowGNfLEc6J8s=;
        b=KWRYA0juXXPxfjVyNvr8gWErKVeFwNVyXTEpPP4AmobRVgNp9Y1fNQ/0AYejFXhZ0O
         NiXVmrEHoBCF33t3qMtf54S5wX0H1uJ8N02UvND3c4P6aDNhk813htM4vyXL/ish0mPn
         RIS0Ls7+MhQoAfa6pFMahYx5FUoaH0Mg3dH5wTlZflqSG8QIbyxZj9sTr0WT9JaQnobB
         6s4Vxb0iEhsCq1yVBd7WT5oRXO72GPGw4stEb1id84Qvzl8sqi0DuUKSnKpmU/eQjEAB
         6xwqBJyfYeTW2NzVSsHkfNLWGaLqmy5KvOJ89BBDNlxN4ffNhJ1WUiN5e9/3plvsgv8y
         4tlQ==
X-Gm-Message-State: AFuF++mkibNYIe6gb5fe2qz45vSFV1ACKFlHHwFXXVPwFWQYaKjYe+lt
	de/ksoWpBnZQZ0bOOQCAsUX17UFBao7hRjK+I+KQ3eu4XCh7uACnTk5H6AEakeJos2k=
X-Gm-Gg: AYBFou1QBhVPl8/4pR6AbsGNsa6RMKmDZ8DY+TwOdRjhAdIBwR2Tvd5DD+wh7td5xij
	G3fxkix/B4ZTg1JG9GJhfnUXuOX5NvOv8/DVwZl2w8qUKp1O7x5VWwntzU+VIPJv+5oU/OuKI+E
	zwpUQJUGfM9LfMn+qDD73eN5fWkuhZ5On5CO4+kzyFKZALr7F1nlU/YcG6t/o3IN1Kodgze+55d
	rK+8IEBuoxfBUjfksm4wHbdRXuuH7Tnuv/yR8TE97Sc4f9kUxsZglp4bBQJXLSosQN+fVf7od00
	f4GQmarhNUedwj+qsyXufQCbCj2+sGkYpW3BbWU9qy9uNGd2JZiJ4pS9xMslaSIBsHIErlWNqnW
	AzimasprpQxBjIAiB+PLBTqraqIOqU0n3QqZDxCRDm8tW7kfdeIQQjXENOQM+ZPt3YwgZtxDxH2
	4P2mWzDDBwaHzD9mIRKE/OtkTbjo2M9kva+xETE+FvqGpR5Tmhp/PrKZ+tMyO52Bhth5X6G6aXY
	wpad7dodVd1CQ==
X-Received: by 2002:a05:6102:38ce:b0:7a3:3d26:5c67 with SMTP id ada2fe7eead31-7af1e4f2ddamr2548068137.24.1790342628512;
        Fri, 25 Sep 2026 06:23:48 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9860de80b19sm2585556241.1.2026.09.25.06.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:23:47 -0700 (PDT)
Message-ID: <7505fe152db1f5e0794f9618aa617ce8379bf0d4.camel@ndufresne.ca>
Subject: Re: [PATCH v5 1/4] media: dt-bindings: Add Rockchip JPEG decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sascha Hauer <s.hauer@pengutronix.de>, Lucas Sinn	
 <lucas.sinn@wolfvision.net>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley	 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel	 <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski
	 <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:23:46 -0400
In-Reply-To: <20260925-rockchip-jpegdec-v5-1-30658833cb68@pengutronix.de>
References: <20260925-rockchip-jpegdec-v5-0-30658833cb68@pengutronix.de>
	 <20260925-rockchip-jpegdec-v5-1-30658833cb68@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-oDsWKzBqRCet+Qvriej0"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-oDsWKzBqRCet+Qvriej0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 25 septembre 2026 =C3=A0 13:45 +0200, Sascha Hauer a =C3=A9crit=
=C2=A0:
> Add a devicetree binding schema for the JPEG hardware decoder Rockchip
> integrates into a number of its SoCs.  Documents the single register
> window (task registers plus the LLP link-table block at offset 0x300),
> the decode interrupt, the AXI and AHB clocks and resets, the IOMMU and
> the power domain.
>=20
> The core is not tied to one SoC.  Downstream it is known as the VDPU720
> and the same block sits on the RK3528, RK3562, RK356x, RK3576, RK3588 and
> RV1126B, with only the clocks, the resets and the power domain differing,
> none of which this schema constrains.  A compatible per SoC is all it
> takes to cover them; the RK3568 and the RK3588 are the two that have been
> tested and are enabled here.
>=20
> The resets and the power domain are required.  The block cannot be
> reached with its domain off, and the driver falls back to pulsing the
> reset lines when a frame times out and the in-block soft reset does not
> complete, which a node without them would leave with no way to recover.
>=20
> The IOMMU stays optional.  The driver never refers to it, it is a platfor=
m
> integration detail, and rockchip-vpu.yaml does not require it for the
> other codec blocks on these SoCs either.
>=20
> Assisted-by: Claude:claude-opus-5

nit: Apparently the guidelines are to abstract the model, just lurned that
today.

  Assisted-by: LLM

[1] https://docs.kernel.org/process/coding-assistants.html#attribution

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../bindings/media/rockchip,rk3568-jpegd.yaml      | 92 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  8 ++
>  2 files changed, 100 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-jpeg=
d.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
> new file mode 100644
> index 0000000000000..27d85f17922ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip,rk3568-jpegd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip JPEG Decoder
> +
> +maintainers:
> +  - Lucas Sinn <lucas.sinn@wolfvision.net>
> +  - Sascha Hauer <s.hauer@pengutronix.de>
> +
> +description:
> +  Rockchip's in-house JPEG/MJPEG hardware decoder, known downstream as t=
he
> +  VDPU720.  The same core is integrated into a number of Rockchip SoCs, =
which
> +  differ only in the clocks, resets and power domain they are wired to. =
 A
> +  dedicated Link List Processor (LLP) register block, located at offset =
0x300
> +  within the same register window, allows the hardware to decode a chain=
 of
> +  frames autonomously ("link mode").
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3568-jpegd
> +      - rockchip,rk3588-jpegd
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      The decoder register window.  It covers both the task (function)
> +      registers at offset 0x000 and the LLP (link table) registers at
> +      offset 0x300.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: AXI clock
> +      - description: AHB clock
> +
> +  clock-names:
> +    items:
> +      - const: axi
> +      - const: ahb
> +
> +  resets:
> +    items:
> +      - description: AXI reset line
> +      - description: AHB reset line
> +
> +  reset-names:
> +    items:
> +      - const: axi
> +      - const: ahb
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/rk3588-power.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +
> +    video-codec@fdb90000 {
> +        compatible =3D "rockchip,rk3588-jpegd";
> +        reg =3D <0xfdb90000 0x400>;
> +        interrupts =3D <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks =3D <&cru ACLK_JPEG_DECODER>, <&cru HCLK_JPEG_DECODER>;
> +        clock-names =3D "axi", "ahb";
> +        resets =3D <&cru SRST_A_JPEG_DECODER>, <&cru SRST_H_JPEG_DECODER=
>;
> +        reset-names =3D "axi", "ahb";
> +        iommus =3D <&jpegd_mmu>;
> +        power-domains =3D <&power RK3588_PD_VDPU>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cc3cae2e378b3..290c3a1452ea0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23699,6 +23699,14 @@ F:	Documentation/userspace-api/media/v4l/metafmt=
-rkisp1.rst
>  F:	drivers/media/platform/rockchip/rkisp1
>  F:	include/uapi/linux/rkisp1-config.h
> =20
> +ROCKCHIP JPEG DECODER DRIVER
> +M:	Lucas Sinn <lucas.sinn@wolfvision.net>
> +M:	Sascha Hauer <s.hauer@pengutronix.de>
> +L:	linux-media@vger.kernel.org
> +L:	linux-rockchip@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
> +
>  ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
>  M:	Daniel Golle <daniel@makrotopia.org>
>  M:	Aurelien Jarno <aurelien@aurel32.net>

--=-oDsWKzBqRCet+Qvriej0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarZ14gAKCRDZQZRRKWBy
9DtgAQDKorbZ3yVoy1keHMtODtaPz7ukHI2vc/aP4LDE1Ag8CgEAxqNFjwQPXKNx
1eI8N4euRZt0b9/sLPQ+Ez6vqDQQ/QY=
=kQh1
-----END PGP SIGNATURE-----

--=-oDsWKzBqRCet+Qvriej0--
