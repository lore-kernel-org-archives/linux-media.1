Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236A986341
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 18:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787941894; cv=none; b=YB0Myd80M28547XM1FWk3/EWiIrqjCGb8Z+jRnosIczrKbCvlUVOIjUwjd+b7Q7zse/SJIz70E1a4TWIhru63vighaFidRL8dZpbpRuMnPijC9YLo8O8M5O2qOnop6AJtO1VyrPkWrvaDqGPPUnpHggPO2i+RDIx91bH5lxEmP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787941894; c=relaxed/simple;
	bh=O8dZhLvyNfmGzNNrDenmRnIFKmOWE9sgcqgTD1Ht5V8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jKovTXWD+9h1SPmWGrs7sJjKH5NeQflr62bNG/GTjNEjYbdM5tDk8pJAUo4n4UnGAyAyr3bk5CMjn4f6RgUxDXrrm1TWFGvqw0rU7twH/RH6fWeqL/YN+gRRZNFo9Qduet7+oR1zdWAMUadJXzB8kuq2C/O5FLShpZcvec8PfN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=Ogh1v9OG; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="Ogh1v9OG"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c2a818fc4so7693901cf.2
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 11:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1787941892; x=1788546692; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xsuMlCmeVhYxXuxW5Fyb6ziWUpN69y36Ck3O/ViKhYE=;
        b=Ogh1v9OG12VKTCMCUA4TBNlaTwRVTaggUqRNM/yfxNynEqunY5CctUs5AiO++ImTzB
         reCY17HQ/5Xp+U3dhcnI+iJifxr6FjnfkpNXsKYtoTfQ/3MOO4SPvmlMmdKnLIRIF5zM
         aBIkHnqy3yMEFF8TBqaPV6vfLwRJ7PeKUThsN3jjkpoO9YA6Fwd2zDnEI99Rvkf7CaYb
         5iGC+ICDEI6R81PninoGPbU5UalbxTIGvq7ykoPiyCQuW2pB8Zjaef0WpdVioJtM+/+C
         Sa2UBwKQl5NjoPVrQ3ow3azj8ESff85fchNex3DE68SjAq898E/4Q9J1mST4NQdZriZo
         /Juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787941892; x=1788546692;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xsuMlCmeVhYxXuxW5Fyb6ziWUpN69y36Ck3O/ViKhYE=;
        b=EjBk1xgV+AENCgic1aTY4NeFOmdQGvdskuMNXkEHp2ne3cAsT4fxI14N2gvWKKgrm/
         DFYXyZVq7u0xvitgFLfMc8fO56W1WL+WRP5OsHTBxVf3v6W5nDBDayLIiRR6v1zr217w
         zg6Cjv0LMePHOsYhOxD8vEJnXwhkkSaYcWsDLXd/B7j+5+ra0XJzSx1zs9CBmqxdlPDc
         xUjCXYrahIZzi6ZM22ypyUh06OwGOGHYybjjCzont8mjiTTLJ1AAl/2YE6P3l4OgPeFv
         ouE147/yY8qVauJuLxXWXx3Wrffca6//vrXSiJOsffG75edTKHRM931ybDp/UL/2akaB
         o8fg==
X-Forwarded-Encrypted: i=1; AHgh+RrzxPunAoc445KZf55NzcF4CLbbbwM9luzW1RCt9s1N+gdXqCh1k/G0kD4amfkq2mh6TrvSt/ig2S0eWg==@vger.kernel.org
X-Gm-Message-State: AFuF++nI+3ksask2k0gjRqh/ggblXZTCbrfv8ZSK2pVSuVV12Lp247CK
	JxMsQLZmKiCWa2TkdlhpfiG4FhThhLbvcPLoWMqEyjdPz1bF1VBND5tptHqHNd9Uz00=
