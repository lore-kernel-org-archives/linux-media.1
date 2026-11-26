Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795731997;
	b=zGpaH/AcOkd9WHjznyMHR+6oIoBikR7qgVUWxSbeu5IkSk8yLxLZFJcnVZdN2DUTuoI9
	 2xv0UktWS8gVgMK1bFW8VziPR054Wgw9btSatTqG06B7BgBZZC3X6dALhAbo6JTntmAf2
	 FGWTDPwhrHq6yzbR1wkvEc/NZkjfy9bLvoHQXcPxa/cl9wR8V9Hj0nqDLaf9jR0kJEdwX
	 7HASzr0YYRBrzWTZ6bnt/tUDQ1IUoBB7Onv0b2JtI7RyZF91z/ucPpoxrjCQthPT18AyJ
	 VceNPdvcvczsWUuccqWIXqeNvUgg/AGEvHeiDAUTLaGPihwndaeOb3YG+xheQ1JeMbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795731997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=DXV3jwg1vEpIFRKy3B1iiTGO2c9okEZN1fkPq1gh+eA=;
	b=uchesqk1hA0q+v/gL6ryrQV4R4INVpGK60AaEbTV/2bMkWNw2oB+oJ5tkaF8boAPZh66
	 Bjr4sur+XbNK237aHnM3My6Cn8cOBXUWLUJOR+YYXxtta8lIShbH1scTrPydMAmSMMVTM
	 /g4RPtpxpXPZ5aN6rKk+E2lV6likN1ALBi6i3BMob1Fzxu40v0F3I01CR1JFZCtcSC1MA
	 LNxXdSJOJYBw3nnxgfdvMTg1sVXNV5xizfrvxLbJ29LA+GsHlWiuDyYWi3MskgTeKg9WG
	 ARMblwsLcnDqb0AbOcMIChrm34b08d9IlrMpYLqIwtANRBHPlX7SYB0iKqe26Svpdrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cmjOsy9q;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6DA606A31E
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 22:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F6DA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cmjOsy9q
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9496577d4c4so821631385a.1
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 14:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795731996; x=1796336796; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DXV3jwg1vEpIFRKy3B1iiTGO2c9okEZN1fkPq1gh+eA=;
        b=cmjOsy9qs2WoFRV/0DQ6AkkCqNJ4/YpwpYv/JPvgqKUJPJs1rRfP1sXjPD2Bezw+Lg
         +5+nLqIlzz5nlcPe0sXo73Dej/DOrnmvnAueHttrZi6OJYvAxRCrdOcrFwixcx6JUQ+q
         n+3H2iFhvFbWmafMPVuv6R55L+a2hiU11msuvLEsY7gppItGalchjFZnG/ukwgFNfZV1
         2VsWKqseuOgIEexDc/8jTSITmiG13kW14MKcuivZhjmT60TeoKdKE4mWoK/8prEiCLpR
         6ZDQk0+7dMhEepvx8u23dnoD3Uqe6Qp8OUvu+ekKTuYQjY/ssCMnMQVbjK2sknjdeGSw
         tSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795731996; x=1796336796;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXV3jwg1vEpIFRKy3B1iiTGO2c9okEZN1fkPq1gh+eA=;
        b=OIC2Tb5OwX2oCeKfFIRR5sRmMkGQ+qVTIEzVALC2iMI0Pq2wxf7bzV/GSWh6O6D2wr
         xTOE4Gq3plS7JOhf3s3VxA8p5iWMWm+JAPDgRP/T+5oCAj5HICO+/OQe/IDvKF/G3Z/d
         k3fbVQhY+uVfM75rfpKyxjJICJya3LnwR6r88hpZ/Zb1/gHnla3SC5a5F3phqrM2XAN8
         7cMYCZtcvBuf0qkrdP9TcLcLy451TI4sbXpuBk6XUSHZMVrDPG53ITFHkw7DY6bA1fa3
         x2g7NSsoJsgbUt8Ps0KYxxmpcJHdkAhvUwGzlGFbPwK8fDZV1zjBIGEuktPkgY4gDsJX
         UI/g==
X-Gm-Message-State: APuU4Z8yI/m8uba/SxLFebpXvCT3heMvoGtVOQ738G8/svu2oJR8vHNi
	QxNQ5U+GSVKvciYH95NMQUhEIDHGJeMF9eiV04xhrQDEQML5CtOQ8cBhYnqqMK/tDro=
