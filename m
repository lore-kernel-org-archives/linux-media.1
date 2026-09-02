Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE00463B74
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 13:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356186; cv=none; b=QRXO7owZq7WP3cmsDkrLmiVgrgOqULRNcNplWeNJDFvq6J4LVlohNJZ0ENFdOZ1EcQCymHA10/wMQDsfOWDDds4s8R5gbwjZ78K1/4IsS2HavCMxFjuHhOe0Ro3VpQVAT7+94G0oNd6MPVEis4A0Jf1jDcQxiQOMDu1T00HZGag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356186; c=relaxed/simple;
	bh=3CYM+Lj8adrA0mmZuKVvz3V/caKQqG6qvxCDg8guYS4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J+cSAmWEO2THnqKjlOWfDG/3VeYrVoFC3Hyu4H+TvXoFVIz6EmKighr7PlM/1M+k3KvfLYsl1rNgWn338vV2+38VciiRMq3ZVYSZLYvVcO0VYYkWZvTilrNsQmmilWjYTaBZ8PiMq2+H1vlAOI/YB/ADFm42vlQWZPEbsp2+ydU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=q2JvC2SN; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="q2JvC2SN"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c25b3c641fbso123070166b.1
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 06:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1788356183; x=1788960983; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vuXW1tbJtkxbrfPM1uLUh4f0J+sPlf2tnYx/oi7ZZq8=;
        b=q2JvC2SNwP/lo6myzH9Eh9t6x8iXzEZWegX6X72jG39uMZYnoLo477YSA939f7RfeJ
         t8HZ3qBTIbcrSPNqKhbrMyKCNw04uzCBOS4kEoJqwNX3f/ESSGjVODJGNtQuwnjNTp5D
         9dTUzV9oMfI3nHFxdO4dGFGMdmE3Gqx8vvsh2TLwQwyqWPi0tsJ4GDlAQOeo5moANWNB
         68moMyVg/GAgIAcNbsCrjz4hsklW8u8xzq/yfDNv/RuUe4pigBl22D3S7Rsv6kY1a69v
         lRDpCpDGfFMoiDBC9Ox6EscX+sgFL2gFqU/q/9RnuGaFK6MJgd7Wa512pzPXPLnjIQwU
         uGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788356183; x=1788960983;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vuXW1tbJtkxbrfPM1uLUh4f0J+sPlf2tnYx/oi7ZZq8=;
        b=cSMP41fqpytqD+j1nr247+2rd3jfcaU52veVRw3DlLZK9lYPCua9PHxrAqZ1r4HUX5
         og0J4qcjle98Xh5fouVW1mWKzinsfjbj+Z/9BnT9I1qBsIWiNGGcEaPSG7YjaNhHW3QD
         j7L9vkQP+wP47tJrNxq7m29GfsQiPuBRAiaJHigX9nmUAK5YRpBIxzddESKg+Uzdgdpq
         OfnChPi2FxSBo+X754fX4vVlDzy+PbHiEVSM/ACcVPTYjNjHPKIlLUcJLUGZzTS1XALS
         cS07Wgs+bpDDxYvi4SJYZ54aF7vxqwurZr1jVrdgvUzKZdJcA7lrnkTzPGKXEjjHEHuw
         hn4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzBnb/chNW8o8EWgbsGKA9c9WN863xs/C/ZzN9HqgHXBQzN5A10sgEA4I2kAIWs+bksRNEgPKYgf/uWoQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mLBdC9DX3ozPlbISXLjqQ3x8Oo0Nv4c4GMZtI+3IfpDbqjlqEJ
	M2+tqZw9SR8Z+kmoi1Jk9mfUZn0kYZA0uAcjJPgrPgvqDR9AIF1u1al0xXsY9S5ZfqE=
