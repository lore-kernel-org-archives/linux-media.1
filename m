Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D4A443E35
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 18:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784139200; cv=none; b=oZbcbCjhwp/tiaWUqnZ7/HuT7+JR84+1kt64oi8tKbcMx11IKK4KxgfP3xWPQyi+1WVmhT1W7zm69SEFPy+pe5dofxeO8wlad0nQBy1xzsJqk23PzGMW0jJxCyMdsjoHOfWY/17X4ZPNdnD9uK5EjN7STD/fPfP6lsxSPPLAAJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784139200; c=relaxed/simple;
	bh=sMptcD2dzVv/VOr4obYERaWss6IbfWIvXl0cLMFFIFo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pPu5uCup3FEWoAeqH05i6E/ylYhmjJAc5R6q3DMj1ZK8doDS81ssDDTryt6WR9S9oeQ9XwBd1it0P6fHUSMsAunEQoxkliUgAyGXnHNTfR6MaI77A7a/Rb//WVbsZ95EoGpnf6BtTZfvkWMOKBrAnQ0On45lpdUsD7l4oeFjRb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=rVfwzZfW; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="rVfwzZfW"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e5b048375so385584685a.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784139195; x=1784743995; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sMptcD2dzVv/VOr4obYERaWss6IbfWIvXl0cLMFFIFo=;
        b=rVfwzZfWNwXgA/IoAstrmG57tOHhpwP4S8971zk2C8rLPjf744MluTTdoy+YYNCj70
         NKAvHZIknegQCPRCk5YDMZf/l2lxpOC7M7ruJ1BW4mKYVjd1OKxeIMcAzPRijdGN6Krk
         5JZXL+KBkbhkQEmgjSKbMf4RMS1ceRfbXOjXGsGgJNnlhAmS1cqNopgxDExIMzQVdqnC
         2IT2/7iUxEy5ooeCTNH6Pv6MMwGALCiY9sgM4lHsdJkKMbC2iw8n54JOx2zHJFz4vfK9
         Uw/3dhIpzSWUe+TxEowG7TxeEqVEE+jLuIl1Zq37Mtwndfywc/74F6VuYhq/zOLWhVDA
         5T7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784139195; x=1784743995;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sMptcD2dzVv/VOr4obYERaWss6IbfWIvXl0cLMFFIFo=;
        b=MZ/yc3dC5iFZvNlBZZHWKJpUT/6T3J8ed5/3XqMeMinYUqKchCXIzKcwVTNoidkb10
         ZeTuRS60qqHGnDUdY1EtNbm9tvhvhRZzKnCQ+/+fPr+NPR6jD7E/a9FdysYVQqIsURsy
         scgyoT1/lzUjCcP4p0rXheGEab50373lROMtf+NENMt5vVMLaxVqv1eKnGehahPOeMl0
         i1/UNijSu4IXxiUgJsL7dvX4+3sAOibZCc30qKWWg41q/y+bjbJoYmB0yr9KuxFJ2z/T
         foCG1FqJJ6wwk43hVJOGzAT/2i9qF3XEbmrsyoC71c7E8d2Bnv0/TWaYv0sXo0CxISWA
         tZSw==
X-Forwarded-Encrypted: i=1; AHgh+RqcS2uDbVh0zOjoQG2/KnIRM5KPp+Ej7asnH/GHq/njABwCLNb1Er6kCnmi0x1fjQOqTzKYP6Iq77OtFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMqjL1+MsuOtkHf3ysTbvgBzBimxtAqRqIh2bqioerr+SgCfR1
	DUJqg7qArpxaWRH+5uYFCUZUrNLk8q6Ca6L/kd87f86CaNh0MWMX04dz+Sae6OHHsZU=
