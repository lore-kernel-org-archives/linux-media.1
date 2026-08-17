Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E905D449997
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 15:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786982205; cv=none; b=b1L4JdaSo5P6oNn2+8e0w1fLtbzrjotXBg8F3kbsMJ5ESNeusoL0X7dIZlLpLdkYPxKUbtUtL82BF38fqhNEQ8Pu7aVkni/yfYPirNjoodC7nbIa17pHA+5HO4xfGbnrTmXwElhnbOXimUqZ4kGcckhCbXm/kBEf57EtSENWVD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786982205; c=relaxed/simple;
	bh=Pz7G90hsWMARsu3xlveBBbl7GlcSQbMFAj2idBf1phk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uSzP2yAen1Upf7iEmDsVbnWFJ9fVbBie+6zGK/BJqHbOin3xxTo3Wv0Fs3QH/46Y+OR4U42NKN9IrcydtaW2VsQccYN3bwQDz8yf5a79IPgkKYeVYMj9nlPSjhGkmvD5OJYfoHvBwTD1yS05ncdSJhYDVbhdXsj2I8FELQBYglU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=GXX8RUxp; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="GXX8RUxp"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8f0e5e36912so20383626d6.2
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 08:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1786982203; x=1787587003; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W5JTE8RgPv6wVS1TjQdLoJkF+pQkNhtdIzZd0eIbmrE=;
        b=GXX8RUxpBEA3IaWKWukUcnqgy/P9xzqHzQJVOk6VUfowsVxXKUzfBXceTuiPUZShVJ
         XAiX4YHcdEFKtr5ilSVd8/e9udXw7+Ifez0Ti+sBMlYq8SJZJMPDH4+KUvNl/wiSBML1
         Z+A8p+FXLWkhlwUH+nN/EXVE/bLbdAOCLDxagih05+HUhRWIkChEQtImPgtWLBBNkStd
         Tz33Ua5x97xmOWYoaTF6FSEtMD0wNWLJmh2J+Q6QCuG8dhAcTe0ENE2ub0u/O7Zm8u4X
         V1dR31HW4MPtTYXy7f2VvGhIDd8U7gX7L00wqEFJjr2jeNCFNMYo1G64AdAU7zeV9Cre
         5zKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786982203; x=1787587003;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W5JTE8RgPv6wVS1TjQdLoJkF+pQkNhtdIzZd0eIbmrE=;
        b=gQhyc3xqTP4BfN5N2a2E6u0T7N0h/ej76YRWVrokma4WIgbgKWYA8sTGYaMmDLWSjI
         +XnMu2sLqaWDOsWpf4SZ/w6M59iB4n0TBVtD44CzS5SynGMVNtpqEuEWh62HcuL8w7gV
         C4HlpJhKucPSK7w46WOmGJztlQz64lMN8o2eKH8rM/dj+YmiE7KA3IGv1pFufOr6asQ4
         NxbKq9PjIdE/VdygmTz22QVNuOxujQQTXFb4ec+VpkrylUN4pnsJXUxz7ENVTx/crTp6
         hCY6N0VXmq55KiUfTroXRa5xq9AjM4mJaMO2I3rxf2OO4OSq8jXuV18cZeXTSbGkFXbV
         drFw==
X-Gm-Message-State: AOJu0YxH8M/79NghyladE0i25t8/lysiJea3TzLohTDBbHeqqlgmu0+u
	NPe/qzaiqU42VvCcZQA+BF3ELpTDlAdsLydpYPoP7k8W9UD6FCuXyH7KiBR919fh6Jo=
