Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F133BBFD9
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 18:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942615; cv=none; b=CFJ8QKiItrT9GMfYLBBCYcO1Sj8vi5bTFAdmRB8SgS6ZbteVsn+08zpWYp2UKUPQkbp5VqVHPI6Frzag6L8A0QMz2i4cmIV2MhJjQjtLRqxxbXNGSicRPPufF/FVZtfk+jG+AIJYg/LbL4JzkhTATGw/DDMKvanF+GRMLTKrGQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942615; c=relaxed/simple;
	bh=k+iRkGeEFWT3ZM1rado6gHZdSVVxl7Y+dzPCyYTaW2s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FTv7fE8psoLty6nxEEhqcofE5r38zPAsoWQ8h1kYCJt/snSXfc0CWZ5a8iP1zPO5xHcvKKzT0hUD5a2Q7VZVEi0gXK49PiG9RAkB9EzL8VrwVsjfiB+aao4Xzl8UJCFuLiiJAuZIfhOlxQTN22x5xZNBymmhIdpoGzB2uGcNL3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=oYIwelYf; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="oYIwelYf"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-52ff0b7c98aso4278651cf.0
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 11:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1787942605; x=1788547405; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FpjcikU1Xtv7kcDDN0w8UTaElMDIrOkZ44TI5Rss22o=;
        b=oYIwelYfXxPSNBwswRQEvtV87/SmI4q7P26x7sktp1jDUkR63k3R8cKjDqSoaXCDFP
         oMnIIOx2lBLNJgPKKlgLlVxqM6QmIjkqQbteF3/JPOaFMS7lsp7HqhkwhHQHLgLuSREN
         LITJUpwiBoQ/SezWcDht82QCE5JDqMre/D3Lr+tZu4n934Y65fhmsaQ+HsFW4xnh+3Lz
         IO+qPumXHBVsHdT+0MMHAChzd8FoBnU8/3MamabHjGN2UDvGGk4xrbiwOlrzhiIH057S
         cfcZk5XMXKtEOyqjHUgtfbUAOs+UCRwtp0uYcZctId1wck83HYWL4m742dZQU5XYgOU/
         hMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942605; x=1788547405;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpjcikU1Xtv7kcDDN0w8UTaElMDIrOkZ44TI5Rss22o=;
        b=H97JglE3O8mvz94A/UUGrsBZuoJPxW9N6oH0F3tkgUxYGwegiedLhtDUPxUXSzYZ7d
         a7zQMZDivCDuhOsCkHIo/H1BrJnZl2XTzLUpvz282LdKL1OxYMhbzPPu0FqoLuVRFulO
         6RuFpVOxkQiSvuEYtNHL1XWImyBz63a8Yj7YueXcPDN59p9U4A5UGPTSajLlvOh52ztS
         qmGFrdmr+nPRRDJIEazuLcptuco02sKkAF+V9YPTZpZnRhOdKR0pJZvvIMl9P33E59+K
         n4hi874sOipdmsVeBjkfPggjsI17t9+89C7tfpXVB08bnF4khImwChGcKK7iNiyKDUoK
         x96A==
X-Forwarded-Encrypted: i=1; AHgh+RoHsRnEgXGx91xWDoBi/dBrtDFFOrWnpob3NolzukzsOZ+XRywvUJ3zn7gtI7cr+RI1++H62vS9NYYB8w==@vger.kernel.org
X-Gm-Message-State: AFuF++mR1KoMtZSc7Y/OxWJ3Z66PJ/umL4rCBy+d1q4nuKSc9QJLVH+e
	0dK9pXXuVt2g74/Vi1jI/UuWZ8luYTiV26j9dh670LZy9ylpKyzEaOPsaHNk6g9bvTw=
X-Gm-Gg: AR+sD12IuDuTkqt1IT277AWD0Gz3VWjOUKkrA1/35I0p4pDUISlMd/LgGf6E9Wknf6k
	mQBvY4doyyRnTb4wij8AJ+mxeNoSvVW0CXEd06q6M81VdFzr43Bs6f+gr6KlrYtHWdvfuOc/fL7
	TCfS/J8xcKCdaazk6Ul7tsg+7AGff/CE0et3KQiNXhrGN3XmidQdhlWUpZkc+8BGTf3Z9LA7g1g
	s+k93ix1Bw+lLlS4XLInCTAHEIohcMcnYbgcmEVjO3kpR/MrqORt8fLONobFFkASMUjn18WV5HE
	4iuSCRF9hXp1qGtHlqyMYpLZO25N4oqRcCJUSUOWTKP1WewAXYcd7mWe9lxYCLj4DB56ocnOvFd
	F5V0jYaDlYvxayV3rmlI8bWmzq3R1uiCh0W9Af36zQGeNfMv+KIsVgt8CAk63tQStTrV81sShlW
	FO+U2xsMqKbAKdR22/AUtmvabQf7BmumB/PXU42O/Q2Jecb75YAuheTkCOdyyXFyvw
X-Received: by 2002:a05:622a:6107:b0:528:601:301e with SMTP id d75a77b69052e-52fb95f60a4mr107958891cf.26.1787942599835;
        Fri, 28 Aug 2026 11:43:19 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e221::5ac? ([2606:6d00:15:e221::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce4514f3esm21370506d6.41.2026.08.28.11.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:43:19 -0700 (PDT)
Message-ID: <d93356adbb52141365b5afe13d73fb824ef4e23f.camel@ndufresne.ca>
Subject: Re: [PATCH] media: v4l2-h264: Fix memcmp() size in B1 reference
 list comparison
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haotian Zhang <vulab@iscas.ac.cn>, mchehab@kernel.org
Cc: boris.brezillon@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 28 Aug 2026 14:43:18 -0400
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
	protocol="application/pgp-signature"; boundary="=-EhY9WrS0/N/5NtB6wlfl"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-EhY9WrS0/N/5NtB6wlfl
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

One last comment, I think this would be more consistent with the memcpy() c=
alls:

+			 sizeof(b1_reflist[0]) * builder->num_valid))

Nicolas

>  		swap(b1_reflist[0], b1_reflist[1]);
> =20
>  	print_ref_list_b(builder, b0_reflist, 0);

--=-EhY9WrS0/N/5NtB6wlfl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCapHWxgAKCRDZQZRRKWBy
9D5hAQD5uGsohrgmxddLCQ9VT8Nsso+m71cU2QJcybfjw84KogD/an36TroA8CFI
b+0W8ellAI+OhfBX4jig/Xw6EuAyMAk=
=JMRA
-----END PGP SIGNATURE-----

--=-EhY9WrS0/N/5NtB6wlfl--
