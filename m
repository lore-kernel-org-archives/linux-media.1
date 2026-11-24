Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795558611;
	b=AhrtcNOAkT2oGop440rvMf5lF/NRpKB/LrhjkQjWUYyQvFMBFKy0OHDskRP3CATT2jx0
	 RiJSLTrphC6BV9edNbacO0TX/Rrv2zN/maxAhEv/dPNe3SnrQHewBEsQzg6m3WJ796aeU
	 yvZ6GsIvX0srjvouboD/NxRCbpTVCytlxKPfnuD973lPXSY+ZLlFPJv9RUcRXHdIHGdNg
	 6kuzY3WO5n9QTeBrKya5qcrqcj8C1tkqPDtE9C3YPF+h+2n0SPY5isTa64a7Wzmrgsfr4
	 UQSI0o5KYrqMi8asUBgmH5p2zxmaHfC40w5rIZ0H0O7vHTrnS4IXsTMMS01d5w41svQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=Uhmi7vdLdSTBTBfiyTnnA5vkStcVEY8sN0rPcbiafRM=;
	b=MrqtoJy7CRq6h5nd3RfKk5M8mWab5Mo3ydqldmA6Q6t4NW2OwMbbd273Ek9VshWzD0qb
	 b34ngMA86QqLC09OD/FmNwzmotT/CFYK+RXjAZndy6cm+BUJE+NELT530nd5qRt692WyN
	 xKvmoMy0RVsFfF1OErI4lFq2w2LQZyRm6+YyMam1O62t2kFAxPE9K/NIacsY/IyPTdyf6
	 M+J7fl/6FCvt66j8tSpUNWtIQ5EWFq16DE3AxhKvqfCxBJV6wHShleWb/JEZ4/omw2yHf
	 MCZbXN6OjIUxKfvrHhQzPTpmkdErYAyBJ9zrvVz3cAhNd7fq0hBxJb/yoRcCheTuciw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=a3EZvP5O;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE12606A329
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 22:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEE12606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=a3EZvP5O
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-9214032a2fdso41505056d6.0
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 14:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795558610; x=1796163410; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uhmi7vdLdSTBTBfiyTnnA5vkStcVEY8sN0rPcbiafRM=;
        b=a3EZvP5OyowAiMtFRNJn08m3NhjGNxRg7uIjCQJAiDLOLA+8FctfDs3jn2KLTG+h1O
         2hDthh3ZjlvAk0RGTcTC7DFsEWzWATomdIit+FsIi5a8lP3BJ0PiEjpUbRwvm1u9Ea6S
         QtpdcQviakqrDzRYu8t6CWRkrkR0o2598OBWpj8ZgHBJO7dKmLYA0IruhH4qS1IYIXOp
         1IVyIO4zOvm4AsUA6rrt2DcZrqrs0xejEK8QQg0+oR8XV8tgXNST0WG8AhBKHnpHNFXa
         v5AdSj0L3dC6fYZDxTcFgI3VsAwlkLG47ZbE0YQ1fsu7HmnF416hH/35MvXcf9Q0G5FQ
         pLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795558610; x=1796163410;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uhmi7vdLdSTBTBfiyTnnA5vkStcVEY8sN0rPcbiafRM=;
        b=ODjRms9qqb6Ua5A8t4mosM+kwr1Sw5qGBbYtOeizpaOZS55QkteMkFnlKMZBS8LR31
         PhP3nTAQWRvArYt9Jq80Qm6yDvOP3RD2GYW5N4MjNUkDTGM1tcSS7ooZX7tV81AxJ/rm
         d7AotmsrN2DUDsh6Ja+8QRyeulPfxLxhJuby7NURlASAiKa/X2enK8JJQQ6QqqQGsvZh
         kRGfFDNDn6i172IHwVgpq+C+0uoyW3tcPTGqz7pn+0JeFJcZ9+DRLZNjYoABa5HZLLZi
         DheqCjmruxtLvv1yUw0OUVYtOm2Fuxfmw08GuZ1i3dBrsmzsyCzI8JtmdksSBDv50Uz4
         d2nQ==
