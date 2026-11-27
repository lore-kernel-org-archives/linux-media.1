Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748880;
	b=L5RlajLlnB3DT+jF/Md/vwSz6Mnro8pLM8HFJTSULGwD8PFvG65gP6UoKHkR6X+YH2E+
	 HuFI0iqp4ldKjfr1G7jZrJztmaue/lDFZt9c6B5Lama2SSX7ADY6BvFVg4Dr4h8uJvWBp
	 mqqcNGCKxyuWbrkdLf2uoXmz20vgCmTaPbY0qimVqZORh5evW90/e/suk3S/5rNRYgVz7
	 5bDjwuhfs6WUxBxhRhYOwUn4TDmflNoR+iG5XZsPWt1iwKBlj3upHE5YG5mth0fk3IqPY
	 SnMyRrbOBJgpJ6gos+fbyxF5d0VM9qsBo4cCr7+b55iVcHu2kaS2bQ78ikPhRRCXLtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=QQ3I5DheySdE4xwva8PeCakbnF2axlV1tiOx5BdUcmc=;
	b=2DEoPKqCuxgvGq61Z9ln5scC2tIu1u6ikbwltiGUdaO+hnRycDZpXU1Vx1OFbk1Rv92f
	 zU7iqaUO27XN18J4LeiuyvW99tR5tiHAf3F35PedtncqFmoRQS/RQg2kit5v/7nRcVUH9
	 zOg+94uKxw6HI+/Ktoqfx4vD81CERyuaRPl6e35R3kAESs5EIk3UzAyfBQ1thfwpsxLyd
	 R04aC1x/ICy2d3nlMvxQerYV4nCnHm8eQuIl6SbUwhNqVn775k1BLtgLW+Z4aL2/U+qmw
	 iTcQ0vzCS2l/NUwV/p/Eqg1dkGnFsZJvyAFT5Y5J9v1iuPhoLGdQdoVaYnMYrWS5xRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rpyti411;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895AF606A31C
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 03:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 895AF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rpyti411
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-921318b2eb8so93663336d6.1
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 19:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795748878; x=1796353678; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QQ3I5DheySdE4xwva8PeCakbnF2axlV1tiOx5BdUcmc=;
        b=rpyti411rztLcnFSzGGIfQD9yZL5IILvQKqs1u1IszoeFzi+t2V21xQ0TBGQkZAF2z
         1SOoFDH02SKZXpdYVYLAugS3QG1Z86/uUpcK+MyWTIHb3sDu8n4hY0geazsc6vMT9WT4
         Xz6TIvpW5v3F+5jHfzpJs07kFLgJLmE5z14G/LW7rX3ZaIKBXu3h8t478FaucUR9yEuy
         UEGrCUEFjm2exsTKMsae09gtErAUl/Yuk0gOidUB5oe9IupYVnyI/ka8vJDikJ4mdZfu
         +u0RmaERJw4yb60JGhUKKHp6jVD3hHAf6aENeLMEplMwHTxuvTpq+e+MYDvC/4frXibV
         /3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748878; x=1796353678;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QQ3I5DheySdE4xwva8PeCakbnF2axlV1tiOx5BdUcmc=;
        b=R4MUsuuzARo12AD/dby24M8qcW10+9SYYPTdJkFyQnDuEnGsDEnF5KcLvsdkBE8Ewd
         fAvjpswRYg/dR9lkc/BJ43wbRAUY+xjJPIRulrk6vrmLuUXPnBFlqzoDR36hoyDIEbGM
         Y7SFEQ2LZMmSKv2wFQC+3ltMQ9KEPf5R00Qteo65/LCnf2TG+KzgNnVwmzmdNPRtUVcb
         GiRIlc8YUWtg5Eh4MiPSQkqKxDPpMl1rpf/p1vl67PWo4URDAGo6pbfmoaQ4keyl8vzD
         O4M/OJrc0P8cvBYzG2gd0xCNdGQKkE7bjVMZoh0ksjRrLIp6upKTSuuYd6Fum8SSlZwd
         qtDQ==
X-Gm-Message-State: APuU4Z+s5v/6IUkxxXn0fdN/9bqaIyD1dIlGXgBIUAruXNIGscfHi3OT
	pB26l17cGLevHo7U8CjOFpaRmWMSnJels+KOyptSPTqqGVTSKIq2uzg/LGsjKUhNIKyX5Mz4jko
	dEZdb
