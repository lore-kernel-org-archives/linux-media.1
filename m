Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744993;
	b=0ZzuAqMq+n7tK5rJIFiQ6wOC76K1cCRilnYRsd3+/iocOcmyiSZtgA32ZPPBvd6U/TO9
	 iJD4ZwaNPsRb4AUxq6NQLi8f1FwYyRiYVS7sive16Se5fCffExZi8oFo24mljxE50sQPP
	 20vtKxzS/9GV7x1T89jBw6eB6FH/vPUWMAPKgbzIyl0/x1XHqouYUsbPybrDxKbD/e0Xk
	 +A4xzSdY7noNf6DyRIzeitxBAfk9uQI1XjKD83/WK7NB2bqlQP8Eenyk2+25DgfRg5o0F
	 HKRSmu0EnkZO9rS97iwb98diLlH8ukcbRZG2qf7EfZVcuJqTcauRJcfx8bLMpMd4rOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744993;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=lLNh+jxeRv3sVTVwrs4fKii6ta69shHr+3ndgvcGIu0=;
	b=l2xHOcImndt0Y3lS3kMz67YGU7XvqLmpvGL/B866ojAQQ/tzre4ixCN2CHd65ErLoojC
	 XiwLAXpV9wZ8wyZ6VTZI/7suIZu2hCj555Upjs9aDu3T5WeMLZ3v8X9YCAZ2YXSYAUSnP
	 u56mWJS/O3AtX7tInLZidkk1RqyJz/xyjPULlQFDnAaLIF6zvttrGQOMNCnwHyYvuhWU9
	 vJGVTHFtQmtEJtZriE8JmzyhBqkN1mFa8uo6c8CQldT5RxFn0MJPxnk07adn/6vDbj2wJ
	 Y4qYpTNWsRb2ZqBz4kEkruVXLyLXyOaCaYCQXNIy1U2oStDIY8GVfwRXdZ3jH6ieNGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qlyUNqIj;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5E8606A31C;
	Fri, 27 Nov 2026 02:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE5E8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qlyUNqIj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795744991;
	bh=BlfefGDf6j8A24L5AHOVwrRcE45Zzsule/dhSUU0Xn8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=qlyUNqIjemzc9gar8sX2/CDWXpMQ1kYXPRSmcn7plG9WNBEyBDvqgOOY2PDshnO06
	 QOyfatNgYupwwTOkDJHA60qN8rgeu0a2RJLKt1BsrQJTSKpJo1n+RcwEOW5Uu9EvF7
	 ondCbjZ+XcgVTUr7a1ohxsP7lyDNPtozdGXPwFbn+StjCzeN3MMUmNUfz/SBueYi21
	 fe0qnvJrESOQU9VlFBXYtt7T7hsX0AwDiEjB4X/y+gzSzizlyR3Uje7u/JhxMjYYFi
	 hAFF3XM6S3Dw3Xdx20icu85v9g3Y92Lb7xTtS2FzvEWt0PtYd7uZ7R9B9dtQXB8rbV
	 fxpVDPgdOoj7w==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3960A17E01C2;
	Fri, 27 Nov 2026 03:03:09 +0100 (CET)
Message-ID: <747f8cf069d6e49b6eec3313d590b144d6e710fd.camel@collabora.com>
Subject: Re: [PATCH v9 1/4] media: v4l2-ctrls: validate AV1 reference frame
 index
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de,
 hverkuil@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Date: Thu, 26 Nov 2026 21:03:06 -0500
In-Reply-To: <20261125122825.236422-2-benjamin.gaignard@collabora.com>
References: <20261125122825.236422-1-benjamin.gaignard@collabora.com>
	 <20261125122825.236422-2-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-wX87arLetM5DzqhRtmsF"
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

--=-wX87arLetM5DzqhRtmsF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 25 novembre 2026 =C3=A0 13:28 +0100, Benjamin Gaignard a =C3=A9=
crit=C2=A0:
> The stateless AV1 decoders use primary_ref_frame and ref_frame_idx[] to
> to find the matching reference frames.
> V4L2_AV1_PRIMARY_REF_NONE is the value of primary_ref_frame indicating
> that there is no primary reference frame.
> Iterate over ref_frame_idx[] to check if the indexes are in [-1, 7] range
> like described in AV1 specifications.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> changes in v9:
> - Split core changes and drivers changes
> - Add V4L2_AV1_REF_FRAME_INVALID
> - Rework checks in validate_av1_reference_index() to be sure that
>   all values of ref_frame_idx[] are in the correct range.
>=20
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 30 +++++++++++++++++++++++
>  include/uapi/linux/v4l2-controls.h        |  2 ++
>  2 files changed, 32 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 6e751a043a21..e707897e36fd 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -817,10 +817,40 @@ static int validate_av1_tile_info(struct v4l2_av1_t=
ile_info *t)
>  =09return 0;
>  }
> =20
> +static int validate_av1_reference_index(struct v4l2_ctrl_av1_frame *f)
> +{
> +=09int i, idx;
> +
> +=09/* The valid range for ref_frame_idx[] values is [-1, 7] */
> +=09for (i =3D 0; i < V4L2_AV1_REFS_PER_FRAME; i++) {
> +=09=09idx =3D f->ref_frame_idx[i];
> +=09=09if (idx < V4L2_AV1_REF_FRAME_INVALID)
> +=09=09=09return -EINVAL;
> +=09=09if (idx >=3D V4L2_AV1_TOTAL_REFS_PER_FRAME)
> +=09=09=09return -EINVAL;
> +=09}
> +
> +=09if (f->primary_ref_frame > V4L2_AV1_PRIMARY_REF_NONE)
> +=09=09return -EINVAL;
> +
> +=09if (f->primary_ref_frame =3D=3D V4L2_AV1_PRIMARY_REF_NONE)
> +=09=09return 0;
> +
> +=09/* If set primary_ref_frame index must be valid */
> +=09idx =3D f->ref_frame_idx[f->primary_ref_frame];
> +=09if (idx <=3D V4L2_AV1_REF_FRAME_INVALID)
> +=09=09return -EINVAL;
> +
> +=09return 0;
> +}
> +
>  static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
>  {
>  =09int ret =3D 0;
> =20
> +=09ret =3D validate_av1_reference_index(f);
> +=09if (ret)
> +=09=09return ret;
>  =09ret =3D validate_av1_tile_info(&f->tile_info);
>  =09if (ret)
>  =09=09return ret;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index d17e41d51d2e..f21f00fd5a84 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -2940,6 +2940,8 @@ struct v4l2_ctrl_vp9_compressed_hdr {
>  #define V4L2_AV1_MAX_TILE_COLS=09=0964
>  #define V4L2_AV1_MAX_TILE_ROWS=09=0964
>  #define V4L2_AV1_MAX_TILE_COUNT=09=09512
> +#define V4L2_AV1_PRIMARY_REF_NONE=097
> +#define V4L2_AV1_REF_FRAME_INVALID=09-1
> =20
>  #define V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE=09=09  0x00000001
>  #define V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK=09  0x00000002

--=-wX87arLetM5DzqhRtmsF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawjk2gAKCRDZQZRRKWBy
9L8bAP9kLb6DFRzjOud0AdC2YPyZZQq2Cgedgv+EsaWKV3GZMgEAqn1TLGshOVRg
Mnbc58ltgsXeHDNL2B07C6VsTYV9fQM=
=aB01
-----END PGP SIGNATURE-----

--=-wX87arLetM5DzqhRtmsF--
