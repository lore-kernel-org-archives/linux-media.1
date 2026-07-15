Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2715C3B71B7
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 19:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784143673; cv=none; b=CQ45i+KIffXCtAzu42K3NLF7m3C8vRD7VoK9hq/GPYrAl937PlJpcPYTb6qRtgdIxebMkni1xfv0RiaDyAHQclnbpeF4ACcrDVNpeuEDvwDc+C4ca4VO042ACjZS0XcbDzvjQSnGwCP/Uc8uMUV5MBo/CMh7zEPecRhPPUeGpg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784143673; c=relaxed/simple;
	bh=RGOrQzSOXk0x1hDDZjWhmMo6oyf7CP66RHdHJmLveyQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VjPs7CfCmsrGyu4/SKDOkKEYsS3tJEvRFOKZP8AKKbqNYWhKBQJ6nZrqjYMKtRSFX1ARNW4THQu4RT+THvO/Ovv+j7VJJfhhe81V527PmCGjBEk+Gw4OqDmoy+/ff2g2E6mlviCF3gtJV+yZtnMJrLJhAFfsvjM2b6Pmr9EjjFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=urLwba9p; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="urLwba9p"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c928bf172so39036071cf.3
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 12:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784143670; x=1784748470; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RGOrQzSOXk0x1hDDZjWhmMo6oyf7CP66RHdHJmLveyQ=;
        b=urLwba9pmagBjFFLL+wnEzaeKINyAWsQrt3xUICshfoFuqlnasWGlfBqJy+1wketpF
         YR0MJ2VRHGyCxaUGfF3FunomL06eqMlhy1M9g9HZYO9/fum+boyb2iOkHmmDeqmNzkvg
         S+8+zb6y4O4ro17yWxP6dEfvtBz0SwByLAeuDi0Wtc/8TBI+FJ/FiNUvPVuYvDC+uJRF
         sDbO2ulV4ODUZM9ANzAAPDSBvBbVuewyJSU/fzkuAfYi9HiyXgNZI7RwqS9lrZQa/NWj
         rjwHcjd+nYAl0JNo1Bc04go13ENlIJco0AWB3T7bgg2tZwz8sAL2o4ydicTZAQu1/CQ3
         UaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784143670; x=1784748470;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGOrQzSOXk0x1hDDZjWhmMo6oyf7CP66RHdHJmLveyQ=;
        b=VaTVhDEpILBQiZCKTqcUCTURIw53/ZRmJrBkLWTgPTgYp8e9FfoWEXCPuYgrTJpLeV
         3pwkDWeO7SKekPI8eWAmrLmGOJGZc2hoG8pT5Kym6c2eGslmGoXuozdrvG1o3ea8zmZc
         id1YeHyc8++96bmeLWA56HFDqahDO8kgZzCwH8xCIevIc4pQs7OvDevA034YX30Hed0n
         JXvmXLE4K7EkQB1l6Rz9gDf1P41z9LxTcqwaPjPGtaHXmZsGPi/7VUyuFh53vMqwd9PS
         SkTlWLVz5JjntpkFbkBtjLnS4wB5vYrafSW9T5eK7VgB9SHwFe1McX64tsvQHYH+j4vv
         DqaA==
X-Forwarded-Encrypted: i=1; AHgh+Rqr9enX+yRbAuii0Qtf1qyrCFyWmj/u+nZmotz9vublvzwlwOOvX/g3ym7tQqB/59eyXl7CNPuDDaibXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxADB91QAcaf9Tve+ItedMbdAn72nKl82c1zcUjvonh5vi0dHnV
	pkytEdOg6vnmgP/z85MRj5IwJ5CyU2mxyKiS1RUMMasEFi+3LWj/vbvWDNTKh0/xrDM=
X-Gm-Gg: AfdE7cncvE0nYKwzc+oroZ7r47kRLG4IwrpegzdU+pkvz8l2/ftgt5PJW6XwoHiyknj
	OpaZozOD2PS2XdkXQHal9R8hK5oEfJ8MXeJyo2ATSVblBJ5gpOJn/qWeoeur6s+uF9Jziu1uVuD
	E8nZ5MGeV7vJuS6VmEWLSbZt6ROcL5aVda8+RRimbOzSz0AnFEW9OtgRK52yod6ZWg/B17ij0sx
	WZ87/Q95aONn9dHl52Ryqd0DnMrHe66oyxInODWq0FN2GFkfcDLkujEPC0hfUQog/n7Iql3U+60
	MueSrg+jwLcCvr6K9RFrI5oH+laodqgVDCiH2paWwjZbAKq5jfUGUE9Gnu6rcCAb8ioEwoGxAR7
	esvNHc3UQVP1L89xUF8S32GPXbjRHz4PkXqf0T1JhRSwQox/XJG+uOEIjGhtUhTbCSPmo/1yhiM
	b2pID6WGouZty3p2lsDw==