X-Gm-Gg: AR+sD13dgCTHYqMpLWNl0lw/BbQL5psq2dHTNbq/sBPbnZ9XsRrCEtoaLy/UzmxMIrF
	QdUcEej+cH8+XUyW2+BDatWm20YoQv9qZaXxFt9NbU+a1gYVivM0NoYKiX+o5Ls0zbkgU88CDoL
	DHUSuSm68g3MRTTehVh4Ylrm1tzd9P+BxJMO9H9/X2wsZFvl1tckm2p8SnV9P4IKe6fs9Xjp6la
	WsJHnPbWalhaBDtpRMplgGCzrZN8mpxecmHKJOuYOis97J1spotkLur5aj0QQq7Bo24RvcI2dqh
	wcF2liY+nMmo0KclsWXEA7aE9uHzYEJ2vz+42pM+PYu3DxDNVeE9VnRVnbRzgeeV8Mpmz1SDVwY
	OgoS7wDSRH1hOPiqrvOBCzc1JnsBmiI2+uohBLNpcFXukZamZdjcJG9M1m7dRAE2B9OoxZ5a+r5
	pF8LTN/649lZ3qx65tz0WWJWac7CHVesTDF9FTjjNXGmnrPiBPD1+5zIhHDK7/NlYp
X-Received: by 2002:a17:907:1c11:b0:c25:b706:e59 with SMTP id a640c23a62f3a-c25d550923cmr320151866b.17.1788356183086;
        Wed, 02 Sep 2026 06:36:23 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e221::c41? ([2606:6d00:15:e221::c41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d0089a0asm134585866b.28.2026.09.02.06.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:36:22 -0700 (PDT)
Message-ID: <9eeb0486bdae8b91acda6b21e5ab3cb53c48b3b5.camel@ndufresne.ca>
Subject: Re: [PATCH v3] media: v4l2-h264: Fix memcmp() size in B1 reference
 list comparison
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haotian Zhang <vulab@iscas.ac.cn>, mchehab@kernel.org
Cc: boris.brezillon@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 02 Sep 2026 09:36:19 -0400
In-Reply-To: <20260901022310.12184-1-vulab@iscas.ac.cn>
References: <20260901022310.12184-1-vulab@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-C5Gbdppvjjf/Zav1hWQN"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-C5Gbdppvjjf/Zav1hWQN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 01 septembre 2026 =C3=A0 10:23 +0800, Haotian Zhang a =C3=A9crit=
=C2=A0:
> In v4l2_h264_build_b_ref_lists(), the B0/B1 list equality
> check passes the entry count builder->num_valid to memcmp()
> instead of a byte size. Since struct v4l2_h264_reference is
> two bytes (fields and index), only half of each list is
> compared, so distinct lists can be wrongly treated as equal
> and trigger an incorrect swap(b1_reflist[0], b1_reflist[1]).
>=20
> Change the memcmp() size argument to sizeof(b1_reflist[0]) *
> builder->num_valid so that the full byte length of both
> reference lists is compared.
>=20
> Fixes: 624922a2739b ("media: v4l2-core: Add helpers to build the H264 P/B=
0/B1 reflists")
> Suggested-by: Nicolas Dufresne <nicolas@ndufresne.ca>
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> Changes in v2:
>   - Use sizeof(b1_reflist[0]) * builder->num_valid for the memcmp() size =
to
>     match the style of the memcpy() calls in the same function.
> Changes in v3:
>   - Fix an extra closing parenthesis.
> ---
>  drivers/media/v4l2-core/v4l2-h264.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-cor=
e/v4l2-h264.c
> index c00197d095e7..2323f559c6a3 100644
> --- a/drivers/media/v4l2-core/v4l2-h264.c
> +++ b/drivers/media/v4l2-core/v4l2-h264.c
> @@ -440,7 +440,8 @@ v4l2_h264_build_b_ref_lists(const struct v4l2_h264_re=
flist_builder *builder,
>  	}
> =20
>  	if (builder->num_valid > 1 &&
> -	    !memcmp(b1_reflist, b0_reflist, builder->num_valid))
> +	    !memcmp(b1_reflist, b0_reflist,
> +			sizeof(b1_reflist[0]) * builder->num_valid))
>  		swap(b1_reflist[0], b1_reflist[1]);
> =20
>  	print_ref_list_b(builder, b0_reflist, 0);

--=-C5Gbdppvjjf/Zav1hWQN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCapgmUwAKCRDZQZRRKWBy
9AzrAQDTaGcoVxKaBRHck5gqtvcJIfwNtIAOaa5HuyQPXbFkhQD/dHDXHfIX8U6s
30GjxadjhvY8MZ41vbYxc5dMNoJWdQw=
=ASYR
-----END PGP SIGNATURE-----

--=-C5Gbdppvjjf/Zav1hWQN--
