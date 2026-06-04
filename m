Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE06B31F986
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 17:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780595749; cv=none; b=tK3Kjw3WsNoJgbXuI1FOYF9oer46qlh7cz+/Od7BZZ0aYkSbozjFyzbQVhe7x8E1QuLmfMlSZT6XQa77CZHY12bfDDMjIN+EybolLXBth6pObL/Pdr8S/5gN0Ms9vvK5lue/UnnYG2DSFqAh2dezfX+aA2vb8pfDeelgkxrNk3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780595749; c=relaxed/simple;
	bh=itor6l5kPZdXJA5G+aXSyR+dtIYehG6irSee7Mc/Zpg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M8QVZnA0gfcQGl0771gms8cyizRG8lBpnh64r1U3gfH2Xw17S+/7YhLvNFda0ReJCOMH2Hr8PU2XUkBHHViDj+p3LQJvzKidE/+mthmb+aHsw8e68uojj/YGTcNfgdEyWBfomfD1yd97JDOLF/pIEx+mFW7Ezet3vaeXdrnUamk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=JZQqY9qx; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="JZQqY9qx"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ccda0ac4fcso9647776d6.2
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 10:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1780595746; x=1781200546; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DawfPPs/VlF6x3aIqXp0EAQWWubcnA/+I720V4GKUdY=;
        b=JZQqY9qxToSTGrcEjdy4SSz69jA5DaJ40GaRl0tSyo1iHVXgXiyPivU2Gna+2PszvQ
         8p+I1cSm7XqX9POxIdHB8OOs3MViRE4ZDD8bKzx2ibsNTHjtoif2Yfcuon0GLjDLdniL
         U2awXnztXX3yufynGFpB0Oq66tWXadO+LVNMHd/eDmpoIHNACORex09ORjNXNADlXv/W
         05++oakKa2B38IsE/P23SK2GKVd7wS+lR5MNfXi2WSEh/hNGaVLA+/pZrh26Cb7a7YbF
         L4lk22D4hNrba/NdIy64hUjSAct9VrUpjmGZJx8hP9xkGxU+txVbUkVlITX4w1OadnK4
         jpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780595746; x=1781200546;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DawfPPs/VlF6x3aIqXp0EAQWWubcnA/+I720V4GKUdY=;
        b=oGY4C+03A++qbjrHUNQyO+Q0GtLw+BT8Qdr8ZS2mxZkYgbSrNgGNzqcBZAJLhvFfgA
         fxkrCGPMocl+jaHcWGf4SUgrRhAY4UadMli9t3/7N/hM2Nf6hssXmPi8Xp8m9xB7zRCw
         7JHO5ECFzXDua3J4M+ayTJAN7MU09Al4b+kpWODnuqahmBoH2Sokaurh65yLHiQrsyuB
         XBKVjpJWj/mz2C+aQIOfseN8F44NLt2f8aNVSdQgXeiGkdr5nGVmH6QIEJGcVXfNkRyT
         ofzdzfX2CC9vvxZfzY5PiwLTl4RnLMyK1IV7cfXo6xOzgDiZ8HGNuHPvXlpkAume2apk
         jiRg==
X-Forwarded-Encrypted: i=1; AFNElJ+hC+b//43N7pIC4+6sLkzfmy2JWqEfyKDLo2MAUa/z8tyCD7V/ED1jgjeckGsAj6VWZJzFu2SqY3q/bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxluGFVovHHOp8Q91cqAszneDX2OoFcWPexKVqRf6HFZasnh9GC
	mO1UEgF+gZOc1sKS4Y6rmGeCi4ZljL8louUcEbdvAeI3eqzRbbGulIQPZ8S2o+hQTgGWbR5s+Lg
	9IpFyQVsNxA==
X-Gm-Gg: Acq92OGFg8aM7lK6Ltkt7UGihFrZDAqHkJuqxuBgPuBcTD6ElfvDcP5mzgbANBefc2Z
	O8D5IfynLeorEctfioyzcTE1hHlQVgvpY9JyQGXlhgbqxV7SLKeVqdAzmLky4PyzQTnbxbjiU6R
	TsPxZThP+EvZQv9gAryPx5HcoTnEIiISZOvPaMJOe76gDIZ7a5WxnBJ6Tm0FKfSr+eK2KA7VdEd
	DFGpmMMDdT1C4I2to9v4Fr0IIN/uii3+tXBGDxDnCf2PiJUYCPYEZEkPiEwnybRMmXPsrOtdJ6i
	XO7gPwBtjQChuCePQvLXbeeEHzbLaHdhhTyjcqwORsMWqiep58IGLdSVl82oF5xwqruiyT70qO8
	1BNM1OTFZu1H3u8sApyaO7O2jAN10DUDlQHRsOvSttuN6eTAVnq8WHxhjorTC6SzznzJ/lj2gTj
	5d4m58GxdlKq3y2aomm6CL6XmGHFou1LcgocX+JacKOWrraXUSXo3QDZEfVZsfRR+NM/5gE83xG
	WGuVzcK5+C6nVhpZg==
