Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768854EF137
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 19:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623503; cv=none; b=P2K3RWftxOh5noGb3UXIdbfzxFzg9ANTd3AOE429Awif04gGEo0G4uu8RaeGv2K6JFDFBO7JmXFn9NIyvRiB8DauTz5JB4SsHjFRHTNYRbXURQwvdE/fZLFnSM5hOq6wh3zPEACKLUfaj7Kw8V5Q7/ujpgWxhpvnWq1wyLDFBVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623503; c=relaxed/simple;
	bh=XndfIyU6r9YvcxwPv/Mw6ubO64xo7+iWYBKFUNYeDr8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eJyue1rL7ayAGQR2TkUW/MtHLe0z4KYkpJ/UwLEqrXR4kjWO1U38/FP+ZLfTRoC47HyRx0hTW33qQQokNlos2iq2DtJacCgEB3IknQ3HXPaDUBedLbOtDHSmuVpYHJskVRwBunwW9C59aId4fPHHAJz+DAKOzSr2C6i5iCjl8Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=BQDG8MDM; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="BQDG8MDM"
Received: by mail-vs2-f38.google.com with SMTP id 71dfb90a1353d-5cd63c192b9so1168511e0c.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 12:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790623500; x=1791228300; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XndfIyU6r9YvcxwPv/Mw6ubO64xo7+iWYBKFUNYeDr8=;
        b=BQDG8MDMKN5/4CcZ0SbIMSzq2CrYqSxCvIFYcoYhXP8zRwvw47Bq5qwKErLVKaQYXN
         DshqZAFuMNHhVkhD6fJjgnFxTB63uCjCVG1x99JMDXjejDfiXg+Y9tsRmktDf47xYjre
         DvLge98ijOvE00mZXFHd6lu0D3+fftVxlX+xoDAlpnhY/KYuQdpYN4sYaSmaw0DZYwe7
         4kgMdX9G521XoN3QmI2i9yUtmdrWlFoegVd75MubXm97dPpEzUPpNcg03Sny7CxSsnQa
         m/RmO3LdTnsxFdkP7S1ZZ5lDfKkqCRjcbyh1UTx/Wr7zTyLbCfap6APQXQ9wMu6pH/Sj
         h6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790623500; x=1791228300;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XndfIyU6r9YvcxwPv/Mw6ubO64xo7+iWYBKFUNYeDr8=;
        b=xPdbJ4R59H97rwqXGYi7Y5CjX4ANfscTOYuhxQJ41V0tA/cPpUFshetlKP65fBDGfU
         mvqkdWTooAZJ2LvLYndGip1CRds5mpi3v2RWKeZVT3/PjVJn8g+ctoSR26kzk2Frmwwc
         LASHg40/SNILNqRRzaKHcQnImrAXR7GBq/V7nu0qXRVqhCPVI4bE2SJ+27uGamEATjmZ
         kfoil1+1SijAkiJNoaTEMVQI11YPalniXuE2XzTi5tgeAUi1hPbAJBxKqLYY5dqaQiq2
         v2Q7m0a5uM10T2fR6gZUz8wiCJ9gZ9jOE5XMUwal1VFtJhK3Kd9LrI8xHrLTAMo6D+Ey
         fdTg==
X-Forwarded-Encrypted: i=1; AKwUvBx/hzN+JSxRzkgRXoPOY14qLUSmLWoXun3nW+T3IIPzT3CIPUfRTlZBBL5NsoxDT/Qljd4310SZP4/lIA==@vger.kernel.org
X-Gm-Message-State: AFq9FYImHE3neFtT//DLcVr53jfRJ5Hr5xN/kCxgGs34KYbwMeMtsp95
	NipxrkZHxGj0Xz4GqGg5KD3yARsdRc5vizq+YfS0nd3136egV4HZkEfYMf26fpSnRis=