X-Received: by 2002:a05:622a:349:b0:51c:7b12:5fdd with SMTP id d75a77b69052e-51e42496c44mr71813071cf.73.1784143669422;
        Wed, 15 Jul 2026 12:27:49 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caace31a4sm145497671cf.12.2026.07.15.12.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 12:27:48 -0700 (PDT)
Message-ID: <8061fd3d27432ba0b42fb398d70f56fabc2ee586.camel@ndufresne.ca>
Subject: Re: Linking Patchwork with Sashiko?
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>, Linus Torvalds	
 <torvalds@linuxfoundation.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Derek Barbosa
 <debarbos@redhat.com>, Matthieu Baerts <matttbe@kernel.org>,  Konstantin
 Ryabitsev <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Steven Rostedt <rostedt@goodmis.org>, 	users@kernel.org, Linux Media
 Mailing List <linux-media@vger.kernel.org>,  Stephen Finucane
 <stephenfin@redhat.com>
Date: Wed, 15 Jul 2026 15:27:46 -0400
In-Reply-To: <20260715191216.GM1778116@killaraus.ideasonboard.com>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
	 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
	 <CAHk-=wi4zC+Ze8e+p3tMv8TtG_80KzsZ1syL9anBtmEh5Z40vg@mail.gmail.com>
	 <aldx9KiAHM4CRI0m@lt-jori.localdomain>
	 <e536800d8a84b99f34a79c590f57cd68cdb50e57.camel@ndufresne.ca>
	 <20260715191216.GM1778116@killaraus.ideasonboard.com>
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
	protocol="application/pgp-signature"; boundary="=-ST9VeWw9FlW5JJ0Aj5re"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-ST9VeWw9FlW5JJ0Aj5re
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey,

Le mercredi 15 juillet 2026 =C3=A0 22:12 +0300, Laurent Pinchart a =C3=A9cr=
it=C2=A0:
> On Wed, Jul 15, 2026 at 02:13:12PM -0400, Nicolas Dufresne wrote:
> > Le mercredi 15 juillet 2026 =C3=A0 14:21 +0200, Jori Koolstra a =C3=A9c=
rit=C2=A0:
> > > While there is some truly ridiculous anti-LLM brigading in some open
> > > source projects, I feel like saying it is just another tool does not =
do
> > > justice to some of the harm that is done by that industry. Also,
> > > precisely because of the usefulness of LLMs, I worry about creating a=
n
> > > uneven playing field, where new contributors can't keep up if they ca=
n't
> > > afford the needed tools (something that is not as much the case with
> > > compilers.)
> >=20
> > So "fairness" is likely one of the numerous ethical concerns that can d=
rive
> > activist against LLM (in the sense of people actively avoiding it, boyc=
otting
> > for the real extreme one, but I want to include mild cases too) in cont=
rast to
> > luddite, that just don't accept the technology to provide any meaningfu=
l result.
> > I'm personally interested in learning more about each and every ethical
> > concerns, as this is needed to either fixi or mitigate the social issue=
s this
> > technology is creating.
> >=20
> > On this aspect specifically, Sashiko is provided equally to the Linux c=
ommunity.
> > This is very unlike coding agent, which capabilities and performance ar=
e highly
> > tailored to your capability to pay. In that sense, fairness is minimall=
y
> > mitigated. I say mitigated considering someone have to pay for the comp=
ute and
> > because its currently running off proprietary owned models, also requir=
e paying
> > for extra royalties (which is an interesting ethical discussion in itse=
lf I
> > suppose). Smaller projects may not have that level of donation or budge=
t.
>=20
> Or will to pay money to companies with dubious ethics (a strong
> understatement).

Though, let's accept to cut this sub-thread here, since we got off the
"technical merit", meaning we are off-topic now.

cheers,
Nicolas

--=-ST9VeWw9FlW5JJ0Aj5re
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalffMgAKCRDZQZRRKWBy
9L5tAQDS7acGOFpBvvMWlBfbHUpPnYRghrUQAKSDe8ngAN05dwD/RiWCcffALA7W
vl5YTHdAoPxBi9hSmF2gmOj65+TFqwo=
=qdIt
-----END PGP SIGNATURE-----

--=-ST9VeWw9FlW5JJ0Aj5re--
