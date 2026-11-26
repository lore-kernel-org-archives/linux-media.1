Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795732797;
	b=tt9pgTN9QM6kaRXAxEEA+osijsfg6qKO2KBFl6rLkLwk5FY++vm57B2VbVDuSV+Xt57H
	 8L6pyukSEn7GPatffN/3/x9lAY+reVUX8dje/ukGmUg4oGjHsRONy9zqRLRe/H6/uPcNv
	 O2Sa8w2EXeW8L92i0k1JUkkZyjfj6Xz4duM++NO//dsC67BjESIMd14Z6dYkL0PCUuDb+
	 MNbRul/vpLR7wb/ODNoBFnJ1OLKEFK5TIemR/QcsWdknZ1O1JbvW933UeW5dvlrlFfRk6
	 uhmwwugDuflrZqzBpx9UpZgBw/DUqLkRxt19nPolNtNhGI8QP8RnpcDr16rrE5bvLfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795732797;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=qHZSQgp+ZGSrefrl/qFSuVdRUTJkF4L772VuAEgGZS0=;
	b=iToAomjYWS1UWaJpC424XCud6cj7lKb0UDWI5Shujv4Gv7Xe+d0BYhYY1/xfACwdClQA
	 J9eBQc6vmmmLCv9rXtqqMrAE2U1qqvYkt20k1Km5oBMco1T3qYvs3TxnyU1a77yNA6u+z
	 0Swg8x0gFSkZ3pvUMIThLowzYBIT+0TYce/U1HZHiKS8aEzWWgCQwU4dw5i5AIMqGqyjg
	 pBD+wRWrnmzTT+2c4Wt3Oxsks2RFoqx0EHu9Gl/asJWkIfL0iePAa9Gb5V6KBOb8yy49F
	 gKFvI/DcJd+8hOyp/1fhWNWTYC+InneY5Yb5TUxUA5f8HoXHQdmbzvpjX4o9Bq7LEkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=M9qESV1T;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94038606A321;
	Thu, 26 Nov 2026 22:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94038606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=M9qESV1T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795732794;
	bh=LvFMCCC7vYA0WRTmw7yaSVoqNSLrrtzP/zmD039djFY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=M9qESV1TneP491akknSQldHyUKeqsmvePtINaq8qZulgUEXUaTh60cVqC/540GeXA
	 MhPTiKP8qCot8MrOz1li1DMaMhfxozFWL2avyWLKp/yvkmq9sN2kd9zOeWDDAlZvYd
	 Kt8elf40RubUyYmUlrjgY5DedjUjyHGdKeCZ7YK5doXXR5qj7XngdnjSBUS53oXPjC
	 qwNbAs0nO+VtqAFcOhLxnlXfc44KAkjbT74lSTTcdqk6HDfBcZ8w2f/qq0dP/vH9Ka
	 sYmh2lsCqlvEzYBtd0gYnJCRFI/Phk/brDKTF9qJSLpfe9Dxya4vOenoqYlQx1VFpC
	 VjsMwk8vU+exA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E4F517E0DCD;
	Thu, 26 Nov 2026 23:39:53 +0100 (CET)
Message-ID: <bf4467491ed1fefd634911530bf19b5e428a300f.camel@collabora.com>
Subject: Re: [PATCH v2 10/11] staging: media: cedrus: h264: clear the DRAM
 buffer sizes on start
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 17:39:52 -0500
In-Reply-To: <20261109175016.42061-11-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
	 <20261109175016.42061-11-jernej.skrabec@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-DIoTfJOE3v4BowFGg5IO"
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

--=-DIoTfJOE3v4BowFGg5IO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 09 novembre 2026 =C3=A0 18:50 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> Above 2048 pixels, the H.264 decoder puts its deblocking and intra
> prediction buffers into DRAM, and stop() frees them when their sizes
> are not zero. start() only sets the sizes for wide pictures and nothing
> clears them, so a narrow stream after a wide one on the same file
> handle frees the buffers of the wide one again. The codec data is also
> shared with the other codecs, whose data can end up in the sizes.
>=20
> Clear the sizes at the start of start().
>=20
> Fixes: 03e612e701a6 ("media: cedrus: Fix H264 4k support")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
> index 97958ceee8d1..e7a3bfbc3531 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -573,6 +573,14 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
>  =09unsigned int pic_info_size;
>  =09int ret;
> =20
> +=09/*
> +=09 * The sizes tell stop() whether the DRAM buffers below were
> +=09 * allocated. Clear them, as they are only set for wide pictures and
> +=09 * the codec data is shared with the other codecs.
> +=09 */
> +=09ctx->codec.h264.deblk_buf_size =3D 0;
> +=09ctx->codec.h264.intra_pred_buf_size =3D 0;
> +
>  =09/*
>  =09 * NOTE: All buffers allocated here are only used by HW, so we
>  =09 * can add DMA_ATTR_NO_KERNEL_MAPPING flag when allocating them.

--=-DIoTfJOE3v4BowFGg5IO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawi1OAAKCRDZQZRRKWBy
9JLDAQCY9nvwXakP5rK1ZSCdsq/tton1rjmCPvOqGBQwxsAkJgEApQCaKxATUqDr
oi4UrAEljUMab2bf+2jLF918X/Q1aAs=
=s/wX
-----END PGP SIGNATURE-----

--=-DIoTfJOE3v4BowFGg5IO--
