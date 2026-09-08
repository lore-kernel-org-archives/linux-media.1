Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AB6582BA1
	for <linux-media@vger.kernel.org>; Tue,  8 Sep 2026 19:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894739; cv=none; b=LZbxTMMPIYQl7MpgAgzBlRUzZHp7py4F62ANLaw1KkPc5Ubd7pw9O4p+UjlTJCARK1HchjlmWjgZ/OFUHAcKTLbSraREQjbzKGxlR5gU/NQOohbxSfVuaL5znV8OxZVLd/ZPi5AJRTwwBOeTmawyn1qTOL6tupVCW3EQCVJcTRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894739; c=relaxed/simple;
	bh=JHul9HxB1Tsu0xXoi1VEl0n5xFtMD+uvSrPt7PutiCk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y8pSWD/FSjAzRyF8BacURt9/ncf853iDNpPQt8Z/KosZy4U0Ze5+0x3ADaVEeV4XMMNetRS+x9m6lH6Wd6FrfzhhLBIIrnsSo2k8cF6GvHg6sW4LnsYrDZSOtbwHxhMAW5+r1jkf6yx+0NeY7c8pydq4fwC0GlwA3fvbgTv1rPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=R8lMMg66; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="R8lMMg66"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788894735;
	bh=JHul9HxB1Tsu0xXoi1VEl0n5xFtMD+uvSrPt7PutiCk=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=R8lMMg668xVwihmu3Ct9O+8GlesazAYgvtccTR32+qfdTAmtfb9x4A1EeTPrH5LBT
	 ISk58JVjH1m8K1Z4EpJQALNyyWyJ10hP4K+JY+D0tKwHaiHDbWoa4BZ/Dl1XuV+jOy
	 ZlFRqmfHVI+M9/iLFDhvlifwSEaRhH92lCvwWhYg//PXbu5txRP8Hiv+j/3ih4b9zc
	 2vW/p50MHWbyySrnW7vg16HbW/zijrC8WXTAqN/Fcr318VRa9In+DWG41sxF7vvukf
	 QAisMe0b4bNgryzFuPu0TalEoJRDQQg9Deu7fEdpPBc+Op0kR+aR1ttrOi8+GxNLxh
	 MQjyjfGn1FRDg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ED12717E093B;
	Tue, 08 Sep 2026 21:12:14 +0200 (CEST)
Message-ID: <8121b69d018c8c8f74b51ed5d7bbac8ea722907d.camel@collabora.com>
Subject: Re: [PATCH] media: vim2m: give vim2m a proper control ID range
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Linux Media Mailing List
	 <linux-media@vger.kernel.org>
Date: Tue, 08 Sep 2026 15:12:13 -0400
In-Reply-To: <4485e8c1-d59d-4f01-9612-35b5cf734816@kernel.org>
References: <4485e8c1-d59d-4f01-9612-35b5cf734816@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-vCyzjDf61n1DzVPaXyjZ"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-vCyzjDf61n1DzVPaXyjZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 08 septembre 2026 =C3=A0 12:10 +0200, Hans Verkuil a =C3=A9crit=C2=
=A0:
> The vim2m driver has two driver-specific controls, but the
> control IDs were never reserved in v4l2-control.h.
>=20
> While these control IDs clashes with the range reserved for
> the old meye driver, since that meye driver has been removed
> from the kernel quite a long time ago we just officially claim
> that range for the vim2m driver.
>=20
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Reported-by: Nicolas Dufresne <nicolas@ndufresne.ca>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> Closes: https://lore.kernel.org/linux-media/71a3fa9710cf1afbb80ebe8508785=
57c3e95a1b2.camel@ndufresne.ca/
> ---
>  drivers/media/test-drivers/vim2m.c | 4 ++--
>  include/uapi/linux/v4l2-controls.h | 9 +++++++++
>  2 files changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-driv=
ers/vim2m.c
> index bb2dd11eef0e..b16111067f68 100644
> --- a/drivers/media/test-drivers/vim2m.c
> +++ b/drivers/media/test-drivers/vim2m.c
> @@ -150,8 +150,8 @@ enum {
>  	V4L2_M2M_DST =3D 1,
>  };
>=20
> -#define V4L2_CID_TRANS_TIME_MSEC	(V4L2_CID_USER_BASE + 0x1000)
> -#define V4L2_CID_TRANS_NUM_BUFS		(V4L2_CID_USER_BASE + 0x1001)
> +#define V4L2_CID_TRANS_TIME_MSEC	(V4L2_CID_USER_VIM2M_BASE + 0)
> +#define V4L2_CID_TRANS_NUM_BUFS		(V4L2_CID_USER_VIM2M_BASE + 1)
>=20
>  static struct vim2m_fmt *find_format(u32 fourcc)
>  {
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index affec0ab4781..9e3a59638287 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -123,6 +123,15 @@ enum v4l2_colorfx {
>  #define V4L2_CID_USER_MEYE_BASE			(V4L2_CID_USER_BASE + 0x1000)
>  #endif
>=20
> +/*
> + * The base for the vim2m driver controls.
> + * We reserve 16 controls for this driver.
> + * The vim2m control range clashed with the meye control range, which wa=
s not
> + * intended, but since the meye driver has been removed, we can just kee=
p the
> + * vim2m control range.
> + */
> +#define V4L2_CID_USER_VIM2M_BASE		(V4L2_CID_USER_BASE + 0x1000)
> +
>  /* The base for the bttv driver controls.
>   * We reserve 32 controls for this driver. */
>  #define V4L2_CID_USER_BTTV_BASE			(V4L2_CID_USER_BASE + 0x1010)

--=-vCyzjDf61n1DzVPaXyjZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaqBeDQAKCRDZQZRRKWBy
9FuhAP4n35wui/ORTShLrLY09j8R4TDsphL0Eo2jGTP8TgXAegD/cL/Z1iGIY/+a
oZ13G82jNj5RlwrQzRudWiqMrHtzYws=
=SgTL
-----END PGP SIGNATURE-----

--=-vCyzjDf61n1DzVPaXyjZ--