X-Forwarded-Encrypted: i=1; AL+hErGual60AmnUcjjZJ/kKxrNbBzKW24i3SRkGGaxGbfqEd4Y09GekYb1v/rLm5lZhbSjDV4Ym5fiHJWX16Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/WTDXirOxHKVqtmNY+g3DXTO4BKMgpDFn/98JKCg/sfX4k4tW4
	prFGR/vrYLl61YpQ+ZNJcP050LLA6AC5WUuukQ3awS130AjC83Ja9QKX/jC32fqzU4g=
X-Gm-Gg: AZFdTZehmSx4jENBtDGSun5HBZXBfy2fGISIy8rPewAPHn9bovArvL9xSEYakF+/UMW
	AVLSnYloGoWMaR9BTAqAmxQeJRBJXpEVcqkIqOJF6P+iU1i5a928hk0ySk/d8KQlt0Wxro6iCWE
	8PWHzgeH/DXt7U1tPod0Id3SlIAMzcDPsVJKJksLJhCJYEdqqNqlfcfArY0I2kzYoMwgz05ryTL
	qM/xCxtl31fqCRxFzP6AjmboWslSvywX++KVGb/wmnlqDzrm8sDxJH+xu0DFGwLEm1M/ZcPrmwl
	J64N4YWx1FA9z+TliMZAKRjGmLpF1Le7ypP6ACXDuw1cQxwiRCuY2U4JS1w/cUogbGBlHt/rjCF
	SSg2bHuRuhHhqWPPrM+i7HIepvifBPViQsi6FEAwfkP1c9mm1tbwMeY/97nD6ZkYg6Q1rgoXy+9
	TBu+yldkwdgPHKKwLbVKGhMb8OJ5VS3PLDIzLg7Wa4XYlAMTbtU12KrsyVvR1I4H4gzKEDhXT83
	z2QfQ1kntyrl85KQfViZtWQj1pTwmevtysPJt7aqixIZnP7s69nUbMYtfH9OsOBULk8KcAXtNfN
	LLbE9Wx+OIXL12CQCEIA4XAd3XQeoiLQCVdPYNGLwdenceRElCMqYqou
X-Received: by 2002:a05:6214:1d01:b0:91e:f8bb:bfff with SMTP id 6a1803df08f44-92134a695bemr295012926d6.10.1795558609635;
        Tue, 24 Nov 2026 14:16:49 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bfe82dsm143924506d6.0.2026.11.24.14.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:16:48 -0800 (PST)
Message-ID: <4c54e652e8fb714600852a3028b892c6a292c6cd.camel@ndufresne.ca>
Subject: Re: [PATCH v3 05/17] media: v4l2-ctrls: validate vp9 tile_rows_log2
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sofus Forstreuter <sofus.c@icloud.com>, Sven Peter <sven@kernel.org>, 
 Janne Grunau
	 <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	 <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Date: Tue, 24 Nov 2026 17:16:47 -0500
In-Reply-To: <20261020-avd-v3-5-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
	 <20261020-avd-v3-5-85cbaa2125d8@icloud.com>
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
	protocol="application/pgp-signature"; boundary="=-fZhiUwItIuN4elZmSsKu"
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

--=-fZhiUwItIuN4elZmSsKu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 20 octobre 2026 =C3=A0 11:37 +0200, Sofus Forstreuter a =C3=A9crit=
=C2=A0:
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 922cf74c4eb8..384ff77771ea 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -638,7 +638,7 @@ validate_vp9_frame(struct v4l2_ctrl_vp9_frame *frame)
>  =09 * According to the spec, tile_cols_log2 shall be less than or equal
>  =09 * to 6.
>  =09 */
> -=09if (frame->tile_cols_log2 > 6)
> +=09if (frame->tile_cols_log2 > 6 || frame->tile_rows_log2 > 2)

Shouldn't this be 6 too? (log2(64)).

Nicolas

>  =09=09return -EINVAL;

> =20
>  =09if (frame->reference_mode > V4L2_VP9_REFERENCE_MODE_SELECT)

--=-fZhiUwItIuN4elZmSsKu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYMzwAKCRDZQZRRKWBy
9BA6AP9PS5poldHn0LERh5sldYW2P73wx+zTyuozNl+3ELVLUQD/aj0MPvIwO2sj
O8VuT9IjLVqFj9L0GOL8uRcAYapAAAk=
=/mpK
-----END PGP SIGNATURE-----

--=-fZhiUwItIuN4elZmSsKu--