X-Gm-Gg: AR+sD12R0R7I5JkDsIjxfmVXQoufOMz1XlSMqFHrapAF+vJs+7CaWUdadcCG/HG8HsF
	C4ch9ICGq7GHOFat0lZCkCpv0qocJFjpMbATGA5/kJZnrXTZmAQrSl8cIx1Zw5iIYPTw3sA3LlK
	T8cPbEzhBGzKz9TOf5Ua80pEmpv3dO985DHrzhdX+sZFByueeBJLOo5WH/lizl+VNG15vNNqrsX
	7X+f8iFfq+nZecMC28Q7vOIfFtFRNbyQMb5+RDm3dznQBJ9S9IDgPGIq2Aw5E215quJTsHncPtp
	nCdtYiccmtylQQsyg5Sp10EAByP0BA3cIq/wuiCKqFxwtx8IopsriEqPI38Ed8HT11NbsIHQLw8
	RNhQ4dTtNxi8mZhbEuY743vKDLCPZRrOUGg/iMdLgSBQHbF22KnZVqpNR3cIMSi6lApYj9QzGBz
	lRYYO3G44HfmkX3zAZAEIOwo/ibMlXra0R2BdpywgAaWt78Fetr5NPCqwhBmPoKKWl
X-Received: by 2002:ac8:5a84:0:b0:52f:ade1:2d51 with SMTP id d75a77b69052e-52fb93d26fcmr114490381cf.6.1787941891845;
        Fri, 28 Aug 2026 11:31:31 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e221::5ac? ([2606:6d00:15:e221::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe878f4esm18199021cf.31.2026.08.28.11.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:31:30 -0700 (PDT)
Message-ID: <a0bd7b426ca22ccbf8148648a50918ddcae5c9a1.camel@ndufresne.ca>
Subject: Re: [PATCH] media: v4l2-h264: Fix memcmp() size in B1 reference
 list comparison
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haotian Zhang <vulab@iscas.ac.cn>, mchehab@kernel.org
Cc: boris.brezillon@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 28 Aug 2026 14:31:29 -0400
In-Reply-To: <20260828021739.25766-1-vulab@iscas.ac.cn>
References: <20260828021739.25766-1-vulab@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-96g/5XeQYjmC3B/5DWIG"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-96g/5XeQYjmC3B/5DWIG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 28 ao=C3=BBt 2026 =C3=A0 10:17 +0800, Haotian Zhang a =C3=A9cri=
t=C2=A0:
> In v4l2_h264_build_b_ref_lists(), the B0/B1 list equality
> check passes the entry count builder->num_valid to memcmp()
> instead of a byte size. Since struct v4l2_h264_reference is
> two bytes (fields and index), only half of each list is
> compared, so distinct lists can be wrongly treated as equal
> and trigger an incorrect swap(b1_reflist[0], b1_reflist[1]).
>=20
> Change the memcmp() size argument to builder->num_valid *
> sizeof(*b1_reflist) so that the full byte length of both
> reference lists is compared.
>=20
> Fixes: 624922a2739b ("media: v4l2-core: Add helpers to build the H264 P/B=
0/B1 reflists")

This is the wrong commit. It was fine until I broke it 4 years ago it seems=
.
Boris don't do that kind of silly mistake :-S

commit 2e2c3d6c0ef88ffac0d6b5079ee88cf8408f5f3b
Author: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date:   Fri May 13 22:29:03 2022 +0200

    media: h264: Use v4l2_h264_reference for reflist


> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/media/v4l2-core/v4l2-h264.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-cor=
e/v4l2-h264.c
> index c00197d095e7..1b1421caf488 100644
> --- a/drivers/media/v4l2-core/v4l2-h264.c
> +++ b/drivers/media/v4l2-core/v4l2-h264.c
> @@ -440,7 +440,8 @@ v4l2_h264_build_b_ref_lists(const struct v4l2_h264_re=
flist_builder *builder,
>  	}
> =20
>  	if (builder->num_valid > 1 &&
> -	    !memcmp(b1_reflist, b0_reflist, builder->num_valid))
> +	    !memcmp(b1_reflist, b0_reflist,
> +			builder->num_valid * sizeof(*b1_reflist)))
>  		swap(b1_reflist[0], b1_reflist[1]);

And of course this swap need to be replaced.

Nicolas

> =20
>  	print_ref_list_b(builder, b0_reflist, 0);

--=-96g/5XeQYjmC3B/5DWIG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCapHUAQAKCRDZQZRRKWBy
9JUOAQCP4osDHz9kbcBrfJfwUxsFL3lGbDpOqYBj5FXZNeMAlgD7BAvE9RM5kQsA
Ljc+o+fCTOPt9rRBvh0ggZyQhGSDuQo=
=sr8j
-----END PGP SIGNATURE-----

--=-96g/5XeQYjmC3B/5DWIG--
