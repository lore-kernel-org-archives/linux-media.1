Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096E025C804;
	Wed, 19 Aug 2026 14:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787148760; cv=none; b=gpT7GW55lgyjosWWFXOwVsZDbkKnifQw/1Dt7r/PxPTgoc7/5YIG1UPQoH43UY+SCZ35M49h/8ZlBlnxhx1clhThYbOhPV7lw8loNcc5G46ADwiLSDIV7Vi6ER2aSC1l3cgumFz/unYVOsq5ckvo8gUeLWJVSvk9yfFHJku29q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787148760; c=relaxed/simple;
	bh=pZ3lJQHcpfhZrk/xbbe0P83fFg1Gs9WiQRFaqnGnCk0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=pPShOzdeM1M1s10LNADSJ602dL6E4J6yIJQcjtQtsUmrXOeGX5U016ovoJu7jb0hyqaIRNfvX068noSwl7O5K+/oi+uAhyIXRuWv/shwXb37kUrBuqEzrx8bTJJE+oEqggkrC9GEdMyEqzjzKWAr/0j//GtUQySltqsgwU+eAiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [127.0.0.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B22312010D6;
	Wed, 19 Aug 2026 16:12:30 +0200 (CEST)
Message-ID: <032e7297-65b3-477c-9fcc-f6e4bae17a8a@pengutronix.de>
From: "Sascha Hauer" <s.hauer@pengutronix.de>
Subject: Re: [PATCH 5/7] media: verisilicon: Add Rockchip VPU720 JPEG
 decoder
To: =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: "Nicolas Dufresne" <nicolas.dufresne@collabora.com>, "Benjamin Gaignard" <benjamin.gaignard@collabora.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Ezequiel
 Garcia" <ezequiel@vanguardiasur.com.ar>, "Andrzej Pietrasiewicz" <andrzej.p@collabora.com>, "Hans
 Verkuil" <hverkuil@kernel.org>, "Chen-Yu Tsai" <wenst@chromium.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Lucas Sinn" <lucas.sinn@wolfvision.net>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, "Sascha
 Hauer" <s.hauer@pengutronix.de>
In-Reply-To: <5715409.BjyWNHgNrj@diego>
References: <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
 <20260819-rk3588-jpegdec-v1-5-33d74cdf369c@pengutronix.de>
 <5715409.BjyWNHgNrj@diego>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 14:12:30 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Hi,

On 2026-08-19 14:46, Heiko St=C3=BCbner wrote:
> Hi,
>=20
> > +static int vdpu720_fill_chroma(struct hantro_ctx *ctx,
> > +			       struct vb2_v4l2_buffer *dst_buf)
>=20
> [...]
>=20
> > +/**
> > + * rockchip_vpu720_jpeg_dec_init() - allocate the per-context DMA side=
 buffer
> > + * @ctx:	context to allocate the Q/Huffman table buffer for
> > + *
> > + * Return: 0 on success, -ENOMEM if the buffer could not be allocated.
> > + */
>=20
> again comment style ( "/**", also the ctx line could use a blank line abo=
ve it)
> Seemingly one function before this the LLM did get it right?

It's not as inconsistent as it seems. The exported functions have a
kerneldoc header with /** and the arguments described, the static
functions just have a freestyle header. Documentation/doc-guide/kernel-doc.=
rst
also doesn't have a blank line between the function name and the first
argument.

I could change the static function to kerneldoc as well if you prefer
that.

Sascha

--
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

