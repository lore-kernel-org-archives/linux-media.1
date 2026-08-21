Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1F0411F88;
	Fri, 21 Aug 2026 06:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787293716; cv=none; b=FJHv+pZPgu5AoWmM6BaoD+8JiZq4XiPMPpoGoqlh8HCj7qXdes0tyYS8swmCvo+wB5wMULYLwX+8PZiqPi414VZcLaZbxLWKHuhnHpOKKnwB7OONsGmeVObV3lcqpQzXjrrhX78tRCR8uNRuU7c7nJEa2hU+9/n4IIucXAFQedY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787293716; c=relaxed/simple;
	bh=nHiYeg2GMMCHY/FreKn0xyIOTJ76tOUkImQj0nlSVwk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DBI+f4Gq3918p0bWZ8haem5q/qnihu2V87cfvHKWBYakJ2Et8BEKOA6UB79T8L56v0xjETcGRoYjPIil/zQKCsEB6t2Djjq1s8y3Jiw6IiUIbdBLtecW4sXFDSt0srpbbD9tLrKFR8xcCRN8FIoF3UAbT+4zkzkB+7f0lUc/fJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [127.0.0.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id BFA3B2018C1;
	Fri, 21 Aug 2026 08:28:30 +0200 (CEST)
Message-ID: <6947a89b-8fa0-499a-9be8-c48d9bb5e7a7@pengutronix.de>
From: "Sascha Hauer" <s.hauer@pengutronix.de>
Subject: Re: [PATCH 5/7] media: verisilicon: Add Rockchip VPU720 JPEG
 decoder
To: "Nicolas Dufresne" <nicolas.dufresne@collabora.com>
Cc: "Sascha Hauer" <s.hauer@pengutronix.de>, "Benjamin Gaignard" <benjamin.gaignard@collabora.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>, "Andrzej
 Pietrasiewicz" <andrzej.p@collabora.com>, "Hans Verkuil" <hverkuil@kernel.org>, "Chen-Yu
 Tsai" <wenst@chromium.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Lucas
 Sinn" <lucas.sinn@wolfvision.net>, "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <61537689daa428a577e6bdab794d044f5405128e.camel@collabora.com>
References: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
 <20260819-rk3588-jpegdec-v1-5-33d74cdf369c@pengutronix.de>
 <2816bd84651dcbfd0cd76bbc56e461bd409f9611.camel@collabora.com>
 <5436875c-9724-41f3-aaf9-76d43e05f0a8@pengutronix.de>
 <61537689daa428a577e6bdab794d044f5405128e.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 06:28:30 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

On 2026-08-20 12:02, Nicolas Dufresne wrote:
> Hi Sascha,
>=20
> Le jeudi 20 ao=C3=BBt 2026 =C3=A0 10:03 +0000, Sascha Hauer a =C3=A9crit=
=C2=A0:
> > On 2026-08-19 11:48, Nicolas Dufresne wrote:
> > > Hi Sascha,
> > >=20
> > > Le mercredi 19 ao=C3=BBt 2026 =C3=A0 12:37 +0200, Sascha Hauer a =C3=
=A9crit=C2=A0:
> > > > +/* ---------------------------------------------------------------=
--- */
> > > > +/* Register byte offsets from dec_base=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 */
> > > > +/* ---------------------------------------------------------------=
--- */
> > > > +
> > > > +/* REG0: IP version / product ID */
> > > > +#define VDPU720_REG_VERSION		0x000
> > > > +#define VDPU720_PROD_NUM		GENMASK(31, 16)
> > > > +#define VDPU720_BIT_DEPTH		BIT(8)
> > >=20
> > > Can you share a dump and share these register reset values. Looking a=
t the
> > > layout, clearly its highly modified, but probably derived from VSI mu=
lti-codec,
> > > but I'm thinking perhaps we'll learn more from that. Its always nice =
to justify
> > > when adding more chips that are not strictly VSI designs (or maybe it=
 is) to the
> > > hantro dirver.
> >=20
> > Here's a full register dump right after reset:
> >=20
> > 00000000: db1f0005 00000004 00120000 00000000
>=20
> I've look around as much as I could, and could not find any indication th=
at this
> is an IP from VSI or derived from a VSI core. It is entirely different fr=
om
> vdpu1 in mpp (proper G1, rk3288 and similar) and vdpu2 (modified G1 / VDP=
U121).
> In short, this is not a multi-codec core.
>=20
> So that ball is on your end to show that this driver belongs to hantro ra=
ther
> then its own driver. In absence of evidence, this driver should be part of
> rockchip vendor folder, not vsi. Don't read me wrong, I trust that you ha=
ve
> tested what the LLM have chosen, but anything can be implement in Hantro =
really,
> it does not mean it should be there.

I won't argue that the driver belongs to hantro because apparently it doesn=
't.
I don't know where the decision to integrate it into hantro is coming
from, maybe just because the Rockchip JPEG encoder is also there.
Anyway, I'll start with a fresh series with a standalone driver.

Patches 1-3 could be useful on their own though, so you might want to
take them. They are untested on real Hantro hardware, but I could give
them a go on the JPEG encoder.

Sascha


--
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

