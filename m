Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104066;
	b=rHC32w00hhNObT8lel04YY3NnA3eQIVHg8gPYTo73KmsdReHu03qyWeP4Jkx/jTG8K/Z
	 Y0ARSn2IWTITJOzfmEt09Cap7pXg+np6WlI2X+d9F21zejqNhVQ9HFtZCPzUUXJ1aP8Y/
	 HU0shkYANZCYxPEobwfkDA/W20iAg1SsJUy/ENw/zx0UVWWTetO6s7TEYDlCQpyHjhQZV
	 DqNOHqtJjQ0ZE2Sz8Wij7BJuC32SzrMXF587/FGoALdzVcm37T75QKQjIzTGwaFALcyae
	 OckK1V2uf/jejO3yyOY028zk/K/VV1YUQcOtkO5QAz1PWPeeG8BL78BHcM+0W+o27fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=KfDm1ombW4h++zCNnSHkepgC1bowgwnhqlH8xoC2Q4M=;
	b=pvsvppopALWhRLEuIrYFZOnIBhcrnnzq1UdZUCBths5qKsp5hzT2h9lESIVpE66Inh1Z
	 e0Ishnd8+fkRBjYHQnINTUhpJaOevOp/R8eXjaZnrXz9NSrifQ1pchRfpV8HaIOWCK6xX
	 nibko0ExMdo4Vr7sczSIDlUA0No99QeeReKVeuVfSGPYkQ2F+eGwLnM9FeOPPWk17ePBt
	 ixS8PEyH6JVCUMhw3NWufCaSzN8KxzHUB9UDZyVSZMEyLiiBaHJGIGzLbs8K32Mrk4viA
	 MBSDQF36WpLYAGG33rBS+e7NkrieeSiBAerVXmmbOA3pMp9URVC0CJDZStNYff/Ydpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tmXA3f8N;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705A8606A324
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 16:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 705A8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tmXA3f8N
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d28f75d62so414315566b.0
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 08:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795104065; x=1795708865; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KfDm1ombW4h++zCNnSHkepgC1bowgwnhqlH8xoC2Q4M=;
        b=tmXA3f8NwhT3z4gxbSh7QgwAAEJx1ktGA+D7J+dcvtJbMqMzR3KBITVFgdDBU4G6sR
         JSrIeOBO+Ggz6kAP7jSa/X5TFVmo/EmIFIBFp5YjTrpAz9kyU7uQvKYZJKUpP/UHeNAY
         px95itLlLTW6KnaksDRgTn4uf/i4VzoE1HhUcDc2kFkHcsJ5W+rQLOmMD5HTjwjwvMWv
         WLImbN61ePjj0ks27IlMBDAjkNbsgKqdO9SOnUCPvER8T5JfsBGOUXedoP3tho3RH0MK
         BikBvsQqoY9vHLoZO7ua6DnoyAxLw1xPQrY/VE8deK+f4yNamwJ/mDyqKGp7xPdGWRJi
         f6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104065; x=1795708865;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KfDm1ombW4h++zCNnSHkepgC1bowgwnhqlH8xoC2Q4M=;
        b=pWXyH1IRnKS1hmEiKVEzGSkcBx6iJAyChZjiAUXeN1NY1rg6weVy/zeVEZq+/5xJjL
         7kuYsML6bFu7dqeBL1rOVQB15yZy/dhsgY/BDzNNjDUQSpNJBWIzPJn2HRZwIfDiQ+VB
         Lye+SJlf7J8yrSHByHG9X5T1WGGtgLNSs0YjOf7q+njd3skdOUaY6M32Us2R0ZcGd3To
         bewxhsn7gg6J2RAetoO9hzxyLIPCMbttTEQTn1lWL/kozpHT5BcfX//H/6k4TSQwUa1m
         aVzvu5nt3Xw9Fw+Almi6+SCHmOW3Q2zRIwsYQISgXZ8N27gWQk+Kt5T3v7kKeQeMZQGh
         Y6gQ==
X-Forwarded-Encrypted: i=1; AL+hErHbWq3eeI+2RTryozcuSaAvfPOva2XR2TEIuodwbaeLC/9B6lE3DgMjJ/5PElFE3Pis5FA/v2lTTzssUw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+DhPVDbD1HOB6gnVbyySG/Z6gBWi8NRJxGuSW54x9e5/t37P0b
	lnqOvzt6S959waJgDxk/ncV3B0/MAfHMSy+ok103F1wteXDYONOO/O8XCNz5F1PKlfU=
