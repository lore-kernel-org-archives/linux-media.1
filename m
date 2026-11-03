Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744079;
	b=UJaZja1dG0Nd67lQpsoZFNFll0XDYdgpeu1eq/m+LXqmzIDpCAVYhuEKhWPaEddRAo3f
	 BaiZgDTrcuLN0fpfpHtpHPMU1EOOBUWZqezc7SXf7+91oOlOmLXZUmhD0qRJ5iK33vG77
	 aqIDaZ9xzfB73kHn0FbIhH7vA4f9I6LwFi3qyh/B8x5FhyZ4YhAN/cFpt0kxu+BSWtrzT
	 brGJUnVPdM5solGZJQ3TEBVk6Lj7SdDrxUXvoNWffbDwA7PND0B9rLRDZZlL8/1qaJoy6
	 WQp4y2s8NRJZrNHT8cb/Ynr9jRSrzAzncr9SYbqmRvgCgs2THNyqp4GpBj3kRZ4XtVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=0whMpu3SwCyyOwYZZQpnCeH3x7hbfijj32FSntRg5eg=;
	b=mzpPw4NiAGqOsHubL7boZVX5eGZmAaarkIM4kBu6xpWb3QPWbVpHT1/Y47ZVHvpKjXas
	 q7MBe5PrLkVg8ysk4BW/gu98NXa09AutrHgiS1fTFdAwzElnmsyt5oRbenlx3BPc+Fnq8
	 71Jb0MH47MBn8/nH8W+WyAUH3VN5fo1SFxIhN4gKgvS3N1rmLC64DpxTKeRDaKIL0UFA7
	 vP56/muX+Ej8gFHHAre3jRLySsdb8eltuCuxf80XCUSG9oNrL4t0F6z8rHWX2X0h2ZxDZ
	 CiMmwPFoXKtrmrs4ZLt8efLABo7Rf45Y7GbbsneFgAEZX14EsLBj1isbGX/TNU+l8vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=S+wRv2wK;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4E5606A326
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 22:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA4E5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=S+wRv2wK
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-54465f79af8so164531cf.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 14:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793744077; x=1794348877; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0whMpu3SwCyyOwYZZQpnCeH3x7hbfijj32FSntRg5eg=;
        b=S+wRv2wK1q+ylMssFA8QEQJbCrILnVnOTvEbUvFi2wtCpN2XJC/RHGpvN6sCyZjVMl
         gcojuE3280oN1+PAwH+r10TvObtAUJhCxnHEarRySD29DR1V/P06L98L7at8YnclsVQd
         UbDY8pG7lEXqe5/rb9EADlFAzzW1qe2F/EXr6AQDjGUS01HfEKW3TFpVHaNyjAGzPJ9r
         5BCzQf0BrggGkIQ4hWOOKKJlW3oJ5k5FYg9xPKmwP0ohO7Wj1oMZVE7eugD6AVsNQZ3W
         w1WVO0hYf1RNuiSzYTdiYB2/IRjqSsjHrQQNMMU33RRrJEmNPQEI0/P6Q1w1SDBPiXrw
         Eukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744077; x=1794348877;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0whMpu3SwCyyOwYZZQpnCeH3x7hbfijj32FSntRg5eg=;
        b=cNPcY8BCDLFKGYrqgAa5mknkBa28FDKpLjB6Ze1AfUppzTrYBC23OKkeYoMhoyytOS
         04sWO8PPixT6S8kcH4c8DFu6T/mfcjbNaf4zhYSfIi0iZZwUEo+cuF7D1E/xgHvK5IRY
         1FrPVaLAcDE3sBMTnnOQZf1aSEl0wLKd1u3W2dic6v6fsLg0wiBuBCPlzjPz6G4VGdcN
         o871PTU1QS5T6bpiBJY20xu/VsbbqHJaDUtnSufNv6SfQeVrWZ+w6kr+/tcgA++DEyh5
         Yee9jc3lTItQdfCAN7kHk+OFWcEOznE650dO2E+lhOYmTAAuUs0RoxR+pDEaTzx9HS20
         6QQA==
X-Gm-Message-State: APuU4Z/uqoT4YNSJAhX/BV17MxVYZEwjrus4fVhHM9+j2J5XIyLe7rId
	ElSY24xrRDiqsdKgPgFRpU4OE6rnwLRB4hdbH9PrmRf8a3unheBLlrGGjf2GKrRC65I=
