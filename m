Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241F6169AD2
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 01:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784164913; cv=none; b=gEdNkE8ALE1YjtkP4Rh+jzYbt9IIiV/wpZg27MPCya/iM4gSU1IKJtaeOrF06XOlT3l0dLEtlWg92m1FvVL2JlViy144EZ9LkGuDGWvR/hgBEfOod/gJ10tuFqbZfHk5Gq3kIW2TMWXk3tc4i2UN9azau6t1dzV/CDsqwOo4Cp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784164913; c=relaxed/simple;
	bh=1i/rkDKMrWfeZzJlTSpM2d5VSdn3dkHNj6ILGCp75p8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sTk8Gk/o+B1+Vhs0buiTZi1MRYCb1Bhwl546g6fD1JX4e9LjBQgZFk8Ioax9o5tYY7cdf/64oLqvqgv19en8jqjHNcdAem9rl54BKRh9Lp7FIlU5Rh/5zZQhDcrAZCVZ652pD/hStwRi4tRPQlbFqh4W3gu8uuACe2qpqRVx2aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=TMooQWTi; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="TMooQWTi"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5bfa4c51c2aso2249168e0c.0
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 18:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784164910; x=1784769710; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xIEX4i18qoVXbjqoK0UngJpGYgpYOqx2AEwOVZpDdYM=;
        b=TMooQWTipLlDlK2ecjuRhuu0d6VweOZ7V7RrtAvb0tF5IGKYI6Ek4+sDpWtLtNEQ0R
         KeyRrvIA2gZu6hQxdaIjn6I1H+RRddX9p0244AGDZdf1XPcM66wAV1xkyJ/sCh5VSVY5
         KEQarEkF9vVbI53wOpRHF/S5fukefZUSwuVTmEkTw3Fbnpr6q0xXkxH7uCHN9VjJgMuZ
         HEdPM5bghW93Uu0Vaqtdpml6azUkB3GIgA6ISrQPAm6Yu7P0eofH9RwIX2wlkb9wDIWK
         FY+6xJA8UVAoYIAMHQHcZ0fLMxSP2bp3HTl/qA6v5GsS+N6NyItm+XLm8a9fTkzapC6V
         FJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784164910; x=1784769710;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIEX4i18qoVXbjqoK0UngJpGYgpYOqx2AEwOVZpDdYM=;
        b=k8QFKnKr91RlsTIzmOP+MVh3CiNoS+Ktd2R2zCk1Zi6GMQ6eeA3FLodCi18HRMbbs7
         TUdhnA8cJCIlGGG/+0bqQvqG2deqDBp0DJF5TM/V7S5OiIJOOe6OrLO26uEmAeW2hc8x
         wgyrrxlIl0XbxW2nO3AG19v9uYluRwfK6kKiTwDGuEXFyUOJHOkyuJv78M/njTSy80b3
         Ierd/JR2oPb/AjS2NKRg+7FjVyfnAWWyDeBwP0LfdKb1iME3t5nxdfpOiQKHTsDt+b3C
         U5g9BeO9yb1cySSDJ9+t58Pzq/Y1nf4r0dXCAN+2huLFLHi6mwQoi9+R5USkn4f01dnx
         5+LA==
X-Forwarded-Encrypted: i=1; AHgh+RoMXOzmqQwqqth8Sy436KEWwnyz7i1YzimWoYxWoAdSaCXBrSom4+vlDzIwhfyWNGlu1kdIiHrAZzwzew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu74VNwz4Dwaj86Ni8Cev8ZdnLi6dF441p4XNHQThF/CGOGkwG
	2YVw1chKduqfd8NAnpEDU1j9EJTrNRwCZywJdguIkqcKoFqnE0x3ytT50WfyjeIpim4=
