Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541713;
	b=MBM77WuWoS7i24ocElBPx+XrnbcesQyFmsDlzK5tq7ioSzaZs+b0qQV+JAhS0Vsxx7Jw
	 y+kNli+D59CdzF1LA/u05MnLYAp1vAFc9aU8n1W89VK/3Ssl1oACNG3K+OQye8VsJBgCR
	 sSY4uzEqAoIONWvLbB7HZc7FHVw5H0QV/DprtVdbPfqWNKv09xbXkZ5yIjaUIfhmvC5v+
	 c5BRX2f8HDmuSitiKWiV8hG8wgbKW50XpkVxZ0GaWO8tNHADdIlhIjWWK0RJd4raFinna
	 Fc3uZJ7IMvF7VN3pOzowXc4cf2H9v3c0daAcZ4ckvs+W7vi99iKWHNdvBXFL1YT21Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=rIEikIfePUlYuQtT3faGXOgKua4GiiXoZrCtOyesMsM=;
	b=bOvbfnwoK9S9vSZP43ReXq7XuC2vBamJPPX4nqq8W+TYjVq8JDIxRk5y6OPnAG3TKb6b
	 1g2s6WIJHsOoG6qwHA2BfczE8sPq4uMsH5kcXjs/1GKp3Xw6PVDJSEh5bWciZG1wGCDws
	 v7EYUSOUn66luu860ZSgl6lnui2X/OLfycIy9Hb5M+Qw2JAHhyukk7F17weCsDih6wm/l
	 Vv+wYWzo4m308Ozg+i/FeWy5uK/JWR/jbj48v2XVewa2EncOownWx9AMosYKVSXDMdTza
	 MWr63Pr3I/D9yKiM0cWmnydXY/MQBp56nGdzAf3NGW3uWgco1P7tQMMDex8C44Yfotg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Kpz9gGuB;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723A7606A321
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 17:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 723A7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Kpz9gGuB
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-536c8f958d7so36446101cf.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 09:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795541712; x=1796146512; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rIEikIfePUlYuQtT3faGXOgKua4GiiXoZrCtOyesMsM=;
        b=Kpz9gGuBAbhGNRcVfnOThbhWg0E492RYUCMUgfLbykGqoayXLYpeEBkOIQ9KBwt90k
         OjcfIhqoxPmy5OTa2y+ZjKSzTaCTaRQ4HE+qt/Sxqa1wwKneKylQYJRCxMM4dtkB50Wi
         jwGPVFHP624fcAjAZ0NI3FP5SEcUVi81jAlhCs/VV6h9kB9e76tHyMhz7Ix+iu4kbUEB
         Vn4XL73dQA9lxx3MVEz77r6eXIGdEOb6DpUkHQ16gTjxbYdis8tGhATTBDBh2jBbmc3X
         i0X2HZNbw7ZvKRUMzw5Ew4LA34knTyb4PngMtHiXg7vbq26IEFfNev03Fg3Jay9px1S2
         zOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541712; x=1796146512;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIEikIfePUlYuQtT3faGXOgKua4GiiXoZrCtOyesMsM=;
        b=CkYb32DlB+PDIZr0C9MUocgD3a2yU9H3uGTJBM04B5i93v0BNdXApqBL9L2PKAuy1G
         hiIeBnMiQ5o+b9g2kMaOMufLnBHKWYNz7FSdnlT2DrczumIigWmoyxzVQg977pCOWD0z
         T6ZHtG/gPKu82EygCHnb/jS4ZFStYigFgbFIfq2Fq8vpA1LbxFgzJhWtmkKrZxw1GPYL
         GTVP2tdkMGtFrdqxUK3+iqXFdtr0eyJTtH6da2eLQ/3CwmrlxyiU67Saghm8dvxVLqyg
         zZjciQ7SCLSpXFe2LI/kacnmo6+FSkbtw+6O5koQ5AFHSuuygoj9kJVjhFJnM+PbFEf3
         3jqA==
X-Forwarded-Encrypted: i=1; AL+hErEIuwQRrU/Ox4xPDDcKcpidHgb2Z4U394Qpw4bHMpD2AMokBocFCKzjROddOL/ZcnUcdin2TLNFTF6EAg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8BBkyV8elm3at4L5aR/ap7ssqPxt1s2tpEZ53LdXM9VImM+ZEB
	nlS41uHSOP9NMefZxo2gz69GQNyt2cF9D/p9JLpPNb/2JA9jA+mraNgVyCSPrPw9t6s=
