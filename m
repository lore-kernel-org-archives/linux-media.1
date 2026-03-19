Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CDD38B7AC;
	Thu, 19 Mar 2026 17:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773942682; cv=none; b=E1fbl6dcykTYqam+D/thMRnMnDaQ27FzWo9VYbBPtI713ssq+fLe804wmahMBQcSdL3pGySZCQciab1h9IkTHfiO43yq9qNSk5tXcFOPDCCaFDZkQIEUfMvC7asDusFp9dOcs7+AJg3boF5wnzUEocn9h6xrvYLqIc7nwEIs/yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773942682; c=relaxed/simple;
	bh=IfLACTZUZWtVGAw3TjaZzObr0eKRQqmLVP7qyYyiYwU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oadV5n5KPLJmB/3QcWJezz26T2st7ratbJFAKvbd5NKYtlb69qRWfTUocNyvsDf5+3CXDSx6uLG7HtuhsJMsK8aJj0u7YDVYfwdL0HeQne2E8rTxPjsBVLUUQ46VYUts9omZBZX2dmIRbRnGasoKslquAbyU9bdt1sUPe3+7cII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SNTVM6sn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SNTVM6sn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773942676;
	bh=IfLACTZUZWtVGAw3TjaZzObr0eKRQqmLVP7qyYyiYwU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=SNTVM6snbqholmWyT1SBVx/Zvo1taAER2T46QBpKkzHOcA1DXEVX4+rV2shBaarrS
	 6Bkx0EqZjgkBLPPy8MezWstmUN84yp14b+WQO+uv0DI/knOpeJSxSXi6V41bM2cKCg
	 sVyYxcQJncvrHc3Vo3eEWKud0LWLMkTJhcEH2fkVky4UhMbLl86WL+Mq7JOYdByGxO
	 UunprJ7LYUp/2kSTeLWM3YVBWtUPOjNOUgvRdF1R/snfFNV3qx0+IPIVI+Cg05/oOp
	 VYu3Gus0sKjswrK6AthXUVnWyTtwv7fB3g55wHXNpfhC7IyausNkTdT2VlHtRCoyzs
	 c6vt4d29S1Iyg==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D529617E01B1;
	Thu, 19 Mar 2026 18:51:13 +0100 (CET)
Message-ID: <bfdb6cf4a4e201404deaf42e34fac731748d9aae.camel@collabora.com>
Subject: Re: [PATCH v7 01/10] dt-bindings: media: mediatek: decoder: Add
 MT8189 mediatek,vcodec-decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@xs4all.nl>,  Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann
 <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>,  George Sun
 <george.sun@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	 <andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Date: Thu, 19 Mar 2026 13:51:12 -0400
In-Reply-To: <20260127024248.18406-2-kyrie.wu@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
	 <20260127024248.18406-2-kyrie.wu@mediatek.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-AkToS706KozDmvsPAY7X"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-AkToS706KozDmvsPAY7X
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 10:42 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> Add compatible for video decoder on MT8189 platform. Compared with
> former ICs, the MT8189 decoder use iommu to instead of smmu, and
> use scp architecture, the frequency is only 406MHZ, and cannot reach
> more than 700MHZ. It used only one clock. At the same time, the decoder

used -> uses

I will edit while applying if no new version is needed.

> supports the vp9 decoding protocol for the first time in single IC.
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>


Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../bindings/media/mediatek,vcodec-subdev-decoder.yaml=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subd=
ev-
> decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-su=
bdev-
> decoder.yaml
> index 74e1d88d3056..ee2bbbdb2d50 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
> decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
> decoder.yaml
> @@ -75,6 +75,7 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8192-vcodec-dec
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8186-vcodec-dec
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8188-vcodec-dec
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8189-vcodec-dec
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-vcodec-dec
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8196-vcodec-dec
> =C2=A0
> @@ -132,11 +133,11 @@ patternProperties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Refer to bin=
dings/iommu/mediatek,iommu.yaml.
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 4
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 5
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 4
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 5
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assigned-clocks:

--=-AkToS706KozDmvsPAY7X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabw3kAAKCRDZQZRRKWBy
9FOpAP98EeRzL7Xi7yjEibfNaBW5yZ2xRquWc/OBvRk/DEHAVAD9FTu7r6Dks46M
/jxHcyeiE+SqfcGILdh/gknhFteu/Qo=
=GmZQ
-----END PGP SIGNATURE-----

--=-AkToS706KozDmvsPAY7X--
