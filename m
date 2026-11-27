Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749254;
	b=sVnMVikZbtGzk4VPSnxrO6zode8WZLbU8yWmM/eVoritSDA0dAVhEdKKiUcpZ7QxDZg5
	 NngIDaM9l0VO6qPoXewawJbT5tpUTzCnW+vXDmT9d/ajE+EbE83Dtam9Or8eNwQtSV+gh
	 zMdy13plPnwy5Q0saVqo1pmgxcMJ393tHpvKvRMOIcxTRbBSW6RSUPwWuM2P6jClaG251
	 AE78DaDPAAdWVyaS86nZfnUC8J7SE8JmMO7lG5psSF/WvBzuSYYixA7P4KnwKikBid1PO
	 9OrTvTQWU3ZQsHuqAbBm13Nw0AoSxQzZ23nD5qjD53e4hYoZLFpKDEFRkE6u0YuRAhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=5ugJPjuyaKFJxRku2cqxFQd5DwZah1E7qey/0WnvGBI=;
	b=WKnXsML5tlpmFVkrOHpmNy8fwcjIljrUVnBFFJz0rwEypzeHLPPmiTv1c2b8czk+ag30
	 0qOXfhyps2Xm2J1MTVamZbXzJUXeE43AiVqwpeQ2uowXezMktUojhDxRGDGZnKWjcyJBK
	 EH/6eMQXi/vwvxWuv8Xm42n05BESXAPqL5uawYNiyYB48b5D89Yl5vwgz/tZpvAQolVhU
	 jfCrLCjihYAbTQXtXw6usus4hcs7Zk0ZmZfkbS/8wgRWt6cdrg6wSEmYqd1w9UXR2mF8u
	 Z5bfttXUsQz6wzmO4+owO9KryIgFjQXplS0JAdw8CERM7cns1Enj4rgGZhwgECgrOzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kzn4P6HI;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24AB606A323
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 03:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B24AB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kzn4P6HI
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-536c8f958d7so57824951cf.1
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 19:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795749253; x=1796354053; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ugJPjuyaKFJxRku2cqxFQd5DwZah1E7qey/0WnvGBI=;
        b=kzn4P6HIOv/zbYwhqG11ovEs8UbbLBUqqnN/DzSK4havfCIROjjWcg0BrcBmJo85MQ
         NPbAlUHSbbB5M41z/0WQSyM5fe2XNDZr0OBZgvZ8zx8+CcyQmSe207HGqcy8I8oiIPbp
         I4B7PoCSW+l2RpUL7Hv1TUKMkLsYLMlzfhaYbVudYzujMd0rb5RM2nfwTqZH5TlKxW0P
         HpEX8trpfurG4Z1t2A+O7R3SZdJQvK3StKsjR1Ec8GCNLG0AjS9r34Wer23E1KoihaPz
         YHVtcYnVFuWk8BVoztC3faEVBHll3EzRi+fgo4KU9nDu5amo6isvkNrJ4MRldH1yN919
         /wEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749253; x=1796354053;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ugJPjuyaKFJxRku2cqxFQd5DwZah1E7qey/0WnvGBI=;
        b=0r7Oqnqlr2RMxN32lscOKnBAorU6dj6MfCXtHyVDrC+6jpptlOpU9ZeTtheZOfaxN3
         faXVyl2+ULvA2JI0Ju3KdArzwY4tADZIAvjNj3teDf4YyrSHTq3qOAaTP34pxXhVzTfB
         HIsG76XKD9BlwkMwnL9yy3bxoVl/SN/l7U0iCQrHJNlBLOkJysZ1dzvaN0ykWOOkeUQO
         6f2AYyvbl9v7I3cXvzvWuXa1ghqjllO3sZHzUqwu549jffcoEw6ii3aFSXqxMlG1zowq
         CXMmW65JbCQh4t+qDLEgEJlMD0WBxhI/gCwjdgTOdabH1aNAPcWsQRzgT8L0YBQEeBKi
         5fIw==
X-Forwarded-Encrypted: i=1; AL+hErF1OyqnJ8fOMiIIgPYsM+9lMuRGSQeLDcAW3gLxNjBXzDX+5x86LfjozOzrMK7Idyjco8Swfdwhi+8FlQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z//EA6WheYTNrJoQOi8dBJivN+dEZhT8XWxcSTT+U4g+e0ykCQy
	f8I8cbxPh3fknEuWdu290ULX6sKTrJU7K3UdW2ANJynx0bJqCk9VwDR27L/3J/nyYlY=