X-Gm-Gg: AZFdTZeyAyUWgIf7SwPYg/JiY3nFcjPAG3wgN6Frrqd8YUchnnk33FQG23+CN4sf0zq
	1bsbXy9TNTPyqXuQ9VFSNYkLUU+6JG7uil+IEqspxyAtvd/0ZFgxGEwgjnEItGHWYKfL80C7xYE
	zgJ/g4os28CEsQc/FDEtm83jrZn/mgOost83KW9IuGu02Arx49PamYSAuHJ4bBg4wGWufig+E56
	B2b5ypgjvjisVwrep1YE/hKv90fae19KXW/Az/OV/8bztslG1U3gsm9jhNLddZ4vC6oBzKsgrZF
	iP913xsmU0gOvL5/yP8hlKU9yf3FU6Nn3PIK6tIe6yde3pJL5ICw/UvFXNFZFACphmNf86lk49N
	I0yU25k5yNzkl3W1LyLtE1F/C5u2AX0hhBHm+xNOf/DHwoPeghTnpqUYsf8weCanqe+DKHpToIu
	QMcA+IcQ30JeY2Tw3CyI+r5jKd+UqSG0mmLJUkz5+pmZu7/0CNNIAxgj3gYJTYPvwihv3T4v7ot
	DzrI5Pn9H3KQqYnQ+ZYGIYEGmOgdi30MIrZK6y+fIaQTpPsfhO3erKO4i3XDgXbzg7Chi9IeX1k
	yVKOSQQNuEv1oxPzxVq0X6/JH+0tVlO8ip8BT1IsVoipBzJ6hcpdz4w=
