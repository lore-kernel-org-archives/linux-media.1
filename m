Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F60B3F12EF
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 15:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784301742; cv=none; b=ZxW6nhE+lYY6hqs80RUXiqilITJ8ngl7A86/6miEICosIoeoWaFugulzi5KPzDNvtAiZK9v2JVLZoyxH7Yt1Db2aqKFqGXVrCQvwkPWVaGZVaIF7EIutdow+92wR7a9uKc40uPyPwuPAkBZMGs5+EN6DddxYi73Ujqd/l/tc8LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784301742; c=relaxed/simple;
	bh=QLenMYzqyS+pvan/4Tt9ovwN4wPW5xY1sI56EmZm4i4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DDxM2lNHJ+6P5VPqeAiIx6N6+KfeEb7t9CwiGXNKQcT6PJq0e+9WbMtkIzy+KeLt8Zg9ZXWddpE5lvQBThk0T5x0cZZicoTXVGyBeLKEdFRM7Hbm/R++yY4PUyzrHDY5dMy1kpFJ4P6zvQwfuX9En0GrRenB8AsKWBat8d3jJ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=e9aHps8o; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="e9aHps8o"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bbc717c52aso2447795e0c.0
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784301740; x=1784906540; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QLenMYzqyS+pvan/4Tt9ovwN4wPW5xY1sI56EmZm4i4=;
        b=e9aHps8opiqzEYxzJwO7tniHeXxiZfeTHFw8j5SU2DvwolYoCdbYxKfApOE9V/YbS7
         KcvVWSvFgveKY0vM+YulV11hpk2eSulGrjyUJ31S0I8zW5Eqr5rgoKzujyCwz56wVhp/
         nz5BU3hrtuqQFSyFUg4nSRUVVSv1lxzkieUuCgN5xPg7WD+ccFiq19gy/JjZ7gezuGDX
         MjFcuNNk8LcIRodEiUDLnivCOlZ6nZPo2dPlqg5QA+yfxAy5OyL5KTIACxN6jq+fJtXm
         yJ6+nHa8hHms5MuU4SX7DegNuYff9G4u6Djyebt+5HYYnLTVKd5qF9KT0xz9kjFemtEH
         GmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301740; x=1784906540;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QLenMYzqyS+pvan/4Tt9ovwN4wPW5xY1sI56EmZm4i4=;
        b=amwGWjziylPwTEi6+NJmqWdalKpn8h79JLTf3wzkHmpHJjHC7Gnav6/H6RbPhVGBEf
         8ouV9aZ9nADKzrXQXFl8Dh5Jl0LlZxK8S3lQY1Gko/ImkDG/yuWjIEaUihdwezDrS/0m
         3wD8GUWLjUpPi5u9mdLR8rP5wSzcPunoatYCe8rMVHolzgeu5O2mP35jFFbxnF94rKvG
         ZCSNwPuj/eBibMT8cvyKfeE6lJE2+keVL9FD30xE2P3nE2A98Nw5T+jUw1SIiPQe/1VE
         3HdxkvTT9e2mNqb5bSBvN39Vs1OQNJXETnmiqRwcVVoLGFlg+0FYSiTTn2KBFuBpYaAe
         /1/w==
X-Forwarded-Encrypted: i=1; AHgh+Rpf6f4oFkal2sMD1h8/BEvl40UXH9/HvrBjy46L+ON3tVTNADnicD656G6OkKcA9YMsDI01CJuYSTQLVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtTQ9id7XHqKI0IabSz5GPW0V4KRnF7o1T3Cksdq8q/ZuTucF5
	vXvTbDDw0HjbI/84uJsX70W+kqHGePt/5wskCcTfmzSaNmxTpKMuM43wRyNZCVvADsjSJo4b9aa
	t9Vg6VxhNhQ==
X-Gm-Gg: AfdE7clsT6wCr9QAOkFaMsnwyifXKw8NI7dDnBha2PaxhCsja1GZjOA5yyZ3aRyjqGj
	MsnleBseHhYPaF0klsyaPIhPbFc8sMc0pX+evC16gK+A5R8wXFayhYsmNyrVeGveQDS9RbgFbrd
	Dyzo9bTkmTUiggmxg6bKdTXA1aX4AV4Yre9NYAC5YCxUYd1xjNnPG4rhfAFh31Re7/cjAYxeAXz
	gx9Hk7ov9ejwl4Ao+RHnAnIopLCXolhh5wal74KduvwAjFrsfUdAMW5URDPjP+o7yPZptTWJgT6
	SgXbk7Ss08pCshFxMwGQq8dneehr4HXKlolH4FtQbxjVHO++52tlycYIu9D2bqqZ3BiC9OGbPEA
	Ucd89jLkQ9b1CoAJ0GP5/s2Cw9qwfZhv/Wc93k5sR6DGlx6GfOfddrg7jO2K3ZuLHwQi5y9Idbu
	wviAwYT90=
X-Received: by 2002:a05:6122:4f82:b0:5bd:81fc:ebe9 with SMTP id 71dfb90a1353d-5c1afc43ed9mr465376e0c.0.1784301740116;
        Fri, 17 Jul 2026 08:22:20 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c1eee43c99sm827298e0c.7.2026.07.17.08.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:22:19 -0700 (PDT)
Message-ID: <2c31712c1062798d76a9e4272f7f49e007f53cd7.camel@ndufresne.ca>
Subject: Re: Linking Patchwork with Sashiko?
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Theodore Tso <tytso@mit.edu>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab	
 <mchehab+huawei@kernel.org>, Derek Barbosa <debarbos@redhat.com>, Matthieu
 Baerts <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Date: Fri, 17 Jul 2026 11:22:17 -0400
In-Reply-To: <aloZ9hqSgzN3beqH@mit.edu>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
	 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev> <alc3gAJfAkG5DULJ@zed>
	 <alfBvhZkAelq5RVf@mit.edu> <aliMsSH373RJ31Mq@zed>
	 <aloZ9hqSgzN3beqH@mit.edu>
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
	protocol="application/pgp-signature"; boundary="=-r6FzNc9WqG2tyvIGa18/"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-r6FzNc9WqG2tyvIGa18/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ted,

Le vendredi 17 juillet 2026 =C3=A0 08:20 -0400, Theodore Tso a =C3=A9crit=
=C2=A0:
> I think the other difference is that in the media subsystem, you can
> rely on the userspace code being "nice"

just wanted to clarify, said this way, it sounds terribly bad and quite off=
 to
me. Relying on userspace being nice is not what we want to do, or aim to do=
.
Linux Media is framework based, meaning there is framework sitting in front=
 of
drivers that filters bad ioctl calls. This is where Sashiko analyses isn't
always profond enough, or where Sashiko will propose driver changes rather =
then
framework changes. I'm quite convince this has a lot to do in the model cho=
ice,
and some compromise between precision / speed (or cost).

Nicolas

--=-r6FzNc9WqG2tyvIGa18/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalpIqQAKCRDZQZRRKWBy
9O/tAP9aRcv0Xsj+aGdBKuSZj08JT5mopp5ec50+UL6ujiid+AD+MUP9Q7Pgvek1
yn5xb7sDpYuXQAbmzuC/yR4XbQTc3Q4=
=UVr2
-----END PGP SIGNATURE-----

--=-r6FzNc9WqG2tyvIGa18/--
