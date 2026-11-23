Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467086;
	b=vRkjyzljbBCgB+r7Ay51/kBmQoeqTNn39tFwp66TR5BbkUwTCytNo0cKho2WbSS7ZByz
	 vDH8hddp5Y0NQw8AzB5pFQKtQ6fMxFaGyyBJKXTjr7cD6dsDNHLPlJret6fYjy9elj/3N
	 hKShJV/WWMBKQrlejOrPDcFbP/DTqGIlQUQPM1rRe1dkoxiFJTvR2XJOuQkophTBqGfWv
	 Ku8W1qu9L0rwC46Dht0tFoKcul183JjyZoQif1eVZgNEmSVNi+0aEL7Vk++6XeT8m39HU
	 0bCIwyqvxOF7f6VI2UZIJyS/z47KX+phZyVKviIkDB9oniryR2B9BERmVA9S8FNLeYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467086;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=Rnfj8P/89hZGG8JA8cSc7uOTWfh3tYe6K/ikKfWJdVU=;
	b=0lweQ9I1EOHoDpckm0/LBs1UEoAGUVXNhdAXI1eBh/g5xeFLrkuNvLOIYr+79SCHroSe
	 p8YsVU96J8FdlCAxWXU0M7tr5Qspnw4UxGPIUb2MovA4FEHemG/7D/gGreRFVrwO6VFUz
	 ZB0QRFqrzRziJRY4A+UalOUzbsqi2/hh5LOsVl0zCiDAxD9tR9qhkLkQEJerq219hOtfc
	 KwDICNdCXOMgCJAaafjbDXNBtwLdYarTPlAzbKAkXdFLj8UFNXCFaTtKF52t5VxN+E7pA
	 2mgz9Ro6gBr9dv+g05VQqCbm3/pzlIggx9FLOKb8RFX0BK4ES83+QPkWl4uZCimsgvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=UZGam3YW;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5F5606A31E;
	Mon, 23 Nov 2026 20:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D5F5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=UZGam3YW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795467084;
	bh=kDrM4gC4cGaNAY7YOiqyl+SIl6oSmR9kum2gtMOqZkQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=UZGam3YWzmE4GapanOJIUzrWE+a3lCYuGo0Jj10Or/26aEUImXB6k3PgCfGCfHzG2
	 z2zNVyvXi3pEdtBgz0sR9pk2l8gUGzAwFAUMeafnb1cPNUaCrtqtaGWVhSTVMRR7zc
	 3SijO7sSWPRdP61viGRb3Gegc6R/UzRq41aFl95UA6FtV8Q0wbotWy8q0cub0AFeXO
	 1Wrg4CTN7Ddy5DkFYW1dKiHyJEhP8BWdH0uXWr5c/PLLlSg+eHxCg0EaMu4VMRZvjI
	 Tqh+sf/2H6IouZHLgdx9j4OnE5rhWWFgV2pfTfjzWNlys7tFxaiGexTYhClrBKnncL
	 xUltB+CSto1nQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 071AD17E00C4;
	Mon, 23 Nov 2026 21:51:22 +0100 (CET)
Message-ID: <59d1ae17abc709ddfdc9608d1e744aa95ba7f2a1.camel@collabora.com>
Subject: Re: [PATCH v2 2/2] media: verisilicon: Handle VDPU2 decoder
 interrupts like the G2
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: aiyengar1990@gmail.com, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner	
 <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>, Boris Brezillon	
 <boris.brezillon@collabora.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 15:51:21 -0500
In-Reply-To: <20261120-vdpu2-errreset-v2-2-8f4ef55e6dee@gmail.com>
References: <20261120-vdpu2-errreset-v2-0-8f4ef55e6dee@gmail.com>
	 <20261120-vdpu2-errreset-v2-2-8f4ef55e6dee@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-NaJf9URqSAIJAeYjH5aT"
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

--=-NaJf9URqSAIJAeYjH5aT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 novembre 2026 =C3=A0 02:49 +0000, Arun Iyengar via B4 Relay =
a =C3=A9crit=C2=A0:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> Do as the G2 interrupt handler: ignore interrupts the decoder did not
> raise, report the error type and don't finish the job while the decoder
> is still enabled. The decoder disables itself on errors, except when
> its input buffer runs empty; a later interrupt or the driver's
> watchdog then ends the job.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 18 ++++++++++++++=
+++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drive=
rs/media/platform/verisilicon/rockchip_vpu_hw.c
> index 4bc1bdb41c70..d20f295b43de 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> @@ -391,10 +391,26 @@ static irqreturn_t rockchip_vpu2_vdpu_irq(int irq, =
void *dev_id)
>  =09u32 status;
> =20
>  =09status =3D vdpu_read(vpu, VDPU_REG_INTERRUPT);
> +=09if (!(status & VDPU_REG_INTERRUPT_DEC_IRQ))
> +=09=09return IRQ_NONE;
> +
> +=09vdpu_write(vpu, 0, VDPU_REG_INTERRUPT);
> +
>  =09state =3D (status & VDPU_REG_INTERRUPT_DEC_RDY_INT) ?
>  =09=09VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
> +=09if (state =3D=3D VB2_BUF_STATE_ERROR) {
> +=09=09if (status & VDPU_REG_INTERRUPT_DEC_BUS_INT)
> +=09=09=09dev_warn_ratelimited(vpu->dev, "bus error detected.\n");
> +=09=09if (status & VDPU_REG_INTERRUPT_DEC_ERROR_INT)
> +=09=09=09dev_warn_ratelimited(vpu->dev, "decode error detected.\n");
> +=09=09if (status & VDPU_REG_INTERRUPT_DEC_TIMEOUT)
> +=09=09=09dev_warn_ratelimited(vpu->dev, "frame decode timed out.\n");

My take is that you really want to know if these error are raised without t=
he
DEC_RDY_INT. BUS_INT is one that can occur (seen on imx8mq). I think you ca=
n
easily endup in hantro_irq_done() on a hot IP with this construct. I ack th=
e
different with G2 here though.

Nicolas

> +
> +=09=09/* Still enabled: a later interrupt or the watchdog ends the job. =
*/
> +=09=09if (vdpu_read(vpu, VDPU_REG_EN_FLAGS) & VDPU_REG_INTERRUPT_DEC_E)
> +=09=09=09return IRQ_HANDLED;
> +=09}
> =20
> -=09vdpu_write(vpu, 0, VDPU_REG_INTERRUPT);
>  =09vdpu_write(vpu, 0, VDPU_REG_AXI_CTRL);
> =20
>  =09hantro_irq_done(vpu, state);

--=-NaJf9URqSAIJAeYjH5aT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawSnSQAKCRDZQZRRKWBy
9Hz7AP4ve/5j20b9ak39jzktZWr6s64fYNfO4dmviULkHJM9+AD8DUz3Gq+dlS3Q
MKt3BCggHMsrVbvbGZq58hR9D0aaEwk=
=+YNp
-----END PGP SIGNATURE-----

--=-NaJf9URqSAIJAeYjH5aT--