X-Gm-Gg: AfdE7ck08DGbRMSZjLcQIrkgjpd9SOGimPQfL1xEx8wvMQqsiFehr+PFii8EoGU/9Sm
	IhWTcH9o+V7wkSxo9KH+zsI/VsR3lNB6rAkMH6hKSWA/IXknQyevX1pVk4Taq5XI1yvSuWXfCAy
	VLaZNLaEIeE9fELILkiz0RWUxjK9wwfsRO9hg4KX9eJWsfZlvj7UWcEyMZrXYXwtWIRrIhSQB+h
	tWNF5XgGtAyIIugVajz9GkJ3ixkusJ4Sed7NNYWwcGtOVSKWYz94GN7Pq2zMg/OTpkTS4SN1TuG
	lN84IflQ2e9ESJzNlW13UQZ2xrqh+qApQSQc/aaMkpvZaPwypq7BhdaKXisELbxmdjvcRjCkfb9
	IvDKiyMgmPm+EpsuD4raB8Dg9Ld66+9AtjVYAmew/25o5wirpLJu3jvu+SVEuVPiKyP0kBMasF/
	E09NupJok=
X-Received: by 2002:a05:6122:6d09:b0:5c1:2150:9de7 with SMTP id 71dfb90a1353d-5c121509e19mr2977113e0c.12.1784164909903;
        Wed, 15 Jul 2026 18:21:49 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed663ded3sm12075936241.12.2026.07.15.18.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 18:21:49 -0700 (PDT)
Message-ID: <cf1251490bf5c07649ce5ef3a14ec3d8c4314639.camel@ndufresne.ca>
Subject: Re: [PATCH] media: meson: vdec: fix NULL pointer deref in
 vdec_try_fmt_common
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Christian Hewitt <christianshewitt@gmail.com>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl	
 <martin.blumenstingl@googlemail.com>, linux-media@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 15 Jul 2026 21:21:47 -0400
In-Reply-To: <20260624065809.2460720-1-christianshewitt@gmail.com>
References: <20260624065809.2460720-1-christianshewitt@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-KCwQdVf4kwVZHhK4QLVf"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-KCwQdVf4kwVZHhK4QLVf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 24 juin 2026 =C3=A0 06:58 +0000, Christian Hewitt a =C3=A9crit=
=C2=A0:
> When VIDIOC_TRY_FMT is called with an unsupported pixel format on the
> OUTPUT queue, vdec_try_fmt_common() falls back to V4L2_PIX_FMT_MPEG2.
> However, if a distro has locally patched MPEG2 support out (as it has
> been broken for some time) the platform format table does not contain
> MPEG2 so find_format() returns NULL and the subsequent dereference of
> fmt_out->max_width triggers a NULL pointer dereference.
>=20
> Fix this by falling back to the first format in the platform's format
> array instead of hardcoding V4L2_PIX_FMT_MPEG2. This is always valid
> since every platform defines at least one format.
>=20
> Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> ---
> This fixes use of v4l2-ctl and v4l2-compliance tools when MPEG2 support
> has been disabled via vdec_platform.c - NB: although this is a fix it's
> also a rather niche scenario so there's no need to backport it to older
> stable kernels.
>=20
> =C2=A0drivers/staging/media/meson/vdec/vdec.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/meson/vdec/vdec.c
> b/drivers/staging/media/meson/vdec/vdec.c
> index 4b77ec1af5a7..f3e7072f221a 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -504,8 +504,8 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 =
size,
> =C2=A0	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> =C2=A0		fmt_out =3D find_format(fmts, size, pixmp->pixelformat);
> =C2=A0		if (!fmt_out) {
> -			pixmp->pixelformat =3D V4L2_PIX_FMT_MPEG2;
> -			fmt_out =3D find_format(fmts, size, pixmp-
> >pixelformat);
> +			pixmp->pixelformat =3D fmts[0].pixfmt;
> +			fmt_out =3D &fmts[0];
> =C2=A0		}
> =C2=A0		break;
> =C2=A0	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:

--=-KCwQdVf4kwVZHhK4QLVf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalgyKwAKCRDZQZRRKWBy
9OvqAQDPEXcCfysbjMcLVok8WR5NVGdePin12f6DHmQ4YTlBWQEAsFlwChimwCuO
DdCcPjAuGpLhXWPu0UTxtMyQfsa74Q0=
=Wvj1
-----END PGP SIGNATURE-----

--=-KCwQdVf4kwVZHhK4QLVf--
