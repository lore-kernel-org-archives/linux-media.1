Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18147559C9A
	for <linux-media@vger.kernel.org>; Tue,  8 Sep 2026 19:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894357; cv=none; b=p/MenfvdoNLg+5dL/kKGE+90eCsRoJ2EnnPZagMe1DuLb0GgcW0sO6S+rzigJGuHCLRh0PsbbzN2LnumtyccYxeSDEy7kcxmu7cdqcsSDOog2HSvXitDTOa2Gs88UJiEe3qVGNhzM1K0txqg4fdrcZHKjAbt/+XenXqoSkA4rUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894357; c=relaxed/simple;
	bh=LkXaYSuv4+K6xLxwrRGfRfK2Xev7IX9Lxn3mJVmZfRE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PsGxm7DkEb8jGdUwpyXVzvkRJKpDmkiNOCbrVFlVU91CF++LkzHV7kF6rHuJjYCwg7XQwLU+nXo4Mdd8R35HH7SAURohV2AgudbdYsZXzPfHzfc8/KgjOLgoJ5f6zMcnFrrGNy2ShOul050IO3FI7G8wBAQSgVrYe2MgJrze6xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=qOoewXXo; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="qOoewXXo"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-939c25604d4so66476685a.3
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2026 12:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1788894355; x=1789499155; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WQnqS6kLRJh/Dm1F9hxLkoPX5f8+YCWwFjIBhBfJySQ=;
        b=qOoewXXodTROLMwwFcy7o1SE7bFZt2+v6KQZ/aOxhy1abw/a8pSFmdZvlnksjWTouh
         45ycmaLq+tYyzStO315qRVUC3HQxvlQ8CJG0X4CgIWbLrtGziSKsoZAATr01v14xMsOA
         rPR+yR3dOMpDa1D2cH7KUyYW7icwfGX3tvCRGC+O5Li4cp1u5/ObWilt5xYdLrROoVqX
         2dkjOYsNyz2HpX+cLk8rdzFrd+wpWylK0IxuIll0HEqjT/lyp2B1cvYivIEFsQv/D8ZB
         0mkpYJPeYVWKL8+u+1UKlV4z7PYchH3O8vyp6dtmkDbsfv73KUd4hZ5yISU1vgrG3zyB
         F5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894355; x=1789499155;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQnqS6kLRJh/Dm1F9hxLkoPX5f8+YCWwFjIBhBfJySQ=;
        b=N+zlFvjggfzIhEcUkCuKHrrqnllNYruDAXkiWT+umMix7DhFIjjC+Z+Ih78N6sqyh+
         V62FfxYZMxbUZ8QN8u+sKiN1tXV2Ko4K62vnJsS3EF26REWsgQMr6bKWijz4Tp/MyziS
         kFaoLFimFLnYh1Gf6FsGBV7klzy6ospOffIWc0ZAsRGwpuIHgMxYa6QNaFWzu/+hy33d
         TkUtqbteNhxAr/QNoasDPsZIuRzrEZ3bwyUGgzx7wg+VTzwYecXhiwqjN1DxsDvIeMFU
         jJht/JEGxMaLDR2zwc1+SL/j85jiyMq5MubOkjN6Por9aWLjQNRoDTD7qdRag2+PVNb8
         TnJg==
X-Gm-Message-State: AFuF++nmnB8xdFD2BF4IiGSxhZ+3tCGlMbwre56kmdZltx8LvDC5OH5x
	hi5NrpOZOxBfJQLTGm4cpMIQDgFeGNPISpM9FDZu8iJ1lXlTwSQACDJny19mSsCwTrY=
X-Gm-Gg: AYBFou0Od6HhwvGwDcKwexzAexjRoJtMuZqMgXomxsa/CxNVAAV0aje4pdx0UPrcksU
	Js5lkLRgHNAuOhEVIaJZvGzS90USh7T/dxeGrQ9GM9JV5G2HIgFTg07j2fU1FB+maHfnbA3yR8P
	vhC6lE6vsTGKVIlUN4euBLbTWEHkaF5Z175rxWeHiLxsxbkYaO7b5/czhrMGWwXASrzz2fStPC2
	kqI/l31OqQoE2E+w2/oK2edrZHHHwB+jsbt3jZ78i3pXBOiqhnvk1tjbRNUf7J5PrJBHz64cuAN
	Kz3jFH0qUFqe4JGbG2lEcb7ukRu7ymcKgO13R9Cwm2k/xXOCHehbjQoHHppH0P35SvQKhRBNVxe
	ObYZrD0wZFV1VczglD0y8KPy7QYOAuP1wuazoBr4fyTuf7EUgtzTK3YvtRORUARC8B5DJPVtfbs
	gj+QrBOIKrHTubKCffmw3afsCV0fXl4rsA0hWSa39413wVKKATOkShYxdCKYZfQZ9N
X-Received: by 2002:a05:620a:a103:b0:939:6dec:55e8 with SMTP id af79cd13be357-939804fa626mr2897299285a.49.1788894354874;
        Tue, 08 Sep 2026 12:05:54 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e221::5ac? ([2606:6d00:15:e221::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb90d6csm1210337285a.33.2026.09.08.12.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:05:54 -0700 (PDT)
Message-ID: <64de2b7f8acc9919ca18f41827a8e1010431b116.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: v4l2-common: add Y12 to v4l2_format_info()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Vishal Sagar
	 <vishal.sagar@amd.com>
Date: Tue, 08 Sep 2026 15:05:52 -0400
In-Reply-To: <20260907-v4l2-format-info-y12-yuv24-v2-1-46d8689dab95@ideasonboard.com>
References: 
	<20260907-v4l2-format-info-y12-yuv24-v2-1-46d8689dab95@ideasonboard.com>
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
	protocol="application/pgp-signature"; boundary="=-1eoZpEb35WjTVotSKJW7"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-1eoZpEb35WjTVotSKJW7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 07 septembre 2026 =C3=A0 14:36 +0300, Tomi Valkeinen a =C3=A9crit=
=C2=A0:
> Add the V4L2_PIX_FMT_Y12 (12-bit greyscale stored in 16 bit container)
> to the v4l2_format_info table.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> Changes in v2:
> - Drop V4L2_PIX_FMT_YUV24 which was already added upstream
> - Link to v1: https://patch.msgid.link/20260806-v4l2-format-info-y12-yuv2=
4-v1-1-de2dc061be02@ideasonboard.com
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 65db7340ad38..5920941d7f60 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -333,6 +333,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
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
> =20
>  		/* Tiled YUV formats */
>  		{ .format =3D V4L2_PIX_FMT_NV12_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_YUV=
, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
>=20
> ---
> base-commit: 274af88c8acaa4bb538791047bd17fa5136ba78f
> change-id: 20260806-v4l2-format-info-y12-yuv24-4236cb991a7a
>=20
> Best regards,
> -- =20
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

--=-1eoZpEb35WjTVotSKJW7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaqBckAAKCRDZQZRRKWBy
9NRMAQCyIdXQYXKDpunGdGV6p+gwX9i1G3tXpI9Ce34+976J0wD/dVWwSIp5oVVi
sk8qilc6jxcC1dNnjBTu57BXbfkUlw4=
=Ok0O
-----END PGP SIGNATURE-----

--=-1eoZpEb35WjTVotSKJW7--