X-Gm-Gg: AZFdTZdLCOPYoaOQcaaqHv5qE7H/txCx80Jr4rJKjXl2oBopSZvka4/16KRG8gK75ow
	Zq2UD0NnPpRe7Qh5+yAj69ow3bJwIiUjuNj2+ySzVBUsNnNMUTsWmrJzSMGE1+dPa5ER9EjLWVx
	i/mwtsYGXG2ZalkcqQNZBuaSSglQXrYIZnIreEp/2aYsrEgFAXSjF2DUULyKoDNugAsPNGJDU2+
	IUViXcOCC5pAntu6cz0/DTXlVJmxKPnr1C2IPEDBTM2/UrG6vCAiX6QNzTLjqiqVnKDFAJPF1t4
	10y3892C3sHRZM0gYK1minYqhJn9fy1YvV1VMCOSQvsxHhfWqj25uzWoR+zja4MehF2YcJzeMnj
	jINbsaHivhV8RGBL3e67CitVQptbcEHorMpkaVtpGldcT5lW2ZSzrFpHBIcwoHJ/RwXmTg7q8xC
	AGKdTweqc9nA0sxSfg4jkqCbbV5XgE3RuUsYeWO1cAN+XoEA6NaQftFZBNg93fBEDTL+DNE7eL5
	FxhuryJUggdKx23rEZtudgKZ4QW/ajd3fDBwMO+GKj4qBL9Eye/bUQNdOdLvirrgRN8dPhmtmIp
	zE+q1AZ38OJm4mF2y9z+hmaX9M1g3+XILlqKnTP2VZf1J8imeIMRk+cP
X-Received: by 2002:a05:620a:372b:b0:949:70c5:c0ce with SMTP id af79cd13be357-949b35ac8e0mr4145462985a.19.1795731996315;
        Thu, 26 Nov 2026 14:26:36 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm1681287985a.14.2026.11.26.14.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 14:26:35 -0800 (PST)
Message-ID: <f41c7d6471f41d7fcc2109e14289e47091610822.camel@ndufresne.ca>
Subject: Re: [PATCH] media: sun8i-di: Don't sleep while waiting for
 coefficient access
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Samuel Holland
	 <samuel@sholland.org>, Hans Verkuil <hverkuil@kernel.org>, Maxime Ripard
	 <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 17:26:34 -0500
In-Reply-To: <20261104185930.885203-1-jernej.skrabec@gmail.com>
References: <20261104185930.885203-1-jernej.skrabec@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-i1ae5NoATxMPm6Cs3hN+"
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

--=-i1ae5NoATxMPm6Cs3hN+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 04 novembre 2026 =C3=A0 19:59 +0100, Jernej Skrabec a =C3=A9cri=
t=C2=A0:
> deinterlace_irq() calls deinterlace_device_run() to start processing
> the second field, so it runs in hard interrupt context. However,
> deinterlace_device_run() waits for coefficient access with
> readl_poll_timeout(), which may sleep.
>=20
> Use readl_poll_timeout_atomic() instead.
>=20
> Fixes: a4260ea49547 ("media: sun4i: Add H3 deinterlace driver")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/sunxi/sun8i-di/sun8i-di.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/m=
edia/platform/sunxi/sun8i-di/sun8i-di.c
> index 65bc426e5aac..bb90e0efa4d1 100644
> --- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> +++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
> @@ -163,8 +163,8 @@ static void deinterlace_device_run(void *priv)
>  =09/* neutral filter coefficients */
>  =09deinterlace_set_bits(dev, DEINTERLACE_FRM_CTRL,
>  =09=09=09     DEINTERLACE_FRM_CTRL_COEF_ACCESS);
> -=09readl_poll_timeout(dev->base + DEINTERLACE_STATUS, val,
> -=09=09=09   val & DEINTERLACE_STATUS_COEF_STATUS, 2, 40);
> +=09readl_poll_timeout_atomic(dev->base + DEINTERLACE_STATUS, val,
> +=09=09=09=09  val & DEINTERLACE_STATUS_COEF_STATUS, 2, 40);
> =20
>  =09for (i =3D 0; i < 32; i++) {
>  =09=09deinterlace_write(dev, DEINTERLACE_CH0_HORZ_COEF0 + i * 4,
>=20
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

--=-i1ae5NoATxMPm6Cs3hN+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawiyGgAKCRDZQZRRKWBy
9MOtAP4lcK/xSN3c+U7uRq10fy5MnpVhec9Sqx0NG67DpPGZAgEA8d3GOhpIEGXC
xicNBf+fQ7gEyX7c665ziueulfyRVAg=
=8HHY
-----END PGP SIGNATURE-----

--=-i1ae5NoATxMPm6Cs3hN+--
