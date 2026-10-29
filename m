Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277310;
	b=lfo+eFpGEc5BJO1rFz5emFo4kcEKW/v8R++q0T0+WWqXcloCa1G1D1FEpq6hg+bbzE0k
	 LDGC+tS5GRA7+3FYOrq6SrSCI+rgoHtqcnJbsGJfF2Y4Mo5MLl/bSFgeDCVmepk6zZGhd
	 wa3jAwL0fvWeyhf79RmrAwTvNrpdiagO6sjEKTRB7+uJeux7Nf1oHUGoqKlB2zyQUtDc1
	 mKwULnEt6/f1zDQPhiPuefEEKJUeyqZsloaZJuUZykU1HrYdsd/6/hQbeeY1jCM2nWe9W
	 o6udfRnU5+jtQ+BdaKcF+U/SpEgPomNY8LVU4023/Hx1wTZA4pP4TgF3lAAbc2FaZWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=6kQ8SFr/1aSJP3EBOzJKpTmE0YGxTg5vsnT5Ep5OnM4=;
	b=sdQhg4BRzusaBUkS9spZMweIbd/t7jig5lqPFTzxgRUILEaSrYX48VslPJuE2016COVm
	 SYxgR1XjeJrEv68NCUbmon8HYGi0tUiKtMtssBrI+z1CTOWsmnOVBnR+0ZhYvnYSO1Gnw
	 VbVwwqU9JeKVrqXU3pQ5UPMedsF3c+bveD9/YS1qq43i58E5JrkgvnyCXt8jsFSN8Atrd
	 FgEDBGoBg03s9lvQXaxVkaN2JIUJ+gG9LjBkyQUZzbU54JGsb0GMQ9yfLKdgrpRLBoObo
	 6f27OH3f2uBixMBpXXhs9V70QN9eYw4Fg2ix9cC7llVwa1/BR2RUSZfV+lByNzwRZPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="I/22+Cts";
	arc=none smtp.remote-ip=74.125.230.201
