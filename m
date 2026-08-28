Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0703B637E
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 18:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942427; cv=none; b=WvaIB68yrNavqblo57kKJCDy52vVkx6OYTHLjkmw7sNYm0vNAphQdTi34fKHp66QlVN58K5AuorWJThsau8dmtq4qTZ47WUv0prkhixsVzMr8+MdebmYYWktJnILoYA1AOF3B0kWS9X91jGFue7h7ZLGLsAxEuyG5TSiUDRSYjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942427; c=relaxed/simple;
	bh=jGYPBfzNQdG6bWv0DGvRzQxmazx40NygG70KM3GLXxY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lndN+iAhh/XYdI9qYCimFRhM1PUyRVbuHVOy3gqmcuR5EkgefdGinHHWjNau7hAgnKcRmLFcyjp6iwKQ7SzRlLhCq6GkeWutsvpSGVePFdKB+GzgOD8SKf/D1e6xtGdGOS2A252WVrj7y+lT1cpUcngFnfn8seHfcSAzSCWy82U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=s264FRTt; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="s264FRTt"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5218927884fso15449971cf.3
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 11:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1787942423; x=1788547223; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zijd+tYtiZEShwbJi/g20hB0haPangx29Fi2RCseuzA=;
        b=s264FRTt75FE6auKf5BfKqVtf7f5eX/Ol3T3nwFOCkRzAPr3lsH8Z8mlnG/se7t1Q7
         jQgbdgta+EAINNZxMzsUh5mPSbewJQVcWEAr60V47TOdRMugZbA6NkBMv5rh5pHDqF7x
         Mxu5qfeLdG+/CbLmu+LJ+UKeahF9opbQQnpyYEx7X9WputHSGIdnNvfI/bdNqLKeo9PP
         ZLfFi7hw4wh+OEXyJbm5pAYz9nHW62uuMVxTbz72ljh+bhdklex5RF7Kxweydtk2C/3u
         BCmX4D5Q37WjbnSLvuth9+XpIJJuDljvqU03OSXjaDRrugQ96WL9mXpP9SqvtbMRALMM
         gBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942423; x=1788547223;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zijd+tYtiZEShwbJi/g20hB0haPangx29Fi2RCseuzA=;
        b=IxhxYEw7QYbHruFvtIRxIK+XWlKslbIA+fcb0r6VhOOqr4PaZiCKZJmwz6ghz0N8VH
         qVTG15JdOlzAY3SgyyBRER3avKwxGcvc0ePXuwnI8a+utJMWw3YgtPZt5aglBwkSwz9h
         HT6ASPAQLHAAAtK7WLDQ8Q9ybLwNcPBfBNajizMvJ0bLPo+I5I7VJ74fOYJPpEL31zy8
         qNkUxKgoi+++L2oUmqozI9Ik4lID8ToMzW2Nx7ADV6TVgUXUMNKnBaPpej1i3gMx+Zxl
         nGexcpXRdDi9qNhbWbdeOrHvH0zUkB1PosseJ19VlrcbCQ5Gt1cQyZsjzdL6Az3D+nZz
         1zpw==
X-Forwarded-Encrypted: i=1; AHgh+RrzUTdhJATiZJEycTmiD0bxoG+tbVU/HRcQWToVw4HNeiBa5cnqMfNKC2VCpSyANk0iX8e/sXu8H/bnnA==@vger.kernel.org
X-Gm-Message-State: AFuF++l0H/z0nXXo1InHmD1XLWotyOExscXAN24/IuYDeO4w34fI6rAJ
	b1TVbHV5ddFWazk+/PvRwcnN4+1amu0OJqUMeL3gU1t0u9RMR5DM0Dsch6iUFbrAEqk=
X-Gm-Gg: AR+sD120k1ykA/X1b5KAwed6XV/u6kIpxw+mBRvN1wOgDLkQTYwNMWmLEZ9tJtB7Xk9
	3UZOttL6ti10Hx4TRkJXi0qGL0vGK4D/JNAD+B7Go0FLpQNh13wn786tQFiZbwRMnZvvfP3745F
	FA1KH1690LStEXzip6594KAOa3NXHmdp8VrfTci7NSp1RnZq1+RDduEsRwIEwtnex/O3xYP7al2
	dTHcr/9ydQSXqpBAzBAnqKtb3y7Towla+77SnbLUczXgvateich30wUKcIut4+fc1tRBBTB8snV
	kmNAdr30RqjWbKnISkj0pgg3ZVOt2WL6KBqa6B0I+KnQ6wD7nGKzhJmiuTn8/gcVDFwbemUEeYu
	12k7NYPni3Gvy7mFnVB8q5qbv+WDixTJMHqP+HrkY4b40phKCSdyBx4XYf7vI0Zrzq4fzkWYAoh
	YPEFo/NWYuMGOs5vmb8sq2om7/OKft9Yar64armFnJ9pw6WT06a0s7dwftoDxfQDqH
