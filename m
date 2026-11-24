Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795490991;
	b=3iRa6oQF7fxvcDKgZwIJN4OdvrvywYum7Vn5ucixiMZCPF86tgzsTStzbwH6uyxxurtb
	 Dgle4tYrramnlp33LeRzZ1+9wreFANfJ+NXn/iIDM6THgPLlQONcOKbnxXdcmvlFKpnl4
	 VDwYiVPjw9YAnkOZVOSJ8tFh5Npzg3sNaMZBLi+wqtRoGrRpoVxJlyPvTv/0Sbx0W4amt
	 iVn1eVFsH2ghFoFTAA8/afuNyerQjTGLzrUq8iVqIOdj0ZgXIQQYAz0bfKfaZ5D+ApteX
	 Q/vRa0NKBuURMdMhv42/bsJgqW+Sj9qi6Azyd/D9P/xHI0ctR8kq7JUIqgXEuyfNnMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795490991;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=DSQmc5aIPemsJni2zcoOjeC4l0Zh0uN0ZH3xEr2N/tQ=;
	b=RGCXy6dXP5cuVvjdlXybkwRinUYHfrTR6Nw2OlJZI6W+qKe8xSbX9hQhv3ZOl/fIPtCW
	 uXnSLYzOykZe34fb59wM44Kgav7OHF15TnGLfLZjrnM0Hg+EP0OziNW8JzXXFCtNrDxsZ
	 5d/I/oUKqsY1BxB81pR/IiB68i/IlZwq3XflYXfzuXn2da673g2YZk0CgScTf5r+4RoI3
	 hOzOuKGuYRtFx2EHfA3Bs2OStBOlDT4wXmIEqxdzvOI3C4S9iV2ZPpH1mmD21Pb5k8v04
	 rI8OEu+5wIRVJQGN2qquffHyFjjLl7k6NvRsZ4K/YOnTya2kJdPFvKA/EZ4S3D3yIgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=p7oOiQxe;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7305606A332;
	Tue, 24 Nov 2026 03:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7305606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=p7oOiQxe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795490989;
	bh=K6CKNHBB/6nIByrcNlVLin6OSGcLyJKfs408k09+GIg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=p7oOiQxe6o5rSYcFmeTStXLatUrF0XkdFUsdgpV4wb3qosWtaYHXPHsRW0vmNcS+f
	 JvBB9GfaGU8odS0VNyG5XTn75ziLGACDZJ+IBE0JhraOn2rQXLz1SHYhNpzAalIRoo
	 AXgIx6oOeG0PJDoMb1cnQ5QFIIDxMpkCv+0SczREwur3fv/PXCVymBLrRWVAqIUEtZ
	 4nrvuh0x9Sj0F5ch44q4yd4yCJvV4G82CSLesKWMXbrAHmtfdSHk5uRVIzBPKjTrNO
	 4PEpDZSLnE7OjRMTOazrBdIyFiGPMGWUUQqeCrZzYivmYs/34CqywIOZMPEfY4cYXQ
	 XYsTcBsqaWVsw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7BB8B17E0CD7;
	Tue, 24 Nov 2026 04:29:47 +0100 (CET)
Message-ID: <9c7ee6cfa9f4923756ce6355ec20fa8ac916b9ff.camel@collabora.com>
Subject: Re: [PATCH v7 1/3] media: verisilicon: AV1: Check reference frame
 index
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de,
 hverkuil@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 23 Nov 2026 22:29:45 -0500
In-Reply-To: <20261120143135.71134-2-benjamin.gaignard@collabora.com>
References: <20261120143135.71134-1-benjamin.gaignard@collabora.com>
	 <20261120143135.71134-2-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-r0oKEOPZfbeMIZrTquJs"
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

--=-r0oKEOPZfbeMIZrTquJs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 novembre 2026 =C3=A0 15:31 +0100, Benjamin Gaignard a =C3=A9=
crit=C2=A0:
> Make sure that reference frame index is valid before using it.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
> ---
>  .../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_de=
c.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index 2a145433e6d1..5da59104a966 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -121,7 +121,12 @@ static int rockchip_vpu981_get_frame_index(struct ha=
ntro_ctx *ctx, int ref)
>  =09struct hantro_av1_dec_ctrls *ctrls =3D &av1_dec->ctrls;
>  =09const struct v4l2_ctrl_av1_frame *frame =3D ctrls->frame;
>  =09u64 timestamp;
> -=09int i, idx =3D frame->ref_frame_idx[ref];
> +=09int i, idx;
> +
> +=09if (ref < 0 || ref >=3D V4L2_AV1_REFS_PER_FRAME)
> +=09=09return AV1_INVALID_IDX;
> +
> +=09idx =3D frame->ref_frame_idx[ref];
> =20
>  =09if (idx >=3D V4L2_AV1_TOTAL_REFS_PER_FRAME || idx < 0)
>  =09=09return AV1_INVALID_IDX;
> @@ -1262,6 +1267,10 @@ static void rockchip_vpu981_av1_dec_set_prob(struc=
t hantro_ctx *ctx)
>  =09=09rockchip_av1_default_coeff_probs(quantization->base_q_idx,
>  =09=09=09=09=09=09 av1_dec->cdfs);
>  =09} else {
> +=09=09if (frame->primary_ref_frame < 0 ||
> +=09=09    frame->primary_ref_frame >=3D V4L2_AV1_REFS_PER_FRAME)
> +=09=09=09return;

Just returning does not abort dec_run() and will lead to triggering the HW =
with
partially initialized data. Either this should lead to some default cdf to =
be
picked, or we add a return value and check it in dec_run().

May I propose to validate these once once in prepare_run()?

> +
>  =09=09rockchip_av1_get_cdfs(ctx, frame->ref_frame_idx[frame->primary_ref=
_frame]);

Here, the index passed to get_cdfs() is not validated and will lead to out =
of
band indexing inside that function..


>  =09}
>  =09rockchip_av1_store_cdfs(ctx, frame->refresh_frame_flags);

--=-r0oKEOPZfbeMIZrTquJs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawUEqQAKCRDZQZRRKWBy
9BS7AP9tpWvgllrDuIS5S+xmIBzE4BP7i354pNZrwWjzbuk+6gEAvmQgQPNwLXRA
b84TQfLz4hIl4nxameVuX0K8ikoZAQA=
=zmP1
-----END PGP SIGNATURE-----

--=-r0oKEOPZfbeMIZrTquJs--