Received: from mail-qk2-f9.google.com (mail-qk2-f9.google.com [74.125.230.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27BF606A31A
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 12:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C27BF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=I/22+Cts
Received: by mail-qk2-f9.google.com with SMTP id af79cd13be357-934956d1044so128319485a.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 05:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793277308; x=1793882108; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6kQ8SFr/1aSJP3EBOzJKpTmE0YGxTg5vsnT5Ep5OnM4=;
        b=I/22+Ctsp/MkFLlOcE9MXROV6LNGac5kjH1FHInppJHs7r5k0gQPZFj1Lj+yQwe1P6
         4OnEkBAhBoJwHyYprrOuMQJfnYgetY+0wAV/cwXbCgQ1VOw9JHK69cJnORmRXCxo2S5+
         4nI9JdoienApCxKJOa6rZdl5PSjsYsOAZYyVb9Wyd2NZf9Bbiij2iCwluZUPXCqt5dhz
         GdBoOPXNtP1jtrduNxgySnaPK/2crDEHsicEDqNXnvUT0ls7dPlnXsUNba9QJnUb5Wgh
         JAO++bBrzLcdozD82dGLop5mNBA9M1+FX030x2AFHx+Bq+pD1uzaclOMBZRLT08pHKPi
         XvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793277308; x=1793882108;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6kQ8SFr/1aSJP3EBOzJKpTmE0YGxTg5vsnT5Ep5OnM4=;
        b=jusxvAo7ub67oayTey2C6WQcldVzwAiWl/FAqTFuSUG/T+SUSe07DspaUTJcCHvJGl
         4JvSkauaVjfwfDhgm4fNGqNbE/mB+E73TWdHEHeQ7KSLMTGbIFT+9b6zmxdHfFunNkh/
         Ese3YJvWlE98J1WR7AxokX46WJGtxF457qygQA4JUCgmChYSssmumoDqoPX1sTpuO0RV
         DhXzLOM9sCrBr3xTNVu+9IREW76ueMZAsz2jCJDDNsvJNra5VQZAwbG1ksr00NpDR1fC
         lun38z3CMqK0/zklEfiFtehqRN0OP+SIaShqovHk9FN8wLOi/2fH9ODRmC0bj8Cy1FdG
         W5+g==
X-Gm-Message-State: AFq9FYK6xRNdYvD5BXf6Hu3+DjeGu5x0qLyXAws98CpnEAH2YVVm/z1f
	AQW7XQRuRBoQXssPEmlNk+2/grtvWly9kdaNE/Afy1ODFqz6h+Zd4dvErLnc4lONjSk=
X-Gm-Gg: AYBFou34grGvkj+V3WBdF0KsurshAjFAEf2XF0w1OOSztPltWhoqXp2uvjM8tqeqS77
	NGAABKktJhMjmlA4wWASgIoq0gz0ihO2QXlrv7wdPzXwBTCJnTB0ulk8uynpVZR10/QPGajLbD5
	qd0VAW1xACAdFoLAtUyVeGENEL7mHi7XUbXQ4TXPxTNr1MTK7qm0uadtviwjS4frkDzit77sjZ1
	PBcdv2t6xkvZjoZ0pDmBVYeEMzK7Eh3xGgrmM7mlraCWO7jO4tRZ07YLc6jaS4eh0wv9IQAe3y/
	wf4qomfT5bopbdXh766KkUiVi5nHnwexs68WUneIPhP9ztcKmg8UjG6aZSNH097EoJXbXzhBWcQ
	Q2Km1phM/wIXne2ZVAAeZZppuRCQf2AY4M5U07xFy4mkWjUEL7OiIKIw7JNSri2XpLnPJ/LPpd/
	lcUdgi546F+fHJM3/fDEOv6l3I8stp0YpejwLvJnWJxCKKYpkeUEUJyiKC5GiFWSQI8onHUQwc9
	u56gY0KvGH/6Lg/IrcXbsl3mVDNsmn6jjPGRQTCm91Nl+Xj1wkuo3+JVHzNSPE8KzE47av/3Ko6
	vlNmt8qkBMcDnJ0R9Xk7hEbClcATDjhX7ewxDH1L71BXKLwf1QpWcbo=
X-Received: by 2002:a05:620a:6f0c:b0:93f:571b:c733 with SMTP id af79cd13be357-94408aa2728mr752183285a.13.1793277304876;
        Thu, 29 Oct 2026 05:35:04 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f067f330sm1533588085a.24.2026.10.29.05.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:35:01 -0700 (PDT)
Message-ID: <e9fa77f78fbe8e9babbb62fae815a96c03e458e0.camel@ndufresne.ca>
Subject: Re: [BUG] rkvdec-vdpu383-h264: wrong pixels at horizontal
 de-blocking edges y=4 and y=12
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: valery bokov <vlry.bkv@gmail.com>, linux-rockchip@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-media@vger.kernel.org, Simon Wright <simon@symple.nz>, Ezequiel
 Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 29 Oct 2026 08:35:00 -0400
In-Reply-To: <0b3f80aa8522d1f1655c3696848456dba4edea22.camel@ndufresne.ca>
References: 
	<CAN9BvpqAL_Hb2cR52EkYmkdm37ej2qKxFh2bj7F6Ei_bg-Sw0A@mail.gmail.com>
	 <0b3f80aa8522d1f1655c3696848456dba4edea22.camel@ndufresne.ca>
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
	protocol="application/pgp-signature"; boundary="=-+sRQ1hNN5RkJURs9Gd7y"
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


--=-+sRQ1hNN5RkJURs9Gd7y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey,

Le mercredi 28 octobre 2026 =C3=A0 17:02 -0400, Nicolas Dufresne a =C3=A9cr=
it=C2=A0:
> Hi,
>=20
> Le mardi 27 octobre 2026 =C3=A0 16:20 +0100, valery bokov a =C3=A9crit=C2=
=A0:
> > Questions:
> >=20
> > - Does anyone know what 0x618 is? It=E2=80=99s outside the documented f=
unction
> > register range; I=E2=80=99d guess a cache, prefetch or bus-interface en=
able.
> > Does the BSP (mpp_rkvdec2 / rk3576 init) program it at power-up?
> > - Your FIX.md notes mainline throughput is well below the BSP=E2=80=99s=
 (=E2=80=9C4K
> > is ~30 fps vs the BSP=E2=80=99s ~112 fps=E2=80=9D). Some of that gap ma=
y be this bit:
> > on our board, runs that come up with it clear are ~3x slower.
> >=20
> > A fix would presumably set bit 1 of 0x618 in rkvdec_runtime_resume,
> > next to the priming. That needs the register mapped, either by
> > extending the =E2=80=9Cfunction=E2=80=9D reg range in the DT or with a =
separate
> > mapping. I haven=E2=80=99t written that patch; I=E2=80=99d rather first=
 hear whether
> > the bit is known and whether other bits in that area need setting too.
>=20
> As you probably guessed by now, neither myself or Detlev have tested susp=
end
> yet. I did some search, as I don't have detailed registers description fo=
r this
> SoC, only the MPP code as reference.
>=20
> You can certainly attempt some initial fix. The register block in questio=
n is
> [0] Vdpu383RegLlp_t, and the register is called SWREG6_LINK_MODE_EN. That=
 makes
> it quite surprising it did read the link table at all with such name, but=
 this
> is what I found.

As you mention off-list, I wasn't checking the right offsets.

			reg =3D <0x0 0x27b00000 0x0 0x100>,
			      <0x0 0x27b00100 0x0 0x500>,
			      <0x0 0x27b00600 0x0 0x100>;
			reg-names =3D "link", "function", "cache";

With 0x27b00618 falling into the cache registers (already described), which
totally make sense why performance are affected. Assuming a static cache
configuration is working well, I would configure it properly probe and then=
 do
save / restore in suspend / resume. I would avoid doing just the one bit th=
ing,
as it can bite later again.

Nicolas

>=20
> So I think we should map the LLP completely, even if its mostly for futur=
e
> implementation. I was also checking the LLP driver downstream [1], and we=
 seem=C2=A0
> to be missing a lot in fact. It seems like starting from RK3576, the LLP
> capabilities have got much close to a command buffer.
>=20
> regards,
> Nicolas
>=20
> [0] https://github.com/rockchip-linux/mpp/blob/develop/mpp/hal/rkdec/inc/=
vdpu383_com.h
> [1] https://github.com/rockchip-linux/kernel/blob/develop-6.1/drivers/vid=
eo/rockchip/mpp/mpp_rkvdec2_link.h

--=-+sRQ1hNN5RkJURs9Gd7y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCauM9dAAKCRDZQZRRKWBy
9MdwAQCVfeh3kW9745VIqV5e8dZQeDQnuq0Fa1P9lqgAa+imygD/QHRyu2DXbp9h
nYh08oXkod0XNuGQFlBHn9dzQ9pV7go=
=+2DQ
-----END PGP SIGNATURE-----

--=-+sRQ1hNN5RkJURs9Gd7y--
