Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8BF3E3173;
	Wed,  3 Jun 2026 16:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780503307; cv=none; b=iQbWjdnNNzwhmVsoc11pY4xIkiDpVvERIASFIFOldqYIN/lDe30oeSkq7i5m/Q1rfbO5zMc5ltyM3tRmDI0988B675d0/Yv3QbUG3fgD7ShwdG2KLAq/f5U45m/+DrnFrQijJBOagmJKLmyWPbiPdbavxoQgh61hddw5gWVXc7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780503307; c=relaxed/simple;
	bh=gOWlk9RrsUqA0VtrQwobuwXG95wlu4l+J2QFMgkdGDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcOXru+Os9FZeM4Xns06BgV7KRKNXaMERTV2u35DefqosBUYdAgVGX54TbqPMorYedsLOK8S6wLGW6VpbC7KCc3/XHPH/iQGf3DV30PWtvgWl+j8XI7YXNYuBz+eVnxhMOOkbUDLe1Nh6pXBQF90CNspzb4IN/EkqM83ayDRMzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULuDGwSS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULuDGwSS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D574D1F00898;
	Wed,  3 Jun 2026 16:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780503301;
	bh=dwQAgj5+iT5nXjtC4meACtY9EVtZ0m/GsoPdDY/zB1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ULuDGwSSLIRN0w9IuEJ5JU6MC9AQGP/tI3k6TfNL25n5+MhzzAvJyNgp786DYy4qd
	 SU+2ZsMvjSEWLR06CcWK9d4SpnJ8j+YSbw+9huywRO+70nf1qBP8vzVdp0xu3wgA8r
	 R/Sd5Hl8C1MSFYa2Vs7SDPXHG5A3/nlyhk7eIewmDh+WRIfXivRE8AyEiA8ifvB3L6
	 MlQFwcIw3MftF1zdN13bQZDXQP0KzZBuxMZ+w65qe8Fd6UwM70TLAwr/jSK4kopAFx
	 AgyniZEqiZSJXMXe16mZawh39Ow3S15EGMEE4lAUd8excYWx/V3u54sxyTsvx5xo63
	 gNmSCy/Mk1NCg==
Date: Wed, 3 Jun 2026 17:14:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>, Kees Cook <kees@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	Fei Shao <fshao@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Irui Wang <irui.wang@mediatek.com>, Fan Wu <fanwu01@zju.edu.cn>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v5 11/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Message-ID: <20260603-pentagram-unleveled-8729d0003aa7@spud>
References: <20260603084045.17488-1-kyrie.wu@mediatek.com>
 <20260603084045.17488-12-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t67lQ/zxp5PMEWTK"
Content-Disposition: inline
In-Reply-To: <20260603084045.17488-12-kyrie.wu@mediatek.com>


--t67lQ/zxp5PMEWTK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 04:40:41PM +0800, Kyrie Wu wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.com>
>=20
> The MT8196 decoder differs from previous generations in several
> key aspects, most notably in its use of VCP instead of SCP.
> Additionally, the MT8196 enhances codec capabilities by supporting
> HEVC Main10 profile decoding. To accommodate these hardware changes,
> the binding constraints specify a total of 12 clock inputs,
> consisting of 9 decoder clocks and 3 VCP interface clocks,
> along with 2 power domains covering both the decoder and VCP
> subsystems.

I'm pretty pretty confused by this statement about constraints, since
there's none added?
The vcodec-dec node doesn't even seem to permit clocks at all?

>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml           | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subd=
ev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-s=
ubdev-decoder.yaml
> index bf8082d87ac0..74e1d88d3056 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml
> @@ -76,6 +76,7 @@ properties:
>        - mediatek,mt8186-vcodec-dec
>        - mediatek,mt8188-vcodec-dec
>        - mediatek,mt8195-vcodec-dec
> +      - mediatek,mt8196-vcodec-dec
> =20
>    reg:
>      minItems: 1
> --=20
> 2.45.2
>=20

--t67lQ/zxp5PMEWTK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBS/QAKCRB4tDGHoIJi
0oufAP9lJNwOAT7VUSW+zV4U2z3qVv4MRzJDqgtx5EAGueP/8QD/cTypdP6H/JNn
OwufpOGYDIsoQ8ZXAYdX5gTK/xBsNwI=
=W/Ot
-----END PGP SIGNATURE-----

--t67lQ/zxp5PMEWTK--
