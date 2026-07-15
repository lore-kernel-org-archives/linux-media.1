Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2162E37DE9D
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 21:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784151311; cv=none; b=f3Lr6y4k2Tt4Q/Av6kRQjJMiBHtQqIIO6JWa7LGkj0pRGovD1Z2OcskMDEOHiVo8MF9y9w3B3spiH2CEj6TOaYJDvkmO+YfsHO9MzuEH/mWZ1oGqyZsm1uu2p3YWkz2n7IxOGv5GMe9T1dbL6xlZpyKy4oqrioukBbtNL+JfFR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784151311; c=relaxed/simple;
	bh=8osyoZL1Zi6s7wyHTA4n4+ZfLp6YAyvRm6L6/uODogw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SZ7DEqTgoi/hdT6/COQjUHxZ4gy17b4qE/+dk7aCdcwuBOW6y5mWT8brnDnOGwxvl5gC29KRi4g9ftlMPrYwqzDvmwJXOCRizaCdB9EqPHivyddsyJMXO6WliOqP3tQOAYXq5zOk234b35RtZnIJdRMRlUuJK80TGHm6Murfs4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=GdYbQ3fw; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="GdYbQ3fw"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7466771f1caso364925137.0
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784151309; x=1784756109; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i0oVjFQK2ejAAXz4P8kPZme0Eli+uE+tvezil+zX+jY=;
        b=GdYbQ3fwbTjhvHK+fvnrIHJhnnuzRVj5VCOE3ucDJKdpCiapfws8Q9ZVutTdNYvUV1
         51hAnIv8kUv4NhCjAvuwivmPxLiLihE0qNNk5vY5PBp8uLT+SQgb81oeyJ3QJmeazcKJ
         fQ4LFMcsoubzgm93q7+QcAfZ1HZx/CxqyM6N6mIwmqzQrRjmnF6Su+sftmmUAX0fGpMo
         1Uh0SL4za4msqyjpjqqU+zhaQEOfMBQSYNC/60XgC7lA1gSE3iIYYiiyShgyi4uKam8k
         yxrlXJX8mE/RWtDto2PEkgvjTI9FkNuD9E0uJLzljk8WwHDC3oYQkPP54GI0DjO0jjqE
         MIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784151309; x=1784756109;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0oVjFQK2ejAAXz4P8kPZme0Eli+uE+tvezil+zX+jY=;
        b=DCuzkFr/afWfIZeqlkdwXo/tZUv2JSqQPtbXGhC+MtBV/BthtWAcZivaMlyjW8nh2I
         czwPtV/F6f2zHuBWsjqdAVJS2hejOp5Fss+risqsdzkGi5IjuwcrHkujjrG5lrIbCSr1
         BilOdwWmB6cZ/slSYiHgGDMmfto+EXdZB8ayhh6rVo1UeCu7OaJQZpnx/X3dsaH6XFya
         kXaFleEtKnV9n28XXbPzorIkp4By+sL+LE2g/wRhVt82Iiof0InRdCwLWiLkMDSgGFdA
         AchosphBWzQAcI6gdjE7YsvKvPQ0kOzWIIK6WV+9cTn37TIPWuutJNumjAVdJNIPK4lO
         IlBw==
X-Gm-Message-State: AOJu0YyqNIMpEZHfYyBP1sbagedcB+7Vj5g3FHWi2DX78pFBFMVeJzAT
	LhgW0eWpa3XRkJY021UoE8V6AGSdUeeKLAubBkdGRaKDaj4I/4OANqxSOEgHZanazts=
X-Gm-Gg: AfdE7cmwIMqUqgf10d9q+wistBN7fVhjsvDqTNKpbqJ3WtkjMSD0nJFtnDetC4rEVPP
	ezdF2cljggO95fvWdrTLmPmi3k4uHbpRWNDJc3PqdVTlmrGELjw4uHu//1DcCBO37J9s7K3n0t7
	g0Ezs95EMn37fwF+JSJVaTbwnZPJc6Em3Xkp35NkOK4v0vaCy0M0xde+6loM3eFhyc+BmfhCRhG
	wtTqJH2+zWaIIDc2w1Kt9mvdNQvglp+cNlEzPvJUhtocxuuHD8q01dEKC2P5LK/rj8nQiVNSdV+
	pYOXyUNUpiJ6MIq+FolXISZH9bagIy8rullC2QGgnTUf+GKHI2xRVadWBREoVSNOwxLGPZXHqAa
	4JrTVuRVLxsTPI/lmWElxXJRQvap0JBHpUnDkaHmt+l86J6HOUsX3DKnRGxOr3o15PdnL88hRE1
	4adcxh5a0=
X-Received: by 2002:a67:e119:0:10b0:745:7f23:a876 with SMTP id ada2fe7eead31-7457f23a8b8mr4213170137.1.1784151308881;
        Wed, 15 Jul 2026 14:35:08 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed3184b2asm10838154241.5.2026.07.15.14.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 14:35:08 -0700 (PDT)
Message-ID: <ac55379e5e84dd68146dac9cf38d1cc40c5f1691.camel@ndufresne.ca>
Subject: Re: [PATCH 3/4] media: mediatek: vcodec: free working buf on error
 path in vdec_vp9_slice_setup_lat()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com, 
	p.zabel@pengutronix.de, benjamin.gaignard@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Date: Wed, 15 Jul 2026 17:35:06 -0400
In-Reply-To: <20260506084203.202882-4-lihaoxiang@isrc.iscas.ac.cn>
References: <20260506084203.202882-1-lihaoxiang@isrc.iscas.ac.cn>
	 <20260506084203.202882-4-lihaoxiang@isrc.iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-BPGkvXWrEAcE1IG1kYVb"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-BPGkvXWrEAcE1IG1kYVb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 06 mai 2026 =C3=A0 16:42 +0800, Haoxiang Li a =C3=A9crit=C2=A0:
> Add an error path label in vdec_vp9_slice_setup_lat()
> and call vdec_vp9_slice_free_working_buffer() to free
> working buffer to prevent potential memory leak.
>=20
> Fixes: 5d418351ca8f ("media: mediatek: vcodec: support stateless VP9
> decoding")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> index 0f47b2671353..673b17d0dd8d 100644
> ---
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> +++
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> @@ -1172,10 +1172,12 @@ static int vdec_vp9_slice_setup_lat(struct
> vdec_vp9_slice_instance *instance,
> =C2=A0
> =C2=A0	ret =3D vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
> =C2=A0	if (ret)
> -		goto err;
> +		goto alloc_err;
> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> +alloc_err:
> +	vdec_vp9_slice_free_working_buffer(instance);
> =C2=A0err:
> =C2=A0	return ret;
> =C2=A0}

--=-BPGkvXWrEAcE1IG1kYVb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalf9CgAKCRDZQZRRKWBy
9GUlAQCiIYGKuOGYT5TanEl67O39XYvu/biLdLS48sx4lqa2UwEAq720eTrXwm+3
GboJu4m0lDSSaP4OwRGYTcVkIJSRGAY=
=bkfy
-----END PGP SIGNATURE-----

--=-BPGkvXWrEAcE1IG1kYVb--