X-Gm-Gg: AZFdTZfKwemVpuM4uWXBGELHMPG+RO9DzKBF++JDG230p6uqltN3FjdNPNiCV9zmA4A
	jNLftNB9PaaQlfRl5kwyyrLn3n5X6ZQMA6I0kiVT74/Xfxt9QIyuMpIBcpPlQsj5Oe+fKJCXVXq
	UvrNdd/25jU16jdgzVaH6G1TVA1Fsw3LxuH7dsSyHfskV8sgsd8GRFf19Ha2J5Y6kDn+ctOAdtz
	BkWFa6zP06qJjbpYBIJ3hDJRNIjAu7RZJ2a8XrsQ/TaxzpY4jRhXgeZIrRg41dqIgC7n/lRxTsu
	ydR4xRNCIMmVHCQod5z9ZSpzPHontq2truRHxlgDBxXDb0BqNoFY27Xt07YleXTlHVyN1ikzorH
	bpy8MDOZm13+ywRCV/LE9+K/wB1iTSIObQBi8I5bxuwjuyvHxw6yOvhFzRhDqAUamleXe8CmBwl
	b7uY5MXBJLx3GWEHGOIQo60mhLfQmMxWZn1YQ4VRLWyA3BbAlhFokzVMxJlIxu8J4ff7tTAupiK
	Yo1IB2ABCSTDU8aJ/zC1uOcAzxR6ZFNYWJREf+tRV0DisiFhUU/IX/RZXeWODny7gG1LVTHq0vq
	x1XV3asRJ5MRtkEhSYZWdwVHKliUzRf2aK9Ng+J9dbHbPzqMIb+pcZA=
X-Received: by 2002:a05:620a:4446:b0:949:70f1:de2f with SMTP id af79cd13be357-949ba8260f2mr3894266285a.8.1795749252644;
        Thu, 26 Nov 2026 19:14:12 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::5ac? ([2606:6d00:11:8ec9::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0354a9sm1733363985a.5.2026.11.26.19.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:14:11 -0800 (PST)
Message-ID: <1f649c8c2c08c31f1f6ff7d7a17ea02301d89579.camel@ndufresne.ca>
Subject: Re: [PATCH v3 05/17] media: v4l2-ctrls: validate vp9 tile_rows_log2
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sofus Forstreuter <sofus.c@icloud.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa	
 <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Heiko
 Stuebner	 <heiko@sntech.de>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 	linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Date: Thu, 26 Nov 2026 22:14:10 -0500
In-Reply-To: <awanusdfmrjYpdHT@m3>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
	 <20261020-avd-v3-5-85cbaa2125d8@icloud.com>
	 <4c54e652e8fb714600852a3028b892c6a292c6cd.camel@ndufresne.ca>
	 <awanusdfmrjYpdHT@m3>
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
	protocol="application/pgp-signature"; boundary="=-KBWr4qryrDMK+mhbuy3u"
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

--=-KBWr4qryrDMK+mhbuy3u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 25 novembre 2026 =C3=A0 10:17 +0100, Sofus Forstreuter a =C3=A9=
crit=C2=A0:
> On Tue, Nov 24, 2026 at 05:16:47PM -0500, Nicolas Dufresne wrote:
> > Le mardi 20 octobre 2026 =C3=A0 11:37 +0200, Sofus Forstreuter a =C3=A9=
crit=C2=A0:
> > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > > Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-ctrls-core.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/medi=
a/v4l2-core/v4l2-ctrls-core.c
> > > index 922cf74c4eb8..384ff77771ea 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > > @@ -638,7 +638,7 @@ validate_vp9_frame(struct v4l2_ctrl_vp9_frame *fr=
ame)
> > >  =09 * According to the spec, tile_cols_log2 shall be less than or eq=
ual
> > >  =09 * to 6.
> > >  =09 */
> > > -=09if (frame->tile_cols_log2 > 6)
> > > +=09if (frame->tile_cols_log2 > 6 || frame->tile_rows_log2 > 2)
> >=20
> > Shouldn't this be 6 too? (log2(64)).
> >=20
>=20
> The max for tile_rows_log2 is derived from the spec (6.2.13 Tile info syn=
tax):
>=20
> tile_rows_log2 =3D f(1)
> if (tile_rows_log2 =3D=3D 1)
>   tile_rows_log2 +=3D f(1)
>=20
> This is also what eg. gstreamer does. I will add that to the commit messa=
ge.

Thanks, note that I was also confusing AV1, my fault for hopping codecs tha=
t are
similar but different.

Nicolas

--=-KBWr4qryrDMK+mhbuy3u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawj1ggAKCRDZQZRRKWBy
9DsUAP9PRVkjRHpiRiSLgzM8l9UhjnS0sDzgmwo4BJV1vzvvAgD9FAmOhu7fqhJ0
E9UOn92W7ZLiKmduKFmpzDXkPI9rEQE=
=QqIL
-----END PGP SIGNATURE-----

--=-KBWr4qryrDMK+mhbuy3u--