X-Gm-Gg: AYBFou3v517wm2r6IKDA5Bl8VdVVIaSraO9ygWmb+81ZG9BKZV5eAEDzDoP0w/d+N4w
	CUXhH3KSq96lnybPoXEpVopQwNl4wW+PHonYGejc2yjJZfeIgbweFqhy5m2V0KuyJI7+bCh3sGE
	ymWm19Xli+5xpJ17KPypbYjerkfoCVs8nKdSC7qIdUZVjnNEL0XZSXCEynofAShJ0pZOHdXPWYq
	BWA7WLbO/TDaGAAnaLAKoqkPHl3ZoJlnUFKAl+Kd+KH7QIXhIqy5d19cjJpBDMkv3c206mjiru/
	GvGhRSxN3y1nUXByhOLUM8CuCYgEnT7DP5BTKjg5JNnOGJuYO397rcQjQrGopwjwMRSejrYiATh
	juH5F/gA/7+kfrgQwujPp65HIKDegEeIj22vwW2lOlzrvwP9IIcSSrCxknTi4ZB6LjfAikpKa6s
	UjVCPyuV6AqpcsdODrj6rHL44YFb4xM594iXvHOZTrxx0cO/1L+pn4ViMRWCPihvc+Av/98AzPK
	8ckGVCMYoVR8yfEUS0fOp2bHaU55DfhWV6qv4pOZUNzeAjj0JhOiVQfvcBKrqAftIyRy5Nsb0mt
	wtiN7mDeXerugGAdsawMUkpA493M28krADoiZCNZIFhpYAbG4x6ESpUGRd6jlKOfDxAwspT1m0y
	C
X-Received: by 2002:a05:622a:58f:b0:532:b3ce:f38 with SMTP id d75a77b69052e-542b3e691femr241721551cf.4.1793744076882;
        Tue, 03 Nov 2026 14:14:36 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:bf53::5ac? ([2606:6d00:11:bf53::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b1086db63sm7077331cf.11.2026.11.03.14.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:14:36 -0800 (PST)
Message-ID: <3d6f4b59b49112b4c93fed08f7a85601458dc9b7.camel@ndufresne.ca>
Subject: Re: [PATCH 4/5] media: iris: Preserve timestamps on error buffers
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Xilin Wu
 <sophon@radxa.com>,  Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,  Abhinav Kumar
 <abhinav.kumar@linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans
 Verkuil	 <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dragon@radxa.com, Chris Obbard	
 <chris.obbard@oss.qualcomm.com>, Deepak Sikri <sikrid@qti.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Loic Minier
 <loic.minier@oss.qualcomm.com>, Jason Pettit	
 <jason.pettit@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:14:33 -0500
In-Reply-To: <fcdc09bb-7f70-443c-942c-81f50a695aee@linaro.org>
References: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
	 <9YPKYT3Qcls0jbUWdxOqIWNLjQSGexDoWWE3PUBiJS3UpxTN9rFeicV5aeaeTDyrXqw8emy9LBK0hkxmeEqthw==@protonmail.internalid>
	 <20261029-iris-va-fixes-v1-4-44a2783f782b@radxa.com>
	 <fcdc09bb-7f70-443c-942c-81f50a695aee@linaro.org>
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
	protocol="application/pgp-signature"; boundary="=-WL5Tl81B56C34oK9WNj2"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


--=-WL5Tl81B56C34oK9WNj2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 03 novembre 2026 =C3=A0 22:57 +0100, Bryan O'Donoghue a =C3=A9crit=
=C2=A0:
> On 29/10/2026 04:58, Xilin Wu wrote:
> > Clearing timestamps on error buffers prevents clients such as libva-v4l=
2
> > from identifying the failed picture and can cause synchronization timeo=
uts.
> >=20
> > Preserve the firmware-provided timestamp when returning an error buffer=
.
> >=20
> > Fixes: b791dcfcba3a ("media: iris: Add handling for corrupt and drop fr=
ames")
> > Signed-off-by: Xilin Wu <sophon@radxa.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_buffer.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/m=
edia/platform/qcom/iris/iris_buffer.c
> > index eb8de60c1177..f790483d13d4 100644
> > --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> > +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> > @@ -899,7 +899,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, st=
ruct iris_buffer *buf)
> >   	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
> >   		state =3D VB2_BUF_STATE_ERROR;
> >   		vb2_set_plane_payload(vb2, 0, 0);
> > -		vb2->timestamp =3D 0;
> > +		/* Allow userspace to associate the error with the input frame. */
> > +		vb2->timestamp =3D buf->timestamp;
> >   		v4l2_m2m_buf_done(vbuf, state);
> >   		return 0;
> >   	}
> >=20
> > --
> > 2.56.0
> >=20
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

I'm generally ok with the change, not that I think libva-v4l2 is a good ide=
a,
but we should not intentionally make userspace life difficult. Userspace sh=
ould
not though assume that every OUTPUT buffer in error will generate an CAPTUR=
E
buffer with error and copied timestamp, this would be completely off spec.

Nicolas

--=-WL5Tl81B56C34oK9WNj2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaupcyQAKCRDZQZRRKWBy
9Ka1AP0R8nbzNuhXJb3kDXY4TjuPqdCINWuaAR03XI+T3+Rj4wEA8JM/izovKNbb
aWez0IzFR/4tzcgFC0vw+v6Xqr69dgA=
=gql0
-----END PGP SIGNATURE-----

--=-WL5Tl81B56C34oK9WNj2--
