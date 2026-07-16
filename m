Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960E815A85A
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 03:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784170861; cv=none; b=E1ZzI+dyMZKQnJywfb20qYdHJDre8mD4wZZ8NuKwIIc7nxtVWPgcD6bmhe/wZJzULdRxMj0rwEX8beyQKS36Hdv75qRTsXrBCirEIUSBYlMI5KDvDG7GxSuMGDMVunN2B4veBLjgFUl/BomyHv7DdP3mRIVFwSS1njHIcqOO2kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784170861; c=relaxed/simple;
	bh=6ZzcbyunNoLjx+sEr3I2YBB9X3uDQf/Bwm9jMOySDzo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eTTTU4FNhTO0czH3sO2WrLi1V2hO/oc/sl0UwAqojAhaRnH01p17owSJqBesahVpd7lAigR658XPPsCvWfe4whOtaxTogisiZAhtl0bWCM77zU0e5nRS749FahdSQ5Mil7hfheD4tH/RQq8pj4m/TD5Xwe9gmfBci6oDpf18Ltc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=ojmWbYvy; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="ojmWbYvy"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso2451126e0c.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 20:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784170858; x=1784775658; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6ZzcbyunNoLjx+sEr3I2YBB9X3uDQf/Bwm9jMOySDzo=;
        b=ojmWbYvyx+5KQdAyRJQ4hk0Ll/BojaQoFnfBkJAHHXHs1Umh6KdX5deHy8oU4NmJh7
         m947p6Hr90GMDCZ2U5MH9Otvs+duXjPN9XJJv5+17MCgRSAz6HzUBGPKbYnDGkF/tLLI
         gtzYBms1XecqmcJsOFG4Gw+MvOwFmDmHgyffK2ZiQl96L0doT36+x0Pkfp4RpPT0b+xq
         idA8fVXFmhcNuL4Mn9VdLGDO6NXCjdlDoQ6zqPxNuhluOwUCAwgZLS3qoy98VCqRKScQ
         prSp4cClzKY4XdYws8r2RJWknQ2LY+BxcRccLPuIdjAFai0q823Wq7M36F/NOLZgI7Ie
         JqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784170858; x=1784775658;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ZzcbyunNoLjx+sEr3I2YBB9X3uDQf/Bwm9jMOySDzo=;
        b=rlwEkBdlcXk0X0faJNfOSUHfrY0MT5+0rmFGm/hcAU0CMBwvcwCuWBTdpmuZBZjmvj
         DE9wPEwXYPLBbOnOEppiuJdv+gm4FrSBcs+HRpuctXyAZUMaths8lsSUnDHXas3kEpgd
         VBD3JqsD3aoxiov4av+wwA3qtrgRdLb0s9CXv5f2S/RLXwKQNt9qqJ1UhznX5+XBwSwY
         tqc8wgWwN7FwreMV5RyKPZ/FYJVRm4K4BrY6IQ0qU1ktGvO6zObMzOGeUn8NprIWZiSu
         gQcxJUqk9pJQ0/Lc7R6Mix9imFhp2ETchWRIBTjgvbQRZrYfppdD8DF3qHUM8+WydtJb
         VeaQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIcPdsqMr1iaNfHcmeoaGJuk/qPQH1odYl25rgiqIg3514WUbf58Cd7UDOUTErI6ThoFC3q4l9MC2KQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUgenrvG4CDaRKQUNZHnMAZibGOpVppXGPdaFf1Fcpk/H9Vvob
	UgUdIs8aIozR/c6oOxqCPB0deYSyrizKgaKbi9aawAvX53Ii1lBbxl9ODOrKI4yu9go=
X-Gm-Gg: AfdE7cksQlFqUWS70UwuAMdM2O2nGtrZZ2Eqb5eDBac+GFtvOT7kLbG0gJCcE9VDxRF
	FuD+6DCjCbdZhEISX1ty1kVdHzvMiMozJjzqpi7770hFazucRlJyuJ7OjAUOq6Wc7qniM9JuGyj
	gRu7/rT5ApAlERR/AJfVGxTRh+yeSesqs0IyVxRn788lXUFEokpZrkgQ37gDkOne8niIwI4LegR
	4ixQY4mu7qszkgri5WhbH/qS0boE0gnFbRIp/t1DR9af/kCb4YDIJTBrbg4sObYhwidSN0AVUmg
	vxpvaPaiibWA2W0qfFAEH1ZzYtGY64tXBjxyPv666dlCYhxCht4c82JHIOPTwgna0ttmJ5WeQzm
	Bcz9cGYAa5363zGF//zH2G9ZrTQWxd0aJX3toE5b2JUg+lGbiBv1mxDif7fAcgvho5HoOH1GcQR
	z4IOXhaig=
X-Received: by 2002:a05:6122:6d09:b0:5c1:2150:9de7 with SMTP id 71dfb90a1353d-5c121509e19mr3066034e0c.12.1784170858371;
        Wed, 15 Jul 2026 20:00:58 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed6545095sm12211859241.11.2026.07.15.20.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 20:00:56 -0700 (PDT)
Message-ID: <ef9f77c613a05c5745941587099eeb4f159d5e31.camel@ndufresne.ca>
Subject: Re: Linking Patchwork with Sashiko?
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Theodore Tso <tytso@mit.edu>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: Ihor Solodrai <ihor.solodrai@linux.dev>, Roman Gushchin	
 <roman.gushchin@linux.dev>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>,  Derek Barbosa <debarbos@redhat.com>, Matthieu
 Baerts <matttbe@kernel.org>, Konstantin Ryabitsev	
 <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Steven
 Rostedt <rostedt@goodmis.org>, users@kernel.org, Linux Media Mailing List	
 <linux-media@vger.kernel.org>, Stephen Finucane <stephenfin@redhat.com>,
 bpf	 <bpf@vger.kernel.org>, Chris Mason <clm@meta.com>, Christian Brauner	
 <brauner@kernel.org>, Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 15 Jul 2026 23:00:54 -0400