X-Received: by 2002:a05:622a:4c7:b0:52e:3ab4:8cb6 with SMTP id d75a77b69052e-52fb96bb27emr102669911cf.40.1787942422926;
        Fri, 28 Aug 2026 11:40:22 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e221::5ac? ([2606:6d00:15:e221::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe5495easm18663991cf.2.2026.08.28.11.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:40:22 -0700 (PDT)
Message-ID: <ba6388e95afa69bd5ea5f3493be1f702bce06323.camel@ndufresne.ca>
Subject: Re: [PATCH] media: v4l2-h264: Fix memcmp() size in B1 reference
 list comparison
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haotian Zhang <vulab@iscas.ac.cn>, mchehab@kernel.org
Cc: boris.brezillon@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 28 Aug 2026 14:40:21 -0400
In-Reply-To: <a0bd7b426ca22ccbf8148648a50918ddcae5c9a1.camel@ndufresne.ca>
References: <20260828021739.25766-1-vulab@iscas.ac.cn>
	 <a0bd7b426ca22ccbf8148648a50918ddcae5c9a1.camel@ndufresne.ca>
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
	protocol="application/pgp-signature"; boundary="=-unrg0YqCUSdp2BkNKbCj"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-unrg0YqCUSdp2BkNKbCj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 28 ao=C3=BBt 2026 =C3=A0 14:31 -0400, Nicolas Dufresne a =C3=A9=
crit=C2=A0:
> Le vendredi 28 ao=C3=BBt 2026 =C3=A0 10:17 +0800, Haotian Zhang a =C3=A9c=
rit=C2=A0:
> > In v4l2_h264_build_b_ref_lists(), the B0/B1 list equality
> > check passes the entry count builder->num_valid to memcmp()
> > instead of a byte size. Since struct v4l2_h264_reference is
> > two bytes (fields and index), only half of each list is
> > compared, so distinct lists can be wrongly treated as equal
> > and trigger an incorrect swap(b1_reflist[0], b1_reflist[1]).
> >=20
> > Change the memcmp() size argument to builder->num_valid *
> > sizeof(*b1_reflist) so that the full byte length of both
> > reference lists is compared.
> >=20
> > Fixes: 624922a2739b ("media: v4l2-core: Add helpers to build the H264 P=
/B0/B1 reflists")
>=20
> This is the wrong commit. It was fine until I broke it 4 years ago it see=
ms.
> Boris don't do that kind of silly mistake :-S
>=20
> commit 2e2c3d6c0ef88ffac0d6b5079ee88cf8408f5f3b
> Author: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Date:   Fri May 13 22:29:03 2022 +0200
>=20
>     media: h264: Use v4l2_h264_reference for reflist
>=20
>=20
> > Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> > ---
> >  drivers/media/v4l2-core/v4l2-h264.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-c=
ore/v4l2-h264.c
> > index c00197d095e7..1b1421caf488 100644
> > --- a/drivers/media/v4l2-core/v4l2-h264.c
> > +++ b/drivers/media/v4l2-core/v4l2-h264.c
> > @@ -440,7 +440,8 @@ v4l2_h264_build_b_ref_lists(const struct v4l2_h264_=
reflist_builder *builder,
> >  	}
> > =20
> >  	if (builder->num_valid > 1 &&
> > -	    !memcmp(b1_reflist, b0_reflist, builder->num_valid))
> > +	    !memcmp(b1_reflist, b0_reflist,
> > +			builder->num_valid * sizeof(*b1_reflist)))
> >  		swap(b1_reflist[0], b1_reflist[1]);
>=20
> And of course this swap need to be replaced.

Ignore this one, I should have read the implementation of the swap macro ..=
. its
working fine for this case:

   do { typeof(a) __tmp =3D (a); (a) =3D (b); (b) =3D __tmp; } while (0)

>=20
> Nicolas
>=20
> > =20
> >  	print_ref_list_b(builder, b0_reflist, 0);

--=-unrg0YqCUSdp2BkNKbCj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCapHWFQAKCRDZQZRRKWBy
9I5FAP4pAojWSgZldIdug90QOouR8PzyNZHFqoGbppt3z6OHigD/cuCfdNQPMyG+
blOFlkaafAtbJA3hoOlfvFE9Jy+ftw4=
=wqfg
-----END PGP SIGNATURE-----

--=-unrg0YqCUSdp2BkNKbCj--
