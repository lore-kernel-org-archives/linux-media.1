Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5DB2FFFA5
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 02:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784168793; cv=none; b=riJKH4LIQQATD5ZtjMO5ammbtzqbifp44wpwkiGQdJdvq4f69Q0vSvI+K/BK9dx28IjynxEybxDQmBFXYWQiLcngaozbLUfj/ow1dOt9u46WslRD1MVjur91KU1uXg4A5di+1c+/FqN/Ol47gtHLp1UkFQVPyrxTo1efKl0xucg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784168793; c=relaxed/simple;
	bh=92NoDO5o5ANm4kLOvaboSdcq2hwEcDiHvjCZ9JFokak=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=av9rMv4yCJmbxlr+d2fh9JhsXLCw0ZNtspgsxXd3EZaUJQtGTxFF2SkcvdKVC/PRst1Ne9A2h+6dRS4uAWeQoMo36Tq9F6MeVGHLqpd5P0OTYHKEYdqj+yEPfr9FVRbSRpirrQoo8h1NY91kHwEBrw5yRrhuiPnc9SSpOIFQizg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=Tmd+jmSc; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="Tmd+jmSc"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-902f92b8504so53655756d6.2
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 19:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784168789; x=1784773589; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mBPsq3oZXwhpSh2XrVu878yUmmYOIRjytvCJ/xaqJJ0=;
        b=Tmd+jmScqbu6JeiRRkZFGo6xy052u2pdjWOJo3UgXrC/g4VrAMd8a3+1rxg66DwyvN
         SH8uLfLPcK+oLiFqZS5QXmhEuEbPWzvdpB07BOQK4mmsIwoP8Q622+CfJA1/E1JZi5m4
         Jq5aldMEnjvkna0aRc5ZpsDly3nqMnm0OlnbIB/SpvCbcPllbo92OUUaozxphwk6tudp
         K0K5yI1ScL+az6GROd20vHdh85RZZn+p4FXeuicufX5bMe9UK+SXnX4qYvu9VMqDxQu6
         mPnH0uFtRZg0v2aWfDKO15AtTMEnFDbW9I3GYox+FbcJzDzhDowNoYZFj7I3hfuIlTLU
         z+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784168789; x=1784773589;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBPsq3oZXwhpSh2XrVu878yUmmYOIRjytvCJ/xaqJJ0=;
        b=WaIk1BosyeSIwJkV3CqeOSGdhDuCr9UGUpkW9GPv9dFMbU5SzV0NA2N7q9WEQ16pv1
         3HXQbnhlfGDiJglJa33rK2+PIUvCTpaA9o5tuLCV3i5KYVPE+IyaxohHKoEANqddi8cs
         pY/Yi1G9h3OUrpyNC1wUuxDqEUFEM8AEag/BvFIpYV/xitEmH2WgmQEGhZcHmgaPatzF
         PizqFU1cmMFgJlYGTzGJ0pT4k1elvtkCoFa/drW36awha8KUTBd4+v797aQDNDHAAw7k
         4D+YzkwlJRPFiFf7uuak5GesxDEuUleuws8kdrcw8a5zvyxN6qQXzzXBVta1AmjbGF6i
         Ss7g==
X-Forwarded-Encrypted: i=1; AHgh+Rqsg9dSfalLyHoHRkVXHH5Cl/cVfn0ATraJ4T2CqjNlViMg8KvoUudxFEn0XXEAaaPOrWD4Keb2WA37WA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyejj65UQg1/jv+0f0AL4TsokTw2AGl+udSrYFzOXJGI0pg2uRJ
	GIGrOwz/DVR3dZZT5P3zFCEL+R5njGd8I2AbALQtXGYgRlGR4aiUdZwKjHh4Q8AIcWk=
X-Gm-Gg: AfdE7ckADvbz1bLoiFHDTd6K0v23H0fbUjHfNys8eHBHD5vdClR0rCEidPXDIA4ivLB
	F6A8LHesMgFlNU4hJHHgVNVzxBJI6Wpxio6r7SwFi1+vY9kPb1nXFm2eYl/mLJKCZ+eA4d9xxju
	gaZMnJ1Ognb2nq1fiecvcIx8bZgBx4zCGFm1ObX9WGCCtEmxujuoUGHlRJpgI0/U0+8Ps1MUGNR
	ujdQUIMYV/TZtMCbkVcns2SFAjULj6/j5gdyHvn4L00hrk5qPcBe2TUkFwODXJAPyoqb56mirxW
	gDkdbGqS2Ok1+b/uHImXheHBKKeHn/pt3A54DJ4oqtngbJ82hVyz6kM3vYPnYImfAZExjRNt2+k
	cNg9FnVtPpTYx5e6vrwGXn70rqLyKWg0PY+k6jgzDRPhcKpqBF6QcTRqTn96xpkCrauEgld9P/B
	tjc5uPXko=
X-Received: by 2002:a05:6214:5005:b0:8ec:235c:7a66 with SMTP id 6a1803df08f44-90758d0d3c0mr59599196d6.27.1784168789618;
        Wed, 15 Jul 2026 19:26:29 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56c06e1sm206619606d6.14.2026.07.15.19.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 19:26:28 -0700 (PDT)
Message-ID: <95a47297c80c78345510cb5c09d9614841dcdb7a.camel@ndufresne.ca>
Subject: Re: [PATCH] media: rkvdec: use DIV_ROUND_UP() for CTB counts
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hiroki Nakajima <3na7nanana@gmail.com>, detlev.casanova@collabora.com, 
	ezequiel@vanguardiasur.com.ar
