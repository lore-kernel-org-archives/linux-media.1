Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF46C2EA754
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786715648; cv=none; b=MSyhuKw/nu4xXEE2ncvFGD3CredYDXlTTlowQnzWvRt5VU17O7YTsJCbZ6PEG7tthNl7lHWGkiszaYnQzC2j4kp4ek/eXDUqa9ZfNiJmhsnS/eRSTqBm9jv04fbrF/EbIpZdHV7CBMKDcCuBtiz6qi8sFRDBRzytTjbdxYfJAbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786715648; c=relaxed/simple;
	bh=0H3j7sWl5G8y6Uv1S0WkJaRGAOnVVH/GrTVxH1ZKHyI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DkwtIEGb52HXPrPafXr5QENUtO6Kx1hxJfD4tpBJqThdZ13Ajs0poTwLdVTFuQ/ewA1rdewu+QOoe+VxCwgF+UNCYFOMH5FkHZAqT35uKTiqjvvbYatHhZkzEeaYHZeI2elRx61X9r6Ww93gk0PqUNv58LVFgDGNfB8p938AhcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=sZUywr3K; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="sZUywr3K"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-52b6543169fso7351701cf.2
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 06:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1786715645; x=1787320445; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tq/4Dxp9Lq5lOmtwqVhbb0b5mzgrcMsvD4kX5zmmpJg=;
        b=sZUywr3KbNrnC1+xtKhzKulyZNvid8xpoXtEDCz8lRJRI8QgVoeluk5ysK7cjGrctV
         926zTFPKAqZXmaG7I+dKjVD/3C8o8VuPmh6pnC3MX/+xDQHQa9qSgyqPw9PBczeXOZ/O
         1cYzFsT0CsYerp3o96c5r+pG7SVOpaFwSSyTAhkLVpFYPgGDPze7OI4F3v+ek6SwSyVQ
         s767OV7peNM1hhom2dtO13B8hIFxdZ1Cy5+nB0jFWCp1Aid5Qj98Bjxp28YO57NQj31m
         +M/AhEvw4we+y92y6ijj+ob4P13NGP1L7KgNrAqYBM/LEkDUoQw0ieSHVjSJv/9Q/GVN
         m4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786715645; x=1787320445;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tq/4Dxp9Lq5lOmtwqVhbb0b5mzgrcMsvD4kX5zmmpJg=;
        b=dU9RDjKWFpmIPnqXOzNE9gXRfS8f4tQw3MM367C8JTRKVuGFFcD6yvWuqJN8VAsbm5
         DBaHv40buPbHQZifB4NQhkY/XpXYaCfAxDjqZ269VG+RYtZ5sVONvhGrQW0URnIm/jA5
         Zvn2PhJtOIt05nQ/AHoo0krgERMyyA/h4KioUH0wMvc6Fdy/JND5GEP48Fq2ZgZlvmBQ
         5Rv34rewOP6Eii1fvC2HrSjgA9WwkaOHMuDcQxl4WrB9V7ZqcMMAzQA/NW08l/8uim7y
         OjQrEvVIGAS/JXY2WZKbyld5kt2gaEgDbR5En436WNoH0dqiNMkqMie8+dNhtVc6+fPU
         Vg/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrPY3qJul1t59tnrgsEL6k0sYwymwl9vdIq1mPW3hA3a2sud7jlluf+34Qgta5TzK0fEGSwAJsPWVM/Og==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxsfXil2qbNYLgjZ/JGPyS5hf74J/irZhmYjQmn/6ntJKN/Unl
	lYYGAO0U9mb/uC12xW1ZfanOJnHFDZ07BR8eT5HxKiIdMyE0huvmiaPoZyjSF/jp2M8=
X-Gm-Gg: AR+sD117KSgUUEtpJm6DT9kgr0+NIfiS91vCD0TRRjiDagnjrGBbGJ6iEti5czPbNT2
	BQouWAuIelTndjC36ePGv29y1FDljM1kmpeOvYE1ZYDkLeYSP41ezEsbAG9BsTJ+5e/3H6UnpH0
	6li6eT83e5aahgx7tzhDXzSxcJpqCSND8L3HmoOFNEPfj1Zx9jK4+PnV+5PSduXJ4QKEGZpgbKZ
	+vErC5ewyexxsBRbVZmd9GsKmToHUsBEH6PV5UraDtSx70KN62+CntD5uvf4WEqSM1A3hS6/7vT
	NUA+6NbWEB9ojykhF/GZHzYJDcpfV4Xy72uPZAZORUZximFzUhsoZ87JPJcQaQlKqiAJPfM27Tv
	5cJY3ey+weP+pXltxZfeJYbaK2flqeFjfLgnnP2cux9iqj1XK96EdgRUJ2kjBPVzhWWVVvXRW2S
	+A0qiSieI6XlTY1+YCnm1Rv1r6pNxYA3Dt4KvV5l5mLM7O7eakowyBMNY1r6d08fdlpw==