In-Reply-To: <alfwOgVRgUJYOGtU@mit.edu>
References: <87wlv2jq4t.fsf@linux.dev> <20260713095538.3d5e86f1@foz.lan>
	 <20260713094120.GD1127719@killaraus.ideasonboard.com>
	 <20260713220427.582b28bf@foz.lan> <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
	 <20260715005909.GF1656185@killaraus.ideasonboard.com>
	 <00a244f8-5be6-4ee7-b5b1-e4cbdcd4fc77@linux.dev>
	 <20260715163921.GH1778116@killaraus.ideasonboard.com>
	 <153db0fa-65ac-49de-9bf5-456c9639954c@linux.dev>
	 <20260715190654.GK1778116@killaraus.ideasonboard.com>
	 <alfwOgVRgUJYOGtU@mit.edu>
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
	protocol="application/pgp-signature"; boundary="=-vW5uevcZ8ifhFrfjuhNI"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-vW5uevcZ8ifhFrfjuhNI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 15 juillet 2026 =C3=A0 17:13 -0400, Theodore Tso a =C3=A9crit=
=C2=A0:
> On Wed, Jul 15, 2026 at 10:06:54PM -0500, Laurent Pinchart wrote:
> > This came from a consideration on the impact of false positives
> > and other hallucinations on junior developers.
>=20
> You keep claiming that there is an awful lot of false positives and
> other hallucinations.=C2=A0 That's an assertion that needs to be tested t=
o
> make sure that we're not relying on a few pieces of anecdata.=C2=A0 How
> does this compare with false positives and bogus recommendations from
> certain human reviewers?

The difference is that it comes with a highly credible explanation, which t=
akes
a lot more time to solve. On my end, having spent the evening through quite=
 an
unusual amount of build tested AI review fixes, I'm starting to learn the c=
ommon
broken pattern, so I guess I'll get better at filtering.

In V4L2 m2m notably, there is a "job" in the background, which allow to saf=
ely
(at least this is the theory) chain up work, and synchronize against pendin=
g
work. But Sashiko (and other AI) seems to not get it and state with confide=
nce
and long explanation that the drivers are racy and should do X/Y/Z more on =
top
(and never blames the framework).

This is why I recommended not forwarding the reviews to the linux media lis=
t
just yet during the summit. Now, the tricky part will be to find time to tr=
y and
help narrow this down, I never checked the implementation, but I suppose yo=
u can
add more layers of prompts to force into looking deeper ?

>=20
> After all, I can think of at *least* one human reviewer whose reviews
> are far worse than Sashiko's in false positives.=C2=A0 That might or migh=
t
> not be the same person as the one Mark has said that he has a stock
> e-mail reply telling a junior developer that they should be free to
> ignore reviews from that particular human being.=C2=A0 :-)

Hopefully I'm not in that list. We all make that mistake of being convincin=
g in
the wrong direction from time to time, with the difference that when we do,=
 we
usually offer some help, and try to be kind after that.

>=20
> Each maintainer can decide how much they trust Shashiko reviews.=C2=A0 At
> least for my subsystem, I haven't seen the hallucionations that you
> are continually citing, certainly not as a common case.=C2=A0 I will note
> that even experienced human reviewers have occasionally flagged an
> issue, only to say, "my bad, you're right, it's fine" after a
> discussion with the patch author.=C2=A0 And that's OK.=C2=A0 When a human=
 being
> makes a false positive criticism, no one responds with "I am feeling
> demeaned as a human being!"=C2=A0 Perhaps we should be giving
> tool-generated reviews (whether it is via checkpatch or Sashiko) with
> a similar level of grace?

I'm not sure I'd call it an hallucination, it does looks racy on the surfac=
e.
The tool simply lack bit of specialization. Its also something we observe w=
ith
reference passing in GStreamer project, where the AI does a perfect job in =
Rust,
where this is explicit in the language, and fail miserably in C where its a=
ll
about knowing the conventions (both when reviewing and coding).

>=20
> At least with tool-generated reviews, we can send bug reports asking
> that the tool can be improved.=C2=A0 At least with one particular human
> reviewer that I have in mind, no attempts asking that person to
> improve their reviews hasn't been helpful.

And yes, I'd rather improve the tool then kill it. For me, I seconded the
decision to not send emails to the linux media list, so we could gain some =
time.
As its obvious that once its more visible, we'll start getting more and mor=
e of
the build tested fix based on AI report made by people that don't even own =
the
hardware to test their changes and are likely just interested in adding the=
ir
name in the changelog.

>=20
> Bottom line --- if you are making the claim the Sashiko reviews are
> rife with false positives, all I can say is <<Citation Needed>>.

cheers,
Nicolas

--=-vW5uevcZ8ifhFrfjuhNI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalhJZgAKCRDZQZRRKWBy
9OA5AP9+K/I8EuTDafx3czij3RVCWph6PpQOWiXZvvDdg0lSCQEAi7A015EilauG
i6r0MNNl0ujaKGOKJ6KXZCiXb9d9HwM=
=1jhD
-----END PGP SIGNATURE-----

--=-vW5uevcZ8ifhFrfjuhNI--
