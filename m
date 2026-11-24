Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491059;
	b=Pe57gR31K8LqsvDglA/8oBxW6EyinebWHfv2Mj2sGCvYEaSs9t5PqtQbnqNo0MvNi01E
	 QfP4Bn+VJJO8/dDtajBTb9NQtgV3e+kJVqBIamoDu356VMNJ3A+6VNfkTmBusN2GUVLvx
	 y817W8HfuyF2QLKuSq6NybqlYSmvvbq8/DJEBzvRUU0600r+IJj9cdm/z6Yh9KLLKLwNb
	 vw0VqXVA1SXXBWJpffaVy4puMBcU7y3vBnsB7+C4kfxXOZvKH6W2cXvWPqGdY4b1yiqis
	 AcFE28kfy+OpnhNp8I0zMWlSUN4+cBU1mPkBkrVnvvu/wRwuGmlF6rtyTKmIqxcwZDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491059;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=pyHexj0+tqVSxaKhaBY2HOeWK/ZBGwKQEd3in6nz0eo=;
	b=OmHewNRqmOOiIJY5VZnFvNQ64/Dn1NBc4VR+FVZgHWMCp7rgRGmUYvwNosh1wGRhWV/l
	 7GPsKa9m3nl7fIFaHVi/T1/xtkqaNl6b0qXezx/+LDvZ1Y1W3OD9HXBc+9Wq5Y4kh+nDL
	 L90AlQFRTZKSAgIIN2n5G9kf20jH5CsiiY8qWSlQfP3k19gI/ku8jB23sqVZoE1Y101//
	 FNsimWDF8Bbmbi4lEDlBOf6cm64ttb4CyyWtffGiCP/38VOHhGREpuptKfZLwYtA5jGxE
	 EnA1Vm7p972LAkCz9GnDIny82WsbeNB6xo3PLkBBBzP7I69kEzTL9/kscztFs55sytw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=g8aBUN+B;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EED606A31E;
	Tue, 24 Nov 2026 03:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04EED606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=g8aBUN+B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795491057;
	bh=MXmoufWPYFfbg0i+dQ2JQfkHgdQBAEq1ck4w5GVrS1w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=g8aBUN+BqSSSKgas34zbSjAaPlvO1DOSkb5RBYmhN2GiUoYiJ6MSQqsYmlV004Do9
	 ufJJelzxExcuaVBsJt9LI6rdv2DwlG6xCpV5pmIuTsBZ4JW52Q02m+MngLe1AMVU9v
	 mzDtJDNE9Fz8zIZc204+C8yCDCebvOMXipPJHQTbleWPHdE65TDKK7/g2I64VDzmlS
	 T2jl90Lnrj1cxLi+MjVRw5oCNHOUqrfxf/Lx53sxXl1l+475TJUh9TQeiPXPUlgFpc
	 bxJaz1UFU+J2RQnVoVvk7yYWUhYyLCOhd1FttKNJrGbvXZxLAH18F7Y8U/SPAMNkm7
	 DHThxfOw9steQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DD3EF17E0CD7;
	Tue, 24 Nov 2026 04:30:55 +0100 (CET)
Message-ID: <3dfe5ae59107fa77075676fc226ac818bc2700f9.camel@collabora.com>
Subject: Re: [PATCH v7 2/3] media: verisilicon: AV1: Fix luma size
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de,
 hverkuil@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 23 Nov 2026 22:30:54 -0500
In-Reply-To: <20261120143135.71134-3-benjamin.gaignard@collabora.com>
References: <20261120143135.71134-1-benjamin.gaignard@collabora.com>
	 <20261120143135.71134-3-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-UcH2Qzf5k/0Fqhh/w578"
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

--=-UcH2Qzf5k/0Fqhh/w578
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 novembre 2026 =C3=A0 15:31 +0100, Benjamin Gaignard a =C3=A9=
crit=C2=A0:
> Use the values computed by v4l2 helpers to get luma size.
> Unlile before this will also take care of padding.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_de=
c.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index 5da59104a966..5e0cd5268f22 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -221,7 +221,7 @@ static void rockchip_vpu981_av1_dec_clean_refs(struct=
 hantro_ctx *ctx)
> =20
>  static size_t rockchip_vpu981_av1_dec_luma_size(struct hantro_ctx *ctx)
>  {
> -=09return ctx->dst_fmt.width * ctx->dst_fmt.height * ctx->bit_depth / 8;
> +=09return ctx->ref_fmt.plane_fmt[0].bytesperline * ctx->ref_fmt.height;
>  }
> =20
>  static size_t rockchip_vpu981_av1_dec_chroma_size(struct hantro_ctx *ctx=
)

--=-UcH2Qzf5k/0Fqhh/w578
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawUE7gAKCRDZQZRRKWBy
9BAHAQD8fgjmNX5KD6ctzH1SuyeuStMfmVDc3EEZMVnX5nWbKAD6AtSq07MlurJ6
azwsqiLQeRsU+00eDSZ5RRKn8CSpTA8=
=2h/7
-----END PGP SIGNATURE-----

--=-UcH2Qzf5k/0Fqhh/w578--
