Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793673626;
	b=h751HJFZkrpmfuK02fyXBcREqSiCo8jmuqQEmyGMm6HmBeQsWLJwsRiZ+41GIvKvnAsw
	 ynl0Rmd3sCFZUVUkD3E3NJb5uykoDTjcKuhHFeYNxDM+Keg/vBgvmQfJg6+sa4t3J8eiv
	 1tBuXCZWgOpwxEDAALdVkd1gp7WQj6nCJsBHb5dVJPQPg4K0QBDgK7qM2p3GC+vdURNyP
	 NtfpuQj+4qqStaNR9ouzuqfcFUz0vH+fJXNVaDDh8iD1WqMrC3ysziDypcgV51OgyXT/R
	 tqR+MYC4AFRd+jhxNcM4gey9L+SN8v0yNkp2CpfZs6sCxv4jl35jIRTpbOVi5gtofkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=CTXFRAlDdP0mqd78M1HJAOng8psZxu116N3LePnYueQ=;
	b=JEK4Rsgc9ZuaG1PW9o6SwQ7rEhtik9QQiMe2u65iWwIrM57fgmvny8sNCDqbnci5QTDc
	 t5HRqosVTy8JOaACzj/n0ewVnWeapnH+D8KjRARLzhuPlShFZIm740kQiZ81T8TUc6KJY
	 f1EuWbO20xx77IcjkaKlUeD+YXY32GAYo7czLWKoQAl9baGMgEeRxa0KW879BWPlBEbbQ
	 VwOdb9Wi99Oeedf2tZ8gwzfp+mgzizr/e1V6BreKTXtC5rZg6VHgq+uLCYZVriGuT5Oam
	 4IDYi5SxwySSfKU8nRPKisNxaRF1ajz06fFysNR29Jxx2sdXuMuMFwxL0GvLolU7Ehw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hfVeo0UG;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B3F606A324
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 02:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27B3F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hfVeo0UG
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-930c0f9c1b1so380498385a.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 18:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793673625; x=1794278425; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CTXFRAlDdP0mqd78M1HJAOng8psZxu116N3LePnYueQ=;
        b=hfVeo0UGQ4On6bcCdQge5BLOJPHiTVzsJsVBBwHHld8ZBSwcx0IxHhPCfl6U+kdGQ/
         c64jDb+xQvD834Kpjw/wpSIPnPWAd1T9iaP/U0eShhcLHAt9D+3np6BLvhk99m1H/Op8
         EjAjdl9n8oNIWYmI7ify7GPi2/Gd21/kxZA4adkBBPUUe0xBkAS4Te8Z9ob1VIlNudPA
         SopWN0sKZm8oDUArunJcBONRSwg/xShumldK34p6V49ZfVqxKWvRJmsfwDUzBqsebBhO
         f/J5nZ1ZSxczOzCdnM3ToyPJBYg49cKXNqzFffQXR2kGS6meYWJKhF/ZaZI9wfiqoAVE
         qG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673625; x=1794278425;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CTXFRAlDdP0mqd78M1HJAOng8psZxu116N3LePnYueQ=;
        b=OyXm3Z7iXmy+O3fAhxvz37/RyrAjXp1BZHEjRTd7qC8+xCXSWw4WKr0sS1S7NeY3IR
         9ZtURju0xqbELFGjAFhg3DNV+oX7KN/dcQHmnejd1SNAMfV3xvdg+nVZrwi6fmVpkZQZ
         oylA6bQdjU2Ucmx0UTGlYHs5YBzh1hpzLZ3i68IH/YO1j3jfEA9AztWZCbE1k1JdDvqE
         ncUxwKlMO/AIvLi6P/bWbj0yczrrqltyFmhesbIqpLlEZqIDPXtbnTu1RmxwULbubTlJ
         DX9iWR7MTR3cFsobvFGckNQ+pqV2aPvurdCLHgcNoVZ2IZfTKrZDTRh1SvFsbT4c9gTv
         Q1JQ==
X-Gm-Message-State: AFq9FYJ/MrkglTbfvkXpweWedr0IyqxRl6FyWEYObs3QoODjjA1dbmLh
	jbX3Dvvv4+lPXDRMQ+oe+tlXhktjDbXu/EnktZ2ETl7RGAcAzwZyG9QiwnTZwK7QsJg=
X-Gm-Gg: AYBFou0xqgXg+n3rMgVGXHeiM0H0wBTRcWRzmiKghBwoKAFJEjTjNyPFreiSWRLYBQn
	Zfzy7GKVd2ZLvzdRBI6FlTwRoGsyP7rUayr2FIhQevpRca2GmjSZYnZePJUlPnj8A2Rjn9R/803
	1eNYdQ2KRlgkJdrdS26tVHgBeEii74Tl4j7crgO1rVjP0w1Hgi0jWuJghubho8l3URbpFZE0/8E
	UmDIdC8z96EQkmQi0me9TsO/IyAOqqdje/vxCCnjcWxbCHNaQXq4sollo6zce9ftD3MA59YjpqE
	wbWMmhO6FvVx9kcvYKb4zlrKZRzK2Qr5LjH81fufsLM6R8OifASXjlZoc3U4mibGrKIieVaYz/a
	9L+8vG9sDD0ll26WC+XkvJDHgI87qOLupBDUV8iTQ4hbdLbGkYIFPHvAiTPB0i9xIX9lvFo8Ylw
	V8WElySogWqYAFbVc7LMQaUzziqCpV+xo5UZ2m+Vv2BQWrD0ss5H/7Wtai58ujybyUnAcs0lfih
	QCNcY90TUnhLPFWx6lfia3DGu3DwqlMEzMePFTUsIDmNlM879eR130Olfh1N5MlzHtCdQaF1KZV
	5+3A0BhkDyqSPPuAGCWHpkvz+M4qw7ncRww1B77K04vNBIUr7fUof1A=