X-Received: by 2002:a05:6214:1d03:b0:921:4c11:f6ef with SMTP id 6a1803df08f44-9214c11f800mr340063896d6.1.1795748878408;
        Thu, 26 Nov 2026 19:07:58 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::5ac? ([2606:6d00:11:8ec9::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bfe82dsm202895356d6.0.2026.11.26.19.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:07:57 -0800 (PST)
Message-ID: <d1bcc1bbd36b83e83eb1c857f23a4407dbcb6f77.camel@ndufresne.ca>
Subject: Re: [PATCH] drivers/media/v4l2-core/v4l2-vp9.c: reduce inlining
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Andrew Morton <akpm@linux-foundation.org>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Daniel Almeida
 <daniel.almeida@collabora.com>
Date: Thu, 26 Nov 2026 22:07:55 -0500
In-Reply-To: <382debd29a1a4e649039f61dfad4d34b.1@linux-foundation.org>
References: <382debd29a1a4e649039f61dfad4d34b.1@linux-foundation.org>
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
	protocol="application/pgp-signature"; boundary="=-u4JPb92siCeo2UfsvvX3"
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

--=-u4JPb92siCeo2UfsvvX3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Le mardi 24 novembre 2026 =C3=A0 22:08 -0800, Andrew Morton a =C3=A9crit=C2=
=A0:
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: drivers/media/v4l2-core/v4l2-vp9.c: reduce inlining

Should be: media: vp9: reduce inlining

The media CI gives you the information of what wasn't right.

> Date: Tue May 26 03:14:09 PM PDT 2026
>=20
> csky allmodconfig, gcc-15.2.0:
>=20
> drivers/media/v4l2-core/v4l2-vp9.c: In function 'v4l2_vp9_adapt_noncoef_p=
robs':
> drivers/media/v4l2-core/v4l2-vp9.c:1834:1: error: the frame size of 1436 =
bytes is larger than 1280 bytes [-Werror=3Dframe-larger-than=3D]
>=20
> The amount of inlining in there is simply nuts.  This patch semi-randomly
> uninlines various things and fixes the above.
>=20
> Ad the .text size reduction is tremendous:
>=20
> ts:/usr/src/25> size drivers/media/v4l2-core/v4l2-vp9.o
>    text=09   data=09    bss=09    dec=09    hex=09filename
>   22450=09     36=09      0=09  22486=09   57d6=09drivers/media/v4l2-core=
/v4l2-vp9.o-before
>   16144=09     36=09      0=09  16180=09   3f34=09drivers/media/v4l2-core=
/v4l2-vp9.o-after
>=20
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>=20
>  drivers/media/v4l2-core/v4l2-vp9.c |   30 +++++++++++++--------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>=20
> --- a/drivers/media/v4l2-core/v4l2-vp9.c~drivers-media-v4l2-core-v4l2-vp9=
c-reduce-inlining
> +++ a/drivers/media/v4l2-core/v4l2-vp9.c
> @@ -1582,25 +1582,25 @@ static inline u8 noncoef_merge_prob(u8 p
>   *=09merge_prob(p[9], c[9], [10])
>   */
> =20
> -static inline void merge_probs_variant_a(u8 *p, const u32 *c, u16 count_=
sat, u32 update_factor)
> +static noinline_for_stack void merge_probs_variant_a(u8 *p, const u32 *c=
, u16 count_sat, u32 update_factor)
>  {
>  =09p[1] =3D merge_prob(p[1], c[0], c[1] + c[2], count_sat, update_factor=
);
>  =09p[2] =3D merge_prob(p[2], c[1], c[2], count_sat, update_factor);
>  }
> =20
> -static inline void merge_probs_variant_b(u8 *p, const u32 *c, u16 count_=
sat, u32 update_factor)
> +static noinline_for_stack void merge_probs_variant_b(u8 *p, const u32 *c=
, u16 count_sat, u32 update_factor)
>  {
>  =09p[0] =3D merge_prob(p[0], c[0], c[1], count_sat, update_factor);
>  }
> =20
> -static inline void merge_probs_variant_c(u8 *p, const u32 *c)
> +static noinline_for_stack void merge_probs_variant_c(u8 *p, const u32 *c=
)
>  {
>  =09p[0] =3D noncoef_merge_prob(p[0], c[2], c[1] + c[0] + c[3]);
>  =09p[1] =3D noncoef_merge_prob(p[1], c[0], c[1] + c[3]);
>  =09p[2] =3D noncoef_merge_prob(p[2], c[1], c[3]);
>  }
> =20
> -static void merge_probs_variant_d(u8 *p, const u32 *c)
> +static noinline_for_stack void merge_probs_variant_d(u8 *p, const u32 *c=
)
>  {
>  =09u32 sum =3D 0, s2;
> =20
> @@ -1624,20 +1624,20 @@ static void merge_probs_variant_d(u8 *p,
>  =09p[8] =3D noncoef_merge_prob(p[8], c[6], c[7]);
>  }
> =20
> -static inline void merge_probs_variant_e(u8 *p, const u32 *c)
> +static noinline_for_stack void merge_probs_variant_e(u8 *p, const u32 *c=
)
>  {
>  =09p[0] =3D noncoef_merge_prob(p[0], c[0], c[1] + c[2] + c[3]);
>  =09p[1] =3D noncoef_merge_prob(p[1], c[1], c[2] + c[3]);
>  =09p[2] =3D noncoef_merge_prob(p[2], c[2], c[3]);
>  }
> =20
> -static inline void merge_probs_variant_f(u8 *p, const u32 *c)
> +static noinline_for_stack void merge_probs_variant_f(u8 *p, const u32 *c=
)
>  {
>  =09p[0] =3D noncoef_merge_prob(p[0], c[0], c[1] + c[2]);
>  =09p[1] =3D noncoef_merge_prob(p[1], c[1], c[2]);
>  }
> =20
> -static void merge_probs_variant_g(u8 *p, const u32 *c)
> +static noinline_for_stack void merge_probs_variant_g(u8 *p, const u32 *c=
)
>  {
>  =09u32 sum;
> =20
> @@ -1659,12 +1659,12 @@ static void merge_probs_variant_g(u8 *p,
>  }
> =20
>  /* 8.4.3 Coefficient probability adaptation process */
> -static inline void adapt_probs_variant_a_coef(u8 *p, const u32 *c, u32 u=
pdate_factor)
> +static noinline_for_stack void adapt_probs_variant_a_coef(u8 *p, const u=
32 *c, u32 update_factor)
>  {
>  =09merge_probs_variant_a(p, c, 24, update_factor);
>  }
> =20
> -static inline void adapt_probs_variant_b_coef(u8 *p, const u32 *c, u32 u=
pdate_factor)
> +static noinline_for_stack void adapt_probs_variant_b_coef(u8 *p, const u=
32 *c, u32 update_factor)
>  {
>  =09merge_probs_variant_b(p, c, 24, update_factor);
>  }
> @@ -1724,33 +1724,33 @@ static inline void adapt_probs_variant_b
>  =09merge_probs_variant_b(p, c, 20, 128);
>  }
> =20
> -static inline void adapt_probs_variant_c(u8 *p, const u32 *c)
> +static noinline_for_stack void adapt_probs_variant_c(u8 *p, const u32 *c=
)
>  {
>  =09merge_probs_variant_c(p, c);
>  }
> =20
> -static inline void adapt_probs_variant_d(u8 *p, const u32 *c)
> +static noinline_for_stack void adapt_probs_variant_d(u8 *p, const u32 *c=
)
>  {
>  =09merge_probs_variant_d(p, c);
>  }
> =20
> -static inline void adapt_probs_variant_e(u8 *p, const u32 *c)
> +static noinline_for_stack void adapt_probs_variant_e(u8 *p, const u32 *c=
)
>  {
>  =09merge_probs_variant_e(p, c);
>  }
> =20
> -static inline void adapt_probs_variant_f(u8 *p, const u32 *c)
> +static noinline_for_stack void adapt_probs_variant_f(u8 *p, const u32 *c=
)
>  {
>  =09merge_probs_variant_f(p, c);
>  }
> =20
> -static inline void adapt_probs_variant_g(u8 *p, const u32 *c)
> +static noinline_for_stack void adapt_probs_variant_g(u8 *p, const u32 *c=
)
>  {
>  =09merge_probs_variant_g(p, c);
>  }
> =20
>  /* 8.4.4 Non coefficient probability adaptation process, adapt_prob() */
> -static inline u8 adapt_prob(u8 prob, const u32 counts[2])
> +static noinline_for_stack u8 adapt_prob(u8 prob, const u32 counts[2])
>  {
>  =09return noncoef_merge_prob(prob, counts[0], counts[1]);
>  }
>=20

Ok, so this is pretty random overall, someone will have to actually write a
proper patch.

Nicolas

--=-u4JPb92siCeo2UfsvvX3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawj0CwAKCRDZQZRRKWBy
9FnpAP4gcCpNC6XDnUNZs/ihur0JOE5teGHUvUQxJGWVCSRjygD+OSTCm3SaWaSy
GUrvIqAIDPo85HarzSfEY3hg7otF/Ag=
=15t3
-----END PGP SIGNATURE-----

--=-u4JPb92siCeo2UfsvvX3--