X-Gm-Gg: AYBFou0WYGLnN8q6KVM2cViWtNvHkYHm5TCQyAsYjFt4Ii8jpRRR4G1JL/WCNhFUQma
	iIRe9z71cIsdjkPeL2AejBAMpaGS/4k+9ApSjtWDKZdUSGbJlaW8hz+zrJjVU5+y5xnekJIeJue
	yLxMYcmyLCyU3DLPquL/X8X9qARmWhXmh5TZ8sEroB1tByRajMdlE1ltx1Fqi1UGIj/L1OKAmys
	1+C6zsKEPVSTNZtSWb6he1rMIYacM4YUM20CsfLzGCZqGrJ1QZSb2RdkClqKbILuQyVi08fNc0m
	QWRovE3cu8nMmJ7x5L4snVKbfEllTnWp05/7zt6eBOWU7Pn10VIhdvCn7JDBIKJMoZpoLcdIExe
	u1j2mm5d/XL+DOsXTZHJ0pTBga/3YIZFt56kAZYej84n3Oxv+a80PKR4cKI3X+yHph/9FHL5vRy
	caMnGLI+wEM9to+GLDoZ9AQLmDUcbxOB/6gLHEpqkk6OmD88274wiQSmkibrSXOY/pqXqkLt8zd
	plWWoSAdD2sK0ThSzqcCpGkLrRHOEsTt6R5XJRw6akZMo7YYPNv4N4ZJv+dQJjr1KQEBIqei/gK
	EYmqYxD2I7X3nXtLKOIAKxR5vYd3ZYUhfmyK7NxpefdPTfY7lPHb6eY=
X-Received: by 2002:a17:907:a4cb:b0:c4c:ddd1:cffa with SMTP id a640c23a62f3a-c513ab48b7emr32560666b.29.1795104064176;
        Thu, 19 Nov 2026 08:01:04 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdee81sm9308166b.66.2026.11.19.08.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:03 -0800 (PST)
Message-ID: <41e428a6fcdcf3d0c10cada8743231797b3dd5f4.camel@ndufresne.ca>
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sascha Hauer <s.hauer@pengutronix.de>, Sergei Khomenkov
	 <shomenkow@gmail.com>
Cc: Lucas Sinn <lucas.sinn@wolfvision.net>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
	 <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 11:00:59 -0500
In-Reply-To: <85353f59-52a0-446d-ace3-65e2d03d0d0b@pengutronix.de>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
	 <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
	 <596F6C9E-4A5D-4AE8-8D26-7A7247050D7D@gmail.com>
	 <85353f59-52a0-446d-ace3-65e2d03d0d0b@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-sAMgqgjjNcbq4UuGGMyk"
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

--=-sAMgqgjjNcbq4UuGGMyk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 18 novembre 2026 =C3=A0 14:27 +0000, Sascha Hauer a =C3=A9crit=
=C2=A0:
> > Would 3 bytes per pixel be acceptable as the default, and as a floor
> > for smaller requests, like the 2 bytes per pixel floor in 6/7 of your
> > hantro-based v1? 4:4:4 at quality 100 would still not fit, but the
> > subsampling is not known before the header is parsed.
>=20
> I haven't been affected by this issue lately, but saw it when the series
> was still based on the hantro driver. Yes, I'll change to 3 bytes per
> pixel next round and make that the floor of sizeimage. Would be nice to
> have a proper solution for this rather than either wasting tons of
> memory or risk having too small buffers.

The hantro HW can run in ring buffer mode, that forces us to copy, but I th=
ink
you can then perform decode without actually having the entire image in RAM=
.
Would need some experimentation. We probably don't want copy to mmap + copy=
 to
ring buffer (double copy), and V4L2 read/write are deprecated. Note sure wh=
at to
propose really.

Nicolas

--=-sAMgqgjjNcbq4UuGGMyk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav8dOwAKCRDZQZRRKWBy
9HpfAP91JjxhDbtoQ02FbQ9AFuc/QS5L4xa8oYqNcrceAeaDzAEAtc4iVSLgSAv/
fkehBAsK40dvdlTFZHBgCbrfEIFuTQ0=
=0Ehx
-----END PGP SIGNATURE-----

--=-sAMgqgjjNcbq4UuGGMyk--
