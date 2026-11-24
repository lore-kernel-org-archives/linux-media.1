Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554932;
	b=WBCGf+jjzuH7d/suAftjqorwKgzn6LekBJrs1TH0UA0vBJ9EBvepmV5BA2rTtnw4b15S
	 sB28EHKXYIgBRH3AhxMiVUgEDgfmb0Bra1EvorB8fRyJm1laQRf1dfyaKcvmFZPk4mX5E
	 l6VrEoRS0EuJE+KW4MxDNCg3VFkuAlz5qs2biAZaOBa90az2E+/GO3F8q5FnT705E4xV0
	 6pJ96MfKanJroqHtjaz5uV4Tot9p/EiTuqyUgSWdCm3KJhTN9zOZVTQCN8RzVOnDQvtK9
	 ZSM/1uMW5dqCyxCpIGhKe9N02vKmjhhd1Y7NWr/JIh3UNC4phtT+UMcD36Vlyz0DLeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=z3il6KTodoHY8wYVpUPQzETMZOTZfRXZT7LjCWqHye4=;
	b=sbq6VYEp+jB0JUSrVEtB4zZLNZwdVW2y/K753lOSO9GLKlKyEkpiQjj9WIAN+t+CxdCi
	 PqU2MbH+7/hCaM16fkHGFCfs4jw2uz1s7fVRKSE33VbzwSbiHqAvapIQpAMT8ubkpmvsL
	 D5zFhIBnEZiTlpTKSndPG92ylaWn0TtK6bsbBlDh/tVci4jlRikeaxaxw7vngWwKzhYDI
	 DkVYBBqCSbhYOtviEMIfRnVxilcaGKbXmxQPBEZ153+Az7OwtupYOxaA8jAB0rzxF+r2S
	 Z56URUrgsAgNpa0fqds041N0Kex5NhhH4OEW70wKhYLUvLsrbj7odkp12MB4dpRh68Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=puSXUnKP;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFFC606A687
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 21:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCFFC606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=puSXUnKP
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-9496473b511so594448485a.0
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 13:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795554930; x=1796159730; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z3il6KTodoHY8wYVpUPQzETMZOTZfRXZT7LjCWqHye4=;
        b=puSXUnKPNaWw5KV2prk1L5c/5l/VutATzq7IPj3V/hPryxuM0WMgui1fAZBdjoY4Ux
         N+GRGsxR0gxhkOzUuuT0r4msBEA+Jf11WVCUj7cn5Gzrh7/0OvAkhmj3uGnBonMEbF6M
         MUn6N42fcRhPAyCYCdaAm+Yeyr0JM8/xFqiRax72IcEDamViro1aKBVtWAFIXl2KVFCO
         tPl4O+zPgCuK7Bc/s3LPXcq/6ZJaB/f3UnrjfxPw2kwZeSMmRgNAsfWSuoeBnHlqXfzq
         +BUE71y38z9NpPBWwGknthJjdsIorf4mWzsDNsAAB2ErAEmHuiCVYDEbgYEsC6+pKtxZ
         A7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554930; x=1796159730;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z3il6KTodoHY8wYVpUPQzETMZOTZfRXZT7LjCWqHye4=;
        b=LReAZurXVVHfsPfvVvoRF4pYjsEQlCTcCEw+GlR6uYbKQzADXUb1bqCDKKs6kqUu46
         Jlb0jMlY8em1IPxNII4ZpccEoTSXRjUqX+2ZhQPhgAZgJ6lLbO1NVzJWCQBkcFLkIwj+
         A9JdJWdmgZgZu70G5Ep+AbjZIkOID8pMuYuobX5Rq5rtisEWWuaw7RSAZ/MQALB67KaM
         AcNQCeNcvXIdhx9qOAZ2TuG2Kbli4DgX4p2w8aTH/sD9Wm1HS8/LSLkOzDHvwpRZvlXH
         JNKpiJt2fri8C8Fn+ru3cdqdBexIToJJb8ge6yH/1TgEif5+wiEpsIa55IF0G5ZagX2N
         3QpA==
X-Gm-Message-State: APuU4Z+zfBMdtQqRQ7ApgqyIVezsQvqd9HZA7a3ZabE5e9YsP+0hLkbl
	3PyPEEl+LWKWBPjn/Qr1cICLYgqDOYj6wwnByk3MYgV6pZ1Jd/FFfEhoZ85XBR+E5yw=
X-Gm-Gg: AZFdTZevXfax+0W0Yb9MHUghPZwwSUNwOD9y5guQnyO+zxR9OeF2RhP6QuJpxPBrQzv
	/lyjl+DhU/qyzalQjZ1QOU/n7z70jlhQnQ0R4D4bOaPxqrGaICQYxAiC6FUlR9BdFJpqWDvstUa
	9uYGJrGTvhJdfbPNErHKXyLJK4YBBTaejwKz5rLPgK5mJ0BnSuPqUvREVG+WjxpciRs7MQ/TlDl
	mg+fYwi7zxddU0QFwANSEh6qj0R9CFM1j7MFT9kAApYcwNmUP8FNxpy5RMhHisdRh2c11Ax/N8A
	8TAOoHnh4D9vUQ3EdnVxMqrcS+8TbivjdcGwTMxxgmKNk0JYXCQ+26l1bg+GToUFNUNXaYgz53d
	ymt60yFK5TPhWj6ffZFH+UHoBUrNyJaujasr17FUkerDcrMEq6WetHeJaz8ZRNG49pSJTRlc7BM
	+cUbwsYrAAWpzTgaV+sATUcymjiCpzAg3eB0mkWJn6LNFkzC6qdkj1ljtXKbOB4ZKsFx23ZBlf7
	OXiF9IRwMKs3ejluLftG5pre7gwoTiW/6ECHEEEtU0WupbjBbmfIwkyLrHMdZ6aGdoUjxJuik2a
	yP5aSApLGyuR4y8uZIWNSNbdJCSfFBdGF8THEHHZ9K+AWd9RkTeGD3Q=