X-Gm-Gg: AZFdTZdjuGrB7KPByo7x+HiBjX0qTuZ+VVx9JQEg4e9bD2yESRn9khwcWjIXdoj/JQe
	dOlP5yy4GLqwHcv3QNv8rJN+fzVWVu5BUcyjyaXfs3xQtB0TR4SV1Tc8bN6cV3IhiG/UG14mr8q
	0i2GsJAWGL7VA7Yewipp5a/MpjUi46szos9JFm4l4LqgZ+rBXjEb7NLJxGywQ2O3Cx4aYTk9odx
	0nMHqv0SExe6naJ8Kz8vRaHmxscpjpE2wQXNzRBaZUkgSN6Oz/cYFIwHrmW8pWIFQ4eicUezcq/
	u053I/KHHTn5DlXX1N9nVR+0gbbh59Vl0Ph/rRhvwunm0AjUB3A1s7YOinsvFtgBvtNnc4RsznU
	UiwCy1lbfo+TheuZP/i+6ffLLYQ2COUaOE4hm2PBLFiRV5mGIdJZYBTRtjBROQmYIrWin2PfpI7
	d6giZrOrGE8dtgLgli7Q/efyH2inM1HOgu4P+NU613xNPaXUYpxKGEfi20WLUTEgMVizFeY6Ees
	o3LXaO9W5EgVKTIQQ/KDPOJIVpmjfMHBHfVIsjm/T+H+T09qU5mT8IqpZm9eCGNRWbcq+TpAiP2
	h+bMj6cfsth7aEIYhyg75nkKSt0ZadKwuZTo7KFCs9JXp2LqLNuSpw4=
X-Received: by 2002:a05:622a:307:b0:55c:cfd:3bd4 with SMTP id d75a77b69052e-55d76a6bccdmr295490121cf.72.1795541712297;
        Tue, 24 Nov 2026 09:35:12 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78811fd5sm134260551cf.8.2026.11.24.09.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:35:11 -0800 (PST)
Message-ID: <5d46d320bf3b956bdd3413f8a88beedf07938fc4.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 04/28] media: mali-vpu: initialize decoder format
 state
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Charvi Mehta <charvi.mehta@arm.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>,  Rathinavel Sankaralingam
 <rath.sankaralingam@arm.com>, Shobhit Pandey <shobhit.pandey@arm.com>
Date: Tue, 24 Nov 2026 12:35:09 -0500
In-Reply-To: <b152209e-6117-4a24-aa2d-59be913850b5@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
	 <20261119153758.1426673-5-charvi.mehta@arm.com>
	 <d1d53edeb358e1bdcd1c262e48074f7f1be276cf.camel@ndufresne.ca>
	 <b152209e-6117-4a24-aa2d-59be913850b5@arm.com>
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
	protocol="application/pgp-signature"; boundary="=-BpfK9v6vcqSHzyO28x9C"
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

--=-BpfK9v6vcqSHzyO28x9C
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 24 novembre 2026 =C3=A0 14:56 +0000, Charvi Mehta a =C3=A9crit=C2=
=A0:
> > > =C2=A0=C2=A0 struct mali_vpu_session {
> > > =C2=A0=C2=A0=C2=A0=09struct mali_vpu_dev=09=09*vpu_dev;
> > > =C2=A0=C2=A0=C2=A0=09enum mali_vpu_session_role=09role;
> > > +=09struct mali_vpu_port=09=09port_src;
> > > +=09struct mali_vpu_port=09=09port_dst;
> > Ok, its time to comment, src_port and dst_port is a lot easier to read =
imho.
> I=E2=80=99ve generally placed the direction last, as in dec_src/dec_dst a=
nd=20
> pixmp_src/pixmp_dst.
> I=E2=80=99d prefer to retain port_src/port_dst to follow that pattern.

I heard your preference, but readability when up-streaming is important, we=
 dont
say "the port source", we say "the source port" (at least in english, which=
 we
program in), and so when a human reads your code, having things in reverse =
makes
it harder.

Nicolas

--=-BpfK9v6vcqSHzyO28x9C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawXKzQAKCRDZQZRRKWBy
9NPmAQCw+FqH8tb2NT0kyezcMofs4qS/3wmckKm7M78C7X79vgD/aZhblqvBZYB0
cgUBoaxShFAf7iLpc3EF1UkY9cuXzAA=
=F9EK
-----END PGP SIGNATURE-----

--=-BpfK9v6vcqSHzyO28x9C--