X-Gm-Gg: AYBFou2DqVj4a6ww3hQiIWCTRsEHg+Yqrvmv0QtiNa2ItN5rd7l61oNH0BBdXZTQZMs
	hr+NEfMfJVI8g+/6YL0idOxNT9n1pRbOzIrTOJZEmBFWa01s80asLptfS8SM55F0N6MoBTrq+OA
	wXcw4R4uQr+CcI5zPlILQ4hdjlrqmxPKovlopa6Cff6RdV3WHofRDqXMKBs8Tenfd/auYxQGxEu
	lCjIKYbz54N/LOtFEvahH/BThczCy9wUtNNSfJmw2oHU5QGWKQNoqBNTkuaRVzYtdfaWoclGG9B
	iFD5NzNq5f1oX1AVvVyTr3lCFCEtpb6ceUqCCjwHg3Q3fuI9cneRdbgPo3rVjj5vLzJmzQlmAXx
	ElD9CVXq7s9xQ3EmRNSlVR1Boi6Ckpm1fjw9wWnJzlqF+c/MepxYSEunduAZ9PH77q/5f/qjFte
	PJxmg7Bm+HtMDMdgyT2+x85LzXBFhUscuFhiF2FsrJbQr7vaJAw0Yj5ADY/zjNI/BXWwoB7/Pre
	AZ5IRbVpg5cBw==
X-Received: by 2002:a05:6122:1824:b0:5c9:a60d:3279 with SMTP id 71dfb90a1353d-5cc9725e832mr3885568e0c.13.1790623499322;
        Mon, 28 Sep 2026 12:24:59 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde577632bsm10943087e0c.8.2026.09.28.12.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:24:58 -0700 (PDT)
Message-ID: <c955b80d94f4d9c254c3b3f672a19abd1f7277df.camel@ndufresne.ca>
Subject: Re: [PATCH RESEND] media: imagination: Fix value clamping in
 calculate_qp_tables()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Thorsten Blum <thorsten.blum@linux.dev>, Jai Luthra
	 <jai.luthra@ideasonboard.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, David Huang	
 <d-huang@ti.com>, Devarsh Thakkar <devarsht@ti.com>, Hans Verkuil	
 <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Mon, 28 Sep 2026 15:24:56 -0400
In-Reply-To: <apU3tgw67BSgUrPe@linux.dev>
References: <20260727094729.408762-2-thorsten.blum@linux.dev>
	 <178514849109.506511.14905916758246243206@freya>
	 <apU3tgw67BSgUrPe@linux.dev>
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
	protocol="application/pgp-signature"; boundary="=-VyzvKX7oN+jX10HhRE7L"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-VyzvKX7oN+jX10HhRE7L
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 31 ao=C3=BBt 2026 =C3=A0 10:13 +0200, Thorsten Blum a =C3=A9crit=
=C2=A0:
> On Mon, Jul 27, 2026 at 04:04:51PM +0530, Jai Luthra wrote:
> > Quoting Thorsten Blum (2026-07-27 15:17:30)
> > > The local variable val was never clamped to 1 or 255 because the retu=
rn
> > > value of clamp() was not used. Fix this by assigning the clamped valu=
e
> > > back to val.
> > >=20
> > > Fixes: a1e294045885 ("media: imagination: Add E5010 JPEG Encoder driv=
er")
> > > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> >=20
> > Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
>=20
> Thank you for the review.
>=20
> Could someone please pick this up?


Picked, ty

Nicolas

>=20
> Thanks,
> Thorsten

--=-VyzvKX7oN+jX10HhRE7L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarq/CAAKCRDZQZRRKWBy
9DueAP9U9neAoj+PcUTJFYE6Zxlqr7GMcyTEe3D6YeK0UmxiYgEAn1gfGz+AsGOe
+6P9lstLgvFaztro8Dq2UHArKxoCZg8=
=zCs4
-----END PGP SIGNATURE-----

--=-VyzvKX7oN+jX10HhRE7L--