X-Received: by 2002:a05:620a:4142:b0:945:d6e9:9a8c with SMTP id af79cd13be357-949baa0735emr2694961785a.33.1795554929441;
        Tue, 24 Nov 2026 13:15:29 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34a8d3sm1142411385a.10.2026.11.24.13.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:15:28 -0800 (PST)
Message-ID: <703f40d914dcb1a4e947e7b06a9e05e926fa9a2b.camel@ndufresne.ca>
Subject: Re: [PATCH v2 09/17] media: rockchip: rga: adjust get_version to
 return the version
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Philipp Zabel
	 <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, Guangshuo Li
 <lgs201920130244@gmail.com>
Date: Tue, 24 Nov 2026 16:15:27 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-9-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-9-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-9kBp7W93i2GBnXDBo1st"
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

--=-9kBp7W93i2GBnXDBo1st
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Adjust get_version to return the version instead of directly updating it
> in the rockchip_rga structure. This is done in preparation for a
> multi-core support to check that cores with the same compatible share the
> same version.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/rockchip/rga/rga-hw.c  | 10 +++++++---
>  drivers/media/platform/rockchip/rga/rga.c     |  2 +-
>  drivers/media/platform/rockchip/rga/rga.h     |  2 +-
>  drivers/media/platform/rockchip/rga/rga3-hw.c |  8 +++++---
>  4 files changed, 14 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index 4d7b0a03820a1..190104f3b2954 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -474,10 +474,14 @@ static bool rga_handle_irq(struct rockchip_rga *rga=
)
>  =09return intr & RGA_INT_COMMAND_FINISHED;
>  }
> =20
> -static void rga_get_version(struct rockchip_rga *rga)
> +static struct rockchip_rga_version rga_get_version(struct rockchip_rga *=
rga)
>  {
> -=09rga->version.major =3D (rga_read(rga, RGA_VERSION_INFO) >> 24) & 0xFF=
;
> -=09rga->version.minor =3D (rga_read(rga, RGA_VERSION_INFO) >> 20) & 0x0F=
;
> +=09u32 version =3D rga_read(rga, RGA_VERSION_INFO);
> +
> +=09return (struct rockchip_rga_version) {
> +=09=09.major =3D (version >> 24) & 0xFF,
> +=09=09.minor =3D (version >> 20) & 0x0F,
> +=09};
>  }
> =20
>  static struct rga_fmt formats[] =3D {
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index c24bc8e26b91e..2107d0f4a1659 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -860,7 +860,7 @@ static int rga_probe(struct platform_device *pdev)
>  =09if (ret < 0)
>  =09=09goto rel_m2m;
> =20
> -=09rga->hw->get_version(rga);
> +=09rga->version =3D rga->hw->get_version(rga);
> =20
>  =09v4l2_info(&rga->v4l2_dev, "HW Version: 0x%02x.%02x\n",
>  =09=09  rga->version.major, rga->version.minor);
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 0e62337f8dd38..0e854cdf739f4 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -158,7 +158,7 @@ struct rga_hw {
>  =09void (*start)(struct rockchip_rga *rga,
>  =09=09      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
>  =09bool (*handle_irq)(struct rockchip_rga *rga);
> -=09void (*get_version)(struct rockchip_rga *rga);
> +=09struct rockchip_rga_version (*get_version)(struct rockchip_rga *rga);
>  =09void *(*adjust_and_map_format)(struct rga_ctx *ctx,
>  =09=09=09=09       struct v4l2_pix_format_mplane *format,
>  =09=09=09=09       bool is_output);
> diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.c b/drivers/medi=
a/platform/rockchip/rga/rga3-hw.c
> index 46ba6d270f232..a80dd7609ccfe 100644
> --- a/drivers/media/platform/rockchip/rga/rga3-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga3-hw.c
> @@ -299,12 +299,14 @@ static bool rga3_handle_irq(struct rockchip_rga *rg=
a)
>  =09return FIELD_GET(RGA3_INT_FRM_DONE, intr);
>  }
> =20
> -static void rga3_get_version(struct rockchip_rga *rga)
> +static struct rockchip_rga_version rga3_get_version(struct rockchip_rga =
*rga)
>  {
>  =09u32 version =3D rga_read(rga, RGA3_VERSION_NUM);
> =20
> -=09rga->version.major =3D FIELD_GET(RGA3_VERSION_NUM_MAJOR, version);
> -=09rga->version.minor =3D FIELD_GET(RGA3_VERSION_NUM_MINOR, version);
> +=09return (struct rockchip_rga_version) {
> +=09=09.major =3D FIELD_GET(RGA3_VERSION_NUM_MAJOR, version),
> +=09=09.minor =3D FIELD_GET(RGA3_VERSION_NUM_MINOR, version),
> +=09};
>  }
> =20
>  static struct rga3_fmt rga3_formats[] =3D {

--=-9kBp7W93i2GBnXDBo1st
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawX+bwAKCRDZQZRRKWBy
9NsOAQCl3SgdekdUazoIM+9kZjOfYaaF7SSYgHlc1SnMx39trQD+P0z+r4RLdX3v
/WShUTo6ARwWWF9wVLmMB/rnLbeJ9Ao=
=rVxF
-----END PGP SIGNATURE-----

--=-9kBp7W93i2GBnXDBo1st--
