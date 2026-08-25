Received: from mail-qv2-f2.google.com (mail-qv2-f2.google.com [74.125.230.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD629430CE2
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 12:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661047; cv=none; b=t9U0KjgVZf+DNa7FsyvG2MzpCQxM6v9AVqGb8KsSP7iaSJbObr6yO0o3IKUxaOR2Vqrv1VdnVGNkQGp7lSkxf8GScWZCVNsRlrFDBGQKMO9Ykla+LrbezZFfbCuzc84sxlOOeuSM6DInZh+XMhdcFguZftIbc+8FIqCnLYXMv2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661047; c=relaxed/simple;
	bh=1UaB/C71vBaf2CdWhu246BI1ms6R5l9BWXZ1AMi5kK8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UeUSdiiYsNzB7StL/dE1jiyrrV8zAjf/UwjNXe4kpZXDtbc6ykRCkeAkLOLqLjvGj4TOBPOAOAw/kmJnjfpXq4pxK2jRKHKdB1xsJImRJv45ADwC5/34Ki3MoJA+ZHEl/nFKtMLwZYjyukKXNF9ZYC2eWS3d47nsD6hTjJZDNwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=bBTAw1GI; arc=none smtp.client-ip=74.125.230.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="bBTAw1GI"
Received: by mail-qv2-f2.google.com with SMTP id 6a1803df08f44-90c8bdf100dso9127606d6.1
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 05:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1787661040; x=1788265840; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tePxgbUu8DYYRL1mHGa0nQWcmT0XGn3PbE8YrkUps7M=;
        b=bBTAw1GIpWIHCzNCp1rBLd/IslfiDuvOGOlQsqfXkNBomJ41lHPdl9qcbuHLk/QNCJ
         Zo4AZMjzwK7kEMNWZ4hQcm2iPYq78Mojqm8+MtN9XhlhAfGPfWr8ch3fN9ZL2AGNbjd3
         6spAcMSoxa8W4RxKrwBSktl0Zf/8+ITVpaW3wpsasbpil3iE7dFFxx1jYi4ootEQyr5N
         8Y+KPRrC66Sloa4u+t3uH5jyWPZOmjHXlXGXRWCprV6C0YR0WiUxGix7FWKgGfuU5tFH
         o/9KErfy2I3nY7oFjfVr7mEdjo8/PM20JE2D5RqRXJszwWAu099eEwsW6uCAgMDpiIfY
         T7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661040; x=1788265840;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tePxgbUu8DYYRL1mHGa0nQWcmT0XGn3PbE8YrkUps7M=;
        b=hIZGe+yjoIOESqv6kU6I+yx/7QQvAho2FXpT6IIBelHAHepoatDnpbA8QKOQLOA7lf
         ttqZkHxtTTFyGChUqzXxTU+aHIgyQxYLISMiieM7dzwtDiHG2Nvv5onGPsrpHqNj6dpU
         qqE3caVjOewK/jMISEjFv9hdmK8zP2svRvEbdbCMYQ5uukvpY8zpJ5j2pvPjzXRp2OKZ
         1L29d0Lj8Kf/VJuHJi0rod/S7QCrliSMi9/iNHKkhZOUeSjKuGLF85+mCVRoBLtKdSSJ
         MvHFh920ccrkc68pQr5g7orzaLdOAYm9So7+p0J40kMxKsZsftjjePbAhqsGrIZ1TOSi
         a3fQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpsj4YdotePBCQ6e40YO1yjiAdO3XVBf+8w9fbUMLRS84jj1cUQZ29+j03jiMFfBrmZGeJrJuU+zQoRBA==@vger.kernel.org
X-Gm-Message-State: AFuF++nWfJguIMaibzE02hbp/DAsXp2K0v8Lq+itQW+K3BSoBZDOJgWA
	bWZnaw7X6uVKzDoQrXVOSDM5ANH/UrpzCBGyDpL9V6k2fchLIlkez7M2RtLdgvocpbc=
X-Gm-Gg: AR+sD13XqQ+8CgHi1CIwzHjRCwNCdgl36fXNN5WfyrJfKj3maeGJzVAZbfxFA6EMgiu
	ZCOaCu0MeBQbGVmbk8xAnCRA3kS7wnDAdI/pMxBkrpFFSA4Mm/Ci/nLkPw2//lHOEZz8XW1xvXq
	xlGWvgFmyJeEu97EYQCHsOQL+Hdy76A/1LnH23Zmix7pkG3bzITf4k1jWCe+0H/caqilZM6fw4M
	JmOYlN61lu9LUTRIoaXMwxecyrD9khElBBlOdYSfvRXGxyPz225ao9Ne/YNlI2t/ltseDUkWom1
	KyiUpQqbjI81GwOmEr5c0K3T3HuJwjPY0rtM9bFCiUNyO1xCkxOczGuwkuDtHVPL7dD8yEjmL00
	DuLFJRpDMjuWWIW7vyhvzf01gDQqAraV4QG9Nteu8pgm07+qckWSkDYImyZBJusaG20BFxWlRAA
	INkLEv2SwX94dEPkrbvREwNkVfRM/KUnoFDpqxtBsh+KHWMA/C5tCvuDlZwDLrC9d/
X-Received: by 2002:a05:622a:5815:b0:51c:1bcd:5cc3 with SMTP id d75a77b69052e-52e2f1130f6mr73042651cf.25.1787661039558;
        Tue, 25 Aug 2026 05:30:39 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e221::5ac? ([2606:6d00:15:e221::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749abf1dfsm725543585a.5.2026.08.25.05.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:30:37 -0700 (PDT)
Message-ID: <2de2e03c7bed7e4ec292c2f83da5556c1b27b334.camel@ndufresne.ca>
Subject: Re: [PATCH 1/4] media: dt-bindings: Add Rockchip JPEG decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sascha Hauer <s.hauer@pengutronix.de>, Krzysztof Kozlowski
 <krzk@kernel.org>
Cc: Lucas Sinn <lucas.sinn@wolfvision.net>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
	 <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 25 Aug 2026 08:30:34 -0400
In-Reply-To: <1048ee70-54b2-4e42-ab67-22384961f094@pengutronix.de>
References: <20260824-rockchip-jpegdec-v1-0-8011822bf500@pengutronix.de>
	 <20260824-rockchip-jpegdec-v1-1-8011822bf500@pengutronix.de>
	 <d24d59bb-2330-41c9-a6cc-a4c7053f8526@kernel.org>
	 <1048ee70-54b2-4e42-ab67-22384961f094@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-pDFlBjF+U0XMJcHrbQOX"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-pDFlBjF+U0XMJcHrbQOX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 25 ao=C3=BBt 2026 =C3=A0 07:39 +0000, Sascha Hauer a =C3=A9crit=C2=
=A0:
> On 2026-08-25 09:21, Krzysztof Kozlowski wrote:
> > On 24/08/2026 09:01, Sascha Hauer wrote:
> > > Add a devicetree binding schema for the JPEG hardware decoder Rockchi=
p
> > > integrates into a number of its SoCs.  Documents the single register
> > > window (task registers plus the LLP link-table block at offset 0x300)=
,
> > > the decode interrupt, the aclk/hclk clocks, the AXI/AHB resets, the I=
OMMU
> > > and the power domain.
> > >=20
> > > The core is not tied to one SoC.  Downstream it is known as the VDPU7=
20
> > > and the same block sits on the RK3528, RK3562, RK356x, RK3576, RK3588=
 and
> > > RV1126B, with only the clocks, the resets and the power domain differ=
ing,
> > > none of which this schema constrains.  A compatible per SoC is all it
> > > takes to cover them; the RK3568 and the RK3588 are the two that have =
been
> > > tested and are enabled here.
> > >=20
> > > The resets and the power domain are required.  The block cannot be
> > > reached with its domain off, and the driver falls back to pulsing the
> > > reset lines when a frame times out and the in-block soft reset does n=
ot
> > > complete, which a node without them would leave with no way to recove=
r.
> > >=20
> > > The IOMMU stays optional.  The driver never refers to it, it is a pla=
tform
> > > integration detail, and rockchip-vpu.yaml does not require it for the
> > > other codec blocks on these SoCs either.
> > >=20
> > > Assisted-by: Claude:claude-opus-5
> > > ---
> > >  .../bindings/media/rockchip,jpeg-decoder.yaml      | 92 ++++++++++++=
++++++++++
> > >  MAINTAINERS                                        |  8 ++
> > >  2 files changed, 100 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/media/rockchip,jpeg-de=
coder.yaml b/Documentation/devicetree/bindings/media/rockchip,jpeg-decoder.=
yaml
> > > new file mode 100644
> > > index 0000000000000..e20c1bf43ef3e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/rockchip,jpeg-decoder.y=
aml
> > > @@ -0,0 +1,92 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/rockchip,jpeg-decoder.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Rockchip JPEG Decoder
> > > +
> > > +maintainers:
> > > +  - Lucas Sinn <lucas.sinn@wolfvision.net>
> > > +  - Sascha Hauer <s.hauer@pengutronix.de>
> > > +
> > > +description:
> > > +  Rockchip's in-house JPEG/MJPEG hardware decoder, known downstream =
as the
> > > +  VDPU720.  The same core is integrated into a number of Rockchip So=
Cs, which
> > > +  differ only in the clocks, resets and power domain they are wired =
to.  A
> > > +  dedicated Link List Processor (LLP) register block, located at off=
set 0x300
> > > +  within the same register window, allows the hardware to decode a c=
hain of
> > > +  frames autonomously ("link mode").
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - rockchip,rk3568-jpegd
> > > +      - rockchip,rk3588-jpegd
> >=20
> > How this can be v1 if you send VPU720 for rk3588 already?
> >=20
> > https://lore.kernel.org/all/20260819-rk3588-jpegdec-v1-4-33d74cdf369c@p=
engutronix.de/
>=20
> The above has the JPEG decoder driver integrated into the hantro driver
> which turned out to be the wrong abstraction, so I had to split this
> series up into two, one for the Hantro fixes and one for the now
> standalone JPEG decoder driver which is this series. I decided to start
> freshly for both series instead of treating one as continuation of the
> other.

I'd like to recommend doing the opposite next time. Create a separate serie=
s for
the fixes, and place your fresh bindings, driver and updated DTS in a v2.

The reason is that you are sending 1 series to 3 maintainers, and we all ha=
ve to
keep a different patchwork up-to-date, having v2 makes it clear as we can s=
ee
from the changelog what happened and why it got rewritten.

Nicolas

>=20
> >=20
> > Were there more versions?
>=20
> No.
>=20
> Sascha
>=20
> --
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
>=20
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

--=-pDFlBjF+U0XMJcHrbQOX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCao2K6gAKCRDZQZRRKWBy
9AepAP9LKy3L2SDezcHWRKeGBxhM7jMPnAdAPPhP2UALllz2iwD9H7t7vcPXscK+
c8c3Swnx7HKx4J+UNpsV0i3RGR3GZgw=
=pluw
-----END PGP SIGNATURE-----

--=-pDFlBjF+U0XMJcHrbQOX--
