Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EFC39F177;
	Fri,  6 Mar 2026 13:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805020; cv=none; b=Xex61pYEdTVFHMpsMG+O9gabJ+AEcyZ55rdYmIPDqHduW4hCQXDtMW5IW86onRZHdWwOKmbX8vMcry+hyknz4bEu+6vRU6SkG2OMwalWMJN2yNy8R/UMxVuIyGEffDv7Lw2DbGC5q4mdorTlBwpKyOYyMIiyHDtJZGhCC3GeaJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805020; c=relaxed/simple;
	bh=rbO72K/wvGQHgrCMMVFfXolPEW73jGi7kR3/wLPdg8g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qiib2eigBc+v1nQ0TYLtTLg6RgO8DkakWt0mZuAoc7oKv/W90rO3mvCCOKE+34DihZuA3ljB+xt9XA8ZZc4bMkJhpfBrmUOMwT2JjOy4XFY5f9VhE5omOzMreUrjTlT83guD3CU962O751dtOaSbfbCN1Ije/yANchC9QodGPMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iqiwHEfw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iqiwHEfw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772805012;
	bh=rbO72K/wvGQHgrCMMVFfXolPEW73jGi7kR3/wLPdg8g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=iqiwHEfw4e+qFjwFKYjcTYxO2JS2Hbxq+sR/PtSp9VHicceXzNbjHfe+cJy5Nfna1
	 HGJ7BSIxSCOKEFO2ioLOpWPBVnZlMnXSj8CTONxMgNTlzXeidyRce74JcSW6FbP0L5
	 Eg5EJlSriXjPwz11pTZtU794lf6sgLW0XabqTiLx5gdEiTvBkVrNhoptwk8KkU+glY
	 d9GmIZ3iN9VrRElyK9osCIBMn5cwSfQ/98zlgWxS4ikL2gSkKX6b17cpNUy63+oaZU
	 eroqgfHJOrUJm1nwPr4QT2oL+/8+3yFCkXiNM0kYS6b7kL35575RINfCxn2/s4P04T
	 LCQHb1PEIs69A==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5314C17E0EB0;
	Fri,  6 Mar 2026 14:50:11 +0100 (CET)
Message-ID: <92af2072500ec68990cc643256929044bc54e184.camel@collabora.com>
Subject: Re: [PATCH] media: chips-media: wave5: Fix possible ERR_PTR
 deference
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Alper Ak <alperyasinak1@gmail.com>, Markus Elfring
 <Markus.Elfring@web.de>
Cc: linux-media@vger.kernel.org, Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Nas Chung <nas.chung@chipsnmedia.com>, LKML <linux-kernel@vger.kernel.org>,
 Hans Verkuil	 <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Date: Fri, 06 Mar 2026 08:50:08 -0500
In-Reply-To: <CAGpma=4=J2-fmekpANH0EHNCs_TwPKp-t3Hd5h9S2BBDjF_r_w@mail.gmail.com>
References: <20260207103224.609938-1-alperyasinak1@gmail.com>
	 <c4938298-41b9-43c5-bdd5-96f37536ffa6@web.de>
	 <CAGpma=4=J2-fmekpANH0EHNCs_TwPKp-t3Hd5h9S2BBDjF_r_w@mail.gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-uEfk4QuCfQ5cDWYE1P9r"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-uEfk4QuCfQ5cDWYE1P9r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 06 mars 2026 =C3=A0 09:32 +0300, Alper Ak a =C3=A9crit=C2=A0:
> Hello everyone, look like this patch hasn't been applied. Did I miss
> something I needed to do to get it applied? If there is anything I
> need to do, please let me know.

You received an Ack from the maintainer, and got a tested buy. But the patc=
h has
been submitted while the merge window was closed, which is fine, but means =
there
is a small delay. It should be processed within the next two weeks. Your su=
bject
suggest a theoretical bug, so it has not be been prioritized over other pat=
ches
in the queue.

regards,
Nicolas

>=20
> Markus Elfring <Markus.Elfring@web.de>, 13 =C5=9Eub 2026 Cum, 14:38
> tarihinde =C5=9Funu yazd=C4=B1:
> >=20
> > =E2=80=A6
> > > or ERR_PTR() on failure. The return value was not checked and in the
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 error pointer
> >=20
> > =E2=80=A6
> > > Add proper IS_ERR() check after kthread_run(), log the error, set
> > > dev->irq_thread to NULL and fail the probe to prevent the driver
> > > from operating in a broken state.
> > =E2=80=A6
> >=20
> > See also once more:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/stable-kernel-rules.rst?h=3Dv6.19#n34
> >=20
> >=20
> > Would a summary phrase like =E2=80=9CPrevent error pointer dereference =
in
> > wave5_vpu_probe()=E2=80=9D
> > be more appropriate?
> >=20
> > Regards,
> > Markus

--=-uEfk4QuCfQ5cDWYE1P9r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaarbkQAKCRDZQZRRKWBy
9CAHAQCT+p+53Z5aDmjEmG+U1LUsaX1Y5Czf648RvqBspVwQagEAuqwdULfyhEHz
NJ6SQc1RhYG7bpzD3uQUho4fVM7RCQk=
=s/pV
-----END PGP SIGNATURE-----

--=-uEfk4QuCfQ5cDWYE1P9r--