X-Gm-Gg: AR+sD11rHdSIC/ZJZ2NG5IbvkNoN3MDQUpp1gLXnN5ZH2TNmpatCnEBqAXNM/jpF6g8
	i/uIYeTJqsN+SjdLLqOrBQomseOoijrEEMTg0VEYIhPf9pYCodyODyOdpyIWcS1bld3RKOnoQ/V
	llvQH0zLmmCD0Md0/RPLiJIV2MI8pDB6YliGI1SMD9gQhu0zxjEmbBNPMADno5qEoELm1NzaL+B
	3R/bdW9FrvAzeCUeOAQvILP1xKT7jqyg6tzQ8EYtLN9Jm1lmwsALNofoKNYGjCQATdQiSgDjusE
	Sdpza52jF/IsiNSLGHDhoxFIs30L/Gi7wNPzMcL5nyp+wPIhsNdu+H6ztBQRv7JIc9U7JECWtKM
	qvc2ePgZNeQ0gZjuYBpPX/YRG9z2vG4NPOyJ1fC3wwO83jqvftzaufJ0FBSLFBxzQhD3mbWerD2
	Aq8rCbmqm1FFGx4U6BZliSiBAD+2t7W9VVWexyD1qTTYVgU8uEQjCHQgU43kFomJ66
X-Received: by 2002:ad4:5d4d:0:b0:8f1:323a:fc45 with SMTP id 6a1803df08f44-90c4b3adee4mr16479066d6.15.1786982201946;
        Mon, 17 Aug 2026 08:56:41 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e221::c41? ([2606:6d00:15:e221::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c45936719sm11637656d6.25.2026.08.17.08.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 08:56:41 -0700 (PDT)
Message-ID: <f2a442a8a21ff5d22a3bcdb4089b96604ce8344d.camel@ndufresne.ca>
Subject: Re: [PATCH] media: v4l2-common: add Y12 and YUV24 to
 v4l2_format_info()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Vishal Sagar
	 <vishal.sagar@amd.com>
Date: Mon, 17 Aug 2026 11:56:39 -0400
In-Reply-To: <20260806-v4l2-format-info-y12-yuv24-v1-1-de2dc061be02@ideasonboard.com>
References: 
	<20260806-v4l2-format-info-y12-yuv24-v1-1-de2dc061be02@ideasonboard.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-sYY7nty/HjES7gGbXjtu"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-sYY7nty/HjES7gGbXjtu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 06 ao=C3=BBt 2026 =C3=A0 16:02 +0300, Tomi Valkeinen a =C3=A9crit=
=C2=A0:
> Add the V4L2_PIX_FMT_Y12 (12-bit greyscale stored in 16 bit container)
> and V4L2_PIX_FMT_YUV24 (packed 24 bpp YUV 4:4:4) entries to the
> v4l2_format_info table.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 65db7340ad38..0951a1b42a5f 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -307,6 +307,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
>  		{ .format =3D V4L2_PIX_FMT_Y210,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_Y212,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_Y216,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_YUV24,   .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 3, 0, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },

This one is mapped two lines below, perhaps you wanted to reorder ?

>  		{ .format =3D V4L2_PIX_FMT_YUV48_12, .pixel_enc =3D V4L2_PIXEL_ENC_YUV=
, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 6, 0, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_YUV24,   .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 3, 0, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_MT2110T, .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .bpp_div =
=3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> @@ -333,6 +334,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
>  		{ .format =3D V4L2_PIX_FMT_YVU420,  .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 3, .bpp =3D { 1, 1, 1, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
>  		{ .format =3D V4L2_PIX_FMT_YUV422P, .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 3, .bpp =3D { 1, 1, 1, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_GREY,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 1, 0, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_Y12,     .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },

Ack,

Nicolas

> =20
>  		/* Tiled YUV formats */
>  		{ .format =3D V4L2_PIX_FMT_NV12_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_YUV=
, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
>=20
> ---
> base-commit: 31152f5b0f8719f92063b8c6196cd5e34106c73d
> change-id: 20260806-v4l2-format-info-y12-yuv24-4236cb991a7a
>=20
> Best regards,
> -- =20
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>=20

--=-sYY7nty/HjES7gGbXjtu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaoMvNwAKCRDZQZRRKWBy
9EBJAP4v66WyNdG4eborvvgzfjNQiDzz0wntYaGSKAeFSKhwgQD+I5oPvi7JYulf
qvbbiXjWi4DoBY4CZ3ln+sEIhmsM6wc=
=9+2T
-----END PGP SIGNATURE-----

--=-sYY7nty/HjES7gGbXjtu--
