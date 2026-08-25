Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FBC3D45F7;
	Tue, 25 Aug 2026 07:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787643577; cv=none; b=q5ASW3Gx4pZA++ma/TpWicGob9r9ui+Edi8yA65o/iZquHlJJLykYZ1CXA7nHYi3bvgEgc3HxpCvU++p8b3QtFRjDlloQlnqxBtvZ69FPROMqo+j67QURSwa/4HSP7zjmHXrv+jQkKfBRwEH65ESRvjm6w8MNOaW+Rafq5wF9Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787643577; c=relaxed/simple;
	bh=IBCfT9UL3b5gFyLRZkCHNzB+iqK8+GtxFwSmFEm5++4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Z4HdsBMcw+NQsFoOebKvF0cGXHtNPtSKLaYEh0E1xytXj6Ic1URkwX7ToA6XYLpLucs5m684x8HWSFT7ZvwHuCylAwVwswKK5ibqf9KPMLQY3D/37RSaz9U+oVUGku5UIjAnJTJAbZHr0C1KDh754LB7VuJzj+X6VMXXvudAUvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [127.0.0.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6E604201021;
	Tue, 25 Aug 2026 09:39:31 +0200 (CEST)
Message-ID: <1048ee70-54b2-4e42-ab67-22384961f094@pengutronix.de>
From: "Sascha Hauer" <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/4] media: dt-bindings: Add Rockchip JPEG decoder
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Sascha Hauer" <s.hauer@pengutronix.de>, "Lucas Sinn" <lucas.sinn@wolfvision.net>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Philipp Zabel" <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <d24d59bb-2330-41c9-a6cc-a4c7053f8526@kernel.org>
References: <20260824-rockchip-jpegdec-v1-0-8011822bf500@pengutronix.de>
 <20260824-rockchip-jpegdec-v1-1-8011822bf500@pengutronix.de>
 <d24d59bb-2330-41c9-a6cc-a4c7053f8526@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 07:39:30 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

On 2026-08-25 09:21, Krzysztof Kozlowski wrote:
> On 24/08/2026 09:01, Sascha Hauer wrote:
> > Add a devicetree binding schema for the JPEG hardware decoder Rockchip
> > integrates into a number of its SoCs.  Documents the single register
> > window (task registers plus the LLP link-table block at offset 0x300),
> > the decode interrupt, the aclk/hclk clocks, the AXI/AHB resets, the IOM=
MU
> > and the power domain.
> >=20
> > The core is not tied to one SoC.  Downstream it is known as the VDPU720
> > and the same block sits on the RK3528, RK3562, RK356x, RK3576, RK3588 a=
nd
> > RV1126B, with only the clocks, the resets and the power domain differin=
g,
> > none of which this schema constrains.  A compatible per SoC is all it
> > takes to cover them; the RK3568 and the RK3588 are the two that have be=
en
> > tested and are enabled here.
> >=20
> > The resets and the power domain are required.  The block cannot be
> > reached with its domain off, and the driver falls back to pulsing the
> > reset lines when a frame times out and the in-block soft reset does not
> > complete, which a node without them would leave with no way to recover.
> >=20
> > The IOMMU stays optional.  The driver never refers to it, it is a platf=
orm
> > integration detail, and rockchip-vpu.yaml does not require it for the
> > other codec blocks on these SoCs either.
> >=20
> > Assisted-by: Claude:claude-opus-5
> > ---
> >  .../bindings/media/rockchip,jpeg-decoder.yaml      | 92 ++++++++++++++=
++++++++
> >  MAINTAINERS                                        |  8 ++
> >  2 files changed, 100 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/rockchip,jpeg-deco=
der.yaml b/Documentation/devicetree/bindings/media/rockchip,jpeg-decoder.ya=
ml
> > new file mode 100644
> > index 0000000000000..e20c1bf43ef3e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/rockchip,jpeg-decoder.yaml
> > @@ -0,0 +1,92 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/rockchip,jpeg-decoder.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Rockchip JPEG Decoder
> > +
> > +maintainers:
> > +  - Lucas Sinn <lucas.sinn@wolfvision.net>
> > +  - Sascha Hauer <s.hauer@pengutronix.de>
> > +
> > +description:
> > +  Rockchip's in-house JPEG/MJPEG hardware decoder, known downstream as=
 the
> > +  VDPU720.  The same core is integrated into a number of Rockchip SoCs=
, which
> > +  differ only in the clocks, resets and power domain they are wired to=
.  A
> > +  dedicated Link List Processor (LLP) register block, located at offse=
t 0x300
> > +  within the same register window, allows the hardware to decode a cha=
in of
> > +  frames autonomously ("link mode").
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - rockchip,rk3568-jpegd
> > +      - rockchip,rk3588-jpegd
>=20
> How this can be v1 if you send VPU720 for rk3588 already?
>=20
> https://lore.kernel.org/all/20260819-rk3588-jpegdec-v1-4-33d74cdf369c@pen=
gutronix.de/

The above has the JPEG decoder driver integrated into the hantro driver
which turned out to be the wrong abstraction, so I had to split this
series up into two, one for the Hantro fixes and one for the now
standalone JPEG decoder driver which is this series. I decided to start
freshly for both series instead of treating one as continuation of the
other.

>=20
> Were there more versions?

No.

Sascha

--
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

