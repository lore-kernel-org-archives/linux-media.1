Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C23040F754;
	Thu, 20 Aug 2026 10:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220237; cv=none; b=esUpV44q0xzJ9aWSXbv3zwTLZK5XCXnBF66Set5MJs+99p6Pc2ujt4f6LbKedJXb6IYPevlaHe7+GS0GvodK+1Y952PoB7T7tLKWnOBB+AjqNckzI6q/YWOKFNRBFlPsK8fOngBA1x++5jTlAOrwvIuP9geC6E2BdAWg21lHcrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220237; c=relaxed/simple;
	bh=F0666BxEH41MUBGABb3E+0hhxqA6AqcLkhB5tcxPYoQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=uRDhKrkNjb4Q+1VqJ6FrPy1kpheUL79bwhDiBs39f2SAzrWzCI9tvQ/Gqbzhrz8ipgfIao+LBMB3JP1EunX7/7QsHF1kpmf/SSe+IzzvsMhrWPHJuiJS8lPvv27LBfMwBZe3q2pGeuaH95JO3K9J0wYNKS0SWxNxJkzgslv6Wc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [127.0.0.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 044E3200C95;
	Thu, 20 Aug 2026 12:03:52 +0200 (CEST)
Message-ID: <5436875c-9724-41f3-aaf9-76d43e05f0a8@pengutronix.de>
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
In-Reply-To: <2816bd84651dcbfd0cd76bbc56e461bd409f9611.camel@collabora.com>
References: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
 <20260819-rk3588-jpegdec-v1-5-33d74cdf369c@pengutronix.de>
 <2816bd84651dcbfd0cd76bbc56e461bd409f9611.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 10:03:51 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

On 2026-08-19 11:48, Nicolas Dufresne wrote:
> Hi Sascha,
>=20
> Le mercredi 19 ao=C3=BBt 2026 =C3=A0 12:37 +0200, Sascha Hauer a =C3=A9cr=
it=C2=A0:
> > +/* ------------------------------------------------------------------ =
*/
> > +/* Register byte offsets from dec_base=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 */
> > +/* ------------------------------------------------------------------ =
*/
> > +
> > +/* REG0: IP version / product ID */
> > +#define VDPU720_REG_VERSION		0x000
> > +#define VDPU720_PROD_NUM		GENMASK(31, 16)
> > +#define VDPU720_BIT_DEPTH		BIT(8)
>=20
> Can you share a dump and share these register reset values. Looking at the
> layout, clearly its highly modified, but probably derived from VSI multi-=
codec,
> but I'm thinking perhaps we'll learn more from that. Its always nice to j=
ustify
> when adding more chips that are not strictly VSI designs (or maybe it is)=
 to the
> hantro dirver.

Here's a full register dump right after reset:

00000000: db1f0005 00000004 00120000 00000000
00000010: 00004400 00000000 00000000 00000000
00000020: 00000000 00000000 00000000 00000000
00000030: 00000000 00000000 00000000 00000000
00000040: 000000ff 00000000 00000000 00000000
00000050: 00000000 00000000 00000000 00000000
00000060: 00000000 00000000 00000000 00000000
00000070: 00000000 00000000 000000a8 00000001
00000080: 00200000 00080f06 00000000 00000000
00000090: 00000000 00000000 00000000 00000000
000000a0: 00040000 00001556 00000000 00000000
000000b0: 00000000 00000000 00000000 00000000
...
000003f0: 00000000 00000000 00000000 00000000

Sascha

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