X-Gm-Gg: AfdE7clFtTZRVOjT2Sv8TnOOrcAswspJJx1dMlzGRXmjnc4YHXZy373UjsNdGv5RKZQ
	hZXyR2ybUEXYnlrmPR2ftleeHTCDrFaY9SC8/kzs293JGjOFKx2syctGmKyBWLXU9bpEV17A0XX
	xkC2VhC64cFOKeozw5a9UxpU2PVWLSE0tiiG/VrEZ/Mbwbi7NxklqN1COtEMH9Fn7ZdFhKwbzcD
	iXIG2UNJR7yykhjSK3+Ad6vh9jCMqpQktrBv11hgyk+9RIKUDJKhJ6bx/fSswcVGWESIgxUOx/l
	8bXQOpxWtEkyN24OTjVHVzqHzyVG5RgndSGj75LVvbSZzDYs5q36+Pv96Z73RXVN7evCN136Vdu
	8h3YaWnhMg3HbvciPFDTHzRw2xiL/goVzuEfEjLGRLfEqVrLom7rsDuF2PoPytRO92tGP1SDyxx
	HchpdPcV6FgVWD0vFXNoYnC+j98CCi
X-Received: by 2002:a05:620a:26a6:b0:92b:67e6:4b73 with SMTP id af79cd13be357-93086c25d38mr878327485a.74.1784139195222;
        Wed, 15 Jul 2026 11:13:15 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92f1023697fsm876428285a.43.2026.07.15.11.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 11:13:14 -0700 (PDT)
Message-ID: <e536800d8a84b99f34a79c590f57cd68cdb50e57.camel@ndufresne.ca>
Subject: Re: Linking Patchwork with Sashiko?
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jori Koolstra <jkoolstra@xs4all.nl>, Linus Torvalds
	 <torvalds@linuxfoundation.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab	
 <mchehab+huawei@kernel.org>, Derek Barbosa <debarbos@redhat.com>, Matthieu
 Baerts <matttbe@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>
Date: Wed, 15 Jul 2026 14:13:12 -0400
In-Reply-To: <aldx9KiAHM4CRI0m@lt-jori.localdomain>
References: <20260715005909.GF1656185@killaraus.ideasonboard.com>
	 <4928C919-7999-4E76-ADCB-F8643FED105B@linux.dev>
	 <CAHk-=wi4zC+Ze8e+p3tMv8TtG_80KzsZ1syL9anBtmEh5Z40vg@mail.gmail.com>
	 <aldx9KiAHM4CRI0m@lt-jori.localdomain>
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
	protocol="application/pgp-signature"; boundary="=-+WJAidlZQHdIyCoOndRg"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-+WJAidlZQHdIyCoOndRg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey,

Le mercredi 15 juillet 2026 =C3=A0 14:21 +0200, Jori Koolstra a =C3=A9crit=
=C2=A0:
> While there is some truly ridiculous anti-LLM brigading in some open
> source projects, I feel like saying it is just another tool does not do
> justice to some of the harm that is done by that industry. Also,
> precisely because of the usefulness of LLMs, I worry about creating an
> uneven playing field, where new contributors can't keep up if they can't
> afford the needed tools (something that is not as much the case with
> compilers.)

So "fairness" is likely one of the numerous ethical concerns that can drive
activist against LLM (in the sense of people actively avoiding it, boycotti=
ng
for the real extreme one, but I want to include mild cases too) in contrast=
 to
luddite, that just don't accept the technology to provide any meaningful re=
sult.
I'm personally interested in learning more about each and every ethical
concerns, as this is needed to either fixi or mitigate the social issues th=
is
technology is creating.

On this aspect specifically, Sashiko is provided equally to the Linux commu=
nity.
This is very unlike coding agent, which capabilities and performance are hi=
ghly
tailored to your capability to pay. In that sense, fairness is minimally
mitigated. I say mitigated considering someone have to pay for the compute =
and
because its currently running off proprietary owned models, also require pa=
ying
for extra royalties (which is an interesting ethical discussion in itself I
suppose). Smaller projects may not have that level of donation or budget.

Nicolas

--=-+WJAidlZQHdIyCoOndRg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalfNuAAKCRDZQZRRKWBy
9C8GAQD0kWyt26SenZUCKWtGboPkiaCecfH3wmNJe5An3Ca9pwEAy1xhjmKP5zyT
H4K3dktB9xCyEcNYr9A98R9RAdzjeQM=
=tVt6
-----END PGP SIGNATURE-----

--=-+WJAidlZQHdIyCoOndRg--
