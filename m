Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109801;
	b=3+nPdr1+5n6HfVJrbhHlaTMYU0mPv7BDi4B7kowryF7d/qylHXNtSIPz0Xspq/hpZ8Kb
	 HTVsrT4lOfVXQr+LuVLRSePOv9ng6nQUuSwi7KgKs0+7krC+aHDgJPADxYdnhXazWNlWI
	 gB9gAigeKF5CfGGh2l4TKY/HoG5I4JZZtYXqXrmfNOyDbQGmtnnXwgaw5ySy5pNGQeaED
	 H26oiSUXszVb5XEagrNMid9cu9UGAL1vLgBAA0Eh8nu0o3G7baXK1LIiJ6S7cF3jvYULx
	 jX59AWaao5iw0NHqJ87ndDb0VwINQWuYLG8hf+RIfy0UINFWCa5W/TyO+TKkpt03kkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109801;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=HjlB70ziaFFzKVojaweJGR9z0Hpe0lR9xVGQfY7mO5c=;
	b=NjQqdCVIZzmpoSQrDKkokCRdLDAokL6VuZhXzanzrF5zqAz04hSUFwdYBEeKdmL1JZdR
	 /VlUKLyhQyloem/vzcAckSsTRqV6HlLix2WzSxGy2GzE2BV15M7qMN7dHeK6HXhXXtlVU
	 /s0QH6ahaulKFJcw1xYmNCPctad6tFXNkgpsL07nCmdFcrakHb5Fbore1UH38CDoWwq3I
	 BejQ4kplg8aV0Lz9Ly5XLasHPBl3jfvXEonRPMOVk8gPf9i+J/K2ndc0xbrVPFroUPaUH
	 MBygnhEGS17nUI7hjxupWY10fVGSsRCMep+aSuwihBcErijzmbskb1ih6jNI5jTexLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=On3g1GPJ;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A46606A325;
	Thu, 19 Nov 2026 17:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01A46606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=On3g1GPJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795109799;
	bh=70HVZUPGqXMKV09Pe1d4tr5mwBcytmv3D4PnTjpYVnQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=On3g1GPJlxtQfX+Jx57i+sm3y4dKIBmJa1fgolsQzyPI0gJWeEOYBVspwIFTUnBO+
	 WiWbq8yLJmn7dkVoH3ZwjdUccAyNVtTP9GRuSkVH40PvmlIxI0OUqrZ/I7b82k3aWw
	 uU2EKz2sfBTQ08XJbt8yCvRW5GliZuz3nHp/jPTwneaeFBLZetxZAvTvCfYR7tFA8T
	 QPhNeWzuA8+ZucVPIlc11qKTLm5ikTood3Kwt62yQXfi4dBnEQv2aRamv3Fy9OHTeM
	 MKigir+Kt6//kFNwN4EPtZ24AicR9pkkq3DvnC3UjrtoO3mreeE9mv4pdjq0akWc30
	 jGpeGsCOEDT5g==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0EB6917E0406;
	Thu, 19 Nov 2026 18:36:37 +0100 (CET)
Message-ID: <d3eccd8c04656a46287a221b3b4f22427b21a74c.camel@collabora.com>
Subject: Re: [PATCH v2 3/5] v4l2: export v4l2_m2m_set_max_parallel_jobs
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, 
	kernel@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 19 Nov 2026 12:36:36 -0500
In-Reply-To: <20260810-rkvdec-multicore-v2-3-986f89d22cdc@collabora.com>
References: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
	 <20260810-rkvdec-multicore-v2-3-986f89d22cdc@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-HbCW1HCFzZ2LrR708RNR"
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

--=-HbCW1HCFzZ2LrR708RNR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 10 ao=C3=BBt 2026 =C3=A0 11:22 -0400, Detlev Casanova a =C3=A9crit=
=C2=A0:

I know, its straightforward, but its not even signed off.

Nicolas

> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-=
core/v4l2-mem2mem.c
> index 14ac9c85803d..f6f8864f23d2 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -128,6 +128,7 @@ void v4l2_m2m_set_max_parallel_jobs(struct v4l2_m2m_d=
ev *m2m_dev,
>  {
>  =09m2m_dev->max_parallel_jobs =3D max_parallel_jobs;
>  }
> +EXPORT_SYMBOL(v4l2_m2m_set_max_parallel_jobs);
> =20
>  struct vb2_queue *v4l2_m2m_get_vq(struct v4l2_m2m_ctx *m2m_ctx,
>  =09=09=09=09       enum v4l2_buf_type type)

--=-HbCW1HCFzZ2LrR708RNR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav8zpQAKCRDZQZRRKWBy
9GK9AP98G/5cb5mSz5u+GfGt5pvGOBzzHSnYuGWZ68fzUnYjYgD5ASll1cl3d4qB
A0xqVBk1WEGNmWwBqXyfwlPLaxtdzA4=
=/Xbu
-----END PGP SIGNATURE-----

--=-HbCW1HCFzZ2LrR708RNR--
