Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547BA376BCD;
	Mon, 24 Aug 2026 16:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787589318; cv=none; b=c/84q6JiBWxmfhXDQRN702J6EHRzI98nrVlRE2r0SQ3wy03Bzuwu2L1+UJVJtM4EltSwcRSllXuo2aPv+dE8a2Nt/mP2A3VNQT+fKaSsR9ylidQSCh9mowDLWFrBy1ve5xxn5tdyNeJAGFUFr/71H8JOcSuhHO+Ab9DPF9N74AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787589318; c=relaxed/simple;
	bh=3i7VLsUcKl63D6iIk/4oOmdYSs4dcuYHB0SXbr4vg2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mfp8Sr1VGgE8cectKe9mSOTo0BmIRMAQfGECP0Q75jwjVDkd0BfBD9p4kaZtS0yRMDylQrxeta9SLZMg1sHUlTbJMG43LplIzEWQDtJiJOQvmXmtfECl1McxNa3DBKlyywPUNJUejPpAcPFiRMLqkKHUoxOObis0jNjbfDwsKyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlMAvK86; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlMAvK86"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6EC01F000E9;
	Mon, 24 Aug 2026 16:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787589317;
	bh=LsN6r+XHq2tUXaU1o8naYTcnZwkNiVXqQQcfnGVlCVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SlMAvK86ekfFp2PUkUJvGGka6XM+LeLqKrYR0Ky19TleUoL98Ny58NtZo3q7LzX7S
	 +PvftoN9NZjQDgQypOBDVWbdkQGKZ+H43eckcFpYxQQ7djPZWG9CBYV6J730QoXfSw
	 UNHIloP6z1sWbkBdJ2wLuLv27QeN+ghyOcbKfTMcFpSY0a06NzArDi6koU4ElmN2qb
	 I62Jr70zgLuN/O+TJfadqgCwV2iim12I+xudMOxebalyzfDzjc2UTTDFnmIUonGNaR
	 z7vxOx2tL20TcXvAy0K91Y4sBcOfz2Gd/la73FXncfMyURr8eCM8ScXcPHOYCh2IFL
	 vrzUT1n8TAvlA==
Date: Mon, 24 Aug 2026 17:35:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Lucas Sinn <lucas.sinn@wolfvision.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] media: dt-bindings: Add Rockchip JPEG decoder
Message-ID: <20260824-catlike-human-502f2aa3150b@spud>
References: <20260824-rockchip-jpegdec-v1-0-8011822bf500@pengutronix.de>
 <20260824-rockchip-jpegdec-v1-1-8011822bf500@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v039y6vQKSu44Jxg"
Content-Disposition: inline
In-Reply-To: <20260824-rockchip-jpegdec-v1-1-8011822bf500@pengutronix.de>

--v039y6vQKSu44Jxg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 09:01:09AM +0200, Sascha Hauer wrote:
> Add a devicetree binding schema for the JPEG hardware decoder Rockchip
> integrates into a number of its SoCs.  Documents the single register
> window (task registers plus the LLP link-table block at offset 0x300),
> the decode interrupt, the aclk/hclk clocks, the AXI/AHB resets, the IOMMU
> and the power domain.
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
> The IOMMU stays optional.  The driver never refers to it, it is a platform
> integration detail, and rockchip-vpu.yaml does not require it for the
> other codec blocks on these SoCs either.
>=20
> Assisted-by: Claude:claude-opus-5

Missing signoff.

> ---
>  .../bindings/media/rockchip,jpeg-decoder.yaml      | 92 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  8 ++
>  2 files changed, 100 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/rockchip,jpeg-decode=
r.yaml b/Documentation/devicetree/bindings/media/rockchip,jpeg-decoder.yaml
> new file mode 100644
> index 0000000000000..e20c1bf43ef3e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/rockchip,jpeg-decoder.yaml

Filename matching compatible please.

> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/rockchip,jpeg-decoder.yaml#
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
> +      - const: aclk
> +      - const: hclk

IMO, match resets and drop the obvious "clk" from here.

Fine otherwise.

pw-bot: changes-requested

Thanks,
Conor.

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
> +        clock-names =3D "aclk", "hclk";
> +        resets =3D <&cru SRST_A_JPEG_DECODER>, <&cru SRST_H_JPEG_DECODER=
>;
> +        reset-names =3D "axi", "ahb";
> +        iommus =3D <&jpegd_mmu>;
> +        power-domains =3D <&power RK3588_PD_VDPU>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8014b9f8253ed..baea7e42663a7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23424,6 +23424,14 @@ F:	Documentation/userspace-api/media/v4l/metafmt=
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
> +F:	Documentation/devicetree/bindings/media/rockchip,jpeg-decoder.yaml
> +
>  ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
>  M:	Daniel Golle <daniel@makrotopia.org>
>  M:	Aurelien Jarno <aurelien@aurel32.net>
>=20
> --=20
> 2.47.3
>=20

--v039y6vQKSu44Jxg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoxywAAKCRB4tDGHoIJi
0uI+AP9QJvwoXyh861YEwC7CW0JzDZYhu7BuaOpeqFXqgxGk3AD/fgA+IylNAek4
QTBa/u9fTgTQqCkl77phwbNHimCCJQg=
=UcLW
-----END PGP SIGNATURE-----

--v039y6vQKSu44Jxg--