X-Received: by 2002:a05:620a:1d01:b0:943:e9a0:e1b1 with SMTP id af79cd13be357-944214cb815mr1872793285a.3.1793673625030;
        Mon, 02 Nov 2026 18:40:25 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:bf53::5ac? ([2606:6d00:11:bf53::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94424e79d0bsm970668385a.0.2026.11.02.18.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:40:23 -0800 (PST)
Message-ID: <9fe913fc3f750462a4655d51fa1a2f110a02ea18.camel@ndufresne.ca>
Subject: Re: [PATCH] Documentation: media: Document impact of errors on
 buffer fields
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sakari Ailus <sakari.ailus@iki.fi>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
  Hans Verkuil <hans@jjverkuil.nl>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>
Date: Mon, 02 Nov 2026 21:40:22 -0500
In-Reply-To: <auUepevHsfBZB2nV@valkosipuli.retiisi.eu>
References: <20261030103815.3098340-1-laurent.pinchart@ideasonboard.com>
	 <auR63iwOm_mih97K@valkosipuli.retiisi.eu>
	 <20261030140958.GB3109745@killaraus.ideasonboard.com>
	 <auUepevHsfBZB2nV@valkosipuli.retiisi.eu>
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
	protocol="application/pgp-signature"; boundary="=-EXrAhi3yIS3d2L8gm34d"
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


--=-EXrAhi3yIS3d2L8gm34d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 31 octobre 2026 =C3=A0 00:48 +0200, Sakari Ailus a =C3=A9crit=C2=
=A0:
> Hi Laurent,
>=20
> On Fri, Oct 30, 2026 at 04:09:58PM +0200, Laurent Pinchart wrote:
> > Hi Sakari,
> >=20
> > On Fri, Oct 30, 2026 at 01:09:18PM +0200, Sakari Ailus wrote:
> > > On Fri, Oct 30, 2026 at 12:38:15PM +0200, Laurent Pinchart wrote:
> > > > When an error occurs related to a captured buffer, hardware can pro=
duce
> > > > less data than expected (or no data at all), and timestamps may be
> > > > unreliable or unavailable if the device uses hardware timestamping.
> > > > Document this in the description of the V4L2_BUF_FLAG_ERROR flag.
> > > >=20
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > > I've posted a corresponding fix to v4l2-compliance in [1] to relax =
the
> > > > bytesused and timestamp checks.
> > > >=20
> > > > [1] https://lore.kernel.org/linux-media/20261030103717.3098080-1-la=
urent.pinchart@ideasonboard.com
> > > > ---
> > > >  Documentation/userspace-api/media/v4l/buffer.rst | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Doc=
umentation/userspace-api/media/v4l/buffer.rst
> > > > index 94dc2719e907..5a7a1511cee7 100644
> > > > --- a/Documentation/userspace-api/media/v4l/buffer.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> > > > @@ -503,6 +503,11 @@ Buffer Flags
> > > >  	streaming may continue as normal and the buffer may be reused
> > > >  	normally. Drivers set this flag when the ``VIDIOC_DQBUF`` ioctl i=
s
> > > >  	called.
> > > > +
> > > > +	Depending on the type of error, the buffer may contain less or no
> > > > +	data. In such cases the ``bytesused`` field can be lower than exp=
ected,
> > > > +	including being zero. The ``timestamp`` field may also be zero or=
 be
> > > > +	otherwise unreliable.
> > >=20
> > > Could we say that if bytesused field is non-zero, then there is a
> > > timestamp, but when bytesused is zero, there's no data and probably n=
o
> > > expectation of a valid timestamp either?
> >=20
> > How about this?
> >=20
> > 	Depending on the type of error, the buffer may contain less data than
> > 	expected, or no data at all. The ``bytesused`` field reflects that
> > 	situation. When ``bytesused`` is zero, the ``timestamp`` field may be
> > 	unreliable and may be zero.
>=20
> Looks good to me.

Since its not specified, have you asked yourself if this is CAPTURE device
behaviour, or if you do believe this should be true for all type of devices=
 ?

I've had recent discussion for M2M in regard to CAPTURE buffer ERROR. The A=
PI
has a gap and we don't know if we should complete a capture buffer when an
OUTPUT buffer triggered an error. If the timestamp copy should be honoured =
and
what the byeused size should be and mean.

Nicolas

--=-EXrAhi3yIS3d2L8gm34d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaulJlgAKCRDZQZRRKWBy
9GCMAQC+8P5jC6mwEzwN8iv842be5roGrs60jeQSGKZgLZFJIAEA0NChh3PuwcC9
7Nhn83XNtgIH9Qv0h9FAEgIQ6DpsyQU=
=qxL/
-----END PGP SIGNATURE-----

--=-EXrAhi3yIS3d2L8gm34d--
