Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538287;
	b=DU11OA6B9FgKVaH+gQ6grezLP/tVK8pMPQT+Eq4pH902ahG4upLsgIoT/LcPqyBj36vw
	 IRhGrIAniaJ7ClSVmtq9z2GYwl7WIIq+LG9Iw2wQc/OVRetzHq/O93M71wHCiI1iR7xK0
	 F3WA9S08ldYsYgV6tKUKbm4N9ymh0lw+ddWlDfboizn2Dj6NktbXLGCmbUVpd+GB24SvN
	 e8QM42NlTawZFmokSRDp0jxVwGkV6dkKoBltc/klp2hN3io89atHzkV5HEsQ8apSQBhVf
	 Yzui5scqiRRk2krhM1tydet1FF5LGS7KQyUqU6tY/IVRWVDfp+YbjOz0yQC4KBQ2s9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538287;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=TDfQrDs0VJJpLswhqOkr8Amdn3FxE2RvcuAwVP6cJFo=;
	b=SLN8bXZdLk+dC7pEdFC+xVCoRMNJ8bNoOb464ZX9wi2PlbOf/R9wlC54+3qq1/vsKWGR
	 ols6qhzen9l9vwJMGaANeBWLM7acVfiwgieVt+x3VQZ0FGOUT7YzJPwvbWD1ICAFIUPRc
	 LrYEl8hvTguI2fjWOQQs69bpuNJIX5AyNuQfZs/mqq1joJ0DEAKqOW5SRQJQY4xcuoUD4
	 zPl9IPNeCUJ4o+IOf0q7qMXhhJ8KTNYP2Ha4DgngjgsmAMdxPiqia8elig3TS9MXEMfmc
	 0l3tKkkx0XEIjg0+qHFr7dxKvxDqtfq9ttwV0n05LhclnanzWO1IZ/FajXYeaZqxnHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Q8lzSdZq;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E79606A682;
	Tue, 24 Nov 2026 16:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3E79606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Q8lzSdZq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795538284;
	bh=/QZ+irOHsWaC/ChJazv1fX2AjDKuXTFkIcL1lxRycPM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Q8lzSdZqNQsy2LbpNePfKX8KQh7pIMERWPxdBSw3wkx1WOgtvWjSMVDtbLtNHhKi8
	 uYKj8/MoSIcaW0v1BzkTok23qLTkyBt1VBkqtjhOsNXLjSD5akpLoNf53w3rntaSS0
	 BUS5vp2VWLxZ2BhPxrgyzeGD0TPj7s5mB2D3L2Ovc3gS9DSZlD7736/uhb5P9l3yGb
	 Dpz83spNUgC2jGlmUPwf2QclEoWAATsQolBSTA806m2YM/hbvtumvbFlr9/gLoskP1
	 5ls7Ph35rDMM9wi6OQXmsaZMhN7eUET5A8crPpoCFPnbVGTGpJvarj5bZo7WI+ISU0
	 lgDxI5zAa0VLw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8700617E005B;
	Tue, 24 Nov 2026 17:38:02 +0100 (CET)
Message-ID: <871fa86e8a524f7d3ae7a0ac54adf57f14eaa187.camel@collabora.com>
Subject: Re: [PATCH 4/8] media: mtk-mdp: Round MT21C sources up to whole
 tiles
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Ryan Brue <ryanbrue.dev@gmail.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans
 Verkuil <hverkuil@kernel.org>, Minghsiu Tsai	 <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>, Enric Balletbo i Serra
 <eballetbo@kernel.org>, Eizan Miyamoto <eizan@chromium.org>, Francois
 Buergisser	 <fbuergisser@chromium.org>
Cc: Youngjoon Lee <getfeus@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Mauro Carvalho Chehab
	 <mchehab+huawei@kernel.org>
Date: Tue, 24 Nov 2026 11:38:00 -0500
In-Reply-To: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-4-877dea14c3d0@gmail.com>
References: 
	<20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
	 <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-4-877dea14c3d0@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-Ap9Z8iPA9oUAx81PJBIK"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-Ap9Z8iPA9oUAx81PJBIK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 novembre 2026 =C3=A0 13:55 -0600, Ryan Brue a =C3=A9crit=C2=
=A0:
> MT21C, the MT8173 decoder's output, is laid out in tiles of 16x32
> pixels, and the MDP firmware refuses a source of a size that is not a
> whole number of them: converting a 1280x720 picture fails with -EINVAL
> for every frame, while 1280x736, the decoder's own buffer size, works.
> The alignment was 16x16, so 720 lines passed the format check.
>=20
> Align MT21C to 16x32. mtk_mdp_bound_align_image() already rounds a size
> up to the alignment, so a source covers its picture, and the visible
> part is the crop rectangle.
>=20
> Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")

Is this commit in stable? If so you should CC stable.

> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/=
media/platform/mediatek/mdp/mtk_mdp_m2m.c
> index d2813890cceb..34d02de4453d 100644
> --- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
> +++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
> @@ -40,7 +40,7 @@ struct mtk_mdp_pix_limit {
> =20
>  static struct mtk_mdp_pix_align mtk_mdp_size_align =3D {
>  =09.org_w=09=09=09=3D 16,
> -=09.org_h=09=09=09=3D 16,
> +=09.org_h=09=09=09=3D 32,
>  =09.target_w=09=09=3D 2,
>  =09.target_h=09=09=3D 2,
>  };

--=-Ap9Z8iPA9oUAx81PJBIK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawW9aAAKCRDZQZRRKWBy
9I6LAP97J054sBtnp+eLh55dXZmQlNt8Cj6YYU+GZPToghAE0AEA+FmJ/e9Hv+dy
mWFFrQT47bJIutO025aeyEtaLq0Fuw4=
=EFQo
-----END PGP SIGNATURE-----

--=-Ap9Z8iPA9oUAx81PJBIK--
