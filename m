Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F373E2AD8;
	Mon, 10 Aug 2026 14:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370735; cv=none; b=dozCIWy8utaLwQbe/5yGKnfpalGZiHtInOpaeCuKKzadlB78lQ+fOw2CIdd0DGHMRy936iaz/vqMYphPGiDy+TTivgFFW8gtCdDOlajWZ6pCvbNDMVtGS8rNZwXq385Wlx3lK71wrpEVwYd6wQpcBzkyRciEIQmmFoZCpqe9CO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370735; c=relaxed/simple;
	bh=3is/7Qz5EMpjjXNHjtJS3LzE2Ultwl4Sfu9h9ip4T0s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RYYPmqVRyRj49aE1pDTJxgUjiYmJAN0eKCIEZDSFVDsOvbTOSDgrnTzoQb8In41Cfwzz/FzzjbDif5gj1fMVlbesGFrvJuizCN6105DYXeT9QJ7LyAsjCWfzNtqmBdvvsNIYJ+l/etfqpAKMfT5sLWzFyEyt/1AYeaxFYLaGkYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oiVuW0lT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oiVuW0lT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786370732;
	bh=3is/7Qz5EMpjjXNHjtJS3LzE2Ultwl4Sfu9h9ip4T0s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=oiVuW0lT5Of6lm7Z/ZOFbtbkfKJmtmRybLKH5/+JTRZfY5YBjhdCC9fnKBmrSNgp4
	 /3ttdMNe6ljisIWCM1OWoCOGD+nI1gX64un1PPBrBugd5fWvs3vvPG6yBHzvjAw/0o
	 he8YPYGU8V6GFNV+EPtpOOulef/iSA8jqy4Y0Afzq+GrSaTyy5dicu1A50bgfdTuOx
	 pc5xGk35pkbWwdsS89406fqCHac7m/G/1FEEBsPSEXQ2H+jTWttF5sq1g/ihh6/5VI
	 U0mVpbI4q9HzJETpBZo4WT2hJzndItkoD12pg4Xz3po41ffeKtoPqD/g8k2l1g5ft7
	 qOJeJ8inm9AoA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6874D17E080A;
	Mon, 10 Aug 2026 16:05:30 +0200 (CEST)
Message-ID: <3cfca6fd11f39c6ce161d5a2e7fb650b2e9289ec.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: fix v4l2-compliance failure
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Tharit Tangkijwanichakul <tharitt97@gmail.com>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>,  Hans Verkuil <hverkuil+cisco@kernel.org>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Date: Mon, 10 Aug 2026 10:05:29 -0400
In-Reply-To: <20260730153603.5721-1-tharitt97@gmail.com>
References: <20260730153603.5721-1-tharitt97@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-TzX0jms5qUDK0lg++uvs"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-TzX0jms5qUDK0lg++uvs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 30 juillet 2026 =C3=A0 15:36 +0000, Tharit Tangkijwanichakul a =C3=
=A9crit=C2=A0:
> rkvdec fails v4l2-compliance in two tests related to
> V4L2_CID_STATELESS_HEVC_SPS. The Control ioctls test reads the control
> with GET_EXT_CTRLS and writes the same value back; TRY_EXT_CTRLS then
> returns -EINVAL because the VDPU38x rkvdec_hevc_validate_sps() rejects
> sps->chroma_format_idc =3D=3D 0, which is the value returned when the
> control has no default.
>=20
> =C2=A0=C2=A0=C2=A0 v4l2-compliance 1.33.0-5491, 64 bits, 64-bit time_t
> =C2=A0=C2=A0=C2=A0 v4l2-compliance SHA: b32589c51481 2026-07-16 08:51:38
> =C2=A0=C2=A0=C2=A0 Control ioctls:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail: v4l2-test-controls.cpp(9=
42):
> 	try_ext_ctrls returned an error (22)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> =C2=A0=C2=A0=C2=A0 Buffer ioctls:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail: v4l2-test-buffers.cpp(31=
02): node->streamon(q.g_type())
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail: v4l2-test-buffers.cpp(31=
57): testBlockingDQBuf(node, m2m_q)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test blocking wait: FAIL
>=20
> Provide a control default via p_def with chroma_format_idc =3D 1 (4:2:0),
> which is the only value the VDPU38x SPS validation accepts.
> This fixes both the Control ioctls and the Buffer ioctls failures.
>=20
> Tested on Radxa Rock 5B (RK3588).
>=20
> Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 var=
iant")
> Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 1d1e9bfef8e9..37603f049788 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -236,6 +236,10 @@ static const struct rkvdec_ctrls rkvdec_hevc_ctrls =
=3D {
> =C2=A0	.num_ctrls =3D ARRAY_SIZE(rkvdec_hevc_ctrl_descs),
> =C2=A0};
> =C2=A0
> +static struct v4l2_ctrl_hevc_sps vdpu38x_hevc_sps_default =3D {
> +	.chroma_format_idc =3D 1,
> +};
> +
> =C2=A0static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] =3D =
{
> =C2=A0	{
> =C2=A0		.cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
> @@ -243,6 +247,7 @@ static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctr=
l_descs[] =3D {
> =C2=A0	{
> =C2=A0		.cfg.id =3D V4L2_CID_STATELESS_HEVC_SPS,
> =C2=A0		.cfg.ops =3D &rkvdec_ctrl_ops,
> +		.cfg.p_def.p_hevc_sps =3D &vdpu38x_hevc_sps_default,

Thanks for your patch. Have you considered setting this default in v4l2-com=
mon
instead ? Monochrome is rarely supported of implemented in codecs, so setti=
ng
the global default to 4:2:0 seems like it would be valid for all drivers.

Nicolas

> =C2=A0	},
> =C2=A0	{
> =C2=A0		.cfg.id =3D V4L2_CID_STATELESS_HEVC_PPS,

--=-TzX0jms5qUDK0lg++uvs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCannaqQAKCRDZQZRRKWBy
9G57AP92mrNZWgsDBwsQ2XuKqcBeRf0Gxt9wn6CCa0p8jJZaggEAtrJ7HoEDXOBa
hQUTaEu7DxXMJvm07IaizMrkf6mhqgw=
=XESv
-----END PGP SIGNATURE-----

--=-TzX0jms5qUDK0lg++uvs--