X-Received: by 2002:ac8:5952:0:b0:51c:1ec5:d0f with SMTP id d75a77b69052e-52d854f2433mr60161451cf.40.1786715644660;
        Fri, 14 Aug 2026 06:54:04 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e221::5ac? ([2606:6d00:15:e221::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d83ef775csm21392021cf.7.2026.08.14.06.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:54:03 -0700 (PDT)
Message-ID: <3a0996708452454edb9ef4735d0ae343a04dbce6.camel@ndufresne.ca>
Subject: Re: [PATCH] media: vicodec: zero-initialize stateful decoder heap
 buffers
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: moonafterrain@outlook.com, Hans Verkuil <hverkuil@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Keiichi Watanabe
 <keiichiw@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Yuhao Jiang
	 <danisjiang@gmail.com>, stable@vger.kernel.org
Date: Fri, 14 Aug 2026 09:54:01 -0400
In-Reply-To: <20260813-vicodec-fixes-v1-1-13077b5b6c29@outlook.com>
References: <20260813-vicodec-fixes-v1-1-13077b5b6c29@outlook.com>
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
	protocol="application/pgp-signature"; boundary="=-v6aq/8iizxPYsUlaL/5Q"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-v6aq/8iizxPYsUlaL/5Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 13 ao=C3=BBt 2026 =C3=A0 13:51 +0800, Junrui Luo via B4 Relay a =
=C3=A9crit=C2=A0:
> From: Junrui Luo <moonafterrain@outlook.com>
>=20
> vicodec_start_streaming() allocates state->ref_frame.buf and the
> compressed_frame buffer with kvmalloc() for the stateful decoder and
> leaves both uninitialized.
>=20
> decode_plane() derives is_intra from the reference pointer being NULL
> (is_intra =3D !ref) rather than from frame-sequence state, and the
> stateful decoder always passes a valid ref, so a P-coded first frame
> reaches add_deltas() over stale heap content that is then folded into
> the decoded frame and returned via VIDIOC_DQBUF. The padding rows
> between visible_height and coded_height leak on every P-frame as well,
> since copy_cap_to_ref() writes only visible_height rows while
> decode_plane() reads up to round_up(visible_height, 8). For
> compressed_frame, only comp_size bytes are copied into the new
> comp_max_size allocation, leaving the tail uninitialized for derlc() to
> walk into.

There is a lot of description of what the code does already, and what your
change does, but for some reason, it seem you have forgotten the essential,
which is the rationale for this patch. Please focus on what this patch fixe=
s,
and then go into details. Looking forward a v2.

Nicolas

>=20
> Use kvzalloc() for both allocations.
>=20
> Fixes: 256bf813ba39 ("media: vicodec: add the virtual codec driver")
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Assisted-by: Claude:claude-opus-5
> Cc: stable@vger.kernel.org
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> ---
>  drivers/media/test-drivers/vicodec/vicodec-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/=
media/test-drivers/vicodec/vicodec-core.c
> index 318e8330f16a..7ebde8f3fc37 100644
> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
> @@ -1595,9 +1595,9 @@ static int vicodec_start_streaming(struct vb2_queue=
 *q,
>  	}
>  	state->ref_stride =3D q_data->coded_width * info->luma_alpha_step;
> =20
> -	state->ref_frame.buf =3D kvmalloc(total_planes_size, GFP_KERNEL);
> +	state->ref_frame.buf =3D kvzalloc(total_planes_size, GFP_KERNEL);
>  	state->ref_frame.luma =3D state->ref_frame.buf;
> -	new_comp_frame =3D kvmalloc(ctx->comp_max_size, GFP_KERNEL);
> +	new_comp_frame =3D kvzalloc(ctx->comp_max_size, GFP_KERNEL);
> =20
>  	if (!state->ref_frame.luma || !new_comp_frame) {
>  		kvfree(state->ref_frame.luma);
>=20
> ---
> base-commit: f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
> change-id: 20260813-vicodec-fixes-a91ec4217ce3
>=20
> Best regards,

--=-v6aq/8iizxPYsUlaL/5Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCan8d+QAKCRDZQZRRKWBy
9OlFAQDWCBKY1VPxjrIt6+0Y0vi5NqefHw4gi/J7J0jhjV3jIAEA/8niRR+SFiue
2AmZGOwn+1aLC2jGt1PU+A5ccjQnRgY=
=ew/F
-----END PGP SIGNATURE-----

--=-v6aq/8iizxPYsUlaL/5Q--