Cc: mchehab@kernel.org, heiko@sntech.de, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 15 Jul 2026 22:26:27 -0400
In-Reply-To: <20260712072652.2881919-1-3na7nanana@gmail.com>
References: <20260712072652.2881919-1-3na7nanana@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-bNkDQXvvPI7fGSpXPcBO"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-bNkDQXvvPI7fGSpXPcBO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 12 juillet 2026 =C3=A0 16:26 +0900, Hiroki Nakajima a =C3=A9cri=
t=C2=A0:
> Use DIV_ROUND_UP() when computing HEVC coding tree block counts
> instead of open-coding the same rounding expression. This keeps the
> rounding intent explicit without changing behavior.
>=20
> Found using a Coccinelle rule generated from the DIV_ROUND_UP() macro
> definition.
>=20
> Signed-off-by: Hiroki Nakajima <3na7nanana@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 4 ++--
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c=C2=A0 | 8 =
++++----
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c=C2=A0 | 8 =
++++----
> =C2=A03 files changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> index 87abf93dfd5e..ff3942f91c5d 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> @@ -258,9 +258,9 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0		for (i =3D 0; i <=3D pps->num_tile_rows_minus1; i++)
> =C2=A0			WRITE_PPS(pps->row_height_minus1[i], ROW_HEIGHT(i));
> =C2=A0	} else {
> -		WRITE_PPS(((sps->pic_width_in_luma_samples + ctb_size_y - 1)
> / ctb_size_y) - 1,
> +		WRITE_PPS(DIV_ROUND_UP(sps->pic_width_in_luma_samples,
> ctb_size_y) - 1,
> =C2=A0			=C2=A0 COLUMN_WIDTH(0));
> -		WRITE_PPS(((sps->pic_height_in_luma_samples + ctb_size_y - 1)
> / ctb_size_y) - 1,
> +		WRITE_PPS(DIV_ROUND_UP(sps->pic_height_in_luma_samples,
> ctb_size_y) - 1,
> =C2=A0			=C2=A0 ROW_HEIGHT(0));
> =C2=A0	}
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
> index fe6414a17551..d07c74679552 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
> @@ -261,8 +261,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0	memset(row_height, 0, sizeof(row_height));
> =C2=A0
> =C2=A0	max_cu_width =3D 1 << (sps->log2_diff_max_min_luma_coding_block_si=
ze +
> log2_min_cb_size);
> -	pic_in_cts_width =3D (width + max_cu_width - 1) / max_cu_width;
> -	pic_in_cts_height =3D (height + max_cu_width - 1) / max_cu_width;
> +	pic_in_cts_width =3D DIV_ROUND_UP(width, max_cu_width);
> +	pic_in_cts_height =3D DIV_ROUND_UP(height, max_cu_width);
> =C2=A0
> =C2=A0	if (pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) {
> =C2=A0		if (pps->flags & V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING) {
> @@ -275,8 +275,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0						=C2=A0 column_width, row_height);
> =C2=A0		}
> =C2=A0	} else {
> -		column_width[0] =3D (width + max_cu_width - 1) / max_cu_width;
> -		row_height[0] =3D (height + max_cu_width - 1) / max_cu_width;
> +		column_width[0] =3D DIV_ROUND_UP(width, max_cu_width);
> +		row_height[0] =3D DIV_ROUND_UP(height, max_cu_width);
> =C2=A0	}
> =C2=A0
> =C2=A0	for (i =3D 0; i < 20; i++) {
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> index 3575338a531a..3462d995d4cf 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c
> @@ -287,8 +287,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0	memset(row_height, 0, sizeof(row_height));
> =C2=A0
> =C2=A0	max_cu_width =3D 1 << (sps->log2_diff_max_min_luma_coding_block_si=
ze +
> log2_min_cb_size);
> -	pic_in_cts_width =3D (width + max_cu_width - 1) / max_cu_width;
> -	pic_in_cts_height =3D (height + max_cu_width - 1) / max_cu_width;
> +	pic_in_cts_width =3D DIV_ROUND_UP(width, max_cu_width);
> +	pic_in_cts_height =3D DIV_ROUND_UP(height, max_cu_width);
> =C2=A0
> =C2=A0	if (tiles_enabled) {
> =C2=A0		if (pps->flags & V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING) {
> @@ -301,8 +301,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
> =C2=A0						=C2=A0 column_width, row_height);
> =C2=A0		}
> =C2=A0	} else {
> -		column_width[0] =3D (width + max_cu_width - 1) / max_cu_width;
> -		row_height[0] =3D (height + max_cu_width - 1) / max_cu_width;
> +		column_width[0] =3D DIV_ROUND_UP(width, max_cu_width);
> +		row_height[0] =3D DIV_ROUND_UP(height, max_cu_width);
> =C2=A0	}
> =C2=A0
> =C2=A0	for (i =3D 0; i < 20; i++)

--=-bNkDQXvvPI7fGSpXPcBO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalhBVAAKCRDZQZRRKWBy
9FbPAQDvknjU5MBUBlBk+2NOWC1I7Q9Cjqj2M0AnwCfQTfkg5wD/Trt36/37q2Ks
fllOCGSBF7ly4N7X+HlKSf5YFnqQqgI=
=3mvY
-----END PGP SIGNATURE-----

--=-bNkDQXvvPI7fGSpXPcBO--