X-Received: by 2002:a0c:ff0a:0:b0:89f:2fa:a9bb with SMTP id 6a1803df08f44-8cee5fa9207mr2615276d6.9.1780595746464;
        Thu, 04 Jun 2026 10:55:46 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd077be8sm58184256d6.40.2026.06.04.10.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 10:55:45 -0700 (PDT)
Message-ID: <19e8afe8034dac6873d8cccede295492bae7f9f1.camel@ndufresne.ca>
Subject: Re: [PATCH v4l-utils 2/2] Fix expected length calculation using
 bytesperline
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sarah Gershuni <sarah556726@gmail.com>, linux-media@vger.kernel.org
Cc: hverkuil+cisco@kernel.org, Deborah Brouwer
 <deborah.brouwer@collabora.com>
Date: Thu, 04 Jun 2026 13:55:44 -0400
In-Reply-To: <20260524204400.8287-3-sarah556726@gmail.com>
References: <20260524204400.8287-1-sarah556726@gmail.com>
	 <20260524204400.8287-3-sarah556726@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-2OTAPpf7OrHOji/5+tWE"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-2OTAPpf7OrHOji/5+tWE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 24 mai 2026 =C3=A0 23:44 +0300, Sarah Gershuni a =C3=A9crit=C2=
=A0:
> The current implementation of get_expected_length_trace() assumes that th=
e stride is equal to the image width, which can lead to incorrect buffer si=
ze calculations when padding is present.
> Fix this by using the bytesperline value provided by the driver instead o=
f width when computing the expected buffer length.
> Keep the existing format-specific logic for formats such as NV12 and YUV4=
20 unchanged, but base the calculation on the actual stride.
> This addresses the TODO comment regarding incorrect assumptions about str=
ide handling.
>=20
> Signed-off-by: Sarah Gershuni <sarah556726@gmail.com>
> ---
> =C2=A0utils/v4l2-tracer/trace-helper.cpp | 7 +------
> =C2=A01 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/utils/v4l2-tracer/trace-helper.cpp b/utils/v4l2-tracer/trace=
-helper.cpp
> index 6c296dbf..a56e2d02 100644
> --- a/utils/v4l2-tracer/trace-helper.cpp
> +++ b/utils/v4l2-tracer/trace-helper.cpp
> @@ -233,12 +233,7 @@ void print_buffers_trace(void)
> =C2=A0
> =C2=A0unsigned get_expected_length_trace()
> =C2=A0{
> -	/*
> -	 * TODO: this assumes that the stride is equal to the real width and th=
at the
> -	 * padding follows the end of the chroma plane. It could be improved by
> -	 * following the model in v4l2-ctl-streaming.cpp read_write_padded_fram=
e()
> -	 */
> -	unsigned expected_length =3D ctx_trace.width * ctx_trace.height;
> +	unsigned expected_length =3D ctx_trace.plane_bytesperline[0] * ctx_trac=
e.height;
> =C2=A0	if (ctx_trace.pixelformat =3D=3D V4L2_PIX_FMT_NV12 || ctx_trace.pi=
xelformat =3D=3D V4L2_PIX_FMT_YUV420) {
> =C2=A0		expected_length *=3D 3;
> =C2=A0		expected_length /=3D 2;

Stepping back a little. When I look at all this, its not clear why we need =
this
expected length, and we we only dump the YUV data based on this length. Sin=
ce
this helper is only use for when V4L2_TRACER_OPTION_WRITE_DECODED_TO_YUV_FI=
LE
env is set, I'd simply this a little.

I would propose to remove all format/stride specific code, and just fwrite =
all
the planes, in the order, size and with any padding the driver have produce=
d.
This way we get the exact dump, no truncation, as one would expect.

Nicolas


--=-2OTAPpf7OrHOji/5+tWE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaiG8IAAKCRDZQZRRKWBy
9LkRAP9flfRp2PD19a6kK4xFghMqLTwVqvcPi23rGoJWMRPLhQEAwXvmfcPBcU1c
I9KV4MjQxgRAozXjYmSKbHNzlT7Dywo=
=mujs
-----END PGP SIGNATURE-----

--=-2OTAPpf7OrHOji/5+tWE--
